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

    // End:0x11D [Loop If]
    if(i < 6)
    {
        ButtonQuickSlot[i] = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
        ButtonQuickSlot[i].bUseAWinPos = true;
        ButtonQuickSlot[i].AWinPos = fbButtonQuickSlot[i];
        ButtonQuickSlot[i].DefaultSlotName[0] = strButtonQuickSlot[i];
        ButtonQuickSlot[i].DefaultSlotName[1] = strUnRegister;
        ButtonQuickSlot[i].InitComponent(MyController, self);
        AppendComponent(ButtonQuickSlot[i]);
        ButtonQuickSlot[i].itemBox.ChangeState(0);
        InvenGroup.AddButton(ButtonQuickSlot[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    i = 0;
    J0x124:

    // End:0x643 [Loop If]
    if(i < 5)
    {
        LabelTagTop[i] = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbLabelTagTop[i], 0.9000000));
        LabelTagTop[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
        LabelTagTop[i].Caption = strQuickSlot @ string(i);
        LabelTagTop[i].SetFontSizeAll(12);
        LabelTagTop[i].SetFontDrawType(3);
        LabelTagBottom[i] = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbLabelTagBottom[i], 0.9000000));
        LabelTagBottom[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
        LabelTagBottom[i].SetFontSizeAll(12);
        LabelTagBottom[i].SetFontDrawType(3);
        ButtonTag[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        ButtonTag[i].bUseAWinPos = true;
        ButtonTag[i].AWinPos = fbButtonTag[i];
        ButtonTag[i].SetDefaultQuickSlotButtonImage();
        ButtonTag[i].SetDefaultFontColor();
        ButtonTag[i].SetFontSizeAll(12);
        ButtonTag[i].buttonImage[2] = ButtonTag[i].buttonImage[1];
        ButtonTag[i].RenderWeight = 0.5000000;
        ButtonTag[i].Caption = "";
        ButtonTag[i].CaptionDrawType = 3;
        ButtonTag[i].CaptionPadding[0] = 16;
        ButtonTag[i].bSelectHighlight = true;
        ButtonTag[i].InitComponent(MyController, self);
        AppendComponent(ButtonTag[i]);
        QSButtonGroup.AddButton(ButtonTag[i]);
        ButtonTag[i].__OnClick__Delegate = ButtonTag_OnClick;
        ButtonChangeName[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        ButtonChangeName[i].bUseAWinPos = true;
        ButtonChangeName[i].AWinPos = fbButtonChangeName[i];
        ButtonChangeName[i].RenderWeight = 0.6000000;
        ButtonChangeName[i].Caption = strButtonChangeName;
        ButtonChangeName[i].SetDefaultMButtonImage();
        ButtonChangeName[i].SetDefaultFontColor();
        ButtonChangeName[i].SetFontSizeAll(9);
        ButtonChangeName[i].InitComponent(MyController, self);
        AppendComponent(ButtonChangeName[i]);
        QSNameGroup.AddButton(ButtonChangeName[i]);
        ButtonChangeName[i].__OnClick__Delegate = ButtonChangeName_OnClick;
        EditChangeName[i] = new Class'GUIWarfareControls_Decompressed.BTEditBoxHK';
        EditChangeName[i].bUseAWinPos = true;
        EditChangeName[i].AWinPos = fbEditChangeName[i];
        EditChangeName[i].RenderWeight = 0.7000000;
        EditChangeName[i].__OnChat__Delegate = EditChangeName_OnEnter;
        EditChangeName[i].__OnDeActivate__Delegate = EditChangeName_OnDeActive;
        EditChangeName[i].bgImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
        EditChangeName[i].ButtonID = i;
        EditChangeName[i].InitComponent(MyController, self);
        AppendComponent(EditChangeName[i]);
        EditChangeName[i].SetVisibility(false);
        EditChangeName[i].bAcceptsInput = false;
        i++;
        // [Loop Continue]
        goto J0x124;
    }
    TPTemp = new Class'GUIWarfareControls_Decompressed.BTTPChatHK';
    QSButtonGroup.SelectButton(0);
    ButtonTag[QSButtonGroup.selectIndex].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_quik_chang;
    i = 0;
    J0x697:

    // End:0x6C4 [Loop If]
    if(i < 5)
    {
        EditChangeName[i].MaxTextStrNum = 15;
        i++;
        // [Loop Continue]
        goto J0x697;
    }
    LabelWarning = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbLabelWarning));
    LabelWarning.CaptionDrawType = 3;
    LabelWarning.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning());
    LabelWarning.Caption = strLabelWarning;
    //return;    
}

