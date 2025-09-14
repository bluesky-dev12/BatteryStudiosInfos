class BTDisconnectOptionPage extends BlackoutWindow
    editinlinenew
    instanced;

var() automated GUIButton b_ServerBrowser;
var() automated GUIButton b_Reconnect;
var() automated GUIButton b_Quit;
var() automated FloatBox fbLabelStatus;
var() automated FloatBox fbButtonGoBack;
var() automated FloatBox fbBackGroundLine;
var() automated FloatBox fbBackGroundImg;
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
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    Log("[BTDisconnectOptionPage::InitComponent]");
    i_FrameBG = none;
    bBoundToParent = false;
    BackgroundImg = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls.BTOwnerDrawImageHK', fbBackGroundImg, 0.7000000));
    BackgroundImg.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_back1;
    BackGroundLine = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls.BTOwnerDrawImageHK', fbBackGroundLine, 0.8000000));
    BackGroundLine.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_panel_small_stretch;
    l_Status = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls.BTOwnerDrawImageHK', fbLabelStatus, 0.9000000));
    l_Status.SetDefaultFontColor();
    l_Status.SetFontSizeAll(10);
    b_MainMenu = BTOwnerDrawCaptionButtonHK(NewComponent(new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK', fbButtonGoBack, 1.0000000));
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
    //return;    
}

function ApplyLocalizedStrings()
{
    b_MainMenu.Caption = CaptionGoToWaitingRoom;
    //return;    
}

function SetSizingCaption()
{
    local string S;
    local export editinline GUIButton B;
    local int i;

    i = 0;
    J0x07:

    // End:0x83 [Loop If]
    if(i < Components.Length)
    {
        B = GUIButton(Components[i]);
        // End:0x3B
        if(B == none)
        {
            // [Explicit Continue]
            goto J0x79;
        }
        // End:0x79
        if((S == "") || Len(B.Caption) > Len(S))
        {
            S = B.Caption;
        }
        J0x79:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    i = 0;
    J0x8A:

    // End:0xDC [Loop If]
    if(i < Components.Length)
    {
        B = GUIButton(Components[i]);
        // End:0xBE
        if(B == none)
        {
            // [Explicit Continue]
            goto J0xD2;
        }
        B.SizingCaption = S;
        J0xD2:

        i++;
        // [Loop Continue]
        goto J0x8A;
    }
    //return;    
}

event HandleParameters(string Param1, string Param2)
{
    // End:0x43
    if((Param1 != "") || Param2 != "")
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
    // End:0xB1
    if(l_Status.Caption != "")
    {
        l_Status.Caption $= " ";
    }
    // End:0xD3
    if(Param2 == "noreconnect")
    {
        bReconnectAllowed = false;        
    }
    else
    {
        // End:0xFB
        if(!Param1 ~= Param2)
        {
            l_Status.Caption $= Param2;
        }
    }
    UpdateButtons();
    //return;    
}

function UpdateButtons()
{
    // End:0x29
    if(bReconnectAllowed && !PlayerOwner().Level.IsPendingConnection())
    {        
    }
    else
    {
        b_Reconnect.DisableMe();
    }
    //return;    
}

event Opened(GUIComponent Sender)
{
    // End:0x1A
    if(Controller != none)
    {
        Controller.ConsolidateMenus();
    }
    super(PopupPageBase).Opened(Sender);
    //return;    
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
        // End:0x9E
        case b_MainMenu.Caption:
            C.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportC(0, 6, l_Status.Caption);
            UT2K4GUIController(C).ReturnToMainMenu();
            return true;
        // End:0x12B
        case b_ServerBrowser.Caption:
            // End:0xE9
            if(PlayerOwner().Level.IsPendingConnection())
            {
                C.OpenMenu(C.GetServerBrowserPage());                
            }
            else
            {
                C.CloseAll(true, true);
                C.RestoreMenus.Length = 0;
                C.OpenMenu(C.GetServerBrowserPage());
            }
            return true;
        // End:0x15C
        case b_Quit.Caption:
            C.OpenMenu(C.GetQuitPage());
            return true;
        // End:0x1AB
        case b_Reconnect.Caption:
            C.ViewportOwner.Console.DelayedConsoleCommand("Reconnect");
            C.CloseMenu(false);
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

function UpdateStatus(string NewStatus)
{
    l_Status.Caption = NewStatus;
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    local int i;
    local float X, Width;

    i = 0;
    J0x07:

    // End:0x50 [Loop If]
    if(i < Components.Length)
    {
        // End:0x46
        if(GUIButton(Components[i]) != none)
        {
            Width += Components[i].ActualWidth();
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    Width += float(30);
    X = ((ActualLeft() + ActualWidth()) / float(2)) - (Width / float(2));
    i = 0;
    J0x83:

    // End:0xEF [Loop If]
    if(i < Components.Length)
    {
        // End:0xE5
        if(GUIButton(Components[i]) != none)
        {
            Components[i].WinLeft = RelativeLeft(X);
            X += (Components[i].ActualWidth() + float(10));
        }
        i++;
        // [Loop Continue]
        goto J0x83;
    }
    return false;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x2F
    if((int(key) == 13) && int(State) == 3)
    {
        return InternalOnClick(GUIButton(FocusedControl));
    }
    return false;
    //return;    
}

event bool NotifyLevelChange()
{
    return false;
    //return;    
}

function bool CanClose(bool bCancelled)
{
    // End:0x6A
    if(((bCancelled && Controller.KeyPressed(27)) && !PlayerOwner().Level.IsPendingConnection()) && PlayerOwner().Level.IsEntry())
    {
        return Controller.Count() > 1;
    }
    return true;
    //return;    
}

function bool AllowOpen(string MenuClass)
{
    // End:0x60
    if((MenuClass ~= "GUI2k4.UT2K4DisconnectOptionPage") || MenuClass ~= "GUIWarfare.BTDisconnectOptionPage")
    {
        return false;        
    }
    else
    {
        return true;
    }
    //return;    
}

defaultproperties
{
    fbLabelStatus=(X1=0.0000000,Y1=291.0000000,X2=1024.0000000,Y2=358.0000000)
    fbButtonGoBack=(X1=321.0000000,Y1=364.0000000,X2=472.0000000,Y2=395.0000000)
    fbBackGroundLine=(X1=0.0000000,Y1=230.0000000,X2=1024.0000000,Y2=460.0000000)
    fbBackGroundImg=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=768.0000000)
    bReconnectAllowed=true
    CaptionGoToWaitingRoom="?????"
    bAllowedAsLast=true
    OnCanClose=BTDisconnectOptionPage.CanClose
    WinTop=0.0000000
    WinHeight=1.0000000
    OnPreDraw=BTDisconnectOptionPage.InternalOnPreDraw
    OnKeyEvent=BTDisconnectOptionPage.InternalOnKeyEvent
}