/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPMatchResultPrivateHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:20
 *	Functions:2
 *
 *******************************************************************************/
class BTTPMatchResultPrivateHK extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strButtonTopLine[11];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelRoomName;
var export editinline BTOwnerDrawImageHK LabelRoomName;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbACLResult;
var export editinline BTACLMatchResultHK ACLResult;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelACL;
var export editinline BTOwnerDrawImageHK LabelACL;
var export editinline BTOwnerDrawImageHK LabelSelectACL;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelLogo;
var export editinline BTOwnerDrawImageHK LabelLogo;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelTopLine;
var export editinline BTOwnerDrawImageHK LabelTopLine;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonTopLine[11];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTopLine[11];
var export editinline BTOwnerDrawImageHK LabelSeparator[10];
var export editinline BTOwnerDrawImageHK ResultMyInfo;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbResultMyInfo;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelMyInfo[13];
var export editinline BTOwnerDrawImageHK LabelMyInfo[13];
var localized string strMyInfo[7];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i, nIndex;

    super(GUIPanel).InitComponent(MyController, myOwner);
    LabelRoomName = NewLabelComponent(fbLabelRoomName, class'BTUIResourcePoolHK'.default.empty);
    LabelLogo = NewLabelComponent(fbLabelLogo, class'BTUIResourcePoolHK'.default.GameResult_Private_Mark, 0.90);
    LabelACL = NewLabelComponent(fbLabelACL, class'BTUIResourcePoolHK'.default.GameResult_Private_BG);
    LabelSelectACL = NewLabelComponent(fbLabelACL, class'BTUIResourcePoolHK'.default.butt_list_cli);
    ACLResult = BTACLMatchResultHK(NewComponent(new class'BTACLMatchResultHK', fbACLResult));
    ACLResult.MultiColumnList.MyScrollBar.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 0.0, 0.0, 0.0);
    ACLResult.MultiColumnList.MyScrollBar.ApplyAWinPos();
    LabelTopLine = NewLabelComponent(fbLabelTopLine, class'BTUIResourcePoolHK'.default.butt_list_n);
    i = 0;
    J0x13b:
    // End:0x1b8 [While If]
    if(i < 10)
    {
        ButtonTopLine[i] = NewButtonComponent(fbButtonTopLine[i]);
        ButtonTopLine[i].Caption = strButtonTopLine[i];
        ButtonTopLine[i].SetDefaultListButtonImage();
        ButtonTopLine[i].SetDefaultListTopButtonFontColor();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x13b;
    }
    ResultMyInfo = NewLabelComponent(fbResultMyInfo, class'BTUIResourcePoolHK'.default.GameResult_MyInfo_BG);
    i = 0;
    J0x1de:
    // End:0x4ac [While If]
    if(i < 13)
    {
        LabelMyInfo[i] = NewLabelComponent(fbResultMyInfo, class'BTUIResourcePoolHK'.default.empty);
        LabelMyInfo[i].AWinPos.X1 = ResultMyInfo.AWinPos.X1 + fbLabelMyInfo[i].X1;
        LabelMyInfo[i].AWinPos.Y1 = ResultMyInfo.AWinPos.Y1 + fbLabelMyInfo[i].Y1;
        LabelMyInfo[i].AWinPos.X2 = ResultMyInfo.AWinPos.X1 + fbLabelMyInfo[i].X2;
        LabelMyInfo[i].AWinPos.Y2 = ResultMyInfo.AWinPos.Y1 + fbLabelMyInfo[i].Y2;
        LabelMyInfo[i].ApplyAWinPos();
        LabelMyInfo[i].CaptionDrawType = 3;
        // End:0x3d9
        if(i == 0)
        {
            LabelMyInfo[i].Caption = strMyInfo[0];
            LabelMyInfo[i].SetFontSizeAll(11);
            LabelMyInfo[i].FontColor[0].R = 153;
            LabelMyInfo[i].FontColor[0].G = 153;
            LabelMyInfo[i].FontColor[0].B = 153;
            ++ nIndex;
        }
        // End:0x4a2
        else
        {
            // End:0x42f
            if(float(i) % float(2) == float(1))
            {
                LabelMyInfo[i].Caption = strMyInfo[nIndex];
                LabelMyInfo[i].SetFontSizeAll(9);
                ++ nIndex;
            }
            // End:0x4a2
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
        goto J0x1de;
    }
}

