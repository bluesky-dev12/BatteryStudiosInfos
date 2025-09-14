/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTOwnerDrawClanRankInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class BTOwnerDrawClanRankInfoHK extends BTOwnerDrawRankInfoHK
    editinlinenew
    instanced;

function SetData(int CharLevel, int Pattern, int BG, int BL, int ClanLevel, string strUserName, string strClanName, int iRanking, int iPrevRanking, int iRankingExp, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    TextName.Text = strClanName;
    // End:0x72
    if(MM.kClanName == strClanName)
    {
        TextName.DrawColor = class'BTUIColorPoolHK'.static.myName();
    }
    SetRankData(string(iRanking) @ strRank, iRanking - iPrevRanking);
    bClan = strClanName != "";
    // End:0xf8
    if(bClan)
    {
        ClanMark.SetData(Controller.ViewportOwner.Actor.Level.GameMgr, Pattern, BG, BL, false, ClanLevel);
    }
}

function Internal_OnRendered(Canvas C)
{
    local int X_1;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    X_1 = 534;
    // End:0xc3
    if(bClan)
    {
        ClanMark.AWinPos.X1 = float(X_1);
        ClanMark.AWinPos.Y1 = AWinPos.Y1;
        ClanMark.AWinPos.X2 = float(X_1 + 32);
        ClanMark.AWinPos.Y2 = AWinPos.Y1 + float(32);
        ClanMark.Render(C);
    }
    X_1 += 42;
    // End:0x127
    if(BackgroundImage.Image != none)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, float(X_1), AWinPos.Y1 + float(2), float(X_1 + 179), AWinPos.Y1 + float(30));
    }
    class'BTCustomDrawHK'.static.DrawText(C, TextName, float(X_1 + 4), AWinPos.Y1, 752.0, AWinPos.Y1 + float(32));
    X_1 += 190;
    // End:0x1ce
    if(BackgroundImage.Image != none)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, float(X_1), AWinPos.Y1 + float(2), float(X_1 + 221), AWinPos.Y1 + float(30));
    }
    class'BTCustomDrawHK'.static.DrawTextArray(C, Ranking, 3, 2, float(X_1 + 4), AWinPos.Y1, 984.0, AWinPos.Y1 + float(32));
}
