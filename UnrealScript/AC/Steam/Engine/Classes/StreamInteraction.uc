/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\StreamInteraction.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:18
 *	Functions:32
 *
 *******************************************************************************/
class StreamInteraction extends Interaction
    native
    config(User);

const INVALIDSONGHANDLE = 0;

var() config float FadeInSeconds;
var() config float FadeOutSeconds;
var() config string PlaylistManagerType;
var() editconst noexport editinline StreamPlaylistManager PlaylistManager;
var() editconst noexport editinline StreamInterface FileManager;
var() editconst noexport int CurrentSongHandle;
var() editconst noexport float CurrentSongPosition;
var() editconst noexport float LastPlayTime;
var() editconst noexport float CurrentSongDuration;
var() editconst noexport string CurrentSong;
var() editconst noexport Stream CurrentStreamAttachment;
var() config bool bAutoStart;
var() config bool bDisplayTrackChanges;
var() editconst noexport transient bool bRestartTrack;
var() editconst noexport transient bool bTrackWaiting;
var delegate<OnStreamChanged> __OnStreamChanged__Delegate;
var delegate<OnStreamingStopped> __OnStreamingStopped__Delegate;
var delegate<OnAdjustVolume> __OnAdjustVolume__Delegate;

delegate OnStreamChanged(string NewStreamFileName);
delegate OnStreamingStopped();
delegate OnAdjustVolume(float NewVolume);
event Initialized()
{
    super.Initialized();
    ClearSongInfo();
    FileManager = CreateFileManager();
    PlaylistManager = CreatePlaylistManager();
    // End:0x43
    if(PlaylistManager != none)
    {
        PlaylistManager.Initialize(FileManager);
    }
    // End:0x52
    if(bAutoStart)
    {
        QueueNextSong();
    }
}

function StreamInterface CreateFileManager()
{
    return new class'StreamInterface';
}

function StreamPlaylistManager CreatePlaylistManager()
{
    local class<StreamPlaylistManager> PlaylistManagerClass;

    // End:0x27
    if(PlaylistManagerType != "")
    {
        PlaylistManagerClass = class<StreamPlaylistManager>(DynamicLoadObject(PlaylistManagerType, class'Class'));
    }
    // End:0x3d
    if(PlaylistManagerClass == none)
    {
        PlaylistManagerClass = class'StreamPlaylistManager';
    }
    return new PlaylistManagerClass;
}

function QueueNextSong()
{
    bTrackWaiting = true;
}

event Tick(float DeltaTime)
{
    // End:0x12
    if(bTrackWaiting)
    {
        NextSong();
    }
    // End:0x7e
    else
    {
        // End:0x38
        if(bRestartTrack)
        {
            bRestartTrack = false;
            PlayStream(CurrentSong, int(CurrentSongPosition));
        }
        // End:0x7e
        else
        {
            // End:0x7e
            if(!IsPaused() && CurrentSongHandle != 0)
            {
                CurrentSongPosition += DeltaTime / ViewportOwner.Actor.Level.TimeDilation;
            }
        }
    }
}

// Export UStreamInteraction::execIsPaused(FFrame&, void* const)
native final function bool IsPaused(optional int SongHandle);
function SetStreamAttachment(Stream StreamObj)
{
    local StreamTag sTag;

    CurrentStreamAttachment = StreamObj;
    // End:0x58
    if(CurrentStreamAttachment != none)
    {
        sTag = CurrentStreamAttachment.GetTag();
        // End:0x58
        if(sTag != none)
        {
            CurrentSongDuration = float(sTag.Duration.FieldValue) / 1000.0;
        }
    }
}

