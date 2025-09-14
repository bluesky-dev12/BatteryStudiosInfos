class BTWindowItemRepairAllHK extends BTWindowHK
    editinlinenew
    instanced;

var int RepairCost[2];
var int MyPoint;
var int CurrentButtonID;
var() automated FloatBox fbButtonRepair[2];
var export editinline BTOwnerDrawCaptionButtonHK ButtonRepair[2];
var() automated FloatBox fbSeparator[2];
var export editinline BTOwnerDrawImageHK Separator[2];
var() automated FloatBox fbLabelDescription;
var export editinline BTMultiLineEditBoxHK LabelDescription;
var() automated FloatBox fbLabelWarning[2];
var export editinline BTOwnerDrawImageHK LabelWarning[2];
var() automated FloatBox fbLabel[3];
var() automated FloatBox fbEdit[3];
var export editinline BTOwnerDrawImageHK Label[3];
var export editinline BTOwnerDrawImageHK Edit[3];
var localized string strButtonRepair[2];
var localized string strEquipItemDescription;
var localized string strEquipItemWarning[2];
var localized string strInvenItemDescription;
var localized string strInvenItemWarning[2];
var localized string strLabel[3];
var localized string strPoint;

function ChangeDescription(int ButtonID)
{
    // End:0x52
    if(ButtonID == 0)
    {
        LabelDescription.SetText(strEquipItemDescription);
        LabelWarning[0].Caption = strEquipItemWarning[0];
        LabelWarning[1].Caption = strEquipItemWarning[1];        
    }
    else
    {
        LabelDescription.SetText(strInvenItemDescription);
        LabelWarning[0].Caption = strInvenItemWarning[0];
        LabelWarning[1].Caption = strInvenItemWarning[1];
    }
    //return;    
}

function bool ButtonRepair_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    // End:0x49
    if(btn.ButtonID == 0)
    {
        ButtonRepair[0].DisableMe();
        ButtonRepair[1].EnableMe();        
    }
    else
    {
        ButtonRepair[1].DisableMe();
        ButtonRepair[0].EnableMe();
    }
    ChangeDescription(btn.ButtonID);
    ChangeRepairCost(btn.ButtonID);
    CurrentButtonID = btn.ButtonID;
    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x187 [Loop If]
    if(i < 2)
    {
        ButtonRepair[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        ButtonRepair[i].bUseAWinPos = true;
        ButtonRepair[i].AWinPos = fbButtonRepair[i];
        ButtonRepair[i].Caption = strButtonRepair[i];
        ButtonRepair[i].SetDefaultMButtonImage();
        ButtonRepair[i].buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_m_cli;
        ButtonRepair[i].SetDefaultFontColor();
        ButtonRepair[i].FontColor[4] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonN();
        ButtonRepair[i].SetFontSizeAll(9);
        ButtonRepair[i].ButtonID = i;
        ButtonRepair[i].__OnClick__Delegate = ButtonRepair_OnClick;
        ButtonRepair[i].InitComponent(MyController, self);
        AppendComponent(ButtonRepair[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    i = 0;
    J0x18E:

    // End:0x23F [Loop If]
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
        goto J0x18E;
    }
    i = 0;
    J0x246:

    // End:0x30B [Loop If]
    if(i < 3)
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
        goto J0x246;
    }
    i = 0;
    J0x312:

    // End:0x402 [Loop If]
    if(i < 2)
    {
        LabelWarning[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        LabelWarning[i].bUseAWinPos = true;
        LabelWarning[i].AWinPos = fbLabelWarning[i];
        LabelWarning[i].CaptionDrawType = 0;
        LabelWarning[i].FontSize[0] = 8;
        LabelWarning[i].FontColor[0] = Class'Engine.Canvas'.static.MakeColor(byte(255), 90, 77, byte(255));
        LabelWarning[i].InitComponent(MyController, self);
        AppendComponent(LabelWarning[i]);
        i++;
        // [Loop Continue]
        goto J0x312;
    }
    LabelDescription = new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK';
    LabelDescription.bUseAWinPos = true;
    LabelDescription.AWinPos = fbLabelDescription;
    LabelDescription.InitComponent(MyController, self);
    AppendComponent(LabelDescription);
    LabelDescription.bAcceptsInput = false;
    i = 0;
    J0x46E:

    // End:0x56C [Loop If]
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
        goto J0x46E;
    }
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
    CurrentButtonID = 0;
    ChangeDescription(CurrentButtonID);
    ChangeRepairCost(CurrentButtonID);
    //return;    
}

function SetData(int erCost, int irCost, int Point)
{
    RepairCost[0] = erCost;
    RepairCost[1] = irCost;
    MyPoint = Point;
    ChangeRepairCost(CurrentButtonID);
    //return;    
}

function ChangeRepairCost(int Index)
{
    Edit[0].Caption = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(RepairCost[Index])) @ strPoint;
    // End:0x57
    if(RepairCost[Index] == 0)
    {
        ButtonOK.DisableMe();        
    }
    else
    {
        ButtonOK.EnableMe();
    }
    Edit[1].Caption = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MyPoint)) @ strPoint;
    Edit[2].Caption = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MyPoint - RepairCost[Index])) @ strPoint;
    //return;    
}

