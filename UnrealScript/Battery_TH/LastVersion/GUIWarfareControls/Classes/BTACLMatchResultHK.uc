class BTACLMatchResultHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var localized string strStatus[4];
var Image LevelImg;
var array<Text> tarray;

function float GetItemHeight(Canvas C)
{
    return 34.0000000 * (float(Controller.ResY) / 768.0000000);
    //return;    
}

function AddTeamMemeber(bool bMe, int UID, int ClanMark, int ClanBG, int ClanBL, int Level, string NickName, string ClanName, int Score, int Kill, int Assist, int Death, int Exp, int expup, int Point, int pointup, array<int> BonusIDs, int LookingFor, bool bFriendly, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK Data;
    local int i;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Data = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    Data.Init(14);
    i = 0;
    J0x56:

    // End:0xB4 [Loop If]
    if(i < 3)
    {
        Data.DataPerColumn[2].Text[i].FontDrawType = 3;
        Data.DataPerColumn[3].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x56;
    }
    i = 0;
    J0xBB:

    // End:0x13D [Loop If]
    if(i < 11)
    {
        // End:0x103
        if(bMe)
        {
            Data.DataPerColumn[i].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.myName();
            // [Explicit Continue]
            goto J0x133;
        }
        Data.DataPerColumn[i].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonN();
        J0x133:

        i++;
        // [Loop Continue]
        goto J0xBB;
    }
    Data.DataPerColumn[0].IntValue = ClanMark;
    Data.DataPerColumn[1].IntValue = Level;
    Data.DataPerColumn[2].strValue = NickName;
    Data.DataPerColumn[2].IntValue = UID;
    Data.DataPerColumn[3].strValue = ClanName;
    Data.DataPerColumn[4].IntValue = Score;
    Data.DataPerColumn[5].IntValue = Kill;
    Data.DataPerColumn[6].IntValue = Assist;
    Data.DataPerColumn[7].IntValue = Death;
    Data.DataPerColumn[9].IntValue = Exp;
    Data.DataPerColumn[9].floatValue = float(expup);
    Data.DataPerColumn[10].IntValue = Point;
    Data.DataPerColumn[10].floatValue = float(pointup);
    Data.DataPerColumn[11].IntValue = ClanBG;
    Data.DataPerColumn[12].IntValue = ClanBL;
    Data.DataPerColumn[11].Image = GameMgr.GetClanMark32(ClanMark);
    Data.DataPerColumn[12].Image = GameMgr.GetClanMark32(ClanBG);
    Data.DataPerColumn[13].Image = GameMgr.GetClanMark32(ClanBL);
    Data.DataPerColumn[4].tempValue = LookingFor;
    Data.DataPerColumn[3].IntValue = LevelMarkID;
    i = 0;
    J0x3A3:

    // End:0x3E2 [Loop If]
    if(i < BonusIDs.Length)
    {
        Data.DataPerColumn[i].tempValue = BonusIDs[i];
        i++;
        // [Loop Continue]
        goto J0x3A3;
    }
    // End:0x48F
    if(bFriendly)
    {
        Data.DataPerColumn[2].floatValue = 1.0000000;
        Data.DataPerColumn[2].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
        Data.DataPerColumn[2].Text[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameOn();
        Data.DataPerColumn[2].Text[2].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
    }
    AddRow(Data);
    //return;    
}

function bool RemoveTeamMemberByUID(int UID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x54 [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x4A
        if(ACLRowList[i].DataPerColumn[2].IntValue == UID)
        {
            RemoveRow(i);
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function BTAutoColumnListDataHK FindTeamMember(int UID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x53 [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x49
        if(ACLRowList[i].DataPerColumn[2].IntValue == UID)
        {
            return ACLRowList[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0xB0
    if(ACLRowList[row].DataPerColumn[3].strValue != "")
    {
        PlayerOwner().Level.GameMgr.cmm.Render(C, int(L), int(t + float(1)), int(((L + B) - t) - float(2)), int(B - float(1)), ACLRowList[row].DataPerColumn[3].strValue);        
    }
    else
    {
        // End:0x126
        if(ACLRowList[row].DataPerColumn[4].tempValue > 0)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ex_clanmark_02, L, t + float(1), ((L + B) - t) - float(2), B - float(1));
        }
    }
    //return;    
}

function LC1_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local wGameManager GameMgr;

    i = 0;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    GameMgr.GetLevelImage(Data.IntValue, GetLevelMarkID(row), LevelImg);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, LevelImg, L, t + float(1), R, B - float(1));
    //return;    
}

function LC2_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    C.DrawColor = Data.Text[i].DrawColor;
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L + float(5), t + float(1), R - float(5), B - float(1), Data.Text[i].DrawShadowColor);
    //return;    
}

function LC3_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    C.DrawColor = Data.Text[i].DrawColor;
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L + float(5), t + float(1), R - float(5), B - float(1), Data.Text[i].DrawShadowColor);
    //return;    
}

