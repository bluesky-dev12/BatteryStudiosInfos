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
    if(i < 7)
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

function Internal_OnRendered(Canvas C)
{
    CurrentCanvas = C;
    // End:0x60
    if(DragBox.IsDragging())
    {
        DragBox.UpdateMousePos(int(Controller.MouseX), int(Controller.MouseY));
        DragBox.Render(C);
    }
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

function bool ItemList_OnBeginDrag(GUIComponent Sender)
{
    local BTROItemBoxHK Box;

    Log("ItemList_OnBeginDrag");
    Box = BTROItemBoxHK(TPItemList.ItemList.GetSelectItem());
    // End:0xCD
    if(((Sender.bDropSource == true) && DragBox.IsDragging() == false) && Box.CheckIn(Controller.MouseX, Controller.MouseY))
    {
        DragBox.BeginDrag(int(Controller.MouseX), int(Controller.MouseY), Box);
        return true;
    }
    return false;
    //return;    
}

function ItemList_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("ItemList_OnEndDrag" @ string(Sender));
    // End:0x5F
    if(Sender.Class == Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK')
    {
        InvenGroup.SelectButton(BTItemBoxButtonHK(Sender).ButtonID);
        EquipItem();
    }
    DragBox.EndDrag();
    //return;    
}

function bool ButtonWeapon_OnBeginDrag(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    Log("ButtonWeapon_OnBeginDrag");
    btn = BTItemBoxButtonHK(Sender);
    // End:0xC4
    if(((btn.bDropSource == true) && DragBox.IsDragging() == false) && btn.itemBox.ItemInfo != none)
    {
        DragBox.BeginDrag(int(Controller.MouseX), int(Controller.MouseY), btn.itemBox, btn.ButtonID);
        return true;
    }
    return false;
    //return;    
}

function ButtonWeapon_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("ButtonWeapon_OnEndDrag" @ string(Sender));
    // End:0x3E
    if(Sender.Class == Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK')
    {        
    }
    else
    {
        // End:0x5E
        if(Sender != none)
        {
            UnequipItem(DragBox.GetOptionalIndex());
        }
    }
    DragBox.EndDrag();
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

function BTWindowItemBuyHK_OnTimeOut(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    Class'GUIWarfareControls_Decompressed.BTWindowErrorDefineHK'.static.ShowError(Controller, 194);
    //return;    
}

function BTWindowSendPresentHK_OnTimeOut(GUIComponent Sender)
{
    Class'GUIWarfareControls_Decompressed.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls_Decompressed.BTWindowSendPresentHK');
    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 183);
    //return;    
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
    ShowItemBuyWindow(ro, buyType, int(cashType));
    return true;
    //return;    
}

