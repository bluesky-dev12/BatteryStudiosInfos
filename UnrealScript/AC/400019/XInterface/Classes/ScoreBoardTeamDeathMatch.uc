class ScoreBoardTeamDeathMatch extends ScoreBoardDeathMatch
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Material TeamBoxMaterial[2];
var Material ScoreBack;
var Material FlagIcon;
var Material ScoreboardU;
var Color TeamColors[2];

simulated function UpdatePrecacheMaterials()
{
    super.UpdatePrecacheMaterials();
    //return;    
}

simulated event UpdateScoreBoard(Canvas Canvas)
{
    local PlayerReplicationInfo PRI, OwnerPRI;
    local int i, FontReduction, HeaderOffsetY, HeadFoot, PlayerBoxSizeY, BoxSpaceY;

    local float XL, YL, IconSize, MaxScaling, MessageFoot;

    local int BluePlayerCount, RedPlayerCount, RedOwnerOffset, BlueOwnerOffset, MaxPlayerCount;

    local PlayerReplicationInfo RedPRI[32], BluePRI;
    local Font MainFont;

    OwnerPRI = PlayerController(Owner).PlayerReplicationInfo;
    RedOwnerOffset = -1;
    BlueOwnerOffset = -1;
    i = 0;
    J0x36:

    // End:0x14D [Loop If]
    if(i < GRI.PRIArray.Length)
    {
        PRI = GRI.PRIArray[i];
        // End:0x143
        if((PRI.Team != none) && !PRI.bIsSpectator || PRI.bWaitingPlayer)
        {
            // End:0x105
            if(PRI.Team.TeamIndex == 0)
            {
                // End:0x102
                if(RedPlayerCount < 32)
                {
                    RedPRI[RedPlayerCount] = PRI;
                    // End:0xFB
                    if(PRI == OwnerPRI)
                    {
                        RedOwnerOffset = RedPlayerCount;
                    }
                    RedPlayerCount++;
                }
                // [Explicit Continue]
                goto J0x143;
            }
            // End:0x143
            if(BluePlayerCount < 32)
            {
                BluePRI[BluePlayerCount] = PRI;
                // End:0x13C
                if(PRI == OwnerPRI)
                {
                    BlueOwnerOffset = BluePlayerCount;
                }
                BluePlayerCount++;
            }
        }
        J0x143:

        i++;
        // [Loop Continue]
        goto J0x36;
    }
    MaxPlayerCount = Max(RedPlayerCount, BluePlayerCount);
    Canvas.Font = HudClass.static.GetMediumFontFor(Canvas);
    Canvas.StrLen("Test", XL, YL);
    IconSize = FMax(2.0000000 * YL, (64.0000000 * Canvas.ClipX) / float(1024));
    BoxSpaceY = int(0.2500000 * YL);
    // End:0x20E
    if(HaveHalfFont(Canvas, FontReduction))
    {
        PlayerBoxSizeY = int(2.1250000 * YL);        
    }
    else
    {
        PlayerBoxSizeY = int(1.7500000 * YL);
    }
    HeadFoot = int((float(4) * YL) + IconSize);
    MessageFoot = 1.5000000 * float(HeadFoot);
    // End:0x686
    if(float(MaxPlayerCount) > ((Canvas.ClipY - (1.5000000 * float(HeadFoot))) / float(PlayerBoxSizeY + BoxSpaceY)))
    {
        BoxSpaceY = int(0.1250000 * YL);
        // End:0x686
        if(float(MaxPlayerCount) > ((Canvas.ClipY - (1.5000000 * float(HeadFoot))) / float(PlayerBoxSizeY + BoxSpaceY)))
        {
            // End:0x686
            if(float(MaxPlayerCount) > ((Canvas.ClipY - (1.5000000 * float(HeadFoot))) / float(PlayerBoxSizeY + BoxSpaceY)))
            {
                FontReduction++;
                Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
                Canvas.StrLen("Test", XL, YL);
                BoxSpaceY = int(0.1250000 * YL);
                // End:0x392
                if(HaveHalfFont(Canvas, FontReduction))
                {
                    PlayerBoxSizeY = int(2.1250000 * YL);                    
                }
                else
                {
                    PlayerBoxSizeY = int(1.7500000 * YL);
                }
                HeadFoot = int((float(4) * YL) + IconSize);
                // End:0x686
                if(float(MaxPlayerCount) > ((Canvas.ClipY - (1.5000000 * float(HeadFoot))) / float(PlayerBoxSizeY + BoxSpaceY)))
                {
                    FontReduction++;
                    Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
                    Canvas.StrLen("Test", XL, YL);
                    BoxSpaceY = int(0.1250000 * YL);
                    // End:0x47A
                    if(HaveHalfFont(Canvas, FontReduction))
                    {
                        PlayerBoxSizeY = int(2.1250000 * YL);                        
                    }
                    else
                    {
                        PlayerBoxSizeY = int(1.7500000 * YL);
                    }
                    HeadFoot = int((float(4) * YL) + IconSize);
                    // End:0x686
                    if((Canvas.ClipY >= float(600)) && float(MaxPlayerCount) > ((Canvas.ClipY - float(HeadFoot)) / float(PlayerBoxSizeY + BoxSpaceY)))
                    {
                        FontReduction++;
                        Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
                        Canvas.StrLen("Test", XL, YL);
                        BoxSpaceY = int(0.1250000 * YL);
                        // End:0x577
                        if(HaveHalfFont(Canvas, FontReduction))
                        {
                            PlayerBoxSizeY = int(2.1250000 * YL);                            
                        }
                        else
                        {
                            PlayerBoxSizeY = int(1.7500000 * YL);
                        }
                        HeadFoot = int((float(4) * YL) + IconSize);
                        // End:0x686
                        if(float(MaxPlayerCount) > ((Canvas.ClipY - float(HeadFoot)) / float(PlayerBoxSizeY + BoxSpaceY)))
                        {
                            FontReduction++;
                            Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
                            Canvas.StrLen("Test", XL, YL);
                            BoxSpaceY = int(0.1250000 * YL);
                            // End:0x658
                            if(HaveHalfFont(Canvas, FontReduction))
                            {
                                PlayerBoxSizeY = int(2.1250000 * YL);                                
                            }
                            else
                            {
                                PlayerBoxSizeY = int(1.7500000 * YL);
                            }
                            HeadFoot = int((float(4) * YL) + IconSize);
                        }
                    }
                }
            }
        }
    }
    MaxPlayerCount = Min(MaxPlayerCount, int(float(1) + ((Canvas.ClipY - float(HeadFoot)) / float(PlayerBoxSizeY + BoxSpaceY))));
    // End:0x6DB
    if(FontReduction > 2)
    {
        MaxScaling = 3.0000000;        
    }
    else
    {
        MaxScaling = 2.1250000;
    }
    PlayerBoxSizeY = int(FClamp(((1.0000000 + (Canvas.ClipY - (0.6700000 * MessageFoot))) / float(MaxPlayerCount)) - float(BoxSpaceY), float(PlayerBoxSizeY), MaxScaling * YL));
    bDisplayMessages = float(MaxPlayerCount) < ((Canvas.ClipY - MessageFoot) / float(PlayerBoxSizeY + BoxSpaceY));
    RedPlayerCount = Min(RedPlayerCount, MaxPlayerCount);
    BluePlayerCount = Min(BluePlayerCount, MaxPlayerCount);
    // End:0x7A8
    if(RedOwnerOffset >= RedPlayerCount)
    {
        RedPlayerCount -= 1;
    }
    // End:0x7BF
    if(BlueOwnerOffset >= BluePlayerCount)
    {
        BluePlayerCount -= 1;
    }
    HeaderOffsetY = int((1.5000000 * YL) + IconSize);
    Canvas.Style = 1;
    DrawTitle(Canvas, float(HeaderOffsetY), float(MaxPlayerCount + 1) * float(PlayerBoxSizeY + BoxSpaceY), float(PlayerBoxSizeY));
    // End:0x90D
    if(GRI != none)
    {
        MainFont = Canvas.Font;
        i = 0;
        J0x844:

        // End:0x871 [Loop If]
        if(i < 32)
        {
            PRIArray[i] = RedPRI[i];
            i++;
            // [Loop Continue]
            goto J0x844;
        }
        DrawTeam(0, RedPlayerCount, RedOwnerOffset, Canvas, FontReduction, BoxSpaceY, PlayerBoxSizeY, HeaderOffsetY);
        Canvas.Font = MainFont;
        i = 0;
        J0x8B6:

        // End:0x8E3 [Loop If]
        if(i < 32)
        {
            PRIArray[i] = BluePRI[i];
            i++;
            // [Loop Continue]
            goto J0x8B6;
        }
        DrawTeam(1, BluePlayerCount, BlueOwnerOffset, Canvas, FontReduction, BoxSpaceY, PlayerBoxSizeY, HeaderOffsetY);
    }
    // End:0x936
    if(int(Level.NetMode) != int(NM_Standalone))
    {
        DrawMatchID(Canvas, FontReduction);
    }
    //return;    
}

