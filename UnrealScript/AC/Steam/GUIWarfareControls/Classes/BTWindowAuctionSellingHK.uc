/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowAuctionSellingHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:25
 *	Functions:5
 *
 *******************************************************************************/
class BTWindowAuctionSellingHK extends BTWindowHK
    editinlinenew
    instanced;

var int SelectItemCount;
var int MaxItemCount;
var localized string strHour;
var float MarginArray[5];
var BtrDouble UniqueID;
var int PeriodHour;
var FloatBox fbItemInfoBox;
var export editinline BTItemInfoVertBoxHK ItemInfoBox;
var FloatBox fbSeparator[2];
var export editinline BTOwnerDrawImageHK Separator[2];
var FloatBox fbLabel[5];
var FloatBox fbEdit[4];
var export editinline BTOwnerDrawImageHK Label[5];
var export editinline BTOwnerDrawImageHK Edit[3];
var FloatBox fbNEditBox[3];
var export editinline BTNumericEditBoxHK NEditBox[3];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbCombo;
var export editinline BTComboBoxHK Combo;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelWarning[2];
var export editinline BTOwnerDrawImageHK LabelWarning[2];
var localized string strLabel[5];
var localized string strLabelWarning[5];
var localized string strLabelWarning0_0;
var localized string strLabelWarning0_1;
var localized string strCount;

