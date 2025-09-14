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
    //return;    
}

function SaveFilters()
{
    local int i, j;

    i = 0;
    J0x07:

    // End:0xBD [Loop If]
    if(i < FM.AllFilters.Length)
    {
        j = 0;
        J0x27:

        // End:0xB3 [Loop If]
        if(j < FM.AllFilters[i].Count())
        {
            // End:0xA9
            if(FM.AllFilters[i].GetRuleQueryType(j) == "QT_Disabled")
            {
                FM.AllFilters[i].RemoveRuleAt(j--);
            }
            j++;
            // [Loop Continue]
            goto J0x27;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    super.SaveFilters();
    //return;    
}

function ApplyRules(int FilterIndex, optional bool bRefresh)
{
    // End:0x5F
    if(FilterIndex >= 0)
    {
        FM.LoadSettings(FilterIndex);
        // End:0x5C
        if(FilterIndex < FM.AllFilters.Length)
        {
            p_Simple.FilterSelectionChanged(true);
            p_Simple.Refresh(FilterIndex);
        }        
    }
    else
    {
        // End:0x7A
        if(p_Simple != none)
        {
            p_Simple.FilterSelectionChanged(false);
        }
    }
    //return;    
}

function InitFilterList()
{
    super.InitFilterList();
    // End:0x25
    if(p_Simple != none)
    {
        p_Simple.Refresh(-1);
    }
    //return;    
}

function bool CreateTemplateRule(out KeyValuePair Rule, out string QueryType, out string RuleType)
{
    // End:0x38
    if((Rule.key ~= "TimeLimit") || Rule.key ~= "GoalScore")
    {
        return false;
    }
    // End:0x67
    if(Rule.key ~= "gamestats")
    {
        Rule.key = "stats";        
    }
    else
    {
        // End:0x9C
        if(Rule.key ~= "translocator")
        {
            Rule.key = "transloc";            
        }
        else
        {
            // End:0xD1
            if(Rule.key ~= "GamePassword")
            {
                Rule.key = "password";                
            }
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
                    else
                    {
                        QueryType = "QT_GreaterThanEquals";
                        RuleType = "DT_Unique";
                        return true;
                    }                    
                }
                else
                {
                    // End:0x1A9
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
    //return;    
}

defaultproperties
{
    // Reference: GUISplitter'GUI2K4_Decompressed.SimpleFilterPage.FilterSplitter'
    begin object name="FilterSplitter" class=XInterface.GUISplitter
        SplitOrientation=1
        SplitPosition=0.6091000
        bFixedSplitter=true
        bDrawSplitter=false
        DefaultPanels[0]="GUI2K4.SimpleFilterPanel"
        DefaultPanels[1]="GUI2K4.UT2K4FilterControlPanel"
        OnCreateComponent=SimpleFilterPage.InternalOnCreateComponent
        IniOption="@Internal"
        WinTop=0.0335930
        WinLeft=0.0098120
        WinWidth=0.9760140
        WinHeight=0.9367630
        RenderWeight=1.0000000
        bBoundToParent=true
        bScaleToParent=true
    end object
    sp_Filter=FilterSplitter
}