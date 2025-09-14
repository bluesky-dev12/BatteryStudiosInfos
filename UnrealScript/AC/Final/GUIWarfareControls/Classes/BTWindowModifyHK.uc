class BTWindowModifyHK extends BTWindowHK
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
var int SelectedProductNo[5];
var int OriginalPaintingItemID;
var int OriginalPaintingID;
var int OriginalUnionedPartID;
var Vector vDisplay_3d;
var float fDisplay_rot_y;
var BTItemCommonInfoHK MyData;
var export editinline BTModelWeaponHK btWeapon[2];
var BTROModelWeapon roWeapon[2];
var() automated ButtonGroups CustomItemButtonGroup;
var export editinline BTItemBoxButtonHK btnSelectedCustomItems[5];
var export editinline BTOwnerDrawCaptionButtonHK btnRemoveOrRollback[5];
var localized string strRemove;
var localized string strRollback;
var export editinline BTOwnerDrawCaptionButtonHK btnInit;
var FloatBox fbButtonInit;
var localized string strInit;
var localized string strFilter[6];
var export editinline BTOwnerDrawCaptionButtonHK FilterButton[6];
var() automated TabControlMocker TabControl;
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
var localized string strPCoinOnly;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i, iWidthBtn, LockStartIdx;
    local FloatBox fbStartItemBtns;

    super.InitComponent(MyController, myOwner);
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemRemodel_bgdeco;
    TopLine.CaptionDrawType = 4;
    TopLine.SetFontSizeAll(11);
    TopLine.SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255)));
    TopLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    btnInit = NewButtonComponent(fbButtonInit, 0.9500000);
    btnInit.SetDefaultOptionInitButtonImage();
    btnInit.Caption = strInit;
    btnInit.SetFontSizeAll(9);
    btnInit.CaptionDrawType = 4;
    btnInit.__OnClick__Delegate = ButtonInit_OnClick;
    AppendComponent(btnInit);
    ItemStateView = new Class'GUIWarfareControls_Decompressed.BTItemStateBoxButtonHK';
    ItemStateView.bUseAWinPos = true;
    fbStartItemBtns.X1 = 709.0000000;
    fbStartItemBtns.Y1 = 128.0000000;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(128);
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(95);
    ItemStateView.AWinPos = fbStartItemBtns;
    ItemStateView.BGOffsetX = 15;
    ItemStateView.GaugeBGImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_gauge_bg;
    ItemStateView.InitComponent(Controller, self);
    AppendComponent(ItemStateView);
    iWidthBtn = 165;
    fbStartItemBtns.X1 = 80.0000000;
    fbStartItemBtns.Y1 = 309.0000000;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(iWidthBtn);
    fbStartItemBtns.Y2 = 400.0000000;
    i = 0;
    J0x249:

    // End:0x6C7 [Loop If]
    if(i < 5)
    {
        btnSelectedCustomItems[i] = BTItemBoxButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK', fbStartItemBtns, 0.9000000));
        btnSelectedCustomItems[i].bNeverFocus = true;
        btnSelectedCustomItems[i].itemBox.ChangeState(21);
        LockStartIdx = 3;
        // End:0x447
        if(i >= LockStartIdx)
        {
            LockImage[i - LockStartIdx] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
            LockImage[i - LockStartIdx].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Skill_Lock;
            LockImage[i - LockStartIdx].bUseAWinPos = true;
            LockImage[i - LockStartIdx].AWinPos.X1 = fbStartItemBtns.X1 + float(10);
            LockImage[i - LockStartIdx].AWinPos.Y1 = fbStartItemBtns.Y1 + float(10);
            LockImage[i - LockStartIdx].AWinPos.X2 = fbStartItemBtns.X2 - float(10);
            LockImage[i - LockStartIdx].AWinPos.Y2 = fbStartItemBtns.Y2 - float(10);
            LockImage[i - LockStartIdx].ApplyAWinPos();
            LockImage[i - LockStartIdx].CaptionDrawType = 4;
            AppendComponent(LockImage[i - LockStartIdx]);
        }
        btnRemoveOrRollback[i] = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fbStartItemBtns.X1 + float(92), fbStartItemBtns.Y1 + float(78), (fbStartItemBtns.X1 + float(92)) + float(69), (fbStartItemBtns.Y1 + float(78)) + float(18)), 0.9500000);
        fbStartItemBtns.X1 += float(iWidthBtn + 10);
        fbStartItemBtns.X2 += float(iWidthBtn + 10);
        CustomItemButtonGroup.AddButton(btnSelectedCustomItems[i]);
        btnRemoveOrRollback[i].Caption = strRemove;
        btnRemoveOrRollback[i].CaptionDrawType = 4;
        btnRemoveOrRollback[i].SetFontSizeAll(9);
        btnRemoveOrRollback[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemRemodel_Btn_Rollback_n;
        btnRemoveOrRollback[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemRemodel_Btn_Rollback_on;
        btnRemoveOrRollback[i].buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemRemodel_Btn_Rollback_on;
        btnRemoveOrRollback[i].buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemRemodel_Btn_Rollback_cli;
        btnRemoveOrRollback[i].buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemRemodel_Btn_Rollback_cli;
        switch(i)
        {
            // End:0x647
            case 0:
                btnSelectedCustomItems[i].__OnClick__Delegate = CustomPaintPartsButton_OnClick;
                btnRemoveOrRollback[i].__OnClick__Delegate = PaintRemoveButton_OnClick;
                // End:0x69B
                break;
            // End:0xFFFF
            default:
                btnRemoveOrRollback[i].ButtonID = i;
                btnSelectedCustomItems[i].__OnClick__Delegate = CustomPartsButton_OnClick;
                btnRemoveOrRollback[i].__OnClick__Delegate = RemoveButton_OnClick;
                // End:0x69B
                break;
                break;
        }
        AppendComponent(btnSelectedCustomItems[i]);
        AppendComponent(btnRemoveOrRollback[i]);
        i++;
        // [Loop Continue]
        goto J0x249;
    }
    ACLList_All = new Class'GUIWarfareControls_Decompressed.BTAutoImageListHK';
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
    fbStartItemBtns.X1 = 72.0000000;
    fbStartItemBtns.Y1 = 439.0000000;
    fbStartItemBtns.X2 = fbStartItemBtns.X1 + float(iWidthBtn);
    fbStartItemBtns.Y2 = fbStartItemBtns.Y1 + float(28);
    i = 0;
    J0x7F5:

    // End:0xA31 [Loop If]
    if(i < 6)
    {
        FilterButton[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        FilterButton[i].bUseAWinPos = true;
        FilterButton[i].AWinPos = fbStartItemBtns;
        FilterButton[i].RenderWeight = 0.9000000;
        FilterButton[i].Caption = strFilter[i];
        FilterButton[i].CaptionDrawType = 4;
        FilterButton[i].CaptionAlign = 2;
        FilterButton[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_sub_btn_n;
        FilterButton[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_sub_btn_on;
        FilterButton[i].buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_sub_btn_Focus;
        FilterButton[i].buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_sub_btn_cli;
        FilterButton[i].buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_sub_btn_Focus;
        FilterButton[i].bIsDisableHover = true;
        FilterButton[i].SetTabButtonFontColor();
        AppendComponent(FilterButton[i]);
        TabControl.BindTabButtonAndPanel(FilterButton[i], ACLList_All);
        FilterButton[i].ButtonID = i;
        FilterButton[i].__OnClick__Delegate = FilterButton_OnClick;
        fbStartItemBtns.X1 += float(iWidthBtn + 1);
        fbStartItemBtns.X2 += float(iWidthBtn + 1);
        i++;
        // [Loop Continue]
        goto J0x7F5;
    }
    TabControl.SetVisiblePanel(0);
    i = 0;
    J0xA48:

    // End:0xBA6 [Loop If]
    if(i < 5)
    {
        InvenBoxLabel[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        InvenBoxLabel[i].bUseAWinPos = true;
        InvenBoxLabel[i].AWinPos.X1 = 82.0000000 + float(175 * i);
        InvenBoxLabel[i].AWinPos.Y1 = 401.0000000;
        InvenBoxLabel[i].AWinPos.X2 = 171.0000000 + float(175 * i);
        InvenBoxLabel[i].AWinPos.Y2 = 414.0000000;
        InvenBoxLabel[i].Caption = strFilter[i + 1];
        InvenBoxLabel[i].CaptionDrawType = 3;
        InvenBoxLabel[i].SetFontSizeAll(9);
        InvenBoxLabel[i].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite());
        AppendComponent(InvenBoxLabel[i]);
        i++;
        // [Loop Continue]
        goto J0xA48;
    }
    WeaponDescript = new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK';
    WeaponDescript.bUseAWinPos = true;
    WeaponDescript.AWinPos.X1 = 625.0000000;
    WeaponDescript.AWinPos.Y1 = 251.0000000;
    WeaponDescript.AWinPos.X2 = 955.0000000;
    WeaponDescript.AWinPos.Y2 = 280.0000000;
    WeaponDescript.InitComponent(MyController, self);
    WeaponDescript.SetFontSizeAll(8);
    WeaponDescript.SetFontColor(byte(255), byte(255), byte(255), byte(255));
    WeaponDescript.SetVisibleLineCount(3);
    WeaponDescript.bReadOnly = true;
    WeaponDescript.TextStr = "-";
    AppendComponent(WeaponDescript);
    WeaponNameLabel = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    WeaponNameLabel.bUseAWinPos = true;
    WeaponNameLabel.AWinPos.X1 = 100.0000000;
    WeaponNameLabel.AWinPos.Y1 = 125.0000000;
    WeaponNameLabel.AWinPos.X2 = 529.0000000;
    WeaponNameLabel.AWinPos.Y2 = 140.0000000;
    WeaponNameLabel.CaptionDrawType = 3;
    WeaponNameLabel.SetFontSizeAll(11);
    WeaponNameLabel.SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(byte(255), 198, 0, byte(255)));
    WeaponNameLabel.Caption = "-";
    AppendComponent(WeaponNameLabel);
    MyData = new Class'GUIWarfareControls_Decompressed.BTItemCommonInfoHK';
    UpdateDefaultWindow();
    i = 0;
    J0xDB7:

    // End:0xF56 [Loop If]
    if(i < 1)
    {
        btWeapon[i] = BTModelWeaponHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTModelWeaponHK', fbLabelBackgroundWeapon[i], 0.9900000));
        btWeapon[i].AWinPos.Y1 = (btWeapon[i].AWinPos.Y1 * float(Controller.ResY)) / 768.0000000;
        btWeapon[i].AWinPos.Y2 = (btWeapon[i].AWinPos.Y2 * float(Controller.ResY)) / 768.0000000;
        btWeapon[i].ApplyAWinPos();
        btWeapon[i].bAcceptsInput = true;
        roWeapon[i] = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls_Decompressed.BTROModelWeapon');
        roWeapon[i].Init();
        roWeapon[i].AWinPos = btWeapon[i].AWinPos;
        btWeapon[i].cModel = roWeapon[i];
        i++;
        // [Loop Continue]
        goto J0xDB7;
    }
    CurrentItemInfo = new Class'Engine.wItemBoxHK';
    CurrentInstanceInfo = new Class'Engine.wItemBoxInstanceHK';
    WantedItemInfo = new Class'Engine.wItemBoxHK';
    WantedInstanceInfo = new Class'Engine.wItemBoxInstanceHK';
    //return;    
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
            instanceInfo = new Class'Engine.wItemBoxInstanceHK';
            instanceInfo.ItemID = ItemInfo.ItemID;
            instanceInfo.UniqueID = SelectedItemUniqueID;
            instanceInfo.PartID = 0;
        }
        instanceInfo.PaintID = SelectedPaintingID;
        bIsExist = true;
    }
    // End:0x17E
    if(bIsExist == false)
    {
        btnSelectedCustomItems[0].SetData(none, none);
        btnRemoveOrRollback[0].SetVisibility(false);
        SelectedProductNo[4] = 0;        
    }
    else
    {
        // End:0x1A8
        if(ItemInfo.IsCashItem() == true)
        {
            AddCashItemInfo(GameMgr, ItemInfo, instanceInfo);
        }
        btnSelectedCustomItems[0].SetData(ItemInfo, instanceInfo);
        // End:0x1E2
        if(IsEnableRemove[0] > 0)
        {
            btnRemoveOrRollback[0].SetVisibility(true);
        }
        // End:0x220
        if(OriginalPaintingID != SelectedPaintingID)
        {
            btnRemoveOrRollback[0].Caption = strRollback;
            btnRemoveOrRollback[0].__OnClick__Delegate = CustomPaintPartsButton_OnClick;            
        }
        else
        {
            btnRemoveOrRollback[0].Caption = strRemove;
            btnRemoveOrRollback[0].__OnClick__Delegate = PaintRemoveButton_OnClick;
            SelectedProductNo[4] = 0;
        }
    }
    bIsExist = false;
    // End:0x340
    if(iSightPartID > 1)
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
        // End:0x340
        if(wcpp.iItemID > 0)
        {
            ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
            instanceInfo = btnSelectedCustomItems[1].itemBox.instanceInfo;
            // End:0x324
            if(instanceInfo == none)
            {
                instanceInfo = new Class'Engine.wItemBoxInstanceHK';
                instanceInfo.ItemID = ItemInfo.ItemID;
                instanceInfo.UniqueID = SelectedItemUniqueID;
            }
            instanceInfo.PartID = iSightPartID;
            bIsExist = true;
        }
    }
    // End:0x37D
    if(bIsExist == false)
    {
        btnSelectedCustomItems[1].SetData(none, none);
        btnRemoveOrRollback[1].SetVisibility(false);
        SelectedProductNo[0] = 0;        
    }
    else
    {
        // End:0x3A7
        if(ItemInfo.IsCashItem() == true)
        {
            AddCashItemInfo(GameMgr, ItemInfo, instanceInfo);
        }
        btnSelectedCustomItems[1].SetData(ItemInfo, instanceInfo);
        // End:0x3E4
        if(IsEnableRemove[1] > 0)
        {
            btnRemoveOrRollback[1].SetVisibility(true);            
        }
        else
        {
            btnRemoveOrRollback[1].SetVisibility(false);
        }
        // End:0x43B
        if((OriginalUnionedPartID & 1023) != iSightPartID)
        {
            btnRemoveOrRollback[1].Caption = strRollback;
            btnRemoveOrRollback[1].__OnClick__Delegate = CustomPartsButton_OnClick;            
        }
        else
        {
            btnRemoveOrRollback[1].Caption = strRemove;
            btnRemoveOrRollback[1].__OnClick__Delegate = RemoveButton_OnClick;
            SelectedProductNo[0] = 0;
        }
    }
    bIsExist = false;
    // End:0x57B
    if(iBarrelPartID > (1 << 10))
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iBarrelPartID);
        // End:0x57B
        if(wcpp.iItemID > 0)
        {
            ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
            instanceInfo = btnSelectedCustomItems[3].itemBox.instanceInfo;
            // End:0x543
            if(instanceInfo == none)
            {
                instanceInfo = new Class'Engine.wItemBoxInstanceHK';
                instanceInfo.ItemID = ItemInfo.ItemID;
                instanceInfo.UniqueID = SelectedItemUniqueID;
            }
            instanceInfo.PartID = iBarrelPartID;
            btnSelectedCustomItems[3].SetData(ItemInfo, instanceInfo);
            bIsExist = true;
        }
    }
    // End:0x5BA
    if(bIsExist == false)
    {
        btnSelectedCustomItems[3].SetData(none, none);
        btnRemoveOrRollback[3].SetVisibility(false);
        SelectedProductNo[1] = 0;        
    }
    else
    {
        // End:0x5E4
        if(ItemInfo.IsCashItem() == true)
        {
            AddCashItemInfo(GameMgr, ItemInfo, instanceInfo);
        }
        btnSelectedCustomItems[3].SetData(ItemInfo, instanceInfo);
        // End:0x624
        if(IsEnableRemove[3] > 0)
        {
            btnRemoveOrRollback[3].SetVisibility(true);            
        }
        else
        {
            btnRemoveOrRollback[3].SetVisibility(false);
        }
        // End:0x67E
        if((OriginalUnionedPartID & 130048) != iBarrelPartID)
        {
            btnRemoveOrRollback[3].Caption = strRollback;
            btnRemoveOrRollback[3].__OnClick__Delegate = CustomPartsButton_OnClick;            
        }
        else
        {
            btnRemoveOrRollback[3].Caption = strRemove;
            btnRemoveOrRollback[3].__OnClick__Delegate = RemoveButton_OnClick;
            SelectedProductNo[1] = 0;
        }
    }
    bIsExist = false;
    // End:0x7C0
    if(iSilencerPartID > (1 << 17))
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        // End:0x7C0
        if(wcpp.iItemID > 0)
        {
            ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
            instanceInfo = btnSelectedCustomItems[2].itemBox.instanceInfo;
            // End:0x788
            if(instanceInfo == none)
            {
                instanceInfo = new Class'Engine.wItemBoxInstanceHK';
                instanceInfo.ItemID = ItemInfo.ItemID;
                instanceInfo.UniqueID = SelectedItemUniqueID;
            }
            instanceInfo.PartID = iSilencerPartID;
            btnSelectedCustomItems[2].SetData(ItemInfo, instanceInfo);
            bIsExist = true;
        }
    }
    // End:0x800
    if(bIsExist == false)
    {
        btnSelectedCustomItems[2].SetData(none, none);
        btnRemoveOrRollback[2].SetVisibility(false);
        SelectedProductNo[2] = 0;        
    }
    else
    {
        // End:0x82A
        if(ItemInfo.IsCashItem() == true)
        {
            AddCashItemInfo(GameMgr, ItemInfo, instanceInfo);
        }
        btnSelectedCustomItems[2].SetData(ItemInfo, instanceInfo);
        // End:0x86A
        if(IsEnableRemove[2] > 0)
        {
            btnRemoveOrRollback[2].SetVisibility(true);            
        }
        else
        {
            btnRemoveOrRollback[2].SetVisibility(false);
        }
        // End:0x8C4
        if((OriginalUnionedPartID & 16646144) != iSilencerPartID)
        {
            btnRemoveOrRollback[2].Caption = strRollback;
            btnRemoveOrRollback[2].__OnClick__Delegate = CustomPartsButton_OnClick;            
        }
        else
        {
            btnRemoveOrRollback[2].Caption = strRemove;
            btnRemoveOrRollback[2].__OnClick__Delegate = RemoveButton_OnClick;
            SelectedProductNo[2] = 0;
        }
    }
    bIsExist = false;
    // End:0xA07
    if(iGunstockPartID > (1 << 24))
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iGunstockPartID);
        // End:0xA07
        if(wcpp.iItemID > 0)
        {
            ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
            instanceInfo = btnSelectedCustomItems[4].itemBox.instanceInfo;
            // End:0x9CF
            if(instanceInfo == none)
            {
                instanceInfo = new Class'Engine.wItemBoxInstanceHK';
                instanceInfo.ItemID = ItemInfo.ItemID;
                instanceInfo.UniqueID = SelectedItemUniqueID;
            }
            instanceInfo.PartID = iGunstockPartID;
            btnSelectedCustomItems[4].SetData(ItemInfo, instanceInfo);
            bIsExist = true;
        }
    }
    // End:0xA47
    if(bIsExist == false)
    {
        btnSelectedCustomItems[4].SetData(none, none);
        btnRemoveOrRollback[4].SetVisibility(false);
        SelectedProductNo[3] = 0;        
    }
    else
    {
        // End:0xA71
        if(ItemInfo.IsCashItem() == true)
        {
            AddCashItemInfo(GameMgr, ItemInfo, instanceInfo);
        }
        btnSelectedCustomItems[4].SetData(ItemInfo, instanceInfo);
        // End:0xAB1
        if(IsEnableRemove[4] > 0)
        {
            btnRemoveOrRollback[4].SetVisibility(true);            
        }
        else
        {
            btnRemoveOrRollback[4].SetVisibility(false);
        }
        // End:0xB0B
        if((OriginalUnionedPartID & 2130706432) != iGunstockPartID)
        {
            btnRemoveOrRollback[4].Caption = strRollback;
            btnRemoveOrRollback[4].__OnClick__Delegate = CustomPartsButton_OnClick;            
        }
        else
        {
            btnRemoveOrRollback[4].Caption = strRemove;
            btnRemoveOrRollback[4].__OnClick__Delegate = RemoveButton_OnClick;
            SelectedProductNo[3] = 0;
        }
    }
    roWeapon[0].ChangeWeapon(SelectedItemID, SelectedUnionedPartID, self.GetSelectedPaintingItemID());
    roWeapon[0].SetPositionUI(vDisplay_3d.X, vDisplay_3d.Y, vDisplay_3d.Z);
    roWeapon[0].SetRotationUI(fDisplay_rot_y);
    WantedInstanceInfo.PartID = SelectedUnionedPartID;
    WantedInstanceInfo.PaintID = self.SelectedPaintingID;
    self.ItemStateView.SetData(self.WantedItemInfo, self.WantedInstanceInfo, self.CurrentItemInfo, self.CurrentInstanceInfo);
    //return;    
}

