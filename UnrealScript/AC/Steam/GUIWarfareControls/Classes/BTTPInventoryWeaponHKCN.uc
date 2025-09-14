/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPInventoryWeaponHKCN.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:55
 *
 *******************************************************************************/
class BTTPInventoryWeaponHKCN extends BTTPInventoryWeaponHK
    editinlinenew
    instanced;

var byte MainTabBtnIdx;
var byte SubTabBtnIdx;
var array<export editinline BTOwnerDrawCaptionButtonHK> ItemSubMenuBtn;
var export editinline BTOwnerDrawCaptionButtonHK ButtonLocal;
var export editinline BTWeaponLIst WList;
var bool SendProtocall;
var localized string strSlot;
var int nOldMouseX;
var int nOffsetMouseDis;
var export editinline BTOwnerDrawImageHK LockImage;
var delegate<dele_StopWebzenWebzenInvenList> __dele_StopWebzenWebzenInvenList__Delegate;
var delegate<dele_sfReqWebzenInvenList> __dele_sfReqWebzenInvenList__Delegate;

function InitializeLeftPanel()
{
    local int i;

    bVisibleAFModel = true;
    ButtonLR = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(213.0, 566.0, 264.0, 597.0), 0.80);
    ButtonLR.SetDefaultLRotateButtonImage();
    ButtonLR.__OnMousePressed__Delegate = ButtonLR_OnPressed;
    ButtonLR.__OnMouseRelease__Delegate = ButtonLR_OnRelease;
    ButtonRR = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(11.0, 566.0, 62.0, 597.0), 0.80);
    ButtonRR.SetDefaultRRotateButtonImage();
    ButtonRR.__OnMousePressed__Delegate = ButtonRR_OnPressed;
    ButtonRR.__OnMouseRelease__Delegate = ButtonRR_OnRelease;
    ButtonAF = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(11.0, 97.0, 114.0, 129.0), 0.80);
    ButtonAF.SetTabButtonFontColor();
    ButtonAF.bSelect = true;
    ButtonAF.bSelectHighlight = true;
    ButtonAF.SetMidTabButtonImage();
    ButtonAF.Caption = strAF;
    ButtonAF.__OnClick__Delegate = ButtonAF_OnClick;
    ButtonRSA = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(115.0, 97.0, 218.0, 129.0), 0.80);
    ButtonRSA.SetTabButtonFontColor();
    ButtonRSA.SetMidTabButtonImage();
    ButtonRSA.Caption = strRSA;
    ButtonRSA.__OnClick__Delegate = ButtonRSA_OnClick;
    i = 0;
    J0x1fb:
    // End:0x34d [While If]
    if(i < 11)
    {
        // End:0x216
        if(i == 10)
        {
        }
        // End:0x343
        else
        {
            ButtonWeapon[i] = new class'BTItemBoxButtonHK';
            ButtonWeapon[i].bUseAWinPos = true;
            ButtonWeapon[i].AWinPos = fbButtonWeapon[i];
            ButtonWeapon[i].DefaultSlotName[0] = strButtonWeapon[i];
            // End:0x2f6
            if(i > 3)
            {
                ButtonWeapon[i].InitComponent(Controller, self);
                AppendComponent(ButtonWeapon[i]);
                ButtonWeapon[i].itemBox.ChangeState(19);
                ButtonWeapon[i].ButtonID = i;
            }
            InvenGroup.AddButton(ButtonWeapon[i]);
            ButtonWeapon[i].__OnClick__Delegate = ButtonWeapon_OnClick;
            ButtonWeapon[i].CaptionPadding[1] = 2;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1fb;
    }
    ButtonWeapon[4].DefaultSlotImage = class'BTUIResourcePoolHK'.default.new_img_slot_hlmt;
    ButtonWeapon[5].DefaultSlotImage = class'BTUIResourcePoolHK'.default.new_img_slot_face;
    ButtonWeapon[6].DefaultSlotImage = class'BTUIResourcePoolHK'.default.new_img_slot_gogl;
    ButtonWeapon[7].DefaultSlotImage = class'BTUIResourcePoolHK'.default.new_img_slot_clth_af;
    ButtonWeapon[8].DefaultSlotImage = class'BTUIResourcePoolHK'.default.new_img_slot_clth_rsa;
    ButtonWeapon[9].DefaultSlotImage = class'BTUIResourcePoolHK'.default.new_img_slot_class;
    ButtonWeapon[10].DefaultSlotImage = class'BTUIResourcePoolHK'.default.new_img_slot_clth_af;
    LockImage = new class'BTOwnerDrawImageHK';
    LockImage.BackgroundImage = class'BTUIResourcePoolHK'.default.Block_Weapon;
    LockImage.bUseAWinPos = true;
    LockImage.AWinPos = fbButtonWeapon[10];
    LockImage.ApplyAWinPos();
    LockImage.CaptionDrawType = 4;
    AppendComponent(LockImage);
    ChatBox = new class'BTAutoScrollListHK';
    ChatBox.bUseAWinPos = true;
    ChatBox.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(22.0, 666.0 + float(18), 324.0, 720.0);
    ChatBox.RenderWeight = 0.710;
    ChatBox.InitComponent(Controller, self);
    AppendComponent(ChatBox);
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.X1 = 0.0;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.Y1 = 0.0;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.X2 = 0.0;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.Y2 = 0.0;
    ChatBox.MultiColumnList.MyScrollBar.ApplyAWinPos();
    ChatBox.DisableMe();
    UIModel = new class'BTModelHK';
    UIModel.bUseAWinPos = true;
    UIModel.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(5.0, 147.0, 324.0, 620.0);
    UIModel.RenderWeight = 1.0;
    UIModel.InitComponent(Controller, self);
    AppendComponent(UIModel);
}

