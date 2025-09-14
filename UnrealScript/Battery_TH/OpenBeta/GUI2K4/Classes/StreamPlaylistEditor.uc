class StreamPlaylistEditor extends FloatingWindow
    editinlinenew
    instanced;

var() editconst noexport editinline StreamInteraction Handler;
var() editconst noexport editinline StreamInterface FileManager;
var() editconst noexport editinline StreamPlaylistManager PlaylistManager;
var() noexport editinline StreamPlaylist CurrentPlaylist;
var() /*0x00000000-0x00000008*/ noexport editinline DirectoryTreeList li_Directory;
var() automated GUISectionBackground sb_Main;
var() automated DirectoryTreeListBox lb_Directory;
var() automated GUIButton b_Add;
var() automated GUIButton b_Done;
var() automated moComboBox co_DriveLetters;
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

    // End:0x5A [Loop If]
    if(i < B.Length)
    {
        A[j++] = B[i];
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    return A;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local array<string> dl;
    local int i;

    super.InitComponent(MyController, myOwner);
    sb_Main.ManageComponent(lb_Directory);
    // End:0x4D
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
    J0xF4:

    // End:0x139 [Loop If]
    if(i < dl.Length)
    {
        co_DriveLetters.AddItem(dl[i] $ FileManager.GetPathSeparator());
        i++;
        // [Loop Continue]
        goto J0xF4;
    }
    InitializeDirectoryList();
    //return;    
}

function DCOnChange(GUIComponent Sender)
{
    local string S;

    S = co_DriveLetters.GetText();
    li_Directory.ChDir(S);
    //return;    
}

function HandleParameters(string Param1, string Param2)
{
    t_WindowTitle.SetCaption((WindowName @ "-") @ Param1);
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    PlaylistManager.Save();
    //return;    
}