function bool CustomPaintPartsButton_OnClick(GUIComponent Sender)
{
    // End:0x2F
    if(self.SelectedPaintingID > 0)
    {
        // End:0x2F
        if(SelectedPaintingID != self.OriginalPaintingID)
        {
            SelectedPaintingID = OriginalPaintingID;
        }
    }
    Refresh();
    return true;
    //return;    
}

function bool CustomPartsButton_OnClick(GUIComponent Sender)
{
    local int iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID, iTempPartID;

    local export editinline BTOwnerDrawCaptionButtonHK senderButton;

    senderButton = BTOwnerDrawCaptionButtonHK(Sender);
    iSightPartID = SelectedUnionedPartID & 1023;
    iBarrelPartID = SelectedUnionedPartID & 130048;
    iSilencerPartID = SelectedUnionedPartID & 16646144;
    iGunstockPartID = SelectedUnionedPartID & 2130706432;
    // End:0xA6
    if(senderButton.ButtonID == 1)
    {
        iTempPartID = OriginalUnionedPartID & 1023;
        // End:0xA3
        if(iSightPartID > 1)
        {
            // End:0xA3
            if(iSightPartID != iTempPartID)
            {
                iSightPartID = iTempPartID;
            }
        }        
    }
    else
    {
        // End:0xF9
        if(senderButton.ButtonID == 2)
        {
            iTempPartID = OriginalUnionedPartID & 16646144;
            // End:0xF6
            if(iSilencerPartID > (1 << 17))
            {
                // End:0xF6
                if(iSilencerPartID != iTempPartID)
                {
                    iSilencerPartID = iTempPartID;
                }
            }            
        }
        else
        {
            // End:0x14C
            if(senderButton.ButtonID == 3)
            {
                iTempPartID = OriginalUnionedPartID & 130048;
                // End:0x149
                if(iBarrelPartID > (1 << 10))
                {
                    // End:0x149
                    if(iBarrelPartID != iTempPartID)
                    {
                        iBarrelPartID = iTempPartID;
                    }
                }                
            }
            else
            {
                // End:0x19C
                if(senderButton.ButtonID == 4)
                {
                    iTempPartID = OriginalUnionedPartID & 2130706432;
                    // End:0x19C
                    if(iGunstockPartID > (1 << 24))
                    {
                        // End:0x19C
                        if(iGunstockPartID != iTempPartID)
                        {
                            iGunstockPartID = iTempPartID;
                        }
                    }
                }
            }
        }
    }
    SelectedUnionedPartID = ((iSightPartID | iBarrelPartID) | iSilencerPartID) | iGunstockPartID;
    Refresh();
    return false;
    //return;    
}

