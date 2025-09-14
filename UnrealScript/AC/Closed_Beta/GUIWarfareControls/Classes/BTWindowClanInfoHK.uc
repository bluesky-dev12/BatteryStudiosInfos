class BTWindowClanInfoHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strRadioLocation[14];
var localized string strLabel[15];
var() automated FloatBox fbLabel[15];
var export editinline BTOwnerDrawImageHK Label[15];
var localized string strEdit[15];
var() automated FloatBox fbEdit[15];
var() automated FloatBox fbLabelClanMark;
var export editinline BTOwnerDrawTextArrayHK Edit[15];
var export editinline BTLabelClanMarkHK LabelClanMark;
var export editinline BTMultiLineEditBoxHK ClanIntroduction;
var export editinline BTAutoScrollListHK ClanIntroduction2;

function SetData(ClanInfo stClanInfo)
{
    local int nPerc;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Edit[0].SetData(stClanInfo.CM_ClanName);
    LabelClanMark.SetData(stClanInfo.CM_Pattern, stClanInfo.CM_BG, stClanInfo.CM_BL, false, stClanInfo.ClanLevel);
    Edit[1].SetData(stClanInfo.ClanMasterCharname);
    // End:0xC9
    if((stClanInfo.ClanWin == 0) && stClanInfo.ClanLose == 0)
    {
        nPerc = 0;        
    }
    else
    {
        nPerc = int((float(stClanInfo.ClanWin) / float(stClanInfo.ClanWin + stClanInfo.ClanLose)) * 100.0000000);
    }
    Edit[2].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[2], string(stClanInfo.ClanWin), string(stClanInfo.ClanLose), string(nPerc)));
    Edit[3].SetData(string(stClanInfo.ClanActivity));
    Edit[4].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[3], string(stClanInfo.ClanActivityRank)));
    Edit[5].SetData(GameMgr.GetClanLevelName(stClanInfo.ClanLevel));
    Edit[6].SetData((string(stClanInfo.ClanExp) $ "/") $ string(GameMgr.GetClanEndExp(stClanInfo.ClanLevel)));
    Edit[7].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[3], string(stClanInfo.tRankCur), string(stClanInfo.tRankPrev)));
    Edit[8].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[8], string(stClanInfo.mRankCur), string(stClanInfo.mRankPrev)));
    BTLabelLocationHK(Edit[9]).SetLocationID(int(stClanInfo.Region));
    Edit[10].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[9], string(stClanInfo.MemberCnt), string(stClanInfo.MemberTotal)));
    BTLabelRecruitHK(Edit[11]).SetRecruitState(stClanInfo.IsRecruit);
    Edit[12].SetData(stClanInfo.HowOld);
    Edit[13].SetData(stClanInfo.Keyword);
    Edit[14].SetData("");
    ClanIntroduction2.Clear();
    ClanIntroduction2.AddLineRow(none, stClanInfo.Intro);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x8F [Loop If]
    if(i < 15)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    i = 0;
    J0x96:

    // End:0x334 [Loop If]
    if(i < 15)
    {
        // End:0xFF
        if(i == 9)
        {
            Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelLocationHK', fbEdit[i]));
            Edit[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;            
        }
        else
        {
            // End:0x15C
            if(i == 11)
            {
                Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelRecruitHK', fbEdit[i]));
                Edit[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;                
            }
            else
            {
                Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawTextArrayHK', fbEdit[i]));
                Edit[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
            }
        }
        // End:0x32A
        if(i == 14)
        {
            ClanIntroduction = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeResizeBox(fbEdit[i], -4, -6)));
            ClanIntroduction.bReadOnly = true;
            ClanIntroduction.bActiveCursor = false;
            fb = fbEdit[i];
            fb.Y1 += float(1);
            fb.Y2 -= float(1);
            fb.X2 -= float(15);
            ClanIntroduction2 = BTAutoScrollListHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTAutoScrollListHK', fb));
            ClanIntroduction2.MultiColumnList.MyScrollBar.bUseAWinPos = true;
            ClanIntroduction2.MultiColumnList.MyScrollBar.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
            ClanIntroduction2.MultiColumnList.MyScrollBar.ApplyAWinPos();
            ClanIntroduction2.bAutoShowScrollBar = true;
            ClanIntroduction2.SelectImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
        }
        i++;
        // [Loop Continue]
        goto J0x96;
    }
    LabelClanMark = BTLabelClanMarkHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelClanMarkHK', fbLabelClanMark));
    ButtonCancel.SetVisibility(false);
    //return;    
}

function Internal_OnOpen()
{
    //return;    
}

