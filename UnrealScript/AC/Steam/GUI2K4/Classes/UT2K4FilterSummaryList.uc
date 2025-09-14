/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4FilterSummaryList.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:9
 *
 *******************************************************************************/
class UT2K4FilterSummaryList extends GUIMultiColumnList
    editinlinenew
    instanced;

var export editinline UT2K4CustomFilterPage p_Anchor;
var array<AFilterRule> Rules;

function InternalOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;
    local export editinline GUIStyles DrawStyle;

    // End:0x4d
    if(bSelected)
    {
        SelectedStyle.Draw(Canvas, 3, X, Y - float(2), W, H + float(2));
        DrawStyle = SelectedStyle;
    }
    // End:0x58
    else
    {
        DrawStyle = Style;
    }
    GetCellLeftWidth(0, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, GetRuleItem(i, 0), FontScale);
    GetCellLeftWidth(1, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, GetRuleItem(i, 1), FontScale);
    GetCellLeftWidth(2, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, GetRuleItem(i, 2), FontScale);
    GetCellLeftWidth(3, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, GetRuleItem(i, 3), FontScale);
}

function AddFilterRule(AFilterRule NewRule)
{
    Rules[Rules.Length] = NewRule;
    AddedItem();
}

function int RemoveFilterRule(int RuleIndex)
{
    local int i;

    // End:0x71
    if(ValidIndex(RuleIndex))
    {
        // End:0x2f
        if(RuleIndex == SortData[Index].SortItem)
        {
            return RemoveCurrentRule();
        }
        i = GetListIndex(RuleIndex);
        Rules.Remove(RuleIndex, 1);
        SortData.Remove(i, 1);
        InvSortData.Remove(i, 1);
        -- ItemCount;
        OnSortChanged();
    }
    return -1;
}

function int RemoveCurrentRule()
{
    local int OldItem;

    // End:0x4e
    if(Index >= 0)
    {
        OldItem = SortData[Index].SortItem;
        // End:0x4e
        if(ValidIndex(OldItem))
        {
            Rules.Remove(OldItem, 1);
            -- ItemCount;
            RemovedCurrent();
            return OldItem;
        }
    }
    return -1;
}

function string GetSortString(int i)
{
    return GetRuleItem(i, SortColumn);
}

function Clear()
{
    // End:0x19
    if(Rules.Length > 0)
    {
        Rules.Remove(0, Rules.Length);
    }
    super.Clear();
}

function string GetRuleItem(int RuleIndex, int ItemIndex)
{
    // End:0x8c
    if(ValidIndex(RuleIndex) && ItemIndex >= 0 && ItemIndex < ColumnHeadings.Length)
    {
        switch(ItemIndex)
        {
            // End:0x4e
            case 0:
                return Rules[RuleIndex].FilterItem.key;
            // End:0x6e
            case 1:
                return GetFriendlyName(Rules[RuleIndex].FilterItem.QueryType);
            // End:0x89
            case 2:
                return Rules[RuleIndex].FilterItem.Value;
            // End:0xffff
            default:
            }
            return "";
}

function bool ValidIndex(int i)
{
    return i >= 0 && i <= Rules.Length;
}

static final function string GetFriendlyName(IpDrv.MasterServerClient.EQueryType QueryType)
{
    switch(QueryType)
    {
        // End:0x15
        case 0:
            return "Equals";
        // End:0x23
        case 1:
            return "Is Not";
        // End:0x30
        case 2:
            return "Lower";
        // End:0x40
        case 3:
            return "Or Lower";
        // End:0x4e
        case 4:
            return "Higher";
        // End:0x5f
        case 5:
            return "Or Higher";
        // End:0xffff
        default:
            return "Disabled";
    }
    return "";
}

defaultproperties
{
    ColumnHeadings=// Object reference not set to an instance of an object.
    
    SelectedStyleName="BrowserListSelection"
    OnDrawItem=InternalOnDrawItem
}