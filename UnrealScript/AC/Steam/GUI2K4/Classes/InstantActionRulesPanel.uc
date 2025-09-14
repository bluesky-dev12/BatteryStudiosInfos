/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\InstantActionRulesPanel.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class InstantActionRulesPanel extends UT2K4PlayInfoPanel
    dependson(UT2K4PlayInfoPanel)
    config(User)
    editinlinenew
    instanced;

var export editinline UT2K4GameTabBase tp_Anchor;
var export editinline UT2K4GamePageBase p_Anchor;

function ClearRules()
{
    local int i, j;

    i = 0;
    J0x07:
    // End:0xa6 [While If]
    if(i < li_Rules.Elements.Length)
    {
        j = 0;
        J0x27:
        // End:0x76 [While If]
        if(j < InfoRules.Length)
        {
            // End:0x6c
            if(InfoRules[j].DisplayName == li_Rules.Elements[i].Caption)
            {
            }
            // End:0x76
            else
            {
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x27;
            }
        }
        // End:0x9c
        if(j == InfoRules.Length)
        {
            li_Rules.RemoveItem(-- i);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function LoadRules()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x37 [While If]
    if(i < InfoRules.Length)
    {
        AddRule(InfoRules[i], i);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    super.LoadRules();
}

defaultproperties
{
    begin object name=RuleListBox class=GUIMultiOptionListBox
        OnCreateComponent=InternalOnCreateComponent
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=InternalOnChange
    object end
    // Reference: GUIMultiOptionListBox'InstantActionRulesPanel.RuleListBox'
    lb_Rules=RuleListBox
}