function StreamFinished(int Handle, Interactions.EStreamFinishReason Reason)
{
    super.StreamFinished(Handle, Reason);
    PlaylistManager.Save();
    Log("StreamFinished() Handle:" $ string(Handle) @ "Reason:" $ string(GetEnum(enum'EStreamFinishReason', Reason)), 'MusicPlayer');
    // End:0x10b
    if(Handle == CurrentSongHandle && CurrentSongHandle != 0)
    {
        Log("CurrentSongPosition:" $ class'StreamBase'.static.FormatTimeDisplay(CurrentSongPosition) @ "Total song time:" $ class'StreamBase'.static.FormatTimeDisplay(GetStreamDuration()));
        CurrentSongPosition = 0.0;
        CurrentSongHandle = 0;
        SetStreamAttachment(none);
        OnStreamingStopped();
        QueueNextSong();
    }
    // End:0x13f
    else
    {
        Log(string(Name) @ "StreamFinished Invalid Song Handle", 'MusicPlayer');
    }
}

event NotifyLevelChange()
{
    // End:0x21
    if(CurrentSongHandle != 0 && CurrentSong != "")
    {
        bRestartTrack = true;
    }
}

exec function string GetCurrentStream()
{
    HasPlayer();
    Log("CurrentSongHandle:" $ string(CurrentSongHandle) @ "CurrentSong:" $ CurrentSong @ "IsPaused:" $ string(IsPaused()));
    return CurrentSong;
}

function int CurrentHandle()
{
    return CurrentSongHandle;
}

exec function NextSong(optional bool bForce)
{
    // End:0x0d
    if(!HasPlayer())
    {
        return;
    }
    bTrackWaiting = false;
    PlayStream(PlaylistManager.NextSong(bForce));
}

exec function PrevSong(optional bool bForce)
{
    // End:0x0d
    if(!HasPlayer())
    {
        return;
    }
    bTrackWaiting = false;
    // End:0x32
    if(CurrentSongPosition > 3.0)
    {
        PlayStream(CurrentSong);
    }
    // End:0x4d
    else
    {
        PlayStream(PlaylistManager.PrevSong(bForce));
    }
}

exec function PauseSong()
{
    // End:0x0d
    if(!HasPlayer())
    {
        return;
    }
    // End:0x2d
    if(CurrentSongHandle != 0)
    {
        PC().PauseStream(CurrentSongHandle);
    }
}

exec function PlaySong(string SongName, float InitialTime)
{
    // End:0x0d
    if(!HasPlayer())
    {
        return;
    }
    PlayStream(SongName, int(InitialTime));
}

exec function StopSong()
{
    // End:0x0d
    if(!HasPlayer())
    {
        return;
    }
    // End:0x32
    if(CurrentSongHandle != 0)
    {
        PC().StopStream(CurrentSongHandle, FadeOutSeconds);
    }
    PC().AllowMusicPlayback(true);
    ClearSongInfo();
}

exec function SetMusicVolume(float NewVolume)
{
    // End:0x3e
    if(HasPlayer())
    {
        PC().AdjustVolume(CurrentSongHandle, FClamp(NewVolume, 0.0, 1.0));
        OnAdjustVolume(NewVolume);
    }
}

exec function SeekStream(float Seconds)
{
    Seek(Seconds);
}

function bool Seek(float SeekSeconds)
{
    return false;
    // End:0x3a
    if(CurrentSongHandle != 0)
    {
        // End:0x3a
        if(PC().SeekStream(CurrentSongHandle, SeekSeconds) > 0)
        {
            CurrentSongPosition = SeekSeconds;
            return true;
        }
    }
    return false;
}

