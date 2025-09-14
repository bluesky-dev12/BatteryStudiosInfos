/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPAuctionBuyingHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Constants:2
 *	Structs:1
 *	Properties:49
 *	Functions:37
 *
 *******************************************************************************/
class BTTPAuctionBuyingHK extends BTTabPanelHK
    editinlinenew
    instanced;

const BTN_COUNT_MAIN = 5;
const BTN_COUNT_SUB = 5;

struct ReqAuctionList
{
    var bool bLock;
    var bool bHave;
    var int SaveTab[2];
};

var BTTcpLink_Channel TcpChannel;
var DragObject DragBox;
var ReqAuctionList LockAuctionList;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify ButtonGroups InvenGroup;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTStretchedImageHK BackgroundImage;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonWeapon[10];
var localized string strButtonWeapon[10];
var export editinline BTItemBoxButtonHK ButtonWeapon[10];
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
var export editinline BTModelHK UIModel;
var BTROModelNew CharacterModel;
var export editinline BTAutoScrollListHK ChatBox;
var BTItemCommonInfoHK MyData;
var string LastBiddingItemName;
var localized string strMainMenu[5];
var localized string strSubMenu[5];
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify TabControlMocker TabControl[2];
var export editinline BTOwnerDrawCaptionButtonHK MainButton[5];
var export editinline BTOwnerDrawCaptionButtonHK SubButton[5];
var localized string strListTopButton[8];
var FloatBox fbListTopButton[8];
var export editinline BTOwnerDrawCaptionButtonHK ListTopButton[8];
var export editinline BTOwnerDrawImageHK ListTopImage[8];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelItemList;
var export editinline BTOwnerDrawImageHK LabelItemList;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbACLList;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbACLListScrollBar;
var export editinline BTACLAuctionHK ACLList;
var localized string strMenuButton[4];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbMenuButton[4];
var export editinline BTOwnerDrawCaptionButtonHK MenuButton[4];
var FloatBox fbPageButton;
var export editinline BTPageListButtonHK PageButton;
var export editinline BTItemInfoHorzBoxHK InfoBox;
var int RankIdx[6];
var int SortIdx[5];
var delegate<SortAuctionItemList> __SortAuctionItemList__Delegate;
var delegate<sfReqAuctioItemListInBuying> __sfReqAuctioItemListInBuying__Delegate;

function bool Internal_OnPreDraw(Canvas C)
{
    ChangeVisibleModel(bVisibleAFModel);
    UIModel.cModel = CharacterModel;
    // End:0x3b
    if(bLRMousePressed)
    {
        CharacterModel.SetRotationLeft();
    }
    // End:0x53
    else
    {
        // End:0x53
        if(bRRMousePressed)
        {
            CharacterModel.SetRotationRight();
        }
    }
    return false;
}

function Internal_OnRendered(Canvas C)
{
    CurrentCanvas = C;
    // End:0x60
    if(DragBox.IsDragging())
    {
        DragBox.UpdateMousePos(int(Controller.MouseX), int(Controller.MouseY));
        DragBox.Render(C);
    }
}

function ButtonLR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bLRMousePressed = true;
}

function ButtonLR_OnRelease(GUIComponent Sender)
{
    bLRMousePressed = false;
}

function ButtonRR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bRRMousePressed = true;
}

function ButtonRR_OnRelease(GUIComponent Sender)
{
    bRRMousePressed = false;
}

function bool ButtonAF_OnClick(GUIComponent Sender)
{
    ChangeVisibleModel(true);
    CharacterModel.ChangeTeam(0);
    return true;
}

function bool ButtonRSA_OnClick(GUIComponent Sender)
{
    ChangeVisibleModel(false);
    CharacterModel.ChangeTeam(1);
    return true;
}

delegate SortAuctionItemList(int SortType);
function bool ListTopButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local int SortType;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x2f
        case 6:
            SortType = 1;
            // End:0x3c
            break;
        // End:0xffff
        default:
            SortType = 0;
            // End:0x3c Break;
            break;
    }
    SortAuctionItemList(SortType);
    return true;
}

function bool MainButton_OnClick(GUIComponent Sender)
{
    MainTabSelect(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
}

function bool SubButton_OnClick(GUIComponent Sender)
{
    TabControl[1].SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    ChangeItemList(TabControl[0].GetCurrentTabIndex(), BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
}

function bool ButtonWeapon_OnBeginDrag(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    Log("ButtonWeapon_OnBeginDrag");
    btn = BTItemBoxButtonHK(Sender);
    // End:0xc4
    if(btn.bDropSource == true && DragBox.IsDragging() == false && btn.itemBox.ItemInfo != none)
    {
        DragBox.BeginDrag(int(Controller.MouseX), int(Controller.MouseY), btn.itemBox, btn.ButtonID);
        return true;
    }
    return false;
}

function ButtonWeapon_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("ButtonWeapon_OnEndDrag" @ string(Sender));
    // End:0x3e
    if(Sender.Class == class'BTItemBoxButtonHK')
    {
    }
    // End:0x49
    else
    {
        // End:0x49
        if(Sender != none)
        {
        }
    }
    DragBox.EndDrag();
}

function bool ButtonWeapon_OnClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    InvenGroup.SelectButton(btn.ButtonID);
    InfoBox.SetData(ButtonWeapon[btn.ButtonID].itemBox.ItemInfo, ButtonWeapon[btn.ButtonID].itemBox.instanceInfo, none, none);
    InfoBox.ItemBoxView.itemBox.ChangeState(0);
    return true;
}

