/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowItemRenew.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:35
 *	Functions:9
 *
 *******************************************************************************/
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
var BTROItemBoxHK ro;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    imgItemRenewBack = new class'BTOwnerDrawImageHK';
    imgItemRenewBack.bUseAWinPos = true;
    imgItemRenewBack.AWinPos = fbItemRenewBack;
    imgItemRenewBack.BackgroundImage = class'BTUIResourcePoolHK'.default.img_timeitempopup_renew;
    imgItemRenewBack.InitComponent(MyController, self);
    AppendComponent(imgItemRenewBack);
    super.InitComponent(MyController, myOwner);
    ItemBoxView = new class'BTItemBoxButtonHK';
    ItemBoxView.bUseAWinPos = true;
    ItemBoxView.AWinPos = fbItemBoxView;
    AppendComponent(ItemBoxView);
    ItemBoxView.itemBox.ChangeState(18);
    lbItemName = new class'BTOwnerDrawImageHK';
    lbItemName.bUseAWinPos = true;
    lbItemName.AWinPos = fbItemName;
    lbItemName.BackgroundImage = class'BTUIResourcePoolHK'.default.empty;
    lbItemName.SetFontSizeAll(11);
    lbItemName.SetFontColorAll(class'BTCustomDrawHK'.static.MakeColorRGB(byte(255), 192, 0));
    lbItemName.InitComponent(MyController, self);
    AppendComponent(lbItemName);
    lbItemRemaingTime = new class'BTOwnerDrawImageHK';
    lbItemRemaingTime.bUseAWinPos = true;
    lbItemRemaingTime.AWinPos = fbItemRemaingTime;
    lbItemRemaingTime.BackgroundImage = class'BTUIResourcePoolHK'.default.empty;
    lbItemRemaingTime.SetFontSizeAll(9);
    lbItemRemaingTime.SetFontColorAll(class'BTCustomDrawHK'.static.MakeColorRGB(byte(255), byte(255), byte(255)));
    lbItemRemaingTime.InitComponent(MyController, self);
    AppendComponent(lbItemRemaingTime);
    lbRenewTerm = new class'BTOwnerDrawImageHK';
    lbRenewTerm.bUseAWinPos = true;
    lbRenewTerm.AWinPos = fbRenewTerm;
    lbRenewTerm.BackgroundImage = class'BTUIResourcePoolHK'.default.empty;
    lbRenewTerm.SetFontSizeAll(11);
    lbRenewTerm.SetFontColorAll(class'BTCustomDrawHK'.static.MakeColorRGB(204, 204, 204));
    lbRenewTerm.Caption = strRenewTerm;
    lbRenewTerm.InitComponent(MyController, self);
    AppendComponent(lbRenewTerm);
    cbRenewTermList = new class'BTComboBoxHK';
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
    J0x38c:
    // End:0x46b [While If]
    if(i < 4)
    {
        lbMyMoney[i] = new class'BTOwnerDrawImageHK';
        lbMyMoney[i].bUseAWinPos = true;
        lbMyMoney[i].AWinPos = fbMyMoney[i];
        lbMyMoney[i].BackgroundImage = class'BTUIResourcePoolHK'.default.empty;
        lbMyMoney[i].SetFontSizeAll(9);
        lbMyMoney[i].SetFontDrawType(4);
        lbMyMoney[i].InitComponent(MyController, self);
        AppendComponent(lbMyMoney[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x38c;
    }
    lbMyMoney[0].SetFontColorAll(class'BTCustomDrawHK'.static.MakeColorRGB(byte(255), 192, 0));
    lbMyMoney[0].Caption = strMyMoney[0];
    lbMyMoney[2].SetFontColorAll(class'BTCustomDrawHK'.static.MakeColorRGB(byte(255), 192, 0));
    lbMyMoney[2].Caption = strMyMoney[1];
    btButtonCash = new class'BTOwnerDrawCaptionButtonHK';
    btButtonCash.SetDefaultButtonImage();
    btButtonCash.buttonImage[0] = class'BTUIResourcePoolHK'.default.Cash_Btn_mid_n;
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
}

function cbRenewTermList_OnChange(GUIComponent Sender)
{
    local string strAfterMoney, strCashType;

    strCashType = GetCoinString();
    OptionDay = byte(cbRenewTermList.ComboBox.GetIndex());
    // End:0x66
    if(cii != none)
    {
        strAfterMoney = GetFormatMoney(iMoney, cii.WZCashPrice[OptionDay], strCashType);
    }
    // End:0x92
    else
    {
        strAfterMoney = GetFormatMoney(iMoney, ItemInfo.PointPrice[OptionDay], strPoint);
    }
    lbMyMoney[3].Caption = strAfterMoney;
    UpdateAfterMoney();
    OptionDay += byte(1);
}

function SetRenderObject(BTROItemBoxHK ro, wItemBoxHK itemInfoBase, wItemBoxInstanceHK itemInst, wItemBoxCashHK Cash)
{
    local int i;
    local wGameManager GameMgr;
    local string strCashType;

    self.ro = ro;
    strCashType = GetCoinString();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemBoxView.SetData(ro.ItemInfo, ro.instanceInfo);
    ItemInfo = itemInfoBase;
    instanceInfo = itemInst;
    cii = Cash;
    ItemID = ItemInfo.ItemID;
    // End:0xe5
    if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
    {
        UniqueID = UnresolvedNativeFunction_99(instanceInfo.UniqueSkillID);
    }
    // End:0xf9
    else
    {
        UniqueID = instanceInfo.UniqueID;
    }
    cbRenewTermList.ComboBox.Clear();
    // End:0x29b
    if(cii == none)
    {
        lbItemName.Caption = ItemInfo.ItemName;
        i = 0;
        J0x140:
        // End:0x298 [While If]
        if(i < 5)
        {
            // End:0x169
            if(ItemInfo.PointPrice[i] == 0)
            {
            }
            // End:0x298
            else
            {
                // End:0x1cc
                if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2)
                {
                    cbRenewTermList.ComboBox.AddItem(string(ItemInfo.PointPrice[i]) @ strPoint);
                }
                // End:0x298
                else
                {
                    // End:0x237
                    if(ItemInfo.CostType == 3)
                    {
                        cbRenewTermList.ComboBox.AddItem(string(ItemInfo.PointPrice[i]) @ strPoint, none, string(ItemInfo.Period[i]) @ strCount);
                    }
                    // End:0x28e
                    else
                    {
                        cbRenewTermList.ComboBox.AddItem(string(ItemInfo.PointPrice[i]) @ strPoint, none, string(ItemInfo.Period[i] / 24) @ strDay);
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x140;
                }
            }
        }
    }
    // End:0x421
    else
    {
        lbItemName.Caption = cii.WZItemName;
        i = 0;
        J0x2bf:
        // End:0x421 [While If]
        if(i < 5)
        {
            // End:0x2e8
            if(cii.WZCashPrice[i] == 0)
            {
            }
            // End:0x421
            else
            {
                // End:0x34e
                if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2)
                {
                    cbRenewTermList.ComboBox.AddItem(string(cii.WZCashPrice[i]) @ strCashType);
                    // This is an implied JumpToken;
                    goto J0x421;
                }
                // End:0x417
                else
                {
                    // End:0x3b9
                    if(ItemInfo.CostType == 3)
                    {
                        cbRenewTermList.ComboBox.AddItem(string(cii.WZCashPrice[i]) @ strCashType, none, string(cii.WZPeriod[i]) @ strCount);
                    }
                    // End:0x417
                    else
                    {
                        cbRenewTermList.ComboBox.AddItem(string(cii.WZCashPrice[i]) @ strCashType, none, string(cii.WZPeriod[i] / 24 * 3600) @ strDay);
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x2bf;
            }
        }
    }
}

function SetMoney(int iPoint, int iCash, int iCCoin)
{
    local string strMoney, strAfterMoney, strCashType;

    // End:0x8e
    if(cii != none)
    {
        strCashType = GetCoinString();
        // End:0x42
        if(cashType == class'wItemBoxCashHK'.static.PCoinType())
        {
            iMoney = iCash;
        }
        // End:0x4d
        else
        {
            iMoney = iCCoin;
        }
        strMoney = string(iMoney) $ "" $ strCashType;
        strAfterMoney = GetFormatMoney(iMoney, cii.WZCashPrice[0], strCashType);
    }
    // End:0xd7
    else
    {
        iMoney = iPoint;
        strMoney = string(iMoney) $ "" $ strPoint;
        strAfterMoney = GetFormatMoney(iMoney, ItemInfo.PointPrice[0], strPoint);
    }
    lbMyMoney[1].Caption = strMoney;
    lbMyMoney[3].Caption = strAfterMoney;
    UpdateAfterMoney();
}

function string GetFormatMoney(int iCurMoney, int iPayMoney, string strMoney)
{
    local string strResult;

    iAfterMoney = iCurMoney - iPayMoney;
    strResult = string(iAfterMoney) $ "" $ strMoney;
    return strResult;
}

function UpdateAfterMoney()
{
    // End:0x37
    if(iAfterMoney < 0)
    {
        lbMyMoney[3].SetFontColorAll(class'BTCustomDrawHK'.static.MakeColorRGB(byte(255), 0, 0));
    }
    // End:0x64
    else
    {
        lbMyMoney[3].SetFontColorAll(class'BTCustomDrawHK'.static.MakeColorRGB(byte(255), byte(255), byte(255)));
    }
}

function bool InternalOnPreDraw(Canvas C)
{
    super(PopupPageBase).InternalOnPreDraw(C);
    // End:0x50
    if(ro != none)
    {
        lbItemRemaingTime.Caption = ro.strCurrentUntilTime;
        lbItemRemaingTime.SetFontColorAll(ro.colCurrentUntilTime);
    }
    return true;
}

function string GetCoinString()
{
    local string strCashType;

    // End:0x2b
    if(cashType == class'wItemBoxCashHK'.static.PCoinType())
    {
        strCashType = strCash;
    }
    // End:0x36
    else
    {
        strCashType = strCCoinCash;
    }
    return strCashType;
}

function SetCashType(byte buyCashType)
{
    cashType = buyCashType;
}

defaultproperties
{
    fbItemName=(X1=403.0,Y1=196.0,X2=621.0,Y2=211.0)
    fbItemRemaingTime=(X1=403.0,Y1=291.0,X2=621.0,Y2=304.0)
    strItemRemaingTime="%0h %1m %2s"
    fbItemBoxView=(X1=436.0,Y1=201.0,X2=589.0,Y2=265.0)
    fbRenewTerm=(X1=304.0,Y1=340.0,X2=467.0,Y2=355.0)
    strRenewTerm="Select Duration"
    fbRenewTermList=(X1=474.0,Y1=332.0,X2=717.0,Y2=362.0)
    fbButtonCash=(X1=315.0,Y1=443.0,X2=439.0,Y2=480.0)
    strButtnCash="Buy Cash"
    fbItemRenewBack=(X1=297.0,Y1=159.0,X2=727.0,Y2=496.0)
    fbMyMoney[0]=(X1=304.0,Y1=382.0,X2=467.0,Y2=395.0)
    fbMyMoney[1]=(X1=476.0,Y1=382.0,X2=715.0,Y2=395.0)
    fbMyMoney[2]=(X1=304.0,Y1=408.0,X2=467.0,Y2=421.0)
    fbMyMoney[3]=(X1=476.0,Y1=408.0,X2=715.0,Y2=421.0)
    strMyMoney[0]="Amount Owned"
    strMyMoney[1]="Balance"
    strCount="Count"
    strDay="Day"
    strCash="W Coin(P)"
    strPoint="Points"
    strCCoinCash="W Coin(C)"
    fbBackgroundImage=(X1=297.0,Y1=159.0,X2=727.0,Y2=496.0)
    fbTopLine=(X1=403.0,Y1=165.0,X2=621.0,Y2=180.0)
    fbBottomLine=(X1=317.0,Y1=441.0,X2=707.0,Y2=484.0)
    fbButtonOK=(X1=459.0,Y1=443.0,X2=583.0,Y2=480.0)
    fbButtonCancel=(X1=585.0,Y1=443.0,X2=709.0,Y2=480.0)
    strTitle="Extend Item"
    strOK="Purchase"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}