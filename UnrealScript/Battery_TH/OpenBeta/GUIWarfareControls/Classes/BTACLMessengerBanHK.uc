class BTACLMessengerBanHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var Image CommonSizeImg;

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
    return 34.0000000;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;
    local Image ruii, ruii2;

    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.bDisplayHeader = false;
    CommonSizeImg.Width = 32.0000000;
    CommonSizeImg.Height = 32.0000000;
    CommonSizeImg.DrawType = 21;
    CommonSizeImg.DrawColor = WhiteColor;
    ruii = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_on;
    ruii2 = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_cli;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.DefaultRowImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_n;
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

    uii.Width = 223.0000000;
    uii.Height = 33.0000000;
    uii.Image = Texture'Warfare_TH_UI_UI.Common.list_commu_n';
    uii.DrawType = 15;
    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(2);
    row.BackgroundImage = uii;
    row.DataPerColumn[0].strValue = UserName;
    i = 0;
    J0x93:

    // End:0xCC [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x93;
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
