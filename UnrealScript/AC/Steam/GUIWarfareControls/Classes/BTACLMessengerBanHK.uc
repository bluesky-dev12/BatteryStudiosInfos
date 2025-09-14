/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLMessengerBanHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:7
 *
 *******************************************************************************/
class BTACLMessengerBanHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var Image CommonSizeImg;

function InitScrollBar()
{
    local Image zoneimg;
    local export editinline BTScrollButtonHK ibtn, dbtn;
    local export editinline BTGripButtonHK Grip;
    local export editinline BTScrollZoneHK Zone;
    local export editinline GUIVertScrollBar vsb;

    Zone = new class'BTScrollZoneHK';
    zoneimg = class'BTUIResourcePoolHK'.default.Scrol_New_BG;
    Zone.zoneImage = zoneimg;
    MultiColumnBox.MyScrollBar.MyScrollZone = Zone;
    ibtn = new class'BTScrollButtonHK';
    ibtn.buttonImage[0] = class'BTUIResourcePoolHK'.default.scrol_new_up_n;
    ibtn.buttonImage[1] = class'BTUIResourcePoolHK'.default.scrol_new_up_on;
    ibtn.buttonImage[2] = class'BTUIResourcePoolHK'.default.scrol_new_up_n;
    ibtn.buttonImage[3] = class'BTUIResourcePoolHK'.default.scrol_new_up_cli;
    ibtn.buttonImage[4] = class'BTUIResourcePoolHK'.default.scrol_new_up_dis;
    ibtn.buttonImage[5] = class'BTUIResourcePoolHK'.default.scrol_new_up_on;
    MultiColumnBox.MyScrollBar.MyDecreaseButton = ibtn;
    dbtn = new class'BTScrollButtonHK';
    dbtn.buttonImage[0] = class'BTUIResourcePoolHK'.default.scrol_new_dn_n;
    dbtn.buttonImage[1] = class'BTUIResourcePoolHK'.default.scrol_new_dn_on;
    dbtn.buttonImage[2] = class'BTUIResourcePoolHK'.default.scrol_new_dn_n;
    dbtn.buttonImage[3] = class'BTUIResourcePoolHK'.default.scrol_new_dn_cli;
    dbtn.buttonImage[4] = class'BTUIResourcePoolHK'.default.scrol_new_dn_dis;
    dbtn.buttonImage[5] = class'BTUIResourcePoolHK'.default.scrol_new_dn_on;
    MultiColumnBox.MyScrollBar.MyIncreaseButton = dbtn;
    Grip = new class'BTGripButtonHK';
    Grip.buttonImage[0] = class'BTUIResourcePoolHK'.default.scrol_new_grip_n;
    Grip.buttonImage[1] = class'BTUIResourcePoolHK'.default.scrol_new_grip_on;
    Grip.buttonImage[2] = class'BTUIResourcePoolHK'.default.scrol_new_grip_on;
    Grip.buttonImage[3] = class'BTUIResourcePoolHK'.default.scrol_new_grip_cli;
    Grip.buttonImage[4] = class'BTUIResourcePoolHK'.default.scrol_new_grip_n;
    MultiColumnBox.MyScrollBar.MyGripButton = Grip;
    MultiColumnList.MyScrollBar.bScrollStyle = true;
    vsb = GUIVertScrollBar(MultiColumnBox.MyScrollBar);
    Grip.__OnMousePressed__Delegate = vsb.GripPressed;
    Zone.__OnScrollZoneClick__Delegate = vsb.ZoneClick;
    ibtn.__OnClick__Delegate = vsb.DecreaseClick;
    dbtn.__OnClick__Delegate = vsb.IncreaseClick;
    slp.LastSelectedIndex = -1;
    slp.LastSelectedIndexHistory = -1;
    slp.selectIndex = -1;
}

function string GetUserName(int row)
{
    return ACLRowList[row].DataPerColumn[0].strValue;
}

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1e
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetUserName(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 12, 0, 0, 0, Data.Text[i].DrawShadowColor);
}

function float GetItemHeight(Canvas C)
{
    return 36.0;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;
    local Image ruii, ruii2;

    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.bUseAWinPos = true;
    MultiColumnList.AWinPos.X1 = AWinPos.X1;
    MultiColumnList.AWinPos.Y1 = AWinPos.Y1;
    MultiColumnList.AWinPos.X2 = AWinPos.X2;
    MultiColumnList.AWinPos.Y2 = AWinPos.Y2;
    MultiColumnList.ApplyAWinPos();
    MultiColumnBox.bDisplayHeader = false;
    CommonSizeImg.width = 36.0;
    CommonSizeImg.Height = 36.0;
    CommonSizeImg.DrawType = 21;
    CommonSizeImg.DrawColor = WhiteColor;
    ruii = class'BTUIResourcePoolHK'.default.List_New_Opt_on;
    ruii2 = class'BTUIResourcePoolHK'.default.List_New_Opt_cli;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.DefaultRowImage = class'BTUIResourcePoolHK'.default.List_New_Opt_backnlist;
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("UserName", 1.0, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
}

function AddBlockUser(string UserName)
{
    local BTAutoColumnListDataHK row;
    local Image uii;
    local int i;

    uii = class'BTUIResourcePoolHK'.default.empty;
    uii.width = 341.0;
    uii.Height = 40.0;
    uii.DrawType = 28;
    row = new class'BTAutoColumnListDataHK';
    row.Init(2);
    row.BackgroundImage = uii;
    row.DataPerColumn[0].strValue = UserName;
    i = 0;
    J0x97:
    // End:0xd0 [While If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x97;
    }
    AddRow(row);
}

function RemoveBlockUser(string UserName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x59 [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x4f
        if(ACLRowList[i].DataPerColumn[0].strValue == UserName)
        {
            ACLRowList.Remove(i, 1);
            -- i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}