function ShowWeaponTransparent(BTROItemBoxHK MainWeapon, BTROItemBoxHK SubWeapon, BTROItemBoxHK ThrowWeapon1, BTROItemBoxHK ThrowWeapon2, optional BTROItemBoxHK Knife)
{
    MainWeapon.Update();
    SubWeapon.Update();
    ThrowWeapon1.Update();
    ThrowWeapon2.Update();
    ButtonQuickSlot[0].DefaultSlotImage = MainWeapon.ItemImage;
    ButtonQuickSlot[0].DefaultSlotModulate.W = 0.4000000;
    ButtonQuickSlot[0].DefaultSlotItemID = MainWeapon.instanceInfo.ItemID;
    ButtonQuickSlot[0].DefaultSlotUniqueID = MainWeapon.instanceInfo.UniqueID;
    ButtonQuickSlot[1].DefaultSlotImage = SubWeapon.ItemImage;
    ButtonQuickSlot[1].DefaultSlotModulate.W = 0.4000000;
    ButtonQuickSlot[1].DefaultSlotItemID = SubWeapon.instanceInfo.ItemID;
    ButtonQuickSlot[1].DefaultSlotUniqueID = SubWeapon.instanceInfo.UniqueID;
    // End:0x1D5
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
    // End:0x2E8
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
    // End:0x411
    if(Knife.IsEmpty())
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
    //return;    
}

function ShowSkillTransparent(BTROItemBoxHK Skill_1, BTROItemBoxHK Skill_2, BTROItemBoxHK Skill_3, BTROItemBoxHK Skill_4)
{
    Skill_1.Update();
    Skill_2.Update();
    // End:0x6F
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
    // End:0xFC
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
    if(i < 5)
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
    if(i < 5)
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

function bool ButtonTag_OnClick(GUIComponent Sender)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    QSButtonGroup.SelectButton(btn.ButtonID);
    FocusFirst(ButtonChangeName[QSNameGroup.GetSelectIndex()]);
    SetDefaultButtonImage();
    ButtonTag[QSButtonGroup.selectIndex].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_quik_chang;
    i = 0;
    J0x83:

    // End:0xEC [Loop If]
    if(i < 8)
    {
        ButtonQuickSlot[i].SetData(SaveQS[btn.ButtonID].ItemInfo[i], SaveQS[btn.ButtonID].instanceInfo[i]);
        i++;
        // [Loop Continue]
        goto J0x83;
    }
    return true;
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
    if(i < 5)
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

    // End:0x4E [Loop If]
    if(i < 5)
    {
        // End:0x44
        if(EditChangeName[i].bAcceptsInput == false)
        {
            EditChangeName[i].SetVisibility(false);
        }
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

    i = 4;
    J0x08:

    // End:0x8C [Loop If]
    if(i < 8)
    {
        // End:0x82
        if((ButtonQuickSlot[i].itemBox.instanceInfo != none) && ButtonQuickSlot[i].itemBox.instanceInfo.UniqueSkillID == UniqueID)
        {
            ButtonQuickSlot[i].SetData(none, none);
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x08;
    }
    return false;
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
    fbButtonTag[0]=(X1=351.0000000,Y1=95.0000000,X2=371.0000000,Y2=114.0000000)
    fbButtonTag[1]=(X1=381.0000000,Y1=95.0000000,X2=401.0000000,Y2=114.0000000)
    fbButtonTag[2]=(X1=411.0000000,Y1=95.0000000,X2=431.0000000,Y2=114.0000000)
    fbButtonTag[3]=(X1=441.0000000,Y1=95.0000000,X2=461.0000000,Y2=114.0000000)
    fbButtonTag[4]=(X1=471.0000000,Y1=95.0000000,X2=491.0000000,Y2=114.0000000)
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
    strButtonQuickSlot[0]="Primary"
    strButtonQuickSlot[1]="Secondary"
    strButtonQuickSlot[2]="Thrown"
    strButtonQuickSlot[3]="Thrown"
    strButtonQuickSlot[4]="Attack Skill"
    strButtonQuickSlot[5]="Passive Skill"
    strLabelWarning="- The durability of weapons used by 2nd Lieutenants (Lv. 16) or higher deteriorates over time, even when not in use."
    fbLabelWarning=(X1=25.0000000,Y1=708.0000000,X2=493.0000000,Y2=735.0000000)
    OnPreDraw=BTTPInventoryQuickSlotHK.OnPreDraw
}