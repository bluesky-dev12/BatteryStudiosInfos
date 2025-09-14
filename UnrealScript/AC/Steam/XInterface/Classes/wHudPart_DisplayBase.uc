/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\wHudPart_DisplayBase.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Properties:30
 *	Functions:4
 *
 *******************************************************************************/
class wHudPart_DisplayBase extends HudBase
    transient;

enum eKeySpecial
{
    EKS_SHIFT,
    EKS_ALT,
    EKS_CTRL,
    EKS_SPACE,
    EKS_LMOUSE,
    EKS_RMOUSE,
    EKS_WMOUSE
};

enum eKeyAlphabet
{
    EKA_A,
    EKA_B,
    EKA_C,
    EKA_D,
    EKA_E,
    EKA_F,
    EKA_G,
    EKA_H,
    EKA_I,
    EKA_J,
    EKA_K,
    EKA_L,
    EKA_M,
    EKA_N,
    EKA_O,
    EKA_P,
    EKA_Q,
    EKA_R,
    EKA_S,
    EKA_T,
    EKA_U,
    EKA_V,
    EKA_W,
    EKA_X,
    EKA_Y,
    EKA_Z
};

var HudBase HudOwner;
var wMapInfo mapInfo;
var float MaxAlpha;
var float MinAlpha;
var localized string lsScore;
var localized string lsRanking;
var Color color_Default;
var Color color_Orange;
var Color color_Shadow;
var() SpriteWidget WKeyButtonBGSmall;
var() SpriteWidget WKeyButtonBGSmallBlink;
var() SpriteWidget WKeyButtonBG;
var() SpriteWidget WKeyButtonBGBlink;
var() SpriteWidget WKeyButtonBGBig;
var() SpriteWidget WKeyButtonBGBigBlink;
var() SpriteWidget HelpKeyButtonNumber[10];
var() SpriteWidget HelpKeyButtonAlphaBet[26];
var() SpriteWidget HelpKeyButtonSpecial[37];
var() SpriteWidget HelpKeyButtonFunction[13];
var() SpriteWidget HelpKeyButtonNone;
var() SpriteWidget WRespawnBG;
var() SpriteWidget WRespawnGauge;
var array<string> keys;
var array<string> LocalizedKeys;
var string sKeyBtnHeli;
var string sKeyBtnAirStrike;
var string sKeyBtnUAV;
var string skeyUseKey;
var string skeyWeaponReload;
var string skeyBtnC4;

function Initialize(HudBase myOwner, LevelInfo Level)
{
    HudOwner = myOwner;
    HudOwner.AddChildHudPart(self);
    mapInfo = Level.GetMatchMaker().MapSettings.GetMapInfo(Level.GetMatchMaker().szMapName);
}

