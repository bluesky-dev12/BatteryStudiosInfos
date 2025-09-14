class wHudPart_RadioMessage extends wHudPart_DisplayBase
    transient;

enum ERMType
{
    ERMT_SELLECT,                   // 0
    ERMT_COMMAND,                   // 1
    ERMT_STATEMENT,                 // 2
    ERMT_RESPON,                    // 3
    ERMT_NONE                       // 4
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
    //return;    
}

function UpdateHelpKeyControll()
{
    // End:0x47
    if((HudOwner.PlayerOwner.Player == none) && HudOwner.PlayerOwner.Player.GUIController == none)
    {
        return;
    }
    GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("ShowRadioMessage", keys, LocalizedKeys);
    GetKeyTexture(keys[0], WKeyBtnRadionMessage);
    //return;    
}

function CallRadioMessage(optional int iKey, optional int iReservation1, optional int iReservation2)
{
    // End:0x99
    if(int(0) == int(eRadioType))
    {
        switch(iKey)
        {
            // End:0x3F
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
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        // End:0xCD
        if(((int(1) == int(eRadioType)) || int(2) == int(eRadioType)) || int(3) == int(eRadioType))
        {
        }
    }
    // End:0x13A
    if((0 == iKey) || 999 == iReservation1)
    {
        eRadioType = 4;
        HudOwner.PlayerOwner.iRadioMessageType = 0;
        HudCDeathmatch(HudOwner).byShowRadioMessage = 0;
        HudOwner.PlayerOwner.bToggleRadioMessage = false;
    }
    //return;    
}

function ResetRadioMessage()
{
    eRadioType = 4;
    HudOwner.PlayerOwner.iRadioMessageType = 0;
    HudCDeathmatch(HudOwner).byShowRadioMessage = 0;
    HudOwner.PlayerOwner.bToggleRadioMessage = false;
    //return;    
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
            // End:0xBA
            break;
        // End:0x74
        case 1:
            DrawRadioMessage(C, 10, 401, lsRadioMessageType[0]);
            // End:0xBA
            break;
        // End:0x95
        case 2:
            DrawRadioMessage(C, 8, 329, lsRadioMessageType[1]);
            // End:0xBA
            break;
        // End:0xB7
        case 3:
            DrawRadioMessage(C, 9, 365, lsRadioMessageType[2]);
            // End:0xBA
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function SetRadioType(wHudPart_RadioMessage.ERMType _ERMType)
{
    eRadioType = _ERMType;
    //return;    
}

function wHudPart_RadioMessage.ERMType GetRadioType()
{
    return eRadioType;
    //return;    
}

function DrawRadioMessage(Canvas C, int iMessage, int iHeight, string sMessage)
{
    local CalCoordsW calW;
    local float X1, X2, Y1, Y2;
    local int i;

    WHudBack1.OffsetX = 0;
    WHudBack1.OffsetY = 326;
    CalculateCoordinateEx(C, WHudBack1, 309.0000000, float(iHeight), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTileStretched(WHudBack1.WidgetTexture, calW.XL, calW.YL);
    WHudBack1.OffsetX = 0;
    WHudBack1.OffsetY = 326;
    CalculateCoordinateEx(C, WHudBack1, 309.0000000, 39.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTileStretched(WHudBack1.WidgetTexture, calW.XL, calW.YL);
    X1 = 0.0000000;
    Y1 = 326.0000000 * _reY;
    X2 = 309.0000000 * _reX;
    Y2 = 365.0000000 * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(sMessage, 1, X1, Y1, X2, Y2, int(float(17) * _reY));
    i = 0;
    J0x197:

    // End:0x456 [Loop If]
    if(i < iMessage)
    {
        X1 = 34.0000000 * _reX;
        Y1 = (373.0000000 + float(i * 36)) * _reY;
        X2 = 71.0000000 * _reX;
        Y2 = (394.0000000 + float(i * 36)) * _reY;
        C.SetDrawColor(245, 243, 169, byte(255));
        // End:0x270
        if(i == (iMessage - 1))
        {
            C.BtrDrawTextJustifiedWithVolumeLine(sKeyActive[9], 1, X1, Y1, X2, Y2, int(float(15) * _reY));            
        }
        else
        {
            C.BtrDrawTextJustifiedWithVolumeLine(sKeyActive[i], 1, X1, Y1, X2, Y2, int(float(15) * _reY));
        }
        X1 = 131.0000000 * _reX;
        Y1 = (373.0000000 + float(i * 36)) * _reY;
        X2 = 297.0000000 * _reX;
        Y2 = (394.0000000 + float(i * 36)) * _reY;
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        switch(eRadioType)
        {
            // End:0x37A
            case 0:
                C.BtrDrawTextJustifiedWithVolumeLine(lsRadioMessageType[i], 0, X1, Y1, X2, Y2, int(float(15) * _reY));
                // End:0x44C
                break;
            // End:0x3BF
            case 1:
                C.BtrDrawTextJustifiedWithVolumeLine(lsCommond[i], 0, X1, Y1, X2, Y2, int(float(15) * _reY));
                // End:0x44C
                break;
            // End:0x404
            case 2:
                C.BtrDrawTextJustifiedWithVolumeLine(lsStatement[i], 0, X1, Y1, X2, Y2, int(float(15) * _reY));
                // End:0x44C
                break;
            // End:0x449
            case 3:
                C.BtrDrawTextJustifiedWithVolumeLine(lsRespon[i], 0, X1, Y1, X2, Y2, int(float(15) * _reY));
                // End:0x44C
                break;
            // End:0xFFFF
            default:
                break;
        }
        i++;
        // [Loop Continue]
        goto J0x197;
    }
    //return;    
}

defaultproperties
{
    eRadioType=4
    WHudBack1=(WidgetTexture=Texture'Warfare_UI_HUD.Common.hud_back_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=32),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=328,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHudBack2=(WidgetTexture=Texture'Warfare_UI_HUD.Common.hud_back_2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=32),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=121,OffsetY=150,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
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
    lsRadioMessage="??? ???"
    lsRadioMessageType[0]="??"
    lsRadioMessageType[1]="??"
    lsRadioMessageType[2]="??"
    lsRadioMessageType[3]="???"
    lsCommond[0]="A ??"
    lsCommond[1]="B ??"
    lsCommond[2]="C ??"
    lsCommond[3]="????"
    lsCommond[4]="????"
    lsCommond[5]="????"
    lsCommond[6]="????"
    lsCommond[7]="????"
    lsCommond[8]="????"
    lsCommond[9]="???"
    lsStatement[0]="????"
    lsStatement[1]="??? ??"
    lsStatement[2]="????"
    lsStatement[3]="????"
    lsStatement[4]="?? ???"
    lsStatement[5]="??????"
    lsStatement[6]="??? ??"
    lsStatement[7]="???"
    lsRespon[0]="???"
    lsRespon[1]="????"
    lsRespon[2]="????"
    lsRespon[3]="?? ?? ??"
    lsRespon[4]="?? ??? ???"
    lsRespon[5]="?? ??"
    lsRespon[6]="?? ??"
    lsRespon[7]="?? ??"
    lsRespon[8]="???"
}