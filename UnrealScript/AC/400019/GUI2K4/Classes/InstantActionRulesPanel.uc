class InstantActionRulesPanel extends UT2K4PlayInfoPanel
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

    // End:0xA6 [Loop If]
    if(i < li_Rules.Elements.Length)
    {
        j = 0;
        J0x27:

        // End:0x76 [Loop If]
        if(j < InfoRules.Length)
        {
            // End:0x6C
            if(InfoRules[j].DisplayName == li_Rules.Elements[i].Caption)
            {
                // [Explicit Break]
                goto J0x76;
            }
            j++;
            // [Loop Continue]
            goto J0x27;
        }
        J0x76:

        // End:0x9C
        if(j == InfoRules.Length)
        {
            li_Rules.RemoveItem(i--);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function LoadRules()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x37 [Loop If]
    if(i < InfoRules.Length)
    {
        AddRule(InfoRules[i], i);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    super.LoadRules();
    //return;    
}

defaultproperties
{
    // Reference: GUIMultiOptionListBox'GUI2K4_Decompressed.InstantActionRulesPanel.RuleListBox'
    begin object name="RuleListBox" class=XInterface.GUIMultiOptionListBox
        OnCreateComponent=RuleListBox.InternalOnCreateComponent
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=InstantActionRulesPanel.InternalOnChange
    end object
    lb_Rules=RuleListBox
}