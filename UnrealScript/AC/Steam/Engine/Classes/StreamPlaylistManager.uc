/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\StreamPlaylistManager.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:13
 *	Functions:42
 *
 *******************************************************************************/
class StreamPlaylistManager extends StreamBase
    dependson(PlaylistParserBase)
    config(UPlaylists);

struct PlaylistParser
{
    var() StreamBase.EStreamPlaylistType Type;
    var() string ParserClass;
};

var() editconst config int CurrentPlaylist;
var() editconst noexport editinline StreamInterface FileManager;
var() editconstarray editinline array<editinline StreamPlaylist> Playlists;
var() bool bDisableNotification;
var() noexport transient bool bDirty;
var() config bool bShuffle;
var() config bool bShuffleAll;
var() config bool bRepeat;
var() config bool bRepeatAll;
var() localized string DefaultPlaylistName;
var() config array<PlaylistParser> ParserType;
var() editconstarray editconst noexport editinline array<editconst editinline PlaylistParserBase> Parsers;
var delegate<ChangedActivePlaylist> __ChangedActivePlaylist__Delegate;

delegate ChangedActivePlaylist(StreamPlaylist NewPlaylist);
function Initialize(StreamInterface InFileManager)
{
    FileManager = InFileManager;
    InitializePlaylists();
    InitializeParsers();
}

