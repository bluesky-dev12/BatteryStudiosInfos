/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTTRoomInfoHKCN.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Properties:24
 *	Functions:5
 *
 *******************************************************************************/
class BTTTRoomInfoHKCN extends RenderObject;

var bool bBotMode;
var bool bOverlapControl;
var localized string strGameState[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify int FontTitleSize;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify int FontSize;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify int FontMapNameSize;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Color FontTitleColor;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Color FontColor;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Color FontShadowColor;
var Image BackgroundImage;
var Image MapImage;
var array<Image> SupplyImage;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTitle;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbGameState;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbMapName;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbMapImage;
var FloatBox fbHeader[6];
var FloatBox fbData[6];
var localized string strHeader[6];
var string strTitle;
var string strCurGameState;
var string strMapName;
var string strData[6];
var int SelectedIndex;

function Init()
{
    local int i;

    BackgroundImage = class'BTUIResourcePoolHK'.default.panel_3;
    MapImage = class'BTCustomDrawHK'.static.MakeImage(256, 153, 28, none);
    i = 0;
    J0x3a:
    // End:0x134 [While If]
    if(i < 6)
    {
        fbHeader[i].X1 = 774.0;
        fbHeader[i].Y1 = 377.0 + float(i * 22);
        fbHeader[i].X2 = 841.0;
        fbHeader[i].Y2 = 390.0 + float(i * 22);
        fbData[i].X1 = 848.0;
        fbData[i].Y1 = 377.0 + float(i * 22);
        fbData[i].X2 = 1024.0;
        fbData[i].Y2 = 390.0 + float(i * 22);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3a;
    }
    SelectedIndex = -1;
}

function ChangeSelectedIndex(int i)
{
    SelectedIndex = i;
}

function SetData(string RoomName, int GameState, string MapName, Material MapImg, array<Material> supplyImg, string roommaster, string GameMode, string Weapon, string HardCore, string gamerunning, optional bool bBotMode, optional string CurMaxUser)
{
    local int i;

    strTitle = RoomName;
    strCurGameState = strGameState[GameState];
    strMapName = MapName;
    MapImage.Image = MapImg;
    strData[0] = roommaster;
    strData[1] = HardCore;
    strData[2] = GameMode;
    strData[3] = Weapon;
    strData[4] = CurMaxUser;
    strData[5] = strGameState[GameState];
    self.bBotMode = bBotMode;
    SupplyImage.Length = supplyImg.Length;
    i = 0;
    J0xb5:
    // End:0xfb [While If]
    if(i < SupplyImage.Length)
    {
        SupplyImage[i] = class'BTCustomDrawHK'.static.MakeImage(24, 24, 2, supplyImg[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xb5;
    }
}

function bool Render(Canvas C, optional float Delta)
{
    local int i;
    local float X, Y, X2, Y2;

    // End:0x13
    if(super.Render(C) == false)
    {
        return false;
    }
    C.Style = 5;
    X = AWinPos.X1;
    Y = AWinPos.Y1;
    X2 = AWinPos.X2;
    Y2 = AWinPos.Y2;
    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, X, Y, X2, Y2);
    class'BTCustomDrawHK'.static.DrawImage(C, MapImage, X + fbMapImage.X1, Y + fbMapImage.Y1, X + fbMapImage.X2, Y + fbMapImage.Y2);
    i = 0;
    J0xf5:
    // End:0x195 [While If]
    if(i < SupplyImage.Length)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, SupplyImage[i], X + fbMapImage.X1, Y + fbMapImage.Y1 + float(5), X + fbMapImage.X2 - float(5 * i + 1) - float(24 * i), Y + fbMapImage.Y2);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf5;
    }
    C.DrawColor = FontColor;
    i = 0;
    J0x1b0:
    // End:0x378 [While If]
    if(i < 6)
    {
        // End:0x25c
        if(i == 2 && bBotMode)
        {
            class'BTCustomDrawHK'.static.DrawString(C, strHeader[5], 0, float(FontSize), X + fbHeader[i].X1, Y + fbHeader[i].Y1, X + fbHeader[i].X2, Y + fbHeader[i].Y2, FontShadowColor);
        }
        // End:0x2e5
        else
        {
            class'BTCustomDrawHK'.static.DrawString(C, strHeader[i], 0, float(FontSize), X + fbHeader[i].X1, Y + fbHeader[i].Y1, X + fbHeader[i].X2, Y + fbHeader[i].Y2, FontShadowColor);
        }
        class'BTCustomDrawHK'.static.DrawString(C, strData[i], 0, float(FontSize), X + fbData[i].X1, Y + fbData[i].Y1, X + fbData[i].X2, Y + fbData[i].Y2, FontShadowColor);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1b0;
    }
    class'BTCustomDrawHK'.static.DrawString(C, strMapName, 0, float(FontMapNameSize), X + fbMapName.X1, Y + fbMapName.Y1, X + fbMapName.X2, Y + fbMapName.Y2, FontShadowColor);
    C.DrawColor = FontTitleColor;
    class'BTCustomDrawHK'.static.DrawString(C, strTitle, 0, float(FontTitleSize), X + fbTitle.X1, Y + fbTitle.Y1, X + fbTitle.X2, Y + fbTitle.Y2, FontShadowColor);
    return true;
}

