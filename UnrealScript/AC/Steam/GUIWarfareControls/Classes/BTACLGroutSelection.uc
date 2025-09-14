/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLGroutSelection.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:9
 *
 *******************************************************************************/
class BTACLGroutSelection extends BTAutoColumnListHK
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
var delegate<OnEnterChannel> __OnEnterChannel__Delegate;
var delegate<OnSelectSvr> __OnSelectSvr__Delegate;

function float GetItemHeight(Canvas C)
{
    return 28.0;
}

function LC1_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    C.DrawColor.R = byte(255);
    C.DrawColor.G = byte(255);
    C.DrawColor.B = byte(255);
    // End:0xc7
    if(selectIndex == row && MultiColumnList.bMousePress == false)
    {
        i = 1;
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
    }
    // End:0x14c
    else
    {
        // End:0xed
        if(MultiColumnList.bMousePress && selectIndex == row)
        {
        }
        // End:0x14c
        else
        {
            // End:0x14c
            if(LastSelectedIndex == row)
            {
                i = 2;
                C.DrawColor.R = byte(255);
                C.DrawColor.G = byte(255);
                C.DrawColor.B = byte(255);
            }
        }
    }
    Data.Text[i].FontSize = 9;
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, ACLRowList[row].DataPerColumn[1].strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, int(0.0396830), 0, 0, 0, Data.Text[i].DrawShadowColor, 9);
    // End:0x2a8
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() != false)
    {
        // End:0x2a8
        if(ACLRowList[row].DataPerColumn[6].IntValue == 1)
        {
            class'BTCustomDrawHK'.static.DrawString(C, "ClanServer", 5, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
        }
    }
}

function LC2_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i, j;
    local float perc, ColOffset;

    class'BTCustomDrawHK'.static.DrawImagePaddingOffset(C, self.ACLHeaderList[2].ColumnImageList[0], L + float(51), t, L + float(102), B, 0, 9, 0, 9);
    perc = float(Data.IntValue) / float(Data.tempValue);
    // End:0x9a
    if(perc >= 1.0)
    {
        perc = 1.0;
        ColOffset = 1.0;
    }
    // End:0xbf
    else
    {
        // End:0xbf
        if(perc < 0.10)
        {
            perc = 0.10;
            ColOffset = 0.0;
        }
    }
    C.DrawColor.R = byte(255);
    C.DrawColor.G = byte(255);
    C.DrawColor.B = byte(255);
    C.DrawColor.A = byte(255);
    // End:0x18b
    if(perc >= 0.90)
    {
        C.DrawColor.R = 213;
        C.DrawColor.G = 15;
        C.DrawColor.B = 0;
        C.DrawColor.A = byte(255);
    }
    // End:0x260
    else
    {
        // End:0x1f7
        if(perc >= 0.60)
        {
            C.DrawColor.R = 213;
            C.DrawColor.G = 129;
            C.DrawColor.B = 129;
            C.DrawColor.A = byte(255);
        }
        // End:0x260
        else
        {
            // End:0x260
            if(perc >= 0.30)
            {
                C.DrawColor.R = 204;
                C.DrawColor.G = 204;
                C.DrawColor.B = 204;
                C.DrawColor.A = byte(255);
            }
        }
    }
    class'BTCustomDrawHK'.static.DrawImageScaleAllAndPaddingOffsetAndClipping(C, self.ACLHeaderList[2].ColumnImageList[1], L + float(51), t, L + float(102), B, 2, 12, 0, 12, 0.0, 0.0, perc, 1.0);
    i = 0;
    // End:0x2e5
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x2fb
    if(selectIndex == row)
    {
        i = 1;
    }
    j = 0;
    Data.Text[i].DrawColor.R = byte(255);
    Data.Text[i].DrawColor.G = byte(255);
    Data.Text[i].DrawColor.B = byte(255);
    Data.Text[i].DrawColor.A = byte(255);
    // End:0x40e
    if(perc >= 0.90)
    {
        j = 3;
        Data.Text[i].DrawColor.R = 213;
        Data.Text[i].DrawColor.G = 15;
        Data.Text[i].DrawColor.B = 0;
        Data.Text[i].DrawColor.A = byte(255);
    }
    // End:0x52a
    else
    {
        // End:0x49e
        if(perc >= 0.60)
        {
            j = 2;
            Data.Text[i].DrawColor.R = 213;
            Data.Text[i].DrawColor.G = 129;
            Data.Text[i].DrawColor.B = 129;
            Data.Text[i].DrawColor.A = byte(255);
        }
        // End:0x52a
        else
        {
            // End:0x52a
            if(perc >= 0.30)
            {
                j = 1;
                Data.Text[i].DrawColor.R = 204;
                Data.Text[i].DrawColor.G = 204;
                Data.Text[i].DrawColor.B = 204;
                Data.Text[i].DrawColor.A = byte(255);
            }
        }
    }
    C.DrawColor = Data.Text[i].DrawColor;
    Data.Text[i].FontSize = 8;
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, textLC2[j], Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 0, 0, 0, 2, Data.Text[i].DrawShadowColor);
    // End:0x793
    if(bShowCount || bool(PlayerOwner().ConsoleCommand("SHOWUSERCOUNT")))
    {
        class'BTCustomDrawHK'.static.DrawString(C, string(ACLRowList[row].DataPerColumn[5].IntValue) $ "/" $ string(ACLRowList[row].DataPerColumn[5].tempValue), 3, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
        ConnectedUser = 0;
        MaxUser = 0;
        i = 0;
        J0x6b9:
        // End:0x719 [While If]
        if(i < ACLRowList.Length)
        {
            ConnectedUser += ACLRowList[i].DataPerColumn[5].IntValue;
            MaxUser += ACLRowList[i].DataPerColumn[5].tempValue;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x6b9;
        }
        class'BTCustomDrawHK'.static.DrawString(C, string(ConnectedUser) $ "/" $ string(MaxUser), 3, float(Data.Text[i].FontSize), R + float(10), t, R + float(510), B, Data.Text[i].DrawShadowColor);
    }
}

