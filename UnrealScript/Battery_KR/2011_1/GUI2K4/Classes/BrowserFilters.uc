class BrowserFilters extends Object within UT2k4ServerBrowser
    config(User);

var() config string CustomFilterClass;
var Class<CustomFilter> FilterClass;
var bool bInvalidFilterClass;
var transient array<CustomFilter> AllFilters;
var transient array<CustomFilter> Deleted;

function InitCustomFilters()
{
    local int i;
    local CustomFilter Temp;
    local array<string> CustomFilterNames;

    // End:0x19
    if(AllFilters.Length > 0)
    {
        AllFilters.Remove(0, AllFilters.Length);
    }
    // End:0x3F
    if(FilterClass == none)
    {
        FilterClass = Class<CustomFilter>(DynamicLoadObject(CustomFilterClass, Class'Core.Class'));
    }
    // End:0x85
    if(FilterClass == none)
    {
        Warn("Invalid custom filter class specified:" @ CustomFilterClass);
        bInvalidFilterClass = true;
        return;
    }
    i = 0;
    J0x8C:

    // End:0xBC [Loop If]
    if(i < Deleted.Length)
    {
        Deleted[i].Save(true);
        i++;
        // [Loop Continue]
        goto J0x8C;
    }
    // End:0xD5
    if(Deleted.Length > 0)
    {
        Deleted.Remove(0, Deleted.Length);
    }
    CustomFilterNames = GetPerObjectNames("ServerFilters", GetItemName(CustomFilterClass));
    i = 0;
    J0x102:

    // End:0x156 [Loop If]
    if((i < CustomFilterNames.Length) && i < 1000)
    {
        Temp = CreateFilter(CustomFilterNames[i]);
        AllFilters[AllFilters.Length] = Temp;
        i++;
        // [Loop Continue]
        goto J0x102;
    }
    //return;    
}

