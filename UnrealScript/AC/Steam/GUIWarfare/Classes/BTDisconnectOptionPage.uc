/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTDisconnectOptionPage.uc
 * Package Imports:
 *	GUIWarfare
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:13
 *	Functions:14
 *
 *******************************************************************************/
class BTDisconnectOptionPage extends BlackoutWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_ServerBrowser;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Reconnect;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Quit;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelStatus;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonGoBack;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbBackGroundLine;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbBackGroundImg;
var export editinline BTOwnerDrawImageHK l_Status;
var export editinline BTOwnerDrawImageHK BackGroundLine;
var export editinline BTOwnerDrawImageHK BackgroundImg;
var export editinline BTOwnerDrawCaptionButtonHK b_MainMenu;
var() bool bReconnectAllowed;
var localized string CaptionGoToWaitingRoom;

function bool b_MainMenu_OnClick(GUIComponent Sender)
{
    Log("[BTDisconnectOptionPage::b_MainMenu_OnClick]");
    Controller.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportC(0, 6, l_Status.Caption);
    UT2K4GUIController(Controller).ReturnToMainMenu();
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    Log("[BTDisconnectOptionPage::InitComponent]");
    i_FrameBG = none;
    bBoundToParent = false;
    BackgroundImg = BTOwnerDrawImageHK(NewComponent(new class'BTOwnerDrawImageHK', fbBackGroundImg, 0.70));
    BackgroundImg.BackgroundImage = class'BTUIResourcePoolHK'.default.img_back1;
    BackGroundLine = BTOwnerDrawImageHK(NewComponent(new class'BTOwnerDrawImageHK', fbBackGroundLine, 0.80));
    BackGroundLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_panel_small_stretch;
    l_Status = BTOwnerDrawImageHK(NewComponent(new class'BTOwnerDrawImageHK', fbLabelStatus, 0.90));
    l_Status.SetDefaultFontColor();
    l_Status.SetFontSizeAll(10);
    b_MainMenu = BTOwnerDrawCaptionButtonHK(NewComponent(new class'BTOwnerDrawCaptionButtonHK', fbButtonGoBack, 1.0));
    b_MainMenu.SetDefaultButtonImage();
    b_MainMenu.SetDefaultFontColor();
    b_MainMenu.SetFontSizeAll(10);
    b_MainMenu.__OnClick__Delegate = b_MainMenu_OnClick;
    PlayerOwner().ClearProgressMessages();
    SetSizingCaption();
    Controller.TcpHandler.sfReqDisconnectGame();
    b_Reconnect.SetEnabled(false);
    b_ServerBrowser.SetEnabled(false);
    ApplyLocalizedStrings();
}

function ApplyLocalizedStrings()
{
    b_MainMenu.Caption = CaptionGoToWaitingRoom;
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
        l_Status.Caption $= " ";
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
    // End:0x29
    if(bReconnectAllowed && !PlayerOwner().Level.IsPendingConnection())
    {
    }
    // End:0x38
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
        // End:0x9e
        case b_MainMenu.Caption:
            C.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportC(0, 6, l_Status.Caption);
            UT2K4GUIController(C).ReturnToMainMenu();
            return true;
        // End:0x12b
        case b_ServerBrowser.Caption:
            // End:0xe9
            if(PlayerOwner().Level.IsPendingConnection())
            {
                C.OpenMenu(C.GetServerBrowserPage());
            }
            // End:0x129
            else
            {
                C.CloseAll(true, true);
                C.RestoreMenus.Length = 0;
                C.OpenMenu(C.GetServerBrowserPage());
            }
            return true;
        // End:0x15c
        case b_Quit.Caption:
            C.OpenMenu(C.GetQuitPage());
            return true;
        // End:0x1ab
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
    // End:0x60
    if(MenuClass ~= "GUI2k4.UT2K4DisconnectOptionPage" || MenuClass ~= "GUIWarfare.BTDisconnectOptionPage")
    {
        return false;
    }
    // End:0x62
    else
    {
        return true;
    }
}

defaultproperties
{
    fbLabelStatus=(X1=0.0,Y1=291.0,X2=1024.0,Y2=358.0)
    fbButtonGoBack=(X1=321.0,Y1=364.0,X2=472.0,Y2=395.0)
    fbBackGroundLine=(X1=0.0,Y1=230.0,X2=1024.0,Y2=460.0)
    fbBackGroundImg=(X1=0.0,Y1=0.0,X2=1024.0,Y2=768.0)
    bReconnectAllowed=true
    CaptionGoToWaitingRoom="To Lobby"
    bAllowedAsLast=true
    OnCanClose=CanClose
    WinTop=0.0
    WinHeight=1.0
    OnPreDraw=InternalOnPreDraw
    OnKeyEvent=InternalOnKeyEvent
}