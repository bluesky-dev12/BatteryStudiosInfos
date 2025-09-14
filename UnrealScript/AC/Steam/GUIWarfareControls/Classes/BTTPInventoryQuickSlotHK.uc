/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPInventoryQuickSlotHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:29
 *	Functions:13
 *
 *******************************************************************************/
class BTTPInventoryQuickSlotHK extends GUITabPanel
    editinlinenew
    instanced;

struct SaveQuickSlot
{
    var wItemBoxHK ItemInfo[9];
    var wItemBoxInstanceHK instanceInfo[9];
};

var float DeActiveMouseX;
var float DeActiveMouseY;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify ButtonGroups InvenGroup;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify ButtonGroups QSButtonGroup;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify ButtonGroups QSNameGroup;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTStretchedImageHK BackgroundImage;
var localized string strButtonChangeName;
var localized string strQuickSlot;
var localized string strUnRegister;
var localized string strOK;
var array<SaveQuickSlot> SaveQS;
var FloatBox fbLabelTagTop[5];
var FloatBox fbLabelTagBottom[5];
var export editinline BTOwnerDrawImageHK LabelTagTop[5];
var export editinline BTOwnerDrawImageHK LabelTagBottom[5];
var FloatBox fbButtonTag[5];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTag[5];
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
var delegate<delegateUpdateQuickSlot> __delegateUpdateQuickSlot__Delegate;

