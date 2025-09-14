class BTTPMatchResultPrivateHK extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strButtonTopLine[11];
var() automated FloatBox fbLabelRoomName;
var export editinline BTOwnerDrawImageHK LabelRoomName;
var() automated FloatBox fbACLResult;
var export editinline BTACLMatchResultHK ACLResult;
var() automated FloatBox fbLabelACL;
var export editinline BTOwnerDrawImageHK LabelACL;
var export editinline BTOwnerDrawImageHK LabelSelectACL;
var() automated FloatBox fbLabelLogo;
var export editinline BTOwnerDrawImageHK LabelLogo;
var() automated FloatBox fbLabelTopLine;
var export editinline BTOwnerDrawImageHK LabelTopLine;
var() automated FloatBox fbButtonTopLine[11];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTopLine[11];
var export editinline BTOwnerDrawImageHK LabelSeparator[10];
var export editinline BTOwnerDrawImageHK ResultMyInfo;
var() automated FloatBox fbResultMyInfo;
var() automated FloatBox fbLabelMyInfo[13];
var export editinline BTOwnerDrawImageHK LabelMyInfo[13];
var localized string strMyInfo[7];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i, nIndex;

    super(GUIPanel).InitComponent(MyController, myOwner);
    LabelRoomName = NewLabelComponent(fbLabelRoomName, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelLogo = NewLabelComponent(fbLabelLogo, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.GameResult_Private_Mark, 0.9000000);
    LabelACL = NewLabelComponent(fbLabelACL, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.GameResult_Private_BG);
    LabelSelectACL = NewLabelComponent(fbLabelACL, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_cli);
    ACLResult = BTACLMatchResultHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTACLMatchResultHK', fbACLResult));
    ACLResult.MultiColumnList.MyScrollBar.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
    ACLResult.MultiColumnList.MyScrollBar.ApplyAWinPos();
    LabelTopLine = NewLabelComponent(fbLabelTopLine, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_n);
    i = 0;
    J0x13B:

    // End:0x1B8 [Loop If]
    if(i < 10)
    {
        ButtonTopLine[i] = NewButtonComponent(fbButtonTopLine[i]);
        ButtonTopLine[i].Caption = strButtonTopLine[i];
        ButtonTopLine[i].SetDefaultListButtonImage();
        ButtonTopLine[i].SetDefaultListTopButtonFontColor();
        i++;
        // [Loop Continue]
        goto J0x13B;
    }
    ResultMyInfo = NewLabelComponent(fbResultMyInfo, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.GameResult_MyInfo_BG);
    i = 0;
    J0x1DE:

    // End:0x4AC [Loop If]
    if(i < 13)
    {
        LabelMyInfo[i] = NewLabelComponent(fbResultMyInfo, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        LabelMyInfo[i].AWinPos.X1 = ResultMyInfo.AWinPos.X1 + fbLabelMyInfo[i].X1;
        LabelMyInfo[i].AWinPos.Y1 = ResultMyInfo.AWinPos.Y1 + fbLabelMyInfo[i].Y1;
        LabelMyInfo[i].AWinPos.X2 = ResultMyInfo.AWinPos.X1 + fbLabelMyInfo[i].X2;
        LabelMyInfo[i].AWinPos.Y2 = ResultMyInfo.AWinPos.Y1 + fbLabelMyInfo[i].Y2;
        LabelMyInfo[i].ApplyAWinPos();
        LabelMyInfo[i].CaptionDrawType = 3;
        // End:0x3D9
        if(i == 0)
        {
            LabelMyInfo[i].Caption = strMyInfo[0];
            LabelMyInfo[i].SetFontSizeAll(11);
            LabelMyInfo[i].FontColor[0].R = 153;
            LabelMyInfo[i].FontColor[0].G = 153;
            LabelMyInfo[i].FontColor[0].B = 153;
            nIndex++;
            // [Explicit Continue]
            goto J0x4A2;
        }
        // End:0x42F
        if((float(i) % float(2)) == float(1))
        {
            LabelMyInfo[i].Caption = strMyInfo[nIndex];
            LabelMyInfo[i].SetFontSizeAll(9);
            nIndex++;
            // [Explicit Continue]
            goto J0x4A2;
        }
        LabelMyInfo[i].SetFontSizeAll(9);
        LabelMyInfo[i].FontColor[0].R = byte(255);
        LabelMyInfo[i].FontColor[0].G = 192;
        LabelMyInfo[i].FontColor[0].B = 0;
        J0x4A2:

        i++;
        // [Loop Continue]
        goto J0x1DE;
    }
    //return;    
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

    // End:0x5E7 [Loop If]
    if(i < MM.ResultInfos.Length)
    {
        ri = MM.ResultInfos[i];
        ui = MM.GetUserInfoByUID(ri.UserID);
        BonusIDs.Length = 0;
        j = 0;
        J0x68:

        // End:0x11C [Loop If]
        if(j < 9)
        {
            bonusid_j = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.static.BounsIDToBounsIconIndex(ri.BonusID[j]);
            // End:0x112
            if(bonusid_j != 0)
            {
                k = 0;
                J0xAB:

                // End:0xDD [Loop If]
                if(k < BonusIDs.Length)
                {
                    // End:0xD3
                    if(BonusIDs[k] == bonusid_j)
                    {
                        // [Explicit Break]
                        goto J0xDD;
                    }
                    k++;
                    // [Loop Continue]
                    goto J0xAB;
                }
                J0xDD:

                // End:0x112
                if(k == BonusIDs.Length)
                {
                    BonusIDs.Length = BonusIDs.Length + 1;
                    BonusIDs[BonusIDs.Length - 1] = bonusid_j;
                }
            }
            j++;
            // [Loop Continue]
            goto J0x68;
        }
        UserLevel = MM.GetUserGradeByUserName(ri.Nick);
        // End:0x14D
        if(UserLevel <= 0)
        {
            UserLevel = 1;
        }
        // End:0x365
        if(ri.UserID == MM.kUID)
        {
            ACLResult.AddTeamMemeber(true, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, UserLevel, ri.Nick, ui.ClanName, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, false, ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
            LabelSelectACL.SetVisibility(true);
            LabelMyInfo[2].Caption = ((string(ri.Exp) $ "(+") $ string(ri.ExpBonus)) $ "%)";
            LabelMyInfo[4].Caption = ((string(ri.Point) $ "(+") $ string(ri.PointBonus)) $ "%)";
            LabelMyInfo[6].Caption = (string(ri.Kill) $ "/") $ string(ri.Death);
            LabelMyInfo[8].Caption = "";
            LabelMyInfo[10].Caption = "";
            LabelMyInfo[12].Caption = "";
            // [Explicit Continue]
            goto J0x5DD;
        }
        // End:0x4A8
        if(ui == none)
        {
            ACLResult.AddTeamMemeber(false, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, UserLevel, ri.Nick, ui.ClanName, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, MM.IsFriendlyUser(ui.UserName, ui.ClanName), ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
            // [Explicit Continue]
            goto J0x5DD;
        }
        ACLResult.AddTeamMemeber(false, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, UserLevel, ri.Nick, ui.ClanName, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, MM.IsFriendlyUser(ui.UserName, ui.ClanName), ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
        J0x5DD:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

defaultproperties
{
    strButtonTopLine[0]="????"
    strButtonTopLine[1]="??"
    strButtonTopLine[2]="????????"
    strButtonTopLine[3]="????????"
    strButtonTopLine[4]="?????"
    strButtonTopLine[5]="???"
    strButtonTopLine[6]="?????????"
    strButtonTopLine[7]="???"
    strButtonTopLine[8]="?????"
    strButtonTopLine[9]="EXP"
    strButtonTopLine[10]="BP"
    fbLabelRoomName=(X1=384.0000000,Y1=0.0000000,X2=1024.0000000,Y2=113.0000000)
    fbACLResult=(X1=327.0000000,Y1=118.0000000,X2=1024.0000000,Y2=396.0000000)
    fbLabelACL=(X1=12.0000000,Y1=116.0000000,X2=1024.0000000,Y2=396.0000000)
    fbLabelLogo=(X1=12.0000000,Y1=116.0000000,X2=94.0000000,Y2=396.0000000)
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
    fbResultMyInfo=(X1=94.0000000,Y1=210.0000000,X2=325.0000000,Y2=395.0000000)
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
    strMyInfo[0]="My Combat Info"
    strMyInfo[1]="EXP Earned"
    strMyInfo[2]="?????? BP"
    strMyInfo[3]="Kill/Death"
}