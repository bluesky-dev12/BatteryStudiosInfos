/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\KickVoteMultiColumnListBox.uc
 * Package Imports:
 *	xVoting
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class KickVoteMultiColumnListBox extends GUIMultiColumnListBox
    dependson(KickVotingPage)
    editinlinenew
    instanced;

var string KickInfoPage;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x3e
    if(!PlayerOwner().PlayerReplicationInfo.bAdmin)
    {
        ContextMenu.ContextItems.Remove(2, 2);
    }
}

function InternalOnClick(GUIContextMenu Sender, int Index)
{
    local string PlayerName;

    // End:0x1b1
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
                // End:0x1b1
                break;
            // End:0xcb
            case 1:
                PlayerName = KickVoteMultiColumnList(List).GetSelectedPlayerName();
                Controller.OpenMenu(KickInfoPage, PlayerName);
                // End:0xc8
                if(PlayerOwner().PlayerReplicationInfo.bAdmin)
                {
                    KickVoteMultiColumnList(List).VRI.RequestPlayerIP(PlayerName);
                }
                // End:0x1b1
                break;
            // End:0x128
            case 2:
                // End:0x125
                if(PlayerOwner().PlayerReplicationInfo.bAdmin)
                {
                    PlayerName = KickVoteMultiColumnList(List).GetSelectedPlayerName();
                    PlayerOwner().ConsoleCommand("ADMIN KICK " $ PlayerName);
                }
                // End:0x1b1
                break;
            // End:0x1ae
            case 3:
                // End:0x1ab
                if(PlayerOwner().PlayerReplicationInfo.bAdmin)
                {
                    PlayerName = KickVoteMultiColumnList(List).GetSelectedPlayerName();
                    PlayerOwner().ConsoleCommand("ADMIN KICKBAN " $ PlayerName);
                    PlayerOwner().ConsoleCommand("ADMIN KICK BAN " $ PlayerName);
                }
                // End:0x1b1
                break;
            // End:0xffff
            default:
            }
}

function bool InternalOnRightClick(GUIComponent Sender)
{
    local int NewIndex;

    NewIndex = int(float(List.Top) + Controller.MouseY - List.ClientBounds[1] / List.ItemHeight);
    // End:0x79
    if(NewIndex >= List.ItemCount)
    {
        NewIndex = List.ItemCount - 1;
    }
    List.SetIndex(NewIndex);
    return true;
}

defaultproperties
{
    KickInfoPage="xVoting.KickInfoPage"
    DefaultListClass="xVoting.KickVoteMultiColumnList"
    begin object name=RCMenu class=GUIContextMenu
        ContextItems=// Object reference not set to an instance of an object.
        
        OnSelect=InternalOnClick
        StyleName="ServerListContextMenu"
    object end
    // Reference: GUIContextMenu'KickVoteMultiColumnListBox.RCMenu'
    ContextMenu=RCMenu
    OnRightClick=InternalOnRightClick
}