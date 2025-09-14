/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_RulesBase.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:5
 *
 *******************************************************************************/
class UT2K4Tab_RulesBase extends UT2K4GameTabBase
    config(User)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUITabControl c_Rules;
var config array<float> HeaderColumnPerc;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    assert(p_Anchor != none && p_Anchor.RuleInfo != none);
}

event Opened(GUIComponent Sender)
{
    Refresh();
    super(GUIMultiComponent).Opened(Sender);
}

function Refresh()
{
    local int i, j;

    super(GUITabPanel).Refresh();
    i = 0;
    J0x0d:
    // End:0x8a [While If]
    if(i < c_Rules.TabStack.Length)
    {
        j = FindGroupIndex(c_Rules.TabStack[i].Caption);
        // End:0x80
        if(j < 0)
        {
            c_Rules.RemoveTab(, c_Rules.TabStack[-- i]);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
    i = 0;
    J0x91:
    // End:0x144 [While If]
    if(i < c_Rules.TabStack.Length)
    {
        // End:0x13a
        if(InstantActionRulesPanel(c_Rules.TabStack[i].MyPanel) != none)
        {
            InstantActionRulesPanel(c_Rules.TabStack[i].MyPanel).GamePI = p_Anchor.RuleInfo;
            InstantActionRulesPanel(c_Rules.TabStack[i].MyPanel).bRefresh = true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x91;
    }
    i = 0;
    J0x14b:
    // End:0x22a [While If]
    if(i < p_Anchor.RuleInfo.Groups.Length)
    {
        j = c_Rules.TabIndex(p_Anchor.RuleInfo.Groups[i]);
        // End:0x220
        if(j < 0)
        {
            c_Rules.AddTab(p_Anchor.RuleInfo.Groups[i], "GUI2K4.InstantActionRulesPanel",, p_Anchor.RuleInfo.Groups[i] @ "Settings");
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14b;
    }
    i = 0;
    J0x231:
    // End:0x2aa [While If]
    if(i < c_Rules.TabStack.Length)
    {
        // End:0x2a0
        if(InstantActionRulesPanel(c_Rules.TabStack[i].MyPanel) != none)
        {
            InstantActionRulesPanel(c_Rules.TabStack[i].MyPanel).bUpdate = true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x231;
    }
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
}

function int FindGroupIndex(string Group)
{
    local int i;

    assert(p_Anchor != none && p_Anchor.RuleInfo != none);
    i = 0;
    J0x28:
    // End:0x81 [While If]
    if(i < p_Anchor.RuleInfo.Groups.Length)
    {
        // End:0x77
        if(p_Anchor.RuleInfo.Groups[i] ~= Group)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x28;
    }
    return -1;
}

defaultproperties
{
    begin object name=RuleTabControl class=GUITabControl
        bFillSpace=true
        bDockPanels=true
        bDrawTabAbove=true
        TabHeight=0.040
        BackgroundStyleName="TabBackground"
        OnCreateComponent=InternalOnCreateComponent
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnActivate=InternalOnActivate
    object end
    // Reference: GUITabControl'UT2K4Tab_RulesBase.RuleTabControl'
    c_Rules=RuleTabControl
    HeaderColumnPerc=// Object reference not set to an instance of an object.
    
}