function InitializeRightPanel()
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i, MenuLen;
    local wMatchMaker MM;

    TPItemList = new class'BTTPItemListHK';
    TPItemList.bUseAWinPos = true;
    TPItemList.AWinPos = fbTPItemList;
    TPItemList.bNeverFocus = true;
    TPItemList.InitComponent(Controller, self);
    AppendComponent(TPItemList);
    TPItemList.ItemList.bShowOnlyInventory = false;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MenuLen = 5;
    i = 0;
    J0xbe:
    // End:0x28f [While If]
    if(i < MenuLen)
    {
        serverButton = new class'BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = 514.0 + float(i * 100);
        fb.Y1 = 125.0;
        fb.X2 = 613.0 + float(i * 100);
        fb.Y2 = 157.0;
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.50;
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
        TabControl[0].BindTabButtonAndPanel(MainButton[i], TPItemList);
        MainButton[i].ButtonID = i;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xbe;
    }
    i = 0;
    J0x296:
    // End:0x4fb [While If]
    if(i < 5)
    {
        serverButton = new class'BTOwnerDrawCaptionButtonHK';
        serverButton.bVisible = false;
        serverButton.bUseAWinPos = true;
        fb.X1 = 514.0 + float(i * 77);
        fb.Y1 = 164.0;
        fb.X2 = 590.0 + float(i * 77);
        fb.Y2 = 192.0;
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.50;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.buttonImage[0] = class'BTUIResourcePoolHK'.default.Inven_sub_btn_n;
        serverButton.buttonImage[1] = class'BTUIResourcePoolHK'.default.Inven_sub_btn_on;
        serverButton.buttonImage[2] = class'BTUIResourcePoolHK'.default.Inven_sub_btn_Focus;
        serverButton.buttonImage[3] = class'BTUIResourcePoolHK'.default.Inven_sub_btn_cli;
        serverButton.buttonImage[4] = class'BTUIResourcePoolHK'.default.Inven_sub_btn_Focus;
        serverButton.SetDefaultMTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        SubButton[i] = serverButton;
        TabControl[1].BindTabButtonAndPanel(SubButton[i], TPItemList);
        SubButton[i].ButtonID = i;
        SubButton[i].bIsDisableHover = true;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x296;
    }
    TabControl[0].SetVisiblePanel(0);
    TabControl[1].SetVisiblePanel(0);
    InfoBox = new class'BTItemInfoHorzBoxHKCN';
    InfoBox.bUseAWinPos = true;
    InfoBox.AWinPos = fb;
    InfoBox.InitComponent(Controller, self);
    AppendComponent(InfoBox);
    MenuButton = new class'BTOwnerDrawCaptionButtonHK';
    MenuButton.Caption = strMenuButton[2];
    MenuButton.bUseAWinPos = true;
    MenuButton.AWinPos = fbMenuButton;
    MenuButton.SetFontSizeAll(9);
    MenuButton.SetDefaultFontColor();
    MenuButton.buttonImage[0] = class'BTUIResourcePoolHK'.default.Inven_Total_fix_btn_n;
    MenuButton.buttonImage[1] = class'BTUIResourcePoolHK'.default.Inven_Total_fix_btn_on;
    MenuButton.buttonImage[2] = class'BTUIResourcePoolHK'.default.Inven_Total_fix_btn_Focus;
    MenuButton.buttonImage[3] = class'BTUIResourcePoolHK'.default.Inven_Total_fix_btn_cli;
    MenuButton.buttonImage[4] = class'BTUIResourcePoolHK'.default.Inven_Total_fix_btn_on;
    MenuButton.RenderWeight = 0.60;
    MenuButton.ButtonID = 2;
    MenuButton.InitComponent(Controller, self);
    // End:0x6d6
    if(FindComponentIndex(MenuButton) == -1)
    {
        AppendComponent(MenuButton);
    }
    astrSubMenuAll.Length = 3;
    i = 0;
    J0x6e6:
    // End:0x717 [While If]
    if(i < astrSubMenuAll.Length)
    {
        astrSubMenuAll[i] = strSubMenuAll[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6e6;
    }
    astrSubMenuWeapon.Length = 4;
    i = 0;
    J0x727:
    // End:0x758 [While If]
    if(i < astrSubMenuWeapon.Length)
    {
        astrSubMenuWeapon[i] = strSubMenuWeapon[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x727;
    }
    astrSubMenuEquip.Length = 5;
    i = 0;
    J0x768:
    // End:0x799 [While If]
    if(i < astrSubMenuEquip.Length)
    {
        astrSubMenuEquip[i] = strSubMenuEquip[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x768;
    }
    i = 0;
    J0x7a0:
    // End:0x7d0 [While If]
    if(i < 4 - 1)
    {
        astrSubMenuSpecial[i] = strSubMenuSpecial[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7a0;
    }
    astrSubMenuCash.Length = 2;
    i = 0;
    J0x7e0:
    // End:0x811 [While If]
    if(i < astrSubMenuCash.Length)
    {
        astrSubMenuCash[i] = strSubMenuCash[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7e0;
    }
    ChangeSubButton(astrSubMenuAll);
    MenuButton.__OnClick__Delegate = MenuButton_OnClick;
    SaveMainTab = -1;
    SaveSubTab = -1;
}

function InitializeDragAndDrop()
{
    local int i;
    local export editinline BTItemBoxButtonHK btn;

    DragBox = new class'DragObject';
    DragBox.Init();
    DragItemBox = new class'BTROItemBoxHK';
    DragItemBox.Init();
    DragItemBox.bDragMode = false;
    i = 2;
    J0x55:
    // End:0x9e [While If]
    if(i < 11)
    {
        btn = ButtonWeapon[i];
        btn.bDropSource = true;
        btn.bDropTarget = true;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x55;
    }
    TPItemList.ItemList.ImageList.bCaptureMouse = true;
    TPItemList.ItemList.ImageList.bDropSource = true;
    TPItemList.ItemList.ImageList.bDropTarget = true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    InitializeLeftPanel();
    InitializeRightPanel();
    TPItemList.ItemList.SetItemSize(236, 86);
    TPItemList.ItemList.SetItemCountPerPage(4, 2);
    TPItemList.ItemList.ImageList.MyScrollBar.Step = 2;
    TPItemList.ItemList.ImageList.MyScrollBar.ItemsPerPage = 8;
}

function Refresh()
{
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local int i;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 18;
    J0x37:
    // End:0xd5 [While If]
    if(i < 24)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0xcb
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0xcb
            if(ItemInfo != none)
            {
                ButtonWeapon[i - 18 + 4].SetData(ItemInfo, instanceInfo);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
}

function MainTabSelect(int tabi, optional int subtabi, optional bool bForce)
{
    TabControl[0].SetVisiblePanel(tabi);
    TabControl[1].SetVisiblePanel(subtabi);
    switch(tabi)
    {
        // End:0x65
        case 1:
            ChangeSubButton(astrSubMenuWeapon);
            // End:0x62
            if(FindComponentIndex(MenuButton) == -1)
            {
                AppendComponent(MenuButton);
            }
            // End:0xf0
            break;
        // End:0x83
        case 2:
            ChangeSubButton(astrSubMenuEquip);
            RemoveComponent(MenuButton);
            // End:0xf0
            break;
        // End:0xa1
        case 3:
            ChangeSubButton(astrSubMenuSpecial);
            RemoveComponent(MenuButton);
            // End:0xf0
            break;
        // End:0xbf
        case 4:
            ChangeSubButton(astrSubMenuCash);
            RemoveComponent(MenuButton);
            // End:0xf0
            break;
        // End:0xffff
        default:
            ChangeSubButton(astrSubMenuAll);
            // End:0xed
            if(FindComponentIndex(MenuButton) == -1)
            {
                AppendComponent(MenuButton);
            }
            // End:0xf0 Break;
            break;
    }
    ChangeItemList(tabi, subtabi, bForce);
    ChatBox.MultiColumnList.MyScrollBar.SetVisibility(false);
    ChatBox.MultiColumnBox.MyScrollBar.SetVisibility(false);
}

function RemoveAllRepairButton();
function AddSubMenuBtns()
{
    local int i, Count;
    local BTROItemBoxHK ro;
    local BTItemListMenuBtn temp;
    local wGameManager gm;
    local int iItemType;
    local bool isWeapon;

    gm = Controller.ViewportOwner.Actor.Level.GameMgr;
    temp = new class'BTItemListMenuBtn';
    TPItemList.ItemList.SubMenuBtn.Length = 0;
    i = 0;
    J0x5f:
    // End:0x633 [While If]
    if(i < TPItemList.ItemList.DataList.Length)
    {
        // End:0x629
        if(TPItemList.ItemList.bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
        {
            ro = BTROItemBoxHK(TPItemList.ItemList.DataList[i]);
            iItemType = gm.GetItemType(ro.ItemInfo, ro.instanceInfo);
            TPItemList.ItemList.isHaveSubMenuBtn = true;
            isWeapon = gm.CheckWeaponItem(ro.ItemInfo.ItemType);
            // End:0x236
            if(bool(iItemType & gm.FlagPCBang) == true)
            {
                TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.10, true);
                TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.10, true);
                TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.10, true);
            }
            // End:0x629
            else
            {
                // End:0x3c0
                if(isWeapon)
                {
                    // End:0x2ca
                    if(bool(iItemType & gm.FlagDurability) == true)
                    {
                        TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.0, false, ro.instanceInfo.UniqueID, ro.instanceInfo.UniqueSkillID);
                    }
                    // End:0x3bd
                    else
                    {
                        // End:0x352
                        if(bool(iItemType & gm.FlagRenew))
                        {
                            TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.6, false, ro.instanceInfo.UniqueID, ro.instanceInfo.UniqueSkillID);
                        }
                        // End:0x3bd
                        else
                        {
                            TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.0, true, ro.instanceInfo.UniqueID, ro.instanceInfo.UniqueSkillID);
                        }
                    }
                }
                // End:0x4b3
                else
                {
                    // End:0x448
                    if(bool(iItemType & gm.FlagRenew))
                    {
                        TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.6, false, ro.instanceInfo.UniqueID, ro.instanceInfo.UniqueSkillID);
                    }
                    // End:0x4b3
                    else
                    {
                        TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.10, true, ro.instanceInfo.UniqueID, ro.instanceInfo.UniqueSkillID);
                    }
                }
                // End:0x53b
                if(bool(iItemType & gm.FlagModify))
                {
                    TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.1, false, ro.instanceInfo.UniqueID, ro.instanceInfo.UniqueSkillID);
                }
                // End:0x5a6
                else
                {
                    TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.10, true, ro.instanceInfo.UniqueID, ro.instanceInfo.UniqueSkillID);
                }
                TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.2, !bool(iItemType & gm.FlagSellShop), ro.instanceInfo.UniqueID, ro.instanceInfo.UniqueSkillID);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5f;
    }
}

