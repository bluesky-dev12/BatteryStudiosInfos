class BTTPInventoryQuickSlotHK extends BTTabPanelHK
    editinlinenew
    instanced;

const ITEMSLOT_COUNT = 9;
const WEAPONSLOT_COUNT = 5;
const SKILLSLOT_COUNT = 4;
const EXTEND_QUICKSLOT_ITEMID = 30200;
const EXTEND_SKILLSLOT_ITEMID = 30202;

enum E_ITEMSLOT
{
    EIS_MAIN_WEAPON,                // 0
    EIS_SUB_WEAPON,                 // 1
    EIS_THROW_WEAPON_1,             // 2
    EIS_THROW_WEAPON_2,             // 3
    EIS_MELEE_WEAPON,               // 4
    EIS_ACTIVE_SKILL,               // 5
    EIS_PASSIVE_SKILL_1,            // 6
    EIS_PASSIVE_SKILL_2,            // 7
    EIS_PASSIVE_SKILL_3             // 8
};

struct SaveQuickSlot
{
    var wItemBoxHK ItemInfo[9];
    var wItemBoxInstanceHK instanceInfo[9];
};

var float DeActiveMouseX;
var float DeActiveMouseY;
var() automated ButtonGroups InvenGroup;
var() automated ButtonGroups QSButtonGroup;
var() automated ButtonGroups QSNameGroup;
var() automated BTStretchedImageHK BackgroundImage;
var localized string strButtonChangeName;
var localized string strQuickSlot;
var localized string strUnRegister;
var localized string strOK;
var array<SaveQuickSlot> SaveQS;
var FloatBox fbLabelTagTop[5];
var FloatBox fbLabelTagBottom[5];
var export editinline BTOwnerDrawImageHK LabelTagTop[5];
var export editinline BTOwnerDrawImageHK LabelTagBottom[5];
var FloatBox fbButtonTag[4];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTag[4];
var FloatBox fbButtonChangeName[5];
var export editinline BTOwnerDrawCaptionButtonHK ButtonChangeName[5];
var FloatBox fbEditChangeName[5];
var export editinline BTEditBoxHK EditChangeName[5];
var FloatBox fbButtonQuickSlot[9];
var localized string strButtonQuickSlot[9];
var export editinline BTItemBoxButtonHK ButtonQuickSlot[9];
var export editinline BTTPChatHK TPTemp;
var localized string strLabelWarning;
var FloatBox fbLabelWarning;
var export editinline BTOwnerDrawImageHK LabelWarning;
var export editinline BTOwnerDrawCaptionButtonHK btnModify[2];
var BTTcpLink_Channel TcpChannel;
var BTROItemBoxHK TempRO;
var BTROItemBoxHK RoQuickSlotItem[2];
var BTROItemBoxHK RoSkillSlotItem[2];
var localized string strQuickslotOpenTitle;
var localized string strQuickslotOpenDesc[3];
var bool isLockedQuickSlot;
var FloatBox fbLockedQuickSlot;
var FloatBox fbLockedQuickSlotTitle;
var FloatBox fbLockedQuickSlotDesc[3];
var Image LockedQuickSlot;
var Text LockedQuickSlotTitle;
var Text LockedQuickSlotDesc[3];
var FloatBox fbQuickSlotBuyButton;
var FloatBox fbQuickSlotGiftButton;
var localized string strQuickSlotBuyButton;
var localized string strQuickSlotGiftButton;
var export editinline BTOwnerDrawCaptionButtonHK QuickSlotBuyButton;
var export editinline BTOwnerDrawCaptionButtonHK QuickSlotGiftButton;
var FloatBox fbQuickSlotState[2];
var export editinline BTOwnerDrawImageHK QuickSlotState[2];
var FloatBox fbSkillSlotBuyButton[2];
var FloatBox fbSkillSlotGiftButton[2];
var localized string strSkillSlotBuyButton;
var localized string strSkillSlotGiftButton;
var export editinline BTOwnerDrawCaptionButtonHK SkillSlotBuyButton[2];
var export editinline BTOwnerDrawCaptionButtonHK SkillSlotGiftButton[2];
var localized string strSkillslotOpen;
//var delegate<deleShowCashChargeWindow> __deleShowCashChargeWindow__Delegate;

