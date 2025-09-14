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

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    LabelRoomName = NewLabelComponent(fbLabelRoomName, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelLogo = NewLabelComponent(fbLabelLogo, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_result_indimat_ma, 0.9000000);
    LabelACL = NewLabelComponent(fbLabelACL, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1);
    LabelSelectACL = NewLabelComponent(fbLabelACL, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_cli);
    ACLResult = BTACLMatchResultHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTACLMatchResultHK', fbACLResult));
    ACLResult.MultiColumnList.MyScrollBar.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
    ACLResult.MultiColumnList.MyScrollBar.ApplyAWinPos();
    LabelTopLine = NewLabelComponent(fbLabelTopLine, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_n);
    i = 0;
    J0x13B:

    // End:0x24B [Loop If]
    if(i < 11)
    {
        ButtonTopLine[i] = NewButtonComponent(fbButtonTopLine[i]);
        ButtonTopLine[i].Caption = strButtonTopLine[i];
        ButtonTopLine[i].SetDefaultListButtonImage();
        ButtonTopLine[i].SetDefaultListTopButtonFontColor();
        // End:0x241
        if(i < 10)
        {
            LabelSeparator[i] = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fbButtonTopLine[i].X2 - float(2), fbButtonTopLine[i].Y1 + float(3), fbButtonTopLine[i].X2 + float(2), fbButtonTopLine[i].Y2 - float(3)), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_list_divid);
        }
        i++;
        // [Loop Continue]
        goto J0x13B;
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

    // End:0x50A [Loop If]
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
        // End:0x288
        if(ri.UserID == MM.kUID)
        {
            ACLResult.AddTeamMemeber(true, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, UserLevel, ri.Nick, ui.ClanName, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, false, ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
            LabelSelectACL.SetVisibility(true);
            // [Explicit Continue]
            goto J0x500;
        }
        // End:0x3CB
        if(ui == none)
        {
            ACLResult.AddTeamMemeber(false, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, UserLevel, ri.Nick, ui.ClanName, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, MM.IsFriendlyUser(ui.UserName, ui.ClanName), ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
            // [Explicit Continue]
            goto J0x500;
        }
        ACLResult.AddTeamMemeber(false, ri.UserID, ui.ClanMark, ui.ClanBG, ui.ClanBL, UserLevel, ri.Nick, ui.ClanName, ri.Score, ri.Kill, ri.Assist, ri.Death, ri.Exp, ri.ExpBonus, ri.Point, ri.PointBonus, BonusIDs, ui.IsLookingFor, MM.IsFriendlyUser(ui.UserName, ui.ClanName), ui.LevelMarkID, ui.TitleMarkID, ui.Reserved1, ui.Reserved2, ui.Reserved3);
        J0x500:

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
    fbACLResult=(X1=151.0000000,Y1=118.0000000,X2=941.0000000,Y2=663.0000000)
    fbLabelACL=(X1=83.0000000,Y1=115.0000000,X2=942.0000000,Y2=666.0000000)
    fbLabelLogo=(X1=86.0000000,Y1=118.0000000,X2=150.0000000,Y2=663.0000000)
    fbLabelTopLine=(X1=0.0000000,Y1=87.0000000,X2=1024.0000000,Y2=113.0000000)
    fbButtonTopLine[0]=(X1=151.0000000,Y1=87.0000000,X2=182.0000000,Y2=113.0000000)
    fbButtonTopLine[1]=(X1=182.0000000,Y1=87.0000000,X2=216.0000000,Y2=113.0000000)
    fbButtonTopLine[2]=(X1=216.0000000,Y1=87.0000000,X2=377.0000000,Y2=113.0000000)
    fbButtonTopLine[3]=(X1=377.0000000,Y1=87.0000000,X2=488.0000000,Y2=113.0000000)
    fbButtonTopLine[4]=(X1=488.0000000,Y1=87.0000000,X2=526.0000000,Y2=113.0000000)
    fbButtonTopLine[5]=(X1=526.0000000,Y1=87.0000000,X2=561.0000000,Y2=113.0000000)
    fbButtonTopLine[6]=(X1=561.0000000,Y1=87.0000000,X2=613.0000000,Y2=113.0000000)
    fbButtonTopLine[7]=(X1=613.0000000,Y1=87.0000000,X2=649.0000000,Y2=113.0000000)
    fbButtonTopLine[8]=(X1=649.0000000,Y1=87.0000000,X2=751.0000000,Y2=113.0000000)
    fbButtonTopLine[9]=(X1=751.0000000,Y1=87.0000000,X2=845.0000000,Y2=113.0000000)
    fbButtonTopLine[10]=(X1=845.0000000,Y1=87.0000000,X2=941.0000000,Y2=113.0000000)
}