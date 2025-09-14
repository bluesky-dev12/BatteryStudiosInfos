/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\wHudPart_DisplayQuest.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:10
 *	Functions:11
 *
 *******************************************************************************/
class wHudPart_DisplayQuest extends wHudPart_DisplayBase
    transient;

struct SQuest
{
    var int iCurProgress;
    var int imaxProgress;
    var float fStartTime;
    var float fEndTime;
    var float fLifeTime;
    var bool bDraw;
    var string MissionDesc;
    var bool bPlaySound;
};

var array<SQuest> aMessageList;
var() SpriteWidget WSBBG3;
var() SpriteWidget WMarkExclamation;
var float fLifeTime;
var float fFontSize;
var localized string temp1;
var localized string Temp2;
var float LTPosX;
var float LTPosY;
var wMatchMaker kMM;

function Initialize(HudBase myOwner, LevelInfo Level)
{
    super.Initialize(myOwner, Level);
    kMM = Level.GetMatchMaker();
    kMM.__AccomplishMission25Percent__Delegate = ReceivedAccomplishMission25Percent;
    kMM.__AccomplishMission50Percent__Delegate = ReceivedAccomplishMission50Percent;
    kMM.__AccomplishMission75Percent__Delegate = ReceivedAccomplishMission75Percent;
    kMM.__AccomplishMission100Percent__Delegate = ReceivedAccomplishMission100Percent;
    aMessageList.Length = 0;
}

function DrawHudPassA(Canvas C)
{
    DrawProgress(C);
}

