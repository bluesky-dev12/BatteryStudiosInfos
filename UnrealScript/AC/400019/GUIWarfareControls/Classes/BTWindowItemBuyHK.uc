class BTWindowItemBuyHK extends BTWindowHK
    editinlinenew
    instanced;

var BTTcpLink_Channel TcpChannel;
var int ItemID;
var int MyPoint;
var int MyCash;
var wItemBoxHK ItemInfo;
var wItemBoxInstanceHK instanceInfo;
var wItemBoxCashHK cii;
var int OptionDay;
var Color RedColor;
var FloatBox fbItemInfoBox;
var export editinline BTItemInfoVertBoxHK ItemInfoBox;
var FloatBox fbButtonRechargeCash;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRechargeCash;
var FloatBox fbCombo;
var export editinline BTComboBoxHK Combo;
var FloatBox fbTermLabel;
var FloatBox fbLabel[3];
var export editinline BTOwnerDrawImageHK Label[3];
var export editinline BTOwnerDrawImageHK TermLabel;
var FloatBox fbNEditPoint[3];
var FloatBox fbNEditCash[3];
var export editinline BTNumericEditBoxHK NEditPoint[3];
var export editinline BTNumericEditBoxHK NEditCash[3];
var export editinline BTEditBoxHK EditReceiveUser;
var export editinline BTMultiLineEditBoxHK EditContent;
var int MyCCoin;
var byte cashType;
var int CurrentBuyType;
var localized string strLabel[3];
var localized string strPoint;
var localized string strCash;
var localized string strDay;
var localized string strCount;
var localized string strCCoinCash;
var localized string strButtonRechargeCash;
var localized string strTerm;
var localized string strForGift[2];
var localized string strForMe[2];
var BTROItemBoxHK Ro;
//var delegate<deleShowCashChargeWindow> __deleShowCashChargeWindow__Delegate;

delegate deleShowCashChargeWindow()
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local wMatchMaker MM;

    super.InitComponent(MyController, myOwner);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemPopup_Bgdeco;
    RedColor = Class'Engine.Canvas'.static.MakeColor(byte(255), 49, 52, byte(255));
    ItemInfoBox = new Class'GUIWarfareControls_Decompressed.BTItemInfoVertBoxHK';
    ItemInfoBox.bUseAWinPos = true;
    ItemInfoBox.AWinPos = fbItemInfoBox;
    ItemInfoBox.InitComponent(MyController, self);
    AppendComponent(ItemInfoBox);
    TermLabel = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    TermLabel.bUseAWinPos = true;
    TermLabel.AWinPos = fbTermLabel;
    TermLabel.Caption = strTerm;
    TermLabel.CaptionDrawType = 4;
    TermLabel.SetFontSizeAll(11);
    TermLabel.InitComponent(MyController, self);
    AppendComponent(TermLabel);
    i = 0;
    J0x163:

    // End:0x413 [Loop If]
    if(i < 3)
    {
        Label[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        Label[i].bUseAWinPos = true;
        Label[i].AWinPos = fbLabel[i];
        Label[i].Caption = strLabel[i];
        Label[i].CaptionDrawType = 4;
        Label[i].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(byte(255), 192, 0, byte(255)));
        Label[i].SetFontSizeAll(9);
        Label[i].InitComponent(MyController, self);
        AppendComponent(Label[i]);
        NEditPoint[i] = new Class'GUIWarfareControls_Decompressed.BTNumericEditBoxHK';
        NEditPoint[i].bUseAWinPos = true;
        NEditPoint[i].AWinPos = fbNEditPoint[i];
        NEditPoint[i].bReadOnly = true;
        NEditPoint[i].SetFontDrawType(4);
        NEditPoint[i].SetDefaultNonSelectFontColor();
        NEditPoint[i].SetFontSizeAll(9);
        NEditPoint[i].InitComponent(MyController, self);
        AppendComponent(NEditPoint[i]);
        NEditCash[i] = new Class'GUIWarfareControls_Decompressed.BTNumericEditBoxHK';
        NEditCash[i].bUseAWinPos = true;
        NEditCash[i].AWinPos = fbNEditCash[i];
        NEditCash[i].bReadOnly = true;
        NEditCash[i].SetFontDrawType(4);
        NEditCash[i].SetFontSizeAll(9);
        NEditCash[i].SetDefaultNonSelectFontColor();
        NEditCash[i].InitComponent(MyController, self);
        AppendComponent(NEditCash[i]);
        i++;
        // [Loop Continue]
        goto J0x163;
    }
    Combo = new Class'GUIWarfareControls_Decompressed.BTComboBoxHK';
    Combo.bUseAWinPos = true;
    Combo.AWinPos = fbCombo;
    Combo.__OnChange__Delegate = Combo_OnChange;
    Combo.InitComponent(MyController, self);
    AppendComponent(Combo);
    Combo.bShowExtraData = true;
    OptionDay = 1;
    ButtonRechargeCash = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    ButtonRechargeCash.bUseAWinPos = true;
    ButtonRechargeCash.AWinPos = fbButtonRechargeCash;
    ButtonRechargeCash.SetDefaultButtonImage();
    ButtonRechargeCash.SetDefaultFontColor();
    ButtonRechargeCash.SetFontSizeAll(9);
    ButtonRechargeCash.Caption = strButtonRechargeCash;
    ButtonRechargeCash.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Cash_Btn_mid_n;
    ButtonRechargeCash.InitComponent(MyController, self);
    ButtonRechargeCash.__OnClick__Delegate = ItemBuyHK_ButtonRechargeCash_OnOK;
    AppendComponent(ButtonRechargeCash);
    TopLine.CaptionDrawType = 4;
    TopLine.SetFontSizeAll(11);
    TopLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    SetBuyType(0);
    UpdateDefaultWindow();
    //return;    
}

