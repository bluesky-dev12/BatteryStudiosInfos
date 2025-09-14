/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\StreamPlaylistEditor.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:15
 *	Functions:21
 *
 *******************************************************************************/
class StreamPlaylistEditor extends FloatingWindow
    dependson(DirectoryTreeListBox)
    editinlinenew
    instanced;

var() editconst noexport editinline StreamInteraction Handler;
var() editconst noexport editinline StreamInterface FileManager;
var() editconst noexport editinline StreamPlaylistManager PlaylistManager;
var() noexport editinline StreamPlaylist CurrentPlaylist;
var() noexport editinline DirectoryTreeList li_Directory;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Main;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify DirectoryTreeListBox lb_Directory;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Add;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Done;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_DriveLetters;
var() localized array<localized string> GeneralFileItems;
var() localized array<localized string> GeneralFolderItems;
var() localized array<localized string> PlaylistItems;
var() localized array<localized string> NonPlaylistItems;
var() localized array<localized string> ImportItems;

final operator(46) array<string> +=(out array<string> A, array<string> B)
{
    local int i, j;

    j = A.Length;
    A.Length = B.Length + j;
    i = 0;
    J0x27:
    // End:0x5a [While If]
    if(i < B.Length)
    {
        A[++ j] = B[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x27;
    }
    return A;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local array<string> dl;
    local int i;

    super.InitComponent(MyController, myOwner);
    sb_Main.ManageComponent(lb_Directory);
    // End:0x4d
    if(!SetFileManager())
    {
        Warn("Error setting FileManager!");
    }
    li_Directory = lb_Directory.List;
    li_Directory.FileManager = FileManager;
    li_Directory.__OnChange__Delegate = UpdateCurrentPath;
    li_Directory.__OnDblClick__Delegate = InternalOnDblClick;
    li_Directory.bDropSource = true;
    li_Directory.bMultiSelect = true;
    FileManager.GetDriveLetters(dl);
    co_DriveLetters.MyComboBox.bIgnoreChangeWhenTyping = true;
    i = 0;
    J0xf4:
    // End:0x139 [While If]
    if(i < dl.Length)
    {
        co_DriveLetters.AddItem(dl[i] $ FileManager.GetPathSeparator());
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf4;
    }
    InitializeDirectoryList();
}

function DCOnChange(GUIComponent Sender)
{
    local string S;

    S = co_DriveLetters.GetText();
    li_Directory.ChDir(S);
}

function HandleParameters(string Param1, string Param2)
{
    t_WindowTitle.SetCaption(WindowName @ "-" @ Param1);
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    PlaylistManager.Save();
}

function bool InternalOnKeyEvent(out byte iKey, out byte State, float Delta)
{
    local Engine.Interactions.EInputKey key;

    // End:0x23
    if(State != 3 || FocusedControl != lb_Directory)
    {
        return false;
    }
    key = iKey;
    // End:0x77
    if(key == 8 || key == 37 || key == 100)
    {
        li_Directory.ChDir("..");
        return true;
    }
    // End:0xb4
    if(key == 13 || key == 39 || key == 102)
    {
        InternalOnDblClick(none);
        return true;
    }
    return false;
}

function bool InternalOnClick(GUIComponent Sender)
{
    local array<string> items;
    local int i, PlaylistIndex, idx;
    local bool bResult;

    switch(Sender)
    {
        // End:0xb7
        case b_Add:
            items = li_Directory.GetPendingItems(true);
            PlaylistIndex = PlaylistManager.GetCurrentIndex();
            idx = PlaylistManager.GetCurrentPlaylist().GetPlaylistLength();
            i = items.Length - 1;
            J0x68:
            // End:0xb0 [While If]
            if(i >= 0)
            {
                bResult = PlaylistManager.InsertInPlaylist(PlaylistIndex, idx, items[i], i > 0);
                -- i;
                // This is an implied JumpToken; Continue!
                goto J0x68;
            }
            return bResult;
        // End:0xd1
        case b_Done:
            Controller.CloseMenu(false);
            return true;
        // End:0xffff
        default:
            return false;
    }
}

function ContextClick(GUIContextMenu Menu, int Index)
{
    local FilePath Path;

    PlaylistManager.ParsePath(li_Directory.Get(true), Path);
    switch(Menu.ContextItems[Index])
    {
        // End:0x65
        case GeneralFileItems[0]:
            Handler.PlaySong(Path.FullPath, 0.0);
            // End:0x13d
            break;
        // End:0x8b
        case PlaylistItems[0]:
            PlaylistManager.RemoveFromCurrentPlaylist(Path.FullPath);
            // End:0x13d
            break;
        // End:0x95
        case GeneralFolderItems[0]:
        // End:0xb2
        case NonPlaylistItems[0]:
            AddToPlaylist(Path.FullPath);
            // End:0x13d
            break;
        // End:0xed
        case NonPlaylistItems[1]:
            AddToPlaylist(Path.FullPath);
            Handler.PlaySong(Path.FullPath, 0.0);
            // End:0x13d
            break;
        // End:0x11d
        case ImportItems[0]:
            PlaylistManager.ImportPlaylist(-1, -1, Path.FullPath);
            // End:0x13d
            break;
        // End:0x13a
        case ImportItems[1]:
            AddToPlaylist(Path.FullPath);
            // End:0x13d
            break;
        // End:0xffff
        default:
}

function UpdateCurrentPath(GUIComponent Sender)
{
    // End:0x2d
    if(Sender == li_Directory)
    {
        co_DriveLetters.SetText(FileManager.GetCurrentDirectory());
    }
}

function bool InternalOnDblClick(GUIComponent Sender)
{
    local string S;

    S = li_Directory.Get();
    // End:0x45
    if(PlaylistManager.HasExtension(S))
    {
        AddToPlaylist(li_Directory.Get(true));
    }
    // End:0x63
    else
    {
        li_Directory.ChDir(li_Directory.GetPath());
    }
    return true;
}

function bool AddPreDraw(Canvas C)
{
    // End:0x18
    if(!bCaptureMouse || bMoving)
    {
        return false;
    }
    b_Add.WinTop = b_Add.RelativeTop(lb_Directory.ActualTop());
    return true;
}

function bool ClosePreDraw(Canvas C)
{
    // End:0x18
    if(!bCaptureMouse || bMoving)
    {
        return false;
    }
    b_Done.WinTop = b_Done.RelativeTop(lb_Directory.ActualTop() + lb_Directory.ActualHeight() - b_Done.ActualHeight());
    return true;
}

function bool InternalRightClick(GUIComponent Sender)
{
    // End:0x27
    if(Controller == none || Controller.ActiveControl != li_Directory)
    {
        return false;
    }
    return true;
}

function bool ContextOpen(GUIContextMenu Menu)
{
    local string selected;
    local FilePath Path;

    selected = li_Directory.Get(true);
    // End:0x138
    if(PlaylistManager.ParsePath(selected, Path))
    {
        // End:0x136
        if(Path.FullPath != "")
        {
            // End:0x122
            if(Path.Extension != "")
            {
                Menu.ContextItems = GeneralFileItems;
                // End:0xc5
                if(Path.Extension == "m3u" || Path.Extension == "b4u" || Path.Extension == "pls")
                {
                    Menu.ContextItems += ImportItems;
                }
                // End:0x11f
                else
                {
                    // End:0x105
                    if(CurrentPlaylist.FindIndexByPath(Path.FullPath) != -1)
                    {
                        Menu.ContextItems += PlaylistItems;
                    }
                    // End:0x11f
                    else
                    {
                        Menu.ContextItems += NonPlaylistItems;
                    }
                }
            }
            // End:0x136
            else
            {
                Menu.ContextItems = GeneralFolderItems;
            }
        }
        return true;
    }
    return false;
}

function bool SetFileManager()
{
    // End:0x27
    if(FileManager != none)
    {
        // End:0x25
        if(PlaylistManager == none && !SetPlaylistManager())
        {
            return false;
        }
        return true;
    }
    // End:0x41
    if(PlaylistManager == none && !SetPlaylistManager())
    {
        return false;
    }
    FileManager = Handler.FileManager;
    return FileManager != none;
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
    CurrentPlaylist = PlaylistManager.GetCurrentPlaylist();
    return true;
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
    // End:0xa8 [While If]
    if(i < Controller.ViewportOwner.LocalInteractions.Length)
    {
        // End:0x9e
        if(StreamInteraction(Controller.ViewportOwner.LocalInteractions[i]) != none)
        {
            Handler = StreamInteraction(Controller.ViewportOwner.LocalInteractions[i]);
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
    Log("StreamPlayer.SetHandler() - no StreamInteractions found!", 'MusicPlayer');
    return false;
}

function InitializeDirectoryList()
{
    local int i;
    local array<string> Drives;

    // End:0x44
    if(!FileManager.GetDriveLetters(Drives))
    {
        Warn("FileManager returned no valid drives!");
        return;
    }
    li_Directory.bNotify = false;
    li_Directory.Clear();
    i = 0;
    J0x6b:
    // End:0xa0 [While If]
    if(i < Drives.Length)
    {
        li_Directory.AddNode(none, Drives[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6b;
    }
    li_Directory.bNotify = true;
    li_Directory.ChDir(FileManager.GetCurrentDirectory());
}

function bool AddToPlaylist(string fileName)
{
    return PlaylistManager.AddToPlaylist(-1, fileName);
}

function bool HandleDebugExec(string Command, string Param)
{
    return li_Directory.HandleDebugExec(Command, Param);
}

function bool FloatingPreDraw(Canvas C)
{
    local float AT, bh, BL, bt;
    local bool B;

    B = super.FloatingPreDraw(C);
    bh = b_Done.ActualHeight();
    bt = ActualTop() + ActualHeight() - float(20) - bh;
    BL = ActualLeft() + ActualWidth() - float(24) - b_Done.ActualWidth();
    b_Done.WinTop = b_Done.RelativeTop(bt);
    b_Done.WinLeft = b_Done.RelativeLeft(BL);
    BL -= b_Add.ActualWidth() + ActualWidth() * 0.010;
    b_Add.WinLeft = b_Add.RelativeLeft(BL);
    b_Add.WinTop = b_Add.RelativeTop(bt);
    AT = t_WindowTitle.ActualTop() + t_WindowTitle.ActualHeight() + ActualHeight() * 0.010;
    co_DriveLetters.WinLeft = co_DriveLetters.RelativeLeft(ActualLeft() + ActualWidth() * 0.040);
    co_DriveLetters.WinTop = co_DriveLetters.RelativeTop(AT);
    co_DriveLetters.WinWidth = co_DriveLetters.RelativeWidth(ActualWidth() * 0.920);
    AT += co_DriveLetters.ActualHeight() + ActualHeight() * 0.010;
    sb_Main.WinTop = sb_Main.RelativeTop(AT);
    sb_Main.WinHeight = sb_Main.RelativeHeight(bt - ActualHeight() * 0.010 - AT);
    sb_Main.WinLeft = sb_Main.RelativeLeft(ActualLeft());
    sb_Main.WinWidth = sb_Main.RelativeWidth(ActualWidth());
    return B;
}

defaultproperties
{
    begin object name=MainPanel class=AltSectionBackground
        WinTop=0.150
        WinHeight=0.70
        RenderWeight=0.20
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'StreamPlaylistEditor.MainPanel'
    sb_Main=MainPanel
    begin object name=UserDirectory class=DirectoryTreeListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.0277780
        WinLeft=0.0208330
        WinWidth=0.7604130
        WinHeight=0.9395830
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: DirectoryTreeListBox'StreamPlaylistEditor.UserDirectory'
    lb_Directory=UserDirectory
    begin object name=AddButton class=GUIButton
        Caption="??"
        Hint="??? ????? ??? ???? ??. ?? ????? ????, ???? ?? ?? ?? ????? ??? ???? ?????."
        WinTop=0.0416670
        WinLeft=0.8229170
        WinWidth=0.145830
        ScalingType=1
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'StreamPlaylistEditor.AddButton'
    b_Add=AddButton
    begin object name=CloseButton class=GUIButton
        Caption="??"
        WinTop=0.8444440
        WinLeft=0.8229170
        WinWidth=0.1562470
        ScalingType=1
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'StreamPlaylistEditor.CloseButton'
    b_Done=CloseButton
    begin object name=lbDriveLetters class=moComboBox
        CaptionWidth=0.30
        Caption="????:"
        OnCreateComponent=InternalOnCreateComponent
        FontScale=0
        WinTop=0.10
        WinLeft=0.10
        WinWidth=0.90
        WinHeight=32.0
        OnChange=DCOnChange
    object end
    // Reference: moComboBox'StreamPlaylistEditor.lbDriveLetters'
    co_DriveLetters=lbDriveLetters
    GeneralFileItems=// Object reference not set to an instance of an object.
    
    GeneralFolderItems=// Object reference not set to an instance of an object.
    
    PlaylistItems=// Object reference not set to an instance of an object.
    
    NonPlaylistItems=// Object reference not set to an instance of an object.
    
    ImportItems=// Object reference not set to an instance of an object.
    
    WindowName="??? ??? ??"
    MinPageWidth=0.3750
    MinPageHeight=0.2279020
    bCaptureInput=true
    bPersistent=true
    begin object name=RCMenu class=GUIContextMenu
        OnOpen=ContextOpen
        OnSelect=ContextClick
    object end
    // Reference: GUIContextMenu'StreamPlaylistEditor.RCMenu'
    ContextMenu=RCMenu
    OnRightClick=InternalRightClick
    OnKeyEvent=InternalOnKeyEvent
}