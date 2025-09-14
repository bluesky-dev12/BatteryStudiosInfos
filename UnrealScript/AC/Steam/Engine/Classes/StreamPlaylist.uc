/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\StreamPlaylist.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:35
 *
 *******************************************************************************/
class StreamPlaylist extends StreamBase
    dependson(StreamBase)
    dependson(Stream)
    dependson(StreamInterface)
    config(UPlaylists)
    perobjectconfig;

var() config int Current;
var() config array<string> Playlist;
var() string Title;
var() config bool bNeedSave;
var() private editconstarray editconst noexport editinline transient array<editconst editinline int> RandomPool;
var() editconst noexport editinline StreamInterface FileManager;
var() editconstarray editconst noexport editinline array<editconst editinline Stream> Songs;
var delegate<OnPlaylistChanged> __OnPlaylistChanged__Delegate;

delegate OnPlaylistChanged();
function bool InitializePlaylist(StreamInterface InManager)
{
    // End:0x18
    if(InManager == none || IsInitialized())
    {
        return false;
    }
    FileManager = InManager;
    LoadPlaylist();
    return true;
}

function bool LoadPlaylist()
{
    local int i;

    ClearPlaylist();
    i = 0;
    J0x0d:
    // End:0xac [While If]
    if(i < Playlist.Length)
    {
        // End:0x91
        if(!FileManager.ValidFile(Playlist[i]))
        {
            Log("Removing file from playlist '" $ GetTitle() $ "' - file not found", 'MusicPlayer');
            Playlist.Remove(-- i, 1);
        }
        // End:0xa2
        else
        {
            AddSong(Playlist[i]);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
    ResetRandomPool();
    bNeedSave = false;
    return true;
}

function Stream CreateStream(string fileName)
{
    // End:0x0e
    if(fileName == "")
    {
        return none;
    }
    return FileManager.super(StreamPlaylist).CreateStream(fileName);
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
    if(Type == 4)
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
    // End:0xbf
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
        // End:0xb9
        if(!bSkipNotification)
        {
            OnPlaylistChanged();
        }
        return Index;
    }
    return i;
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
    // End:0xb6
    if(Type == 4)
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
}

function bool RemoveSong(string SongFileName, optional bool bSkipNotification)
{
    return RemoveSongAt(FindIndexByName(SongFileName), bSkipNotification);
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
    // End:0x64 [While If]
    if(i < RandomPool.Length)
    {
        // End:0x5a
        if(RandomPool[i] == Songs.Length)
        {
            RandomPool.Remove(i, 1);
        }
        // End:0x64
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x25;
        }
    }
    // End:0x8f
    if(idx == Current && !SetCurrent(idx - 1))
    {
        SetCurrent(0);
    }
    bNeedSave = true;
    // End:0xac
    if(!bSkipNotification)
    {
        OnPlaylistChanged();
    }
    return true;
}

function string NextSong(bool bMayRepeat)
{
    local int i;

    i = GetCurrent() + 1;
    // End:0x31
    if(!ValidStreamIndex(i) && bMayRepeat)
    {
        i = 0;
    }
    // End:0x55
    if(SetCurrent(i))
    {
        return Songs[Current].GetPath();
    }
    return "";
}

function string PrevSong(bool bMayRepeat)
{
    local int i;

    i = GetCurrent() - 1;
    // End:0x39
    if(!ValidStreamIndex(i) && bMayRepeat)
    {
        i = GetPlaylistLength() - 1;
    }
    // End:0x5d
    if(SetCurrent(i))
    {
        return Songs[Current].GetPath();
    }
    return "";
}

function ReplaceWith(StreamPlaylist Other)
{
    // End:0x0d
    if(Other == none)
    {
        return;
    }
    FileManager = Other.FileManager;
    Other.GetSongs(Songs);
    ResetRandomPool();
    SetCurrent(Other.GetCurrent());
    bNeedSave = true;
}

function bool ClearPlaylist()
{
    bNeedSave = bNeedSave || Songs.Length > 0;
    Songs.Remove(0, Songs.Length);
    RandomPool.Remove(0, RandomPool.Length);
    return true;
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
}

