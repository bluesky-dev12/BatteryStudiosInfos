/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowModifyHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:60
 *	Functions:32
 *
 *******************************************************************************/
class BTWindowModifyHK extends BTWindowHK
    dependson(BTWindowErrorDefineHK)
    dependson(BTWindowCustomConfirm)
    dependson(BTAutoImageListHK)
    dependson(BTRORadioItemBoxHK)
    dependson(BTLabelArrowStateHK)
    dependson(BTItemCommonInfoHK)
    dependson(BTModelWeaponHK)
    editinlinenew
    instanced;

const PAINTING_BTN_COUNT = 5;

var bool bSniperRifle;
var FloatBox fbLabelBackgroundWeapon[2];
var localized string strLabelWeapon[2];
var export editinline BTOwnerDrawImageHK LabelWeapon[2];
var array<PaintInfo> PaintingInfos;
var int SelectPaintingIdx;
var int PaintingPageNum;
var int PaintingPageCount;
var FloatBox fbLabel[3];
var localized string strLabelAll[3];
var localized string strLabelSniper[3];
var export editinline BTOwnerDrawImageHK Label[3];
var export editinline BTOwnerDrawImageHK InvenBoxLabel[5];
var export editinline BTOwnerDrawImageHK WeaponNameLabel;
var export editinline BTMultiLineEditBoxHK WeaponDescript;
var FloatBox fbLabelStat[3];
var FloatBox fbLabelStatSniper[3];
var export editinline BTLabelArrowStateHK LabelStat[3];
var FloatBox fbACLList_Sight;
var export editinline BTAutoImageListHK ACLList_Sight;
var FloatBox fbACLList_Silencer;
var export editinline BTAutoImageListHK ACLList_Silencer;
var FloatBox fbACLList_Barrel;
var export editinline BTAutoImageListHK ACLList_Barrel;
var FloatBox fbACLList_Gunstock;
var export editinline BTAutoImageListHK ACLList_Gunstock;
var int SelectedItemID;
var int SelectedPaintingID;
var BtrDouble SelectedItemUniqueID;
var int SelectedUnionedPartID;
var int OriginalPaintingItemID;
var int OriginalPaintingID;
var int OriginalUnionedPartID;
var Vector vDisplay_3d;
var float fDisplay_rot_y;
var BTItemCommonInfoHK MyData;
var export editinline BTModelWeaponHK btWeapon[2];
var BTROModelWeapon roWeapon[2];
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify ButtonGroups CustomItemButtonGroup;
var export editinline BTItemBoxButtonHK btnSelectedCustomItems[5];
var export editinline BTOwnerDrawCaptionButtonHK btnRemoveOrRollback[5];
var localized string strRemove;
var localized string strRollback;
var export editinline BTOwnerDrawCaptionButtonHK btnInit;
var FloatBox fbButtonInit;
var localized string strInit;
var localized string strFilter[6];
var export editinline BTOwnerDrawCaptionButtonHK FilterButton[6];
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify TabControlMocker TabControl;
var byte FilterTabBtnIdx;
var FloatBox fbACLList_All;
var export editinline BTAutoImageListHK ACLList_All;
var array<BTROItemBoxHK> DataPool;
var export editinline BTItemStateBoxButtonHK ItemStateView;
var wItemBoxHK CurrentItemInfo;
var wItemBoxInstanceHK CurrentInstanceInfo;
var wItemBoxHK WantedItemInfo;
var wItemBoxInstanceHK WantedInstanceInfo;
var int IsEnableRemove[5];
var export editinline BTOwnerDrawImageHK LockImage[3];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i, iWidthBtn, LockStartIdx;
    local FloatBox fbStartItemBtns;

    super.InitComponent(MyController, myOwner);
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.ItemRemodel_bgdeco;
    TopLine.CaptionDrawType = 4;
    TopLine.SetFontSizeAll(11);
    TopLine.SetFontColorAll(class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    TopLine.BackgroundImage = class'BTUIResourcePoolHK'.default.empty;
    btnInit = NewButtonComponent(fbButtonInit, 0.950);
    btnInit.SetDefaultOptionInitButtonImage();
    btnInit.Caption = strInit;
    btnInit.SetFontSizeAll(9);
    btnInit.CaptionDrawType = 4;
    btnInit.__OnClick__Delegate = ButtonInit_OnClick;
    AppendComponent(btnInit);
    ItemStateView = new class'BTItemStateBoxButtonHK';
    ItemStateView.bUseAWinPos = true;
    fbStartItemBtns.X1 = 709.0;
    fbStartItemBtns.Y1 = 128.0;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(128);
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(114);
    ItemStateView.AWinPos = fbStartItemBtns;
    ItemStateView.GaugeBGImage = class'BTUIResourcePoolHK'.default.Inven_gauge_bg;
    ItemStateView.InitComponent(Controller, self);
    AppendComponent(ItemStateView);
    iWidthBtn = 165;
    fbStartItemBtns.X1 = 80.0;
    fbStartItemBtns.Y1 = 309.0;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(iWidthBtn);
    fbStartItemBtns.Y2 = 400.0;
    i = 0;
    J0x238:
    // End:0x754 [While If]
    if(i < 5)
    {
        btnSelectedCustomItems[i] = BTItemBoxButtonHK(NewComponent(new class'BTItemBoxButtonHK', fbStartItemBtns, 0.90));
        btnSelectedCustomItems[i].bNeverFocus = true;
        btnSelectedCustomItems[i].itemBox.ChangeState(21);
        LockStartIdx = 2;
        // End:0x436
        if(i >= LockStartIdx)
        {
            LockImage[i - LockStartIdx] = new class'BTOwnerDrawImageHK';
            LockImage[i - LockStartIdx].BackgroundImage = class'BTUIResourcePoolHK'.default.Inven_Skill_Lock;
            LockImage[i - LockStartIdx].bUseAWinPos = true;
            LockImage[i - LockStartIdx].AWinPos.X1 = fbStartItemBtns.X1 + float(10);
            LockImage[i - LockStartIdx].AWinPos.Y1 = fbStartItemBtns.Y1 + float(10);
            LockImage[i - LockStartIdx].AWinPos.X2 = fbStartItemBtns.X2 - float(10);
            LockImage[i - LockStartIdx].AWinPos.Y2 = fbStartItemBtns.Y2 - float(10);
            LockImage[i - LockStartIdx].ApplyAWinPos();
            LockImage[i - LockStartIdx].CaptionDrawType = 4;
            AppendComponent(LockImage[i - LockStartIdx]);
        }
        btnRemoveOrRollback[i] = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(fbStartItemBtns.X1 + float(92), fbStartItemBtns.Y1 + float(78), fbStartItemBtns.X1 + float(92) + float(69), fbStartItemBtns.Y1 + float(78) + float(18)), 0.950);
        fbStartItemBtns.X1 += float(iWidthBtn + 10);
        fbStartItemBtns.X2 += float(iWidthBtn + 10);
        CustomItemButtonGroup.AddButton(btnSelectedCustomItems[i]);
        btnRemoveOrRollback[i].Caption = strRemove;
        btnRemoveOrRollback[i].CaptionDrawType = 4;
        btnRemoveOrRollback[i].SetFontSizeAll(9);
        btnRemoveOrRollback[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.ItemRemodel_Btn_Rollback_n;
        btnRemoveOrRollback[i].buttonImage[1] = class'BTUIResourcePoolHK'.default.ItemRemodel_Btn_Rollback_on;
        btnRemoveOrRollback[i].buttonImage[2] = class'BTUIResourcePoolHK'.default.ItemRemodel_Btn_Rollback_on;
        btnRemoveOrRollback[i].buttonImage[3] = class'BTUIResourcePoolHK'.default.ItemRemodel_Btn_Rollback_cli;
        btnRemoveOrRollback[i].buttonImage[4] = class'BTUIResourcePoolHK'.default.ItemRemodel_Btn_Rollback_cli;
        switch(i)
        {
            // End:0x636
            case 0:
                btnSelectedCustomItems[i].__OnClick__Delegate = CustomPaintPartsButton_OnClick;
                btnRemoveOrRollback[i].__OnClick__Delegate = PaintRemoveButton_OnClick;
                // End:0x728
                break;
            // End:0x671
            case 1:
                btnSelectedCustomItems[i].__OnClick__Delegate = CustomSightPartsButton_OnClick;
                btnRemoveOrRollback[i].__OnClick__Delegate = SightRemoveButton_OnClick;
                // End:0x728
                break;
            // End:0x6ad
            case 2:
                btnSelectedCustomItems[i].__OnClick__Delegate = CustomSilencerPartsButton_OnClick;
                btnRemoveOrRollback[i].__OnClick__Delegate = SilencerRemoveButton_OnClick;
                // End:0x728
                break;
            // End:0x6e9
            case 3:
                btnSelectedCustomItems[i].__OnClick__Delegate = CustomBarrelPartsButton_OnClick;
                btnRemoveOrRollback[i].__OnClick__Delegate = BarrelRemoveButton_OnClick;
                // End:0x728
                break;
            // End:0x725
            case 4:
                btnSelectedCustomItems[i].__OnClick__Delegate = CustomGunstockPartsButton_OnClick;
                btnRemoveOrRollback[i].__OnClick__Delegate = GunstockRemoveButton_OnClick;
                // End:0x728
                break;
            // End:0xffff
            default:
                AppendComponent(btnSelectedCustomItems[i]);
                AppendComponent(btnRemoveOrRollback[i]);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x238;
            }
            ACLList_All = new class'BTAutoImageListHK';
            ACLList_All.bUseAWinPos = true;
            ACLList_All.AWinPos = fbACLList_All;
            ACLList_All.InitComponent(MyController, self);
            ACLList_All.SetItemSize(169, 86);
            ACLList_All.SetItemCountPerPage(2, 5);
            ACLList_All.BackgroundImage.BackgroundImage.Image = none;
            ACLList_All.ImageList.__OnChange__Delegate = ACLList_OnChange;
            ACLList_All.bShowSkillToolTip = true;
            AppendComponent(ACLList_All);
            iWidthBtn = 76;
            fbStartItemBtns.X1 = 72.0;
            fbStartItemBtns.Y1 = 439.0;
            fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(iWidthBtn);
            fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(28);
            i = 0;
            J0x882:
            // End:0xabe [While If]
            if(i < 6)
            {
                FilterButton[i] = new class'BTOwnerDrawCaptionButtonHK';
                FilterButton[i].bUseAWinPos = true;
                FilterButton[i].AWinPos = fbStartItemBtns;
                FilterButton[i].RenderWeight = 0.90;
                FilterButton[i].Caption = strFilter[i];
                FilterButton[i].CaptionDrawType = 4;
                FilterButton[i].CaptionAlign = 2;
                FilterButton[i].buttonImage[0] = class'BTUIResourcePoolHK'.default.Inven_sub_btn_n;
                FilterButton[i].buttonImage[1] = class'BTUIResourcePoolHK'.default.Inven_sub_btn_on;
                FilterButton[i].buttonImage[2] = class'BTUIResourcePoolHK'.default.Inven_sub_btn_Focus;
                FilterButton[i].buttonImage[3] = class'BTUIResourcePoolHK'.default.Inven_sub_btn_cli;
                FilterButton[i].buttonImage[4] = class'BTUIResourcePoolHK'.default.Inven_sub_btn_Focus;
                FilterButton[i].bIsDisableHover = true;
                FilterButton[i].SetTabButtonFontColor();
                AppendComponent(FilterButton[i]);
                TabControl.BindTabButtonAndPanel(FilterButton[i], ACLList_All);
                FilterButton[i].ButtonID = i;
                FilterButton[i].__OnClick__Delegate = FilterButton_OnClick;
                fbStartItemBtns.X1 += float(iWidthBtn + 1);
                fbStartItemBtns.X2 += float(iWidthBtn + 1);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x882;
            }
            TabControl.SetVisiblePanel(0);
            i = 0;
            J0xad5:
            // End:0xc33 [While If]
            if(i < 5)
            {
                InvenBoxLabel[i] = new class'BTOwnerDrawImageHK';
                InvenBoxLabel[i].bUseAWinPos = true;
                InvenBoxLabel[i].AWinPos.X1 = 82.0 + float(175 * i);
                InvenBoxLabel[i].AWinPos.Y1 = 401.0;
                InvenBoxLabel[i].AWinPos.X2 = 171.0 + float(175 * i);
                InvenBoxLabel[i].AWinPos.Y2 = 414.0;
                InvenBoxLabel[i].Caption = strFilter[i + 1];
                InvenBoxLabel[i].CaptionDrawType = 3;
                InvenBoxLabel[i].SetFontSizeAll(9);
                InvenBoxLabel[i].SetFontColorAll(class'BTUIColorPoolHK'.static.DefaultWhite());
                AppendComponent(InvenBoxLabel[i]);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xad5;
            }
            WeaponDescript = new class'BTMultiLineEditBoxHK';
            WeaponDescript.bUseAWinPos = true;
            WeaponDescript.AWinPos.X1 = 625.0;
            WeaponDescript.AWinPos.Y1 = 251.0;
            WeaponDescript.AWinPos.X2 = 955.0;
            WeaponDescript.AWinPos.Y2 = 280.0;
            WeaponDescript.InitComponent(MyController, self);
            WeaponDescript.SetFontSizeAll(8);
            WeaponDescript.SetFontColor(byte(255), byte(255), byte(255), byte(255));
            WeaponDescript.SetVisibleLineCount(3);
            WeaponDescript.bReadOnly = true;
            WeaponDescript.TextStr = "-";
            AppendComponent(WeaponDescript);
            WeaponNameLabel = new class'BTOwnerDrawImageHK';
            WeaponNameLabel.bUseAWinPos = true;
            WeaponNameLabel.AWinPos.X1 = 100.0;
            WeaponNameLabel.AWinPos.Y1 = 125.0;
            WeaponNameLabel.AWinPos.X2 = 529.0;
            WeaponNameLabel.AWinPos.Y2 = 140.0;
            WeaponNameLabel.CaptionDrawType = 3;
            WeaponNameLabel.SetFontSizeAll(11);
            WeaponNameLabel.SetFontColorAll(class'Canvas'.static.MakeColor(byte(255), 198, 0, byte(255)));
            WeaponNameLabel.Caption = "-";
            AppendComponent(WeaponNameLabel);
            MyData = new class'BTItemCommonInfoHK';
            UpdateDefaultWindow();
            i = 0;
            J0xe44:
            // End:0xf36 [While If]
            if(i < 1)
            {
                btWeapon[i] = BTModelWeaponHK(NewComponent(new class'BTModelWeaponHK', fbLabelBackgroundWeapon[i], 0.990));
                btWeapon[i].bAcceptsInput = true;
                roWeapon[i] = Controller.ViewportOwner.Actor.Level.Spawn(class'BTROModelWeapon');
                roWeapon[i].Init();
                roWeapon[i].AWinPos = btWeapon[i].AWinPos;
                btWeapon[i].cModel = roWeapon[i];
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xe44;
            }
            CurrentItemInfo = new class'wItemBoxHK';
            CurrentInstanceInfo = new class'wItemBoxInstanceHK';
            WantedItemInfo = new class'wItemBoxHK';
            WantedInstanceInfo = new class'wItemBoxInstanceHK';
}

function Refresh()
{
    local int iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wWeaponCustomPartsParam wcpp;
    local wGameManager GameMgr;
    local bool bIsExist;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    iSightPartID = SelectedUnionedPartID & 1023;
    iBarrelPartID = SelectedUnionedPartID & 130048;
    iSilencerPartID = SelectedUnionedPartID & 16646144;
    iGunstockPartID = SelectedUnionedPartID & 2130706432;
    bIsExist = false;
    // End:0x140
    if(SelectedPaintingID > 0)
    {
        ItemInfo = GameMgr.FindUIItem(self.GetSelectedPaintingItemID());
        instanceInfo = btnSelectedCustomItems[0].itemBox.instanceInfo;
        // End:0x124
        if(instanceInfo == none)
        {
            instanceInfo = new class'wItemBoxInstanceHK';
            instanceInfo.ItemID = ItemInfo.ItemID;
            instanceInfo.UniqueID = SelectedItemUniqueID;
            instanceInfo.PartID = 0;
        }
        instanceInfo.PaintID = SelectedPaintingID;
        bIsExist = true;
    }
    // End:0x174
    if(bIsExist == false)
    {
        btnSelectedCustomItems[0].SetData(none, none);
        btnRemoveOrRollback[0].SetVisibility(false);
    }
    // End:0x218
    else
    {
        btnSelectedCustomItems[0].SetData(ItemInfo, instanceInfo);
        // End:0x1ae
        if(IsEnableRemove[0] > 0)
        {
            btnRemoveOrRollback[0].SetVisibility(true);
        }
        // End:0x1ec
        if(OriginalPaintingID != SelectedPaintingID)
        {
            btnRemoveOrRollback[0].Caption = strRollback;
            btnRemoveOrRollback[0].__OnClick__Delegate = CustomPaintPartsButton_OnClick;
        }
        // End:0x218
        else
        {
            btnRemoveOrRollback[0].Caption = strRemove;
            btnRemoveOrRollback[0].__OnClick__Delegate = PaintRemoveButton_OnClick;
        }
    }
    bIsExist = false;
    // End:0x302
    if(iSightPartID > 1)
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
        // End:0x302
        if(wcpp.iItemID > 0)
        {
            ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
            instanceInfo = btnSelectedCustomItems[1].itemBox.instanceInfo;
            // End:0x2e6
            if(instanceInfo == none)
            {
                instanceInfo = new class'wItemBoxInstanceHK';
                instanceInfo.ItemID = ItemInfo.ItemID;
                instanceInfo.UniqueID = SelectedItemUniqueID;
            }
            instanceInfo.PartID = iSightPartID;
            bIsExist = true;
        }
    }
    // End:0x336
    if(bIsExist == false)
    {
        btnSelectedCustomItems[1].SetData(none, none);
        btnRemoveOrRollback[1].SetVisibility(false);
    }
    // End:0x3f6
    else
    {
        btnSelectedCustomItems[1].SetData(ItemInfo, instanceInfo);
        // End:0x373
        if(IsEnableRemove[1] > 0)
        {
            btnRemoveOrRollback[1].SetVisibility(true);
        }
        // End:0x385
        else
        {
            btnRemoveOrRollback[1].SetVisibility(false);
        }
        // End:0x3ca
        if(OriginalUnionedPartID & 1023 != iSightPartID)
        {
            btnRemoveOrRollback[1].Caption = strRollback;
            btnRemoveOrRollback[1].__OnClick__Delegate = CustomSightPartsButton_OnClick;
        }
        // End:0x3f6
        else
        {
            btnRemoveOrRollback[1].Caption = strRemove;
            btnRemoveOrRollback[1].__OnClick__Delegate = SightRemoveButton_OnClick;
        }
    }
    bIsExist = false;
    // End:0x501
    if(iSilencerPartID > 1 << 17)
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        // End:0x501
        if(wcpp.iItemID > 0)
        {
            ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
            instanceInfo = btnSelectedCustomItems[2].itemBox.instanceInfo;
            // End:0x4c9
            if(instanceInfo == none)
            {
                instanceInfo = new class'wItemBoxInstanceHK';
                instanceInfo.ItemID = ItemInfo.ItemID;
                instanceInfo.UniqueID = SelectedItemUniqueID;
            }
            instanceInfo.PartID = iSilencerPartID;
            btnSelectedCustomItems[2].SetData(ItemInfo, instanceInfo);
            bIsExist = true;
        }
    }
    // End:0x537
    if(bIsExist == false)
    {
        btnSelectedCustomItems[2].SetData(none, none);
        btnRemoveOrRollback[2].SetVisibility(false);
    }
    // End:0x5ff
    else
    {
        btnSelectedCustomItems[2].SetData(ItemInfo, instanceInfo);
        // End:0x577
        if(IsEnableRemove[2] > 0)
        {
            btnRemoveOrRollback[2].SetVisibility(true);
        }
        // End:0x58a
        else
        {
            btnRemoveOrRollback[2].SetVisibility(false);
        }
        // End:0x5d1
        if(OriginalUnionedPartID & 16646144 != iSilencerPartID)
        {
            btnRemoveOrRollback[2].Caption = strRollback;
            btnRemoveOrRollback[2].__OnClick__Delegate = CustomSilencerPartsButton_OnClick;
        }
        // End:0x5ff
        else
        {
            btnRemoveOrRollback[2].Caption = strRemove;
            btnRemoveOrRollback[2].__OnClick__Delegate = SilencerRemoveButton_OnClick;
        }
    }
    bIsExist = false;
    // End:0x70a
    if(iBarrelPartID > 1 << 10)
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iBarrelPartID);
        // End:0x70a
        if(wcpp.iItemID > 0)
        {
            ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
            instanceInfo = btnSelectedCustomItems[3].itemBox.instanceInfo;
            // End:0x6d2
            if(instanceInfo == none)
            {
                instanceInfo = new class'wItemBoxInstanceHK';
                instanceInfo.ItemID = ItemInfo.ItemID;
                instanceInfo.UniqueID = SelectedItemUniqueID;
            }
            instanceInfo.PartID = iBarrelPartID;
            btnSelectedCustomItems[3].SetData(ItemInfo, instanceInfo);
            bIsExist = true;
        }
    }
    // End:0x740
    if(bIsExist == false)
    {
        btnSelectedCustomItems[3].SetData(none, none);
        btnRemoveOrRollback[3].SetVisibility(false);
    }
    // End:0x808
    else
    {
        btnSelectedCustomItems[3].SetData(ItemInfo, instanceInfo);
        // End:0x780
        if(IsEnableRemove[3] > 0)
        {
            btnRemoveOrRollback[3].SetVisibility(true);
        }
        // End:0x793
        else
        {
            btnRemoveOrRollback[3].SetVisibility(false);
        }
        // End:0x7da
        if(OriginalUnionedPartID & 130048 != iBarrelPartID)
        {
            btnRemoveOrRollback[3].Caption = strRollback;
            btnRemoveOrRollback[3].__OnClick__Delegate = CustomBarrelPartsButton_OnClick;
        }
        // End:0x808
        else
        {
            btnRemoveOrRollback[3].Caption = strRemove;
            btnRemoveOrRollback[3].__OnClick__Delegate = BarrelRemoveButton_OnClick;
        }
    }
    bIsExist = false;
    // End:0x913
    if(iGunstockPartID > 1 << 24)
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iGunstockPartID);
        // End:0x913
        if(wcpp.iItemID > 0)
        {
            ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
            instanceInfo = btnSelectedCustomItems[4].itemBox.instanceInfo;
            // End:0x8db
            if(instanceInfo == none)
            {
                instanceInfo = new class'wItemBoxInstanceHK';
                instanceInfo.ItemID = ItemInfo.ItemID;
                instanceInfo.UniqueID = SelectedItemUniqueID;
            }
            instanceInfo.PartID = iGunstockPartID;
            btnSelectedCustomItems[4].SetData(ItemInfo, instanceInfo);
            bIsExist = true;
        }
    }
    // End:0x949
    if(bIsExist == false)
    {
        btnSelectedCustomItems[4].SetData(none, none);
        btnRemoveOrRollback[4].SetVisibility(false);
    }
    // End:0xa11
    else
    {
        btnSelectedCustomItems[4].SetData(ItemInfo, instanceInfo);
        // End:0x989
        if(IsEnableRemove[4] > 0)
        {
            btnRemoveOrRollback[4].SetVisibility(true);
        }
        // End:0x99c
        else
        {
            btnRemoveOrRollback[4].SetVisibility(false);
        }
        // End:0x9e3
        if(OriginalUnionedPartID & 2130706432 != iGunstockPartID)
        {
            btnRemoveOrRollback[4].Caption = strRollback;
            btnRemoveOrRollback[4].__OnClick__Delegate = CustomGunstockPartsButton_OnClick;
        }
        // End:0xa11
        else
        {
            btnRemoveOrRollback[4].Caption = strRemove;
            btnRemoveOrRollback[4].__OnClick__Delegate = GunstockRemoveButton_OnClick;
        }
    }
    roWeapon[0].ChangeWeapon(SelectedItemID, SelectedUnionedPartID, self.GetSelectedPaintingItemID());
    roWeapon[0].SetPositionUI(vDisplay_3d.X, vDisplay_3d.Y, vDisplay_3d.Z);
    roWeapon[0].SetRotationUI(fDisplay_rot_y);
    WantedInstanceInfo.PartID = SelectedUnionedPartID;
    WantedInstanceInfo.PaintID = self.SelectedPaintingID;
    self.ItemStateView.SetData(self.WantedItemInfo, self.WantedInstanceInfo, self.CurrentItemInfo, self.CurrentInstanceInfo);
}

