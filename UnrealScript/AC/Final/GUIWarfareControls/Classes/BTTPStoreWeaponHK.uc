class BTTPStoreWeaponHK extends BTTabPanelHK
    editinlinenew
    instanced;

var BTTcpLink_Channel TcpChannel;
var() automated ButtonGroups InvenGroup;
var() automated BTStretchedImageHK BackgroundImage;
var() automated FloatBox fbButtonWeapon[8];
var export editinline BTItemBoxButtonHK ButtonWeapon[8];
var localized string strButtonWeapon[11];
var export editinline BTOwnerDrawCaptionButtonHK ButtonAF;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRSA;
var bool bLRMousePressed;
var export editinline BTOwnerDrawCaptionButtonHK ButtonLR;
var bool bRRMousePressed;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRR;
var export editinline BTOwnerDrawImageHK EdgeLine;
var export editinline BTOwnerDrawImageHK AFTeamBG;
var export editinline BTOwnerDrawImageHK RSATeamBG;
var bool bVisibleAFModel;
var localized string strAF;
var localized string strRSA;
var localized string strForGift[2];
var localized string strForMe[2];
var export editinline BTModelHK UIModel;
var BTROModelNew CharacterModel;
var export editinline BTAutoScrollListHK ChatBox;
var localized string strMainMenu[5];
var localized string strSubMenuNewAndHot[4];
var localized string strSubMenuWeapon[5];
var localized string strSubMenuEquip[6];
var localized string strSubMenuSpecial[4];
var localized string strSubMenuCashItem[3];
var array<string> astrSubMenuNewAndHot;
var array<string> astrSubMenuWeapon;
var array<string> astrSubMenuEquip;
var array<string> astrSubMenuSpecial;
var array<string> astrSubMenuCashItem;
var() automated TabControlMocker TabControl[2];
var export editinline BTOwnerDrawCaptionButtonHK MainButton[5];
var export editinline BTOwnerDrawCaptionButtonHK SubButton[6];
var() automated FloatBox fbLabelItemList;
var export editinline BTOwnerDrawImageHK LabelItemList;
var() automated FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var localized string strMenuButton[3];
var() automated FloatBox fbMenuButton[3];
var export editinline BTOwnerDrawCaptionButtonHK MenuButton[3];
var export editinline BTItemInfoHorzBoxHK InfoBox;
var int CurrentRepairMode;
var int EquipItemCount;
var array<int> EquipItemList;
var array<int> InvenItemList;
var string SaveWebzenBuyItemName;
var int nOldMouseX;
var int nOffsetMouseDis;
var export editinline BTOwnerDrawImageHK LockImage;
//var delegate<deleShowCashChargeWindow> __deleShowCashChargeWindow__Delegate;

function bool Internal_OnPreDraw(Canvas C)
{
    local int i;
    local BTItemListMenuBtn temp;
    local BTROItemBoxHK ro;

    ChangeVisibleModel(bVisibleAFModel);
    UIModel.cModel = CharacterModel;
    // End:0x3B
    if(bLRMousePressed)
    {
        CharacterModel.SetRotationLeft();        
    }
    else
    {
        // End:0x53
        if(bRRMousePressed)
        {
            CharacterModel.SetRotationRight();
        }
    }
    CharRotByDrag();
    i = 0;
    J0x60:

    // End:0x2C2 [Loop If]
    if(i < TPItemList.ItemList.SubMenuBtn.Length)
    {
        temp = TPItemList.ItemList.SubMenuBtn[i];
        // End:0xF7
        if(temp.ClickBtnIndex == int(temp.0))
        {
            TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
            // [Explicit Break]
            goto J0x2C2;
            // [Explicit Continue]
            goto J0x2B8;
        }
        // End:0x1D9
        if(temp.ClickBtnIndex == int(temp.4))
        {
            ro = BTROItemBoxHK(TPItemList.ItemList.DataList[i / 3]);
            // End:0x199
            if((CheckValidItem(ro.ItemInfo, ro.instanceInfo)) == false)
            {
                TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                return false;
            }
            ShowSaveWindow(ro, 0, 0);
            TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
            // [Explicit Break]
            goto J0x2C2;
            // [Explicit Continue]
            goto J0x2B8;
        }
        // End:0x2B8
        if(temp.ClickBtnIndex == int(temp.3))
        {
            ro = BTROItemBoxHK(TPItemList.ItemList.DataList[i / 3]);
            // End:0x27B
            if((CheckValidItem(ro.ItemInfo, ro.instanceInfo)) == false)
            {
                TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                return false;
            }
            ShowSaveWindow(ro, 1, 0);
            TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
            // [Explicit Break]
            goto J0x2C2;
        }
        J0x2B8:

        i++;
        // [Loop Continue]
        goto J0x60;
    }
    J0x2C2:

    return false;
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    CurrentCanvas = C;
    //return;    
}

function ButtonLR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bLRMousePressed = true;
    //return;    
}

function ButtonLR_OnRelease(GUIComponent Sender)
{
    bLRMousePressed = false;
    //return;    
}

function ButtonRR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bRRMousePressed = true;
    //return;    
}

function ButtonRR_OnRelease(GUIComponent Sender)
{
    bRRMousePressed = false;
    //return;    
}

function bool ButtonAF_OnClick(GUIComponent Sender)
{
    CharacterModel.ChangeTeam(0);
    ButtonAF.bSelect = true;
    ButtonAF.bSelectHighlight = true;
    ButtonRSA.bSelect = false;
    ButtonRSA.bSelectHighlight = false;
    return true;
    //return;    
}

function bool ButtonRSA_OnClick(GUIComponent Sender)
{
    CharacterModel.ChangeTeam(1);
    ButtonAF.bSelect = false;
    ButtonAF.bSelectHighlight = false;
    ButtonRSA.bSelect = true;
    ButtonRSA.bSelectHighlight = true;
    return true;
    //return;    
}

