/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\CustomFilter.uc
 * Package Imports:
 *	GUI2K4
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Structs:2
 *	Properties:7
 *	Functions:39
 *
 *******************************************************************************/
class CustomFilter extends Object
    config(ServerFilters)
    perobjectconfig;

enum EDataType
{
    DT_Unique,
    DT_Ranged,
    DT_Multiple
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

var config array<AFilterRule> Rules;
var config string DefaultTitle;
var config bool Active;
var array<CurrentFilter> AllRules;
var string Title;
var bool bEnabled;
var bool bDirty;

function Created()
{
    CancelChanges();
}

function CancelChanges()
{
    Title = DefaultTitle;
    bEnabled = Active;
    InitializeRules();
    bDirty = false;
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
    // End:0x9f [While If]
    if(i < Rules.Length)
    {
        AddRule(Rules[i].ItemName, Rules[i].FilterItem.key, Rules[i].FilterItem.Value, Rules[i].FilterItem.QueryType, Rules[i].FilterType);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x20;
    }
}

function bool SetTitle(string NewTitle)
{
    bDirty = bDirty || NewTitle != Title;
    Title = NewTitle;
    return true;
}

function bool SetActive(bool NewActive)
{
    bDirty = bDirty || NewActive != bEnabled;
    bEnabled = NewActive;
    return true;
}

function SetRules(array<CurrentFilter> NewRules)
{
    AllRules = NewRules;
    bDirty = true;
}

function string GetTitle()
{
    return Title;
}

function bool IsActive()
{
    return bEnabled;
}

function GetQueryRules(out array<AFilterRule> OutRules)
{
    Save();
    OutRules = Rules;
}

function GetRules(out array<CurrentFilter> OutRules)
{
    OutRules = AllRules;
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
        J0x4c:
        // End:0x83 [While If]
        if(i < AllRules.Length)
        {
            Rules[Rules.Length] = AllRules[i].Item;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x4c;
        }
        SaveConfig();
    }
    bDirty = false;
}

function int Count()
{
    return AllRules.Length;
}