function bool CustomPaintPartsButton_OnClick(GUIComponent Sender)
{
    // End:0x2f
    if(self.SelectedPaintingID > 0)
    {
        // End:0x2f
        if(SelectedPaintingID != self.OriginalPaintingID)
        {
            SelectedPaintingID = OriginalPaintingID;
        }
    }
    Refresh();
}

function bool CustomSightPartsButton_OnClick(GUIComponent Sender)
{
    local int iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID, iTempPartID;

    iSightPartID = SelectedUnionedPartID & 1023;
    iBarrelPartID = SelectedUnionedPartID & 130048;
    iSilencerPartID = SelectedUnionedPartID & 16646144;
    iGunstockPartID = SelectedUnionedPartID & 2130706432;
    iTempPartID = OriginalUnionedPartID & 1023;
    // End:0x7f
    if(iSightPartID > 1)
    {
        // End:0x7f
        if(iSightPartID != iTempPartID)
        {
            iSightPartID = iTempPartID;
        }
    }
    SelectedUnionedPartID = iSightPartID | iBarrelPartID | iSilencerPartID | iGunstockPartID;
    Refresh();
    return false;
}

function bool CustomSilencerPartsButton_OnClick(GUIComponent Sender)
{
    local int iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID, iTempPartID;

    iSightPartID = SelectedUnionedPartID & 1023;
    iBarrelPartID = SelectedUnionedPartID & 130048;
    iSilencerPartID = SelectedUnionedPartID & 16646144;
    iGunstockPartID = SelectedUnionedPartID & 2130706432;
    iTempPartID = OriginalUnionedPartID & 16646144;
    // End:0x83
    if(iSilencerPartID > 1 << 17)
    {
        // End:0x83
        if(iSilencerPartID != iTempPartID)
        {
            iSilencerPartID = iTempPartID;
        }
    }
    SelectedUnionedPartID = iSightPartID | iBarrelPartID | iSilencerPartID | iGunstockPartID;
    Refresh();
}