function Combo_OnChange(GUIComponent Sender)
{
    switch(Combo.ComboBox.Index)
    {
        // End:0x27
        case 0:
            PeriodHour = 1;
            // End:0x69
            break;
        // End:0x36
        case 1:
            PeriodHour = 2;
            // End:0x69
            break;
        // End:0x46
        case 2:
            PeriodHour = 3;
            // End:0x69
            break;
        // End:0x56
        case 3:
            PeriodHour = 4;
            // End:0x69
            break;
        // End:0x66
        case 4:
            PeriodHour = 5;
            // End:0x69
            break;
        // End:0xffff
        default:
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    ItemInfoBox = new class'BTItemInfoVertBoxHK';
    ItemInfoBox.bUseAWinPos = true;
    ItemInfoBox.AWinPos = fbItemInfoBox;
    ItemInfoBox.InitComponent(MyController, self);
    AppendComponent(ItemInfoBox);
    Combo = new class'BTComboBoxHK';
    Combo.bUseAWinPos = true;
    Combo.AWinPos = fbCombo;
    Combo.RenderWeight = 0.70;
    Combo.FontDrawType = 5;
    Combo.FontPadding[2] = 10;
    Combo.__OnChange__Delegate = Combo_OnChange;
    Combo.InitComponent(MyController, self);
    AppendComponent(Combo);
    Combo.ComboBox.Clear();
    Combo.ComboBox.AddItem("6" $ strHour);
    Combo.ComboBox.AddItem("12" $ strHour);
    Combo.ComboBox.AddItem("24" $ strHour);
    Combo.ComboBox.AddItem("48" $ strHour);
    // End:0x1fa
    if(!Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        Combo.ComboBox.AddItem("5 Minutes");
    }
    i = 0;
    J0x201:
    // End:0x2b2 [While If]
    if(i < 2)
    {
        Separator[i] = new class'BTOwnerDrawImageHK';
        Separator[i].bUseAWinPos = true;
        Separator[i].AWinPos = fbSeparator[i];
        Separator[i].BackgroundImage = class'BTUIResourcePoolHK'.default.img_divid_line;
        Separator[i].InitComponent(MyController, self);
        AppendComponent(Separator[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x201;
    }
    i = 0;
    J0x2b9:
    // End:0x37e [While If]
    if(i < 5)
    {
        Label[i] = new class'BTOwnerDrawImageHK';
        Label[i].bUseAWinPos = true;
        Label[i].AWinPos = fbLabel[i];
        Label[i].Caption = strLabel[i];
        Label[i].CaptionDrawType = 0;
        Label[i].InitComponent(MyController, self);
        AppendComponent(Label[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2b9;
    }
    i = 0;
    J0x385:
    // End:0x4ed [While If]
    if(i < 4)
    {
        Edit[i] = new class'BTOwnerDrawImageHK';
        Edit[i].bUseAWinPos = true;
        Edit[i].AWinPos = fbEdit[i];
        // End:0x405
        if(i == 0)
        {
            Edit[i].Caption = strCount;
        }
        // End:0x41c
        else
        {
            Edit[i].Caption = "";
        }
        Edit[i].CaptionDrawType = 5;
        Edit[i].CaptionPadding[2] = 10;
        // End:0x47f
        if(i == 3)
        {
            Edit[i].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
        }
        // End:0x4a2
        else
        {
            Edit[i].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_4;
        }
        Edit[i].InitComponent(MyController, self);
        AppendComponent(Edit[i]);
        Edit[i].SetDefaultFontColor();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x385;
    }
    i = 0;
    J0x4f4:
    // End:0x5ae [While If]
    if(i < 3)
    {
        NEditBox[i] = new class'BTNumericEditBoxHK';
        NEditBox[i].bUseAWinPos = true;
        NEditBox[i].AWinPos = fbNEditBox[i];
        NEditBox[i].CaptionDrawType = 5;
        NEditBox[i].SetDefaultNonSelectFontColor();
        NEditBox[i].InitComponent(MyController, self);
        AppendComponent(NEditBox[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4f4;
    }
    i = 0;
    J0x5b5:
    // End:0x6c5 [While If]
    if(i < 2)
    {
        LabelWarning[i] = new class'BTOwnerDrawImageHK';
        LabelWarning[i].bUseAWinPos = true;
        LabelWarning[i].AWinPos = fbLabelWarning[i];
        LabelWarning[i].Caption = strLabelWarning[i];
        LabelWarning[i].CaptionDrawType = 0;
        LabelWarning[i].FontSize[0] = 8;
        LabelWarning[i].FontColor[0] = class'Canvas'.static.MakeColor(byte(255), 90, 77, byte(255));
        LabelWarning[i].InitComponent(MyController, self);
        AppendComponent(LabelWarning[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5b5;
    }
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
    NEditBox[1].MaxValue = 99999999;
    NEditBox[2].MaxValue = 99999999;
}

function SetData(int MyPoint, wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo)
{
    UniqueID = instanceInfo.UniqueID;
    MaxItemCount = instanceInfo.OverlapCount;
    ItemInfoBox.SetData(ItemInfo, instanceInfo, none, none);
    NEditBox[1].SetData(ItemInfo.AuctionMinPrice);
    LabelWarning[0].Caption = "-" $ ItemInfo.ItemName $ strLabelWarning0_0 $ class'BTCustomDrawHK'.static.ToWonString(string(ItemInfo.AuctionMinPrice)) $ " ~ " $ class'BTCustomDrawHK'.static.ToWonString(string(ItemInfo.AuctionMaxPrice)) $ strLabelWarning0_1;
    // End:0x114
    if(ItemInfo.bOverlap)
    {
        Edit[0].EnableMe();
        NEditBox[0].EnableMe();
    }
    // End:0x136
    else
    {
        Edit[0].DisableMe();
        NEditBox[0].DisableMe();
    }
}

function Internal_OnRendered(Canvas C)
{
    local int Value;

    Value = int(float(int(NEditBox[1].OriginalStr)) / 20.0 * MarginArray[Combo.ComboBox.Index]);
    Edit[3].Caption = class'BTCustomDrawHK'.static.ToWonString(string(Value));
}

function Internal_OnOpen()
{
    NEditBox[0].SetData(1);
    NEditBox[3].SetData(0);
    Combo.ComboBox.SetIndex(2);
}

defaultproperties
{
    strHour="H"
    MarginArray[0]=1.0
    MarginArray[1]=1.50
    MarginArray[2]=2.0
    MarginArray[3]=2.50
    MarginArray[4]=1.0
    fbItemInfoBox=(X1=333.0,Y1=99.0,X2=690.0,Y2=426.0)
    fbSeparator[0]=(X1=341.0,Y1=428.0,X2=683.0,Y2=430.0)
    fbSeparator[1]=(X1=341.0,Y1=591.0,X2=683.0,Y2=593.0)
    fbLabel[0]=(X1=344.0,Y1=445.0,X2=446.0,Y2=479.0)
    fbLabel[1]=(X1=344.0,Y1=479.0,X2=446.0,Y2=513.0)
    fbLabel[2]=(X1=344.0,Y1=513.0,X2=446.0,Y2=547.0)
    fbLabel[3]=(X1=344.0,Y1=547.0,X2=446.0,Y2=607.0)
    fbLabel[4]=(X1=344.0,Y1=607.0,X2=446.0,Y2=634.0)
    fbEdit[0]=(X1=440.0,Y1=438.0,X2=683.0,Y2=464.0)
    fbEdit[1]=(X1=440.0,Y1=472.0,X2=683.0,Y2=498.0)
    fbEdit[2]=(X1=440.0,Y1=506.0,X2=683.0,Y2=532.0)
    fbEdit[3]=(X1=440.0,Y1=601.0,X2=683.0,Y2=627.0)
    fbNEditBox[0]=(X1=443.0,Y1=438.0,X2=655.0,Y2=464.0)
    fbNEditBox[1]=(X1=443.0,Y1=472.0,X2=675.0,Y2=498.0)
    fbNEditBox[2]=(X1=443.0,Y1=506.0,X2=675.0,Y2=532.0)
    fbCombo=(X1=440.0,Y1=540.0,X2=683.0,Y2=566.0)
    fbLabelWarning[0]=(X1=341.0,Y1=574.0,X2=683.0,Y2=607.0)
    fbLabelWarning[1]=(X1=341.0,Y1=634.0,X2=683.0,Y2=658.0)
    strLabel[0]="Quantity"
    strLabel[1]="Start Price"
    strLabel[2]="Buy-Now Price"
    strLabel[3]="Sale End Time"
    strLabel[4]="Deposit"
    strLabelWarning[1]="Sales with lower start prices and shorter durations require a smaller deposit."
    strLabelWarning0_0=" may be sold for "
    strLabelWarning0_1=" Points."
    strCount="Count"
    fbBackgroundImage=(X1=313.0,Y1=53.0,X2=711.0,Y2=715.0)
    fbTopLine=(X1=333.0,Y1=73.0,X2=691.0,Y2=99.0)
    fbBottomLine=(X1=333.0,Y1=652.0,X2=691.0,Y2=695.0)
    fbButtonOK=(X1=390.0,Y1=658.0,X2=508.0,Y2=690.0)
    fbButtonCancel=(X1=514.0,Y1=658.0,X2=633.0,Y2=690.0)
    strTitle="Sell Item"
    strOK="Start Sale"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    OnOpen=Internal_OnOpen
    OnRendered=Internal_OnRendered
}