function bool PaintRemoveButton_OnClick(GUIComponent Sender)
{
    self.SelectedPaintingID = 0;
    Refresh();
    return true;
    //return;    
}

function bool RemoveButton_OnClick(GUIComponent Sender)
{
    local int iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID;
    local export editinline BTOwnerDrawCaptionButtonHK senderButton;

    senderButton = BTOwnerDrawCaptionButtonHK(Sender);
    iSightPartID = SelectedUnionedPartID & 1023;
    iBarrelPartID = SelectedUnionedPartID & 130048;
    iSilencerPartID = SelectedUnionedPartID & 16646144;
    iGunstockPartID = SelectedUnionedPartID & 2130706432;
    // End:0x76
    if(senderButton.ButtonID == 1)
    {
        iSightPartID = 1;        
    }
    else
    {
        // End:0x99
        if(senderButton.ButtonID == 2)
        {
            iSilencerPartID = 1 << 17;            
        }
        else
        {
            // End:0xBC
            if(senderButton.ButtonID == 3)
            {
                iBarrelPartID = 1 << 10;                
            }
            else
            {
                // End:0xDC
                if(senderButton.ButtonID == 4)
                {
                    iGunstockPartID = 1 << 24;
                }
            }
        }
    }
    SelectedUnionedPartID = ((iSightPartID | iBarrelPartID) | iSilencerPartID) | iGunstockPartID;
    Refresh();
    return true;
    //return;    
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
    // End:0x122
    if(PartIndex > (1 << 24))
    {
        iGunstockPartID = PartIndex;
        // End:0x11F
        if((instanceInfo.cashItemInfo != none) && UseGP20())
        {
            SelectedProductNo[3] = instanceInfo.cashItemInfo.WZPriceSeq[0];
        }        
    }
    else
    {
        // End:0x180
        if(PartIndex > (1 << 17))
        {
            iSilencerPartID = PartIndex;
            // End:0x17D
            if((instanceInfo.cashItemInfo != none) && UseGP20())
            {
                SelectedProductNo[2] = instanceInfo.cashItemInfo.WZPriceSeq[0];
            }            
        }
        else
        {
            // End:0x1DD
            if(PartIndex > (1 << 10))
            {
                iBarrelPartID = PartIndex;
                // End:0x1DA
                if((instanceInfo.cashItemInfo != none) && UseGP20())
                {
                    SelectedProductNo[1] = instanceInfo.cashItemInfo.WZPriceSeq[0];
                }                
            }
            else
            {
                // End:0x233
                if(PartIndex > 1)
                {
                    iSightPartID = PartIndex;
                    // End:0x233
                    if((instanceInfo.cashItemInfo != none) && UseGP20())
                    {
                        SelectedProductNo[0] = instanceInfo.cashItemInfo.WZPriceSeq[0];
                    }
                }
            }
        }
    }
    SelectedUnionedPartID = ((iSightPartID | iBarrelPartID) | iSilencerPartID) | iGunstockPartID;
    // End:0x2BC
    if(instanceInfo.PaintID > 0)
    {
        SelectedPaintingID = instanceInfo.PaintID;
        // End:0x2BC
        if((instanceInfo.cashItemInfo != none) && UseGP20())
        {
            SelectedProductNo[4] = instanceInfo.cashItemInfo.WZPriceSeq[0];
        }
    }
    Refresh();
    //return;    
}

