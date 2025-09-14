class BTWindowModifyHK extends BTWindowHK
    editinlinenew
    instanced;

const PAINTING_BTN_COUNT = 5;

var bool bSniperRifle;
var FloatBox fbLabelWeapon[2];
var FloatBox fbLabelBackgroundWeapon[2];
var localized string strLabelWeapon[2];
var export editinline BTOwnerDrawImageHK LabelWeapon[2];
var export editinline BTOwnerDrawImageHK LabelBackgroundWeapon[2];
var array<PaintInfo> PaintingInfos;
var int SelectPaintingIdx;
var int PaintingPageNum;
var int PaintingPageCount;
var FloatBox fbButtonPaintingSample[5];
var export editinline BTCheckBoxHK ButtonPaintingSample[5];
var FloatBox fbButtonLeft;
var export editinline BTOwnerDrawCaptionButtonHK ButtonLeft;
var FloatBox fbButtonRight;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRight;
var() automated FloatBox fbSeparator;
var export editinline BTOwnerDrawImageHK Separator;
var FloatBox fbLabel[3];
var localized string strLabelAll[3];
var localized string strLabelSniper[3];
var export editinline BTOwnerDrawImageHK Label[3];
var FloatBox fbLabelStat[3];
var FloatBox fbLabelStatSniper[3];
var export editinline BTLabelArrowStateHK LabelStat[3];
var FloatBox fbACLList;
var export editinline BTAutoImageListHK ACLList;
var export editinline BTModelWeaponHK btWeapon[2];
var BTROModelWeapon roWeapon[2];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x5C [Loop If]
    if(i < 1)
    {
        LabelBackgroundWeapon[i] = NewLabelComponent(fbLabelBackgroundWeapon[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_3ditem_back_0, 0.5000000);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    Separator = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    Separator.bUseAWinPos = true;
    Separator.AWinPos = fbSeparator;
    Separator.CaptionDrawType = 0;
    Separator.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    Separator.InitComponent(MyController, self);
    AppendComponent(Separator);
    i = 0;
    J0xE5:

    // End:0x1C1 [Loop If]
    if(i < 3)
    {
        Label[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        Label[i].bUseAWinPos = true;
        Label[i].AWinPos = fbLabel[i];
        Label[i].Caption = strLabelAll[i];
        Label[i].CaptionDrawType = 0;
        Label[i].SetFontSizeAll(11);
        Label[i].InitComponent(MyController, self);
        AppendComponent(Label[i]);
        i++;
        // [Loop Continue]
        goto J0xE5;
    }
    i = 0;
    J0x1C8:

    // End:0x24C [Loop If]
    if(i < 3)
    {
        LabelStat[i] = BTLabelArrowStateHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelArrowStateHK', fbLabelStat[i]));
        LabelStat[i].CaptionDrawType = 4;
        LabelStat[i].SetFontSizeAll(11);
        LabelStat[i].SetDefaultFontColor();
        i++;
        // [Loop Continue]
        goto J0x1C8;
    }
    ACLList = new Class'GUIWarfareControls_Decompressed.BTAutoImageListHK';
    ACLList.bUseAWinPos = true;
    ACLList.AWinPos = fbACLList;
    ACLList.InitComponent(MyController, self);
    AppendComponent(ACLList);
    ACLList.SetItemSize(158 + 53, 87);
    ACLList.SetItemCountPerPage(4, 1);
    ACLList.BackgroundImage.BackgroundImage.Image = none;
    ACLList.ImageList.__OnChange__Delegate = ACLList_OnChange;
    i = 0;
    J0x30B:

    // End:0x423 [Loop If]
    if(i < 5)
    {
        ButtonPaintingSample[i] = new Class'GUIWarfareControls_Decompressed.BTCheckBoxHK';
        ButtonPaintingSample[i].Caption = "";
        ButtonPaintingSample[i].PaddingSize = int(fbButtonPaintingSample[i].X2 - fbButtonPaintingSample[i].X1);
        ButtonPaintingSample[i].AWinPos = fbButtonPaintingSample[i];
        ButtonPaintingSample[i].SetDefaultPaintingButtonImage();
        ButtonPaintingSample[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.item_item_CF_blank_n;
        ButtonPaintingSample[i].ButtonID = i;
        ButtonPaintingSample[i].__OnClick__Delegate = ButtonGroups_OnClick;
        AppendComponent(ButtonPaintingSample[i]);
        i++;
        // [Loop Continue]
        goto J0x30B;
    }
    ButtonLeft = NewButtonComponent(fbButtonLeft);
    ButtonLeft.SetDefaultLArrowButtonImage();
    ButtonLeft.__OnClick__Delegate = ButtonLeftPage_OnClick;
    ButtonRight = NewButtonComponent(fbButtonRight);
    ButtonRight.SetDefaultRArrowButtonImage();
    ButtonRight.__OnClick__Delegate = ButtonRightPage_OnClick;
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
    i = 0;
    J0x4BC:

    // End:0x5AE [Loop If]
    if(i < 1)
    {
        btWeapon[i] = BTModelWeaponHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTModelWeaponHK', fbLabelBackgroundWeapon[i], 0.9900000));
        btWeapon[i].bAcceptsInput = true;
        roWeapon[i] = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls_Decompressed.BTROModelWeapon');
        roWeapon[i].Init();
        roWeapon[i].AWinPos = btWeapon[i].AWinPos;
        btWeapon[i].cModel = roWeapon[i];
        i++;
        // [Loop Continue]
        goto J0x4BC;
    }
    //return;    
}

function ACLList_OnChange(GUIComponent Sender)
{
    local int i, UI_Durability;
    local PartInfo Pi;
    local wItemBoxHK ItemInfo;

    // End:0x16
    if(ACLList.LastSelectedItemIndex < 0)
    {
        return;
    }
    ItemInfo = BTRORadioItemBoxHK(ACLList.DataList[ACLList.LastSelectedItemIndex]).itemBox.ItemInfo;
    Pi = ItemInfo.PartGroupList[ACLList.LastSelectedItemIndex];
    UI_Durability = Pi.UI_Durability + PaintingInfos[SelectPaintingIdx].UI_Durability;
    // End:0x126
    if(bSniperRifle)
    {
        LabelStat[0].Caption = Pi.UI_Zoom1;
        LabelStat[0].SetData(0);
        LabelStat[1].Caption = Pi.UI_Zoom2;
        LabelStat[1].SetData(0);
        LabelStat[2].Caption = "";
        LabelStat[2].SetData(UI_Durability);        
    }
    else
    {
        LabelStat[0].Caption = "";
        LabelStat[0].SetData(Pi.UI_DamageRange);
        LabelStat[1].Caption = "";
        LabelStat[1].SetData(Pi.ui_firesound);
        LabelStat[2].Caption = "";
        LabelStat[2].SetData(UI_Durability);
    }
    i = 0;
    J0x1B4:

    // End:0x23C [Loop If]
    if(i < ACLList.DataList.Length)
    {
        // End:0x20D
        if(ACLList.LastSelectedItemIndex == i)
        {
            BTRORadioItemBoxHK(ACLList.DataList[i]).bSelect = true;
            // [Explicit Continue]
            goto J0x232;
        }
        BTRORadioItemBoxHK(ACLList.DataList[i]).bSelect = false;
        J0x232:

        i++;
        // [Loop Continue]
        goto J0x1B4;
    }
    roWeapon[0].ChangeWeapon(ItemInfo.ItemID, Pi.PartID, GetPaintingItemID());
    roWeapon[0].SetPositionUI(Pi.display_3d_x, Pi.display_3d_y, Pi.display_3d_z);
    roWeapon[0].SetRotationUI(Pi.display_3d_rot_y);
    SetPaintingSempleButton(SelectPaintingIdx);
    //return;    
}

function SetData(wItemBoxHK ib, wItemBoxInstanceHK ibi)
{
    local BTRORadioItemBoxHK ro;
    local wItemBoxHK ItemInfo;
    local int i, LastSelected;
    local wItemBoxInstanceHK instanceInfo;

    // End:0xE8
    if(ib.ItemType == 2)
    {
        bSniperRifle = true;
        Label[0].Caption = strLabelSniper[0];
        Label[1].Caption = strLabelSniper[1];
        Label[2].Caption = strLabelSniper[2];
        LabelStat[0].AWinPos = fbLabelStatSniper[0];
        LabelStat[1].AWinPos = fbLabelStatSniper[1];
        LabelStat[2].AWinPos = fbLabelStatSniper[2];
        LabelStat[0].ApplyAWinPos();
        LabelStat[1].ApplyAWinPos();
        LabelStat[2].ApplyAWinPos();        
    }
    else
    {
        bSniperRifle = false;
        Label[0].Caption = strLabelAll[0];
        Label[1].Caption = strLabelAll[1];
        Label[2].Caption = strLabelAll[2];
        LabelStat[0].AWinPos = fbLabelStat[0];
        LabelStat[1].AWinPos = fbLabelStat[1];
        LabelStat[2].AWinPos = fbLabelStat[2];
        LabelStat[0].ApplyAWinPos();
        LabelStat[1].ApplyAWinPos();
        LabelStat[2].ApplyAWinPos();
    }
    ACLList.RemoveAll();
    i = 0;
    J0x1CE:

    // End:0x333 [Loop If]
    if(i < ib.PartGroupList.Length)
    {
        ro = new Class'GUIWarfareControls_Decompressed.BTRORadioItemBoxHK';
        ro.Init();
        ro.itemBox.ItemInfo = ib;
        instanceInfo = new Class'Engine.wItemBoxInstanceHK';
        instanceInfo.PartID = ib.PartGroupList[i].PartID;
        instanceInfo.UniqueID = ibi.UniqueID;
        instanceInfo.PaintID = 0;
        // End:0x2B2
        if(ibi.PartID == instanceInfo.PartID)
        {
            LastSelected = i;
        }
        ro.itemBox.instanceInfo = instanceInfo;
        ro.itemBox.bDisplayPart = true;
        ro.itemBox.Update();
        ro.PController = Controller;
        ACLList.AddRenderObject(ro);
        i++;
        // [Loop Continue]
        goto J0x1CE;
    }
    ACLList.ImageList.LastSelected = LastSelected;
    ACLList.LastSelectedItemIndex = LastSelected;
    PaintingInfos = ib.PaintGroupList;
    PaintingPageCount = PaintingInfos.Length / 5;
    PaintingPageNum = 0;
    i = 0;
    J0x396:

    // End:0x3E1 [Loop If]
    if(i < PaintingInfos.Length)
    {
        // End:0x3D7
        if(ibi.PaintID == PaintingInfos[i].PaintingItemID)
        {
            SelectPaintingIdx = i;
            // [Explicit Break]
            goto J0x3E1;
        }
        ++i;
        // [Loop Continue]
        goto J0x396;
    }
    J0x3E1:

    SetPaintingSempleButton(SelectPaintingIdx);
    roWeapon[0].ChangeWeapon(ib.ItemID, ibi.PartID, ibi.PaintID);
    ACLList_OnChange(none);
    //return;    
}

function Internal_OnClose(optional bool bCancelled)
{
    roWeapon[0].EndModel();
    //return;    
}

function bool ButtonLeftPage_OnClick(GUIComponent Sender)
{
    local int PageNum;

    PageNum = PaintingPageNum - 1;
    // End:0x1B
    if(PageNum < 0)
    {
        return true;
    }
    --PaintingPageNum;
    SetPaintingSempleButton(SelectPaintingIdx);
    roWeapon[0].SetWeaponPainting(GetPaintingItemID());
    return true;
    //return;    
}

function bool ButtonRightPage_OnClick(GUIComponent Sender)
{
    local int PageNum;

    PageNum = PaintingPageNum + 1;
    // End:0x1F
    if(PageNum > PaintingPageCount)
    {
        return true;
    }
    ++PaintingPageNum;
    SetPaintingSempleButton(SelectPaintingIdx);
    roWeapon[0].SetWeaponPainting(GetPaintingItemID());
    return true;
    //return;    
}

function SetPaintingSempleButton(int SelectedIdx)
{
    local int i, PaintingInfoNum, SelectedPage, SelectBtnIdx;

    i = 0;
    J0x07:

    // End:0xC1 [Loop If]
    if(i < 5)
    {
        PaintingInfoNum = i + (PaintingPageNum * 5);
        // End:0x8B
        if(PaintingInfoNum < PaintingInfos.Length)
        {
            ButtonPaintingSample[i].Show();
            ButtonPaintingSample[i].BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(84, 84, 28, PaintingInfos[PaintingInfoNum].UI_Icon);            
        }
        else
        {
            ButtonPaintingSample[i].Hide();
        }
        ButtonPaintingSample[i].bSelect = false;
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    SelectedPage = SelectedIdx / 5;
    SelectBtnIdx = int(float(SelectedIdx) % float(5));
    // End:0x119
    if((PaintingInfos.Length > 0) && PaintingPageNum == SelectedPage)
    {
        ButtonPaintingSample[SelectBtnIdx].bSelect = true;
    }
    //return;    
}

function bool ButtonGroups_OnClick(GUIComponent Sender)
{
    local int i, UI_Durability;
    local PartInfo Pi;
    local wItemBoxHK ItemInfo;

    SelectPaintingIdx = BTOwnerDrawCaptionButtonHK(Sender).ButtonID + (5 * PaintingPageNum);
    roWeapon[0].SetWeaponPainting(GetPaintingItemID());
    i = 0;
    J0x42:

    // End:0x6F [Loop If]
    if(i < 5)
    {
        ButtonPaintingSample[i].bSelect = false;
        ++i;
        // [Loop Continue]
        goto J0x42;
    }
    BTCheckBoxHK(Sender).bSelect = true;
    // End:0x107
    if(ACLList.LastSelectedItemIndex >= 0)
    {
        ItemInfo = BTRORadioItemBoxHK(ACLList.DataList[ACLList.LastSelectedItemIndex]).itemBox.ItemInfo;
        Pi = ItemInfo.PartGroupList[ACLList.LastSelectedItemIndex];
        UI_Durability += Pi.UI_Durability;
    }
    UI_Durability += PaintingInfos[SelectPaintingIdx].UI_Durability;
    LabelStat[2].SetData(UI_Durability);
    return true;
    //return;    
}

function int GetPaintingID()
{
    return PaintingInfos[SelectPaintingIdx].PaintingID;
    //return;    
}

function int GetPaintingItemID()
{
    return PaintingInfos[SelectPaintingIdx].PaintingItemID;
    //return;    
}

defaultproperties
{
    fbLabelWeapon[0]=(X1=130.0000000,Y1=265.0000000,X2=468.0000000,Y2=357.0000000)
    fbLabelWeapon[1]=(X1=477.0000000,Y1=265.0000000,X2=661.0000000,Y2=357.0000000)
    fbLabelBackgroundWeapon=(X1=130.0000000,Y1=219.0000000,X2=661.0000000,Y2=403.0000000)
    fbButtonPaintingSample[0]=(X1=176.0000000,Y1=446.0000000,X2=261.0000000,Y2=532.0000000)
    fbButtonPaintingSample[1]=(X1=262.0000000,Y1=446.0000000,X2=348.0000000,Y2=532.0000000)
    fbButtonPaintingSample[2]=(X1=349.0000000,Y1=446.0000000,X2=435.0000000,Y2=532.0000000)
    fbButtonPaintingSample[3]=(X1=436.0000000,Y1=446.0000000,X2=522.0000000,Y2=532.0000000)
    fbButtonPaintingSample[4]=(X1=523.0000000,Y1=446.0000000,X2=609.0000000,Y2=532.0000000)
    fbButtonLeft=(X1=133.0000000,Y1=460.0000000,X2=160.0000000,Y2=521.0000000)
    fbButtonRight=(X1=625.0000000,Y1=460.0000000,X2=652.0000000,Y2=521.0000000)
    fbSeparator=(X1=670.0000000,Y1=202.0000000,X2=673.0000000,Y2=549.0000000)
    fbLabel[0]=(X1=178.0000000,Y1=416.0000000,X2=362.0000000,Y2=440.0000000)
    fbLabel[1]=(X1=362.0000000,Y1=416.0000000,X2=512.0000000,Y2=440.0000000)
    fbLabel[2]=(X1=512.0000000,Y1=416.0000000,X2=650.0000000,Y2=440.0000000)
    strLabelAll[0]="???/???"
    strLabelAll[1]="???"
    strLabelAll[2]="??? ??"
    strLabelSniper[0]="1? ???"
    strLabelSniper[1]="2? ???"
    strLabelSniper[2]="??? ??"
    fbLabelStat[0]=(X1=245.0000000,Y1=414.0000000,X2=327.0000000,Y2=438.0000000)
    fbLabelStat[1]=(X1=379.0000000,Y1=414.0000000,X2=482.0000000,Y2=438.0000000)
    fbLabelStat[2]=(X1=580.0000000,Y1=414.0000000,X2=637.0000000,Y2=438.0000000)
    fbLabelStatSniper[0]=(X1=233.0000000,Y1=413.0000000,X2=315.0000000,Y2=437.0000000)
    fbLabelStatSniper[1]=(X1=402.0000000,Y1=413.0000000,X2=505.0000000,Y2=437.0000000)
    fbLabelStatSniper[2]=(X1=580.0000000,Y1=414.0000000,X2=637.0000000,Y2=438.0000000)
    fbACLList=(X1=673.0000000,Y1=202.0000000,X2=898.0000000,Y2=549.0000000)
    fbBackgroundImage=(X1=99.0000000,Y1=148.0000000,X2=926.0000000,Y2=620.0000000)
    fbTopLine=(X1=119.0000000,Y1=168.0000000,X2=906.0000000,Y2=195.0000000)
    fbBottomLine=(X1=119.0000000,Y1=556.0000000,X2=906.0000000,Y2=600.0000000)
    fbButtonOK=(X1=391.0000000,Y1=562.0000000,X2=511.0000000,Y2=595.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=562.0000000,X2=635.0000000,Y2=595.0000000)
    strTitle="??"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bUseChangeAlpha=true
    bUseTranslate=false
}