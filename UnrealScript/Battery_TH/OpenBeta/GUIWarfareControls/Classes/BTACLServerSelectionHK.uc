class BTACLServerSelectionHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var int ConnectedUser;
var int MaxUser;
var bool bShowCount;
var string CurrentServerGroup;
var() localized string textChobo;
var() localized string textServerSlash;
var() localized string textChannel;
var() localized string textLC2[4];
//var delegate<OnEnterChannel> __OnEnterChannel__Delegate;

function float GetItemHeight(Canvas C)
{
    return 34.0000000;
    //return;    
}

function LC1_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    Class'Engine.BTCustomDrawHK'.static.DrawStringPadding(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 0.0396825, 0.0000000, 0.0000000, 0.0000000, Data.Text[i].DrawShadowColor);
    // End:0x193
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() != false)
    {
        // End:0x193
        if(ACLRowList[row].DataPerColumn[6].IntValue > 0)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, "ClanServer", 5, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
        }
    }
    //return;    
}

function LC2_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i, j;
    local float perc;

    Class'Engine.BTCustomDrawHK'.static.DrawImagePaddingOffset(C, self.ACLHeaderList[1].ColumnImageList[0], L, t, L + float(51), B, 0, 9, 0, 9);
    perc = float(Data.IntValue) / 60.0000000;
    // End:0x81
    if(perc > 1.0000000)
    {
        perc = 1.0000000;        
    }
    else
    {
        // End:0x9B
        if(perc < 0.1000000)
        {
            perc = 0.1000000;
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImageScaleAllAndPaddingOffsetAndClipping(C, self.ACLHeaderList[1].ColumnImageList[1], L, t, L + float(51), B, 0, 9, 0, 9, 0.0000000, 0.0000000, perc, 1.0000000);
    i = 0;
    // End:0x118
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x12E
    if(selectIndex == row)
    {
        i = 1;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    j = 0;
    // End:0x175
    if(Data.IntValue >= 99)
    {
        j = 3;        
    }
    else
    {
        // End:0x191
        if(Data.IntValue >= 60)
        {
            j = 2;            
        }
        else
        {
            // End:0x1A9
            if(Data.IntValue >= 20)
            {
                j = 1;
            }
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, textLC2[j], Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 51, 0, 0, 2, Data.Text[i].DrawShadowColor);
    // End:0x3D7
    if(bShowCount || bool(PlayerOwner().ConsoleCommand("SHOWUSERCOUNT")))
    {
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, (string(ACLRowList[row].DataPerColumn[5].IntValue) $ "/") $ string(ACLRowList[row].DataPerColumn[5].tempValue), 3, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
        ConnectedUser = 0;
        MaxUser = 0;
        i = 0;
        J0x2FD:

        // End:0x35D [Loop If]
        if(i < ACLRowList.Length)
        {
            ConnectedUser += ACLRowList[i].DataPerColumn[5].IntValue;
            MaxUser += ACLRowList[i].DataPerColumn[5].tempValue;
            i++;
            // [Loop Continue]
            goto J0x2FD;
        }
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, (string(ConnectedUser) $ "/") $ string(MaxUser), 3, float(Data.Text[i].FontSize), R + float(10), t, R + float(510), B, Data.Text[i].DrawShadowColor);
    }
    //return;    
}

delegate OnEnterChannel(BTACLServerSelectionHK acl)
{
    //return;    
}

function bool MultiColumnList_OnDblClick(GUIComponent Sender)
{
    Log("[BTACLServerSelectionHK::MultiColumnList_OnDblClick]");
    // End:0x56
    if(ACLRowList[GetCurrentIndex()].bSpliter == true)
    {
        return true;
    }
    OnEnterChannel(self);
    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;
    local BTAutoColumnListHeaderHK headerInfo;
    local Image ruii, ruii2;

    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.bDisplayHeader = false;
    MultiColumnList.bForceScrollBarPosition = true;
    MultiColumnList.MyScrollBar.bUseAWinPos = true;
    fb.X1 = 744.0000000;
    fb.Y1 = 89.0000000;
    fb.X2 = 745.0000000 + float(13);
    fb.Y2 = 89.0000000 + float(644);
    MultiColumnList.MyScrollBar.AWinPos = fb;
    MultiColumnList.__OnDblClick__Delegate = MultiColumnList_OnDblClick;
    ruii = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_on;
    ruii2 = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_cli;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("server_name", 650.0000000 - float(272), 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("ping", 738.0000000 - float(650), 7);
    headerInfo.__CustomDraw__Delegate = LC2_Draw;
    headerInfo.ColumnImageList[headerInfo.ColumnImageList.Length] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.gau_ser_back;
    headerInfo.ColumnImageList[headerInfo.ColumnImageList.Length] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.gau_ser_gauge;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    //return;    
}

defaultproperties
{
    textLC2[0]="Low"
    textLC2[1]="Nor"
    textLC2[2]="Full"
    textLC2[3]="Hot"
}