function bool CustomBarrelPartsButton_OnClick(GUIComponent Sender)
{
    local int iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID, iTempPartID;

    iSightPartID = SelectedUnionedPartID & 1023;
    iBarrelPartID = SelectedUnionedPartID & 130048;
    iSilencerPartID = SelectedUnionedPartID & 16646144;
    iGunstockPartID = SelectedUnionedPartID & 2130706432;
    iTempPartID = OriginalUnionedPartID & 130048;
    // End:0x83
    if(iBarrelPartID > 1 << 10)
    {
        // End:0x83
        if(iBarrelPartID != iTempPartID)
        {
            iBarrelPartID = iTempPartID;
        }
    }
    SelectedUnionedPartID = iSightPartID | iBarrelPartID | iSilencerPartID | iGunstockPartID;
    Refresh();
}

function bool CustomGunstockPartsButton_OnClick(GUIComponent Sender)
{
    local int iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID, iTempPartID;

    iSightPartID = SelectedUnionedPartID & 1023;
    iBarrelPartID = SelectedUnionedPartID & 130048;
    iSilencerPartID = SelectedUnionedPartID & 16646144;
    iGunstockPartID = SelectedUnionedPartID & 2130706432;
    iTempPartID = OriginalUnionedPartID & 2130706432;
    // End:0x83
    if(iGunstockPartID > 1 << 24)
    {
        // End:0x83
        if(iGunstockPartID != iTempPartID)
        {
            iGunstockPartID = iTempPartID;
        }
    }
    SelectedUnionedPartID = iSightPartID | iBarrelPartID | iSilencerPartID | iGunstockPartID;
    Refresh();
}

