class wHUD_Defence extends wHUD_Mission
    transient
    config(User);

var localized string strReactor;
var wDefenceObjective DefenceObject;
var SpriteWidget WGaugeBG;
var SpriteWidget WGauge;

event PostBeginPlay()
{
    local wDefenceObjective DObject;

    super.PostBeginPlay();
    // End:0x22
    foreach DynamicActors(Class'WMission_Decompressed.wDefenceObjective', DObject)
    {
        DefenceObject = DObject;        
    }    
    //return;    
}

function DrawHudPassA_Score(Canvas C)
{
    local CalCoordsW calW;
    local float fWidth, fProgressPct, X1, Y1, X2, Y2;

    local string strRound;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    X1 = 593.0000000 * _reX;
    Y1 = 16.0000000 * _reY;
    X2 = 613.0000000 * _reX;
    Y2 = 36.0000000 * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(strReactor, 1, X1, Y1, X2, Y2, int(float(10) * _reY));
    strRound = (string(HudPart_DisplayEvent.CurrentRound) $ " / ") $ string(Level.GRI.GoalScore);
    X1 = 682.0000000 * _reX;
    Y1 = 70.0000000 * _reY;
    X2 = 702.0000000 * _reX;
    Y2 = 90.0000000 * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(strRound, 1, X1, Y1, X2, Y2, int(float(15) * _reY));
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinateEx(C, WGaugeBG, float(WGaugeBG.TextureCoords.X2), float(WGaugeBG.TextureCoords.Y2), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGaugeBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    fProgressPct = DefenceObject.GetObjectiveProgress();
    fWidth = 544.0000000 * fProgressPct;
    CalculateCoordinateEx(C, WGauge, fWidth, float(WGauge.TextureCoords.Y2), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGauge.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL * fProgressPct, calW.VL);
    HudPart_DisplayEvent.DrawDFScore(C);
    //return;    
}

defaultproperties
{
    strReactor="HP ??????????????"
    WGaugeBG=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_pve_reactorHP_bg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=828,Y2=97),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=456,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGauge=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_pve_reactorHP_hpbar',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=544,Y2=26),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=582,OffsetY=40,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    bDrawRoundResult=false
}