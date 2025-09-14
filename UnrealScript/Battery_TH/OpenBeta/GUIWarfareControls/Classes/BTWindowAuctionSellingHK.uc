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
var() automated FloatBox fbCombo;
var export editinline BTComboBoxHK Combo;
var() automated FloatBox fbLabelWarning[2];
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
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    ItemInfoBox = new Class'GUIWarfareControls_Decompressed.BTItemInfoVertBoxHK';
    ItemInfoBox.bUseAWinPos = true;
    ItemInfoBox.AWinPos = fbItemInfoBox;
    ItemInfoBox.InitComponent(MyController, self);
    AppendComponent(ItemInfoBox);
    Combo = new Class'GUIWarfareControls_Decompressed.BTComboBoxHK';
    Combo.bUseAWinPos = true;
    Combo.AWinPos = fbCombo;
    Combo.RenderWeight = 0.7000000;
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
    // End:0x1FA
    if(!Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        Combo.ComboBox.AddItem("5 Minutes");
    }
    i = 0;
    J0x201:

    // End:0x2B2 [Loop If]
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
        goto J0x201;
    }
    i = 0;
    J0x2B9:

    // End:0x37E [Loop If]
    if(i < 5)
    {
        Label[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        Label[i].bUseAWinPos = true;
        Label[i].AWinPos = fbLabel[i];
        Label[i].Caption = strLabel[i];
        Label[i].CaptionDrawType = 0;
        Label[i].InitComponent(MyController, self);
        AppendComponent(Label[i]);
        i++;
        // [Loop Continue]
        goto J0x2B9;
    }
    i = 0;
    J0x385:

    // End:0x4ED [Loop If]
    if(i < 4)
    {
        Edit[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        Edit[i].bUseAWinPos = true;
        Edit[i].AWinPos = fbEdit[i];
        // End:0x405
        if(i == 0)
        {
            Edit[i].Caption = strCount;            
        }
        else
        {
            Edit[i].Caption = "";
        }
        Edit[i].CaptionDrawType = 5;
        Edit[i].CaptionPadding[2] = 10;
        // End:0x47F
        if(i == 3)
        {
            Edit[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;            
        }
        else
        {
            Edit[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4;
        }
        Edit[i].InitComponent(MyController, self);
        AppendComponent(Edit[i]);
        Edit[i].SetDefaultFontColor();
        i++;
        // [Loop Continue]
        goto J0x385;
    }
    i = 0;
    J0x4F4:

    // End:0x5AE [Loop If]
    if(i < 3)
    {
        NEditBox[i] = new Class'GUIWarfareControls_Decompressed.BTNumericEditBoxHK';
        NEditBox[i].bUseAWinPos = true;
        NEditBox[i].AWinPos = fbNEditBox[i];
        NEditBox[i].CaptionDrawType = 5;
        NEditBox[i].SetDefaultNonSelectFontColor();
        NEditBox[i].InitComponent(MyController, self);
        AppendComponent(NEditBox[i]);
        i++;
        // [Loop Continue]
        goto J0x4F4;
    }
    i = 0;
    J0x5B5:

    // End:0x6C5 [Loop If]
    if(i < 2)
    {
        LabelWarning[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        LabelWarning[i].bUseAWinPos = true;
        LabelWarning[i].AWinPos = fbLabelWarning[i];
        LabelWarning[i].Caption = strLabelWarning[i];
        LabelWarning[i].CaptionDrawType = 0;
        LabelWarning[i].FontSize[0] = 8;
        LabelWarning[i].FontColor[0] = Class'Engine.Canvas'.static.MakeColor(byte(255), 90, 77, byte(255));
        LabelWarning[i].InitComponent(MyController, self);
        AppendComponent(LabelWarning[i]);
        i++;
        // [Loop Continue]
        goto J0x5B5;
    }
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
    NEditBox[1].MaxValue = 99999999;
    NEditBox[2].MaxValue = 99999999;
    //return;    
}

function SetData(int MyPoint, wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo)
{
    UniqueID = instanceInfo.UniqueID;
    MaxItemCount = instanceInfo.OverlapCount;
    ItemInfoBox.SetData(ItemInfo, instanceInfo, none, none);
    NEditBox[1].SetData(ItemInfo.AuctionMinPrice);
    LabelWarning[0].Caption = ((((("-" $ ItemInfo.ItemName) $ strLabelWarning0_0) $ Class'Engine.BTCustomDrawHK'.static.ToWonString(string(ItemInfo.AuctionMinPrice))) $ " ~ ") $ Class'Engine.BTCustomDrawHK'.static.ToWonString(string(ItemInfo.AuctionMaxPrice))) $ strLabelWarning0_1;
    // End:0x114
    if(ItemInfo.bOverlap)
    {
        Edit[0].EnableMe();
        NEditBox[0].EnableMe();        
    }
    else
    {
        Edit[0].DisableMe();
        NEditBox[0].DisableMe();
    }
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local int Value;

    Value = int((float(int(NEditBox[1].OriginalStr)) / 20.0000000) * MarginArray[Combo.ComboBox.Index]);
    Edit[3].Caption = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(Value));
    //return;    
}

function Internal_OnOpen()
{
    NEditBox[0].SetData(1);
    NEditBox[3].SetData(0);
    Combo.ComboBox.SetIndex(2);
    //return;    
}

defaultproperties
{
    strHour="????"
    MarginArray[0]=1.0000000
    MarginArray[1]=1.5000000
    MarginArray[2]=2.0000000
    MarginArray[3]=2.5000000
    MarginArray[4]=1.0000000
    fbItemInfoBox=(X1=333.0000000,Y1=99.0000000,X2=690.0000000,Y2=426.0000000)
    fbSeparator[0]=(X1=341.0000000,Y1=428.0000000,X2=683.0000000,Y2=430.0000000)
    fbSeparator[1]=(X1=341.0000000,Y1=591.0000000,X2=683.0000000,Y2=593.0000000)
    fbLabel[0]=(X1=344.0000000,Y1=445.0000000,X2=446.0000000,Y2=479.0000000)
    fbLabel[1]=(X1=344.0000000,Y1=479.0000000,X2=446.0000000,Y2=513.0000000)
    fbLabel[2]=(X1=344.0000000,Y1=513.0000000,X2=446.0000000,Y2=547.0000000)
    fbLabel[3]=(X1=344.0000000,Y1=547.0000000,X2=446.0000000,Y2=607.0000000)
    fbLabel[4]=(X1=344.0000000,Y1=607.0000000,X2=446.0000000,Y2=634.0000000)
    fbEdit[0]=(X1=440.0000000,Y1=438.0000000,X2=683.0000000,Y2=464.0000000)
    fbEdit[1]=(X1=440.0000000,Y1=472.0000000,X2=683.0000000,Y2=498.0000000)
    fbEdit[2]=(X1=440.0000000,Y1=506.0000000,X2=683.0000000,Y2=532.0000000)
    fbEdit[3]=(X1=440.0000000,Y1=601.0000000,X2=683.0000000,Y2=627.0000000)
    fbNEditBox[0]=(X1=443.0000000,Y1=438.0000000,X2=655.0000000,Y2=464.0000000)
    fbNEditBox[1]=(X1=443.0000000,Y1=472.0000000,X2=675.0000000,Y2=498.0000000)
    fbNEditBox[2]=(X1=443.0000000,Y1=506.0000000,X2=675.0000000,Y2=532.0000000)
    fbCombo=(X1=440.0000000,Y1=540.0000000,X2=683.0000000,Y2=566.0000000)
    fbLabelWarning[0]=(X1=341.0000000,Y1=574.0000000,X2=683.0000000,Y2=607.0000000)
    fbLabelWarning[1]=(X1=341.0000000,Y1=634.0000000,X2=683.0000000,Y2=658.0000000)
    strLabel[0]="???????????"
    strLabel[1]="???????????"
    strLabel[2]="?????????"
    strLabel[3]="???????"
    strLabel[4]="?????????"
    strLabelWarning[1]="??????????????????????????????????????????????????????"
    strLabelWarning0_0="?????????????"
    strLabelWarning0_1="BP"
    strCount="????"
    fbBackgroundImage=(X1=313.0000000,Y1=53.0000000,X2=711.0000000,Y2=715.0000000)
    fbTopLine=(X1=333.0000000,Y1=73.0000000,X2=691.0000000,Y2=99.0000000)
    fbBottomLine=(X1=333.0000000,Y1=652.0000000,X2=691.0000000,Y2=695.0000000)
    fbButtonOK=(X1=390.0000000,Y1=658.0000000,X2=508.0000000,Y2=690.0000000)
    fbButtonCancel=(X1=514.0000000,Y1=658.0000000,X2=633.0000000,Y2=690.0000000)
    strTitle="?????????"
    strOK="???????????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowAuctionSellingHK.Internal_OnOpen
    OnRendered=BTWindowAuctionSellingHK.Internal_OnRendered
}