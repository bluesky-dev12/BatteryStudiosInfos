class UT2K4CustomRulesPanel extends GUIFilterPanel
    config(User)
    editinlinenew
    instanced;

var array<MutatorRecord> MutRecords;

function InitComponent(GUIController MyC, GUIComponent MyO)
{
    Class'Engine.CacheManager'.static.GetMutatorList(MutRecords);
    super.InitComponent(MyC, MyO);
    lb_Rules.__OnChange__Delegate = InternalOnChange;
    //return;    
}

function Refresh()
{
    // End:0x16
    if(p_Anchor.Index < 0)
    {
        return;
    }
    super(UT2K4PlayInfoPanel).Refresh();
    //return;    
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

    // End:0xAC [Loop If]
    if(i < MutRecords.Length)
    {
        co = moComboBox(li_Rules.AddItem("XInterface.moComboBox",, MutRecords[i].FriendlyName));
        PopulateFilterTypes(co, false);
        i++;
        // [Loop Continue]
        goto J0x44;
    }
    super(UT2K4PlayInfoPanel).LoadRules();
    Controller.bCurMenuInitialized = bTempInit;
    //return;    
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

    // End:0x14E [Loop If]
    if(i < li_Rules.Elements.Length)
    {
        co = moComboBox(li_Rules.GetItem(i));
        j = 0;
        J0xA3:

        // End:0x144 [Loop If]
        if(j < Muts.Length)
        {
            // End:0x13A
            if(Muts[i].Item.ItemName ~= co.Caption)
            {
                idx = co.FindIndex(Class'GUI2K4_Decompressed.CustomFilter'.static.GetQueryString(Muts[i].Item.FilterItem.QueryType), true, true);
                assert(idx >= 0);
                co.SetIndex(idx);
            }
            j++;
            // [Loop Continue]
            goto J0xA3;
        }
        i++;
        // [Loop Continue]
        goto J0x64;
    }
    Controller.bCurMenuInitialized = bTemp;
    //return;    
}

function ListOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x4E
    if(GUIMultiOptionListBox(Sender) != none)
    {
        // End:0x30
        if(GUIMultiOptionList(NewComp) != none)
        {
            li_Rules = GUIMultiOptionList(NewComp);
        }
        GUIMultiOptionListBox(Sender).InternalOnCreateComponent(NewComp, Sender);
    }
    //return;    
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
            // End:0xF2
            if(ClsName != "")
            {
                inner = FilterMaster.AllFilters[p_Anchor.Index].FindInnerIndex("mutator", ClsName);
                // End:0xB7
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
    //return;    
}

function string GetMutClassName(string FriendlyName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4C [Loop If]
    if(i < MutRecords.Length)
    {
        // End:0x42
        if(MutRecords[i].FriendlyName ~= FriendlyName)
        {
            return MutRecords[i].ClassName;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return "";
    //return;    
}

function string GetMutFriendlyName(string ClassName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4C [Loop If]
    if(i < MutRecords.Length)
    {
        // End:0x42
        if(MutRecords[i].ClassName ~= ClassName)
        {
            return MutRecords[i].FriendlyName;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return "";
    //return;    
}

defaultproperties
{
    // Reference: GUIMultiOptionListBox'GUI2K4_Decompressed.UT2K4CustomRulesPanel.CustomListBox'
    begin object name="CustomListBox" class=XInterface.GUIMultiOptionListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=UT2K4CustomRulesPanel.ListOnCreateComponent
        WinLeft=0.0500000
        WinWidth=0.9000000
    end object
    lb_Rules=CustomListBox
    OnCreateComponent=UT2K4CustomRulesPanel.InternalOnCreateComponent
}