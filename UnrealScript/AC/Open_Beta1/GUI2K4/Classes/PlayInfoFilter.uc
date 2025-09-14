class PlayInfoFilter extends BrowserFilters within UT2k4ServerBrowser
    config(User);

function LoadSettings(int FilterIndex)
{
    local array<AFilterRule> FilterRules;
    local int i, j;

    FilterRules = GetPlayInfoRules(FilterIndex);
    j = 0;
    J0x18:

    // End:0x7D [Loop If]
    if(j < FilterRules.Length)
    {
        i = Outer.FilterInfo.FindIndex(FilterRules[j].FilterItem.key);
        LoadData(FilterIndex, i, FilterRules[j]);
        j++;
        // [Loop Continue]
        goto J0x18;
    }
    //return;    
}

function array<AFilterRule> GetPlayInfoRules(int Index, optional string Group)
{
    local array<AFilterRule> FilterRules;
    local array<PlayInfoData> Scope;
    local int i, j;

    // End:0xFB
    if(ValidIndex(Index))
    {
        // End:0x3C
        if(Group != "")
        {
            Outer.FilterInfo.GetSettings(Group, Scope);            
        }
        else
        {
            Scope = Outer.FilterInfo.Settings;
        }
        i = 0;
        J0x60:

        // End:0xFB [Loop If]
        if(i < Scope.Length)
        {
            j = AllFilters[Index].FindRuleIndex(Scope[i].SettingName);
            // End:0xF1
            if(AllFilters[Index].ValidIndex(j))
            {
                FilterRules.Length = FilterRules.Length + 1;
                AllFilters[Index].GetRule(j, FilterRules[FilterRules.Length - 1]);
            }
            i++;
            // [Loop Continue]
            goto J0x60;
        }
    }
    return FilterRules;
    //return;    
}

function LoadData(int FilterIndex, int PIIndex, AFilterRule FilterRule)
{
    local int i, j, pos;
    local array<CurrentFilter> Stored;
    local string Min, Max, OrigRange;

    i = AllFilters[FilterIndex].FindRuleIndex(FilterRule.FilterItem.key);
    // End:0x37
    if(i < 0)
    {
        return;
    }
    Stored = AllFilters[FilterIndex].GetRuleSetAt(i);
    // End:0x1A6
    if(Stored.Length > 1)
    {
        j = 0;
        J0x6A:

        // End:0xFD [Loop If]
        if(j < Stored.Length)
        {
            // End:0xF3
            if(int(Stored[j].Item.FilterType) == int(1))
            {
                // End:0xD3
                if(Stored[j].ItemIndex == 1)
                {
                    Max = Stored[j].Item.FilterItem.Value;
                    // [Explicit Continue]
                    goto J0xF3;
                }
                Min = Stored[j].Item.FilterItem.Value;
            }
            J0xF3:

            j++;
            // [Loop Continue]
            goto J0x6A;
        }
        pos = InStr(Outer.FilterInfo.Settings[PIIndex].Data, ";");
        // End:0x168
        if(pos != -1)
        {
            OrigRange = Mid(Outer.FilterInfo.Settings[PIIndex].Data, pos);
        }
        Outer.FilterInfo.StoreSetting(PIIndex, "0", ((("3," $ Min) $ ",") $ Max) $ OrigRange);        
    }
    else
    {
        // End:0x1E5
        if(Stored.Length > 0)
        {
            Outer.FilterInfo.StoreSetting(PIIndex, Stored[0].Item.FilterItem.Value);            
        }
        else
        {
            Log("Unknown property:" $ FilterRule.FilterItem.key);
        }
    }
    //return;    
}