function bool MainButton_OnClick(GUIComponent Sender)
{
    MainTabSelect(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
    //return;    
}

function bool SubButton_OnClick(GUIComponent Sender)
{
    TabControl[1].SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    ChangeItemList(TabControl[0].GetCurrentTabIndex(), BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
    //return;    
}

function bool ImageListBox_OnDblClick(GUIComponent Sender)
{
    // End:0x67
    if(TPItemList.ItemList.DataList[TPItemList.ItemList.SelectItemIndex].bMouseOn == true)
    {
        self.ImageListBox_OnClick(Sender);
        self.MenuButton_OnClick(self.MenuButton[2]);
    }
    return false;
    //return;    
}

function bool ImageListBox_OnHover(GUIComponent Sender)
{
    return false;
    //return;    
}

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    local int HelmetID[2], BodyID, FaceID, AcceID, BackPackID, PouChID,
	    CamouflageID;

    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo, cItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wPartsGroupParam tmParam;
    local wWeaponCustomInfoParam wcParam;
    local int PartsID;

    // End:0x41
    if(TPItemList.ItemList.DataList[TPItemList.ItemList.SelectItemIndex].bMouseOn == false)
    {
        return false;
    }
    // End:0x82
    if(TPItemList.ItemList.DataList[TPItemList.ItemList.SelectItemIndex].bMouseClick == false)
    {
        return false;
    }
    ItemList = TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo;
    // End:0x105
    if(ItemInfo == none)
    {
        return false;
    }
    // End:0x11D
    if(int(ItemInfo.byModeItem) != 0)
    {
        return false;
    }
    cItemInfo = none;
    InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, none);
    // End:0x18A
    if((instanceInfo != none) && instanceInfo.cashItemInfo != none)
    {
        InfoBox.ItemBoxView.itemBox.ChangeState(17);        
    }
    else
    {
        InfoBox.ItemBoxView.itemBox.ChangeState(7);
    }
    HelmetID[0] = CharacterModel.HelmetID[0];
    HelmetID[1] = CharacterModel.HelmetID[1];
    BodyID[0] = CharacterModel.BodyID[0];
    BodyID[1] = CharacterModel.BodyID[1];
    FaceID[0] = CharacterModel.FaceID[0];
    FaceID[1] = CharacterModel.FaceID[1];
    AcceID[0] = CharacterModel.AccessoryID[0];
    AcceID[1] = CharacterModel.AccessoryID[1];
    BackPackID[0] = CharacterModel.BackPackID[0];
    BackPackID[1] = CharacterModel.BackPackID[1];
    PouChID[0] = CharacterModel.PouChID[0];
    PouChID[1] = CharacterModel.PouChID[1];
    CamouflageID[0] = CharacterModel.CamouflageID[0];
    CamouflageID[1] = CharacterModel.CamouflageID[1];
    // End:0x3CA
    if(GameMgr.CheckMainWeaponItem(ItemInfo.ItemType))
    {
        CharacterModel.ChangeWeapon(ItemInfo.ItemID);
        PartsID = 0;
        wcParam = GameMgr.GetWeaponCustomInfoParam(ItemInfo.ItemID);
        // End:0x3B3
        if(wcParam != none)
        {
            PartsID = ((wcParam.iDefaultBarrelUniID | wcParam.iDefaultGunstockUniID) | wcParam.iDefaultSightUniID) | wcParam.iDefaultSilencerUniID;
        }
        CharacterModel.ChangeWeaponsParts(PartsID);        
    }
    else
    {
        // End:0x4B4
        if(GameMgr.CheckHeadItem(ItemInfo.ItemType))
        {
            // End:0x41C
            if(BodyID[0] == CharacterModel.default.BodyID[0])
            {
                HelmetID[0] = ItemInfo.ItemID;
            }
            // End:0x44E
            if(BodyID[1] == CharacterModel.default.BodyID[1])
            {
                HelmetID[1] = ItemInfo.ItemID;
            }
            CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1], BackPackID[0], BackPackID[1], PouChID[0], PouChID[1], CamouflageID[0], CamouflageID[1]);            
        }
        else
        {
            // End:0x59E
            if(GameMgr.CheckFaceItem(ItemInfo.ItemType))
            {
                // End:0x506
                if(BodyID[0] == CharacterModel.default.BodyID[0])
                {
                    AcceID[0] = ItemInfo.ItemID;
                }
                // End:0x538
                if(BodyID[1] == CharacterModel.default.BodyID[1])
                {
                    AcceID[1] = ItemInfo.ItemID;
                }
                CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1], BackPackID[0], BackPackID[1], PouChID[0], PouChID[1], CamouflageID[0], CamouflageID[1]);                
            }
            else
            {
                // End:0x688
                if(GameMgr.CheckAccessoryItem(ItemInfo.ItemType))
                {
                    // End:0x5F0
                    if(BodyID[0] == CharacterModel.default.BodyID[0])
                    {
                        AcceID[0] = ItemInfo.ItemID;
                    }
                    // End:0x622
                    if(BodyID[1] == CharacterModel.default.BodyID[1])
                    {
                        AcceID[1] = ItemInfo.ItemID;
                    }
                    CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1], BackPackID[0], BackPackID[1], PouChID[0], PouChID[1], CamouflageID[0], CamouflageID[1]);                    
                }
                else
                {
                    // End:0x73A
                    if(GameMgr.CheckBackPack(ItemInfo.ItemType))
                    {
                        BackPackID[0] = ItemInfo.ItemID;
                        BackPackID[1] = ItemInfo.ItemID;
                        CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1], BackPackID[0], BackPackID[1], PouChID[0], PouChID[1], CamouflageID[0], CamouflageID[1]);                        
                    }
                    else
                    {
                        // End:0x7EC
                        if(GameMgr.CheckPouch(ItemInfo.ItemType))
                        {
                            PouChID[0] = ItemInfo.ItemID;
                            PouChID[1] = ItemInfo.ItemID;
                            CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1], BackPackID[0], BackPackID[1], PouChID[0], PouChID[1], CamouflageID[0], CamouflageID[1]);                            
                        }
                        else
                        {
                            // End:0x89E
                            if(GameMgr.CheckCamouflage(ItemInfo.ItemType))
                            {
                                CamouflageID[0] = ItemInfo.ItemID;
                                CamouflageID[1] = ItemInfo.ItemID;
                                CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1], BackPackID[0], BackPackID[1], PouChID[0], PouChID[1], CamouflageID[0], CamouflageID[1]);                                
                            }
                            else
                            {
                                // End:0xB01
                                if(GameMgr.CheckSpCharItem(ItemInfo.ItemType))
                                {
                                    // End:0x9AF
                                    if(ItemInfo.EquipTeam == 1)
                                    {
                                        BodyID[0] = ItemInfo.ItemID;
                                        tmParam = Controller.ViewportOwner.Actor.Level.GameMgr.GetDefaultAddPartsGroupParam(BodyID[0]);
                                        FaceID[0] = tmParam.iChar_FaceID;
                                        HelmetID[0] = tmParam.iChar_HeadID;
                                        AcceID[0] = tmParam.iChar_AccessoryID;
                                        BackPackID[0] = tmParam.iChar_BackPackID;
                                        PouChID[0] = tmParam.iChar_PouchID;
                                        CamouflageID[0] = tmParam.iChar_CamouflageID;                                        
                                    }
                                    else
                                    {
                                        // End:0xA9E
                                        if(ItemInfo.EquipTeam == 2)
                                        {
                                            BodyID[1] = ItemInfo.ItemID;
                                            tmParam = Controller.ViewportOwner.Actor.Level.GameMgr.GetDefaultAddPartsGroupParam(BodyID[1]);
                                            FaceID[1] = tmParam.iChar_FaceID;
                                            HelmetID[1] = tmParam.iChar_HeadID;
                                            AcceID[1] = tmParam.iChar_AccessoryID;
                                            BackPackID[1] = tmParam.iChar_BackPackID;
                                            PouChID[1] = tmParam.iChar_PouchID;
                                            CamouflageID[1] = tmParam.iChar_CamouflageID;
                                        }
                                    }
                                    CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1], BackPackID[0], BackPackID[1], PouChID[0], PouChID[1], CamouflageID[0], CamouflageID[1]);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return false;
    //return;    
}