function bool ButtonWeapon_OnDblClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    return true;
}

function bool BTWindowTenderHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowTenderHK BTWindow;

    BTWindow = BTWindowTenderHK(Sender);
    LastBiddingItemName = BTWindow.ItemName;
    TcpChannel.sfReqAuctionBidding(BTWindow.UniqueID, BTWindow.MyTender);
    Controller.CloseMenu(false);
    return true;
}

function bool BTWindowInstantlyBuyHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowInstantlyBuyHK BTWindow;

    BTWindow = BTWindowInstantlyBuyHK(Sender);
    LastBiddingItemName = BTWindow.ItemName;
    TcpChannel.sfReqAuctionInstantlyBuying(BTWindow.UniqueID);
    Controller.CloseMenu(false);
    return true;
}

function bool MenuButton_OnClick(GUIComponent Sender)
{
    local int ItemID, PartID, MyPoint, Damage, InstantlyPrice, OverlapCount;

    local float CurrentTender;
    local string HightestBidUser;
    local int UniqueID;
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local BTAutoColumnListDataHK row;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x28
        case 3:
            // End:0x5a6
            break;
        // End:0xb1
        case 2:
            ItemID = ACLList.ACLRowList[ACLList.LastSelectedIndexHistory].DataPerColumn[7].IntValue;
            PartID = ACLList.ACLRowList[ACLList.LastSelectedIndexHistory].DataPerColumn[9].IntValue;
            TcpChannel.sfReqAuctionTradeHistory(ItemID, PartID);
            // End:0x5a6
            break;
        // End:0x387
        case 1:
            // End:0xef
            if(ACLList.LastSelectedIndexHistory < 0 || ACLList.LastSelectedIndexHistory >= ACLList.ACLRowList.Length)
            {
                return true;
            }
            row = ACLList.ACLRowList[ACLList.LastSelectedIndexHistory];
            // End:0x11f
            if(row == none)
            {
                return true;
            }
            MyPoint = MyData.MyPoint;
            InstantlyPrice = row.DataPerColumn[6].IntValue;
            ItemID = row.DataPerColumn[7].IntValue;
            OverlapCount = row.DataPerColumn[0].tempValue;
            UniqueID = row.DataPerColumn[8].IntValue;
            PartID = row.DataPerColumn[9].IntValue;
            Damage = row.DataPerColumn[3].IntValue;
            CurrentTender = float(row.DataPerColumn[5].IntValue);
            HightestBidUser = row.DataPerColumn[7].strValue;
            // End:0x24c
            if(HightestBidUser == "")
            {
                // End:0x249
                if(float(MyPoint) < CurrentTender)
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 30);
                    return true;
                }
            }
            // End:0x283
            else
            {
                // End:0x283
                if(MyPoint < int(CurrentTender * 1.050 + 0.50))
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 30);
                    return true;
                }
            }
            Controller.OpenMenu("GUIWarfareControls.BTWindowTenderHK");
            BTWindowTenderHK(Controller.TopPage()).__OnOK__Delegate = BTWindowTenderHK_OnOK;
            // End:0x339
            if(float(InstantlyPrice) <= CurrentTender)
            {
                BTWindowTenderHK(Controller.TopPage()).SetData(MyPoint, 99999999, UniqueID, ItemID, PartID, Damage, CurrentTender, HightestBidUser, OverlapCount);
            }
            // End:0x384
            else
            {
                BTWindowTenderHK(Controller.TopPage()).SetData(MyPoint, InstantlyPrice, UniqueID, ItemID, PartID, Damage, CurrentTender, HightestBidUser, OverlapCount);
            }
            // End:0x5a6
            break;
        // End:0x5a3
        case 0:
            // End:0x3c5
            if(ACLList.LastSelectedIndexHistory < 0 || ACLList.LastSelectedIndexHistory >= ACLList.ACLRowList.Length)
            {
                return true;
            }
            row = ACLList.ACLRowList[ACLList.LastSelectedIndexHistory];
            // End:0x3f5
            if(row == none)
            {
                return true;
            }
            MyPoint = MyData.MyPoint;
            InstantlyPrice = row.DataPerColumn[6].IntValue;
            CurrentTender = float(row.DataPerColumn[5].IntValue);
            OverlapCount = row.DataPerColumn[0].tempValue;
            // End:0x46b
            if(InstantlyPrice == 0)
            {
                return true;
            }
            ItemID = row.DataPerColumn[7].IntValue;
            UniqueID = row.DataPerColumn[8].IntValue;
            PartID = row.DataPerColumn[9].IntValue;
            Damage = row.DataPerColumn[3].IntValue;
            // End:0x502
            if(MyPoint < InstantlyPrice)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 31);
                return true;
            }
            Controller.OpenMenu("GUIWarfareControls.BTWindowInstantlyBuyHK");
            BTWindowInstantlyBuyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInstantlyBuyHK_OnOK;
            BTWindowInstantlyBuyHK(Controller.TopPage()).SetData(MyPoint, InstantlyPrice, UniqueID, ItemID, PartID, Damage, OverlapCount);
            // End:0x5a6
            break;
        // End:0xffff
        default:
            return true;
    }
}