function bool FindRule(out AFilterRule Rule, string ItemName, optional string Value)
{
    local int i;

    i = FindRuleIndex(ItemName, Value);
    return GetRule(i, Rule);
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
    J0x3b:
    // End:0xbf [While If]
    if(i < AllRules.Length)
    {
        // End:0xb5
        if(AllRules[i].Item.FilterItem.key ~= ItemName)
        {
            // End:0xb5
            if(Value == "" || Value != "" && Value ~= AllRules[i].Item.FilterItem.Value)
            {
                return i;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    return -1;
}

function int FindItemIndex(string ItemName, int ItemIndex)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x67 [While If]
    if(i < AllRules.Length)
    {
        // End:0x5d
        if(AllRules[i].Item.FilterItem.key ~= ItemName && AllRules[i].ItemIndex == ItemIndex)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

protected function int FindLastIndex(string ItemName)
{
    local int i, j;

    j = -1;
    i = 0;
    J0x12:
    // End:0x82 [While If]
    if(i < AllRules.Length)
    {
        // End:0x78
        if(AllRules[i].Item.FilterItem.key ~= ItemName && AllRules[i].ItemIndex > j)
        {
            j = AllRules[i].ItemIndex;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
    return j;
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
    J0x3b:
    // End:0xb0 [While If]
    if(i < AllRules.Length)
    {
        // End:0xa6
        if(AllRules[i].Item.FilterItem.key ~= ItemName && AllRules[i].Item.FilterItem.Value ~= Value)
        {
            return AllRules[i].ItemIndex;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    return -1;
}

function string GetRuleKey(int Index)
{
    // End:0x29
    if(ValidIndex(Index))
    {
        return AllRules[Index].Item.FilterItem.key;
    }
    return "";
}

function string GetRuleType(int Index)
{
    // End:0x2a
    if(ValidIndex(Index))
    {
        return GetDataTypeString(AllRules[Index].Item.FilterType);
    }
    return "";
}

function string GetRuleQueryType(int Index)
{
    // End:0x38
    if(ValidIndex(Index))
    {
        return string(GetEnum(enum'EQueryType', AllRules[Index].Item.FilterItem.QueryType));
    }
    return "";
}

function array<string> GetRuleValues(int Index)
{
    local int i;
    local array<string> AR;
    local array<CurrentFilter> Subset;

    Subset = GetRuleSetAt(Index);
    i = 0;
    J0x18:
    // End:0x58 [While If]
    if(i < Subset.Length)
    {
        AR[i] = Subset[i].Item.FilterItem.Value;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    return AR;
}

function array<CurrentFilter> GetRuleSet(string ItemName)
{
    local int i;
    local array<CurrentFilter> RuleAr;

    ChopClass(ItemName);
    i = 0;
    J0x12:
    // End:0x68 [While If]
    if(i < AllRules.Length)
    {
        // End:0x5e
        if(AllRules[i].Item.FilterItem.key ~= ItemName)
        {
            RuleAr[RuleAr.Length] = AllRules[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
    return RuleAr;
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
}

function PostEdit(string NewTitle, array<AFilterRule> NewRules)
{
    local int i;

    AllRules.Remove(0, AllRules.Length);
    Title = NewTitle;
    i = 0;
    J0x1f:
    // End:0x9e [While If]
    if(i < NewRules.Length)
    {
        AddRule(NewRules[i].ItemName, NewRules[i].FilterItem.key, NewRules[i].FilterItem.Value, NewRules[i].FilterItem.QueryType, NewRules[i].FilterType);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1f;
    }
    bDirty = true;
    Save();
}

function float AddRule(string NewName, string NewKey, string NewValue, IpDrv.MasterServerClient.EQueryType QType, CustomFilter.EDataType DType)
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
}

function bool RemoveRule(string ItemName)
{
    local int i;
    local bool bSuccess;

    i = AllRules.Length - 1;
    J0x0f:
    // End:0x66 [While If]
    if(i >= 0)
    {
        // End:0x5c
        if(AllRules[i].Item.FilterItem.key ~= ItemName)
        {
            bDirty = true;
            bSuccess = true;
            AllRules.Remove(-- i, 1);
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    return bSuccess;
}

function bool RemoveRuleAt(int Index)
{
    // End:0x2f
    if(ValidIndex(Index))
    {
        return RemoveRule(AllRules[Index].Item.FilterItem.key);
    }
    return false;
}

function ImportFilter(CustomFilter ImportFrom)
{
    SetTitle(ImportFrom.GetTitle());
    SetActive(ImportFrom.IsActive());
    ImportFrom.GetRules(AllRules);
    bDirty = true;
}

function ResetRules()
{
    CancelChanges();
}

function bool ChangeRule(int Index, string NewTag, string NewValue, IpDrv.MasterServerClient.EQueryType NewType)
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
}

function bool ValidIndex(int Index)
{
    return Index >= 0 && Index < AllRules.Length;
}

static final function CustomFilter.EDataType GetDataType(string dt)
{
    switch(dt)
    {
        // End:0x1a
        case "DT_Multiple":
            return 2;
        // End:0x2b
        case "DT_Ranged":
            return 1;
        // End:0xffff
        default:
            return 0;
    }
}

static final function string GetDataTypeString(CustomFilter.EDataType Type)
{
    // End:0x1c
    if(Type == 0)
    {
        return "DT_Unique";
    }
    // End:0x38
    if(Type == 1)
    {
        return "DT_Ranged";
    }
    // End:0x56
    if(Type == 2)
    {
        return "DT_Multiple";
    }
    return "";
}

static final function string GetQueryString(IpDrv.MasterServerClient.EQueryType QT)
{
    switch(QT)
    {
        // End:0x18
        case 0:
            return "QT_Equals";
        // End:0x2c
        case 1:
            return "QT_NotEquals";
        // End:0x3f
        case 2:
            return "QT_LessThan";
        // End:0x58
        case 3:
            return "QT_LessThanEquals";
        // End:0x6e
        case 4:
            return "QT_GreaterThan";
        // End:0x8a
        case 5:
            return "QT_GreaterThanEquals";
        // End:0xffff
        default:
            return "QT_Disabled";
    }
    return "";
}

static final function IpDrv.MasterServerClient.EQueryType GetQueryType(string QT)
{
    switch(QT)
    {
        // End:0x18
        case "QT_Equals":
            return 0;
        // End:0x2c
        case "QT_NotEquals":
            return 1;
        // End:0x3f
        case "QT_LessThan":
            return 2;
        // End:0x58
        case "QT_LessThanEquals":
            return 3;
        // End:0x6e
        case "QT_GreaterThan":
            return 4;
        // End:0x8a
        case "QT_GreaterThanEquals":
            return 5;
        // End:0xffff
        default:
            return 6;
    }
}

static final function AFilterRule StaticGenerateRule(string FriendlyName, string ItemName, string ItemVal, CustomFilter.EDataType ItemDataType, IpDrv.MasterServerClient.EQueryType ItemQueryType)
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
}

protected function string GetUniqueName(string Test, int Index)
{
    local int i, j;
    local string S;

    i = 0;
    J0x07:
    // End:0x82 [While If]
    if(i < AllRules.Length)
    {
        // End:0x78
        if(AllRules[i].ItemIndex == Index && AllRules[i].Item.ItemName ~= Test $ S)
        {
            S = " " $ string(++ j);
            i = -1;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return Test $ S;
}

static final function ChopClass(out string FullName)
{
    local int i;

    i = InStr(FullName, ".");
    J0x10:
    // End:0x43 [While If]
    if(i >= 0)
    {
        FullName = Mid(FullName, i + 1);
        i = InStr(FullName, ".");
        // This is an implied JumpToken; Continue!
        goto J0x10;
    }
}