function Combo_OnChange(GUIComponent Sender)
{
    local string strCashType;
    local int calcCash;

    strCashType = GetCoinString();
    calcCash = GetCalcCash();
    OptionDay = Combo.ComboBox.GetIndex();
    // End:0x168
    if(cii == none)
    {
        NEditPoint[0].SetDataExtra(ItemInfo.PointPrice[OptionDay], strPoint);
        NEditPoint[1].SetDataExtra(MyPoint, strPoint);
        NEditPoint[2].SetDataExtra(MyPoint - ItemInfo.PointPrice[OptionDay], strPoint);
        // End:0xF3
        if((MyPoint - ItemInfo.PointPrice[OptionDay]) < 0)
        {
            NEditPoint[2].SetFontColorAll(RedColor);            
        }
        else
        {
            NEditPoint[2].SetDefaultNonSelectFontColor();
        }
        NEditCash[0].SetDataExtra(0, strCashType);
        NEditCash[1].SetDataExtra(calcCash, strCashType);
        NEditCash[2].SetDataExtra(calcCash, strCashType);
        NEditCash[2].SetDefaultNonSelectFontColor();        
    }
    else
    {
        NEditCash[0].SetDataExtra(cii.WZCashPrice[OptionDay], strCashType);
        NEditCash[1].SetDataExtra(calcCash, strCashType);
        NEditCash[2].SetDataExtra(calcCash - cii.WZCashPrice[OptionDay], strCashType);
        // End:0x21A
        if((calcCash - cii.WZCashPrice[OptionDay]) < 0)
        {
            NEditCash[2].SetFontColorAll(RedColor);            
        }
        else
        {
            NEditCash[2].SetDefaultNonSelectFontColor();
        }
        NEditPoint[0].SetDataExtra(0, strPoint);
        NEditPoint[1].SetDataExtra(MyPoint, strPoint);
        NEditPoint[2].SetDataExtra(MyPoint, strPoint);
        NEditPoint[2].SetDefaultNonSelectFontColor();
    }
    OptionDay += 1;
    //return;    
}