defaultproperties
{
    strLabel[0]="Clan Name"
    strLabel[1]="Clan Master"
    strLabel[2]="Records"
    strLabel[3]="Activity (Monthly)"
    strLabel[4]="Activity Rank (Monthly)"
    strLabel[5]="Clan Rank"
    strLabel[6]="Clan EXP"
    strLabel[7]="Rank"
    strLabel[8]="Rank (Monthly)"
    strLabel[9]="Active Region"
    strLabel[10]="Players"
    strLabel[11]="Recruitment Status"
    strLabel[12]="History"
    strLabel[13]="Keywords"
    strLabel[14]="Clan Intro"
    fbLabel[0]=(X1=275.0000000,Y1=203.0000000,X2=760.0000000,Y2=577.0000000)
    fbLabel[1]=(X1=275.0000000,Y1=237.0000000,X2=760.0000000,Y2=577.0000000)
    fbLabel[2]=(X1=521.0000000,Y1=237.0000000,X2=760.0000000,Y2=577.0000000)
    fbLabel[3]=(X1=275.0000000,Y1=271.0000000,X2=760.0000000,Y2=577.0000000)
    fbLabel[4]=(X1=521.0000000,Y1=271.0000000,X2=760.0000000,Y2=577.0000000)
    fbLabel[5]=(X1=275.0000000,Y1=305.0000000,X2=760.0000000,Y2=733.0000000)
    fbLabel[6]=(X1=521.0000000,Y1=305.0000000,X2=760.0000000,Y2=577.0000000)
    fbLabel[7]=(X1=275.0000000,Y1=339.0000000,X2=760.0000000,Y2=577.0000000)
    fbLabel[8]=(X1=521.0000000,Y1=339.0000000,X2=760.0000000,Y2=733.0000000)
    fbLabel[9]=(X1=275.0000000,Y1=373.0000000,X2=760.0000000,Y2=577.0000000)
    fbLabel[10]=(X1=521.0000000,Y1=373.0000000,X2=760.0000000,Y2=577.0000000)
    fbLabel[11]=(X1=275.0000000,Y1=407.0000000,X2=760.0000000,Y2=577.0000000)
    fbLabel[12]=(X1=521.0000000,Y1=407.0000000,X2=760.0000000,Y2=577.0000000)
    fbLabel[13]=(X1=275.0000000,Y1=441.0000000,X2=760.0000000,Y2=577.0000000)
    fbLabel[14]=(X1=275.0000000,Y1=475.0000000,X2=760.0000000,Y2=577.0000000)
    strEdit[2]="%0 W / %1 L (%2%)"
    strEdit[3]="Place: %0"
    strEdit[8]="Place: %0"
    strEdit[9]="%0 / %1"
    strEdit[10]="%0 y, %1 d"
    fbEdit[0]=(X1=412.0000000,Y1=196.0000000,X2=752.0000000,Y2=223.0000000)
    fbEdit[1]=(X1=372.0000000,Y1=230.0000000,X2=513.0000000,Y2=257.0000000)
    fbEdit[2]=(X1=611.0000000,Y1=230.0000000,X2=752.0000000,Y2=257.0000000)
    fbEdit[3]=(X1=372.0000000,Y1=264.0000000,X2=513.0000000,Y2=291.0000000)
    fbEdit[4]=(X1=611.0000000,Y1=264.0000000,X2=752.0000000,Y2=291.0000000)
    fbEdit[5]=(X1=372.0000000,Y1=298.0000000,X2=513.0000000,Y2=325.0000000)
    fbEdit[6]=(X1=611.0000000,Y1=298.0000000,X2=752.0000000,Y2=325.0000000)
    fbEdit[7]=(X1=372.0000000,Y1=332.0000000,X2=513.0000000,Y2=359.0000000)
    fbEdit[8]=(X1=611.0000000,Y1=332.0000000,X2=752.0000000,Y2=359.0000000)
    fbEdit[9]=(X1=372.0000000,Y1=366.0000000,X2=513.0000000,Y2=393.0000000)
    fbEdit[10]=(X1=611.0000000,Y1=366.0000000,X2=752.0000000,Y2=393.0000000)
    fbEdit[11]=(X1=372.0000000,Y1=400.0000000,X2=513.0000000,Y2=427.0000000)
    fbEdit[12]=(X1=611.0000000,Y1=400.0000000,X2=752.0000000,Y2=427.0000000)
    fbEdit[13]=(X1=372.0000000,Y1=434.0000000,X2=752.0000000,Y2=461.0000000)
    fbEdit[14]=(X1=372.0000000,Y1=468.0000000,X2=752.0000000,Y2=529.0000000)
    fbLabelClanMark=(X1=372.0000000,Y1=193.0000000,X2=404.0000000,Y2=225.0000000)
    fbBackgroundImage=(X1=244.0000000,Y1=140.0000000,X2=788.0000000,Y2=607.0000000)
    fbTopLine=(X1=265.0000000,Y1=161.0000000,X2=767.0000000,Y2=187.0000000)
    fbBottomLine=(X1=265.0000000,Y1=533.0000000,X2=768.0000000,Y2=587.0000000)
    fbButtonOK=(X1=452.0000000,Y1=543.0000000,X2=572.0000000,Y2=572.0000000)
    strTitle="Clan Info"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowClanInfoHK.Internal_OnOpen
}