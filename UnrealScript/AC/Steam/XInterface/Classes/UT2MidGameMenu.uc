/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2MidGameMenu.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:5
 *
 *******************************************************************************/
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
    Controls[0].WinWidth = 1.0;
    Controls[0].WinTop = BarVPos - 0.50 * BarHeight;
    Controls[0].WinLeft = 0.0;
    Controls[1].WinTop = BarVPos - ButtonVGap - 1.50 * ButtonHeight;
    Controls[1].WinLeft = 0.50 - 0.50 * ButtonWidth;
    Controls[2].WinTop = BarVPos - 0.50 * ButtonHeight;
    Controls[2].WinLeft = 0.50 - 1.50 * ButtonWidth - ButtonHGap;
    Controls[3].WinTop = Controls[1].WinTop;
    Controls[3].WinLeft = Controls[2].WinLeft;
    Controls[4].WinTop = Controls[1].WinTop;
    Controls[4].WinLeft = 0.50 + 0.50 * ButtonWidth + ButtonHGap;
    Controls[5].WinTop = Controls[2].WinTop;
    Controls[5].WinLeft = Controls[4].WinLeft;
    Controls[6].WinTop = Controls[2].WinTop;
    Controls[6].WinLeft = Controls[1].WinLeft;
    Controls[7].WinTop = BarVPos + ButtonVGap + 0.50 * ButtonHeight;
    Controls[7].WinLeft = Controls[1].WinLeft;
    i = 1;
    J0x29f:
    // End:0x2e9 [While If]
    if(i < 8)
    {
        Controls[i].WinWidth = ButtonWidth;
        Controls[i].WinHeight = ButtonHeight;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x29f;
    }
    Controls[5].bVisible = PlayerOwner().GameReplicationInfo.bTeamGame;
    // End:0x367
    if(PlayerOwner().Level.Game != none && PlayerOwner().Level.Game.CurrentGameProfile != none)
    {
        Controls[5].bVisible = false;
    }
    // End:0x3a6
    if(PlayerOwner().Level.NetMode != 0)
    {
        GUIButton(Controls[3]).Caption = LeaveMPButtonText;
    }
    // End:0x3c2
    else
    {
        GUIButton(Controls[3]).Caption = LeaveSPButtonText;
    }
    // End:0x406
    if(PlayerOwner().Level.NetMode == 3 && !CurrentServerIsInFavorites())
    {
        Controls[6].bVisible = true;
    }
    // End:0x41a
    else
    {
        Controls[6].bVisible = false;
    }
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
    // End:0x89
    else
    {
        IPString = Left(Address, colonPos);
        portString = Mid(Address, colonPos + 1);
        portNum = int(portString);
    }
    i = 0;
    J0x90:
    // End:0xfd [While If]
    if(i < class'Browser_ServerListPageFavorites'.default.Favorites.Length)
    {
        // End:0xf3
        if(class'Browser_ServerListPageFavorites'.default.Favorites[i].IP == IPString && class'Browser_ServerListPageFavorites'.default.Favorites[i].Port == portNum)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x90;
    }
    return false;
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x23
    if(bIgnoreEsc && key == 27)
    {
        bIgnoreEsc = false;
        return true;
    }
}

function InternalOnClose(optional bool bCanceled)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x43
    if(PC != none && PC.Level.Pauser != none)
    {
        PC.SetPause(false);
    }
    OnClose(bCanceled);
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x3c
    if(Sender == Controls[2])
    {
        Controller.OpenMenu("xinterface.UT2QuitPage");
    }
    // End:0x21c
    else
    {
        // End:0xd6
        if(Sender == Controls[3])
        {
            PlayerOwner().ConsoleCommand("DISCONNECT");
            // End:0xc4
            if(PlayerOwner().Level.Game.CurrentGameProfile != none)
            {
                PlayerOwner().Level.Game.CurrentGameProfile.ContinueSinglePlayerGame(PlayerOwner().Level, true);
            }
            // End:0xd3
            else
            {
                Controller.CloseMenu();
            }
        }
        // End:0x21c
        else
        {
            // End:0xf9
            if(Sender == Controls[1])
            {
                Controller.CloseMenu();
            }
            // End:0x21c
            else
            {
                // End:0x139
                if(Sender == Controls[4])
                {
                    Controller.OpenMenu("xinterface.UT2SettingsPage");
                }
                // End:0x21c
                else
                {
                    // End:0x181
                    if(Sender == Controls[5] && Controls[5].bVisible)
                    {
                        PlayerOwner().SwitchTeam();
                        Controller.CloseMenu();
                    }
                    // End:0x21c
                    else
                    {
                        // End:0x1e1
                        if(Sender == Controls[6] && Controls[6].bVisible)
                        {
                            PlayerOwner().ConsoleCommand("ADDCURRENTTOFAVORITES");
                            Controller.CloseMenu();
                        }
                        // End:0x21c
                        else
                        {
                            // End:0x21c
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
}

defaultproperties
{
    bIgnoreEsc=true
    LeaveMPButtonText="Disconnect"
    LeaveSPButtonText="Main Menu"
    LeaveEntryButtonText="Server Browser"
    ButtonWidth=0.270
    ButtonHeight=0.040
    ButtonHGap=0.020
    ButtonVGap=0.020
    BarHeight=0.210
    BarVPos=0.50
    bRequire640x480=true
    bAllowedAsLast=true
    Controls=// Object reference not set to an instance of an object.
    
}