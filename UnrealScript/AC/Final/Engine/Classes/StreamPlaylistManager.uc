class StreamPlaylistManager extends StreamBase
    config(UPlaylists);

struct PlaylistParser
{
    var() StreamBase.EStreamPlaylistType Type;
    var() string ParserClass;
};

var() protected editconst config int CurrentPlaylist;
var() editconst noexport editinline StreamInterface FileManager;
var() protected editconstarray editinline array<editinline StreamPlaylist> Playlists;
var() protected bool bDisableNotification;
var() protected noexport transient bool bDirty;
var() protected config bool bShuffle;
var() protected config bool bShuffleAll;
var() protected config bool bRepeat;
var() protected config bool bRepeatAll;
var() localized string DefaultPlaylistName;
var() config array<PlaylistParser> ParserType;
var() editconstarray editconst noexport editinline array<editconst editinline PlaylistParserBase> Parsers;
//var delegate<ChangedActivePlaylist> __ChangedActivePlaylist__Delegate;

delegate ChangedActivePlaylist(StreamPlaylist NewPlaylist)
{
    //return;    
}

function Initialize(StreamInterface InFileManager)
{
    FileManager = InFileManager;
    InitializePlaylists();
    InitializeParsers();
    //return;    
}

protected function InitializePlaylists()
{
    local array<string> PlaylistNames;
    local StreamPlaylist NewList;
    local int i;

    PlaylistNames = GetPerObjectNames("UPlaylists", "StreamPlaylist");
    i = 0;
    J0x2F:

    // End:0x80 [Loop If]
    if(i < PlaylistNames.Length)
    {
        // End:0x54
        if(PlaylistNames[i] == "")
        {
            // [Explicit Continue]
            goto J0x76;
        }
        NewList = CreatePlaylist(PlaylistNames[i]);
        AppendPlaylist(NewList);
        J0x76:

        i++;
        // [Loop Continue]
        goto J0x2F;
    }
    // End:0x95
    if(Playlists.Length == 0)
    {
        CreateDefaultPlaylist();        
    }
    else
    {
        // End:0xAC
        if(!ActivatePlaylist(CurrentPlaylist))
        {
            ActivatePlaylist(0);
        }
    }
    //return;    
}

