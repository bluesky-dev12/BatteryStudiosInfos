/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4FilterSummaryPanel.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:6
 *
 *******************************************************************************/
class UT2K4FilterSummaryPanel extends GUIFilterPanel
    config(User)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify UT2K4FilterSummaryListBox lb_FilterRules;
var export editinline UT2K4FilterSummaryList li_FilterRules;
var(Menu) config array<float> HeaderColumnPerc;

function Refresh()
{
    UpdateRules();
}

function UpdateRules()
{
    local int i;

    ClearRules();
    FilterRules = FilterMaster.GetFilterRules(p_Anchor.Index);
    i = 0;
    J0x30:
    // End:0x5b [While If]
    if(i < FilterRules.Length)
    {
        AddFilterRule(FilterRules[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x30;
    }
    Log("FilterSummaryPanel.LoadRules()---------------------");
    i = 0;
    J0x99:
    // End:0xf0 [While If]
    if(i < li_FilterRules.Rules.Length)
    {
        Log("Rules[" $ string(i) $ "]:" $ li_FilterRules.Rules[i].ItemName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x99;
    }
    super(UT2K4PlayInfoPanel).UpdateRules();
}

function ClearRules()
{
    li_FilterRules.Clear();
    super(UT2K4PlayInfoPanel).ClearRules();
}

function AddFilterRule(AFilterRule NewRule)
{
    li_FilterRules.AddFilterRule(NewRule);
}

function ListOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x8d
    if(UT2K4FilterSummaryListBox(Sender) != none)
    {
        // End:0x6f
        if(UT2K4FilterSummaryList(NewComp) != none)
        {
            li_FilterRules = UT2K4FilterSummaryList(NewComp);
            li_FilterRules.IniOption = "@Internal";
            li_FilterRules.p_Anchor = p_Anchor;
            li_FilterRules.ExpandLastColumn = true;
        }
        UT2K4FilterSummaryListBox(Sender).InternalOnCreateComponent(NewComp, Sender);
    }
}

function string InternalOnSaveINI(GUIComponent Sender)
{
    HeaderColumnPerc = lb_FilterRules.HeaderColumnPerc;
    SaveConfig();
    return OnSaveINI(Sender);
}

defaultproperties
{
    begin object name=RulesBox class=UT2K4FilterSummaryListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=ListOnCreateComponent
    object end
    // Reference: UT2K4FilterSummaryListBox'UT2K4FilterSummaryPanel.RulesBox'
    lb_FilterRules=RulesBox
    HeaderColumnPerc=// Object reference not set to an instance of an object.
    
    begin object name=RulesLB class=GUIMultiOptionListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
    object end
    // Reference: GUIMultiOptionListBox'UT2K4FilterSummaryPanel.RulesLB'
    lb_Rules=RulesLB
    OnCreateComponent=InternalOnCreateComponent
    OnSaveINI=InternalOnSaveINI
}