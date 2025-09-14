/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowItemRepairHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:2
 *
 *******************************************************************************/
class BTWindowItemRepairHK extends BTWindowHK
    editinlinenew
    instanced;

var BtrDouble UniqueID;
var FloatBox fbItemBox;
var export editinline BTItemBoxButtonHK itemBox;
var FloatBox fbSeparator[2];
var export editinline BTOwnerDrawImageHK Separator[2];
var FloatBox fbLabel[5];
var FloatBox fbEdit[3];
var export editinline BTOwnerDrawImageHK Label[5];
var export editinline BTOwnerDrawImageHK Edit[3];
var localized string strLabel[5];
var localized string strPoint;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    itemBox = new class'BTItemBoxButtonHK';
    itemBox.bUseAWinPos = true;
    itemBox.AWinPos = fbItemBox;
    itemBox.InitComponent(MyController, self);
    AppendComponent(itemBox);
    itemBox.itemBox.bBackgroundInfo = true;
    itemBox.itemBox.ChangeState(2);
    i = 0;
    J0x9f:
    // End:0x150 [While If]
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
        goto J0x9f;
    }
    i = 0;
    J0x157:
    // End:0x21c [While If]
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
        goto J0x157;
    }
    i = 0;
    J0x223:
    // End:0x321 [While If]
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
        goto J0x223;
    }
    i = 3;
    J0x329:
    // End:0x38a [While If]
    if(i < 5)
    {
        Label[i].FontSize[0] = 8;
        Label[i].FontColor[0] = class'Canvas'.static.MakeColor(byte(255), 90, 77, byte(255));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x329;
    }
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
}

function SetData(BtrDouble UniqueItemID, int RepairCost, int MyPoint, wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo)
{
    UniqueID = UniqueItemID;
    Edit[0].Caption = class'BTCustomDrawHK'.static.ToWonString(string(RepairCost)) @ strPoint;
    Edit[1].Caption = class'BTCustomDrawHK'.static.ToWonString(string(MyPoint)) @ strPoint;
    Edit[2].Caption = class'BTCustomDrawHK'.static.ToWonString(string(MyPoint - RepairCost)) @ strPoint;
    itemBox.SetData(ItemInfo, instanceInfo);
}

defaultproperties
{
    fbItemBox=(X1=395.0,Y1=237.0,X2=629.0,Y2=349.0)
    fbSeparator[0]=(X1=341.0,Y1=357.0,X2=683.0,Y2=359.0)
    fbSeparator[1]=(X1=341.0,Y1=469.0,X2=683.0,Y2=471.0)
    fbLabel[0]=(X1=344.0,Y1=374.0,X2=440.0,Y2=393.0)
    fbLabel[1]=(X1=344.0,Y1=408.0,X2=440.0,Y2=427.0)
    fbLabel[2]=(X1=344.0,Y1=442.0,X2=440.0,Y2=461.0)
    fbLabel[3]=(X1=344.0,Y1=482.0,X2=683.0,Y2=499.0)
    fbLabel[4]=(X1=344.0,Y1=499.0,X2=683.0,Y2=527.0)
    fbEdit[0]=(X1=440.0,Y1=367.0,X2=683.0,Y2=393.0)
    fbEdit[1]=(X1=440.0,Y1=401.0,X2=683.0,Y2=427.0)
    fbEdit[2]=(X1=440.0,Y1=435.0,X2=683.0,Y2=461.0)
    strLabel[0]="Repair Cost"
    strLabel[1]="Funds"
    strLabel[2]="Balance"
    strLabel[3]="- Repairing a loot item increases its damage level."
    strLabel[4]="- Items with higher damage levels cost more to repair."
    strPoint="Points"
    fbBackgroundImage=(X1=313.0,Y1=183.0,X2=711.0,Y2=584.0)
    fbTopLine=(X1=333.0,Y1=203.0,X2=691.0,Y2=228.0)
    fbBottomLine=(X1=333.0,Y1=521.0,X2=691.0,Y2=564.0)
    fbButtonOK=(X1=390.0,Y1=527.0,X2=509.0,Y2=559.0)
    fbButtonCancel=(X1=514.0,Y1=527.0,X2=633.0,Y2=559.0)
    strTitle="Repair Item"
    strOK="Repair"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}