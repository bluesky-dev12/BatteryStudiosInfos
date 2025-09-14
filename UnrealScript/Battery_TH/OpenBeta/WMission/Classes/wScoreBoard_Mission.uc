class wScoreBoard_Mission extends ScoreBoardTeamDeathMatch
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
    local wMSGameReplicationInfo ASGRI;

    ASGRI = wMSGameReplicationInfo(GRI);
    InfoString = super(ScoreBoardDeathMatch).GetTitleString();
    // End:0xEA
    if((((ASGRI != none) && Controller(Owner) != none) && Controller(Owner).PlayerReplicationInfo != none) && Controller(Owner).PlayerReplicationInfo.Team != none)
    {
        ownerTeam = byte(Controller(Owner).PlayerReplicationInfo.Team.TeamIndex);
        // End:0xD8
        if(int(ownerTeam) != int(byte(ASGRI.CurrentAttackingTeam)))
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
    local wMSGameReplicationInfo ASGRI;

    ASGRI = wMSGameReplicationInfo(GRI);
    // End:0x39
    if(int(ASGRI.RoundWinner) != int(0))
    {
        return ASGRI.GetRoundWinnerString();
    }
    // End:0xB9
    if(((Controller(Owner).PlayerReplicationInfo != none) && wMSPlayerReplicationInfo(Controller(Owner).PlayerReplicationInfo).bAutoRespawn) && !Controller(Owner).IsInState('PlayerWaiting'))
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
    local wMSGameReplicationInfo ASGRI;

    ASGRI = wMSGameReplicationInfo(GRI);
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
    Canvas.Style = 1;
    Canvas.DrawColor = TeamColors[TeamNum];
    Canvas.SetPos(((0.2500000 + (0.5000000 * float(TeamNum))) * Canvas.ClipX) - (float(SymbolUSize + 32) * IconScale), float(ScoreYPos));
    MainFont = Canvas.Font;
    Canvas.Font = HudClass.static.LargerFontThan(MainFont);
    Canvas.StrLen("TEST", XL, ScoreYL);
    // End:0x301
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
    // End:0x405
    if(PlayerCount <= 0)
    {
        return;
    }
    // End:0x430
    if(TeamNum == 0)
    {
        Canvas.DrawColor = HudClass.default.RedColor;        
    }
    else
    {
        Canvas.DrawColor = HudClass.default.BlueColor;
    }
    // End:0x46D
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
    J0x4B7:

    // End:0x54C [Loop If]
    if(i < PlayerCount)
    {
        PlayerName[i] = GRI.PRIArray[i].PlayerName;
        Canvas.StrLen(PlayerName[i], XL, YL);
        // End:0x542
        if(XL > FMax(LongestNameLength, MaxNamePos))
        {
            LongestName = PlayerName[i];
            LongestNameLength = XL;
        }
        i++;
        // [Loop Continue]
        goto J0x4B7;
    }
    // End:0x5D7
    if(OwnerOffset >= PlayerCount)
    {
        PlayerName[OwnerOffset] = GRI.PRIArray[OwnerOffset].PlayerName;
        Canvas.StrLen(PlayerName[OwnerOffset], XL, YL);
        // End:0x5D7
        if(XL > FMax(LongestNameLength, MaxNamePos))
        {
            LongestName = PlayerName[i];
            LongestNameLength = XL;
        }
    }
    // End:0x6BC
    if(LongestNameLength > float(0))
    {
        bNameFontReduction = true;
        Canvas.Font = GetSmallerFontFor(Canvas, FontReduction + 1);
        Canvas.StrLen(LongestName, XL, YL);
        // End:0x6A8
        if(XL > MaxNamePos)
        {
            Canvas.Font = GetSmallerFontFor(Canvas, FontReduction + 2);
            Canvas.StrLen(LongestName, XL, YL);
            // End:0x6A8
            if(XL > MaxNamePos)
            {
                Canvas.Font = GetSmallerFontFor(Canvas, FontReduction + 3);
            }
        }
        ReducedFont = Canvas.Font;
    }
    i = 0;
    J0x6C3:

    // End:0x764 [Loop If]
    if(i < PlayerCount)
    {
        PlayerName[i] = PRIArray[i].PlayerName;
        Canvas.StrLen(PlayerName[i], XL, YL);
        // End:0x75A
        if(XL > MaxNamePos)
        {
            PlayerName[i] = Left(PlayerName[i], int((MaxNamePos / XL) * float(Len(PlayerName[i]))));
        }
        i++;
        // [Loop Continue]
        goto J0x6C3;
    }
    // End:0x7FB
    if(OwnerOffset >= PlayerCount)
    {
        PlayerName[OwnerOffset] = PRIArray[OwnerOffset].PlayerName;
        Canvas.StrLen(PlayerName[OwnerOffset], XL, YL);
        // End:0x7FB
        if(XL > MaxNamePos)
        {
            PlayerName[OwnerOffset] = Left(PlayerName[OwnerOffset], int((MaxNamePos / XL) * float(Len(PlayerName[OwnerOffset]))));
        }
    }
    // End:0x82C
    if(Canvas.ClipX < float(512))
    {
        NameY = int(0.5000000 * YL);        
    }
    else
    {
        // End:0x84B
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
    // End:0x981
    if(OwnerOffset == -1)
    {
        i = 0;
        J0x908:

        // End:0x97E [Loop If]
        if(i < PlayerCount)
        {
            // End:0x974
            if(i != OwnerOffset)
            {
                Canvas.SetPos(float(NameXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
                Canvas.DrawText(PlayerName[i], true);
            }
            i++;
            // [Loop Continue]
            goto J0x908;
        }        
    }
    else
    {
        i = 0;
        J0x988:

        // End:0xA15 [Loop If]
        if(i < PlayerCount)
        {
            // End:0xA0B
            if(i != OwnerOffset)
            {
                Canvas.SetPos(float(NameXPos), (((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - (0.5000000 * YL)) + float(NameY));
                Canvas.DrawText(PlayerName[i], true);
            }
            i++;
            // [Loop Continue]
            goto J0x988;
        }
    }
    // End:0xA3D
    if(bNameFontReduction)
    {
        Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
    }
    Canvas.DrawColor = HudClass.default.WhiteColor;
    i = 0;
    J0xA61:

    // End:0xAE4 [Loop If]
    if(i < PlayerCount)
    {
        // End:0xADA
        if(i != OwnerOffset)
        {
            Canvas.SetPos(float(ScoreXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
            Canvas.DrawText(string(int(PRIArray[i].Score)), true);
        }
        i++;
        // [Loop Continue]
        goto J0xA61;
    }
    Canvas.StrLen("0", TX, ty);
    BackupFont = Canvas.Font;
    Canvas.Font = Class'XInterface.UT2MidGameFont'.static.GetMidGameFont(int(Canvas.ClipX));
    i = 0;
    J0xB46:

    // End:0xCDC [Loop If]
    if(i < PlayerCount)
    {
        // End:0xCD2
        if(wMSPlayerReplicationInfo(PRIArray[i]) != none)
        {
            wMSPlayerReplicationInfo(PRIArray[i]).TrophiesXOffset = 32.0000000;
            // End:0xCD2
            if(int(wMSPlayerReplicationInfo(PRIArray[i]).DestroyedVehicles) > 0)
            {
                TrophiesXOffset = wMSPlayerReplicationInfo(PRIArray[i]).TrophiesXOffset;
                wMSPlayerReplicationInfo(PRIArray[i]).TrophiesXOffset += float(32);
                // End:0xCD2
                if(int(wMSPlayerReplicationInfo(PRIArray[i]).DestroyedVehicles) > 1)
                {
                    Temp = string(wMSPlayerReplicationInfo(PRIArray[i]).DestroyedVehicles);
                    Canvas.StrLen(Temp, XL, YL);
                    Canvas.SetPos((float(ScoreXPos) - (((TrophiesXOffset - float(16)) + float(8)) * IconScale)) - (XL * 0.5000000), (((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) + (ty * 0.5000000)) - (YL * 0.5000000));
                    Canvas.DrawText(Temp, true);
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0xB46;
    }
    i = 0;
    J0xCE3:

    // End:0xE5A [Loop If]
    if(i < PlayerCount)
    {
        // End:0xE50
        if(wMSPlayerReplicationInfo(PRIArray[i]) != none)
        {
            // End:0xE50
            if(int(wMSPlayerReplicationInfo(PRIArray[i]).DisabledObjectivesCount) > 0)
            {
                TrophiesXOffset = wMSPlayerReplicationInfo(PRIArray[i]).TrophiesXOffset;
                wMSPlayerReplicationInfo(PRIArray[i]).TrophiesXOffset += float(32);
                // End:0xE50
                if(int(wMSPlayerReplicationInfo(PRIArray[i]).DisabledObjectivesCount) > 1)
                {
                    Temp = string(wMSPlayerReplicationInfo(PRIArray[i]).DisabledObjectivesCount);
                    Canvas.StrLen(Temp, XL, YL);
                    Canvas.SetPos((float(ScoreXPos) - (((TrophiesXOffset - float(16)) + float(8)) * IconScale)) - (XL * 0.5000000), (((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) + (ty * 0.5000000)) - (YL * 0.5000000));
                    Canvas.DrawText(Temp, true);
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0xCE3;
    }
    i = 0;
    J0xE61:

    // End:0xFD8 [Loop If]
    if(i < PlayerCount)
    {
        // End:0xFCE
        if(wMSPlayerReplicationInfo(PRIArray[i]) != none)
        {
            // End:0xFCE
            if(int(wMSPlayerReplicationInfo(PRIArray[i]).DisabledFinalObjective) > 0)
            {
                TrophiesXOffset = wMSPlayerReplicationInfo(PRIArray[i]).TrophiesXOffset;
                wMSPlayerReplicationInfo(PRIArray[i]).TrophiesXOffset += float(32);
                // End:0xFCE
                if(int(wMSPlayerReplicationInfo(PRIArray[i]).DisabledFinalObjective) > 1)
                {
                    Temp = string(wMSPlayerReplicationInfo(PRIArray[i]).DisabledFinalObjective);
                    Canvas.StrLen(Temp, XL, YL);
                    Canvas.SetPos((float(ScoreXPos) - (((TrophiesXOffset - float(16)) + float(8)) * IconScale)) - (XL * 0.5000000), (((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) + (ty * 0.5000000)) - (YL * 0.5000000));
                    Canvas.DrawText(Temp, true);
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0xE61;
    }
    Canvas.Font = BackupFont;
    // End:0x1290
    if(OwnerOffset >= 0)
    {
        // End:0x1153
        if(OwnerOffset >= PlayerCount)
        {
            OwnerPos = ((PlayerBoxSizeY + BoxSpaceY) * PlayerCount) + BoxTextOffsetY;
            Canvas.Style = 5;
            Canvas.SetPos(float(BoxXPos), float(HeaderOffsetY + ((PlayerBoxSizeY + BoxSpaceY) * PlayerCount)));
            Canvas.DrawTileStretched(TeamBoxMaterial[TeamNum], float(BoxWidth), float(PlayerBoxSizeY));
            Canvas.Style = 1;
            // End:0x1150
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
        // End:0x11E1
        if(bNameFontReduction)
        {
            Canvas.Font = ReducedFont;
        }
        Canvas.DrawText(PlayerName[OwnerOffset], true);
        // End:0x1221
        if(bNameFontReduction)
        {
            Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
        }
        Canvas.SetPos(float(ScoreXPos), float(OwnerPos));
        // End:0x126B
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
    // End:0x12BF
    if(TeamNum == 0)
    {
        OtherTeam = 1;
    }
    // End:0x16FA
    if((OwnerOffset >= 0) && Canvas.ClipX >= float(512))
    {
        BoxTextOffsetY = int((float(HeaderOffsetY) + (0.5000000 * float(PlayerBoxSizeY))) + float(NameY));
        Canvas.DrawColor = HudClass.default.CyanColor;
        // End:0x133F
        if(FontReduction > 3)
        {
            bHaveHalfFont = false;
        }
        // End:0x138A
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
        J0x13DA:

        // End:0x1693 [Loop If]
        if(i < PlayerCount)
        {
            LineCount = 0;
            // End:0x15FC
            if((PRIArray[i].bBot && TeamPlayerReplicationInfo(PRIArray[i]) != none) && TeamPlayerReplicationInfo(PRIArray[i]).Squad != none)
            {
                LineCount = 1;
                Canvas.SetPos(float(NameXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
                // End:0x14F6
                if(Canvas.ClipX < float(800))
                {
                    OrdersText = (("(" $ PRIArray[i].GetCallSign()) $ ") ") $ TeamPlayerReplicationInfo(PRIArray[i]).Squad.GetShortOrderStringFor(TeamPlayerReplicationInfo(PRIArray[i]));                    
                }
                else
                {
                    OrdersText = TeamPlayerReplicationInfo(PRIArray[i]).Squad.GetOrderStringFor(TeamPlayerReplicationInfo(PRIArray[i]));
                    OrdersText = (("(" $ PRIArray[i].GetCallSign()) $ ") ") $ OrdersText;
                    Canvas.StrLen(OrdersText, oXL, oYL);
                    // End:0x15EA
                    if(oXL >= float(ScoreXPos - NameXPos))
                    {
                        OrdersText = (("(" $ PRIArray[i].GetCallSign()) $ ") ") $ TeamPlayerReplicationInfo(PRIArray[i]).Squad.GetShortOrderStringFor(TeamPlayerReplicationInfo(PRIArray[i]));
                    }
                }
                Canvas.DrawText(OrdersText, true);
            }
            // End:0x1689
            if(bHaveHalfFont || !PRIArray[i].bBot)
            {
                Canvas.SetPos(float(NameXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) + (float(LineCount) * YL));
                Canvas.DrawText(PRIArray[i].GetLocationName(), true);
            }
            i++;
            // [Loop Continue]
            goto J0x13DA;
        }
        // End:0x16FA
        if(OwnerOffset >= PlayerCount)
        {
            Canvas.SetPos(float(NameXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
            Canvas.DrawText(PRIArray[OwnerOffset].GetLocationName(), true);
        }
    }
    // End:0x1715
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
    RemainingRoundTime="Remaining round time:"
    CurrentRound="Round:"
    RoundSeparator="/"
    Defender="( Defender )"
    Attacker="( Attacker )"
    WaitForReinforcements="   You were killed. Reinforcements in"
    WaitingToSpawnReinforcements="Waiting for reinforcements..."
    AutoRespawn="Automatically respawning in..."
    YouWonRound="You've won the round!"
    YouLostRound="You've lost the round."
    PracticeRoundOver="Practice round over."
}