/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\PlayInfoFilter.uc
 * Package Imports:
 *	GUI2K4
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class PlayInfoFilter extends BrowserFilters within UT2k4ServerBrowser
    config(User);

function LoadSettings(int FilterIndex)
{
    local array<AFilterRule> FilterRules;
    local int i, j;

    FilterRules = GetPlayInfoRules(FilterIndex);
    j = 0;
    J0x18:
    // End:0x7d [While If]
    if(j < FilterRules.Length)
    {
        i = Outer.FilterInfo.FindIndex(FilterRules[j].FilterItem.key);
        LoadData(FilterIndex, i, FilterRules[j]);
        ++ j;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
}

function array<AFilterRule> GetPlayInfoRules(int Index, optional string Group)
{
    local array<AFilterRule> FilterRules;
    local array<PlayInfoData> Scope;
    local int i, j;

    // End:0xfb
    if(ValidIndex(Index))
    {
        // End:0x3c
        if(Group != "")
        {
            Outer.FilterInfo.GetSettings(Group, Scope);
        }
        // End:0x59
        else
        {
            Scope = Outer.FilterInfo.Settings;
        }
        i = 0;
        J0x60:
        // End:0xfb [While If]
        if(i < Scope.Length)
        {
            j = AllFilters[Index].FindRuleIndex(Scope[i].SettingName);
            // End:0xf1
            if(AllFilters[Index].ValidIndex(j))
            {
                FilterRules.Length = FilterRules.Length + 1;
                AllFilters[Index].GetRule(j, FilterRules[FilterRules.Length - 1]);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x60;
        }
    }
    return FilterRules;
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
    // End:0x1a6
    if(Stored.Length > 1)
    {
        j = 0;
        J0x6a:
        // End:0xfd [While If]
        if(j < Stored.Length)
        {
            // End:0xf3
            if(Stored[j].Item.FilterType == 1)
            {
                // End:0xd3
                if(Stored[j].ItemIndex == 1)
                {
                    Max = Stored[j].Item.FilterItem.Value;
                }
                // End:0xf3
                else
                {
                    Min = Stored[j].Item.FilterItem.Value;
                }
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x6a;
        }
        pos = InStr(Outer.FilterInfo.Settings[PIIndex].Data, ";");
        // End:0x168
        if(pos != -1)
        {
            OrigRange = Mid(Outer.FilterInfo.Settings[PIIndex].Data, pos);
        }
        Outer.FilterInfo.StoreSetting(PIIndex, "0", "3," $ Min $ "," $ Max $ OrigRange);
    }
    // End:0x20b
    else
    {
        // End:0x1e5
        if(Stored.Length > 0)
        {
            Outer.FilterInfo.StoreSetting(PIIndex, Stored[0].Item.FilterItem.Value);
        }
        // End:0x20b
        else
        {
            Log("Unknown property:" $ FilterRule.FilterItem.key);
        }
    }
}
