/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLServerSelectionHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:13
 *	Functions:8
 *
 *******************************************************************************/
class BTACLServerSelectionHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var int ConnectedUser;
var int MaxUser;
var bool bShowCount;
var string CurrentServerGroup;
var BTRODecorateStringHK ChannelToolTip;
var bool bShowToolTip;
var localized string strChannelToolTip;
var export editinline BTACLServerSelectionHK SelChannel;
var() localized string textChobo;
var() localized string textServerSlash;
var() localized string textChannel;
var() localized string textLC2[4];
var delegate<OnEnterChannel> __OnEnterChannel__Delegate;

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
    class'BTCustomDrawHK'.static.DrawStringPadding(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 0.0396830, 0.0, 0.0, 0.0, Data.Text[i].DrawShadowColor);
    // End:0x29f
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() != false)
    {
        // End:0x29f
        if(ACLRowList[row].DataPerColumn[6].IntValue == 1)
        {
            class'BTCustomDrawHK'.static.DrawString(C, "ClanServer", 5, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
        }
    }
    // End:0x3c2
    if(Data.tempValue != 0 && L < Controller.MouseX && Controller.MouseX < R && t < Controller.MouseY && Controller.MouseY < B)
    {
        ChannelToolTip.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(float(int(Controller.MouseX) + 10), float(int(Controller.MouseY) - 20), float(int(Controller.MouseX) + 10 + 50), float(int(Controller.MouseY)));
        ChannelToolTip.OriginalString.Text = strChannelToolTip;
        ChannelToolTip.bNeedUpdate = true;
        bShowToolTip = true;
    }
    // End:0x3ca
    else
    {
        bShowToolTip = false;
    }
}

function LC2_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i, j;
    local float perc;

    class'BTCustomDrawHK'.static.DrawImagePaddingOffset(C, self.ACLHeaderList[1].ColumnImageList[0], L, t, L + float(51), B, 0, 9, 0, 9);
    perc = float(Data.IntValue) / 60.0;
    // End:0x81
    if(perc > 1.0)
    {
        perc = 1.0;
    }
    // End:0x9b
    else
    {
        // End:0x9b
        if(perc < 0.10)
        {
            perc = 0.10;
        }
    }
    class'BTCustomDrawHK'.static.DrawImageScaleAllAndPaddingOffsetAndClipping(C, self.ACLHeaderList[1].ColumnImageList[1], L, t, L + float(51), B, 0, 9, 0, 9, 0.0, 0.0, perc, 1.0);
    i = 0;
    // End:0x118
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x12e
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
    // End:0x1a9
    else
    {
        // End:0x191
        if(Data.IntValue >= 60)
        {
            j = 2;
        }
        // End:0x1a9
        else
        {
            // End:0x1a9
            if(Data.IntValue >= 20)
            {
                j = 1;
            }
        }
    }
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, textLC2[j], Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 51, 0, 0, 2, Data.Text[i].DrawShadowColor);
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, textLC2[j], Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 51, 0, 0, 2, Data.Text[i].DrawShadowColor);
    // End:0x451
    if(bShowCount || bool(PlayerOwner().ConsoleCommand("SHOWUSERCOUNT")))
    {
        class'BTCustomDrawHK'.static.DrawString(C, string(ACLRowList[row].DataPerColumn[5].IntValue) $ "/" $ string(ACLRowList[row].DataPerColumn[5].tempValue), 3, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
        ConnectedUser = 0;
        MaxUser = 0;
        i = 0;
        J0x377:
        // End:0x3d7 [While If]
        if(i < ACLRowList.Length)
        {
            ConnectedUser += ACLRowList[i].DataPerColumn[5].IntValue;
            MaxUser += ACLRowList[i].DataPerColumn[5].tempValue;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x377;
        }
        class'BTCustomDrawHK'.static.DrawString(C, string(ConnectedUser) $ "/" $ string(MaxUser), 3, float(Data.Text[i].FontSize), R + float(10), t, R + float(510), B, Data.Text[i].DrawShadowColor);
    }
}