function AddEquipWeaponeSlot(int nSlotNum, BtrDouble UniqueID)
{
    SlotTemp = new class'BTOwnerDrawImageHK';
    SlotTemp.bUseAWinPos = true;
    SlotTemp.BackgroundImage = class'BTUIResourcePoolHK'.default.Equip_QS_WP_BG;
    SlotTemp.SetFontSizeAll(12);
    SlotTemp.InitComponent(Controller, self);
    SlotTemp.RenderWeight = 1.0;
    SlotTemp.Caption = strSlot $ string(nSlotNum + 1);
    SlotTemp.CaptionDrawType = 6;
    // End:0xe0
    if(nSlotNum + 1 == 1)
    {
        SlotTemp.FontColor[0] = class'Canvas'.static.MakeColor(100, 200, 0, byte(255));
    }
    // End:0x119
    if(nSlotNum + 1 == 2)
    {
        SlotTemp.FontColor[0] = class'Canvas'.static.MakeColor(225, 30, 30, byte(255));
    }
    // End:0x152
    if(nSlotNum + 1 == 3)
    {
        SlotTemp.FontColor[0] = class'Canvas'.static.MakeColor(0, 176, 240, byte(255));
    }
    // End:0x18b
    if(nSlotNum + 1 == 4)
    {
        SlotTemp.FontColor[0] = class'Canvas'.static.MakeColor(230, 230, 0, byte(255));
    }
    SlotTemp.CaptionPadding[0] = 5;
    SlotTemp.CaptionPadding[3] = 5;
    SlotTemp.UniqueID = UniqueID;
    AppendComponent(SlotTemp);
    SlotNum[SlotNum.Length] = SlotTemp;
}

function bool Repair_OnClick(GUIComponent Sender)
{
    local array<BtrDouble> rilist;
    local BTROItemBoxHK ro;
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local int nIndex;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    nIndex = 0;
    J0x17:
    // End:0xac [While If]
    if(nIndex < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xa2
        if(UnresolvedNativeFunction_99(TPItemList.ItemList.DataPool[nIndex].instanceInfo.UniqueID, btn.dbUniqID))
        {
            ro = TPItemList.ItemList.DataPool[nIndex];
        }
        // End:0xac
        else
        {
            ++ nIndex;
            // This is an implied JumpToken; Continue!
            goto J0x17;
        }
    }
    rilist.Length = 1;
    rilist[0] = ro.instanceInfo.UniqueID;
    TcpChannel.sfReqRepairCost(rilist);
    return true;
}

function bool Modify_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local BTROItemBoxHK ro;
    local int nIndex;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    Controller.OpenMenu("GUIWarfareControls.BTWindowModifyHK");
    nIndex = 0;
    J0x4b:
    // End:0xe0 [While If]
    if(nIndex < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xd6
        if(UnresolvedNativeFunction_99(TPItemList.ItemList.DataPool[nIndex].instanceInfo.UniqueID, btn.dbUniqID))
        {
            ro = TPItemList.ItemList.DataPool[nIndex];
        }
        // End:0xe0
        else
        {
            ++ nIndex;
            // This is an implied JumpToken; Continue!
            goto J0x4b;
        }
    }
    BTWindowModifyHK(Controller.TopPage()).SetData(ro.ItemInfo, ro.instanceInfo);
    BTWindowModifyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowModifyHK_OnOK;
    return true;
}

function bool Sell_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local BTROItemBoxHK ro;
    local int nIndex;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    Controller.OpenMenu("GUIWarfareControls.BTWindowModifyHK");
    nIndex = 0;
    J0x4b:
    // End:0xe0 [While If]
    if(nIndex < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xd6
        if(UnresolvedNativeFunction_99(TPItemList.ItemList.DataPool[nIndex].instanceInfo.UniqueID, btn.dbUniqID))
        {
            ro = TPItemList.ItemList.DataPool[nIndex];
        }
        // End:0xe0
        else
        {
            ++ nIndex;
            // This is an implied JumpToken; Continue!
            goto J0x4b;
        }
    }
    return true;
}

