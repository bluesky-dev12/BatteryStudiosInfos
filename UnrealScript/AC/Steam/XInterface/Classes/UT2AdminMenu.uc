/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2AdminMenu.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class UT2AdminMenu extends UT2K3GUIPage
    editinlinenew
    instanced;

var export editinline GUITabControl TabC;
var export editinline Tab_AdminPlayerList PlayerList;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    TabC = GUITabControl(Controls[5]);
    PlayerList = Tab_AdminPlayerList(TabC.AddTab("Players", "xinterface.Tab_AdminPlayerList",, "Player Mgt.", true));
    // End:0x8f
    if(PlayerList != none)
    {
        PlayerList.ReloadList();
    }
}

function HandleParameters(string Param1, string Param2)
{
    PlayerList.bAdvancedAdmin = bool(Param1);
}

function bool ButtonClicked(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
}

defaultproperties
{
    bRequire640x480=true
    bAllowedAsLast=true
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.10
    WinLeft=0.020
    WinWidth=0.960
    WinHeight=0.80
}