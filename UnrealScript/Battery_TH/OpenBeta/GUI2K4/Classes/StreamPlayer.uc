class StreamPlayer extends FloatingWindow
    config(User)
    editinlinenew
    instanced;

enum epbWinMode
{
    MODE_Compact,                   // 0
    MODE_PlayList,                  // 1
    MODE_Manager                    // 2
};

var() automated GUIImage Bk1;
var() automated GUIImage bk2;
var() automated GUISectionBackground sb_PlayList;
var() automated GUISectionBackground sb_Management;
var() automated GUIScrollTextBox lb_SongInfo;
var() automated GUILabel l_Time;
var() automated GUIListBox lb_Playlist;
var() automated GUIListBox lb_AllPlaylists;
var() automated GUIButton b_BotA;
var() automated GUIButton b_BotB;
var() automated GUIButton b_BotC;
var() automated GUISlider sl_Volume;
var() automated GUIGFXButton b_Play;
var() automated GUIGFXButton b_Stop;
var() automated GUIGFXButton b_NextTrack;
var() automated GUIGFXButton b_PrevTrack;
var() automated GUIGFXButton b_Playlist;
var() automated GUIGFXButton b_Management;
var() automated GUICheckBoxButton ch_Shuffle;
var() automated GUICheckBoxButton ch_ShuffleAll;
var() automated GUICheckBoxButton ch_Repeat;
var() automated GUICheckBoxButton ch_RepeatAll;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUIList li_Playlist;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUIList li_AllLists;
var() editconst noexport editinline StreamInteraction Handler;
var() editconst noexport editinline StreamPlaylistManager PlaylistManager;
var() editconst noexport editinline StreamPlaylist CurrentPlaylist;
var() config string OptionsMenu;
var() config string ID3TagEditorMenu;
var() config string PlaylistEditorMenu;
var() config float ExpandedHeight;
var() float ConstrictedHeight;
var() editconst noexport int SongSeconds;
var() Material PauseImage;
var() Material PlayImage;
var() Material OpenFolder;
var() Material ClosedFolder;
var() localized string CollapsePlaylistHint;
var() localized string ExpandPlaylistHint;
var() localized string PlayHint;
var() localized string PauseHint;
var() localized string CollapseManagementHint;
var() localized string ExpandManagementHint;
var() localized string RenameCaption;
var() localized string NewCaption;
var() localized string PlaylistNameCaption;
var() localized string PLAdd;
var() localized string PLRemove;
var() localized string PLClear;
var() localized string MGNew;
var() localized string MGRemove;
var() localized string MGRename;
var() int DebugIndex;
var() bool bExpand;
var() bool bConstrict;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUIContextMenu cm_Playlist;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUIContextMenu cm_AllLists;
var() StreamPlayer.epbWinMode WindowMode;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    li_Playlist = lb_Playlist.List;
    li_Playlist.TextAlign = 0;
    li_Playlist.__OnDblClick__Delegate = PlaylistDblClick;
    li_Playlist.__OnChange__Delegate = InternalOnChange;
    li_Playlist.bMultiSelect = true;
    li_Playlist.bDropSource = true;
    li_Playlist.bDropTarget = true;
    li_Playlist.__OnDragDrop__Delegate = PlaylistReceiveDrop;
    li_Playlist.__OnEndDrag__Delegate = PlaylistDragEnded;
    li_Playlist.ContextMenu = cm_Playlist;
    li_AllLists = lb_AllPlaylists.List;
    li_AllLists.TextAlign = 0;
    li_AllLists.__OnDblClick__Delegate = PlaylistDblClick;
    li_AllLists.__OnChange__Delegate = InternalOnChange;
    li_AllLists.bMultiSelect = false;
    li_AllLists.bDropTarget = true;
    li_AllLists.bInitializeList = false;
    li_AllLists.ContextMenu = cm_AllLists;
    li_AllLists.__OnDragDrop__Delegate = AllListsReceiveDrop;
    sl_Volume.__OnPreDrawCaption__Delegate = SliderPreDrawCaption;
    sb_PlayList.ManageComponent(lb_Playlist);
    sb_Management.ManageComponent(lb_AllPlaylists);
    //return;    
}

function ResolutionChanged(int ResX, int ResY)
{
    // End:0x16
    if(int(WindowMode) == int(0))
    {
        Constrict();
    }
    super.ResolutionChanged(ResX, ResY);
    //return;    
}

