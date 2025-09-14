class AdminPanelPlayers extends AdminPanelBase
    editinlinenew
    instanced;

var() automated GUIMultiColumnListBox lb_Players;
var export editinline AdminPlayerList li_Players;
var() automated GUIButton b_Kick;
var() automated GUIButton b_Ban;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    li_Players = AdminPlayerList(lb_Players.List);
    //return;    
}

function ProcessPlayer(string PlayerInfo)
{
    // End:0x2A
    if(PlayerInfo == "Done")
    {
        wPlayer(PlayerOwner()).__ProcessRule__Delegate = None;        
    }
    else
    {
        li_Players.Add(PlayerInfo);
    }
    //return;    
}

function ReloadList()
{
    local wPlayer PC;

    PC = wPlayer(PlayerOwner());
    // End:0x1B
    if(PC == none)
    {
        return;
    }
    li_Players.Clear();
    PC.__ProcessRule__Delegate = ProcessPlayer;
    PC.ServerRequestPlayerInfo();
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    switch(Sender)
    {
        // End:0x83
        case b_Kick:
            // End:0x4B
            if(bAdvancedAdmin)
            {
                AdminCommand("kick" @ li_Players.MyPlayers[li_Players.Index].PlayerID);                
            }
            else
            {
                AdminCommand("kick" @ li_Players.MyPlayers[li_Players.Index].PlayerName);
            }
            ReloadList();
            return true;
        // End:0x106
        case b_Ban:
            // End:0xCB
            if(bAdvancedAdmin)
            {
                AdminCommand("kick ban" @ li_Players.MyPlayers[li_Players.Index].PlayerID);                
            }
            else
            {
                AdminCommand("kickban" @ li_Players.MyPlayers[li_Players.Index].PlayerName);
            }
            ReloadList();
            return true;
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

defaultproperties
{
    // Reference: GUIMultiColumnListBox'GUI2K4_Decompressed.AdminPanelPlayers.AdminPlayersListBox'
    begin object name="AdminPlayersListBox" class=XInterface.GUIMultiColumnListBox
        DefaultListClass="XInterface.AdminPlayerList"
        bVisibleWhenEmpty=true
        OnCreateComponent=AdminPlayersListBox.InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinHeight=0.8781270
        bBoundToParent=true
        bScaleToParent=true
    end object
    lb_Players=AdminPlayersListBox
    // Reference: GUIButton'GUI2K4_Decompressed.AdminPanelPlayers.KickButton'
    begin object name="KickButton" class=XInterface.GUIButton
        Caption="??"
        Hint="??? ????? ???? ?? ???"
        WinTop=0.9000000
        WinLeft=0.7437500
        WinWidth=0.1200000
        WinHeight=0.0706250
        bBoundToParent=true
        bScaleToParent=true
        OnClick=AdminPanelPlayers.InternalOnClick
        OnKeyEvent=KickButton.InternalOnKeyEvent
    end object
    b_Kick=KickButton
    // Reference: GUIButton'GUI2K4_Decompressed.AdminPanelPlayers.BanButton'
    begin object name="BanButton" class=XInterface.GUIButton
        Caption="??"
        Hint="??? ????? ??? ???? ??? ?????"
        WinTop=0.9000000
        WinLeft=0.8687500
        WinWidth=0.1200000
        WinHeight=0.0706250
        bBoundToParent=true
        bScaleToParent=true
        OnClick=AdminPanelPlayers.InternalOnClick
        OnKeyEvent=BanButton.InternalOnKeyEvent
    end object
    b_Ban=BanButton
    PanelCaption="????"
    WinTop=0.0000000
    WinHeight=0.6250030
}