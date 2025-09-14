class BTTPInventoryQuickSlotHKCN extends BTTPInventoryQuickSlotHK
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x13E [Loop If]
    if(i < 9)
    {
        ButtonQuickSlot[i] = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
        ButtonQuickSlot[i].bUseAWinPos = true;
        ButtonQuickSlot[i].AWinPos = fbButtonQuickSlot[i];
        ButtonQuickSlot[i].DefaultSlotName[1] = strUnRegister;
        ButtonQuickSlot[i].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
        ButtonQuickSlot[i].InitComponent(MyController, self);
        AppendComponent(ButtonQuickSlot[i]);
        ButtonQuickSlot[i].itemBox.ChangeState(0);
        ButtonQuickSlot[i].itemBox.bShowDurability = false;
        InvenGroup.AddButton(ButtonQuickSlot[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    i = 0;
    J0x145:

    // End:0x647 [Loop If]
    if(i < 5)
    {
        ButtonTag[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        ButtonTag[i].bUseAWinPos = true;
        ButtonTag[i].AWinPos = fbButtonTag[i];
        ButtonTag[i].bAlwaysFocus = true;
        // End:0x2A1
        if(i == 0)
        {
            ButtonTag[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot1_Btn_n;
            ButtonTag[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot1_Btn_on;
            ButtonTag[i].buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot1_Btn_Focus;
            ButtonTag[i].buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot1_Btn_cli;
            ButtonTag[i].buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot1_Btn_Disable;
            ButtonTag[i].buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot1_Btn_Focus;
        }
        // End:0x38E
        if(i == 1)
        {
            ButtonTag[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot2_Btn_n;
            ButtonTag[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot2_Btn_on;
            ButtonTag[i].buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot2_Btn_Focus;
            ButtonTag[i].buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot2_Btn_cli;
            ButtonTag[i].buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot2_Btn_Disable;
            ButtonTag[i].buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot2_Btn_Focus;
        }
        // End:0x47C
        if(i == 2)
        {
            ButtonTag[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot3_Btn_n;
            ButtonTag[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot3_Btn_on;
            ButtonTag[i].buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot3_Btn_Focus;
            ButtonTag[i].buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot3_Btn_cli;
            ButtonTag[i].buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot3_Btn_Disable;
            ButtonTag[i].buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot3_Btn_Focus;
        }
        // End:0x56A
        if(i == 3)
        {
            ButtonTag[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot4_Btn_n;
            ButtonTag[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot4_Btn_on;
            ButtonTag[i].buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot4_Btn_Focus;
            ButtonTag[i].buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot4_Btn_cli;
            ButtonTag[i].buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot4_Btn_Disable;
            ButtonTag[i].buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot4_Btn_Focus;
        }
        ButtonTag[i].SetDefaultFontColor();
        ButtonTag[i].SetFontSizeAll(12);
        ButtonTag[i].RenderWeight = 0.9000000;
        ButtonTag[i].CaptionDrawType = 4;
        ButtonTag[i].CaptionPadding[0] = 16;
        ButtonTag[i].bSelectHighlight = true;
        ButtonTag[i].InitComponent(MyController, self);
        AppendComponent(ButtonTag[i]);
        QSButtonGroup.AddButton(ButtonTag[i]);
        i++;
        // [Loop Continue]
        goto J0x145;
    }
    //return;    
}

function bool OnPreDraw(Canvas C)
{
    return false;
    //return;    
}

function ShowSkillTransparent(BTROItemBoxHK Skill_1, BTROItemBoxHK Skill_2, BTROItemBoxHK Skill_3, BTROItemBoxHK Skill_4)
{
    Skill_1.Update();
    Skill_2.Update();
    Skill_3.Update();
    Skill_4.Update();
    // End:0x8D
    if(Skill_1.IsEmpty())
    {
        ButtonQuickSlot[4].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
        ButtonQuickSlot[4].DefaultSlotModulate.W = 0.4000000;        
    }
    else
    {
        ButtonQuickSlot[4].DefaultSlotImage = Skill_1.ItemImage;
        ButtonQuickSlot[4].DefaultSlotModulate.W = 0.4000000;
    }
    // End:0x11A
    if(Skill_2.IsEmpty())
    {
        ButtonQuickSlot[5].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
        ButtonQuickSlot[5].DefaultSlotModulate.W = 0.4000000;        
    }
    else
    {
        ButtonQuickSlot[5].DefaultSlotImage = Skill_2.ItemImage;
        ButtonQuickSlot[5].DefaultSlotModulate.W = 0.4000000;
    }
    // End:0x1BD
    if(Skill_3.IsEmpty())
    {
        ButtonQuickSlot[6].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Skill_Lock;
        ButtonQuickSlot[6].DefaultSlotModulate.W = 1.0000000;
        ButtonQuickSlot[6].DefaultSlotName[1] = "";        
    }
    else
    {
        ButtonQuickSlot[6].DefaultSlotImage = Skill_2.ItemImage;
        ButtonQuickSlot[6].DefaultSlotModulate.W = 0.4000000;
    }
    // End:0x260
    if(Skill_4.IsEmpty())
    {
        ButtonQuickSlot[7].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Skill_Lock;
        ButtonQuickSlot[7].DefaultSlotName[1] = "";
        ButtonQuickSlot[7].DefaultSlotModulate.W = 1.0000000;        
    }
    else
    {
        ButtonQuickSlot[7].DefaultSlotImage = Skill_2.ItemImage;
        ButtonQuickSlot[7].DefaultSlotModulate.W = 0.4000000;
    }
    //return;    
}

function ShowWeaponTransparent(BTROItemBoxHK MainWeapon, BTROItemBoxHK SubWeapon, BTROItemBoxHK ThrowWeapon1, BTROItemBoxHK ThrowWeapon2, optional BTROItemBoxHK Knife)
{
    MainWeapon.Update();
    SubWeapon.Update();
    ThrowWeapon1.Update();
    ThrowWeapon2.Update();
    Knife.Update();
    // End:0xCC
    if(MainWeapon.IsEmpty())
    {
        ButtonQuickSlot[0].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_MainGun;
        ButtonQuickSlot[0].DefaultSlotModulate.W = 1.0000000;
        ButtonQuickSlot[0].DefaultSlotItemID = 0;
        ButtonQuickSlot[0].DefaultSlotUniqueID = Class'Engine.BTCustomDrawHK'.static.EmptyBtrDouble();        
    }
    else
    {
        ButtonQuickSlot[0].DefaultSlotImage = MainWeapon.ItemImage;
        ButtonQuickSlot[0].DefaultSlotModulate.W = 0.4000000;
        ButtonQuickSlot[0].DefaultSlotItemID = MainWeapon.instanceInfo.ItemID;
        ButtonQuickSlot[0].DefaultSlotUniqueID = MainWeapon.instanceInfo.UniqueID;
    }
    // End:0x1D7
    if(SubWeapon.IsEmpty())
    {
        ButtonQuickSlot[1].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_Pistol;
        ButtonQuickSlot[1].DefaultSlotModulate.W = 1.0000000;
        ButtonQuickSlot[1].DefaultSlotItemID = 0;
        ButtonQuickSlot[1].DefaultSlotUniqueID = Class'Engine.BTCustomDrawHK'.static.EmptyBtrDouble();        
    }
    else
    {
        ButtonQuickSlot[1].DefaultSlotImage = SubWeapon.ItemImage;
        ButtonQuickSlot[1].DefaultSlotModulate.W = 0.4000000;
        ButtonQuickSlot[1].DefaultSlotItemID = SubWeapon.instanceInfo.ItemID;
        ButtonQuickSlot[1].DefaultSlotUniqueID = SubWeapon.instanceInfo.UniqueID;
    }
    // End:0x2F5
    if(Knife == none)
    {
        ButtonQuickSlot[8].DefaultSlotName[1] = "";
        ButtonQuickSlot[8].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Block_Weapon;
        ButtonQuickSlot[8].DefaultSlotModulate.W = 1.0000000;
        ButtonQuickSlot[8].DefaultSlotItemID = 0;
        ButtonQuickSlot[8].DefaultSlotUniqueID = Class'Engine.BTCustomDrawHK'.static.EmptyBtrDouble();        
    }
    else
    {
        ButtonQuickSlot[8].DefaultSlotImage = Knife.ItemImage;
        ButtonQuickSlot[8].DefaultSlotModulate.W = 0.4000000;
        ButtonQuickSlot[8].DefaultSlotItemID = 9001;
        ButtonQuickSlot[8].DefaultSlotUniqueID = Knife.instanceInfo.UniqueID;
    }
    // End:0x3F6
    if(ThrowWeapon1.IsEmpty())
    {
        ButtonQuickSlot[2].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_grnd;
        ButtonQuickSlot[2].DefaultSlotModulate.W = 1.0000000;
        ButtonQuickSlot[2].DefaultSlotItemID = 0;
        ButtonQuickSlot[2].DefaultSlotUniqueID = Class'Engine.BTCustomDrawHK'.static.EmptyBtrDouble();        
    }
    else
    {
        ButtonQuickSlot[2].DefaultSlotImage = ThrowWeapon1.ItemImage;
        ButtonQuickSlot[2].DefaultSlotModulate.W = 0.4000000;
        ButtonQuickSlot[2].DefaultSlotItemID = ThrowWeapon1.instanceInfo.ItemID;
        ButtonQuickSlot[2].DefaultSlotUniqueID = ThrowWeapon1.instanceInfo.UniqueID;
    }
    // End:0x509
    if(ThrowWeapon2.IsEmpty())
    {
        ButtonQuickSlot[3].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_grnd;
        ButtonQuickSlot[3].DefaultSlotModulate.W = 1.0000000;
        ButtonQuickSlot[3].DefaultSlotItemID = 0;
        ButtonQuickSlot[3].DefaultSlotUniqueID = Class'Engine.BTCustomDrawHK'.static.EmptyBtrDouble();        
    }
    else
    {
        ButtonQuickSlot[3].DefaultSlotImage = ThrowWeapon2.ItemImage;
        ButtonQuickSlot[3].DefaultSlotModulate.W = 0.4000000;
        ButtonQuickSlot[3].DefaultSlotItemID = ThrowWeapon2.instanceInfo.ItemID;
        ButtonQuickSlot[3].DefaultSlotUniqueID = ThrowWeapon2.instanceInfo.UniqueID;
    }
    //return;    
}

defaultproperties
{
    // Reference: ButtonGroups'GUIWarfareControls_Decompressed.BTTPInventoryQuickSlotHKCN.mgroups'
    begin object name="mgroups" class=GUIWarfareControls_Decompressed.ButtonGroups
    end object
    InvenGroup=mgroups
    // Reference: ButtonGroups'GUIWarfareControls_Decompressed.BTTPInventoryQuickSlotHKCN.mgroups2'
    begin object name="mgroups2" class=GUIWarfareControls_Decompressed.ButtonGroups
    end object
    QSButtonGroup=mgroups2
    // Reference: ButtonGroups'GUIWarfareControls_Decompressed.BTTPInventoryQuickSlotHKCN.mgroups3'
    begin object name="mgroups3" class=GUIWarfareControls_Decompressed.ButtonGroups
    end object
    QSNameGroup=mgroups3
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPInventoryQuickSlotHKCN.mBackgroundImage'
    begin object name="mBackgroundImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
        WinTop=0.0000000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=1.0000000
    end object
    BackgroundImage=mBackgroundImage
    fbButtonTag[0]=(X1=293.0000000,Y1=75.0000000,X2=334.0000000,Y2=118.0000000)
    fbButtonTag[1]=(X1=336.0000000,Y1=75.0000000,X2=377.0000000,Y2=118.0000000)
    fbButtonTag[2]=(X1=379.0000000,Y1=75.0000000,X2=420.0000000,Y2=118.0000000)
    fbButtonTag[3]=(X1=422.0000000,Y1=75.0000000,X2=463.0000000,Y2=118.0000000)
    fbButtonQuickSlot[0]=(X1=326.0000000,Y1=134.0000000,X2=482.0000000,Y2=216.0000000)
    fbButtonQuickSlot[1]=(X1=326.0000000,Y1=222.0000000,X2=402.0000000,Y2=304.0000000)
    fbButtonQuickSlot[2]=(X1=326.0000000,Y1=309.0000000,X2=402.0000000,Y2=391.0000000)
    fbButtonQuickSlot[3]=(X1=406.0000000,Y1=309.0000000,X2=482.0000000,Y2=391.0000000)
    fbButtonQuickSlot[4]=(X1=336.0000000,Y1=419.0000000,X2=489.0000000,Y2=493.0000000)
    fbButtonQuickSlot[5]=(X1=336.0000000,Y1=501.0000000,X2=489.0000000,Y2=575.0000000)
    fbButtonQuickSlot[6]=(X1=336.0000000,Y1=580.0000000,X2=489.0000000,Y2=654.0000000)
    fbButtonQuickSlot[7]=(X1=336.0000000,Y1=659.0000000,X2=489.0000000,Y2=733.0000000)
    fbButtonQuickSlot[8]=(X1=406.0000000,Y1=222.0000000,X2=482.0000000,Y2=304.0000000)
    OnPreDraw=BTTPInventoryQuickSlotHKCN.OnPreDraw
}