function ChangeVisibleModel(bool bAF)
{
    bVisibleAFModel = bAF;
    // End:0x3b
    if(bVisibleAFModel)
    {
        AFTeamBG.bVisible = true;
        RSATeamBG.bVisible = false;
    }
    // End:0x5d
    else
    {
        AFTeamBG.bVisible = false;
        RSATeamBG.bVisible = true;
    }
}

function bool FindAndRemoveItem(int UniqueID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x8c [While If]
    if(i < 10)
    {
        // End:0x82
        if(ButtonWeapon[i].itemBox.instanceInfo != none && UnresolvedNativeFunction_99(ButtonWeapon[i].itemBox.instanceInfo.UniqueID, UniqueID))
        {
            ButtonWeapon[i].SetData(none, none);
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function MainTabSelect(int tabi, optional int subtabi, optional bool bStopLoop)
{
    TabControl[0].SetVisiblePanel(tabi);
    // End:0x3e
    if(bStopLoop == false)
    {
        ChangeItemList(tabi, TabControl[1].GetCurrentTabIndex());
    }
    ChatBox.MultiColumnList.MyScrollBar.SetVisibility(false);
    ChatBox.MultiColumnBox.MyScrollBar.SetVisibility(false);
}

function int GetRankIdx()
{
    return RankIdx[TabControl[1].GetCurrentTabIndex()];
}

function int GetSortIdx()
{
    return SortIdx[TabControl[0].GetCurrentTabIndex()];
}

delegate bool sfReqAuctioItemListInBuying(int Section, string Keyword, int ItemRank, byte ItemClassify, byte IsAvailable, int PageNum, int Count, int SortType);
function ChangeItemList(int mainTab, int subTab)
{
    Log("[BTTPAuctionBuyingHK::ChangeItemList] mainTab=" $ string(mainTab) $ ", subTab=" $ string(subTab) $ ")");
    sfReqAuctioItemListInBuying(0, "", RankIdx[subTab], 0, 0, 1, 20, SortIdx[mainTab]);
}

function EquipItem();
function UnequipItem(int ButtonID);
function fill()
{
    local int i;
    local wGameManager GameMgr;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 0;
    J0x36:
    // End:0x1c6 [While If]
    if(i < GameMgr.InstanceItemLists.Length)
    {
        instanceInfo = GameMgr.InstanceItemLists[i];
        // End:0x86
        if(UnresolvedNativeFunction_99(instanceInfo.UniqueID, EmptyBtrDouble()))
        {
        }
        // End:0x1bc
        else
        {
            // End:0x148
            if(instanceInfo.SlotPosition <= 3)
            {
                ButtonWeapon[instanceInfo.SlotPosition].SetData(GameMgr.FindUIItem(instanceInfo.ItemID), instanceInfo);
                // End:0x145
                if(instanceInfo.SlotPosition == 0)
                {
                    InfoBox.SetData(GameMgr.FindUIItem(instanceInfo.ItemID), instanceInfo, none, none);
                    InfoBox.ItemBoxView.itemBox.ChangeState(0);
                }
            }
            // End:0x1bc
            else
            {
                // End:0x1bc
                if(instanceInfo.SlotPosition >= 18 && instanceInfo.SlotPosition < 24)
                {
                    ButtonWeapon[instanceInfo.SlotPosition - 18 + 4].SetData(GameMgr.FindUIItem(instanceInfo.ItemID), instanceInfo);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
}

function Refresh()
{
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    CharacterModel.ChangeEquipItem(GameMgr);
    CharacterModel.ChangeWeapon(ButtonWeapon[0].itemBox.instanceInfo.ItemID, ButtonWeapon[0].itemBox.instanceInfo.PartID, ButtonWeapon[0].itemBox.instanceInfo.PaintID);
}

function InitializeLeftPanel()
{
    local int i;

    EdgeLine = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(17.0, 117.0, 332.0, 728.0), class'BTUIResourcePoolHK'.default.img_edge_line);
    AFTeamBG = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(20.0, 120.0, 329.0, 725.0), class'BTUIResourcePoolHK'.default.img_AF_cha, 0.10);
    RSATeamBG = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(20.0, 120.0, 329.0, 725.0), class'BTUIResourcePoolHK'.default.img_RSA_cha, 0.10);
    bVisibleAFModel = true;
    ButtonLR = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(252), AFTeamBG.AWinPos.Y1 + float(483), AFTeamBG.AWinPos.X1 + float(303), AFTeamBG.AWinPos.Y1 + float(514)), 0.80);
    ButtonLR.SetDefaultLRotateButtonImage();
    ButtonLR.__OnMousePressed__Delegate = ButtonLR_OnPressed;
    ButtonLR.__OnMouseRelease__Delegate = ButtonLR_OnRelease;
    ButtonRR = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(5), AFTeamBG.AWinPos.Y1 + float(483), AFTeamBG.AWinPos.X1 + float(56), AFTeamBG.AWinPos.Y1 + float(514)), 0.80);
    ButtonRR.SetDefaultRRotateButtonImage();
    ButtonRR.__OnMousePressed__Delegate = ButtonRR_OnPressed;
    ButtonRR.__OnMouseRelease__Delegate = ButtonRR_OnRelease;
    ButtonAF = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(25), AFTeamBG.AWinPos.Y1 + float(525), AFTeamBG.AWinPos.X1 + float(143), AFTeamBG.AWinPos.Y1 + float(571)), 0.80);
    ButtonAF.SetDefaultFontColor();
    ButtonAF.SetDefaultLRotateAFButtonImage();
    ButtonAF.Caption = strAF;
    ButtonAF.__OnClick__Delegate = ButtonAF_OnClick;
    ButtonRSA = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(166), AFTeamBG.AWinPos.Y1 + float(525), AFTeamBG.AWinPos.X1 + float(283), AFTeamBG.AWinPos.Y1 + float(571)), 0.80);
    ButtonRSA.SetDefaultFontColor();
    ButtonRSA.SetDefaultRRotateRSAButtonImage();
    ButtonRSA.Caption = strRSA;
    ButtonRSA.__OnClick__Delegate = ButtonRSA_OnClick;
    i = 0;
    J0x3f8:
    // End:0x4ce [While If]
    if(i < 10)
    {
        ButtonWeapon[i] = BTItemBoxButtonHK(NewComponent(new class'BTItemBoxButtonHK', fbButtonWeapon[i], 0.80));
        ButtonWeapon[i].itemBox.ChangeState(0);
        ButtonWeapon[i].DefaultSlotName[0] = strButtonWeapon[i];
        InvenGroup.AddButton(ButtonWeapon[i]);
        ButtonWeapon[i].__OnClick__Delegate = ButtonWeapon_OnClick;
        ButtonWeapon[i].__OnDblClick__Delegate = ButtonWeapon_OnDblClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3f8;
    }
    ButtonWeapon[2].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_grnd;
    ButtonWeapon[3].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_grnd;
    ButtonWeapon[4].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_hlmt;
    ButtonWeapon[5].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_face;
    ButtonWeapon[6].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_gogl;
    ButtonWeapon[7].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_clth;
    ButtonWeapon[8].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_clth;
    ButtonWeapon[9].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_class;
    ChatBox = BTAutoScrollListHK(NewComponent(new class'BTAutoScrollListHK', class'BTCustomDrawHK'.static.MakeFloatBox(22.0, 666.0 + float(18), 324.0, 720.0), 0.710));
    ChatBox.MultiColumnList.MyScrollBar.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 0.0, 0.0, 0.0);
    ChatBox.MultiColumnList.MyScrollBar.ApplyAWinPos();
    UIModel = BTModelHK(NewComponent(new class'BTModelHK', class'BTCustomDrawHK'.static.MakeFloatBox(17.0, 117.0, 330.0, 726.0), 0.70));
    UIModel.bAcceptsInput = false;
}

