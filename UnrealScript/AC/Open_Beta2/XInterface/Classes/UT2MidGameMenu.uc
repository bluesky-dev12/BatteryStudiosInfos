class UT2MidGameMenu extends UT2K3GUIPage
    editinlinenew
    instanced;

var bool bIgnoreEsc;
var localized string LeaveMPButtonText;
var localized string LeaveSPButtonText;
var localized string LeaveEntryButtonText;
var float ButtonWidth;
var float ButtonHeight;
var float ButtonHGap;
var float ButtonVGap;
var float BarHeight;
var float BarVPos;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPage).InitComponent(MyController, myOwner);
    __OnKeyEvent__Delegate = InternalOnKeyEvent;
    __OnClose__Delegate = InternalOnClose;
    Controls[0].WinHeight = BarHeight;
    Controls[0].WinWidth = 1.0000000;
    Controls[0].WinTop = BarVPos - (0.5000000 * BarHeight);
    Controls[0].WinLeft = 0.0000000;
    Controls[1].WinTop = (BarVPos - ButtonVGap) - (1.5000000 * ButtonHeight);
    Controls[1].WinLeft = 0.5000000 - (0.5000000 * ButtonWidth);
    Controls[2].WinTop = BarVPos - (0.5000000 * ButtonHeight);
    Controls[2].WinLeft = (0.5000000 - (1.5000000 * ButtonWidth)) - ButtonHGap;
    Controls[3].WinTop = Controls[1].WinTop;
    Controls[3].WinLeft = Controls[2].WinLeft;
    Controls[4].WinTop = Controls[1].WinTop;
    Controls[4].WinLeft = (0.5000000 + (0.5000000 * ButtonWidth)) + ButtonHGap;
    Controls[5].WinTop = Controls[2].WinTop;
    Controls[5].WinLeft = Controls[4].WinLeft;
    Controls[6].WinTop = Controls[2].WinTop;
    Controls[6].WinLeft = Controls[1].WinLeft;
    Controls[7].WinTop = (BarVPos + ButtonVGap) + (0.5000000 * ButtonHeight);
    Controls[7].WinLeft = Controls[1].WinLeft;
    i = 1;
    J0x29F:

    // End:0x2E9 [Loop If]
    if(i < 8)
    {
        Controls[i].WinWidth = ButtonWidth;
        Controls[i].WinHeight = ButtonHeight;
        i++;
        // [Loop Continue]
        goto J0x29F;
    }
    Controls[5].bVisible = PlayerOwner().GameReplicationInfo.bTeamGame;
    // End:0x367
    if((PlayerOwner().Level.Game != none) && PlayerOwner().Level.Game.CurrentGameProfile != none)
    {
        Controls[5].bVisible = false;
    }
    // End:0x3A6
    if(int(PlayerOwner().Level.NetMode) != int(NM_Standalone))
    {
        GUIButton(Controls[3]).Caption = LeaveMPButtonText;        
    }
    else
    {
        GUIButton(Controls[3]).Caption = LeaveSPButtonText;
    }
    // End:0x406
    if((int(PlayerOwner().Level.NetMode) == int(NM_Client)) && !CurrentServerIsInFavorites())
    {
        Controls[6].bVisible = true;        
    }
    else
    {
        Controls[6].bVisible = false;
    }
    //return;    
}

function bool CurrentServerIsInFavorites()
{
    local string Address, IPString, portString;
    local int colonPos, portNum, i;

    Address = PlayerOwner().GetServerNetworkAddress();
    // End:0x21
    if(Address == "")
    {
        return true;
    }
    colonPos = InStr(Address, ":");
    // End:0x55
    if(colonPos < 0)
    {
        IPString = Address;
        portNum = 7777;        
    }
    else
    {
        IPString = Left(Address, colonPos);
        portString = Mid(Address, colonPos + 1);
        portNum = int(portString);
    }
    i = 0;
    J0x90:

    // End:0xFD [Loop If]
    if(i < Class'XInterface_Decompressed.Browser_ServerListPageFavorites'.default.Favorites.Length)
    {
        // End:0xF3
        if((Class'XInterface_Decompressed.Browser_ServerListPageFavorites'.default.Favorites[i].IP == IPString) && Class'XInterface_Decompressed.Browser_ServerListPageFavorites'.default.Favorites[i].Port == portNum)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x90;
    }
    return false;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x23
    if(bIgnoreEsc && int(key) == 27)
    {
        bIgnoreEsc = false;
        return true;
    }
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x43
    if((PC != none) && PC.Level.Pauser != none)
    {
        PC.SetPause(false);
    }
    OnClose(bCanceled);
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x3C
    if(Sender == Controls[2])
    {
        Controller.OpenMenu("xinterface.UT2QuitPage");        
    }
    else
    {
        // End:0xD6
        if(Sender == Controls[3])
        {
            PlayerOwner().ConsoleCommand("DISCONNECT");
            // End:0xC4
            if(PlayerOwner().Level.Game.CurrentGameProfile != none)
            {
                PlayerOwner().Level.Game.CurrentGameProfile.ContinueSinglePlayerGame(PlayerOwner().Level, true);                
            }
            else
            {
                Controller.CloseMenu();
            }            
        }
        else
        {
            // End:0xF9
            if(Sender == Controls[1])
            {
                Controller.CloseMenu();                
            }
            else
            {
                // End:0x139
                if(Sender == Controls[4])
                {
                    Controller.OpenMenu("xinterface.UT2SettingsPage");                    
                }
                else
                {
                    // End:0x181
                    if((Sender == Controls[5]) && Controls[5].bVisible)
                    {
                        PlayerOwner().SwitchTeam();
                        Controller.CloseMenu();                        
                    }
                    else
                    {
                        // End:0x1E1
                        if((Sender == Controls[6]) && Controls[6].bVisible)
                        {
                            PlayerOwner().ConsoleCommand("ADDCURRENTTOFAVORITES");
                            Controller.CloseMenu();                            
                        }
                        else
                        {
                            // End:0x21C
                            if(Sender == Controls[7])
                            {
                                Controller.OpenMenu("xinterface.ServerBrowser");
                            }
                        }
                    }
                }
            }
        }
    }
    return true;
    //return;    
}

