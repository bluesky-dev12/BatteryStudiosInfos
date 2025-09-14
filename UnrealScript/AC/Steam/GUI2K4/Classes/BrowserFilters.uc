/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\BrowserFilters.uc
 * Package Imports:
 *	GUI2K4
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:25
 *
 *******************************************************************************/
class BrowserFilters extends Object within UT2k4ServerBrowser
    config(User);

var() config string CustomFilterClass;
var class<CustomFilter> FilterClass;
var bool bInvalidFilterClass;
var transient array<CustomFilter> AllFilters;
var transient array<CustomFilter> Deleted;

function InitCustomFilters()
{
    local int i;
    local CustomFilter temp;
    local array<string> CustomFilterNames;

    // End:0x19
    if(AllFilters.Length > 0)
    {
        AllFilters.Remove(0, AllFilters.Length);
    }
    // End:0x3f
    if(FilterClass == none)
    {
        FilterClass = class<CustomFilter>(DynamicLoadObject(CustomFilterClass, class'Class'));
    }
    // End:0x85
    if(FilterClass == none)
    {
        Warn("Invalid custom filter class specified:" @ CustomFilterClass);
        bInvalidFilterClass = true;
        return;
    }
    i = 0;
    J0x8c:
    // End:0xbc [While If]
    if(i < Deleted.Length)
    {
        Deleted[i].Save(true);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x8c;
    }
    // End:0xd5
    if(Deleted.Length > 0)
    {
        Deleted.Remove(0, Deleted.Length);
    }
    CustomFilterNames = GetPerObjectNames("ServerFilters", GetItemName(CustomFilterClass));
    i = 0;
    J0x102:
    // End:0x156 [While If]
    if(i < CustomFilterNames.Length && i < 1000)
    {
        temp = CreateFilter(CustomFilterNames[i]);
        AllFilters[AllFilters.Length] = temp;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x102;
    }
}

protected function CustomFilter CreateFilter(string FilterName)
{
    // End:0x12
    if(!ValidName(FilterName))
    {
        return none;
    }
    return new (none, Repl(FilterName, " ", Chr(27))) FilterClass;
}

