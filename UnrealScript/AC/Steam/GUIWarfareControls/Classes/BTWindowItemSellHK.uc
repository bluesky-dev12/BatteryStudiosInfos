/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowItemSellHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:17
 *	Functions:4
 *
 *******************************************************************************/
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
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    ComboItemCount = new class'BTComboBoxHK';
    ComboItemCount.bUseAWinPos = true;
    ComboItemCount.AWinPos = fbComboItemCount;
    ComboItemCount.__OnChange__Delegate = ComboItemCount_OnChange;
    ComboItemCount.InitComponent(MyController, self);
    AppendComponent(ComboItemCount);
    ComboItemCount.FontDrawType = 5;
    ComboItemCount.ExtraDataFontDrawType = 3;
    ComboItemCount.bShowExtraData = true;
    itemBox = new class'BTItemBoxButtonHK';
    itemBox.bUseAWinPos = true;
    itemBox.AWinPos = fbItemBox;
    itemBox.InitComponent(MyController, self);
    AppendComponent(itemBox);
    itemBox.itemBox.bBackgroundInfo = true;
    itemBox.itemBox.ChangeState(2);
    i = 0;
    J0x13a:
    // End:0x1eb [While If]
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
        goto J0x13a;
    }
    i = 0;
    J0x1f2:
    // End:0x2b7 [While If]
    if(i < 4)
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
        goto J0x1f2;
    }
    i = 0;
    J0x2be:
    // End:0x3bc [While If]
    if(i < 3)
    {
        Edit[i] = new class'BTOwnerDrawImageHK';
        Edit[i].bUseAWinPos = true;
        Edit[i].AWinPos = fbEdit[i];
        Edit[i].Caption = "Point";
        Edit[i].CaptionDrawType = 5;
        Edit[i].CaptionPadding[2] = 10;
        Edit[i].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_4;
        Edit[i].InitComponent(MyController, self);
        AppendComponent(Edit[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2be;
    }
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
}

function UpdatePrice(int Count)
{
    Edit[0].Caption = class'BTCustomDrawHK'.static.ToWonString(string(SellingCost * Count)) @ strPoint;
    Edit[1].Caption = class'BTCustomDrawHK'.static.ToWonString(string(MyPoint)) @ strPoint;
    Edit[2].Caption = class'BTCustomDrawHK'.static.ToWonString(string(MyPoint + SellingCost * Count)) @ strPoint;
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
    J0x7a:
    // End:0xc5 [While If]
    if(i < instanceInfo.OverlapCount)
    {
        ComboItemCount.ComboBox.AddItem(string(i + 1) @ strCount);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7a;
    }
}

defaultproperties
{
    fbItemBox=(X1=395.0,Y1=242.0,X2=629.0,Y2=354.0)
    fbSeparator[0]=(X1=341.0,Y1=362.0,X2=683.0,Y2=364.0)
    fbSeparator[1]=(X1=341.0,Y1=406.0,X2=683.0,Y2=408.0)
    fbLabel[0]=(X1=344.0,Y1=423.0,X2=440.0,Y2=457.0)
    fbLabel[1]=(X1=344.0,Y1=457.0,X2=440.0,Y2=491.0)
    fbLabel[2]=(X1=344.0,Y1=491.0,X2=440.0,Y2=525.0)
    fbLabel[3]=(X1=344.0,Y1=379.0,X2=440.0,Y2=423.0)
    fbEdit[0]=(X1=440.0,Y1=416.0,X2=683.0,Y2=442.0)
    fbEdit[1]=(X1=440.0,Y1=450.0,X2=683.0,Y2=476.0)
    fbEdit[2]=(X1=440.0,Y1=484.0,X2=683.0,Y2=510.0)
    fbComboItemCount=(X1=440.0,Y1=372.0,X2=683.0,Y2=398.0)
    strLabel[0]="Value"
    strLabel[1]="Funds"
    strLabel[2]="New Balance"
    strLabel[3]="Quantity"
    strPoint="Points"
    strCount="Count"
    fbBackgroundImage=(X1=313.0,Y1=188.0,X2=711.0,Y2=581.0)
    fbTopLine=(X1=333.0,Y1=208.0,X2=691.0,Y2=234.0)
    fbBottomLine=(X1=333.0,Y1=518.0,X2=691.0,Y2=561.0)
    fbButtonOK=(X1=390.0,Y1=524.0,X2=509.0,Y2=556.0)
    fbButtonCancel=(X1=514.0,Y1=524.0,X2=633.0,Y2=556.0)
    strTitle="Sell Item"
    strOK="Sell"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}