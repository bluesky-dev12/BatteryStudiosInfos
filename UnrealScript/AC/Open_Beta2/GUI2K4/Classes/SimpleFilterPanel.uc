class SimpleFilterPanel extends GUIPanel
    editinlinenew
    instanced;

struct FilterItem
{
    var string FilterTag;
    var bool bEnabled;
};

var() automated GUISectionBackground sb_Checks;
var() automated GUISectionBackground sb_Mutators;
var() automated AltSectionBackground sb_Choices;
var() automated moCheckBox ch_NoPassword;
var() automated moCheckBox ch_NoFull;
var() automated moCheckBox ch_NoEmpty;
var() automated moCheckBox ch_NoBotServers;
var() automated moCheckBox ch_Show2003;
var() automated array<export editinlinenotify GUIComboBox> co_Mutator;
var() automated array<export editinlinenotify GUIComboBox> co_MutatorMode;
var() automated moComboBox co_StatsView;
var() automated moComboBox co_WeaponStay;
var() automated moComboBox co_Translocator;
var BrowserFilters FilterMaster;
var array<string> SelectedMutator;
var localized string ViewStatsStrings[3];
var localized string MutatorModeStrings[4];
var localized string WeaponStayStrings[3];
var localized string TranslocatorStrings[3];
var localized string SaveString;
var array<MutatorRecord> MutatorRecords;
var int CurrentFilter;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i, j;

    super.InitComponent(MyController, myOwner);
    co_StatsView.AddItem(ViewStatsStrings[0],, "QT_Disabled");
    co_StatsView.AddItem(ViewStatsStrings[1],, "QT_Equals");
    co_StatsView.AddItem(ViewStatsStrings[2],, "QT_NotEquals");
    co_StatsView.ReadOnly(true);
    Class'Engine.CacheManager'.static.GetMutatorList(MutatorRecords);
    i = 0;
    J0xA4:

    // End:0x1A2 [Loop If]
    if(i < co_MutatorMode.Length)
    {
        co_MutatorMode[i].AddItem(MutatorModeStrings[0],, "QT_Disabled");
        co_MutatorMode[i].AddItem(MutatorModeStrings[1],, "QT_Equals");
        co_MutatorMode[i].AddItem(MutatorModeStrings[2],, "QT_NotEquals");
        co_MutatorMode[i].ReadOnly(true);
        co_MutatorMode[i].Edit.bAlwaysNotify = true;
        co_MutatorMode[i].TabOrder = co_MutatorMode[0].TabOrder + (i * 2);
        i++;
        // [Loop Continue]
        goto J0xA4;
    }
    co_MutatorMode[0].AddItem(MutatorModeStrings[3],, "QT_Equals");
    i = 0;
    J0x1CE:

    // End:0x2CB [Loop If]
    if(i < co_Mutator.Length)
    {
        co_Mutator[i].List.bSorted = true;
        j = 0;
        J0x205:

        // End:0x25B [Loop If]
        if(j < MutatorRecords.Length)
        {
            co_Mutator[i].AddItem(MutatorRecords[j].FriendlyName, none, GetItemName(MutatorRecords[j].ClassName));
            j++;
            // [Loop Continue]
            goto J0x205;
        }
        co_Mutator[i].ReadOnly(true);
        co_Mutator[i].Edit.bAlwaysNotify = true;
        co_Mutator[i].TabOrder = co_MutatorMode[0].TabOrder + (i * 2);
        i++;
        // [Loop Continue]
        goto J0x1CE;
    }
    co_WeaponStay.AddItem(WeaponStayStrings[0],, "QT_Disabled");
    co_WeaponStay.AddItem(WeaponStayStrings[1],, "QT_Equals");
    co_WeaponStay.AddItem(WeaponStayStrings[2],, "QT_NotEquals");
    co_WeaponStay.ReadOnly(true);
    co_Translocator.AddItem(TranslocatorStrings[0],, "QT_Disabled");
    co_Translocator.AddItem(TranslocatorStrings[1],, "QT_Equals");
    co_Translocator.AddItem(TranslocatorStrings[2],, "QT_NotEquals");
    co_Translocator.ReadOnly(true);
    SelectedMutator.Length = co_Mutator.Length;
    sb_Checks.ManageComponent(ch_NoFull);
    sb_Checks.ManageComponent(ch_NoBotServers);
    sb_Checks.ManageComponent(ch_NoEmpty);
    sb_Checks.ManageComponent(ch_NoPassword);
    sb_Choices.ManageComponent(co_StatsView);
    sb_Choices.ManageComponent(co_WeaponStay);
    sb_Choices.ManageComponent(co_Translocator);
    i = 0;
    J0x463:

    // End:0x497 [Loop If]
    if(i < co_MutatorMode.Length)
    {
        sb_Mutators.ManageComponent(co_MutatorMode[i]);
        i++;
        // [Loop Continue]
        goto J0x463;
    }
    i = 0;
    J0x49E:

    // End:0x4D2 [Loop If]
    if(i < co_Mutator.Length)
    {
        sb_Mutators.ManageComponent(co_Mutator[i]);
        i++;
        // [Loop Continue]
        goto J0x49E;
    }
    //return;    
}

