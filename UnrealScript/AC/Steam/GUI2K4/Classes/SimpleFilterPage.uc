/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\SimpleFilterPage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class SimpleFilterPage extends FilterPageBase
    config(User)
    editinlinenew
    instanced;

var export editinline SimpleFilterPanel p_Simple;

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    p_Simple = SimpleFilterPanel(sp_Filter.Panels[0]);
    p_Simple.FilterMaster = FM;
    p_Simple.FilterSelectionChanged(false);
    cp_Filter.RemoveComponent(cp_Filter.co_GameType);
}

function SaveFilters()
{
    local int i, j;

    i = 0;
    J0x07:
    // End:0xbd [While If]
    if(i < FM.AllFilters.Length)
    {
        j = 0;
        J0x27:
        // End:0xb3 [While If]
        if(j < FM.AllFilters[i].Count())
        {
            // End:0xa9
            if(FM.AllFilters[i].GetRuleQueryType(j) == "QT_Disabled")
            {
                FM.AllFilters[i].RemoveRuleAt(-- j);
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x27;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    super.SaveFilters();
}

function ApplyRules(int FilterIndex, optional bool bRefresh)
{
    // End:0x5f
    if(FilterIndex >= 0)
    {
        FM.LoadSettings(FilterIndex);
        // End:0x5c
        if(FilterIndex < FM.AllFilters.Length)
        {
            p_Simple.FilterSelectionChanged(true);
            p_Simple.Refresh(FilterIndex);
        }
    }
    // End:0x7a
    else
    {
        // End:0x7a
        if(p_Simple != none)
        {
            p_Simple.FilterSelectionChanged(false);
        }
    }
}

function InitFilterList()
{
    super.InitFilterList();
    // End:0x25
    if(p_Simple != none)
    {
        p_Simple.Refresh(-1);
    }
}

function bool CreateTemplateRule(out KeyValuePair Rule, out string QueryType, out string RuleType)
{
    // End:0x38
    if(Rule.key ~= "TimeLimit" || Rule.key ~= "GoalScore")
    {
        return false;
    }
    // End:0x67
    if(Rule.key ~= "gamestats")
    {
        Rule.key = "stats";
    }
    // End:0x1a9
    else
    {
        // End:0x9c
        if(Rule.key ~= "translocator")
        {
            Rule.key = "transloc";
        }
        // End:0x1a9
        else
        {
            // End:0xd1
            if(Rule.key ~= "GamePassword")
            {
                Rule.key = "password";
            }
            // End:0x1a9
            else
            {
                // End:0x157
                if(Rule.key ~= "MinPlayers")
                {
                    // End:0x125
                    if(Rule.Value ~= "0")
                    {
                        Rule.key = "nobots";
                        Rule.Value = "true";
                    }
                    // End:0x154
                    else
                    {
                        QueryType = "QT_GreaterThanEquals";
                        RuleType = "DT_Unique";
                        return true;
                    }
                }
                // End:0x1a9
                else
                {
                    // End:0x1a9
                    if(Rule.key ~= "ServerVersion")
                    {
                        Rule.key = "custom";
                        Rule.Value = "version=" $ Rule.Value;
                    }
                }
            }
        }
    }
    return super.CreateTemplateRule(Rule, QueryType, RuleType);
}

defaultproperties
{
    begin object name=FilterSplitter class=GUISplitter
        SplitOrientation=1
        SplitPosition=0.60910
        bFixedSplitter=true
        bDrawSplitter=true
        DefaultPanels[0]="GUI2K4.SimpleFilterPanel"
        DefaultPanels[1]="GUI2K4.UT2K4FilterControlPanel"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        WinTop=0.0335930
        WinLeft=0.0098120
        WinWidth=0.9760140
        WinHeight=0.9367630
        RenderWeight=1.0
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUISplitter'SimpleFilterPage.FilterSplitter'
    sp_Filter=FilterSplitter
}