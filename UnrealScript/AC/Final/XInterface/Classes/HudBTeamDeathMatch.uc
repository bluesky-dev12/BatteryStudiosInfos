class HudBTeamDeathMatch extends HudBDeathMatch
    transient;

var() NumericWidget ScoreTeam[2];
var() NumericWidget totalLinks;
var() NumericWidget Score;
var() SpriteWidget LTeamHud[3];
var() SpriteWidget RTeamHud[3];
var() SpriteWidget TeamSymbols[2];
var() int Links;
var() Color CarrierTextColor1;
var() Color CarrierTextColor2;
var() Color CarrierTextColor3;
var() string CarriersName;
var() string CarriersLocation;
var() float CNPosX;
var() float CNPosY;
var localized string LinkEstablishedMessage;

simulated function DrawSpectatingHud(Canvas C)
{
    super.DrawSpectatingHud(C);
    // End:0x4D
    if(((PlayerOwner == none) || PlayerOwner.PlayerReplicationInfo == none) || !PlayerOwner.PlayerReplicationInfo.bOnlySpectator)
    {
        return;
    }
    UpdateRankAndSpread(C);
    ShowTeamScorePassA(C);
    ShowTeamScorePassC(C);
    UpdateTeamHud();
    //return;    
}

simulated function Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    // End:0x49
    if(Links > 0)
    {
        TeamLinked = true;
        pulseWidget(DeltaTime, 255.0000000, 0.0000000, RHud2[3], TeamIndex, 1, 2000.0000000);        
    }
    else
    {
        TeamLinked = false;
        RHud2[3].Tints[TeamIndex].A = byte(255);
    }
    //return;    
}

simulated function showLinks()
{
    Links = 0;
    //return;    
}

simulated function drawLinkText(Canvas C)
{
    Text = LinkEstablishedMessage;
    C.Font = LoadLevelActionFont();
    C.DrawColor = LevelActionFontColor;
    C.DrawColor = LevelActionFontColor;
    C.Style = 5;
    C.DrawScreenText(Text, 1.0000000, 0.8100000, 4);
    //return;    
}

simulated function UpdateRankAndSpread(Canvas C)
{
    //return;    
}

simulated function DrawHudPassA(Canvas C)
{
    super.DrawHudPassA(C);
    UpdateRankAndSpread(C);
    ShowTeamScorePassA(C);
    // End:0x5A
    if(bShowWeaponInfo)
    {
        // End:0x4A
        if(Links > 0)
        {
            DrawNumericWidget(C, totalLinks, DigitsBig);
        }
        totalLinks.Value = Links;
    }
    //return;    
}

simulated function ShowTeamScorePassA(Canvas C)
{
    // End:0x77
    if(bShowPoints)
    {
        DrawSpriteWidget(C, LTeamHud[2]);
        DrawSpriteWidget(C, LTeamHud[1]);
        DrawSpriteWidget(C, LTeamHud[0]);
        DrawSpriteWidget(C, RTeamHud[2]);
        DrawSpriteWidget(C, RTeamHud[1]);
        DrawSpriteWidget(C, RTeamHud[0]);
    }
    //return;    
}

simulated function ShowTeamScorePassC(Canvas C)
{
    // End:0x85
    if(bShowPoints)
    {
        // End:0x2D
        if(TeamSymbols[0].WidgetTexture != none)
        {
            DrawSpriteWidget(C, TeamSymbols[0]);
        }
        // End:0x51
        if(TeamSymbols[1].WidgetTexture != none)
        {
            DrawSpriteWidget(C, TeamSymbols[1]);
        }
        TeamScoreOffset();
        DrawNumericWidget(C, ScoreTeam[0], DigitsBig);
        DrawNumericWidget(C, ScoreTeam[1], DigitsBig);
    }
    //return;    
}

simulated function TeamScoreOffset()
{
    ScoreTeam[1].OffsetX = 80;
    // End:0x31
    if(ScoreTeam[1].Value < 0)
    {
        ScoreTeam[1].OffsetX += 90;
    }
    // End:0x5A
    if(Abs(float(ScoreTeam[1].Value)) > float(9))
    {
        ScoreTeam[1].OffsetX += 90;
    }
    //return;    
}

simulated function ShowPersonalScore(Canvas C)
{
    DrawNumericWidget(C, Score, DigitsBig);
    //return;    
}

simulated function DrawHudPassC(Canvas C)
{
    super.DrawHudPassC(C);
    // End:0x21
    if(Links > 0)
    {
        drawLinkText(C);
    }
    // End:0x35
    if(bShowPoints)
    {
        ShowPersonalScore(C);
    }
    ShowTeamScorePassC(C);
    //return;    
}

simulated function UpdateTeamHud()
{
    local GameReplicationInfo GRI;
    local int i;

    Score.Value = Min(CurScore, 999);
    GRI = PlayerOwner.GameReplicationInfo;
    // End:0x38
    if(GRI == none)
    {
        return;
    }
    i = 0;
    J0x3F:

    // End:0xA9 [Loop If]
    if(i < 2)
    {
        // End:0x68
        if(GRI.Teams[i] == none)
        {
            // [Explicit Continue]
            goto J0x9F;
        }
        ScoreTeam[i].Value = Min(int(GRI.Teams[i].Score), 999);
        J0x9F:

        i++;
        // [Loop Continue]
        goto J0x3F;
    }
    //return;    
}

simulated function UpdateHUD()
{
    UpdateTeamHud();
    showLinks();
    super.UpdateHUD();
    //return;    
}

defaultproperties
{
    ScoreTeam[0]=(RenderStyle=5,MinDigitCount=2,TextureScale=0.2400000,DrawPivot=3,PosX=0.5000000,PosY=0.0100000,OffsetX=-150,OffsetY=80,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    ScoreTeam[1]=(RenderStyle=5,MinDigitCount=2,TextureScale=0.2400000,DrawPivot=7,PosX=0.5000000,PosY=0.0100000,OffsetX=120,OffsetY=80,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    totalLinks=(RenderStyle=5,MinDigitCount=2,TextureScale=0.2000000,DrawPivot=3,PosX=1.0000000,PosY=0.8350000,OffsetX=-30,OffsetY=90,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    Score=(RenderStyle=5,MinDigitCount=2,TextureScale=0.1800000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=560,OffsetY=40,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    TeamSymbols[0]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=256,Y2=256),TextureScale=0.1000000,DrawPivot=2,PosX=0.5000000,PosY=0.0100000,OffsetX=-60,OffsetY=60,ScaleMode=0,Scale=0.0000000,Tints=(R=255,G=100,B=100,A=200),Tints[1]=(R=255,G=32,B=32,A=200))
    TeamSymbols[1]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=256,Y2=256),TextureScale=0.1000000,DrawPivot=0,PosX=0.5000000,PosY=0.0100000,OffsetX=90,OffsetY=60,ScaleMode=0,Scale=0.0000000,Tints=(R=0,G=128,B=255,A=200),Tints[1]=(R=32,G=210,B=255,A=200))
    CarrierTextColor1=(R=255,G=255,B=0,A=255)
    CarrierTextColor2=(R=0,G=255,B=0,A=255)
    CarrierTextColor3=(R=200,G=200,B=200,A=255)
    CNPosX=0.0100000
    CNPosY=0.0100000
    LinkEstablishedMessage="Link Settings"
}