/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\ScoreBoardDeathMatch.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:29
 *	Functions:10
 *
 *******************************************************************************/
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
}

function UpdatePrecacheFonts();
function DrawTitle(Canvas Canvas, float HeaderOffsetY, float PlayerAreaY, float PlayerBoxSizeY)
{
    local string titlestring, scoreinfostring, RestartString;
    local float TitleXL, ScoreInfoXL, YL;

    // End:0x1c
    if(Canvas.ClipX < float(512))
    {
        return;
    }
    titlestring = GetTitleString();
    scoreinfostring = GetDefaultScoreInfoString();
    Canvas.StrLen(titlestring, TitleXL, YL);
    Canvas.DrawColor = HudClass.default.GoldColor;
    // End:0x9a
    if(UnrealPlayer(Owner).bDisplayLoser)
    {
        scoreinfostring = class'HudBase'.default.YouveLostTheMatch;
    }
    // End:0x19a
    else
    {
        // End:0xc8
        if(UnrealPlayer(Owner).bDisplayWinner)
        {
            scoreinfostring = class'HudBase'.default.YouveWonTheMatch;
        }
        // End:0x19a
        else
        {
            // End:0x19a
            if(PlayerController(Owner).IsDead())
            {
                RestartString = GetRestartString();
                // End:0x18f
                if(Canvas.ClipY - HeaderOffsetY - PlayerAreaY >= 2.50 * YL)
                {
                    Canvas.StrLen(RestartString, ScoreInfoXL, YL);
                    Canvas.SetPos(0.50 * Canvas.ClipX - ScoreInfoXL, Canvas.ClipY - 2.50 * YL);
                    Canvas.DrawText(RestartString, true);
                }
                // End:0x19a
                else
                {
                    scoreinfostring = RestartString;
                }
            }
        }
    }
    Canvas.StrLen(scoreinfostring, ScoreInfoXL, YL);
    Canvas.SetPos(0.50 * Canvas.ClipX - TitleXL, HeaderOffsetY - PlayerBoxSizeY - YL * 0.50);
    Canvas.DrawText(titlestring, true);
    Canvas.SetPos(0.50 * Canvas.ClipX - ScoreInfoXL, Canvas.ClipY - 1.50 * YL);
    Canvas.DrawText(scoreinfostring, true);
}

function string GetTitleString()
{
    local string titlestring;

    // End:0x99
    if(Level.NetMode == 0)
    {
        // End:0x6c
        if(Level.Game.CurrentGameProfile != none)
        {
            titlestring = SkillLevel[Clamp(int(Level.Game.CurrentGameProfile.BaseDifficulty), 0, 7)];
        }
        // End:0x96
        else
        {
            titlestring = SkillLevel[Clamp(int(Level.Game.GameDifficulty), 0, 7)];
        }
    }
    // End:0xd9
    else
    {
        // End:0xd9
        if(GRI != none && GRI.BotDifficulty >= 0)
        {
            titlestring = SkillLevel[Clamp(GRI.BotDifficulty, 0, 7)];
        }
    }
    return titlestring @ GRI.GameName $ MapName $ Level.Title;
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
    // End:0x79
    else
    {
        // End:0x79
        if(Level.TimeSeconds - UnrealPlayer(Owner).LastKickWarningTime < float(2))
        {
            RestartString = class'GameMessage'.default.KickWarning;
        }
    }
    return RestartString;
}

function string GetDefaultScoreInfoString()
{
    local string scoreinfostring;

    // End:0x0e
    if(GRI == none)
    {
        return "";
    }
    // End:0x42
    if(GRI.MaxLives != 0)
    {
        scoreinfostring = MaxLives @ string(GRI.MaxLives);
    }
    // End:0x73
    else
    {
        // End:0x73
        if(GRI.GoalScore != 0)
        {
            scoreinfostring = FragLimit @ string(GRI.GoalScore);
        }
    }
    // End:0xb9
    if(GRI.TimeLimit != 0)
    {
        scoreinfostring = scoreinfostring @ Spacer @ TimeLimit $ FormatTime(GRI.RemainingTime);
    }
    // End:0xe8
    else
    {
        scoreinfostring = scoreinfostring @ Spacer @ FooterText @ FormatTime(GRI.ElapsedTime);
    }
    return scoreinfostring;
}

