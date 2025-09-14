class ScoreBoard_Assault extends ScoreBoardTeamDeathMatch
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string RemainingRoundTime;
var localized string CurrentRound;
var localized string RoundSeparator;
var localized string Defender;
var localized string Attacker;
var localized string WaitForReinforcements;
var localized string WaitingToSpawnReinforcements;
var localized string AutoRespawn;
var localized string YouWonRound;
var localized string YouLostRound;
var localized string PracticeRoundOver;

function string GetTitleString()
{
    local string InfoString;
    local byte ownerTeam;
    local ASGameReplicationInfo ASGRI;

    ASGRI = ASGameReplicationInfo(GRI);
    InfoString = super(ScoreBoardDeathMatch).GetTitleString();
    // End:0xEB
    if((((ASGRI != none) && Controller(Owner) != none) && Controller(Owner).PlayerReplicationInfo != none) && Controller(Owner).PlayerReplicationInfo.Team != none)
    {
        ownerTeam = byte(Controller(Owner).PlayerReplicationInfo.Team.TeamIndex);
        // End:0xD9
        if(int(ownerTeam) == int(byte(ASGRI.bTeamZeroIsAttacking)))
        {
            InfoString = InfoString @ Defender;            
        }
        else
        {
            InfoString = InfoString @ Attacker;
        }
    }
    return InfoString;
    //return;    
}

function string GetRestartString()
{
    local string RestartString;
    local ASGameReplicationInfo ASGRI;

    ASGRI = ASGameReplicationInfo(GRI);
    // End:0x39
    if(int(ASGRI.RoundWinner) != int(0))
    {
        return ASGRI.GetRoundWinnerString();
    }
    // End:0xB9
    if(((Controller(Owner).PlayerReplicationInfo != none) && ASPlayerReplicationInfo(Controller(Owner).PlayerReplicationInfo).bAutoRespawn) && !Controller(Owner).IsInState('PlayerWaiting'))
    {
        RestartString = AutoRespawn @ string(ASGRI.ReinforcementCountDown);
        return RestartString;
    }
    // End:0x10A
    if((ASGRI.ReinforcementCountDown > 0) && !Controller(Owner).IsInState('PlayerWaiting'))
    {
        RestartString = WaitForReinforcements @ string(ASGRI.ReinforcementCountDown);        
    }
    else
    {
        RestartString = super(ScoreBoardDeathMatch).GetRestartString();
    }
    return RestartString;
    //return;    
}

function string GetDefaultScoreInfoString()
{
    local string AssaultInfoString;
    local int RemainingRoundTimeVal;
    local ASGameReplicationInfo ASGRI;

    ASGRI = ASGameReplicationInfo(GRI);
    // End:0x22
    if(ASGRI == none)
    {
        return super(ScoreBoardDeathMatch).GetDefaultScoreInfoString();
    }
    // End:0xCD
    if((ASGRI.RoundTimeLimit > 0) && int(ASGRI.RoundWinner) == int(0))
    {
        RemainingRoundTimeVal = Max(0, (ASGRI.RoundTimeLimit - ASGRI.RoundStartTime) + ASGRI.RemainingTime);
        // End:0xB5
        if(int(ASGRI.RoundWinner) != int(0))
        {
            RemainingRoundTimeVal = ASGRI.RoundOverTime;
        }
        AssaultInfoString = RemainingRoundTime @ (FormatTime(RemainingRoundTimeVal));
    }
    // End:0xEB
    if(AssaultInfoString != "")
    {
        AssaultInfoString = AssaultInfoString @ Spacer;
    }
    AssaultInfoString = (((AssaultInfoString @ CurrentRound) @ string(ASGRI.CurrentRound)) $ RoundSeparator) $ string(ASGRI.MaxRounds);
    return AssaultInfoString;
    //return;    
}

