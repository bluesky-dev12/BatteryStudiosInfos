/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\HudCTeamDeathMatch.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:16
 *	Functions:17
 *
 *******************************************************************************/
class HudCTeamDeathMatch extends HudCDeathmatch
    config(User)
    transient;

var() NumericWidget ScoreTeam[2];
var() NumericWidget totalLinks;
var() SpriteWidget VersusSymbol;
var() SpriteWidget TeamScoreBackGround[2];
var() SpriteWidget TeamScoreBackGroundDisc[2];
var() SpriteWidget LinkIcon;
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
    // End:0x4d
    if(PlayerOwner == none || PlayerOwner.PlayerReplicationInfo == none || !PlayerOwner.PlayerReplicationInfo.bOnlySpectator)
    {
        return;
    }
    UpdateRankAndSpread(C);
    UpdateTeamHud();
}

simulated function Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    // End:0x21
    if(Links > 0)
    {
        TeamLinked = true;
    }
    // End:0x29
    else
    {
        TeamLinked = false;
    }
}

simulated function showLinks()
{
    Links = 0;
}

simulated function drawLinkText(Canvas C)
{
    Text = LinkEstablishedMessage;
    C.Font = LoadLevelActionFont();
    C.DrawColor = LevelActionFontColor;
    C.DrawColor = LevelActionFontColor;
    C.Style = 5;
    C.DrawScreenText(Text, 1.0, 0.810, 4);
}

simulated function UpdateRankAndSpread(Canvas C);
simulated function DrawTeamOverlay(Canvas C);
simulated function DrawMyScore(Canvas C);
simulated function DrawHudPassA(Canvas C)
{
    super.DrawHudPassA(C);
    UpdateRankAndSpread(C);
    // End:0x31
    if(Links > 0)
    {
        DrawSpriteWidget(C, LinkIcon);
    }
    totalLinks.Value = Links;
}

simulated function ShowTeamScorePassA(Canvas C)
{
    // End:0x108
    if(bShowPoints)
    {
        DrawSpriteWidget(C, TeamScoreBackGround[0]);
        DrawSpriteWidget(C, TeamScoreBackGround[1]);
        DrawSpriteWidget(C, TeamScoreBackGroundDisc[0]);
        DrawSpriteWidget(C, TeamScoreBackGroundDisc[1]);
        TeamScoreBackGround[0].Tints[TeamIndex] = HudColorBlack;
        TeamScoreBackGround[0].Tints[TeamIndex].A = 150;
        TeamScoreBackGround[1].Tints[TeamIndex] = HudColorBlack;
        TeamScoreBackGround[1].Tints[TeamIndex].A = 150;
        // End:0xd9
        if(TeamSymbols[0].WidgetTexture != none)
        {
            DrawSpriteWidget(C, TeamSymbols[0]);
        }
        // End:0xfd
        if(TeamSymbols[1].WidgetTexture != none)
        {
            DrawSpriteWidget(C, TeamSymbols[1]);
        }
        ShowVersusIcon(C);
    }
}

simulated function ShowVersusIcon(Canvas C)
{
    DrawSpriteWidget(C, VersusSymbol);
}

simulated function ShowTeamScorePassC(Canvas C);
simulated function TeamScoreOffset();
simulated function DrawHudPassC(Canvas C)
{
    super.DrawHudPassC(C);
    ShowTeamScorePassC(C);
}

simulated function UpdateTeamHud()
{
    local GameReplicationInfo GRI;
    local int i;

    GRI = PlayerOwner.GameReplicationInfo;
    // End:0x21
    if(GRI == none)
    {
        return;
    }
    i = 0;
    J0x28:
    // End:0xb4 [While If]
    if(i < 2)
    {
        // End:0x51
        if(GRI.Teams[i] == none)
        {
        }
        // End:0xaa
        else
        {
            TeamSymbols[i].Tints[i] = HudColorTeam[i];
            ScoreTeam[i].Value = Min(int(GRI.Teams[i].Score), 999);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x28;
    }
}

function updateScore()
{
    local GameReplicationInfo GRI;
    local PlayerReplicationInfo PRI;
    local int iTeamIndex;

    GRI = PlayerOwner.GameReplicationInfo;
    PRI = PlayerOwner.PlayerReplicationInfo;
    // End:0x42
    if(GRI == none || PRI == none)
    {
        return;
    }
    // End:0x76
    if(PRI.Team != none)
    {
        iTeamIndex = PRI.Team.TeamIndex;
    }
    // End:0x7d
    else
    {
        iTeamIndex = 0;
    }
    SetDigitsScore(int(GRI.Teams[0].Score), iTeamIndex == 0, int(GRI.Teams[1].Score), iTeamIndex == 1, GRI.GoalScore, 0);
}

simulated function UpdateHUD()
{
    UpdateTeamHud();
    showLinks();
    super.UpdateHUD();
}

function bool CustomHUDColorAllowed()
{
    return false;
}

defaultproperties
{
    TeamSymbols[0]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=256,Y2=256),TextureScale=0.10,DrawPivot=2,PosX=0.50,PosY=0.0,OffsetX=-200,OffsetY=45,ScaleMode=0,Scale=0.0,Tints=(R=255,G=100,B=100,A=200),Tints[1]=(R=255,G=32,B=32,A=200))
    TeamSymbols[1]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=256,Y2=256),TextureScale=0.10,DrawPivot=0,PosX=0.50,PosY=0.0,OffsetX=200,OffsetY=45,ScaleMode=0,Scale=0.0,Tints=(R=0,G=128,B=255,A=200),Tints[1]=(R=32,G=210,B=255,A=200))
    CarrierTextColor1=(R=255,G=255,B=0,A=255)
    CarrierTextColor2=(R=0,G=255,B=0,A=255)
    CarrierTextColor3=(R=200,G=200,B=200,A=255)
    CNPosX=0.010
    CNPosY=0.010
    LinkEstablishedMessage="Link Settings"
    bShowTimer1=true
    bShowTimer2NotScoreD=true
}