function LC3_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    class'BTCustomDrawHK'.static.DrawImagePaddingOffset(C, Data.ServerGroupImg, L, t, R, B, 0, 0, 0, 0);
}

delegate OnEnterChannel(BTACLGroutSelection acl);
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
}

delegate OnSelectSvr(BTACLGroutSelection acl);
function bool MultiColumnList_OnClick(GUIComponent Sender)
{
    OnSelectSvr(self);
    return true;
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
    fb.X1 = 635.0;
    fb.Y1 = 114.0;
    fb.X2 = 647.0;
    fb.Y2 = 730.0;
    MultiColumnList.MyScrollBar.AWinPos = fb;
    MultiColumnList.__OnDblClick__Delegate = MultiColumnList_OnDblClick;
    ruii = class'BTUIResourcePoolHK'.default.newlist_serv_on;
    ruii2 = class'BTUIResourcePoolHK'.default.newlist_serv_Focus;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.ClickImage = class'BTUIResourcePoolHK'.default.newlist_serv_cli;
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("server_Group", 0.0750, 7);
    headerInfo.ColumnImageList[headerInfo.ColumnImageList.Length] = class'BTUIResourcePoolHK'.default.ServerGroup[0];
    headerInfo.__CustomDraw__Delegate = LC3_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("server_name", 0.50, 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("ping", 0.4250, 7);
    headerInfo.__CustomDraw__Delegate = LC2_Draw;
    headerInfo.ColumnImageList[headerInfo.ColumnImageList.Length] = class'BTUIResourcePoolHK'.default.gau_servers_status_back;
    headerInfo.ColumnImageList[headerInfo.ColumnImageList.Length] = class'BTUIResourcePoolHK'.default.gau_servers_status_gauge;
    self.AddColumn(headerInfo);
    // End:0x2b6
    if(MultiColumnList.NoVisibleCols <= 1)
    {
        NormalizeColumnPerc();
    }
    // End:0x2bc
    else
    {
        NormalizeMultiColumnPerc();
    }
}
