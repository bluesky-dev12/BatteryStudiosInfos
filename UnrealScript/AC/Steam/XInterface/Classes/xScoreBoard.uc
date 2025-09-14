/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\xScoreBoard.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:39
 *	Functions:3
 *
 *******************************************************************************/
class xScoreBoard extends ScoreBoard
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var float fContentBeginY;
var float fContentEndY;
var float fClanX1;
var float fClanX2;
var float fRankX1;
var float fRankX2;
var float fNickNameX1;
var float fNickNameX2;
var float fScoreX1;
var float fScoreX2;
var float fKillX1;
var float fKillX2;
var float fDeathX1;
var float fDeathX2;
var float fAssistX1;
var float fAssistX2;
var float fPingX1;
var float fPingX2;
var float fTeamScoreX1;
var float fTeamScoreX2;
var float ContentFontSize;
var Color ContentFontColor;
var localized string Clan;
var localized string Rank;
var localized string NickName;
var localized string Score;
var localized string Kill;
var localized string Death;
var localized string Assist;
var localized string Ping;
var localized string bonus;
var localized string Exp;
var localized string Point;
var localized string TeamScore;
var localized string OK;
var localized string Ranking;
var localized string Score_1;
var float ScreenRatioXEx;
var float ScreenRatioYEx;

function CalculateCoordinate(Canvas C, SpriteWidget W, float fWidth, float fHeight, out CalCoordsW coordsW)
{
    coordsW.X1 = W.PosX + float(W.OffsetX) * ScreenRatioXEx * C.ClipX;
    coordsW.Y1 = W.PosY + float(W.OffsetY) * ScreenRatioYEx * C.ClipY;
    coordsW.fWidth = fWidth * ScreenRatioXEx;
    coordsW.fHeight = fHeight * ScreenRatioYEx;
    coordsW.X2 = coordsW.X1 + coordsW.fWidth * C.ClipX;
    coordsW.Y2 = coordsW.Y1 + coordsW.fHeight * C.ClipY;
    coordsW.XL = coordsW.X2 - coordsW.X1;
    coordsW.YL = coordsW.Y2 - coordsW.Y1;
    coordsW.U = float(W.TextureCoords.X1);
    coordsW.V = float(W.TextureCoords.Y1);
    coordsW.UL = float(W.TextureCoords.X2 - W.TextureCoords.X1);
    coordsW.VL = float(W.TextureCoords.Y2 - W.TextureCoords.Y1);
}

function CalculateCoordinateDigit(Canvas C, DigitSet W, NumericWidget N, float fWidth, float fHeight, int Index, out CalCoordsW coordsW)
{
    coordsW.X1 = N.PosX + float(N.OffsetX) * ScreenRatioXEx * C.ClipX;
    coordsW.Y1 = N.PosY + float(N.OffsetY) * ScreenRatioYEx * C.ClipY;
    coordsW.fWidth = fWidth * ScreenRatioXEx;
    coordsW.fHeight = fHeight * ScreenRatioYEx;
    coordsW.X2 = coordsW.X1 + coordsW.fWidth * C.ClipX;
    coordsW.Y2 = coordsW.Y1 + coordsW.fHeight * C.ClipY;
    coordsW.XL = coordsW.X2 - coordsW.X1;
    coordsW.YL = coordsW.Y2 - coordsW.Y1;
    coordsW.U = float(W.TextureCoords[Index].X1);
    coordsW.V = float(W.TextureCoords[Index].Y1);
    coordsW.UL = float(W.TextureCoords[Index].X2 - W.TextureCoords[Index].X1);
    coordsW.VL = float(W.TextureCoords[Index].Y2 - W.TextureCoords[Index].Y1);
}

function string GetEllipsString(Canvas C, string strText, float fLimitWidth, float FontSize)
{
    local float rW, rH, textWidthLimit, ellipsisWidth, findWidth, tempH;

    local int i;
    local string temp;

    textWidthLimit = fLimitWidth;
    C.BtrTextSize(strText, int(FontSize), rW, rH);
    // End:0x11b
    if(rW > textWidthLimit)
    {
        C.BtrTextSize("...", int(FontSize), ellipsisWidth, tempH);
        i = 0;
        J0x6b:
        // End:0xd7 [While If]
        if(i < Len(strText))
        {
            temp = Mid(strText, 0, i);
            C.BtrTextSize(temp, int(FontSize), findWidth, tempH);
            // End:0xcd
            if(findWidth > textWidthLimit - ellipsisWidth)
            {
            }
            // End:0xd7
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x6b;
            }
        }
        // End:0x102
        if(i > 0)
        {
            temp = Mid(strText, 0, i - 1) $ "...";
        }
        // End:0x10d
        else
        {
            temp = "...";
        }
        rW = textWidthLimit;
    }
    // End:0x126
    else
    {
        temp = strText;
    }
    return temp;
}

defaultproperties
{
    Clan="Clan"
    Rank="Lv."
    NickName="Nickname"
    Score="Score"
    Kill="Kills"
    Death="Deaths"
    Assist="Assists"
    Ping="Ping"
    TeamScore="Team Score"
    Ranking="th place"
    Score_1="Points"
    ScreenRatioXEx=0.0006250
    ScreenRatioYEx=0.0008330
}