protected function InitializePlaylists()
{
    local array<string> PlaylistNames;
    local StreamPlaylist NewList;
    local int i;

    PlaylistNames = GetPerObjectNames("UPlaylists", "StreamPlaylist");
    i = 0;
    J0x2f:
    // End:0x80 [While If]
    if(i < PlaylistNames.Length)
    {
        // End:0x54
        if(PlaylistNames[i] == "")
        {
        }
        // End:0x76
        else
        {
            NewList = CreatePlaylist(PlaylistNames[i]);
            AppendPlaylist(NewList);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2f;
    }
    // End:0x95
    if(Playlists.Length == 0)
    {
        CreateDefaultPlaylist();
    }
    // End:0xac
    else
    {
        // End:0xac
        if(!ActivatePlaylist(CurrentPlaylist))
        {
            ActivatePlaylist(0);
        }
    }
}

protected function InitializeParsers()
{
    local int i, j;
    local class<PlaylistParserBase> ParseClass;

    i = 0;
    J0x07:
    // End:0xaf [While If]
    if(i < ParserType.Length)
    {
        // End:0xa5
        if(ParserType[i].ParserClass != "")
        {
            ParseClass = class<PlaylistParserBase>(DynamicLoadObject(ParserType[i].ParserClass, class'Class'));
            // End:0xa5
            if(ParseClass != none)
            {
                j = Parsers.Length;
                Parsers[j] = new (self) ParseClass;
                Parsers[j].SetType(ParserType[i].Type);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

protected function StreamPlaylist CreateDefaultPlaylist()
{
    local int i;
    local string Nothing;

    Nothing = DefaultPlaylistName;
    i = AddPlaylist(Nothing);
    // End:0x46
    if(ValidIndex(i) && ActivatePlaylist(i))
    {
        return Playlists[CurrentPlaylist];
    }
    return none;
}

function bool ActivatePlaylist(int ListIndex, optional bool bNoFail)
{
    // End:0x6f
    if(!ValidIndex(ListIndex))
    {
        // End:0x1b
        if(bNoFail)
        {
            return false;
        }
        // End:0x6d
        if(GetRepeatAll())
        {
            // End:0x41
            if(ListIndex < 0)
            {
                ListIndex = Playlists.Length - 1;
            }
            // End:0x58
            else
            {
                // End:0x58
                if(ListIndex >= Playlists.Length)
                {
                    ListIndex = 0;
                }
            }
            // End:0x6a
            if(!ValidIndex(ListIndex))
            {
                return false;
            }
        }
        // End:0x6f
        else
        {
            return false;
        }
    }
    bDirty = bDirty || ListIndex != CurrentPlaylist;
    Playlists[ListIndex].InitializePlaylist(FileManager);
    CurrentPlaylist = ListIndex;
    // End:0xd2
    if(!bDisableNotification)
    {
        ChangedActivePlaylist(Playlists[ListIndex]);
    }
    return true;
}

function int AddPlaylist(out string NewPlaylistName)
{
    local string str;
    local int i;

    // End:0x17
    if(NewPlaylistName == "")
    {
        NewPlaylistName = DefaultPlaylistName;
    }
    str = NewPlaylistName;
    J0x22:
    // End:0x49 [While If]
    if(ValidName(NewPlaylistName))
    {
        NewPlaylistName = str $ string(++ i);
        // This is an implied JumpToken; Continue!
        goto J0x22;
    }
    return AppendPlaylist(CreatePlaylist(NewPlaylistName));
}

protected function int AppendPlaylist(StreamPlaylist Playlist)
{
    local int i;

    // End:0x11
    if(Playlist == none)
    {
        return -1;
    }
    i = FindPlaylistIndex(Playlist);
    // End:0x3d
    if(i == -1)
    {
        i = Playlists.Length;
    }
    Playlists[i] = Playlist;
    bDirty = true;
    return i;
}

function bool RemovePlaylist(string PlaylistName)
{
    local int i;

    i = FindNameIndex(PlaylistName);
    // End:0x2c
    if(i != -1)
    {
        return RemovePlaylistAt(i);
    }
    return false;
}

function bool RemovePlaylistAt(int Index)
{
    local bool bWasActive;

    // End:0x12
    if(!ValidIndex(Index))
    {
        return false;
    }
    bWasActive = CurrentPlaylist == Index;
    Playlists[Index].ClearConfig();
    Playlists.Remove(Index, 1);
    // End:0x53
    if(bWasActive)
    {
        ActivatePlaylist(0);
    }
    return true;
}

function bool RenamePlaylist(int Index, out string NewName)
{
    local StreamPlaylist temp;
    local string str;
    local int i;

    // End:0x20
    if(!ValidIndex(Index) || NewName == "")
    {
        return false;
    }
    str = NewName;
    J0x2b:
    // End:0x52 [While If]
    if(ValidName(NewName))
    {
        NewName = str $ string(++ i);
        // This is an implied JumpToken; Continue!
        goto J0x2b;
    }
    temp = CreatePlaylist(NewName);
    // End:0x70
    if(temp == none)
    {
        return false;
    }
    temp.ReplaceWith(Playlists[Index]);
    Playlists[Index].ClearConfig();
    Playlists[Index] = temp;
    Playlists[Index].Save();
    // End:0xe2
    if(!bDisableNotification)
    {
        ChangedActivePlaylist(Playlists[Index]);
    }
    return true;
}

function bool AddToPlaylist(int PlaylistIndex, string Path, optional bool bSkipNotification)
{
    // End:0x2d
    if(!ValidIndex(PlaylistIndex))
    {
        // End:0x22
        if(!ValidIndex(CurrentPlaylist))
        {
            return false;
        }
        PlaylistIndex = CurrentPlaylist;
    }
    return InsertInPlaylist(PlaylistIndex, -1, Path, bSkipNotification);
}

function bool InsertInPlaylist(int PlaylistIndex, int InsertPosition, string Path, optional bool bSkipNotification)
{
    local StreamBase.EFileType Type;
    local bool bResult;

    // End:0x12
    if(!ValidIndex(PlaylistIndex))
    {
        return false;
    }
    Type = ConvertToFileType(Path);
    Playlists[PlaylistIndex].InitializePlaylist(FileManager);
    switch(Type)
    {
        // End:0xac
        case 0:
            bDisableNotification = true;
            bResult = AddDirectory(PlaylistIndex, InsertPosition, Path, true);
            bDisableNotification = false;
            // End:0xa5
            if(bResult && !bSkipNotification)
            {
                Playlists[PlaylistIndex].OnPlaylistChanged();
            }
            return bResult;
        // End:0x113
        case 5:
            bDisableNotification = true;
            bResult = ImportPlaylist(PlaylistIndex, InsertPosition, Path);
            bDisableNotification = false;
            // End:0x10c
            if(bResult && !bSkipNotification)
            {
                Playlists[PlaylistIndex].OnPlaylistChanged();
            }
            return bResult;
        // End:0x150
        case 4:
            return Playlists[PlaylistIndex].InsertSong(InsertPosition, Path, bDisableNotification || bSkipNotification) != -1;
        // End:0xffff
        default:
            return false;
    }
}

function bool RemoveFromCurrentPlaylist(string Path, optional bool bSkipNotification)
{
    // End:0x2f
    if(ValidIndex(CurrentPlaylist))
    {
        return Playlists[CurrentPlaylist].RemoveSong(Path, bSkipNotification);
    }
    return false;
}

function bool ClearCurrentPlaylist()
{
    // End:0x12
    if(!ValidIndex(CurrentPlaylist))
    {
        return false;
    }
    return Playlists[CurrentPlaylist].ClearPlaylist();
}

function StreamBase.EStreamPlaylistType GetPlaylistType(string Path)
{
    local string Ext;

    Ext = ParseExtension(Path);
    switch(Locs(Ext))
    {
        // End:0x25
        case "m3u":
            return 1;
        // End:0x30
        case "b4s":
            return 3;
        // End:0x3b
        case "pls":
            return 2;
        // End:0xffff
        default:
            return 0;
    }
}

function bool AddDirectory(int PlaylistIndex, int InsertPosition, string Path, bool bRecurseDirectories)
{
    local int i;
    local bool bValue;
    local array<string> Results;

    // End:0x88
    if(bRecurseDirectories)
    {
        // End:0x88
        if(FileManager.GetDirectoryContents(Results, Path, 1))
        {
            i = Results.Length - 1;
            J0x36:
            // End:0x88 [While If]
            if(i >= 0)
            {
                bValue = AddDirectory(PlaylistIndex, InsertPosition, Path $ Results[i] $ GetPathSeparator(), true) || bValue;
                -- i;
                // This is an implied JumpToken; Continue!
                goto J0x36;
            }
        }
    }
    Results.Remove(0, Results.Length);
    // End:0x15c
    if(FileManager.GetDirectoryContents(Results, Path, 4))
    {
        // End:0xed
        if(!Playlists[PlaylistIndex].ValidStreamIndex(InsertPosition))
        {
            InsertPosition = Playlists[PlaylistIndex].GetPlaylistLength();
        }
        i = Results.Length - 1;
        J0xfc:
        // End:0x15c [While If]
        if(i >= 0)
        {
            bValue = Playlists[PlaylistIndex].InsertSong(InsertPosition, Path $ Results[i], bDisableNotification) != -1 || bValue;
            -- i;
            // This is an implied JumpToken; Continue!
            goto J0xfc;
        }
    }
    return bValue;
}

function bool ImportPlaylist(int PlaylistIndex, int InsertPosition, string Path)
{
    local int i;
    local StreamBase.EStreamPlaylistType Type;

    Type = GetPlaylistType(Path);
    i = 0;
    J0x18:
    // End:0x7a [While If]
    if(i < Parsers.Length)
    {
        // End:0x70
        if(Parsers[i].GetType() == Type)
        {
            return Parsers[i].Import(PlaylistIndex, InsertPosition, Path);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    return false;
}

function string NextSong(optional bool bForce)
{
    local StreamPlaylist List;
    local Stream S;
    local string str;

    // End:0x1b
    if(GetShuffleAll() || GetShuffle())
    {
        return GetRandomSong();
    }
    List = GetCurrentPlaylist();
    // End:0x6e
    if(List == none)
    {
        Log("PlaylistManager.NextSong() - no playlists found!", 'MusicPlayer');
        return "";
    }
    // End:0xaa
    if(GetRepeat())
    {
        S = List.GetCurrentStream();
        // End:0xa7
        if(S != none)
        {
            return S.GetPath();
        }
    }
    // End:0x12d
    else
    {
        str = List.NextSong(bForce || GetRepeat());
        // End:0x11b
        if(str == "" && GetRepeatAll() && ActivatePlaylist(CurrentPlaylist + 1))
        {
            str = Playlists[CurrentPlaylist].NextSong(bForce);
        }
        // End:0x12d
        if(str != "")
        {
            return str;
        }
    }
    return "";
}

function string PrevSong(optional bool bForce)
{
    local StreamPlaylist List;
    local Stream S;
    local string str;

    // End:0x1b
    if(GetShuffleAll() || GetShuffle())
    {
        return GetRandomSong();
    }
    List = GetCurrentPlaylist();
    // End:0x6e
    if(List == none)
    {
        Log("PlaylistManager.PrevSong() - no playlists found!", 'MusicPlayer');
        return "";
    }
    // End:0xaa
    if(GetRepeat())
    {
        S = List.GetCurrentStream();
        // End:0xa7
        if(S != none)
        {
            return S.GetPath();
        }
    }
    // End:0x12d
    else
    {
        str = List.PrevSong(bForce || GetRepeat());
        // End:0x11b
        if(str == "" && GetRepeatAll() && ActivatePlaylist(CurrentPlaylist - 1))
        {
            str = Playlists[CurrentPlaylist].PrevSong(bForce);
        }
        // End:0x12d
        if(str != "")
        {
            return str;
        }
    }
    return "";
}

function string GetRandomSong()
{
    local StreamPlaylist List;

    // End:0x18
    if(GetShuffle())
    {
        List = GetCurrentPlaylist();
    }
    // End:0x2d
    else
    {
        // End:0x2d
        if(GetShuffleAll())
        {
            List = GetRandomPlaylist();
        }
    }
    // End:0x48
    if(List != none)
    {
        return List.GetRandomSong();
    }
    return "";
}

function int GetCurrentIndex()
{
    // End:0x14
    if(ValidIndex(CurrentPlaylist))
    {
        return CurrentPlaylist;
    }
    return -1;
}

function StreamPlaylist GetCurrentPlaylist()
{
    // End:0x1a
    if(ValidIndex(CurrentPlaylist))
    {
        return Playlists[CurrentPlaylist];
    }
    // End:0x2c
    if(ActivatePlaylist(0))
    {
        return Playlists[0];
    }
    return CreateDefaultPlaylist();
}

function StreamPlaylist GetRandomPlaylist()
{
    local int i, idx;

    // End:0x0e
    if(Playlists.Length == 0)
    {
        return none;
    }
    idx = Rand(Playlists.Length - 1);
    J0x1f:
    // End:0x5b [While If]
    if(++ i < 10)
    {
        // End:0x47
        if(ActivatePlaylist(idx))
        {
            return Playlists[CurrentPlaylist];
        }
        idx = Rand(Playlists.Length - 1);
        // This is an implied JumpToken; Continue!
        goto J0x1f;
    }
    return none;
}

function StreamPlaylist GetPlaylistAt(int idx)
{
    // End:0x12
    if(!ValidIndex(idx))
    {
        return none;
    }
    return Playlists[idx];
}

function int GetPlaylistCount()
{
    return Playlists.Length;
}

function bool ValidIndex(int Index)
{
    return Index >= 0 && Index < Playlists.Length;
}

function int FindNameIndex(string PlaylistName)
{
    local int i;

    // End:0x12
    if(PlaylistName == "")
    {
        return -1;
    }
    i = 0;
    J0x19:
    // End:0x58 [While If]
    if(i < Playlists.Length)
    {
        // End:0x4e
        if(Playlists[i].GetTitle() ~= PlaylistName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x19;
    }
    return -1;
}

function int FindPlaylistIndex(StreamPlaylist Playlist)
{
    local int i;

    // End:0x11
    if(Playlist == none)
    {
        return -1;
    }
    i = 0;
    J0x18:
    // End:0x4d [While If]
    if(i < Playlists.Length)
    {
        // End:0x43
        if(Playlists[i] == Playlist)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    return -1;
}

function bool ValidName(string Test)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x42 [While If]
    if(i < Playlists.Length)
    {
        // End:0x38
        if(Test ~= Playlists[i].GetTitle())
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function bool GetShuffle()
{
    return bShuffle;
}

function bool GetShuffleAll()
{
    return bShuffleAll;
}

function bool GetRepeat()
{
    return bRepeat;
}

function bool GetRepeatAll()
{
    return bRepeatAll;
}

function SetShuffle(bool bEnable)
{
    bDirty = bDirty || bEnable != bShuffle;
    bShuffle = bEnable;
    // End:0x48
    if(bEnable && bShuffleAll)
    {
        SetShuffleAll(false);
    }
}

function SetShuffleAll(bool bEnable)
{
    bDirty = bDirty || bEnable != bShuffleAll;
    bShuffleAll = bEnable;
    // End:0x48
    if(bEnable && bShuffle)
    {
        SetShuffle(false);
    }
}

function SetRepeat(bool bEnable)
{
    bDirty = bDirty || bEnable != bRepeat;
    bRepeat = bEnable;
    // End:0x48
    if(bEnable && bRepeatAll)
    {
        SetRepeatAll(false);
    }
}

function SetRepeatAll(bool bEnable)
{
    bDirty = bDirty || bEnable != bRepeatAll;
    bRepeatAll = bEnable;
    // End:0x48
    if(bEnable && bRepeat)
    {
        SetRepeat(false);
    }
}

protected function StreamPlaylist CreatePlaylist(string PlaylistName)
{
    local StreamPlaylist List;

    // End:0x0e
    if(PlaylistName == "")
    {
        return none;
    }
    List = new (none, Repl(PlaylistName, " ", Chr(27))) class'StreamPlaylist';
    // End:0x61
    if(List != none)
    {
        List.SetTitle(Repl(PlaylistName, Chr(27), " "));
        List.Save();
    }
    return List;
}

function bool HandleDebugExec(string Command, string Param)
{
    local int i;
    local bool Result;

    // End:0x15
    if(super.HandleDebugExec(Command, Param))
    {
        return true;
    }
    switch(Locs(Command))
    {
        // End:0xa5
        case "activate":
            // End:0x41
            if(Playlists.Length > 0)
            {
                ActivatePlaylist(0);
            }
            // End:0x4e
            else
            {
                ActivatePlaylist(int(Param));
            }
            Log("Active Playlist:" $ Playlists[CurrentPlaylist].GetTitle() @ "Tracks:" $ string(Playlists[CurrentPlaylist].GetPlaylistLength()), 'MusicPlayer');
            // End:0x134
            break;
        // End:0x131
        case "lists":
            Log(" === All existing playlists === ", 'MusicPlayer');
            i = 0;
            J0xdf:
            // End:0x131 [While If]
            if(i < Playlists.Length)
            {
                Log(" Playlist" @ string(i) @ " '" $ Playlists[i].GetTitle(), 'MusicPlayer');
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xdf;
        }
        // End:0xffff
        default:
            i = 0;
            J0x13b:
            // End:0x186 [While If]
            if(i < Playlists.Length)
            {
                Result = Playlists[i].HandleDebugExec(Command, Param) || Result;
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x13b;
            }
            return Result;
    }
}

function Save()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x36 [While If]
    if(i < Playlists.Length)
    {
        Playlists[i].Save();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x43
    if(!bDirty)
    {
        return;
    }
    SaveConfig();
    bDirty = false;
}

function string GetCurrentTitle()
{
    return Playlists[GetCurrentIndex()].GetTitle();
}

defaultproperties
{
    bRepeatAll=true
    DefaultPlaylistName="New Playlist"
    ParserType=// Object reference not set to an instance of an object.
    
}