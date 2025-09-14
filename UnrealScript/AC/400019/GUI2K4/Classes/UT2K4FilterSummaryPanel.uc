class UT2K4FilterSummaryPanel extends GUIFilterPanel
    config(User)
    editinlinenew
    instanced;

var() automated UT2K4FilterSummaryListBox lb_FilterRules;
var export editinline UT2K4FilterSummaryList li_FilterRules;
var(Menu) config array<float> HeaderColumnPerc;

function Refresh()
{
    UpdateRules();
    //return;    
}

function UpdateRules()
{
    local int i;

    ClearRules();
    FilterRules = FilterMaster.GetFilterRules(p_Anchor.Index);
    i = 0;
    J0x30:

    // End:0x5B [Loop If]
    if(i < FilterRules.Length)
    {
        AddFilterRule(FilterRules[i]);
        i++;
        // [Loop Continue]
        goto J0x30;
    }
    Log("FilterSummaryPanel.LoadRules()---------------------");
    i = 0;
    J0x99:

    // End:0xF0 [Loop If]
    if(i < li_FilterRules.Rules.Length)
    {
        Log((("Rules[" $ string(i)) $ "]:") $ li_FilterRules.Rules[i].ItemName);
        i++;
        // [Loop Continue]
        goto J0x99;
    }
    super(UT2K4PlayInfoPanel).UpdateRules();
    //return;    
}

function ClearRules()
{
    li_FilterRules.Clear();
    super(UT2K4PlayInfoPanel).ClearRules();
    //return;    
}

function AddFilterRule(AFilterRule NewRule)
{
    li_FilterRules.AddFilterRule(NewRule);
    //return;    
}

function ListOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x8D
    if(UT2K4FilterSummaryListBox(Sender) != none)
    {
        // End:0x6F
        if(UT2K4FilterSummaryList(NewComp) != none)
        {
            li_FilterRules = UT2K4FilterSummaryList(NewComp);
            li_FilterRules.IniOption = "@Internal";
            li_FilterRules.p_Anchor = p_Anchor;
            li_FilterRules.ExpandLastColumn = true;
        }
        UT2K4FilterSummaryListBox(Sender).InternalOnCreateComponent(NewComp, Sender);
    }
    //return;    
}

function string InternalOnSaveINI(GUIComponent Sender)
{
    HeaderColumnPerc = lb_FilterRules.HeaderColumnPerc;
    SaveConfig();
    return OnSaveINI(Sender);
    //return;    
}

defaultproperties
{
    // Reference: UT2K4FilterSummaryListBox'GUI2K4_Decompressed.UT2K4FilterSummaryPanel.RulesBox'
    begin object name="RulesBox" class=GUI2K4_Decompressed.UT2K4FilterSummaryListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=UT2K4FilterSummaryPanel.ListOnCreateComponent
    end object
    lb_FilterRules=RulesBox
    HeaderColumnPerc[0]=0.4000000
    HeaderColumnPerc[1]=0.4000000
    HeaderColumnPerc[2]=0.2000000
    // Reference: GUIMultiOptionListBox'GUI2K4_Decompressed.UT2K4FilterSummaryPanel.RulesLB'
    begin object name="RulesLB" class=XInterface.GUIMultiOptionListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=RulesLB.InternalOnCreateComponent
    end object
    lb_Rules=RulesLB
    OnCreateComponent=UT2K4FilterSummaryPanel.InternalOnCreateComponent
    OnSaveINI=UT2K4FilterSummaryPanel.InternalOnSaveINI
}