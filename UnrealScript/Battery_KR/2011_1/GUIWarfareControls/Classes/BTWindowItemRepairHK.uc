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
    itemBox = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
    itemBox.bUseAWinPos = true;
    itemBox.AWinPos = fbItemBox;
    itemBox.InitComponent(MyController, self);
    AppendComponent(itemBox);
    itemBox.itemBox.bBackgroundInfo = true;
    itemBox.itemBox.ChangeState(2);
    i = 0;
    J0x9F:

    // End:0x150 [Loop If]
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
        goto J0x9F;
    }
    i = 0;
    J0x157:

    // End:0x21C [Loop If]
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
        goto J0x157;
    }
    i = 0;
    J0x223:

    // End:0x321 [Loop If]
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
        goto J0x223;
    }
    i = 3;
    J0x329:

    // End:0x38A [Loop If]
    if(i < 5)
    {
        Label[i].FontSize[0] = 8;
        Label[i].FontColor[0] = Class'Engine.Canvas'.static.MakeColor(byte(255), 90, 77, byte(255));
        i++;
        // [Loop Continue]
        goto J0x329;
    }
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
    //return;    
}

function SetData(BtrDouble UniqueItemID, int RepairCost, int MyPoint, wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo)
{
    UniqueID = UniqueItemID;
    Edit[0].Caption = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(RepairCost)) @ strPoint;
    Edit[1].Caption = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MyPoint)) @ strPoint;
    Edit[2].Caption = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MyPoint - RepairCost)) @ strPoint;
    itemBox.SetData(ItemInfo, instanceInfo);
    //return;    
}

defaultproperties
{
    fbItemBox=(X1=395.0000000,Y1=237.0000000,X2=629.0000000,Y2=349.0000000)
    fbSeparator[0]=(X1=341.0000000,Y1=357.0000000,X2=683.0000000,Y2=359.0000000)
    fbSeparator[1]=(X1=341.0000000,Y1=469.0000000,X2=683.0000000,Y2=471.0000000)
    fbLabel[0]=(X1=344.0000000,Y1=374.0000000,X2=440.0000000,Y2=393.0000000)
    fbLabel[1]=(X1=344.0000000,Y1=408.0000000,X2=440.0000000,Y2=427.0000000)
    fbLabel[2]=(X1=344.0000000,Y1=442.0000000,X2=440.0000000,Y2=461.0000000)
    fbLabel[3]=(X1=344.0000000,Y1=482.0000000,X2=683.0000000,Y2=499.0000000)
    fbLabel[4]=(X1=344.0000000,Y1=499.0000000,X2=683.0000000,Y2=527.0000000)
    fbEdit[0]=(X1=440.0000000,Y1=367.0000000,X2=683.0000000,Y2=393.0000000)
    fbEdit[1]=(X1=440.0000000,Y1=401.0000000,X2=683.0000000,Y2=427.0000000)
    fbEdit[2]=(X1=440.0000000,Y1=435.0000000,X2=683.0000000,Y2=461.0000000)
    strLabel[0]="?? ??"
    strLabel[1]="?? ??"
    strLabel[2]="??"
    strLabel[3]="-???? ?? ? ???? ?????."
    strLabel[4]="-???? ??? ???? ???? ?????."
    strPoint="???"
    fbBackgroundImage=(X1=313.0000000,Y1=183.0000000,X2=711.0000000,Y2=584.0000000)
    fbTopLine=(X1=333.0000000,Y1=203.0000000,X2=691.0000000,Y2=228.0000000)
    fbBottomLine=(X1=333.0000000,Y1=521.0000000,X2=691.0000000,Y2=564.0000000)
    fbButtonOK=(X1=390.0000000,Y1=527.0000000,X2=509.0000000,Y2=559.0000000)
    fbButtonCancel=(X1=514.0000000,Y1=527.0000000,X2=633.0000000,Y2=559.0000000)
    strTitle="??? ??"
    strOK="??"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}