class MapVoteMultiColumnListBox extends GUIMultiColumnListBox
    editinlinenew
    instanced;

var string MapInfoPage;
var array<export editinline MapVoteMultiColumnList> ListArray;

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
                MapName = MapVoteMultiColumnList(List).GetSelectedMapName();
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

function LoadList(VotingReplicationInfo LoadVRI)
{
    local int i, G;

    ListArray.Length = LoadVRI.GameConfig.Length;
    i = 0;
    J0x1D:

    // End:0xB2 [Loop If]
    if(i < LoadVRI.GameConfig.Length)
    {
        ListArray[i] = new Class'xVoting_Decompressed.MapVoteMultiColumnList';
        ListArray[i].LoadList(LoadVRI, i);
        // End:0xA8
        if(LoadVRI.GameConfig[i].GameClass ~= PlayerOwner().GameReplicationInfo.GameClass)
        {
            G = i;
        }
        i++;
        // [Loop Continue]
        goto J0x1D;
    }
    ChangeGameType(G);
    //return;    
}

function ChangeGameType(int GameTypeIndex)
{
    InitBaseList(ListArray[GameTypeIndex]);
    //return;    
}

function InitBaseList(GUIListBase LocalList)
{
    local export editinline GUIMultiColumnList L;

    L = GUIMultiColumnList(LocalList);
    // End:0x1D
    if(L == none)
    {
        return;
    }
    // End:0x42
    if(List == LocalList)
    {
        Header.MyList = List;
        return;
    }
    // End:0x85
    if(List != none)
    {
        List.SetTimer(0.0000000, false);
        RemoveComponent(List, true);
        AppendComponent(L, false);
        List = L;        
    }
    else
    {
        List = L;
        AppendComponent(L, false);
    }
    Header.MyList = List;
    super(GUIListBoxBase).InitBaseList(LocalList);
    //return;    
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

function free()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x37 [Loop If]
    if(i < ListArray.Length)
    {
        ListArray[i].VRI = none;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    super(GUIMultiComponent).free();
    //return;    
}

defaultproperties
{
    MapInfoPage="xVoting.MapInfoPage"
    DefaultListClass="xVoting.MapVoteMultiColumnList"
    // Reference: GUIContextMenu'xVoting_Decompressed.MapVoteMultiColumnListBox.RCMenu'
    begin object name="RCMenu" class=XInterface.GUIContextMenu
        ContextItems=/* Array type was not detected. */
        OnSelect=MapVoteMultiColumnListBox.InternalOnClick
    end object
    ContextMenu=RCMenu
    OnRightClick=MapVoteMultiColumnListBox.InternalOnRightClick
}