function bool ButtonInit_OnClick(GUIComponent Sender)
{
    SelectedPaintingID = OriginalPaintingID;
    SelectedUnionedPartID = OriginalUnionedPartID;
    Refresh();
    return true;
    //return;    
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
    if((ib.IsCashItem() == true) && ibi.cashItemInfo != none)
    {
        WeaponNameLabel.Caption = ibi.cashItemInfo.WZItemName;
        WeaponDescript.SetText(ibi.cashItemInfo.WZItemDescription);        
    }
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

    // End:0x2E1 [Loop If]
    if(i < ib.PartAllList.Length)
    {
        CurrentItemInfo.PartAllList[i] = ib.PartAllList[i];
        i++;
        // [Loop Continue]
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
    J0x3EF:

    // End:0x43B [Loop If]
    if(i < ib.PartAllList.Length)
    {
        WantedItemInfo.PartAllList[i] = ib.PartAllList[i];
        i++;
        // [Loop Continue]
        goto J0x3EF;
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

    // End:0x58F [Loop If]
    if(i < ib.PartAllList.Length)
    {
        // End:0x4E3
        if((ib.PartAllList[i].PartID & 1023) == 1)
        {
            IsEnableRemove[1] = 1;
            // [Explicit Continue]
            goto J0x585;
        }
        // End:0x51A
        if((ib.PartAllList[i].PartID & 16646144) == (1 << 17))
        {
            IsEnableRemove[2] = 1;
            // [Explicit Continue]
            goto J0x585;
        }
        // End:0x551
        if((ib.PartAllList[i].PartID & 130048) == (1 << 10))
        {
            IsEnableRemove[3] = 1;
            // [Explicit Continue]
            goto J0x585;
        }
        // End:0x585
        if((ib.PartAllList[i].PartID & 2130706432) == (1 << 24))
        {
            IsEnableRemove[4] = 1;
        }
        J0x585:

        i++;
        // [Loop Continue]
        goto J0x498;
    }
    i = 0;
    J0x596:

    // End:0x602 [Loop If]
    if(i < 5)
    {
        btnRemoveOrRollback[i].SetVisibility(false);
        // End:0x5E2
        if(IsEnableRemove[i] > 0)
        {
            btnRemoveOrRollback[i].SetEnabled(true);
            // [Explicit Continue]
            goto J0x5F8;
        }
        btnRemoveOrRollback[i].SetEnabled(false);
        J0x5F8:

        i++;
        // [Loop Continue]
        goto J0x596;
    }
    PaintingInfos = ib.PaintGroupList;
    OriginalPaintingItemID = ibi.PaintID;
    // End:0x6B1
    if((OriginalPaintingItemID == 0) && PaintingInfos.Length == 0)
    {
        wcip = GameMgr.GetWeaponCustomInfoParam(ibi.ItemID);
        // End:0x6B1
        if((wcip.iItemID > 0) && wcip.iItemID == ibi.ItemID)
        {
            OriginalPaintingItemID = wcip.iDefaultPaintingID;
        }
    }
    i = 0;
    J0x6B8:

    // End:0x952 [Loop If]
    if(i < PaintingInfos.Length)
    {
        ItemInfo = GameMgr.FindUIItem(PaintingInfos[i].PaintingItemID);
        // End:0x6FB
        if(ItemInfo == none)
        {
            // [Explicit Continue]
            goto J0x948;
        }
        // End:0x734
        if(PaintingInfos[i].PaintingItemID == ibi.PaintID)
        {
            SelectedPaintingID = PaintingInfos[i].PaintingID;
        }
        // End:0x772
        if(ItemInfo.IsCashItem() == false)
        {
            // End:0x76F
            if(GameMgr.IsExistShopItemList(ItemInfo.ItemID) == 0)
            {
                // [Explicit Continue]
                goto J0x948;
            }            
        }
        else
        {
            // End:0x793
            if(!IsShowCashItem(GameMgr, ItemInfo.ItemID))
            {
                // [Explicit Continue]
                goto J0x948;
            }
        }
        ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
        ro.Init();
        ro.ItemInfo = ItemInfo;
        instanceInfo = new Class'Engine.wItemBoxInstanceHK';
        instanceInfo.ItemID = ItemInfo.ItemID;
        instanceInfo.UniqueID = ibi.UniqueID;
        instanceInfo.PartID = 0;
        instanceInfo.PaintID = PaintingInfos[i].PaintingID;
        ro.instanceInfo = instanceInfo;
        ro.SetGameManager(GameMgr);
        // End:0x8DD
        if(ro.ItemInfo.IsCashItem() == true)
        {
            AddCashItemInfo(GameMgr, ItemInfo, instanceInfo);
            // End:0x8DD
            if(UseGP20())
            {
                ro.UnderExtraTextForm.Text = strPCoinOnly;
                ro.UnderExtraTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Cash();
            }
        }
        ro.ChangeState(20);
        ro.MyData = MyData;
        ro.Update();
        ro.bUseCache = true;
        ACLList_All.AddRenderObject(ro);
        DataPool[DataPool.Length] = ro;
        J0x948:

        i++;
        // [Loop Continue]
        goto J0x6B8;
    }
    iSightPartID = ibi.PartID & 1023;
    iBarrelPartID = ibi.PartID & 130048;
    iSilencerPartID = ibi.PartID & 16646144;
    iGunstockPartID = ibi.PartID & 2130706432;
    // End:0x9D0
    if(iSightPartID == 0)
    {
        iSightPartID = 1;
    }
    // End:0x9E6
    if(iBarrelPartID == 0)
    {
        iBarrelPartID = 1 << 10;
    }
    // End:0x9FC
    if(iSilencerPartID == 0)
    {
        iSilencerPartID = 1 << 17;
    }
    // End:0xA12
    if(iGunstockPartID == 0)
    {
        iGunstockPartID = 1 << 24;
    }
    i = 0;
    J0xA19:

    // End:0xC95 [Loop If]
    if(i < ib.PartAllList.Length)
    {
        ItemInfo = GameMgr.FindUIItem(ib.PartAllList[i].ItemID);
        // End:0xA6E
        if(ItemInfo == none)
        {
            // [Explicit Continue]
            goto J0xC8B;
        }
        // End:0xAAC
        if(ItemInfo.IsCashItem() == false)
        {
            // End:0xAA9
            if(GameMgr.IsExistShopItemList(ItemInfo.ItemID) == 0)
            {
                // [Explicit Continue]
                goto J0xC8B;
            }            
        }
        else
        {
            // End:0xACD
            if(!IsShowCashItem(GameMgr, ItemInfo.ItemID))
            {
                // [Explicit Continue]
                goto J0xC8B;
            }
        }
        ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
        ro.Init();
        ro.ItemInfo = ItemInfo;
        instanceInfo = new Class'Engine.wItemBoxInstanceHK';
        instanceInfo.ItemID = ItemInfo.ItemID;
        instanceInfo.UniqueID = ibi.UniqueID;
        instanceInfo.PartID = ib.PartAllList[i].PartID;
        instanceInfo.PaintID = 0;
        ro.instanceInfo = instanceInfo;
        ro.SetGameManager(GameMgr);
        // End:0xC20
        if(ro.ItemInfo.IsCashItem() == true)
        {
            AddCashItemInfo(GameMgr, ItemInfo, instanceInfo);
            // End:0xC20
            if(UseGP20())
            {
                ro.UnderExtraTextForm.Text = strPCoinOnly;
                ro.UnderExtraTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Cash();
            }
        }
        ro.ChangeState(20);
        ro.MyData = MyData;
        ro.Update();
        ro.bUseCache = true;
        ACLList_All.AddRenderObject(ro);
        DataPool[DataPool.Length] = ro;
        J0xC8B:

        i++;
        // [Loop Continue]
        goto J0xA19;
    }
    SelectedItemID = ibi.ItemID;
    SelectedUnionedPartID = ((iSightPartID | iBarrelPartID) | iSilencerPartID) | iGunstockPartID;
    SelectedItemUniqueID = ibi.UniqueID;
    vDisplay_3d = ib.vDisplay_3d;
    fDisplay_rot_y = ib.fDisplay_3d_rot_y;
    OriginalPaintingID = SelectedPaintingID;
    OriginalUnionedPartID = SelectedUnionedPartID;
    // End:0xDF6
    if(SelectedPaintingID > 0)
    {
        pgp = GameMgr.GetPaintGroupParam(SelectedPaintingID);
        ItemInfo = GameMgr.FindUIItem(pgp.PaintingItemID);
        // End:0xDF6
        if(ItemInfo != none)
        {
            instanceInfo = new Class'Engine.wItemBoxInstanceHK';
            instanceInfo.ItemID = ItemInfo.ItemID;
            instanceInfo.UniqueID = ibi.UniqueID;
            instanceInfo.PartID = 0;
            instanceInfo.PaintID = SelectedPaintingID;
            btnSelectedCustomItems[0].SetData(ItemInfo, instanceInfo);
        }
    }
    // End:0xED1
    if(iSightPartID > 1)
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
        ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
        // End:0xED1
        if(ItemInfo != none)
        {
            instanceInfo = new Class'Engine.wItemBoxInstanceHK';
            instanceInfo.ItemID = ItemInfo.ItemID;
            instanceInfo.UniqueID = ibi.UniqueID;
            instanceInfo.PartID = iSightPartID;
            instanceInfo.PaintID = 0;
            btnSelectedCustomItems[1].SetData(ItemInfo, instanceInfo);
        }
    }
    // End:0xFB1
    if(iSilencerPartID > (1 << 17))
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
        ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
        // End:0xFB1
        if(ItemInfo != none)
        {
            instanceInfo = new Class'Engine.wItemBoxInstanceHK';
            instanceInfo.ItemID = ItemInfo.ItemID;
            instanceInfo.UniqueID = ibi.UniqueID;
            instanceInfo.PartID = iSilencerPartID;
            instanceInfo.PaintID = 0;
            btnSelectedCustomItems[2].SetData(ItemInfo, instanceInfo);
        }
    }
    // End:0x1091
    if(iBarrelPartID > (1 << 10))
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iBarrelPartID);
        ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
        // End:0x1091
        if(ItemInfo != none)
        {
            instanceInfo = new Class'Engine.wItemBoxInstanceHK';
            instanceInfo.ItemID = ItemInfo.ItemID;
            instanceInfo.UniqueID = ibi.UniqueID;
            instanceInfo.PartID = iBarrelPartID;
            instanceInfo.PaintID = 0;
            btnSelectedCustomItems[3].SetData(ItemInfo, instanceInfo);
        }
    }
    // End:0x1171
    if(iGunstockPartID > (1 << 24))
    {
        wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iGunstockPartID);
        ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
        // End:0x1171
        if(ItemInfo != none)
        {
            instanceInfo = new Class'Engine.wItemBoxInstanceHK';
            instanceInfo.ItemID = ItemInfo.ItemID;
            instanceInfo.UniqueID = ibi.UniqueID;
            instanceInfo.PartID = iGunstockPartID;
            instanceInfo.PaintID = 0;
            btnSelectedCustomItems[4].SetData(ItemInfo, instanceInfo);
        }
    }
    i = 0;
    J0x1178:

    // End:0x11B1 [Loop If]
    if(i < 5)
    {
        btnSelectedCustomItems[i].itemBox.MyData = MyData;
        i++;
        // [Loop Continue]
        goto J0x1178;
    }
    Refresh();
    //return;    
}

