/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4CustomRulesPanel.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:8
 *
 *******************************************************************************/
class UT2K4CustomRulesPanel extends GUIFilterPanel
    config(User)
    editinlinenew
    instanced;

var array<MutatorRecord> MutRecords;

function InitComponent(GUIController MyC, GUIComponent MyO)
{
    class'CacheManager'.static.GetMutatorList(MutRecords);
    super.InitComponent(MyC, MyO);
    lb_Rules.__OnChange__Delegate = InternalOnChange;
}

function Refresh()
{
    // End:0x16
    if(p_Anchor.Index < 0)
    {
        return;
    }
    super(UT2K4PlayInfoPanel).Refresh();
}

function LoadRules()
{
    local int i;
    local export editinline moComboBox co;
    local bool bTempInit;

    // End:0x16
    if(p_Anchor.Index < 0)
    {
        return;
    }
    bTempInit = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = false;
    i = 0;
    J0x44:
    // End:0xac [While If]
    if(i < MutRecords.Length)
    {
        co = moComboBox(li_Rules.AddItem("XInterface.moComboBox",, MutRecords[i].FriendlyName));
        PopulateFilterTypes(co, false);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x44;
    }
    super(UT2K4PlayInfoPanel).LoadRules();
    Controller.bCurMenuInitialized = bTempInit;
}

function UpdateRules()
{
    local array<CurrentFilter> Muts;
    local export editinline moComboBox co;
    local int i, idx, j;
    local bool bTemp;

    bTemp = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = false;
    Muts = FilterMaster.AllFilters[p_Anchor.Index].GetRuleSet("mutator");
    i = 0;
    J0x64:
    // End:0x14e [While If]
    if(i < li_Rules.Elements.Length)
    {
        co = moComboBox(li_Rules.GetItem(i));
        j = 0;
        J0xa3:
        // End:0x144 [While If]
        if(j < Muts.Length)
        {
            // End:0x13a
            if(Muts[i].Item.ItemName ~= co.Caption)
            {
                idx = co.FindIndex(class'CustomFilter'.static.GetQueryString(Muts[i].Item.FilterItem.QueryType), true, true);
                assert(idx >= 0);
                co.SetIndex(idx);
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0xa3;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x64;
    }
    Controller.bCurMenuInitialized = bTemp;
}

function ListOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x4e
    if(GUIMultiOptionListBox(Sender) != none)
    {
        // End:0x30
        if(GUIMultiOptionList(NewComp) != none)
        {
            li_Rules = GUIMultiOptionList(NewComp);
        }
        GUIMultiOptionListBox(Sender).InternalOnCreateComponent(NewComp, Sender);
    }
}

function InternalOnChange(GUIComponent Sender)
{
    local export editinline moComboBox Changed;
    local int RuleIdx, inner;
    local string ClsName, InnerStr, str;

    // End:0x157
    if(GUIMultiOptionList(Sender) != none)
    {
        Changed = moComboBox(GUIMultiOptionList(Sender).Get());
        // End:0x107
        if(Changed != none)
        {
            ClsName = GetMutClassName(Changed.Caption);
            // End:0xf2
            if(ClsName != "")
            {
                inner = FilterMaster.AllFilters[p_Anchor.Index].FindInnerIndex("mutator", ClsName);
                // End:0xb7
                if(inner != -1)
                {
                    InnerStr = string(inner);
                }
                RuleIdx = FilterMaster.AllFilters[p_Anchor.Index].FindRuleIndex("mutator", InnerStr);
            }
            str = Changed.GetExtra();
        }
        FilterMaster.SetRule(p_Anchor.Index, RuleIdx, Changed.Caption, "mutator", ClsName, "DT_Multiple", str);
    }
}

function string GetMutClassName(string FriendlyName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4c [While If]
    if(i < MutRecords.Length)
    {
        // End:0x42
        if(MutRecords[i].FriendlyName ~= FriendlyName)
        {
            return MutRecords[i].ClassName;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return "";
}

function string GetMutFriendlyName(string ClassName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4c [While If]
    if(i < MutRecords.Length)
    {
        // End:0x42
        if(MutRecords[i].ClassName ~= ClassName)
        {
            return MutRecords[i].FriendlyName;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return "";
}

defaultproperties
{
    begin object name=CustomListBox class=GUIMultiOptionListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=ListOnCreateComponent
        WinLeft=0.050
        WinWidth=0.90
    object end
    // Reference: GUIMultiOptionListBox'UT2K4CustomRulesPanel.CustomListBox'
    lb_Rules=CustomListBox
    OnCreateComponent=InternalOnCreateComponent
}