function LC3_Draw_Score(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x54
    if(Class'Engine.wGameSettings'.static.GetModeIndex_Alien() == MM.kGame_GameMode)
    {
        return;
    }
    i = 0;
    C.DrawColor = Data.Text[i].DrawColor;
    Data.Text[i].FontDrawType = 4;
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, string(Data.IntValue), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L + float(5), t + float(1), R - float(5), B - float(1), Data.Text[i].DrawShadowColor);
    //return;    
}

function LC3_Draw_kill(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    C.DrawColor = Data.Text[i].DrawColor;
    Data.Text[i].FontDrawType = 4;
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, string(Data.IntValue), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L + float(5), t + float(1), R - float(5), B - float(1), Data.Text[i].DrawShadowColor);
    //return;    
}

function LC3_Draw_assist(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    C.DrawColor = Data.Text[i].DrawColor;
    Data.Text[i].FontDrawType = 4;
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, string(Data.IntValue), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L + float(5), t + float(1), R - float(5), B - float(1), Data.Text[i].DrawShadowColor);
    //return;    
}

function LC3_Draw_Death(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    C.DrawColor = Data.Text[i].DrawColor;
    Data.Text[i].FontDrawType = 4;
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, string(Data.IntValue), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L + float(5), t + float(1), R - float(5), B - float(1), Data.Text[i].DrawShadowColor);
    //return;    
}

function LC8_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_bonus, L + float(3), t + float(3), (L + float(3)) + float(30), B - float(3));
    // End:0xD4
    if(ACLRowList[row].DataPerColumn[0].tempValue == 7)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_bns_chnl, L + float(3), t + float(3), (L + float(3)) + float(30), B - float(3));        
    }
    else
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_bns[ACLRowList[row].DataPerColumn[0].tempValue], L + float(3), t + float(3), (L + float(3)) + float(30), B - float(3));
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_bonus, ((L + float(3)) + float(30)) + float(2), t + float(3), ((L + float(3)) + float(30 * 2)) + float(2), B - float(3));
    // End:0x23D
    if(ACLRowList[row].DataPerColumn[1].tempValue == 7)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_bns_chnl, ((L + float(3)) + float(30)) + float(2), t + float(3), ((L + float(3)) + float(30 * 2)) + float(2), B - float(3));        
    }
    else
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_bns[ACLRowList[row].DataPerColumn[1].tempValue], ((L + float(3)) + float(30)) + float(2), t + float(3), ((L + float(3)) + float(30 * 2)) + float(2), B - float(3));
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_bonus, ((L + float(3)) + float(30 * 2)) + float(2 * 2), t + float(3), ((L + float(3)) + float(30 * 3)) + float(2 * 2), B - float(3));
    // End:0x3D5
    if(ACLRowList[row].DataPerColumn[2].tempValue == 7)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_bns_chnl, ((L + float(3)) + float(30 * 2)) + float(2 * 2), t + float(3), ((L + float(3)) + float(30 * 3)) + float(2 * 2), B - float(3));        
    }
    else
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_bns[ACLRowList[row].DataPerColumn[2].tempValue], ((L + float(3)) + float(30 * 2)) + float(2 * 2), t + float(3), ((L + float(3)) + float(30 * 3)) + float(2 * 2), B - float(3));
    }
    //return;    
}

function LC9_10_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x53
    if(i == 0)
    {
        tarray[0].DrawColor = Data.Text[i].DrawColor;
        tarray[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.SmallPerc();        
    }
    else
    {
        tarray[0].DrawColor = Data.Text[i].DrawColor;
        tarray[1].DrawColor = Data.Text[i].DrawColor;
    }
    tarray[0].Text = string(Data.IntValue);
    tarray[1].Text = ("(+" $ string(int(Data.floatValue))) $ "%)";
    Class'Engine.BTCustomDrawHK'.static.DrawTextArray(C, tarray, 4, 0, L, t, R, B);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;

    LevelImg = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 26, none);
    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.bVisibleWhenEmpty = true;
    MultiColumnBox.bDisplayHeader = false;
    self.SelectImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_TH_UI_UI.Lobby.list_lobby_on');
    self.LastSelectedImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_TH_UI_UI.Lobby.list_lobby_cli');
    self.DefaultRowImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(731, 25, 15, Texture'Warfare_TH_UI_UI.Lobby.list_lobby_n');
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("clan", 359.0000000 - float(327), 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("level", 393.0000000 - float(361), 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("nickname", 544.0000000 - float(394), 7);
    headerInfo.__CustomDraw__Delegate = LC2_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("clanname", 666.0000000 - float(544), 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("score", 704.0000000 - float(666), 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw_Score;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("kill", 739.0000000 - float(704), 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw_kill;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("assist", 794.0000000 - float(739), 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw_assist;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("death", 830.0000000 - float(794), 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw_Death;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("bonus", 930.0000000 - float(830), 7);
    headerInfo.__CustomDraw__Delegate = LC8_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("exp", 1024.0000000 - float(930), 7);
    headerInfo.__CustomDraw__Delegate = LC9_10_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    tarray.Length = 2;
    tarray[0] = Class'Engine.BTCustomDrawHK'.static.MakeText(10, 4, "");
    tarray[1] = Class'Engine.BTCustomDrawHK'.static.MakeText(8, 4, "");
    tarray[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.SmallPerc();
    //return;    
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[3].IntValue;
    //return;    
}
