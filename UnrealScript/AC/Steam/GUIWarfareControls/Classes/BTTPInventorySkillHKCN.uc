/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPInventorySkillHKCN.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class BTTPInventorySkillHKCN extends BTTPInventorySkillHK
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x150 [While If]
    if(i < 4)
    {
        ButtonSkill[i] = new class'BTItemBoxButtonHK';
        ButtonSkill[i].bUseAWinPos = true;
        ButtonSkill[i].AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(337.0, 380.0 + float(i * 85) + float(i * 2), 493.0, 380.0 + float(i + 1 * 85) + float(i * 2));
        ButtonSkill[i].DefaultSlotName[0] = strButtonSkill[i];
        ButtonSkill[i].InitComponent(MyController, self);
        AppendComponent(ButtonSkill[i]);
        ButtonSkill[i].itemBox.ChangeState(0);
        InvenGroup.AddButton(ButtonSkill[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
}

function bool OnPreDraw(Canvas C)
{
    return false;
}