function FilterSelectionChanged(bool bValid)
{
    local int i;

    // End:0x3E
    if(bValid)
    {
        i = 0;
        J0x10:

        // End:0x3B [Loop If]
        if(i < Components.Length)
        {
            EnableComponent(Components[i]);
            i++;
            // [Loop Continue]
            goto J0x10;
        }        
    }
    else
    {
        ChangeNextMutatorState(0, false);
        i = 0;
        J0x4D:

        // End:0x78 [Loop If]
        if(i < Components.Length)
        {
            DisableComponent(Components[i]);
            i++;
            // [Loop Continue]
            goto J0x4D;
        }
    }
    //return;    
}

function Refresh(int NewFilterIndex)
{
    local array<AFilterRule> Rules;
    local array<int> MutatorArray;
    local int i, j;
    local bool bTemp;

    bTemp = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = false;
    i = 0;
    J0x2E:

    // End:0xC4 [Loop If]
    if(i < Components.Length)
    {
        // End:0x89
        if((GUIMenuOption(Components[i]) != none) && moComboBox(Components[i]) == none)
        {
            GUIMenuOption(Components[i]).ResetComponent();
            // [Explicit Continue]
            goto J0xBA;
        }
        // End:0xBA
        if(GUIComboBox(Components[i]) != none)
        {
            GUIComboBox(Components[i]).SetIndex(0);
        }
        J0xBA:

        i++;
        // [Loop Continue]
        goto J0x2E;
    }
    ChangeNextMutatorState(0, false);
    i = 0;
    J0xD3:

    // End:0xFB [Loop If]
    if(i < SelectedMutator.Length)
    {
        SelectedMutator[i] = "";
        i++;
        // [Loop Continue]
        goto J0xD3;
    }
    // End:0x2C1
    if(((FilterMaster != none) && NewFilterIndex >= 0) && NewFilterIndex < FilterMaster.AllFilters.Length)
    {
        CurrentFilter = NewFilterIndex;
        Rules = FilterMaster.GetFilterRules(NewFilterIndex);
        i = 0;
        J0x15A:

        // End:0x231 [Loop If]
        if(i < Rules.Length)
        {
            // End:0x227
            if(Rules[i].FilterItem.key ~= "mutator")
            {
                // End:0x1C0
                if(Rules[i].ItemName ~= "none")
                {
                    MutatorArray.Insert(0, 1);
                    MutatorArray[0] = i;
                    // [Explicit Continue]
                    goto J0x227;
                }
                j = 0;
                J0x1C7:

                // End:0x20A [Loop If]
                if(j < MutatorArray.Length)
                {
                    // End:0x200
                    if(int(Rules[MutatorArray[j]].FilterItem.QueryType) == int(6))
                    {
                        // [Explicit Break]
                        goto J0x20A;
                    }
                    j++;
                    // [Loop Continue]
                    goto J0x1C7;
                }
                J0x20A:

                MutatorArray.Insert(j, 1);
                MutatorArray[j] = i;
            }
            J0x227:

            i++;
            // [Loop Continue]
            goto J0x15A;
        }
        i = 0;
        J0x238:

        // End:0x289 [Loop If]
        if(i < Rules.Length)
        {
            // End:0x26E
            if(Rules[i].FilterItem.key ~= "mutator")
            {
                // [Explicit Continue]
                goto J0x27F;
            }
            UpdateRule(Rules[i]);
            J0x27F:

            i++;
            // [Loop Continue]
            goto J0x238;
        }
        i = 0;
        J0x290:

        // End:0x2C1 [Loop If]
        if(i < MutatorArray.Length)
        {
            UpdateRule(Rules[MutatorArray[i]]);
            i++;
            // [Loop Continue]
            goto J0x290;
        }
    }
    Controller.bCurMenuInitialized = bTemp;
    i = 0;
    J0x2DE:

    // End:0x32F [Loop If]
    if(i < SelectedMutator.Length)
    {
        // End:0x325
        if(SelectedMutator[i] != "")
        {
            UpdateSelectedMutator(i, co_Mutator[i].GetExtra(), -1);
        }
        i++;
        // [Loop Continue]
        goto J0x2DE;
    }
    //return;    
}

