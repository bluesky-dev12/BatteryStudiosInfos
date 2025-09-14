class CustomFilter extends Object
    config(ServerFilters)
    perobjectconfig;

enum EDataType
{
    DT_Unique,                      // 0
    DT_Ranged,                      // 1
    DT_Multiple                     // 2
};

struct AFilterRule
{
    var QueryData FilterItem;
    var CustomFilter.EDataType FilterType;
    var string ItemName;
};

struct CurrentFilter
{
    var AFilterRule Item;
    var int ItemIndex;
};

var protected config array<AFilterRule> Rules;
var protected config string DefaultTitle;
var protected config bool Active;
var protected array<CurrentFilter> AllRules;
var protected string Title;
var protected bool bEnabled;
var protected bool bDirty;

function Created()
{
    CancelChanges();
    //return;    
}

function CancelChanges()
{
    Title = DefaultTitle;
    bEnabled = Active;
    InitializeRules();
    bDirty = false;
    //return;    
}

protected function InitializeRules()
{
    local int i;

    // End:0x19
    if(AllRules.Length > 0)
    {
        AllRules.Remove(0, AllRules.Length);
    }
    i = 0;
    J0x20:

    // End:0x9F [Loop If]
    if(i < Rules.Length)
    {
        AddRule(Rules[i].ItemName, Rules[i].FilterItem.key, Rules[i].FilterItem.Value, Rules[i].FilterItem.QueryType, Rules[i].FilterType);
        i++;
        // [Loop Continue]
        goto J0x20;
    }
    //return;    
}

function bool SetTitle(string NewTitle)
{
    bDirty = bDirty || NewTitle != Title;
    Title = NewTitle;
    return true;
    //return;    
}

function bool SetActive(bool NewActive)
{
    bDirty = bDirty || NewActive != bEnabled;
    bEnabled = NewActive;
    return true;
    //return;    
}

function SetRules(array<CurrentFilter> NewRules)
{
    AllRules = NewRules;
    bDirty = true;
    //return;    
}

function string GetTitle()
{
    return Title;
    //return;    
}

function bool IsActive()
{
    return bEnabled;
    //return;    
}

function GetQueryRules(out array<AFilterRule> OutRules)
{
    Save();
    OutRules = Rules;
    //return;    
}

function GetRules(out array<CurrentFilter> OutRules)
{
    OutRules = AllRules;
    //return;    
}

function Save(optional bool bForceSave)
{
    local int i;

    // End:0x86
    if(bDirty || bForceSave)
    {
        DefaultTitle = Title;
        Active = bEnabled;
        // End:0x45
        if(Rules.Length > 0)
        {
            Rules.Remove(0, Rules.Length);
        }
        i = 0;
        J0x4C:

        // End:0x83 [Loop If]
        if(i < AllRules.Length)
        {
            Rules[Rules.Length] = AllRules[i].Item;
            i++;
            // [Loop Continue]
            goto J0x4C;
        }
        SaveConfig();
    }
    bDirty = false;
    //return;    
}

function int Count()
{
    return AllRules.Length;
    //return;    
}

function bool FindRule(out AFilterRule Rule, string ItemName, optional string Value)
{
    local int i;

    i = FindRuleIndex(ItemName, Value);
    return GetRule(i, Rule);
    //return;    
}

function bool GetRule(int Index, out AFilterRule Rule)
{
    // End:0x26
    if(ValidIndex(Index))
    {
        Rule = AllRules[Index].Item;
        return true;
    }
    return false;
    //return;    
}