function bool ACLList_DefaultSelect()
{
    local wGameManager GameMgr;
    local BTAutoColumnListDataHK Data;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x90
    if(ACLList.LastSelectedIndexHistory < 0 || ACLList.LastSelectedIndexHistory >= ACLList.ACLRowList.Length)
    {
        MenuButton[2].DisableMe();
        MenuButton[3].DisableMe();
        return false;
    }
    // End:0xb4
    else
    {
        MenuButton[2].EnableMe();
        MenuButton[3].EnableMe();
    }
    Data = ACLList.ACLRowList[ACLList.LastSelectedIndexHistory];
    ItemInfo = GameMgr.FindUIItem(Data.DataPerColumn[7].IntValue);
    instanceInfo = new class'wItemBoxInstanceHK';
    instanceInfo.PartID = Data.DataPerColumn[9].IntValue;
    SelectItem(ItemInfo, instanceInfo);
}

function bool ACLList_OnClick(GUIComponent Sender)
{
    local int HelmetID[2], BodyID, FaceID, AcceID;
    local wPartsGroupParam tmParam;
    local wGameManager GameMgr;
    local BTAutoColumnListDataHK Data;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x97
    if(ACLList.LastSelectedIndexHistory < 0 || ACLList.LastSelectedIndexHistory >= ACLList.ACLRowList.Length)
    {
        MenuButton[2].DisableMe();
        MenuButton[3].DisableMe();
        ButtonWeapon_OnClick(none);
        return false;
    }
    // End:0xbb
    else
    {
        MenuButton[2].EnableMe();
        MenuButton[3].EnableMe();
    }
    // End:0xf0
    if(ACLList.GetInstanctlyBuyingPrice(ACLList.LastSelectedIndexHistory) == 0)
    {
        MenuButton[3].DisableMe();
    }
    Data = ACLList.ACLRowList[ACLList.LastSelectedIndexHistory];
    ItemInfo = GameMgr.FindUIItem(Data.DataPerColumn[7].IntValue);
    instanceInfo = new class'wItemBoxInstanceHK';
    instanceInfo.OverlapCount = Data.DataPerColumn[0].tempValue;
    instanceInfo.PartID = Data.DataPerColumn[9].IntValue;
    SelectItem(ItemInfo, instanceInfo);
    HelmetID[0] = CharacterModel.HelmetID[0];
    HelmetID[1] = CharacterModel.HelmetID[1];
    BodyID[0] = CharacterModel.BodyID[0];
    BodyID[1] = CharacterModel.BodyID[1];
    FaceID[0] = CharacterModel.FaceID[0];
    FaceID[1] = CharacterModel.FaceID[1];
    AcceID[0] = CharacterModel.AccessoryID[0];
    AcceID[1] = CharacterModel.AccessoryID[1];
    // End:0x2a6
    if(GameMgr.CheckMainWeaponItem(ItemInfo.ItemType))
    {
        CharacterModel.ChangeWeapon(ItemInfo.ItemID);
    }
    // End:0x6d3
    else
    {
        // End:0x374
        if(GameMgr.CheckHeadItem(ItemInfo.ItemType))
        {
            // End:0x2f8
            if(BodyID[0] == CharacterModel.default.BodyID[0])
            {
                HelmetID[0] = ItemInfo.ItemID;
            }
            // End:0x32a
            if(BodyID[1] == CharacterModel.default.BodyID[1])
            {
                HelmetID[1] = ItemInfo.ItemID;
            }
            CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], FaceID[0], FaceID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1]);
        }
        // End:0x6d3
        else
        {
            // End:0x442
            if(GameMgr.CheckFaceItem(ItemInfo.ItemType))
            {
                // End:0x3c6
                if(BodyID[0] == CharacterModel.default.BodyID[0])
                {
                    FaceID[0] = ItemInfo.ItemID;
                }
                // End:0x3f8
                if(BodyID[1] == CharacterModel.default.BodyID[1])
                {
                    FaceID[1] = ItemInfo.ItemID;
                }
                CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], FaceID[0], FaceID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1]);
            }
            // End:0x6d3
            else
            {
                // End:0x510
                if(GameMgr.CheckAccessoryItem(ItemInfo.ItemType))
                {
                    // End:0x494
                    if(BodyID[0] == CharacterModel.default.BodyID[0])
                    {
                        AcceID[0] = ItemInfo.ItemID;
                    }
                    // End:0x4c6
                    if(BodyID[1] == CharacterModel.default.BodyID[1])
                    {
                        AcceID[1] = ItemInfo.ItemID;
                    }
                    CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], FaceID[0], FaceID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1]);
                }
                // End:0x6d3
                else
                {
                    // End:0x6d3
                    if(GameMgr.CheckSpCharItem(ItemInfo.ItemType))
                    {
                        // End:0x5df
                        if(ItemInfo.EquipTeam == 1)
                        {
                            BodyID[0] = ItemInfo.ItemID;
                            tmParam = Controller.ViewportOwner.Actor.Level.GameMgr.GetDefaultAddPartsGroupParam(BodyID[0]);
                            FaceID[0] = tmParam.iChar_FaceID;
                            HelmetID[0] = tmParam.iChar_HeadID;
                            AcceID[0] = tmParam.iChar_AccessoryID;
                        }
                        // End:0x68c
                        else
                        {
                            // End:0x68c
                            if(ItemInfo.EquipTeam == 2)
                            {
                                BodyID[1] = ItemInfo.ItemID;
                                tmParam = Controller.ViewportOwner.Actor.Level.GameMgr.GetDefaultAddPartsGroupParam(BodyID[1]);
                                FaceID[1] = tmParam.iChar_FaceID;
                                HelmetID[1] = tmParam.iChar_HeadID;
                                AcceID[1] = tmParam.iChar_AccessoryID;
                            }
                        }
                        CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], FaceID[0], FaceID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1]);
                    }
                }
            }
        }
    }
    return false;
}

