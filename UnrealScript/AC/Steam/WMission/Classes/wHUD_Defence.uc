/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wHUD_Defence.uc
 * Package Imports:
 *	WMission
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:2
 *
 *******************************************************************************/
class wHUD_Defence extends wHUD_Mission
    config(User)
    transient;

var localized string strReactor;
var wDefenceObjective DefenceObject;
var SpriteWidget WGaugeBG;
var SpriteWidget WGauge;

event PostBeginPlay()
{
    local wDefenceObjective DObject;

    super.PostBeginPlay();
    // End:0x22
    foreach DynamicActors(class'wDefenceObjective', DObject)
    {
        DefenceObject = DObject;                
    }
}

function DrawHudPassA_Score(Canvas C)
{
    local CalCoordsW calW;
    local float fWidth, fProgressPct, X1, Y1, X2, Y2;

    local string strRound;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    X1 = 593.0 * _reX;
    Y1 = 16.0 * _reY;
    X2 = 613.0 * _reX;
    Y2 = 36.0 * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(strReactor, 1, X1, Y1, X2, Y2, int(float(10) * _reY));
    strRound = string(HudPart_DisplayEvent.CurrentRound) $ " / " $ string(Level.GRI.GoalScore);
    X1 = 682.0 * _reX;
    Y1 = 70.0 * _reY;
    X2 = 702.0 * _reX;
    Y2 = 90.0 * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(strRound, 1, X1, Y1, X2, Y2, int(float(15) * _reY));
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinateEx(C, WGaugeBG, float(WGaugeBG.TextureCoords.X2), float(WGaugeBG.TextureCoords.Y2), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGaugeBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    fProgressPct = DefenceObject.GetObjectiveProgress();
    fWidth = 544.0 * fProgressPct;
    CalculateCoordinateEx(C, WGauge, fWidth, float(WGauge.TextureCoords.Y2), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGauge.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL * fProgressPct, calW.VL);
    HudPart_DisplayEvent.DrawDFScore(C);
}

defaultproperties
{
    WGaugeBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_reactorHP_bg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=828,Y2=97),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=456,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGauge=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_reactorHP_hpbar',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=544,Y2=26),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=582,OffsetY=40,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    bDrawRoundResult=true
}