function Internal_OnClose(optional bool bCancelled)
{
    roWeapon[0].EndModel();
    //return;    
}

function SetPaintingSempleButton(int SelectedIdx)
{
    //return;    
}

function bool ButtonGroups_OnClick(GUIComponent Sender)
{
    local int UI_Durability;
    local wItemBoxHK ItemInfo;
    local int PartIndex;

    // End:0xD9
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
    //return;    
}

function BtrDouble GetSelectedItemUniqueID()
{
    return SelectedItemUniqueID;
    //return;    
}

function int GetSelectedUnionedPartID()
{
    return SelectedUnionedPartID;
    //return;    
}

function int GetSelectedPaintingItemID()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4C [Loop If]
    if(i < PaintingInfos.Length)
    {
        // End:0x42
        if(PaintingInfos[i].PaintingID == SelectedPaintingID)
        {
            return PaintingInfos[i].PaintingItemID;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x5E
    if(PaintingInfos.Length == 0)
    {
        return OriginalPaintingItemID;
    }
    return -1;
    //return;    
}

function int GetSelectedPaintingID()
{
    return SelectedPaintingID;
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

function bool FilterButton_OnClick(GUIComponent Sender)
{
    TabControl.SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    ChangeItemList(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    FilterTabBtnIdx = byte(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
    //return;    
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
        J0x5D:

        // End:0x96 [Loop If]
        if(i < self.DataPool.Length)
        {
            ACLList_All.AddRenderObject(DataPool[i]);
            i++;
            // [Loop Continue]
            goto J0x5D;
        }        
    }
    else
    {
        // End:0x10A
        if(FilterIndex == 1)
        {
            i = 0;
            J0xAB:

            // End:0x107 [Loop If]
            if(i < self.DataPool.Length)
            {
                // End:0xFD
                if(DataPool[i].instanceInfo.PaintID > 0)
                {
                    ACLList_All.AddRenderObject(DataPool[i]);
                }
                i++;
                // [Loop Continue]
                goto J0xAB;
            }            
        }
        else
        {
            // End:0x183
            if(FilterIndex == 2)
            {
                i = 0;
                J0x11D:

                // End:0x180 [Loop If]
                if(i < self.DataPool.Length)
                {
                    // End:0x176
                    if((DataPool[i].instanceInfo.PartID & 1023) > 1)
                    {
                        ACLList_All.AddRenderObject(DataPool[i]);
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x11D;
                }                
            }
            else
            {
                // End:0x200
                if(FilterIndex == 3)
                {
                    i = 0;
                    J0x196:

                    // End:0x1FD [Loop If]
                    if(i < self.DataPool.Length)
                    {
                        // End:0x1F3
                        if((DataPool[i].instanceInfo.PartID & 16646144) > (1 << 17))
                        {
                            ACLList_All.AddRenderObject(DataPool[i]);
                        }
                        i++;
                        // [Loop Continue]
                        goto J0x196;
                    }                    
                }
                else
                {
                    // End:0x27D
                    if(FilterIndex == 4)
                    {
                        i = 0;
                        J0x213:

                        // End:0x27A [Loop If]
                        if(i < self.DataPool.Length)
                        {
                            // End:0x270
                            if((DataPool[i].instanceInfo.PartID & 130048) > (1 << 10))
                            {
                                ACLList_All.AddRenderObject(DataPool[i]);
                            }
                            i++;
                            // [Loop Continue]
                            goto J0x213;
                        }                        
                    }
                    else
                    {
                        // End:0x2F7
                        if(FilterIndex == 5)
                        {
                            i = 0;
                            J0x290:

                            // End:0x2F7 [Loop If]
                            if(i < self.DataPool.Length)
                            {
                                // End:0x2ED
                                if((DataPool[i].instanceInfo.PartID & 2130706432) > (1 << 24))
                                {
                                    ACLList_All.AddRenderObject(DataPool[i]);
                                }
                                i++;
                                // [Loop Continue]
                                goto J0x290;
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function bool Confirm_OnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return OnOK(self);
    //return;    
}

function bool GetPaintPrice(int iPaintID, out int iOutPoint, out int iOutCash)
{
    local wItemBaseParam ItemParam;
    local wPaintGroupParam pgp;
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local int iResult;
    local wGP20Product gp20Product;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    pgp = GameMgr.GetPaintGroupParam(iPaintID);
    // End:0x56
    if(pgp == none)
    {
        return false;
    }
    ItemParam = GameMgr.GetItemParam(pgp.PaintingItemID);
    ItemInfo = GameMgr.FindUIItem(pgp.PaintingItemID);
    // End:0xA9
    if(ItemParam == none)
    {
        return false;
    }
    iOutPoint = ItemParam.iPointPrice[0];
    // End:0x13C
    if(ItemInfo.IsCashItem())
    {
        // End:0x126
        if(UseGP20())
        {
            gp20Product = GameMgr.GetGP20ProductFromCode(pgp.PaintingItemID, iResult);
            // End:0x123
            if(iResult == 1)
            {
                iOutCash = gp20Product.GetPrice(0);
            }            
        }
        else
        {
            iOutCash = ItemParam.iCashPrice[0];
        }
    }
    return true;
    //return;    
}

function bool GetPartPrice(int iPartID, out int iOutPoint, out int iOutCash)
{
    local wWeaponCustomPartsParam wcpp;
    local wItemBaseParam ItemParam;
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local int iResult;
    local wGP20Product gp20Product;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iPartID);
    // End:0x136
    if(wcpp.iItemID > 0)
    {
        ItemParam = GameMgr.GetItemParam(wcpp.iItemID);
        ItemInfo = GameMgr.FindUIItem(wcpp.iItemID);
        iOutPoint = ItemParam.iPointPrice[0];
        // End:0x136
        if(ItemInfo.IsCashItem())
        {
            // End:0x120
            if(UseGP20())
            {
                gp20Product = GameMgr.GetGP20ProductFromCode(wcpp.iItemID, iResult);
                // End:0x11D
                if(iResult == 1)
                {
                    iOutCash = gp20Product.GetPrice(0);
                }                
            }
            else
            {
                iOutCash = ItemParam.iCashPrice[0];
            }
        }
    }
    return false;
    //return;    
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
    if((OriginalPaintingID != SelectedPaintingID) && SelectedPaintingID > 0)
    {
        GetPaintPrice(SelectedPaintingID, iGetPoint, iGetCash);
        iSumPoint += iGetPoint;
        iSumCash += iGetCash;
    }
    iGetPoint = 0;
    iGetCash = 0;
    // End:0x1A2
    if((iOrigSightPartID != iDestSightPartID) && iDestSightPartID > 1)
    {
        self.GetPartPrice(iDestSightPartID, iGetPoint, iGetCash);
        iSumPoint += iGetPoint;
        iSumCash += iGetCash;
    }
    iGetPoint = 0;
    iGetCash = 0;
    // End:0x1FE
    if((iOrigBarrelPartID != iDestBarrelPartID) && iDestBarrelPartID > 1)
    {
        self.GetPartPrice(iDestBarrelPartID, iGetPoint, iGetCash);
        iSumPoint += iGetPoint;
        iSumCash += iGetCash;
    }
    iGetPoint = 0;
    iGetCash = 0;
    // End:0x25A
    if((iOrigSilencerPartID != iDestSilencerPartID) && iDestSilencerPartID > 1)
    {
        self.GetPartPrice(iDestSilencerPartID, iGetPoint, iGetCash);
        iSumPoint += iGetPoint;
        iSumCash += iGetCash;
    }
    iGetPoint = 0;
    iGetCash = 0;
    // End:0x2B6
    if((iOrigGunstockPartID != iDestGunstockPartID) && iDestGunstockPartID > 1)
    {
        self.GetPartPrice(iDestGunstockPartID, iGetPoint, iGetCash);
        iSumPoint += iGetPoint;
        iSumCash += iGetCash;
    }
    // End:0x2FC
    if((((MM.kPoint < 0) || MM.kCash < 0) || iSumPoint < 0) || iSumCash < 0)
    {
        return 0;
    }
    // End:0x319
    if((MM.kPoint - iSumPoint) < 0)
    {
        return 0;
    }
    // End:0x336
    if((MM.kCash - iSumCash) < 0)
    {
        return 1;
    }
    return 2;
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    // End:0x38
    if((OriginalUnionedPartID == SelectedUnionedPartID) && OriginalPaintingID == SelectedPaintingID)
    {
        Class'GUIWarfareControls_Decompressed.BTWindowErrorDefineHK'.static.ShowError(Controller, 100);
        return false;
    }
    switch(IsEnoughMoney())
    {
        // End:0x5C
        case 0:
            Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 204);
            return false;
        // End:0x78
        case 1:
            Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 205);
            return false;
        // End:0x80
        case 2:
            // End:0x83
            break;
        // End:0xFFFF
        default:
            break;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowCustomConfirm");
    BTWindowCustomConfirm(Controller.TopPage()).SetData(OriginalUnionedPartID, SelectedUnionedPartID, self.OriginalPaintingID, self.SelectedPaintingID);
    BTWindowCustomConfirm(Controller.TopPage()).__OnOK__Delegate = Confirm_OnClick;
    //return;    
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    return OnCancel(self);
    //return;    
}

function bool IsShowCashItem(wGameManager GameMgr, int ItemID)
{
    local int j;
    local wGP20Product gp20P;

    // End:0x46
    if(UseGP20())
    {
        gp20P = GameMgr.GetGP20ProductFromCode(ItemID, j);
        // End:0x43
        if(j == 1)
        {
            return gp20P.HasPCoin();
        }        
    }
    else
    {
        GameMgr.GetWebzenShopPackage2(ItemID, j);
        // End:0x6C
        if(j == 1)
        {
            return true;
        }
    }
    return false;
    //return;    
}

function AddCashItemInfo(wGameManager GameMgr, out wItemBoxHK ItemInfo, out wItemBoxInstanceHK instanceInfo)
{
    // End:0x6C
    if(GameMgr.AddCashItem(ItemInfo, instanceInfo, Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetClientString(122)))
    {
        // End:0x6C
        if(UseGP20())
        {
            GameMgr.SetGP20CashItemInfo(ItemInfo, instanceInfo.cashItemInfo.2, instanceInfo.cashItemInfo);
        }
    }
    //return;    
}

defaultproperties
{
    fbLabelBackgroundWeapon=(X1=85.0000000,Y1=114.0000000,X2=613.0000000,Y2=295.0000000)
    strLabelAll[0]="Power/Range"
    strLabelAll[1]="Fire Sound"
    strLabelAll[2]="Durability Loss"
    strLabelSniper[0]="Lv 1 Zoom"
    strLabelSniper[1]="Lv 2 Zoom"
    strLabelSniper[2]="Durability Loss"
    fbACLList_Sight=(X1=673.0000000,Y1=202.0000000,X2=898.0000000,Y2=549.0000000)
    fbACLList_Silencer=(X1=898.0000000,Y1=202.0000000,X2=1098.0000000,Y2=549.0000000)
    fbACLList_Barrel=(X1=1098.0000000,Y1=202.0000000,X2=1298.0000000,Y2=549.0000000)
    fbACLList_Gunstock=(X1=1298.0000000,Y1=202.0000000,X2=1498.0000000,Y2=549.0000000)
    // Reference: ButtonGroups'GUIWarfareControls_Decompressed.BTWindowModifyHK.mgroups'
    begin object name="mgroups" class=GUIWarfareControls_Decompressed.ButtonGroups
    end object
    CustomItemButtonGroup=mgroups
    strRemove="Remove"
    strRollback="Revert"
    fbButtonInit=(X1=324.0000000,Y1=655.0000000,X2=448.0000000,Y2=692.0000000)
    strInit="Reset"
    strFilter[0]="All"
    strFilter[1]="Paint"
    strFilter[2]="Mount"
    strFilter[3]="Front"
    strFilter[4]="Barrel"
    strFilter[5]="Stock"
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTWindowModifyHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    fbACLList_All=(X1=72.0000000,Y1=469.0000000,X2=947.0000000,Y2=643.0000000)
    strPCoinOnly="(P) Coin Only"
    fbBackgroundImage=(X1=19.0000000,Y1=68.0000000,X2=1005.0000000,Y2=708.0000000)
    fbTopLine=(X1=312.0000000,Y1=74.0000000,X2=712.0000000,Y2=89.0000000)
    fbBottomLine=(X1=69.0000000,Y1=636.0000000,X2=956.0000000,Y2=680.0000000)
    fbButtonOK=(X1=450.0000000,Y1=655.0000000,X2=574.0000000,Y2=692.0000000)
    fbButtonCancel=(X1=576.0000000,Y1=655.0000000,X2=700.0000000,Y2=692.0000000)
    strTitle="Modify"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bUseChangeAlpha=true
    bUseTranslate=false
}