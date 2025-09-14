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
        TextName.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.myName();
    }
    SetRankData(string(iRanking) @ strRank, iRanking - iPrevRanking);
    bClan = strClanName != "";
    // End:0xF8
    if(bClan)
    {
        ClanMark.SetData(Controller.ViewportOwner.Actor.Level.GameMgr, Pattern, BG, BL, false, ClanLevel);
    }
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local int X1;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    X1 = 534;
    // End:0xC3
    if(bClan)
    {
        ClanMark.AWinPos.X1 = float(X1);
        ClanMark.AWinPos.Y1 = AWinPos.Y1;
        ClanMark.AWinPos.X2 = float(X1 + 32);
        ClanMark.AWinPos.Y2 = AWinPos.Y1 + float(32);
        ClanMark.Render(C);
    }
    X1 += 42;
    // End:0x127
    if(BackgroundImage.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, float(X1), AWinPos.Y1 + float(2), float(X1 + 179), AWinPos.Y1 + float(30));
    }
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, TextName, float(X1 + 4), AWinPos.Y1, 752.0000000, AWinPos.Y1 + float(32));
    X1 += 190;
    // End:0x1CE
    if(BackgroundImage.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, float(X1), AWinPos.Y1 + float(2), float(X1 + 221), AWinPos.Y1 + float(30));
    }
    Class'Engine.BTCustomDrawHK'.static.DrawTextArray(C, Ranking, 3, 2, float(X1 + 4), AWinPos.Y1, 984.0000000, AWinPos.Y1 + float(32));
    //return;    
}