event Opened(GUIComponent Sender)
{
    super(PopupPageBase).Opened(Sender);
    Constrict();
    // End:0x3E
    if(!SetPlaylistManager())
    {
        Warn("Error setting PlaylistManager!");
    }
    sl_Volume.SetValue(float(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice MusicVolume")));
    RefreshPlaylistSelections();
    RefreshCurrentPlaylist();
    RefreshPlaybackOptions();
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    local int i;

    i = Controller.FindMenuIndexByName(PlaylistEditorMenu);
    // End:0x52
    if(Controller.bCurMenuInitialized && i != -1)
    {
        Controller.RemoveMenuAt(i, true);
    }
    super(GUIPage).Closed(Sender, bCancelled);
    PlaylistManager.Save();
    HideAll();
    //return;    
}

function SaveCurrentPosition()
{
    // End:0x1B
    if(int(WindowMode) != int(0))
    {
        ExpandedHeight = WinHeight;
    }
    DefaultLeft = WinLeft;
    DefaultTop = WinTop;
    DefaultWidth = WinWidth;
    // End:0x62
    if(Controller.ResX <= 640)
    {
        DefaultHeight = 0.3200000;        
    }
    else
    {
        DefaultHeight = 0.2700000;
    }
    SaveConfig();
    //return;    
}

function bool SetHandler()
{
    local int i;

    // End:0x23
    if((Controller == none) || Controller.ViewportOwner == none)
    {
        return false;
    }
    i = 0;
    J0x2A:

    // End:0xE4 [Loop If]
    if(i < Controller.ViewportOwner.LocalInteractions.Length)
    {
        // End:0xDA
        if(StreamInteraction(Controller.ViewportOwner.LocalInteractions[i]) != none)
        {
            Handler = StreamInteraction(Controller.ViewportOwner.LocalInteractions[i]);
            Handler.__OnStreamChanged__Delegate = HandleStreamChange;
            Handler.__OnStreamingStopped__Delegate = HandleStreamStop;
            Handler.__OnAdjustVolume__Delegate = HandleAdjustVolume;
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x2A;
    }
    Log("StreamPlayer.SetHandler() - no StreamInteractions found!", 'MusicPlayer');
    return false;
    //return;    
}

function bool SetPlaylistManager()
{
    // End:0x27
    if(PlaylistManager != none)
    {
        // End:0x25
        if((Handler == none) && !SetHandler())
        {
            return false;
        }
        return true;
    }
    // End:0x41
    if((Handler == none) && !SetHandler())
    {
        return false;
    }
    PlaylistManager = Handler.PlaylistManager;
    PlaylistManager.__ChangedActivePlaylist__Delegate = ActivePlaylistChanged;
    return PlaylistManager != none;
    //return;    
}

function RefreshPlaybackOptions()
{
    sl_Volume.SetValue(Handler.GetStreamVolume());
    ch_Shuffle.bChecked = PlaylistManager.GetShuffle();
    ch_ShuffleAll.bChecked = PlaylistManager.GetShuffleAll();
    ch_Repeat.bChecked = PlaylistManager.GetRepeat();
    ch_RepeatAll.bChecked = PlaylistManager.GetRepeatAll();
    //return;    
}

function RefreshPlaylistSelections()
{
    local StreamPlaylist List;
    local int i;
    local string str;

    // End:0x0D
    if(PlaylistManager == none)
    {
        return;
    }
    str = li_AllLists.Get();
    li_AllLists.Clear();
    i = 0;
    J0x38:

    // End:0x98 [Loop If]
    if(i < PlaylistManager.GetPlaylistCount())
    {
        List = PlaylistManager.GetPlaylistAt(i);
        li_AllLists.Add(List.GetTitle(), List);
        i++;
        // [Loop Continue]
        goto J0x38;
    }
    i = li_AllLists.FindIndex(str);
    // End:0xE8
    if((i == -1) && CurrentPlaylist != none)
    {
        i = PlaylistManager.FindPlaylistIndex(CurrentPlaylist);
    }
    li_AllLists.SilentSetIndex(i);
    //return;    
}

function ActivePlaylistChanged(StreamPlaylist NewList)
{
    RefreshCurrentPlaylist();
    // End:0x1C
    if(int(WindowMode) == int(2))
    {
        ShowPlayList();
    }
    //return;    
}

function RefreshCurrentPlaylist()
{
    // End:0x1F
    if(CurrentPlaylist != none)
    {
        CurrentPlaylist.__OnPlaylistChanged__Delegate = None;
    }
    CurrentPlaylist = PlaylistManager.GetCurrentPlaylist();
    // End:0x5F
    if(CurrentPlaylist == none)
    {
        Warn("Invalid playlist selected!");
        return;
    }
    LoadCurrentPlaylist();
    li_Playlist.SetIndex(li_Playlist.FindIndex("",,, CurrentPlaylist.GetCurrentStream()));
    li_AllLists.SilentSetIndex(li_AllLists.FindIndex("",,, CurrentPlaylist));
    //return;    
}

function LoadCurrentPlaylist()
{
    local int i;
    local array<Stream> Songs;

    li_Playlist.Clear();
    // End:0x1C
    if(CurrentPlaylist == none)
    {
        return;
    }
    CurrentPlaylist.GetSongs(Songs);
    i = 0;
    J0x37:

    // End:0x95 [Loop If]
    if(i < Songs.Length)
    {
        li_Playlist.Add(Songs[i].GetSongTitle(), Songs[i], Songs[i].GetPath());
        i++;
        // [Loop Continue]
        goto J0x37;
    }
    CurrentPlaylist.__OnPlaylistChanged__Delegate = HandlePlaylistChange;
    //return;    
}

function HandlePlaylistChange()
{
    LoadCurrentPlaylist();
    PlaylistManager.Save();
    //return;    
}

function HandleStreamChange(string NewStreamFileName)
{
    local Stream S;
    local int i;

    i = CurrentPlaylist.FindIndexByName(NewStreamFileName);
    S = CurrentPlaylist.GetStreamAt(i);
    ResetSongCounter();
    // End:0x5C
    if(S != none)
    {
        CurrentPlaylist.SetCurrent(i);        
    }
    else
    {
        li_Playlist.SetIndex(-1);
        S = Handler.FileManager.CreateStream(NewStreamFileName);
    }
    ReadStream(S);
    PlaylistManager.Save();
    //return;    
}

function HandleStreamStop()
{
    UpdateSongTimeDisplay();
    UpdatePlayButton();
    li_Playlist.SetIndex(-1);
    DisableComponent(b_Stop);
    PlaylistManager.Save();
    //return;    
}

function HandleAdjustVolume(float NewVolume)
{
    sl_Volume.SetValue(NewVolume);
    //return;    
}

function bool InternalOnClick(GUIComponent C)
{
    local Stream obj;

    switch(C)
    {
        // End:0x9E
        case b_Play:
            // End:0x4F
            if(!li_Playlist.IsValid() && !Handler.IsPlaying())
            {
                li_Playlist.SilentSetIndex(0);
                Play();
            }
            obj = Stream(li_Playlist.GetObject());
            // End:0x96
            if((obj == none) || obj != Handler.CurrentStreamAttachment)
            {
                Play();
                return true;
            }
            PauseCurrent();
            return true;
        // End:0xAE
        case b_Stop:
            StopCurrent();
            return true;
        // End:0xBE
        case b_NextTrack:
            NextTrack();
            return true;
        // End:0xCE
        case b_PrevTrack:
            PrevTrack();
            return true;
        // End:0xDE
        case b_Playlist:
            TogglePlaylist();
            return true;
        // End:0xEE
        case b_Management:
            ToggleManagement();
            return true;
        // End:0x145
        case b_BotA:
            // End:0x12D
            if(int(WindowMode) == int(1))
            {
                return Controller.OpenMenu(PlaylistEditorMenu, CurrentPlaylist.GetTitle());                
            }
            else
            {
                // End:0x143
                if(int(WindowMode) == int(2))
                {
                    NewPlaylist();
                }
            }
            return true;
        // End:0x17E
        case b_BotB:
            // End:0x166
            if(int(WindowMode) == int(1))
            {
                CurrentListRemove();                
            }
            else
            {
                // End:0x17C
                if(int(WindowMode) == int(2))
                {
                    RemovePlaylist();
                }
            }
            return true;
        // End:0x1B5
        case b_BotC:
            // End:0x19F
            if(int(WindowMode) == int(1))
            {
                CurrentListClear();                
            }
            else
            {
                // End:0x1B5
                if(int(WindowMode) == int(2))
                {
                    RenamePlaylist();
                }
            }
        // End:0xFFFF
        default:
            return true;
            break;
    }
    //return;    
}

function int GetPlaylistManagerIndex(int ListIndex)
{
    // End:0x1E
    if((PlaylistManager == none) || li_AllLists == none)
    {
        return -1;
    }
    // End:0x4B
    if(!li_AllLists.IsValidIndex(ListIndex))
    {
        ListIndex = li_AllLists.Index;
    }
    return PlaylistManager.FindNameIndex(li_AllLists.GetItemAtIndex(ListIndex));
    //return;    
}

function InternalOnChange(GUIComponent C)
{
    switch(C)
    {
        // End:0xAE
        case sl_Volume:
            Handler.SetMusicVolume(sl_Volume.Value);
            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice MusicVolume" @ string(sl_Volume.Value));
            PlayerOwner().ConsoleCommand("SetMusicVolume" @ string(sl_Volume.Value));
            // End:0x21E
            break;
        // End:0xF6
        case ch_Shuffle:
            PlaylistManager.SetShuffle(ch_Shuffle.bChecked);
            ch_ShuffleAll.bChecked = PlaylistManager.GetShuffleAll();
            // End:0x21E
            break;
        // End:0x13E
        case ch_ShuffleAll:
            PlaylistManager.SetShuffleAll(ch_ShuffleAll.bChecked);
            ch_Shuffle.bChecked = PlaylistManager.GetShuffle();
            // End:0x21E
            break;
        // End:0x186
        case ch_Repeat:
            PlaylistManager.SetRepeat(ch_Repeat.bChecked);
            ch_RepeatAll.bChecked = PlaylistManager.GetRepeatAll();
            // End:0x21E
            break;
        // End:0x1CE
        case ch_RepeatAll:
            PlaylistManager.SetRepeatAll(ch_RepeatAll.bChecked);
            ch_Repeat.bChecked = PlaylistManager.GetRepeat();
            // End:0x21E
            break;
        // End:0x21B
        case li_Playlist:
            // End:0x218
            if(!Handler.IsPlaying() && li_Playlist.IsValid())
            {
                ReadTagInfo(Stream(li_Playlist.GetObject()));
            }
            // End:0x21E
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function bool SliderPreDrawCaption(out float X, out float Y, out float XL, out float YL, out GUI.eTextAlign Justification)
{
    return true;
    //return;    
}

function bool AllListsReceiveDrop(GUIComponent Sender)
{
    local int i, idx;
    local array<GUIListElem> Elems;
    local array<string> items;
    local Stream str;
    local StreamPlaylist List;

    // End:0xFB
    if(Controller.DropSource == li_Playlist)
    {
        List = PlaylistManager.GetPlaylistAt(GetPlaylistManagerIndex(li_AllLists.DropIndex));
        // End:0x5F
        if((List == none) || List == CurrentPlaylist)
        {
            return false;
        }
        List.InitializePlaylist(Handler.FileManager);
        Elems = li_Playlist.GetPendingElements(true);
        i = Elems.Length - 1;
        J0xA1:

        // End:0xF6 [Loop If]
        if(i >= 0)
        {
            str = Stream(Elems[i].ExtraData);
            // End:0xEC
            if(str != none)
            {
                List.AddStream(-1, str, true);
            }
            i--;
            // [Loop Continue]
            goto J0xA1;
        }
        return true;        
    }
    else
    {
        // End:0x1CA
        if(DirectoryTreeList(Controller.DropSource) != none)
        {
            items = DirectoryTreeList(Controller.DropSource).GetPendingItems();
            idx = GetPlaylistManagerIndex(li_AllLists.DropIndex);
            List = PlaylistManager.GetPlaylistAt(idx);
            // End:0x178
            if(List == none)
            {
                return false;
            }
            i = items.Length - 1;
            J0x187:

            // End:0x1C8 [Loop If]
            if(i >= 0)
            {
                PlaylistManager.InsertInPlaylist(idx, -1, items[i], i > 0);
                i--;
                // [Loop Continue]
                goto J0x187;
            }
            return true;
        }
    }
    return false;
    //return;    
}

function bool PlaylistReceiveDrop(GUIComponent Sender)
{
    local array<string> items;
    local int i, idx;

    // End:0x130
    if(Sender == li_Playlist)
    {
        // End:0x42
        if((Controller.DropSource != li_AllLists) && li_Playlist.InternalOnDragDrop(Sender))
        {
            return true;
        }
        // End:0x130
        if(DirectoryTreeList(Controller.DropSource) != none)
        {
            items = DirectoryTreeList(Controller.DropSource).GetPendingItems();
            idx = li_Playlist.DropIndex;
            // End:0xC0
            if(!li_Playlist.IsValidIndex(idx))
            {
                idx = li_Playlist.Elements.Length;
            }
            i = items.Length - 1;
            J0xCF:

            // End:0x11A [Loop If]
            if(i >= 0)
            {
                PlaylistManager.InsertInPlaylist(PlaylistManager.GetCurrentIndex(), idx, items[i], i > 0);
                i--;
                // [Loop Continue]
                goto J0xCF;
            }
            li_Playlist.SetIndex(idx);
            return true;
        }
    }
    return false;
    //return;    
}

function PlaylistDragEnded(GUIComponent Accepting, bool bAccepted)
{
    local int i;
    local array<Stream> Streams;

    li_Playlist.InternalOnEndDrag(Accepting, bAccepted);
    // End:0xC8
    if(bAccepted)
    {
        // End:0xC8
        if(Accepting == li_Playlist)
        {
            Streams.Length = li_Playlist.Elements.Length;
            i = 0;
            J0x4F:

            // End:0x97 [Loop If]
            if(i < li_Playlist.Elements.Length)
            {
                Streams[i] = Stream(li_Playlist.GetObjectAtIndex(i));
                i++;
                // [Loop Continue]
                goto J0x4F;
            }
            CurrentPlaylist.InitializePlaylist(Handler.FileManager);
            CurrentPlaylist.SetSongs(Streams);
        }
    }
    //return;    
}

function Play()
{
    Handler.PlaySong(li_Playlist.GetExtra(), 0.0000000);
    UpdatePlayButton();
    //return;    
}

function StopCurrent()
{
    Handler.StopSong();
    UpdatePlayButton();
    //return;    
}

function NextTrack()
{
    Handler.NextSong();
    UpdatePlayButton();
    //return;    
}

function PrevTrack()
{
    Handler.PrevSong();
    //return;    
}

function PauseCurrent()
{
    // End:0x1D
    if(!Handler.IsPlaying())
    {
        Play();        
    }
    else
    {
        Handler.PauseSong();
        UpdatePlayButton();
    }
    //return;    
}

function bool PlaylistDblClick(GUIComponent C)
{
    local int i;

    // End:0x1A
    if(C == li_Playlist)
    {
        Play();
        return true;        
    }
    else
    {
        // End:0x68
        if(C == li_AllLists)
        {
            i = PlaylistManager.FindPlaylistIndex(StreamPlaylist(li_AllLists.GetObject()));
            PlaylistManager.ActivatePlaylist(i);
            return true;
        }
    }
    return false;
    //return;    
}

function ReadTagInfo(Stream StreamObj)
{
    local string TagText;
    local StreamTag sTag;

    sTag = StreamObj.GetTag();
    TagText = StreamObj.GetSongTitle();
    // End:0x9D
    if(sTag != none)
    {
        // End:0x4D
        if(TagText != "")
        {
            TagText $= "|";
        }
        TagText $= sTag.Artist.FieldValue;
        // End:0x81
        if(TagText != "")
        {
            TagText $= "|";
        }
        TagText $= sTag.Album.FieldValue;
    }
    lb_SongInfo.SetContent(TagText);
    //return;    
}

function ReadStream(Stream StreamObj)
{
    // End:0x40
    if(StreamObj == none)
    {
        Log("ReadStream() called with StreamObj == None", 'MusicPlayer');
        return;
    }
    ReadTagInfo(StreamObj);
    EnableComponent(b_Stop);
    li_Playlist.SilentSetIndex(li_Playlist.FindIndex("",,, StreamObj));
    Handler.SetStreamAttachment(StreamObj);
    //return;    
}

function ReadStreamAt(int Index)
{
    local Stream StreamObj;

    StreamObj = Stream(lb_Playlist.List.GetObjectAtIndex(Index));
    // End:0x7A
    if(StreamObj == none)
    {
        Log("ReadStreamInfo couldn't find stream object at index" @ string(Index), 'MusicPlayer');
        return;
    }
    ReadStream(StreamObj);
    //return;    
}

event Timer()
{
    // End:0x11
    if(Handler != none)
    {
        UpdateSongTimeDisplay();
    }
    //return;    
}

function ResetSongCounter(optional bool bNoRestart)
{
    SongSeconds = 0;
    // End:0x16
    if(bNoRestart)
    {
        KillTimer();        
    }
    else
    {
        SetTimer(1.0000000, true);
    }
    Timer();
    //return;    
}

protected function UpdateSongTimeDisplay()
{
    SongSeconds = int(Handler.GetStreamPosition());
    l_Time.Caption = Class'Engine.StreamBase'.static.FormatTimeDisplay(float(SongSeconds));
    //return;    
}

function UpdatePlayButton()
{
    // End:0x0D
    if(Handler == none)
    {
        return;
    }
    // End:0x60
    if(Handler.IsPlaying() && !Handler.IsPaused())
    {
        b_Play.Graphic = PauseImage;
        b_Play.SetHint(PauseHint);        
    }
    else
    {
        b_Play.SetHint(PlayHint);
        b_Play.Graphic = PlayImage;
    }
    //return;    
}

function PlayerMenuClick(GUIContextMenu Menu, int Index)
{
    // End:0x28
    if((Index < 0) || Index >= Menu.ContextItems.Length)
    {
        return;
    }
    // End:0x46
    if(Menu.ContextItems[Index] == "-")
    {
        return;
    }
    switch(Index)
    {
        // End:0x67
        case 0:
            Controller.OpenMenu(OptionsMenu);
            return;
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

function RemovePlaylist()
{
    PlaylistManager.RemovePlaylist(li_AllLists.Get());
    RefreshPlaylistSelections();
    //return;    
}

function CurrentListClear()
{
    PlaylistManager.ClearCurrentPlaylist();
    LoadCurrentPlaylist();
    //return;    
}

function PlaylistMenuClick(GUIContextMenu Menu, int Index)
{
    local int i;

    // End:0x28
    if((Index < 0) || Index >= Menu.ContextItems.Length)
    {
        return;
    }
    // End:0x46
    if(Menu.ContextItems[Index] == "-")
    {
        return;
    }
    switch(Index)
    {
        // End:0x91
        case 0:
            i = PlaylistManager.FindPlaylistIndex(StreamPlaylist(li_AllLists.GetObject()));
            PlaylistManager.ActivatePlaylist(i);
            // End:0xCB
            break;
        // End:0x9E
        case 1:
            RenamePlaylist();
            // End:0xCB
            break;
        // End:0xAC
        case 2:
            NewPlaylist();
            // End:0xCB
            break;
        // End:0xBA
        case 4:
            RemovePlaylist();
            // End:0xCB
            break;
        // End:0xC8
        case 5:
            CurrentListClear();
            // End:0xCB
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function CurrentListRemove()
{
    local array<GUIListElem> Paths;
    local int i;

    Paths = li_Playlist.GetPendingElements(true);
    i = 0;
    J0x1D:

    // End:0x66 [Loop If]
    if(i < Paths.Length)
    {
        PlaylistManager.RemoveFromCurrentPlaylist(Paths[i].ExtraStrData, i < (Paths.Length - 1));
        i++;
        // [Loop Continue]
        goto J0x1D;
    }
    //return;    
}

function SongMenuClick(GUIContextMenu Menu, int Index)
{
    // End:0x28
    if((Index < 0) || Index >= Menu.ContextItems.Length)
    {
        return;
    }
    // End:0x46
    if(Menu.ContextItems[Index] == "-")
    {
        return;
    }
    switch(Index)
    {
        // End:0x5A
        case 0:
            Play();
            // End:0x94
            break;
        // End:0x75
        case 1:
            Controller.OpenMenu(PlaylistEditorMenu);
            // End:0x94
            break;
        // End:0x83
        case 3:
            CurrentListRemove();
            // End:0x94
            break;
        // End:0x91
        case 4:
            CurrentListClear();
            // End:0x94
            break;
        // End:0xFFFF
        default:
            break;
    }
    li_Playlist.ClearPendingElements();
    //return;    
}

function NewPlaylist()
{
    // End:0x47
    if(Controller.OpenMenu(Controller.RequestDataMenu, NewCaption, PlaylistNameCaption))
    {
        Controller.ActivePage.__OnClose__Delegate = NewPlaylistClosed;
    }
    //return;    
}

function RenamePlaylist()
{
    // End:0x6E
    if(Controller.OpenMenu(Controller.RequestDataMenu, RenameCaption, PlaylistNameCaption))
    {
        Controller.ActivePage.SetDataString(li_AllLists.Get());
        Controller.ActivePage.__OnClose__Delegate = RenameClosed;
    }
    //return;    
}

function NewPlaylistClosed(bool bCancelled)
{
    local string PlaylistName;

    // End:0x56
    if(!bCancelled)
    {
        PlaylistName = Controller.ActivePage.GetDataString();
        // End:0x56
        if(PlaylistManager.ActivatePlaylist(PlaylistManager.AddPlaylist(PlaylistName), true))
        {
            RefreshPlaylistSelections();
        }
    }
    //return;    
}

function RenameClosed(bool bCancelled)
{
    local string PlaylistName;

    // End:0x51
    if(!bCancelled)
    {
        PlaylistName = Controller.ActivePage.GetDataString();
        // End:0x51
        if(PlaylistManager.RenamePlaylist(GetPlaylistManagerIndex(-1), PlaylistName))
        {
            RefreshPlaylistSelections();
        }
    }
    //return;    
}

event SetVisibility(bool bIsVisible)
{
    local int i;

    // End:0x19
    if(!bIsVisible)
    {
        super(GUIMultiComponent).SetVisibility(bIsVisible);
        return;
    }
    super(GUIComponent).SetVisibility(bIsVisible);
    // End:0x32
    if(!PropagateVisibility)
    {
        return;
    }
    i = 0;
    J0x39:

    // End:0xBC [Loop If]
    if(i < Controls.Length)
    {
        // End:0x9C
        if(((Controls[i] == sb_PlayList) && int(WindowMode) != int(1)) || (Controls[i] == sb_Management) && int(WindowMode) != int(2))
        {
            // [Explicit Continue]
            goto J0xB2;
        }
        Controls[i].SetVisibility(true);
        J0xB2:

        i++;
        // [Loop Continue]
        goto J0x39;
    }
    //return;    
}

function Expand()
{
    bResizeHeightAllowed = true;
    // End:0x29
    if(ExpandedHeight < WinHeight)
    {
        ExpandedHeight = WinHeight + 0.1000000;
    }
    WinHeight = RelativeHeight(ExpandedHeight);
    MinPageHeight = 0.4000000;
    CheckBounds();
    //return;    
}

function Constrict()
{
    bResizeHeightAllowed = false;
    WindowMode = 0;
    // End:0x41
    if(Controller.ResX <= 640)
    {
        MinPageHeight = 0.3200000;
        WinHeight = 0.3200000;        
    }
    else
    {
        MinPageHeight = 0.2700000;
        WinHeight = 0.2700000;
    }
    //return;    
}

function HideAll()
{
    Constrict();
    sb_PlayList.SetVisibility(false);
    sb_Management.SetVisibility(false);
    b_BotA.SetVisibility(false);
    b_BotB.SetVisibility(false);
    b_BotC.SetVisibility(false);
    //return;    
}

function TogglePlaylist()
{
    // End:0x19
    if(int(WindowMode) != int(1))
    {
        ShowPlayList();        
    }
    else
    {
        HidePlayList();
    }
    //return;    
}

function ShowPlayList()
{
    // End:0x16
    if(int(WindowMode) == int(0))
    {
        Expand();
    }
    sb_PlayList.Caption = PlaylistManager.GetCurrentTitle();
    b_BotA.SetVisibility(true);
    b_BotA.Caption = PLAdd;
    b_BotB.SetVisibility(true);
    b_BotB.Caption = PLRemove;
    b_BotC.SetVisibility(true);
    b_BotC.Caption = PLClear;
    sb_PlayList.SetVisibility(true);
    sb_Management.SetVisibility(false);
    WindowMode = 1;
    b_Playlist.Graphic = OpenFolder;
    //return;    
}

function HidePlayList()
{
    Constrict();
    b_BotA.SetVisibility(false);
    b_BotB.SetVisibility(false);
    b_BotC.SetVisibility(false);
    sb_PlayList.SetVisibility(false);
    b_Playlist.Graphic = ClosedFolder;
    //return;    
}

function ToggleManagement()
{
    // End:0x19
    if(int(WindowMode) != int(2))
    {
        ShowManagement();        
    }
    else
    {
        HideManagement();
    }
    return;
    //return;    
}

function ShowManagement()
{
    // End:0x16
    if(int(WindowMode) == int(0))
    {
        Expand();
    }
    b_BotA.SetVisibility(true);
    b_BotA.Caption = MGNew;
    b_BotB.SetVisibility(true);
    b_BotB.Caption = MGRemove;
    b_BotC.SetVisibility(true);
    b_BotC.Caption = MGRename;
    sb_PlayList.SetVisibility(false);
    sb_Management.SetVisibility(true);
    WindowMode = 2;
    b_Playlist.Graphic = ClosedFolder;
    //return;    
}

function HideManagement()
{
    Constrict();
    b_BotA.SetVisibility(false);
    b_BotB.SetVisibility(false);
    b_BotC.SetVisibility(false);
    sb_Management.SetVisibility(false);
    //return;    
}

function ManageDragOver(GUIComponent Sender)
{
    // End:0x0B
    if(bAnimating)
    {
        return;
    }
    // End:0x35
    if((Sender == b_Management) && int(WindowMode) != int(2))
    {
        ShowManagement();        
    }
    else
    {
        // End:0x5C
        if((Sender == b_Playlist) && int(WindowMode) != int(1))
        {
            ShowPlayList();
        }
    }
    //return;    
}

function bool FloatingPreDraw(Canvas C)
{
    local float X, Y, XL, YL, BK1L, BK1T,
	    BK1W, BK1H, L, t, W,
	    H, BL, bt, BW, bh,
	    bs;

    local bool B;

    // End:0x0F
    if(bInit)
    {
        Constrict();
    }
    B = super.FloatingPreDraw(C);
    t = t_WindowTitle.ActualTop() + t_WindowTitle.ActualHeight();
    L = ActualLeft();
    W = ActualWidth();
    l_Time.Style.TextSize(C, MenuState, "100:00", XL, YL, l_Time.FontScale);
    H = YL * float(3);
    X = (L + W) - (float(C.SizeX) * 0.0100000);
    Y = t + (float(C.SizeY) * 0.0100000);
    Bk1.WinTop = Bk1.RelativeTop(Y);
    Bk1.WinHeight = Bk1.RelativeHeight(3.0000000 * YL);
    Bk1.WinWidth = Bk1.RelativeWidth(XL + (XL * 0.3200000));
    Bk1.WinLeft = Bk1.RelativeLeft(X - Bk1.ActualWidth());
    BK1T = Bk1.ActualTop();
    BK1W = Bk1.ActualWidth();
    BK1H = Bk1.ActualHeight();
    BK1L = Bk1.ActualLeft();
    l_Time.SetPosition(BK1L, BK1T, BK1W, BK1H, true);
    X = BK1L - (float(C.SizeX) * 0.0100000);
    lb_SongInfo.WinTop = lb_SongInfo.RelativeTop(Y - (float(C.SizeY) * 0.0100000));
    lb_SongInfo.WinLeft = lb_SongInfo.RelativeLeft(L + (float(C.SizeX) * 0.0200000));
    lb_SongInfo.WinWidth = lb_SongInfo.RelativeWidth(X - lb_SongInfo.ActualLeft());
    bh = ActualHeight(ch_Shuffle.StandardHeight);
    BW = bh;
    bt = (BK1T + BK1H) - bh;
    bs = float(C.SizeX) * 0.0100000;
    BL = X - BW;
    MoveButton(ch_ShuffleAll, BL, bt, BW, bh, bs);
    MoveButton(ch_Shuffle, BL, bt, BW, bh, bs);
    MoveButton(ch_RepeatAll, BL, bt, BW, bh, bs);
    MoveButton(ch_Repeat, BL, bt, BW, bh, bs);
    MoveButton(b_NextTrack, BL, bt, BW, bh, bs);
    MoveButton(b_Play, BL, bt, BW, bh, bs);
    MoveButton(b_Stop, BL, bt, BW, bh, bs);
    MoveButton(b_PrevTrack, BL, bt, BW, bh, bs);
    sl_Volume.WinLeft = sl_Volume.RelativeLeft(lb_SongInfo.ActualLeft());
    sl_Volume.WinTop = sl_Volume.RelativeTop(bt);
    sl_Volume.WinHeight = sl_Volume.RelativeHeight(bh);
    sl_Volume.WinWidth = sl_Volume.RelativeWidth(BL - sl_Volume.ActualLeft());
    lb_SongInfo.WinHeight = lb_SongInfo.RelativeHeight((sl_Volume.ActualTop() - (float(C.SizeY) * 0.0100000)) - lb_SongInfo.ActualTop());
    t = (sl_Volume.ActualTop() + sl_Volume.ActualHeight()) + (float(C.SizeY) * 0.0100000);
    L = sl_Volume.ActualLeft();
    b_Playlist.SetPosition(L, t, BW, bh, true);
    b_Management.SetPosition((L + BW) + bs, t, BW, bh, true);
    L = (L + (BW * float(2))) + (bs * float(2));
    bt = t + (bh * 0.3200000);
    bk2.WinLeft = bk2.RelativeLeft(L);
    bk2.WinTop = bk2.RelativeTop(bt);
    bk2.WinHeight = bk2.RelativeHeight(bh * 0.5000000);
    bk2.WinWidth = bk2.RelativeWidth(((BK1L + BK1W) - BW) - bk2.ActualLeft());
    L = ActualLeft();
    W = ActualWidth();
    t = bt + (bh * 1.5000000);
    // End:0x7C8
    if(int(WindowMode) == int(1))
    {
        sb_PlayList.WinLeft = sb_PlayList.RelativeLeft(L);
        sb_PlayList.WinWidth = sb_PlayList.RelativeWidth(W);
        sb_PlayList.WinTop = sb_PlayList.RelativeTop(t);
        sb_PlayList.WinHeight = sb_PlayList.RelativeHeight((ActualTop() + ActualHeight()) - t);
        t = (t + sb_PlayList.ActualHeight()) - float(32);
        SetBottomButtons(C, sb_PlayList.ActualLeft(), t, sb_PlayList.ActualWidth(), 32.0000000);
    }
    // End:0x8AE
    if(int(WindowMode) == int(2))
    {
        sb_Management.WinLeft = sb_Management.RelativeLeft(L);
        sb_Management.WinWidth = sb_Management.RelativeWidth(W);
        sb_Management.WinTop = sb_Management.RelativeTop(t);
        sb_Management.WinHeight = sb_Management.RelativeHeight((ActualTop() + ActualHeight()) - t);
        t = (t + sb_Management.ActualHeight()) - float(32);
        SetBottomButtons(C, sb_Management.ActualLeft(), t, sb_Management.ActualWidth(), 32.0000000);
    }
    return B;
    //return;    
}

function MoveButton(GUIButton B, out float L, float t, float W, float H, float S)
{
    B.SetPosition(L, t, W, H, true);
    L -= (W + S);
    //return;    
}

function SetBottomButtons(Canvas C, float Left, float Top, float Width, float Height)
{
    local int i;
    local float xsize, XL, YL, S;
    local export editinline GUIButton B;

    S = float(Controller.ResX) * 0.0100000;
    i = 0;
    J0x24:

    // End:0x105 [Loop If]
    if(i < Controls.Length)
    {
        // End:0xFB
        if(Controls[i].Tag > 0)
        {
            B = GUIButton(Controls[i]);
            B.Style.TextSize(C, B.MenuState, B.Caption, XL, YL, B.FontScale);
            xsize += (XL + S);
            Controls[i].WinWidth = Controls[i].RelativeWidth(XL + S);
        }
        i++;
        // [Loop Continue]
        goto J0x24;
    }
    Left = (Left + (Width / float(2))) - (xsize / float(2));
    i = 0;
    J0x131:

    // End:0x202 [Loop If]
    if(i < Controls.Length)
    {
        // End:0x1F8
        if(Controls[i].Tag > 0)
        {
            Controls[i].WinTop = Controls[i].RelativeTop(Top);
            Controls[i].WinLeft = Controls[i].RelativeLeft(Left);
            Controls[i].WinHeight = Controls[i].RelativeHeight(Height);
            Left += Controls[i].ActualWidth();
        }
        i++;
        // [Loop Continue]
        goto J0x131;
    }
    //return;    
}

function ResizedBoth()
{
    ExpandedHeight = RelativeHeight();
    super.ResizedBoth();
    //return;    
}

function ResizedHeight()
{
    ExpandedHeight = RelativeHeight();
    super.ResizedHeight();
    //return;    
}

defaultproperties
{
    // Reference: GUIImage'GUI2K4_Decompressed.StreamPlayer.Img1'
    begin object name="Img1" class=XInterface.GUIImage
        ImageStyle=1
        WinTop=0.2000000
        WinLeft=0.2000000
        WinWidth=0.2000000
        WinHeight=0.2000000
    end object
    Bk1=Img1
    // Reference: GUIImage'GUI2K4_Decompressed.StreamPlayer.img2'
    begin object name="img2" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.2000000
        WinLeft=0.2000000
        WinWidth=0.2000000
        WinHeight=0.2000000
    end object
    bk2=img2
    // Reference: AltSectionBackground'GUI2K4_Decompressed.StreamPlayer.sbPlayList'
    begin object name="sbPlayList" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        Caption="?? ??? ???"
        LeftPadding=0.0000000
        RightPadding=0.0000000
        WinTop=0.2000000
        WinLeft=0.2000000
        WinWidth=0.2000000
        WinHeight=0.2000000
        bVisible=false
        OnPreDraw=sbPlayList.InternalPreDraw
    end object
    sb_PlayList=sbPlayList
    // Reference: AltSectionBackground'GUI2K4_Decompressed.StreamPlayer.sbManagement'
    begin object name="sbManagement" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        Caption="??? ??? ???"
        LeftPadding=0.0000000
        RightPadding=0.0000000
        WinTop=0.2000000
        WinLeft=0.2000000
        WinWidth=0.2000000
        WinHeight=0.2000000
        bVisible=false
        OnPreDraw=sbManagement.InternalPreDraw
    end object
    sb_Management=sbManagement
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.StreamPlayer.SongInfoBox'
    begin object name="SongInfoBox" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        OnCreateComponent=SongInfoBox.InternalOnCreateComponent
        WinWidth=0.2000000
        WinHeight=0.2000000
        bTabStop=false
        bAcceptsInput=false
        bNeverFocus=true
    end object
    lb_SongInfo=SongInfoBox
    // Reference: GUILabel'GUI2K4_Decompressed.StreamPlayer.SongTime'
    begin object name="SongTime" class=XInterface.GUILabel
        Caption="0:00"
        TextAlign=1
        VertAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=-0.2000000
        WinLeft=0.2000000
        WinWidth=0.2411720
        WinHeight=0.5501910
    end object
    l_Time=SongTime
    // Reference: GUIListBox'GUI2K4_Decompressed.StreamPlayer.PlaylistListBox'
    begin object name="PlaylistListBox" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=PlaylistListBox.InternalOnCreateComponent
        Hint="?? ??? ???"
        WinTop=0.3000000
        WinLeft=0.0108590
        WinWidth=0.9774250
        WinHeight=0.5889410
        RenderWeight=0.5030000
        TabOrder=6
        bVisible=false
    end object
    lb_Playlist=PlaylistListBox
    // Reference: GUIListBox'GUI2K4_Decompressed.StreamPlayer.SelectPlaylistListBox'
    begin object name="SelectPlaylistListBox" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=SelectPlaylistListBox.InternalOnCreateComponent
        Hint="??? ??? ????"
        WinTop=0.2350000
        WinLeft=0.0108590
        WinWidth=0.9774250
        WinHeight=0.7175000
        TabOrder=1
        bBoundToParent=true
        bVisible=false
    end object
    lb_AllPlaylists=SelectPlaylistListBox
    // Reference: GUIButton'GUI2K4_Decompressed.StreamPlayer.bBotA'
    begin object name="bBotA" class=XInterface.GUIButton
        Caption="??"
        StyleName="FooterButton"
        Tag=1
        bVisible=false
        OnClick=StreamPlayer.InternalOnClick
        OnKeyEvent=bBotA.InternalOnKeyEvent
    end object
    b_BotA=bBotA
    // Reference: GUIButton'GUI2K4_Decompressed.StreamPlayer.bBotB'
    begin object name="bBotB" class=XInterface.GUIButton
        Caption="??"
        StyleName="FooterButton"
        Tag=1
        bVisible=false
        OnClick=StreamPlayer.InternalOnClick
        OnKeyEvent=bBotB.InternalOnKeyEvent
    end object
    b_BotB=bBotB
    // Reference: GUIButton'GUI2K4_Decompressed.StreamPlayer.bBotC'
    begin object name="bBotC" class=XInterface.GUIButton
        Caption="???"
        StyleName="FooterButton"
        Tag=1
        bVisible=false
        OnClick=StreamPlayer.InternalOnClick
        OnKeyEvent=bBotC.InternalOnKeyEvent
    end object
    b_BotC=bBotC
    // Reference: GUISlider'GUI2K4_Decompressed.StreamPlayer.StreamVolume'
    begin object name="StreamVolume" class=XInterface.GUISlider
        MaxValue=1.0000000
        CalcMarkerPosition=StreamVolume.InternalCalcMarkerPosition
        Hint="??"
        WinWidth=0.5449220
        WinHeight=1.0000000
        TabOrder=0
        OnClick=StreamVolume.InternalOnClick
        OnMousePressed=StreamVolume.InternalOnMousePressed
        OnMouseRelease=StreamVolume.InternalOnMouseRelease
        OnChange=StreamPlayer.InternalOnChange
        OnKeyEvent=StreamVolume.InternalOnKeyEvent
        OnCapturedMouseMove=StreamVolume.InternalCapturedMouseMove
    end object
    sl_Volume=StreamVolume
    // Reference: GUIGFXButton'GUI2K4_Decompressed.StreamPlayer.PlayButton'
    begin object name="PlayButton" class=XInterface.GUIGFXButton
        Position=2
        StyleName="TextLabel"
        WinLeft=0.7171100
        WinWidth=0.0400000
        TabOrder=4
        bTabStop=true
        OnClick=StreamPlayer.InternalOnClick
        OnKeyEvent=PlayButton.InternalOnKeyEvent
    end object
    b_Play=PlayButton
    // Reference: GUIGFXButton'GUI2K4_Decompressed.StreamPlayer.StopButton'
    begin object name="StopButton" class=XInterface.GUIGFXButton
        Position=2
        StyleName="TextLabel"
        Hint="??"
        WinLeft=0.6058590
        WinWidth=0.0400000
        TabOrder=2
        bTabStop=true
        OnClick=StreamPlayer.InternalOnClick
        OnKeyEvent=StopButton.InternalOnKeyEvent
    end object
    b_Stop=StopButton
    // Reference: GUIGFXButton'GUI2K4_Decompressed.StreamPlayer.NextTrackButton'
    begin object name="NextTrackButton" class=XInterface.GUIGFXButton
        Position=2
        StyleName="TextLabel"
        Hint="??"
        WinLeft=0.6608600
        WinWidth=0.0400000
        TabOrder=3
        bTabStop=true
        OnClick=StreamPlayer.InternalOnClick
        OnKeyEvent=NextTrackButton.InternalOnKeyEvent
    end object
    b_NextTrack=NextTrackButton
    // Reference: GUIGFXButton'GUI2K4_Decompressed.StreamPlayer.PrevTrackButton'
    begin object name="PrevTrackButton" class=XInterface.GUIGFXButton
        Position=2
        StyleName="TextLabel"
        Hint="??"
        WinLeft=0.5421090
        WinWidth=0.0400000
        TabOrder=1
        bTabStop=true
        OnClick=StreamPlayer.InternalOnClick
        OnKeyEvent=PrevTrackButton.InternalOnKeyEvent
    end object
    b_PrevTrack=PrevTrackButton
    // Reference: GUIGFXButton'GUI2K4_Decompressed.StreamPlayer.ShowPlaylistButton'
    begin object name="ShowPlaylistButton" class=XInterface.GUIGFXButton
        StyleName="RoundScaledButton"
        WinLeft=0.8254700
        WinWidth=0.0524220
        WinHeight=0.9250000
        TabOrder=5
        bTabStop=true
        OnClick=StreamPlayer.InternalOnClick
        OnKeyEvent=ShowPlaylistButton.InternalOnKeyEvent
        OnDragOver=StreamPlayer.ManageDragOver
    end object
    b_Playlist=ShowPlaylistButton
    // Reference: GUIGFXButton'GUI2K4_Decompressed.StreamPlayer.ManagePlaylistsButton'
    begin object name="ManagePlaylistsButton" class=XInterface.GUIGFXButton
        StyleName="RoundScaledButton"
        Hint="??? ??? ??"
        WinLeft=0.8833600
        WinWidth=0.0524220
        WinHeight=0.9250000
        TabOrder=6
        bTabStop=true
        OnClick=StreamPlayer.InternalOnClick
        OnKeyEvent=ManagePlaylistsButton.InternalOnKeyEvent
        OnDragOver=StreamPlayer.ManageDragOver
    end object
    b_Management=ManagePlaylistsButton
    // Reference: GUICheckBoxButton'GUI2K4_Decompressed.StreamPlayer.ShuffleCheck'
    begin object name="ShuffleCheck" class=XInterface.GUICheckBoxButton
        bAllOverlay=true
        Hint="??"
        WinTop=0.6666670
        WinLeft=0.8400000
        WinWidth=0.0400000
        TabOrder=2
        OnChange=StreamPlayer.InternalOnChange
        OnKeyEvent=ShuffleCheck.InternalOnKeyEvent
    end object
    ch_Shuffle=ShuffleCheck
    // Reference: GUICheckBoxButton'GUI2K4_Decompressed.StreamPlayer.ShuffleAllCheck'
    begin object name="ShuffleAllCheck" class=XInterface.GUICheckBoxButton
        bAllOverlay=true
        Hint="?? ??"
        WinTop=0.6666670
        WinLeft=0.8800000
        WinWidth=0.0400000
        TabOrder=3
        OnChange=StreamPlayer.InternalOnChange
        OnKeyEvent=ShuffleAllCheck.InternalOnKeyEvent
    end object
    ch_ShuffleAll=ShuffleAllCheck
    // Reference: GUICheckBoxButton'GUI2K4_Decompressed.StreamPlayer.RepeatCheck'
    begin object name="RepeatCheck" class=XInterface.GUICheckBoxButton
        bAllOverlay=true
        Hint="??"
        WinTop=0.6666670
        WinLeft=0.7600000
        WinWidth=0.0400000
        TabOrder=0
        OnChange=StreamPlayer.InternalOnChange
        OnKeyEvent=RepeatCheck.InternalOnKeyEvent
    end object
    ch_Repeat=RepeatCheck
    // Reference: GUICheckBoxButton'GUI2K4_Decompressed.StreamPlayer.RepeatAllCheck'
    begin object name="RepeatAllCheck" class=XInterface.GUICheckBoxButton
        bAllOverlay=true
        Hint="?? ??"
        WinTop=0.6666670
        WinLeft=0.8000000
        WinWidth=0.0400000
        TabOrder=1
        OnChange=StreamPlayer.InternalOnChange
        OnKeyEvent=RepeatAllCheck.InternalOnKeyEvent
    end object
    ch_RepeatAll=RepeatAllCheck
    ID3TagEditorMenu="GUI2K4.ID3TagEditor"
    PlaylistEditorMenu="GUI2K4.StreamPlaylistEditor"
    ExpandedHeight=0.5000000
    ConstrictedHeight=0.3200000
    CollapsePlaylistHint="?? ???? ???"
    ExpandPlaylistHint="?? ???? ??? ???"
    PlayHint="???"
    PauseHint="?? ??"
    CollapseManagementHint="??? ??? ?? ???"
    ExpandManagementHint="??? ??? ?? ???"
    RenameCaption="??? ??? ????"
    NewCaption="??? ??? ??? ???"
    PlaylistNameCaption="??: "
    PLAdd="??"
    PLRemove="??"
    PLClear="???"
    MGNew="? ???"
    MGRemove="??"
    MGRename="?? ??"
    // Reference: GUIContextMenu'GUI2K4_Decompressed.StreamPlayer.SongRCMenu'
    begin object name="SongRCMenu" class=XInterface.GUIContextMenu
        ContextItems=/* Array type was not detected. */
        OnSelect=StreamPlayer.SongMenuClick
    end object
    cm_Playlist=SongRCMenu
    // Reference: GUIContextMenu'GUI2K4_Decompressed.StreamPlayer.PlaylistRCMenu'
    begin object name="PlaylistRCMenu" class=XInterface.GUIContextMenu
        ContextItems=/* Array type was not detected. */
        OnSelect=StreamPlayer.PlaylistMenuClick
    end object
    cm_AllLists=PlaylistRCMenu
    WindowName="?? ????"
    MinPageWidth=0.7500000
    MinPageHeight=0.3200000
    MaxPageWidth=0.9000000
    bResizeHeightAllowed=false
    bPersistent=true
    bAllowedAsLast=true
    WinHeight=0.3200000
    // Reference: GUIContextMenu'GUI2K4_Decompressed.StreamPlayer.PlayerRCMenu'
    begin object name="PlayerRCMenu" class=XInterface.GUIContextMenu
        ContextItems=/* Array type was not detected. */
        OnSelect=StreamPlayer.PlayerMenuClick
    end object
    ContextMenu=PlayerRCMenu
}