delegate deleShowCashChargeWindow()
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x13B [Loop If]
    if(i < 9)
    {
        ButtonQuickSlot[i] = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
        ButtonQuickSlot[i].bUseAWinPos = true;
        ButtonQuickSlot[i].AWinPos = fbButtonQuickSlot[i];
        ButtonQuickSlot[i].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
        ButtonQuickSlot[i].InitComponent(MyController, self);
        ButtonQuickSlot[i].SlotName3Padding[1] = 7;
        AppendComponent(ButtonQuickSlot[i]);
        ButtonQuickSlot[i].itemBox.ChangeState(24);
        ButtonQuickSlot[i].itemBox.bShowDurability = false;
        InvenGroup.AddButton(ButtonQuickSlot[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    ButtonQuickSlot[int(0)].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_MainGun;
    ButtonQuickSlot[int(1)].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_Pistol;
    ButtonQuickSlot[int(4)].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_Knife;
    ButtonQuickSlot[int(2)].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_grnd;
    ButtonQuickSlot[int(3)].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_grnd;
    i = 0;
    J0x1EC:

    // End:0x455 [Loop If]
    if(i < 4)
    {
        ButtonTag[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        ButtonTag[i].bUseAWinPos = true;
        ButtonTag[i].AWinPos = fbButtonTag[i];
        ButtonTag[i].bAlwaysFocus = true;
        ButtonTag[i].bRenderFlickerNotify = false;
        ButtonTag[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot_Btn_n[i];
        ButtonTag[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot_Btn_on[i];
        ButtonTag[i].buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot_Btn_Focus[i];
        ButtonTag[i].buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot_Btn_cli[i];
        ButtonTag[i].buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot_Btn_Disable[i];
        ButtonTag[i].buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_QuiSlot_Btn_Focus[i];
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
        goto J0x1EC;
    }
    i = 0;
    J0x45C:

    // End:0x6F2 [Loop If]
    if(i < 2)
    {
        btnModify[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        btnModify[i].bUseAWinPos = true;
        btnModify[i].ButtonID = i;
        btnModify[i].AWinPos.X1 = 326.0000000;
        btnModify[i].AWinPos.Y1 = 193.0000000;
        btnModify[i].AWinPos.X2 = 372.0000000;
        btnModify[i].AWinPos.Y2 = 217.0000000;
        // End:0x5B1
        if(i == 1)
        {
            btnModify[i].AWinPos.X1 = 326.0000000;
            btnModify[i].AWinPos.Y1 = 281.0000000;
            btnModify[i].AWinPos.X2 = 372.0000000;
            btnModify[i].AWinPos.Y2 = 305.0000000;
        }
        ButtonQuickSlot[i].itemBox.offset.X1 = btnModify[i].AWinPos.X2;
        ButtonQuickSlot[i].itemBox.offset.Y1 = btnModify[i].AWinPos.Y1;
        ButtonQuickSlot[i].itemBox.offset.X2 = btnModify[i].AWinPos.X2 + float(24);
        ButtonQuickSlot[i].itemBox.offset.Y2 = btnModify[i].AWinPos.Y2;
        btnModify[i].SetModifybButtonImage();
        btnModify[i].InitComponent(MyController, self);
        AppendComponent(btnModify[i]);
        i++;
        // [Loop Continue]
        goto J0x45C;
    }
    // End:0xC1B
    if(1 == 1)
    {
        QuickSlotBuyButton = NewButtonComponent(fbQuickSlotBuyButton);
        QuickSlotBuyButton.SetSkillBuyButtonImage();
        QuickSlotBuyButton.SetDefaultFontColor();
        QuickSlotBuyButton.SetFontSizeAll(9);
        QuickSlotBuyButton.Caption = strQuickSlotBuyButton;
        QuickSlotBuyButton.ButtonID = 0;
        QuickSlotBuyButton.__OnClick__Delegate = OnQuickSlotBuyButton;
        QuickSlotGiftButton = NewButtonComponent(fbQuickSlotGiftButton);
        QuickSlotGiftButton.SetSkillBuyButtonImage();
        QuickSlotGiftButton.SetDefaultFontColor();
        QuickSlotGiftButton.SetFontSizeAll(9);
        QuickSlotGiftButton.Caption = strQuickSlotGiftButton;
        QuickSlotGiftButton.ButtonID = 1;
        QuickSlotGiftButton.__OnClick__Delegate = OnQuickSlotBuyButton;
        i = 0;
        J0x7F0:

        // End:0x87D [Loop If]
        if(i < 2)
        {
            QuickSlotState[i] = NewLabelComponent(fbQuickSlotState[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 1.1000000);
            QuickSlotState[i].SetFontSizeAll(9);
            QuickSlotState[i].SetFontDrawType(1);
            QuickSlotState[i].CaptionPadding[1] = 2;
            ++i;
            // [Loop Continue]
            goto J0x7F0;
        }
        LockedQuickSlot = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_Locked_QuickSlot;
        LockedQuickSlotTitle = Class'Engine.BTCustomDrawHK'.static.MakeText(11, 4, strQuickslotOpenTitle);
        LockedQuickSlotTitle.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
        i = 0;
        J0x8D0:

        // End:0x930 [Loop If]
        if(i < 3)
        {
            LockedQuickSlotDesc[i] = Class'Engine.BTCustomDrawHK'.static.MakeText(8, 4, strQuickslotOpenDesc[i]);
            LockedQuickSlotDesc[i].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon();
            ++i;
            // [Loop Continue]
            goto J0x8D0;
        }
        i = 0;
        J0x937:

        // End:0xAA5 [Loop If]
        if(i < 2)
        {
            SkillSlotBuyButton[i] = NewButtonComponent(fbSkillSlotBuyButton[i]);
            SkillSlotBuyButton[i].SetSkillBuyButtonImage();
            SkillSlotBuyButton[i].SetDefaultFontColor();
            SkillSlotBuyButton[i].SetFontSizeAll(9);
            SkillSlotBuyButton[i].Caption = strSkillSlotBuyButton;
            SkillSlotBuyButton[i].ButtonID = i;
            SkillSlotBuyButton[i].__OnClick__Delegate = OnSkillSlotBuyButton;
            SkillSlotGiftButton[i] = NewButtonComponent(fbSkillSlotGiftButton[i]);
            SkillSlotGiftButton[i].SetSkillBuyButtonImage();
            SkillSlotGiftButton[i].SetDefaultFontColor();
            SkillSlotGiftButton[i].SetFontSizeAll(9);
            SkillSlotGiftButton[i].Caption = strSkillSlotGiftButton;
            SkillSlotGiftButton[i].ButtonID = i;
            SkillSlotGiftButton[i].__OnClick__Delegate = OnSkillSlotGiftButton;
            ++i;
            // [Loop Continue]
            goto J0x937;
        }
        TempRO = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
        TempRO.Init();
        TempRO.instanceInfo = new Class'Engine.wItemBoxInstanceHK';
        TempRO.SetGameManager(GameMgr);
        TempRO.SetMatchMaker(MM);
        TempRO.ChangeState(6);
        i = 0;
        J0xB1B:

        // End:0xC1B [Loop If]
        if(i < 2)
        {
            RoQuickSlotItem[i] = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
            RoQuickSlotItem[i].Init();
            RoQuickSlotItem[i].SetGameManager(GameMgr);
            RoQuickSlotItem[i].SetMatchMaker(MM);
            RoQuickSlotItem[i].ChangeState(6);
            RoSkillSlotItem[i] = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
            RoSkillSlotItem[i].Init();
            RoSkillSlotItem[i].SetGameManager(GameMgr);
            RoSkillSlotItem[i].SetMatchMaker(MM);
            RoSkillSlotItem[i].ChangeState(6);
            ++i;
            // [Loop Continue]
            goto J0xB1B;
        }
    }
    RefreshQuickSlotBuyButtonShow();
    //return;    
}

function ShowWeaponTransparent()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x14D [Loop If]
    if(i < 5)
    {
        ButtonQuickSlot[i].itemBox.Update();
        // End:0xAE
        if(ButtonQuickSlot[i].itemBox.IsEmpty())
        {
            ButtonQuickSlot[i].DefaultSlotModulate.W = 1.0000000;
            ButtonQuickSlot[i].DefaultSlotItemID = 0;
            ButtonQuickSlot[i].DefaultSlotUniqueID = Class'Engine.BTCustomDrawHK'.static.EmptyBtrDouble();
            // [Explicit Continue]
            goto J0x143;
        }
        ButtonQuickSlot[i].DefaultSlotModulate.W = 0.4000000;
        ButtonQuickSlot[i].DefaultSlotItemID = ButtonQuickSlot[i].itemBox.instanceInfo.ItemID;
        ButtonQuickSlot[i].DefaultSlotUniqueID = ButtonQuickSlot[i].itemBox.instanceInfo.UniqueID;
        J0x143:

        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function ShowSkillTransparent()
{
    local int i, quickSlotIndex, slotNum;
    local bool bEnableQuickSlot, bShowButton, bEnableSkillSlot, disableSkillSlot, showSlotEffect;

    local string strSlotState;
    local Color colorSlotState;

    slotNum = QSButtonGroup.GetSelectIndex();
    bEnableQuickSlot = GameMgr.IsEnableQuickSlot(slotNum);
    i = 0;
    J0x37:

    // End:0x2D1 [Loop If]
    if(i < 4)
    {
        bEnableSkillSlot = GameMgr.IsEnableSkillSlot(i);
        quickSlotIndex = i + int(5);
        disableSkillSlot = !bEnableQuickSlot || !bEnableSkillSlot;
        showSlotEffect = bEnableQuickSlot && !bEnableSkillSlot;
        ButtonQuickSlot[quickSlotIndex].DefaultSlotName[1] = "";
        ButtonQuickSlot[quickSlotIndex].DefaultSlotName[2] = "";
        // End:0x1D0
        if(disableSkillSlot)
        {
            ButtonQuickSlot[quickSlotIndex].DisableMe();
            ButtonQuickSlot[quickSlotIndex].itemBox.ItemInfo = none;
            ButtonQuickSlot[quickSlotIndex].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Skill_Lock;
            ButtonQuickSlot[quickSlotIndex].DefaultSlotModulate.W = 1.0000000;
            // End:0x1CD
            if(1 == 1)
            {
                // End:0x1AA
                if(showSlotEffect)
                {
                    ButtonQuickSlot[quickSlotIndex].DefaultSlotName[2] = strSkillslotOpen;
                    ButtonQuickSlot[quickSlotIndex].DefaultSlotImageEffect = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_Skill_Locked_Effect;                    
                }
                else
                {
                    ButtonQuickSlot[quickSlotIndex].DefaultSlotImageEffect = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
                }
            }            
        }
        else
        {
            ButtonQuickSlot[quickSlotIndex].EnableMe();
            ButtonQuickSlot[quickSlotIndex].DefaultSlotImageEffect = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
            // End:0x28A
            if(ButtonQuickSlot[quickSlotIndex].itemBox.IsEmpty())
            {
                ButtonQuickSlot[quickSlotIndex].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
                ButtonQuickSlot[quickSlotIndex].DefaultSlotModulate.W = 1.0000000;
                ButtonQuickSlot[quickSlotIndex].DefaultSlotName[1] = strUnRegister;                
            }
            else
            {
                ButtonQuickSlot[quickSlotIndex].DefaultSlotModulate.W = 0.4000000;
            }
        }
        ButtonQuickSlot[quickSlotIndex].itemBox.Update();
        ++i;
        // [Loop Continue]
        goto J0x37;
    }
    i = 0;
    J0x2D8:

    // End:0x46C [Loop If]
    if(i < 2)
    {
        bShowButton = bEnableQuickSlot && !GameMgr.IsEnableSkillSlot(i + 2);
        // End:0x340
        if(RoSkillSlotItem[i].CanGift())
        {
            SkillSlotGiftButton[i].EnableMe();            
        }
        else
        {
            SkillSlotGiftButton[i].DisableMe();
        }
        SkillSlotBuyButton[i].SetVisibility(bShowButton);
        SkillSlotGiftButton[i].SetVisibility(bShowButton);
        quickSlotIndex = i + int(7);
        // End:0x405
        if((!bEnableQuickSlot || RoSkillSlotItem[i].instanceInfo == none) || RoSkillSlotItem[i].instanceInfo.NotLeftTime())
        {
            ButtonQuickSlot[quickSlotIndex].ExtraString.Text = "";
            // [Explicit Continue]
            goto J0x462;
        }
        RoSkillSlotItem[i].GetTimeString(strSlotState, colorSlotState);
        ButtonQuickSlot[quickSlotIndex].ExtraString.Text = strSlotState;
        ButtonQuickSlot[quickSlotIndex].ExtraString.DrawColor = colorSlotState;
        J0x462:

        ++i;
        // [Loop Continue]
        goto J0x2D8;
    }
    //return;    
}

function bool IsEmptyQuickSlot(int Index)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x59 [Loop If]
    if(i < 8)
    {
        // End:0x4F
        if((SaveQS[Index].ItemInfo[i] != none) || SaveQS[Index].instanceInfo[i] != none)
        {
            return false;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return true;
    //return;    
}

function SetDefaultButtonImage()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x97 [Loop If]
    if(i < 4)
    {
        // End:0x49
        if(IsEmptyQuickSlot(i))
        {
            ButtonTag[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_quik_empty;            
        }
        else
        {
            ButtonTag[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_quik_n;
        }
        ButtonChangeName[i].Caption = self.strButtonChangeName;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function bool OnPreDraw(Canvas C)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xBD [Loop If]
    if(i < 2)
    {
        // End:0x93
        if(CheckIn(btnModify[i].AWinPos, int(Controller.MouseX), int(Controller.MouseY)))
        {
            ButtonQuickSlot[i].itemBox.bShowModifyIcon = true;
            btnModify[i].SetFocus(btnModify[i]);
            // [Explicit Continue]
            goto J0xB3;
        }
        ButtonQuickSlot[i].itemBox.bShowModifyIcon = false;
        J0xB3:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local int i;

    // End:0x136
    if(1 == 1)
    {
        // End:0x136
        if(isLockedQuickSlot)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, LockedQuickSlot, fbLockedQuickSlot.X1, fbLockedQuickSlot.Y1, fbLockedQuickSlot.X2, fbLockedQuickSlot.Y2);
            Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, LockedQuickSlotTitle, fbLockedQuickSlotTitle.X1, fbLockedQuickSlotTitle.Y1, fbLockedQuickSlotTitle.X2, fbLockedQuickSlotTitle.Y2);
            i = 0;
            J0x99:

            // End:0x10E [Loop If]
            if(i < 3)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, LockedQuickSlotDesc[i], fbLockedQuickSlotDesc[i].X1, fbLockedQuickSlotDesc[i].Y1, fbLockedQuickSlotDesc[i].X2, fbLockedQuickSlotDesc[i].Y2);
                ++i;
                // [Loop Continue]
                goto J0x99;
            }
            QuickSlotBuyButton.OnRendered(C);
            QuickSlotGiftButton.OnRendered(C);
        }
    }
    //return;    
}

function bool FindAndRemoveItem(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x8C [Loop If]
    if(i < 5)
    {
        // End:0x82
        if((ButtonQuickSlot[i].itemBox.instanceInfo != none) && __NFUN_912__(ButtonQuickSlot[i].itemBox.instanceInfo.UniqueID, UniqueID))
        {
            ButtonQuickSlot[i].SetData(none, none);
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function bool FindAndRemoveSkillItem(int UniqueID)
{
    local int i;

    i = int(5);
    J0x0A:

    // End:0x8E [Loop If]
    if(i < 4)
    {
        // End:0x84
        if((ButtonQuickSlot[i].itemBox.instanceInfo != none) && ButtonQuickSlot[i].itemBox.instanceInfo.UniqueSkillID == UniqueID)
        {
            ButtonQuickSlot[i].SetData(none, none);
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x0A;
    }
    return false;
    //return;    
}

function RefreshModifyBtn()
{
    local int i, iItemType;

    i = 0;
    J0x07:

    // End:0xF3 [Loop If]
    if(i < 2)
    {
        iItemType = GameMgr.GetItemType(ButtonQuickSlot[i].itemBox.ItemInfo, ButtonQuickSlot[i].itemBox.instanceInfo);
        btnModify[i].bVisible = true;
        btnModify[i].bDisable = false;
        // End:0xE9
        if((ButtonQuickSlot[i].itemBox.ItemInfo == none) || bool(iItemType & GameMgr.FlagModify) == false)
        {
            btnModify[i].bDisable = true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function ChangeQuickSlot(int slotNum, bool enableModify)
{
    local int i, iItemType;

    QSButtonGroup.SelectButton(slotNum);
    FocusFirst(ButtonChangeName[QSNameGroup.GetSelectIndex()]);
    i = 0;
    J0x36:

    // End:0x130 [Loop If]
    if(i < 2)
    {
        // End:0x10F
        if(enableModify)
        {
            iItemType = GameMgr.GetItemType(SaveQS[slotNum].ItemInfo[i], SaveQS[slotNum].instanceInfo[i]);
            btnModify[i].bVisible = true;
            btnModify[i].bDisable = false;
            // End:0x10C
            if((SaveQS[slotNum].ItemInfo[i] == none) || bool(iItemType & GameMgr.FlagModify) == false)
            {
                btnModify[i].bDisable = true;
            }
            // [Explicit Continue]
            goto J0x126;
        }
        btnModify[i].bDisable = true;
        J0x126:

        i++;
        // [Loop Continue]
        goto J0x36;
    }
    i = 0;
    J0x137:

    // End:0x18E [Loop If]
    if(i < 9)
    {
        ButtonQuickSlot[i].SetData(SaveQS[slotNum].ItemInfo[i], SaveQS[slotNum].instanceInfo[i]);
        i++;
        // [Loop Continue]
        goto J0x137;
    }
    ShowWeaponTransparent();
    RefreshQuickSlotBuyButtonShow();
    //return;    
}

function FillQuickSlotData()
{
    local int i, j, k;

    SaveQS.Length = GameMgr.QuickSlotBoxList.Length;
    i = 0;
    J0x1D:

    // End:0x1AC [Loop If]
    if(i < GameMgr.QuickSlotBoxList.Length)
    {
        j = 0;
        J0x3D:

        // End:0xE5 [Loop If]
        if(j < 5)
        {
            SaveQS[i].ItemInfo[j] = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[j]);
            SaveQS[i].instanceInfo[j] = GameMgr.FindInstanceItem(GameMgr.QuickSlotBoxList[i].UniqueID[j]);
            ++j;
            // [Loop Continue]
            goto J0x3D;
        }
        k = 0;
        J0xEC:

        // End:0x1A2 [Loop If]
        if(k < 4)
        {
            SaveQS[i].ItemInfo[k + j] = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].SkillID[k]);
            SaveQS[i].instanceInfo[k + j] = GameMgr.FindInstanceSkillItem(GameMgr.QuickSlotBoxList[i].UniqueSkillID[k]);
            ++k;
            // [Loop Continue]
            goto J0xEC;
        }
        i++;
        // [Loop Continue]
        goto J0x1D;
    }
    //return;    
}

function RefreshQuickSlotBuyButtonShow()
{
    local bool bEnableQuickSlot;
    local int i, slotNum;
    local string strSlotState;
    local Color colorSlotState;

    slotNum = QSButtonGroup.GetSelectIndex();
    bEnableQuickSlot = GameMgr.IsEnableQuickSlot(slotNum);
    // End:0x79
    if(slotNum >= 2)
    {
        // End:0x6A
        if(RoQuickSlotItem[slotNum - 2].CanGift())
        {
            QuickSlotGiftButton.EnableMe();            
        }
        else
        {
            QuickSlotGiftButton.DisableMe();
        }
    }
    isLockedQuickSlot = !bEnableQuickSlot;
    QuickSlotBuyButton.SetVisibility(!bEnableQuickSlot);
    QuickSlotGiftButton.SetVisibility(!bEnableQuickSlot);
    i = 0;
    J0xBD:

    // End:0x109 [Loop If]
    if(i < 9)
    {
        // End:0xEA
        if(bEnableQuickSlot)
        {
            ButtonQuickSlot[i].EnableMe();
            // [Explicit Continue]
            goto J0xFF;
        }
        ButtonQuickSlot[i].DisableMe();
        J0xFF:

        ++i;
        // [Loop Continue]
        goto J0xBD;
    }
    i = 0;
    J0x110:

    // End:0x262 [Loop If]
    if(i < 2)
    {
        ButtonTag[i + 2].SetFlicker(!GameMgr.IsEnableQuickSlot(i + 2));
        // End:0x1C9
        if((RoQuickSlotItem[i].instanceInfo == none) || RoQuickSlotItem[i].instanceInfo.NotLeftTime())
        {
            QuickSlotState[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_QuickSlot_Open;
            QuickSlotState[i].Caption = "";
            // [Explicit Continue]
            goto J0x258;
        }
        RoQuickSlotItem[i].GetTimeStringOneStep(strSlotState, colorSlotState, Class'Engine.Canvas'.static.MakeColor(0, 0, 0, byte(255)));
        QuickSlotState[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_QuickSlot_DayCount;
        QuickSlotState[i].SetFontColorAll(colorSlotState);
        QuickSlotState[i].Caption = strSlotState;
        J0x258:

        ++i;
        // [Loop Continue]
        goto J0x110;
    }
    ShowSkillTransparent();
    //return;    
}

function bool OnQuickSlotBuyButton(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK sendButton;

    sendButton = BTOwnerDrawCaptionButtonHK(Sender);
    ItemBuyProcess((30200 + QSButtonGroup.GetSelectIndex()) - 2, sendButton.ButtonID);
    return true;
    //return;    
}

function bool OnSkillSlotBuyButton(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK sendButton;

    sendButton = BTOwnerDrawCaptionButtonHK(Sender);
    ItemBuyProcess(30202 + sendButton.ButtonID, 0);
    return true;
    //return;    
}

function bool OnSkillSlotGiftButton(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK sendButton;

    sendButton = BTOwnerDrawCaptionButtonHK(Sender);
    ItemBuyProcess(30202 + sendButton.ButtonID, 1);
    return true;
    //return;    
}

function bool ItemBuyProcess(int ItemID, int _buyType)
{
    local wItemBoxCashHK cii;

    TempRO.ItemInfo = GameMgr.FindUIItem(ItemID);
    // End:0x80
    if(TempRO.ItemInfo.IsCashItem() == true)
    {
        GameMgr.AddCashItem(TempRO.ItemInfo, TempRO.instanceInfo, Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetClientString(122));        
    }
    else
    {
        TempRO.instanceInfo.cashItemInfo = none;
    }
    TempRO.Update();
    cii = TempRO.instanceInfo.cashItemInfo;
    // End:0x114
    if(cii != none)
    {
        Class'GUIWarfareControls_Decompressed.BTWindowSelectCashTypeHK'.static.ShowWindowSelectCashType(Controller, TempRO, _buyType);
        BTWindowSelectCashTypeHK(Controller.TopPage()).__SelectCoin__Delegate = SelectCoin;        
    }
    else
    {
        ShowItemBuyWindow(TempRO, _buyType, 0);
    }
    return true;
    //return;    
}

function SelectCoin(int buyType, int cashType, BTROItemBoxHK ro)
{
    ShowItemBuyWindow(ro, buyType, byte(cashType));
    //return;    
}

function ShowItemBuyWindow(BTROItemBoxHK ro, int buyType, byte cashType)
{
    Class'GUIWarfareControls_Decompressed.BTWindowItemBuyHK'.static.ShowItemBuyWindow(Controller, TcpChannel, ro, MM.kPoint, MM.kCash, MM.kCCoinCash, buyType, cashType);
    BTWindowItemBuyHK(Controller.TopPage()).__deleShowCashChargeWindow__Delegate = __deleShowCashChargeWindow__Delegate;
    //return;    
}

function InitializeItemInfo()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x217 [Loop If]
    if(i < 2)
    {
        RoQuickSlotItem[i].ItemInfo = GameMgr.FindUIItem(30200 + i);
        RoQuickSlotItem[i].instanceInfo = GameMgr.FindFirstInstanceItemByItemType(int(GameMgr.42) + i);
        // End:0xB3
        if(RoQuickSlotItem[i].instanceInfo == none)
        {
            RoQuickSlotItem[i].instanceInfo = new Class'Engine.wItemBoxInstanceHK';
        }
        GameMgr.AddCashItem(RoQuickSlotItem[i].ItemInfo, RoQuickSlotItem[i].instanceInfo, Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetClientString(122));
        RoQuickSlotItem[i].Update();
        RoSkillSlotItem[i].ItemInfo = GameMgr.FindUIItem(30202 + i);
        RoSkillSlotItem[i].instanceInfo = GameMgr.FindFirstInstanceItemByItemType(int(GameMgr.44) + i);
        // End:0x1B0
        if(RoSkillSlotItem[i].instanceInfo == none)
        {
            RoSkillSlotItem[i].instanceInfo = new Class'Engine.wItemBoxInstanceHK';
        }
        GameMgr.AddCashItem(RoSkillSlotItem[i].ItemInfo, RoSkillSlotItem[i].instanceInfo, Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetClientString(122));
        RoSkillSlotItem[i].Update();
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    RefreshQuickSlotBuyButtonShow();
    //return;    
}

defaultproperties
{
    // Reference: ButtonGroups'GUIWarfareControls_Decompressed.BTTPInventoryQuickSlotHK.mgroups'
    begin object name="mgroups" class=GUIWarfareControls_Decompressed.ButtonGroups
    end object
    InvenGroup=mgroups
    // Reference: ButtonGroups'GUIWarfareControls_Decompressed.BTTPInventoryQuickSlotHK.mgroups2'
    begin object name="mgroups2" class=GUIWarfareControls_Decompressed.ButtonGroups
    end object
    QSButtonGroup=mgroups2
    // Reference: ButtonGroups'GUIWarfareControls_Decompressed.BTTPInventoryQuickSlotHK.mgroups3'
    begin object name="mgroups3" class=GUIWarfareControls_Decompressed.ButtonGroups
    end object
    QSNameGroup=mgroups3
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPInventoryQuickSlotHK.mBackgroundImage'
    begin object name="mBackgroundImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
        WinTop=0.0000000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=1.0000000
    end object
    BackgroundImage=mBackgroundImage
    strButtonChangeName="Change Name"
    strQuickSlot="Quick Slot"
    strUnRegister="Unregistered"
    strOK="OK"
    fbLabelTagTop[0]=(X1=44.0000000,Y1=136.0000000,X2=312.0000000,Y2=155.0000000)
    fbLabelTagTop[1]=(X1=44.0000000,Y1=202.0000000,X2=312.0000000,Y2=221.0000000)
    fbLabelTagTop[2]=(X1=44.0000000,Y1=268.0000000,X2=312.0000000,Y2=287.0000000)
    fbLabelTagTop[3]=(X1=44.0000000,Y1=334.0000000,X2=312.0000000,Y2=353.0000000)
    fbLabelTagTop[4]=(X1=44.0000000,Y1=400.0000000,X2=312.0000000,Y2=419.0000000)
    fbLabelTagBottom[0]=(X1=44.0000000,Y1=161.0000000,X2=222.0000000,Y2=181.0000000)
    fbLabelTagBottom[1]=(X1=44.0000000,Y1=227.0000000,X2=222.0000000,Y2=247.0000000)
    fbLabelTagBottom[2]=(X1=44.0000000,Y1=293.0000000,X2=222.0000000,Y2=313.0000000)
    fbLabelTagBottom[3]=(X1=44.0000000,Y1=359.0000000,X2=222.0000000,Y2=379.0000000)
    fbLabelTagBottom[4]=(X1=44.0000000,Y1=425.0000000,X2=222.0000000,Y2=445.0000000)
    fbButtonTag[0]=(X1=293.0000000,Y1=91.0000000,X2=334.0000000,Y2=118.0000000)
    fbButtonTag[1]=(X1=336.0000000,Y1=91.0000000,X2=377.0000000,Y2=118.0000000)
    fbButtonTag[2]=(X1=379.0000000,Y1=91.0000000,X2=420.0000000,Y2=118.0000000)
    fbButtonTag[3]=(X1=422.0000000,Y1=91.0000000,X2=463.0000000,Y2=118.0000000)
    fbButtonChangeName[0]=(X1=231.0000000,Y1=161.0000000,X2=314.0000000,Y2=181.0000000)
    fbButtonChangeName[1]=(X1=231.0000000,Y1=227.0000000,X2=314.0000000,Y2=247.0000000)
    fbButtonChangeName[2]=(X1=231.0000000,Y1=293.0000000,X2=314.0000000,Y2=313.0000000)
    fbButtonChangeName[3]=(X1=231.0000000,Y1=359.0000000,X2=314.0000000,Y2=379.0000000)
    fbButtonChangeName[4]=(X1=231.0000000,Y1=425.0000000,X2=314.0000000,Y2=445.0000000)
    fbEditChangeName[0]=(X1=37.0000000,Y1=137.0000000,X2=314.0000000,Y2=157.0000000)
    fbEditChangeName[1]=(X1=37.0000000,Y1=203.0000000,X2=314.0000000,Y2=223.0000000)
    fbEditChangeName[2]=(X1=37.0000000,Y1=269.0000000,X2=314.0000000,Y2=289.0000000)
    fbEditChangeName[3]=(X1=37.0000000,Y1=335.0000000,X2=314.0000000,Y2=355.0000000)
    fbEditChangeName[4]=(X1=37.0000000,Y1=401.0000000,X2=314.0000000,Y2=421.0000000)
    fbButtonQuickSlot[0]=(X1=326.0000000,Y1=134.0000000,X2=482.0000000,Y2=216.0000000)
    fbButtonQuickSlot[1]=(X1=326.0000000,Y1=222.0000000,X2=402.0000000,Y2=304.0000000)
    fbButtonQuickSlot[2]=(X1=326.0000000,Y1=309.0000000,X2=402.0000000,Y2=391.0000000)
    fbButtonQuickSlot[3]=(X1=406.0000000,Y1=309.0000000,X2=482.0000000,Y2=391.0000000)
    fbButtonQuickSlot[4]=(X1=406.0000000,Y1=222.0000000,X2=482.0000000,Y2=304.0000000)
    fbButtonQuickSlot[5]=(X1=336.0000000,Y1=419.0000000,X2=489.0000000,Y2=493.0000000)
    fbButtonQuickSlot[6]=(X1=336.0000000,Y1=501.0000000,X2=489.0000000,Y2=575.0000000)
    fbButtonQuickSlot[7]=(X1=336.0000000,Y1=580.0000000,X2=489.0000000,Y2=654.0000000)
    fbButtonQuickSlot[8]=(X1=336.0000000,Y1=659.0000000,X2=489.0000000,Y2=733.0000000)
    strButtonQuickSlot[0]="Primary"
    strButtonQuickSlot[1]="Secondary"
    strButtonQuickSlot[2]="Thrown"
    strButtonQuickSlot[3]="Thrown"
    strButtonQuickSlot[4]="Attack Skill"
    strButtonQuickSlot[5]="Passive Skill"
    strLabelWarning="- The durability of weapons used by 2nd Lieutenants (Lv. 16) or higher deteriorates over time, even when not in use."
    fbLabelWarning=(X1=25.0000000,Y1=708.0000000,X2=493.0000000,Y2=735.0000000)
    strQuickslotOpenTitle="Expand Quick Slot"
    strQuickslotOpenDesc[0]="Weapon durability does not"
    strQuickslotOpenDesc[1]="decrease when equipped in"
    strQuickslotOpenDesc[2]="this slot."
    fbLockedQuickSlot=(X1=324.0000000,Y1=126.0000000,X2=484.0000000,Y2=394.0000000)
    fbLockedQuickSlotTitle=(X1=329.0000000,Y1=187.0000000,X2=479.0000000,Y2=203.0000000)
    fbLockedQuickSlotDesc[0]=(X1=329.0000000,Y1=295.0000000,X2=479.0000000,Y2=308.0000000)
    fbLockedQuickSlotDesc[1]=(X1=329.0000000,Y1=311.0000000,X2=479.0000000,Y2=324.0000000)
    fbLockedQuickSlotDesc[2]=(X1=329.0000000,Y1=327.0000000,X2=479.0000000,Y2=340.0000000)
    fbQuickSlotBuyButton=(X1=352.0000000,Y1=223.0000000,X2=456.0000000,Y2=245.0000000)
    fbQuickSlotGiftButton=(X1=352.0000000,Y1=247.0000000,X2=456.0000000,Y2=269.0000000)
    strQuickSlotBuyButton="Buy Quick Slot"
    strQuickSlotGiftButton="Gift Quick Slot"
    fbQuickSlotState[0]=(X1=380.0000000,Y1=68.0000000,X2=420.0000000,Y2=92.0000000)
    fbQuickSlotState[1]=(X1=423.0000000,Y1=68.0000000,X2=463.0000000,Y2=92.0000000)
    fbSkillSlotBuyButton[0]=(X1=360.0000000,Y1=605.0000000,X2=464.0000000,Y2=627.0000000)
    fbSkillSlotBuyButton[1]=(X1=360.0000000,Y1=684.0000000,X2=464.0000000,Y2=706.0000000)
    fbSkillSlotGiftButton[0]=(X1=360.0000000,Y1=628.0000000,X2=464.0000000,Y2=650.0000000)
    fbSkillSlotGiftButton[1]=(X1=360.0000000,Y1=707.0000000,X2=464.0000000,Y2=729.0000000)
    strSkillSlotBuyButton="Buy Skill Slot"
    strSkillSlotGiftButton="Gift Skill Slot"
    strSkillslotOpen="Expand Skill Slot"
    OnPreDraw=BTTPInventoryQuickSlotHK.OnPreDraw
    OnRendered=BTTPInventoryQuickSlotHK.Internal_OnRendered
}