delegate delegateUpdateQuickSlot(int i);
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x11d [While If]
    if(i < 6)
    {
        ButtonQuickSlot[i] = new class'BTItemBoxButtonHK';
        ButtonQuickSlot[i].bUseAWinPos = true;
        ButtonQuickSlot[i].AWinPos = fbButtonQuickSlot[i];
        ButtonQuickSlot[i].DefaultSlotName[0] = strButtonQuickSlot[i];
        ButtonQuickSlot[i].DefaultSlotName[1] = strUnRegister;
        ButtonQuickSlot[i].InitComponent(MyController, self);
        AppendComponent(ButtonQuickSlot[i]);
        ButtonQuickSlot[i].itemBox.ChangeState(0);
        InvenGroup.AddButton(ButtonQuickSlot[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    i = 0;
    J0x124:
    // End:0x643 [While If]
    if(i < 5)
    {
        LabelTagTop[i] = BTOwnerDrawImageHK(NewComponent(new class'BTOwnerDrawImageHK', fbLabelTagTop[i], 0.90));
        LabelTagTop[i].BackgroundImage = class'BTUIResourcePoolHK'.default.empty;
        LabelTagTop[i].Caption = strQuickSlot @ string(i);
        LabelTagTop[i].SetFontSizeAll(12);
        LabelTagTop[i].SetFontDrawType(3);
        LabelTagBottom[i] = BTOwnerDrawImageHK(NewComponent(new class'BTOwnerDrawImageHK', fbLabelTagBottom[i], 0.90));
        LabelTagBottom[i].BackgroundImage = class'BTUIResourcePoolHK'.default.empty;
        LabelTagBottom[i].SetFontSizeAll(12);
        LabelTagBottom[i].SetFontDrawType(3);
        ButtonTag[i] = new class'BTOwnerDrawCaptionButtonHK';
        ButtonTag[i].bUseAWinPos = true;
        ButtonTag[i].AWinPos = fbButtonTag[i];
        ButtonTag[i].SetDefaultQuickSlotButtonImage();
        ButtonTag[i].SetDefaultFontColor();
        ButtonTag[i].SetFontSizeAll(12);
        ButtonTag[i].buttonImage[2] = ButtonTag[i].buttonImage[1];
        ButtonTag[i].RenderWeight = 0.50;
        ButtonTag[i].Caption = "";
        ButtonTag[i].CaptionDrawType = 3;
        ButtonTag[i].CaptionPadding[0] = 16;
        ButtonTag[i].bSelectHighlight = true;
        ButtonTag[i].InitComponent(MyController, self);
        AppendComponent(ButtonTag[i]);
        QSButtonGroup.AddButton(ButtonTag[i]);
        ButtonTag[i].__OnClick__Delegate = ButtonTag_OnClick;
        ButtonChangeName[i] = new class'BTOwnerDrawCaptionButtonHK';
        ButtonChangeName[i].bUseAWinPos = true;
        ButtonChangeName[i].AWinPos = fbButtonChangeName[i];
        ButtonChangeName[i].RenderWeight = 0.60;
        ButtonChangeName[i].Caption = strButtonChangeName;
        ButtonChangeName[i].SetDefaultMButtonImage();
        ButtonChangeName[i].SetDefaultFontColor();
        ButtonChangeName[i].SetFontSizeAll(9);
        ButtonChangeName[i].InitComponent(MyController, self);
        AppendComponent(ButtonChangeName[i]);
        QSNameGroup.AddButton(ButtonChangeName[i]);
        ButtonChangeName[i].__OnClick__Delegate = ButtonChangeName_OnClick;
        EditChangeName[i] = new class'BTEditBoxHK';
        EditChangeName[i].bUseAWinPos = true;
        EditChangeName[i].AWinPos = fbEditChangeName[i];
        EditChangeName[i].RenderWeight = 0.70;
        EditChangeName[i].__OnChat__Delegate = EditChangeName_OnEnter;
        EditChangeName[i].__OnDeActivate__Delegate = EditChangeName_OnDeActive;
        EditChangeName[i].bgImg = class'BTUIResourcePoolHK'.default.panel_5;
        EditChangeName[i].ButtonID = i;
        EditChangeName[i].InitComponent(MyController, self);
        AppendComponent(EditChangeName[i]);
        EditChangeName[i].SetVisibility(false);
        EditChangeName[i].bAcceptsInput = false;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x124;
    }
    TPTemp = new class'BTTPChatHK';
    QSButtonGroup.SelectButton(0);
    ButtonTag[QSButtonGroup.selectIndex].buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_quik_chang;
    i = 0;
    J0x697:
    // End:0x6c4 [While If]
    if(i < 5)
    {
        EditChangeName[i].MaxTextStrNum = 15;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x697;
    }
    LabelWarning = BTOwnerDrawImageHK(NewComponent(new class'BTOwnerDrawImageHK', fbLabelWarning));
    LabelWarning.CaptionDrawType = 3;
    LabelWarning.SetFontColorAll(class'BTUIColorPoolHK'.static.LabelWarning());
    LabelWarning.Caption = strLabelWarning;
}

function ShowWeaponTransparent(BTROItemBoxHK MainWeapon, BTROItemBoxHK SubWeapon, BTROItemBoxHK ThrowWeapon1, BTROItemBoxHK ThrowWeapon2, optional BTROItemBoxHK Knife)
{
    MainWeapon.Update();
    SubWeapon.Update();
    ThrowWeapon1.Update();
    ThrowWeapon2.Update();
    ButtonQuickSlot[0].DefaultSlotImage = MainWeapon.ItemImage;
    ButtonQuickSlot[0].DefaultSlotModulate.W = 0.40;
    ButtonQuickSlot[0].DefaultSlotItemID = MainWeapon.instanceInfo.ItemID;
    ButtonQuickSlot[0].DefaultSlotUniqueID = MainWeapon.instanceInfo.UniqueID;
    ButtonQuickSlot[1].DefaultSlotImage = SubWeapon.ItemImage;
    ButtonQuickSlot[1].DefaultSlotModulate.W = 0.40;
    ButtonQuickSlot[1].DefaultSlotItemID = SubWeapon.instanceInfo.ItemID;
    ButtonQuickSlot[1].DefaultSlotUniqueID = SubWeapon.instanceInfo.UniqueID;
    // End:0x1d5
    if(ThrowWeapon1.IsEmpty())
    {
        ButtonQuickSlot[2].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_grnd;
        ButtonQuickSlot[2].DefaultSlotModulate.W = 1.0;
        ButtonQuickSlot[2].DefaultSlotItemID = 0;
        ButtonQuickSlot[2].DefaultSlotUniqueID = class'BTCustomDrawHK'.static.EmptyBtrDouble();
    }
    // End:0x263
    else
    {
        ButtonQuickSlot[2].DefaultSlotImage = ThrowWeapon1.ItemImage;
        ButtonQuickSlot[2].DefaultSlotModulate.W = 0.40;
        ButtonQuickSlot[2].DefaultSlotItemID = ThrowWeapon1.instanceInfo.ItemID;
        ButtonQuickSlot[2].DefaultSlotUniqueID = ThrowWeapon1.instanceInfo.UniqueID;
    }
    // End:0x2e8
    if(ThrowWeapon2.IsEmpty())
    {
        ButtonQuickSlot[3].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_grnd;
        ButtonQuickSlot[3].DefaultSlotModulate.W = 1.0;
        ButtonQuickSlot[3].DefaultSlotItemID = 0;
        ButtonQuickSlot[3].DefaultSlotUniqueID = class'BTCustomDrawHK'.static.EmptyBtrDouble();
    }
    // End:0x376
    else
    {
        ButtonQuickSlot[3].DefaultSlotImage = ThrowWeapon2.ItemImage;
        ButtonQuickSlot[3].DefaultSlotModulate.W = 0.40;
        ButtonQuickSlot[3].DefaultSlotItemID = ThrowWeapon2.instanceInfo.ItemID;
        ButtonQuickSlot[3].DefaultSlotUniqueID = ThrowWeapon2.instanceInfo.UniqueID;
    }
    // End:0x411
    if(Knife.IsEmpty())
    {
        ButtonQuickSlot[8].DefaultSlotName[1] = "";
        ButtonQuickSlot[8].DefaultSlotImage = class'BTUIResourcePoolHK'.default.Block_Weapon;
        ButtonQuickSlot[8].DefaultSlotModulate.W = 1.0;
        ButtonQuickSlot[8].DefaultSlotItemID = 0;
        ButtonQuickSlot[8].DefaultSlotUniqueID = class'BTCustomDrawHK'.static.EmptyBtrDouble();
    }
    // End:0x48d
    else
    {
        ButtonQuickSlot[8].DefaultSlotImage = Knife.ItemImage;
        ButtonQuickSlot[8].DefaultSlotModulate.W = 0.40;
        ButtonQuickSlot[8].DefaultSlotItemID = 9001;
        ButtonQuickSlot[8].DefaultSlotUniqueID = Knife.instanceInfo.UniqueID;
    }
}

function ShowSkillTransparent(BTROItemBoxHK Skill_1, BTROItemBoxHK Skill_2, BTROItemBoxHK Skill_3, BTROItemBoxHK Skill_4)
{
    Skill_1.Update();
    Skill_2.Update();
    // End:0x6f
    if(Skill_1.IsEmpty())
    {
        ButtonQuickSlot[4].DefaultSlotImage = class'BTUIResourcePoolHK'.default.empty;
        ButtonQuickSlot[4].DefaultSlotModulate.W = 0.40;
    }
    // End:0xab
    else
    {
        ButtonQuickSlot[4].DefaultSlotImage = Skill_1.ItemImage;
        ButtonQuickSlot[4].DefaultSlotModulate.W = 0.40;
    }
    // End:0xfc
    if(Skill_2.IsEmpty())
    {
        ButtonQuickSlot[5].DefaultSlotImage = class'BTUIResourcePoolHK'.default.empty;
        ButtonQuickSlot[5].DefaultSlotModulate.W = 0.40;
    }
    // End:0x138
    else
    {
        ButtonQuickSlot[5].DefaultSlotImage = Skill_2.ItemImage;
        ButtonQuickSlot[5].DefaultSlotModulate.W = 0.40;
    }
}

function bool EditChangeName_OnEnter(GUIComponent Sender, string qname)
{
    local wGameManager GameMgr;
    local export editinline BTEditBoxHK btn;
    local int i;

    btn = BTEditBoxHK(Sender);
    // End:0x5a
    if(qname == "")
    {
        LabelTagTop[btn.ButtonID].Caption = LabelTagBottom[btn.ButtonID].Caption;
    }
    // End:0x7d
    else
    {
        LabelTagTop[btn.ButtonID].Caption = qname;
    }
    LabelTagBottom[btn.ButtonID].Caption = "";
    btn.Clear();
    EditChangeName[btn.ButtonID].bAcceptsInput = false;
    EditChangeName[btn.ButtonID].SetVisibility(false);
    i = 0;
    J0xf2:
    // End:0x14c [While If]
    if(i < 5)
    {
        ButtonTag[i].buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_m_on;
        ButtonChangeName[i].Caption = self.strButtonChangeName;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf2;
    }
    ButtonTag[btn.ButtonID].buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_quik_chang;
    ButtonChangeName[btn.ButtonID].FocusFirst(none);
    DeActiveMouseX = 0.0;
    DeActiveMouseY = 0.0;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    GameMgr.SetQuickSlotBox_Name(btn.ButtonID, qname);
    delegateUpdateQuickSlot(btn.ButtonID);
    return true;
}

function bool IsEmptyQuickSlot(int Index)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x59 [While If]
    if(i < 8)
    {
        // End:0x4f
        if(SaveQS[Index].ItemInfo[i] != none || SaveQS[Index].instanceInfo[i] != none)
        {
            return false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return true;
}

function SetDefaultButtonImage()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x97 [While If]
    if(i < 5)
    {
        // End:0x49
        if(IsEmptyQuickSlot(i))
        {
            ButtonTag[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.butt_quik_empty;
        }
        // End:0x6e
        else
        {
            ButtonTag[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.butt_quik_n;
        }
        ButtonChangeName[i].Caption = self.strButtonChangeName;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function bool ButtonTag_OnClick(GUIComponent Sender)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    QSButtonGroup.SelectButton(btn.ButtonID);
    FocusFirst(ButtonChangeName[QSNameGroup.GetSelectIndex()]);
    SetDefaultButtonImage();
    ButtonTag[QSButtonGroup.selectIndex].buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_quik_chang;
    i = 0;
    J0x83:
    // End:0xec [While If]
    if(i < 8)
    {
        ButtonQuickSlot[i].SetData(SaveQS[btn.ButtonID].ItemInfo[i], SaveQS[btn.ButtonID].instanceInfo[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x83;
    }
    return true;
}

function bool ButtonChangeName_OnClick(GUIComponent Sender)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local FloatBox fb;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    fb = ButtonChangeName[btn.ButtonID].AWinPos;
    // End:0x9f
    if(fb.X1 <= DeActiveMouseX && DeActiveMouseX <= fb.X2)
    {
        // End:0x9f
        if(fb.Y1 <= DeActiveMouseY && DeActiveMouseY <= fb.Y2)
        {
            DeActiveMouseX = 0.0;
            DeActiveMouseY = 0.0;
            return true;
        }
    }
    i = 0;
    J0xa6:
    // End:0x10f [While If]
    if(i < 8)
    {
        ButtonQuickSlot[i].SetData(SaveQS[btn.ButtonID].ItemInfo[i], SaveQS[btn.ButtonID].instanceInfo[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xa6;
    }
    QSButtonGroup.SelectButton(btn.ButtonID);
    QSNameGroup.SelectButton(btn.ButtonID);
    SetDefaultButtonImage();
    ButtonTag[btn.ButtonID].buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_quik_input;
    ButtonChangeName[btn.ButtonID].Caption = self.strOK;
    LabelTagBottom[btn.ButtonID].Caption = LabelTagTop[btn.ButtonID].Caption;
    LabelTagTop[btn.ButtonID].Caption = "";
    EditChangeName[btn.ButtonID].bAcceptsInput = true;
    EditChangeName[btn.ButtonID].SetVisibility(true);
    EditChangeName[btn.ButtonID].FocusFirst(none);
    return true;
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
    J0x5e:
    // End:0x1b7 [While If]
    if(i < 5)
    {
        // End:0xfb
        if(EditChangeName[i].TextStr != "")
        {
            LabelTagTop[i].Caption = EditChangeName[i].TextStr;
            GameMgr.SetQuickSlotBox_Name(i, LabelTagTop[i].Caption);
            ChangedIndex = i;
            bChangedName = true;
            delegateUpdateQuickSlot(i);
        }
        // End:0x13f
        else
        {
            // End:0x13f
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
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5e;
    }
    SetDefaultButtonImage();
    ButtonTag[QSButtonGroup.selectIndex].buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_quik_chang;
    // End:0x203
    if(bChangedName)
    {
        delegateUpdateQuickSlot(ChangedIndex);
    }
}

function bool OnPreDraw(Canvas C)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4e [While If]
    if(i < 5)
    {
        // End:0x44
        if(EditChangeName[i].bAcceptsInput == false)
        {
            EditChangeName[i].SetVisibility(false);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function bool FindAndRemoveItem(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x8c [While If]
    if(i < 4)
    {
        // End:0x82
        if(ButtonQuickSlot[i].itemBox.instanceInfo != none && UnresolvedNativeFunction_99(ButtonQuickSlot[i].itemBox.instanceInfo.UniqueID, UniqueID))
        {
            ButtonQuickSlot[i].SetData(none, none);
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function bool FindAndRemoveSkillItem(int UniqueID)
{
    local int i;

    i = 4;
    J0x08:
    // End:0x8c [While If]
    if(i < 8)
    {
        // End:0x82
        if(ButtonQuickSlot[i].itemBox.instanceInfo != none && ButtonQuickSlot[i].itemBox.instanceInfo.UniqueSkillID == UniqueID)
        {
            ButtonQuickSlot[i].SetData(none, none);
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x08;
    }
    return false;
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
    // Reference: BTStretchedImageHK'BTTPInventoryQuickSlotHK.mBackgroundImage'
    BackgroundImage=mBackgroundImage
    strButtonChangeName="Change Name"
    strQuickSlot="Quick Slot"
    strUnRegister="Unregistered"
    strOK="OK"
    fbLabelTagTop[0]=(X1=44.0,Y1=136.0,X2=312.0,Y2=155.0)
    fbLabelTagTop[1]=(X1=44.0,Y1=202.0,X2=312.0,Y2=221.0)
    fbLabelTagTop[2]=(X1=44.0,Y1=268.0,X2=312.0,Y2=287.0)
    fbLabelTagTop[3]=(X1=44.0,Y1=334.0,X2=312.0,Y2=353.0)
    fbLabelTagTop[4]=(X1=44.0,Y1=400.0,X2=312.0,Y2=419.0)
    fbLabelTagBottom[0]=(X1=44.0,Y1=161.0,X2=222.0,Y2=181.0)
    fbLabelTagBottom[1]=(X1=44.0,Y1=227.0,X2=222.0,Y2=247.0)
    fbLabelTagBottom[2]=(X1=44.0,Y1=293.0,X2=222.0,Y2=313.0)
    fbLabelTagBottom[3]=(X1=44.0,Y1=359.0,X2=222.0,Y2=379.0)
    fbLabelTagBottom[4]=(X1=44.0,Y1=425.0,X2=222.0,Y2=445.0)
    fbButtonTag[0]=(X1=351.0,Y1=95.0,X2=371.0,Y2=114.0)
    fbButtonTag[1]=(X1=381.0,Y1=95.0,X2=401.0,Y2=114.0)
    fbButtonTag[2]=(X1=411.0,Y1=95.0,X2=431.0,Y2=114.0)
    fbButtonTag[3]=(X1=441.0,Y1=95.0,X2=461.0,Y2=114.0)
    fbButtonTag[4]=(X1=471.0,Y1=95.0,X2=491.0,Y2=114.0)
    fbButtonChangeName[0]=(X1=231.0,Y1=161.0,X2=314.0,Y2=181.0)
    fbButtonChangeName[1]=(X1=231.0,Y1=227.0,X2=314.0,Y2=247.0)
    fbButtonChangeName[2]=(X1=231.0,Y1=293.0,X2=314.0,Y2=313.0)
    fbButtonChangeName[3]=(X1=231.0,Y1=359.0,X2=314.0,Y2=379.0)
    fbButtonChangeName[4]=(X1=231.0,Y1=425.0,X2=314.0,Y2=445.0)
    fbEditChangeName[0]=(X1=37.0,Y1=137.0,X2=314.0,Y2=157.0)
    fbEditChangeName[1]=(X1=37.0,Y1=203.0,X2=314.0,Y2=223.0)
    fbEditChangeName[2]=(X1=37.0,Y1=269.0,X2=314.0,Y2=289.0)
    fbEditChangeName[3]=(X1=37.0,Y1=335.0,X2=314.0,Y2=355.0)
    fbEditChangeName[4]=(X1=37.0,Y1=401.0,X2=314.0,Y2=421.0)
    strButtonQuickSlot[0]="Primary"
    strButtonQuickSlot[1]="Secondary"
    strButtonQuickSlot[2]="Thrown"
    strButtonQuickSlot[3]="Thrown"
    strButtonQuickSlot[4]="Attack Skill"
    strButtonQuickSlot[5]="Passive Skill"
    strLabelWarning="- The durability of weapons used by 2nd Lieutenants (Lv. 16) or higher deteriorates over time, even when not in use."
    fbLabelWarning=(X1=25.0,Y1=708.0,X2=493.0,Y2=735.0)
    OnPreDraw=OnPreDraw
}