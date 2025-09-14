/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPStoreWeaponHKCN.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:36
 *
 *******************************************************************************/
class BTTPStoreWeaponHKCN extends BTTPStoreWeaponHK
    editinlinenew
    instanced;

var int nOldMouseX;
var int nOffsetMouseDis;
var export editinline BTOwnerDrawImageHK LockImage;

function bool Internal_OnPreDraw(Canvas C)
{
    local int i;
    local BTItemListMenuBtn temp;
    local BTROItemBoxHK ro;

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
    CharRotByDrag();
    i = 0;
    J0x60:
    // End:0x2c2 [While If]
    if(i < TPItemList.ItemList.SubMenuBtn.Length)
    {
        temp = TPItemList.ItemList.SubMenuBtn[i];
        // End:0xf7
        if(temp.ClickBtnIndex == temp.0)
        {
            TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
            // This is an implied JumpToken;
            goto J0x2c2;
        }
        // End:0x2b8
        else
        {
            // End:0x1d9
            if(temp.ClickBtnIndex == temp.4)
            {
                ro = BTROItemBoxHK(TPItemList.ItemList.DataList[i / 3]);
                // End:0x199
                if(CheckValidItem(ro.ItemInfo, ro.instanceInfo) == false)
                {
                    TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                    return false;
                }
                ShowSaveWindow(ro, 0, 0);
                TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                // This is an implied JumpToken;
                goto J0x2c2;
            }
            // End:0x2b8
            else
            {
                // End:0x2b8
                if(temp.ClickBtnIndex == temp.3)
                {
                    ro = BTROItemBoxHK(TPItemList.ItemList.DataList[i / 3]);
                    // End:0x27b
                    if(CheckValidItem(ro.ItemInfo, ro.instanceInfo) == false)
                    {
                        TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                        return false;
                    }
                    ShowSaveWindow(ro, 1, 0);
                    TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                }
                // End:0x2c2
                else
                {
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x60;
        }
    }
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
    if(i < 7)
    {
        // End:0x196
        if(ButtonWeapon[i] != none && ButtonWeapon[i].Controller != none && ButtonWeapon[i].IsInBounds())
        {
            UIModel.bAcceptsInput = false;
            UIModel.bLMouseDn = false;
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
    ButtonAF.bSelect = false;
    ButtonAF.bSelectHighlight = false;
    ButtonRSA.bSelect = true;
    ButtonRSA.bSelectHighlight = true;
    return true;
}

function bool MainButton_OnClick(GUIComponent Sender)
{
    MainTabSelect(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
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
}

function bool ItemList_OnBeginDrag(GUIComponent Sender)
{
    local BTROItemBoxHK Box;

    Log("ItemList_OnBeginDrag");
    Box = BTROItemBoxHK(TPItemList.ItemList.GetSelectItem());
    // End:0xcd
    if(Sender.bDropSource == true && DragBox.IsDragging() == false && Box.CheckIn(Controller.MouseX, Controller.MouseY))
    {
        DragBox.BeginDrag(int(Controller.MouseX), int(Controller.MouseY), Box);
        return true;
    }
    return false;
}

function ItemList_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("ItemList_OnEndDrag" @ string(Sender));
    // End:0x5f
    if(Sender.Class == class'BTItemBoxButtonHK')
    {
        InvenGroup.SelectButton(BTItemBoxButtonHK(Sender).ButtonID);
        EquipItem();
    }
    DragBox.EndDrag();
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
    // End:0x5e
    else
    {
        // End:0x5e
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
    InvenGroup.SelectButton(btn.ButtonID);
    InfoBox.SetData(ButtonWeapon[btn.ButtonID].itemBox.ItemInfo, ButtonWeapon[btn.ButtonID].itemBox.instanceInfo, none, none);
    InfoBox.ItemBoxView.itemBox.ChangeState(0);
    return true;
}

function bool ButtonWeapon_OnDblClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    UnequipItem(btn.ButtonID);
    return true;
}

function bool BTWindowItemBuyHK_ButtonRechargeCash_OnOK(GUIComponent Sender)
{
    deleShowCashChargeWindow();
    return true;
}

function BTWindowItemBuyHK_OnTimeOut(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    class'BTWindowErrorDefineHK'.static.ShowError(Controller, 194);
}

function BTWindowSendPresentHK_OnTimeOut(GUIComponent Sender)
{
    class'BTWindowHK'.static.CloseWindowAllByName(Controller, class'BTWindowSendPresentHK');
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 183);
}

function bool BTWindowSelectCoin(GUIComponent Sender)
{
    local int buyType;
    local byte cashType;
    local BTROItemBoxHK ro;

    buyType = BTWindowSelectCashTypeHK(Controller.TopPage()).selectBuyType;
    cashType = BTWindowSelectCashTypeHK(Controller.TopPage()).selectCashType;
    ro = BTWindowSelectCashTypeHK(Controller.TopPage()).ROItemBox;
    Controller.CloseMenu();
    ShowItemBuyWindow(ro, buyType, cashType);
    return true;
}

function bool ShowSaveWindow(BTROItemBoxHK ro, int buyType, byte cashType)
{
    local wItemBoxCashHK cii;
    local bool EnableCCoin;

    // End:0x0d
    if(ro == none)
    {
        return true;
    }
    cii = ro.instanceInfo.CashItemInfo;
    // End:0xfb
    if(cii != none)
    {
        // End:0x4b
        if(buyType == 1)
        {
            EnableCCoin = false;
        }
        // End:0x61
        else
        {
            EnableCCoin = cii.EnableCCoin;
        }
        class'BTWindowSelectCashTypeHK'.static.ShowWindowSelectCashType(Controller, ro, cii.EnablePCoin, EnableCCoin);
        BTWindowSelectCashTypeHK(Controller.TopPage()).selectBuyType = buyType;
        BTWindowSelectCashTypeHK(Controller.TopPage()).__OnOK__Delegate = BTWindowSelectCoin;
        BTWindowSelectCashTypeHK(Controller.TopPage()).__OnPCoin__Delegate = BTWindowSelectCoin;
    }
    // End:0x112
    else
    {
        ShowItemBuyWindow(ro, buyType, cashType);
    }
    return true;
}

function bool MenuButton_OnClick(GUIComponent Sender)
{
    local BTROItemBoxHK ro;
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local wMatchMaker MM;

    switch(btn.ButtonID)
    {
        // End:0x21
        case 0:
            deleShowCashChargeWindow();
            // End:0xab
            break;
        // End:0x43
        case 1:
            // End:0x32
            if(ro == none)
            {
                return true;
            }
            ShowSaveWindow(ro, 1, 0);
            // End:0xab
            break;
        // End:0xa8
        case 2:
            // End:0x8a
            if(MM.kLevel < ro.ItemInfo.EquipLevel)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 60);
                return true;
            }
            // End:0x97
            if(ro == none)
            {
                return true;
            }
            ShowSaveWindow(ro, 0, 0);
            // End:0xab
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

function bool FindAndRemoveItem(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x8c [While If]
    if(i < 9)
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

function MainTabSelect(int tabi, optional int subtabi)
{
    TabControl[0].SetVisiblePanel(tabi);
    TabControl[1].SetVisiblePanel(subtabi);
    switch(tabi)
    {
        // End:0x45
        case 1:
            ChangeSubButton(astrSubMenuWeapon);
            // End:0x8f
            break;
        // End:0x58
        case 2:
            ChangeSubButton(astrSubMenuEquip);
            // End:0x8f
            break;
        // End:0x6b
        case 3:
            ChangeSubButton(astrSubMenuSpecial);
            // End:0x8f
            break;
        // End:0x7e
        case 4:
            ChangeSubButton(astrSubMenuCashItem);
            // End:0x8f
            break;
        // End:0xffff
        default:
            ChangeSubButton(astrSubMenuNewAndHot);
            // End:0x8f Break;
            break;
    }
    ChangeItemList(tabi, subtabi);
    ChatBox.MultiColumnList.MyScrollBar.SetVisibility(false);
    ChatBox.MultiColumnBox.MyScrollBar.SetVisibility(false);
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
            // End:0x8d
            case 3:
                TPItemList.ItemList.ShowShopItemAdBest();
            // End:0xffff
            default:
                // End:0x2ab Break;
                break;
            }
    }
    // End:0x129
    if(mainTab == 1)
    {
        switch(subTab)
        {
            // End:0xc4
            case 0:
                TPItemList.ItemList.ShowWeaponAll();
                // End:0x126
                break;
            // End:0xe3
            case 1:
                TPItemList.ItemList.ShowMainWeapon();
                // End:0x126
                break;
            // End:0x103
            case 2:
                TPItemList.ItemList.ShowSubWeapon();
                // End:0x126
                break;
            // End:0x123
            case 3:
                TPItemList.ItemList.ShowHandThrowWeapon();
                // End:0x126
                break;
            // End:0xffff
            default:
                // End:0x2ab Break;
                break;
            }
    }
    // End:0x1e0
    if(mainTab == 2)
    {
        switch(subTab)
        {
            // End:0x15b
            case 0:
                TPItemList.ItemList.ShowEquipItem();
                // End:0x1dd
                break;
            // End:0x17a
            case 1:
                TPItemList.ItemList.ShowEquipSpCharItem();
                // End:0x1dd
                break;
            // End:0x19a
            case 2:
                TPItemList.ItemList.ShowEquipHeadItem();
                // End:0x1dd
                break;
            // End:0x1ba
            case 3:
                TPItemList.ItemList.ShowEquipFaceItem();
                // End:0x1dd
                break;
            // End:0x1da
            case 4:
                TPItemList.ItemList.ShowEquipAccessoryItem();
                // End:0x1dd
                break;
            // End:0xffff
            default:
                // End:0x2ab Break;
                break;
            }
    }
    // End:0x257
    if(mainTab == 3)
    {
        switch(subTab)
        {
            // End:0x212
            case 0:
                TPItemList.ItemList.ShowSkillAll();
                // End:0x254
                break;
            // End:0x231
            case 1:
                TPItemList.ItemList.ShowActiveSkill();
                // End:0x254
                break;
            // End:0x251
            case 2:
                TPItemList.ItemList.ShowPassiveSkill();
                // End:0x254
                break;
            // End:0xffff
            default:
                // End:0x2ab Break;
                break;
            }
    }
    // End:0x2ab
    if(mainTab == 4)
    {
        switch(subTab)
        {
            // End:0x289
            case 0:
                TPItemList.ItemList.ShowEtc();
                // End:0x2ab
                break;
            // End:0x2a8
            case 1:
                TPItemList.ItemList.ShowEtc();
                // End:0x2ab
                break;
            // End:0xffff
            default:
            }
            AddSubMenuBtns();
            SetInfoBox();
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

function UnequipItem(int ButtonID)
{
    local export editinline BTItemBoxButtonHK ib;

    ib = ButtonWeapon[ButtonID];
    // End:0x7f
    if(ib.itemBox.instanceInfo != none)
    {
        TcpChannel.sfReqEquipItem(ib.itemBox.instanceInfo.ItemID, ib.itemBox.instanceInfo.UniqueID, 13);
    }
}

function SetInfoBox(optional int Index)
{
    // End:0x0d
    if(Index < 0)
    {
        return;
    }
    // End:0xe4
    if(TPItemList.ItemList.DataList.Length > 0)
    {
        InfoBox.SetData(BTROItemBoxHK(TPItemList.ItemList.DataList[Index]).ItemInfo, BTROItemBoxHK(TPItemList.ItemList.DataList[Index]).instanceInfo, none, none);
        InfoBox.ItemBoxView.itemBox.ChangeState(7);
        InfoBox.ItemBoxView.itemBox.MyData = TPItemList.MyData;
    }
}

function Refresh()
{
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local int i;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 0;
    J0x36:
    // End:0xd1 [While If]
    if(i < 7)
    {
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(18 + i);
        // End:0xb0
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            ButtonWeapon[i].SetData(ItemInfo, instanceInfo);
        }
        // End:0xc7
        else
        {
            ButtonWeapon[i].SetData(none, none);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
}

function InitializeLeftPanel()
{
    local int i;

    AFTeamBG = new class'BTOwnerDrawImageHK';
    AFTeamBG.bUseAWinPos = true;
    AFTeamBG.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(20.0, 120.0, 329.0, 725.0);
    AFTeamBG.BackgroundImage = class'BTUIResourcePoolHK'.default.img_AF_cha;
    AFTeamBG.RenderWeight = 0.10;
    AFTeamBG.InitComponent(Controller, self);
    AppendComponent(AFTeamBG);
    RSATeamBG = new class'BTOwnerDrawImageHK';
    RSATeamBG.bUseAWinPos = true;
    RSATeamBG.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(20.0, 120.0, 329.0, 725.0);
    RSATeamBG.BackgroundImage = class'BTUIResourcePoolHK'.default.img_RSA_cha;
    RSATeamBG.RenderWeight = 0.10;
    RSATeamBG.InitComponent(Controller, self);
    AppendComponent(RSATeamBG);
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
    ButtonAF.SetMidTabButtonImage();
    ButtonAF.Caption = strAF;
    ButtonAF.__OnClick__Delegate = ButtonAF_OnClick;
    ButtonAF.bSelect = true;
    ButtonAF.bSelectHighlight = true;
    ButtonRSA = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(115.0, 97.0, 218.0, 129.0), 0.80);
    ButtonRSA.SetTabButtonFontColor();
    ButtonRSA.SetSmallTabButtonImage();
    ButtonRSA.Caption = strRSA;
    ButtonRSA.__OnClick__Delegate = ButtonRSA_OnClick;
    i = 0;
    J0x341:
    // End:0x457 [While If]
    if(i < 7)
    {
        // End:0x35c
        if(i == 6)
        {
        }
        // End:0x44d
        else
        {
            ButtonWeapon[i] = new class'BTItemBoxButtonHK';
            ButtonWeapon[i].bUseAWinPos = true;
            ButtonWeapon[i].AWinPos = fbButtonWeapon[i];
            ButtonWeapon[i].DefaultSlotName[0] = strButtonWeapon[i + 4];
            ButtonWeapon[i].InitComponent(Controller, self);
            AppendComponent(ButtonWeapon[i]);
            ButtonWeapon[i].itemBox.ChangeState(19);
            InvenGroup.AddButton(ButtonWeapon[i]);
            ButtonWeapon[i].CaptionPadding[1] = 2;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x341;
    }
    ButtonWeapon[0].DefaultSlotImage = class'BTUIResourcePoolHK'.default.new_img_slot_hlmt;
    ButtonWeapon[1].DefaultSlotImage = class'BTUIResourcePoolHK'.default.new_img_slot_face;
    ButtonWeapon[2].DefaultSlotImage = class'BTUIResourcePoolHK'.default.new_img_slot_gogl;
    ButtonWeapon[3].DefaultSlotImage = class'BTUIResourcePoolHK'.default.new_img_slot_clth_af;
    ButtonWeapon[4].DefaultSlotImage = class'BTUIResourcePoolHK'.default.new_img_slot_clth_rsa;
    ButtonWeapon[5].DefaultSlotImage = class'BTUIResourcePoolHK'.default.new_img_slot_class;
    ButtonWeapon[6].DefaultSlotImage = class'BTUIResourcePoolHK'.default.new_img_slot_clth_af;
    LockImage = new class'BTOwnerDrawImageHK';
    LockImage.BackgroundImage = class'BTUIResourcePoolHK'.default.Block_Weapon;
    LockImage.bUseAWinPos = true;
    LockImage.AWinPos = fbButtonWeapon[6];
    LockImage.ApplyAWinPos();
    LockImage.CaptionDrawType = 4;
    AppendComponent(LockImage);
    i = 0;
    J0x5bb:
    // End:0x605 [While If]
    if(i < 7)
    {
        ButtonWeapon[i].__OnClick__Delegate = None;
        ButtonWeapon[i].__OnDblClick__Delegate = None;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5bb;
    }
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
    UIModel = new class'BTModelHK';
    UIModel.bAcceptsInput = false;
    UIModel.bUseAWinPos = true;
    UIModel.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(5.0, 147.0, 324.0, 620.0);
    UIModel.RenderWeight = 0.70;
    UIModel.InitComponent(Controller, self);
    AppendComponent(UIModel);
}

function InitializeRightPanel()
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i, MenuLen;
    local wMatchMaker MM;

    LabelItemList = new class'BTOwnerDrawImageHK';
    LabelItemList.bUseAWinPos = true;
    LabelItemList.AWinPos = fbLabelItemList;
    LabelItemList.InitComponent(Controller, self);
    AppendComponent(LabelItemList);
    TPItemList = new class'BTTPItemListHK';
    TPItemList.bUseAWinPos = true;
    TPItemList.AWinPos = fbTPItemList;
    TPItemList.InitComponent(Controller, self);
    AppendComponent(TPItemList);
    TPItemList.ItemList.bShopItem = true;
    TPItemList.ItemList.BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_store_in;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MenuLen = 5;
    i = 0;
    J0x130:
    // End:0x31b [While If]
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
        MainButton[i].__OnClick__Delegate = MainButton_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x130;
    }
    i = 0;
    J0x322:
    // End:0x587 [While If]
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
        goto J0x322;
    }
    TabControl[0].SetVisiblePanel(0);
    TabControl[1].SetVisiblePanel(0);
    InfoBox = new class'BTItemInfoHorzBoxHKCN';
    InfoBox.bUseAWinPos = true;
    fb.X1 = 510.0;
    fb.Y1 = 564.0;
    fb.X2 = 510.0 + float(504);
    fb.Y2 = 564.0 + float(172);
    InfoBox.AWinPos = fb;
    InfoBox.InitComponent(Controller, self);
    AppendComponent(InfoBox);
    i = 0;
    J0x655:
    // End:0x74c [While If]
    if(i < 3)
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
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x655;
    }
    astrSubMenuNewAndHot.Length = 4;
    i = 0;
    J0x75c:
    // End:0x78d [While If]
    if(i < astrSubMenuNewAndHot.Length)
    {
        astrSubMenuNewAndHot[i] = strSubMenuNewAndHot[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x75c;
    }
    astrSubMenuWeapon.Length = 4;
    i = 0;
    J0x79d:
    // End:0x7ce [While If]
    if(i < astrSubMenuWeapon.Length)
    {
        astrSubMenuWeapon[i] = strSubMenuWeapon[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x79d;
    }
    astrSubMenuEquip.Length = 5;
    i = 0;
    J0x7de:
    // End:0x80f [While If]
    if(i < astrSubMenuEquip.Length)
    {
        astrSubMenuEquip[i] = strSubMenuEquip[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7de;
    }
    i = 0;
    J0x816:
    // End:0x846 [While If]
    if(i < 4 - 1)
    {
        astrSubMenuSpecial[i] = strSubMenuSpecial[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x816;
    }
    astrSubMenuCashItem.Length = 2;
    i = 0;
    J0x856:
    // End:0x887 [While If]
    if(i < astrSubMenuCashItem.Length)
    {
        astrSubMenuCashItem[i] = strSubMenuCashItem[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x856;
    }
    ChangeSubButton(astrSubMenuNewAndHot);
    i = 0;
    J0x899:
    // End:0x8c9 [While If]
    if(i < 3)
    {
        MenuButton[i].__OnClick__Delegate = MenuButton_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x899;
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
    // End:0x96 [While If]
    if(i < 7)
    {
        btn = ButtonWeapon[i];
        btn.bDropSource = true;
        btn.bDropTarget = true;
        btn.__OnBeginDrag__Delegate = ButtonWeapon_OnBeginDrag;
        btn.__OnEndDrag__Delegate = ButtonWeapon_OnEndDrag;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x25;
    }
    TPItemList.ItemList.ImageList.bCaptureMouse = true;
    TPItemList.ItemList.ImageList.bDropSource = true;
    TPItemList.ItemList.ImageList.bDropTarget = true;
    TPItemList.ItemList.ImageList.__OnBeginDrag__Delegate = ItemList_OnBeginDrag;
    TPItemList.ItemList.ImageList.__OnEndDrag__Delegate = ItemList_OnEndDrag;
}

function bool InternalOnKeyEvent(out byte key, out byte KeyState, float Delta)
{
    local Engine.Interactions.EInputKey iKey;

    // End:0x109
    if(Controller.MouseX >= fbTPItemList.X1 && Controller.MouseY >= fbTPItemList.Y1)
    {
        // End:0x109
        if(Controller.MouseX <= fbTPItemList.X2 && Controller.MouseY <= fbTPItemList.Y2)
        {
            iKey = key;
            // End:0xc6
            if(KeyState == 3 && iKey == 236)
            {
                TPItemList.ItemList.ImageList.WheelUp();
                return true;
            }
            // End:0x109
            if(KeyState == 3 && iKey == 237)
            {
                TPItemList.ItemList.ImageList.WheelDown();
                return true;
            }
        }
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    InitializeLeftPanel();
    InitializeRightPanel();
}

defaultproperties
{
    InvenGroup=mgroups
    begin object name=mBackgroundImage class=BTStretchedImageHK
        WinTop=0.0
        WinLeft=0.0
        WinWidth=1.0
        WinHeight=1.0
    object end
    // Reference: BTStretchedImageHK'BTTPStoreWeaponHKCN.mBackgroundImage'
    BackgroundImage=mBackgroundImage
    fbButtonWeapon[0]=(X1=227.0,Y1=138.0,X2=303.0,Y2=223.0)
    fbButtonWeapon[1]=(X1=227.0,Y1=227.0,X2=303.0,Y2=312.0)
    fbButtonWeapon[2]=(X1=227.0,Y1=405.0,X2=303.0,Y2=490.0)
    fbButtonWeapon[3]=(X1=28.0,Y1=642.0,X2=104.0,Y2=727.0)
    fbButtonWeapon[4]=(X1=108.0,Y1=642.0,X2=184.0,Y2=727.0)
    fbButtonWeapon[5]=(X1=227.0,Y1=642.0,X2=303.0,Y2=727.0)
    fbButtonWeapon[6]=(X1=227.0,Y1=316.0,X2=303.0,Y2=401.0)
    TabControl[0]=mTabControl
    TabControl=mTabControl2
    fbTPItemList=(X1=515.0,Y1=194.0,X2=1013.0,Y2=544.0)
    OnPreDraw=Internal_OnPreDraw
    OnKeyEvent=InternalOnKeyEvent
}