function UpdateRule(AFilterRule Rule)
{
    local int i, idx;
    local bool bEnabled;

    bEnabled = int(Rule.FilterItem.QueryType) != int(6);
    switch(Locs(Rule.FilterItem.key))
    {
        // End:0x9B
        case "weaponstay":
            switch(Rule.FilterItem.QueryType)
            {
                // End:0x69
                case 0:
                    co_WeaponStay.SetIndex(1);
                    // End:0x98
                    break;
                // End:0x82
                case 1:
                    co_WeaponStay.SetIndex(2);
                    // End:0x98
                    break;
                // End:0xFFFF
                default:
                    co_WeaponStay.SetIndex(0);
                    // End:0x98
                    break;
                    break;
            }
            // End:0x3B5
            break;
        // End:0x103
        case "transloc":
            switch(Rule.FilterItem.QueryType)
            {
                // End:0xD1
                case 0:
                    co_Translocator.SetIndex(1);
                    // End:0x100
                    break;
                // End:0xEA
                case 1:
                    co_Translocator.SetIndex(2);
                    // End:0x100
                    break;
                // End:0xFFFF
                default:
                    co_Translocator.SetIndex(0);
                    // End:0x100
                    break;
                    break;
            }
            // End:0x3B5
            break;
        // End:0x165
        case "stats":
            switch(Rule.FilterItem.QueryType)
            {
                // End:0x136
                case 0:
                    co_StatsView.SetIndex(1);
                    // End:0x162
                    break;
                // End:0x14C
                case 1:
                    co_StatsView.SetIndex(2);
                // End:0xFFFF
                default:
                    co_StatsView.SetIndex(0);
                    // End:0x162
                    break;
                    break;
            }
            // End:0x3B5
            break;
        // End:0x18A
        case "password":
            ch_NoPassword.Checked(bEnabled);
            // End:0x3B5
            break;
        // End:0x1B0
        case "freespace":
            ch_NoFull.Checked(bEnabled);
            // End:0x3B5
            break;
        // End:0x1DB
        case "currentplayers":
            ch_NoEmpty.Checked(bEnabled);
            // End:0x3B5
            break;
        // End:0x1FE
        case "nobots":
            ch_NoBotServers.Checked(bEnabled);
            // End:0x3B5
            break;
        // End:0x3B2
        case "mutator":
            // End:0x23A
            if(Rule.FilterItem.Value ~= "None")
            {
                co_MutatorMode[0].SetIndex(3);                
            }
            else
            {
                J0x23A:

                // End:0x3AF [Loop If]
                if(i < SelectedMutator.Length)
                {
                    // End:0x3A5
                    if(SelectedMutator[i] == "")
                    {
                        // End:0x3A2
                        if((co_MutatorMode[0].GetIndex() < 3) && int(Rule.FilterItem.QueryType) != int(6))
                        {
                            idx = co_Mutator[i].FindIndex(Rule.FilterItem.Value, false, true);
                            // End:0x2CA
                            if(idx < 0)
                            {
                                // [Explicit Break]
                                goto J0x3AF;
                            }
                            co_MutatorMode[i].SetIndex(co_MutatorMode[i].FindIndex(Class'GUI2K4_Decompressed.CustomFilter'.static.GetQueryString(Rule.FilterItem.QueryType),, true));
                            co_Mutator[i].Show();
                            SelectedMutator[i] = Rule.FilterItem.Value;
                            co_Mutator[i].SetIndex(idx);
                            // End:0x3A2
                            if((i + 1) < co_MutatorMode.Length)
                            {
                                co_MutatorMode[i + 1].SetIndex(0);
                                co_MutatorMode[i + 1].Show();
                            }
                        }
                        // [Explicit Break]
                        goto J0x3AF;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x23A;
                }
            }
            J0x3AF:

            // End:0x3B5
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function MyOnChange(GUIComponent Sender)
{
    local MasterServerClient.EQueryType QueryType;
    local int i, Index, idx;
    local string str;
    local AFilterRule Rule;

    // End:0x16
    if(!Controller.bCurMenuInitialized)
    {
        return;
    }
    // End:0x263
    if(moCheckBox(Sender) != none)
    {
        switch(Sender)
        {
            // End:0xB4
            case ch_NoPassword:
                i = FilterMaster.AllFilters[CurrentFilter].FindRuleIndex("password");
                FilterMaster.SetRule(CurrentFilter, i, ch_NoPassword.Caption, "password", "false", "DT_Unique", "QT_Equals");
                // End:0x260
                break;
            // End:0x13E
            case ch_NoFull:
                i = FilterMaster.AllFilters[CurrentFilter].FindRuleIndex("freespace");
                FilterMaster.SetRule(CurrentFilter, i, ch_NoFull.Caption, "freespace", "0", "DT_Unique", "QT_GreaterThan");
                // End:0x260
                break;
            // End:0x1D2
            case ch_NoEmpty:
                i = FilterMaster.AllFilters[CurrentFilter].FindRuleIndex("currentplayers");
                FilterMaster.SetRule(CurrentFilter, i, ch_NoEmpty.Caption, "currentplayers", "0", "DT_Unique", "QT_GreaterThan");
                // End:0x260
                break;
            // End:0x25D
            case ch_NoBotServers:
                i = FilterMaster.AllFilters[CurrentFilter].FindRuleIndex("nobots");
                FilterMaster.SetRule(CurrentFilter, i, ch_NoBotServers.Caption, "nobots", "true", "DT_Unique", Class'GUI2K4_Decompressed.CustomFilter'.static.GetQueryString(QueryType));
                // End:0x260
                break;
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        // End:0x6DA
        if(GUIComboBox(Sender) != none)
        {
            i = 0;
            J0x27A:

            // End:0x3CD [Loop If]
            if(i < co_Mutator.Length)
            {
                // End:0x3C3
                if(co_Mutator[i] == Sender)
                {
                    // End:0x2BF
                    if(SelectedMutator[i] == "")
                    {
                        idx = -1;                        
                    }
                    else
                    {
                        idx = FilterMaster.AllFilters[CurrentFilter].FindRuleIndex("mutator", SelectedMutator[i]);
                    }
                    // End:0x3C1
                    if(UpdateSelectedMutator(i, co_Mutator[i].GetExtra(), co_Mutator[i].FindIndex(SelectedMutator[i],, true)))
                    {
                        SelectedMutator[i] = co_Mutator[i].GetExtra();
                        FilterMaster.SetRule(CurrentFilter, idx, co_Mutator[i].GetText(), "mutator", SelectedMutator[i], "DT_Multiple", co_MutatorMode[i].GetExtra());
                    }
                    return;
                }
                i++;
                // [Loop Continue]
                goto J0x27A;
            }
            i = 0;
            J0x3D4:

            // End:0x6D7 [Loop If]
            if(i < co_MutatorMode.Length)
            {
                // End:0x6CD
                if(co_MutatorMode[i] == Sender)
                {
                    Index = co_MutatorMode[i].GetIndex();
                    // End:0x447
                    if(SelectedMutator[i] == "")
                    {
                        SelectedMutator[i] = co_Mutator[i].GetExtra();
                    }
                    idx = FilterMaster.AllFilters[CurrentFilter].FindRuleIndex("mutator", SelectedMutator[i]);
                    switch(Index)
                    {
                        // End:0x5C6
                        case 0:
                            CheckForNone();
                            FilterMaster.SetRule(CurrentFilter, idx, co_Mutator[i].GetText(), "mutator", SelectedMutator[i], "DT_Multiple", "QT_Disabled");
                            ChangeNextMutatorState(i, false);
                            J0x4F8:

                            // End:0x5C3 [Loop If]
                            if(++i < co_MutatorMode.Length)
                            {
                                // End:0x51F
                                if(SelectedMutator[i] == "")
                                {
                                    // [Explicit Break]
                                    goto J0x5C3;
                                }
                                idx = FilterMaster.AllFilters[CurrentFilter].FindRuleIndex("mutator", SelectedMutator[i]);
                                // End:0x5C0
                                if(FilterMaster.AllFilters[CurrentFilter].GetRule(idx, Rule))
                                {
                                    FilterMaster.AllFilters[CurrentFilter].ChangeRule(idx, Rule.ItemName, Rule.FilterItem.Value, 6);
                                }
                                // [Loop Continue]
                                goto J0x4F8;
                            }
                            J0x5C3:

                            // End:0x6CB
                            break;
                        // End:0x5CA
                        case 1:
                        // End:0x660
                        case 2:
                            CheckForNone();
                            FilterMaster.SetRule(CurrentFilter, idx, co_Mutator[i].GetText(), "mutator", SelectedMutator[i], "DT_Multiple", co_MutatorMode[i].GetExtra());
                            co_Mutator[i].Show();
                            ChangeNextMutatorState(i + 1, true);
                            // End:0x6CB
                            break;
                        // End:0x6C8
                        case 3:
                            FilterMaster.AllFilters[CurrentFilter].RemoveRule("mutator");
                            FilterMaster.AllFilters[CurrentFilter].AddRule("none", "mutator", "", 0, 2);
                            NoMutatorsMode();
                            // End:0x6CB
                            break;
                        // End:0xFFFF
                        default:
                            break;
                    }
                    return;
                }
                i++;
                // [Loop Continue]
                goto J0x3D4;
            }            
        }
        else
        {
            // End:0x7C4
            if(moComboBox(Sender) != none)
            {
                switch(Sender)
                {
                    // End:0x70E
                    case co_WeaponStay:
                        str = "weaponstay";
                        // End:0x744
                        break;
                    // End:0x729
                    case co_Translocator:
                        str = "transloc";
                        // End:0x744
                        break;
                    // End:0x741
                    case co_StatsView:
                        str = "stats";
                        // End:0x744
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
                i = FilterMaster.AllFilters[CurrentFilter].FindRuleIndex(str);
                FilterMaster.SetRule(CurrentFilter, i, moComboBox(Sender).GetText(), str, "true", "DT_Unique", moComboBox(Sender).GetExtra());
            }
        }
    }
    //return;    
}

function bool UpdateSelectedMutator(int Index, string NewValue, int OldValue)
{
    local int i, idx;

    i = 0;
    J0x07:

    // End:0x184 [Loop If]
    if(i < co_Mutator.Length)
    {
        // End:0x29
        if(i == Index)
        {
            // [Explicit Continue]
            goto J0x17A;
        }
        idx = co_Mutator[i].FindIndex(NewValue,, true);
        // End:0xB4
        if(idx >= 0)
        {
            // End:0x91
            if((idx == co_Mutator[i].GetIndex()) && co_Mutator[i].bVisible)
            {
                return false;
            }
            co_Mutator[i].List.RemoveSilent(idx);
        }
        // End:0x17A
        if(OldValue != -1)
        {
            idx = co_Mutator[i].FindIndex(co_Mutator[Index].List.GetExtraAtIndex(OldValue),, true);
            // End:0x17A
            if(idx < 0)
            {
                co_Mutator[i].AddItem(co_Mutator[Index].GetItem(OldValue), co_Mutator[Index].GetItemObject(OldValue), co_Mutator[Index].List.GetExtraAtIndex(OldValue));
            }
        }
        J0x17A:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return true;
    //return;    
}

protected function CheckForNone()
{
    local int i, idx;
    local array<CurrentFilter> Mutes;

    Mutes = FilterMaster.AllFilters[CurrentFilter].GetRuleSet("mutator");
    i = 0;
    J0x34:

    // End:0xD1 [Loop If]
    if(i < Mutes.Length)
    {
        // End:0xC7
        if(Mutes[i].Item.ItemName ~= "none")
        {
            idx = FilterMaster.AllFilters[CurrentFilter].FindItemIndex("mutator", i);
            // End:0xC4
            if(idx >= 0)
            {
                FilterMaster.AllFilters[CurrentFilter].RemoveRuleAt(idx);
            }
            // [Explicit Break]
            goto J0xD1;
        }
        i++;
        // [Loop Continue]
        goto J0x34;
    }
    J0xD1:

    //return;    
}

protected function NoMutatorsMode()
{
    // End:0x2B
    if((co_MutatorMode.Length > 0) && co_Mutator.Length > 0)
    {
        co_MutatorMode[0].Show();
    }
    ChangeNextMutatorState(0, false);
    //return;    
}

protected function ChangeNextMutatorState(int Index, bool bShow)
{
    local int i;
    local AFilterRule Rule;

    // End:0x1F
    if((Index < 0) || Index >= co_MutatorMode.Length)
    {
        return;
    }
    // End:0x178
    if(bShow)
    {
        co_MutatorMode[Index].Show();
        // End:0x175
        if(SelectedMutator[Index] != "")
        {
            i = FilterMaster.AllFilters[CurrentFilter].FindRuleIndex("mutator", SelectedMutator[Index]);
            // End:0x14C
            if(FilterMaster.AllFilters[CurrentFilter].GetRule(i, Rule) && Class'GUI2K4_Decompressed.CustomFilter'.static.GetQueryString(Rule.FilterItem.QueryType) != co_MutatorMode[Index].GetExtra())
            {
                FilterMaster.AllFilters[CurrentFilter].ChangeRule(i, Rule.ItemName, Rule.FilterItem.Value, Class'GUI2K4_Decompressed.CustomFilter'.static.GetQueryType(co_MutatorMode[Index].GetExtra()));
            }
            co_Mutator[Index].Show();
            ChangeNextMutatorState(Index + 1, bShow);
        }        
    }
    else
    {
        // End:0x1A5
        if(co_Mutator[Index].bVisible)
        {
            co_Mutator[Index].Hide();
        }
        // End:0x1ED
        if(((Index + 1) < co_MutatorMode.Length) && co_MutatorMode[Index + 1].bVisible)
        {
            co_MutatorMode[Index + 1].Hide();
        }
        ChangeNextMutatorState(Index + 1, bShow);
    }
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.SimpleFilterPanel.MainOptions'
    begin object name="MainOptions" class=XInterface.GUISectionBackground
        Caption="??"
        LeftPadding=0.5800000
        RightPadding=0.0200000
        TopPadding=0.0500000
        ImageOffset[3]=0.0000000
        WinTop=0.0226190
        WinLeft=0.0052370
        WinWidth=1.6354290
        WinHeight=0.5000440
        OnPreDraw=MainOptions.InternalPreDraw
    end object
    sb_Checks=MainOptions
    // Reference: GUISectionBackground'GUI2K4_Decompressed.SimpleFilterPanel.MutatorOptions'
    begin object name="MutatorOptions" class=XInterface.GUISectionBackground
        bRemapStack=false
        Caption="????"
        ColPadding=0.0200000
        LeftPadding=0.0090000
        RightPadding=0.0090000
        TopPadding=0.0200000
        ImageOffset[3]=10.0000000
        NumColumns=2
        WinTop=0.5395860
        WinLeft=0.0034920
        WinWidth=0.9891620
        WinHeight=0.4562340
        OnPreDraw=MutatorOptions.InternalPreDraw
    end object
    sb_Mutators=MutatorOptions
    // Reference: AltSectionBackground'GUI2K4_Decompressed.SimpleFilterPanel.MultiOptions'
    begin object name="MultiOptions" class=GUI2K4_Decompressed.AltSectionBackground
        ImageOffset[3]=26.0000000
        WinTop=0.0498480
        WinLeft=0.0348990
        WinWidth=0.8958760
        WinHeight=0.4674210
        RenderWeight=0.0910000
        OnPreDraw=MultiOptions.InternalPreDraw
    end object
    sb_Choices=MultiOptions
    // Reference: moCheckBox'GUI2K4_Decompressed.SimpleFilterPanel.NoPasswdCheckBox'
    begin object name="NoPasswdCheckBox" class=XInterface.moCheckBox
        Caption="????? ?? ?? ??"
        OnCreateComponent=NoPasswdCheckBox.InternalOnCreateComponent
        Hint="????? ??? ??? ?? ????? ???? ????."
        WinTop=0.0233330
        WinLeft=0.5000000
        WinWidth=0.4500000
        WinHeight=0.0400000
        TabOrder=4
        OnChange=SimpleFilterPanel.MyOnChange
    end object
    ch_NoPassword=NoPasswdCheckBox
    // Reference: moCheckBox'GUI2K4_Decompressed.SimpleFilterPanel.NoFullCheckBox'
    begin object name="NoFullCheckBox" class=XInterface.moCheckBox
        Caption="? ? ??"
        OnCreateComponent=NoFullCheckBox.InternalOnCreateComponent
        Hint="? ? ??? ?? ????? ???? ????."
        WinTop=0.0854530
        WinLeft=0.0200000
        WinWidth=0.4500000
        WinHeight=0.0400000
        TabOrder=0
        OnChange=SimpleFilterPanel.MyOnChange
    end object
    ch_NoFull=NoFullCheckBox
    // Reference: moCheckBox'GUI2K4_Decompressed.SimpleFilterPanel.NoEmptyCheckBox'
    begin object name="NoEmptyCheckBox" class=XInterface.moCheckBox
        Caption="? ?? ??"
        OnCreateComponent=NoEmptyCheckBox.InternalOnCreateComponent
        Hint="? ??? ?? ????? ???? ????."
        WinTop=0.0854530
        WinLeft=0.5000000
        WinWidth=0.4500000
        WinHeight=0.0400000
        TabOrder=2
        OnChange=SimpleFilterPanel.MyOnChange
    end object
    ch_NoEmpty=NoEmptyCheckBox
    // Reference: moCheckBox'GUI2K4_Decompressed.SimpleFilterPanel.NoBotServersCheckBox'
    begin object name="NoBotServersCheckBox" class=XInterface.moCheckBox
        Caption="?? ?? ?? ??"
        OnCreateComponent=NoBotServersCheckBox.InternalOnCreateComponent
        Hint="?? ?? ??? ?? ????? ???? ????."
        WinTop=0.1475730
        WinLeft=0.0233330
        WinWidth=0.4470700
        WinHeight=0.0400000
        TabOrder=1
        OnChange=SimpleFilterPanel.MyOnChange
    end object
    ch_NoBotServers=NoBotServersCheckBox
    // Reference: GUIComboBox'GUI2K4_Decompressed.SimpleFilterPanel.MutatorCombo'
    begin object name="MutatorCombo" class=XInterface.GUIComboBox
        IniDefault="Choose Mutator"
        Hint="???? ????? ??????."
        WinTop=0.6324010
        WinLeft=0.6575710
        WinWidth=0.3087500
        WinHeight=0.0400000
        TabOrder=10
        bVisible=false
        OnChange=SimpleFilterPanel.MyOnChange
        OnKeyEvent=MutatorCombo.InternalOnKeyEvent
    end object
    co_Mutator[0]=MutatorCombo
    co_Mutator[1]=MutatorCombo
    co_Mutator[2]=MutatorCombo
    co_Mutator[3]=MutatorCombo
    co_Mutator[4]=MutatorCombo
    // Reference: GUIComboBox'GUI2K4_Decompressed.SimpleFilterPanel.MutatorModeCombo'
    begin object name="MutatorModeCombo" class=XInterface.GUIComboBox
        IniDefault="QT_Disabled"
        Hint="???? ?? ??? ??????."
        WinTop=0.6325580
        WinLeft=0.0175000
        WinWidth=0.6188400
        WinHeight=0.0400000
        TabOrder=9
        OnChange=SimpleFilterPanel.MyOnChange
        OnKeyEvent=MutatorModeCombo.InternalOnKeyEvent
    end object
    co_MutatorMode[0]=MutatorModeCombo
    co_MutatorMode[1]=MutatorModeCombo
    co_MutatorMode[2]=MutatorModeCombo
    co_MutatorMode[3]=MutatorModeCombo
    co_MutatorMode[4]=MutatorModeCombo
    // Reference: moComboBox'GUI2K4_Decompressed.SimpleFilterPanel.StatsViewCombo'
    begin object name="StatsViewCombo" class=XInterface.moComboBox
        CaptionWidth=0.4000000
        Caption="????"
        OnCreateComponent=StatsViewCombo.InternalOnCreateComponent
        IniDefault="QT_Disabled"
        Hint="????? ?? ????? ?????."
        WinTop=0.2718130
        WinLeft=0.0175000
        WinWidth=0.9461100
        WinHeight=0.0400000
        TabOrder=4
        OnChange=SimpleFilterPanel.MyOnChange
    end object
    co_StatsView=StatsViewCombo
    // Reference: moComboBox'GUI2K4_Decompressed.SimpleFilterPanel.WeaponStayCombo'
    begin object name="WeaponStayCombo" class=XInterface.moComboBox
        CaptionWidth=0.4000000
        Caption="?? ???"
        OnCreateComponent=WeaponStayCombo.InternalOnCreateComponent
        IniDefault="QT_Disabled"
        Hint="?? ??? ????? ??? ?????."
        WinTop=0.3339330
        WinLeft=0.0175000
        WinWidth=0.9461100
        WinHeight=0.0400000
        TabOrder=5
        OnChange=SimpleFilterPanel.MyOnChange
    end object
    co_WeaponStay=WeaponStayCombo
    // Reference: moComboBox'GUI2K4_Decompressed.SimpleFilterPanel.TranslocatorCombo'
    begin object name="TranslocatorCombo" class=XInterface.moComboBox
        CaptionWidth=0.4000000
        Caption="???????"
        OnCreateComponent=TranslocatorCombo.InternalOnCreateComponent
        IniDefault="QT_Disabled"
        Hint="???????? ????? ??? ?????."
        WinTop=0.3960530
        WinLeft=0.0175000
        WinWidth=0.9461100
        WinHeight=0.0400000
        TabOrder=6
        OnChange=SimpleFilterPanel.MyOnChange
    end object
    co_Translocator=TranslocatorCombo
    ViewStatsStrings[0]="?? ??"
    ViewStatsStrings[1]="?? ???"
    ViewStatsStrings[2]="?? ??? ???"
    MutatorModeStrings[0]="?? ????"
    MutatorModeStrings[1]="??? ?????"
    MutatorModeStrings[2]="??? ???? ??"
    MutatorModeStrings[3]="???? ??"
    WeaponStayStrings[0]="?? ??"
    WeaponStayStrings[1]="?? ??? ???"
    WeaponStayStrings[2]="?? ??? ?? ??"
    TranslocatorStrings[0]="?? ??"
    TranslocatorStrings[1]="??????? ???"
    TranslocatorStrings[2]="??????? ?? ??"
    SaveString="??? ????? ???????!"
    PropagateVisibility=false
}