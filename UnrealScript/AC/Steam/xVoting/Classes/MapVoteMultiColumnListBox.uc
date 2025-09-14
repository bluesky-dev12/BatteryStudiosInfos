/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MapVoteMultiColumnListBox.uc
 * Package Imports:
 *	xVoting
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:6
 *
 *******************************************************************************/
class MapVoteMultiColumnListBox extends GUIMultiColumnListBox
    dependson(MapVoteMultiColumnList)
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
            // End:0xffff
            default:
            }
}

function LoadList(VotingReplicationInfo LoadVRI)
{
    local int i, G;

    ListArray.Length = LoadVRI.GameConfig.Length;
    i = 0;
    J0x1d:
    // End:0xb2 [While If]
    if(i < LoadVRI.GameConfig.Length)
    {
        ListArray[i] = new class'MapVoteMultiColumnList';
        ListArray[i].LoadList(LoadVRI, i);
        // End:0xa8
        if(LoadVRI.GameConfig[i].GameClass ~= PlayerOwner().GameReplicationInfo.GameClass)
        {
            G = i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
    ChangeGameType(G);
}

function ChangeGameType(int GameTypeIndex)
{
    InitBaseList(ListArray[GameTypeIndex]);
}

function InitBaseList(GUIListBase LocalList)
{
    local export editinline GUIMultiColumnList L;

    L = GUIMultiColumnList(LocalList);
    // End:0x1d
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
        List.SetTimer(0.0, false);
        RemoveComponent(List, true);
        AppendComponent(L, false);
        List = L;
    }
    // End:0x9c
    else
    {
        List = L;
        AppendComponent(L, false);
    }
    Header.MyList = List;
    super(GUIListBoxBase).InitBaseList(LocalList);
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

function free()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x37 [While If]
    if(i < ListArray.Length)
    {
        ListArray[i].VRI = none;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    super(GUIMultiComponent).free();
}

defaultproperties
{
    MapInfoPage="xVoting.MapInfoPage"
    DefaultListClass="xVoting.MapVoteMultiColumnList"
    begin object name=RCMenu class=GUIContextMenu
        ContextItems=// Object reference not set to an instance of an object.
        
        OnSelect=InternalOnClick
    object end
    // Reference: GUIContextMenu'MapVoteMultiColumnListBox.RCMenu'
    ContextMenu=RCMenu
    OnRightClick=InternalOnRightClick
}