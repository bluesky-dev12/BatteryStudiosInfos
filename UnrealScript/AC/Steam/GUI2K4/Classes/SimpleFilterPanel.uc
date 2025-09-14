/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\SimpleFilterPanel.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:22
 *	Functions:9
 *
 *******************************************************************************/
class SimpleFilterPanel extends GUIPanel
    editinlinenew
    instanced;

struct FilterItem
{
    var string FilterTag;
    var bool bEnabled;
};

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Checks;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Mutators;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify AltSectionBackground sb_Choices;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_NoPassword;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_NoFull;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_NoEmpty;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_NoBotServers;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Show2003;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify array<databinding export editinlinenotify GUIComboBox> co_Mutator;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify array<databinding export editinlinenotify GUIComboBox> co_MutatorMode;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_StatsView;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_WeaponStay;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Translocator;
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
    class'CacheManager'.static.GetMutatorList(MutatorRecords);
    i = 0;
    J0xa4:
    // End:0x1a2 [While If]
    if(i < co_MutatorMode.Length)
    {
        co_MutatorMode[i].AddItem(MutatorModeStrings[0],, "QT_Disabled");
        co_MutatorMode[i].AddItem(MutatorModeStrings[1],, "QT_Equals");
        co_MutatorMode[i].AddItem(MutatorModeStrings[2],, "QT_NotEquals");
        co_MutatorMode[i].ReadOnly(true);
        co_MutatorMode[i].Edit.bAlwaysNotify = true;
        co_MutatorMode[i].TabOrder = co_MutatorMode[0].TabOrder + i * 2;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xa4;
    }
    co_MutatorMode[0].AddItem(MutatorModeStrings[3],, "QT_Equals");
    i = 0;
    J0x1ce:
    // End:0x2cb [While If]
    if(i < co_Mutator.Length)
    {
        co_Mutator[i].List.bSorted = true;
        j = 0;
        J0x205:
        // End:0x25b [While If]
        if(j < MutatorRecords.Length)
        {
            co_Mutator[i].AddItem(MutatorRecords[j].FriendlyName, none, GetItemName(MutatorRecords[j].ClassName));
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x205;
        }
        co_Mutator[i].ReadOnly(true);
        co_Mutator[i].Edit.bAlwaysNotify = true;
        co_Mutator[i].TabOrder = co_MutatorMode[0].TabOrder + i * 2;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1ce;
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
    // End:0x497 [While If]
    if(i < co_MutatorMode.Length)
    {
        sb_Mutators.ManageComponent(co_MutatorMode[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x463;
    }
    i = 0;
    J0x49e:
    // End:0x4d2 [While If]
    if(i < co_Mutator.Length)
    {
        sb_Mutators.ManageComponent(co_Mutator[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x49e;
    }
}

function FilterSelectionChanged(bool bValid)
{
    local int i;

    // End:0x3e
    if(bValid)
    {
        i = 0;
        J0x10:
        // End:0x3b [While If]
        if(i < Components.Length)
        {
            EnableComponent(Components[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x10;
        }
    }
    // End:0x78
    else
    {
        ChangeNextMutatorState(0, false);
        i = 0;
        J0x4d:
        // End:0x78 [While If]
        if(i < Components.Length)
        {
            DisableComponent(Components[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x4d;
        }
    }
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
    J0x2e:
    // End:0xc4 [While If]
    if(i < Components.Length)
    {
        // End:0x89
        if(GUIMenuOption(Components[i]) != none && moComboBox(Components[i]) == none)
        {
            GUIMenuOption(Components[i]).ResetComponent();
        }
        // End:0xba
        else
        {
            // End:0xba
            if(GUIComboBox(Components[i]) != none)
            {
                GUIComboBox(Components[i]).SetIndex(0);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2e;
    }
    ChangeNextMutatorState(0, false);
    i = 0;
    J0xd3:
    // End:0xfb [While If]
    if(i < SelectedMutator.Length)
    {
        SelectedMutator[i] = "";
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd3;
    }
    // End:0x2c1
    if(FilterMaster != none && NewFilterIndex >= 0 && NewFilterIndex < FilterMaster.AllFilters.Length)
    {
        CurrentFilter = NewFilterIndex;
        Rules = FilterMaster.GetFilterRules(NewFilterIndex);
        i = 0;
        J0x15a:
        // End:0x231 [While If]
        if(i < Rules.Length)
        {
            // End:0x227
            if(Rules[i].FilterItem.key ~= "mutator")
            {
                // End:0x1c0
                if(Rules[i].ItemName ~= "none")
                {
                    MutatorArray.Insert(0, 1);
                    MutatorArray[0] = i;
                }
                // End:0x227
                else
                {
                    j = 0;
                    J0x1c7:
                    // End:0x20a [While If]
                    if(j < MutatorArray.Length)
                    {
                        // End:0x200
                        if(Rules[MutatorArray[j]].FilterItem.QueryType == 6)
                        {
                        }
                        // End:0x20a
                        else
                        {
                            ++ j;
                            // This is an implied JumpToken; Continue!
                            goto J0x1c7;
                        }
                    }
                    MutatorArray.Insert(j, 1);
                    MutatorArray[j] = i;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x15a;
        }
        i = 0;
        J0x238:
        // End:0x289 [While If]
        if(i < Rules.Length)
        {
            // End:0x26e
            if(Rules[i].FilterItem.key ~= "mutator")
            {
            }
            // End:0x27f
            else
            {
                UpdateRule(Rules[i]);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x238;
        }
        i = 0;
        J0x290:
        // End:0x2c1 [While If]
        if(i < MutatorArray.Length)
        {
            UpdateRule(Rules[MutatorArray[i]]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x290;
        }
    }
    Controller.bCurMenuInitialized = bTemp;
    i = 0;
    J0x2de:
    // End:0x32f [While If]
    if(i < SelectedMutator.Length)
    {
        // End:0x325
        if(SelectedMutator[i] != "")
        {
            UpdateSelectedMutator(i, co_Mutator[i].GetExtra(), -1);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2de;
    }
}

function UpdateRule(AFilterRule Rule)
{
    local int i, idx;
    local bool bEnabled;

    bEnabled = Rule.FilterItem.QueryType != 6;
    switch(Locs(Rule.FilterItem.key))
    {
        // End:0x9b
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
                // End:0xffff
                default:
                    co_WeaponStay.SetIndex(0);
                    // End:0x98 Break;
                    break;
            }
            // End:0x3b5
            break;
        // End:0x103
        case "transloc":
            switch(Rule.FilterItem.QueryType)
            {
                // End:0xd1
                case 0:
                    co_Translocator.SetIndex(1);
                    // End:0x100
                    break;
                // End:0xea
                case 1:
                    co_Translocator.SetIndex(2);
                    // End:0x100
                    break;
                // End:0xffff
                default:
                    co_Translocator.SetIndex(0);
                    // End:0x100 Break;
                    break;
            }
            // End:0x3b5
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
                // End:0x14c
                case 1:
                    co_StatsView.SetIndex(2);
                // End:0xffff
                default:
                    co_StatsView.SetIndex(0);
                    // End:0x162 Break;
                    break;
            }
            // End:0x3b5
            break;
        // End:0x18a
        case "password":
            ch_NoPassword.Checked(bEnabled);
            // End:0x3b5
            break;
        // End:0x1b0
        case "freespace":
            ch_NoFull.Checked(bEnabled);
            // End:0x3b5
            break;
        // End:0x1db
        case "currentplayers":
            ch_NoEmpty.Checked(bEnabled);
            // End:0x3b5
            break;
        // End:0x1fe
        case "nobots":
            ch_NoBotServers.Checked(bEnabled);
            // End:0x3b5
            break;
        // End:0x3b2
        case "mutator":
            // End:0x23a
            if(Rule.FilterItem.Value ~= "None")
            {
                co_MutatorMode[0].SetIndex(3);
            }
            // End:0x3af
            else
            {
                J0x23a:
                // End:0x3af [While If]
                if(i < SelectedMutator.Length)
                {
                    // End:0x3a5
                    if(SelectedMutator[i] == "")
                    {
                        // End:0x3a2
                        if(co_MutatorMode[0].GetIndex() < 3 && Rule.FilterItem.QueryType != 6)
                        {
                            idx = co_Mutator[i].FindIndex(Rule.FilterItem.Value, false, true);
                            // End:0x2ca
                            if(idx < 0)
                            {
                            }
                            // End:0x3af
                            else
                            {
                                co_MutatorMode[i].SetIndex(co_MutatorMode[i].FindIndex(class'CustomFilter'.static.GetQueryString(Rule.FilterItem.QueryType),, true));
                                co_Mutator[i].Show();
                                SelectedMutator[i] = Rule.FilterItem.Value;
                                co_Mutator[i].SetIndex(idx);
                                // End:0x3a2
                                if(i + 1 < co_MutatorMode.Length)
                                {
                                    co_MutatorMode[i + 1].SetIndex(0);
                                    co_MutatorMode[i + 1].Show();
                                }
                            }
                            // This is an implied JumpToken;
                            goto J0x3af;
                        }
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x23a;
                    }
                }
            }
            // End:0x3b5
            break;
        // End:0xffff
        default:
}

function MyOnChange(GUIComponent Sender)
{
    local IpDrv.MasterServerClient.EQueryType QueryType;
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
            // End:0xb4
            case ch_NoPassword:
                i = FilterMaster.AllFilters[CurrentFilter].FindRuleIndex("password");
                FilterMaster.SetRule(CurrentFilter, i, ch_NoPassword.Caption, "password", "false", "DT_Unique", "QT_Equals");
                // End:0x260
                break;
            // End:0x13e
            case ch_NoFull:
                i = FilterMaster.AllFilters[CurrentFilter].FindRuleIndex("freespace");
                FilterMaster.SetRule(CurrentFilter, i, ch_NoFull.Caption, "freespace", "0", "DT_Unique", "QT_GreaterThan");
                // End:0x260
                break;
            // End:0x1d2
            case ch_NoEmpty:
                i = FilterMaster.AllFilters[CurrentFilter].FindRuleIndex("currentplayers");
                FilterMaster.SetRule(CurrentFilter, i, ch_NoEmpty.Caption, "currentplayers", "0", "DT_Unique", "QT_GreaterThan");
                // End:0x260
                break;
            // End:0x25d
            case ch_NoBotServers:
                i = FilterMaster.AllFilters[CurrentFilter].FindRuleIndex("nobots");
                FilterMaster.SetRule(CurrentFilter, i, ch_NoBotServers.Caption, "nobots", "true", "DT_Unique", class'CustomFilter'.static.GetQueryString(QueryType));
                // End:0x260
                break;
            // End:0xffff
            default:
                // End:0x7c4 Break;
                break;
            }
    }
    // End:0x6da
    if(GUIComboBox(Sender) != none)
    {
        i = 0;
        J0x27a:
        // End:0x3cd [While If]
        if(i < co_Mutator.Length)
        {
            // End:0x3c3
            if(co_Mutator[i] == Sender)
            {
                // End:0x2bf
                if(SelectedMutator[i] == "")
                {
                    idx = -1;
                }
                // End:0x2f7
                else
                {
                    idx = FilterMaster.AllFilters[CurrentFilter].FindRuleIndex("mutator", SelectedMutator[i]);
                }
                // End:0x3c1
                if(UpdateSelectedMutator(i, co_Mutator[i].GetExtra(), co_Mutator[i].FindIndex(SelectedMutator[i],, true)))
                {
                    SelectedMutator[i] = co_Mutator[i].GetExtra();
                    FilterMaster.SetRule(CurrentFilter, idx, co_Mutator[i].GetText(), "mutator", SelectedMutator[i], "DT_Multiple", co_MutatorMode[i].GetExtra());
                }
                return;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x27a;
        }
        i = 0;
        J0x3d4:
        // End:0x6d7 [While If]
        if(i < co_MutatorMode.Length)
        {
            // End:0x6cd
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
                    // End:0x5c6
                    case 0:
                        CheckForNone();
                        FilterMaster.SetRule(CurrentFilter, idx, co_Mutator[i].GetText(), "mutator", SelectedMutator[i], "DT_Multiple", "QT_Disabled");
                        ChangeNextMutatorState(i, false);
                        J0x4f8:
                        // End:0x5c3 [While If]
                        if(++ i < co_MutatorMode.Length)
                        {
                            // End:0x51f
                            if(SelectedMutator[i] == "")
                            {
                            }
                            // End:0x5c3
                            else
                            {
                                idx = FilterMaster.AllFilters[CurrentFilter].FindRuleIndex("mutator", SelectedMutator[i]);
                                // End:0x5c0
                                if(FilterMaster.AllFilters[CurrentFilter].GetRule(idx, Rule))
                                {
                                    FilterMaster.AllFilters[CurrentFilter].ChangeRule(idx, Rule.ItemName, Rule.FilterItem.Value, 6);
                                }
                                // This is an implied JumpToken; Continue!
                                goto J0x4f8;
                            }
                        }
                        // End:0x6cb
                        break;
                    // End:0x5ca
                    case 1:
                    // End:0x660
                    case 2:
                        CheckForNone();
                        FilterMaster.SetRule(CurrentFilter, idx, co_Mutator[i].GetText(), "mutator", SelectedMutator[i], "DT_Multiple", co_MutatorMode[i].GetExtra());
                        co_Mutator[i].Show();
                        ChangeNextMutatorState(i + 1, true);
                        // End:0x6cb
                        break;
                    // End:0x6c8
                    case 3:
                        FilterMaster.AllFilters[CurrentFilter].RemoveRule("mutator");
                        FilterMaster.AllFilters[CurrentFilter].AddRule("none", "mutator", "", 0, 2);
                        NoMutatorsMode();
                        // End:0x6cb
                        break;
                    // End:0xffff
                    default:
                        return;
                    }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x3d4;
        }
    }
    // End:0x7c4
    else
    {
        // End:0x7c4
        if(moComboBox(Sender) != none)
        {
            switch(Sender)
            {
                // End:0x70e
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
                // End:0xffff
                default:
                    i = FilterMaster.AllFilters[CurrentFilter].FindRuleIndex(str);
                    FilterMaster.SetRule(CurrentFilter, i, moComboBox(Sender).GetText(), str, "true", "DT_Unique", moComboBox(Sender).GetExtra());
                }
            }
}

function bool UpdateSelectedMutator(int Index, string NewValue, int OldValue)
{
    local int i, idx;

    i = 0;
    J0x07:
    // End:0x184 [While If]
    if(i < co_Mutator.Length)
    {
        // End:0x29
        if(i == Index)
        {
        }
        // End:0x17a
        else
        {
            idx = co_Mutator[i].FindIndex(NewValue,, true);
            // End:0xb4
            if(idx >= 0)
            {
                // End:0x91
                if(idx == co_Mutator[i].GetIndex() && co_Mutator[i].bVisible)
                {
                    return false;
                }
                co_Mutator[i].List.RemoveSilent(idx);
            }
            // End:0x17a
            if(OldValue != -1)
            {
                idx = co_Mutator[i].FindIndex(co_Mutator[Index].List.GetExtraAtIndex(OldValue),, true);
                // End:0x17a
                if(idx < 0)
                {
                    co_Mutator[i].AddItem(co_Mutator[Index].GetItem(OldValue), co_Mutator[Index].GetItemObject(OldValue), co_Mutator[Index].List.GetExtraAtIndex(OldValue));
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return true;
}

protected function CheckForNone()
{
    local int i, idx;
    local array<CurrentFilter> Mutes;

    Mutes = FilterMaster.AllFilters[CurrentFilter].GetRuleSet("mutator");
    i = 0;
    J0x34:
    // End:0xd1 [While If]
    if(i < Mutes.Length)
    {
        // End:0xc7
        if(Mutes[i].Item.ItemName ~= "none")
        {
            idx = FilterMaster.AllFilters[CurrentFilter].FindItemIndex("mutator", i);
            // End:0xc4
            if(idx >= 0)
            {
                FilterMaster.AllFilters[CurrentFilter].RemoveRuleAt(idx);
            }
        }
        // End:0xd1
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x34;
        }
    }
}

protected function NoMutatorsMode()
{
    // End:0x2b
    if(co_MutatorMode.Length > 0 && co_Mutator.Length > 0)
    {
        co_MutatorMode[0].Show();
    }
    ChangeNextMutatorState(0, false);
}

protected function ChangeNextMutatorState(int Index, bool bShow)
{
    local int i;
    local AFilterRule Rule;

    // End:0x1f
    if(Index < 0 || Index >= co_MutatorMode.Length)
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
            // End:0x14c
            if(FilterMaster.AllFilters[CurrentFilter].GetRule(i, Rule) && class'CustomFilter'.static.GetQueryString(Rule.FilterItem.QueryType) != co_MutatorMode[Index].GetExtra())
            {
                FilterMaster.AllFilters[CurrentFilter].ChangeRule(i, Rule.ItemName, Rule.FilterItem.Value, class'CustomFilter'.static.GetQueryType(co_MutatorMode[Index].GetExtra()));
            }
            co_Mutator[Index].Show();
            ChangeNextMutatorState(Index + 1, bShow);
        }
    }
    // End:0x201
    else
    {
        // End:0x1a5
        if(co_Mutator[Index].bVisible)
        {
            co_Mutator[Index].Hide();
        }
        // End:0x1ed
        if(Index + 1 < co_MutatorMode.Length && co_MutatorMode[Index + 1].bVisible)
        {
            co_MutatorMode[Index + 1].Hide();
        }
        ChangeNextMutatorState(Index + 1, bShow);
    }
}

defaultproperties
{
    begin object name=MainOptions class=GUISectionBackground
        Caption="??"
        LeftPadding=0.580
        RightPadding=0.020
        TopPadding=0.050
        ImageOffset[3]=0.0
        WinTop=0.0226190
        WinLeft=0.0052370
        WinWidth=1.6354290
        WinHeight=0.5000440
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'SimpleFilterPanel.MainOptions'
    sb_Checks=MainOptions
    begin object name=MutatorOptions class=GUISectionBackground
        bRemapStack=true
        Caption="????"
        ColPadding=0.020
        LeftPadding=0.0090
        RightPadding=0.0090
        TopPadding=0.020
        ImageOffset[3]=10.0
        NumColumns=2
        WinTop=0.5395860
        WinLeft=0.0034920
        WinWidth=0.9891620
        WinHeight=0.4562340
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'SimpleFilterPanel.MutatorOptions'
    sb_Mutators=MutatorOptions
    begin object name=MultiOptions class=AltSectionBackground
        ImageOffset[3]=26.0
        WinTop=0.0498480
        WinLeft=0.0348990
        WinWidth=0.8958760
        WinHeight=0.4674210
        RenderWeight=0.0910
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'SimpleFilterPanel.MultiOptions'
    sb_Choices=MultiOptions
    begin object name=NoPasswdCheckBox class=moCheckBox
        Caption="????? ?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="????? ??? ??? ?? ????? ???? ????."
        WinTop=0.0233330
        WinLeft=0.50
        WinWidth=0.450
        WinHeight=0.040
        TabOrder=4
        OnChange=MyOnChange
    object end
    // Reference: moCheckBox'SimpleFilterPanel.NoPasswdCheckBox'
    ch_NoPassword=NoPasswdCheckBox
    begin object name=NoFullCheckBox class=moCheckBox
        Caption="? ? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="? ? ??? ?? ????? ???? ????."
        WinTop=0.0854530
        WinLeft=0.020
        WinWidth=0.450
        WinHeight=0.040
        TabOrder=0
        OnChange=MyOnChange
    object end
    // Reference: moCheckBox'SimpleFilterPanel.NoFullCheckBox'
    ch_NoFull=NoFullCheckBox
    begin object name=NoEmptyCheckBox class=moCheckBox
        Caption="? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="? ??? ?? ????? ???? ????."
        WinTop=0.0854530
        WinLeft=0.50
        WinWidth=0.450
        WinHeight=0.040
        TabOrder=2
        OnChange=MyOnChange
    object end
    // Reference: moCheckBox'SimpleFilterPanel.NoEmptyCheckBox'
    ch_NoEmpty=NoEmptyCheckBox
    begin object name=NoBotServersCheckBox class=moCheckBox
        Caption="?? ?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="?? ?? ??? ?? ????? ???? ????."
        WinTop=0.1475730
        WinLeft=0.0233330
        WinWidth=0.447070
        WinHeight=0.040
        TabOrder=1
        OnChange=MyOnChange
    object end
    // Reference: moCheckBox'SimpleFilterPanel.NoBotServersCheckBox'
    ch_NoBotServers=NoBotServersCheckBox
    co_Mutator=// Object reference not set to an instance of an object.
    
    co_MutatorMode=// Object reference not set to an instance of an object.
    
    begin object name=StatsViewCombo class=moComboBox
        CaptionWidth=0.40
        Caption="????"
        OnCreateComponent=InternalOnCreateComponent
        IniDefault="QT_Disabled"
        Hint="????? ?? ????? ?????."
        WinTop=0.2718130
        WinLeft=0.01750
        WinWidth=0.946110
        WinHeight=0.040
        TabOrder=4
        OnChange=MyOnChange
    object end
    // Reference: moComboBox'SimpleFilterPanel.StatsViewCombo'
    co_StatsView=StatsViewCombo
    begin object name=WeaponStayCombo class=moComboBox
        CaptionWidth=0.40
        Caption="?? ???"
        OnCreateComponent=InternalOnCreateComponent
        IniDefault="QT_Disabled"
        Hint="?? ??? ????? ??? ?????."
        WinTop=0.3339330
        WinLeft=0.01750
        WinWidth=0.946110
        WinHeight=0.040
        TabOrder=5
        OnChange=MyOnChange
    object end
    // Reference: moComboBox'SimpleFilterPanel.WeaponStayCombo'
    co_WeaponStay=WeaponStayCombo
    begin object name=TranslocatorCombo class=moComboBox
        CaptionWidth=0.40
        Caption="???????"
        OnCreateComponent=InternalOnCreateComponent
        IniDefault="QT_Disabled"
        Hint="???????? ????? ??? ?????."
        WinTop=0.3960530
        WinLeft=0.01750
        WinWidth=0.946110
        WinHeight=0.040
        TabOrder=6
        OnChange=MyOnChange
    object end
    // Reference: moComboBox'SimpleFilterPanel.TranslocatorCombo'
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
    PropagateVisibility=true
}