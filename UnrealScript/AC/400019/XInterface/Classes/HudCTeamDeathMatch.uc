class HudCTeamDeathMatch extends HudCDeathmatch
    transient
    config(User);

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
    // End:0x4D
    if(((PlayerOwner == none) || PlayerOwner.PlayerReplicationInfo == none) || !PlayerOwner.PlayerReplicationInfo.bOnlySpectator)
    {
        return;
    }
    UpdateRankAndSpread(C);
    UpdateTeamHud();
    //return;    
}

simulated function Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    // End:0x21
    if(Links > 0)
    {
        TeamLinked = true;        
    }
    else
    {
        TeamLinked = false;
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

simulated function DrawTeamOverlay(Canvas C)
{
    //return;    
}

simulated function DrawMyScore(Canvas C)
{
    //return;    
}

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
    //return;    
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
        // End:0xD9
        if(TeamSymbols[0].WidgetTexture != none)
        {
            DrawSpriteWidget(C, TeamSymbols[0]);
        }
        // End:0xFD
        if(TeamSymbols[1].WidgetTexture != none)
        {
            DrawSpriteWidget(C, TeamSymbols[1]);
        }
        ShowVersusIcon(C);
    }
    //return;    
}

simulated function ShowVersusIcon(Canvas C)
{
    DrawSpriteWidget(C, VersusSymbol);
    //return;    
}

simulated function ShowTeamScorePassC(Canvas C)
{
    //return;    
}

simulated function TeamScoreOffset()
{
    //return;    
}

simulated function DrawHudPassC(Canvas C)
{
    super.DrawHudPassC(C);
    ShowTeamScorePassC(C);
    //return;    
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

    // End:0xB4 [Loop If]
    if(i < 2)
    {
        // End:0x51
        if(GRI.Teams[i] == none)
        {
            // [Explicit Continue]
            goto J0xAA;
        }
        TeamSymbols[i].Tints[i] = HudColorTeam[i];
        ScoreTeam[i].Value = Min(int(GRI.Teams[i].Score), 999);
        J0xAA:

        i++;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

function updateScore()
{
    local GameReplicationInfo GRI;
    local PlayerReplicationInfo PRI;
    local int iTeamIndex;

    GRI = PlayerOwner.GameReplicationInfo;
    PRI = PlayerOwner.PlayerReplicationInfo;
    // End:0x42
    if((GRI == none) || PRI == none)
    {
        return;
    }
    // End:0x76
    if(PRI.Team != none)
    {
        iTeamIndex = PRI.Team.TeamIndex;        
    }
    else
    {
        iTeamIndex = 0;
    }
    SetDigitsScore(int(GRI.Teams[0].Score), iTeamIndex == 0, int(GRI.Teams[1].Score), iTeamIndex == 1, GRI.GoalScore, 0);
    //return;    
}

simulated function UpdateHUD()
{
    UpdateTeamHud();
    showLinks();
    super.UpdateHUD();
    //return;    
}

function bool CustomHUDColorAllowed()
{
    return false;
    //return;    
}

defaultproperties
{
    TeamSymbols[0]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=256,Y2=256),TextureScale=0.1000000,DrawPivot=2,PosX=0.5000000,PosY=0.0000000,OffsetX=-200,OffsetY=45,ScaleMode=0,Scale=0.0000000,Tints=(R=255,G=100,B=100,A=200),Tints[1]=(R=255,G=32,B=32,A=200))
    TeamSymbols[1]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=256,Y2=256),TextureScale=0.1000000,DrawPivot=0,PosX=0.5000000,PosY=0.0000000,OffsetX=200,OffsetY=45,ScaleMode=0,Scale=0.0000000,Tints=(R=0,G=128,B=255,A=200),Tints[1]=(R=32,G=210,B=255,A=200))
    CarrierTextColor1=(R=255,G=255,B=0,A=255)
    CarrierTextColor2=(R=0,G=255,B=0,A=255)
    CarrierTextColor3=(R=200,G=200,B=200,A=255)
    CNPosX=0.0100000
    CNPosY=0.0100000
    LinkEstablishedMessage="Link Settings"
    bShowTimer1=false
    bShowTimer2NotScoreD=true
}