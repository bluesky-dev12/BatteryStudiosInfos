class StreamPlaylist extends StreamBase
    config(UPlaylists)
    perobjectconfig;

var() protected config int current;
var() protected config array<string> Playlist;
var() protected string Title;
var() protected config bool bNeedSave;
var() private editconstarray editconst noexport editinline transient array<editconst editinline int> RandomPool;
var() protected editconst noexport editinline StreamInterface FileManager;
var() protected editconstarray editconst noexport editinline array<editconst editinline Stream> Songs;
//var delegate<OnPlaylistChanged> __OnPlaylistChanged__Delegate;

delegate OnPlaylistChanged()
{
    //return;    
}

function bool InitializePlaylist(StreamInterface InManager)
{
    // End:0x18
    if((InManager == none) || IsInitialized())
    {
        return false;
    }
    FileManager = InManager;
    LoadPlaylist();
    return true;
    //return;    
}

function bool LoadPlaylist()
{
    local int i;

    ClearPlaylist();
    i = 0;
    J0x0D:

    // End:0xAC [Loop If]
    if(i < Playlist.Length)
    {
        // End:0x91
        if(!FileManager.ValidFile(Playlist[i]))
        {
            Log(("Removing file from playlist '" $ (GetTitle())) $ "' - file not found", 'MusicPlayer');
            Playlist.Remove(i--, 1);
            // [Explicit Continue]
            goto J0xA2;
        }
        AddSong(Playlist[i]);
        J0xA2:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    ResetRandomPool();
    bNeedSave = false;
    return true;
    //return;    
}

function Stream CreateStream(string fileName)
{
    // End:0x0E
    if(fileName == "")
    {
        return none;
    }
    return FileManager.super(StreamPlaylist).CreateStream(fileName);
    //return;    
}

function int AddSong(string SongFileName, optional bool bSkipNotification)
{
    local Stream NewStream;
    local StreamBase.EFileType Type;
    local int i;

    // End:0x12
    if(SongFileName == "")
    {
        return -1;
    }
    Type = ConvertToFileType(SongFileName);
    // End:0x95
    if(int(Type) == int(4))
    {
        NewStream = CreateStream(SongFileName);
        // End:0x55
        if(NewStream == none)
        {
            return -1;
        }
        i = AddStream(GetPlaylistLength(), NewStream, bSkipNotification);
        bNeedSave = bNeedSave || ValidStreamIndex(i);
        return i;
    }
    return -1;
    //return;    
}

function int AddStream(int Index, Stream NewStream, optional bool bSkipNotification)
{
    local int i;
    local string str;

    // End:0x11
    if(NewStream == none)
    {
        return -1;
    }
    str = NewStream.GetFileName();
    // End:0x38
    if(str == "")
    {
        return -1;
    }
    i = FindIndexByName(str);
    // End:0xBF
    if(!ValidStreamIndex(i))
    {
        // End:0x75
        if(!ValidStreamIndex(Index))
        {
            Index = GetPlaylistLength();
        }
        Songs.Insert(Index, 1);
        Songs[Index] = NewStream;
        RandomPool[RandomPool.Length] = Index;
        // End:0xB9
        if(!bSkipNotification)
        {
            OnPlaylistChanged();
        }
        return Index;
    }
    return i;
    //return;    
}

function int InsertSong(int idx, string Path, optional bool bSkipNotification)
{
    local Stream NewStream;
    local StreamBase.EFileType Type;
    local int i;

    // End:0x22
    if(!ValidStreamIndex(idx))
    {
        return AddSong(Path, bSkipNotification);
    }
    // End:0x34
    if(Path == "")
    {
        return -1;
    }
    Type = ConvertToFileType(Path);
    // End:0xB6
    if(int(Type) == int(4))
    {
        NewStream = CreateStream(Path);
        // End:0x77
        if(NewStream == none)
        {
            return -1;
        }
        i = AddStream(idx, NewStream, bSkipNotification);
        bNeedSave = bNeedSave || ValidStreamIndex(i);
        return i;
    }
    return -1;
    //return;    
}

function bool RemoveSong(string SongFileName, optional bool bSkipNotification)
{
    return RemoveSongAt(FindIndexByName(SongFileName), bSkipNotification);
    //return;    
}

function bool RemoveSongAt(int idx, optional bool bSkipNotification)
{
    local int i;

    // End:0x12
    if(!ValidStreamIndex(idx))
    {
        return false;
    }
    Songs.Remove(idx, 1);
    i = 0;
    J0x25:

    // End:0x64 [Loop If]
    if(i < RandomPool.Length)
    {
        // End:0x5A
        if(RandomPool[i] == Songs.Length)
        {
            RandomPool.Remove(i, 1);
            // [Explicit Break]
            goto J0x64;
        }
        i++;
        // [Loop Continue]
        goto J0x25;
    }
    J0x64:

    // End:0x8F
    if((idx == current) && !SetCurrent(idx - 1))
    {
        SetCurrent(0);
    }
    bNeedSave = true;
    // End:0xAC
    if(!bSkipNotification)
    {
        OnPlaylistChanged();
    }
    return true;
    //return;    
}

function string NextSong(bool bMayRepeat)
{
    local int i;

    i = (GetCurrent()) + 1;
    // End:0x31
    if(!ValidStreamIndex(i) && bMayRepeat)
    {
        i = 0;
    }
    // End:0x55
    if(SetCurrent(i))
    {
        return Songs[current].GetPath();
    }
    return "";
    //return;    
}

function string PrevSong(bool bMayRepeat)
{
    local int i;

    i = (GetCurrent()) - 1;
    // End:0x39
    if(!ValidStreamIndex(i) && bMayRepeat)
    {
        i = (GetPlaylistLength()) - 1;
    }
    // End:0x5D
    if(SetCurrent(i))
    {
        return Songs[current].GetPath();
    }
    return "";
    //return;    
}

function ReplaceWith(StreamPlaylist Other)
{
    // End:0x0D
    if(Other == none)
    {
        return;
    }
    FileManager = Other.FileManager;
    Other.GetSongs(Songs);
    ResetRandomPool();
    SetCurrent(Other.GetCurrent());
    bNeedSave = true;
    //return;    
}

function bool ClearPlaylist()
{
    bNeedSave = bNeedSave || Songs.Length > 0;
    Songs.Remove(0, Songs.Length);
    RandomPool.Remove(0, RandomPool.Length);
    return true;
    //return;    
}

function string GetRandomSong()
{
    local int idx;
    local Stream RandomStream;

    // End:0x12
    if(RandomPool.Length == 0)
    {
        ResetRandomPool();
    }
    // End:0x76
    if(RandomPool.Length > 0)
    {
        idx = Rand(RandomPool.Length - 1);
        // End:0x76
        if(ValidStreamIndex(RandomPool[idx]))
        {
            RandomStream = Songs[RandomPool[idx]];
            RandomPool.Remove(idx, 1);
            return RandomStream.GetPath();
        }
    }
    return "";
    //return;    
}

function ResetRandomPool()
{
    local int i;

    RandomPool.Length = Songs.Length;
    i = 0;
    J0x14:

    // End:0x3F [Loop If]
    if(i < Songs.Length)
    {
        RandomPool[i] = i;
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function bool SetTitle(string NewTitle)
{
    // End:0x0E
    if(NewTitle == "")
    {
        return false;
    }
    Title = NewTitle;
    OnPlaylistChanged();
    Save();
    return true;
    //return;    
}

function bool SetCurrent(int Index)
{
    // End:0x12
    if(!ValidStreamIndex(Index))
    {
        return false;
    }
    current = Index;
    bNeedSave = true;
    return true;
    //return;    
}

function bool SetSongs(array<Stream> NewSongs)
{
    Songs = NewSongs;
    ResetRandomPool();
    bNeedSave = true;
    return true;
    //return;    
}

function bool IsInitialized()
{
    return FileManager != none;
    //return;    
}

function string GetTitle()
{
    return Title;
    //return;    
}

function int GetCurrent()
{
    return current;
    //return;    
}

function GetSongs(out array<Stream> SongArray)
{
    SongArray = Songs;
    //return;    
}

function Stream GetCurrentStream()
{
    return GetStreamAt(GetCurrent());
    //return;    
}

function Stream GetStream(string StreamName)
{
    local int i;

    i = FindIndexByName(StreamName);
    return GetStreamAt(i);
    //return;    
}

function Stream GetStreamAt(int Index)
{
    // End:0x1A
    if(ValidStreamIndex(Index))
    {
        return Songs[Index];
    }
    return none;
    //return;    
}

function int GetPlaylistLength()
{
    return Songs.Length;
    //return;    
}

function int FindIndexByName(string test)
{
    local FilePath APath;

    // End:0x90
    if(ParsePath(test, APath))
    {
        // End:0x7F
        if(APath.Extension != "")
        {
            // End:0x49
            if(APath.Directory != "")
            {
                return FindIndexByPath(APath.FullPath);                
            }
            else
            {
                // End:0x7C
                if(APath.fileName != "")
                {
                    return FindIndexByFullName((APath.fileName $ ".") $ APath.Extension);
                }
            }            
        }
        else
        {
            return FindIndexByFileName(APath.fileName);
        }
    }
    return -1;
    //return;    
}

function int FindIndexByPath(string test)
{
    local int i;

    // End:0x12
    if(test == "")
    {
        return -1;
    }
    i = 0;
    J0x19:

    // End:0x58 [Loop If]
    if(i < Songs.Length)
    {
        // End:0x4E
        if(Songs[i].GetPath() ~= test)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x19;
    }
    return -1;
    //return;    
}

function int FindIndexByFullName(string test)
{
    local int i, Num;

    // End:0x12
    if(test == "")
    {
        return -1;
    }
    Num = GetPlaylistLength();
    i = 0;
    J0x25:

    // End:0x63 [Loop If]
    if(i < Num)
    {
        // End:0x59
        if(Songs[i].GetFullName() ~= test)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x25;
    }
    return -1;
    //return;    
}

function int FindIndexByFileName(string test)
{
    local int i, Num;

    // End:0x12
    if(test == "")
    {
        return -1;
    }
    Num = GetPlaylistLength();
    i = 0;
    J0x25:

    // End:0x63 [Loop If]
    if(i < Num)
    {
        // End:0x59
        if(Songs[i].GetFileName() ~= test)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x25;
    }
    return -1;
    //return;    
}

function bool ValidStreamName(string fileName)
{
    // End:0x0E
    if(fileName == "")
    {
        return false;
    }
    return ValidStreamIndex(FindIndexByName(fileName));
    //return;    
}

function bool ValidStreamIndex(int Index)
{
    return (Index >= 0) && Index < Songs.Length;
    //return;    
}

function DebugInfo()
{
    local int i;

    Log((("   Playlist '" $ (GetTitle())) $ "', Length:") $ string(GetPlaylistLength()), 'MusicPlayer');
    i = 0;
    J0x3D:

    // End:0x89 [Loop If]
    if(i < (GetPlaylistLength()))
    {
        Log((("    " $ string(i)) $ ")") @ Songs[i].GetSongTitle(), 'MusicPlayer');
        i++;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

function bool HandleDebugExec(string Command, string Param)
{
    local int i;

    // End:0x15
    if(super.HandleDebugExec(Command, Param))
    {
        return true;
    }
    switch(Locs(Command))
    {
        // End:0x37
        case "addsong":
            AddSong(Param);
            return true;
        // End:0x7C
        case "dumptags":
            i = 0;
            J0x4B:

            // End:0x7A [Loop If]
            if(i < Songs.Length)
            {
                Songs[i].DumpTags();
                i++;
                // [Loop Continue]
                goto J0x4B;
            }
            return true;
        // End:0xC1
        case "scripttags":
            i = 0;
            J0x92:

            // End:0xC1 [Loop If]
            if(i < Songs.Length)
            {
                Songs[i].DumpScriptTag();
                i++;
                // [Loop Continue]
                goto J0x92;
            }
        // End:0x155
        case "showsongs":
            Log(((("Playlist" @ (GetTitle())) @ "has") @ string(Songs.Length)) @ "songs", 'MusicPlayer');
            i = 0;
            J0x109:

            // End:0x153 [Loop If]
            if(i < Songs.Length)
            {
                Log((("  " $ string(i)) $ ")") @ Songs[i].GetPath(), 'MusicPlayer');
                i++;
                // [Loop Continue]
                goto J0x109;
            }
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

function Save()
{
    local int i;

    // End:0x0D
    if(!bNeedSave)
    {
        return;
    }
    Playlist.Remove(0, Playlist.Length);
    i = 0;
    J0x21:

    // End:0x6D [Loop If]
    if(i < Songs.Length)
    {
        // End:0x63
        if(Songs[i] != none)
        {
            Playlist[i] = Songs[i].GetPath();
        }
        i++;
        // [Loop Continue]
        goto J0x21;
    }
    bNeedSave = false;
    SaveConfig();
    //return;    
}

defaultproperties
{
    bNeedSave=true
}