/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\xScoreBoardTeamGameResult.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:139
 *	Functions:12
 *
 *******************************************************************************/
class xScoreBoardTeamGameResult extends xScoreBoard
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() SpriteWidget SpBG;
var() SpriteWidget SpTeam;
var() SpriteWidget SpWin;
var() SpriteWidget SpSelection;
var() SpriteWidget SpSelectLine;
var() SpriteWidget SpTeamNameEmphasis;
var() SpriteWidget SpControlBG;
var() SpriteWidget SpPlayerNameBG;
var() SpriteWidget WSBOutLine;
var() SpriteWidget WSBBG;
var() SpriteWidget WSBBGInput;
var() SpriteWidget WTxtResultBoard;
var() SpriteWidget WMarkAF;
var() SpriteWidget WMarkRSA;
var() SpriteWidget WResultMVP;
var() SpriteWidget WGaugeBar1;
var() SpriteWidget WGaugeBar2;
var() SpriteWidget WBonusItemBG;
var() SpriteWidget WMyInfoBG;
var() array<SpriteWidget> WCommBtn;
var() array<SpriteWidget> WStripeBar;
var() SpriteWidget WIconMaster;
var() SpriteWidget WIconPCBang;
var() SpriteWidget WIconMVP;
var int MAX_TEAM;
var Material BackImage;
var int BackImageWidth;
var int BackImageHeight;
var float BGBeginX;
var float BGBeginY;
var float BGWidth;
var float BGHeight;
var float ControlBeginX;
var float ControlBeginY;
var float ControlWidth;
var float ControlHeight;
var float PlayerNameBeginX;
var float PlayerNameBeginY;
var float PlayerNameWidth;
var float PlayerNameHeight;
var float PlayerNameFontSize;
var float TeamBeginX;
var float TeamBeginY;
var float TeamOffsetY;
var float TeamWidth;
var float TeamHeight;
var float TeamNameBeginX;
var float TeamNameBeginY;
var float TeamNameWidth;
var float TeamNameHeight;
var float TeamNameFontSize;
var float TeamWinnerBeginX;
var float TeamWinnerBeginY;
var float TeamWinnerWidth;
var float TeamWinnerHeight;
var float TeamMemberClanBeginX;
var float TeamMemberClanWidth;
var float TeamMemberRankBeginX;
var float TeamMemberRankWidth;
var float TeamMemberNicknameBeginX;
var float TeamMemberNicknameWidth;
var float TeamMemberItemBeginX;
var float TeamMemberItemWidth;
var float TeamMemberClanNameBeginX;
var float TeamMemberClanNameWidth;
var float TeamMemberScoreBeginX;
var float TeamMemberScoreWidth;
var float TeamMemberKillBeginX;
var float TeamMemberKillWidth;
var float TeamMemberAssistBeginX;
var float TeamMemberAssistWidth;
var float TeamMemberDeathBeginX;
var float TeamMemberDeathWidth;
var float TeamMemberBonusBeginX;
var float TeamMemberBonusWidth;
var float TeamMemberBonus_1_BeginX;
var float TeamMemberBonus_1_Width;
var float TeamMemberBonus_2_BeginX;
var float TeamMemberBonus_2_Width;
var float TeamMemberBonus_3_BeginX;
var float TeamMemberBonus_3_Width;
var float TeamMemberExpBeginX;
var float TeamMemberExpWidth;
var float TeamMemberPointBeginX;
var float TeamMemberPointWidth;
var float TeamMemberBeginY;
var float TeamMemberHeight;
var float TeamMemberHeightOffset;
var float TeamMemberFontSize;
var float TeamNameEmphasisBeginX;
var float TeamNameEmphasisBeginY;
var float TeamNameEmphasisWidth;
var float TeamNameEmphasisHeight;
var Color DefaultFontColor;
var float fMvpNameTextX1;
var float fMvpNameTextX2;
var float fMvpNameTextY1;
var float fMvpNameTextY2;
var float fTeamScoreAFY1;
var float fTeamScoreAFY2;
var float fTeamScoreRSAY1;
var float fTeamScoreRSAY2;
var float fTeamScoreTxtX1;
var float fTeamScoreTxtX2;
var float fTeamScoreTxtAFY1;
var float fTeamScoreTxtAFY2;
var float fTeamScoreTxtRSAY1;
var float fTeamScoreTxtRSAY2;
var float fBonusX1;
var float fBonusX2;
var float fExpX1;
var float fExpX2;
var float fPointX1;
var float fPointX2;
var float fClanTextX1;
var float fClanTextX2;
var float fTxtExpX1;
var float fTxtExpX2;
var float fTxtExpY1;
var float fTxtExpY2;
var float fTxt2ExpX1;
var float fTxt2ExpX2;
var float fTxt2ExpY1;
var float fTxt2ExpY2;
var float fTxtPointX1;
var float fTxtPointX2;
var float fTxtPointY1;
var float fTxtPointY2;
var float fTxt2PointX1;
var float fTxt2PointX2;
var float fTxt2PointY1;
var float fTxt2PointY2;
var float fMyInfoFontSize;
var float fTxtOKX1;
var float fTxtOKX2;
var float fTxtOKY1;
var float fTxtOKY2;
var float fOKFontSize;
var bool bResultBGMPlayed;