function SelectItem(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo, optional bool bHoldcItemInfo)
{
    local wItemBoxHK cItemInfo;
    local wItemBoxInstanceHK cInstanceInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    cItemInfo = none;
    // End:0x16e
    if(bHoldcItemInfo == false)
    {
        // End:0xa3
        if(GameMgr.CheckMainWeaponItem(ItemInfo.ItemType))
        {
            cItemInfo = ButtonWeapon[0].itemBox.ItemInfo;
            cInstanceInfo = ButtonWeapon[0].itemBox.instanceInfo;
        }
        // End:0x16e
        else
        {
            // End:0x109
            if(GameMgr.CheckPistolItem(ItemInfo.ItemType))
            {
                cItemInfo = self.ButtonWeapon[1].itemBox.ItemInfo;
                cInstanceInfo = ButtonWeapon[1].itemBox.instanceInfo;
            }
            // End:0x16e
            else
            {
                // End:0x16e
                if(GameMgr.CheckThrowingWeapon(ItemInfo.ItemType))
                {
                    cItemInfo = self.ButtonWeapon[2].itemBox.ItemInfo;
                    cInstanceInfo = ButtonWeapon[2].itemBox.instanceInfo;
                }
            }
        }
    }
    InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
    InfoBox.ItemBoxView.itemBox.ChangeState(9);
}