function DrawTeam(int TeamNum, int PlayerCount, int OwnerOffset, Canvas Canvas, int FontReduction, int BoxSpaceY, int PlayerBoxSizeY, int HeaderOffsetY)
{
    local int i, OwnerPos, NetXPos, NameXPos, BoxTextOffsetY, ScoreXPos,
	    ScoreYPos, BoxXPos, BoxWidth, LineCount, NameY;

    local float XL, YL, IconScale, ScoreBackScale, ScoreYL, MaxNamePos,
	    LongestNameLength, oXL, oYL;

    local string PlayerName[32], OrdersText, LongestName;
    local Font MainFont, ReducedFont;
    local bool bHaveHalfFont, bNameFontReduction;
    local int SymbolUSize, SymbolVSize, OtherTeam, LastLine;

    BoxWidth = int(0.4700000 * Canvas.ClipX);
    BoxXPos = int(0.5000000 * ((0.5000000 * Canvas.ClipX) - float(BoxWidth)));
    BoxWidth = int((0.5000000 * Canvas.ClipX) - float(2 * BoxXPos));
    BoxXPos = int(float(BoxXPos) + ((float(TeamNum) * 0.5000000) * Canvas.ClipX));
    NameXPos = int(float(BoxXPos) + (0.0500000 * float(BoxWidth)));
    ScoreXPos = int(float(BoxXPos) + (0.5500000 * float(BoxWidth)));
    NetXPos = int(float(BoxXPos) + (0.7600000 * float(BoxWidth)));
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

    // End:0xB11 [Loop If]
    if(i < PlayerCount)
    {
        // End:0xB07
        if(i != OwnerOffset)
        {
            Canvas.SetPos(float(ScoreXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
            // End:0xAE2
            if(PRIArray[i].bOutOfLives)
            {
                Canvas.DrawText(OutText, true);
                // [Explicit Continue]
                goto J0xB07;
            }
            Canvas.DrawText(string(int(PRIArray[i].Score)), true);
        }
        J0xB07:

        i++;
        // [Loop Continue]
        goto J0xA61;
    }
    // End:0xDB5
    if(OwnerOffset >= 0)
    {
        // End:0xC78
        if(OwnerOffset >= PlayerCount)
        {
            OwnerPos = ((PlayerBoxSizeY + BoxSpaceY) * PlayerCount) + BoxTextOffsetY;
            Canvas.Style = 5;
            Canvas.SetPos(float(BoxXPos), float(HeaderOffsetY + ((PlayerBoxSizeY + BoxSpaceY) * PlayerCount)));
            Canvas.DrawTileStretched(TeamBoxMaterial[TeamNum], float(BoxWidth), float(PlayerBoxSizeY));
            Canvas.Style = 1;
            // End:0xC75
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
        // End:0xD06
        if(bNameFontReduction)
        {
            Canvas.Font = ReducedFont;
        }
        Canvas.DrawText(PlayerName[OwnerOffset], true);
        // End:0xD46
        if(bNameFontReduction)
        {
            Canvas.Font = GetSmallerFontFor(Canvas, FontReduction);
        }
        Canvas.SetPos(float(ScoreXPos), float(OwnerPos));
        // End:0xD90
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
    // End:0xDE4
    if(TeamNum == 0)
    {
        OtherTeam = 1;
    }
    // End:0xF14
    if((int(GRI.FlagState[OtherTeam]) != int(0)) && int(GRI.FlagState[OtherTeam]) != int(3))
    {
        i = 0;
        J0xE2B:

        // End:0xF14 [Loop If]
        if(i < PlayerCount)
        {
            // End:0xF0A
            if((PRIArray[i].HasFlag != none) || PRIArray[i] == GRI.FlagHolder[TeamNum])
            {
                Canvas.SetPos(float(NameXPos) - (float(48) * IconScale), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) - (float(16) * IconScale));
                Canvas.DrawTile(FlagIcon, 64.0000000 * IconScale, 32.0000000 * IconScale, 0.0000000, 0.0000000, 256.0000000, 128.0000000);
            }
            i++;
            // [Loop Continue]
            goto J0xE2B;
        }
    }
    // End:0x134F
    if((OwnerOffset >= 0) && Canvas.ClipX >= float(512))
    {
        BoxTextOffsetY = int((float(HeaderOffsetY) + (0.5000000 * float(PlayerBoxSizeY))) + float(NameY));
        Canvas.DrawColor = HudClass.default.CyanColor;
        // End:0xF94
        if(FontReduction > 3)
        {
            bHaveHalfFont = false;
        }
        // End:0xFDF
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
        J0x102F:

        // End:0x12E8 [Loop If]
        if(i < PlayerCount)
        {
            LineCount = 0;
            // End:0x1251
            if((PRIArray[i].bBot && TeamPlayerReplicationInfo(PRIArray[i]) != none) && TeamPlayerReplicationInfo(PRIArray[i]).Squad != none)
            {
                LineCount = 1;
                Canvas.SetPos(float(NameXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
                // End:0x114B
                if(Canvas.ClipX < float(800))
                {
                    OrdersText = (("(" $ PRIArray[i].GetCallSign()) $ ") ") $ TeamPlayerReplicationInfo(PRIArray[i]).Squad.GetShortOrderStringFor(TeamPlayerReplicationInfo(PRIArray[i]));                    
                }
                else
                {
                    OrdersText = TeamPlayerReplicationInfo(PRIArray[i]).Squad.GetOrderStringFor(TeamPlayerReplicationInfo(PRIArray[i]));
                    OrdersText = (("(" $ PRIArray[i].GetCallSign()) $ ") ") $ OrdersText;
                    Canvas.StrLen(OrdersText, oXL, oYL);
                    // End:0x123F
                    if(oXL >= float(ScoreXPos - NameXPos))
                    {
                        OrdersText = (("(" $ PRIArray[i].GetCallSign()) $ ") ") $ TeamPlayerReplicationInfo(PRIArray[i]).Squad.GetShortOrderStringFor(TeamPlayerReplicationInfo(PRIArray[i]));
                    }
                }
                Canvas.DrawText(OrdersText, true);
            }
            // End:0x12DE
            if(bHaveHalfFont || !PRIArray[i].bBot)
            {
                Canvas.SetPos(float(NameXPos), ((float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY)) + (float(LineCount) * YL));
                Canvas.DrawText(PRIArray[i].GetLocationName(), true);
            }
            i++;
            // [Loop Continue]
            goto J0x102F;
        }
        // End:0x134F
        if(OwnerOffset >= PlayerCount)
        {
            Canvas.SetPos(float(NameXPos), (float(PlayerBoxSizeY + BoxSpaceY) * float(i)) + float(BoxTextOffsetY));
            Canvas.DrawText(PRIArray[OwnerOffset].GetLocationName(), true);
        }
    }
    // End:0x136A
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
    TeamColors[0]=(R=255,G=0,B=0,A=255)
    TeamColors[1]=(R=0,G=0,B=255,A=255)
    FragLimit="Score limit: "
}