function int FindRuleIndex(string ItemName, optional string Value)
{
    local int i, j;

    j = InStr(ItemName, ".");
    // End:0x34
    if(j != -1)
    {
        ItemName = Mid(ItemName, j + 1);
    }
    i = 0;
    J0x3B:

    // End:0xBF [Loop If]
    if(i < AllRules.Length)
    {
        // End:0xB5
        if(AllRules[i].Item.FilterItem.key ~= ItemName)
        {
            // End:0xB5
            if((Value == "") || (Value != "") && Value ~= AllRules[i].Item.FilterItem.Value)
            {
                return i;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x3B;
    }
    return -1;
    //return;    
}

function int FindItemIndex(string ItemName, int ItemIndex)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x67 [Loop If]
    if(i < AllRules.Length)
    {
        // End:0x5D
        if((AllRules[i].Item.FilterItem.key ~= ItemName) && AllRules[i].ItemIndex == ItemIndex)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

protected function int FindLastIndex(string ItemName)
{
    local int i, j;

    j = -1;
    i = 0;
    J0x12:

    // End:0x82 [Loop If]
    if(i < AllRules.Length)
    {
        // End:0x78
        if((AllRules[i].Item.FilterItem.key ~= ItemName) && AllRules[i].ItemIndex > j)
        {
            j = AllRules[i].ItemIndex;
        }
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    return j;
    //return;    
}

function int FindInnerIndex(string ItemName, string Value)
{
    local int i, j;

    j = InStr(ItemName, ".");
    // End:0x34
    if(j != -1)
    {
        ItemName = Mid(ItemName, j + 1);
    }
    i = 0;
    J0x3B:

    // End:0xB0 [Loop If]
    if(i < AllRules.Length)
    {
        // End:0xA6
        if((AllRules[i].Item.FilterItem.key ~= ItemName) && AllRules[i].Item.FilterItem.Value ~= Value)
        {
            return AllRules[i].ItemIndex;
        }
        i++;
        // [Loop Continue]
        goto J0x3B;
    }
    return -1;
    //return;    
}

function string GetRuleKey(int Index)
{
    // End:0x29
    if(ValidIndex(Index))
    {
        return AllRules[Index].Item.FilterItem.key;
    }
    return "";
    //return;    
}

function string GetRuleType(int Index)
{
    // End:0x2A
    if(ValidIndex(Index))
    {
        return GetDataTypeString(AllRules[Index].Item.FilterType);
    }
    return "";
    //return;    
}

function string GetRuleQueryType(int Index)
{
    // End:0x38
    if(ValidIndex(Index))
    {
        return string(GetEnum(Enum'IpDrv.MasterServerClient.EQueryType', int(AllRules[Index].Item.FilterItem.QueryType)));
    }
    return "";
    //return;    
}

function array<string> GetRuleValues(int Index)
{
    local int i;
    local array<string> AR;
    local array<CurrentFilter> Subset;

    Subset = GetRuleSetAt(Index);
    i = 0;
    J0x18:

    // End:0x58 [Loop If]
    if(i < Subset.Length)
    {
        AR[i] = Subset[i].Item.FilterItem.Value;
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    return AR;
    //return;    
}

function array<CurrentFilter> GetRuleSet(string ItemName)
{
    local int i;
    local array<CurrentFilter> RuleAr;

    ChopClass(ItemName);
    i = 0;
    J0x12:

    // End:0x68 [Loop If]
    if(i < AllRules.Length)
    {
        // End:0x5E
        if(AllRules[i].Item.FilterItem.key ~= ItemName)
        {
            RuleAr[RuleAr.Length] = AllRules[i];
        }
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    return RuleAr;
    //return;    
}

function array<CurrentFilter> GetRuleSetAt(int Index)
{
    local array<CurrentFilter> RuleAr;

    // End:0x34
    if(ValidIndex(Index))
    {
        RuleAr = GetRuleSet(AllRules[Index].Item.FilterItem.key);
    }
    return RuleAr;
    //return;    
}

function PostEdit(string NewTitle, array<AFilterRule> NewRules)
{
    local int i;

    AllRules.Remove(0, AllRules.Length);
    Title = NewTitle;
    i = 0;
    J0x1F:

    // End:0x9E [Loop If]
    if(i < NewRules.Length)
    {
        AddRule(NewRules[i].ItemName, NewRules[i].FilterItem.key, NewRules[i].FilterItem.Value, NewRules[i].FilterItem.QueryType, NewRules[i].FilterType);
        i++;
        // [Loop Continue]
        goto J0x1F;
    }
    bDirty = true;
    Save();
    //return;    
}

function float AddRule(string NewName, string NewKey, string NewValue, MasterServerClient.EQueryType QType, CustomFilter.EDataType DType)
{
    local int i, j;
    local CurrentFilter NewRule;
    local AFilterRule NewItem;
    local QueryData KeyPair;

    j = FindLastIndex(NewKey);
    NewRule.ItemIndex = j + 1;
    i = AllRules.Length;
    KeyPair.key = NewKey;
    KeyPair.Value = NewValue;
    KeyPair.QueryType = QType;
    NewItem.ItemName = NewName;
    NewItem.FilterItem = KeyPair;
    NewItem.FilterType = DType;
    NewRule.Item = NewItem;
    AllRules[i] = NewRule;
    bDirty = true;
    return float(i);
    //return;    
}

function bool RemoveRule(string ItemName)
{
    local int i;
    local bool bSuccess;

    i = AllRules.Length - 1;
    J0x0F:

    // End:0x66 [Loop If]
    if(i >= 0)
    {
        // End:0x5C
        if(AllRules[i].Item.FilterItem.key ~= ItemName)
        {
            bDirty = true;
            bSuccess = true;
            AllRules.Remove(i--, 1);
        }
        i--;
        // [Loop Continue]
        goto J0x0F;
    }
    return bSuccess;
    //return;    
}

function bool RemoveRuleAt(int Index)
{
    // End:0x2F
    if(ValidIndex(Index))
    {
        return RemoveRule(AllRules[Index].Item.FilterItem.key);
    }
    return false;
    //return;    
}

function ImportFilter(CustomFilter ImportFrom)
{
    SetTitle(ImportFrom.GetTitle());
    SetActive(ImportFrom.IsActive());
    ImportFrom.GetRules(AllRules);
    bDirty = true;
    //return;    
}

function ResetRules()
{
    CancelChanges();
    //return;    
}

function bool ChangeRule(int Index, string NewTag, string NewValue, MasterServerClient.EQueryType NewType)
{
    // End:0x12
    if(!ValidIndex(Index))
    {
        return false;
    }
    AllRules[Index].Item.ItemName = NewTag;
    AllRules[Index].Item.FilterItem.Value = NewValue;
    AllRules[Index].Item.FilterItem.QueryType = NewType;
    bDirty = true;
    return true;
    //return;    
}

function bool ValidIndex(int Index)
{
    return (Index >= 0) && Index < AllRules.Length;
    //return;    
}

static final function CustomFilter.EDataType GetDataType(string dt)
{
    switch(dt)
    {
        // End:0x1A
        case "DT_Multiple":
            return 2;
        // End:0x2B
        case "DT_Ranged":
            return 1;
        // End:0xFFFF
        default:
            return 0;
            break;
    }
    //return;    
}

static final function string GetDataTypeString(CustomFilter.EDataType Type)
{
    // End:0x1C
    if(int(Type) == int(0))
    {
        return "DT_Unique";
    }
    // End:0x38
    if(int(Type) == int(1))
    {
        return "DT_Ranged";
    }
    // End:0x56
    if(int(Type) == int(2))
    {
        return "DT_Multiple";
    }
    return "";
    //return;    
}

static final function string GetQueryString(MasterServerClient.EQueryType QT)
{
    switch(QT)
    {
        // End:0x18
        case 0:
            return "QT_Equals";
        // End:0x2C
        case 1:
            return "QT_NotEquals";
        // End:0x3F
        case 2:
            return "QT_LessThan";
        // End:0x58
        case 3:
            return "QT_LessThanEquals";
        // End:0x6E
        case 4:
            return "QT_GreaterThan";
        // End:0x8A
        case 5:
            return "QT_GreaterThanEquals";
        // End:0xFFFF
        default:
            return "QT_Disabled";
            break;
    }
    return "";
    //return;    
}

static final function MasterServerClient.EQueryType GetQueryType(string QT)
{
    switch(QT)
    {
        // End:0x18
        case "QT_Equals":
            return 0;
        // End:0x2C
        case "QT_NotEquals":
            return 1;
        // End:0x3F
        case "QT_LessThan":
            return 2;
        // End:0x58
        case "QT_LessThanEquals":
            return 3;
        // End:0x6E
        case "QT_GreaterThan":
            return 4;
        // End:0x8A
        case "QT_GreaterThanEquals":
            return 5;
        // End:0xFFFF
        default:
            return 6;
            break;
    }
    //return;    
}

static final function AFilterRule StaticGenerateRule(string FriendlyName, string ItemName, string ItemVal, CustomFilter.EDataType ItemDataType, MasterServerClient.EQueryType ItemQueryType)
{
    local AFilterRule NewItem;
    local QueryData KeyPair;

    KeyPair.key = ItemName;
    KeyPair.Value = ItemVal;
    KeyPair.QueryType = ItemQueryType;
    NewItem.ItemName = FriendlyName;
    NewItem.FilterItem = KeyPair;
    NewItem.FilterType = ItemDataType;
    return NewItem;
    //return;    
}

protected function string GetUniqueName(string Test, int Index)
{
    local int i, j;
    local string S;

    i = 0;
    J0x07:

    // End:0x82 [Loop If]
    if(i < AllRules.Length)
    {
        // End:0x78
        if((AllRules[i].ItemIndex == Index) && AllRules[i].Item.ItemName ~= (Test $ S))
        {
            S = " " $ string(++j);
            i = -1;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return Test $ S;
    //return;    
}

static final function ChopClass(out string FullName)
{
    local int i;

    i = InStr(FullName, ".");
    J0x10:

    // End:0x43 [Loop If]
    if(i >= 0)
    {
        FullName = Mid(FullName, i + 1);
        i = InStr(FullName, ".");
        // [Loop Continue]
        goto J0x10;
    }
    //return;    
}
