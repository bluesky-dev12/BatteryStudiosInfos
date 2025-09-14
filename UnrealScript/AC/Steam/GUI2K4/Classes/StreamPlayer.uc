/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\StreamPlayer.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:58
 *	Functions:62
 *
 *******************************************************************************/
class StreamPlayer extends FloatingWindow
    config(User)
    editinlinenew
    instanced;

enum epbWinMode
{
    MODE_Compact,
    MODE_PlayList,
    MODE_Manager
};

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage Bk1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage bk2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_PlayList;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Management;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lb_SongInfo;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Time;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_Playlist;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_AllPlaylists;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_BotA;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_BotB;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_BotC;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISlider sl_Volume;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIGFXButton b_Play;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIGFXButton b_Stop;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIGFXButton b_NextTrack;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIGFXButton b_PrevTrack;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIGFXButton b_Playlist;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIGFXButton b_Management;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUICheckBoxButton ch_Shuffle;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUICheckBoxButton ch_ShuffleAll;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUICheckBoxButton ch_Repeat;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUICheckBoxButton ch_RepeatAll;
var() editconst noexport editinline GUIList li_Playlist;
var() editconst noexport editinline GUIList li_AllLists;
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
var() editconst noexport editinline GUIContextMenu cm_Playlist;
var() editconst noexport editinline GUIContextMenu cm_AllLists;
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
}

function ResolutionChanged(int ResX, int ResY)
{
    // End:0x16
    if(WindowMode == 0)
    {
        Constrict();
    }
    super.ResolutionChanged(ResX, ResY);
}