defaultproperties
{
    fbButtonRepair[0]=(X1=343.0000000,Y1=262.0000000,X2=510.0000000,Y2=282.0000000)
    fbButtonRepair[1]=(X1=513.0000000,Y1=262.0000000,X2=680.0000000,Y2=282.0000000)
    fbSeparator[0]=(X1=341.0000000,Y1=290.0000000,X2=683.0000000,Y2=292.0000000)
    fbSeparator[1]=(X1=341.0000000,Y1=385.0000000,X2=683.0000000,Y2=387.0000000)
    fbLabelDescription=(X1=343.0000000,Y1=304.0000000,X2=681.0000000,Y2=345.0000000)
    fbLabelWarning[0]=(X1=341.0000000,Y1=345.0000000,X2=683.0000000,Y2=362.0000000)
    fbLabelWarning[1]=(X1=341.0000000,Y1=362.0000000,X2=683.0000000,Y2=379.0000000)
    fbLabel[0]=(X1=344.0000000,Y1=402.0000000,X2=440.0000000,Y2=436.0000000)
    fbLabel[1]=(X1=344.0000000,Y1=436.0000000,X2=440.0000000,Y2=470.0000000)
    fbLabel[2]=(X1=344.0000000,Y1=470.0000000,X2=440.0000000,Y2=500.0000000)
    fbEdit[0]=(X1=440.0000000,Y1=395.0000000,X2=683.0000000,Y2=421.0000000)
    fbEdit[1]=(X1=440.0000000,Y1=429.0000000,X2=683.0000000,Y2=455.0000000)
    fbEdit[2]=(X1=440.0000000,Y1=463.0000000,X2=683.0000000,Y2=489.0000000)
    strButtonRepair[0]="Repair Equipped Items"
    strButtonRepair[1]="Repair All Items"
    strEquipItemDescription="Repairs all equipped items and items in Quick Slots."
    strEquipItemWarning[0]="- Repairing a loot item increases its damage level."
    strEquipItemWarning[1]="- Items with higher damage levels cost more to repair."
    strInvenItemDescription="Repairs all items owned."
    strInvenItemWarning[0]="- Repairing a loot item increases its damage level."
    strInvenItemWarning[1]="- Items with higher damage levels cost more to repair."
    strLabel[0]="Repair Cost"
    strLabel[1]="Funds"
    strLabel[2]="Balance"
    strPoint="Points"
    fbBackgroundImage=(X1=313.0000000,Y1=208.0000000,X2=711.0000000,Y2=560.0000000)
    fbTopLine=(X1=333.0000000,Y1=228.0000000,X2=691.0000000,Y2=254.0000000)
    fbBottomLine=(X1=333.0000000,Y1=497.0000000,X2=691.0000000,Y2=540.0000000)
    fbButtonOK=(X1=390.0000000,Y1=503.0000000,X2=509.0000000,Y2=535.0000000)
    fbButtonCancel=(X1=514.0000000,Y1=503.0000000,X2=633.0000000,Y2=535.0000000)
    strTitle="Repair All"
    strOK="Repair"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}