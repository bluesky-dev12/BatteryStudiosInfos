/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4DisconnectOptionPage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:12
 *
 *******************************************************************************/
class UT2K4DisconnectOptionPage extends BlackoutWindow
    dependson(UT2K4GUIController)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_MainMenu;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_ServerBrowser;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Reconnect;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Quit;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Status;
var() bool bReconnectAllowed;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    PlayerOwner().ClearProgressMessages();
    SetSizingCaption();
    Controller.TcpHandler.sfReqDisconnectGame();
}

function SetSizingCaption()
{
    local string S;
    local export editinline GUIButton B;
    local int i;

    i = 0;
    J0x07:
    // End:0x83 [While If]
    if(i < Components.Length)
    {
        B = GUIButton(Components[i]);
        // End:0x3b
        if(B == none)
        {
        }
        // End:0x79
        else
        {
            // End:0x79
            if(S == "" || Len(B.Caption) > Len(S))
            {
                S = B.Caption;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = 0;
    J0x8a:
    // End:0xdc [While If]
    if(i < Components.Length)
    {
        B = GUIButton(Components[i]);
        // End:0xbe
        if(B == none)
        {
        }
        // End:0xd2
        else
        {
            B.SizingCaption = S;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x8a;
    }
}

event HandleParameters(string Param1, string Param2)
{
    // End:0x43
    if(Param1 != "" || Param2 != "")
    {
        Controller.ViewportOwner.Console.DelayedConsoleCommand("CANCEL");
    }
    // End:0x67
    if(InStr(Locs(Param1), "?failed") != -1)
    {
        bReconnectAllowed = false;
    }
    // End:0x87
    if(Param1 != "")
    {
        l_Status.Caption = Param1;
    }
    // End:0xb1
    if(l_Status.Caption != "")
    {
        l_Status.Caption $= "|";
    }
    // End:0xd3
    if(Param2 == "noreconnect")
    {
        bReconnectAllowed = false;
    }
    // End:0xfb
    else
    {
        // End:0xfb
        if(!Param1 ~= Param2)
        {
            l_Status.Caption $= Param2;
        }
    }
    UpdateButtons();
}

function UpdateButtons()
{
    // End:0x38
    if(bReconnectAllowed && !PlayerOwner().Level.IsPendingConnection())
    {
        b_Reconnect.EnableMe();
    }
    // End:0x47
    else
    {
        b_Reconnect.DisableMe();
    }
}

event Opened(GUIComponent Sender)
{
    // End:0x1a
    if(Controller != none)
    {
        Controller.ConsolidateMenus();
    }
    super(PopupPageBase).Opened(Sender);
}

function bool InternalOnClick(GUIComponent Sender)
{
    local GUIController C;

    // End:0x12
    if(GUIButton(Sender) == none)
    {
        return false;
    }
    C = Controller;
    switch(GUIButton(Sender).Caption)
    {
        // End:0x59
        case b_MainMenu.Caption:
            UT2K4GUIController(C).ReturnToMainMenu();
            return true;
        // End:0xe6
        case b_ServerBrowser.Caption:
            // End:0xa4
            if(PlayerOwner().Level.IsPendingConnection())
            {
                C.OpenMenu(C.GetServerBrowserPage());
            }
            // End:0xe4
            else
            {
                C.CloseAll(true, true);
                C.RestoreMenus.Length = 0;
                C.OpenMenu(C.GetServerBrowserPage());
            }
            return true;
        // End:0x117
        case b_Quit.Caption:
            C.OpenMenu(C.GetQuitPage());
            return true;
        // End:0x166
        case b_Reconnect.Caption:
            C.ViewportOwner.Console.DelayedConsoleCommand("Reconnect");
            C.CloseMenu(false);
            return true;
        // End:0xffff
        default:
            return false;
    }
}

function UpdateStatus(string NewStatus)
{
    l_Status.Caption = NewStatus;
}

function bool InternalOnPreDraw(Canvas C)
{
    local int i;
    local float X, width;

    i = 0;
    J0x07:
    // End:0x50 [While If]
    if(i < Components.Length)
    {
        // End:0x46
        if(GUIButton(Components[i]) != none)
        {
            width += Components[i].ActualWidth();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    width += float(30);
    X = ActualLeft() + ActualWidth() / float(2) - width / float(2);
    i = 0;
    J0x83:
    // End:0xef [While If]
    if(i < Components.Length)
    {
        // End:0xe5
        if(GUIButton(Components[i]) != none)
        {
            Components[i].WinLeft = RelativeLeft(X);
            X += Components[i].ActualWidth() + float(10);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x83;
    }
    return false;
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x2f
    if(key == 13 && State == 3)
    {
        return InternalOnClick(GUIButton(FocusedControl));
    }
    return false;
}

event bool NotifyLevelChange()
{
    return false;
}

function bool CanClose(bool bCancelled)
{
    // End:0x6a
    if(bCancelled && Controller.KeyPressed(27) && !PlayerOwner().Level.IsPendingConnection() && PlayerOwner().Level.IsEntry())
    {
        return Controller.Count() > 1;
    }
    return true;
}

function bool AllowOpen(string MenuClass)
{
    // End:0x31
    if(MenuClass ~= "GUI2k4.UT2K4DisconnectOptionPage")
    {
        return false;
    }
    // End:0x33
    else
    {
        return true;
    }
}

defaultproperties
{
    begin object name=MainMenuButton class=GUIButton
        Caption="?????"
        bAutoSize=true
        WinTop=0.5482350
        WinLeft=0.1578110
        WinWidth=0.1328060
        TabOrder=1
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4DisconnectOptionPage.MainMenuButton'
    b_MainMenu=MainMenuButton
    begin object name=ServerBrowserButton class=GUIButton
        Caption="?? ????"
        bAutoSize=true
        WinTop=0.5482350
        WinLeft=0.3984370
        WinWidth=0.2236320
        TabOrder=2
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4DisconnectOptionPage.ServerBrowserButton'
    b_ServerBrowser=ServerBrowserButton
    begin object name=ReconnectButton class=GUIButton
        Caption="???"
        bAutoSize=true
        WinTop=0.5482350
        WinLeft=0.3457020
        WinWidth=0.1328060
        TabOrder=0
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4DisconnectOptionPage.ReconnectButton'
    b_Reconnect=ReconnectButton
    begin object name=QuitButton class=GUIButton
        Caption="UT2004 ???"
        bAutoSize=true
        WinTop=0.5482350
        WinLeft=0.6279290
        WinWidth=0.2236320
        TabOrder=3
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4DisconnectOptionPage.QuitButton'
    b_Quit=QuitButton
    begin object name=cNetStatLabel class=GUILabel
        Caption="?? ??"
        TextAlign=1
        bMultiLine=true
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.3146870
        WinHeight=0.0999220
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4DisconnectOptionPage.cNetStatLabel'
    l_Status=cNetStatLabel
    bReconnectAllowed=true
    bAllowedAsLast=true
    OnCanClose=CanClose
    OnPreDraw=InternalOnPreDraw
    OnKeyEvent=InternalOnKeyEvent
}