function bool GetKeyTexture(string sKey, out SpriteWidget W, optional out float fWidth, optional float OffsetX)
{
    local SpriteWidget WTemp;
    local bool bSpecialKey;

    WTemp.PosX = W.PosX;
    WTemp.PosY = W.PosY;
    // End:0x49
    if(OffsetX == float(0))
    {
        OffsetX = float(W.OffsetX);
    }
    WTemp.OffsetX = int(OffsetX);
    WTemp.OffsetY = W.OffsetY;
    W.WidgetTexture = none;
    switch(sKey)
    {
        // End:0x99
        case "0":
            W = HelpKeyButtonNumber[0];
            // End:0x28a
            break;
        // End:0xaf
        case "1":
            W = HelpKeyButtonNumber[1];
            // End:0x28a
            break;
        // End:0xc6
        case "2":
            W = HelpKeyButtonNumber[2];
            // End:0x28a
            break;
        // End:0xdd
        case "3":
            W = HelpKeyButtonNumber[3];
            // End:0x28a
            break;
        // End:0xf4
        case "4":
            W = HelpKeyButtonNumber[4];
            // End:0x28a
            break;
        // End:0x10b
        case "5":
            W = HelpKeyButtonNumber[5];
            // End:0x28a
            break;
        // End:0x122
        case "6":
            W = HelpKeyButtonNumber[6];
            // End:0x28a
            break;
        // End:0x139
        case "7":
            W = HelpKeyButtonNumber[7];
            // End:0x28a
            break;
        // End:0x150
        case "8":
            W = HelpKeyButtonNumber[8];
            // End:0x28a
            break;
        // End:0x167
        case "9":
            W = HelpKeyButtonNumber[9];
            // End:0x28a
            break;
        // End:0x183
        case "Numpad0":
            W = HelpKeyButtonNumber[0];
            // End:0x28a
            break;
        // End:0x19f
        case "Numpad1":
            W = HelpKeyButtonNumber[1];
            // End:0x28a
            break;
        // End:0x1bc
        case "Numpad2":
            W = HelpKeyButtonNumber[2];
            // End:0x28a
            break;
        // End:0x1d9
        case "Numpad3":
            W = HelpKeyButtonNumber[3];
            // End:0x28a
            break;
        // End:0x1f6
        case "Numpad4":
            W = HelpKeyButtonNumber[4];
            // End:0x28a
            break;
        // End:0x213
        case "Numpad5":
            W = HelpKeyButtonNumber[5];
            // End:0x28a
            break;
        // End:0x230
        case "Numpad6":
            W = HelpKeyButtonNumber[6];
            // End:0x28a
            break;
        // End:0x24d
        case "Numpad7":
            W = HelpKeyButtonNumber[7];
            // End:0x28a
            break;
        // End:0x26a
        case "Numpad8":
            W = HelpKeyButtonNumber[8];
            // End:0x28a
            break;
        // End:0x287
        case "Numpad9":
            W = HelpKeyButtonNumber[9];
            // End:0x28a
            break;
        // End:0xffff
        default:
            switch(sKey)
            {
                // End:0x2a7
                case "A":
                    W = HelpKeyButtonAlphaBet[0];
                    // End:0x4e8
                    break;
                // End:0x2bd
                case "B":
                    W = HelpKeyButtonAlphaBet[1];
                    // End:0x4e8
                    break;
                // End:0x2d4
                case "C":
                    W = HelpKeyButtonAlphaBet[2];
                    // End:0x4e8
                    break;
                // End:0x2eb
                case "D":
                    W = HelpKeyButtonAlphaBet[3];
                    // End:0x4e8
                    break;
                // End:0x302
                case "E":
                    W = HelpKeyButtonAlphaBet[4];
                    // End:0x4e8
                    break;
                // End:0x319
                case "F":
                    W = HelpKeyButtonAlphaBet[5];
                    // End:0x4e8
                    break;
                // End:0x330
                case "G":
                    W = HelpKeyButtonAlphaBet[6];
                    // End:0x4e8
                    break;
                // End:0x347
                case "H":
                    W = HelpKeyButtonAlphaBet[7];
                    // End:0x4e8
                    break;
                // End:0x35e
                case "I":
                    W = HelpKeyButtonAlphaBet[8];
                    // End:0x4e8
                    break;
                // End:0x375
                case "J":
                    W = HelpKeyButtonAlphaBet[9];
                    // End:0x4e8
                    break;
                // End:0x38c
                case "K":
                    W = HelpKeyButtonAlphaBet[10];
                    // End:0x4e8
                    break;
                // End:0x3a3
                case "L":
                    W = HelpKeyButtonAlphaBet[11];
                    // End:0x4e8
                    break;
                // End:0x3ba
                case "M":
                    W = HelpKeyButtonAlphaBet[12];
                    // End:0x4e8
                    break;
                // End:0x3d1
                case "N":
                    W = HelpKeyButtonAlphaBet[13];
                    // End:0x4e8
                    break;
                // End:0x3e8
                case "O":
                    W = HelpKeyButtonAlphaBet[14];
                    // End:0x4e8
                    break;
                // End:0x3ff
                case "P":
                    W = HelpKeyButtonAlphaBet[15];
                    // End:0x4e8
                    break;
                // End:0x416
                case "Q":
                    W = HelpKeyButtonAlphaBet[16];
                    // End:0x4e8
                    break;
                // End:0x42d
                case "R":
                    W = HelpKeyButtonAlphaBet[17];
                    // End:0x4e8
                    break;
                // End:0x444
                case "S":
                    W = HelpKeyButtonAlphaBet[18];
                    // End:0x4e8
                    break;
                // End:0x45b
                case "T":
                    W = HelpKeyButtonAlphaBet[19];
                    // End:0x4e8
                    break;
                // End:0x472
                case "U":
                    W = HelpKeyButtonAlphaBet[20];
                    // End:0x4e8
                    break;
                // End:0x489
                case "V":
                    W = HelpKeyButtonAlphaBet[21];
                    // End:0x4e8
                    break;
                // End:0x4a0
                case "W":
                    W = HelpKeyButtonAlphaBet[22];
                    // End:0x4e8
                    break;
                // End:0x4b7
                case "X":
                    W = HelpKeyButtonAlphaBet[23];
                    // End:0x4e8
                    break;
                // End:0x4ce
                case "Y":
                    W = HelpKeyButtonAlphaBet[24];
                    // End:0x4e8
                    break;
                // End:0x4e5
                case "Z":
                    W = HelpKeyButtonAlphaBet[25];
                    // End:0x4e8
                    break;
                // End:0xffff
                default:
                    switch(sKey)
                    {
                        // End:0x506
                        case "F1":
                            W = HelpKeyButtonFunction[1];
                            // End:0x614
                            break;
                        // End:0x51e
                        case "F2":
                            W = HelpKeyButtonFunction[2];
                            // End:0x614
                            break;
                        // End:0x536
                        case "F3":
                            W = HelpKeyButtonFunction[3];
                            // End:0x614
                            break;
                        // End:0x54e
                        case "F4":
                            W = HelpKeyButtonFunction[4];
                            // End:0x614
                            break;
                        // End:0x566
                        case "F5":
                            W = HelpKeyButtonFunction[5];
                            // End:0x614
                            break;
                        // End:0x57e
                        case "F6":
                            W = HelpKeyButtonFunction[6];
                            // End:0x614
                            break;
                        // End:0x596
                        case "F7":
                            W = HelpKeyButtonFunction[7];
                            // End:0x614
                            break;
                        // End:0x5ae
                        case "F8":
                            W = HelpKeyButtonFunction[8];
                            // End:0x614
                            break;
                        // End:0x5c6
                        case "F9":
                            W = HelpKeyButtonFunction[9];
                            // End:0x614
                            break;
                        // End:0x5df
                        case "F10":
                            W = HelpKeyButtonFunction[10];
                            // End:0x614
                            break;
                        // End:0x5f8
                        case "F11":
                            W = HelpKeyButtonFunction[11];
                            // End:0x614
                            break;
                        // End:0x611
                        case "F12":
                            W = HelpKeyButtonFunction[12];
                            // End:0x614
                            break;
                        // End:0xffff
                        default:
                            switch(sKey)
                            {
                                // End:0x63d
                                case "Shift":
                                    W = HelpKeyButtonSpecial[0];
                                    bSpecialKey = true;
                                    // End:0xa85
                                    break;
                                // End:0x65d
                                case "Alt":
                                    W = HelpKeyButtonSpecial[1];
                                    bSpecialKey = true;
                                    // End:0xa85
                                    break;
                                // End:0x67f
                                case "Ctrl":
                                    W = HelpKeyButtonSpecial[2];
                                    bSpecialKey = true;
                                    // End:0xa85
                                    break;
                                // End:0x6a2
                                case "Space":
                                    W = HelpKeyButtonSpecial[3];
                                    bSpecialKey = true;
                                    // End:0xa85
                                    break;
                                // End:0x6c3
                                case "ESC":
                                    W = HelpKeyButtonSpecial[7];
                                    bSpecialKey = true;
                                    // End:0xa85
                                    break;
                                // End:0x6e4
                                case "Tab":
                                    W = HelpKeyButtonSpecial[12];
                                    bSpecialKey = true;
                                    // End:0xa85
                                    break;
                                // End:0x707
                                case "Enter":
                                    W = HelpKeyButtonSpecial[13];
                                    bSpecialKey = true;
                                    // End:0xa85
                                    break;
                                // End:0x72d
                                case "CapsLock":
                                    W = HelpKeyButtonSpecial[14];
                                    bSpecialKey = true;
                                    // End:0xa85
                                    break;
                                // End:0x74c
                                case "LeftMouse":
                                    W = HelpKeyButtonSpecial[4];
                                    // End:0xa85
                                    break;
                                // End:0x76c
                                case "RightMouse":
                                    W = HelpKeyButtonSpecial[5];
                                    // End:0xa85
                                    break;
                                // End:0x78d
                                case "MiddleMouse":
                                    W = HelpKeyButtonSpecial[6];
                                    // End:0xa85
                                    break;
                                // End:0x7a9
                                case "Insert":
                                    W = HelpKeyButtonSpecial[15];
                                    // End:0xa85
                                    break;
                                // End:0x7c5
                                case "Delete":
                                    W = HelpKeyButtonSpecial[16];
                                    // End:0xa85
                                    break;
                                // End:0x7df
                                case "Home":
                                    W = HelpKeyButtonSpecial[17];
                                    // End:0xa85
                                    break;
                                // End:0x7f8
                                case "End":
                                    W = HelpKeyButtonSpecial[18];
                                    // End:0xa85
                                    break;
                                // End:0x814
                                case "PageUp":
                                    W = HelpKeyButtonSpecial[19];
                                    // End:0xa85
                                    break;
                                // End:0x832
                                case "PageDown":
                                    W = HelpKeyButtonSpecial[20];
                                    // End:0xa85
                                    break;
                                // End:0x850
                                case "GreyStar":
                                    W = HelpKeyButtonSpecial[21];
                                    // End:0xa85
                                    break;
                                // End:0x86e
                                case "GreyPlus":
                                    W = HelpKeyButtonSpecial[28];
                                    // End:0xa85
                                    break;
                                // End:0x88d
                                case "Separator":
                                    W = HelpKeyButtonSpecial[20];
                                    // End:0xa85
                                    break;
                                // End:0x8a8
                                case "Minus":
                                    W = HelpKeyButtonSpecial[22];
                                    // End:0xa85
                                    break;
                                // End:0x8c7
                                case "GreyMinus":
                                    W = HelpKeyButtonSpecial[22];
                                    // End:0xa85
                                    break;
                                // End:0x8e3
                                case "Period":
                                    W = HelpKeyButtonSpecial[30];
                                    // End:0xa85
                                    break;
                                // End:0x905
                                case "NumPadPeriod":
                                    W = HelpKeyButtonSpecial[30];
                                    // End:0xa85
                                    break;
                                // End:0x920
                                case "Slash":
                                    W = HelpKeyButtonSpecial[29];
                                    // End:0xa85
                                    break;
                                // End:0x93f
                                case "GreySlash":
                                    W = HelpKeyButtonSpecial[29];
                                    // End:0xa85
                                    break;
                                // End:0x959
                                case "Left":
                                    W = HelpKeyButtonSpecial[34];
                                    // End:0xa85
                                    break;
                                // End:0x971
                                case "Up":
                                    W = HelpKeyButtonSpecial[26];
                                    // End:0xa85
                                    break;
                                // End:0x98c
                                case "Right":
                                    W = HelpKeyButtonSpecial[27];
                                    // End:0xa85
                                    break;
                                // End:0x9a6
                                case "Down":
                                    W = HelpKeyButtonSpecial[33];
                                    // End:0xa85
                                    break;
                                // End:0x9c5
                                case "Semicolon":
                                    W = HelpKeyButtonSpecial[24];
                                    // End:0xa85
                                    break;
                                // End:0x9e1
                                case "Equals":
                                    W = HelpKeyButtonSpecial[32];
                                    // End:0xa85
                                    break;
                                // End:0x9fc
                                case "Comma":
                                    W = HelpKeyButtonSpecial[23];
                                    // End:0xa85
                                    break;
                                // End:0xa1d
                                case "LeftBracket":
                                    W = HelpKeyButtonSpecial[25];
                                    // End:0xa85
                                    break;
                                // End:0xa3c
                                case "Backslash":
                                    W = HelpKeyButtonSpecial[35];
                                    // End:0xa85
                                    break;
                                // End:0xa5e
                                case "RightBracket":
                                    W = HelpKeyButtonSpecial[36];
                                    // End:0xa85
                                    break;
                                // End:0xa7f
                                case "SingleQuote":
                                    W = HelpKeyButtonSpecial[31];
                                    // End:0xa85
                                    break;
                                // End:0xffff
                                default:
                                    // End:0xa85 Break;
                                    break;
                            }
                            switch(sKey)
                            {
                                // End:0xa94
                                case "":
                                    // End:0xa97
                                    break;
                                // End:0xffff
                                default:
                                    // End:0xab2
                                    if(W.WidgetTexture == none)
                                    {
                                        W = HelpKeyButtonNone;
                                    }
                                    W.PosX = WTemp.PosX;
                                    W.PosY = WTemp.PosY;
                                    W.OffsetY = WTemp.OffsetY;
                                    // End:0xb21
                                    if(bSpecialKey)
                                    {
                                        W.OffsetX = WTemp.OffsetX - 13;
                                        fWidth = 52.0;
                                    }
                                    // End:0xb41
                                    else
                                    {
                                        W.OffsetX = WTemp.OffsetX;
                                        fWidth = 26.0;
                                    }
                                    return true;
                            }
}

function string GetEllipsString(Canvas C, string strText, float fLimitWidth, float FontSize)
{
    local float rW, rH, textWidthLimit, ellipsisWidth, findWidth, tempH;

    local int i;
    local string temp;

    textWidthLimit = fLimitWidth;
    C.BtrTextSize(strText, int(FontSize), rW, rH);
    // End:0x11b
    if(rW > textWidthLimit)
    {
        C.BtrTextSize("...", int(FontSize), ellipsisWidth, tempH);
        i = 0;
        J0x6b:
        // End:0xd7 [While If]
        if(i < Len(strText))
        {
            temp = Mid(strText, 0, i);
            C.BtrTextSize(temp, int(FontSize), findWidth, tempH);
            // End:0xcd
            if(findWidth > textWidthLimit - ellipsisWidth)
            {
            }
            // End:0xd7
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x6b;
            }
        }
        // End:0x102
        if(i > 0)
        {
            temp = Mid(strText, 0, i - 1) $ "...";
        }
        // End:0x10d
        else
        {
            temp = "...";
        }
        rW = textWidthLimit;
    }
    // End:0x126
    else
    {
        temp = strText;
    }
    return temp;
}

function UpdateHelpKeyControll();

defaultproperties
{
    MaxAlpha=255.0
    MinAlpha=1.0
    lsScore="Points"
    lsRanking=" place"
    color_Default=(R=255,G=255,B=255,A=255)
    color_Orange=(R=255,G=153,B=0,A=255)
    color_Shadow=(R=0,G=0,B=0,A=200)
    WKeyButtonBGSmallBlink=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=476,Y1=78,X2=504,Y2=106),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=619,OffsetY=754,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKeyButtonBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=416,Y1=0,X2=468,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=619,OffsetY=754,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKeyButtonBGBlink=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=420,Y1=104,X2=476,Y2=160),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=619,OffsetY=754,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKeyButtonBGBig=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=312,Y1=0,X2=416,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=619,OffsetY=754,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKeyButtonBGBigBlink=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=312,Y1=104,X2=420,Y2=160),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=619,OffsetY=754,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonNumber[0]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=0,Y1=104,X2=26,Y2=130),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonNumber[1]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=26,Y1=104,X2=52,Y2=130),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonNumber[2]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=52,Y1=104,X2=78,Y2=130),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonNumber[3]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=78,Y1=104,X2=104,Y2=130),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonNumber[4]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=104,Y1=104,X2=130,Y2=130),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonNumber[5]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=130,Y1=104,X2=156,Y2=130),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonNumber[6]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=156,Y1=104,X2=182,Y2=130),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonNumber[7]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=182,Y1=104,X2=208,Y2=130),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonNumber[8]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=208,Y1=104,X2=234,Y2=130),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonNumber[9]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=234,Y1=104,X2=260,Y2=130),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[0]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=26,Y2=26),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[1]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=26,Y1=0,X2=52,Y2=26),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[2]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=52,Y1=0,X2=78,Y2=26),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=417,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[3]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=78,Y1=0,X2=104,Y2=26),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[4]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=104,Y1=0,X2=130,Y2=26),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[5]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=130,Y1=0,X2=156,Y2=26),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[6]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=156,Y1=0,X2=182,Y2=26),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=417,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[7]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=182,Y1=0,X2=208,Y2=26),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[8]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=208,Y1=0,X2=234,Y2=26),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[9]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=234,Y1=0,X2=260,Y2=26),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[10]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=0,Y1=26,X2=26,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=417,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[11]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=26,Y1=26,X2=52,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[12]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=52,Y1=26,X2=78,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[13]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=78,Y1=26,X2=104,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[14]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=104,Y1=26,X2=130,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=417,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[15]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=130,Y1=26,X2=156,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=417,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[16]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=156,Y1=26,X2=182,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[17]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=182,Y1=26,X2=208,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[18]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=208,Y1=26,X2=234,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[19]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=234,Y1=26,X2=260,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[20]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=0,Y1=52,X2=26,Y2=78),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[21]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=26,Y1=52,X2=52,Y2=78),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[22]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=52,Y1=52,X2=78,Y2=78),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=417,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[23]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=78,Y1=52,X2=104,Y2=78),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[24]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=104,Y1=52,X2=130,Y2=78),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonAlphaBet[25]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=130,Y1=52,X2=0,Y2=78),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=568,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[0]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=0,Y1=130,X2=52,Y2=156),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[1]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=52,Y1=130,X2=104,Y2=156),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[2]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=104,Y1=130,X2=156,Y2=156),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[3]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=0,Y1=156,X2=52,Y2=182),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[4]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=468,Y1=52,X2=494,Y2=78),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[5]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=468,Y1=26,X2=494,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[6]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=468,Y1=0,X2=494,Y2=26),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[7]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=104,Y1=156,X2=156,Y2=182),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[8]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=104,Y1=156,X2=156,Y2=182),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[9]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=416,Y1=52,X2=468,Y2=104),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[10]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=364,Y1=52,X2=416,Y2=104),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[11]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=312,Y1=52,X2=364,Y2=104),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[12]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=156,Y1=130,X2=208,Y2=156),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[13]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=208,Y1=130,X2=260,Y2=156),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[14]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=52,Y1=156,X2=104,Y2=182),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[15]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=156,Y1=156,X2=182,Y2=182),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[16]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=182,Y1=156,X2=208,Y2=182),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[17]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=208,Y1=156,X2=234,Y2=182),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[18]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=234,Y1=156,X2=260,Y2=182),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[19]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=26,Y1=182,X2=52,Y2=208),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[20]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=0,Y1=182,X2=26,Y2=208),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[21]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=260,Y1=26,X2=286,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[22]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=260,Y1=0,X2=286,Y2=26),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[23]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=260,Y1=52,X2=286,Y2=78),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[24]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=260,Y1=78,X2=286,Y2=104),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[25]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=260,Y1=104,X2=286,Y2=130),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[26]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=260,Y1=130,X2=286,Y2=156),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[27]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=260,Y1=156,X2=286,Y2=182),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[28]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=286,Y1=0,X2=312,Y2=26),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[29]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=286,Y1=26,X2=312,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[30]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=286,Y1=52,X2=312,Y2=78),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[31]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=286,Y1=78,X2=312,Y2=104),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[32]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=286,Y1=104,X2=312,Y2=130),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[33]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=286,Y1=130,X2=312,Y2=156),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[34]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=286,Y1=156,X2=312,Y2=182),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[35]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=208,Y1=78,X2=234,Y2=104),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonSpecial[36]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=234,Y1=78,X2=260,Y2=104),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=493,OffsetY=1173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonFunction[0]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=156,Y1=52,X2=156,Y2=78),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonFunction[1]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=156,Y1=52,X2=182,Y2=78),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonFunction[2]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=182,Y1=52,X2=208,Y2=78),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonFunction[3]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=208,Y1=52,X2=234,Y2=78),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonFunction[4]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=234,Y1=52,X2=260,Y2=78),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonFunction[5]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=0,Y1=78,X2=26,Y2=104),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonFunction[6]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=26,Y1=78,X2=52,Y2=104),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonFunction[7]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=52,Y1=78,X2=78,Y2=104),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonFunction[8]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=78,Y1=78,X2=104,Y2=104),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonFunction[9]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=104,Y1=78,X2=130,Y2=104),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonFunction[10]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=130,Y1=78,X2=156,Y2=104),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonFunction[11]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=156,Y1=78,X2=182,Y2=104),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonFunction[12]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=182,Y1=78,X2=156,Y2=104),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HelpKeyButtonNone=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Keyboard.img_keyboard',RenderStyle=5,TextureCoords=(X1=416,Y1=0,X2=468,Y2=52),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=167,OffsetY=-75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
}