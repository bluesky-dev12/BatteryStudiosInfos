class ScoreBoardDeathMatch extends ScoreBoard
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const MaxPlayers = 32;

var() localized string RankText;
var() localized string PlayerText;
var() localized string PointsText;
var() localized string TimeText;
var() localized string PingText;
var() localized string PLText;
var() localized string DeathsText;
var() localized string AdminText;
var() localized string NetText;
var() localized string FooterText;
var localized string MatchIDText;
var localized string OutText;
var localized string OutFireText;
var localized string ReadyText;
var localized string NotReadyText;
var localized string SkillLevel[8];
var PlayerReplicationInfo PRIArray[32];
var float FPHTime;
var() localized string MaxLives;
var() localized string FragLimit;
var() localized string FPH;
var() localized string GameType;
var() localized string MapName;
var() localized string Restart;
var() localized string Continue;
var() localized string Ended;
var() localized string TimeLimit;
var() localized string Spacer;
var() Material BoxMaterial;

simulated function UpdatePrecacheMaterials()
{
    UpdatePrecacheFonts();
    //return;    
}

function UpdatePrecacheFonts()
{
    //return;    
}

function DrawTitle(Canvas Canvas, float HeaderOffsetY, float PlayerAreaY, float PlayerBoxSizeY)
{
    local string titlestring, scoreinfostring, RestartString;
    local float TitleXL, ScoreInfoXL, YL;

    // End:0x1C
    if(Canvas.ClipX < float(512))
    {
        return;
    }
    titlestring = GetTitleString();
    scoreinfostring = GetDefaultScoreInfoString();
    Canvas.StrLen(titlestring, TitleXL, YL);
    Canvas.DrawColor = HudClass.default.GoldColor;
    // End:0x9A
    if(UnrealPlayer(Owner).bDisplayLoser)
    {
        scoreinfostring = Class'XInterface_Decompressed.HudBase'.default.YouveLostTheMatch;        
    }
    else
    {
        // End:0xC8
        if(UnrealPlayer(Owner).bDisplayWinner)
        {
            scoreinfostring = Class'XInterface_Decompressed.HudBase'.default.YouveWonTheMatch;            
        }
        else
        {
            // End:0x19A
            if(PlayerController(Owner).IsDead())
            {
                RestartString = GetRestartString();
                // End:0x18F
                if(((Canvas.ClipY - HeaderOffsetY) - PlayerAreaY) >= (2.5000000 * YL))
                {
                    Canvas.StrLen(RestartString, ScoreInfoXL, YL);
                    Canvas.SetPos(0.5000000 * (Canvas.ClipX - ScoreInfoXL), Canvas.ClipY - (2.5000000 * YL));
                    Canvas.DrawText(RestartString, true);                    
                }
                else
                {
                    scoreinfostring = RestartString;
                }
            }
        }
    }
    Canvas.StrLen(scoreinfostring, ScoreInfoXL, YL);
    Canvas.SetPos(0.5000000 * (Canvas.ClipX - TitleXL), ((HeaderOffsetY - PlayerBoxSizeY) - YL) * 0.5000000);
    Canvas.DrawText(titlestring, true);
    Canvas.SetPos(0.5000000 * (Canvas.ClipX - ScoreInfoXL), Canvas.ClipY - (1.5000000 * YL));
    Canvas.DrawText(scoreinfostring, true);
    //return;    
}

function string GetTitleString()
{
    local string titlestring;

    // End:0x99
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        // End:0x6C
        if(Level.Game.CurrentGameProfile != none)
        {
            titlestring = SkillLevel[Clamp(int(Level.Game.CurrentGameProfile.BaseDifficulty), 0, 7)];            
        }
        else
        {
            titlestring = SkillLevel[Clamp(int(Level.Game.GameDifficulty), 0, 7)];
        }        
    }
    else
    {
        // End:0xD9
        if((GRI != none) && GRI.BotDifficulty >= 0)
        {
            titlestring = SkillLevel[Clamp(GRI.BotDifficulty, 0, 7)];
        }
    }
    return ((titlestring @ GRI.GameName) $ MapName) $ Level.Title;
    //return;    
}

