class UT2MusicManager extends GUIPage
    config(User)
    editinlinenew
    instanced;

struct PlayListStruct
{
    var config bool bRepeat;
    var config bool bShuffle;
    var config string current;
    var config array<string> Songs;
};

var config PlayListStruct Playlist;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ExtendedConsole(Controller.Master.Console).MusicManager = self;
    //return;    
}

function SetMusic(string NewSong)
{
    Playlist.current = NewSong;
    //return;    
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
    J0x1E:

    // End:0x5D [Loop If]
    if(i < Playlist.Songs.Length)
    {
        // End:0x53
        if(Playlist.Songs[i] ~= NewSong)
        {
            return NewSong;
        }
        i++;
        // [Loop Continue]
        goto J0x1E;
    }
    // End:0x7B
    if(Playlist.current == "")
    {
        return Playlist.Songs[0];
    }
    return Playlist.current;
    //return;    
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
    else
    {
        Index = -1;
        i = 0;
        J0x68:

        // End:0xB1 [Loop If]
        if(i < Playlist.Songs.Length)
        {
            // End:0xA7
            if(Playlist.Songs[i] ~= Playlist.current)
            {
                Index = i;
            }
            i++;
            // [Loop Continue]
            goto J0x68;
        }
        Index++;
        // End:0xE4
        if((Index == Playlist.Songs.Length) && Playlist.bRepeat)
        {
            Index = 0;
        }
        PlayerOwner().ClientSetMusic(Playlist.Songs[Index], 3);
    }
    //return;    
}

function bool NotifyLevelChange()
{
    return false;
    //return;    
}

defaultproperties
{
    bPersistent=true
}