function HudBase GetHudBaseOwner()
{
    return HudBase(HudOwner);
}

function DrawBonusItem(Canvas C)
{
    local CalCoordsW calW;
    local int iTeam, iCount, iItem;

    iTeam = 0;
    J0x07:
    // End:0x10a [While If]
    if(iTeam < MAX_TEAM)
    {
        iCount = 0;
        J0x1d:
        // End:0x100 [While If]
        if(iCount < 8)
        {
            iItem = 0;
            J0x30:
            // End:0xf6 [While If]
            if(iItem < 3)
            {
                WBonusItemBG.OffsetX = 672 + iItem * 34;
                WBonusItemBG.OffsetY = 107 + iTeam * 284 + iCount * 34;
                CalculateCoordinate(C, WBonusItemBG, 30.0, 30.0, calW);
                C.SetPos(calW.X1, calW.Y1);
                C.DrawTilePartialStretched(WBonusItemBG.WidgetTexture, calW.XL, calW.YL);
                ++ iItem;
                // This is an implied JumpToken; Continue!
                goto J0x30;
            }
            ++ iCount;
            // This is an implied JumpToken; Continue!
            goto J0x1d;
        }
        ++ iTeam;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function DrawBGS(Canvas C)
{
    local CalCoordsW calW;
    local float X1, Y1, W, H;

    C.SetPos(0.0, 0.0);
    C.DrawTile(BackImage, C.ClipX, C.ClipY, 0.0, 0.0, float(BackImageWidth), float(BackImageHeight));
    X1 = BGBeginX * C.ClipX;
    Y1 = BGBeginY * C.ClipY;
    W = BGWidth * C.ClipX;
    H = BGHeight * C.ClipY;
    C.SetPos(X1, Y1);
    C.DrawTile(SpBG.WidgetTexture, W, H, float(SpBG.TextureCoords.X1), float(SpBG.TextureCoords.Y1), float(SpBG.TextureCoords.X2 - SpBG.TextureCoords.X1), float(SpBG.TextureCoords.Y2 - SpBG.TextureCoords.Y1));
    WSBBGInput.OffsetX = 335;
    WSBBGInput.OffsetY = 20;
    CalculateCoordinate(C, WSBBGInput, 353.0, 42.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBGInput.WidgetTexture, calW.XL, calW.YL);
    WSBBGInput.OffsetX = 84;
    WSBBGInput.OffsetY = 73;
    CalculateCoordinate(C, WSBBGInput, 855.0, 23.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBGInput.WidgetTexture, calW.XL, calW.YL);
    WSBOutLine.OffsetX = 84;
    WSBOutLine.OffsetY = 96;
    CalculateCoordinate(C, WSBOutLine, 855.0, 575.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBOutLine.WidgetTexture, calW.XL, calW.YL);
    WSBBG.OffsetX = 91;
    WSBBG.OffsetY = 103;
    CalculateCoordinate(C, WSBBG, 841.0, 277.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG.WidgetTexture, calW.XL, calW.YL);
    WSBBG.OffsetX = 91;
    WSBBG.OffsetY = 387;
    CalculateCoordinate(C, WSBBG, 841.0, 277.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG.WidgetTexture, calW.XL, calW.YL);
    CalculateCoordinate(C, WMarkAF, 63.0, 255.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WMarkAF.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    CalculateCoordinate(C, WMarkRSA, 63.0, 255.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WMarkRSA.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    CalculateCoordinate(C, WTxtResultBoard, 59.0, 14.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WTxtResultBoard.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    X1 = ControlBeginX * C.ClipX;
    Y1 = ControlBeginY * C.ClipY;
    W = ControlWidth * C.ClipX;
    H = ControlHeight * C.ClipY;
    C.SetPos(X1, Y1);
    C.DrawTile(SpControlBG.WidgetTexture, W, H, float(SpControlBG.TextureCoords.X1), float(SpControlBG.TextureCoords.Y1), float(SpControlBG.TextureCoords.X2 - SpControlBG.TextureCoords.X1), float(SpControlBG.TextureCoords.Y2 - SpControlBG.TextureCoords.Y1));
    DrawBonusItem(C);
}

function DrawTeamScore(Canvas C)
{
    local CalCoordsW calW;
    local int iTeamScore;
    local wMatchMaker MM;

    MM = Level.GetMatchMaker();
    WSBBGInput.OffsetX = 91;
    WSBBGInput.OffsetY = 357;
    CalculateCoordinate(C, WSBBGInput, 63.0, 23.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBGInput.WidgetTexture, calW.XL, calW.YL);
    C.BtrDrawTextJustified(TeamScore, 1, C.ClipX * fTeamScoreTxtX1, C.ClipY * fTeamScoreTxtAFY1, C.ClipX * fTeamScoreTxtX2, C.ClipY * fTeamScoreTxtAFY2, int(ContentFontSize * C.ClipY));
    WSBBGInput.OffsetX = 91;
    WSBBGInput.OffsetY = 641;
    CalculateCoordinate(C, WSBBGInput, 63.0, 23.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBGInput.WidgetTexture, calW.XL, calW.YL);
    C.BtrDrawTextJustified(TeamScore, 1, C.ClipX * fTeamScoreTxtX1, C.ClipY * fTeamScoreTxtRSAY1, C.ClipX * fTeamScoreTxtX2, C.ClipY * fTeamScoreTxtRSAY2, int(ContentFontSize * C.ClipY));
    C.DrawColor = ContentFontColor;
    iTeamScore = MM.ResultTeamScores[0];
    Score = "" $ string(iTeamScore) $ "";
    C.BtrDrawTextJustified(Score, 1, C.ClipX * fTeamScoreX1, C.ClipY * fTeamScoreAFY1, C.ClipX * fTeamScoreX2, C.ClipY * fTeamScoreAFY2, int(ContentFontSize * C.ClipY));
    iTeamScore = MM.ResultTeamScores[1];
    Score = "" $ string(iTeamScore) $ "";
    C.BtrDrawTextJustified(Score, 1, C.ClipX * fTeamScoreX1, C.ClipY * fTeamScoreRSAY1, C.ClipX * fTeamScoreX2, C.ClipY * fTeamScoreRSAY2, int(ContentFontSize * C.ClipY));
}

function DrawTeamListSectionStripe(Canvas C)
{
    local CalCoordsW calW;
    local int iTeam, iMemberCount, Y1;

    iTeam = 0;
    J0x07:
    // End:0x127 [While If]
    if(iTeam < 2)
    {
        iMemberCount = 0;
        J0x1a:
        // End:0x11d [While If]
        if(iMemberCount < 8)
        {
            Y1 = 105 + iTeam * 284 + iMemberCount * 34;
            WStripeBar[int(float(iMemberCount) % float(2))].OffsetX = 155;
            WStripeBar[int(float(iMemberCount) % float(2))].OffsetY = Y1;
            CalculateCoordinate(C, WStripeBar[int(float(iMemberCount) % float(2))], 774.0, 34.0, calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTilePartialStretched(WStripeBar[int(float(iMemberCount) % float(2))].WidgetTexture, calW.XL, calW.YL);
            ++ iMemberCount;
            // This is an implied JumpToken; Continue!
            goto J0x1a;
        }
        ++ iTeam;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function DrawBGs_O(Canvas C)
{
    local float X1, Y1, X2, Y2, W, H;

    C.SetPos(0.0, 0.0);
    C.DrawTile(BackImage, C.ClipX, C.ClipY, 0.0, 0.0, float(BackImageWidth), float(BackImageHeight));
    X1 = BGBeginX * C.ClipX;
    Y1 = BGBeginY * C.ClipY;
    W = BGWidth * C.ClipX;
    H = BGHeight * C.ClipY;
    C.SetPos(X1, Y1);
    C.DrawTile(SpBG.WidgetTexture, W, H, float(SpBG.TextureCoords.X1), float(SpBG.TextureCoords.Y1), float(SpBG.TextureCoords.X2 - SpBG.TextureCoords.X1), float(SpBG.TextureCoords.Y2 - SpBG.TextureCoords.Y1));
    X1 = ControlBeginX * C.ClipX;
    Y1 = ControlBeginY * C.ClipY;
    W = ControlWidth * C.ClipX;
    H = ControlHeight * C.ClipY;
    C.SetPos(X1, Y1);
    C.DrawTile(SpControlBG.WidgetTexture, W, H, float(SpControlBG.TextureCoords.X1), float(SpControlBG.TextureCoords.Y1), float(SpControlBG.TextureCoords.X2 - SpControlBG.TextureCoords.X1), float(SpControlBG.TextureCoords.Y2 - SpControlBG.TextureCoords.Y1));
    X1 = PlayerNameBeginX * C.ClipX;
    Y1 = PlayerNameBeginY * C.ClipY;
    W = PlayerNameWidth * C.ClipX;
    H = PlayerNameHeight * C.ClipY;
    X2 = X1 + W;
    Y2 = Y1 + H;
    C.SetPos(X1, Y1);
    C.DrawTile(SpPlayerNameBG.WidgetTexture, W, H, float(SpPlayerNameBG.TextureCoords.X1), float(SpPlayerNameBG.TextureCoords.Y1), float(SpPlayerNameBG.TextureCoords.X2 - SpPlayerNameBG.TextureCoords.X1), float(SpPlayerNameBG.TextureCoords.Y2 - SpPlayerNameBG.TextureCoords.Y1));
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustified(HudOwner.PlayerOwner.PlayerReplicationInfo.PlayerName, 1, X1, Y1, X2, Y2, int(PlayerNameFontSize * C.ClipY));
}

function DrawContentDescription(Canvas C)
{
    C.DrawColor = ContentFontColor;
    C.BtrDrawTextJustified(Clan, 1, C.ClipX * fClanX1, C.ClipY * fContentBeginY, C.ClipX * fClanX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY));
    C.BtrDrawTextJustified(Rank, 1, C.ClipX * fRankX1, C.ClipY * fContentBeginY, C.ClipX * fRankX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY));
    C.BtrDrawTextJustified(NickName, 1, C.ClipX * fNickNameX1, C.ClipY * fContentBeginY, C.ClipX * fNickNameX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY));
    C.BtrDrawTextJustified(Clan, 1, C.ClipX * fClanTextX1, C.ClipY * fContentBeginY, C.ClipX * fClanTextX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY));
    C.BtrDrawTextJustified(Score, 1, C.ClipX * fScoreX1, C.ClipY * fContentBeginY, C.ClipX * fScoreX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY));
    C.BtrDrawTextJustified(Kill, 1, C.ClipX * fKillX1, C.ClipY * fContentBeginY, C.ClipX * fKillX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY));
    C.BtrDrawTextJustified(Assist, 1, C.ClipX * fAssistX1, C.ClipY * fContentBeginY, C.ClipX * fAssistX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY));
    C.BtrDrawTextJustified(Death, 1, C.ClipX * fDeathX1, C.ClipY * fContentBeginY, C.ClipX * fDeathX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY));
    C.BtrDrawTextJustified(bonus, 1, C.ClipX * fBonusX1, C.ClipY * fContentBeginY, C.ClipX * fBonusX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY));
    C.BtrDrawTextJustified(Exp, 1, C.ClipX * fExpX1, C.ClipY * fContentBeginY, C.ClipX * fExpX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY));
    C.BtrDrawTextJustified(Point, 1, C.ClipX * fPointX1, C.ClipY * fContentBeginY, C.ClipX * fPointX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY));
}