function bool ShowSaveWindow(BTROItemBoxHK ro, int buyType, byte cashType)
{
    local wItemBoxCashHK cii;
    local bool EnableCCoin;

    // End:0x0D
    if(ro == none)
    {
        return true;
    }
    cii = ro.instanceInfo.CashItemInfo;
    // End:0xFB
    if(cii != none)
    {
        // End:0x4B
        if(buyType == 1)
        {
            EnableCCoin = false;            
        }
        else
        {
            EnableCCoin = cii.EnableCCoin;
        }
        Class'GUIWarfareControls_Decompressed.BTWindowSelectCashTypeHK'.static.ShowWindowSelectCashType(Controller, ro, cii.EnablePCoin, EnableCCoin);
        BTWindowSelectCashTypeHK(Controller.TopPage()).selectBuyType = buyType;
        BTWindowSelectCashTypeHK(Controller.TopPage()).__OnOK__Delegate = BTWindowSelectCoin;
        BTWindowSelectCashTypeHK(Controller.TopPage()).__OnPCoin__Delegate = BTWindowSelectCoin;        
    }
    else
    {
        ShowItemBuyWindow(ro, buyType, int(cashType));
    }
    return true;
    //return;    
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

function ChangeVisibleModel(bool bAF)
{
    bVisibleAFModel = bAF;
    // End:0x3B
    if(bVisibleAFModel)
    {
        AFTeamBG.bVisible = true;
        RSATeamBG.bVisible = false;        
    }
    else
    {
        AFTeamBG.bVisible = false;
        RSATeamBG.bVisible = true;
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
        // End:0x129
        if(mainTab == 1)
        {
            switch(subTab)
            {
                // End:0xC4
                case 0:
                    TPItemList.ItemList.ShowWeaponAll();
                    // End:0x126
                    break;
                // End:0xE3
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
                // End:0xFFFF
                default:
                    break;
            }            
        }
        else
        {
            // End:0x1E0
            if(mainTab == 2)
            {
                switch(subTab)
                {
                    // End:0x15B
                    case 0:
                        TPItemList.ItemList.ShowEquipItem();
                        // End:0x1DD
                        break;
                    // End:0x17A
                    case 1:
                        TPItemList.ItemList.ShowEquipSpCharItem();
                        // End:0x1DD
                        break;
                    // End:0x19A
                    case 2:
                        TPItemList.ItemList.ShowEquipHeadItem();
                        // End:0x1DD
                        break;
                    // End:0x1BA
                    case 3:
                        TPItemList.ItemList.ShowEquipFaceItem();
                        // End:0x1DD
                        break;
                    // End:0x1DA
                    case 4:
                        TPItemList.ItemList.ShowEquipAccessoryItem();
                        // End:0x1DD
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }                
            }
            else
            {
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
                        // End:0xFFFF
                        default:
                            break;
                    }                    
                }
                else
                {
                    // End:0x2AB
                    if(mainTab == 4)
                    {
                        switch(subTab)
                        {
                            // End:0x289
                            case 0:
                                TPItemList.ItemList.ShowEtc();
                                // End:0x2AB
                                break;
                            // End:0x2A8
                            case 1:
                                TPItemList.ItemList.ShowEtc();
                                // End:0x2AB
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
    if(i < 5)
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

function UnequipItem(int ButtonID)
{
    local export editinline BTItemBoxButtonHK ib;

    ib = ButtonWeapon[ButtonID];
    // End:0x7F
    if(ib.itemBox.instanceInfo != none)
    {
        TcpChannel.sfReqEquipItem(ib.itemBox.instanceInfo.ItemID, ib.itemBox.instanceInfo.UniqueID, 13);
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
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local int i;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 0;
    J0x36:

    // End:0xD1 [Loop If]
    if(i < 7)
    {
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(18 + i);
        // End:0xB0
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            ButtonWeapon[i].SetData(ItemInfo, instanceInfo);
            // [Explicit Continue]
            goto J0xC7;
        }
        ButtonWeapon[i].SetData(none, none);
        J0xC7:

        i++;
        // [Loop Continue]
        goto J0x36;
    }
    //return;    
}

function InitializeLeftPanel()
{
    local int i;

    AFTeamBG = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    AFTeamBG.bUseAWinPos = true;
    AFTeamBG.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(20.0000000, 120.0000000, 329.0000000, 725.0000000);
    AFTeamBG.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_AF_cha;
    AFTeamBG.RenderWeight = 0.1000000;
    AFTeamBG.InitComponent(Controller, self);
    AppendComponent(AFTeamBG);
    RSATeamBG = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    RSATeamBG.bUseAWinPos = true;
    RSATeamBG.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(20.0000000, 120.0000000, 329.0000000, 725.0000000);
    RSATeamBG.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_RSA_cha;
    RSATeamBG.RenderWeight = 0.1000000;
    RSATeamBG.InitComponent(Controller, self);
    AppendComponent(RSATeamBG);
    bVisibleAFModel = true;
    ButtonLR = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(213.0000000, 566.0000000, 264.0000000, 597.0000000), 0.8000000);
    ButtonLR.SetDefaultLRotateButtonImage();
    ButtonLR.__OnMousePressed__Delegate = ButtonLR_OnPressed;
    ButtonLR.__OnMouseRelease__Delegate = ButtonLR_OnRelease;
    ButtonRR = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(11.0000000, 566.0000000, 62.0000000, 597.0000000), 0.8000000);
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
    ButtonRSA.SetSmallTabButtonImage();
    ButtonRSA.Caption = strRSA;
    ButtonRSA.__OnClick__Delegate = ButtonRSA_OnClick;
    i = 0;
    J0x341:

    // End:0x457 [Loop If]
    if(i < 7)
    {
        // End:0x35C
        if(i == 6)
        {
            // [Explicit Continue]
            goto J0x44D;
        }
        ButtonWeapon[i] = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
        ButtonWeapon[i].bUseAWinPos = true;
        ButtonWeapon[i].AWinPos = fbButtonWeapon[i];
        ButtonWeapon[i].DefaultSlotName[0] = strButtonWeapon[i + 4];
        ButtonWeapon[i].InitComponent(Controller, self);
        AppendComponent(ButtonWeapon[i]);
        ButtonWeapon[i].itemBox.ChangeState(19);
        InvenGroup.AddButton(ButtonWeapon[i]);
        ButtonWeapon[i].CaptionPadding[1] = 2;
        J0x44D:

        i++;
        // [Loop Continue]
        goto J0x341;
    }
    ButtonWeapon[0].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_hlmt;
    ButtonWeapon[1].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_face;
    ButtonWeapon[2].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_gogl;
    ButtonWeapon[3].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_clth_af;
    ButtonWeapon[4].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_clth_rsa;
    ButtonWeapon[5].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_class;
    ButtonWeapon[6].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_clth_af;
    LockImage = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LockImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Block_Weapon;
    LockImage.bUseAWinPos = true;
    LockImage.AWinPos = fbButtonWeapon[6];
    LockImage.ApplyAWinPos();
    LockImage.CaptionDrawType = 4;
    AppendComponent(LockImage);
    i = 0;
    J0x5BB:

    // End:0x605 [Loop If]
    if(i < 7)
    {
        ButtonWeapon[i].__OnClick__Delegate = None;
        ButtonWeapon[i].__OnDblClick__Delegate = None;
        i++;
        // [Loop Continue]
        goto J0x5BB;
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
    local wMatchMaker MM;

    LabelItemList = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelItemList.bUseAWinPos = true;
    LabelItemList.AWinPos = fbLabelItemList;
    LabelItemList.InitComponent(Controller, self);
    AppendComponent(LabelItemList);
    TPItemList = new Class'GUIWarfareControls_Decompressed.BTTPItemListHK';
    TPItemList.bUseAWinPos = true;
    TPItemList.AWinPos = fbTPItemList;
    TPItemList.InitComponent(Controller, self);
    AppendComponent(TPItemList);
    TPItemList.ItemList.bShopItem = true;
    TPItemList.ItemList.BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_store_in;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MenuLen = 5;
    i = 0;
    J0x130:

    // End:0x31B [Loop If]
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
        TabControl[0].BindTabButtonAndPanel(MainButton[i], TPItemList);
        MainButton[i].ButtonID = i;
        MainButton[i].__OnClick__Delegate = MainButton_OnClick;
        i++;
        // [Loop Continue]
        goto J0x130;
    }
    i = 0;
    J0x322:

    // End:0x587 [Loop If]
    if(i < 5)
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
        goto J0x322;
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
    J0x655:

    // End:0x74C [Loop If]
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
        goto J0x655;
    }
    astrSubMenuNewAndHot.Length = 4;
    i = 0;
    J0x75C:

    // End:0x78D [Loop If]
    if(i < astrSubMenuNewAndHot.Length)
    {
        astrSubMenuNewAndHot[i] = strSubMenuNewAndHot[i];
        i++;
        // [Loop Continue]
        goto J0x75C;
    }
    astrSubMenuWeapon.Length = 4;
    i = 0;
    J0x79D:

    // End:0x7CE [Loop If]
    if(i < astrSubMenuWeapon.Length)
    {
        astrSubMenuWeapon[i] = strSubMenuWeapon[i];
        i++;
        // [Loop Continue]
        goto J0x79D;
    }
    astrSubMenuEquip.Length = 5;
    i = 0;
    J0x7DE:

    // End:0x80F [Loop If]
    if(i < astrSubMenuEquip.Length)
    {
        astrSubMenuEquip[i] = strSubMenuEquip[i];
        i++;
        // [Loop Continue]
        goto J0x7DE;
    }
    i = 0;
    J0x816:

    // End:0x846 [Loop If]
    if(i < (4 - 1))
    {
        astrSubMenuSpecial[i] = strSubMenuSpecial[i];
        i++;
        // [Loop Continue]
        goto J0x816;
    }
    astrSubMenuCashItem.Length = 2;
    i = 0;
    J0x856:

    // End:0x887 [Loop If]
    if(i < astrSubMenuCashItem.Length)
    {
        astrSubMenuCashItem[i] = strSubMenuCashItem[i];
        i++;
        // [Loop Continue]
        goto J0x856;
    }
    ChangeSubButton(astrSubMenuNewAndHot);
    i = 0;
    J0x899:

    // End:0x8C9 [Loop If]
    if(i < 3)
    {
        MenuButton[i].__OnClick__Delegate = MenuButton_OnClick;
        i++;
        // [Loop Continue]
        goto J0x899;
    }
    //return;    
}

function InitializeDragAndDrop()
{
    local int i;
    local export editinline BTItemBoxButtonHK btn;

    DragBox = new Class'GUIWarfareControls_Decompressed.DragObject';
    DragBox.Init();
    i = 0;
    J0x25:

    // End:0x96 [Loop If]
    if(i < 7)
    {
        btn = ButtonWeapon[i];
        btn.bDropSource = true;
        btn.bDropTarget = true;
        btn.__OnBeginDrag__Delegate = ButtonWeapon_OnBeginDrag;
        btn.__OnEndDrag__Delegate = ButtonWeapon_OnEndDrag;
        i++;
        // [Loop Continue]
        goto J0x25;
    }
    TPItemList.ItemList.ImageList.bCaptureMouse = true;
    TPItemList.ItemList.ImageList.bDropSource = true;
    TPItemList.ItemList.ImageList.bDropTarget = true;
    TPItemList.ItemList.ImageList.__OnBeginDrag__Delegate = ItemList_OnBeginDrag;
    TPItemList.ItemList.ImageList.__OnEndDrag__Delegate = ItemList_OnEndDrag;
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

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    InitializeLeftPanel();
    InitializeRightPanel();
    //return;    
}

defaultproperties
{
    // Reference: ButtonGroups'GUIWarfareControls_Decompressed.BTTPStoreWeaponHKCN.mgroups'
    begin object name="mgroups" class=GUIWarfareControls_Decompressed.ButtonGroups
    end object
    InvenGroup=mgroups
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPStoreWeaponHKCN.mBackgroundImage'
    begin object name="mBackgroundImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
        WinTop=0.0000000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=1.0000000
    end object
    BackgroundImage=mBackgroundImage
    fbButtonWeapon[0]=(X1=227.0000000,Y1=138.0000000,X2=303.0000000,Y2=223.0000000)
    fbButtonWeapon[1]=(X1=227.0000000,Y1=227.0000000,X2=303.0000000,Y2=312.0000000)
    fbButtonWeapon[2]=(X1=227.0000000,Y1=405.0000000,X2=303.0000000,Y2=490.0000000)
    fbButtonWeapon[3]=(X1=28.0000000,Y1=642.0000000,X2=104.0000000,Y2=727.0000000)
    fbButtonWeapon[4]=(X1=108.0000000,Y1=642.0000000,X2=184.0000000,Y2=727.0000000)
    fbButtonWeapon[5]=(X1=227.0000000,Y1=642.0000000,X2=303.0000000,Y2=727.0000000)
    fbButtonWeapon[6]=(X1=227.0000000,Y1=316.0000000,X2=303.0000000,Y2=401.0000000)
    // Referen[0]ce: TabControlMocker'GUIWarfareControls_Decompressed.BTTPStoreWeaponHKCN.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPStoreWeaponHKCN.mTabControl2'
    begin object name="mTabControl2" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl2
    fbTPItemList=(X1=515.0000000,Y1=194.0000000,X2=1013.0000000,Y2=544.0000000)
    OnPreDraw=BTTPStoreWeaponHKCN.Internal_OnPreDraw
    OnKeyEvent=BTTPStoreWeaponHKCN.InternalOnKeyEvent
}