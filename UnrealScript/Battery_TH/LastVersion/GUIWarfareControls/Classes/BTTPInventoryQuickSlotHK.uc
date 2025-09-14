class BTTPInventoryQuickSlotHK extends GUITabPanel
    editinlinenew
    instanced;

const ITEMSLOT_COUNT = 9;
const WEAPONSLOT_COUNT = 4;
const SKILLSLOT_COUNT = 4;

enum E_ITEMSLOT
{
    EIS_MAIN_WEAPON,                // 0
    EIS_SUB_WEAPON,                 // 1
    EIS_THROW_WEAPON_1,             // 2
    EIS_THROW_WEAPON_2,             // 3
    EIS_ACTIVE_SKILL,               // 4
    EIS_PASSIVE_SKILL_1,            // 5
    EIS_PASSIVE_SKILL_2,            // 6
    EIS_PASSIVE_SKILL_3,            // 7
    EIS_MELEE_WEAPON                // 8
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
//var delegate<delegateUpdateQuickSlot> __delegateUpdateQuickSlot__Delegate;

delegate delegateUpdateQuickSlot(int i)
{
    //return;    
}

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
        ButtonQuickSlot[i].itemBox.ChangeState(24);
        ButtonQuickSlot[i].itemBox.bShowDurability = false;
        InvenGroup.AddButton(ButtonQuickSlot[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    i = 0;
    J0x145:

    // End:0x397 [Loop If]
    if(i < 4)
    {
        ButtonTag[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        ButtonTag[i].bUseAWinPos = true;
        ButtonTag[i].AWinPos = fbButtonTag[i];
        ButtonTag[i].bAlwaysFocus = true;
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
        goto J0x145;
    }
    i = 0;
    J0x39E:

    // End:0x634 [Loop If]
    if(i < 2)
    {
        btnModify[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        btnModify[i].bUseAWinPos = true;
        btnModify[i].ButtonID = i;
        btnModify[i].AWinPos.X1 = 326.0000000;
        btnModify[i].AWinPos.Y1 = 193.0000000;
        btnModify[i].AWinPos.X2 = 372.0000000;
        btnModify[i].AWinPos.Y2 = 217.0000000;
        // End:0x4F3
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
        goto J0x39E;
    }
    //return;    
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
    // End:0xD7
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
    // End:0x1E2
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
    // End:0x300
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
    // End:0x401
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
    // End:0x514
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

function ShowSkillTransparent()
{
    local int i, quickSlotIndex;

    i = 0;
    J0x07:

    // End:0x1AC [Loop If]
    if(i < 4)
    {
        quickSlotIndex = i + int(4);
        // End:0xB1
        if(!IsEnableSkillSlot(i))
        {
            ButtonQuickSlot[quickSlotIndex].itemBox.ItemInfo = none;
            ButtonQuickSlot[quickSlotIndex].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Skill_Lock;
            ButtonQuickSlot[quickSlotIndex].DefaultSlotModulate.W = 1.0000000;
            ButtonQuickSlot[quickSlotIndex].DefaultSlotName[1] = "";            
        }
        else
        {
            // End:0x133
            if(ButtonQuickSlot[quickSlotIndex].itemBox.IsEmpty())
            {
                ButtonQuickSlot[quickSlotIndex].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
                ButtonQuickSlot[quickSlotIndex].DefaultSlotModulate.W = 1.0000000;
                ButtonQuickSlot[quickSlotIndex].DefaultSlotName[1] = strUnRegister;                
            }
            else
            {
                ButtonQuickSlot[quickSlotIndex].DefaultSlotImage = ButtonQuickSlot[quickSlotIndex].itemBox.ItemImage;
                ButtonQuickSlot[quickSlotIndex].DefaultSlotModulate.W = 0.4000000;
            }
        }
        ButtonQuickSlot[quickSlotIndex].itemBox.Update();
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function bool EditChangeName_OnEnter(GUIComponent Sender, string qname)
{
    local wGameManager GameMgr;
    local export editinline BTEditBoxHK btn;
    local int i;

    btn = BTEditBoxHK(Sender);
    // End:0x5A
    if(qname == "")
    {
        LabelTagTop[btn.ButtonID].Caption = LabelTagBottom[btn.ButtonID].Caption;        
    }
    else
    {
        LabelTagTop[btn.ButtonID].Caption = qname;
    }
    LabelTagBottom[btn.ButtonID].Caption = "";
    btn.Clear();
    EditChangeName[btn.ButtonID].bAcceptsInput = false;
    EditChangeName[btn.ButtonID].SetVisibility(false);
    i = 0;
    J0xF2:

    // End:0x14C [Loop If]
    if(i < 4)
    {
        ButtonTag[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_m_on;
        ButtonChangeName[i].Caption = self.strButtonChangeName;
        i++;
        // [Loop Continue]
        goto J0xF2;
    }
    ButtonTag[btn.ButtonID].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_quik_chang;
    ButtonChangeName[btn.ButtonID].FocusFirst(none);
    DeActiveMouseX = 0.0000000;
    DeActiveMouseY = 0.0000000;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    GameMgr.SetQuickSlotBox_Name(btn.ButtonID, qname);
    delegateUpdateQuickSlot(btn.ButtonID);
    return true;
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

function bool ButtonChangeName_OnClick(GUIComponent Sender)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local FloatBox fb;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    fb = ButtonChangeName[btn.ButtonID].AWinPos;
    // End:0x9F
    if((fb.X1 <= DeActiveMouseX) && DeActiveMouseX <= fb.X2)
    {
        // End:0x9F
        if((fb.Y1 <= DeActiveMouseY) && DeActiveMouseY <= fb.Y2)
        {
            DeActiveMouseX = 0.0000000;
            DeActiveMouseY = 0.0000000;
            return true;
        }
    }
    i = 0;
    J0xA6:

    // End:0x10F [Loop If]
    if(i < 8)
    {
        ButtonQuickSlot[i].SetData(SaveQS[btn.ButtonID].ItemInfo[i], SaveQS[btn.ButtonID].instanceInfo[i]);
        i++;
        // [Loop Continue]
        goto J0xA6;
    }
    QSButtonGroup.SelectButton(btn.ButtonID);
    QSNameGroup.SelectButton(btn.ButtonID);
    SetDefaultButtonImage();
    ButtonTag[btn.ButtonID].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_quik_input;
    ButtonChangeName[btn.ButtonID].Caption = self.strOK;
    LabelTagBottom[btn.ButtonID].Caption = LabelTagTop[btn.ButtonID].Caption;
    LabelTagTop[btn.ButtonID].Caption = "";
    EditChangeName[btn.ButtonID].bAcceptsInput = true;
    EditChangeName[btn.ButtonID].SetVisibility(true);
    EditChangeName[btn.ButtonID].FocusFirst(none);
    return true;
    //return;    
}

function EditChangeName_OnDeActive()
{
    local int i;
    local wGameManager GameMgr;
    local bool bChangedName;
    local int ChangedIndex;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    DeActiveMouseX = Controller.MouseX;
    DeActiveMouseY = Controller.MouseY;
    i = 0;
    J0x5E:

    // End:0x1B7 [Loop If]
    if(i < 4)
    {
        // End:0xFB
        if(EditChangeName[i].TextStr != "")
        {
            LabelTagTop[i].Caption = EditChangeName[i].TextStr;
            GameMgr.SetQuickSlotBox_Name(i, LabelTagTop[i].Caption);
            ChangedIndex = i;
            bChangedName = true;
            delegateUpdateQuickSlot(i);            
        }
        else
        {
            // End:0x13F
            if(LabelTagBottom[i].Caption != "")
            {
                LabelTagTop[i].Caption = LabelTagBottom[i].Caption;
            }
        }
        EditChangeName[i].Clear();
        EditChangeName[i].bAcceptsInput = false;
        EditChangeName[i].SetVisibility(false);
        EditChangeName[i].InternalDeactivate();
        LabelTagBottom[i].Caption = "";
        i++;
        // [Loop Continue]
        goto J0x5E;
    }
    SetDefaultButtonImage();
    ButtonTag[QSButtonGroup.selectIndex].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_quik_chang;
    // End:0x203
    if(bChangedName)
    {
        delegateUpdateQuickSlot(ChangedIndex);
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

function bool FindAndRemoveItem(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x8C [Loop If]
    if(i < 4)
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

    i = int(4);
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
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 0;
    J0x36:

    // End:0x122 [Loop If]
    if(i < 2)
    {
        iItemType = GameMgr.GetItemType(ButtonQuickSlot[i].itemBox.ItemInfo, ButtonQuickSlot[i].itemBox.instanceInfo);
        btnModify[i].bVisible = true;
        btnModify[i].bDisable = false;
        // End:0x118
        if((ButtonQuickSlot[i].itemBox.ItemInfo == none) || bool(iItemType & GameMgr.FlagModify) == false)
        {
            btnModify[i].bDisable = true;
        }
        i++;
        // [Loop Continue]
        goto J0x36;
    }
    //return;    
}

function RefreshQuickSlotButtonEnable()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x58 [Loop If]
    if(i < 4)
    {
        // End:0x39
        if(IsEnableQuickSlot(i))
        {
            ButtonTag[i].EnableMe();
            // [Explicit Continue]
            goto J0x4E;
        }
        ButtonTag[i].DisableMe();
        J0x4E:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function bool IsEnableQuickSlot(int SlotNum)
{
    return true;
    //return;    
}

function bool IsEnableSkillSlot(int skillSlotNum)
{
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x3D
    if(skillSlotNum < 2)
    {
        return true;
    }
    return GameMgr.EnableSkillSlot[skillSlotNum] == 1;
    //return;    
}

function ChangeQuickSlot(int SlotNum, bool enableModify)
{
    local int i, iItemType;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    QSButtonGroup.SelectButton(SlotNum);
    FocusFirst(ButtonChangeName[QSNameGroup.GetSelectIndex()]);
    i = 0;
    J0x65:

    // End:0x15F [Loop If]
    if(i < 2)
    {
        // End:0x13E
        if(enableModify)
        {
            iItemType = GameMgr.GetItemType(SaveQS[SlotNum].ItemInfo[i], SaveQS[SlotNum].instanceInfo[i]);
            btnModify[i].bVisible = true;
            btnModify[i].bDisable = false;
            // End:0x13B
            if((SaveQS[SlotNum].ItemInfo[i] == none) || bool(iItemType & GameMgr.FlagModify) == false)
            {
                btnModify[i].bDisable = true;
            }
            // [Explicit Continue]
            goto J0x155;
        }
        btnModify[i].bDisable = true;
        J0x155:

        i++;
        // [Loop Continue]
        goto J0x65;
    }
    i = 0;
    J0x166:

    // End:0x1BD [Loop If]
    if(i < 8)
    {
        ButtonQuickSlot[i].SetData(SaveQS[SlotNum].ItemInfo[i], SaveQS[SlotNum].instanceInfo[i]);
        i++;
        // [Loop Continue]
        goto J0x166;
    }
    ShowWeaponTransparent(ButtonQuickSlot[0].itemBox, ButtonQuickSlot[1].itemBox, ButtonQuickSlot[2].itemBox, ButtonQuickSlot[3].itemBox);
    ShowSkillTransparent();
    //return;    
}

function FillQuickSlotData()
{
    local int i, j;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    SaveQS.Length = GameMgr.QuickSlotBoxList.Length;
    i = int(0);
    J0x4F:

    // End:0x10E [Loop If]
    if(i < 4)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0x104
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0x104
            if((ItemInfo != none) && int(ItemInfo.byModeItem) == 0)
            {
                SaveQS[0].ItemInfo[i] = ItemInfo;
                SaveQS[0].instanceInfo[i] = instanceInfo;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x4F;
    }
    i = int(14);
    J0x118:

    // End:0x1E5 [Loop If]
    if(i < (int(14) + 4))
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0x1DB
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0x1DB
            if((ItemInfo != none) && int(ItemInfo.byModeItem) == 0)
            {
                SaveQS[0].ItemInfo[i - 10] = ItemInfo;
                SaveQS[0].instanceInfo[i - 10] = instanceInfo;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x118;
    }
    j = 0;
    J0x1EC:

    // End:0x36A [Loop If]
    if(j < (4 - 1))
    {
        i = 0;
        J0x202:

        // End:0x360 [Loop If]
        if(i < (GameMgr.QuickSlotBoxList.Length - 1))
        {
            SaveQS[j + 1].ItemInfo[i] = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[j].ItemID[i]);
            SaveQS[j + 1].instanceInfo[i] = GameMgr.FindInstanceItem(GameMgr.QuickSlotBoxList[j].UniqueID[i]);
            SaveQS[j + 1].ItemInfo[i + 4] = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[j].SkillID[i]);
            SaveQS[j + 1].instanceInfo[i + 4] = GameMgr.FindInstanceSkillItem(GameMgr.QuickSlotBoxList[j].UniqueSkillID[i]);
            i++;
            // [Loop Continue]
            goto J0x202;
        }
        j++;
        // [Loop Continue]
        goto J0x1EC;
    }
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
    strButtonChangeName="???????????"
    strQuickSlot="?????????"
    strUnRegister="????????????"
    strOK="??????"
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
    fbButtonQuickSlot[4]=(X1=336.0000000,Y1=419.0000000,X2=489.0000000,Y2=493.0000000)
    fbButtonQuickSlot[5]=(X1=336.0000000,Y1=501.0000000,X2=489.0000000,Y2=575.0000000)
    fbButtonQuickSlot[6]=(X1=336.0000000,Y1=580.0000000,X2=489.0000000,Y2=654.0000000)
    fbButtonQuickSlot[7]=(X1=336.0000000,Y1=659.0000000,X2=489.0000000,Y2=733.0000000)
    fbButtonQuickSlot[8]=(X1=406.0000000,Y1=222.0000000,X2=482.0000000,Y2=304.0000000)
    strButtonQuickSlot[0]="?????????"
    strButtonQuickSlot[1]="????????"
    strButtonQuickSlot[2]="??????????"
    strButtonQuickSlot[3]="??????????"
    strButtonQuickSlot[4]="?????????"
    strButtonQuickSlot[5]="?????????????"
    strLabelWarning="????????????????????????????????????????? (Lv16) ??????????????  "
    fbLabelWarning=(X1=25.0000000,Y1=708.0000000,X2=493.0000000,Y2=735.0000000)
    OnPreDraw=BTTPInventoryQuickSlotHK.OnPreDraw
}