function ResetRandomPool()
{
    local int i;

    RandomPool.Length = Songs.Length;
    i = 0;
    J0x14:
    // End:0x3f [While If]
    if(i < Songs.Length)
    {
        RandomPool[i] = i;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function bool SetTitle(string NewTitle)
{
    // End:0x0e
    if(NewTitle == "")
    {
        return false;
    }
    Title = NewTitle;
    OnPlaylistChanged();
    Save();
    return true;
}

function bool SetCurrent(int Index)
{
    // End:0x12
    if(!ValidStreamIndex(Index))
    {
        return false;
    }
    Current = Index;
    bNeedSave = true;
    return true;
}

function bool SetSongs(array<Stream> NewSongs)
{
    Songs = NewSongs;
    ResetRandomPool();
    bNeedSave = true;
    return true;
}

function bool IsInitialized()
{
    return FileManager != none;
}

function string GetTitle()
{
    return Title;
}

function int GetCurrent()
{
    return Current;
}

function GetSongs(out array<Stream> SongArray)
{
    SongArray = Songs;
}

function Stream GetCurrentStream()
{
    return GetStreamAt(GetCurrent());
}

function Stream GetStream(string StreamName)
{
    local int i;

    i = FindIndexByName(StreamName);
    return GetStreamAt(i);
}

function Stream GetStreamAt(int Index)
{
    // End:0x1a
    if(ValidStreamIndex(Index))
    {
        return Songs[Index];
    }
    return none;
}

function int GetPlaylistLength()
{
    return Songs.Length;
}

function int FindIndexByName(string Test)
{
    local FilePath APath;

    // End:0x90
    if(ParsePath(Test, APath))
    {
        // End:0x7f
        if(APath.Extension != "")
        {
            // End:0x49
            if(APath.Directory != "")
            {
                return FindIndexByPath(APath.FullPath);
            }
            // End:0x7c
            else
            {
                // End:0x7c
                if(APath.fileName != "")
                {
                    return FindIndexByFullName(APath.fileName $ "." $ APath.Extension);
                }
            }
        }
        // End:0x90
        else
        {
            return FindIndexByFileName(APath.fileName);
        }
    }
    return -1;
}

function int FindIndexByPath(string Test)
{
    local int i;

    // End:0x12
    if(Test == "")
    {
        return -1;
    }
    i = 0;
    J0x19:
    // End:0x58 [While If]
    if(i < Songs.Length)
    {
        // End:0x4e
        if(Songs[i].GetPath() ~= Test)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x19;
    }
    return -1;
}

function int FindIndexByFullName(string Test)
{
    local int i, Num;

    // End:0x12
    if(Test == "")
    {
        return -1;
    }
    Num = GetPlaylistLength();
    i = 0;
    J0x25:
    // End:0x63 [While If]
    if(i < Num)
    {
        // End:0x59
        if(Songs[i].GetFullName() ~= Test)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x25;
    }
    return -1;
}

function int FindIndexByFileName(string Test)
{
    local int i, Num;

    // End:0x12
    if(Test == "")
    {
        return -1;
    }
    Num = GetPlaylistLength();
    i = 0;
    J0x25:
    // End:0x63 [While If]
    if(i < Num)
    {
        // End:0x59
        if(Songs[i].GetFileName() ~= Test)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x25;
    }
    return -1;
}

function bool ValidStreamName(string fileName)
{
    // End:0x0e
    if(fileName == "")
    {
        return false;
    }
    return ValidStreamIndex(FindIndexByName(fileName));
}

function bool ValidStreamIndex(int Index)
{
    return Index >= 0 && Index < Songs.Length;
}

function DebugInfo()
{
    local int i;

    Log("   Playlist '" $ GetTitle() $ "', Length:" $ string(GetPlaylistLength()), 'MusicPlayer');
    i = 0;
    J0x3d:
    // End:0x89 [While If]
    if(i < GetPlaylistLength())
    {
        Log("    " $ string(i) $ ")" @ Songs[i].GetSongTitle(), 'MusicPlayer');
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3d;
    }
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
        // End:0x7c
        case "dumptags":
            i = 0;
            J0x4b:
            // End:0x7a [While If]
            if(i < Songs.Length)
            {
                Songs[i].DumpTags();
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x4b;
            }
            return true;
        // End:0xc1
        case "scripttags":
            i = 0;
            J0x92:
            // End:0xc1 [While If]
            if(i < Songs.Length)
            {
                Songs[i].DumpScriptTag();
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x92;
        }
        // End:0x155
        case "showsongs":
            Log("Playlist" @ GetTitle() @ "has" @ string(Songs.Length) @ "songs", 'MusicPlayer');
            i = 0;
            J0x109:
            // End:0x153 [While If]
            if(i < Songs.Length)
            {
                Log("  " $ string(i) $ ")" @ Songs[i].GetPath(), 'MusicPlayer');
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x109;
            }
            return true;
        // End:0xffff
        default:
            return false;
    }
}

function Save()
{
    local int i;

    // End:0x0d
    if(!bNeedSave)
    {
        return;
    }
    Playlist.Remove(0, Playlist.Length);
    i = 0;
    J0x21:
    // End:0x6d [While If]
    if(i < Songs.Length)
    {
        // End:0x63
        if(Songs[i] != none)
        {
            Playlist[i] = Songs[i].GetPath();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x21;
    }
    bNeedSave = false;
    SaveConfig();
}

defaultproperties
{
    bNeedSave=true
}