function bool PaintRemoveButton_OnClick(GUIComponent Sender)
{
    self.SelectedPaintingID = 0;
    Refresh();
}

function bool SightRemoveButton_OnClick(GUIComponent Sender)
{
    local int iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID;

    iSightPartID = 1;
    iBarrelPartID = SelectedUnionedPartID & 130048;
    iSilencerPartID = SelectedUnionedPartID & 16646144;
    iGunstockPartID = SelectedUnionedPartID & 2130706432;
    SelectedUnionedPartID = iSightPartID | iBarrelPartID | iSilencerPartID | iGunstockPartID;
    Refresh();
}

function bool SilencerRemoveButton_OnClick(GUIComponent Sender)
{
    local int iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID;

    iSightPartID = SelectedUnionedPartID & 1023;
    iBarrelPartID = SelectedUnionedPartID & 130048;
    iSilencerPartID = 1 << 17;
    iGunstockPartID = SelectedUnionedPartID & 2130706432;
    SelectedUnionedPartID = iSightPartID | iBarrelPartID | iSilencerPartID | iGunstockPartID;
    Refresh();
}

function bool BarrelRemoveButton_OnClick(GUIComponent Sender)
{
    local int iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID;

    iSightPartID = SelectedUnionedPartID & 1023;
    iBarrelPartID = 1 << 10;
    iSilencerPartID = SelectedUnionedPartID & 16646144;
    iGunstockPartID = SelectedUnionedPartID & 2130706432;
    SelectedUnionedPartID = iSightPartID | iBarrelPartID | iSilencerPartID | iGunstockPartID;
    Refresh();
}

