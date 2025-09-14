/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTOwnerDrawRankInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:4
 *
 *******************************************************************************/
class BTOwnerDrawRankInfoHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var localized string strRank;
var localized string strUpArrow;
var localized string strDownArrow;
var int ClanBG;
var bool bClan;
var Image LevelImg;
var BTROClanMarkHK ClanMark;
var Text TextName;
var array<Text> Ranking;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    LevelImg = class'BTCustomDrawHK'.static.MakeImage(32, 32, 0, none);
    Controller.ViewportOwner.Actor.Level.GameMgr.GetLevelImage(1, 0, LevelImg);
    TextName = class'BTCustomDrawHK'.static.MakeText(10, 3, "");
    Ranking[0] = class'BTCustomDrawHK'.static.MakeText(10, 3, "");
    Ranking[1] = class'BTCustomDrawHK'.static.MakeText(9, 3, "");
    ClanMark = new class'BTROClanMarkHK';
    ClanMark.Init();
    BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
}

function SetData(int CharLevel, int Pattern, int BG, int BL, int ClanLevel, string strUserName, string strClanName, int iRanking, int iPrevRanking, int iRankingExp, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    TextName.Text = strUserName;
    // End:0x72
    if(MM.kUserName == strUserName)
    {
        TextName.DrawColor = class'BTUIColorPoolHK'.static.myName();
    }
    Controller.ViewportOwner.Actor.Level.GameMgr.GetLevelImage(CharLevel, LevelMarkID, LevelImg);
    SetRankData(string(iRanking) @ strRank, iRanking - iPrevRanking);
    bClan = strClanName != "";
    // End:0x13a
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
    class'BTCustomDrawHK'.static.DrawImage(C, LevelImg, float(X_1), AWinPos.Y1, float(X_1 + 32), AWinPos.Y1 + float(32));
    X_1 += 42;
    // End:0x111
    if(bClan)
    {
        ClanMark.AWinPos.X1 = float(X_1);
        ClanMark.AWinPos.Y1 = AWinPos.Y1;
        ClanMark.AWinPos.X2 = float(X_1 + 32);
        ClanMark.AWinPos.Y2 = AWinPos.Y1 + float(32);
        ClanMark.Render(C);
    }
    X_1 += 42;
    // End:0x16f
    if(BackgroundImage.Image != none)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, float(X_1), AWinPos.Y1 + float(2), 752.0, AWinPos.Y1 + float(30));
    }
    class'BTCustomDrawHK'.static.DrawText(C, TextName, float(X_1 + 4), AWinPos.Y1, 752.0, AWinPos.Y1 + float(32));
    X_1 += 148;
    // End:0x210
    if(BackgroundImage.Image != none)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, float(X_1), AWinPos.Y1 + float(2), 984.0, AWinPos.Y1 + float(30));
    }
    class'BTCustomDrawHK'.static.DrawTextArray(C, Ranking, 3, 2, float(X_1 + 4), AWinPos.Y1, 984.0, AWinPos.Y1 + float(32));
}

function SetRankData(string t0, int t1)
{
    Ranking[0].Text = t0;
    // End:0x63
    if(t1 > 0)
    {
        Ranking[1].Text = "  (" $ strDownArrow $ string(t1) $ ")";
        Ranking[1].DrawColor = class'BTUIColorPoolHK'.static.InverseLabelWarning();
    }
    // End:0xe6
    else
    {
        // End:0xb6
        if(t1 < 0)
        {
            Ranking[1].Text = "  (" $ strUpArrow $ string(-t1) $ ")";
            Ranking[1].DrawColor = class'BTUIColorPoolHK'.static.LabelWarning();
        }
        // End:0xe6
        else
        {
            Ranking[1].Text = "  (-)";
            Ranking[1].DrawColor = class'BTUIColorPoolHK'.static.ChatSelf();
        }
    }
}

defaultproperties
{
    strRank=" "
    strUpArrow="?"
    strDownArrow="?"
    OnRendered=Internal_OnRendered
}