function SetRenderObject(BTROItemBoxHK Ro)
{
    local int i, calcCash;
    local string strCashType;

    self.Ro = Ro;
    // End:0x8E
    if((UseGP20()) && Ro.instanceInfo.cashItemInfo != none)
    {
        Controller.ViewportOwner.Actor.Level.GameMgr.SetGP20CashItemInfo(ItemInfo, int(cashType), Ro.instanceInfo.cashItemInfo);
    }
    cii = Ro.instanceInfo.cashItemInfo;
    ItemInfo = Ro.ItemInfo;
    instanceInfo = Ro.instanceInfo;
    strCashType = GetCoinString();
    calcCash = GetCalcCash();
    Combo.ComboBox.Clear();
    // End:0x420
    if(cii == none)
    {
        i = 0;
        J0x115:

        // End:0x305 [Loop If]
        if(i < 5)
        {
            // End:0x13E
            if(ItemInfo.PointPrice[i] == 0)
            {
                // [Explicit Break]
                goto J0x305;
            }
            // End:0x1AE
            if((int(byte(ItemInfo.CostType)) == int(0)) || int(byte(ItemInfo.CostType)) == int(2))
            {
                Combo.ComboBox.AddItem(string(ItemInfo.PointPrice[i]) @ strPoint);
                // [Explicit Break]
                goto J0x305;
            }
            // End:0x299
            if((int(byte(ItemInfo.CostType)) == int(3)) || int(byte(ItemInfo.CostType)) == int(5))
            {
                // End:0x238
                if(ItemInfo.Period[i] == 0)
                {
                    Combo.ComboBox.AddItem(string(ItemInfo.PointPrice[i]) @ strPoint);                    
                }
                else
                {
                    Combo.ComboBox.AddItem(((((string(ItemInfo.Period[i]) @ strCount) @ "(") @ string(ItemInfo.PointPrice[i])) @ strPoint) @ ")");
                }
                // [Explicit Continue]
                goto J0x2FB;
            }
            Combo.ComboBox.AddItem(((((string(ItemInfo.Period[i] / 24) @ strDay) @ "(") @ string(ItemInfo.PointPrice[i])) @ strPoint) @ ")");
            J0x2FB:

            i++;
            // [Loop Continue]
            goto J0x115;
        }
        J0x305:

        NEditPoint[0].SetDataExtra(ItemInfo.PointPrice[0], strPoint);
        NEditPoint[1].SetDataExtra(MyPoint, strPoint);
        NEditPoint[2].SetDataExtra(MyPoint - ItemInfo.PointPrice[0], strPoint);
        // End:0x3AB
        if((MyPoint - ItemInfo.PointPrice[0]) < 0)
        {
            NEditPoint[2].SetFontColorAll(RedColor);            
        }
        else
        {
            NEditPoint[2].SetDefaultNonSelectFontColor();
        }
        NEditCash[0].SetDataExtra(0, strCashType);
        NEditCash[1].SetDataExtra(calcCash, strCashType);
        NEditCash[2].SetDataExtra(calcCash, strCashType);
        NEditCash[2].SetDefaultNonSelectFontColor();        
    }
    else
    {
        i = 0;
        J0x427:

        // End:0x611 [Loop If]
        if(i < cii.8)
        {
            // End:0x459
            if(cii.WZCashPrice[i] == 0)
            {
                // [Explicit Break]
                goto J0x611;
            }
            // End:0x4D6
            if(((ItemInfo.CostType == 0) || ItemInfo.CostType == 2) || cii.bWZPackage == true)
            {
                Combo.ComboBox.AddItem(string(cii.WZCashPrice[i]) @ strCashType);
                // [Explicit Break]
                goto J0x611;
                // [Explicit Continue]
                goto J0x607;
            }
            // End:0x59E
            if(ItemInfo.CostType == 3)
            {
                // End:0x53D
                if(cii.WZPeriod[i] == 0)
                {
                    Combo.ComboBox.AddItem(string(cii.WZCashPrice[i]) @ strCashType);                    
                }
                else
                {
                    Combo.ComboBox.AddItem(((((string(cii.WZPeriod[i]) @ strCount) @ "(") @ string(cii.WZCashPrice[i])) @ strCashType) @ ")");
                }
                // [Explicit Continue]
                goto J0x607;
            }
            Combo.ComboBox.AddItem(((((string(cii.WZPeriod[i] / (24 * 3600)) @ strDay) @ "(") @ string(cii.WZCashPrice[i])) @ strCashType) @ ")");
            J0x607:

            i++;
            // [Loop Continue]
            goto J0x427;
        }
        J0x611:

        NEditCash[0].SetDataExtra(cii.WZCashPrice[0], strCashType);
        NEditCash[1].SetDataExtra(calcCash, strCashType);
        NEditCash[2].SetDataExtra(calcCash - cii.WZCashPrice[0], strCashType);
        // End:0x6B7
        if((calcCash - cii.WZCashPrice[0]) < 0)
        {
            NEditCash[2].SetFontColorAll(RedColor);            
        }
        else
        {
            NEditCash[2].SetDefaultNonSelectFontColor();
        }
        NEditPoint[0].SetDataExtra(0, strPoint);
        NEditPoint[1].SetDataExtra(MyPoint, strPoint);
        NEditPoint[2].SetDataExtra(MyPoint, strPoint);
        NEditPoint[2].SetDefaultNonSelectFontColor();
    }
    ItemInfoBox.SetData(ItemInfo, instanceInfo, none, none);
    //return;    
}

