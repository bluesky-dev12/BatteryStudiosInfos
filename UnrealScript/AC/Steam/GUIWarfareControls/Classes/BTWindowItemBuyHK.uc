/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowItemBuyHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:35
 *	Functions:7
 *
 *******************************************************************************/
class BTWindowItemBuyHK extends BTWindowHK
    dependson(BTItemInfoVertBoxHK)
    editinlinenew
    instanced;

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
var localized string strLabel[3];
var localized string strPoint;
var localized string strCash;
var localized string strDay;
var localized string strCount;
var localized string strCCoinCash;
var localized string strButtonRechargeCash;
var localized string strTerm;
var BTROItemBoxHK ro;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local wMatchMaker MM;

    super.InitComponent(MyController, myOwner);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.ItemPopup_Bgdeco;
    RedColor = class'Canvas'.static.MakeColor(byte(255), 49, 52, byte(255));
    ItemInfoBox = new class'BTItemInfoVertBoxHK';
    ItemInfoBox.bUseAWinPos = true;
    ItemInfoBox.AWinPos = fbItemInfoBox;
    ItemInfoBox.InitComponent(MyController, self);
    AppendComponent(ItemInfoBox);
    TermLabel = new class'BTOwnerDrawImageHK';
    TermLabel.bUseAWinPos = true;
    TermLabel.AWinPos = fbTermLabel;
    TermLabel.Caption = strTerm;
    TermLabel.CaptionDrawType = 4;
    TermLabel.SetFontSizeAll(11);
    TermLabel.InitComponent(MyController, self);
    AppendComponent(TermLabel);
    i = 0;
    J0x163:
    // End:0x413 [While If]
    if(i < 3)
    {
        Label[i] = new class'BTOwnerDrawImageHK';
        Label[i].bUseAWinPos = true;
        Label[i].AWinPos = fbLabel[i];
        Label[i].Caption = strLabel[i];
        Label[i].CaptionDrawType = 4;
        Label[i].SetFontColorAll(class'Canvas'.static.MakeColor(byte(255), 192, 0, byte(255)));
        Label[i].SetFontSizeAll(9);
        Label[i].InitComponent(MyController, self);
        AppendComponent(Label[i]);
        NEditPoint[i] = new class'BTNumericEditBoxHK';
        NEditPoint[i].bUseAWinPos = true;
        NEditPoint[i].AWinPos = fbNEditPoint[i];
        NEditPoint[i].bReadOnly = true;
        NEditPoint[i].SetFontDrawType(4);
        NEditPoint[i].SetDefaultNonSelectFontColor();
        NEditPoint[i].SetFontSizeAll(9);
        NEditPoint[i].InitComponent(MyController, self);
        AppendComponent(NEditPoint[i]);
        NEditCash[i] = new class'BTNumericEditBoxHK';
        NEditCash[i].bUseAWinPos = true;
        NEditCash[i].AWinPos = fbNEditCash[i];
        NEditCash[i].bReadOnly = true;
        NEditCash[i].SetFontDrawType(4);
        NEditCash[i].SetFontSizeAll(9);
        NEditCash[i].SetDefaultNonSelectFontColor();
        NEditCash[i].InitComponent(MyController, self);
        AppendComponent(NEditCash[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x163;
    }
    Combo = new class'BTComboBoxHK';
    Combo.bUseAWinPos = true;
    Combo.AWinPos = fbCombo;
    Combo.__OnChange__Delegate = Combo_OnChange;
    Combo.InitComponent(MyController, self);
    AppendComponent(Combo);
    Combo.bShowExtraData = true;
    OptionDay = 1;
    ButtonRechargeCash = new class'BTOwnerDrawCaptionButtonHK';
    ButtonRechargeCash.bUseAWinPos = true;
    ButtonRechargeCash.AWinPos = fbButtonRechargeCash;
    ButtonRechargeCash.SetDefaultButtonImage();
    ButtonRechargeCash.SetDefaultFontColor();
    ButtonRechargeCash.SetFontSizeAll(9);
    ButtonRechargeCash.Caption = strButtonRechargeCash;
    ButtonRechargeCash.buttonImage[0] = class'BTUIResourcePoolHK'.default.Cash_Btn_mid_n;
    ButtonRechargeCash.InitComponent(MyController, self);
    AppendComponent(ButtonRechargeCash);
    TopLine.CaptionDrawType = 4;
    TopLine.SetFontSizeAll(11);
    TopLine.BackgroundImage = class'BTUIResourcePoolHK'.default.empty;
    UpdateDefaultWindow();
}

function Combo_OnChange(GUIComponent Sender)
{
    local string strCashType;
    local int calcCash;

    strCashType = GetCoinString();
    calcCash = GetCalcCash();
    OptionDay = Combo.ComboBox.GetIndex();
    // End:0x171
    if(instanceInfo.CashItemInfo == none)
    {
        NEditPoint[0].SetDataExtra(ItemInfo.PointPrice[OptionDay], strPoint);
        NEditPoint[1].SetDataExtra(MyPoint, strPoint);
        NEditPoint[2].SetDataExtra(MyPoint - ItemInfo.PointPrice[OptionDay], strPoint);
        // End:0xfc
        if(MyPoint - ItemInfo.PointPrice[OptionDay] < 0)
        {
            NEditPoint[2].SetFontColorAll(RedColor);
        }
        // End:0x10e
        else
        {
            NEditPoint[2].SetDefaultNonSelectFontColor();
        }
        NEditCash[0].SetDataExtra(0, strCashType);
        NEditCash[1].SetDataExtra(calcCash, strCashType);
        NEditCash[2].SetDataExtra(calcCash, strCashType);
        NEditCash[2].SetDefaultNonSelectFontColor();
    }
    // End:0x295
    else
    {
        NEditCash[0].SetDataExtra(cii.WZCashPrice[OptionDay], strCashType);
        NEditCash[1].SetDataExtra(calcCash, strCashType);
        NEditCash[2].SetDataExtra(calcCash - cii.WZCashPrice[OptionDay], strCashType);
        // End:0x223
        if(calcCash - cii.WZCashPrice[OptionDay] < 0)
        {
            NEditCash[2].SetFontColorAll(RedColor);
        }
        // End:0x235
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
}

function SetRenderObject(BTROItemBoxHK ro)
{
    local int i, calcCash;
    local string strCashType;

    self.ro = ro;
    cii = ro.instanceInfo.CashItemInfo;
    ItemInfo = ro.ItemInfo;
    instanceInfo = ro.instanceInfo;
    strCashType = GetCoinString();
    calcCash = GetCalcCash();
    Combo.ComboBox.Clear();
    // End:0x372
    if(cii == none)
    {
        i = 0;
        J0x97:
        // End:0x257 [While If]
        if(i < 5)
        {
            // End:0xc0
            if(ItemInfo.PointPrice[i] == 0)
            {
            }
            // End:0x257
            else
            {
                // End:0x123
                if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2)
                {
                    Combo.ComboBox.AddItem(string(ItemInfo.PointPrice[i]) @ strPoint);
                }
                // End:0x257
                else
                {
                    // End:0x1eb
                    if(ItemInfo.CostType == 3)
                    {
                        // End:0x18a
                        if(ItemInfo.Period[i] == 0)
                        {
                            Combo.ComboBox.AddItem(string(ItemInfo.PointPrice[i]) @ strPoint);
                        }
                        // End:0x1e8
                        else
                        {
                            Combo.ComboBox.AddItem(string(ItemInfo.Period[i]) @ strCount @ "(" @ string(ItemInfo.PointPrice[i]) @ strPoint @ ")");
                        }
                    }
                    // End:0x24d
                    else
                    {
                        Combo.ComboBox.AddItem(string(ItemInfo.Period[i] / 24) @ strDay @ "(" @ string(ItemInfo.PointPrice[i]) @ strPoint @ ")");
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x97;
                }
            }
        }
        NEditPoint[0].SetDataExtra(ItemInfo.PointPrice[0], strPoint);
        NEditPoint[1].SetDataExtra(MyPoint, strPoint);
        NEditPoint[2].SetDataExtra(MyPoint - ItemInfo.PointPrice[0], strPoint);
        // End:0x2fd
        if(MyPoint - ItemInfo.PointPrice[0] < 0)
        {
            NEditPoint[2].SetFontColorAll(RedColor);
        }
        // End:0x30f
        else
        {
            NEditPoint[2].SetDefaultNonSelectFontColor();
        }
        NEditCash[0].SetDataExtra(0, strCashType);
        NEditCash[1].SetDataExtra(calcCash, strCashType);
        NEditCash[2].SetDataExtra(calcCash, strCashType);
        NEditCash[2].SetDefaultNonSelectFontColor();
    }
    // End:0x672
    else
    {
        i = 0;
        J0x379:
        // End:0x55a [While If]
        if(i < 5)
        {
            // End:0x3a2
            if(cii.WZCashPrice[i] == 0)
            {
            }
            // End:0x55a
            else
            {
                // End:0x41f
                if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2 || cii.bWZPackage == true)
                {
                    Combo.ComboBox.AddItem(string(cii.WZCashPrice[i]) @ strCashType);
                    // This is an implied JumpToken;
                    goto J0x55a;
                }
                // End:0x550
                else
                {
                    // End:0x4e7
                    if(ItemInfo.CostType == 3)
                    {
                        // End:0x486
                        if(cii.WZPeriod[i] == 0)
                        {
                            Combo.ComboBox.AddItem(string(cii.WZCashPrice[i]) @ strCashType);
                        }
                        // End:0x4e4
                        else
                        {
                            Combo.ComboBox.AddItem(string(cii.WZPeriod[i]) @ strCount @ "(" @ string(cii.WZCashPrice[i]) @ strCashType @ ")");
                        }
                    }
                    // End:0x550
                    else
                    {
                        Combo.ComboBox.AddItem(string(cii.WZPeriod[i] / 24 * 3600) @ strDay @ "(" @ string(cii.WZCashPrice[i]) @ strCashType @ ")");
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x379;
            }
        }
        NEditCash[0].SetDataExtra(cii.WZCashPrice[0], strCashType);
        NEditCash[1].SetDataExtra(calcCash, strCashType);
        NEditCash[2].SetDataExtra(calcCash - cii.WZCashPrice[0], strCashType);
        // End:0x600
        if(calcCash - cii.WZCashPrice[0] < 0)
        {
            NEditCash[2].SetFontColorAll(RedColor);
        }
        // End:0x612
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
}

function SetMoneyInfo(int myp, int MyC, int myCC)
{
    MyPoint = myp;
    MyCash = MyC;
    MyCCoin = myCC;
    SetRenderObject(self.ro);
}

function SetData(int iItemID, int myp, int MyC, int myCC, wItemBoxHK itemInfoBase, byte useCashType)
{
    ItemID = iItemID;
    MyPoint = myp;
    MyCash = MyC;
    ItemInfo = itemInfoBase;
    MyCCoin = myCC;
    cashType = useCashType;
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

function int GetCalcCash()
{
    // End:0x23
    if(cashType == class'wItemBoxCashHK'.static.CCoinType())
    {
        return MyCCoin;
    }
    return MyCash;
}

defaultproperties
{
    fbItemInfoBox=(X1=323.0,Y1=130.0,X2=716.0,Y2=428.0)
    fbButtonRechargeCash=(X1=315.0,Y1=580.0,X2=439.0,Y2=617.0)
    fbCombo=(X1=474.0,Y1=443.0,X2=717.0,Y2=473.0)
    fbTermLabel=(X1=304.0,Y1=451.0,X2=467.0,Y2=466.0)
    fbLabel[0]=(X1=304.0,Y1=492.0,X2=467.0,Y2=505.0)
    fbLabel[1]=(X1=304.0,Y1=518.0,X2=467.0,Y2=531.0)
    fbLabel[2]=(X1=304.0,Y1=544.0,X2=467.0,Y2=557.0)
    fbNEditPoint[0]=(X1=476.0,Y1=492.0,X2=594.0,Y2=505.0)
    fbNEditPoint[1]=(X1=476.0,Y1=518.0,X2=594.0,Y2=531.0)
    fbNEditPoint[2]=(X1=476.0,Y1=544.0,X2=594.0,Y2=557.0)
    fbNEditCash[0]=(X1=597.0,Y1=492.0,X2=715.0,Y2=505.0)
    fbNEditCash[1]=(X1=597.0,Y1=518.0,X2=715.0,Y2=531.0)
    fbNEditCash[2]=(X1=597.0,Y1=544.0,X2=715.0,Y2=557.0)
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
    fbBackgroundImage=(X1=297.0,Y1=93.0,X2=727.0,Y2=633.0)
    fbTopLine=(X1=403.0,Y1=99.0,X2=621.0,Y2=114.0)
    fbButtonOK=(X1=459.0,Y1=580.0,X2=583.0,Y2=617.0)
    fbButtonCancel=(X1=585.0,Y1=580.0,X2=709.0,Y2=617.0)
    strTitle="Buy"
    strOK="Buy"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}