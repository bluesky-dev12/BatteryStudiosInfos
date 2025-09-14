class BTACLServerSelectionHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var int ConnectedUser;
var int MaxUser;
var bool bShowCount;
var string CurrentServerGroup;
var export editinline BTACLServerSelectionHK SelChannel;
var() localized string textChobo;
var() localized string textServerSlash;
var() localized string textChannel;
var() localized string textLC2[4];
//var delegate<OnEnterChannel> __OnEnterChannel__Delegate;

function float GetItemHeight(Canvas C)
{
    return 28.0000000;
    //return;    
}

function LC1_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    C.DrawColor.R = byte(255);
    C.DrawColor.G = byte(255);
    C.DrawColor.B = byte(255);
    // End:0xC7
    if((selectIndex == row) && MultiColumnList.bMousePress == false)
    {
        i = 1;
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);        
    }
    else
    {
        // End:0xED
        if(MultiColumnList.bMousePress && selectIndex == row)
        {            
        }
        else
        {
            // End:0x14C
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
    Class'Engine.BTCustomDrawHK'.static.DrawStringPadding(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 0.0396825, 0.0000000, 0.0000000, 0.0000000, Data.Text[i].DrawShadowColor);
    // End:0x29F
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() != false)
    {
        // End:0x29F
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
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, textLC2[j], Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 51, 0, 0, 2, Data.Text[i].DrawShadowColor);
    // End:0x451
    if(bShowCount || bool(PlayerOwner().ConsoleCommand("SHOWUSERCOUNT")))
    {
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, (string(ACLRowList[row].DataPerColumn[5].IntValue) $ "/") $ string(ACLRowList[row].DataPerColumn[5].tempValue), 3, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
        ConnectedUser = 0;
        MaxUser = 0;
        i = 0;
        J0x377:

        // End:0x3D7 [Loop If]
        if(i < ACLRowList.Length)
        {
            ConnectedUser += ACLRowList[i].DataPerColumn[5].IntValue;
            MaxUser += ACLRowList[i].DataPerColumn[5].tempValue;
            i++;
            // [Loop Continue]
            goto J0x377;
        }
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, (string(ConnectedUser) $ "/") $ string(MaxUser), 3, float(Data.Text[i].FontSize), R + float(10), t, R + float(510), B, Data.Text[i].DrawShadowColor);
    }
    //return;    
}

function LC3_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i, j;
    local float perc, ColOffset;

    Class'Engine.BTCustomDrawHK'.static.DrawImagePaddingOffset(C, self.ACLHeaderList[1].ColumnImageList[0], L + float(51), t, L + float(102), B, 0, 9, 0, 9);
    perc = float(Data.IntValue) / float(Data.tempValue);
    // End:0x99
    if(perc >= 1.0000000)
    {
        perc = 1.0000000;
        ColOffset = 1.0000000;        
    }
    else
    {
        // End:0xBE
        if(perc < 0.1000000)
        {
            perc = 0.1000000;
            ColOffset = 0.0000000;
        }
    }
    C.DrawColor.R = byte(255);
    C.DrawColor.G = byte(255);
    C.DrawColor.B = byte(255);
    C.DrawColor.A = byte(255);
    // End:0x18A
    if(perc >= 0.9000000)
    {
        C.DrawColor.R = 213;
        C.DrawColor.G = 15;
        C.DrawColor.B = 0;
        C.DrawColor.A = byte(255);        
    }
    else
    {
        // End:0x1F6
        if(perc >= 0.6000000)
        {
            C.DrawColor.R = 213;
            C.DrawColor.G = 129;
            C.DrawColor.B = 129;
            C.DrawColor.A = byte(255);            
        }
        else
        {
            // End:0x25F
            if(perc >= 0.3000000)
            {
                C.DrawColor.R = 204;
                C.DrawColor.G = 204;
                C.DrawColor.B = 204;
                C.DrawColor.A = byte(255);
            }
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImageScaleAllAndPaddingOffsetAndClipping(C, self.ACLHeaderList[1].ColumnImageList[1], L + float(51), t, L + float(102), B, 2, 12, 2, 12, 0.0000000, 0.0000000, perc, 1.0000000);
    i = 0;
    // End:0x2E4
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x2FA
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
    if(perc >= 0.9000000)
    {
        j = 3;
        Data.Text[i].DrawColor.R = 213;
        Data.Text[i].DrawColor.G = 15;
        Data.Text[i].DrawColor.B = 0;
        Data.Text[i].DrawColor.A = byte(255);        
    }
    else
    {
        // End:0x4C1
        if(perc >= 0.6000000)
        {
            j = 2;
            Data.Text[i].DrawColor.R = 213;
            Data.Text[i].DrawColor.G = 129;
            Data.Text[i].DrawColor.B = 129;
            Data.Text[i].DrawColor.A = byte(255);            
        }
        else
        {
            // End:0x54D
            if(perc >= 0.3000000)
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
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, textLC2[j], Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 0, 0, 0, 2, Data.Text[i].DrawShadowColor);
    // End:0x7B6
    if(bShowCount || bool(PlayerOwner().ConsoleCommand("SHOWUSERCOUNT")))
    {
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, (string(ACLRowList[row].DataPerColumn[5].IntValue) $ "/") $ string(ACLRowList[row].DataPerColumn[5].tempValue), 3, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
        ConnectedUser = 0;
        MaxUser = 0;
        i = 0;
        J0x6DC:

        // End:0x73C [Loop If]
        if(i < ACLRowList.Length)
        {
            ConnectedUser += ACLRowList[i].DataPerColumn[5].IntValue;
            MaxUser += ACLRowList[i].DataPerColumn[5].tempValue;
            i++;
            // [Loop Continue]
            goto J0x6DC;
        }
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, (string(ConnectedUser) $ "/") $ string(MaxUser), 3, float(Data.Text[i].FontSize), R + float(10), t, R + float(510), B, Data.Text[i].DrawShadowColor);
    }
    //return;    
}

delegate OnEnterChannel(BTACLServerSelectionHK acl)
{
    //return;    
}

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
    fb.X1 = 1006.0000000;
    fb.Y1 = 114.0000000;
    fb.X2 = 1018.0000000;
    fb.Y2 = 394.0000000;
    MultiColumnList.NoVisibleCols = 1;
    MultiColumnList.NoVisibleRows = 4;
    MultiColumnList.MyScrollBar.AWinPos = fb;
    MultiColumnList.__OnDblClick__Delegate = MultiColumnList_OnDblClick;
    MultiColumnList.__OnClick__Delegate = Sel_ChannelClick;
    ruii = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.newlist_Channel_on;
    ruii2 = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.newlist_Channel_Focus;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.ClickImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.newlist_Channel_cli;
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("server_name", 650.0000000 - float(272), 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("ping", 180.0000000, 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw;
    headerInfo.ColumnImageList[headerInfo.ColumnImageList.Length] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.gau_servers_status_back;
    headerInfo.ColumnImageList[headerInfo.ColumnImageList.Length] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.gau_servers_status_gauge;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    //return;    
}

defaultproperties
{
    textLC2[0]="Good"
    textLC2[1]="Fine"
    textLC2[2]="Busy"
    textLC2[3]="Full"
}