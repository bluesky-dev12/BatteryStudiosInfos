class UT2K4DisconnectOptionPage extends BlackoutWindow
    editinlinenew
    instanced;

var() automated GUIButton b_MainMenu;
var() automated GUIButton b_ServerBrowser;
var() automated GUIButton b_Reconnect;
var() automated GUIButton b_Quit;
var() automated GUILabel l_Status;
var() bool bReconnectAllowed;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    PlayerOwner().ClearProgressMessages();
    SetSizingCaption();
    Controller.TcpHandler.sfReqDisconnectGame();
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
        l_Status.Caption $= "|";
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
    // End:0x38
    if(bReconnectAllowed && !PlayerOwner().Level.IsPendingConnection())
    {
        b_Reconnect.EnableMe();        
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
        // End:0x59
        case b_MainMenu.Caption:
            UT2K4GUIController(C).ReturnToMainMenu();
            return true;
        // End:0xE6
        case b_ServerBrowser.Caption:
            // End:0xA4
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
        // End:0x117
        case b_Quit.Caption:
            C.OpenMenu(C.GetQuitPage());
            return true;
        // End:0x166
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
    // End:0x31
    if(MenuClass ~= "GUI2k4.UT2K4DisconnectOptionPage")
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
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4DisconnectOptionPage.MainMenuButton'
    begin object name="MainMenuButton" class=XInterface.GUIButton
        Caption="?????"
        bAutoSize=true
        WinTop=0.5482350
        WinLeft=0.1578110
        WinWidth=0.1328060
        TabOrder=1
        OnClick=UT2K4DisconnectOptionPage.InternalOnClick
        OnKeyEvent=MainMenuButton.InternalOnKeyEvent
    end object
    b_MainMenu=MainMenuButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4DisconnectOptionPage.ServerBrowserButton'
    begin object name="ServerBrowserButton" class=XInterface.GUIButton
        Caption="?? ????"
        bAutoSize=true
        WinTop=0.5482350
        WinLeft=0.3984370
        WinWidth=0.2236320
        TabOrder=2
        OnClick=UT2K4DisconnectOptionPage.InternalOnClick
        OnKeyEvent=ServerBrowserButton.InternalOnKeyEvent
    end object
    b_ServerBrowser=ServerBrowserButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4DisconnectOptionPage.ReconnectButton'
    begin object name="ReconnectButton" class=XInterface.GUIButton
        Caption="???"
        bAutoSize=true
        WinTop=0.5482350
        WinLeft=0.3457020
        WinWidth=0.1328060
        TabOrder=0
        OnClick=UT2K4DisconnectOptionPage.InternalOnClick
        OnKeyEvent=ReconnectButton.InternalOnKeyEvent
    end object
    b_Reconnect=ReconnectButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4DisconnectOptionPage.QuitButton'
    begin object name="QuitButton" class=XInterface.GUIButton
        Caption="UT2004 ???"
        bAutoSize=true
        WinTop=0.5482350
        WinLeft=0.6279290
        WinWidth=0.2236320
        TabOrder=3
        OnClick=UT2K4DisconnectOptionPage.InternalOnClick
        OnKeyEvent=QuitButton.InternalOnKeyEvent
    end object
    b_Quit=QuitButton
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4DisconnectOptionPage.cNetStatLabel'
    begin object name="cNetStatLabel" class=XInterface.GUILabel
        Caption="?? ??"
        TextAlign=1
        bMultiLine=true
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.3146870
        WinHeight=0.0999220
        bBoundToParent=true
    end object
    l_Status=cNetStatLabel
    bReconnectAllowed=true
    bAllowedAsLast=true
    OnCanClose=UT2K4DisconnectOptionPage.CanClose
    OnPreDraw=UT2K4DisconnectOptionPage.InternalOnPreDraw
    OnKeyEvent=UT2K4DisconnectOptionPage.InternalOnKeyEvent
}