function bool InternalOnKeyEvent(out byte iKey, out byte State, float Delta)
{
    local Interactions.EInputKey key;

    // End:0x23
    if((int(State) != int(3)) || FocusedControl != lb_Directory)
    {
        return false;
    }
    key = iKey;
    // End:0x77
    if(((int(key) == int(8)) || int(key) == int(37)) || int(key) == int(100))
    {
        li_Directory.ChDir("..");
        return true;
    }
    // End:0xB4
    if(((int(key) == int(13)) || int(key) == int(39)) || int(key) == int(102))
    {
        InternalOnDblClick(none);
        return true;
    }
    return false;
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local array<string> items;
    local int i, PlaylistIndex, idx;
    local bool bResult;

    switch(Sender)
    {
        // End:0xB7
        case b_Add:
            items = li_Directory.GetPendingItems(true);
            PlaylistIndex = PlaylistManager.GetCurrentIndex();
            idx = PlaylistManager.GetCurrentPlaylist().GetPlaylistLength();
            i = items.Length - 1;
            J0x68:

            // End:0xB0 [Loop If]
            if(i >= 0)
            {
                bResult = PlaylistManager.InsertInPlaylist(PlaylistIndex, idx, items[i], i > 0);
                i--;
                // [Loop Continue]
                goto J0x68;
            }
            return bResult;
        // End:0xD1
        case b_Done:
            Controller.CloseMenu(false);
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

function ContextClick(GUIContextMenu Menu, int Index)
{
    local FilePath Path;

    PlaylistManager.ParsePath(li_Directory.Get(true), Path);
    switch(Menu.ContextItems[Index])
    {
        // End:0x65
        case GeneralFileItems[0]:
            Handler.PlaySong(Path.FullPath, 0.0000000);
            // End:0x13D
            break;
        // End:0x8B
        case PlaylistItems[0]:
            PlaylistManager.RemoveFromCurrentPlaylist(Path.FullPath);
            // End:0x13D
            break;
        // End:0x95
        case GeneralFolderItems[0]:
        // End:0xB2
        case NonPlaylistItems[0]:
            AddToPlaylist(Path.FullPath);
            // End:0x13D
            break;
        // End:0xED
        case NonPlaylistItems[1]:
            AddToPlaylist(Path.FullPath);
            Handler.PlaySong(Path.FullPath, 0.0000000);
            // End:0x13D
            break;
        // End:0x11D
        case ImportItems[0]:
            PlaylistManager.ImportPlaylist(-1, -1, Path.FullPath);
            // End:0x13D
            break;
        // End:0x13A
        case ImportItems[1]:
            AddToPlaylist(Path.FullPath);
            // End:0x13D
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function UpdateCurrentPath(GUIComponent Sender)
{
    // End:0x2D
    if(Sender == li_Directory)
    {
        co_DriveLetters.SetText(FileManager.GetCurrentDirectory());
    }
    //return;    
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
    else
    {
        li_Directory.ChDir(li_Directory.GetPath());
    }
    return true;
    //return;    
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
    //return;    
}

function bool ClosePreDraw(Canvas C)
{
    // End:0x18
    if(!bCaptureMouse || bMoving)
    {
        return false;
    }
    b_Done.WinTop = b_Done.RelativeTop((lb_Directory.ActualTop() + lb_Directory.ActualHeight()) - b_Done.ActualHeight());
    return true;
    //return;    
}

function bool InternalRightClick(GUIComponent Sender)
{
    // End:0x27
    if((Controller == none) || Controller.ActiveControl != li_Directory)
    {
        return false;
    }
    return true;
    //return;    
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
                // End:0xC5
                if(((Path.Extension == "m3u") || Path.Extension == "b4u") || Path.Extension == "pls")
                {
                    Menu.ContextItems += ImportItems;                    
                }
                else
                {
                    // End:0x105
                    if(CurrentPlaylist.FindIndexByPath(Path.FullPath) != -1)
                    {
                        Menu.ContextItems += PlaylistItems;                        
                    }
                    else
                    {
                        Menu.ContextItems += NonPlaylistItems;
                    }
                }                
            }
            else
            {
                Menu.ContextItems = GeneralFolderItems;
            }
        }
        return true;
    }
    return false;
    //return;    
}

function bool SetFileManager()
{
    // End:0x27
    if(FileManager != none)
    {
        // End:0x25
        if((PlaylistManager == none) && !SetPlaylistManager())
        {
            return false;
        }
        return true;
    }
    // End:0x41
    if((PlaylistManager == none) && !SetPlaylistManager())
    {
        return false;
    }
    FileManager = Handler.FileManager;
    return FileManager != none;
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
    CurrentPlaylist = PlaylistManager.GetCurrentPlaylist();
    return true;
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

    // End:0xA8 [Loop If]
    if(i < Controller.ViewportOwner.LocalInteractions.Length)
    {
        // End:0x9E
        if(StreamInteraction(Controller.ViewportOwner.LocalInteractions[i]) != none)
        {
            Handler = StreamInteraction(Controller.ViewportOwner.LocalInteractions[i]);
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
    J0x6B:

    // End:0xA0 [Loop If]
    if(i < Drives.Length)
    {
        li_Directory.AddNode(none, Drives[i]);
        i++;
        // [Loop Continue]
        goto J0x6B;
    }
    li_Directory.bNotify = true;
    li_Directory.ChDir(FileManager.GetCurrentDirectory());
    //return;    
}

function bool AddToPlaylist(string fileName)
{
    return PlaylistManager.AddToPlaylist(-1, fileName);
    //return;    
}

function bool HandleDebugExec(string Command, string Param)
{
    return li_Directory.HandleDebugExec(Command, Param);
    //return;    
}

function bool FloatingPreDraw(Canvas C)
{
    local float AT, bh, BL, bt;
    local bool B;

    B = super.FloatingPreDraw(C);
    bh = b_Done.ActualHeight();
    bt = ((ActualTop() + ActualHeight()) - float(20)) - bh;
    BL = ((ActualLeft() + ActualWidth()) - float(24)) - b_Done.ActualWidth();
    b_Done.WinTop = b_Done.RelativeTop(bt);
    b_Done.WinLeft = b_Done.RelativeLeft(BL);
    BL -= (b_Add.ActualWidth() + (ActualWidth() * 0.0100000));
    b_Add.WinLeft = b_Add.RelativeLeft(BL);
    b_Add.WinTop = b_Add.RelativeTop(bt);
    AT = (t_WindowTitle.ActualTop() + t_WindowTitle.ActualHeight()) + (ActualHeight() * 0.0100000);
    co_DriveLetters.WinLeft = co_DriveLetters.RelativeLeft(ActualLeft() + (ActualWidth() * 0.0400000));
    co_DriveLetters.WinTop = co_DriveLetters.RelativeTop(AT);
    co_DriveLetters.WinWidth = co_DriveLetters.RelativeWidth(ActualWidth() * 0.9200000);
    AT += (co_DriveLetters.ActualHeight() + (ActualHeight() * 0.0100000));
    sb_Main.WinTop = sb_Main.RelativeTop(AT);
    sb_Main.WinHeight = sb_Main.RelativeHeight((bt - (ActualHeight() * 0.0100000)) - AT);
    sb_Main.WinLeft = sb_Main.RelativeLeft(ActualLeft());
    sb_Main.WinWidth = sb_Main.RelativeWidth(ActualWidth());
    return B;
    //return;    
}

defaultproperties
{
    // Reference: AltSectionBackground'GUI2K4_Decompressed.StreamPlaylistEditor.MainPanel'
    begin object name="MainPanel" class=GUI2K4_Decompressed.AltSectionBackground
        WinTop=0.1500000
        WinHeight=0.7000000
        RenderWeight=0.2000000
        OnPreDraw=MainPanel.InternalPreDraw
    end object
    sb_Main=MainPanel
    // Reference: DirectoryTreeListBox'GUI2K4_Decompressed.StreamPlaylistEditor.UserDirectory'
    begin object name="UserDirectory" class=GUI2K4_Decompressed.DirectoryTreeListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=UserDirectory.InternalOnCreateComponent
        WinTop=0.0277780
        WinLeft=0.0208330
        WinWidth=0.7604130
        WinHeight=0.9395830
        bBoundToParent=true
        bScaleToParent=true
    end object
    lb_Directory=UserDirectory
    // Reference: GUIButton'GUI2K4_Decompressed.StreamPlaylistEditor.AddButton'
    begin object name="AddButton" class=XInterface.GUIButton
        Caption="??"
        Hint="??? ????? ??? ???? ??. ?? ????? ????, ???? ?? ?? ?? ????? ??? ???? ?????."
        WinTop=0.0416670
        WinLeft=0.8229170
        WinWidth=0.1458300
        ScalingType=1
        OnClick=StreamPlaylistEditor.InternalOnClick
        OnKeyEvent=AddButton.InternalOnKeyEvent
    end object
    b_Add=AddButton
    // Reference: GUIButton'GUI2K4_Decompressed.StreamPlaylistEditor.CloseButton'
    begin object name="CloseButton" class=XInterface.GUIButton
        Caption="??"
        WinTop=0.8444440
        WinLeft=0.8229170
        WinWidth=0.1562470
        ScalingType=1
        OnClick=StreamPlaylistEditor.InternalOnClick
        OnKeyEvent=CloseButton.InternalOnKeyEvent
    end object
    b_Done=CloseButton
    // Reference: moComboBox'GUI2K4_Decompressed.StreamPlaylistEditor.lbDriveLetters'
    begin object name="lbDriveLetters" class=XInterface.moComboBox
        CaptionWidth=0.3000000
        Caption="????:"
        OnCreateComponent=lbDriveLetters.InternalOnCreateComponent
        FontScale=0
        WinTop=0.1000000
        WinLeft=0.1000000
        WinWidth=0.9000000
        WinHeight=32.0000000
        OnChange=StreamPlaylistEditor.DCOnChange
    end object
    co_DriveLetters=lbDriveLetters
    GeneralFileItems[0]="???"
    GeneralFolderItems[0]="??? ???? ??"
    PlaylistItems[0]="??? ????? ??"
    NonPlaylistItems[0]="??? ???? ??"
    NonPlaylistItems[1]="??? ???? ??& ???"
    ImportItems[0]="??? ??? ???? ????"
    ImportItems[1]="??? ??? ???? ????"
    WindowName="??? ??? ??"
    MinPageWidth=0.3750000
    MinPageHeight=0.2279020
    bCaptureInput=false
    bPersistent=true
    // Reference: GUIContextMenu'GUI2K4_Decompressed.StreamPlaylistEditor.RCMenu'
    begin object name="RCMenu" class=XInterface.GUIContextMenu
        OnOpen=StreamPlaylistEditor.ContextOpen
        OnSelect=StreamPlaylistEditor.ContextClick
    end object
    ContextMenu=RCMenu
    OnRightClick=StreamPlaylistEditor.InternalRightClick
    OnKeyEvent=StreamPlaylistEditor.InternalOnKeyEvent
}