function string GetRestartString()
{
    local string RestartString;

    RestartString = Restart;
    // End:0x39
    if(PlayerController(Owner).PlayerReplicationInfo.bOutOfLives)
    {
        RestartString = OutFireText;        
    }
    else
    {
        // End:0x79
        if((Level.TimeSeconds - UnrealPlayer(Owner).LastKickWarningTime) < float(2))
        {
            RestartString = Class'Engine.GameMessage'.default.KickWarning;
        }
    }
    return RestartString;
    //return;    
}

function string GetDefaultScoreInfoString()
{
    local string scoreinfostring;

    // End:0x0E
    if(GRI == none)
    {
        return "";
    }
    // End:0x42
    if(GRI.MaxLives != 0)
    {
        scoreinfostring = MaxLives @ string(GRI.MaxLives);        
    }
    else
    {
        // End:0x73
        if(GRI.GoalScore != 0)
        {
            scoreinfostring = FragLimit @ string(GRI.GoalScore);
        }
    }
    // End:0xB9
    if(GRI.TimeLimit != 0)
    {
        scoreinfostring = ((scoreinfostring @ Spacer) @ TimeLimit) $ (FormatTime(GRI.RemainingTime));        
    }
    else
    {
        scoreinfostring = ((scoreinfostring @ Spacer) @ FooterText) @ (FormatTime(GRI.ElapsedTime));
    }
    return scoreinfostring;
    //return;    
}

function ExtraMarking(Canvas Canvas, int PlayerCount, int OwnerOffset, int XPos, int YPos, int YOffset)
{
    //return;    
}