function PlayStream(string fileName, optional int SeekSeconds)
{
    local int LastSongHandle;

    // End:0x1dd
    if(fileName != "")
    {
        // End:0x41
        if(fileName == CurrentSong && IsPaused() && float(SeekSeconds) == 0.0)
        {
            PauseSong();
            return;
        }
        SeekSeconds = 0;
        LastSongHandle = CurrentSongHandle;
        // End:0x94
        if(float(SeekSeconds) > 0.0 && CurrentSong == fileName)
        {
            CurrentSongHandle = PC().super(StreamInteraction).PlayStream(fileName, true);
        }
        // End:0xb0
        else
        {
            CurrentSongHandle = PC().super(StreamInteraction).PlayStream(fileName, true);
        }
        // End:0xfe
        if(CurrentSongHandle == 0)
        {
            Log("StreamInteraction::PlaySong() Invalid song name:" @ fileName, 'MusicPlayer');
        }
        // End:0x1da
        else
        {
            KillMusic();
            CurrentSongPosition = float(SeekSeconds);
            CurrentSongDuration = 0.0;
            // End:0x17b
            if(LastSongHandle != 0)
            {
                // End:0x161
                if(float(SeekSeconds) > 0.0 && CurrentSong == fileName)
                {
                    PC().StopStream(LastSongHandle);
                }
                // End:0x17b
                else
                {
                    PC().StopStream(LastSongHandle, FadeOutSeconds);
                }
            }
            CurrentSong = fileName;
            // End:0x1cb
            if(bDisplayTrackChanges)
            {
                PC().ClientMessage("Now playing '" $ CurrentSong $ "' Handle:" $ string(CurrentSongHandle));
            }
            OnStreamChanged(CurrentSong);
        }
    }
    // End:0x1ff
    else
    {
        // End:0x1ff
        if(CurrentSongHandle == 0)
        {
            PC().AllowMusicPlayback(true);
            ClearSongInfo();
        }
    }
}

function float GetStreamPosition()
{
    return CurrentSongPosition;
}

function float GetStreamVolume()
{
    // End:0x4b
    if(HasPlayer())
    {
        return float(PC().ConsoleCommand("get ini:Engine.Engine.AudioDevice MusicVolume"));
    }
    return 0.80;
}

function float GetStreamDuration()
{
    // End:0x11
    if(!IsPlaying())
    {
        return 0.0;
    }
    // End:0x4e
    if(CurrentSongDuration == 0.0)
    {
        CurrentSongDuration = float(PC().ConsoleCommand("GETDURATION" @ string(CurrentSongHandle)));
    }
    return CurrentSongDuration;
}

function bool IsPlaying()
{
    return CurrentSongHandle != 0;
}

function bool HasPlayer()
{
    // End:0x48
    if(ViewportOwner == none)
    {
        Log("StreamInteraction::HasPlayer() - No ViewportOwner!", 'MusicPlayer');
        return false;
    }
    // End:0x9c
    if(ViewportOwner.Actor == none)
    {
        Log("StreamInteraction::HasPlayer() - No PlayerController!", 'MusicPlayer');
        return false;
    }
    return true;
}

function ClearSongInfo()
{
    SetStreamAttachment(none);
    CurrentSong = "";
    CurrentSongHandle = 0;
    CurrentSongPosition = 0.0;
    CurrentSongDuration = 0.0;
}

protected function KillMusic()
{
    // End:0x0d
    if(!HasPlayer())
    {
        return;
    }
    PC().StopAllMusic();
    PC().AllowMusicPlayback(false);
}

protected function PlayerController PC()
{
    // End:0x18
    if(HasPlayer())
    {
        return ViewportOwner.Actor;
    }
    return none;
}

exec function streamdebug(string Command, string Param)
{
    // End:0x6c
    if(Command ~= "getstats")
    {
        Log(" CurrentSong '" $ CurrentSong $ "' Handle:" $ string(CurrentSongHandle) @ "Pos:" $ string(CurrentSongPosition) @ "Duration:" $ string(CurrentSongDuration));
        return;
    }
    // End:0x8a
    if(FileManager.HandleDebugExec(Command, Param))
    {
        return;
    }
    // End:0xa8
    if(PlaylistManager.HandleDebugExec(Command, Param))
    {
        return;
    }
}

defaultproperties
{
    FadeInSeconds=0.50
    FadeOutSeconds=0.50
    bRequiresTick=true
}