function bool GunstockRemoveButton_OnClick(GUIComponent Sender)
{
    local int iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID;

    iSightPartID = SelectedUnionedPartID & 1023;
    iBarrelPartID = SelectedUnionedPartID & 130048;
    iSilencerPartID = SelectedUnionedPartID & 16646144;
    iGunstockPartID = 1 << 24;
    SelectedUnionedPartID = iSightPartID | iBarrelPartID | iSilencerPartID | iGunstockPartID;
    Refresh();
}

function ACLList_OnChange(GUIComponent Sender)
{
    local int iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID, PartIndex;

    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x45
    if(ACLList_All.LastSelectedItemIndex < 0)
    {
        return;
    }
    iSightPartID = SelectedUnionedPartID & 1023;
    iBarrelPartID = SelectedUnionedPartID & 130048;
    iSilencerPartID = SelectedUnionedPartID & 16646144;
    iGunstockPartID = SelectedUnionedPartID & 2130706432;
    instanceInfo = BTROItemBoxHK(ACLList_All.GetSelectItem()).instanceInfo;
    PartIndex = instanceInfo.PartID;
    // End:0xe1
    if(PartIndex > 1 << 24)
    {
        iGunstockPartID = PartIndex;
    }
    // End:0x131
    else
    {
        // End:0xfe
        if(PartIndex > 1 << 17)
        {
            iSilencerPartID = PartIndex;
        }
        // End:0x131
        else
        {
            // End:0x11b
            if(PartIndex > 1 << 10)
            {
                iBarrelPartID = PartIndex;
            }
            // End:0x131
            else
            {
                // End:0x131
                if(PartIndex > 1)
                {
                    iSightPartID = PartIndex;
                }
            }
        }
    }
    SelectedUnionedPartID = iSightPartID | iBarrelPartID | iSilencerPartID | iGunstockPartID;
    // End:0x179
    if(instanceInfo.PaintID > 0)
    {
        SelectedPaintingID = instanceInfo.PaintID;
    }
    Refresh();
}

function bool ButtonInit_OnClick(GUIComponent Sender)
{
    SelectedPaintingID = OriginalPaintingID;
    SelectedUnionedPartID = OriginalUnionedPartID;
    Refresh();
}

