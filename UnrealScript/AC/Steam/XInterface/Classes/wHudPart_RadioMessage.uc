/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\wHudPart_RadioMessage.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:10
 *	Functions:8
 *
 *******************************************************************************/
class wHudPart_RadioMessage extends wHudPart_DisplayBase
    transient;

enum ERMType
{
    ERMT_SELLECT,
    ERMT_COMMAND,
    ERMT_STATEMENT,
    ERMT_RESPON,
    ERMT_NONE
};

var wHudPart_RadioMessage.ERMType eRadioType;
var SpriteWidget WKeyBtnRadionMessage;
var SpriteWidget WHudBack1;
var SpriteWidget WHudBack2;
var string sKeyActive[10];
var localized string lsRadioMessage;
var localized string lsRadioMessageType[4];
var localized string lsCommond[10];
var localized string lsStatement[8];
var localized string lsRespon[9];

function Initialize(HudBase myOwner, LevelInfo Level)
{
    super.Initialize(myOwner, Level);
}

function UpdateHelpKeyControll()
{
    // End:0x47
    if(HudOwner.PlayerOwner.Player == none && HudOwner.PlayerOwner.Player.GUIController == none)
    {
        return;
    }
    GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("ShowRadioMessage", keys, LocalizedKeys);
    GetKeyTexture(keys[0], WKeyBtnRadionMessage);
}

function CallRadioMessage(optional int iKey, optional int iReservation1, optional int iReservation2)
{
    // End:0x99
    if(0 == eRadioType)
    {
        switch(iKey)
        {
            // End:0x3f
            case 1:
                eRadioType = 1;
                HudOwner.PlayerOwner.iRadioMessageType = 1;
                // End:0x96
                break;
            // End:0x69
            case 2:
                eRadioType = 2;
                HudOwner.PlayerOwner.iRadioMessageType = 2;
                // End:0x96
                break;
            // End:0x93
            case 3:
                eRadioType = 3;
                HudOwner.PlayerOwner.iRadioMessageType = 3;
                // End:0x96
                break;
            // End:0xffff
            default:
                // End:0xcd Break;
                break;
            }
    }
    // End:0xcd
    if(1 == eRadioType || 2 == eRadioType || 3 == eRadioType)
    {
    }
    // End:0x13a
    if(0 == iKey || 999 == iReservation1)
    {
        eRadioType = 4;
        HudOwner.PlayerOwner.iRadioMessageType = 0;
        HudCDeathmatch(HudOwner).byShowRadioMessage = 0;
        HudOwner.PlayerOwner.bToggleRadioMessage = false;
    }
}

function ResetRadioMessage()
{
    eRadioType = 4;
    HudOwner.PlayerOwner.iRadioMessageType = 0;
    HudCDeathmatch(HudOwner).byShowRadioMessage = 0;
    HudOwner.PlayerOwner.bToggleRadioMessage = false;
}