simulated event UpdateScoreBoard(Canvas Canvas)
{
    local PlayerReplicationInfo PRI, OwnerPRI;
    local int i, FontReduction, OwnerPos, NetXPos, PlayerCount, HeaderOffsetY,
	    HeadFoot, MessageFoot, PlayerBoxSizeY, BoxSpaceY, NameXPos,
	    BoxTextOffsetY, OwnerOffset, ScoreXPos, DeathsXPos, BoxXPos,
	    TitleYPos, BoxWidth;

    local float XL, YL, MaxScaling, deathsXL, scoreXL, netXL,
	    MaxNamePos, LongestNameLength;

    local string PlayerName[32], LongestName;
    local bool bNameFontReduction;
    local Font ReducedFont;

    OwnerPRI = PlayerController(Owner).PlayerReplicationInfo;
    i = 0;
    J0x20:

    // End:0xBC [Loop If]
    if(i < GRI.PRIArray.Length)
    {
        PRI = GRI.PRIArray[i];
        // End:0xB2
        if(!PRI.bOnlySpectator && !PRI.bIsSpectator || PRI.bWaitingPlayer)
        {
            // End:0xAB
            if(PRI == OwnerPRI)
            {
                OwnerOffset = i;
            }
            PlayerCount++;
        }
        i++;
        // [Loop Continue]
        goto J0x20;
    }
    PlayerCount = Min(PlayerCount, 32);
    Canvas.Font = HudClass.static.GetMediumFontFor(Canvas);
    Canvas.StrLen("Test", XL, YL);
    BoxSpaceY = int(0.2500000 * YL);
    PlayerBoxSizeY = int(1.5000000 * YL);
    HeadFoot = int(float(5) * YL);
    MessageFoot = int(1.5000000 * float(HeadFoot));
    // End:0x478
    if(float(PlayerCount) > ((Canvas.ClipY - (1.5000000 * float(HeadFoot))) / float(PlayerBoxSizeY + BoxSpaceY)))
    {
        BoxSpaceY = int(0.1250000 * YL);
        PlayerBoxSizeY = int(1.2500000 * YL);
        // End:0x478
        if(float(PlayerCount) > ((Canvas.ClipY - (1.5000000 * float(HeadFoot))) / float(PlayerBoxSizeY + BoxSpaceY)))
        {
            // End:0x245
            if(float(PlayerCount) > ((Canvas.ClipY - (1.5000000 * float(HeadFoot))) / float(PlayerBoxSizeY + BoxSpaceY)))
            {
                PlayerBoxSizeY = int(1.1250000 * YL);
            }
            // End:0x478
            if(float(PlayerCount) > ((Canvas.ClipY - (1.5000000 * float(HeadFoot))) / float(PlayerBoxSizeY + BoxSpaceY)))
            {
                FontReduction++;
                Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
                Canvas.StrLen("Test", XL, YL);
                BoxSpaceY = int(0.1250000 * YL);
                PlayerBoxSizeY = int(1.1250000 * YL);
                HeadFoot = int(float(5) * YL);
                // End:0x478
                if(float(PlayerCount) > ((Canvas.ClipY - float(HeadFoot)) / float(PlayerBoxSizeY + BoxSpaceY)))
                {
                    FontReduction++;
                    Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
                    Canvas.StrLen("Test", XL, YL);
                    BoxSpaceY = int(0.1250000 * YL);
                    PlayerBoxSizeY = int(1.1250000 * YL);
                    HeadFoot = int(float(5) * YL);
                    // End:0x478
                    if((Canvas.ClipY >= float(768)) && float(PlayerCount) > ((Canvas.ClipY - float(HeadFoot)) / float(PlayerBoxSizeY + BoxSpaceY)))
                    {
                        FontReduction++;
                        Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
                        Canvas.StrLen("Test", XL, YL);
                        BoxSpaceY = int(0.1250000 * YL);
                        PlayerBoxSizeY = int(1.1250000 * YL);
                        HeadFoot = int(float(5) * YL);
                    }
                }
            }
        }
    }
    // End:0x4D0
    if(Canvas.ClipX < float(512))
    {
        PlayerCount = Min(PlayerCount, int(float(1) + ((Canvas.ClipY - float(HeadFoot)) / float(PlayerBoxSizeY + BoxSpaceY))));        
    }
    else
    {
        PlayerCount = Min(PlayerCount, int(Canvas.ClipY - float(HeadFoot)) / (PlayerBoxSizeY + BoxSpaceY));
    }
    // End:0x51B
    if(OwnerOffset >= PlayerCount)
    {
        PlayerCount -= 1;
    }
    // End:0x535
    if(FontReduction > 2)
    {
        MaxScaling = 3.0000000;        
    }
    else
    {
        MaxScaling = 2.1250000;
    }
    PlayerBoxSizeY = int(FClamp(((1.0000000 + (Canvas.ClipY - (0.6700000 * float(MessageFoot)))) / float(PlayerCount)) - float(BoxSpaceY), float(PlayerBoxSizeY), MaxScaling * YL));
    bDisplayMessages = float(PlayerCount) <= ((Canvas.ClipY - float(MessageFoot)) / float(PlayerBoxSizeY + BoxSpaceY));
    HeaderOffsetY = int(float(3) * YL);
    BoxWidth = int(0.9375000 * Canvas.ClipX);
    BoxXPos = int(0.5000000 * (Canvas.ClipX - float(BoxWidth)));
    BoxWidth = int(Canvas.ClipX - float(2 * BoxXPos));
    NameXPos = int(float(BoxXPos) + (0.0625000 * float(BoxWidth)));
    ScoreXPos = int(float(BoxXPos) + (0.5000000 * float(BoxWidth)));
    DeathsXPos = int(float(BoxXPos) + (0.6875000 * float(BoxWidth)));
    NetXPos = int(float(BoxXPos) + (0.8125000 * float(BoxWidth)));
    Canvas.Style = 5;
    Canvas.DrawColor = HudClass.default.WhiteColor * 0.5000000;
    i = 0;
    J0x6FD:

    // End:0x76A [Loop If]
    if(i < PlayerCount)
    {
        Canvas.SetPos(float(BoxXPos), float(HeaderOffsetY + ((PlayerBoxSizeY + BoxSpaceY) * i)));
        Canvas.DrawTileStretched(BoxMaterial, float(BoxWidth), float(PlayerBoxSizeY));
        i++;
        // [Loop Continue]
        goto J0x6FD;
    }
    Canvas.Style = 3;
    Canvas.Style = 1;
    DrawTitle(Canvas, float(HeaderOffsetY), float(PlayerCount + 1) * float(PlayerBoxSizeY + BoxSpaceY), float(PlayerBoxSizeY));
    TitleYPos = int(float(HeaderOffsetY) - (1.2500000 * YL));
    Canvas.StrLen(PointsText, scoreXL, YL);
    Canvas.StrLen(DeathsText, deathsXL, YL);
    Canvas.DrawColor = HudClass.default.WhiteColor;
    Canvas.SetPos(float(NameXPos), float(TitleYPos));
    Canvas.DrawText(PlayerText, true);
    Canvas.SetPos(float(ScoreXPos) - (0.5000000 * scoreXL), float(TitleYPos));
    Canvas.DrawText(PointsText, true);
    Canvas.SetPos(float(DeathsXPos) - (0.5000000 * deathsXL), float(TitleYPos));
    Canvas.DrawText(DeathsText, true);
    // End:0x8E5
    if(PlayerCount <= 0)
    {
        return;
    }
    MaxNamePos = 0.9000000 * float(ScoreXPos - NameXPos);
    i = 0;
    J0x907:

    // End:0x99C [Loop If]
    if(i < PlayerCount)
    {
        PlayerName[i] = GRI.PRIArray[i].PlayerName;
        Canvas.StrLen(PlayerName[i], XL, YL);
        // End:0x992
        if(XL > FMax(LongestNameLength, MaxNamePos))
        {
            LongestName = PlayerName[i];
            LongestNameLength = XL;
        }
        i++;
        // [Loop Continue]
        goto J0x907;
    }
    // End:0xA27
    if(OwnerOffset >= PlayerCount)
    {
        PlayerName[OwnerOffset] = GRI.PRIArray[OwnerOffset].PlayerName;
        Canvas.StrLen(PlayerName[OwnerOffset], XL, YL);
        // End:0xA27
        if(XL > FMax(LongestNameLength, MaxNamePos))
        {
            LongestName = PlayerName[i];
            LongestNameLength = XL;
        }
    }
    // End:0xB0C
    if(LongestNameLength > float(0))
    {
        bNameFontReduction = true;
        Canvas.Font = GetSmallerFontFor(Canvas, FontReduction + 1);
        Canvas.StrLen(LongestName, XL, YL);
        // End:0xAF8
        if(XL > MaxNamePos)
        {
            Canvas.Font = GetSmallerFontFor(Canvas, FontReduction + 2);
            Canvas.StrLen(LongestName, XL, YL);
            // End:0xAF8
            if(XL > MaxNamePos)
            {
                Canvas.Font = GetSmallerFontFor(Canvas, FontReduction + 3);
            }
        }
        ReducedFont = Canvas.Font;
    }
    i = 0;
    J0xB13:

    // End:0xBBD [Loop If]
    if(i < PlayerCount)
    {
        PlayerName[i] = GRI.PRIArray[i].PlayerName;
        Canvas.StrLen(PlayerName[i], XL, YL);
        // End:0xBB3
        if(XL > MaxNamePos)
        {
            PlayerName[i] = Left(PlayerName[i], int((MaxNamePos / XL) * float(Len(PlayerName[i]))));
        }
        i++;
        // [Loop Continue]
        goto J0xB13;
    }
    // End:0xC5D
    if(OwnerOffset >= PlayerCount)
    {
        PlayerName[OwnerOffset] = GRI.PRIArray[OwnerOffset].PlayerName;
        Canvas.StrLen(PlayerName[OwnerOffset], XL, YL);
        // End:0xC5D
        if(XL > MaxNamePos)
        {
            PlayerName[OwnerOffset] = Left(PlayerName[OwnerOffset], int((MaxNamePos / XL) * float(Len(PlayerName[OwnerOffset]))));
        }
    }
    Canvas.Style = 1;
    Canvas.DrawColor = HudClass.default.WhiteColor;
    Canvas.SetPos(0.5000000 * Canvas.ClipX, float(HeaderOffsetY + 4));
    BoxTextOffsetY = int(float(HeaderOffsetY) + (0.5000000 * (float(PlayerBoxSizeY) - YL)));
    Canvas.DrawColor = HudClass.default.WhiteColor;
    i = 0;
    J0xD04:

    // End:0xD7A [Loop If]
    if(i < PlayerCount)
    {
        // End:0xD70
        if(i != OwnerOffset)
        {
            Canvas.SetPos(float(NameXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
            Canvas.DrawText(PlayerName[i], true);
        }
        i++;
        // [Loop Continue]
        goto J0xD04;
    }
    // End:0xDA2
    if(bNameFontReduction)
    {
        Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
    }
    Canvas.DrawColor = HudClass.default.WhiteColor;
    i = 0;
    J0xDC6:

    // End:0xE88 [Loop If]
    if(i < PlayerCount)
    {
        // End:0xE7E
        if(i != OwnerOffset)
        {
            Canvas.SetPos(float(ScoreXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
            // End:0xE50
            if(GRI.PRIArray[i].bOutOfLives)
            {
                Canvas.DrawText(OutText, true);
                // [Explicit Continue]
                goto J0xE7E;
            }
            Canvas.DrawText(string(int(GRI.PRIArray[i].Score)), true);
        }
        J0xE7E:

        i++;
        // [Loop Continue]
        goto J0xDC6;
    }
    Canvas.DrawColor = HudClass.default.WhiteColor;
    i = 0;
    J0xEAC:

    // End:0xF38 [Loop If]
    if(i < PlayerCount)
    {
        // End:0xF2E
        if(i != OwnerOffset)
        {
            Canvas.SetPos(float(DeathsXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
            Canvas.DrawText(string(int(GRI.PRIArray[i].Deaths)), true);
        }
        i++;
        // [Loop Continue]
        goto J0xEAC;
    }
    // End:0x1005
    if(OwnerOffset >= PlayerCount)
    {
        OwnerPos = ((PlayerBoxSizeY + BoxSpaceY) * PlayerCount) + BoxTextOffsetY;
        Canvas.Style = 5;
        Canvas.DrawColor = HudClass.default.TurqColor * 0.5000000;
        Canvas.SetPos(float(BoxXPos), float(HeaderOffsetY + ((PlayerBoxSizeY + BoxSpaceY) * PlayerCount)));
        Canvas.DrawTileStretched(BoxMaterial, float(BoxWidth), float(PlayerBoxSizeY));
        Canvas.Style = 1;        
    }
    else
    {
        OwnerPos = ((PlayerBoxSizeY + BoxSpaceY) * OwnerOffset) + BoxTextOffsetY;
    }
    Canvas.DrawColor = HudClass.default.GoldColor;
    Canvas.SetPos(float(NameXPos), float(OwnerPos));
    // End:0x107C
    if(bNameFontReduction)
    {
        Canvas.Font = ReducedFont;
    }
    Canvas.DrawText(PlayerName[OwnerOffset], true);
    // End:0x10BC
    if(bNameFontReduction)
    {
        Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
    }
    Canvas.SetPos(float(ScoreXPos), float(OwnerPos));
    // End:0x110F
    if(GRI.PRIArray[OwnerOffset].bOutOfLives)
    {
        Canvas.DrawText(OutText, true);        
    }
    else
    {
        Canvas.DrawText(string(int(GRI.PRIArray[OwnerOffset].Score)), true);
    }
    Canvas.SetPos(float(DeathsXPos), float(OwnerPos));
    Canvas.DrawText(string(int(GRI.PRIArray[OwnerOffset].Deaths)), true);
    ExtraMarking(Canvas, PlayerCount, OwnerOffset, NameXPos, PlayerBoxSizeY + BoxSpaceY, BoxTextOffsetY);
    // End:0x11CE
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        return;
    }
    Canvas.StrLen(NetText, netXL, YL);
    Canvas.DrawColor = HudClass.default.WhiteColor;
    Canvas.SetPos(float(NetXPos) + (0.5000000 * netXL), float(TitleYPos));
    Canvas.DrawText(NetText, true);
    i = 0;
    J0x124A:

    // End:0x128D [Loop If]
    if(i < GRI.PRIArray.Length)
    {
        PRIArray[i] = GRI.PRIArray[i];
        i++;
        // [Loop Continue]
        goto J0x124A;
    }
    DrawNetInfo(Canvas, FontReduction, HeaderOffsetY, PlayerBoxSizeY, BoxSpaceY, BoxTextOffsetY, OwnerOffset, PlayerCount, NetXPos);
    DrawMatchID(Canvas, FontReduction);
    //return;    
}

function DrawMatchID(Canvas Canvas, int FontReduction)
{
    local float XL, YL;

    // End:0xC8
    if(GRI.MatchID != 0)
    {
        Canvas.Font = GetSmallFontFor(int(1.5000000 * Canvas.ClipX), FontReduction + 1);
        Canvas.StrLen(MatchIDText @ string(GRI.MatchID), XL, YL);
        Canvas.SetPos((Canvas.ClipX - XL) - float(4), 4.0000000);
        Canvas.DrawText(MatchIDText @ string(GRI.MatchID), true);
    }
    //return;    
}

function DrawNetInfo(Canvas Canvas, int FontReduction, int HeaderOffsetY, int PlayerBoxSizeY, int BoxSpaceY, int BoxTextOffsetY, int OwnerOffset, int PlayerCount, int NetXPos)
{
    local float XL, YL;
    local int i;
    local bool bHaveHalfFont, bDrawFPH, bDrawPL;

    // End:0x120
    if(GRI.bMatchHasBegun)
    {
        Canvas.DrawColor = HudClass.default.RedColor;
        i = 0;
        J0x36:

        // End:0xAF [Loop If]
        if(i < PlayerCount)
        {
            // End:0xA5
            if(PRIArray[i].bAdmin)
            {
                Canvas.SetPos(float(NetXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
                Canvas.DrawText(AdminText, true);
            }
            i++;
            // [Loop Continue]
            goto J0x36;
        }
        // End:0x120
        if((OwnerOffset >= PlayerCount) && PRIArray[OwnerOffset].bAdmin)
        {
            Canvas.SetPos(float(NetXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(PlayerCount)) + float(BoxTextOffsetY));
            Canvas.DrawText(AdminText, true);
        }
    }
    Canvas.DrawColor = HudClass.default.CyanColor;
    Canvas.Font = GetSmallFontFor(int(Canvas.ClipX), FontReduction);
    Canvas.StrLen("Test", XL, YL);
    BoxTextOffsetY = int(float(HeaderOffsetY) + (0.5000000 * float(PlayerBoxSizeY)));
    bHaveHalfFont = YL < (0.5000000 * float(PlayerBoxSizeY));
    // End:0x47D
    if(!GRI.bMatchHasBegun)
    {
        bDrawPL = float(PlayerBoxSizeY) > (float(3) * YL);
        i = 0;
        J0x1F4:

        // End:0x47B [Loop If]
        if(i < PlayerCount)
        {
            // End:0x33A
            if(bDrawPL)
            {
                Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - (1.5000000 * YL));
                Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[i].Ping)), true);
                Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - (0.5000000 * YL));
                Canvas.DrawText(PLText @ string(PRIArray[i].PacketLoss), true);
                Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) + (0.5000000 * YL));                
            }
            else
            {
                // End:0x3EE
                if(bHaveHalfFont)
                {
                    Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - YL);
                    Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[i].Ping)), true);
                    Canvas.SetPos(float(NetXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));                    
                }
                else
                {
                    Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - (0.5000000 * YL));
                }
            }
            // End:0x45F
            if(PRIArray[i].bReadyToPlay)
            {
                Canvas.DrawText(ReadyText, true);
                // [Explicit Continue]
                goto J0x471;
            }
            Canvas.DrawText(NotReadyText, true);
            J0x471:

            i++;
            // [Loop Continue]
            goto J0x1F4;
        }
        return;
    }
    // End:0x4A2
    if(Canvas.ClipX < float(512))
    {
        PingText = "";        
    }
    else
    {
        PingText = default.PingText;
        bDrawFPH = float(PlayerBoxSizeY) > (float(3) * YL);
        bDrawPL = float(PlayerBoxSizeY) > (float(4) * YL);
    }
    // End:0x552
    if(((FPHTime == float(0)) || !UnrealPlayer(Owner).bDisplayLoser && !UnrealPlayer(Owner).bDisplayWinner) && GRI.ElapsedTime > 0)
    {
        FPHTime = float(GRI.ElapsedTime);
    }
    i = 0;
    J0x559:

    // End:0xACA [Loop If]
    if(i < PlayerCount)
    {
        // End:0xAC0
        if(!PRIArray[i].bAdmin && !PRIArray[i].bOutOfLives)
        {
            // End:0x7B5
            if(bDrawPL)
            {
                Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - (1.9000000 * YL));
                Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[i].Ping)), true);
                Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - (0.9000000 * YL));
                Canvas.DrawText(PLText @ string(PRIArray[i].PacketLoss), true);
                Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) + (0.1000000 * YL));
                Canvas.DrawText(FPH @ string(Clamp(int((float(3600) * PRIArray[i].Score) / FMax(1.0000000, FPHTime - float(PRIArray[i].StartTime))), -999, 9999)), true);
                Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) + (1.1000000 * YL));
                Canvas.DrawText(FormatTime(Max(0, int(FPHTime - float(PRIArray[i].StartTime)))), true);
                // [Explicit Continue]
                goto J0xAC0;
            }
            // End:0x95E
            if(bDrawFPH)
            {
                Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - (1.5000000 * YL));
                Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[i].Ping)), true);
                Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - (0.5000000 * YL));
                Canvas.DrawText(FPH @ string(Clamp(int((float(3600) * PRIArray[i].Score) / FMax(1.0000000, FPHTime - float(PRIArray[i].StartTime))), -999, 9999)), true);
                Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) + (0.5000000 * YL));
                Canvas.DrawText(FormatTime(Max(0, int(FPHTime - float(PRIArray[i].StartTime)))), true);
                // [Explicit Continue]
                goto J0xAC0;
            }
            // End:0xA47
            if(bHaveHalfFont)
            {
                Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - YL);
                Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[i].Ping)), true);
                Canvas.SetPos(float(NetXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
                Canvas.DrawText(FormatTime(Max(0, int(FPHTime - float(PRIArray[i].StartTime)))), true);
                // [Explicit Continue]
                goto J0xAC0;
            }
            Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - (0.5000000 * YL));
            Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[i].Ping)), true);
        }
        J0xAC0:

        i++;
        // [Loop Continue]
        goto J0x559;
    }
    // End:0xE17
    if(((OwnerOffset >= PlayerCount) && !PRIArray[OwnerOffset].bAdmin) && !PRIArray[OwnerOffset].bOutOfLives)
    {
        // End:0xCB5
        if(bDrawFPH)
        {
            Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - (1.5000000 * YL));
            Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[OwnerOffset].Ping)), true);
            Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - (0.5000000 * YL));
            Canvas.DrawText(FPH @ string(Min(999, int((float(3600) * PRIArray[OwnerOffset].Score) / FMax(1.0000000, FPHTime - float(PRIArray[OwnerOffset].StartTime))))), true);
            Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) + (0.5000000 * YL));
            Canvas.DrawText(FormatTime(Max(0, int(FPHTime - float(PRIArray[OwnerOffset].StartTime)))), true);            
        }
        else
        {
            // End:0xD9E
            if(bHaveHalfFont)
            {
                Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - YL);
                Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[OwnerOffset].Ping)), true);
                Canvas.SetPos(float(NetXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
                Canvas.DrawText(FormatTime(Max(0, int(FPHTime - float(PRIArray[OwnerOffset].StartTime)))), true);                
            }
            else
            {
                Canvas.SetPos(float(NetXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - (0.5000000 * YL));
                Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[OwnerOffset].Ping)), true);
            }
        }
    }
    //return;    
}

defaultproperties
{
    RankText="Rank"
    PlayerText="Player"
    PointsText="Score"
    TimeText="Time:"
    PingText="Ping:"
    PLText="P/L:"
    DeathsText="Deaths"
    AdminText="Admin"
    NetText="Net"
    FooterText="Elapsed Time:"
    MatchIDText="UT2004 Stats Match"
    OutText="Out"
    OutFireText=" was killed. Click [Fire] to spectate on remaining players."
    ReadyText="Ready"
    NotReadyText="Not Ready"
    SkillLevel[0]="Beginner"
    SkillLevel[1]="Average"
    SkillLevel[2]="Experienced"
    SkillLevel[3]="Proficient"
    SkillLevel[4]="Instructor"
    SkillLevel[5]="Masterful"
    SkillLevel[6]="Inhuman"
    SkillLevel[7]="God-like"
    MaxLives="Max Lives: "
    FragLimit="Score Limit: "
    FPH="Score/Time"
    GameType="Game"
    MapName="Map Name"
    Restart="You died. Respawning!"
    Continue=" Click [Fire] to continue!"
    Ended="The match is over."
    TimeLimit="Time left: "
    Spacer=" "
    HudClass=Class'XInterface_Decompressed.HudBase'
}