function bool Internal_OnPreDraw(Canvas C)
{
    local int i, nIndex;
    local RenderObject ro;
    local wItemBoxCashHK cii;
    local BTItemListMenuBtn temp;
    local array<BtrDouble> rilist;
    local wGameManager GameMgr;
    local wMatchMaker MM;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x7e
    if(CharacterModel != none)
    {
        UIModel.cModel = CharacterModel;
    }
    // End:0x99
    if(bLRMousePressed)
    {
        CharacterModel.SetRotationLeft();
    }
    // End:0xb1
    else
    {
        // End:0xb1
        if(bRRMousePressed)
        {
            CharacterModel.SetRotationRight();
        }
    }
    CharRotByDrag();
    i = 0;
    J0xbe:
    // End:0x7c8 [While If]
    if(i < TPItemList.ItemList.SubMenuBtn.Length)
    {
        temp = TPItemList.ItemList.SubMenuBtn[i];
        // End:0x1a3
        if(temp.ClickBtnIndex == temp.0)
        {
            rilist.Length = 1;
            rilist[0] = temp.dbUniqID;
            // End:0x19d
            if(SendProtocall == false)
            {
                SendProtocall = true;
                TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                CurrentRepairMode = 3;
                TcpChannel.sfReqRepairCost(rilist);
            }
            // This is an implied JumpToken;
            goto J0x7c8;
        }
        // End:0x7be
        else
        {
            // End:0x32c
            if(temp.ClickBtnIndex == temp.1)
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowModifyHK");
                nIndex = 0;
                J0x1fe:
                // End:0x293 [While If]
                if(nIndex < TPItemList.ItemList.DataPool.Length)
                {
                    // End:0x289
                    if(UnresolvedNativeFunction_99(TPItemList.ItemList.DataPool[nIndex].instanceInfo.UniqueID, temp.dbUniqID))
                    {
                        ro = TPItemList.ItemList.DataPool[nIndex];
                    }
                    // End:0x293
                    else
                    {
                        ++ nIndex;
                        // This is an implied JumpToken; Continue!
                        goto J0x1fe;
                    }
                }
                BTWindowModifyHK(Controller.TopPage()).SetData(BTROItemBoxHK(ro).ItemInfo, BTROItemBoxHK(ro).instanceInfo);
                BTWindowModifyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowModifyHK_OnOK;
                TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                // This is an implied JumpToken;
                goto J0x7c8;
            }
            // End:0x7be
            else
            {
                // End:0x37e
                if(temp.ClickBtnIndex == temp.3)
                {
                    TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                    // This is an implied JumpToken;
                    goto J0x7c8;
                }
                // End:0x7be
                else
                {
                    // End:0x517
                    if(temp.ClickBtnIndex == temp.2)
                    {
                        nIndex = 0;
                        J0x3a5:
                        // End:0x514 [While If]
                        if(nIndex < TPItemList.ItemList.DataPool.Length)
                        {
                            // End:0x50a
                            if(UnresolvedNativeFunction_99(TPItemList.ItemList.DataPool[nIndex].instanceInfo.UniqueID, temp.dbUniqID))
                            {
                                ro = TPItemList.ItemList.DataPool[nIndex];
                                // End:0x4af
                                if(UnresolvedNativeFunction_99(BTROItemBoxHK(ro).instanceInfo.UniqueID, 0) && GameMgr.IsQuickSlotBoxItem(BTROItemBoxHK(ro).instanceInfo.UniqueID))
                                {
                                    TcpChannel.sfReqSellShopItemInfo(BTROItemBoxHK(ro).instanceInfo.UniqueID, 1);
                                }
                                // End:0x4db
                                else
                                {
                                    TcpChannel.sfReqSellShopItemInfo(BTROItemBoxHK(ro).instanceInfo.UniqueID, 1);
                                }
                                TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                            }
                            // End:0x514
                            else
                            {
                                ++ nIndex;
                                // This is an implied JumpToken; Continue!
                                goto J0x3a5;
                            }
                        }
                    }
                    // End:0x7be
                    else
                    {
                        // End:0x7be
                        if(temp.ClickBtnIndex == temp.6)
                        {
                            nIndex = 0;
                            J0x53e:
                            // End:0x7be [While If]
                            if(nIndex < TPItemList.ItemList.DataPool.Length)
                            {
                                // End:0x609
                                if(GameMgr.CheckSkillItem(TPItemList.ItemList.DataPool[nIndex].ItemInfo.ItemType))
                                {
                                    // End:0x606
                                    if(TPItemList.ItemList.DataPool[nIndex].instanceInfo.UniqueSkillID == temp.nSkillID)
                                    {
                                        ro = TPItemList.ItemList.DataPool[nIndex];
                                    }
                                }
                                // End:0x66f
                                else
                                {
                                    // End:0x66f
                                    if(UnresolvedNativeFunction_99(TPItemList.ItemList.DataPool[nIndex].instanceInfo.UniqueID, temp.dbUniqID))
                                    {
                                        ro = TPItemList.ItemList.DataPool[nIndex];
                                    }
                                }
                                // End:0x7b4
                                if(ro != none)
                                {
                                    // End:0x7b4
                                    if(BTROItemBoxHK(ro).ItemInfo.CostType == 4 || BTROItemBoxHK(ro).ItemInfo.CostType == 1)
                                    {
                                        cii = BTROItemBoxHK(ro).instanceInfo.CashItemInfo;
                                        // End:0x773
                                        if(cii != none)
                                        {
                                            class'BTWindowSelectCashTypeHK'.static.ShowWindowSelectCashType(Controller, BTROItemBoxHK(ro), cii.EnablePCoin, cii.EnableCCoin);
                                            BTWindowSelectCashTypeHK(Controller.TopPage()).__OnOK__Delegate = BTWindowSelectCoin;
                                            BTWindowSelectCashTypeHK(Controller.TopPage()).__OnPCoin__Delegate = BTWindowSelectCoin;
                                        }
                                        // End:0x785
                                        else
                                        {
                                            ShowItemRenewWindow(BTROItemBoxHK(ro), 0);
                                        }
                                        TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                                    }
                                    // End:0x7be
                                    else
                                    {
                                    }
                                    ++ nIndex;
                                    // This is an implied JumpToken; Continue!
                                    goto J0x53e;
                                }
                            }
                        }
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xbe;
    }
    J0x7c8:
    return false;
}

function CharRotByDrag()
{
    local int i;

    // End:0x5f
    if(Controller.MouseX < UIModel.AWinPos.X1 || Controller.MouseX > UIModel.AWinPos.X2)
    {
        UIModel.bLMouseDn = false;
    }
    // End:0xbe
    if(Controller.MouseY < UIModel.AWinPos.Y1 || Controller.MouseY > UIModel.AWinPos.Y2)
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
    J0x11e:
    // End:0x1a0 [While If]
    if(i < 11)
    {
        // End:0x196
        if(ButtonWeapon[i] != none && ButtonWeapon[i].Controller != none && ButtonWeapon[i].IsInBounds())
        {
            UIModel.bLMouseDn = false;
            UIModel.bAcceptsInput = false;
        }
        // End:0x1a0
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x11e;
        }
    }
    // End:0x1ef
    if(UIModel.bLMouseDn)
    {
        nOffsetMouseDis = int(float(nOldMouseX) - Controller.MouseX);
        CharacterModel.PawnRot.Yaw += nOffsetMouseDis * 100;
    }
    nOldMouseX = int(Controller.MouseX);
}

function Internal_OnRendered(Canvas C)
{
    local int i, j;
    local RenderObject ro;

    CurrentCanvas = C;
    i = 0;
    J0x12:
    // End:0x138 [While If]
    if(i < TPItemList.ItemList.DataList.Length)
    {
        ro = TPItemList.ItemList.DataList[i];
        j = 0;
        J0x5e:
        // End:0x12e [While If]
        if(j < SlotNum.Length)
        {
            // End:0x124
            if(UnresolvedNativeFunction_99(SlotNum[j].UniqueID, BTROItemBoxHK(ro).instanceInfo.UniqueID))
            {
                SlotNum[j].SetVisibility(ro.bvisibleBtn);
                SlotNum[j].SetEnabled(ro.bvisibleBtn);
                SlotNum[j].AWinPos = ro.AWinPos;
                SlotNum[j].ApplyAWinPos();
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x5e;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
}

function bool ItemList_BeginDrag(GUIComponent Sender)
{
    local BTROItemBoxHK Box;

    Log("ItemList_OnBeginDrag");
    Box = BTROItemBoxHK(TPItemList.ItemList.GetSelectItem());
    TPItemList.ItemList.LastSelectedItemIndex = TPItemList.ItemList.SelectItemIndex;
    // End:0x162
    if(Sender.bDropSource == true && DragBox.IsDragging() == false && Box.CheckIn(Controller.MouseX, Controller.MouseY))
    {
        DragItemBox.AWinPos = Box.AWinPos;
        DragItemBox.ItemInfo = Box.ItemInfo;
        DragItemBox.instanceInfo = Box.instanceInfo;
        DragItemBox.Update();
        DragBox.BeginDrag(int(Controller.MouseX), int(Controller.MouseY), DragItemBox);
        return true;
    }
    return false;
}

function ItemList_EndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("ItemList_OnEndDrag" @ string(Sender));
}

function ChangeItemList(int mainTab, int subTab, optional bool bForce)
{
    // End:0x76
    if(mainTab == 0)
    {
        switch(subTab)
        {
            // End:0x31
            case 0:
                TPItemList.ItemList.ShowItemAll();
                // End:0x73
                break;
            // End:0x50
            case 1:
                TPItemList.ItemList.ShowShopItemAll();
                // End:0x73
                break;
            // End:0x70
            case 2:
                TPItemList.ItemList.ShowCashItem();
                // End:0x73
                break;
            // End:0xffff
            default:
                // End:0x28e Break;
                break;
            }
    }
    // End:0x10c
    if(mainTab == 1)
    {
        switch(subTab)
        {
            // End:0xa7
            case 0:
                TPItemList.ItemList.ShowWeaponAll();
                // End:0x109
                break;
            // End:0xc6
            case 1:
                TPItemList.ItemList.ShowMainWeapon();
                // End:0x109
                break;
            // End:0xe6
            case 2:
                TPItemList.ItemList.ShowSubWeapon();
                // End:0x109
                break;
            // End:0x106
            case 3:
                TPItemList.ItemList.ShowHandThrowWeapon();
                // End:0x109
                break;
            // End:0xffff
            default:
                // End:0x28e Break;
                break;
            }
    }
    // End:0x1c3
    if(mainTab == 2)
    {
        switch(subTab)
        {
            // End:0x13e
            case 0:
                TPItemList.ItemList.ShowEquipItem();
                // End:0x1c0
                break;
            // End:0x15d
            case 1:
                TPItemList.ItemList.ShowEquipSpCharItem();
                // End:0x1c0
                break;
            // End:0x17d
            case 2:
                TPItemList.ItemList.ShowEquipHeadItem();
                // End:0x1c0
                break;
            // End:0x19d
            case 3:
                TPItemList.ItemList.ShowEquipFaceItem();
                // End:0x1c0
                break;
            // End:0x1bd
            case 4:
                TPItemList.ItemList.ShowEquipAccessoryItem();
                // End:0x1c0
                break;
            // End:0xffff
            default:
                // End:0x28e Break;
                break;
            }
    }
    // End:0x23a
    if(mainTab == 3)
    {
        switch(subTab)
        {
            // End:0x1f5
            case 0:
                TPItemList.ItemList.ShowSkillAll();
                // End:0x237
                break;
            // End:0x214
            case 1:
                TPItemList.ItemList.ShowActiveSkill();
                // End:0x237
                break;
            // End:0x234
            case 2:
                TPItemList.ItemList.ShowPassiveSkill();
                // End:0x237
                break;
            // End:0xffff
            default:
                // End:0x28e Break;
                break;
            }
    }
    // End:0x28e
    if(mainTab == 4)
    {
        switch(subTab)
        {
            // End:0x26c
            case 0:
                TPItemList.ItemList.ShowEtc();
                // End:0x28e
                break;
            // End:0x28b
            case 1:
                TPItemList.ItemList.ShowEtc();
                // End:0x28e
                break;
            // End:0xffff
            default:
            }
            AddSubMenuBtns();
            SaveMainTab = mainTab;
            SaveSubTab = subTab;
}

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    // End:0x35
    if(TPItemList.ItemList.SelectItemIndex != TPItemList.ItemList.LastSelectedItemIndex)
    {
        return false;
    }
    Controller.FocusedControl.LoseFocus(Sender);
    return false;
}

function EquipSkill()
{
    local int currentSlot;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wMyPlayerStatus MyStatus;

    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    ItemList = TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).instanceInfo;
    // End:0xc5
    if(instanceInfo.SlotPosition != 13)
    {
        return;
    }
    // End:0xdc
    if(ItemInfo.bSkill == false)
    {
        return;
    }
    // End:0xfb
    if(ItemInfo.SkillUseType == 0)
    {
        currentSlot = 14;
    }
    // End:0x11c
    else
    {
        // End:0x11a
        if(ItemInfo.SkillUseType == 1)
        {
            currentSlot = 15;
        }
        // End:0x11c
        else
        {
            return;
        }
    }
    // End:0x136
    if(currentSlot == instanceInfo.SlotPosition)
    {
        return;
    }
    TcpChannel.sfReqEquipSkill(instanceInfo.ItemID, instanceInfo.UniqueSkillID, byte(currentSlot));
}

function bool ImageListBox_OnDblClick(GUIComponent Sender)
{
    return false;
}

function fill()
{
    local int i;
    local wGameManager GameMgr;
    local BTROItemBoxHK ro;
    local wItemBoxInstanceHK instanceInfo;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TPItemList.ItemList.ClearItem();
    TPItemList.MyData.myLevel = MM.kLevel;
    TPItemList.MyData.MyPoint = MM.kPoint;
    TPItemList.MyData.MyCash = MM.kCash;
    i = 0;
    J0xf0:
    // End:0x290 [While If]
    if(i < GameMgr.InstanceItemLists.Length)
    {
        instanceInfo = GameMgr.InstanceItemLists[i];
        ro = new class'BTROItemBoxHK';
        ro.Init();
        ro.ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
        ro.instanceInfo = instanceInfo;
        // End:0x1aa
        if(UnresolvedNativeFunction_99(instanceInfo.UniqueID, 0))
        {
            ro.ChangeState(5);
        }
        // End:0x1bb
        else
        {
            ro.ChangeState(3);
        }
        // End:0x215
        if(ro.ItemInfo.IsCashItem() == true)
        {
            GameMgr.AddCashItem(ro.ItemInfo, ro.instanceInfo, class'BTWindowDefineInfoHK'.static.GetClientString(122));
        }
        ro.MyData = TPItemList.MyData;
        ro.SetMatchMaker(MM);
        ro.SetGameManager(GameMgr);
        ro.Update();
        TPItemList.ItemList.AddItem(ro);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf0;
    }
    TPItemList.ItemList.ImageList.__OnDblClick__Delegate = ImageListBox_OnDblClick;
}

function bool SubButton_OnClick(GUIComponent Sender)
{
    TPItemList.ItemList.ImageList.SetTopItem(0);
    TabControl[1].SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    ChangeItemList(TabControl[0].GetCurrentTabIndex(), BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    SubTabBtnIdx = byte(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
}

function bool SubButton_OnHover(GUIComponent Sender)
{
    local int mainTab, subTab;

    mainTab = TabControl[0].GetCurrentTabIndex();
    subTab = BTOwnerDrawCaptionButtonHK(Sender).ButtonID;
    // End:0x5b
    if(mainTab == 1)
    {
        switch(subTab)
        {
            // End:0x49
            case 0:
                // End:0x5b
                break;
            // End:0x50
            case 1:
                // End:0x5b
                break;
            // End:0x58
            case 2:
                // End:0x5b
                break;
            // End:0xffff
            default:
            }
            return true;
}

function UpdateServerTime(BtrDouble D)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x40 [While If]
    if(i < 11)
    {
        ButtonWeapon[i].itemBox.UpdateTime(D);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    self.TPItemList.UpdateServerTime(D);
}

function bool FindAndRemoveItem(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x8c [While If]
    if(i < 11)
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

function int GetButtonWeaponID(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xc7 [While If]
    if(i < 11)
    {
        // End:0xbd
        if(ButtonWeapon[i].itemBox != none && ButtonWeapon[i].itemBox.instanceInfo != none && ButtonWeapon[i].itemBox.ItemInfo != none)
        {
            // End:0xbd
            if(UnresolvedNativeFunction_99(ButtonWeapon[i].itemBox.instanceInfo.UniqueID, UniqueID))
            {
                return ButtonWeapon[i].ButtonID;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function UnequipItem(int ButtonID)
{
    local export editinline BTItemBoxButtonHK ib;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ib = ButtonWeapon[ButtonID];
    // End:0x1e7
    if(ib.itemBox.instanceInfo != none)
    {
        // End:0xc9
        if(ib.itemBox.ItemInfo.ItemID == GameMgr.GetMainWeaponID() || ib.itemBox.ItemInfo.ItemID == GameMgr.GetSubWeaponID())
        {
            return;
        }
        // End:0x120
        if(ib.itemBox.instanceInfo.SlotPosition == 0)
        {
            TcpChannel.sfReqEquipItem(GameMgr.GetMainWeaponID(), GameMgr.GetMainWeaponUniqueID(), 0);
        }
        // End:0x1c8
        else
        {
            // End:0x177
            if(ib.itemBox.instanceInfo.SlotPosition == 1)
            {
                TcpChannel.sfReqEquipItem(GameMgr.GetSubWeaponID(), GameMgr.GetSubWeaponUniqueID(), 1);
            }
            // End:0x1c8
            else
            {
                TcpChannel.sfReqEquipItem(ib.itemBox.instanceInfo.ItemID, ib.itemBox.instanceInfo.UniqueID, 13);
            }
        }
        PlayerOwner().PlaySound(Controller.ItemTakeoffSound, 6, 1.0);
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

function ButtonRR_OnRelease(GUIComponent Sender)
{
    bRRMousePressed = false;
}

function bool ButtonAF_OnClick(GUIComponent Sender)
{
    CharacterModel.ChangeTeam(0);
    ButtonAF.bSelect = true;
    ButtonAF.bSelectHighlight = true;
    ButtonRSA.bSelect = false;
    ButtonRSA.bSelectHighlight = false;
    return true;
}

function bool ButtonRSA_OnClick(GUIComponent Sender)
{
    CharacterModel.ChangeTeam(1);
    ButtonRSA.bSelect = true;
    ButtonRSA.bSelectHighlight = true;
    ButtonAF.bSelect = false;
    ButtonAF.bSelectHighlight = false;
    return true;
}

function bool MainButton_OnClick(GUIComponent Sender)
{
    TPItemList.ItemList.ImageList.SetTopItem(0);
    MainTabSelect(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
}

function bool ItemList_OnBeginDrag(GUIComponent Sender)
{
    local BTROItemBoxHK Box;

    Log("ItemList_OnBeginDrag");
    Box = BTROItemBoxHK(TPItemList.ItemList.GetSelectItem());
    TPItemList.ItemList.LastSelectedItemIndex = TPItemList.ItemList.SelectItemIndex;
    // End:0x162
    if(Sender.bDropSource == true && DragBox.IsDragging() == false && Box.CheckIn(Controller.MouseX, Controller.MouseY))
    {
        DragItemBox.AWinPos = Box.AWinPos;
        DragItemBox.ItemInfo = Box.ItemInfo;
        DragItemBox.instanceInfo = Box.instanceInfo;
        DragItemBox.Update();
        DragBox.BeginDrag(int(Controller.MouseX), int(Controller.MouseY), DragItemBox);
        return true;
    }
    return false;
}

function ItemList_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("ItemList_OnEndDrag" @ string(Sender));
    DragBox.EndDrag();
}

function bool ButtonWeapon_OnBeginDrag(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    Log("ButtonWeapon_OnBeginDrag");
    btn = BTItemBoxButtonHK(Sender);
    // End:0x13c
    if(btn.bDropSource == true && DragBox.IsDragging() == false && btn.itemBox.ItemInfo != none)
    {
        DragItemBox.AWinPos = btn.itemBox.AWinPos;
        DragItemBox.ItemInfo = btn.itemBox.ItemInfo;
        DragItemBox.instanceInfo = btn.itemBox.instanceInfo;
        DragItemBox.Update();
        DragBox.BeginDrag(int(Controller.MouseX), int(Controller.MouseY), DragItemBox, btn.ButtonID);
        return true;
    }
    return false;
}

function ButtonWeapon_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("ButtonWeapon_OnEndDrag" @ string(Sender));
    // End:0x49
    if(Sender.Class == class'BTItemBoxButtonHK')
    {
        ButtonWeapon_OnClick(Sender);
    }
    // End:0x69
    else
    {
        // End:0x69
        if(Sender != none)
        {
            UnequipItem(DragBox.GetOptionalIndex());
        }
    }
    DragBox.EndDrag();
}

function bool ButtonWeapon_OnClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    ChatBox.FocusFirst(none);
    UnequipItem(btn.ButtonID);
    return true;
}

function bool ButtonWeapon_OnDblClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    UnequipItem(btn.ButtonID);
    return true;
}

function bool BTWindowModifyHK_OnOK(GUIComponent Sender)
{
    local int iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID;
    local export editinline BTWindowModifyHK WinModify;

    WinModify = BTWindowModifyHK(Controller.TopPage());
    TcpChannel.sfReqModifyWeapon(WinModify.GetSelectedItemUniqueID(), WinModify.GetSelectedUnionedPartID(), WinModify.GetSelectedPaintingID());
    iSightPartID = WinModify.GetSelectedUnionedPartID() & 1023;
    iBarrelPartID = WinModify.GetSelectedUnionedPartID() & 130048;
    iSilencerPartID = WinModify.GetSelectedUnionedPartID() & 16646144;
    iGunstockPartID = WinModify.GetSelectedUnionedPartID() & 2130706432;
    iBarrelPartID = iBarrelPartID >> 10;
    iSilencerPartID = iSilencerPartID >> 17;
    iGunstockPartID = iGunstockPartID >> 24;
    Controller.ViewportOwner.Actor.clog("[sfReqModifyWeapon] : " $ string(WinModify.GetSelectedUnionedPartID()) $ " Sight:" $ string(iSightPartID) $ " Barrel:" $ string(iBarrelPartID) $ " Silencer:" $ string(iSilencerPartID) $ " Gunstock:" $ string(iGunstockPartID));
    return true;
}

function bool BTWindowDefineSelectHK_IsQuickSlotItem(GUIComponent Sender)
{
    Log("[BTTPInventoryWeaponHK::BTWindowDefineSelectHK_IsQuickSlotItem]");
    Controller.CloseMenu(false);
    // End:0xbc
    if(UnresolvedNativeFunction_99(InfoBox.ItemBoxView.itemBox.instanceInfo.UniqueID, 0))
    {
        TcpChannel.sfReqSellShopItemInfo(InfoBox.ItemBoxView.itemBox.instanceInfo.UniqueID, 1);
    }
    return true;
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

function RefreshItemList()
{
    ChangeItemList(TabControl[0].GetVisiblePanelIndex(), TabControl[1].GetVisiblePanelIndex());
}

function BTWindowDefineStateHK_sfReqWebzenInvenListS_OnTimeOut(GUIComponent Sender)
{
    dele_StopWebzenWebzenInvenList();
    BTWindowDefineStateHK(Controller.TopPage()).FadeOut(false, true);
}

delegate dele_StopWebzenWebzenInvenList();
delegate bool dele_sfReqWebzenInvenList(string Type);
function SetInfoBox(optional int ItemIndex)
{
    InfoBox.ItemBoxView.itemBox.MyData = TPItemList.MyData;
    SelectItem(BTROItemBoxHK(TPItemList.ItemList.DataList[ItemIndex]).ItemInfo, BTROItemBoxHK(TPItemList.ItemList.DataList[ItemIndex]).instanceInfo);
}

function bool ChangeSubButton(array<string> strTemp)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x57 [While If]
    if(i < strTemp.Length)
    {
        SubButton[i].SetVisibility(true);
        SubButton[i].Caption = strTemp[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = strTemp.Length;
    J0x63:
    // End:0xa6 [While If]
    if(i < 5)
    {
        SubButton[i].SetVisibility(false);
        SubButton[i].Caption = "";
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x63;
    }
    return true;
}

function bool BTWindowCreateClanMarkHK_OnOK(GUIComponent Sender)
{
    local wMatchMaker MM;
    local export editinline BTWindowCreateClanMarkHK BTWindow;

    Log("[BTTPInventoryWeaponHK::BTWindowCreateClanMarkHK_OnOK]");
    BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
    // End:0x259
    if(BTWindow != none)
    {
        // End:0xa3
        if(BTWindow.PaidType == 2 && BTWindow.bCheckDupSuccess == false)
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 149);
            return true;
        }
        MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
        // End:0x197
        if(BTWindow.PaidType == 1)
        {
            // End:0x12d
            if(BTWindow.SelectClanMark[0] == 0 || BTWindow.SelectClanMark[1] == 0)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 148);
                return true;
            }
            MM.kTcpChannel.sfReqPaidItem_ChangeClanMark(BTWindow.UniqueID, byte(BTWindow.PaidType), BTWindow.SelectClanMark[0], BTWindow.SelectClanMark[1], BTWindow.SelectClanMark[2]);
        }
        // End:0x259
        else
        {
            // End:0x259
            if(BTWindow.PaidType == 2)
            {
                // End:0x1f2
                if(BTWindow.ChooseClanMark[0] == 0 || BTWindow.ChooseClanMark[1] == 0)
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 148);
                    return true;
                }
                MM.kTcpChannel.sfReqPaidItem_ChangeClanMark(BTWindow.UniqueID, byte(BTWindow.PaidType), BTWindow.ChooseClanMark[0], BTWindow.ChooseClanMark[1], BTWindow.ChooseClanMark[2]);
            }
        }
    }
    return true;
}

function bool BTWindowCreateClanMarkHK_IsExist_OnOK(GUIComponent Sender)
{
    local wMatchMaker MM;
    local export editinline BTWindowCreateClanMarkHK BTWindow;

    Log("[BTTPInventoryWeaponHK::BTWindowCreateClanMarkHK_IsExist_OnOK]");
    BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
    // End:0x291
    if(BTWindow != none)
    {
        // End:0xc4
        if(BTWindow.PaidType == 2 && BTWindow.SelectClanMark[0] == 0 || BTWindow.SelectClanMark[1] == 0)
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 148);
            return true;
        }
        BTWindow.ChooseClanMark[0] = BTWindow.SelectClanMark[0];
        BTWindow.ChooseClanMark[1] = BTWindow.SelectClanMark[1];
        BTWindow.ChooseClanMark[2] = BTWindow.SelectClanMark[2];
        MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
        // End:0x172
        if(MM == none)
        {
            Log("MM is None");
        }
        // End:0x1a0
        if(MM.kTcpChannel == none)
        {
            Log("MM.kTcpChannel is None");
        }
        Log("MM.kTcpChannel.sfReqPaidItem_ClanMarkDupCheck(" $ string(BTWindow.PaidType) $ ", " $ string(BTWindow.ChooseClanMark[0]) $ ", " $ string(BTWindow.ChooseClanMark[1]) $ ", " $ string(BTWindow.ChooseClanMark[2]) $ ")");
        MM.kTcpChannel.sfReqPaidItem_ClanMarkDupCheck(byte(BTWindow.PaidType), BTWindow.ChooseClanMark[0], BTWindow.ChooseClanMark[1], BTWindow.ChooseClanMark[2]);
    }
    return true;
}

function bool BTWindowDefineARHK_ReceiveCashItem_OnOK(GUIComponent Sender)
{
    local wMatchMaker MM;
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTTPInventoryWeaponHK::BTWindowDefineARHK_ReceiveCashItem_OnOK]");
    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    // End:0x172
    if(BTWindow != none)
    {
        MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
        Log("sfReqWebzenBillingUseStorageItem(" $ string(BTWindow.ExtraData_int) $ ", " $ string(BTWindow.ExtraData_int2) $ ", " $ string(BTWindow.ExtraData_int3) $ ")");
        MM.kTcpChannel.sfReqWebzenBillingUseStorageItem(BTWindow.ExtraData_int, BTWindow.ExtraData_int2, byte(BTWindow.ExtraData_int3));
        BTWindow.ButtonOK.DisableMe();
        BTWindow.FadeOut(false, true);
    }
    return true;
}

function bool BTWindowDefineARHK_ItemUse_OnOK(GUIComponent Sender)
{
    local wMatchMaker MM;
    local export editinline BTWindowDefineARHK BTWindow;
    local wGameManager GameMgr;
    local string filter;
    local int temp;

    Log("[BTTPInventoryWeaponHK::BTWindowDefineARHK_ItemUse_OnOK]");
    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x98c
    if(BTWindow != none)
    {
        Log("PaidItem Use = " $ string(BTWindow.ExtraData_int));
        switch(BTWindow.ExtraData_int)
        {
            // End:0xfd
            case 17004:
            // End:0x227
            case 17075:
                // End:0x13c
                if(BTWindow.EditName.TextStr == "")
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 147);
                }
                // End:0x224
                else
                {
                    // End:0x20e
                    if(GameMgr.FilterBadWords(BTWindow.EditName.TextStr) == false)
                    {
                        Log("MM.kTcpChannel.sfReqPaidItem_BroadCast(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", 1, " $ BTWindow.EditName.TextStr $ ")");
                        MM.kTcpChannel.sfReqPaidItem_BroadCast(BTWindow.ExtraData_btrdouble, 1, BTWindow.EditName.TextStr);
                    }
                    // End:0x224
                    else
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 146);
                    }
                }
                // End:0x963
                break;
            // End:0x22f
            case 17005:
            // End:0x35a
            case 17076:
                // End:0x26e
                if(BTWindow.EditName.TextStr == "")
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 147);
                }
                // End:0x357
                else
                {
                    // End:0x341
                    if(GameMgr.FilterBadWords(BTWindow.EditName.TextStr) == false)
                    {
                        Log("MM.kTcpChannel.sfReqPaidItem_BroadCast(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", 2, " $ BTWindow.EditName.TextStr $ ")");
                        MM.kTcpChannel.sfReqPaidItem_BroadCast(BTWindow.ExtraData_btrdouble, 2, BTWindow.EditName.TextStr);
                    }
                    // End:0x357
                    else
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 146);
                    }
                }
                // End:0x963
                break;
            // End:0x3d5
            case 17012:
                Log("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", 2)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 2);
                // End:0x963
                break;
            // End:0x44f
            case 17013:
                Log("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", 1)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 1);
                // End:0x963
                break;
            // End:0x4ca
            case 17018:
                Log("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", 4)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 4);
                // End:0x963
                break;
            // End:0x545
            case 17082:
                Log("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", 5)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 5);
                // End:0x963
                break;
            // End:0x5c0
            case 17049:
                Log("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", 6)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 6);
                // End:0x963
                break;
            // End:0x790
            case 17011:
                // End:0x60e
                if(GameMgr.ContainsBadNicks(BTWindow.EditName.TextStr, filter))
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 101);
                    return true;
                }
                temp = IsCorrectUserName(BTWindow.EditName.TextStr);
                // End:0x67f
                if(temp == -1 || BTWindow.EditName.TextStr == "none")
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 13);
                    return true;
                }
                // End:0x6b1
                else
                {
                    // End:0x6b1
                    if(temp > 16 || temp < 4)
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
                        return true;
                    }
                }
                // End:0x6e9
                if(IsInIncompleteLetter(BTWindow.EditName.TextStr))
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 160);
                    return true;
                }
                Log("MM.kTcpChannel.sfReqPaidItem_ChangeCharname(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", " $ BTWindow.EditName.TextStr $ ")");
                MM.kTcpChannel.sfReqPaidItem_ChangeCharname(BTWindow.ExtraData_btrdouble, BTWindow.EditName.TextStr);
                // End:0x963
                break;
            // End:0x960
            case 17017:
                // End:0x7de
                if(GameMgr.ContainsBadNicks(BTWindow.EditName.TextStr, filter))
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 101);
                    return true;
                }
                temp = IsCorrectUserName(BTWindow.EditName.TextStr);
                // End:0x84f
                if(temp == -1 || BTWindow.EditName.TextStr == "none")
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 13);
                    return true;
                }
                // End:0x881
                else
                {
                    // End:0x881
                    if(temp > 16 || temp < 4)
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
                        return true;
                    }
                }
                // End:0x8b9
                if(IsInIncompleteLetter(BTWindow.EditName.TextStr))
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 160);
                    return true;
                }
                Log("MM.kTcpChannel.sfReqPaidItem_ChangeClanname(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", " $ BTWindow.EditName.TextStr $ ")");
                MM.kTcpChannel.sfReqPaidItem_ChangeClanname(BTWindow.ExtraData_btrdouble, BTWindow.EditName.TextStr);
                // End:0x963
                break;
            // End:0xffff
            default:
                BTWindow.ButtonOK.DisableMe();
                BTWindow.FadeOut(false, true);
            }
            return true;
}