function DrawTeam(int TeamNum, int PlayerCount, int OwnerOffset, Canvas Canvas, int FontReduction, int BoxSpaceY, int PlayerBoxSizeY, int HeaderOffsetY)
{
    local int i, OwnerPos, NetXPos, NameXPos, BoxTextOffsetY, ScoreXPos,
	    ScoreYPos, BoxXPos, BoxWidth, LineCount, NameY;

    local float XL, YL, IconScale, ScoreBackScale, ScoreYL, MaxNamePos,
	    LongestNameLength, oXL, oYL, TX, ty;

    local string PlayerName[32], OrdersText, LongestName, Temp;
    local Font MainFont, ReducedFont;
    local bool bHaveHalfFont, bNameFontReduction;
    local int SymbolUSize, SymbolVSize, OtherTeam, LastLine;
    local Font BackupFont;
    local float TrophiesXOffset;

    BoxWidth = int(0.4700000 * Canvas.ClipX);
    BoxXPos = int(0.5000000 * ((0.5000000 * Canvas.ClipX) - float(BoxWidth)));
    BoxWidth = int((0.5000000 * Canvas.ClipX) - float(2 * BoxXPos));
    BoxXPos = int(float(BoxXPos) + ((float(TeamNum) * 0.5000000) * Canvas.ClipX));
    NameXPos = int(float(BoxXPos) + (0.0500000 * float(BoxWidth)));
    ScoreXPos = int(float(BoxXPos) + (0.6000000 * float(BoxWidth)));
    NetXPos = int(float(BoxXPos) + (0.7200000 * float(BoxWidth)));
    bHaveHalfFont = HaveHalfFont(Canvas, FontReduction);
    Canvas.Style = 5;
    Canvas.DrawColor = HudClass.default.WhiteColor;
    Canvas.SetPos(float(BoxXPos), float(HeaderOffsetY));
    Canvas.DrawTileStretched(TeamBoxMaterial[TeamNum], float(BoxWidth), float(PlayerCount * (PlayerBoxSizeY + BoxSpaceY)));
    IconScale = Canvas.ClipX / float(4096);
    ScoreBackScale = Canvas.ClipX / float(1024);
    SymbolUSize = 256;
    SymbolVSize = 256;
    ScoreYPos = int((float(HeaderOffsetY) - (float(SymbolVSize) * IconScale)) - float(BoxSpaceY));
    MainFont = Canvas.Font;
    Canvas.Font = HudClass.static.LargerFontThan(MainFont);
    Canvas.StrLen("TEST", XL, ScoreYL);
    // End:0x287
    if(ScoreYPos == 0)
    {
        ScoreYPos = int(float(HeaderOffsetY) - ScoreYL);        
    }
    else
    {
        ScoreYPos = int((float(ScoreYPos) + ((0.5000000 * float(SymbolVSize)) * IconScale)) - (0.5000000 * ScoreYL));
    }
    Canvas.SetPos(((0.2500000 + (0.5000000 * float(TeamNum))) * Canvas.ClipX) + (float(32) * IconScale), float(ScoreYPos));
    Canvas.DrawText(string(int(GRI.Teams[TeamNum].Score)));
    Canvas.Font = MainFont;
    Canvas.DrawColor = HudClass.default.WhiteColor;
    IconScale = Canvas.ClipX / float(1024);
    // End:0x38B
    if(PlayerCount <= 0)
    {
        return;
    }
    // End:0x3B6
    if(TeamNum == 0)
    {
        Canvas.DrawColor = HudClass.default.RedColor;        
    }
    else
    {
        Canvas.DrawColor = HudClass.default.BlueColor;
    }
    // End:0x3F3
    if(OwnerOffset >= PlayerCount)
    {
        LastLine = PlayerCount + 1;        
    }
    else
    {
        LastLine = PlayerCount;
    }
    Canvas.DrawColor = HudClass.default.WhiteColor;
    MaxNamePos = 0.9500000 * float(ScoreXPos - NameXPos);
    i = 0;
    J0x43D:

    // End:0x4D2 [Loop If]
    if(i < PlayerCount)
    {
        PlayerName[i] = GRI.PRIArray[i].PlayerName;
        Canvas.StrLen(PlayerName[i], XL, YL);
        // End:0x4C8
        if(XL > FMax(LongestNameLength, MaxNamePos))
        {
            LongestName = PlayerName[i];
            LongestNameLength = XL;
        }
        i++;
        // [Loop Continue]
        goto J0x43D;
    }
    // End:0x55D
    if(OwnerOffset >= PlayerCount)
    {
        PlayerName[OwnerOffset] = GRI.PRIArray[OwnerOffset].PlayerName;
        Canvas.StrLen(PlayerName[OwnerOffset], XL, YL);
        // End:0x55D
        if(XL > FMax(LongestNameLength, MaxNamePos))
        {
            LongestName = PlayerName[i];
            LongestNameLength = XL;
        }
    }
    // End:0x642
    if(LongestNameLength > float(0))
    {
        bNameFontReduction = true;
        Canvas.Font = GetSmallerFontFor(Canvas, FontReduction + 1);
        Canvas.StrLen(LongestName, XL, YL);
        // End:0x62E
        if(XL > MaxNamePos)
        {
            Canvas.Font = GetSmallerFontFor(Canvas, FontReduction + 2);
            Canvas.StrLen(LongestName, XL, YL);
            // End:0x62E
            if(XL > MaxNamePos)
            {
                Canvas.Font = GetSmallerFontFor(Canvas, FontReduction + 3);
            }
        }
        ReducedFont = Canvas.Font;
    }
    i = 0;
    J0x649:

    // End:0x6EA [Loop If]
    if(i < PlayerCount)
    {
        PlayerName[i] = PRIArray[i].PlayerName;
        Canvas.StrLen(PlayerName[i], XL, YL);
        // End:0x6E0
        if(XL > MaxNamePos)
        {
            PlayerName[i] = Left(PlayerName[i], int((MaxNamePos / XL) * float(Len(PlayerName[i]))));
        }
        i++;
        // [Loop Continue]
        goto J0x649;
    }
    // End:0x781
    if(OwnerOffset >= PlayerCount)
    {
        PlayerName[OwnerOffset] = PRIArray[OwnerOffset].PlayerName;
        Canvas.StrLen(PlayerName[OwnerOffset], XL, YL);
        // End:0x781
        if(XL > MaxNamePos)
        {
            PlayerName[OwnerOffset] = Left(PlayerName[OwnerOffset], int((MaxNamePos / XL) * float(Len(PlayerName[OwnerOffset]))));
        }
    }
    // End:0x7B2
    if(Canvas.ClipX < float(512))
    {
        NameY = int(0.5000000 * YL);        
    }
    else
    {
        // End:0x7D1
        if(!bHaveHalfFont)
        {
            NameY = int(0.1250000 * YL);
        }
    }
    Canvas.Style = 1;
    Canvas.DrawColor = HudClass.default.WhiteColor;
    Canvas.SetPos(0.5000000 * Canvas.ClipX, float(HeaderOffsetY + 4));
    BoxTextOffsetY = int((float(HeaderOffsetY) + (0.5000000 * float(PlayerBoxSizeY))) - (0.5000000 * YL));
    Canvas.DrawColor = HudClass.default.WhiteColor;
    // End:0x907
    if(OwnerOffset == -1)
    {
        i = 0;
        J0x88E:

        // End:0x904 [Loop If]
        if(i < PlayerCount)
        {
            // End:0x8FA
            if(i != OwnerOffset)
            {
                Canvas.SetPos(float(NameXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
                Canvas.DrawText(PlayerName[i], true);
            }
            i++;
            // [Loop Continue]
            goto J0x88E;
        }        
    }
    else
    {
        i = 0;
        J0x90E:

        // End:0x99B [Loop If]
        if(i < PlayerCount)
        {
            // End:0x991
            if(i != OwnerOffset)
            {
                Canvas.SetPos(float(NameXPos), (((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - (0.5000000 * YL)) + float(NameY));
                Canvas.DrawText(PlayerName[i], true);
            }
            i++;
            // [Loop Continue]
            goto J0x90E;
        }
    }
    // End:0x9C3
    if(bNameFontReduction)
    {
        Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
    }
    Canvas.DrawColor = HudClass.default.WhiteColor;
    i = 0;
    J0x9E7:

    // End:0xA6A [Loop If]
    if(i < PlayerCount)
    {
        // End:0xA60
        if(i != OwnerOffset)
        {
            Canvas.SetPos(float(ScoreXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
            Canvas.DrawText(string(int(PRIArray[i].Score)), true);
        }
        i++;
        // [Loop Continue]
        goto J0x9E7;
    }
    Canvas.StrLen("0", TX, ty);
    BackupFont = Canvas.Font;
    Canvas.Font = Class'XInterface.UT2MidGameFont'.static.GetMidGameFont(int(Canvas.ClipX));
    i = 0;
    J0xACC:

    // End:0xC62 [Loop If]
    if(i < PlayerCount)
    {
        // End:0xC58
        if(ASPlayerReplicationInfo(PRIArray[i]) != none)
        {
            ASPlayerReplicationInfo(PRIArray[i]).TrophiesXOffset = 32.0000000;
            // End:0xC58
            if(int(ASPlayerReplicationInfo(PRIArray[i]).DestroyedVehicles) > 0)
            {
                TrophiesXOffset = ASPlayerReplicationInfo(PRIArray[i]).TrophiesXOffset;
                ASPlayerReplicationInfo(PRIArray[i]).TrophiesXOffset += float(32);
                // End:0xC58
                if(int(ASPlayerReplicationInfo(PRIArray[i]).DestroyedVehicles) > 1)
                {
                    Temp = string(ASPlayerReplicationInfo(PRIArray[i]).DestroyedVehicles);
                    Canvas.StrLen(Temp, XL, YL);
                    Canvas.SetPos((float(ScoreXPos) - (((TrophiesXOffset - float(16)) + float(8)) * IconScale)) - (XL * 0.5000000), (((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) + (ty * 0.5000000)) - (YL * 0.5000000));
                    Canvas.DrawText(Temp, true);
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0xACC;
    }
    Canvas.Font = BackupFont;
    // End:0xF1A
    if(OwnerOffset >= 0)
    {
        // End:0xDDD
        if(OwnerOffset >= PlayerCount)
        {
            OwnerPos = ((PlayerBoxSizeY + BoxSpaceY) * PlayerCount) + BoxTextOffsetY;
            Canvas.Style = 5;
            Canvas.SetPos(float(BoxXPos), float(HeaderOffsetY + ((PlayerBoxSizeY + BoxSpaceY) * PlayerCount)));
            Canvas.DrawTileStretched(TeamBoxMaterial[TeamNum], float(BoxWidth), float(PlayerBoxSizeY));
            Canvas.Style = 1;
            // End:0xDDA
            if(PRIArray[OwnerOffset].HasFlag != none)
            {
                Canvas.DrawColor = HudClass.default.WhiteColor;
                Canvas.SetPos(float(NameXPos) - (float(48) * IconScale), float(OwnerPos) - (float(16) * IconScale));
                Canvas.DrawTile(FlagIcon, 64.0000000 * IconScale, 32.0000000 * IconScale, 0.0000000, 0.0000000, 256.0000000, 128.0000000);
            }            
        }
        else
        {
            OwnerPos = ((PlayerBoxSizeY + BoxSpaceY) * OwnerOffset) + BoxTextOffsetY;
        }
        Canvas.DrawColor = HudClass.default.GoldColor;
        Canvas.SetPos(float(NameXPos), (float(OwnerPos) - (0.5000000 * YL)) + float(NameY));
        // End:0xE6B
        if(bNameFontReduction)
        {
            Canvas.Font = ReducedFont;
        }
        Canvas.DrawText(PlayerName[OwnerOffset], true);
        // End:0xEAB
        if(bNameFontReduction)
        {
            Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
        }
        Canvas.SetPos(float(ScoreXPos), float(OwnerPos));
        // End:0xEF5
        if(PRIArray[OwnerOffset].bOutOfLives)
        {
            Canvas.DrawText(OutText, true);            
        }
        else
        {
            Canvas.DrawText(string(int(PRIArray[OwnerOffset].Score)), true);
        }
    }
    Canvas.DrawColor = HudClass.default.WhiteColor;
    // End:0xF49
    if(TeamNum == 0)
    {
        OtherTeam = 1;
    }
    // End:0x1384
    if((OwnerOffset >= 0) && Canvas.ClipX >= float(512))
    {
        BoxTextOffsetY = int((float(HeaderOffsetY) + (0.5000000 * float(PlayerBoxSizeY))) + float(NameY));
        Canvas.DrawColor = HudClass.default.CyanColor;
        // End:0xFC9
        if(FontReduction > 3)
        {
            bHaveHalfFont = false;
        }
        // End:0x1014
        if(Canvas.ClipX >= float(1280))
        {
            Canvas.Font = GetSmallFontFor(int(Canvas.ClipX), FontReduction + 2);            
        }
        else
        {
            Canvas.Font = GetSmallFontFor(int(Canvas.ClipX), FontReduction + 1);
        }
        Canvas.StrLen("Test", XL, YL);
        i = 0;
        J0x1064:

        // End:0x131D [Loop If]
        if(i < PlayerCount)
        {
            LineCount = 0;
            // End:0x1286
            if((PRIArray[i].bBot && TeamPlayerReplicationInfo(PRIArray[i]) != none) && TeamPlayerReplicationInfo(PRIArray[i]).Squad != none)
            {
                LineCount = 1;
                Canvas.SetPos(float(NameXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
                // End:0x1180
                if(Canvas.ClipX < float(800))
                {
                    OrdersText = (("(" $ PRIArray[i].GetCallSign()) $ ") ") $ TeamPlayerReplicationInfo(PRIArray[i]).Squad.GetShortOrderStringFor(TeamPlayerReplicationInfo(PRIArray[i]));                    
                }
                else
                {
                    OrdersText = TeamPlayerReplicationInfo(PRIArray[i]).Squad.GetOrderStringFor(TeamPlayerReplicationInfo(PRIArray[i]));
                    OrdersText = (("(" $ PRIArray[i].GetCallSign()) $ ") ") $ OrdersText;
                    Canvas.StrLen(OrdersText, oXL, oYL);
                    // End:0x1274
                    if(oXL >= float(ScoreXPos - NameXPos))
                    {
                        OrdersText = (("(" $ PRIArray[i].GetCallSign()) $ ") ") $ TeamPlayerReplicationInfo(PRIArray[i]).Squad.GetShortOrderStringFor(TeamPlayerReplicationInfo(PRIArray[i]));
                    }
                }
                Canvas.DrawText(OrdersText, true);
            }
            // End:0x1313
            if(bHaveHalfFont || !PRIArray[i].bBot)
            {
                Canvas.SetPos(float(NameXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) + (float(LineCount) * YL));
                Canvas.DrawText(PRIArray[i].GetLocationName(), true);
            }
            i++;
            // [Loop Continue]
            goto J0x1064;
        }
        // End:0x1384
        if(OwnerOffset >= PlayerCount)
        {
            Canvas.SetPos(float(NameXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
            Canvas.DrawText(PRIArray[OwnerOffset].GetLocationName(), true);
        }
    }
    // End:0x139F
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        return;
    }
    Canvas.Font = MainFont;
    Canvas.StrLen("Test", XL, YL);
    BoxTextOffsetY = int((float(HeaderOffsetY) + (0.5000000 * float(PlayerBoxSizeY))) - (0.5000000 * YL));
    DrawNetInfo(Canvas, FontReduction, HeaderOffsetY, PlayerBoxSizeY, BoxSpaceY, BoxTextOffsetY, OwnerOffset, PlayerCount, NetXPos);
    //return;    
}

defaultproperties
{
    RemainingRoundTime="?? ??? ?? ??:"
    CurrentRound="???:"
    RoundSeparator="/"
    Defender="( ??? )"
    Attacker="( ??? )"
    WaitForReinforcements="???????. ?? ??? ?? ? ??? ?????."
    WaitingToSpawnReinforcements="??? ???? ?..."
    AutoRespawn="???? ?????..."
    YouWonRound="? ????? ???????!"
    YouLostRound="? ????? ???????!"
    PracticeRoundOver="?? ???? ?????."
}