function bool AddCustomFilter(out string NewFilterName)
{
    local int i;
    local string str;
    local CustomFilter NewFilter;

    // End:0x12
    if(!ValidName(NewFilterName))
    {
        return false;
    }
    str = NewFilterName;
    J0x1d:
    // End:0x44 [While If]
    if(HasFilterNamed(NewFilterName))
    {
        NewFilterName = str $ string(++ i);
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
    NewFilter = CreateFilter(NewFilterName);
    // End:0x62
    if(NewFilter == none)
    {
        return false;
    }
    NewFilter.SetTitle(NewFilterName);
    AllFilters[AllFilters.Length] = NewFilter;
    return true;
}

function bool CopyFilter(int Index, out string NewFilterName)
{
    local int i;

    // End:0x6b
    if(ValidIndex(Index) && AddCustomFilter(NewFilterName))
    {
        i = FindFilterIndex(NewFilterName);
        AllFilters[i].ImportFilter(AllFilters[Index]);
        AllFilters[i].SetTitle(NewFilterName);
        return true;
    }
    return false;
}

function bool RemoveFilter(string FilterName)
{
    local int i;

    // End:0x12
    if(!ValidName(FilterName))
    {
        return false;
    }
    i = FindFilterIndex(FilterName);
    // End:0x30
    if(i < 0)
    {
        return false;
    }
    return RemoveFilterAt(i);
}

function bool RemoveFilterAt(int Index)
{
    Deleted[Deleted.Length] = AllFilters[Index];
    AllFilters[Index].ClearConfig();
    AllFilters.Remove(Index, 1);
    return true;
}

function SaveFilters()
{
    local int i;

    // End:0x19
    if(Deleted.Length > 0)
    {
        Deleted.Remove(0, Deleted.Length);
    }
    i = 0;
    J0x20:
    // End:0x4f [While If]
    if(i < AllFilters.Length)
    {
        AllFilters[i].Save();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x20;
    }
}

function ResetFilters()
{
    InitCustomFilters();
}

function bool RenameFilter(int Index, string NewName)
{
    local string str;
    local CustomFilter NewFilter;
    local int i;

    // End:0x24
    if(!ValidIndex(Index) || !ValidName(NewName))
    {
        return false;
    }
    str = NewName;
    J0x2f:
    // End:0x56 [While If]
    if(HasFilterNamed(NewName))
    {
        NewName = str $ string(++ i);
        // This is an implied JumpToken; Continue!
        goto J0x2f;
    }
    NewFilter = CreateFilter(NewName);
    // End:0x74
    if(NewFilter == none)
    {
        return false;
    }
    NewFilter.ImportFilter(AllFilters[Index]);
    NewFilter.SetTitle(NewName);
    RemoveFilterAt(Index);
    AllFilters.Insert(Index, 1);
    AllFilters[Index] = NewFilter;
    return true;
}

function bool ActivateFilter(int Index, bool Enable)
{
    // End:0x12
    if(!ValidIndex(Index))
    {
        return false;
    }
    // End:0x30
    if(IsActive(AllFilters[Index]) == Enable)
    {
        return false;
    }
    return AllFilters[Index].SetActive(Enable);
}

function bool IsActive(CustomFilter Test)
{
    // End:0x0d
    if(Test == none)
    {
        return false;
    }
    return Test.IsActive();
}

function bool IsActiveAt(int Index)
{
    // End:0x12
    if(!ValidIndex(Index))
    {
        return false;
    }
    return AllFilters[Index].IsActive();
}

function LoadSettings(int FilterIndex);
function string GetFilterName(int Index)
{
    // End:0x13
    if(!ValidIndex(Index))
    {
        return "";
    }
    return AllFilters[Index].GetTitle();
}

function array<AFilterRule> GetFilterRules(int Index)
{
    local array<AFilterRule> FilterRules;

    // End:0x28
    if(ValidIndex(Index))
    {
        AllFilters[Index].GetQueryRules(FilterRules);
    }
    return FilterRules;
}

function array<CurrentFilter> GetFilterARules(int Index)
{
    local array<CurrentFilter> FilterRules;

    // End:0x28
    if(ValidIndex(Index))
    {
        AllFilters[Index].GetRules(FilterRules);
    }
    return FilterRules;
}

function PostEdit(int Index, string NewTitle, array<AFilterRule> NewRules)
{
    // End:0x2d
    if(ValidIndex(Index))
    {
        AllFilters[Index].PostEdit(NewTitle, NewRules);
    }
}

function array<string> GetFilterNames(optional bool bActiveOnly)
{
    local int i;
    local array<string> FilterNames;

    i = 0;
    J0x07:
    // End:0x6a [While If]
    if(i < AllFilters.Length)
    {
        // End:0x3f
        if(bActiveOnly && !AllFilters[i].IsActive())
        {
        }
        // End:0x60
        else
        {
            FilterNames[i] = AllFilters[i].GetTitle();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return FilterNames;
}

function SetRule(int FilterIndex, int RuleIndex, string RuleTag, string RuleItem, string RuleValue, string DataType, string QueryType, optional string ExtraData)
{
    local int i;
    local string Data, MinMax, MinV, MaxV;
    local array<string> AR;

    // End:0x3dc
    if(ValidIndex(FilterIndex))
    {
        class'CustomFilter'.static.ChopClass(RuleItem);
        // End:0x22c
        if(DataType == "DT_Ranged" && ExtraData != "")
        {
            Divide(ExtraData, ";", Data, MinMax);
            Outer.FilterInfo.SplitStringToArray(AR, Data, ",");
            // End:0xba
            if(AR.Length < 3)
            {
                Divide(MinMax, ":", MinV, MaxV);
                AR[1] = MinV;
                AR[2] = MaxV;
            }
            // End:0x172
            if(RuleValue == "0")
            {
                // End:0x12f
                if(RuleIndex < 0)
                {
                    AllFilters[FilterIndex].AddRule(RuleTag, RuleItem, AR[1], AllFilters[FilterIndex].GetQueryType(QueryType), AllFilters[FilterIndex].GetDataType(DataType));
                }
                // End:0x16f
                else
                {
                    AllFilters[FilterIndex].ChangeRule(RuleIndex, RuleTag, AR[1], AllFilters[FilterIndex].GetQueryType(QueryType));
                }
            }
            // End:0x229
            else
            {
                // End:0x229
                if(RuleValue == "1")
                {
                    // End:0x1e8
                    if(RuleIndex < 0)
                    {
                        AllFilters[FilterIndex].AddRule(RuleTag, RuleItem, AR[2], AllFilters[FilterIndex].GetQueryType(QueryType), AllFilters[FilterIndex].GetDataType(DataType));
                    }
                    // End:0x229
                    else
                    {
                        AllFilters[FilterIndex].ChangeRule(RuleIndex, RuleTag, AR[2], AllFilters[FilterIndex].GetQueryType(QueryType));
                    }
                }
            }
        }
        // End:0x3dc
        else
        {
            // End:0x338
            if(DataType == "DT_Multiple")
            {
                Outer.FilterInfo.SplitStringToArray(AR, RuleValue, ",");
                // End:0x2f5
                if(RuleIndex < 0)
                {
                    i = 0;
                    J0x27a:
                    // End:0x2f2 [While If]
                    if(i < AR.Length)
                    {
                        AllFilters[FilterIndex].AddRule(RuleTag, RuleItem, AR[i], AllFilters[FilterIndex].GetQueryType(QueryType), AllFilters[FilterIndex].GetDataType(DataType));
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x27a;
                    }
                }
                // End:0x335
                else
                {
                    AllFilters[FilterIndex].ChangeRule(RuleIndex, RuleTag, AR[0], AllFilters[FilterIndex].GetQueryType(QueryType));
                }
            }
            // End:0x3dc
            else
            {
                // End:0x39e
                if(RuleIndex < 0)
                {
                    AllFilters[FilterIndex].AddRule(RuleTag, RuleItem, RuleValue, AllFilters[FilterIndex].GetQueryType(QueryType), AllFilters[FilterIndex].GetDataType(DataType));
                }
                // End:0x3dc
                else
                {
                    AllFilters[FilterIndex].ChangeRule(RuleIndex, RuleTag, RuleValue, AllFilters[FilterIndex].GetQueryType(QueryType));
                }
            }
        }
    }
}

protected function int AddFilter(CustomFilter filter)
{
    local int i;

    // End:0x11
    if(filter == none)
    {
        return -1;
    }
    i = FindFilterIndex(filter.GetTitle());
    // End:0x4d
    if(i == -1)
    {
        AllFilters[AllFilters.Length] = filter;
    }
    return i;
}

protected function bool HasFilterNamed(string FilterName)
{
    return FindFilterIndex(FilterName) != -1;
}

function int FindFilterIndex(string FilterName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x46 [While If]
    if(i < AllFilters.Length)
    {
        // End:0x3c
        if(AllFilters[i].GetTitle() ~= FilterName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

protected function bool ValidIndex(int Index)
{
    return Index >= 0 && Index < AllFilters.Length && !bInvalidFilterClass;
}

protected function bool ValidName(string Test)
{
    return Test != "" && Len(Test) < 1024 && !bInvalidFilterClass;
}

function int Count()
{
    return AllFilters.Length;
}

defaultproperties
{
    CustomFilterClass="GUI2K4.CustomFilter"
}