function InitializeRightPanel()
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i;

    LabelItemList = new class'BTOwnerDrawImageHK';
    LabelItemList.bUseAWinPos = true;
    LabelItemList.AWinPos = fbLabelItemList;
    LabelItemList.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    LabelItemList.InitComponent(Controller, self);
    AppendComponent(LabelItemList);
    ACLList = new class'BTACLAuctionHK';
    ACLList.bUseAWinPos = true;
    ACLList.AWinPos = fbACLList;
    ACLList.RenderWeight = 0.90;
    ACLList.InitComponent(Controller, self);
    AppendComponent(ACLList);
    ACLList.MultiColumnList.MyScrollBar.bUseAWinPos = true;
    ACLList.MultiColumnList.MyScrollBar.AWinPos = fbACLListScrollBar;
    ACLList.MultiColumnList.MyScrollBar.ApplyAWinPos();
    ACLList.MultiColumnList.__OnClick__Delegate = ACLList_OnClick;
    i = 0;
    J0x167:
    // End:0x2d2 [While If]
    if(i < 7)
    {
        ListTopImage[i] = new class'BTOwnerDrawImageHK';
        ListTopImage[i].bUseAWinPos = true;
        ListTopImage[i].AWinPos.X1 = fbListTopButton[i].X2 - float(2);
        ListTopImage[i].AWinPos.Y1 = fbListTopButton[i].Y1 + float(5);
        ListTopImage[i].AWinPos.X2 = fbListTopButton[i].X2 + float(2);
        ListTopImage[i].AWinPos.Y2 = fbListTopButton[i].Y2 - float(5);
        ListTopImage[i].BackgroundImage = class'BTUIResourcePoolHK'.default.img_list_divid;
        ListTopImage[i].RenderWeight = 0.190;
        ListTopImage[i].InitComponent(Controller, self);
        AppendComponent(ListTopImage[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x167;
    }
    ListTopImage[7] = new class'BTOwnerDrawImageHK';
    ListTopImage[7].bUseAWinPos = true;
    ListTopImage[7].AWinPos.X1 = fbListTopButton[0].X1;
    ListTopImage[7].AWinPos.Y1 = fbListTopButton[0].Y1;
    ListTopImage[7].AWinPos.X2 = fbListTopButton[7].X2;
    ListTopImage[7].AWinPos.Y2 = fbListTopButton[7].Y2;
    ListTopImage[7].BackgroundImage = class'BTUIResourcePoolHK'.default.butt_list_n;
    ListTopImage[7].RenderWeight = 0.10;
    ListTopImage[7].InitComponent(Controller, self);
    AppendComponent(ListTopImage[7]);
    i = 0;
    J0x3ea:
    // End:0x55a [While If]
    if(i < 8)
    {
        ListTopButton[i] = new class'BTOwnerDrawCaptionButtonHK';
        ListTopButton[i].bUseAWinPos = true;
        ListTopButton[i].AWinPos = fbListTopButton[i];
        ListTopButton[i].buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_list_on;
        ListTopButton[i].buttonImage[3] = class'BTUIResourcePoolHK'.default.butt_list_cli;
        ListTopButton[i].RenderWeight = 0.20;
        ListTopButton[i].SetFontSizeAll(9);
        ListTopButton[i].SetDefaultListTopButtonFontColor();
        ListTopButton[i].Caption = strListTopButton[i];
        ListTopButton[i].CaptionDrawType = 4;
        ListTopButton[i].ButtonID = i;
        ListTopButton[i].InitComponent(Controller, self);
        AppendComponent(ListTopButton[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3ea;
    }
    i = 0;
    J0x561:
    // End:0x74f [While If]
    if(i < 5)
    {
        serverButton = new class'BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = 510.0 + float(100 * i) + float(i);
        fb.Y1 = 114.0;
        fb.X2 = 510.0 + float(100 * i + 1) + float(i);
        fb.Y2 = 114.0 + float(23);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.50;
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetDefaultTabButtonImage();
        serverButton.SetDefaultTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        MainButton[i] = serverButton;
        MainButton[i].Caption = strMainMenu[i];
        TabControl[0].BindTabButtonAndPanel(MainButton[i], ACLList);
        MainButton[i].ButtonID = i;
        MainButton[i].__OnClick__Delegate = MainButton_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x561;
    }
    i = 0;
    J0x756:
    // End:0x9fd [While If]
    if(i < 5)
    {
        serverButton = new class'BTOwnerDrawCaptionButtonHK';
        serverButton.bVisible = false;
        serverButton.bUseAWinPos = true;
        fb.X1 = 510.0 + float(7) + float(81 * i) + float(i);
        fb.Y1 = 114.0 + float(5) + float(23);
        fb.X2 = 510.0 + float(7) + float(81 * i + 1) + float(i);
        fb.Y2 = 114.0 + float(5) + float(23) + float(20);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.50;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.buttonImage[0] = class'BTUIResourcePoolHK'.default.butt_m_n;
        serverButton.buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_m_on;
        serverButton.buttonImage[2] = class'BTUIResourcePoolHK'.default.butt_m_on;
        serverButton.buttonImage[3] = class'BTUIResourcePoolHK'.default.butt_m_cli;
        serverButton.buttonImage[4] = class'BTUIResourcePoolHK'.default.butt_m_cli;
        serverButton.SetDefaultMTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        SubButton[i] = serverButton;
        TabControl[1].BindTabButtonAndPanel(SubButton[i], ACLList);
        SubButton[i].ButtonID = i;
        SubButton[i].__OnClick__Delegate = SubButton_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x756;
    }
    TabControl[0].SetVisiblePanel(0);
    TabControl[1].SetVisiblePanel(0);
    PageButton = new class'BTPageListButtonHK';
    PageButton.bUseAWinPos = true;
    PageButton.AWinPos = fbPageButton;
    PageButton.InitComponent(Controller, self);
    AppendComponent(PageButton);
    InfoBox = new class'BTItemInfoHorzBoxHK';
    InfoBox.bUseAWinPos = true;
    fb.X1 = 510.0;
    fb.Y1 = 564.0;
    fb.X2 = 510.0 + float(504);
    fb.Y2 = 564.0 + float(172);
    InfoBox.AWinPos = fb;
    InfoBox.InitComponent(Controller, self);
    AppendComponent(InfoBox);
    i = 0;
    J0xb1f:
    // End:0xc5c [While If]
    if(i < 2)
    {
        MenuButton[i] = new class'BTOwnerDrawCaptionButtonHK';
        MenuButton[i].Caption = strMenuButton[i];
        MenuButton[i].bUseAWinPos = true;
        MenuButton[i].AWinPos = fbMenuButton[i];
        MenuButton[i].SetFontSizeAll(12);
        MenuButton[i].SetDefaultFontColor();
        MenuButton[i].SetDefaultButtonImage();
        MenuButton[i].RenderWeight = 0.60;
        MenuButton[i].ButtonID = i;
        MenuButton[i].__OnClick__Delegate = MenuButton_OnClick;
        MenuButton[i].InitComponent(Controller, self);
        AppendComponent(MenuButton[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xb1f;
    }
    i = 0;
    J0xc63:
    // End:0xcaf [While If]
    if(i < 5)
    {
        SubButton[i].SetVisibility(true);
        SubButton[i].Caption = strSubMenu[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xc63;
    }
}

function InitializeDragAndDrop()
{
    local int i;
    local export editinline BTItemBoxButtonHK btn;

    DragBox = new class'DragObject';
    DragBox.Init();
    i = 0;
    J0x25:
    // End:0x6e [While If]
    if(i < 4)
    {
        btn = ButtonWeapon[i];
        btn.bDropSource = true;
        btn.bDropTarget = true;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x25;
    }
    ACLList.MultiColumnList.bCaptureMouse = true;
    ACLList.MultiColumnList.bDropSource = false;
    ACLList.MultiColumnList.bDropTarget = true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    InitializeLeftPanel();
    InitializeRightPanel();
    InitializeDragAndDrop();
    TabControl[1].SetVisiblePanel(0);
}

defaultproperties
{
    InvenGroup=mgroups
    begin object name=mBackgroundImage class=BTStretchedImageHK
        Image=Texture'Warfare_GP_UI_UI.Common.panel_1'
        WinTop=0.0
        WinLeft=0.0
        WinWidth=1.0
        WinHeight=1.0
    object end
    // Reference: BTStretchedImageHK'BTTPAuctionBuyingHK.mBackgroundImage'
    BackgroundImage=mBackgroundImage
    fbButtonWeapon[0]=(X1=337.0,Y1=117.0,X2=493.0,Y2=202.0)
    fbButtonWeapon[1]=(X1=337.0,Y1=204.0,X2=493.0,Y2=289.0)
    fbButtonWeapon[2]=(X1=337.0,Y1=291.0,X2=413.0,Y2=376.0)
    fbButtonWeapon[3]=(X1=415.0,Y1=291.0,X2=493.0,Y2=376.0)
    fbButtonWeapon[4]=(X1=337.0,Y1=465.0,X2=493.0,Y2=550.0)
    fbButtonWeapon[5]=(X1=337.0,Y1=552.0,X2=413.0,Y2=637.0)
    fbButtonWeapon[6]=(X1=415.0,Y1=552.0,X2=493.0,Y2=637.0)
    fbButtonWeapon[7]=(X1=337.0,Y1=639.0,X2=413.0,Y2=724.0)
    fbButtonWeapon[8]=(X1=415.0,Y1=639.0,X2=493.0,Y2=724.0)
    fbButtonWeapon[9]=(X1=337.0,Y1=378.0,X2=413.0,Y2=463.0)
    strButtonWeapon[0]="Primary"
    strButtonWeapon[1]="Secondary"
    strButtonWeapon[2]="Thrown"
    strButtonWeapon[3]="Thrown"
    strButtonWeapon[4]="Helmet"
    strButtonWeapon[5]="Face"
    strButtonWeapon[6]="Accessory"
    strButtonWeapon[7]="AF Uniform"
    strButtonWeapon[8]="RSA Uniform"
    strAF="AF"
    strRSA="RSA"
    strMainMenu[0]="All"
    strMainMenu[1]="Assault Rifle (AR)"
    strMainMenu[2]="Sub Machine Gun (SMG)"
    strMainMenu[3]="Sniper Rifle (SR)"
    strMainMenu[4]="Secondary"
    strSubMenu[0]="All"
    strSubMenu[1]="Legendary"
    strSubMenu[2]="Rare"
    strSubMenu[3]="Superior"
    strSubMenu[4]="Normal"
    TabControl[0]=mTabControl
    TabControl=mTabControl2
    strListTopButton[0]="Item Name"
    strListTopButton[1]="Rank"
    strListTopButton[2]="Lv."
    strListTopButton[3]="Damage Level"
    strListTopButton[4]="End"
    strListTopButton[5]="Highest Bid"
    strListTopButton[6]="Buy-Now Price"
    strListTopButton[7]="Highest Bidder"
    fbListTopButton[0]=(X1=512.0,Y1=167.0,X2=618.0,Y2=193.0)
    fbListTopButton[1]=(X1=618.0,Y1=167.0,X2=653.0,Y2=193.0)
    fbListTopButton[2]=(X1=653.0,Y1=167.0,X2=689.0,Y2=193.0)
    fbListTopButton[3]=(X1=689.0,Y1=167.0,X2=731.0,Y2=193.0)
    fbListTopButton[4]=(X1=731.0,Y1=167.0,X2=773.0,Y2=193.0)
    fbListTopButton[5]=(X1=773.0,Y1=167.0,X2=844.0,Y2=193.0)
    fbListTopButton[6]=(X1=844.0,Y1=167.0,X2=915.0,Y2=193.0)
    fbListTopButton[7]=(X1=915.0,Y1=167.0,X2=1012.0,Y2=193.0)
    fbLabelItemList=(X1=510.0,Y1=137.0,X2=1014.0,Y2=558.0)
    fbACLList=(X1=512.0,Y1=194.0,X2=997.0,Y2=481.0)
    fbACLListScrollBar=(X1=998.0,Y1=194.0,X2=1012.0,Y2=506.0)
    strMenuButton[0]="Buy Now"
    strMenuButton[1]="Bid"
    strMenuButton[2]="Check Market Price"
    strMenuButton[3]="Search"
    fbMenuButton[0]=(X1=911.0,Y1=520.0,X2=1004.0,Y2=552.0)
    fbMenuButton[1]=(X1=813.0,Y1=520.0,X2=907.0,Y2=552.0)
    fbMenuButton[2]=(X1=617.0,Y1=520.0,X2=711.0,Y2=552.0)
    fbMenuButton[3]=(X1=715.0,Y1=520.0,X2=809.0,Y2=552.0)
    fbPageButton=(X1=512.0,Y1=481.0,X2=997.0,Y2=506.0)
    RankIdx[1]=10
    RankIdx[2]=2
    RankIdx[3]=3
    RankIdx[4]=4
    RankIdx[5]=12
    SortIdx[0]=10001
    SortIdx[1]=1
    SortIdx[2]=2
    SortIdx[3]=3
    OnPreDraw=Internal_OnPreDraw
    OnRendered=Internal_OnRendered
}