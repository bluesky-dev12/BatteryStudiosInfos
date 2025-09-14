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

    Zone = new Class'GUIWarfareControls_Decompressed.BTScrollZoneHK';
    zoneimg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Scrol_New_BG;
    Zone.zoneImage = zoneimg;
    MultiColumnBox.MyScrollBar.MyScrollZone = Zone;
    ibtn = new Class'GUIWarfareControls_Decompressed.BTScrollButtonHK';
    ibtn.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_up_n;
    ibtn.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_up_on;
    ibtn.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_up_n;
    ibtn.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_up_cli;
    ibtn.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_up_dis;
    ibtn.buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_up_on;
    MultiColumnBox.MyScrollBar.MyDecreaseButton = ibtn;
    dbtn = new Class'GUIWarfareControls_Decompressed.BTScrollButtonHK';
    dbtn.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_dn_n;
    dbtn.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_dn_on;
    dbtn.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_dn_n;
    dbtn.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_dn_cli;
    dbtn.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_dn_dis;
    dbtn.buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_dn_on;
    MultiColumnBox.MyScrollBar.MyIncreaseButton = dbtn;
    Grip = new Class'GUIWarfareControls_Decompressed.BTGripButtonHK';
    Grip.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_grip_n;
    Grip.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_grip_on;
    Grip.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_grip_on;
    Grip.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_grip_cli;
    Grip.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_new_grip_n;
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
    //return;    
}

function string GetUserName(int row)
{
    return ACLRowList[row].DataPerColumn[0].strValue;
    //return;    
}

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1E
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
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetUserName(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 12, 0, 0, 0, Data.Text[i].DrawShadowColor);
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return 36.0000000;
    //return;    
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
    CommonSizeImg.Width = 36.0000000;
    CommonSizeImg.Height = 36.0000000;
    CommonSizeImg.DrawType = 21;
    CommonSizeImg.DrawColor = WhiteColor;
    ruii = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.List_New_Opt_on;
    ruii2 = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.List_New_Opt_cli;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.DefaultRowImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.List_New_Opt_backnlist;
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("UserName", 1.0000000, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    //return;    
}

function AddBlockUser(string UserName)
{
    local BTAutoColumnListDataHK row;
    local Image uii;
    local int i;

    uii = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    uii.Width = 341.0000000;
    uii.Height = 40.0000000;
    uii.DrawType = 28;
    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(2);
    row.BackgroundImage = uii;
    row.DataPerColumn[0].strValue = UserName;
    i = 0;
    J0x97:

    // End:0xD0 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x97;
    }
    AddRow(row);
    //return;    
}

function RemoveBlockUser(string UserName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x59 [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x4F
        if(ACLRowList[i].DataPerColumn[0].strValue == UserName)
        {
            ACLRowList.Remove(i, 1);
            i--;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}