function bool BTWindowSelectCoin(GUIComponent Sender)
{
    local byte cashType;
    local BTROItemBoxHK ro;

    cashType = BTWindowSelectCashTypeHK(Controller.TopPage()).selectCashType;
    ro = BTWindowSelectCashTypeHK(Controller.TopPage()).ROItemBox;
    Controller.CloseMenu();
    ShowItemRenewWindow(ro, cashType);
    return true;
}

function bool ShowItemRenewWindow(BTROItemBoxHK ro, byte cashType)
{
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    Controller.OpenMenu("GUIWarfareControls.BTWindowItemRenew");
    BTWindowItemRenew(Controller.TopPage()).SetCashType(cashType);
    BTWindowItemRenew(Controller.TopPage()).SetRenderObject(ro, ro.ItemInfo, ro.instanceInfo, ro.instanceInfo.CashItemInfo);
    BTWindowItemRenew(Controller.TopPage()).SetMoney(MM.kPoint, MM.kCash, MM.kCCoinCash);
    BTWindowItemRenew(Controller.TopPage()).__OnOK__Delegate = BTWindowItemRenew_OnOK;
    BTWindowItemRenew(Controller.TopPage()).btButtonCash.__OnClick__Delegate = BTWindowItemRenew_ButtonRechargeCash_OnOK;
    return true;
}