function SetMoneyInfo(int myp, int MyC, int myCC)
{
    MyPoint = myp;
    MyCash = MyC;
    MyCCoin = myCC;
    SetRenderObject(self.Ro);
    //return;    
}

function SetData(int iItemID, int myp, int MyC, int myCC, wItemBoxHK itemInfoBase, byte useCashType)
{
    ItemID = iItemID;
    MyPoint = myp;
    MyCash = MyC;
    ItemInfo = itemInfoBase;
    MyCCoin = myCC;
    cashType = useCashType;
    //return;    
}

function string GetCoinString()
{
    local string strCashType;

    // End:0x2B
    if(int(cashType) == int(Class'Engine.wItemBoxCashHK'.static.PCoinType()))
    {
        strCashType = strCash;        
    }
    else
    {
        strCashType = strCCoinCash;
    }
    return strCashType;
    //return;    
}

function int GetCalcCash()
{
    // End:0x23
    if(int(cashType) == int(Class'Engine.wItemBoxCashHK'.static.CCoinType()))
    {
        return MyCCoin;
    }
    return MyCash;
    //return;    
}

static function bool ShowItemBuyWindow(GUIController Controller, BTTcpLink_Channel setTCP, BTROItemBoxHK Ro, int setPoint, int setCash, int setCCoinCash, int buyType, byte cashType)
{
    Controller.OpenMenu("GUIWarfareControls.BTWindowItemBuyHK");
    BTWindowItemBuyHK(Controller.TopPage()).SetData(Ro.ItemInfo.ItemID, setPoint, setCash, setCCoinCash, Ro.ItemInfo, cashType);
    BTWindowItemBuyHK(Controller.TopPage()).SetRenderObject(Ro);
    BTWindowItemBuyHK(Controller.TopPage()).SetBuyType(buyType);
    BTWindowItemBuyHK(Controller.TopPage()).TcpChannel = setTCP;
    return true;
    //return;    
}

function bool ItemBuyHK_ButtonRechargeCash_OnOK(GUIComponent Sender)
{
    deleShowCashChargeWindow();
    return true;
    //return;    
}