function bool ButtonWeapon_OnClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    InvenGroup.SelectButton(btn.ButtonID);
    InfoBox.SetData(ButtonWeapon[btn.ButtonID].itemBox.ItemInfo, ButtonWeapon[btn.ButtonID].itemBox.instanceInfo, none, none);
    InfoBox.ItemBoxView.itemBox.ChangeState(0);
    return true;
    //return;    
}

function bool ButtonWeapon_OnDblClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    UnequipItem(btn.ButtonID);
    return true;
    //return;    
}

function bool BTWindowItemBuyHK_ButtonRechargeCash_OnOK(GUIComponent Sender)
{
    deleShowCashChargeWindow();
    return true;
    //return;    
}

delegate deleShowCashChargeWindow()
{
    //return;    
}

function bool MenuButton_OnClick(GUIComponent Sender)
{
    local BTROItemBoxHK ro;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    switch(btn.ButtonID)
    {
        // End:0x21
        case 0:
            deleShowCashChargeWindow();
            // End:0xAB
            break;
        // End:0x43
        case 1:
            // End:0x32
            if(ro == none)
            {
                return true;
            }
            ShowSaveWindow(ro, 1, 0);
            // End:0xAB
            break;
        // End:0xA8
        case 2:
            // End:0x8A
            if(MM.kLevel < ro.ItemInfo.EquipLevel)
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 60);
                return true;
            }
            // End:0x97
            if(ro == none)
            {
                return true;
            }
            ShowSaveWindow(ro, 0, 0);
            // End:0xAB
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function bool CheckValidItem(wItemBoxHK ItemInfo, wItemBoxInstanceHK instnaceinfo)
{
    // End:0xB4
    if(((ItemInfo.CostType == 1) || ItemInfo.CostType == 4) && instnaceinfo != none)
    {
        // End:0x86
        if(instnaceinfo.cashItemInfo != none)
        {
            // End:0x83
            if((instnaceinfo.cashItemInfo.WZPeriod[0] == 0) && ItemInfo.AdType > 0)
            {
                return false;
            }            
        }
        else
        {
            // End:0xB4
            if((ItemInfo.Period[0] == 0) && ItemInfo.AdType > 0)
            {
                return false;
            }
        }
    }
    return true;
    //return;    
}

