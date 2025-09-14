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
var() automated FloatBox fbLabelTopLine;
var export editinline BTOwnerDrawImageHK LabelTopLine;
var() automated FloatBox fbButtonTopLine[11];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTopLine[11];
var export editinline BTOwnerDrawImageHK LabelSeparator[10];
var() automated FloatBox fbLabelTeamScore[2];
var export editinline BTOwnerDrawImageHK LabelTeamScore[2];
var() automated FloatBox fbLabelTeamScoreResult[2];
var export editinline BTOwnerDrawImageHK LabelTeamScoreResult[2];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    LabelRoomName = NewLabelComponent(fbLabelRoomName, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelACL[0] = NewLabelComponent(fbLabelACL[0], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1);
    LabelACL[1] = NewLabelComponent(fbLabelACL[1], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1);
    LabelSelectACL[0] = NewLabelComponent(fbLabelACL[0], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_cli);
    LabelSelectACL[0].SetVisibility(false);
    LabelSelectACL[1] = NewLabelComponent(fbLabelACL[1], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_cli);
    LabelSelectACL[1].SetVisibility(false);
    ACLResult[0] = BTACLMatchResultHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTACLMatchResultHK', fbACLResult[0]));
    ACLResult[0].MultiColumnList.MyScrollBar.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
    ACLResult[0].MultiColumnList.MyScrollBar.ApplyAWinPos();
    ACLResult[1] = BTACLMatchResultHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTACLMatchResultHK', fbACLResult[1]));
    ACLResult[1].MultiColumnList.MyScrollBar.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
    ACLResult[1].MultiColumnList.MyScrollBar.ApplyAWinPos();
    LabelTeamLogo[0] = NewLabelComponent(fbLabelTeamLogo[0], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_result_AF_ma);
    LabelTeamLogo[1] = NewLabelComponent(fbLabelTeamLogo[1], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_result_RSA_ma);
    LabelTeamResult[0] = NewLabelComponent(fbLabelTeamResult[0], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_win_2);
    LabelTeamResult[1] = NewLabelComponent(fbLabelTeamResult[1], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_lose_2);
    LabelTeamScore[0] = NewLabelComponent(fbLabelTeamScore[0], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelTeamScore[0].Caption = strLabelTeamScore;
    LabelTeamScore[1] = NewLabelComponent(fbLabelTeamScore[1], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelTeamScore[1].Caption = strLabelTeamScore;
    LabelTeamScoreResult[0] = NewLabelComponent(fbLabelTeamScoreResult[0], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelTeamScoreResult[0].SetFontSizeAll(14);
    LabelTeamScoreResult[1] = NewLabelComponent(fbLabelTeamScoreResult[1], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelTeamScoreResult[1].SetFontSizeAll(14);
    LabelTopLine = NewLabelComponent(fbLabelTopLine, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_n);
    i = 0;
    J0x387:

    // End:0x497 [Loop If]
    if(i < 11)
    {
        ButtonTopLine[i] = NewButtonComponent(fbButtonTopLine[i]);
        ButtonTopLine[i].Caption = strButtonTopLine[i];
        ButtonTopLine[i].SetDefaultListButtonImage();
        ButtonTopLine[i].SetDefaultListTopButtonFontColor();
        // End:0x48D
        if(i < 10)
        {
            LabelSeparator[i] = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fbButtonTopLine[i].X2 - float(2), fbButtonTopLine[i].Y1 + float(3), fbButtonTopLine[i].X2 + float(2), fbButtonTopLine[i].Y2 - float(3)), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_list_divid);
        }
        i++;
        // [Loop Continue]
        goto J0x387;
    }
    //return;    
}

function SetData(wMatchMaker MM)
{
    local int i, j, k, bonusid_j, Winner;

    local ResultInfo ri;
    local wMatchUserInfo ui;
    local array<int> BonusIDs;

    i = 0;
    J0x07:

    // End:0x520 [Loop If]
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
        // End:0x276
        if(ri.UserID == MM.kUID)
        {
            ACLResult[ri.Team].AddTeamMemeber(true, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, ui.Grade, ri.Nick, ui.Clanname, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, false, ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
            LabelSelectACL[ri.Team].SetVisibility(true);
            // [Explicit Continue]
            goto J0x516;
        }
        // End:0x3CD
        if(ui == none)
        {
            ACLResult[ri.Team].AddTeamMemeber(false, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, ui.Grade, ri.Nick, ui.Clanname, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, MM.IsFriendlyUser(ui.UserName, ui.Clanname), ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
            // [Explicit Continue]
            goto J0x516;
        }
        ACLResult[ri.Team].AddTeamMemeber(false, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, ui.Grade, ri.Nick, ui.Clanname, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, MM.IsFriendlyUser(ui.UserName, ui.Clanname), ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
        J0x516:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    LabelTeamScoreResult[0].Caption = string(MM.ResultTeamScores[0]);
    LabelTeamScoreResult[1].Caption = string(MM.ResultTeamScores[1]);
    // End:0x5EC
    if((ACLResult[1].ACLRowList.Length == 0) || MM.ResultTeamScores[0] > MM.ResultTeamScores[1])
    {
        Winner = 0;
        LabelTeamResult[0].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_win_2;
        LabelTeamResult[1].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_lose_2;        
    }
    else
    {
        Winner = 1;
        LabelTeamResult[1].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_win_3;
        LabelTeamResult[0].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_lose_3;
    }
    // End:0x6F4
    if(Winner == MM.kTeamID)
    {
        // End:0x6A8
        if(MM.kTeamID == 0)
        {
            LabelRoomName.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_top_win_af;
            PlayerOwner().Player.Console.SetOneBGM("bgm_af_win");            
        }
        else
        {
            LabelRoomName.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_top_win_rsa;
            PlayerOwner().Player.Console.SetOneBGM("bgm_rsa_win");
        }        
    }
    else
    {
        // End:0x754
        if(MM.kTeamID == 0)
        {
            LabelRoomName.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_top_lose_af;
            PlayerOwner().Player.Console.SetOneBGM("bgm_af_lose");            
        }
        else
        {
            LabelRoomName.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_top_lose_rsa;
            PlayerOwner().Player.Console.SetOneBGM("bgm_rsa_lose");
        }
    }
    //return;    
}

defaultproperties
{
    strButtonTopLine[0]="??"
    strButtonTopLine[1]="??"
    strButtonTopLine[2]="???"
    strButtonTopLine[3]="???"
    strButtonTopLine[4]="??"
    strButtonTopLine[5]="?"
    strButtonTopLine[6]="????"
    strButtonTopLine[7]="??"
    strButtonTopLine[8]="???"
    strButtonTopLine[9]="???"
    strButtonTopLine[10]="???"
    strLabelTeamScore="? ??"
    fbLabelRoomName=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=89.0000000)
    fbACLResult[0]=(X1=233.0000000,Y1=118.0000000,X2=1024.0000000,Y2=390.0000000)
    fbACLResult[1]=(X1=233.0000000,Y1=402.0000000,X2=1024.0000000,Y2=674.0000000)
    fbLabelACL[0]=(X1=168.0000000,Y1=115.0000000,X2=1024.0000000,Y2=392.0000000)
    fbLabelACL[1]=(X1=168.0000000,Y1=399.0000000,X2=1024.0000000,Y2=676.0000000)
    fbLabelTeamLogo[0]=(X1=169.0000000,Y1=117.0000000,X2=231.0000000,Y2=390.0000000)
    fbLabelTeamLogo[1]=(X1=169.0000000,Y1=401.0000000,X2=231.0000000,Y2=674.0000000)
    fbLabelTeamResult[0]=(X1=0.0000000,Y1=115.0000000,X2=168.0000000,Y2=392.0000000)
    fbLabelTeamResult[1]=(X1=0.0000000,Y1=399.0000000,X2=168.0000000,Y2=676.0000000)
    fbLabelTopLine=(X1=0.0000000,Y1=87.0000000,X2=1024.0000000,Y2=113.0000000)
    fbButtonTopLine[0]=(X1=233.0000000,Y1=87.0000000,X2=266.0000000,Y2=113.0000000)
    fbButtonTopLine[1]=(X1=266.0000000,Y1=87.0000000,X2=300.0000000,Y2=113.0000000)
    fbButtonTopLine[2]=(X1=300.0000000,Y1=87.0000000,X2=461.0000000,Y2=113.0000000)
    fbButtonTopLine[3]=(X1=461.0000000,Y1=87.0000000,X2=572.0000000,Y2=113.0000000)
    fbButtonTopLine[4]=(X1=572.0000000,Y1=87.0000000,X2=610.0000000,Y2=113.0000000)
    fbButtonTopLine[5]=(X1=610.0000000,Y1=87.0000000,X2=645.0000000,Y2=113.0000000)
    fbButtonTopLine[6]=(X1=645.0000000,Y1=87.0000000,X2=697.0000000,Y2=113.0000000)
    fbButtonTopLine[7]=(X1=697.0000000,Y1=87.0000000,X2=733.0000000,Y2=113.0000000)
    fbButtonTopLine[8]=(X1=733.0000000,Y1=87.0000000,X2=835.0000000,Y2=113.0000000)
    fbButtonTopLine[9]=(X1=835.0000000,Y1=87.0000000,X2=929.0000000,Y2=113.0000000)
    fbButtonTopLine[10]=(X1=929.0000000,Y1=87.0000000,X2=1024.0000000,Y2=113.0000000)
    fbLabelTeamScore[0]=(X1=174.0000000,Y1=342.0000000,X2=225.0000000,Y2=355.0000000)
    fbLabelTeamScore[1]=(X1=174.0000000,Y1=626.0000000,X2=225.0000000,Y2=639.0000000)
    fbLabelTeamScoreResult[0]=(X1=174.0000000,Y1=364.0000000,X2=225.0000000,Y2=383.0000000)
    fbLabelTeamScoreResult[1]=(X1=174.0000000,Y1=648.0000000,X2=225.0000000,Y2=667.0000000)
}