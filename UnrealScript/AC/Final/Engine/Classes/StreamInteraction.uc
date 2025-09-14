class StreamInteraction extends Interaction
    native
    config(User);

const INVALIDSONGHANDLE = 0;

var() config float FadeInSeconds;
var() config float FadeOutSeconds;
var() config string PlaylistManagerType;
var() editconst noexport editinline StreamPlaylistManager PlaylistManager;
var() editconst noexport editinline StreamInterface FileManager;
var() protected editconst noexport int CurrentSongHandle;
var() protected editconst noexport float CurrentSongPosition;
var() protected editconst noexport float LastPlayTime;
var() protected editconst noexport float CurrentSongDuration;
var() protected editconst noexport string CurrentSong;
var() editconst noexport Stream CurrentStreamAttachment;
var() config bool bAutoStart;
var() config bool bDisplayTrackChanges;
var() protected editconst noexport transient bool bRestartTrack;
var() protected editconst noexport transient bool bTrackWaiting;
//var delegate<OnStreamChanged> __OnStreamChanged__Delegate;
//var delegate<OnStreamingStopped> __OnStreamingStopped__Delegate;
//var delegate<OnAdjustVolume> __OnAdjustVolume__Delegate;

delegate OnStreamChanged(string NewStreamFileName)
{
    //return;    
}

delegate OnStreamingStopped()
{
    //return;    
}

delegate OnAdjustVolume(float NewVolume)
{
    //return;    
}

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
    //return;    
}

function StreamInterface CreateFileManager()
{
    return new Class'Engine_Decompressed.StreamInterface';
    //return;    
}

function StreamPlaylistManager CreatePlaylistManager()
{
    local Class<StreamPlaylistManager> PlaylistManagerClass;

    // End:0x27
    if(PlaylistManagerType != "")
    {
        PlaylistManagerClass = Class<StreamPlaylistManager>(DynamicLoadObject(PlaylistManagerType, Class'Core.Class'));
    }
    // End:0x3D
    if(PlaylistManagerClass == none)
    {
        PlaylistManagerClass = Class'Engine_Decompressed.StreamPlaylistManager';
    }
    return new PlaylistManagerClass;
    //return;    
}

function QueueNextSong()
{
    bTrackWaiting = true;
    //return;    
}

event Tick(float DeltaTime)
{
    // End:0x12
    if(bTrackWaiting)
    {
        NextSong();        
    }
    else
    {
        // End:0x38
        if(bRestartTrack)
        {
            bRestartTrack = false;
            PlayStream(CurrentSong, int(CurrentSongPosition));            
        }
        else
        {
            // End:0x7E
            if(!IsPaused() && CurrentSongHandle != 0)
            {
                CurrentSongPosition += (DeltaTime / ViewportOwner.Actor.Level.TimeDilation);
            }
        }
    }
    //return;    
}

// Export UStreamInteraction::execIsPaused(FFrame&, void* const)
native final function bool IsPaused(optional int SongHandle)
{
    //native.SongHandle;        
}

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
            CurrentSongDuration = float(sTag.Duration.FieldValue) / 1000.0000000;
        }
    }
    //return;    
}

function StreamFinished(int Handle, Interactions.EStreamFinishReason Reason)
{
    super.StreamFinished(Handle, Reason);
    PlaylistManager.Save();
    Log((("StreamFinished() Handle:" $ string(Handle)) @ "Reason:") $ string(GetEnum(Enum'Engine_Decompressed.Interactions.EStreamFinishReason', int(Reason))), 'MusicPlayer');
    // End:0x10B
    if((Handle == CurrentSongHandle) && CurrentSongHandle != 0)
    {
        Log((("CurrentSongPosition:" $ Class'Engine_Decompressed.StreamBase'.static.FormatTimeDisplay(CurrentSongPosition)) @ "Total song time:") $ Class'Engine_Decompressed.StreamBase'.static.FormatTimeDisplay(GetStreamDuration()));
        CurrentSongPosition = 0.0000000;
        CurrentSongHandle = 0;
        SetStreamAttachment(none);
        OnStreamingStopped();
        QueueNextSong();        
    }
    else
    {
        Log(string(Name) @ "StreamFinished Invalid Song Handle", 'MusicPlayer');
    }
    //return;    
}

event NotifyLevelChange()
{
    // End:0x21
    if((CurrentSongHandle != 0) && CurrentSong != "")
    {
        bRestartTrack = true;
    }
    //return;    
}

exec function string GetCurrentStream()
{
    HasPlayer();
    Log((((("CurrentSongHandle:" $ string(CurrentSongHandle)) @ "CurrentSong:") $ CurrentSong) @ "IsPaused:") $ string(IsPaused()));
    return CurrentSong;
    //return;    
}

function int CurrentHandle()
{
    return CurrentSongHandle;
    //return;    
}

exec function NextSong(optional bool bForce)
{
    // End:0x0D
    if(!HasPlayer())
    {
        return;
    }
    bTrackWaiting = false;
    PlayStream(PlaylistManager.NextSong(bForce));
    //return;    
}

exec function PrevSong(optional bool bForce)
{
    // End:0x0D
    if(!HasPlayer())
    {
        return;
    }
    bTrackWaiting = false;
    // End:0x32
    if(CurrentSongPosition > 3.0000000)
    {
        PlayStream(CurrentSong);        
    }
    else
    {
        PlayStream(PlaylistManager.PrevSong(bForce));
    }
    //return;    
}

exec function PauseSong()
{
    // End:0x0D
    if(!HasPlayer())
    {
        return;
    }
    // End:0x2D
    if(CurrentSongHandle != 0)
    {
        PC().PauseStream(CurrentSongHandle);
    }
    //return;    
}