function bool ItemBuyHK_OnOK(GUIComponent Sender)
{
    local wItemBoxHK ib;
    local array<int> temp;
    local wMatchMaker MM;
    local wGameManager GM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GM = Controller.ViewportOwner.Actor.Level.GameMgr;
    ib = Ro.ItemInfo;
    // End:0xBC
    if(MM.kLevel < ib.EquipLevel)
    {
        Controller.CloseMenu(false);
        Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 60);
        return true;
    }
    // End:0x1EB
    if(ItemInfo.IsCashItem() == true)
    {
        // End:0x13D
        if(cii.CheckSaleEnd(GM.kClientTime))
        {
            Class'GUIWarfareControls_Decompressed.BTWindowErrorDefineHK'.static.ShowError(Controller, 1000);
            Class'GUIWarfareControls_Decompressed.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls_Decompressed.BTWindowItemBuyHK');
            GM.UpdateItemList(GM);
            return true;
        }
        // End:0x1E8
        if(((int(cashType) == 0) && (MM.kCash - cii.WZCashPrice[OptionDay - 1]) < 0) || (int(cashType) == 1) && (MM.kCCoinCash - cii.WZCashPrice[OptionDay - 1]) < 0)
        {
            Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 205);
            Class'GUIWarfareControls_Decompressed.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls_Decompressed.BTWindowItemBuyHK');
            return true;
        }        
    }
    else
    {
        // End:0x249
        if((MM.kPoint - ItemInfo.PointPrice[OptionDay - 1]) < 0)
        {
            Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 204);
            Class'GUIWarfareControls_Decompressed.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls_Decompressed.BTWindowItemBuyHK');
            return true;
        }
    }
    // End:0x341
    if(ItemInfo.CostType == 4)
    {
        // End:0x341
        if(GM.FindFirstInstanceItemByItemID(ItemID) != none)
        {
            Controller.ReplaceMenu2("GUIWarfareControls.BTWindowItemBuyTerm");
            BTWindowItemBuyTerm(Controller.TopPage()).SetRenderObject(Ro);
            BTWindowItemBuyTerm(Controller.TopPage()).SetOptionDay(byte(OptionDay));
            BTWindowItemBuyTerm(Controller.TopPage()).TcpChannel = TcpChannel;
            BTWindowItemBuyTerm(Controller.TopPage()).SetCashType(int(cashType));
            return true;
        }
    }
    // End:0x4F3
    if(cii != none)
    {
        temp.Length = 1;
        temp[0] = ib.ItemID;
        MM.SetLastBuyItemInfo(cii.WZItemName, ib.ItemType, ib.Grade, ib.ItemID);
        // End:0x436
        if(UseGP20())
        {
            Log((("sfReqBuyItemByWebzenCashGP20(" $ string(cii.WZPriceSeq[OptionDay - 1])) $ ",") $ string(cashType));
            TcpChannel.sfReqBuyItemByWebzenCashGP20(cii.WZPriceSeq[OptionDay - 1], cashType, __NFUN_921__(0));            
        }
        else
        {
            Log((((("sfReqBuyItemByWebzenCash(" $ string(cii.WZPackageSeq)) $ ",") $ string(cii.WZCategorySeq)) $ ",") $ string(cii.WZPriceSeq[OptionDay - 1]));
            TcpChannel.sfReqBuyItemByWebzenCash(cii.WZPackageSeq, cii.WZCategorySeq, cii.WZPriceSeq[OptionDay - 1], temp, __NFUN_921__(0), byte(OptionDay), 1);
        }        
    }
    else
    {
        Log((((("sfReqBuyShopItem(" $ string(ItemID)) $ " ") $ ItemInfo.ItemName) $ " / OptionDay :") $ string(OptionDay));
        MM.SetLastBuyItemInfo(ib.ItemName, ib.ItemType, ib.Grade, ib.ItemID);
        TcpChannel.sfReqBuyShopItem(ItemID, __NFUN_921__(0), byte(OptionDay), 0);
    }
    Controller.CloseMenu(false);
    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 21, MM.lastBuyItemName);
    BTWindowHK(Controller.TopPage()).StopTimeOut();
    BTWindowHK(Controller.TopPage()).StartTimeOut(10.0000000);
    BTWindowHK(Controller.TopPage()).ButtonOK.DisableMe();
    BTWindowHK(Controller.TopPage()).__OnTimeOut__Delegate = ItemBuyHK_OnTimeOut;
    return true;
    //return;    
}

function ItemBuyHK_OnTimeOut(GUIComponent Sender)
{
    // End:0x50
    if((BTWindowDefineInfoHK(Controller.TopPage()) != none) && BTWindowDefineInfoHK(Controller.TopPage()).DefineCode == 21)
    {
        Controller.CloseMenu(false);
    }
    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 182);
    //return;    
}