function bool RenderFixed(Canvas C, optional float Delta)
{
    local int i;
    local float X, Y, X2, Y2;

    // End:0x13
    if(Render(C) == false)
    {
        return false;
    }
    C.Style = 5;
    X = 765.0;
    Y = 207.0;
    X2 = 1022.0;
    Y2 = 360.0;
    class'BTCustomDrawHK'.static.DrawImage(C, MapImage, X, Y, X2, Y2);
    i = 0;
    J0x84:
    // End:0x116 [While If]
    if(i < SupplyImage.Length)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, SupplyImage[i], X2 - SupplyImage[i].width + float(5) * float(i + 1), 210.0, X2 - float(5) + float(i) * SupplyImage[i].width, 235.0);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x84;
    }
    C.DrawColor = FontColor;
    i = 0;
    J0x131:
    // End:0x2a5 [While If]
    if(i < 6)
    {
        // End:0x1c1
        if(i == 2 && bBotMode)
        {
            class'BTCustomDrawHK'.static.DrawString(C, strHeader[5], 0, float(FontSize), fbHeader[i].X1, fbHeader[i].Y1, fbHeader[i].X2, fbHeader[i].Y2, FontShadowColor);
        }
        // End:0x22e
        else
        {
            class'BTCustomDrawHK'.static.DrawString(C, strHeader[i], 0, float(FontSize), fbHeader[i].X1, fbHeader[i].Y1, fbHeader[i].X2, fbHeader[i].Y2, FontShadowColor);
        }
        class'BTCustomDrawHK'.static.DrawString(C, strData[i], 0, float(FontSize), fbData[i].X1, fbData[i].Y1, fbData[i].X2, fbData[i].Y2, FontShadowColor);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x131;
    }
    class'BTCustomDrawHK'.static.DrawString(C, strMapName, 0, float(FontMapNameSize), fbMapName.X1, fbMapName.Y1, fbMapName.X2, fbMapName.Y2, FontShadowColor);
    C.DrawColor = FontTitleColor;
    class'BTCustomDrawHK'.static.DrawString(C, strTitle, 0, float(FontTitleSize), fbTitle.X1, fbTitle.Y1, fbTitle.X2, fbTitle.Y2, FontShadowColor);
    return true;
}

defaultproperties
{
    strGameState[0]="Standby"
    strGameState[1]="In Game"
    FontTitleSize=11
    FontSize=9
    FontMapNameSize=10
    FontTitleColor=(R=255,G=140,B=63,A=255)
    FontColor=(R=229,G=229,B=229,A=255)
    FontShadowColor=(R=0,G=0,B=0,A=255)
    fbTitle=(X1=774.0,Y1=185.0,X2=1024.0,Y2=198.0)
    fbGameState=(X1=460.0,Y1=27.0,X2=533.0,Y2=62.0)
    fbMapName=(X1=774.0,Y1=217.0,X2=903.0,Y2=230.0)
    fbMapImage=(X1=30.0,Y1=46.0,X2=271.0,Y2=226.0)
    strHeader[0]="Host"
    strHeader[1]="Team Balance"
    strHeader[2]="Mode"
    strHeader[3]="Sub Mode"
    strHeader[4]="Players"
    strHeader[5]="Status"
}