function SetData(wMatchMaker MM)
{
    local int i, j, k, bonusid_j;
    local ResultInfo ri;
    local wMatchUserInfo ui;
    local array<int> BonusIDs;
    local int UserLevel;

    i = 0;
    J0x07:
    // End:0x5e7 [While If]
    if(i < MM.ResultInfos.Length)
    {
        ri = MM.ResultInfos[i];
        ui = MM.GetUserInfoByUID(ri.UserID);
        BonusIDs.Length = 0;
        j = 0;
        J0x68:
        // End:0x11c [While If]
        if(j < 9)
        {
            bonusid_j = class'BTUIResourcePoolHK'.static.BounsIDToBounsIconIndex(ri.BonusID[j]);
            // End:0x112
            if(bonusid_j != 0)
            {
                k = 0;
                J0xab:
                // End:0xdd [While If]
                if(k < BonusIDs.Length)
                {
                    // End:0xd3
                    if(BonusIDs[k] == bonusid_j)
                    {
                    }
                    // End:0xdd
                    else
                    {
                        ++ k;
                        // This is an implied JumpToken; Continue!
                        goto J0xab;
                    }
                }
                // End:0x112
                if(k == BonusIDs.Length)
                {
                    BonusIDs.Length = BonusIDs.Length + 1;
                    BonusIDs[BonusIDs.Length - 1] = bonusid_j;
                }
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x68;
        }
        UserLevel = MM.GetUserGradeByUserName(ri.Nick);
        // End:0x14d
        if(UserLevel <= 0)
        {
            UserLevel = 1;
        }
        // End:0x365
        if(ri.UserID == MM.kUID)
        {
            ACLResult.AddTeamMemeber(true, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, UserLevel, ri.Nick, ui.ClanName, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, false, ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
            LabelSelectACL.SetVisibility(true);
            LabelMyInfo[2].Caption = string(ri.Exp) $ "(+" $ string(ri.ExpBonus) $ "%)";
            LabelMyInfo[4].Caption = string(ri.Point) $ "(+" $ string(ri.PointBonus) $ "%)";
            LabelMyInfo[6].Caption = string(ri.Kill) $ "/" $ string(ri.Death);
            LabelMyInfo[8].Caption = "";
            LabelMyInfo[10].Caption = "";
            LabelMyInfo[12].Caption = "";
        }
        // End:0x5dd
        else
        {
            // End:0x4a8
            if(ui == none)
            {
                ACLResult.AddTeamMemeber(false, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, UserLevel, ri.Nick, ui.ClanName, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, MM.IsFriendlyUser(ui.UserName, ui.ClanName), ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
            }
            // End:0x5dd
            else
            {
                ACLResult.AddTeamMemeber(false, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, UserLevel, ri.Nick, ui.ClanName, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, MM.IsFriendlyUser(ui.UserName, ui.ClanName), ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
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
    fbLabelRoomName=(X1=384.0,Y1=0.0,X2=1024.0,Y2=113.0)
    fbACLResult=(X1=327.0,Y1=118.0,X2=1024.0,Y2=396.0)
    fbLabelACL=(X1=12.0,Y1=116.0,X2=1024.0,Y2=396.0)
    fbLabelLogo=(X1=12.0,Y1=116.0,X2=94.0,Y2=396.0)
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
    fbResultMyInfo=(X1=94.0,Y1=210.0,X2=325.0,Y2=395.0)
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
    strMyInfo[4]="Headshots"
    strMyInfo[5]="Grenade Kills"
    strMyInfo[6]="Highest Kill Streak"
}