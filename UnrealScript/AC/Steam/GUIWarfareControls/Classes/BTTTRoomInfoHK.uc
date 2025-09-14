/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTTRoomInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Properties:24
 *	Functions:5
 *
 *******************************************************************************/
class BTTTRoomInfoHK extends RenderObject;

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
var FloatBox fbHeader[5];
var FloatBox fbData[5];
var localized string strHeader[6];
var string strTitle;
var string strCurGameState;
var string strMapName;
var string strData[5];
var int SelectedIndex;

function Init()
{
    local int i;

    BackgroundImage = class'BTUIResourcePoolHK'.default.panel_3;
    MapImage = class'BTCustomDrawHK'.static.MakeImage(239, 178, 28, none);
    i = 0;
    J0x37:
    // End:0x137 [While If]
    if(i < 5)
    {
        fbHeader[i].X1 = 303.0;
        fbHeader[i].Y1 = 62.0 + float(34 * i);
        fbHeader[i].X2 = 390.0;
        fbHeader[i].Y2 = 62.0 + float(34 * i + 1);
        fbData[i].X1 = 390.0;
        fbData[i].Y1 = 62.0 + float(34 * i);
        fbData[i].X2 = 533.0;
        fbData[i].Y2 = 62.0 + float(34 * i + 1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    SelectedIndex = -1;
}

function ChangeSelectedIndex(int i)
{
    SelectedIndex = i;
}

function SetData(string RoomName, int GameState, string MapName, Material MapImg, array<Material> supplyImg, string roommaster, string GameMode, string Weapon, string HardCore, string gamerunning, optional bool bBotMode)
{
    local int i;

    strTitle = RoomName;
    strCurGameState = strGameState[GameState];
    strMapName = MapName;
    MapImage.Image = MapImg;
    strData[0] = roommaster;
    strData[1] = GameMode;
    strData[2] = Weapon;
    strData[3] = HardCore;
    strData[4] = strGameState[GameState];
    self.bBotMode = bBotMode;
    SupplyImage.Length = supplyImg.Length;
    i = 0;
    J0xa7:
    // End:0xed [While If]
    if(i < SupplyImage.Length)
    {
        SupplyImage[i] = class'BTCustomDrawHK'.static.MakeImage(24, 24, 2, supplyImg[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xa7;
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
    if(i < 5)
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
    X = 768.0;
    Y = 311.0;
    X2 = 1000.0;
    Y2 = 470.0;
    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, X, Y, X2, Y2);
    class'BTCustomDrawHK'.static.DrawImage(C, MapImage, X + fbMapImage.X1, Y + fbMapImage.Y1, X + fbMapImage.X2, Y + fbMapImage.Y2);
    i = 0;
    J0xe1:
    // End:0x181 [While If]
    if(i < SupplyImage.Length)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, SupplyImage[i], X + fbMapImage.X1, Y + fbMapImage.Y1 + float(5), X + fbMapImage.X2 - float(5 * i + 1) - float(24 * i), Y + fbMapImage.Y2);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xe1;
    }
    C.DrawColor = FontColor;
    i = 0;
    J0x19c:
    // End:0x364 [While If]
    if(i < 5)
    {
        // End:0x248
        if(i == 2 && bBotMode)
        {
            class'BTCustomDrawHK'.static.DrawString(C, strHeader[5], 0, float(FontSize), X + fbHeader[i].X1, Y + fbHeader[i].Y1, X + fbHeader[i].X2, Y + fbHeader[i].Y2, FontShadowColor);
        }
        // End:0x2d1
        else
        {
            class'BTCustomDrawHK'.static.DrawString(C, strHeader[i], 0, float(FontSize), X + fbHeader[i].X1, Y + fbHeader[i].Y1, X + fbHeader[i].X2, Y + fbHeader[i].Y2, FontShadowColor);
        }
        class'BTCustomDrawHK'.static.DrawString(C, strData[i], 0, float(FontSize), X + fbData[i].X1, Y + fbData[i].Y1, X + fbData[i].X2, Y + fbData[i].Y2, FontShadowColor);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x19c;
    }
    class'BTCustomDrawHK'.static.DrawString(C, strMapName, 0, float(FontMapNameSize), X + fbMapName.X1, Y + fbMapName.Y1, X + fbMapName.X2, Y + fbMapName.Y2, FontShadowColor);
    C.DrawColor = FontTitleColor;
    class'BTCustomDrawHK'.static.DrawString(C, strTitle, 0, float(FontTitleSize), X + fbTitle.X1, Y + fbTitle.Y1, X + fbTitle.X2, Y + fbTitle.Y2, FontShadowColor);
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
    fbTitle=(X1=30.0,Y1=25.0,X2=460.0,Y2=46.0)
    fbGameState=(X1=460.0,Y1=27.0,X2=533.0,Y2=62.0)
    fbMapName=(X1=35.0,Y1=51.0,X2=271.0,Y2=226.0)
    fbMapImage=(X1=30.0,Y1=46.0,X2=271.0,Y2=226.0)
    strHeader[0]="Host"
    strHeader[1]="Team Balance"
    strHeader[2]="Mode"
    strHeader[3]="Sub Mode"
    strHeader[4]="Players"
    strHeader[5]="Status"
}