exec function PlaySong(string SongName, float InitialTime)
{
    // End:0x0D
    if(!HasPlayer())
    {
        return;
    }
    PlayStream(SongName, int(InitialTime));
    //return;    
}

exec function StopSong()
{
    // End:0x0D
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
    //return;    
}

exec function SetMusicVolume(float NewVolume)
{
    // End:0x3E
    if(HasPlayer())
    {
        PC().AdjustVolume(CurrentSongHandle, FClamp(NewVolume, 0.0000000, 1.0000000));
        OnAdjustVolume(NewVolume);
    }
    //return;    
}

exec function SeekStream(float Seconds)
{
    Seek(Seconds);
    //return;    
}

function bool Seek(float SeekSeconds)
{
    return false;
    // End:0x3A
    if(CurrentSongHandle != 0)
    {
        // End:0x3A
        if(PC().SeekStream(CurrentSongHandle, SeekSeconds) > 0)
        {
            CurrentSongPosition = SeekSeconds;
            return true;
        }
    }
    return false;
    //return;    
}

function PlayStream(string fileName, optional int SeekSeconds)
{
    local int LastSongHandle;

    // End:0x1DD
    if(fileName != "")
    {
        // End:0x41
        if(((fileName == CurrentSong) && IsPaused()) && float(SeekSeconds) == 0.0000000)
        {
            PauseSong();
            return;
        }
        SeekSeconds = 0;
        LastSongHandle = CurrentSongHandle;
        // End:0x94
        if((float(SeekSeconds) > 0.0000000) && CurrentSong == fileName)
        {
            CurrentSongHandle = PC().super(StreamInteraction).PlayStream(fileName, true);            
        }
        else
        {
            CurrentSongHandle = PC().super(StreamInteraction).PlayStream(fileName, true);
        }
        // End:0xFE
        if(CurrentSongHandle == 0)
        {
            Log("StreamInteraction::PlaySong() Invalid song name:" @ fileName, 'MusicPlayer');            
        }
        else
        {
            KillMusic();
            CurrentSongPosition = float(SeekSeconds);
            CurrentSongDuration = 0.0000000;
            // End:0x17B
            if(LastSongHandle != 0)
            {
                // End:0x161
                if((float(SeekSeconds) > 0.0000000) && CurrentSong == fileName)
                {
                    PC().StopStream(LastSongHandle);                    
                }
                else
                {
                    PC().StopStream(LastSongHandle, FadeOutSeconds);
                }
            }
            CurrentSong = fileName;
            // End:0x1CB
            if(bDisplayTrackChanges)
            {
                PC().ClientMessage((("Now playing '" $ CurrentSong) $ "' Handle:") $ string(CurrentSongHandle));
            }
            OnStreamChanged(CurrentSong);
        }        
    }
    else
    {
        // End:0x1FF
        if(CurrentSongHandle == 0)
        {
            PC().AllowMusicPlayback(true);
            ClearSongInfo();
        }
    }
    //return;    
}

function float GetStreamPosition()
{
    return CurrentSongPosition;
    //return;    
}

function float GetStreamVolume()
{
    // End:0x4B
    if(HasPlayer())
    {
        return float(PC().ConsoleCommand("get ini:Engine.Engine.AudioDevice MusicVolume"));
    }
    return 0.8000000;
    //return;    
}

function float GetStreamDuration()
{
    // End:0x11
    if(!IsPlaying())
    {
        return 0.0000000;
    }
    // End:0x4E
    if(CurrentSongDuration == 0.0000000)
    {
        CurrentSongDuration = float(PC().ConsoleCommand("GETDURATION" @ string(CurrentSongHandle)));
    }
    return CurrentSongDuration;
    //return;    
}

function bool IsPlaying()
{
    return CurrentSongHandle != 0;
    //return;    
}

function bool HasPlayer()
{
    // End:0x48
    if(ViewportOwner == none)
    {
        Log("StreamInteraction::HasPlayer() - No ViewportOwner!", 'MusicPlayer');
        return false;
    }
    // End:0x9C
    if(ViewportOwner.Actor == none)
    {
        Log("StreamInteraction::HasPlayer() - No PlayerController!", 'MusicPlayer');
        return false;
    }
    return true;
    //return;    
}

function ClearSongInfo()
{
    SetStreamAttachment(none);
    CurrentSong = "";
    CurrentSongHandle = 0;
    CurrentSongPosition = 0.0000000;
    CurrentSongDuration = 0.0000000;
    //return;    
}

protected function KillMusic()
{
    // End:0x0D
    if(!HasPlayer())
    {
        return;
    }
    PC().StopAllMusic();
    PC().AllowMusicPlayback(false);
    //return;    
}

protected function PlayerController PC()
{
    // End:0x18
    if(HasPlayer())
    {
        return ViewportOwner.Actor;
    }
    return none;
    //return;    
}

exec function streamdebug(string Command, string Param)
{
    // End:0x6C
    if(Command ~= "getstats")
    {
        Log(((((((" CurrentSong '" $ CurrentSong) $ "' Handle:") $ string(CurrentSongHandle)) @ "Pos:") $ string(CurrentSongPosition)) @ "Duration:") $ string(CurrentSongDuration));
        return;
    }
    // End:0x8A
    if(FileManager.HandleDebugExec(Command, Param))
    {
        return;
    }
    // End:0xA8
    if(PlaylistManager.HandleDebugExec(Command, Param))
    {
        return;
    }
    //return;    
}

defaultproperties
{
    FadeInSeconds=0.5000000
    FadeOutSeconds=0.5000000
    bRequiresTick=true
}