defaultproperties
{
    strSlot="Slot"
    InvenGroup=mgroups
    begin object name=mBackgroundImage class=BTStretchedImageHK
        WinTop=0.0
        WinLeft=0.0
        WinWidth=1.0
        WinHeight=1.0
    object end
    // Reference: BTStretchedImageHK'BTTPInventoryWeaponHKCN.mBackgroundImage'
    BackgroundImage=mBackgroundImage
    fbButtonWeapon[0]=(X1=326.0,Y1=137.0,X2=482.0,Y2=216.0)
    fbButtonWeapon[1]=(X1=326.0,Y1=222.0,X2=402.0,Y2=304.0)
    fbButtonWeapon[2]=(X1=337.0,Y1=291.0,X2=413.0,Y2=376.0)
    fbButtonWeapon[3]=(X1=415.0,Y1=291.0,X2=493.0,Y2=376.0)
    fbButtonWeapon[4]=(X1=227.0,Y1=138.0,X2=303.0,Y2=223.0)
    fbButtonWeapon[5]=(X1=227.0,Y1=227.0,X2=303.0,Y2=312.0)
    fbButtonWeapon[6]=(X1=227.0,Y1=405.0,X2=303.0,Y2=490.0)
    fbButtonWeapon[7]=(X1=28.0,Y1=642.0,X2=104.0,Y2=727.0)
    fbButtonWeapon[8]=(X1=108.0,Y1=642.0,X2=184.0,Y2=727.0)
    fbButtonWeapon[9]=(X1=227.0,Y1=642.0,X2=303.0,Y2=727.0)
    fbButtonWeapon[10]=(X1=227.0,Y1=316.0,X2=303.0,Y2=401.0)
    TabControl[0]=mTabControl
    TabControl=mTabControl2
    fbTPItemList=(X1=515.0,Y1=194.0,X2=1013.0,Y2=544.0)
    fbMenuButton=(X1=908.0,Y1=164.0,X2=1012.0,Y2=192.0)
    OnPreDraw=Internal_OnPreDraw
    OnRendered=Internal_OnRendered
}