/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowClanInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:3
 *
 *******************************************************************************/
class BTWindowClanInfoHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strRadioLocation[14];
var localized string strLabel[15];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel[15];
var export editinline BTOwnerDrawImageHK Label[15];
var localized string strEdit[15];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbEdit[15];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelClanMark;
var export editinline BTOwnerDrawTextArrayHK Edit[15];
var export editinline BTLabelClanMarkHK LabelClanMark;
var export editinline BTMultiLineEditBoxHK ClanIntroduction;
var export editinline BTAutoScrollListHK ClanIntroduction2;
var localized string strNoRankState;

function SetData(ClanInfo stClanInfo)
{
    local int nPerc;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Edit[0].SetData(stClanInfo.CM_ClanName);
    LabelClanMark.SetData(stClanInfo.CM_Pattern, stClanInfo.CM_BG, stClanInfo.CM_BL, false, stClanInfo.ClanLevel);
    Edit[1].SetData(stClanInfo.ClanMasterCharname);
    // End:0xc9
    if(stClanInfo.ClanWin == 0 && stClanInfo.ClanLose == 0)
    {
        nPerc = 0;
    }
    // End:0xfe
    else
    {
        nPerc = int(float(stClanInfo.ClanWin) / float(stClanInfo.ClanWin + stClanInfo.ClanLose) * 100.0);
    }
    Edit[2].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[2], string(stClanInfo.ClanWin), string(stClanInfo.ClanLose), string(nPerc)));
    Edit[3].SetData(string(stClanInfo.ClanActivity));
    // End:0x18e
    if(stClanInfo.ClanActivityRank == 0)
    {
        Edit[4].SetData(strNoRankState);
    }
    // End:0x1c3
    else
    {
        Edit[4].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[3], string(stClanInfo.ClanActivityRank)));
    }
    Edit[5].SetData(GameMgr.GetClanLevelName(stClanInfo.ClanLevel));
    Edit[6].SetData(string(stClanInfo.ClanExp) $ "/" $ string(GameMgr.GetClanEndExp(stClanInfo.ClanLevel)));
    // End:0x258
    if(stClanInfo.tRankCur == 0)
    {
        Edit[7].SetData(strNoRankState);
    }
    // End:0x299
    else
    {
        Edit[7].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[3], string(stClanInfo.tRankCur), string(stClanInfo.tRankPrev)));
    }
    // End:0x2c3
    if(stClanInfo.mRankCur == 0)
    {
        Edit[8].SetData(strNoRankState);
    }
    // End:0x304
    else
    {
        Edit[8].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[8], string(stClanInfo.mRankCur), string(stClanInfo.mRankPrev)));
    }
    BTLabelLocationHK(Edit[9]).SetLocationID(stClanInfo.Region);
    Edit[10].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[9], string(stClanInfo.MemberCnt), string(stClanInfo.MemberTotal)));
    BTLabelRecruitHK(Edit[11]).SetRecruitState(stClanInfo.IsRecruit);
    Edit[12].SetData(stClanInfo.HowOld);
    Edit[13].SetData(stClanInfo.Keyword);
    Edit[14].SetData("");
    ClanIntroduction2.Clear();
    ClanIntroduction2.AddLineRow(none, stClanInfo.Intro);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x8f [While If]
    if(i < 15)
    {
        Label[i] = NewLabelComponent(fbLabel[i], class'BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    i = 0;
    J0x96:
    // End:0x334 [While If]
    if(i < 15)
    {
        // End:0xff
        if(i == 9)
        {
            Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new class'BTLabelLocationHK', fbEdit[i]));
            Edit[i].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
        }
        // End:0x1aa
        else
        {
            // End:0x15c
            if(i == 11)
            {
                Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new class'BTLabelRecruitHK', fbEdit[i]));
                Edit[i].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
            }
            // End:0x1aa
            else
            {
                Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new class'BTOwnerDrawTextArrayHK', fbEdit[i]));
                Edit[i].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
            }
        }
        // End:0x32a
        if(i == 14)
        {
            ClanIntroduction = BTMultiLineEditBoxHK(NewComponent(new class'BTMultiLineEditBoxHK', class'BTCustomDrawHK'.static.MakeResizeBox(fbEdit[i], -4, -6)));
            ClanIntroduction.bReadOnly = true;
            ClanIntroduction.bActiveCursor = false;
            fb = fbEdit[i];
            fb.Y1 += float(1);
            fb.Y2 -= float(1);
            fb.X2 -= float(15);
            ClanIntroduction2 = BTAutoScrollListHK(NewComponent(new class'BTAutoScrollListHK', fb));
            ClanIntroduction2.MultiColumnList.MyScrollBar.bUseAWinPos = true;
            ClanIntroduction2.MultiColumnList.MyScrollBar.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 0.0, 0.0, 0.0);
            ClanIntroduction2.MultiColumnList.MyScrollBar.ApplyAWinPos();
            ClanIntroduction2.bAutoShowScrollBar = true;
            ClanIntroduction2.SelectImage = class'BTUIResourcePoolHK'.default.empty;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x96;
    }
    LabelClanMark = BTLabelClanMarkHK(NewComponent(new class'BTLabelClanMarkHK', fbLabelClanMark));
    ButtonCancel.SetVisibility(false);
}

