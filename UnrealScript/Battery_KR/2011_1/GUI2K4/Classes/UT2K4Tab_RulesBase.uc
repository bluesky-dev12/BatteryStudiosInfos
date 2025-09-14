class UT2K4Tab_RulesBase extends UT2K4GameTabBase
    config(User)
    editinlinenew
    instanced;

var() automated GUITabControl c_Rules;
var config array<float> HeaderColumnPerc;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    assert((p_Anchor != none) && p_Anchor.RuleInfo != none);
    //return;    
}

event Opened(GUIComponent Sender)
{
    Refresh();
    super(GUIMultiComponent).Opened(Sender);
    //return;    
}

function Refresh()
{
    local int i, j;

    super(GUITabPanel).Refresh();
    i = 0;
    J0x0D:

    // End:0x8A [Loop If]
    if(i < c_Rules.TabStack.Length)
    {
        j = FindGroupIndex(c_Rules.TabStack[i].Caption);
        // End:0x80
        if(j < 0)
        {
            c_Rules.RemoveTab(, c_Rules.TabStack[i--]);
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    i = 0;
    J0x91:

    // End:0x144 [Loop If]
    if(i < c_Rules.TabStack.Length)
    {
        // End:0x13A
        if(InstantActionRulesPanel(c_Rules.TabStack[i].MyPanel) != none)
        {
            InstantActionRulesPanel(c_Rules.TabStack[i].MyPanel).GamePI = p_Anchor.RuleInfo;
            InstantActionRulesPanel(c_Rules.TabStack[i].MyPanel).bRefresh = true;
        }
        i++;
        // [Loop Continue]
        goto J0x91;
    }
    i = 0;
    J0x14B:

    // End:0x22A [Loop If]
    if(i < p_Anchor.RuleInfo.Groups.Length)
    {
        j = c_Rules.TabIndex(p_Anchor.RuleInfo.Groups[i]);
        // End:0x220
        if(j < 0)
        {
            c_Rules.AddTab(p_Anchor.RuleInfo.Groups[i], "GUI2K4.InstantActionRulesPanel",, p_Anchor.RuleInfo.Groups[i] @ "Settings");
        }
        i++;
        // [Loop Continue]
        goto J0x14B;
    }
    i = 0;
    J0x231:

    // End:0x2AA [Loop If]
    if(i < c_Rules.TabStack.Length)
    {
        // End:0x2A0
        if(InstantActionRulesPanel(c_Rules.TabStack[i].MyPanel) != none)
        {
            InstantActionRulesPanel(c_Rules.TabStack[i].MyPanel).bUpdate = true;
        }
        i++;
        // [Loop Continue]
        goto J0x231;
    }
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x56
    if(Sender == c_Rules)
    {
        // End:0x56
        if(InstantActionRulesPanel(NewComp) != none)
        {
            InstantActionRulesPanel(NewComp).tp_Anchor = self;
            InstantActionRulesPanel(NewComp).GamePI = p_Anchor.RuleInfo;
        }
    }
    //return;    
}

function int FindGroupIndex(string Group)
{
    local int i;

    assert((p_Anchor != none) && p_Anchor.RuleInfo != none);
    i = 0;
    J0x28:

    // End:0x81 [Loop If]
    if(i < p_Anchor.RuleInfo.Groups.Length)
    {
        // End:0x77
        if(p_Anchor.RuleInfo.Groups[i] ~= Group)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x28;
    }
    return -1;
    //return;    
}

defaultproperties
{
    // Reference: GUITabControl'GUI2K4_Decompressed.UT2K4Tab_RulesBase.RuleTabControl'
    begin object name="RuleTabControl" class=XInterface.GUITabControl
        bFillSpace=true
        bDockPanels=true
        bDrawTabAbove=false
        TabHeight=0.0400000
        BackgroundStyleName="TabBackground"
        OnCreateComponent=UT2K4Tab_RulesBase.InternalOnCreateComponent
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnActivate=RuleTabControl.InternalOnActivate
    end object
    c_Rules=RuleTabControl
    HeaderColumnPerc[0]=0.7500000
    HeaderColumnPerc[1]=0.2500000
}