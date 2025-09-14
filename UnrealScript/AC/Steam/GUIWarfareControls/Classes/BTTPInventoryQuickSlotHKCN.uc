/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPInventoryQuickSlotHKCN.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:4
 *
 *******************************************************************************/
class BTTPInventoryQuickSlotHKCN extends BTTPInventoryQuickSlotHK
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x13e [While If]
    if(i < 9)
    {
        ButtonQuickSlot[i] = new class'BTItemBoxButtonHK';
        ButtonQuickSlot[i].bUseAWinPos = true;
        ButtonQuickSlot[i].AWinPos = fbButtonQuickSlot[i];
        ButtonQuickSlot[i].DefaultSlotName[1] = strUnRegister;
        ButtonQuickSlot[i].DefaultSlotImage = class'BTUIResourcePoolHK'.default.empty;
        ButtonQuickSlot[i].InitComponent(MyController, self);
        AppendComponent(ButtonQuickSlot[i]);
        ButtonQuickSlot[i].itemBox.ChangeState(0);
        ButtonQuickSlot[i].itemBox.bShowDurability = false;
        InvenGroup.AddButton(ButtonQuickSlot[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    i = 0;
    J0x145:
    // End:0x647 [While If]
    if(i < 5)
    {
        ButtonTag[i] = new class'BTOwnerDrawCaptionButtonHK';
        ButtonTag[i].bUseAWinPos = true;
        ButtonTag[i].AWinPos = fbButtonTag[i];
        ButtonTag[i].bAlwaysFocus = true;
        // End:0x2a1
        if(i == 0)
        {
            ButtonTag[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot1_Btn_n;
            ButtonTag[i].buttonImage[1] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot1_Btn_on;
            ButtonTag[i].buttonImage[2] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot1_Btn_Focus;
            ButtonTag[i].buttonImage[3] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot1_Btn_cli;
            ButtonTag[i].buttonImage[4] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot1_Btn_Disable;
            ButtonTag[i].buttonImage[5] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot1_Btn_Focus;
        }
        // End:0x38e
        if(i == 1)
        {
            ButtonTag[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot2_Btn_n;
            ButtonTag[i].buttonImage[1] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot2_Btn_on;
            ButtonTag[i].buttonImage[2] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot2_Btn_Focus;
            ButtonTag[i].buttonImage[3] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot2_Btn_cli;
            ButtonTag[i].buttonImage[4] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot2_Btn_Disable;
            ButtonTag[i].buttonImage[5] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot2_Btn_Focus;
        }
        // End:0x47c
        if(i == 2)
        {
            ButtonTag[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot3_Btn_n;
            ButtonTag[i].buttonImage[1] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot3_Btn_on;
            ButtonTag[i].buttonImage[2] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot3_Btn_Focus;
            ButtonTag[i].buttonImage[3] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot3_Btn_cli;
            ButtonTag[i].buttonImage[4] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot3_Btn_Disable;
            ButtonTag[i].buttonImage[5] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot3_Btn_Focus;
        }
        // End:0x56a
        if(i == 3)
        {
            ButtonTag[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot4_Btn_n;
            ButtonTag[i].buttonImage[1] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot4_Btn_on;
            ButtonTag[i].buttonImage[2] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot4_Btn_Focus;
            ButtonTag[i].buttonImage[3] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot4_Btn_cli;
            ButtonTag[i].buttonImage[4] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot4_Btn_Disable;
            ButtonTag[i].buttonImage[5] = class'BTUIResourcePoolHK'.default.Inven_QuiSlot4_Btn_Focus;
        }
        ButtonTag[i].SetDefaultFontColor();
        ButtonTag[i].SetFontSizeAll(12);
        ButtonTag[i].RenderWeight = 0.90;
        ButtonTag[i].CaptionDrawType = 4;
        ButtonTag[i].CaptionPadding[0] = 16;
        ButtonTag[i].bSelectHighlight = true;
        ButtonTag[i].InitComponent(MyController, self);
        AppendComponent(ButtonTag[i]);
        QSButtonGroup.AddButton(ButtonTag[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x145;
    }
}

function bool OnPreDraw(Canvas C)
{
    return false;
}

function ShowSkillTransparent(BTROItemBoxHK Skill_1, BTROItemBoxHK Skill_2, BTROItemBoxHK Skill_3, BTROItemBoxHK Skill_4)
{
    Skill_1.Update();
    Skill_2.Update();
    Skill_3.Update();
    Skill_4.Update();
    // End:0x8d
    if(Skill_1.IsEmpty())
    {
        ButtonQuickSlot[4].DefaultSlotImage = class'BTUIResourcePoolHK'.default.empty;
        ButtonQuickSlot[4].DefaultSlotModulate.W = 0.40;
    }
    // End:0xc9
    else
    {
        ButtonQuickSlot[4].DefaultSlotImage = Skill_1.ItemImage;
        ButtonQuickSlot[4].DefaultSlotModulate.W = 0.40;
    }
    // End:0x11a
    if(Skill_2.IsEmpty())
    {
        ButtonQuickSlot[5].DefaultSlotImage = class'BTUIResourcePoolHK'.default.empty;
        ButtonQuickSlot[5].DefaultSlotModulate.W = 0.40;
    }
    // End:0x156
    else
    {
        ButtonQuickSlot[5].DefaultSlotImage = Skill_2.ItemImage;
        ButtonQuickSlot[5].DefaultSlotModulate.W = 0.40;
    }
    // End:0x1bd
    if(Skill_3.IsEmpty())
    {
        ButtonQuickSlot[6].DefaultSlotImage = class'BTUIResourcePoolHK'.default.Inven_Skill_Lock;
        ButtonQuickSlot[6].DefaultSlotModulate.W = 1.0;
        ButtonQuickSlot[6].DefaultSlotName[1] = "";
    }
    // End:0x1f9
    else
    {
        ButtonQuickSlot[6].DefaultSlotImage = Skill_2.ItemImage;
        ButtonQuickSlot[6].DefaultSlotModulate.W = 0.40;
    }
    // End:0x260
    if(Skill_4.IsEmpty())
    {
        ButtonQuickSlot[7].DefaultSlotImage = class'BTUIResourcePoolHK'.default.Inven_Skill_Lock;
        ButtonQuickSlot[7].DefaultSlotName[1] = "";
        ButtonQuickSlot[7].DefaultSlotModulate.W = 1.0;
    }
    // End:0x29c
    else
    {
        ButtonQuickSlot[7].DefaultSlotImage = Skill_2.ItemImage;
        ButtonQuickSlot[7].DefaultSlotModulate.W = 0.40;
    }
}

function ShowWeaponTransparent(BTROItemBoxHK MainWeapon, BTROItemBoxHK SubWeapon, BTROItemBoxHK ThrowWeapon1, BTROItemBoxHK ThrowWeapon2, optional BTROItemBoxHK Knife)
{
    MainWeapon.Update();
    SubWeapon.Update();
    ThrowWeapon1.Update();
    ThrowWeapon2.Update();
    // End:0x56
    if(Knife != none)
    {
        Knife.Update();
    }
    // End:0xd7
    if(MainWeapon.IsEmpty())
    {
        ButtonQuickSlot[0].DefaultSlotImage = class'BTUIResourcePoolHK'.default.new_img_slot_MainGun;
        ButtonQuickSlot[0].DefaultSlotModulate.W = 1.0;
        ButtonQuickSlot[0].DefaultSlotItemID = 0;
        ButtonQuickSlot[0].DefaultSlotUniqueID = class'BTCustomDrawHK'.static.EmptyBtrDouble();
    }
    // End:0x161
    else
    {
        ButtonQuickSlot[0].DefaultSlotImage = MainWeapon.ItemImage;
        ButtonQuickSlot[0].DefaultSlotModulate.W = 0.40;
        ButtonQuickSlot[0].DefaultSlotItemID = MainWeapon.instanceInfo.ItemID;
        ButtonQuickSlot[0].DefaultSlotUniqueID = MainWeapon.instanceInfo.UniqueID;
    }
    // End:0x1e2
    if(SubWeapon.IsEmpty())
    {
        ButtonQuickSlot[1].DefaultSlotImage = class'BTUIResourcePoolHK'.default.new_img_slot_Pistol;
        ButtonQuickSlot[1].DefaultSlotModulate.W = 1.0;
        ButtonQuickSlot[1].DefaultSlotItemID = 0;
        ButtonQuickSlot[1].DefaultSlotUniqueID = class'BTCustomDrawHK'.static.EmptyBtrDouble();
    }
    // End:0x26c
    else
    {
        ButtonQuickSlot[1].DefaultSlotImage = SubWeapon.ItemImage;
        ButtonQuickSlot[1].DefaultSlotModulate.W = 0.40;
        ButtonQuickSlot[1].DefaultSlotItemID = SubWeapon.instanceInfo.ItemID;
        ButtonQuickSlot[1].DefaultSlotUniqueID = SubWeapon.instanceInfo.UniqueID;
    }
    // End:0x300
    if(Knife == none)
    {
        ButtonQuickSlot[8].DefaultSlotName[1] = "";
        ButtonQuickSlot[8].DefaultSlotImage = class'BTUIResourcePoolHK'.default.Block_Weapon;
        ButtonQuickSlot[8].DefaultSlotModulate.W = 1.0;
        ButtonQuickSlot[8].DefaultSlotItemID = 0;
        ButtonQuickSlot[8].DefaultSlotUniqueID = class'BTCustomDrawHK'.static.EmptyBtrDouble();
    }
    // End:0x37c
    else
    {
        ButtonQuickSlot[8].DefaultSlotImage = Knife.ItemImage;
        ButtonQuickSlot[8].DefaultSlotModulate.W = 0.40;
        ButtonQuickSlot[8].DefaultSlotItemID = 9001;
        ButtonQuickSlot[8].DefaultSlotUniqueID = Knife.instanceInfo.UniqueID;
    }
    // End:0x401
    if(ThrowWeapon1.IsEmpty())
    {
        ButtonQuickSlot[2].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_grnd;
        ButtonQuickSlot[2].DefaultSlotModulate.W = 1.0;
        ButtonQuickSlot[2].DefaultSlotItemID = 0;
        ButtonQuickSlot[2].DefaultSlotUniqueID = class'BTCustomDrawHK'.static.EmptyBtrDouble();
    }
    // End:0x48f
    else
    {
        ButtonQuickSlot[2].DefaultSlotImage = ThrowWeapon1.ItemImage;
        ButtonQuickSlot[2].DefaultSlotModulate.W = 0.40;
        ButtonQuickSlot[2].DefaultSlotItemID = ThrowWeapon1.instanceInfo.ItemID;
        ButtonQuickSlot[2].DefaultSlotUniqueID = ThrowWeapon1.instanceInfo.UniqueID;
    }
    // End:0x514
    if(ThrowWeapon2.IsEmpty())
    {
        ButtonQuickSlot[3].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_grnd;
        ButtonQuickSlot[3].DefaultSlotModulate.W = 1.0;
        ButtonQuickSlot[3].DefaultSlotItemID = 0;
        ButtonQuickSlot[3].DefaultSlotUniqueID = class'BTCustomDrawHK'.static.EmptyBtrDouble();
    }
    // End:0x5a2
    else
    {
        ButtonQuickSlot[3].DefaultSlotImage = ThrowWeapon2.ItemImage;
        ButtonQuickSlot[3].DefaultSlotModulate.W = 0.40;
        ButtonQuickSlot[3].DefaultSlotItemID = ThrowWeapon2.instanceInfo.ItemID;
        ButtonQuickSlot[3].DefaultSlotUniqueID = ThrowWeapon2.instanceInfo.UniqueID;
    }
}

defaultproperties
{
    InvenGroup=mgroups
    QSButtonGroup=mgroups2
    QSNameGroup=mgroups3
    begin object name=mBackgroundImage class=BTStretchedImageHK
        WinTop=0.0
        WinLeft=0.0
        WinWidth=1.0
        WinHeight=1.0
    object end
    // Reference: BTStretchedImageHK'BTTPInventoryQuickSlotHKCN.mBackgroundImage'
    BackgroundImage=mBackgroundImage
    fbButtonTag[0]=(X1=293.0,Y1=91.0,X2=334.0,Y2=118.0)
    fbButtonTag[1]=(X1=336.0,Y1=91.0,X2=377.0,Y2=118.0)
    fbButtonTag[2]=(X1=379.0,Y1=91.0,X2=420.0,Y2=118.0)
    fbButtonTag[3]=(X1=422.0,Y1=91.0,X2=463.0,Y2=118.0)
    fbButtonQuickSlot[0]=(X1=326.0,Y1=134.0,X2=482.0,Y2=216.0)
    fbButtonQuickSlot[1]=(X1=326.0,Y1=222.0,X2=402.0,Y2=304.0)
    fbButtonQuickSlot[2]=(X1=326.0,Y1=309.0,X2=402.0,Y2=391.0)
    fbButtonQuickSlot[3]=(X1=406.0,Y1=309.0,X2=482.0,Y2=391.0)
    fbButtonQuickSlot[4]=(X1=336.0,Y1=419.0,X2=489.0,Y2=493.0)
    fbButtonQuickSlot[5]=(X1=336.0,Y1=501.0,X2=489.0,Y2=575.0)
    fbButtonQuickSlot[6]=(X1=336.0,Y1=580.0,X2=489.0,Y2=654.0)
    fbButtonQuickSlot[7]=(X1=336.0,Y1=659.0,X2=489.0,Y2=733.0)
    fbButtonQuickSlot[8]=(X1=406.0,Y1=222.0,X2=482.0,Y2=304.0)
    OnPreDraw=OnPreDraw
}