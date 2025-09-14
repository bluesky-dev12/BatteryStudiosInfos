/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Tab_AdminPlayerList.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:5
 *
 *******************************************************************************/
class Tab_AdminPlayerList extends UT2K3TabPanel
    editinlinenew
    instanced;

var export editinline AdminPlayerList MyPlayerList;
var export editinline GUIMultiColumnListBox MyListBox;
var bool bAdvancedAdmin;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    MyListBox = GUIMultiColumnListBox(Controls[1]);
    MyPlayerList = AdminPlayerList(MyListBox.Controls[0]);
    MyPlayerList.InitComponent(MyController, self);
    WinWidth = Controller.ActivePage.WinWidth;
    WinLeft = Controller.ActivePage.WinLeft;
}

function ProcessRule(string NewRule)
{
    // End:0x2a
    if(NewRule == "Done")
    {
        wPlayer(PlayerOwner()).__ProcessRule__Delegate = None;
    }
    // End:0x3e
    else
    {
        MyPlayerList.Add(NewRule);
    }
}

function ReloadList()
{
    MyPlayerList.Clear();
    // End:0x46
    if(wPlayer(PlayerOwner()) != none)
    {
        wPlayer(PlayerOwner()).__ProcessRule__Delegate = ProcessRule;
        wPlayer(PlayerOwner()).ServerRequestPlayerInfo();
    }
}

function bool KickClicked(GUIComponent Sender)
{
    PlayerOwner().ConsoleCommand("Admin Kick" @ MyPlayerList.MyPlayers[MyPlayerList.Index].PlayerName);
    ReloadList();
    return true;
}

function bool BanClicked(GUIComponent Sender)
{
    // End:0x4e
    if(bAdvancedAdmin)
    {
        PlayerOwner().ConsoleCommand("Admin Kick Ban" @ MyPlayerList.MyPlayers[MyPlayerList.Index].PlayerName);
    }
    // End:0x8f
    else
    {
        PlayerOwner().ConsoleCommand("Admin KickBan" @ MyPlayerList.MyPlayers[MyPlayerList.Index].PlayerName);
    }
    ReloadList();
    return true;
}

defaultproperties
{
    Controls=// Object reference not set to an instance of an object.
    
    WinHeight=0.6250030
}