/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2MusicManager.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class UT2MusicManager extends GUIPage
    config(User)
    editinlinenew
    instanced;

struct PlayListStruct
{
    var config bool bRepeat;
    var config bool bShuffle;
    var config string Current;
    var config array<string> Songs;
};

var config PlayListStruct Playlist;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ExtendedConsole(Controller.Master.Console).MusicManager = self;
}

function SetMusic(string NewSong)
{
    Playlist.Current = NewSong;
}

function string SetInitialMusic(string NewSong)
{
    local int i;

    // End:0x17
    if(Playlist.Songs.Length == 0)
    {
        return NewSong;
    }
    i = 0;
    J0x1e:
    // End:0x5d [While If]
    if(i < Playlist.Songs.Length)
    {
        // End:0x53
        if(Playlist.Songs[i] ~= NewSong)
        {
            return NewSong;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1e;
    }
    // End:0x7b
    if(Playlist.Current == "")
    {
        return Playlist.Songs[0];
    }
    return Playlist.Current;
}

function MusicChanged()
{
    local int i, Index;

    // End:0x13
    if(Playlist.Songs.Length == 0)
    {
        return;
    }
    // End:0x56
    if(Playlist.bShuffle)
    {
        i = Rand(Playlist.Songs.Length);
        PlayerOwner().ClientSetMusic(Playlist.Songs[i], 3);
    }
    // End:0x103
    else
    {
        Index = -1;
        i = 0;
        J0x68:
        // End:0xb1 [While If]
        if(i < Playlist.Songs.Length)
        {
            // End:0xa7
            if(Playlist.Songs[i] ~= Playlist.Current)
            {
                Index = i;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x68;
        }
        ++ Index;
        // End:0xe4
        if(Index == Playlist.Songs.Length && Playlist.bRepeat)
        {
            Index = 0;
        }
        PlayerOwner().ClientSetMusic(Playlist.Songs[Index], 3);
    }
}

function bool NotifyLevelChange()
{
    return false;
}

defaultproperties
{
    bPersistent=true
}