/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4FilterRulesPanel.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:4
 *
 *******************************************************************************/
class UT2K4FilterRulesPanel extends GUIFilterPanel
    config(User)
    editinlinenew
    instanced;

var localized string EnableRule;
var localized string MaxText;
var localized string MinText;

function InitComponent(GUIController MyC, GUIComponent MyO)
{
    super.InitComponent(MyC, MyO);
    li_Rules = lb_Rules.List;
    li_Rules.bDrawSelectionBorder = false;
    li_Rules.NumColumns = 3;
}

function LoadRules()
{
    local int i;

    // End:0x1a
    if(GamePI == none || FilterMaster == none)
    {
        return;
    }
    GamePI.GetSettings(MyButton.Caption, InfoRules);
    i = 0;
    J0x40:
    // End:0x70 [While If]
    if(i < InfoRules.Length)
    {
        AddRule(InfoRules[i], i);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
    super(UT2K4PlayInfoPanel).LoadRules();
}

function EnableClick(GUIComponent Sender)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x2a [While If]
    if(i < li_Rules.Elements.Length)
    {
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function UpdateRules()
{
    local int i, idx, RuleIdx;
    local string Data, AllV, MinV, MaxV;
    local array<string> Range;
    local export editinline GUIMenuOption Comp, lastcomp;
    local export editinline moFloatEdit fl;
    local export editinline moEditBox ed;
    local export editinline moNumericEdit nu;
    local bool bTempInit;

    // End:0x17
    if(li_Rules.Elements.Length == 0)
    {
        return;
    }
    // End:0x3f
    if(bUpdate)
    {
        GamePI.GetSettings(MyButton.Caption, InfoRules);
    }
    bTempInit = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = false;
    super(UT2K4PlayInfoPanel).UpdateRules();
    i = 0;
    J0x73:
    // End:0x591 [While If]
    if(i < li_Rules.Elements.Length)
    {
        Comp = li_Rules.GetItem(i);
        lastcomp = li_Rules.GetItem(i + li_Rules.NumColumns - 1);
        idx = Comp.Tag;
        assert(InfoRules[idx].DisplayName == li_Rules.Elements[i].Caption);
        switch(InfoRules[idx].RenderType)
        {
            // End:0x18f
            case 0:
                RuleIdx = FilterMaster.AllFilters[p_Anchor.Index].FindRuleIndex(InfoRules[idx].SettingName);
                lastcomp.SetComponentValue(InfoRules[idx].Value);
                // End:0x579
                break;
            // End:0x1f3
            case 1:
                RuleIdx = FilterMaster.AllFilters[p_Anchor.Index].FindRuleIndex(InfoRules[idx].SettingName);
                lastcomp.SetComponentValue(InfoRules[idx].Value);
                // End:0x579
                break;
            // End:0x576
            case 2:
                // End:0x396
                if(moNumericEdit(lastcomp) != none)
                {
                    Divide(InfoRules[idx].Data, ";", Data, AllV);
                    GamePI.SplitStringToArray(Range, Data, ",");
                    Divide(AllV, ":", MinV, MaxV);
                    nu = moNumericEdit(li_Rules.GetItem(i + li_Rules.NumColumns - 2));
                    RuleIdx = FilterMaster.AllFilters[p_Anchor.Index].FindRuleIndex(InfoRules[idx].SettingName);
                    // End:0x2ee
                    if(Range.Length > 1)
                    {
                        nu.SetValue(int(Range[1]));
                    }
                    // End:0x304
                    else
                    {
                        nu.SetValue(int(MinV));
                    }
                    nu = moNumericEdit(lastcomp);
                    RuleIdx = FilterMaster.AllFilters[p_Anchor.Index].FindRuleIndex(InfoRules[idx].SettingName, "1");
                    // End:0x37d
                    if(Range.Length > 2)
                    {
                        nu.SetValue(int(Range[2]));
                    }
                    // End:0x393
                    else
                    {
                        nu.SetValue(int(MaxV));
                    }
                }
                // End:0x573
                else
                {
                    // End:0x534
                    if(moFloatEdit(lastcomp) != none)
                    {
                        Divide(InfoRules[idx].Data, ";", Data, AllV);
                        GamePI.SplitStringToArray(Range, Data, ",");
                        Divide(AllV, ":", MinV, MaxV);
                        fl = moFloatEdit(li_Rules.GetItem(i + li_Rules.NumColumns - 2));
                        RuleIdx = FilterMaster.AllFilters[p_Anchor.Index].FindRuleIndex(InfoRules[idx].SettingName);
                        // End:0x48c
                        if(Range.Length > 1)
                        {
                            fl.SetValue(float(Range[1]));
                        }
                        // End:0x4a2
                        else
                        {
                            fl.SetValue(float(MinV));
                        }
                        fl = moFloatEdit(lastcomp);
                        RuleIdx = FilterMaster.AllFilters[p_Anchor.Index].FindRuleIndex(InfoRules[idx].SettingName, "1");
                        // End:0x51b
                        if(Range.Length > 2)
                        {
                            fl.SetValue(float(Range[2]));
                        }
                        // End:0x531
                        else
                        {
                            fl.SetValue(float(MaxV));
                        }
                    }
                    // End:0x573
                    else
                    {
                        // End:0x573
                        if(moEditBox(Comp) != none)
                        {
                            ed = moEditBox(Comp);
                            ed.SetText(InfoRules[idx].Value);
                        }
                    }
                }
                // End:0x579
                break;
            // End:0xffff
            default:
                i += li_Rules.NumColumns;
                // This is an implied JumpToken; Continue!
                goto J0x73;
            }
            Controller.bCurMenuInitialized = bTempInit;
}

defaultproperties
{
    EnableRule="?? ???"
    MaxText="??"
    MinText="??"
    begin object name=RuleBox class=GUIMultiOptionListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinWidth=0.750
        bBoundToParent=true
        bScaleToParent=true
        OnChange=InternalOnChange
    object end
    // Reference: GUIMultiOptionListBox'UT2K4FilterRulesPanel.RuleBox'
    lb_Rules=RuleBox
}