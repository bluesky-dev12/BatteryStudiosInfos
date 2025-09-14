class BTWindowItemBuyHK extends BTWindowHK
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
var localized string strLabel[3];
var localized string strPoint;
var localized string strCash;
var localized string strDay;
var localized string strCount;
var localized string strButtonRechargeCash;
var localized string strTerm;
var BTROItemBoxHK ro;

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
    AppendComponent(ButtonRechargeCash);
    TopLine.CaptionDrawType = 4;
    TopLine.SetFontSizeAll(11);
    TopLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    UpdateDefaultWindow();
    //return;    
}

function Combo_OnChange(GUIComponent Sender)
{
    OptionDay = Combo.ComboBox.GetIndex();
    // End:0x159
    if(instanceInfo.CashItemInfo == none)
    {
        NEditPoint[0].SetDataExtra(ItemInfo.PointPrice[OptionDay], strPoint);
        NEditPoint[1].SetDataExtra(MyPoint, strPoint);
        NEditPoint[2].SetDataExtra(MyPoint - ItemInfo.PointPrice[OptionDay], strPoint);
        // End:0xE4
        if((MyPoint - ItemInfo.PointPrice[OptionDay]) < 0)
        {
            NEditPoint[2].SetFontColorAll(RedColor);            
        }
        else
        {
            NEditPoint[2].SetDefaultNonSelectFontColor();
        }
        NEditCash[0].SetDataExtra(0, strCash);
        NEditCash[1].SetDataExtra(MyCash, strCash);
        NEditCash[2].SetDataExtra(MyCash, strCash);
        NEditCash[2].SetDefaultNonSelectFontColor();        
    }
    else
    {
        NEditCash[0].SetDataExtra(cii.WZCashPrice[OptionDay], strCash);
        NEditCash[1].SetDataExtra(MyCash, strCash);
        NEditCash[2].SetDataExtra(MyCash - cii.WZCashPrice[OptionDay], strCash);
        // End:0x20B
        if((MyCash - cii.WZCashPrice[OptionDay]) < 0)
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

function SetRenderObject(BTROItemBoxHK ro)
{
    local int i;

    self.ro = ro;
    cii = ro.instanceInfo.CashItemInfo;
    ItemInfo = ro.ItemInfo;
    instanceInfo = ro.instanceInfo;
    Combo.ComboBox.Clear();
    // End:0x35A
    if(cii == none)
    {
        i = 0;
        J0x7F:

        // End:0x23F [Loop If]
        if(i < 5)
        {
            // End:0xA8
            if(ItemInfo.PointPrice[i] == 0)
            {
                // [Explicit Break]
                goto J0x23F;
            }
            // End:0x10B
            if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
            {
                Combo.ComboBox.AddItem(string(ItemInfo.PointPrice[i]) @ strPoint);
                // [Explicit Break]
                goto J0x23F;
            }
            // End:0x1D3
            if(ItemInfo.CostType == 3)
            {
                // End:0x172
                if(ItemInfo.Period[i] == 0)
                {
                    Combo.ComboBox.AddItem(string(ItemInfo.PointPrice[i]) @ strPoint);                    
                }
                else
                {
                    Combo.ComboBox.AddItem(((((string(ItemInfo.Period[i]) @ strCount) @ "(") @ string(ItemInfo.PointPrice[i])) @ strPoint) @ ")");
                }
                // [Explicit Continue]
                goto J0x235;
            }
            Combo.ComboBox.AddItem(((((string(ItemInfo.Period[i] / 24) @ strDay) @ "(") @ string(ItemInfo.PointPrice[i])) @ strPoint) @ ")");
            J0x235:

            i++;
            // [Loop Continue]
            goto J0x7F;
        }
        J0x23F:

        NEditPoint[0].SetDataExtra(ItemInfo.PointPrice[0], strPoint);
        NEditPoint[1].SetDataExtra(MyPoint, strPoint);
        NEditPoint[2].SetDataExtra(MyPoint - ItemInfo.PointPrice[0], strPoint);
        // End:0x2E5
        if((MyPoint - ItemInfo.PointPrice[0]) < 0)
        {
            NEditPoint[2].SetFontColorAll(RedColor);            
        }
        else
        {
            NEditPoint[2].SetDefaultNonSelectFontColor();
        }
        NEditCash[0].SetDataExtra(0, strCash);
        NEditCash[1].SetDataExtra(MyCash, strCash);
        NEditCash[2].SetDataExtra(MyCash, strCash);
        NEditCash[2].SetDefaultNonSelectFontColor();        
    }
    else
    {
        i = 0;
        J0x361:

        // End:0x542 [Loop If]
        if(i < 5)
        {
            // End:0x38A
            if(cii.WZCashPrice[i] == 0)
            {
                // [Explicit Break]
                goto J0x542;
            }
            // End:0x407
            if(((ItemInfo.CostType == 0) || ItemInfo.CostType == 2) || cii.bWZPackage == true)
            {
                Combo.ComboBox.AddItem(string(cii.WZCashPrice[i]) @ strCash);
                // [Explicit Break]
                goto J0x542;
                // [Explicit Continue]
                goto J0x538;
            }
            // End:0x4CF
            if(ItemInfo.CostType == 3)
            {
                // End:0x46E
                if(cii.WZPeriod[i] == 0)
                {
                    Combo.ComboBox.AddItem(string(cii.WZCashPrice[i]) @ strCash);                    
                }
                else
                {
                    Combo.ComboBox.AddItem(((((string(cii.WZPeriod[i]) @ strCount) @ "(") @ string(cii.WZCashPrice[i])) @ strCash) @ ")");
                }
                // [Explicit Continue]
                goto J0x538;
            }
            Combo.ComboBox.AddItem(((((string(cii.WZPeriod[i] / (24 * 3600)) @ strDay) @ "(") @ string(cii.WZCashPrice[i])) @ strCash) @ ")");
            J0x538:

            i++;
            // [Loop Continue]
            goto J0x361;
        }
        J0x542:

        NEditCash[0].SetDataExtra(cii.WZCashPrice[0], strCash);
        NEditCash[1].SetDataExtra(MyCash, strCash);
        NEditCash[2].SetDataExtra(MyCash - cii.WZCashPrice[0], strCash);
        // End:0x5E8
        if((MyCash - cii.WZCashPrice[0]) < 0)
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

function SetMoneyInfo(int myp, int MyC)
{
    MyPoint = myp;
    MyCash = MyC;
    SetRenderObject(self.ro);
    //return;    
}

function SetData(int iItemID, int myp, int MyC, wItemBoxHK itemInfoBase)
{
    ItemID = iItemID;
    MyPoint = myp;
    MyCash = MyC;
    ItemInfo = itemInfoBase;
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
    strCash="Cash"
    strDay="Day"
    strCount="Count"
    strButtonRechargeCash="Buy Cash"
    strTerm="Select Duration"
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