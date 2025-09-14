class BTWindowItemSellHK extends BTWindowHK
    editinlinenew
    instanced;

var int MyPoint;
var int SellingCost;
var BtrDouble UniqueID;
var FloatBox fbItemBox;
var export editinline BTItemBoxButtonHK itemBox;
var FloatBox fbSeparator[2];
var export editinline BTOwnerDrawImageHK Separator[2];
var FloatBox fbLabel[4];
var FloatBox fbEdit[3];
var export editinline BTOwnerDrawImageHK Label[4];
var export editinline BTOwnerDrawImageHK Edit[3];
var int SelectCount;
var FloatBox fbComboItemCount;
var export editinline BTComboBoxHK ComboItemCount;
var localized string strLabel[4];
var localized string strPoint;
var localized string strCount;

function ComboItemCount_OnChange(GUIComponent Sender)
{
    SelectCount = ComboItemCount.ComboBox.GetIndex();
    SelectCount += 1;
    UpdatePrice(SelectCount);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    ComboItemCount = new Class'GUIWarfareControls_Decompressed.BTComboBoxHK';
    ComboItemCount.bUseAWinPos = true;
    ComboItemCount.AWinPos = fbComboItemCount;
    ComboItemCount.__OnChange__Delegate = ComboItemCount_OnChange;
    ComboItemCount.InitComponent(MyController, self);
    AppendComponent(ComboItemCount);
    ComboItemCount.FontDrawType = 5;
    ComboItemCount.ExtraDataFontDrawType = 3;
    ComboItemCount.bShowExtraData = true;
    itemBox = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
    itemBox.bUseAWinPos = true;
    itemBox.AWinPos = fbItemBox;
    itemBox.InitComponent(MyController, self);
    AppendComponent(itemBox);
    itemBox.itemBox.bBackgroundInfo = true;
    itemBox.itemBox.ChangeState(2);
    i = 0;
    J0x13A:

    // End:0x1EB [Loop If]
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
        goto J0x13A;
    }
    i = 0;
    J0x1F2:

    // End:0x2B7 [Loop If]
    if(i < 4)
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
        goto J0x1F2;
    }
    i = 0;
    J0x2BE:

    // End:0x3BC [Loop If]
    if(i < 3)
    {
        Edit[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        Edit[i].bUseAWinPos = true;
        Edit[i].AWinPos = fbEdit[i];
        Edit[i].Caption = "Point";
        Edit[i].CaptionDrawType = 5;
        Edit[i].CaptionPadding[2] = 10;
        Edit[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4;
        Edit[i].InitComponent(MyController, self);
        AppendComponent(Edit[i]);
        i++;
        // [Loop Continue]
        goto J0x2BE;
    }
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
    //return;    
}

function UpdatePrice(int Count)
{
    Edit[0].Caption = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(SellingCost * Count)) @ strPoint;
    Edit[1].Caption = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MyPoint)) @ strPoint;
    Edit[2].Caption = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MyPoint + (SellingCost * Count))) @ strPoint;
    //return;    
}

function SetData(BtrDouble UniqueItemID, int SellingCost, int MyPoint, wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo)
{
    local int i;

    UniqueID = UniqueItemID;
    self.MyPoint = MyPoint;
    self.SellingCost = SellingCost;
    self.SelectCount = 1;
    UpdatePrice(SelectCount);
    itemBox.SetData(ItemInfo, instanceInfo);
    ComboItemCount.ComboBox.Clear();
    i = 0;
    J0x7A:

    // End:0xC5 [Loop If]
    if(i < instanceInfo.OverlapCount)
    {
        ComboItemCount.ComboBox.AddItem(string(i + 1) @ strCount);
        i++;
        // [Loop Continue]
        goto J0x7A;
    }
    //return;    
}

defaultproperties
{
    fbItemBox=(X1=395.0000000,Y1=242.0000000,X2=629.0000000,Y2=354.0000000)
    fbSeparator[0]=(X1=341.0000000,Y1=362.0000000,X2=683.0000000,Y2=364.0000000)
    fbSeparator[1]=(X1=341.0000000,Y1=406.0000000,X2=683.0000000,Y2=408.0000000)
    fbLabel[0]=(X1=344.0000000,Y1=423.0000000,X2=440.0000000,Y2=457.0000000)
    fbLabel[1]=(X1=344.0000000,Y1=457.0000000,X2=440.0000000,Y2=491.0000000)
    fbLabel[2]=(X1=344.0000000,Y1=491.0000000,X2=440.0000000,Y2=525.0000000)
    fbLabel[3]=(X1=344.0000000,Y1=379.0000000,X2=440.0000000,Y2=423.0000000)
    fbEdit[0]=(X1=440.0000000,Y1=416.0000000,X2=683.0000000,Y2=442.0000000)
    fbEdit[1]=(X1=440.0000000,Y1=450.0000000,X2=683.0000000,Y2=476.0000000)
    fbEdit[2]=(X1=440.0000000,Y1=484.0000000,X2=683.0000000,Y2=510.0000000)
    fbComboItemCount=(X1=440.0000000,Y1=372.0000000,X2=683.0000000,Y2=398.0000000)
    strLabel[0]="Value"
    strLabel[1]="Funds"
    strLabel[2]="New Balance"
    strLabel[3]="Quantity"
    strPoint="Points"
    strCount="Count"
    fbBackgroundImage=(X1=313.0000000,Y1=188.0000000,X2=711.0000000,Y2=581.0000000)
    fbTopLine=(X1=333.0000000,Y1=208.0000000,X2=691.0000000,Y2=234.0000000)
    fbBottomLine=(X1=333.0000000,Y1=518.0000000,X2=691.0000000,Y2=561.0000000)
    fbButtonOK=(X1=390.0000000,Y1=524.0000000,X2=509.0000000,Y2=556.0000000)
    fbButtonCancel=(X1=514.0000000,Y1=524.0000000,X2=633.0000000,Y2=556.0000000)
    strTitle="Sell Item"
    strOK="Sell"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}