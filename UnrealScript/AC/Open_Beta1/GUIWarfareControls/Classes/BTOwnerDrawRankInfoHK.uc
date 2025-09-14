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
    LevelImg = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 0, none);
    Controller.ViewportOwner.Actor.Level.GameMgr.GetLevelImage(1, 0, LevelImg);
    TextName = Class'Engine.BTCustomDrawHK'.static.MakeText(10, 3, "");
    Ranking[0] = Class'Engine.BTCustomDrawHK'.static.MakeText(10, 3, "");
    Ranking[1] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 3, "");
    ClanMark = new Class'GUIWarfareControls_Decompressed.BTROClanMarkHK';
    ClanMark.Init();
    BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
    //return;    
}

function SetData(int CharLevel, int Pattern, int BG, int BL, int ClanLevel, string strUserName, string strClanName, int iRanking, int iPrevRanking, int iRankingExp, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    TextName.Text = strUserName;
    // End:0x72
    if(MM.kUserName == strUserName)
    {
        TextName.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.myName();
    }
    Controller.ViewportOwner.Actor.Level.GameMgr.GetLevelImage(CharLevel, LevelMarkID, LevelImg);
    SetRankData(string(iRanking) @ strRank, iRanking - iPrevRanking);
    bClan = strClanName != "";
    // End:0x13A
    if(bClan)
    {
        ClanMark.SetData(Controller.ViewportOwner.Actor.Level.GameMgr, Pattern, BG, BL, false, ClanLevel);
    }
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local int X_1;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    X_1 = 534;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, LevelImg, float(X_1), AWinPos.Y1, float(X_1 + 32), AWinPos.Y1 + float(32));
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
    // End:0x16F
    if(BackgroundImage.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, float(X_1), AWinPos.Y1 + float(2), 752.0000000, AWinPos.Y1 + float(30));
    }
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, TextName, float(X_1 + 4), AWinPos.Y1, 752.0000000, AWinPos.Y1 + float(32));
    X_1 += 148;
    // End:0x210
    if(BackgroundImage.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, float(X_1), AWinPos.Y1 + float(2), 984.0000000, AWinPos.Y1 + float(30));
    }
    Class'Engine.BTCustomDrawHK'.static.DrawTextArray(C, Ranking, 3, 2, float(X_1 + 4), AWinPos.Y1, 984.0000000, AWinPos.Y1 + float(32));
    //return;    
}

function SetRankData(string t0, int t1)
{
    Ranking[0].Text = t0;
    // End:0x63
    if(t1 > 0)
    {
        Ranking[1].Text = (("  (" $ strDownArrow) $ string(t1)) $ ")";
        Ranking[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.InverseLabelWarning();        
    }
    else
    {
        // End:0xB6
        if(t1 < 0)
        {
            Ranking[1].Text = (("  (" $ strUpArrow) $ string(-t1)) $ ")";
            Ranking[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning();            
        }
        else
        {
            Ranking[1].Text = "  (-)";
            Ranking[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ChatSelf();
        }
    }
    //return;    
}

defaultproperties
{
    strRank=" "
    strUpArrow="?"
    strDownArrow="?"
    OnRendered=BTOwnerDrawRankInfoHK.Internal_OnRendered
}