protected function CustomFilter CreateFilter(string FilterName)
{
    // End:0x12
    if(!ValidName(FilterName))
    {
        return none;
    }
    return new (none, Repl(FilterName, " ", Chr(27))) FilterClass;
    //return;    
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
    J0x1D:

    // End:0x44 [Loop If]
    if(HasFilterNamed(NewFilterName))
    {
        NewFilterName = str $ string(i++);
        // [Loop Continue]
        goto J0x1D;
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
    //return;    
}

function bool CopyFilter(int Index, out string NewFilterName)
{
    local int i;

    // End:0x6B
    if((ValidIndex(Index)) && AddCustomFilter(NewFilterName))
    {
        i = FindFilterIndex(NewFilterName);
        AllFilters[i].ImportFilter(AllFilters[Index]);
        AllFilters[i].SetTitle(NewFilterName);
        return true;
    }
    return false;
    //return;    
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
    //return;    
}

function bool RemoveFilterAt(int Index)
{
    Deleted[Deleted.Length] = AllFilters[Index];
    AllFilters[Index].ClearConfig();
    AllFilters.Remove(Index, 1);
    return true;
    //return;    
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

    // End:0x4F [Loop If]
    if(i < AllFilters.Length)
    {
        AllFilters[i].Save();
        i++;
        // [Loop Continue]
        goto J0x20;
    }
    //return;    
}

function ResetFilters()
{
    InitCustomFilters();
    //return;    
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
    J0x2F:

    // End:0x56 [Loop If]
    if(HasFilterNamed(NewName))
    {
        NewName = str $ string(i++);
        // [Loop Continue]
        goto J0x2F;
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
    //return;    
}

function bool ActivateFilter(int Index, bool Enable)
{
    // End:0x12
    if(!ValidIndex(Index))
    {
        return false;
    }
    // End:0x30
    if((IsActive(AllFilters[Index])) == Enable)
    {
        return false;
    }
    return AllFilters[Index].SetActive(Enable);
    //return;    
}

function bool IsActive(CustomFilter Test)
{
    // End:0x0D
    if(Test == none)
    {
        return false;
    }
    return Test.IsActive();
    //return;    
}

function bool IsActiveAt(int Index)
{
    // End:0x12
    if(!ValidIndex(Index))
    {
        return false;
    }
    return AllFilters[Index].IsActive();
    //return;    
}

function LoadSettings(int FilterIndex)
{
    //return;    
}

function string GetFilterName(int Index)
{
    // End:0x13
    if(!ValidIndex(Index))
    {
        return "";
    }
    return AllFilters[Index].GetTitle();
    //return;    
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
    //return;    
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
    //return;    
}

function PostEdit(int Index, string NewTitle, array<AFilterRule> NewRules)
{
    // End:0x2D
    if(ValidIndex(Index))
    {
        AllFilters[Index].PostEdit(NewTitle, NewRules);
    }
    //return;    
}

function array<string> GetFilterNames(optional bool bActiveOnly)
{
    local int i;
    local array<string> FilterNames;

    i = 0;
    J0x07:

    // End:0x6A [Loop If]
    if(i < AllFilters.Length)
    {
        // End:0x3F
        if(bActiveOnly && !AllFilters[i].IsActive())
        {
            // [Explicit Continue]
            goto J0x60;
        }
        FilterNames[i] = AllFilters[i].GetTitle();
        J0x60:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return FilterNames;
    //return;    
}

function SetRule(int FilterIndex, int RuleIndex, string RuleTag, string RuleItem, string RuleValue, string DataType, string QueryType, optional string ExtraData)
{
    local int i;
    local string Data, MinMax, MinV, MaxV;
    local array<string> AR;

    // End:0x3DC
    if(ValidIndex(FilterIndex))
    {
        Class'GUI2K4_Decompressed.CustomFilter'.static.ChopClass(RuleItem);
        // End:0x22C
        if((DataType == "DT_Ranged") && ExtraData != "")
        {
            Divide(ExtraData, ";", Data, MinMax);
            Outer.FilterInfo.SplitStringToArray(AR, Data, ",");
            // End:0xBA
            if(AR.Length < 3)
            {
                Divide(MinMax, ":", MinV, MaxV);
                AR[1] = MinV;
                AR[2] = MaxV;
            }
            // End:0x172
            if(RuleValue == "0")
            {
                // End:0x12F
                if(RuleIndex < 0)
                {
                    AllFilters[FilterIndex].AddRule(RuleTag, RuleItem, AR[1], AllFilters[FilterIndex].GetQueryType(QueryType), AllFilters[FilterIndex].GetDataType(DataType));                    
                }
                else
                {
                    AllFilters[FilterIndex].ChangeRule(RuleIndex, RuleTag, AR[1], AllFilters[FilterIndex].GetQueryType(QueryType));
                }                
            }
            else
            {
                // End:0x229
                if(RuleValue == "1")
                {
                    // End:0x1E8
                    if(RuleIndex < 0)
                    {
                        AllFilters[FilterIndex].AddRule(RuleTag, RuleItem, AR[2], AllFilters[FilterIndex].GetQueryType(QueryType), AllFilters[FilterIndex].GetDataType(DataType));                        
                    }
                    else
                    {
                        AllFilters[FilterIndex].ChangeRule(RuleIndex, RuleTag, AR[2], AllFilters[FilterIndex].GetQueryType(QueryType));
                    }
                }
            }            
        }
        else
        {
            // End:0x338
            if(DataType == "DT_Multiple")
            {
                Outer.FilterInfo.SplitStringToArray(AR, RuleValue, ",");
                // End:0x2F5
                if(RuleIndex < 0)
                {
                    i = 0;
                    J0x27A:

                    // End:0x2F2 [Loop If]
                    if(i < AR.Length)
                    {
                        AllFilters[FilterIndex].AddRule(RuleTag, RuleItem, AR[i], AllFilters[FilterIndex].GetQueryType(QueryType), AllFilters[FilterIndex].GetDataType(DataType));
                        i++;
                        // [Loop Continue]
                        goto J0x27A;
                    }                    
                }
                else
                {
                    AllFilters[FilterIndex].ChangeRule(RuleIndex, RuleTag, AR[0], AllFilters[FilterIndex].GetQueryType(QueryType));
                }                
            }
            else
            {
                // End:0x39E
                if(RuleIndex < 0)
                {
                    AllFilters[FilterIndex].AddRule(RuleTag, RuleItem, RuleValue, AllFilters[FilterIndex].GetQueryType(QueryType), AllFilters[FilterIndex].GetDataType(DataType));                    
                }
                else
                {
                    AllFilters[FilterIndex].ChangeRule(RuleIndex, RuleTag, RuleValue, AllFilters[FilterIndex].GetQueryType(QueryType));
                }
            }
        }
    }
    //return;    
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
    // End:0x4D
    if(i == -1)
    {
        AllFilters[AllFilters.Length] = filter;
    }
    return i;
    //return;    
}

protected function bool HasFilterNamed(string FilterName)
{
    return (FindFilterIndex(FilterName)) != -1;
    //return;    
}

function int FindFilterIndex(string FilterName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x46 [Loop If]
    if(i < AllFilters.Length)
    {
        // End:0x3C
        if(AllFilters[i].GetTitle() ~= FilterName)
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

protected function bool ValidIndex(int Index)
{
    return ((Index >= 0) && Index < AllFilters.Length) && !bInvalidFilterClass;
    //return;    
}

protected function bool ValidName(string Test)
{
    return ((Test != "") && Len(Test) < 1024) && !bInvalidFilterClass;
    //return;    
}

function int Count()
{
    return AllFilters.Length;
    //return;    
}

defaultproperties
{
    CustomFilterClass="GUI2K4.CustomFilter"
}