function int GetWinTeamIndex()
{
    local int lpTeam, maxTeamIndex;
    local float MaxScore;
    local wMatchMaker MM;

    MM = Level.GetMatchMaker();
    maxTeamIndex = 0;
    MaxScore = float(MM.ResultTeamScores[0]);
    lpTeam = 1;
    J0x3b:
    // End:0x9b [While If]
    if(lpTeam < MAX_TEAM)
    {
        // End:0x91
        if(float(MM.ResultTeamScores[lpTeam]) > MaxScore)
        {
            MaxScore = float(MM.ResultTeamScores[lpTeam]);
            maxTeamIndex = lpTeam;
        }
        ++ lpTeam;
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    return maxTeamIndex;
}

function DrawTeam(Canvas C)
{
    local int lpTeam;
    local float X1, Y1, W, H;
    local int winTeamIndex;

    winTeamIndex = GetWinTeamIndex();
    lpTeam = 0;
    J0x13:
    // End:0x159 [While If]
    if(lpTeam < MAX_TEAM)
    {
        // End:0x14f
        if(lpTeam == winTeamIndex)
        {
            X1 = TeamWinnerBeginX * C.ClipX;
            Y1 = TeamWinnerBeginY + TeamOffsetY * float(lpTeam) * C.ClipY;
            W = TeamWinnerWidth * C.ClipX;
            H = TeamWinnerHeight * C.ClipY;
            C.SetPos(X1, Y1);
            C.DrawTile(SpWin.WidgetTexture, W, H, float(SpWin.TextureCoords.X1), float(SpWin.TextureCoords.Y1), float(SpWin.TextureCoords.X2 - SpWin.TextureCoords.X1), float(SpWin.TextureCoords.Y2 - SpWin.TextureCoords.Y1));
        }
        ++ lpTeam;
        // This is an implied JumpToken; Continue!
        goto J0x13;
    }
    // End:0x25a
    if(bResultBGMPlayed == false)
    {
        bResultBGMPlayed = true;
        // End:0x1f6
        if(HudOwner.PlayerOwner.GetTeamNum() == winTeamIndex)
        {
            // End:0x1c8
            if(winTeamIndex == 0)
            {
                class'wMessage_BGM'.static.ClientReceive(HudOwner.PlayerOwner, class'wMessage_BGM'.default.Code_WinAF);
            }
            // End:0x1f3
            else
            {
                class'wMessage_BGM'.static.ClientReceive(HudOwner.PlayerOwner, class'wMessage_BGM'.default.Code_WinRSA);
            }
        }
        // End:0x25a
        else
        {
            // End:0x22f
            if(winTeamIndex == 0)
            {
                class'wMessage_BGM'.static.ClientReceive(HudOwner.PlayerOwner, class'wMessage_BGM'.default.Code_LoseRSA);
            }
            // End:0x25a
            else
            {
                class'wMessage_BGM'.static.ClientReceive(HudOwner.PlayerOwner, class'wMessage_BGM'.default.Code_LoseAF);
            }
        }
    }
}

function DrawTeamMember(Canvas C)
{
    local int lpTeam, lpPRI, Count;
    local float X1, Y1, X2, Y2, FontSize;

    local wMatchMaker MM;
    local CalCoordsW calW;
    local Material Mark;
    local float markWidth, markHeight, markX1, markY1;

    markWidth = 24.0;
    markHeight = 24.0;
    MM = Level.GetMatchMaker();
    FontSize = TeamMemberFontSize * C.ClipY;
    lpTeam = 0;
    J0x4d:
    // End:0xa04 [While If]
    if(lpTeam < MAX_TEAM)
    {
        Count = 0;
        lpPRI = 0;
        J0x6a:
        // End:0x9fa [While If]
        if(lpPRI < MM.ResultInfos.Length)
        {
            // End:0x9f0
            if(MM.ResultInfos[lpPRI].Team == lpTeam)
            {
                Y1 = TeamMemberBeginY + float(lpTeam) * TeamOffsetY + float(Count) * TeamMemberHeightOffset * C.ClipY;
                Y2 = Y1 + TeamMemberHeight * C.ClipY;
                // End:0x236
                if(Mark != none)
                {
                    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
                    markX1 = 159.0 / float(1024) * C.ClipX;
                    markY1 = 107.0 + float(lpTeam * 284) + float(Count * 34) / float(768) * C.ClipY;
                    C.SetPos(markX1, markY1);
                    C.DrawTile(Mark, 31.0 / float(1024) * C.ClipX, 29.0 / float(768) * C.ClipY, 0.0, 0.0, float(Mark.MaterialUSize()), float(Mark.MaterialVSize()));
                }
                // End:0x369
                if(Mark != none)
                {
                    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
                    markX1 = 193.0 / float(1024) * C.ClipX;
                    markY1 = 107.0 + float(lpTeam * 284) + float(Count * 34) / float(768) * C.ClipY;
                    C.SetPos(markX1, markY1);
                    C.DrawTile(Mark, 31.0 / float(1024) * C.ClipX, 29.0 / float(768) * C.ClipY, 0.0, 0.0, float(Mark.MaterialUSize()), float(Mark.MaterialVSize()));
                }
                // End:0x4e7
                if(MM.ResultInfos[lpPRI].Nick == HudOwner.PlayerOwner.PlayerReplicationInfo.PlayerName)
                {
                    CalculateCoordinate(C, WResultMVP, 49.0, 34.0, calW);
                    C.SetPos(calW.X1, calW.Y1);
                    C.DrawTile(WResultMVP.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
                    C.DrawColor = DefaultFontColor;
                    C.BtrDrawTextJustified(MM.ResultInfos[lpPRI].Nick, 1, C.ClipX * fMvpNameTextX1, C.ClipY * fMvpNameTextY1, C.ClipX * fMvpNameTextX2, C.ClipY * fMvpNameTextY2, int(PlayerNameFontSize * C.ClipY));
                }
                X1 = TeamMemberNicknameBeginX * C.ClipX;
                X2 = X1 + TeamMemberNicknameWidth * C.ClipX;
                C.DrawColor = DefaultFontColor;
                C.BtrDrawTextJustified(MM.ResultInfos[lpPRI].Nick, 0, X1, Y1, X2, Y2, int(FontSize));
                // End:0x652
                if(MM.ResultInfos[lpPRI].Nick == HudOwner.PlayerOwner.PlayerReplicationInfo.PlayerName)
                {
                    CalculateCoordinate(C, WIconMaster, 15.0, 15.0, calW);
                    C.SetPos(calW.X1, calW.Y1);
                    C.DrawTile(WIconMaster.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
                }
                X1 = TeamMemberClanNameBeginX * C.ClipX;
                X2 = X1 + TeamMemberClanNameWidth * C.ClipX;
                C.BtrDrawTextJustified("Battery TF", 0, X1, Y1, X2, Y2, int(FontSize));
                X1 = TeamMemberScoreBeginX * C.ClipX;
                X2 = X1 + TeamMemberScoreWidth * C.ClipX;
                C.BtrDrawTextJustified(string(MM.ResultInfos[lpPRI].Score), 1, X1, Y1, X2, Y2, int(FontSize));
                X1 = TeamMemberKillBeginX * C.ClipX;
                X2 = X1 + TeamMemberKillWidth * C.ClipX;
                C.BtrDrawTextJustified(string(MM.ResultInfos[lpPRI].Kill), 1, X1, Y1, X2, Y2, int(FontSize));
                X1 = TeamMemberAssistBeginX * C.ClipX;
                X2 = X1 + TeamMemberAssistWidth * C.ClipX;
                C.BtrDrawTextJustified(string(MM.ResultInfos[lpPRI].Assist), 1, X1, Y1, X2, Y2, int(FontSize));
                X1 = TeamMemberDeathBeginX * C.ClipX;
                X2 = X1 + TeamMemberDeathWidth * C.ClipX;
                C.BtrDrawTextJustified(string(MM.ResultInfos[lpPRI].Death), 1, X1, Y1, X2, Y2, int(FontSize));
                X1 = TeamMemberExpBeginX * C.ClipX;
                X2 = X1 + TeamMemberExpWidth * C.ClipX;
                C.BtrDrawTextJustified("+" $ string(MM.ResultInfos[lpPRI].Exp), 1, X1, Y1, X2, Y2, int(FontSize));
                X1 = TeamMemberPointBeginX * C.ClipX;
                X2 = X1 + TeamMemberPointWidth * C.ClipX;
                C.BtrDrawTextJustified("+" $ string(MM.ResultInfos[lpPRI].Point), 1, X1, Y1, X2, Y2, int(FontSize));
                ++ Count;
            }
            ++ lpPRI;
            // This is an implied JumpToken; Continue!
            goto J0x6a;
        }
        ++ lpTeam;
        // This is an implied JumpToken; Continue!
        goto J0x4d;
    }
}

function DrawMyInfo(Canvas C)
{
    local CalCoordsW calW;
    local int iCurExp, iNextLevelExp, iCurPoint;
    local float fRatio;
    local string temp;

    CalculateCoordinate(C, WMyInfoBG, 1024.0, 52.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WMyInfoBG.WidgetTexture, calW.XL, calW.YL);
    iCurExp = Level.CharMgr.MyPlayer.nExp;
    iNextLevelExp = 10000;
    temp = "" $ string(iCurExp) $ " / " $ string(iNextLevelExp);
    C.BtrDrawTextJustified(Exp, 1, C.ClipX * fTxtExpX1, C.ClipY * fTxtExpY1, C.ClipX * fTxtExpX2, C.ClipY * fTxtExpY2, int(fMyInfoFontSize * C.ClipY));
    C.BtrDrawTextJustified(temp, 2, C.ClipX * fTxt2ExpX1, C.ClipY * fTxtExpY1, C.ClipX * fTxt2ExpX2, C.ClipY * fTxtExpY2, int(ContentFontSize * C.ClipY));
    fRatio = 0.50;
    CalculateCoordinate(C, WGaugeBar1, 149.0, 15.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WGaugeBar1.WidgetTexture, calW.XL, calW.YL);
    CalculateCoordinate(C, WGaugeBar2, 149.0 * fRatio, 15.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WGaugeBar2.WidgetTexture, calW.XL, calW.YL);
    iCurPoint = Level.CharMgr.MyPlayer.Point;
    C.BtrDrawTextJustified(Point, 2, C.ClipX * fTxtPointX1, C.ClipY * fTxtPointY1, C.ClipX * fTxtPointX2, C.ClipY * fTxtPointY2, int(fMyInfoFontSize * C.ClipY));
    temp = "" $ string(iCurPoint) $ "";
    C.BtrDrawTextJustified(temp, 2, C.ClipX * fTxt2PointX1, C.ClipY * fTxtPointY1, C.ClipX * fTxt2PointX2, C.ClipY * fTxtPointY2, int(ContentFontSize * C.ClipY));
}

simulated event DrawScoreboard(Canvas C)
{
    super(ScoreBoard).DrawScoreboard(C);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    DrawBGS(C);
    DrawTeamScore(C);
    DrawTeamListSectionStripe(C);
    DrawContentDescription(C);
    DrawTeam(C);
    DrawTeamMember(C);
    DrawMyInfo(C);
}

defaultproperties
{
    SpBG=(WidgetTexture=Texture'Warfare_HUD.Common.back_g',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1023,Y2=767),TextureScale=0.650,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpTeam=(WidgetTexture=Texture'Warfare_UI.HUD_Result.result_2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=803,Y2=276),TextureScale=0.650,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpWin=(WidgetTexture=Texture'Warfare_UI.HUD_Result.result_win',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=230,Y2=113),TextureScale=0.650,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpSelectLine=(WidgetTexture=Texture'Warfare_UI.HUD_Scoreboard.select_line',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.650,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=192),Tints[1]=(R=255,G=255,B=255,A=192))
    SpTeamNameEmphasis=(WidgetTexture=Texture'Warfare_UI.HUD_Scoreboard.sc_bo_oran',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=179,Y2=27),TextureScale=0.63630,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpControlBG=(WidgetTexture=Texture'Warfare_UI.HUD_Result.result_3',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1023,Y2=63),TextureScale=0.63630,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpPlayerNameBG=(WidgetTexture=Texture'Warfare_UI.HUD_Result.result_3_1',RenderStyle=5,TextureCoords=(X1=1,Y1=1,X2=228,Y2=27),TextureScale=0.63630,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WSBOutLine=(WidgetTexture=Texture'Warfare_HUD.Common.line_bagic_0',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=2,Y2=2),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=84,OffsetY=73,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WSBBG=(WidgetTexture=Texture'Warfare_HUD.Common.line_bagic',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=8,Y2=8),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=81,OffsetY=37,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WSBBGInput=(WidgetTexture=Texture'Warfare_HUD.Common.input_win',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=8,Y2=8),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=86,OffsetY=75,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTxtResultBoard=(WidgetTexture=Texture'Warfare_HUD.TitleImages.mi_t_resu',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=59,Y2=14),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=89,OffsetY=78,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WMarkAF=(WidgetTexture=Texture'Warfare_HUD.HUD.resu_t_AF',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=255),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=91,OffsetY=103,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WMarkRSA=(WidgetTexture=Texture'Warfare_HUD.HUD.resu_t_RSA',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=255),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=91,OffsetY=387,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WResultMVP=(WidgetTexture=Texture'Warfare_HUD.HUD.result_MVP',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=49,Y2=34),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=636,OffsetY=24,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGaugeBar1=(WidgetTexture=Texture'Warfare_HUD.Common.gauge_bar_0',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=8,Y2=15),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=176,OffsetY=707,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGaugeBar2=(WidgetTexture=Texture'Warfare_HUD.Common.gauge_bar_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=8,Y2=15),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=176,OffsetY=707,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WBonusItemBG=(WidgetTexture=Texture'Warfare_HUD.Common.stripe_bar_2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=2,Y2=2),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WMyInfoBG=(WidgetTexture=Texture'Warfare_HUD.Common.line_result_2pixel',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=2,Y2=2),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=677,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WCommBtn=// Object reference not set to an instance of an object.
    
    WStripeBar=// Object reference not set to an instance of an object.
    
    WIconMaster=(WidgetTexture=Texture'Warfare_HUD.Common.icon_master',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=15,Y2=15),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WIconPCBang=(WidgetTexture=Texture'Warfare_HUD.Common.icon_pcroom',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=15,Y2=15),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MAX_TEAM=2
    BackImage=Texture'Warfare_UI.Common_1.back_g'
    BackImageWidth=1024
    BackImageHeight=768
    BGBeginX=0.0986330
    BGBeginY=0.0299480
    BGWidth=0.815430
    BGHeight=0.743490
    ControlBeginY=0.8958330
    ControlWidth=1.0
    ControlHeight=0.0833330
    PlayerNameBeginX=0.6796880
    PlayerNameBeginY=0.9270830
    PlayerNameWidth=0.2226560
    PlayerNameHeight=0.0351560
    PlayerNameFontSize=0.0182290
    TeamBeginX=0.1552730
    TeamBeginY=0.0455730
    TeamOffsetY=0.3671880
    TeamWidth=0.7519530
    TeamHeight=0.3541670
    TeamNameBeginX=0.1171880
    TeamNameBeginY=0.0533850
    TeamNameWidth=0.127930
    TeamNameHeight=0.0221350
    TeamNameFontSize=0.018230
    TeamWinnerBeginX=0.3876950
    TeamWinnerBeginY=0.1718750
    TeamWinnerWidth=0.2275390
    TeamWinnerHeight=0.1484380
    TeamMemberClanBeginX=0.1542970
    TeamMemberClanWidth=0.0322270
    TeamMemberRankBeginX=0.18750
    TeamMemberRankWidth=0.0322270
    TeamMemberNicknameBeginX=0.2402340
    TeamMemberNicknameWidth=0.1162110
    TeamMemberItemBeginX=0.3574220
    TeamMemberItemWidth=0.0322270
    TeamMemberClanNameBeginX=0.3906250
    TeamMemberClanNameWidth=0.1025390
    TeamMemberScoreBeginX=0.4941410
    TeamMemberScoreWidth=0.0361330
    TeamMemberKillBeginX=0.531250
    TeamMemberKillWidth=0.0371090
    TeamMemberAssistBeginX=0.5693360
    TeamMemberAssistWidth=0.0478520
    TeamMemberDeathBeginX=0.627930
    TeamMemberDeathWidth=0.0263670
    TeamMemberBonusBeginX=0.6552730
    TeamMemberBonusWidth=0.0986330
    TeamMemberBonus_1_BeginX=0.656250
    TeamMemberBonus_1_Width=0.031250
    TeamMemberBonus_2_BeginX=0.6894530
    TeamMemberBonus_2_Width=0.031250
    TeamMemberBonus_3_BeginX=0.7226560
    TeamMemberBonus_3_Width=0.031250
    TeamMemberExpBeginX=0.7548830
    TeamMemberExpWidth=0.0771480
    TeamMemberPointBeginX=0.8330080
    TeamMemberPointWidth=0.0771480
    TeamMemberBeginY=0.1393230
    TeamMemberHeight=0.0442710
    TeamMemberHeightOffset=0.0442710
    TeamMemberFontSize=0.013030
    TeamNameEmphasisBeginX=0.1123050
    TeamNameEmphasisBeginY=0.0494790
    TeamNameEmphasisWidth=0.1552730
    TeamNameEmphasisHeight=0.031250
    DefaultFontColor=(R=255,G=255,B=255,A=255)
    fMvpNameTextX1=0.3271480
    fMvpNameTextX2=0.6718750
    fMvpNameTextY1=0.0260420
    fMvpNameTextY2=0.0807290
    fTeamScoreAFY1=0.4713540
    fTeamScoreAFY2=0.4869790
    fTeamScoreRSAY1=0.8411460
    fTeamScoreRSAY2=0.8567710
    fTeamScoreTxtX1=0.090820
    fTeamScoreTxtX2=0.1503910
    fTeamScoreTxtAFY1=0.4401040
    fTeamScoreTxtAFY2=0.4661460
    fTeamScoreTxtRSAY1=0.8098960
    fTeamScoreTxtRSAY2=0.8359380
    fBonusX1=0.6552730
    fBonusX2=0.7539060
    fExpX1=0.7548830
    fExpX2=0.8320310
    fPointX1=0.8330080
    fPointX2=0.9101560
    fClanTextX1=0.3906250
    fClanTextX2=0.4931640
    fTxtExpX1=0.1718750
    fTxtExpX2=0.2138670
    fTxtExpY1=0.8906250
    fTxtExpY2=0.9101560
    fTxt2ExpX1=0.2197270
    fTxt2ExpX2=0.3173830
    fTxtPointX1=0.6816410
    fTxtPointX2=0.7519530
    fTxtPointY1=0.906250
    fTxtPointY2=0.9257810
    fTxt2PointX1=0.7578130
    fTxt2PointX2=0.8271480
    fMyInfoFontSize=0.0169270
    fTxtOKX1=0.4179690
    fTxtOKX2=0.5810550
    fTxtOKY1=0.8958330
    fTxtOKY2=0.9361980
    fOKFontSize=0.0195310
    fContentBeginY=0.0976560
    fContentEndY=0.1236980
    fClanX1=0.1542970
    fClanX2=0.1865230
    fRankX1=0.18750
    fRankX2=0.2197270
    fNickNameX1=0.2207030
    fNickNameX2=0.3564450
    fScoreX1=0.4941410
    fScoreX2=0.5302730
    fKillX1=0.531250
    fKillX2=0.5683590
    fDeathX1=0.627930
    fDeathX2=0.6542970
    fAssistX1=0.5693360
    fAssistX2=0.6171880
    fTeamScoreX1=0.1005860
    fTeamScoreX2=0.1406250
    ContentFontSize=0.0130210
    ContentFontColor=(R=255,G=255,B=255,A=255)
    bonus="Bonus"
    Exp="EXP"
    Point="Points"
    OK="OK"
}