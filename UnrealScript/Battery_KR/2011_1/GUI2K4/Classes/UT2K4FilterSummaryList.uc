class UT2K4FilterSummaryList extends GUIMultiColumnList
    editinlinenew
    instanced;

var export editinline UT2K4CustomFilterPage p_Anchor;
var array<AFilterRule> Rules;

function InternalOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;
    local export editinline GUIStyles DrawStyle;

    // End:0x4D
    if(bSelected)
    {
        SelectedStyle.Draw(Canvas, 3, X, Y - float(2), W, H + float(2));
        DrawStyle = SelectedStyle;        
    }
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
    //return;    
}

function AddFilterRule(AFilterRule NewRule)
{
    Rules[Rules.Length] = NewRule;
    AddedItem();
    //return;    
}

function int RemoveFilterRule(int RuleIndex)
{
    local int i;

    // End:0x71
    if(ValidIndex(RuleIndex))
    {
        // End:0x2F
        if(RuleIndex == SortData[Index].SortItem)
        {
            return RemoveCurrentRule();
        }
        i = GetListIndex(RuleIndex);
        Rules.Remove(RuleIndex, 1);
        SortData.Remove(i, 1);
        InvSortData.Remove(i, 1);
        ItemCount--;
        OnSortChanged();
    }
    return -1;
    //return;    
}

function int RemoveCurrentRule()
{
    local int OldItem;

    // End:0x4E
    if(Index >= 0)
    {
        OldItem = SortData[Index].SortItem;
        // End:0x4E
        if(ValidIndex(OldItem))
        {
            Rules.Remove(OldItem, 1);
            ItemCount--;
            RemovedCurrent();
            return OldItem;
        }
    }
    return -1;
    //return;    
}

function string GetSortString(int i)
{
    return GetRuleItem(i, SortColumn);
    //return;    
}

function Clear()
{
    // End:0x19
    if(Rules.Length > 0)
    {
        Rules.Remove(0, Rules.Length);
    }
    super.Clear();
    //return;    
}

function string GetRuleItem(int RuleIndex, int ItemIndex)
{
    // End:0x8C
    if(((ValidIndex(RuleIndex)) && ItemIndex >= 0) && ItemIndex < ColumnHeadings.Length)
    {
        switch(ItemIndex)
        {
            // End:0x4E
            case 0:
                return Rules[RuleIndex].FilterItem.key;
            // End:0x6E
            case 1:
                return GetFriendlyName(Rules[RuleIndex].FilterItem.QueryType);
            // End:0x89
            case 2:
                return Rules[RuleIndex].FilterItem.Value;
            // End:0xFFFF
            default:
                break;
            }
    }
    else
    {
        return "";
        //return;        
    }
}

function bool ValidIndex(int i)
{
    return (i >= 0) && i <= Rules.Length;
    //return;    
}

static final function string GetFriendlyName(MasterServerClient.EQueryType QueryType)
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
        // End:0x4E
        case 4:
            return "Higher";
        // End:0x5F
        case 5:
            return "Or Higher";
        // End:0xFFFF
        default:
            return "Disabled";
            break;
    }
    return "";
    //return;    
}

defaultproperties
{
    ColumnHeadings=/* Array type was not detected. */
    SelectedStyleName="BrowserListSelection"
    OnDrawItem=UT2K4FilterSummaryList.InternalOnDrawItem
}