function DrawA(Canvas C)
{
    C.Style = 5;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    switch(eRadioType)
    {
        // End:0x53
        case 0:
            DrawRadioMessage(C, 4, 185, lsRadioMessage);
            // End:0xba
            break;
        // End:0x74
        case 1:
            DrawRadioMessage(C, 10, 401, lsRadioMessageType[0]);
            // End:0xba
            break;
        // End:0x95
        case 2:
            DrawRadioMessage(C, 8, 329, lsRadioMessageType[1]);
            // End:0xba
            break;
        // End:0xb7
        case 3:
            DrawRadioMessage(C, 9, 365, lsRadioMessageType[2]);
            // End:0xba
            break;
        // End:0xffff
        default:
}

function SetRadioType(wHudPart_RadioMessage.ERMType _ERMType)
{
    eRadioType = _ERMType;
}

function wHudPart_RadioMessage.ERMType GetRadioType()
{
    return eRadioType;
}

function DrawRadioMessage(Canvas C, int iMessage, int iHeight, string sMessage)
{
    local CalCoordsW calW;
    local float X1, X2, Y1, Y2;
    local int i;

    WHudBack1.OffsetX = 0;
    WHudBack1.OffsetY = 326;
    CalculateCoordinateEx(C, WHudBack1, 309.0, float(iHeight), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTileStretched(WHudBack1.WidgetTexture, calW.XL, calW.YL);
    WHudBack1.OffsetX = 0;
    WHudBack1.OffsetY = 326;
    CalculateCoordinateEx(C, WHudBack1, 309.0, 39.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTileStretched(WHudBack1.WidgetTexture, calW.XL, calW.YL);
    X1 = 0.0;
    Y1 = 326.0 * _reY;
    X2 = 309.0 * _reX;
    Y2 = 365.0 * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(sMessage, 1, X1, Y1, X2, Y2, int(float(17) * _reY));
    i = 0;
    J0x197:
    // End:0x456 [While If]
    if(i < iMessage)
    {
        X1 = 34.0 * _reX;
        Y1 = 373.0 + float(i * 36) * _reY;
        X2 = 71.0 * _reX;
        Y2 = 394.0 + float(i * 36) * _reY;
        C.SetDrawColor(245, 243, 169, byte(255));
        // End:0x270
        if(i == iMessage - 1)
        {
            C.BtrDrawTextJustifiedWithVolumeLine(sKeyActive[9], 1, X1, Y1, X2, Y2, int(float(15) * _reY));
        }
        // End:0x2ad
        else
        {
            C.BtrDrawTextJustifiedWithVolumeLine(sKeyActive[i], 1, X1, Y1, X2, Y2, int(float(15) * _reY));
        }
        X1 = 131.0 * _reX;
        Y1 = 373.0 + float(i * 36) * _reY;
        X2 = 297.0 * _reX;
        Y2 = 394.0 + float(i * 36) * _reY;
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        switch(eRadioType)
        {
            // End:0x37a
            case 0:
                C.BtrDrawTextJustifiedWithVolumeLine(lsRadioMessageType[i], 0, X1, Y1, X2, Y2, int(float(15) * _reY));
                // End:0x44c
                break;
            // End:0x3bf
            case 1:
                C.BtrDrawTextJustifiedWithVolumeLine(lsCommond[i], 0, X1, Y1, X2, Y2, int(float(15) * _reY));
                // End:0x44c
                break;
            // End:0x404
            case 2:
                C.BtrDrawTextJustifiedWithVolumeLine(lsStatement[i], 0, X1, Y1, X2, Y2, int(float(15) * _reY));
                // End:0x44c
                break;
            // End:0x449
            case 3:
                C.BtrDrawTextJustifiedWithVolumeLine(lsRespon[i], 0, X1, Y1, X2, Y2, int(float(15) * _reY));
                // End:0x44c
                break;
            // End:0xffff
            default:
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x197;
            }
}

defaultproperties
{
    eRadioType=4
    WHudBack1=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.hud_back_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=32),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=328,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHudBack2=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.hud_back_2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=32),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=121,OffsetY=150,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    sKeyActive[0]="1"
    sKeyActive[1]="2"
    sKeyActive[2]="3"
    sKeyActive[3]="4"
    sKeyActive[4]="5"
    sKeyActive[5]="6"
    sKeyActive[6]="7"
    sKeyActive[7]="8"
    sKeyActive[8]="9"
    sKeyActive[9]="ESC"
    lsRadioMessage="Radio Message"
    lsRadioMessageType[0]="Command"
    lsRadioMessageType[1]="Alert"
    lsRadioMessageType[2]="Reply"
    lsRadioMessageType[3]="Close Window"
    lsCommond[0]="Point A"
    lsCommond[1]="Point B"
    lsCommond[2]="Point C"
    lsCommond[3]="Order: Attack"
    lsCommond[4]="Order: Defend"
    lsCommond[5]="Order: Standby"
    lsCommond[6]="Order: Retreat"
    lsCommond[7]="Order: Regroup"
    lsCommond[8]="Order: Spread Out"
    lsCommond[9]="Close Window"
    lsStatement[0]="Enemy sighted"
    lsStatement[1]="Enemy sniper"
    lsStatement[2]="Requesting support"
    lsStatement[3]="Area secure"
    lsStatement[4]="Move it"
    lsStatement[5]="Attack the chopper"
    lsStatement[6]="Found supplies"
    lsStatement[7]="Close Window"
    lsRespon[0]="Roger"
    lsRespon[1]="Reject"
    lsRespon[2]="Apologize"
    lsRespon[3]="In position"
    lsRespon[4]="Moving to position"
    lsRespon[5]="Praise ally"
    lsRespon[6]="Criticize ally"
    lsRespon[7]="Provoke enemy"
    lsRespon[8]="Close Window"
}