function ExtraMarking(Canvas Canvas, int PlayerCount, int OwnerOffset, int XPos, int YPos, int YOffset);
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
    // End:0xbc [While If]
    if(i < GRI.PRIArray.Length)
    {
        PRI = GRI.PRIArray[i];
        // End:0xb2
        if(!PRI.bOnlySpectator && !PRI.bIsSpectator || PRI.bWaitingPlayer)
        {
            // End:0xab
            if(PRI == OwnerPRI)
            {
                OwnerOffset = i;
            }
            ++ PlayerCount;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x20;
    }
    PlayerCount = Min(PlayerCount, 32);
    Canvas.Font = HudClass.static.GetMediumFontFor(Canvas);
    Canvas.StrLen("Test", XL, YL);
    BoxSpaceY = int(0.250 * YL);
    PlayerBoxSizeY = int(1.50 * YL);
    HeadFoot = int(float(5) * YL);
    MessageFoot = int(1.50 * float(HeadFoot));
    // End:0x478
    if(float(PlayerCount) > Canvas.ClipY - 1.50 * float(HeadFoot) / float(PlayerBoxSizeY + BoxSpaceY))
    {
        BoxSpaceY = int(0.1250 * YL);
        PlayerBoxSizeY = int(1.250 * YL);
        // End:0x478
        if(float(PlayerCount) > Canvas.ClipY - 1.50 * float(HeadFoot) / float(PlayerBoxSizeY + BoxSpaceY))
        {
            // End:0x245
            if(float(PlayerCount) > Canvas.ClipY - 1.50 * float(HeadFoot) / float(PlayerBoxSizeY + BoxSpaceY))
            {
                PlayerBoxSizeY = int(1.1250 * YL);
            }
            // End:0x478
            if(float(PlayerCount) > Canvas.ClipY - 1.50 * float(HeadFoot) / float(PlayerBoxSizeY + BoxSpaceY))
            {
                ++ FontReduction;
                Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
                Canvas.StrLen("Test", XL, YL);
                BoxSpaceY = int(0.1250 * YL);
                PlayerBoxSizeY = int(1.1250 * YL);
                HeadFoot = int(float(5) * YL);
                // End:0x478
                if(float(PlayerCount) > Canvas.ClipY - float(HeadFoot) / float(PlayerBoxSizeY + BoxSpaceY))
                {
                    ++ FontReduction;
                    Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
                    Canvas.StrLen("Test", XL, YL);
                    BoxSpaceY = int(0.1250 * YL);
                    PlayerBoxSizeY = int(1.1250 * YL);
                    HeadFoot = int(float(5) * YL);
                    // End:0x478
                    if(Canvas.ClipY >= float(768) && float(PlayerCount) > Canvas.ClipY - float(HeadFoot) / float(PlayerBoxSizeY + BoxSpaceY))
                    {
                        ++ FontReduction;
                        Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
                        Canvas.StrLen("Test", XL, YL);
                        BoxSpaceY = int(0.1250 * YL);
                        PlayerBoxSizeY = int(1.1250 * YL);
                        HeadFoot = int(float(5) * YL);
                    }
                }
            }
        }
    }
    // End:0x4d0
    if(Canvas.ClipX < float(512))
    {
        PlayerCount = Min(PlayerCount, int(float(1) + Canvas.ClipY - float(HeadFoot) / float(PlayerBoxSizeY + BoxSpaceY)));
    }
    // End:0x504
    else
    {
        PlayerCount = Min(PlayerCount, int(Canvas.ClipY - float(HeadFoot)) / PlayerBoxSizeY + BoxSpaceY);
    }
    // End:0x51b
    if(OwnerOffset >= PlayerCount)
    {
        PlayerCount -= 1;
    }
    // End:0x535
    if(FontReduction > 2)
    {
        MaxScaling = 3.0;
    }
    // End:0x540
    else
    {
        MaxScaling = 2.1250;
    }
    PlayerBoxSizeY = int(FClamp(1.0 + Canvas.ClipY - 0.670 * float(MessageFoot) / float(PlayerCount) - float(BoxSpaceY), float(PlayerBoxSizeY), MaxScaling * YL));
    bDisplayMessages = float(PlayerCount) <= Canvas.ClipY - float(MessageFoot) / float(PlayerBoxSizeY + BoxSpaceY);
    HeaderOffsetY = int(float(3) * YL);
    BoxWidth = int(0.93750 * Canvas.ClipX);
    BoxXPos = int(0.50 * Canvas.ClipX - float(BoxWidth));
    BoxWidth = int(Canvas.ClipX - float(2 * BoxXPos));
    NameXPos = int(float(BoxXPos) + 0.06250 * float(BoxWidth));
    ScoreXPos = int(float(BoxXPos) + 0.50 * float(BoxWidth));
    DeathsXPos = int(float(BoxXPos) + 0.68750 * float(BoxWidth));
    NetXPos = int(float(BoxXPos) + 0.81250 * float(BoxWidth));
    Canvas.Style = 5;
    Canvas.DrawColor = HudClass.default.WhiteColor * 0.50;
    i = 0;
    J0x6fd:
    // End:0x76a [While If]
    if(i < PlayerCount)
    {
        Canvas.SetPos(float(BoxXPos), float(HeaderOffsetY + PlayerBoxSizeY + BoxSpaceY * i));
        Canvas.DrawTileStretched(BoxMaterial, float(BoxWidth), float(PlayerBoxSizeY));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6fd;
    }
    Canvas.Style = 3;
    Canvas.Style = 1;
    DrawTitle(Canvas, float(HeaderOffsetY), float(PlayerCount + 1) * float(PlayerBoxSizeY + BoxSpaceY), float(PlayerBoxSizeY));
    TitleYPos = int(float(HeaderOffsetY) - 1.250 * YL);
    Canvas.StrLen(PointsText, scoreXL, YL);
    Canvas.StrLen(DeathsText, deathsXL, YL);
    Canvas.DrawColor = HudClass.default.WhiteColor;
    Canvas.SetPos(float(NameXPos), float(TitleYPos));
    Canvas.DrawText(PlayerText, true);
    Canvas.SetPos(float(ScoreXPos) - 0.50 * scoreXL, float(TitleYPos));
    Canvas.DrawText(PointsText, true);
    Canvas.SetPos(float(DeathsXPos) - 0.50 * deathsXL, float(TitleYPos));
    Canvas.DrawText(DeathsText, true);
    // End:0x8e5
    if(PlayerCount <= 0)
    {
        return;
    }
    MaxNamePos = 0.90 * float(ScoreXPos - NameXPos);
    i = 0;
    J0x907:
    // End:0x99c [While If]
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
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x907;
    }
    // End:0xa27
    if(OwnerOffset >= PlayerCount)
    {
        PlayerName[OwnerOffset] = GRI.PRIArray[OwnerOffset].PlayerName;
        Canvas.StrLen(PlayerName[OwnerOffset], XL, YL);
        // End:0xa27
        if(XL > FMax(LongestNameLength, MaxNamePos))
        {
            LongestName = PlayerName[i];
            LongestNameLength = XL;
        }
    }
    // End:0xb0c
    if(LongestNameLength > float(0))
    {
        bNameFontReduction = true;
        Canvas.Font = GetSmallerFontFor(Canvas, FontReduction + 1);
        Canvas.StrLen(LongestName, XL, YL);
        // End:0xaf8
        if(XL > MaxNamePos)
        {
            Canvas.Font = GetSmallerFontFor(Canvas, FontReduction + 2);
            Canvas.StrLen(LongestName, XL, YL);
            // End:0xaf8
            if(XL > MaxNamePos)
            {
                Canvas.Font = GetSmallerFontFor(Canvas, FontReduction + 3);
            }
        }
        ReducedFont = Canvas.Font;
    }
    i = 0;
    J0xb13:
    // End:0xbbd [While If]
    if(i < PlayerCount)
    {
        PlayerName[i] = GRI.PRIArray[i].PlayerName;
        Canvas.StrLen(PlayerName[i], XL, YL);
        // End:0xbb3
        if(XL > MaxNamePos)
        {
            PlayerName[i] = Left(PlayerName[i], int(MaxNamePos / XL * float(Len(PlayerName[i]))));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xb13;
    }
    // End:0xc5d
    if(OwnerOffset >= PlayerCount)
    {
        PlayerName[OwnerOffset] = GRI.PRIArray[OwnerOffset].PlayerName;
        Canvas.StrLen(PlayerName[OwnerOffset], XL, YL);
        // End:0xc5d
        if(XL > MaxNamePos)
        {
            PlayerName[OwnerOffset] = Left(PlayerName[OwnerOffset], int(MaxNamePos / XL * float(Len(PlayerName[OwnerOffset]))));
        }
    }
    Canvas.Style = 1;
    Canvas.DrawColor = HudClass.default.WhiteColor;
    Canvas.SetPos(0.50 * Canvas.ClipX, float(HeaderOffsetY + 4));
    BoxTextOffsetY = int(float(HeaderOffsetY) + 0.50 * float(PlayerBoxSizeY) - YL);
    Canvas.DrawColor = HudClass.default.WhiteColor;
    i = 0;
    J0xd04:
    // End:0xd7a [While If]
    if(i < PlayerCount)
    {
        // End:0xd70
        if(i != OwnerOffset)
        {
            Canvas.SetPos(float(NameXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY));
            Canvas.DrawText(PlayerName[i], true);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd04;
    }
    // End:0xda2
    if(bNameFontReduction)
    {
        Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
    }
    Canvas.DrawColor = HudClass.default.WhiteColor;
    i = 0;
    J0xdc6:
    // End:0xe88 [While If]
    if(i < PlayerCount)
    {
        // End:0xe7e
        if(i != OwnerOffset)
        {
            Canvas.SetPos(float(ScoreXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY));
            // End:0xe50
            if(GRI.PRIArray[i].bOutOfLives)
            {
                Canvas.DrawText(OutText, true);
            }
            // End:0xe7e
            else
            {
                Canvas.DrawText(string(int(GRI.PRIArray[i].Score)), true);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xdc6;
    }
    Canvas.DrawColor = HudClass.default.WhiteColor;
    i = 0;
    J0xeac:
    // End:0xf38 [While If]
    if(i < PlayerCount)
    {
        // End:0xf2e
        if(i != OwnerOffset)
        {
            Canvas.SetPos(float(DeathsXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY));
            Canvas.DrawText(string(int(GRI.PRIArray[i].Deaths)), true);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xeac;
    }
    // End:0x1005
    if(OwnerOffset >= PlayerCount)
    {
        OwnerPos = PlayerBoxSizeY + BoxSpaceY * PlayerCount + BoxTextOffsetY;
        Canvas.Style = 5;
        Canvas.DrawColor = HudClass.default.TurqColor * 0.50;
        Canvas.SetPos(float(BoxXPos), float(HeaderOffsetY + PlayerBoxSizeY + BoxSpaceY * PlayerCount));
        Canvas.DrawTileStretched(BoxMaterial, float(BoxWidth), float(PlayerBoxSizeY));
        Canvas.Style = 1;
    }
    // End:0x1025
    else
    {
        OwnerPos = PlayerBoxSizeY + BoxSpaceY * OwnerOffset + BoxTextOffsetY;
    }
    Canvas.DrawColor = HudClass.default.GoldColor;
    Canvas.SetPos(float(NameXPos), float(OwnerPos));
    // End:0x107c
    if(bNameFontReduction)
    {
        Canvas.Font = ReducedFont;
    }
    Canvas.DrawText(PlayerName[OwnerOffset], true);
    // End:0x10bc
    if(bNameFontReduction)
    {
        Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
    }
    Canvas.SetPos(float(ScoreXPos), float(OwnerPos));
    // End:0x110f
    if(GRI.PRIArray[OwnerOffset].bOutOfLives)
    {
        Canvas.DrawText(OutText, true);
    }
    // End:0x113d
    else
    {
        Canvas.DrawText(string(int(GRI.PRIArray[OwnerOffset].Score)), true);
    }
    Canvas.SetPos(float(DeathsXPos), float(OwnerPos));
    Canvas.DrawText(string(int(GRI.PRIArray[OwnerOffset].Deaths)), true);
    ExtraMarking(Canvas, PlayerCount, OwnerOffset, NameXPos, PlayerBoxSizeY + BoxSpaceY, BoxTextOffsetY);
    // End:0x11ce
    if(Level.NetMode == 0)
    {
        return;
    }
    Canvas.StrLen(NetText, netXL, YL);
    Canvas.DrawColor = HudClass.default.WhiteColor;
    Canvas.SetPos(float(NetXPos) + 0.50 * netXL, float(TitleYPos));
    Canvas.DrawText(NetText, true);
    i = 0;
    J0x124a:
    // End:0x128d [While If]
    if(i < GRI.PRIArray.Length)
    {
        PRIArray[i] = GRI.PRIArray[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x124a;
    }
    DrawNetInfo(Canvas, FontReduction, HeaderOffsetY, PlayerBoxSizeY, BoxSpaceY, BoxTextOffsetY, OwnerOffset, PlayerCount, NetXPos);
    DrawMatchID(Canvas, FontReduction);
}

function DrawMatchID(Canvas Canvas, int FontReduction)
{
    local float XL, YL;

    // End:0xc8
    if(GRI.MatchID != 0)
    {
        Canvas.Font = GetSmallFontFor(int(1.50 * Canvas.ClipX), FontReduction + 1);
        Canvas.StrLen(MatchIDText @ string(GRI.MatchID), XL, YL);
        Canvas.SetPos(Canvas.ClipX - XL - float(4), 4.0);
        Canvas.DrawText(MatchIDText @ string(GRI.MatchID), true);
    }
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
        // End:0xaf [While If]
        if(i < PlayerCount)
        {
            // End:0xa5
            if(PRIArray[i].bAdmin)
            {
                Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY));
                Canvas.DrawText(AdminText, true);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x36;
        }
        // End:0x120
        if(OwnerOffset >= PlayerCount && PRIArray[OwnerOffset].bAdmin)
        {
            Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(PlayerCount) + float(BoxTextOffsetY));
            Canvas.DrawText(AdminText, true);
        }
    }
    Canvas.DrawColor = HudClass.default.CyanColor;
    Canvas.Font = GetSmallFontFor(int(Canvas.ClipX), FontReduction);
    Canvas.StrLen("Test", XL, YL);
    BoxTextOffsetY = int(float(HeaderOffsetY) + 0.50 * float(PlayerBoxSizeY));
    bHaveHalfFont = YL < 0.50 * float(PlayerBoxSizeY);
    // End:0x47d
    if(!GRI.bMatchHasBegun)
    {
        bDrawPL = float(PlayerBoxSizeY) > float(3) * YL;
        i = 0;
        J0x1f4:
        // End:0x47b [While If]
        if(i < PlayerCount)
        {
            // End:0x33a
            if(bDrawPL)
            {
                Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) - 1.50 * YL);
                Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[i].Ping)), true);
                Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) - 0.50 * YL);
                Canvas.DrawText(PLText @ string(PRIArray[i].PacketLoss), true);
                Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) + 0.50 * YL);
            }
            // End:0x432
            else
            {
                // End:0x3ee
                if(bHaveHalfFont)
                {
                    Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) - YL);
                    Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[i].Ping)), true);
                    Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY));
                }
                // End:0x432
                else
                {
                    Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) - 0.50 * YL);
                }
            }
            // End:0x45f
            if(PRIArray[i].bReadyToPlay)
            {
                Canvas.DrawText(ReadyText, true);
            }
            // End:0x471
            else
            {
                Canvas.DrawText(NotReadyText, true);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1f4;
        }
        return;
    }
    // End:0x4a2
    if(Canvas.ClipX < float(512))
    {
        PingText = "";
    }
    // End:0x4e3
    else
    {
        PingText = default.PingText;
        bDrawFPH = float(PlayerBoxSizeY) > float(3) * YL;
        bDrawPL = float(PlayerBoxSizeY) > float(4) * YL;
    }
    // End:0x552
    if(FPHTime == float(0) || !UnrealPlayer(Owner).bDisplayLoser && !UnrealPlayer(Owner).bDisplayWinner && GRI.ElapsedTime > 0)
    {
        FPHTime = float(GRI.ElapsedTime);
    }
    i = 0;
    J0x559:
    // End:0xaca [While If]
    if(i < PlayerCount)
    {
        // End:0xac0
        if(!PRIArray[i].bAdmin && !PRIArray[i].bOutOfLives)
        {
            // End:0x7b5
            if(bDrawPL)
            {
                Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) - 1.90 * YL);
                Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[i].Ping)), true);
                Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) - 0.90 * YL);
                Canvas.DrawText(PLText @ string(PRIArray[i].PacketLoss), true);
                Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) + 0.10 * YL);
                Canvas.DrawText(FPH @ string(Clamp(int(float(3600) * PRIArray[i].Score / FMax(1.0, FPHTime - float(PRIArray[i].StartTime))), -999, 9999)), true);
                Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) + 1.10 * YL);
                Canvas.DrawText(FormatTime(Max(0, int(FPHTime - float(PRIArray[i].StartTime)))), true);
            }
            // End:0xac0
            else
            {
                // End:0x95e
                if(bDrawFPH)
                {
                    Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) - 1.50 * YL);
                    Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[i].Ping)), true);
                    Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) - 0.50 * YL);
                    Canvas.DrawText(FPH @ string(Clamp(int(float(3600) * PRIArray[i].Score / FMax(1.0, FPHTime - float(PRIArray[i].StartTime))), -999, 9999)), true);
                    Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) + 0.50 * YL);
                    Canvas.DrawText(FormatTime(Max(0, int(FPHTime - float(PRIArray[i].StartTime)))), true);
                }
                // End:0xac0
                else
                {
                    // End:0xa47
                    if(bHaveHalfFont)
                    {
                        Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) - YL);
                        Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[i].Ping)), true);
                        Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY));
                        Canvas.DrawText(FormatTime(Max(0, int(FPHTime - float(PRIArray[i].StartTime)))), true);
                    }
                    // End:0xac0
                    else
                    {
                        Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) - 0.50 * YL);
                        Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[i].Ping)), true);
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x559;
    }
    // End:0xe17
    if(OwnerOffset >= PlayerCount && !PRIArray[OwnerOffset].bAdmin && !PRIArray[OwnerOffset].bOutOfLives)
    {
        // End:0xcb5
        if(bDrawFPH)
        {
            Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) - 1.50 * YL);
            Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[OwnerOffset].Ping)), true);
            Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) - 0.50 * YL);
            Canvas.DrawText(FPH @ string(Min(999, int(float(3600) * PRIArray[OwnerOffset].Score / FMax(1.0, FPHTime - float(PRIArray[OwnerOffset].StartTime))))), true);
            Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) + 0.50 * YL);
            Canvas.DrawText(FormatTime(Max(0, int(FPHTime - float(PRIArray[OwnerOffset].StartTime)))), true);
        }
        // End:0xe17
        else
        {
            // End:0xd9e
            if(bHaveHalfFont)
            {
                Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) - YL);
                Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[OwnerOffset].Ping)), true);
                Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY));
                Canvas.DrawText(FormatTime(Max(0, int(FPHTime - float(PRIArray[OwnerOffset].StartTime)))), true);
            }
            // End:0xe17
            else
            {
                Canvas.SetPos(float(NetXPos), float(PlayerBoxSizeY + BoxSpaceY) * float(i) + float(BoxTextOffsetY) - 0.50 * YL);
                Canvas.DrawText(PingText @ string(Min(999, 4 * PRIArray[OwnerOffset].Ping)), true);
            }
        }
    }
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
    HudClass=class'HudBase'
}