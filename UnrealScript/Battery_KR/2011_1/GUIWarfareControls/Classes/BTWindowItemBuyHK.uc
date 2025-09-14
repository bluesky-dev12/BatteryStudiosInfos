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
var FloatBox fbSeparator[2];
var export editinline BTOwnerDrawImageHK Separator[2];
var FloatBox fbButtonRechargeCash;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRechargeCash;
var FloatBox fbCombo;
var export editinline BTComboBoxHK Combo;
var FloatBox fbLabel[3];
var FloatBox fbLabelPoint[3];
var FloatBox fbLabelCash[3];
var export editinline BTOwnerDrawImageHK Label[3];
var export editinline BTOwnerDrawImageHK LabelPoint[3];
var export editinline BTOwnerDrawImageHK LabelCash[3];
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
var BTROItemBoxHK ro;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local wMatchMaker MM;

    super.InitComponent(MyController, myOwner);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    RedColor = Class'Engine.Canvas'.static.MakeColor(byte(255), 49, 52, byte(255));
    ItemInfoBox = new Class'GUIWarfareControls_Decompressed.BTItemInfoVertBoxHK';
    ItemInfoBox.bUseAWinPos = true;
    ItemInfoBox.AWinPos = fbItemInfoBox;
    ItemInfoBox.InitComponent(MyController, self);
    AppendComponent(ItemInfoBox);
    i = 0;
    J0xBC:

    // End:0x16D [Loop If]
    if(i < 2)
    {
        Separator[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        Separator[i].bUseAWinPos = true;
        Separator[i].AWinPos = fbSeparator[i];
        Separator[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
        Separator[i].InitComponent(MyController, self);
        AppendComponent(Separator[i]);
        i++;
        // [Loop Continue]
        goto J0xBC;
    }
    i = 0;
    J0x174:

    // End:0x547 [Loop If]
    if(i < 3)
    {
        Label[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        Label[i].bUseAWinPos = true;
        Label[i].AWinPos = fbLabel[i];
        Label[i].Caption = strLabel[i];
        Label[i].CaptionDrawType = 0;
        Label[i].InitComponent(MyController, self);
        AppendComponent(Label[i]);
        LabelPoint[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        LabelPoint[i].bUseAWinPos = true;
        LabelPoint[i].AWinPos = fbLabelPoint[i];
        LabelPoint[i].CaptionDrawType = 5;
        LabelPoint[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
        LabelPoint[i].InitComponent(MyController, self);
        AppendComponent(LabelPoint[i]);
        LabelCash[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        LabelCash[i].bUseAWinPos = true;
        LabelCash[i].AWinPos = fbLabelCash[i];
        LabelCash[i].CaptionDrawType = 5;
        LabelCash[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
        LabelCash[i].InitComponent(MyController, self);
        AppendComponent(LabelCash[i]);
        NEditPoint[i] = new Class'GUIWarfareControls_Decompressed.BTNumericEditBoxHK';
        NEditPoint[i].bUseAWinPos = true;
        NEditPoint[i].AWinPos = fbNEditPoint[i];
        NEditPoint[i].bReadOnly = true;
        NEditPoint[i].SetFontDrawType(5);
        NEditPoint[i].CaptionPadding[2] = 5;
        NEditPoint[i].SetDefaultNonSelectFontColor();
        NEditPoint[i].InitComponent(MyController, self);
        AppendComponent(NEditPoint[i]);
        NEditCash[i] = new Class'GUIWarfareControls_Decompressed.BTNumericEditBoxHK';
        NEditCash[i].bUseAWinPos = true;
        NEditCash[i].AWinPos = fbNEditCash[i];
        NEditCash[i].bReadOnly = true;
        NEditCash[i].SetFontDrawType(5);
        NEditCash[i].CaptionPadding[2] = 5;
        NEditCash[i].SetDefaultNonSelectFontColor();
        NEditCash[i].InitComponent(MyController, self);
        AppendComponent(NEditCash[i]);
        i++;
        // [Loop Continue]
        goto J0x174;
    }
    Combo = new Class'GUIWarfareControls_Decompressed.BTComboBoxHK';
    Combo.bUseAWinPos = true;
    Combo.AWinPos = fbCombo;
    Combo.__OnChange__Delegate = Combo_OnChange;
    Combo.InitComponent(MyController, self);
    AppendComponent(Combo);
    Combo.FontDrawType = 5;
    Combo.ExtraDataFontDrawType = 3;
    Combo.bShowExtraData = true;
    OptionDay = 1;
    ButtonRechargeCash = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    ButtonRechargeCash.bUseAWinPos = true;
    ButtonRechargeCash.AWinPos = fbButtonRechargeCash;
    ButtonRechargeCash.SetDefaultButtonImage();
    ButtonRechargeCash.SetDefaultFontColor();
    ButtonRechargeCash.SetFontSizeAll(12);
    ButtonRechargeCash.Caption = strButtonRechargeCash;
    ButtonRechargeCash.InitComponent(MyController, self);
    AppendComponent(ButtonRechargeCash);
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
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
    // End:0x2F2
    if(cii == none)
    {
        i = 0;
        J0x7F:

        // End:0x1D7 [Loop If]
        if(i < 5)
        {
            // End:0xA8
            if(ItemInfo.PointPrice[i] == 0)
            {
                // [Explicit Break]
                goto J0x1D7;
            }
            // End:0x10B
            if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
            {
                Combo.ComboBox.AddItem(string(ItemInfo.PointPrice[i]) @ strPoint);
                // [Explicit Break]
                goto J0x1D7;
            }
            // End:0x176
            if(ItemInfo.CostType == 3)
            {
                Combo.ComboBox.AddItem(string(ItemInfo.PointPrice[i]) @ strPoint, none, string(ItemInfo.Period[i]) @ strCount);
                // [Explicit Continue]
                goto J0x1CD;
            }
            Combo.ComboBox.AddItem(string(ItemInfo.PointPrice[i]) @ strPoint, none, string(ItemInfo.Period[i] / 24) @ strDay);
            J0x1CD:

            i++;
            // [Loop Continue]
            goto J0x7F;
        }
        J0x1D7:

        NEditPoint[0].SetDataExtra(ItemInfo.PointPrice[0], strPoint);
        NEditPoint[1].SetDataExtra(MyPoint, strPoint);
        NEditPoint[2].SetDataExtra(MyPoint - ItemInfo.PointPrice[0], strPoint);
        // End:0x27D
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
        J0x2F9:

        // End:0x45B [Loop If]
        if(i < 5)
        {
            // End:0x322
            if(cii.WZCashPrice[i] == 0)
            {
                // [Explicit Break]
                goto J0x45B;
            }
            // End:0x388
            if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
            {
                Combo.ComboBox.AddItem(string(cii.WZCashPrice[i]) @ strCash);
                // [Explicit Break]
                goto J0x45B;
                // [Explicit Continue]
                goto J0x451;
            }
            // End:0x3F3
            if(ItemInfo.CostType == 3)
            {
                Combo.ComboBox.AddItem(string(cii.WZCashPrice[i]) @ strCash, none, string(cii.WZPeriod[i]) @ strCount);
                // [Explicit Continue]
                goto J0x451;
            }
            Combo.ComboBox.AddItem(string(cii.WZCashPrice[i]) @ strCash, none, string(cii.WZPeriod[i] / (24 * 3600)) @ strDay);
            J0x451:

            i++;
            // [Loop Continue]
            goto J0x2F9;
        }
        J0x45B:

        NEditCash[0].SetDataExtra(cii.WZCashPrice[0], strCash);
        NEditCash[1].SetDataExtra(MyCash, strCash);
        NEditCash[2].SetDataExtra(MyCash - cii.WZCashPrice[0], strCash);
        // End:0x501
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
    fbItemInfoBox=(X1=333.0000000,Y1=141.0000000,X2=690.0000000,Y2=461.0000000)
    fbSeparator[0]=(X1=341.0000000,Y1=462.0000000,X2=683.0000000,Y2=464.0000000)
    fbSeparator[1]=(X1=341.0000000,Y1=506.0000000,X2=683.0000000,Y2=508.0000000)
    fbButtonRechargeCash=(X1=367.0000000,Y1=624.0000000,X2=461.0000000,Y2=656.0000000)
    fbCombo=(X1=341.0000000,Y1=472.0000000,X2=683.0000000,Y2=499.0000000)
    fbLabel[0]=(X1=344.0000000,Y1=522.0000000,X2=440.0000000,Y2=556.0000000)
    fbLabel[1]=(X1=344.0000000,Y1=556.0000000,X2=440.0000000,Y2=590.0000000)
    fbLabel[2]=(X1=344.0000000,Y1=590.0000000,X2=440.0000000,Y2=610.0000000)
    fbLabelPoint[0]=(X1=419.0000000,Y1=516.0000000,X2=547.0000000,Y2=542.0000000)
    fbLabelPoint[1]=(X1=419.0000000,Y1=550.0000000,X2=547.0000000,Y2=576.0000000)
    fbLabelPoint[2]=(X1=419.0000000,Y1=584.0000000,X2=547.0000000,Y2=610.0000000)
    fbLabelCash[0]=(X1=555.0000000,Y1=516.0000000,X2=683.0000000,Y2=542.0000000)
    fbLabelCash[1]=(X1=555.0000000,Y1=550.0000000,X2=683.0000000,Y2=576.0000000)
    fbLabelCash[2]=(X1=555.0000000,Y1=584.0000000,X2=683.0000000,Y2=610.0000000)
    fbNEditPoint[0]=(X1=419.0000000,Y1=516.0000000,X2=547.0000000,Y2=542.0000000)
    fbNEditPoint[1]=(X1=419.0000000,Y1=550.0000000,X2=547.0000000,Y2=576.0000000)
    fbNEditPoint[2]=(X1=419.0000000,Y1=584.0000000,X2=547.0000000,Y2=610.0000000)
    fbNEditCash[0]=(X1=555.0000000,Y1=516.0000000,X2=683.0000000,Y2=542.0000000)
    fbNEditCash[1]=(X1=555.0000000,Y1=550.0000000,X2=683.0000000,Y2=576.0000000)
    fbNEditCash[2]=(X1=555.0000000,Y1=584.0000000,X2=683.0000000,Y2=610.0000000)
    strLabel[0]="??? ??"
    strLabel[1]="?? ??"
    strLabel[2]="??"
    strPoint="???"
    strCash="??"
    strDay="?"
    strCount="?"
    strButtonRechargeCash="?? ??"
    fbBackgroundImage=(X1=313.0000000,Y1=87.0000000,X2=711.0000000,Y2=681.0000000)
    fbTopLine=(X1=333.0000000,Y1=107.0000000,X2=691.0000000,Y2=133.0000000)
    fbBottomLine=(X1=333.0000000,Y1=618.0000000,X2=691.0000000,Y2=661.0000000)
    fbButtonOK=(X1=465.0000000,Y1=624.0000000,X2=559.0000000,Y2=656.0000000)
    fbButtonCancel=(X1=563.0000000,Y1=624.0000000,X2=657.0000000,Y2=656.0000000)
    strTitle="??"
    strOK="??"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}