event Opened(GUIComponent Sender)
{
    super(PopupPageBase).Opened(Sender);
    Constrict();
    // End:0x3e
    if(!SetPlaylistManager())
    {
        Warn("Error setting PlaylistManager!");
    }
    sl_Volume.SetValue(float(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice MusicVolume")));
    RefreshPlaylistSelections();
    RefreshCurrentPlaylist();
    RefreshPlaybackOptions();
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
}

function SaveCurrentPosition()
{
    // End:0x1b
    if(WindowMode != 0)
    {
        ExpandedHeight = WinHeight;
    }
    DefaultLeft = WinLeft;
    DefaultTop = WinTop;
    DefaultWidth = WinWidth;
    // End:0x62
    if(Controller.ResX <= 640)
    {
        DefaultHeight = 0.320;
    }
    // End:0x6d
    else
    {
        DefaultHeight = 0.270;
    }
    SaveConfig();
}

function bool SetHandler()
{
    local int i;

    // End:0x23
    if(Controller == none || Controller.ViewportOwner == none)
    {
        return false;
    }
    i = 0;
    J0x2a:
    // End:0xe4 [While If]
    if(i < Controller.ViewportOwner.LocalInteractions.Length)
    {
        // End:0xda
        if(StreamInteraction(Controller.ViewportOwner.LocalInteractions[i]) != none)
        {
            Handler = StreamInteraction(Controller.ViewportOwner.LocalInteractions[i]);
            Handler.__OnStreamChanged__Delegate = HandleStreamChange;
            Handler.__OnStreamingStopped__Delegate = HandleStreamStop;
            Handler.__OnAdjustVolume__Delegate = HandleAdjustVolume;
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
    Log("StreamPlayer.SetHandler() - no StreamInteractions found!", 'MusicPlayer');
    return false;
}

function bool SetPlaylistManager()
{
    // End:0x27
    if(PlaylistManager != none)
    {
        // End:0x25
        if(Handler == none && !SetHandler())
        {
            return false;
        }
        return true;
    }
    // End:0x41
    if(Handler == none && !SetHandler())
    {
        return false;
    }
    PlaylistManager = Handler.PlaylistManager;
    PlaylistManager.__ChangedActivePlaylist__Delegate = ActivePlaylistChanged;
    return PlaylistManager != none;
}

function RefreshPlaybackOptions()
{
    sl_Volume.SetValue(Handler.GetStreamVolume());
    ch_Shuffle.bChecked = PlaylistManager.GetShuffle();
    ch_ShuffleAll.bChecked = PlaylistManager.GetShuffleAll();
    ch_Repeat.bChecked = PlaylistManager.GetRepeat();
    ch_RepeatAll.bChecked = PlaylistManager.GetRepeatAll();
}

function RefreshPlaylistSelections()
{
    local StreamPlaylist List;
    local int i;
    local string str;

    // End:0x0d
    if(PlaylistManager == none)
    {
        return;
    }
    str = li_AllLists.Get();
    li_AllLists.Clear();
    i = 0;
    J0x38:
    // End:0x98 [While If]
    if(i < PlaylistManager.GetPlaylistCount())
    {
        List = PlaylistManager.GetPlaylistAt(i);
        li_AllLists.Add(List.GetTitle(), List);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x38;
    }
    i = li_AllLists.FindIndex(str);
    // End:0xe8
    if(i == -1 && CurrentPlaylist != none)
    {
        i = PlaylistManager.FindPlaylistIndex(CurrentPlaylist);
    }
    li_AllLists.SilentSetIndex(i);
}

function ActivePlaylistChanged(StreamPlaylist NewList)
{
    RefreshCurrentPlaylist();
    // End:0x1c
    if(WindowMode == 2)
    {
        ShowPlayList();
    }
}

function RefreshCurrentPlaylist()
{
    // End:0x1f
    if(CurrentPlaylist != none)
    {
        CurrentPlaylist.__OnPlaylistChanged__Delegate = None;
    }
    CurrentPlaylist = PlaylistManager.GetCurrentPlaylist();
    // End:0x5f
    if(CurrentPlaylist == none)
    {
        Warn("Invalid playlist selected!");
        return;
    }
    LoadCurrentPlaylist();
    li_Playlist.SetIndex(li_Playlist.FindIndex("",,, CurrentPlaylist.GetCurrentStream()));
    li_AllLists.SilentSetIndex(li_AllLists.FindIndex("",,, CurrentPlaylist));
}

function LoadCurrentPlaylist()
{
    local int i;
    local array<Stream> Songs;

    li_Playlist.Clear();
    // End:0x1c
    if(CurrentPlaylist == none)
    {
        return;
    }
    CurrentPlaylist.GetSongs(Songs);
    i = 0;
    J0x37:
    // End:0x95 [While If]
    if(i < Songs.Length)
    {
        li_Playlist.Add(Songs[i].GetSongTitle(), Songs[i], Songs[i].GetPath());
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    CurrentPlaylist.__OnPlaylistChanged__Delegate = HandlePlaylistChange;
}

function HandlePlaylistChange()
{
    LoadCurrentPlaylist();
    PlaylistManager.Save();
}

function HandleStreamChange(string NewStreamFileName)
{
    local Stream S;
    local int i;

    i = CurrentPlaylist.FindIndexByName(NewStreamFileName);
    S = CurrentPlaylist.GetStreamAt(i);
    ResetSongCounter();
    // End:0x5c
    if(S != none)
    {
        CurrentPlaylist.SetCurrent(i);
    }
    // End:0x93
    else
    {
        li_Playlist.SetIndex(-1);
        S = Handler.FileManager.CreateStream(NewStreamFileName);
    }
    ReadStream(S);
    PlaylistManager.Save();
}

function HandleStreamStop()
{
    UpdateSongTimeDisplay();
    UpdatePlayButton();
    li_Playlist.SetIndex(-1);
    DisableComponent(b_Stop);
    PlaylistManager.Save();
}

function HandleAdjustVolume(float NewVolume)
{
    sl_Volume.SetValue(NewVolume);
}

function bool InternalOnClick(GUIComponent C)
{
    local Stream obj;

    switch(C)
    {
        // End:0x9e
        case b_Play:
            // End:0x4f
            if(!li_Playlist.IsValid() && !Handler.IsPlaying())
            {
                li_Playlist.SilentSetIndex(0);
                Play();
            }
            obj = Stream(li_Playlist.GetObject());
            // End:0x96
            if(obj == none || obj != Handler.CurrentStreamAttachment)
            {
                Play();
                return true;
            }
            PauseCurrent();
            return true;
        // End:0xae
        case b_Stop:
            StopCurrent();
            return true;
        // End:0xbe
        case b_NextTrack:
            NextTrack();
            return true;
        // End:0xce
        case b_PrevTrack:
            PrevTrack();
            return true;
        // End:0xde
        case b_Playlist:
            TogglePlaylist();
            return true;
        // End:0xee
        case b_Management:
            ToggleManagement();
            return true;
        // End:0x145
        case b_BotA:
            // End:0x12d
            if(WindowMode == 1)
            {
                return Controller.OpenMenu(PlaylistEditorMenu, CurrentPlaylist.GetTitle());
            }
            // End:0x143
            else
            {
                // End:0x143
                if(WindowMode == 2)
                {
                    NewPlaylist();
                }
            }
            return true;
        // End:0x17e
        case b_BotB:
            // End:0x166
            if(WindowMode == 1)
            {
                CurrentListRemove();
            }
            // End:0x17c
            else
            {
                // End:0x17c
                if(WindowMode == 2)
                {
                    RemovePlaylist();
                }
            }
            return true;
        // End:0x1b5
        case b_BotC:
            // End:0x19f
            if(WindowMode == 1)
            {
                CurrentListClear();
            }
            // End:0x1b5
            else
            {
                // End:0x1b5
                if(WindowMode == 2)
                {
                    RenamePlaylist();
            }
        }
        // End:0xffff
        default:
            return true;
    }
}

function int GetPlaylistManagerIndex(int ListIndex)
{
    // End:0x1e
    if(PlaylistManager == none || li_AllLists == none)
    {
        return -1;
    }
    // End:0x4b
    if(!li_AllLists.IsValidIndex(ListIndex))
    {
        ListIndex = li_AllLists.Index;
    }
    return PlaylistManager.FindNameIndex(li_AllLists.GetItemAtIndex(ListIndex));
}

function InternalOnChange(GUIComponent C)
{
    switch(C)
    {
        // End:0xae
        case sl_Volume:
            Handler.SetMusicVolume(sl_Volume.Value);
            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice MusicVolume" @ string(sl_Volume.Value));
            PlayerOwner().ConsoleCommand("SetMusicVolume" @ string(sl_Volume.Value));
            // End:0x21e
            break;
        // End:0xf6
        case ch_Shuffle:
            PlaylistManager.SetShuffle(ch_Shuffle.bChecked);
            ch_ShuffleAll.bChecked = PlaylistManager.GetShuffleAll();
            // End:0x21e
            break;
        // End:0x13e
        case ch_ShuffleAll:
            PlaylistManager.SetShuffleAll(ch_ShuffleAll.bChecked);
            ch_Shuffle.bChecked = PlaylistManager.GetShuffle();
            // End:0x21e
            break;
        // End:0x186
        case ch_Repeat:
            PlaylistManager.SetRepeat(ch_Repeat.bChecked);
            ch_RepeatAll.bChecked = PlaylistManager.GetRepeatAll();
            // End:0x21e
            break;
        // End:0x1ce
        case ch_RepeatAll:
            PlaylistManager.SetRepeatAll(ch_RepeatAll.bChecked);
            ch_Repeat.bChecked = PlaylistManager.GetRepeat();
            // End:0x21e
            break;
        // End:0x21b
        case li_Playlist:
            // End:0x218
            if(!Handler.IsPlaying() && li_Playlist.IsValid())
            {
                ReadTagInfo(Stream(li_Playlist.GetObject()));
            }
            // End:0x21e
            break;
        // End:0xffff
        default:
}

function bool SliderPreDrawCaption(out float X, out float Y, out float XL, out float YL, out XInterface.GUI.eTextAlign Justification)
{
    return true;
}

function bool AllListsReceiveDrop(GUIComponent Sender)
{
    local int i, idx;
    local array<GUIListElem> Elems;
    local array<string> items;
    local Stream str;
    local StreamPlaylist List;

    // End:0xfb
    if(Controller.DropSource == li_Playlist)
    {
        List = PlaylistManager.GetPlaylistAt(GetPlaylistManagerIndex(li_AllLists.DropIndex));
        // End:0x5f
        if(List == none || List == CurrentPlaylist)
        {
            return false;
        }
        List.InitializePlaylist(Handler.FileManager);
        Elems = li_Playlist.GetPendingElements(true);
        i = Elems.Length - 1;
        J0xa1:
        // End:0xf6 [While If]
        if(i >= 0)
        {
            str = Stream(Elems[i].ExtraData);
            // End:0xec
            if(str != none)
            {
                List.AddStream(-1, str, true);
            }
            -- i;
            // This is an implied JumpToken; Continue!
            goto J0xa1;
        }
        return true;
    }
    // End:0x1ca
    else
    {
        // End:0x1ca
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
            // End:0x1c8 [While If]
            if(i >= 0)
            {
                PlaylistManager.InsertInPlaylist(idx, -1, items[i], i > 0);
                -- i;
                // This is an implied JumpToken; Continue!
                goto J0x187;
            }
            return true;
        }
    }
    return false;
}

function bool PlaylistReceiveDrop(GUIComponent Sender)
{
    local array<string> items;
    local int i, idx;

    // End:0x130
    if(Sender == li_Playlist)
    {
        // End:0x42
        if(Controller.DropSource != li_AllLists && li_Playlist.InternalOnDragDrop(Sender))
        {
            return true;
        }
        // End:0x130
        if(DirectoryTreeList(Controller.DropSource) != none)
        {
            items = DirectoryTreeList(Controller.DropSource).GetPendingItems();
            idx = li_Playlist.DropIndex;
            // End:0xc0
            if(!li_Playlist.IsValidIndex(idx))
            {
                idx = li_Playlist.Elements.Length;
            }
            i = items.Length - 1;
            J0xcf:
            // End:0x11a [While If]
            if(i >= 0)
            {
                PlaylistManager.InsertInPlaylist(PlaylistManager.GetCurrentIndex(), idx, items[i], i > 0);
                -- i;
                // This is an implied JumpToken; Continue!
                goto J0xcf;
            }
            li_Playlist.SetIndex(idx);
            return true;
        }
    }
    return false;
}

function PlaylistDragEnded(GUIComponent Accepting, bool bAccepted)
{
    local int i;
    local array<Stream> Streams;

    li_Playlist.InternalOnEndDrag(Accepting, bAccepted);
    // End:0xc8
    if(bAccepted)
    {
        // End:0xc8
        if(Accepting == li_Playlist)
        {
            Streams.Length = li_Playlist.Elements.Length;
            i = 0;
            J0x4f:
            // End:0x97 [While If]
            if(i < li_Playlist.Elements.Length)
            {
                Streams[i] = Stream(li_Playlist.GetObjectAtIndex(i));
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x4f;
            }
            CurrentPlaylist.InitializePlaylist(Handler.FileManager);
            CurrentPlaylist.SetSongs(Streams);
        }
    }
}

function Play()
{
    Handler.PlaySong(li_Playlist.GetExtra(), 0.0);
    UpdatePlayButton();
}

function StopCurrent()
{
    Handler.StopSong();
    UpdatePlayButton();
}

function NextTrack()
{
    Handler.NextSong();
    UpdatePlayButton();
}

function PrevTrack()
{
    Handler.PrevSong();
}

function PauseCurrent()
{
    // End:0x1d
    if(!Handler.IsPlaying())
    {
        Play();
    }
    // End:0x32
    else
    {
        Handler.PauseSong();
        UpdatePlayButton();
    }
}

function bool PlaylistDblClick(GUIComponent C)
{
    local int i;

    // End:0x1a
    if(C == li_Playlist)
    {
        Play();
        return true;
    }
    // End:0x68
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
}

function ReadTagInfo(Stream StreamObj)
{
    local string TagText;
    local StreamTag sTag;

    sTag = StreamObj.GetTag();
    TagText = StreamObj.GetSongTitle();
    // End:0x9d
    if(sTag != none)
    {
        // End:0x4d
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
}

function ReadStreamAt(int Index)
{
    local Stream StreamObj;

    StreamObj = Stream(lb_Playlist.List.GetObjectAtIndex(Index));
    // End:0x7a
    if(StreamObj == none)
    {
        Log("ReadStreamInfo couldn't find stream object at index" @ string(Index), 'MusicPlayer');
        return;
    }
    ReadStream(StreamObj);
}

event Timer()
{
    // End:0x11
    if(Handler != none)
    {
        UpdateSongTimeDisplay();
    }
}

function ResetSongCounter(optional bool bNoRestart)
{
    SongSeconds = 0;
    // End:0x16
    if(bNoRestart)
    {
        KillTimer();
    }
    // End:0x1f
    else
    {
        SetTimer(1.0, true);
    }
    Timer();
}

protected function UpdateSongTimeDisplay()
{
    SongSeconds = int(Handler.GetStreamPosition());
    l_Time.Caption = class'StreamBase'.static.FormatTimeDisplay(float(SongSeconds));
}

function UpdatePlayButton()
{
    // End:0x0d
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
    // End:0x88
    else
    {
        b_Play.SetHint(PlayHint);
        b_Play.Graphic = PlayImage;
    }
}

function PlayerMenuClick(GUIContextMenu Menu, int Index)
{
    // End:0x28
    if(Index < 0 || Index >= Menu.ContextItems.Length)
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
        // End:0xffff
        default:
}

function RemovePlaylist()
{
    PlaylistManager.RemovePlaylist(li_AllLists.Get());
    RefreshPlaylistSelections();
}

function CurrentListClear()
{
    PlaylistManager.ClearCurrentPlaylist();
    LoadCurrentPlaylist();
}

function PlaylistMenuClick(GUIContextMenu Menu, int Index)
{
    local int i;

    // End:0x28
    if(Index < 0 || Index >= Menu.ContextItems.Length)
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
            // End:0xcb
            break;
        // End:0x9e
        case 1:
            RenamePlaylist();
            // End:0xcb
            break;
        // End:0xac
        case 2:
            NewPlaylist();
            // End:0xcb
            break;
        // End:0xba
        case 4:
            RemovePlaylist();
            // End:0xcb
            break;
        // End:0xc8
        case 5:
            CurrentListClear();
            // End:0xcb
            break;
        // End:0xffff
        default:
}

function CurrentListRemove()
{
    local array<GUIListElem> Paths;
    local int i;

    Paths = li_Playlist.GetPendingElements(true);
    i = 0;
    J0x1d:
    // End:0x66 [While If]
    if(i < Paths.Length)
    {
        PlaylistManager.RemoveFromCurrentPlaylist(Paths[i].ExtraStrData, i < Paths.Length - 1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
}

function SongMenuClick(GUIContextMenu Menu, int Index)
{
    // End:0x28
    if(Index < 0 || Index >= Menu.ContextItems.Length)
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
        // End:0x5a
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
        // End:0xffff
        default:
            li_Playlist.ClearPendingElements();
}

function NewPlaylist()
{
    // End:0x47
    if(Controller.OpenMenu(Controller.RequestDataMenu, NewCaption, PlaylistNameCaption))
    {
        Controller.ActivePage.__OnClose__Delegate = NewPlaylistClosed;
    }
}

function RenamePlaylist()
{
    // End:0x6e
    if(Controller.OpenMenu(Controller.RequestDataMenu, RenameCaption, PlaylistNameCaption))
    {
        Controller.ActivePage.SetDataString(li_AllLists.Get());
        Controller.ActivePage.__OnClose__Delegate = RenameClosed;
    }
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
    // End:0xbc [While If]
    if(i < Controls.Length)
    {
        // End:0x9c
        if(Controls[i] == sb_PlayList && WindowMode != 1 || Controls[i] == sb_Management && WindowMode != 2)
        {
        }
        // End:0xb2
        else
        {
            Controls[i].SetVisibility(true);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x39;
    }
}

function Expand()
{
    bResizeHeightAllowed = true;
    // End:0x29
    if(ExpandedHeight < WinHeight)
    {
        ExpandedHeight = WinHeight + 0.10;
    }
    WinHeight = RelativeHeight(ExpandedHeight);
    MinPageHeight = 0.40;
    CheckBounds();
}

function Constrict()
{
    bResizeHeightAllowed = false;
    WindowMode = 0;
    // End:0x41
    if(Controller.ResX <= 640)
    {
        MinPageHeight = 0.320;
        WinHeight = 0.320;
    }
    // End:0x57
    else
    {
        MinPageHeight = 0.270;
        WinHeight = 0.270;
    }
}

function HideAll()
{
    Constrict();
    sb_PlayList.SetVisibility(false);
    sb_Management.SetVisibility(false);
    b_BotA.SetVisibility(false);
    b_BotB.SetVisibility(false);
    b_BotC.SetVisibility(false);
}

function TogglePlaylist()
{
    // End:0x19
    if(WindowMode != 1)
    {
        ShowPlayList();
    }
    // End:0x1f
    else
    {
        HidePlayList();
    }
}

function ShowPlayList()
{
    // End:0x16
    if(WindowMode == 0)
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
}

function HidePlayList()
{
    Constrict();
    b_BotA.SetVisibility(false);
    b_BotB.SetVisibility(false);
    b_BotC.SetVisibility(false);
    sb_PlayList.SetVisibility(false);
    b_Playlist.Graphic = ClosedFolder;
}

function ToggleManagement()
{
    // End:0x19
    if(WindowMode != 2)
    {
        ShowManagement();
    }
    // End:0x1f
    else
    {
        HideManagement();
    }
    return;
}

function ShowManagement()
{
    // End:0x16
    if(WindowMode == 0)
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
}

function HideManagement()
{
    Constrict();
    b_BotA.SetVisibility(false);
    b_BotB.SetVisibility(false);
    b_BotC.SetVisibility(false);
    sb_Management.SetVisibility(false);
}

function ManageDragOver(GUIComponent Sender)
{
    // End:0x0b
    if(bAnimating)
    {
        return;
    }
    // End:0x35
    if(Sender == b_Management && WindowMode != 2)
    {
        ShowManagement();
    }
    // End:0x5c
    else
    {
        // End:0x5c
        if(Sender == b_Playlist && WindowMode != 1)
        {
            ShowPlayList();
        }
    }
}

function bool FloatingPreDraw(Canvas C)
{
    local float X, Y, XL, YL, BK1L, BK1T,
	    BK1W, BK1H, L, t, W,
	    H, BL, bt, BW, bh,
	    bs;

    local bool B;

    // End:0x0f
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
    X = L + W - float(C.SizeX) * 0.010;
    Y = t + float(C.SizeY) * 0.010;
    Bk1.WinTop = Bk1.RelativeTop(Y);
    Bk1.WinHeight = Bk1.RelativeHeight(3.0 * YL);
    Bk1.WinWidth = Bk1.RelativeWidth(XL + XL * 0.320);
    Bk1.WinLeft = Bk1.RelativeLeft(X - Bk1.ActualWidth());
    BK1T = Bk1.ActualTop();
    BK1W = Bk1.ActualWidth();
    BK1H = Bk1.ActualHeight();
    BK1L = Bk1.ActualLeft();
    l_Time.SetPosition(BK1L, BK1T, BK1W, BK1H, true);
    X = BK1L - float(C.SizeX) * 0.010;
    lb_SongInfo.WinTop = lb_SongInfo.RelativeTop(Y - float(C.SizeY) * 0.010);
    lb_SongInfo.WinLeft = lb_SongInfo.RelativeLeft(L + float(C.SizeX) * 0.020);
    lb_SongInfo.WinWidth = lb_SongInfo.RelativeWidth(X - lb_SongInfo.ActualLeft());
    bh = ActualHeight(ch_Shuffle.StandardHeight);
    BW = bh;
    bt = BK1T + BK1H - bh;
    bs = float(C.SizeX) * 0.010;
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
    lb_SongInfo.WinHeight = lb_SongInfo.RelativeHeight(sl_Volume.ActualTop() - float(C.SizeY) * 0.010 - lb_SongInfo.ActualTop());
    t = sl_Volume.ActualTop() + sl_Volume.ActualHeight() + float(C.SizeY) * 0.010;
    L = sl_Volume.ActualLeft();
    b_Playlist.SetPosition(L, t, BW, bh, true);
    b_Management.SetPosition(L + BW + bs, t, BW, bh, true);
    L = L + BW * float(2) + bs * float(2);
    bt = t + bh * 0.320;
    bk2.WinLeft = bk2.RelativeLeft(L);
    bk2.WinTop = bk2.RelativeTop(bt);
    bk2.WinHeight = bk2.RelativeHeight(bh * 0.50);
    bk2.WinWidth = bk2.RelativeWidth(BK1L + BK1W - BW - bk2.ActualLeft());
    L = ActualLeft();
    W = ActualWidth();
    t = bt + bh * 1.50;
    // End:0x7c8
    if(WindowMode == 1)
    {
        sb_PlayList.WinLeft = sb_PlayList.RelativeLeft(L);
        sb_PlayList.WinWidth = sb_PlayList.RelativeWidth(W);
        sb_PlayList.WinTop = sb_PlayList.RelativeTop(t);
        sb_PlayList.WinHeight = sb_PlayList.RelativeHeight(ActualTop() + ActualHeight() - t);
        t = t + sb_PlayList.ActualHeight() - float(32);
        SetBottomButtons(C, sb_PlayList.ActualLeft(), t, sb_PlayList.ActualWidth(), 32.0);
    }
    // End:0x8ae
    if(WindowMode == 2)
    {
        sb_Management.WinLeft = sb_Management.RelativeLeft(L);
        sb_Management.WinWidth = sb_Management.RelativeWidth(W);
        sb_Management.WinTop = sb_Management.RelativeTop(t);
        sb_Management.WinHeight = sb_Management.RelativeHeight(ActualTop() + ActualHeight() - t);
        t = t + sb_Management.ActualHeight() - float(32);
        SetBottomButtons(C, sb_Management.ActualLeft(), t, sb_Management.ActualWidth(), 32.0);
    }
    return B;
}

function MoveButton(GUIButton B, out float L, float t, float W, float H, float S)
{
    B.SetPosition(L, t, W, H, true);
    L -= W + S;
}

function SetBottomButtons(Canvas C, float Left, float Top, float width, float Height)
{
    local int i;
    local float xsize, XL, YL, S;
    local export editinline GUIButton B;

    S = float(Controller.ResX) * 0.010;
    i = 0;
    J0x24:
    // End:0x105 [While If]
    if(i < Controls.Length)
    {
        // End:0xfb
        if(Controls[i].Tag > 0)
        {
            B = GUIButton(Controls[i]);
            B.Style.TextSize(C, B.MenuState, B.Caption, XL, YL, B.FontScale);
            xsize += XL + S;
            Controls[i].WinWidth = Controls[i].RelativeWidth(XL + S);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x24;
    }
    Left = Left + width / float(2) - xsize / float(2);
    i = 0;
    J0x131:
    // End:0x202 [While If]
    if(i < Controls.Length)
    {
        // End:0x1f8
        if(Controls[i].Tag > 0)
        {
            Controls[i].WinTop = Controls[i].RelativeTop(Top);
            Controls[i].WinLeft = Controls[i].RelativeLeft(Left);
            Controls[i].WinHeight = Controls[i].RelativeHeight(Height);
            Left += Controls[i].ActualWidth();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x131;
    }
}

function ResizedBoth()
{
    ExpandedHeight = RelativeHeight();
    super.ResizedBoth();
}

function ResizedHeight()
{
    ExpandedHeight = RelativeHeight();
    super.ResizedHeight();
}

defaultproperties
{
    begin object name=Img1 class=GUIImage
        ImageStyle=1
        WinTop=0.20
        WinLeft=0.20
        WinWidth=0.20
        WinHeight=0.20
    object end
    // Reference: GUIImage'StreamPlayer.Img1'
    Bk1=Img1
    begin object name=img2 class=GUIImage
        ImageStyle=2
        WinTop=0.20
        WinLeft=0.20
        WinWidth=0.20
        WinHeight=0.20
    object end
    // Reference: GUIImage'StreamPlayer.img2'
    bk2=img2
    begin object name=sbPlayList class=AltSectionBackground
        bFillClient=true
        Caption="?? ??? ???"
        LeftPadding=0.0
        RightPadding=0.0
        WinTop=0.20
        WinLeft=0.20
        WinWidth=0.20
        WinHeight=0.20
        bVisible=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'StreamPlayer.sbPlayList'
    sb_PlayList=sbPlayList
    begin object name=sbManagement class=AltSectionBackground
        bFillClient=true
        Caption="??? ??? ???"
        LeftPadding=0.0
        RightPadding=0.0
        WinTop=0.20
        WinLeft=0.20
        WinWidth=0.20
        WinHeight=0.20
        bVisible=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'StreamPlayer.sbManagement'
    sb_Management=sbManagement
    begin object name=SongInfoBox class=GUIScrollTextBox
        bNoTeletype=true
        OnCreateComponent=InternalOnCreateComponent
        WinWidth=0.20
        WinHeight=0.20
        bTabStop=true
        bAcceptsInput=true
        bNeverFocus=true
    object end
    // Reference: GUIScrollTextBox'StreamPlayer.SongInfoBox'
    lb_SongInfo=SongInfoBox
    begin object name=SongTime class=GUILabel
        Caption="0:00"
        TextAlign=1
        VertAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=-0.20
        WinLeft=0.20
        WinWidth=0.2411720
        WinHeight=0.5501910
    object end
    // Reference: GUILabel'StreamPlayer.SongTime'
    l_Time=SongTime
    begin object name=PlaylistListBox class=GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        Hint="?? ??? ???"
        WinTop=0.30
        WinLeft=0.0108590
        WinWidth=0.9774250
        WinHeight=0.5889410
        RenderWeight=0.5030
        TabOrder=6
        bVisible=true
    object end
    // Reference: GUIListBox'StreamPlayer.PlaylistListBox'
    lb_Playlist=PlaylistListBox
    begin object name=SelectPlaylistListBox class=GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        Hint="??? ??? ????"
        WinTop=0.2350
        WinLeft=0.0108590
        WinWidth=0.9774250
        WinHeight=0.71750
        TabOrder=1
        bBoundToParent=true
        bVisible=true
    object end
    // Reference: GUIListBox'StreamPlayer.SelectPlaylistListBox'
    lb_AllPlaylists=SelectPlaylistListBox
    begin object name=bBotA class=GUIButton
        Caption="??"
        StyleName="FooterButton"
        Tag=1
        bVisible=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'StreamPlayer.bBotA'
    b_BotA=bBotA
    begin object name=bBotB class=GUIButton
        Caption="??"
        StyleName="FooterButton"
        Tag=1
        bVisible=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'StreamPlayer.bBotB'
    b_BotB=bBotB
    begin object name=bBotC class=GUIButton
        Caption="???"
        StyleName="FooterButton"
        Tag=1
        bVisible=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'StreamPlayer.bBotC'
    b_BotC=bBotC
    begin object name=StreamVolume class=GUISlider
        MaxValue=1.0
        CalcMarkerPosition=InternalCalcMarkerPosition
        Hint="??"
        WinWidth=0.5449220
        WinHeight=1.0
        TabOrder=0
        OnClick=InternalOnClick
        OnMousePressed=InternalOnMousePressed
        OnMouseRelease=InternalOnMouseRelease
        OnChange=InternalOnChange
        OnKeyEvent=InternalOnKeyEvent
        OnCapturedMouseMove=InternalCapturedMouseMove
    object end
    // Reference: GUISlider'StreamPlayer.StreamVolume'
    sl_Volume=StreamVolume
    begin object name=PlayButton class=GUIGFXButton
        Position=2
        StyleName="TextLabel"
        WinLeft=0.717110
        WinWidth=0.040
        TabOrder=4
        bTabStop=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIGFXButton'StreamPlayer.PlayButton'
    b_Play=PlayButton
    begin object name=StopButton class=GUIGFXButton
        Position=2
        StyleName="TextLabel"
        Hint="??"
        WinLeft=0.6058590
        WinWidth=0.040
        TabOrder=2
        bTabStop=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIGFXButton'StreamPlayer.StopButton'
    b_Stop=StopButton
    begin object name=NextTrackButton class=GUIGFXButton
        Position=2
        StyleName="TextLabel"
        Hint="??"
        WinLeft=0.660860
        WinWidth=0.040
        TabOrder=3
        bTabStop=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIGFXButton'StreamPlayer.NextTrackButton'
    b_NextTrack=NextTrackButton
    begin object name=PrevTrackButton class=GUIGFXButton
        Position=2
        StyleName="TextLabel"
        Hint="??"
        WinLeft=0.5421090
        WinWidth=0.040
        TabOrder=1
        bTabStop=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIGFXButton'StreamPlayer.PrevTrackButton'
    b_PrevTrack=PrevTrackButton
    begin object name=ShowPlaylistButton class=GUIGFXButton
        StyleName="RoundScaledButton"
        WinLeft=0.825470
        WinWidth=0.0524220
        WinHeight=0.9250
        TabOrder=5
        bTabStop=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
        OnDragOver=ManageDragOver
    object end
    // Reference: GUIGFXButton'StreamPlayer.ShowPlaylistButton'
    b_Playlist=ShowPlaylistButton
    begin object name=ManagePlaylistsButton class=GUIGFXButton
        StyleName="RoundScaledButton"
        Hint="??? ??? ??"
        WinLeft=0.883360
        WinWidth=0.0524220
        WinHeight=0.9250
        TabOrder=6
        bTabStop=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
        OnDragOver=ManageDragOver
    object end
    // Reference: GUIGFXButton'StreamPlayer.ManagePlaylistsButton'
    b_Management=ManagePlaylistsButton
    begin object name=ShuffleCheck class=GUICheckBoxButton
        bAllOverlay=true
        Hint="??"
        WinTop=0.6666670
        WinLeft=0.840
        WinWidth=0.040
        TabOrder=2
        OnChange=InternalOnChange
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUICheckBoxButton'StreamPlayer.ShuffleCheck'
    ch_Shuffle=ShuffleCheck
    begin object name=ShuffleAllCheck class=GUICheckBoxButton
        bAllOverlay=true
        Hint="?? ??"
        WinTop=0.6666670
        WinLeft=0.880
        WinWidth=0.040
        TabOrder=3
        OnChange=InternalOnChange
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUICheckBoxButton'StreamPlayer.ShuffleAllCheck'
    ch_ShuffleAll=ShuffleAllCheck
    begin object name=RepeatCheck class=GUICheckBoxButton
        bAllOverlay=true
        Hint="??"
        WinTop=0.6666670
        WinLeft=0.760
        WinWidth=0.040
        TabOrder=0
        OnChange=InternalOnChange
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUICheckBoxButton'StreamPlayer.RepeatCheck'
    ch_Repeat=RepeatCheck
    begin object name=RepeatAllCheck class=GUICheckBoxButton
        bAllOverlay=true
        Hint="?? ??"
        WinTop=0.6666670
        WinLeft=0.80
        WinWidth=0.040
        TabOrder=1
        OnChange=InternalOnChange
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUICheckBoxButton'StreamPlayer.RepeatAllCheck'
    ch_RepeatAll=RepeatAllCheck
    ID3TagEditorMenu="GUI2K4.ID3TagEditor"
    PlaylistEditorMenu="GUI2K4.StreamPlaylistEditor"
    ExpandedHeight=0.50
    ConstrictedHeight=0.320
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
    begin object name=SongRCMenu class=GUIContextMenu
        ContextItems=// Object reference not set to an instance of an object.
        
        OnSelect=SongMenuClick
    object end
    // Reference: GUIContextMenu'StreamPlayer.SongRCMenu'
    cm_Playlist=SongRCMenu
    begin object name=PlaylistRCMenu class=GUIContextMenu
        ContextItems=// Object reference not set to an instance of an object.
        
        OnSelect=PlaylistMenuClick
    object end
    // Reference: GUIContextMenu'StreamPlayer.PlaylistRCMenu'
    cm_AllLists=PlaylistRCMenu
    WindowName="?? ????"
    MinPageWidth=0.750
    MinPageHeight=0.320
    MaxPageWidth=0.90
    bResizeHeightAllowed=true
    bPersistent=true
    bAllowedAsLast=true
    WinHeight=0.320
    begin object name=PlayerRCMenu class=GUIContextMenu
        ContextItems=// Object reference not set to an instance of an object.
        
        OnSelect=PlayerMenuClick
    object end
    // Reference: GUIContextMenu'StreamPlayer.PlayerRCMenu'
    ContextMenu=PlayerRCMenu
}