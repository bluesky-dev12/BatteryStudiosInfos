/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\AdminPanelPlayers.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:4
 *
 *******************************************************************************/
class AdminPanelPlayers extends AdminPanelBase
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIMultiColumnListBox lb_Players;
var export editinline AdminPlayerList li_Players;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Kick;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Ban;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    li_Players = AdminPlayerList(lb_Players.List);
}

function ProcessPlayer(string PlayerInfo)
{
    // End:0x2a
    if(PlayerInfo == "Done")
    {
        wPlayer(PlayerOwner()).__ProcessRule__Delegate = None;
    }
    // End:0x3e
    else
    {
        li_Players.Add(PlayerInfo);
    }
}

function ReloadList()
{
    local wPlayer PC;

    PC = wPlayer(PlayerOwner());
    // End:0x1b
    if(PC == none)
    {
        return;
    }
    li_Players.Clear();
    PC.__ProcessRule__Delegate = ProcessPlayer;
    PC.ServerRequestPlayerInfo();
}

function bool InternalOnClick(GUIComponent Sender)
{
    switch(Sender)
    {
        // End:0x83
        case b_Kick:
            // End:0x4b
            if(bAdvancedAdmin)
            {
                AdminCommand("kick" @ li_Players.MyPlayers[li_Players.Index].PlayerID);
            }
            // End:0x7b
            else
            {
                AdminCommand("kick" @ li_Players.MyPlayers[li_Players.Index].PlayerName);
            }
            ReloadList();
            return true;
        // End:0x106
        case b_Ban:
            // End:0xcb
            if(bAdvancedAdmin)
            {
                AdminCommand("kick ban" @ li_Players.MyPlayers[li_Players.Index].PlayerID);
            }
            // End:0xfe
            else
            {
                AdminCommand("kickban" @ li_Players.MyPlayers[li_Players.Index].PlayerName);
            }
            ReloadList();
            return true;
        // End:0xffff
        default:
}

defaultproperties
{
    begin object name=AdminPlayersListBox class=GUIMultiColumnListBox
        DefaultListClass="XInterface.AdminPlayerList"
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinHeight=0.8781270
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUIMultiColumnListBox'AdminPanelPlayers.AdminPlayersListBox'
    lb_Players=AdminPlayersListBox
    begin object name=KickButton class=GUIButton
        Caption="??"
        Hint="??? ????? ???? ?? ???"
        WinTop=0.90
        WinLeft=0.743750
        WinWidth=0.120
        WinHeight=0.0706250
        bBoundToParent=true
        bScaleToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'AdminPanelPlayers.KickButton'
    b_Kick=KickButton
    begin object name=BanButton class=GUIButton
        Caption="??"
        Hint="??? ????? ??? ???? ??? ?????"
        WinTop=0.90
        WinLeft=0.868750
        WinWidth=0.120
        WinHeight=0.0706250
        bBoundToParent=true
        bScaleToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'AdminPanelPlayers.BanButton'
    b_Ban=BanButton
    PanelCaption="????"
    WinTop=0.0
    WinHeight=0.6250030
}