function Internal_OnOpen();

defaultproperties
{
    strLabel[0]="Clan Name"
    strLabel[1]="Master"
    strLabel[2]="Records"
    strLabel[3]="Activity"
    strLabel[4]="Activity Rank"
    strLabel[5]="Clan Rank"
    strLabel[6]="Clan EXP"
    strLabel[7]="Rank"
    strLabel[8]="Rank (Mo.)"
    strLabel[9]="Region"
    strLabel[10]="Players"
    strLabel[11]="Recruiting"
    strLabel[12]="History"
    strLabel[13]="Keywords"
    strLabel[14]="Clan Intro"
    fbLabel[0]=(X1=275.0,Y1=203.0,X2=760.0,Y2=577.0)
    fbLabel[1]=(X1=275.0,Y1=237.0,X2=760.0,Y2=577.0)
    fbLabel[2]=(X1=521.0,Y1=237.0,X2=760.0,Y2=577.0)
    fbLabel[3]=(X1=275.0,Y1=271.0,X2=760.0,Y2=577.0)
    fbLabel[4]=(X1=521.0,Y1=271.0,X2=760.0,Y2=577.0)
    fbLabel[5]=(X1=275.0,Y1=305.0,X2=760.0,Y2=733.0)
    fbLabel[6]=(X1=521.0,Y1=305.0,X2=760.0,Y2=577.0)
    fbLabel[7]=(X1=275.0,Y1=339.0,X2=760.0,Y2=577.0)
    fbLabel[8]=(X1=521.0,Y1=339.0,X2=760.0,Y2=733.0)
    fbLabel[9]=(X1=275.0,Y1=373.0,X2=760.0,Y2=577.0)
    fbLabel[10]=(X1=521.0,Y1=373.0,X2=760.0,Y2=577.0)
    fbLabel[11]=(X1=275.0,Y1=407.0,X2=760.0,Y2=577.0)
    fbLabel[12]=(X1=521.0,Y1=407.0,X2=760.0,Y2=577.0)
    fbLabel[13]=(X1=275.0,Y1=441.0,X2=760.0,Y2=577.0)
    fbLabel[14]=(X1=275.0,Y1=475.0,X2=760.0,Y2=577.0)
    strEdit[2]="%0 W / %1 L (%2%)"
    strEdit[3]="Place: %0"
    strEdit[8]="Place: %0"
    strEdit[9]="%0 / %1"
    strEdit[10]="%0 y, %1 d"
    fbEdit[0]=(X1=412.0,Y1=196.0,X2=752.0,Y2=223.0)
    fbEdit[1]=(X1=372.0,Y1=230.0,X2=513.0,Y2=257.0)
    fbEdit[2]=(X1=611.0,Y1=230.0,X2=752.0,Y2=257.0)
    fbEdit[3]=(X1=372.0,Y1=264.0,X2=513.0,Y2=291.0)
    fbEdit[4]=(X1=611.0,Y1=264.0,X2=752.0,Y2=291.0)
    fbEdit[5]=(X1=372.0,Y1=298.0,X2=513.0,Y2=325.0)
    fbEdit[6]=(X1=611.0,Y1=298.0,X2=752.0,Y2=325.0)
    fbEdit[7]=(X1=372.0,Y1=332.0,X2=513.0,Y2=359.0)
    fbEdit[8]=(X1=611.0,Y1=332.0,X2=752.0,Y2=359.0)
    fbEdit[9]=(X1=372.0,Y1=366.0,X2=513.0,Y2=393.0)
    fbEdit[10]=(X1=611.0,Y1=366.0,X2=752.0,Y2=393.0)
    fbEdit[11]=(X1=372.0,Y1=400.0,X2=513.0,Y2=427.0)
    fbEdit[12]=(X1=611.0,Y1=400.0,X2=752.0,Y2=427.0)
    fbEdit[13]=(X1=372.0,Y1=434.0,X2=752.0,Y2=461.0)
    fbEdit[14]=(X1=372.0,Y1=468.0,X2=752.0,Y2=529.0)
    fbLabelClanMark=(X1=372.0,Y1=193.0,X2=404.0,Y2=225.0)
    strNoRankState="None"
    fbBackgroundImage=(X1=244.0,Y1=140.0,X2=788.0,Y2=607.0)
    fbTopLine=(X1=265.0,Y1=161.0,X2=767.0,Y2=187.0)
    fbBottomLine=(X1=265.0,Y1=533.0,X2=768.0,Y2=587.0)
    fbButtonOK=(X1=452.0,Y1=543.0,X2=572.0,Y2=572.0)
    strTitle="Clan Info"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    OnOpen=Internal_OnOpen
}