function DrawProgress(Canvas C)
{
    local int lp1;
    local SQuest sMessage1;
    local array<string> outMessage;
    local float sx, sy, LineGapY, fProgressPct;
    local CalCoordsW calW;
    local string resultText;

    // End:0x0e
    if(aMessageList.Length < 1)
    {
        return;
    }
    sx = LTPosX;
    sy = LTPosY;
    LineGapY = 20.0;
    WSBBG3.OffsetX = int(sx);
    WSBBG3.OffsetY = int(sy);
    CalculateCoordinateEx(C, WSBBG3, 260.0, 72.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    sMessage1.MissionDesc = aMessageList[0].MissionDesc;
    sMessage1.iCurProgress = aMessageList[0].iCurProgress;
    sMessage1.imaxProgress = aMessageList[0].imaxProgress;
    resultText = sMessage1.MissionDesc $ "(" $ string(sMessage1.iCurProgress) $ "/" $ string(sMessage1.imaxProgress) $ ")";
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    class'BTCustomDrawHK'.static.SplitTextBounds(C, outMessage, resultText, int(fFontSize * _reY), 248.0 * _reX);
    lp1 = 0;
    J0x1a0:
    // End:0x251 [While If]
    if(lp1 < outMessage.Length)
    {
        C.BtrDrawTextJustifiedWithVolumeLine(outMessage[lp1], 0, sx + float(6) * _reX, sy + LineGapY * float(lp1) + float(6) * _reY, sx + float(254) * _reX, sy + LineGapY * float(lp1) + float(19) * _reY, int(fFontSize * _reY), color_Shadow);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x1a0;
    }
    fProgressPct = float(sMessage1.iCurProgress) / float(sMessage1.imaxProgress);
    DrawGauge(C, fProgressPct, sx, sy);
    // End:0x308
    if(aMessageList[0].bDraw && aMessageList[0].fEndTime < Level.TimeSeconds)
    {
        aMessageList.Remove(0, 1);
        // End:0x308
        if(aMessageList.Length > 0)
        {
            aMessageList[0].bDraw = true;
            aMessageList[0].fEndTime = aMessageList[0].fLifeTime + Level.TimeSeconds;
        }
    }
    // End:0x33d
    if(!aMessageList[0].bPlaySound)
    {
        class'wMessage_Quest'.static.PlaySoundMessageQuest(PlayerOwner);
        aMessageList[0].bPlaySound = true;
    }
}

function DrawSpectating(Canvas C)
{
    // End:0x1f
    if(Level.GRI != none)
    {
        DrawProgress(C);
    }
}

function DrawGauge(Canvas C, float fProgressPct, float PosX, float PosY)
{
    local CalCoordsW calW;
    local float fWidth;

    WRespawnBG.OffsetX = int(PosX + float(7));
    WRespawnBG.OffsetY = int(PosY + float(49));
    CalculateCoordinateEx(C, WRespawnBG, 246.0, 16.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WRespawnBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WRespawnGauge.OffsetX = int(PosX + float(9));
    WRespawnGauge.OffsetY = int(PosY + float(51));
    fWidth = 242.0 * fProgressPct;
    CalculateCoordinateEx(C, WRespawnGauge, fWidth, 12.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WRespawnGauge.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL * fProgressPct, calW.VL);
    WMarkExclamation.OffsetX = int(PosX + float(265));
    WMarkExclamation.OffsetY = int(PosY + float(0));
    CalculateCoordinateEx(C, WMarkExclamation, 128.0, 128.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WMarkExclamation.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

function bool HasMessage()
{
    // End:0x0e
    if(aMessageList.Length > 0)
    {
        return true;
    }
    return false;
}

function ReceivedAccomplishMission25Percent(string MissionDesc, int cur, int Max)
{
    Log("[wHudPart_DisplayQuest::AccomplishMission25Percent] MissionDesc=" $ MissionDesc $ "(" $ string(cur) $ "/" $ string(Max) $ ")");
    PushMessage(MissionDesc, cur, Max);
    // End:0xac
    if(kMM.InGamePlaying == true)
    {
        PlayHUDSound(HudOwner.PlayerOwner, 3);
    }
}

function ReceivedAccomplishMission50Percent(string MissionDesc, int cur, int Max)
{
    Log("[wHudPart_DisplayQuest::AccomplishMission50Percent] MissionDesc=" $ MissionDesc $ "(" $ string(cur) $ "/" $ string(Max) $ ")");
    PushMessage(MissionDesc, cur, Max);
    // End:0xac
    if(kMM.InGamePlaying == true)
    {
        PlayHUDSound(HudOwner.PlayerOwner, 3);
    }
}

function ReceivedAccomplishMission75Percent(string MissionDesc, int cur, int Max)
{
    Log("[wHudPart_DisplayQuest::AccomplishMission75Percent] MissionDesc=" $ MissionDesc $ "(" $ string(cur) $ "/" $ string(Max) $ ")");
    PushMessage(MissionDesc, cur, Max);
    // End:0xac
    if(kMM.InGamePlaying == true)
    {
        PlayHUDSound(HudOwner.PlayerOwner, 3);
    }
}

function ReceivedAccomplishMission100Percent(string MissionDesc, int cur, int Max)
{
    Log("[wHudPart_DisplayQuest::AccomplishMission100Percent] MissionDesc=" $ MissionDesc $ "(" $ string(cur) $ "/" $ string(Max) $ ")");
    PushMessage(MissionDesc, cur, Max);
    // End:0xad
    if(kMM.InGamePlaying == true)
    {
        PlayHUDSound(HudOwner.PlayerOwner, 3);
    }
}

function PushMessage(string MissionDesc, int cur, int Max)
{
    local SQuest message1;

    message1.MissionDesc = MissionDesc;
    message1.iCurProgress = cur;
    message1.imaxProgress = Max;
    message1.bDraw = false;
    message1.fLifeTime = fLifeTime;
    aMessageList[aMessageList.Length] = message1;
    // End:0x9c
    if(aMessageList.Length == 1)
    {
        aMessageList[0].bDraw = true;
        aMessageList[0].fEndTime = fLifeTime + Level.TimeSeconds;
    }
}

defaultproperties
{
    WSBBG3=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.hud_back_3',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=32),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=119,OffsetY=116,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WMarkExclamation=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_exclamation_b',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=128),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=24,OffsetY=341,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    fLifeTime=6.50
    fFontSize=15.0
    LTPosX=15.0
    LTPosY=290.0
    WRespawnBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.gauge_HUD_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=32),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=22,OffsetY=339,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WRespawnGauge=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.gauge_HUD_n',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=32),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=24,OffsetY=341,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
}