function ChangeVisibleModel(bool bAF)
{
    bVisibleAFModel = bAF;
    // End:0x51
    if(bVisibleAFModel)
    {
        // End:0x32
        if(AFTeamBG != none)
        {
            AFTeamBG.bVisible = true;
        }
        // End:0x4E
        if(RSATeamBG != none)
        {
            RSATeamBG.bVisible = false;
        }        
    }
    else
    {
        // End:0x6D
        if(AFTeamBG != none)
        {
            AFTeamBG.bVisible = false;
        }
        // End:0x89
        if(RSATeamBG != none)
        {
            RSATeamBG.bVisible = true;
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
    if(i < 9)
    {
        // End:0x82
        if((ButtonWeapon[i].itemBox.instanceInfo != none) && __NFUN_912__(ButtonWeapon[i].itemBox.instanceInfo.UniqueID, UniqueID))
        {
            ButtonWeapon[i].SetData(none, none);
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function MainTabSelect(int tabi, optional int subtabi)
{
    TabControl[0].SetVisiblePanel(tabi);
    TabControl[1].SetVisiblePanel(subtabi);
    switch(tabi)
    {
        // End:0x45
        case 1:
            ChangeSubButton(astrSubMenuWeapon);
            // End:0x8F
            break;
        // End:0x58
        case 2:
            ChangeSubButton(astrSubMenuEquip);
            // End:0x8F
            break;
        // End:0x6B
        case 3:
            ChangeSubButton(astrSubMenuSpecial);
            // End:0x8F
            break;
        // End:0x7E
        case 4:
            ChangeSubButton(astrSubMenuCashItem);
            // End:0x8F
            break;
        // End:0xFFFF
        default:
            ChangeSubButton(astrSubMenuNewAndHot);
            // End:0x8F
            break;
            break;
    }
    ChangeItemList(tabi, subtabi);
    ChatBox.MultiColumnList.MyScrollBar.SetVisibility(false);
    ChatBox.MultiColumnBox.MyScrollBar.SetVisibility(false);
    //return;    
}

function ChangeItemList(int mainTab, int subTab)
{
    // End:0x93
    if(mainTab == 0)
    {
        switch(subTab)
        {
            // End:0x31
            case 0:
                TPItemList.ItemList.ShowShopItemAll();
                // End:0x90
                break;
            // End:0x50
            case 1:
                TPItemList.ItemList.ShowShopItemAdNew();
                // End:0x90
                break;
            // End:0x70
            case 2:
                TPItemList.ItemList.ShowShopItemAdHot();
                // End:0x90
                break;
            // End:0x8D
            case 3:
                TPItemList.ItemList.ShowShopItemAdBest();
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        // End:0x149
        if(mainTab == 1)
        {
            switch(subTab)
            {
                // End:0xC4
                case 0:
                    TPItemList.ItemList.ShowWeaponAll();
                    // End:0x146
                    break;
                // End:0xE3
                case 1:
                    TPItemList.ItemList.ShowMainWeapon();
                    // End:0x146
                    break;
                // End:0x103
                case 2:
                    TPItemList.ItemList.ShowSubWeapon();
                    // End:0x146
                    break;
                // End:0x123
                case 3:
                    TPItemList.ItemList.ShowHandThrowWeapon();
                    // End:0x146
                    break;
                // End:0x143
                case 4:
                    TPItemList.ItemList.ShowMeleeWeapon();
                    // End:0x146
                    break;
                // End:0xFFFF
                default:
                    break;
            }            
        }
        else
        {
            // End:0x220
            if(mainTab == 2)
            {
                switch(subTab)
                {
                    // End:0x17B
                    case 0:
                        TPItemList.ItemList.ShowEquipItem();
                        // End:0x21D
                        break;
                    // End:0x19A
                    case 1:
                        TPItemList.ItemList.ShowEquipSpCharItem();
                        // End:0x21D
                        break;
                    // End:0x1BA
                    case 2:
                        TPItemList.ItemList.ShowEquipHeadItem();
                        // End:0x21D
                        break;
                    // End:0x1DA
                    case 3:
                        TPItemList.ItemList.ShowEquipFaceItem();
                        // End:0x21D
                        break;
                    // End:0x1FA
                    case 4:
                        TPItemList.ItemList.ShowEquipBackPackItem();
                        // End:0x21D
                        break;
                    // End:0x21A
                    case 5:
                        TPItemList.ItemList.ShowDecoItem();
                        // End:0x21D
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }                
            }
            else
            {
                // End:0x297
                if(mainTab == 3)
                {
                    switch(subTab)
                    {
                        // End:0x252
                        case 0:
                            TPItemList.ItemList.ShowSkillAll();
                            // End:0x294
                            break;
                        // End:0x271
                        case 1:
                            TPItemList.ItemList.ShowActiveSkill();
                            // End:0x294
                            break;
                        // End:0x291
                        case 2:
                            TPItemList.ItemList.ShowPassiveSkill();
                            // End:0x294
                            break;
                        // End:0xFFFF
                        default:
                            break;
                    }                    
                }
                else
                {
                    // End:0x30B
                    if(mainTab == 4)
                    {
                        switch(subTab)
                        {
                            // End:0x2C9
                            case 0:
                                TPItemList.ItemList.ShowAllETC();
                                // End:0x30B
                                break;
                            // End:0x2E8
                            case 1:
                                TPItemList.ItemList.ShowEtc();
                                // End:0x30B
                                break;
                            // End:0x308
                            case 2:
                                TPItemList.ItemList.ShowOnlyModeItem();
                                // End:0x30B
                                break;
                            // End:0xFFFF
                            default:
                                break;
                        }
                    }
                    else
                    {
                    }
                }
            }
        }
        AddSubMenuBtns();
        SetInfoBox();
        //return;        
    }
}

function bool ChangeSubButton(array<string> strTemp)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x57 [Loop If]
    if(i < strTemp.Length)
    {
        SubButton[i].SetVisibility(true);
        SubButton[i].Caption = strTemp[i];
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    i = strTemp.Length;
    J0x63:

    // End:0xA6 [Loop If]
    if(i < 6)
    {
        SubButton[i].SetVisibility(false);
        SubButton[i].Caption = "";
        i++;
        // [Loop Continue]
        goto J0x63;
    }
    return true;
    //return;    
}

function EquipItem()
{
    local int currentSlot;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    ItemList = TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).instanceInfo;
    // End:0x9A
    if(!GameMgr.CheckTotalEquipSlotItem(ItemInfo.ItemType))
    {
        return;
    }
    currentSlot = InvenGroup.GetSelectIndex();
    // End:0xEF
    if(GameMgr.CheckMainWeaponItem(ItemInfo.ItemID) && currentSlot != 0)
    {
        InvenGroup.SelectButton(0);        
    }
    else
    {
        // End:0x12F
        if(GameMgr.CheckPistolItem(ItemInfo.ItemType) && currentSlot != 1)
        {
            InvenGroup.SelectButton(1);            
        }
        else
        {
            // End:0x244
            if(GameMgr.CheckThrowingWeapon(ItemInfo.ItemType))
            {
                // End:0x1E2
                if((currentSlot != 2) && currentSlot != 3)
                {
                    // End:0x19D
                    if(ButtonWeapon[2].itemBox.ItemInfo == none)
                    {
                        InvenGroup.SelectButton(2);                        
                    }
                    else
                    {
                        // End:0x1D1
                        if(ButtonWeapon[3].itemBox.ItemInfo == none)
                        {
                            InvenGroup.SelectButton(3);                            
                        }
                        else
                        {
                            InvenGroup.SelectButton(2);
                        }
                    }
                }
                currentSlot = InvenGroup.GetSelectIndex();
                // End:0x21C
                if((currentSlot == 2) && instanceInfo.SlotPosition == 3)
                {
                    return;
                }
                // End:0x241
                if((currentSlot == 3) && instanceInfo.SlotPosition == 2)
                {
                    return;
                }                
            }
            else
            {
                // End:0x286
                if(GameMgr.CheckHeadItem(ItemInfo.ItemType) && currentSlot != 4)
                {
                    InvenGroup.SelectButton(4);                    
                }
                else
                {
                    // End:0x2C8
                    if(GameMgr.CheckFaceItem(ItemInfo.ItemType) && currentSlot != 5)
                    {
                        InvenGroup.SelectButton(5);                        
                    }
                    else
                    {
                        // End:0x30A
                        if(GameMgr.CheckAccessoryItem(ItemInfo.ItemType) && currentSlot != 6)
                        {
                            InvenGroup.SelectButton(6);                            
                        }
                        else
                        {
                            // End:0x34C
                            if(GameMgr.CheckSpCharItem(ItemInfo.ItemType) && currentSlot != 7)
                            {
                                InvenGroup.SelectButton(7);                                
                            }
                            else
                            {
                                // End:0x37D
                                if(GameMgr.CheckLvMark(ItemInfo.ItemType))
                                {
                                    InvenGroup.SelectButton(9);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    currentSlot = InvenGroup.GetSelectIndex();
    // End:0x3BB
    if(currentSlot < 4)
    {
        // End:0x3B8
        if(currentSlot == instanceInfo.SlotPosition)
        {
            return;
        }        
    }
    else
    {
        // End:0x3DD
        if(currentSlot == ((instanceInfo.SlotPosition - 18) + 4))
        {
            return;
        }
    }
    //return;    
}

function UnequipItem(int ButtonID)
{
    local export editinline BTItemBoxButtonHK ib;

    ib = ButtonWeapon[ButtonID];
    // End:0x2E
    if(ib.itemBox.instanceInfo != none)
    {
    }
    //return;    
}

function bool deleCheckItemCommon(wGameManager GameMgr, wItemBoxHK ItemInfo)
{
    return ItemInfo.IsShowStore(GameMgr);
    //return;    
}

function deleAddItem(wGameManager GameMgr, Object addedObject)
{
    local BTROItemBoxHK ro;

    ro = BTROItemBoxHK(addedObject);
    ro.MyData = TPItemList.MyData;
    ro.Update();
    ro.bUseCache = true;
    TPItemList.ItemList.AddItem(ro);
    //return;    
}

function fill(array<int> ShopItemList)
{
    local BTStoreFillProcess fillProcess;

    TPItemList.MyData.myLevel = MM.kLevel;
    TPItemList.MyData.MyPoint = MM.kPoint;
    TPItemList.MyData.MyCash = MM.kCash;
    TPItemList.ItemList.ClearItem();
    fillProcess = new Class'GUIWarfareControls_Decompressed.BTStoreFillProcess';
    fillProcess.__CheckItemCommon__Delegate = deleCheckItemCommon;
    fillProcess.__AddPointItem__Delegate = deleAddItem;
    fillProcess.__AddGP20Item__Delegate = deleAddItem;
    fillProcess.__AddWZCashItem__Delegate = deleAddItem;
    fillProcess.fill(GameMgr, MM);
    TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnClick;
    TPItemList.ItemList.ImageList.__OnHover__Delegate = ImageListBox_OnHover;
    TPItemList.ItemList.ShowShopItemAll();
    AddSubMenuBtns();
    //return;    
}

function AddSubMenuBtns()
{
    local int i;
    local BTROItemBoxHK ro;
    local BTItemListMenuBtn temp;
    local bool disGift;

    temp = new Class'GUIWarfareControls_Decompressed.BTItemListMenuBtn';
    TPItemList.ItemList.SubMenuBtn.Length = 0;
    i = 0;
    J0x30:

    // End:0x1C6 [Loop If]
    if(i < TPItemList.ItemList.DataList.Length)
    {
        ro = BTROItemBoxHK(TPItemList.ItemList.DataList[i]);
        // End:0x1BC
        if((TPItemList.ItemList.bShowOnlyInventory == false) || (ro.instanceInfo != none) && ro.instanceInfo.SlotPosition == 13)
        {
            TPItemList.ItemList.isHaveSubMenuBtn = true;
            TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, int(temp.10), true);
            disGift = !ro.CanGift();
            TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, int(temp.3), disGift);
            TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, int(temp.4), false);
        }
        i++;
        // [Loop Continue]
        goto J0x30;
    }
    //return;    
}

function SetInfoBox(optional int Index)
{
    // End:0x0D
    if(Index < 0)
    {
        return;
    }
    // End:0xE4
    if(TPItemList.ItemList.DataList.Length > 0)
    {
        InfoBox.SetData(BTROItemBoxHK(TPItemList.ItemList.DataList[Index]).ItemInfo, BTROItemBoxHK(TPItemList.ItemList.DataList[Index]).instanceInfo, none, none);
        InfoBox.ItemBoxView.itemBox.ChangeState(7);
        InfoBox.ItemBoxView.itemBox.MyData = TPItemList.MyData;
    }
    //return;    
}

function Refresh()
{
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local int i;

    i = 0;
    J0x07:

    // End:0xB8 [Loop If]
    if(i < 8)
    {
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(18 + i);
        // End:0x97
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0x94
            if(int(ItemInfo.byModeItem) == 0)
            {
                ButtonWeapon[i].SetData(ItemInfo, instanceInfo);
            }
            // [Explicit Continue]
            goto J0xAE;
        }
        ButtonWeapon[i].SetData(none, none);
        J0xAE:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function InitializeLeftPanel()
{
    local int i;

    bVisibleAFModel = true;
    ButtonLR = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(213.0000000, 599.0000000, 264.0000000, 630.0000000), 0.8000000);
    ButtonLR.SetDefaultLRotateButtonImage();
    ButtonLR.__OnMousePressed__Delegate = ButtonLR_OnPressed;
    ButtonLR.__OnMouseRelease__Delegate = ButtonLR_OnRelease;
    ButtonRR = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(11.0000000, 599.0000000, 62.0000000, 630.0000000), 0.8000000);
    ButtonRR.SetDefaultRRotateButtonImage();
    ButtonRR.__OnMousePressed__Delegate = ButtonRR_OnPressed;
    ButtonRR.__OnMouseRelease__Delegate = ButtonRR_OnRelease;
    ButtonAF = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(11.0000000, 97.0000000, 114.0000000, 129.0000000), 0.8000000);
    ButtonAF.SetTabButtonFontColor();
    ButtonAF.SetMidTabButtonImage();
    ButtonAF.Caption = strAF;
    ButtonAF.__OnClick__Delegate = ButtonAF_OnClick;
    ButtonAF.bSelect = true;
    ButtonAF.bSelectHighlight = true;
    ButtonRSA = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(115.0000000, 97.0000000, 218.0000000, 129.0000000), 0.8000000);
    ButtonRSA.SetTabButtonFontColor();
    ButtonRSA.SetMidTabButtonImage();
    ButtonRSA.Caption = strRSA;
    ButtonRSA.__OnClick__Delegate = ButtonRSA_OnClick;
    i = 0;
    J0x1FB:

    // End:0x2FE [Loop If]
    if(i < 8)
    {
        ButtonWeapon[i] = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
        ButtonWeapon[i].bUseAWinPos = true;
        ButtonWeapon[i].AWinPos = fbButtonWeapon[i];
        ButtonWeapon[i].DefaultSlotName[0] = strButtonWeapon[i];
        ButtonWeapon[i].InitComponent(Controller, self);
        AppendComponent(ButtonWeapon[i]);
        ButtonWeapon[i].itemBox.ChangeState(19);
        InvenGroup.AddButton(ButtonWeapon[i]);
        ButtonWeapon[i].CaptionPadding[1] = 2;
        i++;
        // [Loop Continue]
        goto J0x1FB;
    }
    ButtonWeapon[0].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_hlmt;
    ButtonWeapon[1].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_face;
    ButtonWeapon[2].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_BackPack;
    ButtonWeapon[3].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_clth_af;
    ButtonWeapon[4].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_clth_rsa;
    ButtonWeapon[5].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_class;
    ButtonWeapon[6].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_Pouch;
    ButtonWeapon[7].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_Camouflage;
    i = 0;
    J0x403:

    // End:0x44D [Loop If]
    if(i < 8)
    {
        ButtonWeapon[i].__OnClick__Delegate = None;
        ButtonWeapon[i].__OnDblClick__Delegate = None;
        i++;
        // [Loop Continue]
        goto J0x403;
    }
    ChatBox = new Class'GUIWarfareControls_Decompressed.BTAutoScrollListHK';
    ChatBox.bUseAWinPos = true;
    ChatBox.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(22.0000000, 666.0000000 + float(18), 324.0000000, 720.0000000);
    ChatBox.RenderWeight = 0.7100000;
    ChatBox.InitComponent(Controller, self);
    AppendComponent(ChatBox);
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.X1 = 0.0000000;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.Y1 = 0.0000000;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.X2 = 0.0000000;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.Y2 = 0.0000000;
    ChatBox.MultiColumnList.MyScrollBar.ApplyAWinPos();
    UIModel = new Class'GUIWarfareControls_Decompressed.BTModelHK';
    UIModel.bAcceptsInput = false;
    UIModel.bUseAWinPos = true;
    UIModel.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(5.0000000, 147.0000000, 324.0000000, 620.0000000);
    UIModel.RenderWeight = 0.7000000;
    UIModel.InitComponent(Controller, self);
    AppendComponent(UIModel);
    //return;    
}

function InitializeRightPanel()
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i, MenuLen;

    LabelItemList = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelItemList.bUseAWinPos = true;
    LabelItemList.AWinPos = fbLabelItemList;
    LabelItemList.InitComponent(Controller, self);
    AppendComponent(LabelItemList);
    TPItemList = new Class'GUIWarfareControls_Decompressed.BTTPItemListHK';
    TPItemList.bUseAWinPos = true;
    TPItemList.AWinPos = fbTPItemList;
    TPItemList.InitComponent(Controller, self);
    TPItemList.ItemList.bShowSkillToolTip = true;
    AppendComponent(TPItemList);
    TPItemList.ItemList.bShopItem = true;
    TPItemList.ItemList.BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_store_in;
    MenuLen = 5;
    i = 0;
    J0x11A:

    // End:0x31E [Loop If]
    if(i < MenuLen)
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = 514.0000000 + float(i * 100);
        fb.Y1 = 125.0000000;
        fb.X2 = 613.0000000 + float(i * 100);
        fb.Y2 = 157.0000000;
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.5000000;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetMidTabButtonImage();
        serverButton.SetTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        MainButton[i] = serverButton;
        MainButton[i].Caption = strMainMenu[i];
        MainButton[i].CaptionPadding[1] = 6;
        TabControl[0].BindTabButtonAndPanel(MainButton[i], TPItemList);
        MainButton[i].ButtonID = i;
        MainButton[i].__OnClick__Delegate = MainButton_OnClick;
        i++;
        // [Loop Continue]
        goto J0x11A;
    }
    i = 0;
    J0x325:

    // End:0x58A [Loop If]
    if(i < 6)
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bVisible = false;
        serverButton.bUseAWinPos = true;
        fb.X1 = 514.0000000 + float(i * 77);
        fb.Y1 = 164.0000000;
        fb.X2 = 590.0000000 + float(i * 77);
        fb.Y2 = 192.0000000;
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.5000000;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_sub_btn_n;
        serverButton.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_sub_btn_on;
        serverButton.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_sub_btn_Focus;
        serverButton.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_sub_btn_cli;
        serverButton.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_sub_btn_Focus;
        serverButton.SetDefaultMTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        SubButton[i] = serverButton;
        TabControl[1].BindTabButtonAndPanel(SubButton[i], TPItemList);
        SubButton[i].ButtonID = i;
        SubButton[i].bIsDisableHover = true;
        i++;
        // [Loop Continue]
        goto J0x325;
    }
    TabControl[0].SetVisiblePanel(0);
    TabControl[1].SetVisiblePanel(0);
    InfoBox = new Class'GUIWarfareControls_Decompressed.BTItemInfoHorzBoxHKCN';
    InfoBox.bUseAWinPos = true;
    fb.X1 = 510.0000000;
    fb.Y1 = 564.0000000;
    fb.X2 = 510.0000000 + float(504);
    fb.Y2 = 564.0000000 + float(172);
    InfoBox.AWinPos = fb;
    InfoBox.InitComponent(Controller, self);
    AppendComponent(InfoBox);
    i = 0;
    J0x658:

    // End:0x74F [Loop If]
    if(i < 3)
    {
        MenuButton[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        MenuButton[i].Caption = strMenuButton[i];
        MenuButton[i].bUseAWinPos = true;
        MenuButton[i].AWinPos = fbMenuButton[i];
        MenuButton[i].SetFontSizeAll(12);
        MenuButton[i].SetDefaultFontColor();
        MenuButton[i].SetDefaultButtonImage();
        MenuButton[i].RenderWeight = 0.6000000;
        MenuButton[i].ButtonID = i;
        i++;
        // [Loop Continue]
        goto J0x658;
    }
    astrSubMenuNewAndHot.Length = 4;
    i = 0;
    J0x75F:

    // End:0x790 [Loop If]
    if(i < astrSubMenuNewAndHot.Length)
    {
        astrSubMenuNewAndHot[i] = strSubMenuNewAndHot[i];
        i++;
        // [Loop Continue]
        goto J0x75F;
    }
    astrSubMenuWeapon.Length = 5;
    i = 0;
    J0x7A0:

    // End:0x7D1 [Loop If]
    if(i < astrSubMenuWeapon.Length)
    {
        astrSubMenuWeapon[i] = strSubMenuWeapon[i];
        i++;
        // [Loop Continue]
        goto J0x7A0;
    }
    astrSubMenuEquip.Length = 6;
    i = 0;
    J0x7E1:

    // End:0x812 [Loop If]
    if(i < astrSubMenuEquip.Length)
    {
        astrSubMenuEquip[i] = strSubMenuEquip[i];
        i++;
        // [Loop Continue]
        goto J0x7E1;
    }
    i = 0;
    J0x819:

    // End:0x849 [Loop If]
    if(i < (4 - 1))
    {
        astrSubMenuSpecial[i] = strSubMenuSpecial[i];
        i++;
        // [Loop Continue]
        goto J0x819;
    }
    astrSubMenuCashItem.Length = 3;
    i = 0;
    J0x859:

    // End:0x88A [Loop If]
    if(i < astrSubMenuCashItem.Length)
    {
        astrSubMenuCashItem[i] = strSubMenuCashItem[i];
        i++;
        // [Loop Continue]
        goto J0x859;
    }
    ChangeSubButton(astrSubMenuNewAndHot);
    i = 0;
    J0x89C:

    // End:0x8CC [Loop If]
    if(i < 3)
    {
        MenuButton[i].__OnClick__Delegate = MenuButton_OnClick;
        i++;
        // [Loop Continue]
        goto J0x89C;
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    InitializeLeftPanel();
    InitializeRightPanel();
    //return;    
}

function bool ShowItemBuyWindow(BTROItemBoxHK ro, int buyType, int cashType)
{
    Class'GUIWarfareControls_Decompressed.BTWindowItemBuyHK'.static.ShowItemBuyWindow(Controller, TcpChannel, ro, MM.kPoint, MM.kCash, MM.kCCoinCash, buyType, byte(cashType));
    BTWindowItemBuyHK(Controller.TopPage()).ButtonRechargeCash.__OnClick__Delegate = BTWindowItemBuyHK_ButtonRechargeCash_OnOK;
    //return;    
}

function CharRotByDrag()
{
    local int i;

    // End:0x5F
    if((Controller.MouseX < UIModel.AWinPos.X1) || Controller.MouseX > UIModel.AWinPos.X2)
    {
        UIModel.bLMouseDn = false;
    }
    // End:0xBE
    if((Controller.MouseY < UIModel.AWinPos.Y1) || Controller.MouseY > UIModel.AWinPos.Y2)
    {
        UIModel.bLMouseDn = false;
    }
    UIModel.bAcceptsInput = true;
    // End:0x117
    if(ButtonLR.IsInBounds() || ButtonRR.IsInBounds())
    {
        UIModel.bLMouseDn = false;
        UIModel.bAcceptsInput = false;
    }
    i = 0;
    J0x11E:

    // End:0x1A0 [Loop If]
    if(i < 8)
    {
        // End:0x196
        if(((ButtonWeapon[i] != none) && ButtonWeapon[i].Controller != none) && ButtonWeapon[i].IsInBounds())
        {
            UIModel.bAcceptsInput = false;
            UIModel.bLMouseDn = false;
            // [Explicit Break]
            goto J0x1A0;
        }
        i++;
        // [Loop Continue]
        goto J0x11E;
    }
    J0x1A0:

    // End:0x1EF
    if(UIModel.bLMouseDn)
    {
        nOffsetMouseDis = int(float(nOldMouseX) - Controller.MouseX);
        CharacterModel.PawnRot.Yaw += (nOffsetMouseDis * 100);
    }
    nOldMouseX = int(Controller.MouseX);
    //return;    
}

function SelectCoin(int buyType, int cashType, BTROItemBoxHK ro)
{
    ShowItemBuyWindow(ro, buyType, cashType);
    //return;    
}

function bool ShowSaveWindow(BTROItemBoxHK ro, int buyType, byte cashType)
{
    local wItemBoxCashHK cii;

    // End:0x0D
    if(ro == none)
    {
        return true;
    }
    cii = ro.instanceInfo.cashItemInfo;
    // End:0xCD
    if(cii != none)
    {
        // End:0x89
        if(cii.CheckSaleEnd(GameMgr.kClientTime))
        {
            Class'GUIWarfareControls_Decompressed.BTWindowErrorDefineHK'.static.ShowError(Controller, 1000);
            GameMgr.UpdateItemList(GameMgr);            
        }
        else
        {
            Class'GUIWarfareControls_Decompressed.BTWindowSelectCashTypeHK'.static.ShowWindowSelectCashType(Controller, ro, buyType);
            BTWindowSelectCashTypeHK(Controller.TopPage()).__SelectCoin__Delegate = SelectCoin;
        }        
    }
    else
    {
        ShowItemBuyWindow(ro, buyType, int(cashType));
    }
    return true;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte KeyState, float Delta)
{
    local Interactions.EInputKey iKey;

    // End:0x109
    if((Controller.MouseX >= fbTPItemList.X1) && Controller.MouseY >= fbTPItemList.Y1)
    {
        // End:0x109
        if((Controller.MouseX <= fbTPItemList.X2) && Controller.MouseY <= fbTPItemList.Y2)
        {
            iKey = key;
            // End:0xC6
            if((int(KeyState) == 3) && int(iKey) == int(236))
            {
                TPItemList.ItemList.ImageList.WheelUp();
                return true;
            }
            // End:0x109
            if((int(KeyState) == 3) && int(iKey) == int(237))
            {
                TPItemList.ItemList.ImageList.WheelDown();
                return true;
            }
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: ButtonGroups'GUIWarfareControls_Decompressed.BTTPStoreWeaponHK.mgroups'
    begin object name="mgroups" class=GUIWarfareControls_Decompressed.ButtonGroups
    end object
    InvenGroup=mgroups
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPStoreWeaponHK.mBackgroundImage'
    begin object name="mBackgroundImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
        WinTop=0.0000000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=1.0000000
    end object
    BackgroundImage=mBackgroundImage
    fbButtonWeapon[0]=(X1=227.0000000,Y1=138.0000000,X2=303.0000000,Y2=223.0000000)
    fbButtonWeapon[1]=(X1=227.0000000,Y1=227.0000000,X2=303.0000000,Y2=312.0000000)
    fbButtonWeapon[2]=(X1=227.0000000,Y1=316.0000000,X2=303.0000000,Y2=401.0000000)
    fbButtonWeapon[3]=(X1=28.0000000,Y1=642.0000000,X2=104.0000000,Y2=727.0000000)
    fbButtonWeapon[4]=(X1=108.0000000,Y1=642.0000000,X2=184.0000000,Y2=727.0000000)
    fbButtonWeapon[5]=(X1=227.0000000,Y1=642.0000000,X2=303.0000000,Y2=727.0000000)
    fbButtonWeapon[6]=(X1=227.0000000,Y1=405.0000000,X2=303.0000000,Y2=490.0000000)
    fbButtonWeapon[7]=(X1=227.0000000,Y1=494.0000000,X2=303.0000000,Y2=579.0000000)
    strButtonWeapon[0]="Helmet"
    strButtonWeapon[1]="Face"
    strButtonWeapon[2]="Backpack"
    strButtonWeapon[3]="AF"
    strButtonWeapon[4]="RSA"
    strButtonWeapon[5]="Fake Rank"
    strButtonWeapon[6]="Pouch"
    strButtonWeapon[7]="Camoflauge"
    strAF="AF"
    strRSA="RSA"
    strForGift[0]="Buy Gift"
    strForGift[1]="Gift"
    strForMe[0]="Buy Item"
    strForMe[1]="Buy"
    strMainMenu[0]="All"
    strMainMenu[1]="Weapons"
    strMainMenu[2]="Gear"
    strMainMenu[3]="Skills"
    strMainMenu[4]="Items"
    strSubMenuNewAndHot[0]="All"
    strSubMenuNewAndHot[1]="New"
    strSubMenuNewAndHot[2]="Cool"
    strSubMenuNewAndHot[3]="Best"
    strSubMenuWeapon[0]="All"
    strSubMenuWeapon[1]="Primary"
    strSubMenuWeapon[2]="Secondary"
    strSubMenuWeapon[3]="Thrown"
    strSubMenuWeapon[4]="Melee"
    strSubMenuEquip[0]="All"
    strSubMenuEquip[1]="Character"
    strSubMenuEquip[2]="Helmet"
    strSubMenuEquip[3]="Face"
    strSubMenuEquip[4]="Backpack"
    strSubMenuEquip[5]="Adornment"
    strSubMenuSpecial[0]="All"
    strSubMenuSpecial[1]="Attack"
    strSubMenuSpecial[2]="Passive"
    strSubMenuCashItem[0]="All"
    strSubMenuCashItem[1]="Other"
    strSubMenuCashItem[2]="Mode"
    // Referen[0]ce: TabControlMocker'GUIWarfareControls_Decompressed.BTTPStoreWeaponHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPStoreWeaponHK.mTabControl2'
    begin object name="mTabControl2" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl2
    fbLabelItemList=(X1=510.0000000,Y1=137.0000000,X2=1014.0000000,Y2=558.0000000)
    fbTPItemList=(X1=515.0000000,Y1=194.0000000,X2=1013.0000000,Y2=544.0000000)
    strMenuButton[0]="Buy Cash"
    strMenuButton[1]="Gift"
    strMenuButton[2]="Buy"
    fbMenuButton[0]=(X1=715.0000000,Y1=520.0000000,X2=809.0000000,Y2=552.0000000)
    fbMenuButton[1]=(X1=813.0000000,Y1=520.0000000,X2=907.0000000,Y2=552.0000000)
    fbMenuButton[2]=(X1=911.0000000,Y1=520.0000000,X2=1004.0000000,Y2=552.0000000)
    OnPreDraw=BTTPStoreWeaponHK.Internal_OnPreDraw
    OnKeyEvent=BTTPStoreWeaponHK.InternalOnKeyEvent
}