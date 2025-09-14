class BTWindowItemRenew extends BTWindowHK
    editinlinenew
    instanced;

var int ItemID;
var BtrDouble UniqueID;
var byte OptionDay;
var int iMoney;
var int iAfterMoney;
var wItemBoxHK ItemInfo;
var wItemBoxInstanceHK instanceInfo;
var wItemBoxCashHK cii;
var export editinline BTOwnerDrawImageHK lbItemName;
var export editinline BTOwnerDrawImageHK lbItemRemaingTime;
var FloatBox fbItemName;
var FloatBox fbItemRemaingTime;
var localized string strItemRemaingTime;
var FloatBox fbItemBoxView;
var export editinline BTItemBoxButtonHK ItemBoxView;
var export editinline BTOwnerDrawImageHK lbRenewTerm;
var FloatBox fbRenewTerm;
var localized string strRenewTerm;
var export editinline BTComboBoxHK cbRenewTermList;
var FloatBox fbRenewTermList;
var export editinline BTOwnerDrawCaptionButtonHK btButtonCash;
var FloatBox fbButtonCash;
var localized string strButtnCash;
var export editinline BTOwnerDrawImageHK imgItemRenewBack;
var FloatBox fbItemRenewBack;
var export editinline BTOwnerDrawImageHK lbMyMoney[4];
var FloatBox fbMyMoney[4];
var localized string strMyMoney[2];
var localized string strCount;
var localized string strDay;
var localized string strCash;
var localized string strPoint;
var byte cashType;
var localized string strCCoinCash;
var BTROItemBoxHK Ro;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    imgItemRenewBack = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    imgItemRenewBack.bUseAWinPos = true;
    imgItemRenewBack.AWinPos = fbItemRenewBack;
    imgItemRenewBack.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_timeitempopup_renew;
    imgItemRenewBack.InitComponent(MyController, self);
    AppendComponent(imgItemRenewBack);
    super.InitComponent(MyController, myOwner);
    ItemBoxView = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
    ItemBoxView.bUseAWinPos = true;
    ItemBoxView.AWinPos = fbItemBoxView;
    AppendComponent(ItemBoxView);
    ItemBoxView.itemBox.ChangeState(18);
    lbItemName = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    lbItemName.bUseAWinPos = true;
    lbItemName.AWinPos = fbItemName;
    lbItemName.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    lbItemName.SetFontSizeAll(11);
    lbItemName.SetFontColorAll(Class'Engine.BTCustomDrawHK'.static.MakeColorRGB(byte(255), 192, 0));
    lbItemName.InitComponent(MyController, self);
    AppendComponent(lbItemName);
    lbItemRemaingTime = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    lbItemRemaingTime.bUseAWinPos = true;
    lbItemRemaingTime.AWinPos = fbItemRemaingTime;
    lbItemRemaingTime.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    lbItemRemaingTime.SetFontSizeAll(9);
    lbItemRemaingTime.SetFontColorAll(Class'Engine.BTCustomDrawHK'.static.MakeColorRGB(byte(255), byte(255), byte(255)));
    lbItemRemaingTime.InitComponent(MyController, self);
    AppendComponent(lbItemRemaingTime);
    lbRenewTerm = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    lbRenewTerm.bUseAWinPos = true;
    lbRenewTerm.AWinPos = fbRenewTerm;
    lbRenewTerm.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    lbRenewTerm.SetFontSizeAll(11);
    lbRenewTerm.SetFontColorAll(Class'Engine.BTCustomDrawHK'.static.MakeColorRGB(204, 204, 204));
    lbRenewTerm.Caption = strRenewTerm;
    lbRenewTerm.InitComponent(MyController, self);
    AppendComponent(lbRenewTerm);
    cbRenewTermList = new Class'GUIWarfareControls_Decompressed.BTComboBoxHK';
    cbRenewTermList.bUseAWinPos = true;
    cbRenewTermList.AWinPos = fbRenewTermList;
    cbRenewTermList.__OnChange__Delegate = cbRenewTermList_OnChange;
    cbRenewTermList.SetDefaultFontColor();
    AppendComponent(cbRenewTermList);
    cbRenewTermList.FontDrawType = 5;
    cbRenewTermList.ExtraDataFontDrawType = 3;
    cbRenewTermList.bShowExtraData = true;
    OptionDay = 1;
    i = 0;
    J0x38C:

    // End:0x46B [Loop If]
    if(i < 4)
    {
        lbMyMoney[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        lbMyMoney[i].bUseAWinPos = true;
        lbMyMoney[i].AWinPos = fbMyMoney[i];
        lbMyMoney[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
        lbMyMoney[i].SetFontSizeAll(9);
        lbMyMoney[i].SetFontDrawType(4);
        lbMyMoney[i].InitComponent(MyController, self);
        AppendComponent(lbMyMoney[i]);
        ++i;
        // [Loop Continue]
        goto J0x38C;
    }
    lbMyMoney[0].SetFontColorAll(Class'Engine.BTCustomDrawHK'.static.MakeColorRGB(byte(255), 192, 0));
    lbMyMoney[0].Caption = strMyMoney[0];
    lbMyMoney[2].SetFontColorAll(Class'Engine.BTCustomDrawHK'.static.MakeColorRGB(byte(255), 192, 0));
    lbMyMoney[2].Caption = strMyMoney[1];
    btButtonCash = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    btButtonCash.SetDefaultButtonImage();
    btButtonCash.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Cash_Btn_mid_n;
    btButtonCash.bUseAWinPos = true;
    btButtonCash.AWinPos = fbButtonCash;
    btButtonCash.SetDefaultFontColor();
    btButtonCash.SetFontSizeAll(11);
    btButtonCash.Caption = strButtnCash;
    btButtonCash.OnClickSound = 0;
    btButtonCash.InitComponent(MyController, self);
    AppendComponent(btButtonCash);
    UpdateDefaultWindow();
    TopLine.CaptionDrawType = 4;
    //return;    
}

function cbRenewTermList_OnChange(GUIComponent Sender)
{
    local string strAfterMoney, strCashType;

    strCashType = GetCoinString();
    OptionDay = byte(cbRenewTermList.ComboBox.GetIndex());
    // End:0x66
    if(cii != none)
    {
        strAfterMoney = GetFormatMoney(iMoney, cii.WZCashPrice[int(OptionDay)], strCashType);        
    }
    else
    {
        strAfterMoney = GetFormatMoney(iMoney, ItemInfo.PointPrice[int(OptionDay)], strPoint);
    }
    lbMyMoney[3].Caption = strAfterMoney;
    UpdateAfterMoney();
    OptionDay += byte(1);
    //return;    
}

function SetRenderObject(BTROItemBoxHK Ro, wItemBoxHK itemInfoBase, wItemBoxInstanceHK itemInst, wItemBoxCashHK Cash)
{
    local int i;
    local wGameManager GameMgr;
    local string strCashType;

    self.Ro = Ro;
    strCashType = GetCoinString();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemBoxView.SetData(Ro.ItemInfo, Ro.instanceInfo);
    ItemInfo = itemInfoBase;
    // End:0xDB
    if((UseGP20()) && Cash != none)
    {
        Controller.ViewportOwner.Actor.Level.GameMgr.SetGP20CashItemInfo(ItemInfo, int(cashType), Cash);
    }
    instanceInfo = itemInst;
    cii = Cash;
    ItemID = ItemInfo.ItemID;
    // End:0x13F
    if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
    {
        UniqueID = __NFUN_921__(instanceInfo.UniqueSkillID);        
    }
    else
    {
        UniqueID = instanceInfo.UniqueID;
    }
    cbRenewTermList.ComboBox.Clear();
    // End:0x2F5
    if(cii == none)
    {
        lbItemName.Caption = ItemInfo.ItemName;
        i = 0;
        J0x19A:

        // End:0x2F2 [Loop If]
        if(i < 5)
        {
            // End:0x1C3
            if(ItemInfo.PointPrice[i] == 0)
            {
                // [Explicit Break]
                goto J0x2F2;
            }
            // End:0x226
            if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
            {
                cbRenewTermList.ComboBox.AddItem(string(ItemInfo.PointPrice[i]) @ strPoint);
                // [Explicit Break]
                goto J0x2F2;
            }
            // End:0x291
            if(ItemInfo.CostType == 3)
            {
                cbRenewTermList.ComboBox.AddItem(string(ItemInfo.PointPrice[i]) @ strPoint, none, string(ItemInfo.Period[i]) @ strCount);
                // [Explicit Continue]
                goto J0x2E8;
            }
            cbRenewTermList.ComboBox.AddItem(string(ItemInfo.PointPrice[i]) @ strPoint, none, string(ItemInfo.Period[i] / 24) @ strDay);
            J0x2E8:

            i++;
            // [Loop Continue]
            goto J0x19A;
        }
        J0x2F2:
        
    }
    else
    {
        lbItemName.Caption = cii.WZItemName;
        i = 0;
        J0x319:

        // End:0x484 [Loop If]
        if(i < cii.8)
        {
            // End:0x34B
            if(cii.WZCashPrice[i] == 0)
            {
                // [Explicit Break]
                goto J0x484;
            }
            // End:0x3B1
            if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
            {
                cbRenewTermList.ComboBox.AddItem(string(cii.WZCashPrice[i]) @ strCashType);
                // [Explicit Break]
                goto J0x484;
                // [Explicit Continue]
                goto J0x47A;
            }
            // End:0x41C
            if(ItemInfo.CostType == 3)
            {
                cbRenewTermList.ComboBox.AddItem(string(cii.WZCashPrice[i]) @ strCashType, none, string(cii.WZPeriod[i]) @ strCount);
                // [Explicit Continue]
                goto J0x47A;
            }
            cbRenewTermList.ComboBox.AddItem(string(cii.WZCashPrice[i]) @ strCashType, none, string(cii.WZPeriod[i] / (24 * 3600)) @ strDay);
            J0x47A:

            i++;
            // [Loop Continue]
            goto J0x319;
        }
    }
    J0x484:

    //return;    
}

function SetMoney(int iPoint, int iCash, int iCCoin)
{
    local string strMoney, strAfterMoney, strCashType;

    // End:0x57
    if(cii != none)
    {
        iMoney = iCash;
        strMoney = (string(iMoney) $ "") $ strCashType;
        strAfterMoney = GetFormatMoney(iMoney, cii.WZCashPrice[0], strCashType);        
    }
    else
    {
        iMoney = iPoint;
        strMoney = (string(iMoney) $ "") $ strPoint;
        strAfterMoney = GetFormatMoney(iMoney, ItemInfo.PointPrice[0], strPoint);
    }
    lbMyMoney[1].Caption = strMoney;
    lbMyMoney[3].Caption = strAfterMoney;
    UpdateAfterMoney();
    //return;    
}

function string GetFormatMoney(int iCurMoney, int iPayMoney, string strMoney)
{
    local string strResult;

    iAfterMoney = iCurMoney - iPayMoney;
    strResult = (string(iAfterMoney) $ "") $ strMoney;
    return strResult;
    //return;    
}

function UpdateAfterMoney()
{
    // End:0x37
    if(iAfterMoney < 0)
    {
        lbMyMoney[3].SetFontColorAll(Class'Engine.BTCustomDrawHK'.static.MakeColorRGB(byte(255), 0, 0));        
    }
    else
    {
        lbMyMoney[3].SetFontColorAll(Class'Engine.BTCustomDrawHK'.static.MakeColorRGB(byte(255), byte(255), byte(255)));
    }
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    super(PopupPageBase).InternalOnPreDraw(C);
    // End:0x50
    if(Ro != none)
    {
        lbItemRemaingTime.Caption = Ro.strCurrentUntilTime;
        lbItemRemaingTime.SetFontColorAll(Ro.colCurrentUntilTime);
    }
    return true;
    //return;    
}

function string GetCoinString()
{
    local string strCashType;

    strCashType = strCash;
    return strCashType;
    //return;    
}

function SetCashType(byte buyCashType)
{
    cashType = buyCashType;
    //return;    
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    super.Closed(Sender, bCancelled);
    // End:0x8E
    if(UseGP20())
    {
        Controller.ViewportOwner.Actor.Level.GameMgr.SetGP20CashItemInfo(Ro.ItemInfo, Ro.instanceInfo.cashItemInfo.0, Ro.instanceInfo.cashItemInfo);
    }
    //return;    
}

defaultproperties
{
    fbItemName=(X1=403.0000000,Y1=196.0000000,X2=621.0000000,Y2=211.0000000)
    fbItemRemaingTime=(X1=403.0000000,Y1=291.0000000,X2=621.0000000,Y2=304.0000000)
    strItemRemaingTime="%0??. %1???? %2??????"
    fbItemBoxView=(X1=436.0000000,Y1=201.0000000,X2=589.0000000,Y2=265.0000000)
    fbRenewTerm=(X1=304.0000000,Y1=340.0000000,X2=467.0000000,Y2=355.0000000)
    strRenewTerm="?????????????????"
    fbRenewTermList=(X1=474.0000000,Y1=332.0000000,X2=717.0000000,Y2=362.0000000)
    fbButtonCash=(X1=315.0000000,Y1=443.0000000,X2=439.0000000,Y2=480.0000000)
    strButtnCash="????DE"
    fbItemRenewBack=(X1=297.0000000,Y1=159.0000000,X2=727.0000000,Y2=496.0000000)
    fbMyMoney[0]=(X1=304.0000000,Y1=382.0000000,X2=467.0000000,Y2=395.0000000)
    fbMyMoney[1]=(X1=476.0000000,Y1=382.0000000,X2=715.0000000,Y2=395.0000000)
    fbMyMoney[2]=(X1=304.0000000,Y1=408.0000000,X2=467.0000000,Y2=421.0000000)
    fbMyMoney[3]=(X1=476.0000000,Y1=408.0000000,X2=715.0000000,Y2=421.0000000)
    strMyMoney[0]="?????????????"
    strMyMoney[1]="??????????"
    strCount="????"
    strDay="???"
    strCash="DE"
    strPoint="BP"
    fbBackgroundImage=(X1=297.0000000,Y1=159.0000000,X2=727.0000000,Y2=496.0000000)
    fbTopLine=(X1=403.0000000,Y1=165.0000000,X2=621.0000000,Y2=180.0000000)
    fbBottomLine=(X1=317.0000000,Y1=441.0000000,X2=707.0000000,Y2=484.0000000)
    fbButtonOK=(X1=459.0000000,Y1=443.0000000,X2=583.0000000,Y2=480.0000000)
    fbButtonCancel=(X1=585.0000000,Y1=443.0000000,X2=709.0000000,Y2=480.0000000)
    strTitle="?????????????????"
    strOK="????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}