/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MapVoteCountMultiColumnListBox.uc
 * Package Imports:
 *	xVoting
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class MapVoteCountMultiColumnListBox extends GUIMultiColumnListBox
    dependson(MapVotingPage)
    dependson(MapVoteCountMultiColumnList)
    editinlinenew
    instanced;

var string MapInfoPage;

function InternalOnClick(GUIContextMenu Sender, int Index)
{
    local string MapName;

    // End:0x94
    if(Sender != none)
    {
        // End:0x24
        if(NotifyContextSelect(Sender, Index))
        {
            return;
        }
        switch(Index)
        {
            // End:0x57
            case 0:
                // End:0x54
                if(MapVotingPage(MenuOwner) != none)
                {
                    MapVotingPage(MenuOwner).SendVote(self);
                }
                // End:0x94
                break;
            // End:0x91
            case 1:
                MapName = MapVoteCountMultiColumnList(List).GetSelectedMapName();
                Controller.OpenMenu(MapInfoPage, MapName);
                // End:0x94
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
    MapInfoPage="xVoting.MapInfoPage"
    DefaultListClass="xVoting.MapVoteCountMultiColumnList"
    begin object name=RCMenu class=GUIContextMenu
        ContextItems=// Object reference not set to an instance of an object.
        
        OnSelect=InternalOnClick
        StyleName="ServerListContextMenu"
    object end
    // Reference: GUIContextMenu'MapVoteCountMultiColumnListBox.RCMenu'
    ContextMenu=RCMenu
    OnRightClick=InternalOnRightClick
}