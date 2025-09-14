class KickVoteMultiColumnListBox extends GUIMultiColumnListBox
    editinlinenew
    instanced;

var string KickInfoPage;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x3E
    if(!PlayerOwner().PlayerReplicationInfo.bAdmin)
    {
        ContextMenu.ContextItems.Remove(2, 2);
    }
    //return;    
}

function InternalOnClick(GUIContextMenu Sender, int Index)
{
    local string PlayerName;

    // End:0x1B1
    if(Sender != none)
    {
        // End:0x24
        if(NotifyContextSelect(Sender, Index))
        {
            return;
        }
        switch(Index)
        {
            // End:0x56
            case 0:
                // End:0x53
                if(KickVotingPage(MenuOwner) != none)
                {
                    KickVotingPage(MenuOwner).SendKickVote();
                }
                // End:0x1B1
                break;
            // End:0xCB
            case 1:
                PlayerName = KickVoteMultiColumnList(List).GetSelectedPlayerName();
                Controller.OpenMenu(KickInfoPage, PlayerName);
                // End:0xC8
                if(PlayerOwner().PlayerReplicationInfo.bAdmin)
                {
                    KickVoteMultiColumnList(List).VRI.RequestPlayerIP(PlayerName);
                }
                // End:0x1B1
                break;
            // End:0x128
            case 2:
                // End:0x125
                if(PlayerOwner().PlayerReplicationInfo.bAdmin)
                {
                    PlayerName = KickVoteMultiColumnList(List).GetSelectedPlayerName();
                    PlayerOwner().ConsoleCommand("ADMIN KICK " $ PlayerName);
                }
                // End:0x1B1
                break;
            // End:0x1AE
            case 3:
                // End:0x1AB
                if(PlayerOwner().PlayerReplicationInfo.bAdmin)
                {
                    PlayerName = KickVoteMultiColumnList(List).GetSelectedPlayerName();
                    PlayerOwner().ConsoleCommand("ADMIN KICKBAN " $ PlayerName);
                    PlayerOwner().ConsoleCommand("ADMIN KICK BAN " $ PlayerName);
                }
                // End:0x1B1
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        //return;        
    }
}

function bool InternalOnRightClick(GUIComponent Sender)
{
    local int NewIndex;

    NewIndex = int(float(List.Top) + ((Controller.MouseY - List.ClientBounds[1]) / List.ItemHeight));
    // End:0x79
    if(NewIndex >= List.ItemCount)
    {
        NewIndex = List.ItemCount - 1;
    }
    List.SetIndex(NewIndex);
    return true;
    //return;    
}

defaultproperties
{
    KickInfoPage="xVoting.KickInfoPage"
    DefaultListClass="xVoting.KickVoteMultiColumnList"
    // Reference: GUIContextMenu'xVoting_Decompressed.KickVoteMultiColumnListBox.RCMenu'
    begin object name="RCMenu" class=XInterface.GUIContextMenu
        ContextItems=/* Array type was not detected. */
        OnSelect=KickVoteMultiColumnListBox.InternalOnClick
        StyleName="ServerListContextMenu"
    end object
    ContextMenu=RCMenu
    OnRightClick=KickVoteMultiColumnListBox.InternalOnRightClick
}