protected function InitializeParsers()
{
    local int i, j;
    local Class<PlaylistParserBase> ParseClass;

    i = 0;
    J0x07:

    // End:0xAF [Loop If]
    if(i < ParserType.Length)
    {
        // End:0xA5
        if(ParserType[i].ParserClass != "")
        {
            ParseClass = Class<PlaylistParserBase>(DynamicLoadObject(ParserType[i].ParserClass, Class'Core.Class'));
            // End:0xA5
            if(ParseClass != none)
            {
                j = Parsers.Length;
                Parsers[j] = new (self) ParseClass;
                Parsers[j].SetType(ParserType[i].Type);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

protected function StreamPlaylist CreateDefaultPlaylist()
{
    local int i;
    local string Nothing;

    Nothing = DefaultPlaylistName;
    i = AddPlaylist(Nothing);
    // End:0x46
    if((ValidIndex(i)) && ActivatePlaylist(i))
    {
        return Playlists[CurrentPlaylist];
    }
    return none;
    //return;    
}

function bool ActivatePlaylist(int ListIndex, optional bool bNoFail)
{
    // End:0x6F
    if(!ValidIndex(ListIndex))
    {
        // End:0x1B
        if(bNoFail)
        {
            return false;
        }
        // End:0x6D
        if(GetRepeatAll())
        {
            // End:0x41
            if(ListIndex < 0)
            {
                ListIndex = Playlists.Length - 1;                
            }
            else
            {
                // End:0x58
                if(ListIndex >= Playlists.Length)
                {
                    ListIndex = 0;
                }
            }
            // End:0x6A
            if(!ValidIndex(ListIndex))
            {
                return false;
            }            
        }
        else
        {
            return false;
        }
    }
    bDirty = bDirty || ListIndex != CurrentPlaylist;
    Playlists[ListIndex].InitializePlaylist(FileManager);
    CurrentPlaylist = ListIndex;
    // End:0xD2
    if(!bDisableNotification)
    {
        ChangedActivePlaylist(Playlists[ListIndex]);
    }
    return true;
    //return;    
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

    // End:0x49 [Loop If]
    if(ValidName(NewPlaylistName))
    {
        NewPlaylistName = str $ string(i++);
        // [Loop Continue]
        goto J0x22;
    }
    return AppendPlaylist(CreatePlaylist(NewPlaylistName));
    //return;    
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
    // End:0x3D
    if(i == -1)
    {
        i = Playlists.Length;
    }
    Playlists[i] = Playlist;
    bDirty = true;
    return i;
    //return;    
}

function bool RemovePlaylist(string PlaylistName)
{
    local int i;

    i = FindNameIndex(PlaylistName);
    // End:0x2C
    if(i != -1)
    {
        return RemovePlaylistAt(i);
    }
    return false;
    //return;    
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
    //return;    
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
    J0x2B:

    // End:0x52 [Loop If]
    if(ValidName(NewName))
    {
        NewName = str $ string(i++);
        // [Loop Continue]
        goto J0x2B;
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
    // End:0xE2
    if(!bDisableNotification)
    {
        ChangedActivePlaylist(Playlists[Index]);
    }
    return true;
    //return;    
}

function bool AddToPlaylist(int PlaylistIndex, string Path, optional bool bSkipNotification)
{
    // End:0x2D
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
    //return;    
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
        // End:0xAC
        case 0:
            bDisableNotification = true;
            bResult = AddDirectory(PlaylistIndex, InsertPosition, Path, true);
            bDisableNotification = false;
            // End:0xA5
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
            // End:0x10C
            if(bResult && !bSkipNotification)
            {
                Playlists[PlaylistIndex].OnPlaylistChanged();
            }
            return bResult;
        // End:0x150
        case 4:
            return Playlists[PlaylistIndex].InsertSong(InsertPosition, Path, bDisableNotification || bSkipNotification) != -1;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

function bool RemoveFromCurrentPlaylist(string Path, optional bool bSkipNotification)
{
    // End:0x2F
    if(ValidIndex(CurrentPlaylist))
    {
        return Playlists[CurrentPlaylist].RemoveSong(Path, bSkipNotification);
    }
    return false;
    //return;    
}

function bool ClearCurrentPlaylist()
{
    // End:0x12
    if(!ValidIndex(CurrentPlaylist))
    {
        return false;
    }
    return Playlists[CurrentPlaylist].ClearPlaylist();
    //return;    
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
        // End:0x3B
        case "pls":
            return 2;
        // End:0xFFFF
        default:
            return 0;
            break;
    }
    //return;    
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

            // End:0x88 [Loop If]
            if(i >= 0)
            {
                bValue = (AddDirectory(PlaylistIndex, InsertPosition, (Path $ Results[i]) $ GetPathSeparator(), true)) || bValue;
                i--;
                // [Loop Continue]
                goto J0x36;
            }
        }
    }
    Results.Remove(0, Results.Length);
    // End:0x15C
    if(FileManager.GetDirectoryContents(Results, Path, 4))
    {
        // End:0xED
        if(!Playlists[PlaylistIndex].ValidStreamIndex(InsertPosition))
        {
            InsertPosition = Playlists[PlaylistIndex].GetPlaylistLength();
        }
        i = Results.Length - 1;
        J0xFC:

        // End:0x15C [Loop If]
        if(i >= 0)
        {
            bValue = (Playlists[PlaylistIndex].InsertSong(InsertPosition, Path $ Results[i], bDisableNotification) != -1) || bValue;
            i--;
            // [Loop Continue]
            goto J0xFC;
        }
    }
    return bValue;
    //return;    
}

function bool ImportPlaylist(int PlaylistIndex, int InsertPosition, string Path)
{
    local int i;
    local StreamBase.EStreamPlaylistType Type;

    Type = GetPlaylistType(Path);
    i = 0;
    J0x18:

    // End:0x7A [Loop If]
    if(i < Parsers.Length)
    {
        // End:0x70
        if(int(Parsers[i].GetType()) == int(Type))
        {
            return Parsers[i].Import(PlaylistIndex, InsertPosition, Path);
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    return false;
    //return;    
}

function string NextSong(optional bool bForce)
{
    local StreamPlaylist List;
    local Stream S;
    local string str;

    // End:0x1B
    if((GetShuffleAll()) || GetShuffle())
    {
        return GetRandomSong();
    }
    List = GetCurrentPlaylist();
    // End:0x6E
    if(List == none)
    {
        Log("PlaylistManager.NextSong() - no playlists found!", 'MusicPlayer');
        return "";
    }
    // End:0xAA
    if(GetRepeat())
    {
        S = List.GetCurrentStream();
        // End:0xA7
        if(S != none)
        {
            return S.GetPath();
        }        
    }
    else
    {
        str = List.NextSong(bForce || GetRepeat());
        // End:0x11B
        if(((str == "") && GetRepeatAll()) && ActivatePlaylist(CurrentPlaylist + 1))
        {
            str = Playlists[CurrentPlaylist].NextSong(bForce);
        }
        // End:0x12D
        if(str != "")
        {
            return str;
        }
    }
    return "";
    //return;    
}

function string PrevSong(optional bool bForce)
{
    local StreamPlaylist List;
    local Stream S;
    local string str;

    // End:0x1B
    if((GetShuffleAll()) || GetShuffle())
    {
        return GetRandomSong();
    }
    List = GetCurrentPlaylist();
    // End:0x6E
    if(List == none)
    {
        Log("PlaylistManager.PrevSong() - no playlists found!", 'MusicPlayer');
        return "";
    }
    // End:0xAA
    if(GetRepeat())
    {
        S = List.GetCurrentStream();
        // End:0xA7
        if(S != none)
        {
            return S.GetPath();
        }        
    }
    else
    {
        str = List.PrevSong(bForce || GetRepeat());
        // End:0x11B
        if(((str == "") && GetRepeatAll()) && ActivatePlaylist(CurrentPlaylist - 1))
        {
            str = Playlists[CurrentPlaylist].PrevSong(bForce);
        }
        // End:0x12D
        if(str != "")
        {
            return str;
        }
    }
    return "";
    //return;    
}

function string GetRandomSong()
{
    local StreamPlaylist List;

    // End:0x18
    if(GetShuffle())
    {
        List = GetCurrentPlaylist();        
    }
    else
    {
        // End:0x2D
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
    //return;    
}

function int GetCurrentIndex()
{
    // End:0x14
    if(ValidIndex(CurrentPlaylist))
    {
        return CurrentPlaylist;
    }
    return -1;
    //return;    
}

function StreamPlaylist GetCurrentPlaylist()
{
    // End:0x1A
    if(ValidIndex(CurrentPlaylist))
    {
        return Playlists[CurrentPlaylist];
    }
    // End:0x2C
    if(ActivatePlaylist(0))
    {
        return Playlists[0];
    }
    return CreateDefaultPlaylist();
    //return;    
}

function StreamPlaylist GetRandomPlaylist()
{
    local int i, idx;

    // End:0x0E
    if(Playlists.Length == 0)
    {
        return none;
    }
    idx = Rand(Playlists.Length - 1);
    J0x1F:

    // End:0x5B [Loop If]
    if(++i < 10)
    {
        // End:0x47
        if(ActivatePlaylist(idx))
        {
            return Playlists[CurrentPlaylist];
        }
        idx = Rand(Playlists.Length - 1);
        // [Loop Continue]
        goto J0x1F;
    }
    return none;
    //return;    
}

function StreamPlaylist GetPlaylistAt(int idx)
{
    // End:0x12
    if(!ValidIndex(idx))
    {
        return none;
    }
    return Playlists[idx];
    //return;    
}

function int GetPlaylistCount()
{
    return Playlists.Length;
    //return;    
}

function bool ValidIndex(int Index)
{
    return (Index >= 0) && Index < Playlists.Length;
    //return;    
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

    // End:0x58 [Loop If]
    if(i < Playlists.Length)
    {
        // End:0x4E
        if(Playlists[i].GetTitle() ~= PlaylistName)
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

    // End:0x4D [Loop If]
    if(i < Playlists.Length)
    {
        // End:0x43
        if(Playlists[i] == Playlist)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    return -1;
    //return;    
}

function bool ValidName(string test)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x42 [Loop If]
    if(i < Playlists.Length)
    {
        // End:0x38
        if(test ~= Playlists[i].GetTitle())
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function bool GetShuffle()
{
    return bShuffle;
    //return;    
}

function bool GetShuffleAll()
{
    return bShuffleAll;
    //return;    
}

function bool GetRepeat()
{
    return bRepeat;
    //return;    
}

function bool GetRepeatAll()
{
    return bRepeatAll;
    //return;    
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
    //return;    
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
    //return;    
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
    //return;    
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
    //return;    
}

protected function StreamPlaylist CreatePlaylist(string PlaylistName)
{
    local StreamPlaylist List;

    // End:0x0E
    if(PlaylistName == "")
    {
        return none;
    }
    List = new (none, Repl(PlaylistName, " ", Chr(27))) Class'Engine_Decompressed.StreamPlaylist';
    // End:0x61
    if(List != none)
    {
        List.SetTitle(Repl(PlaylistName, Chr(27), " "));
        List.Save();
    }
    return List;
    //return;    
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
        // End:0xA5
        case "activate":
            // End:0x41
            if(Playlists.Length > 0)
            {
                ActivatePlaylist(0);                
            }
            else
            {
                ActivatePlaylist(int(Param));
            }
            Log((("Active Playlist:" $ Playlists[CurrentPlaylist].GetTitle()) @ "Tracks:") $ string(Playlists[CurrentPlaylist].GetPlaylistLength()), 'MusicPlayer');
            // End:0x134
            break;
        // End:0x131
        case "lists":
            Log(" === All existing playlists === ", 'MusicPlayer');
            i = 0;
            J0xDF:

            // End:0x131 [Loop If]
            if(i < Playlists.Length)
            {
                Log(((" Playlist" @ string(i)) @ " '") $ Playlists[i].GetTitle(), 'MusicPlayer');
                i++;
                // [Loop Continue]
                goto J0xDF;
            }
        // End:0xFFFF
        default:
            break;
    }
    i = 0;
    J0x13B:

    // End:0x186 [Loop If]
    if(i < Playlists.Length)
    {
        Result = Playlists[i].HandleDebugExec(Command, Param) || Result;
        i++;
        // [Loop Continue]
        goto J0x13B;
    }
    return Result;
    //return;    
}

function Save()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x36 [Loop If]
    if(i < Playlists.Length)
    {
        Playlists[i].Save();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x43
    if(!bDirty)
    {
        return;
    }
    SaveConfig();
    bDirty = false;
    //return;    
}

function string GetCurrentTitle()
{
    return Playlists[GetCurrentIndex()].GetTitle();
    //return;    
}

defaultproperties
{
    bRepeatAll=true
    DefaultPlaylistName="New Playlist"
    ParserType[0]=(Type=3,ParserClass="Engine.B4SParser")
    ParserType[1]=(Type=1,ParserClass="Engine.M3UParser")
    ParserType[2]=(Type=2,ParserClass="Engine.PLSParser")
}