defaultproperties
{
    bIgnoreEsc=true
    LeaveMPButtonText="Disconnect"
    LeaveSPButtonText="Main Menu"
    LeaveEntryButtonText="Server Browser"
    ButtonWidth=0.2700000
    ButtonHeight=0.0400000
    ButtonHGap=0.0200000
    ButtonVGap=0.0200000
    BarHeight=0.2100000
    BarVPos=0.5000000
    bRequire640x480=false
    bAllowedAsLast=true
    // Reference: GUIButton'XInterface_Decompressed.UT2MidGameMenu.QuitBackground'
    begin object name="QuitBackground" class=XInterface_Decompressed.GUIButton
        StyleName="SquareBar"
        bAcceptsInput=false
        bNeverFocus=true
        OnKeyEvent=QuitBackground.InternalOnKeyEvent
    end object
    Controls[0]=QuitBackground
    // Reference: GUIButton'XInterface_Decompressed.UT2MidGameMenu.ContMatchButton'
    begin object name="ContMatchButton" class=XInterface_Decompressed.GUIButton
        Caption="Continue"
        StyleName="MidGameButton"
        OnClick=UT2MidGameMenu.InternalOnClick
        OnKeyEvent=ContMatchButton.InternalOnKeyEvent
    end object
    Controls[1]=ContMatchButton
    // Reference: GUIButton'XInterface_Decompressed.UT2MidGameMenu.QuitGameButton'
    begin object name="QuitGameButton" class=XInterface_Decompressed.GUIButton
        Caption="Exit UT2004"
        StyleName="MidGameButton"
        OnClick=UT2MidGameMenu.InternalOnClick
        OnKeyEvent=QuitGameButton.InternalOnKeyEvent
    end object
    Controls[2]=QuitGameButton
    // Reference: GUIButton'XInterface_Decompressed.UT2MidGameMenu.LeaveMatchButton'
    begin object name="LeaveMatchButton" class=XInterface_Decompressed.GUIButton
        StyleName="MidGameButton"
        OnClick=UT2MidGameMenu.InternalOnClick
        OnKeyEvent=LeaveMatchButton.InternalOnKeyEvent
    end object
    Controls[3]=LeaveMatchButton
    // Reference: GUIButton'XInterface_Decompressed.UT2MidGameMenu.SettingsButton'
    begin object name="SettingsButton" class=XInterface_Decompressed.GUIButton
        Caption="Settings"
        StyleName="MidGameButton"
        OnClick=UT2MidGameMenu.InternalOnClick
        OnKeyEvent=SettingsButton.InternalOnKeyEvent
    end object
    Controls[4]=SettingsButton
    // Reference: GUIButton'XInterface_Decompressed.UT2MidGameMenu.ChangeTeamButton'
    begin object name="ChangeTeamButton" class=XInterface_Decompressed.GUIButton
        Caption="Change Teams"
        StyleName="MidGameButton"
        OnClick=UT2MidGameMenu.InternalOnClick
        OnKeyEvent=ChangeTeamButton.InternalOnKeyEvent
    end object
    Controls[5]=ChangeTeamButton
    // Reference: GUIButton'XInterface_Decompressed.UT2MidGameMenu.AddFavoriteButton'
    begin object name="AddFavoriteButton" class=XInterface_Decompressed.GUIButton
        Caption="Add to Favorites"
        StyleName="MidGameButton"
        OnClick=UT2MidGameMenu.InternalOnClick
        OnKeyEvent=AddFavoriteButton.InternalOnKeyEvent
    end object
    Controls[6]=AddFavoriteButton
    // Reference: GUIButton'XInterface_Decompressed.UT2MidGameMenu.BrowserButton'
    begin object name="BrowserButton" class=XInterface_Decompressed.GUIButton
        Caption="Server Browser"
        StyleName="MidGameButton"
        OnClick=UT2MidGameMenu.InternalOnClick
        OnKeyEvent=BrowserButton.InternalOnKeyEvent
    end object
    Controls[7]=BrowserButton
}