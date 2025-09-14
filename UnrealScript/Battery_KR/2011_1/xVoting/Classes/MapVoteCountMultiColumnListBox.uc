class MapVoteCountMultiColumnListBox extends GUIMultiColumnListBox
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
    MapInfoPage="xVoting.MapInfoPage"
    DefaultListClass="xVoting.MapVoteCountMultiColumnList"
    // Reference: GUIContextMenu'xVoting_Decompressed.MapVoteCountMultiColumnListBox.RCMenu'
    begin object name="RCMenu" class=XInterface.GUIContextMenu
        ContextItems=/* Array type was not detected. */
        OnSelect=MapVoteCountMultiColumnListBox.InternalOnClick
        StyleName="ServerListContextMenu"
    end object
    ContextMenu=RCMenu
    OnRightClick=MapVoteCountMultiColumnListBox.InternalOnRightClick
}