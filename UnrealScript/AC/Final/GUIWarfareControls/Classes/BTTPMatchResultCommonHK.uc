class BTTPMatchResultCommonHK extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strButtonTopLine[11];
var localized string strLabelTeamScore;
var() automated FloatBox fbLabelRoomName;
var export editinline BTOwnerDrawImageHK LabelRoomName;
var() automated FloatBox fbACLResult[2];
var export editinline BTACLMatchResultHK ACLResult[2];
var() automated FloatBox fbLabelACL[2];
var export editinline BTOwnerDrawImageHK LabelACL[2];
var export editinline BTOwnerDrawImageHK LabelSelectACL[2];
var() automated FloatBox fbLabelTeamLogo[2];
var export editinline BTOwnerDrawImageHK LabelTeamLogo[2];
var() automated FloatBox fbLabelTeamResult[2];
var export editinline BTOwnerDrawImageHK LabelTeamResult[2];
var() automated FloatBox fbLabelTeamResultMark[2];
var export editinline BTOwnerDrawImageHK LabelTeamResultMark[2];
var() automated FloatBox fbLabelTopLine;
var export editinline BTOwnerDrawImageHK LabelTopLine;
var() automated FloatBox fbButtonTopLine[11];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTopLine[11];
var export editinline BTOwnerDrawImageHK LabelSeparator[10];
var() automated FloatBox fbLabelTeamScore[2];
var export editinline BTOwnerDrawImageHK LabelTeamScore[2];
var() automated FloatBox fbLabelTeamScoreResult[2];
var export editinline BTOwnerDrawImageHK LabelTeamScoreResult[2];
var bool bDefenceGame;
var export editinline BTOwnerDrawImageHK ResultMyInfo;
var() automated FloatBox fbResultMyInfo[2];
var() automated FloatBox fbLabelMyInfo[13];
var export editinline BTOwnerDrawImageHK LabelMyInfo[13];
var localized string strMyInfo[7];
var Class<BTACLMatchResultHK> ACLMem_ClassName;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i, nIndex;

    super.InitComponent(MyController, myOwner);
    LabelRoomName = NewLabelComponent(fbLabelRoomName, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelSelectACL[0].SetVisibility(false);
    LabelSelectACL[1].SetVisibility(false);
    ACLResult[0] = BTACLMatchResultHK(NewComponent(new ACLMem_ClassName, fbACLResult[0]));
    ACLResult[0].MultiColumnList.MyScrollBar.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
    ACLResult[0].MultiColumnList.MyScrollBar.ApplyAWinPos();
    ACLResult[1] = BTACLMatchResultHK(NewComponent(new ACLMem_ClassName, fbACLResult[1]));
    ACLResult[1].MultiColumnList.MyScrollBar.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
    ACLResult[1].MultiColumnList.MyScrollBar.ApplyAWinPos();
    LabelTeamResult[0] = NewLabelComponent(fbLabelTeamResult[0], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.GameResult_Win_AF_BG);
    LabelTeamResult[1] = NewLabelComponent(fbLabelTeamResult[1], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.GameResult_Win_RSA_BG);
    LabelTeamResultMark[0] = NewLabelComponent(fbLabelTeamResultMark[0], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.GameResult_Win_AF_Mark);
    LabelTeamResultMark[1] = NewLabelComponent(fbLabelTeamResultMark[1], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.GameResult_Win_RSA_Mark);
    LabelTeamScoreResult[0] = NewLabelComponent(fbLabelTeamScoreResult[0], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelTeamScoreResult[0].SetFontSizeAll(19);
    LabelTeamScoreResult[1] = NewLabelComponent(fbLabelTeamScoreResult[1], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelTeamScoreResult[1].SetFontSizeAll(19);
    i = 0;
    J0x26A:

    // End:0x2E7 [Loop If]
    if(i < 10)
    {
        ButtonTopLine[i] = NewButtonComponent(fbButtonTopLine[i]);
        ButtonTopLine[i].Caption = strButtonTopLine[i];
        ButtonTopLine[i].SetDefaultListButtonImage();
        ButtonTopLine[i].SetDefaultListTopButtonFontColor();
        i++;
        // [Loop Continue]
        goto J0x26A;
    }
    ResultMyInfo = NewLabelComponent(fbResultMyInfo[0], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.GameResult_MyInfo_BG);
    i = 0;
    J0x30F:

    // End:0x5DF [Loop If]
    if(i < 13)
    {
        LabelMyInfo[i] = NewLabelComponent(fbResultMyInfo[0], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        LabelMyInfo[i].AWinPos.X1 = ResultMyInfo.AWinPos.X1 + fbLabelMyInfo[i].X1;
        LabelMyInfo[i].AWinPos.Y1 = ResultMyInfo.AWinPos.Y1 + fbLabelMyInfo[i].Y1;
        LabelMyInfo[i].AWinPos.X2 = ResultMyInfo.AWinPos.X1 + fbLabelMyInfo[i].X2;
        LabelMyInfo[i].AWinPos.Y2 = ResultMyInfo.AWinPos.Y1 + fbLabelMyInfo[i].Y2;
        LabelMyInfo[i].ApplyAWinPos();
        LabelMyInfo[i].CaptionDrawType = 3;
        // End:0x50C
        if(i == 0)
        {
            LabelMyInfo[i].Caption = strMyInfo[0];
            LabelMyInfo[i].SetFontSizeAll(11);
            LabelMyInfo[i].FontColor[0].R = 153;
            LabelMyInfo[i].FontColor[0].G = 153;
            LabelMyInfo[i].FontColor[0].B = 153;
            nIndex++;
            // [Explicit Continue]
            goto J0x5D5;
        }
        // End:0x562
        if((float(i) % float(2)) == float(1))
        {
            LabelMyInfo[i].Caption = strMyInfo[nIndex];
            LabelMyInfo[i].SetFontSizeAll(9);
            nIndex++;
            // [Explicit Continue]
            goto J0x5D5;
        }
        LabelMyInfo[i].SetFontSizeAll(9);
        LabelMyInfo[i].FontColor[0].R = byte(255);
        LabelMyInfo[i].FontColor[0].G = 192;
        LabelMyInfo[i].FontColor[0].B = 0;
        J0x5D5:

        i++;
        // [Loop Continue]
        goto J0x30F;
    }
    //return;    
}

function SetData(wMatchMaker MM)
{
    local int i, j, k, bonusid_j, ni, Winner;

    local ResultInfo ri;
    local wMatchUserInfo ui;
    local int UserLevel;
    local array<int> BonusIDs;

    bDefenceGame = MM.szGameClass == MM.GetDefenceGameInfo();
    i = 0;
    J0x2D:

    // End:0x7AC [Loop If]
    if(i < MM.ResultInfos.Length)
    {
        ri = MM.ResultInfos[i];
        ui = MM.GetUserInfoByUID(ri.UserID);
        BonusIDs.Length = 0;
        j = 0;
        J0x8E:

        // End:0x142 [Loop If]
        if(j < 9)
        {
            bonusid_j = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.static.BounsIDToBounsIconIndex(ri.BonusID[j]);
            // End:0x138
            if(bonusid_j != 0)
            {
                k = 0;
                J0xD1:

                // End:0x103 [Loop If]
                if(k < BonusIDs.Length)
                {
                    // End:0xF9
                    if(BonusIDs[k] == bonusid_j)
                    {
                        // [Explicit Break]
                        goto J0x103;
                    }
                    k++;
                    // [Loop Continue]
                    goto J0xD1;
                }
                J0x103:

                // End:0x138
                if(k == BonusIDs.Length)
                {
                    BonusIDs.Length = BonusIDs.Length + 1;
                    BonusIDs[BonusIDs.Length - 1] = bonusid_j;
                }
            }
            j++;
            // [Loop Continue]
            goto J0x8E;
        }
        UserLevel = MM.GetUserGradeByUserName(ri.Nick);
        // End:0x173
        if(UserLevel <= 0)
        {
            UserLevel = 1;
        }
        // End:0x514
        if(ri.UserID == MM.kUID)
        {
            ACLResult[ri.Team].AddTeamMemeber(true, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, UserLevel, ri.Nick, ui.ClanName, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, false, ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
            LabelSelectACL[ri.Team].SetVisibility(true);
            ResultMyInfo.AWinPos = fbResultMyInfo[ri.Team];
            ResultMyInfo.ApplyAWinPos();
            ni = 0;
            J0x2F6:

            // End:0x434 [Loop If]
            if(ni < 13)
            {
                LabelMyInfo[ni].AWinPos.X1 = ResultMyInfo.AWinPos.X1 + fbLabelMyInfo[ni].X1;
                LabelMyInfo[ni].AWinPos.Y1 = ResultMyInfo.AWinPos.Y1 + fbLabelMyInfo[ni].Y1;
                LabelMyInfo[ni].AWinPos.X2 = ResultMyInfo.AWinPos.X1 + fbLabelMyInfo[ni].X2;
                LabelMyInfo[ni].AWinPos.Y2 = ResultMyInfo.AWinPos.Y1 + fbLabelMyInfo[ni].Y2;
                LabelMyInfo[ni].ApplyAWinPos();
                LabelMyInfo[ni].CaptionDrawType = 3;
                ni++;
                // [Loop Continue]
                goto J0x2F6;
            }
            LabelMyInfo[2].Caption = ((string(ri.Exp) $ "(+") $ string(ri.ExpBonus)) $ "%)";
            LabelMyInfo[4].Caption = ((string(ri.Point) $ "(+") $ string(ri.PointBonus)) $ "%)";
            LabelMyInfo[6].Caption = (string(ri.Kill) $ "/") $ string(ri.Death);
            LabelMyInfo[8].Caption = "";
            LabelMyInfo[10].Caption = "";
            LabelMyInfo[12].Caption = "";
            // [Explicit Continue]
            goto J0x7A2;
        }
        // End:0x662
        if(ui == none)
        {
            ACLResult[ri.Team].AddTeamMemeber(false, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, UserLevel, ri.Nick, ui.ClanName, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, MM.IsFriendlyUser(ui.UserName, ui.ClanName), ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
            // [Explicit Continue]
            goto J0x7A2;
        }
        ACLResult[ri.Team].AddTeamMemeber(false, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, UserLevel, ri.Nick, ui.ClanName, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, MM.IsFriendlyUser(ui.UserName, ui.ClanName), ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
        J0x7A2:

        i++;
        // [Loop Continue]
        goto J0x2D;
    }
    LabelTeamScoreResult[0].Caption = string(MM.ResultTeamScores[0]);
    LabelTeamScoreResult[1].Caption = string(MM.ResultTeamScores[1]);
    // End:0x962
    if(((bDefenceGame == false) && ACLResult[1].ACLRowList.Length == 0) || MM.ResultTeamScores[0] > MM.ResultTeamScores[1])
    {
        Winner = 0;
        LabelTeamResult[0].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.GameResult_Win_AF_BG;
        LabelTeamResult[1].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.GameResult_Lose_RSA_BG;
        LabelTeamScoreResult[0].FontColor[0].R = byte(255);
        LabelTeamScoreResult[0].FontColor[0].G = 192;
        LabelTeamScoreResult[0].FontColor[0].B = 0;
        LabelTeamScoreResult[0].FontColor[0].A = byte(255);
        LabelTeamScoreResult[1].FontColor[0].R = byte(255);
        LabelTeamScoreResult[1].FontColor[0].G = byte(255);
        LabelTeamScoreResult[1].FontColor[0].B = byte(255);
        LabelTeamScoreResult[1].FontColor[0].A = byte(255);        
    }
    else
    {
        Winner = 1;
        LabelTeamResult[1].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.GameResult_Win_RSA_BG;
        LabelTeamResult[0].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.GameResult_Lose_AF_BG;
        LabelTeamScoreResult[1].FontColor[0].R = byte(255);
        LabelTeamScoreResult[1].FontColor[0].G = 192;
        LabelTeamScoreResult[1].FontColor[0].B = 0;
        LabelTeamScoreResult[1].FontColor[0].A = byte(255);
        LabelTeamScoreResult[0].FontColor[0].R = byte(255);
        LabelTeamScoreResult[0].FontColor[0].G = byte(255);
        LabelTeamScoreResult[0].FontColor[0].B = byte(255);
        LabelTeamScoreResult[0].FontColor[0].A = byte(255);
    }
    // End:0xB0C
    if(Winner == MM.kTeamID)
    {
        // End:0xADD
        if(MM.kTeamID == 0)
        {
            PlayerOwner().Player.Console.SetOneBGM("bgm_af_win");            
        }
        else
        {
            PlayerOwner().Player.Console.SetOneBGM("bgm_rsa_win");
        }        
    }
    else
    {
        // End:0xB4F
        if(MM.kTeamID == 0)
        {
            PlayerOwner().Player.Console.SetOneBGM("bgm_af_lose");            
        }
        else
        {
            PlayerOwner().Player.Console.SetOneBGM("bgm_rsa_lose");
        }
    }
    //return;    
}

function SetVisibility(bool bIsVisible)
{
    super(GUIMultiComponent).SetVisibility(bIsVisible);
    // End:0x96
    if(bDefenceGame == true)
    {
        LabelTeamResult[1].SetVisibility(false);
        LabelSelectACL[1].SetVisibility(false);
        LabelTeamResult[1].SetVisibility(false);
        LabelTeamScore[1].SetVisibility(false);
        LabelTeamScoreResult[1].SetVisibility(false);
        ACLResult[1].SetVisibility(false);
        LabelACL[1].SetVisibility(false);
    }
    //return;    
}

defaultproperties
{
    strButtonTopLine[0]="Clan"
    strButtonTopLine[1]="Lv."
    strButtonTopLine[2]="Nickname"
    strButtonTopLine[3]="Clan Name"
    strButtonTopLine[4]="Score"
    strButtonTopLine[5]="Kills"
    strButtonTopLine[6]="Assists"
    strButtonTopLine[7]="Deaths"
    strButtonTopLine[8]="Bonus"
    strButtonTopLine[9]="EXP"
    strButtonTopLine[10]="Points"
    strLabelTeamScore="Team Score"
    fbLabelRoomName=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=89.0000000)
    fbACLResult[0]=(X1=327.0000000,Y1=118.0000000,X2=1024.0000000,Y2=396.0000000)
    fbACLResult[1]=(X1=327.0000000,Y1=406.0000000,X2=1024.0000000,Y2=684.0000000)
    fbLabelACL[0]=(X1=12.0000000,Y1=116.0000000,X2=1024.0000000,Y2=396.0000000)
    fbLabelACL[1]=(X1=12.0000000,Y1=404.0000000,X2=1024.0000000,Y2=684.0000000)
    fbLabelTeamLogo[0]=(X1=169.0000000,Y1=117.0000000,X2=231.0000000,Y2=390.0000000)
    fbLabelTeamLogo[1]=(X1=169.0000000,Y1=401.0000000,X2=231.0000000,Y2=674.0000000)
    fbLabelTeamResult[0]=(X1=12.0000000,Y1=116.0000000,X2=1024.0000000,Y2=396.0000000)
    fbLabelTeamResult[1]=(X1=12.0000000,Y1=404.0000000,X2=1024.0000000,Y2=684.0000000)
    fbLabelTeamResultMark[0]=(X1=12.0000000,Y1=116.0000000,X2=94.0000000,Y2=396.0000000)
    fbLabelTeamResultMark[1]=(X1=12.0000000,Y1=404.0000000,X2=94.0000000,Y2=684.0000000)
    fbLabelTopLine=(X1=0.0000000,Y1=87.0000000,X2=1024.0000000,Y2=113.0000000)
    fbButtonTopLine[0]=(X1=326.0000000,Y1=98.0000000,X2=360.0000000,Y2=111.0000000)
    fbButtonTopLine[1]=(X1=360.0000000,Y1=98.0000000,X2=394.0000000,Y2=111.0000000)
    fbButtonTopLine[2]=(X1=394.0000000,Y1=98.0000000,X2=544.0000000,Y2=111.0000000)
    fbButtonTopLine[3]=(X1=544.0000000,Y1=98.0000000,X2=666.0000000,Y2=111.0000000)
    fbButtonTopLine[4]=(X1=666.0000000,Y1=98.0000000,X2=704.0000000,Y2=111.0000000)
    fbButtonTopLine[5]=(X1=704.0000000,Y1=98.0000000,X2=739.0000000,Y2=111.0000000)
    fbButtonTopLine[6]=(X1=739.0000000,Y1=98.0000000,X2=794.0000000,Y2=111.0000000)
    fbButtonTopLine[7]=(X1=794.0000000,Y1=98.0000000,X2=830.0000000,Y2=111.0000000)
    fbButtonTopLine[8]=(X1=830.0000000,Y1=98.0000000,X2=930.0000000,Y2=111.0000000)
    fbButtonTopLine[9]=(X1=930.0000000,Y1=98.0000000,X2=1024.0000000,Y2=111.0000000)
    fbButtonTopLine[10]=(X1=929.0000000,Y1=98.0000000,X2=1024.0000000,Y2=111.0000000)
    fbLabelTeamScore[0]=(X1=174.0000000,Y1=342.0000000,X2=225.0000000,Y2=355.0000000)
    fbLabelTeamScore[1]=(X1=174.0000000,Y1=626.0000000,X2=225.0000000,Y2=639.0000000)
    fbLabelTeamScoreResult[0]=(X1=18.0000000,Y1=366.0000000,X2=86.0000000,Y2=385.0000000)
    fbLabelTeamScoreResult[1]=(X1=18.0000000,Y1=654.0000000,X2=86.0000000,Y2=673.0000000)
    fbResultMyInfo[0]=(X1=94.0000000,Y1=210.0000000,X2=325.0000000,Y2=395.0000000)
    fbResultMyInfo[1]=(X1=94.0000000,Y1=498.0000000,X2=325.0000000,Y2=683.0000000)
    fbLabelMyInfo[0]=(X1=18.0000000,Y1=24.0000000,X2=230.0000000,Y2=39.0000000)
    fbLabelMyInfo[1]=(X1=18.0000000,Y1=52.0000000,X2=106.0000000,Y2=65.0000000)
    fbLabelMyInfo[2]=(X1=114.0000000,Y1=52.0000000,X2=230.0000000,Y2=65.0000000)
    fbLabelMyInfo[3]=(X1=18.0000000,Y1=72.0000000,X2=106.0000000,Y2=85.0000000)
    fbLabelMyInfo[4]=(X1=114.0000000,Y1=72.0000000,X2=230.0000000,Y2=85.0000000)
    fbLabelMyInfo[5]=(X1=18.0000000,Y1=92.0000000,X2=106.0000000,Y2=105.0000000)
    fbLabelMyInfo[6]=(X1=114.0000000,Y1=92.0000000,X2=230.0000000,Y2=105.0000000)
    fbLabelMyInfo[7]=(X1=18.0000000,Y1=112.0000000,X2=325.0000000,Y2=125.0000000)
    fbLabelMyInfo[8]=(X1=114.0000000,Y1=112.0000000,X2=230.0000000,Y2=125.0000000)
    fbLabelMyInfo[9]=(X1=18.0000000,Y1=132.0000000,X2=325.0000000,Y2=145.0000000)
    fbLabelMyInfo[10]=(X1=114.0000000,Y1=132.0000000,X2=230.0000000,Y2=145.0000000)
    fbLabelMyInfo[11]=(X1=18.0000000,Y1=152.0000000,X2=325.0000000,Y2=165.0000000)
    fbLabelMyInfo[12]=(X1=114.0000000,Y1=152.0000000,X2=230.0000000,Y2=165.0000000)
    strMyInfo[0]="My Combat Information"
    strMyInfo[1]="EXP Earned"
    strMyInfo[2]="Points Earned"
    strMyInfo[3]="Kills/Deaths"
    ACLMem_ClassName=Class'GUIWarfareControls_Decompressed.BTACLMatchResultHK'
}