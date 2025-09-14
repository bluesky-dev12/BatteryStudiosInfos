/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPMatchResultCommonHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:30
 *	Functions:3
 *
 *******************************************************************************/
class BTTPMatchResultCommonHK extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strButtonTopLine[11];
var localized string strLabelTeamScore;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelRoomName;
var export editinline BTOwnerDrawImageHK LabelRoomName;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbACLResult[2];
var export editinline BTACLMatchResultHK ACLResult[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelACL[2];
var export editinline BTOwnerDrawImageHK LabelACL[2];
var export editinline BTOwnerDrawImageHK LabelSelectACL[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelTeamLogo[2];
var export editinline BTOwnerDrawImageHK LabelTeamLogo[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelTeamResult[2];
var export editinline BTOwnerDrawImageHK LabelTeamResult[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelTeamResultMark[2];
var export editinline BTOwnerDrawImageHK LabelTeamResultMark[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelTopLine;
var export editinline BTOwnerDrawImageHK LabelTopLine;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonTopLine[11];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTopLine[11];
var export editinline BTOwnerDrawImageHK LabelSeparator[10];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelTeamScore[2];
var export editinline BTOwnerDrawImageHK LabelTeamScore[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelTeamScoreResult[2];
var export editinline BTOwnerDrawImageHK LabelTeamScoreResult[2];
var bool bDefenceGame;
var export editinline BTOwnerDrawImageHK ResultMyInfo;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbResultMyInfo[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelMyInfo[13];
var export editinline BTOwnerDrawImageHK LabelMyInfo[13];
var localized string strMyInfo[7];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i, nIndex;

    super(GUIPanel).InitComponent(MyController, myOwner);
    LabelRoomName = NewLabelComponent(fbLabelRoomName, class'BTUIResourcePoolHK'.default.empty);
    LabelSelectACL[0].SetVisibility(false);
    LabelSelectACL[1].SetVisibility(false);
    ACLResult[0] = BTACLMatchResultHK(NewComponent(new class'BTACLMatchResultHK', fbACLResult[0]));
    ACLResult[0].MultiColumnList.MyScrollBar.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 0.0, 0.0, 0.0);
    ACLResult[0].MultiColumnList.MyScrollBar.ApplyAWinPos();
    ACLResult[1] = BTACLMatchResultHK(NewComponent(new class'BTACLMatchResultHK', fbACLResult[1]));
    ACLResult[1].MultiColumnList.MyScrollBar.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 0.0, 0.0, 0.0);
    ACLResult[1].MultiColumnList.MyScrollBar.ApplyAWinPos();
    LabelTeamResult[0] = NewLabelComponent(fbLabelTeamResult[0], class'BTUIResourcePoolHK'.default.GameResult_Win_AF_BG);
    LabelTeamResult[1] = NewLabelComponent(fbLabelTeamResult[1], class'BTUIResourcePoolHK'.default.GameResult_Win_RSA_BG);
    LabelTeamResultMark[0] = NewLabelComponent(fbLabelTeamResultMark[0], class'BTUIResourcePoolHK'.default.GameResult_Win_AF_Mark);
    LabelTeamResultMark[1] = NewLabelComponent(fbLabelTeamResultMark[1], class'BTUIResourcePoolHK'.default.GameResult_Win_RSA_Mark);
    LabelTeamScoreResult[0] = NewLabelComponent(fbLabelTeamScoreResult[0], class'BTUIResourcePoolHK'.default.empty);
    LabelTeamScoreResult[0].SetFontSizeAll(19);
    LabelTeamScoreResult[1] = NewLabelComponent(fbLabelTeamScoreResult[1], class'BTUIResourcePoolHK'.default.empty);
    LabelTeamScoreResult[1].SetFontSizeAll(19);
    i = 0;
    J0x26a:
    // End:0x2e7 [While If]
    if(i < 10)
    {
        ButtonTopLine[i] = NewButtonComponent(fbButtonTopLine[i]);
        ButtonTopLine[i].Caption = strButtonTopLine[i];
        ButtonTopLine[i].SetDefaultListButtonImage();
        ButtonTopLine[i].SetDefaultListTopButtonFontColor();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x26a;
    }
    ResultMyInfo = NewLabelComponent(fbResultMyInfo[0], class'BTUIResourcePoolHK'.default.GameResult_MyInfo_BG);
    i = 0;
    J0x30f:
    // End:0x5df [While If]
    if(i < 13)
    {
        LabelMyInfo[i] = NewLabelComponent(fbResultMyInfo[0], class'BTUIResourcePoolHK'.default.empty);
        LabelMyInfo[i].AWinPos.X1 = ResultMyInfo.AWinPos.X1 + fbLabelMyInfo[i].X1;
        LabelMyInfo[i].AWinPos.Y1 = ResultMyInfo.AWinPos.Y1 + fbLabelMyInfo[i].Y1;
        LabelMyInfo[i].AWinPos.X2 = ResultMyInfo.AWinPos.X1 + fbLabelMyInfo[i].X2;
        LabelMyInfo[i].AWinPos.Y2 = ResultMyInfo.AWinPos.Y1 + fbLabelMyInfo[i].Y2;
        LabelMyInfo[i].ApplyAWinPos();
        LabelMyInfo[i].CaptionDrawType = 3;
        // End:0x50c
        if(i == 0)
        {
            LabelMyInfo[i].Caption = strMyInfo[0];
            LabelMyInfo[i].SetFontSizeAll(11);
            LabelMyInfo[i].FontColor[0].R = 153;
            LabelMyInfo[i].FontColor[0].G = 153;
            LabelMyInfo[i].FontColor[0].B = 153;
            ++ nIndex;
        }
        // End:0x5d5
        else
        {
            // End:0x562
            if(float(i) % float(2) == float(1))
            {
                LabelMyInfo[i].Caption = strMyInfo[nIndex];
                LabelMyInfo[i].SetFontSizeAll(9);
                ++ nIndex;
            }
            // End:0x5d5
            else
            {
                LabelMyInfo[i].SetFontSizeAll(9);
                LabelMyInfo[i].FontColor[0].R = byte(255);
                LabelMyInfo[i].FontColor[0].G = 192;
                LabelMyInfo[i].FontColor[0].B = 0;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x30f;
    }
}

function SetData(wMatchMaker MM)
{
    local int i, j, k, bonusid_j, ni, Winner;

    local ResultInfo ri;
    local wMatchUserInfo ui;
    local int UserLevel;
    local array<int> BonusIDs;

    bDefenceGame = MM.szGameClass == "wMission.wDefenceGameInfo";
    i = 0;
    J0x39:
    // End:0x7b8 [While If]
    if(i < MM.ResultInfos.Length)
    {
        ri = MM.ResultInfos[i];
        ui = MM.GetUserInfoByUID(ri.UserID);
        BonusIDs.Length = 0;
        j = 0;
        J0x9a:
        // End:0x14e [While If]
        if(j < 9)
        {
            bonusid_j = class'BTUIResourcePoolHK'.static.BounsIDToBounsIconIndex(ri.BonusID[j]);
            // End:0x144
            if(bonusid_j != 0)
            {
                k = 0;
                J0xdd:
                // End:0x10f [While If]
                if(k < BonusIDs.Length)
                {
                    // End:0x105
                    if(BonusIDs[k] == bonusid_j)
                    {
                    }
                    // End:0x10f
                    else
                    {
                        ++ k;
                        // This is an implied JumpToken; Continue!
                        goto J0xdd;
                    }
                }
                // End:0x144
                if(k == BonusIDs.Length)
                {
                    BonusIDs.Length = BonusIDs.Length + 1;
                    BonusIDs[BonusIDs.Length - 1] = bonusid_j;
                }
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x9a;
        }
        UserLevel = MM.GetUserGradeByUserName(ri.Nick);
        // End:0x17f
        if(UserLevel <= 0)
        {
            UserLevel = 1;
        }
        // End:0x520
        if(ri.UserID == MM.kUID)
        {
            ACLResult[ri.Team].AddTeamMemeber(true, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, UserLevel, ri.Nick, ui.ClanName, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, false, ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
            LabelSelectACL[ri.Team].SetVisibility(true);
            ResultMyInfo.AWinPos = fbResultMyInfo[ri.Team];
            ResultMyInfo.ApplyAWinPos();
            ni = 0;
            J0x302:
            // End:0x440 [While If]
            if(ni < 13)
            {
                LabelMyInfo[ni].AWinPos.X1 = ResultMyInfo.AWinPos.X1 + fbLabelMyInfo[ni].X1;
                LabelMyInfo[ni].AWinPos.Y1 = ResultMyInfo.AWinPos.Y1 + fbLabelMyInfo[ni].Y1;
                LabelMyInfo[ni].AWinPos.X2 = ResultMyInfo.AWinPos.X1 + fbLabelMyInfo[ni].X2;
                LabelMyInfo[ni].AWinPos.Y2 = ResultMyInfo.AWinPos.Y1 + fbLabelMyInfo[ni].Y2;
                LabelMyInfo[ni].ApplyAWinPos();
                LabelMyInfo[ni].CaptionDrawType = 3;
                ++ ni;
                // This is an implied JumpToken; Continue!
                goto J0x302;
            }
            LabelMyInfo[2].Caption = string(ri.Exp) $ "(+" $ string(ri.ExpBonus) $ "%)";
            LabelMyInfo[4].Caption = string(ri.Point) $ "(+" $ string(ri.PointBonus) $ "%)";
            LabelMyInfo[6].Caption = string(ri.Kill) $ "/" $ string(ri.Death);
            LabelMyInfo[8].Caption = "";
            LabelMyInfo[10].Caption = "";
            LabelMyInfo[12].Caption = "";
        }
        // End:0x7ae
        else
        {
            // End:0x66e
            if(ui == none)
            {
                ACLResult[ri.Team].AddTeamMemeber(false, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, UserLevel, ri.Nick, ui.ClanName, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, MM.IsFriendlyUser(ui.UserName, ui.ClanName), ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
            }
            // End:0x7ae
            else
            {
                ACLResult[ri.Team].AddTeamMemeber(false, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, UserLevel, ri.Nick, ui.ClanName, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, MM.IsFriendlyUser(ui.UserName, ui.ClanName), ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x39;
    }
    LabelTeamScoreResult[0].Caption = string(MM.ResultTeamScores[0]);
    LabelTeamScoreResult[1].Caption = string(MM.ResultTeamScores[1]);
    // End:0x96e
    if(bDefenceGame == false && ACLResult[1].ACLRowList.Length == 0 || MM.ResultTeamScores[0] > MM.ResultTeamScores[1])
    {
        Winner = 0;
        LabelTeamResult[0].BackgroundImage = class'BTUIResourcePoolHK'.default.GameResult_Win_AF_BG;
        LabelTeamResult[1].BackgroundImage = class'BTUIResourcePoolHK'.default.GameResult_Lose_RSA_BG;
        LabelTeamScoreResult[0].FontColor[0].R = byte(255);
        LabelTeamScoreResult[0].FontColor[0].G = 192;
        LabelTeamScoreResult[0].FontColor[0].B = 0;
        LabelTeamScoreResult[0].FontColor[0].A = byte(255);
        LabelTeamScoreResult[1].FontColor[0].R = byte(255);
        LabelTeamScoreResult[1].FontColor[0].G = byte(255);
        LabelTeamScoreResult[1].FontColor[0].B = byte(255);
        LabelTeamScoreResult[1].FontColor[0].A = byte(255);
    }
    // End:0xa8f
    else
    {
        Winner = 1;
        LabelTeamResult[1].BackgroundImage = class'BTUIResourcePoolHK'.default.GameResult_Win_RSA_BG;
        LabelTeamResult[0].BackgroundImage = class'BTUIResourcePoolHK'.default.GameResult_Lose_AF_BG;
        LabelTeamScoreResult[1].FontColor[0].R = byte(255);
        LabelTeamScoreResult[1].FontColor[0].G = 192;
        LabelTeamScoreResult[1].FontColor[0].B = 0;
        LabelTeamScoreResult[1].FontColor[0].A = byte(255);
        LabelTeamScoreResult[0].FontColor[0].R = byte(255);
        LabelTeamScoreResult[0].FontColor[0].G = byte(255);
        LabelTeamScoreResult[0].FontColor[0].B = byte(255);
        LabelTeamScoreResult[0].FontColor[0].A = byte(255);
    }
    // End:0xb18
    if(Winner == MM.kTeamID)
    {
        // End:0xae9
        if(MM.kTeamID == 0)
        {
            PlayerOwner().Player.Console.SetOneBGM("bgm_af_win");
        }
        // End:0xb15
        else
        {
            PlayerOwner().Player.Console.SetOneBGM("bgm_rsa_win");
        }
    }
    // End:0xb88
    else
    {
        // End:0xb5b
        if(MM.kTeamID == 0)
        {
            PlayerOwner().Player.Console.SetOneBGM("bgm_af_lose");
        }
        // End:0xb88
        else
        {
            PlayerOwner().Player.Console.SetOneBGM("bgm_rsa_lose");
        }
    }
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
    fbLabelRoomName=(X1=0.0,Y1=0.0,X2=1024.0,Y2=89.0)
    fbACLResult[0]=(X1=327.0,Y1=118.0,X2=1024.0,Y2=396.0)
    fbACLResult[1]=(X1=327.0,Y1=406.0,X2=1024.0,Y2=684.0)
    fbLabelACL[0]=(X1=12.0,Y1=116.0,X2=1024.0,Y2=396.0)
    fbLabelACL[1]=(X1=12.0,Y1=404.0,X2=1024.0,Y2=684.0)
    fbLabelTeamLogo[0]=(X1=169.0,Y1=117.0,X2=231.0,Y2=390.0)
    fbLabelTeamLogo[1]=(X1=169.0,Y1=401.0,X2=231.0,Y2=674.0)
    fbLabelTeamResult[0]=(X1=12.0,Y1=116.0,X2=1024.0,Y2=396.0)
    fbLabelTeamResult[1]=(X1=12.0,Y1=404.0,X2=1024.0,Y2=684.0)
    fbLabelTeamResultMark[0]=(X1=12.0,Y1=116.0,X2=94.0,Y2=396.0)
    fbLabelTeamResultMark[1]=(X1=12.0,Y1=404.0,X2=94.0,Y2=684.0)
    fbLabelTopLine=(X1=0.0,Y1=87.0,X2=1024.0,Y2=113.0)
    fbButtonTopLine[0]=(X1=326.0,Y1=98.0,X2=360.0,Y2=111.0)
    fbButtonTopLine[1]=(X1=360.0,Y1=98.0,X2=394.0,Y2=111.0)
    fbButtonTopLine[2]=(X1=394.0,Y1=98.0,X2=544.0,Y2=111.0)
    fbButtonTopLine[3]=(X1=544.0,Y1=98.0,X2=666.0,Y2=111.0)
    fbButtonTopLine[4]=(X1=666.0,Y1=98.0,X2=704.0,Y2=111.0)
    fbButtonTopLine[5]=(X1=704.0,Y1=98.0,X2=739.0,Y2=111.0)
    fbButtonTopLine[6]=(X1=739.0,Y1=98.0,X2=794.0,Y2=111.0)
    fbButtonTopLine[7]=(X1=794.0,Y1=98.0,X2=830.0,Y2=111.0)
    fbButtonTopLine[8]=(X1=830.0,Y1=98.0,X2=930.0,Y2=111.0)
    fbButtonTopLine[9]=(X1=930.0,Y1=98.0,X2=1024.0,Y2=111.0)
    fbButtonTopLine[10]=(X1=929.0,Y1=98.0,X2=1024.0,Y2=111.0)
    fbLabelTeamScore[0]=(X1=174.0,Y1=342.0,X2=225.0,Y2=355.0)
    fbLabelTeamScore[1]=(X1=174.0,Y1=626.0,X2=225.0,Y2=639.0)
    fbLabelTeamScoreResult[0]=(X1=18.0,Y1=366.0,X2=86.0,Y2=385.0)
    fbLabelTeamScoreResult[1]=(X1=18.0,Y1=654.0,X2=86.0,Y2=673.0)
    fbResultMyInfo[0]=(X1=94.0,Y1=210.0,X2=325.0,Y2=395.0)
    fbResultMyInfo[1]=(X1=94.0,Y1=498.0,X2=325.0,Y2=683.0)
    fbLabelMyInfo[0]=(X1=18.0,Y1=24.0,X2=230.0,Y2=39.0)
    fbLabelMyInfo[1]=(X1=18.0,Y1=52.0,X2=106.0,Y2=65.0)
    fbLabelMyInfo[2]=(X1=114.0,Y1=52.0,X2=230.0,Y2=65.0)
    fbLabelMyInfo[3]=(X1=18.0,Y1=72.0,X2=106.0,Y2=85.0)
    fbLabelMyInfo[4]=(X1=114.0,Y1=72.0,X2=230.0,Y2=85.0)
    fbLabelMyInfo[5]=(X1=18.0,Y1=92.0,X2=106.0,Y2=105.0)
    fbLabelMyInfo[6]=(X1=114.0,Y1=92.0,X2=230.0,Y2=105.0)
    fbLabelMyInfo[7]=(X1=18.0,Y1=112.0,X2=325.0,Y2=125.0)
    fbLabelMyInfo[8]=(X1=114.0,Y1=112.0,X2=230.0,Y2=125.0)
    fbLabelMyInfo[9]=(X1=18.0,Y1=132.0,X2=325.0,Y2=145.0)
    fbLabelMyInfo[10]=(X1=114.0,Y1=132.0,X2=230.0,Y2=145.0)
    fbLabelMyInfo[11]=(X1=18.0,Y1=152.0,X2=325.0,Y2=165.0)
    fbLabelMyInfo[12]=(X1=114.0,Y1=152.0,X2=230.0,Y2=165.0)
    strMyInfo[0]="My Combat Information"
    strMyInfo[1]="EXP Earned"
    strMyInfo[2]="Points Earned"
    strMyInfo[3]="Kills/Deaths"
    strMyInfo[4]="Headshot"
    strMyInfo[5]="Grenade Kills"
    strMyInfo[6]="Highest Killstreak"
}