function LC3_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i, j;
    local float perc, ColOffset;

    class'BTCustomDrawHK'.static.DrawImagePaddingOffset(C, self.ACLHeaderList[1].ColumnImageList[0], L + float(51), t, L + float(102), B, 0, 9, 0, 9);
    perc = float(Data.IntValue) / float(Data.tempValue);
    // End:0x99
    if(perc >= 1.0)
    {
        perc = 1.0;
        ColOffset = 1.0;
    }
    // End:0xbe
    else
    {
        // End:0xbe
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
    // End:0x18a
    if(perc >= 0.90)
    {
        C.DrawColor.R = 213;
        C.DrawColor.G = 15;
        C.DrawColor.B = 0;
        C.DrawColor.A = byte(255);
    }
    // End:0x25f
    else
    {
        // End:0x1f6
        if(perc >= 0.60)
        {
            C.DrawColor.R = 213;
            C.DrawColor.G = 129;
            C.DrawColor.B = 129;
            C.DrawColor.A = byte(255);
        }
        // End:0x25f
        else
        {
            // End:0x25f
            if(perc >= 0.30)
            {
                C.DrawColor.R = 204;
                C.DrawColor.G = 204;
                C.DrawColor.B = 204;
                C.DrawColor.A = byte(255);
            }
        }
    }
    class'BTCustomDrawHK'.static.DrawImageScaleAllAndPaddingOffsetAndClipping(C, self.ACLHeaderList[1].ColumnImageList[1], L + float(51), t, L + float(102), B, 2, 12, 2, 12, 0.0, 0.0, perc, 1.0);
    i = 0;
    // End:0x2e4
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x2fa
    if(selectIndex == row)
    {
        i = 1;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    j = 0;
    Data.Text[i].DrawColor.R = byte(255);
    Data.Text[i].DrawColor.G = byte(255);
    Data.Text[i].DrawColor.B = byte(255);
    Data.Text[i].DrawColor.A = byte(255);
    // End:0x431
    if(perc >= 0.90)
    {
        j = 3;
        Data.Text[i].DrawColor.R = 213;
        Data.Text[i].DrawColor.G = 15;
        Data.Text[i].DrawColor.B = 0;
        Data.Text[i].DrawColor.A = byte(255);
    }
    // End:0x54d
    else
    {
        // End:0x4c1
        if(perc >= 0.60)
        {
            j = 2;
            Data.Text[i].DrawColor.R = 213;
            Data.Text[i].DrawColor.G = 129;
            Data.Text[i].DrawColor.B = 129;
            Data.Text[i].DrawColor.A = byte(255);
        }
        // End:0x54d
        else
        {
            // End:0x54d
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
    // End:0x7b6
    if(bShowCount || bool(PlayerOwner().ConsoleCommand("SHOWUSERCOUNT")))
    {
        class'BTCustomDrawHK'.static.DrawString(C, string(ACLRowList[row].DataPerColumn[5].IntValue) $ "/" $ string(ACLRowList[row].DataPerColumn[5].tempValue), 3, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
        ConnectedUser = 0;
        MaxUser = 0;
        i = 0;
        J0x6dc:
        // End:0x73c [While If]
        if(i < ACLRowList.Length)
        {
            ConnectedUser += ACLRowList[i].DataPerColumn[5].IntValue;
            MaxUser += ACLRowList[i].DataPerColumn[5].tempValue;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x6dc;
        }
        class'BTCustomDrawHK'.static.DrawString(C, string(ConnectedUser) $ "/" $ string(MaxUser), 3, float(Data.Text[i].FontSize), R + float(10), t, R + float(510), B, Data.Text[i].DrawShadowColor);
    }
    // End:0x7d3
    if(bShowToolTip)
    {
        ChannelToolTip.Render(C);
    }
}

delegate OnEnterChannel(BTACLServerSelectionHK acl);
function bool Sel_ChannelClick(GUIComponent Sender)
{
    Log("[BTACLServerSelectionHK::MultiColumnList_OnDblClick]");
    // End:0x56
    if(ACLRowList[GetCurrentIndex()].bSpliter == true)
    {
        return true;
    }
    SelChannel = self;
    return true;
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
    fb.X1 = 1006.0;
    fb.Y1 = 114.0;
    fb.X2 = 1018.0;
    fb.Y2 = 394.0;
    MultiColumnList.NoVisibleCols = 1;
    MultiColumnList.NoVisibleRows = 4;
    MultiColumnList.MyScrollBar.AWinPos = fb;
    MultiColumnList.__OnDblClick__Delegate = MultiColumnList_OnDblClick;
    MultiColumnList.__OnClick__Delegate = Sel_ChannelClick;
    ruii = class'BTUIResourcePoolHK'.default.newlist_Channel_on;
    ruii2 = class'BTUIResourcePoolHK'.default.newlist_Channel_Focus;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.ClickImage = class'BTUIResourcePoolHK'.default.newlist_Channel_cli;
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("server_name", 650.0 - float(272), 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("ping", 180.0, 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw;
    headerInfo.ColumnImageList[headerInfo.ColumnImageList.Length] = class'BTUIResourcePoolHK'.default.gau_servers_status_back;
    headerInfo.ColumnImageList[headerInfo.ColumnImageList.Length] = class'BTUIResourcePoolHK'.default.gau_servers_status_gauge;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    ChannelToolTip = new class'BTRODecorateStringHK';
    ChannelToolTip.Init();
    ChannelToolTip.OriginalString.FontDrawType = 3;
    ChannelToolTip.InternalPadding[0] = 8;
    ChannelToolTip.InternalPadding[1] = 8;
    ChannelToolTip.InternalPadding[2] = 8;
    ChannelToolTip.InternalPadding[3] = 8;
    ChannelToolTip.bAutoWidth = true;
}

defaultproperties
{
    textLC2[0]="Good"
    textLC2[1]="Fine"
    textLC2[2]="Busy"
    textLC2[3]="Full"
}