function bool ItemBuyHK_BeforePresent_OnOK(GUIComponent Sender)
{
    local int Arg[3];

    Arg[0] = ItemID;
    Arg[1] = OptionDay;
    Arg[2] = 0;
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowSendPresentHK");
    BTWindowSendPresentHK(Controller.TopPage()).SetData(Arg[0], Arg[1], Arg[2]);
    BTWindowSendPresentHK(Controller.TopPage()).SetRenderObject(Ro);
    BTWindowSendPresentHK(Controller.TopPage()).TcpChannel = TcpChannel;
    BTWindowSendPresentHK(Controller.TopPage()).SetCashType(cashType);
    return true;
    //return;    
}

function SetBuyType(int buyType)
{
    CurrentBuyType = buyType;
    // End:0x50
    if(buyType == 0)
    {
        TopLine.Caption = strForMe[0];
        ButtonOK.Caption = strForMe[1];
        __OnOK__Delegate = ItemBuyHK_OnOK;        
    }
    else
    {
        // End:0x92
        if(buyType == 1)
        {
            TopLine.Caption = strForGift[0];
            ButtonOK.Caption = strForGift[1];
            __OnOK__Delegate = ItemBuyHK_BeforePresent_OnOK;
        }
    }
    //return;    
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    super.Closed(Sender, bCancelled);
    // End:0x9B
    if((UseGP20()) && CurrentBuyType == 0)
    {
        Controller.ViewportOwner.Actor.Level.GameMgr.SetGP20CashItemInfo(Ro.ItemInfo, Ro.instanceInfo.cashItemInfo.0, Ro.instanceInfo.cashItemInfo);
    }
    //return;    
}

defaultproperties
{
    fbItemInfoBox=(X1=323.0000000,Y1=130.0000000,X2=716.0000000,Y2=428.0000000)
    fbButtonRechargeCash=(X1=315.0000000,Y1=580.0000000,X2=439.0000000,Y2=617.0000000)
    fbCombo=(X1=474.0000000,Y1=443.0000000,X2=717.0000000,Y2=473.0000000)
    fbTermLabel=(X1=304.0000000,Y1=451.0000000,X2=467.0000000,Y2=466.0000000)
    fbLabel[0]=(X1=304.0000000,Y1=492.0000000,X2=467.0000000,Y2=505.0000000)
    fbLabel[1]=(X1=304.0000000,Y1=518.0000000,X2=467.0000000,Y2=531.0000000)
    fbLabel[2]=(X1=304.0000000,Y1=544.0000000,X2=467.0000000,Y2=557.0000000)
    fbNEditPoint[0]=(X1=476.0000000,Y1=492.0000000,X2=594.0000000,Y2=505.0000000)
    fbNEditPoint[1]=(X1=476.0000000,Y1=518.0000000,X2=594.0000000,Y2=531.0000000)
    fbNEditPoint[2]=(X1=476.0000000,Y1=544.0000000,X2=594.0000000,Y2=557.0000000)
    fbNEditCash[0]=(X1=597.0000000,Y1=492.0000000,X2=715.0000000,Y2=505.0000000)
    fbNEditCash[1]=(X1=597.0000000,Y1=518.0000000,X2=715.0000000,Y2=531.0000000)
    fbNEditCash[2]=(X1=597.0000000,Y1=544.0000000,X2=715.0000000,Y2=557.0000000)
    strLabel[0]="Item Price"
    strLabel[1]="Funds"
    strLabel[2]="Balance"
    strPoint="Points"
    strCash="W Coin(P)"
    strDay="Day"
    strCount="Count"
    strCCoinCash="W Coin(C)"
    strButtonRechargeCash="Buy Cash"
    strTerm="Select Duration"
    strForGift[0]="Buy gift"
    strForGift[1]="Gift"
    strForMe[0]="Buy item"
    strForMe[1]="Buy"
    fbBackgroundImage=(X1=297.0000000,Y1=93.0000000,X2=727.0000000,Y2=633.0000000)
    fbTopLine=(X1=403.0000000,Y1=99.0000000,X2=621.0000000,Y2=114.0000000)
    fbButtonOK=(X1=459.0000000,Y1=580.0000000,X2=583.0000000,Y2=617.0000000)
    fbButtonCancel=(X1=585.0000000,Y1=580.0000000,X2=709.0000000,Y2=617.0000000)
    strTitle="Buy"
    strOK="Buy"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}