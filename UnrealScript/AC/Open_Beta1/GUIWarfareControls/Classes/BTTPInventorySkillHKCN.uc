class BTTPInventorySkillHKCN extends BTTPInventorySkillHK
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x150 [Loop If]
    if(i < 4)
    {
        ButtonSkill[i] = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
        ButtonSkill[i].bUseAWinPos = true;
        ButtonSkill[i].AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(337.0000000, (380.0000000 + float(i * 85)) + float(i * 2), 493.0000000, (380.0000000 + float((i + 1) * 85)) + float(i * 2));
        ButtonSkill[i].DefaultSlotName[0] = strButtonSkill[i];
        ButtonSkill[i].InitComponent(MyController, self);
        AppendComponent(ButtonSkill[i]);
        ButtonSkill[i].itemBox.ChangeState(0);
        InvenGroup.AddButton(ButtonSkill[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function bool OnPreDraw(Canvas C)
{
    return false;
    //return;    
}