function SetData(wItemBoxHK ib, wItemBoxInstanceHK ibi)
{
    local BTROItemBoxHK ro;
    local wItemBoxHK ItemInfo;
    local int i;
    local wItemBoxInstanceHK instanceInfo;
    local int iSightPartID, iSilencerPartID, iBarrelPartID, iGunstockPartID;
    local wGameManager GameMgr;
    local wWeaponCustomPartsParam wcpp;
    local wWeaponCustomInfoParam wcip;
    local wMatchMaker MM;
    local wPaintGroupParam pgp;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MyData.myLevel = MM.kLevel;
    MyData.MyPoint = MM.kPoint;
    MyData.MyCash = MM.kCash;
    // End:0x130
    if(ib.IsCashItem() == true && ibi.CashItemInfo != none)
    {
        WeaponNameLabel.Caption = ibi.CashItemInfo.WZItemName;
        WeaponDescript.SetText(ibi.CashItemInfo.WZItemDescription);
    }
    // End:0x16a
    else
    {
        WeaponNameLabel.Caption = ib.ItemName;
        WeaponDescript.SetText(ib.ItemDescription);
    }
    CurrentItemInfo.ui_damage = ib.ui_damage;
    CurrentItemInfo.ui_spread = ib.ui_spread;
    CurrentItemInfo.ui_view_kick = ib.ui_view_kick;
    CurrentItemInfo.ui_rate_of_fire = ib.ui_rate_of_fire;
    CurrentItemInfo.ui_move = ib.ui_move;
    CurrentItemInfo.ui_range = ib.ui_range;
    CurrentItemInfo.start_ammo = ib.start_ammo;
    CurrentItemInfo.clip_size = ib.clip_size;
    CurrentInstanceInfo.PartID = ibi.PartID;
    CurrentItemInfo.PartAllList.Length = ib.PartAllList.Length;
    i = 0;
    J0x295:
    // End:0x2e1 [While If]
    if(i < ib.PartAllList.Length)
    {
        CurrentItemInfo.PartAllList[i] = ib.PartAllList[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x295;
    }
    WantedItemInfo.ui_damage = ib.ui_damage;
    WantedItemInfo.ui_spread = ib.ui_spread;
    WantedItemInfo.ui_view_kick = ib.ui_view_kick;
    WantedItemInfo.ui_rate_of_fire = ib.ui_rate_of_fire;
    WantedItemInfo.ui_move = ib.ui_move;
    WantedItemInfo.ui_range = ib.ui_range;
    WantedItemInfo.start_ammo = ib.start_ammo;
    WantedItemInfo.clip_size = ib.clip_size;
    WantedItemInfo.PartAllList.Length = ib.PartAllList.Length;
    i = 0;
    J0x3ef:
    // End:0x43b [While If]
    if(i < ib.PartAllList.Length)
    {
        WantedItemInfo.PartAllList[i] = ib.PartAllList[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3ef;
    }
    WantedInstanceInfo.PartID = ibi.PartID;
    IsEnableRemove[0] = 0;
    IsEnableRemove[1] = 0;
    IsEnableRemove[2] = 0;
    IsEnableRemove[3] = 0;
    IsEnableRemove[4] = 0;
    IsEnableRemove[0] = 1;
    i = 0;
    J0x498:
    // End:0x58f [While If]
    if(i < ib.PartAllList.Length)
    {
        // End:0x4e3
        if(ib.PartAllList[i].PartID & 1023 == 1)
        {
            IsEnableRemove[1] = 1;
        }
        // End:0x585
        else
        {
            // End:0x51a
            if(ib.PartAllList[i].PartID & 16646144 == 1 << 17)
            {
                IsEnableRemove[2] = 1;
            }
            // End:0x585
            else
            {
                // End:0x551
                if(ib.PartAllList[i].PartID & 130048 == 1 << 10)
                {
                    IsEnableRemove[3] = 1;
                }
                // End:0x585
                else
                {
                    // End:0x585
                    if(ib.PartAllList[i].PartID & 2130706432 == 1 << 24)
                    {
                        IsEnableRemove[4] = 1;
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x498;
    }
    i = 0;
    J0x596:
    // End:0x602 [While If]
    if(i < 5)
    {
        btnRemoveOrRollback[i].SetVisibility(false);
        // End:0x5e2
        if(IsEnableRemove[i] > 0)
        {
            btnRemoveOrRollback[i].SetEnabled(true);
        }
        // End:0x5f8
        else
        {
            btnRemoveOrRollback[i].SetEnabled(false);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x596;
    }
    PaintingInfos = ib.PaintGroupList;
    OriginalPaintingItemID = ibi.PaintID;
    // End:0x6b1
    if(OriginalPaintingItemID == 0 && PaintingInfos.Length == 0)
    {
        wcip = GameMgr.GetWeaponCustomInfoParam(ibi.ItemID);
        // End:0x6b1
        if(wcip.iItemID > 0 && wcip.iItemID == ibi.ItemID)
        {
            OriginalPaintingItemID = wcip.iDefaultPaintingID;
        }
    }
    i = 0;
    J0x6b8:
    // End:0x8a1 [While If]
    if(i < PaintingInfos.Length)
    {
        ItemInfo = GameMgr.FindUIItem(PaintingInfos[i].PaintingItemID);
        // End:0x6fb
        if(ItemInfo == none)
        {
        }
        // End:0x897
        else
        {
            // End:0x734
            if(PaintingInfos[i].PaintingItemID == ibi.PaintID)
            {
                SelectedPaintingID = PaintingInfos[i].PaintingID;
            }
            // End:0x75a
            if(GameMgr.IsExistShopItemList(ItemInfo.ItemID) == 0)
            {
            }
            // End:0x897
            else
            {
                ro = new class'BTROItemBoxHK';
                ro.Init();
                ro.ItemInfo = ItemInfo;
                instanceInfo = new class'wItemBoxInstanceHK';
                instanceInfo.ItemID = ItemInfo.ItemID;
                instanceInfo.UniqueID = ibi.UniqueID;
                instanceInfo.PartID = 0;
                instanceInfo.PaintID = PaintingInfos[i].PaintingID;
                ro.instanceInfo = instanceInfo;
                ro.SetGameManager(GameMgr);
                ro.ChangeState(20);
                ro.MyData = MyData;
                ro.Update();
                ro.bUseCache = true;
                ACLList_All.AddRenderObject(ro);
                DataPool[DataPool.Length] = ro;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6b8;
    }
    iSightPartID = ibi.PartID & 1023;
    iBarrelPartID = ibi.PartID & 130048;
    iSilencerPartID = ibi.PartID & 16646144;
    iGunstockPartID = ibi.PartID & 2130706432;
    // End:0x91f
    if(iSightPartID == 0)
    {
        iSightPartID = 1;
    }
    // End:0x935
    if(iBarrelPartID == 0)
    {
        iBarrelPartID = 1 << 10;
    }
    // End:0x94b
    if(iSilencerPartID == 0)
    {
        iSilencerPartID = 1 << 17;
    }
    // End:0x961
    if(iGunstockPartID == 0)
    {
        iGunstockPartID = 1 << 24;
    }
    i = 0;
    J0x968:
    // End:0xb33 [While If]
    if(i < ib.PartAllList.Length)
    {
        ItemInfo = GameMgr.FindUIItem(ib.PartAllList[i].ItemID);
        // End:0x9bd
        if(ItemInfo == none)
        {
        }
        // End:0xb29
        else
        {
            // End:0x9e3
            if(GameMgr.IsExistShopItemList(ItemInfo.ItemID) == 0)
            {
            }
            // End:0xb29
            else
            {
                ro = new class'BTROItemBoxHK';
                ro.Init();
                ro.ItemInfo = ItemInfo;
                instanceInfo = new class'wItemBoxInstanceHK';
                instanceInfo.ItemID = ItemInfo.ItemID;
                instanceInfo.UniqueID = ibi.UniqueID;
                instanceInfo.PartID = ib.PartAllList[i].PartID;
                instanceInfo.PaintID = 0;
                ro.instanceInfo = instanceInfo;
                ro.SetGameManager(GameMgr);
                ro.ChangeState(20);
                ro.MyData = MyData;
                ro.Update();
                ro.bUseCache = true;
                ACLList_All.AddRenderObject(ro);
                DataPool[DataPool.Length] = ro;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x968;
    }
    SelectedItemID = ibi.ItemID;
    SelectedUnionedPartID = iSightPartID | iBarrelPartID | iSilencerPartID | iGunstockPartID;
    SelectedItemUniqueID = ibi.UniqueID;
    vDisplay_3d = ib.vDisplay_3d;
    fDisplay_rot_y = ib.fDisplay_3d_rot_y;
    OriginalPaintingID = SelectedPaintingID;
    OriginalUnionedPartID = SelectedUnionedPartID;
    // End:0xc94
    if(SelectedPaintingID > 0)
    {
        pgp = GameMgr.GetPaintGroupParam(SelectedPaintingID);
        ItemInfo = GameMgr.FindUIItem(pgp.PaintingItemID);
        // End:0xc94
        if(ItemInfo != none)
        {
            instanceInfo = new class'wItemBoxInstanceHK';
            instanceInfo.ItemID = ItemInfo.ItemID;
            instanceInfo.UniqueID = ibi.UniqueID;
            instanceInfo.PartID = 0;
            instanceInfo.PaintID = SelectedPaintingID;
            btnSelectedCustomItems[0].SetData(ItemInfo, instanceInfo);
        }
    }
    // End:0xd6f
    if(iSightPartID > 1)
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
        ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
        // End:0xd6f
        if(ItemInfo != none)
        {
            instanceInfo = new class'wItemBoxInstanceHK';
            instanceInfo.ItemID = ItemInfo.ItemID;
            instanceInfo.UniqueID = ibi.UniqueID;
            instanceInfo.PartID = iSightPartID;
            instanceInfo.PaintID = 0;
            btnSelectedCustomItems[1].SetData(ItemInfo, instanceInfo);
        }
    }
    // End:0xe4f
    if(iSilencerPartID > 1 << 17)
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
        // End:0xe4f
        if(ItemInfo != none)
        {
            instanceInfo = new class'wItemBoxInstanceHK';
            instanceInfo.ItemID = ItemInfo.ItemID;
            instanceInfo.UniqueID = ibi.UniqueID;
            instanceInfo.PartID = iSilencerPartID;
            instanceInfo.PaintID = 0;
            btnSelectedCustomItems[2].SetData(ItemInfo, instanceInfo);
        }
    }
    // End:0xf2f
    if(iBarrelPartID > 1 << 10)
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iBarrelPartID);
        ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
        // End:0xf2f
        if(ItemInfo != none)
        {
            instanceInfo = new class'wItemBoxInstanceHK';
            instanceInfo.ItemID = ItemInfo.ItemID;
            instanceInfo.UniqueID = ibi.UniqueID;
            instanceInfo.PartID = iSilencerPartID;
            instanceInfo.PaintID = 0;
            btnSelectedCustomItems[3].SetData(ItemInfo, instanceInfo);
        }
    }
    // End:0x100f
    if(iGunstockPartID > 1 << 24)
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iGunstockPartID);
        ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
        // End:0x100f
        if(ItemInfo != none)
        {
            instanceInfo = new class'wItemBoxInstanceHK';
            instanceInfo.ItemID = ItemInfo.ItemID;
            instanceInfo.UniqueID = ibi.UniqueID;
            instanceInfo.PartID = iSilencerPartID;
            instanceInfo.PaintID = 0;
            btnSelectedCustomItems[4].SetData(ItemInfo, instanceInfo);
        }
    }
    i = 0;
    J0x1016:
    // End:0x104f [While If]
    if(i < 5)
    {
        btnSelectedCustomItems[i].itemBox.MyData = MyData;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1016;
    }
    Refresh();
}

function Internal_OnClose(optional bool bCancelled)
{
    roWeapon[0].EndModel();
}

function SetPaintingSempleButton(int SelectedIdx);
function bool ButtonGroups_OnClick(GUIComponent Sender)
{
    local int UI_Durability;
    local wItemBoxHK ItemInfo;
    local int PartIndex;

    // End:0xd9
    if(ACLList_Sight.LastSelectedItemIndex >= 0)
    {
        ItemInfo = BTRORadioItemBoxHK(ACLList_Sight.DataList[ACLList_Sight.LastSelectedItemIndex]).itemBox.ItemInfo;
        PartIndex = ItemInfo.PartSightIndices[ACLList_Sight.LastSelectedItemIndex];
        UI_Durability = ItemInfo.PartAllList[PartIndex].UI_Durability;
        PartIndex = ItemInfo.PartSilencerIndices[ACLList_Silencer.LastSelectedItemIndex];
        UI_Durability = UI_Durability + ItemInfo.PartAllList[PartIndex].UI_Durability;
    }
    UI_Durability += PaintingInfos[SelectPaintingIdx].UI_Durability;
    LabelStat[2].SetData(UI_Durability);
    return true;
}

function BtrDouble GetSelectedItemUniqueID()
{
    return SelectedItemUniqueID;
}

function int GetSelectedUnionedPartID()
{
    return SelectedUnionedPartID;
}

function int GetSelectedPaintingItemID()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4c [While If]
    if(i < PaintingInfos.Length)
    {
        // End:0x42
        if(PaintingInfos[i].PaintingID == SelectedPaintingID)
        {
            return PaintingInfos[i].PaintingItemID;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x5e
    if(PaintingInfos.Length == 0)
    {
        return OriginalPaintingItemID;
    }
    return -1;
}

function int GetSelectedPaintingID()
{
    return SelectedPaintingID;
}

function int GetPaintingID()
{
    return PaintingInfos[SelectPaintingIdx].PaintingID;
}

function int GetPaintingItemID()
{
    return PaintingInfos[SelectPaintingIdx].PaintingItemID;
}

function bool FilterButton_OnClick(GUIComponent Sender)
{
    TabControl.SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    ChangeItemList(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    FilterTabBtnIdx = byte(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
}

function ChangeItemList(int FilterIndex)
{
    local int i;

    ACLList_All.RemoveAll();
    ACLList_All.SelectItemIndex = -1;
    ACLList_All.LastSelectedItemIndex = -1;
    ACLList_All.VolatileSelectItemIndex = -1;
    // End:0x99
    if(FilterIndex == 0)
    {
        i = 0;
        J0x5d:
        // End:0x96 [While If]
        if(i < self.DataPool.Length)
        {
            ACLList_All.AddRenderObject(DataPool[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x5d;
        }
    }
    // End:0x2f7
    else
    {
        // End:0x10a
        if(FilterIndex == 1)
        {
            i = 0;
            J0xab:
            // End:0x107 [While If]
            if(i < self.DataPool.Length)
            {
                // End:0xfd
                if(DataPool[i].instanceInfo.PaintID > 0)
                {
                    ACLList_All.AddRenderObject(DataPool[i]);
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xab;
            }
        }
        // End:0x2f7
        else
        {
            // End:0x183
            if(FilterIndex == 2)
            {
                i = 0;
                J0x11d:
                // End:0x180 [While If]
                if(i < self.DataPool.Length)
                {
                    // End:0x176
                    if(DataPool[i].instanceInfo.PartID & 1023 > 1)
                    {
                        ACLList_All.AddRenderObject(DataPool[i]);
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x11d;
                }
            }
            // End:0x2f7
            else
            {
                // End:0x200
                if(FilterIndex == 3)
                {
                    i = 0;
                    J0x196:
                    // End:0x1fd [While If]
                    if(i < self.DataPool.Length)
                    {
                        // End:0x1f3
                        if(DataPool[i].instanceInfo.PartID & 16646144 > 1 << 17)
                        {
                            ACLList_All.AddRenderObject(DataPool[i]);
                        }
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x196;
                    }
                }
                // End:0x2f7
                else
                {
                    // End:0x27d
                    if(FilterIndex == 4)
                    {
                        i = 0;
                        J0x213:
                        // End:0x27a [While If]
                        if(i < self.DataPool.Length)
                        {
                            // End:0x270
                            if(DataPool[i].instanceInfo.PartID & 130048 > 1 << 10)
                            {
                                ACLList_All.AddRenderObject(DataPool[i]);
                            }
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x213;
                        }
                    }
                    // End:0x2f7
                    else
                    {
                        // End:0x2f7
                        if(FilterIndex == 5)
                        {
                            i = 0;
                            J0x290:
                            // End:0x2f7 [While If]
                            if(i < self.DataPool.Length)
                            {
                                // End:0x2ed
                                if(DataPool[i].instanceInfo.PartID & 2130706432 > 1 << 24)
                                {
                                    ACLList_All.AddRenderObject(DataPool[i]);
                                }
                                ++ i;
                                // This is an implied JumpToken; Continue!
                                goto J0x290;
                            }
                        }
                    }
                }
            }
        }
    }
}

function bool Confirm_OnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return OnOK(self);
}

function bool GetPaintPrice(int iPaintID, out int iOutPoint, out int iOutCash)
{
    local wItemBaseParam ItemParam;
    local wPaintGroupParam pgp;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    pgp = GameMgr.GetPaintGroupParam(iPaintID);
    // End:0x56
    if(pgp == none)
    {
        return false;
    }
    ItemParam = GameMgr.GetItemParam(pgp.PaintingItemID);
    // End:0x86
    if(ItemParam == none)
    {
        return false;
    }
    iOutPoint = ItemParam.iPointPrice[0];
    iOutCash = ItemParam.iCashPrice[0];
    return true;
}

function bool GetPartPrice(int iPartID, out int iOutPoint, out int iOutCash)
{
    local wWeaponCustomPartsParam wcpp;
    local wItemBaseParam ItemParam;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iPartID);
    // End:0xac
    if(wcpp.iItemID > 0)
    {
        ItemParam = GameMgr.GetItemParam(wcpp.iItemID);
        iOutPoint = ItemParam.iPointPrice[0];
        iOutCash = ItemParam.iCashPrice[0];
    }
    return false;
}

function int IsEnoughMoney()
{
    local int iOrigSightPartID, iOrigSilencerPartID, iOrigBarrelPartID, iOrigGunstockPartID, iDestSightPartID, iDestSilencerPartID,
	    iDestBarrelPartID, iDestGunstockPartID;

    local wGameManager GameMgr;
    local wMatchMaker MM;
    local int iSumPoint, iSumCash, iGetPoint, iGetCash;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    iOrigSightPartID = OriginalUnionedPartID & 1023;
    iOrigBarrelPartID = OriginalUnionedPartID & 130048;
    iOrigSilencerPartID = OriginalUnionedPartID & 16646144;
    iOrigGunstockPartID = OriginalUnionedPartID & 2130706432;
    iDestSightPartID = SelectedUnionedPartID & 1023;
    iDestBarrelPartID = SelectedUnionedPartID & 130048;
    iDestSilencerPartID = SelectedUnionedPartID & 16646144;
    iDestGunstockPartID = SelectedUnionedPartID & 2130706432;
    iGetPoint = 0;
    iGetCash = 0;
    // End:0x146
    if(OriginalPaintingID != SelectedPaintingID && SelectedPaintingID > 0)
    {
        GetPaintPrice(SelectedPaintingID, iGetPoint, iGetCash);
        iSumPoint += iGetPoint;
        iSumCash += iGetCash;
    }
    iGetPoint = 0;
    iGetCash = 0;
    // End:0x1a2
    if(iOrigSightPartID != iDestSightPartID && iDestSightPartID > 1)
    {
        self.GetPartPrice(iDestSightPartID, iGetPoint, iGetCash);
        iSumPoint += iGetPoint;
        iSumCash += iGetCash;
    }
    iGetPoint = 0;
    iGetCash = 0;
    // End:0x1fe
    if(iOrigBarrelPartID != iDestBarrelPartID && iDestBarrelPartID > 1)
    {
        self.GetPartPrice(iDestBarrelPartID, iGetPoint, iGetCash);
        iSumPoint += iGetPoint;
        iSumCash += iGetCash;
    }
    iGetPoint = 0;
    iGetCash = 0;
    // End:0x25a
    if(iOrigSilencerPartID != iDestSilencerPartID && iDestSilencerPartID > 1)
    {
        self.GetPartPrice(iDestSilencerPartID, iGetPoint, iGetCash);
        iSumPoint += iGetPoint;
        iSumCash += iGetCash;
    }
    iGetPoint = 0;
    iGetCash = 0;
    // End:0x2b6
    if(iOrigGunstockPartID != iDestGunstockPartID && iDestGunstockPartID > 1)
    {
        self.GetPartPrice(iDestGunstockPartID, iGetPoint, iGetCash);
        iSumPoint += iGetPoint;
        iSumCash += iGetCash;
    }
    // End:0x2fc
    if(MM.kPoint < 0 || MM.kCash < 0 || iSumPoint < 0 || iSumCash < 0)
    {
        return 0;
    }
    // End:0x319
    if(MM.kPoint - iSumPoint < 0)
    {
        return 0;
    }
    // End:0x336
    if(MM.kCash - iSumCash < 0)
    {
        return 1;
    }
    return 2;
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    // End:0x38
    if(OriginalUnionedPartID == SelectedUnionedPartID && OriginalPaintingID == SelectedPaintingID)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, 100);
        return false;
    }
    switch(IsEnoughMoney())
    {
        // End:0x5c
        case 0:
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 204);
            return false;
        // End:0x78
        case 1:
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 205);
            return false;
        // End:0x80
        case 2:
            // End:0x83
            break;
        // End:0xffff
        default:
            Controller.OpenMenu("GUIWarfareControls.BTWindowCustomConfirm");
            BTWindowCustomConfirm(Controller.TopPage()).SetData(OriginalUnionedPartID, SelectedUnionedPartID, self.OriginalPaintingID, self.SelectedPaintingID);
            BTWindowCustomConfirm(Controller.TopPage()).__OnOK__Delegate = Confirm_OnClick;
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    return OnCancel(self);
}

defaultproperties
{
    fbLabelBackgroundWeapon=(X1=85.0,Y1=114.0,X2=613.0,Y2=295.0)
    strLabelAll[0]="Power/Range"
    strLabelAll[1]="Fire Sound"
    strLabelAll[2]="Durability Loss"
    strLabelSniper[0]="Lv 1 Zoom"
    strLabelSniper[1]="Lv 2 Zoom"
    strLabelSniper[2]="Durability Loss"
    fbACLList_Sight=(X1=673.0,Y1=202.0,X2=898.0,Y2=549.0)
    fbACLList_Silencer=(X1=898.0,Y1=202.0,X2=1098.0,Y2=549.0)
    fbACLList_Barrel=(X1=1098.0,Y1=202.0,X2=1298.0,Y2=549.0)
    fbACLList_Gunstock=(X1=1298.0,Y1=202.0,X2=1498.0,Y2=549.0)
    CustomItemButtonGroup=mgroups
    strRemove="Remove"
    strRollback="Revert"
    fbButtonInit=(X1=324.0,Y1=655.0,X2=448.0,Y2=692.0)
    strInit="Reset"
    strFilter[0]="All"
    strFilter[1]="Paint"
    strFilter[2]="Mount"
    strFilter[3]="Front"
    strFilter[4]="Barrel"
    strFilter[5]="Stock"
    TabControl=mTabControl
    fbACLList_All=(X1=72.0,Y1=469.0,X2=947.0,Y2=643.0)
    fbBackgroundImage=(X1=19.0,Y1=68.0,X2=1005.0,Y2=708.0)
    fbTopLine=(X1=312.0,Y1=74.0,X2=712.0,Y2=89.0)
    fbBottomLine=(X1=69.0,Y1=636.0,X2=956.0,Y2=680.0)
    fbButtonOK=(X1=450.0,Y1=655.0,X2=574.0,Y2=692.0)
    fbButtonCancel=(X1=576.0,Y1=655.0,X2=700.0,Y2=692.0)
    strTitle="Modify"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    bUseChangeAlpha=true
    bUseTranslate=true
}