/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowQuestInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:4
 *
 *******************************************************************************/
class BTWindowQuestInfoHK extends BTWindowHK
    editinlinenew
    instanced;

var export editinline BTACLQuestHK ACLCompleteQuest;
var export editinline BTACLQuestHK ACLNewQuest;
var FloatBox fbLabel[4];
var localized string strLabel[2];
var export editinline BTOwnerDrawImageHK Label[4];
var FloatBox fbLabelCompletedQuest[5];
var export editinline BTLabelQuestDescHK LabelCompletedQuest[5];
var FloatBox fbLabelNewQuest[5];
var export editinline BTLabelQuestDescHK LabelNewQuest[5];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local wMatchMaker MM;

    super.InitComponent(MyController, myOwner);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ACLCompleteQuest = BTACLQuestHK(NewComponent(new class'BTACLQuestHK', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    i = 0;
    J0x70:
    // End:0xb7 [While If]
    if(i < MM.CompletedQuestList.Length)
    {
        ACLCompleteQuest.AddQuestInfo(MM.CompletedQuestList[i], 0);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x70;
    }
    ACLCompleteQuest.SetVisibility(false);
    ACLNewQuest = BTACLQuestHK(NewComponent(new class'BTACLQuestHK', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    i = 0;
    J0xf7:
    // End:0x13e [While If]
    if(i < MM.NewQuestList.Length)
    {
        ACLNewQuest.AddQuestInfo(MM.NewQuestList[i], 0);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf7;
    }
    ACLNewQuest.SetVisibility(false);
    ButtonCancel.bAcceptsInput = false;
    ButtonCancel.SetVisibility(false);
    TopLine.SetFontDrawType(4);
    TopLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_HUD_back_3;
    BottomLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_HUD_back_3;
    i = 0;
    J0x1c1:
    // End:0x26d [While If]
    if(i < 4)
    {
        Label[i] = NewLabelComponent(fbLabel[i], class'BTUIResourcePoolHK'.default.empty);
        Label[i].SetFontDrawType(3);
        Label[i].CaptionPadding[0] = 5;
        Label[i].SetFontSizeAll(11);
        Label[i].SetFontColorAll(class'BTUIColorPoolHK'.static.DefaultWhite());
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1c1;
    }
    Label[0].Caption = strLabel[0];
    Label[1].Caption = strLabel[1];
    Label[0].BackgroundImage = class'BTUIResourcePoolHK'.default.img_ptitl_back;
    Label[1].BackgroundImage = class'BTUIResourcePoolHK'.default.img_ptitl_back;
    Label[0].SetFontColorAll(class'BTUIColorPoolHK'.static.CompletedQuest_Title());
    Label[1].SetFontColorAll(class'BTUIColorPoolHK'.static.NewQuest_Title());
    Label[2].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
    Label[3].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
    i = 0;
    J0x362:
    // End:0x4fa [While If]
    if(i < 5)
    {
        LabelCompletedQuest[i] = BTLabelQuestDescHK(NewComponent(new class'BTLabelQuestDescHK', fbLabelCompletedQuest[i]));
        LabelCompletedQuest[i].bSummaryMode = true;
        LabelCompletedQuest[i].arrCurQuest[0].DrawColor = class'BTUIColorPoolHK'.static.CompletedQuest_Content();
        LabelCompletedQuest[i].arrCurQuest[1].DrawColor = class'BTUIColorPoolHK'.static.CompletedQuest_Content();
        LabelCompletedQuest[i].txtReward.DrawColor = class'BTUIColorPoolHK'.static.CompletedQuest_Reward();
        LabelNewQuest[i] = BTLabelQuestDescHK(NewComponent(new class'BTLabelQuestDescHK', fbLabelNewQuest[i]));
        LabelNewQuest[i].bSummaryMode = true;
        LabelNewQuest[i].arrCurQuest[0].DrawColor = class'BTUIColorPoolHK'.static.NewQuest_Content();
        LabelNewQuest[i].arrCurQuest[1].DrawColor = class'BTUIColorPoolHK'.static.NewQuest_Content();
        LabelNewQuest[i].txtReward.DrawColor = class'BTUIColorPoolHK'.static.NewQuest_Reward();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x362;
    }
    i = 0;
    J0x501:
    // End:0x5d2 [While If]
    if(i < 5)
    {
        // End:0x582
        if(i < ACLCompleteQuest.ACLRowListPool.Length)
        {
            LabelCompletedQuest[i].SetData("", "", ACLCompleteQuest.GetQuestName(i), ACLCompleteQuest.GetQuestDesc(i), "", ACLCompleteQuest.GetReward(i), "");
        }
        // End:0x5c8
        else
        {
            LabelCompletedQuest[i].SetData("", "", "", "", "", "", "");
            LabelCompletedQuest[i].SetVisibility(false);
            ResizeLabelCompletedQuest(i, 26);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x501;
    }
    // End:0x615
    if(ACLCompleteQuest.ACLRowListPool.Length == 0)
    {
        Label[0].SetVisibility(false);
        Label[2].SetVisibility(false);
        ResizeLabelCompletedQuest(0, 26);
    }
    i = 0;
    J0x61c:
    // End:0x6ed [While If]
    if(i < 5)
    {
        // End:0x69d
        if(i < ACLNewQuest.ACLRowListPool.Length)
        {
            LabelNewQuest[i].SetData("", "", ACLNewQuest.GetQuestName(i), ACLNewQuest.GetQuestDesc(i), "", ACLNewQuest.GetReward(i), "");
        }
        // End:0x6e3
        else
        {
            LabelNewQuest[i].SetData("", "", "", "", "", "", "");
            LabelNewQuest[i].SetVisibility(false);
            ResizeLabelNewQuest(i, 26);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x61c;
    }
    // End:0x730
    if(ACLNewQuest.ACLRowListPool.Length == 0)
    {
        Label[1].SetVisibility(false);
        Label[3].SetVisibility(false);
        ResizeLabelNewQuest(0, 26);
    }
    TopLine.Caption = "";
    TopLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_quest_top;
    BottomLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_quest_bottom;
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.img_quest_back;
}

function Internal_OnOpen()
{
    PlayerOwner().PlaySound(sound'ui_result_prize_giving', 6, 1.0);
}

function ResizeLabelCompletedQuest(int pos, int Size)
{
    local int i, halfsize;

    halfsize = Size / 2;
    BackgroundImage.AWinPos.Y1 += float(halfsize);
    BackgroundImage.AWinPos.Y2 -= float(halfsize);
    BackgroundImage.ApplyAWinPos();
    TopLine.AWinPos.Y1 += float(halfsize);
    TopLine.AWinPos.Y2 += float(halfsize);
    TopLine.ApplyAWinPos();
    Label[0].AWinPos.Y1 += float(halfsize);
    Label[0].AWinPos.Y2 += float(halfsize);
    Label[0].ApplyAWinPos();
    Label[2].AWinPos.Y1 += float(halfsize);
    Label[2].AWinPos.Y2 -= float(halfsize);
    Label[2].ApplyAWinPos();
    i = 0;
    J0x141:
    // End:0x1b3 [While If]
    if(i < pos)
    {
        LabelCompletedQuest[i].AWinPos.Y1 += float(halfsize);
        LabelCompletedQuest[i].AWinPos.Y2 += float(halfsize);
        LabelCompletedQuest[i].ApplyAWinPos();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x141;
    }
    Label[1].AWinPos.Y1 -= float(halfsize);
    Label[1].AWinPos.Y2 -= float(halfsize);
    Label[1].ApplyAWinPos();
    Label[3].AWinPos.Y1 -= float(halfsize);
    Label[3].AWinPos.Y2 -= float(halfsize);
    Label[3].ApplyAWinPos();
    i = 0;
    J0x257:
    // End:0x2c6 [While If]
    if(i < 5)
    {
        LabelNewQuest[i].AWinPos.Y1 -= float(halfsize);
        LabelNewQuest[i].AWinPos.Y2 -= float(halfsize);
        LabelNewQuest[i].ApplyAWinPos();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x257;
    }
    ButtonOK.AWinPos.Y1 -= float(halfsize);
    ButtonOK.AWinPos.Y2 -= float(halfsize);
    ButtonOK.ApplyAWinPos();
    BottomLine.AWinPos.Y1 -= float(halfsize);
    BottomLine.AWinPos.Y2 -= float(halfsize);
    BottomLine.ApplyAWinPos();
}

function ResizeLabelNewQuest(int pos, int Size)
{
    local int i, halfsize;

    halfsize = Size / 2;
    BackgroundImage.AWinPos.Y1 += float(halfsize);
    BackgroundImage.AWinPos.Y2 -= float(halfsize);
    BackgroundImage.ApplyAWinPos();
    TopLine.AWinPos.Y1 += float(halfsize);
    TopLine.AWinPos.Y2 += float(halfsize);
    TopLine.ApplyAWinPos();
    Label[0].AWinPos.Y1 += float(halfsize);
    Label[0].AWinPos.Y2 += float(halfsize);
    Label[0].ApplyAWinPos();
    Label[2].AWinPos.Y1 += float(halfsize);
    Label[2].AWinPos.Y2 += float(halfsize);
    Label[2].ApplyAWinPos();
    i = 0;
    J0x141:
    // End:0x1b0 [While If]
    if(i < 5)
    {
        LabelCompletedQuest[i].AWinPos.Y1 += float(halfsize);
        LabelCompletedQuest[i].AWinPos.Y2 += float(halfsize);
        LabelCompletedQuest[i].ApplyAWinPos();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x141;
    }
    Label[1].AWinPos.Y1 += float(halfsize);
    Label[1].AWinPos.Y2 += float(halfsize);
    Label[1].ApplyAWinPos();
    Label[3].AWinPos.Y1 += float(halfsize);
    Label[3].AWinPos.Y2 -= float(halfsize);
    Label[3].ApplyAWinPos();
    i = 0;
    J0x254:
    // End:0x2c6 [While If]
    if(i < pos)
    {
        LabelNewQuest[i].AWinPos.Y1 += float(halfsize);
        LabelNewQuest[i].AWinPos.Y2 += float(halfsize);
        LabelNewQuest[i].ApplyAWinPos();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x254;
    }
    ButtonOK.AWinPos.Y1 -= float(halfsize);
    ButtonOK.AWinPos.Y2 -= float(halfsize);
    ButtonOK.ApplyAWinPos();
    BottomLine.AWinPos.Y1 -= float(halfsize);
    BottomLine.AWinPos.Y2 -= float(halfsize);
    BottomLine.ApplyAWinPos();
}

defaultproperties
{
    fbLabel[0]=(X1=156.0,Y1=214.0,X2=868.0,Y2=239.0)
    fbLabel[1]=(X1=156.0,Y1=382.0,X2=868.0,Y2=407.0)
    fbLabel[2]=(X1=156.0,Y1=212.0,X2=869.0,Y2=370.0)
    fbLabel[3]=(X1=156.0,Y1=382.0,X2=869.0,Y2=538.0)
    strLabel[0]="Quest Complete"
    strLabel[1]="New Quest"
    fbLabelCompletedQuest[0]=(X1=158.0,Y1=239.0,X2=867.0,Y2=265.0)
    fbLabelCompletedQuest[1]=(X1=158.0,Y1=265.0,X2=867.0,Y2=291.0)
    fbLabelCompletedQuest[2]=(X1=158.0,Y1=291.0,X2=867.0,Y2=317.0)
    fbLabelCompletedQuest[3]=(X1=158.0,Y1=317.0,X2=867.0,Y2=343.0)
    fbLabelCompletedQuest[4]=(X1=158.0,Y1=343.0,X2=867.0,Y2=370.0)
    fbLabelNewQuest[0]=(X1=158.0,Y1=407.0,X2=867.0,Y2=433.0)
    fbLabelNewQuest[1]=(X1=158.0,Y1=433.0,X2=867.0,Y2=459.0)
    fbLabelNewQuest[2]=(X1=158.0,Y1=459.0,X2=867.0,Y2=485.0)
    fbLabelNewQuest[3]=(X1=158.0,Y1=485.0,X2=867.0,Y2=511.0)
    fbLabelNewQuest[4]=(X1=158.0,Y1=511.0,X2=867.0,Y2=538.0)
    fbBackgroundImage=(X1=-20.0,Y1=157.0,X2=1044.0,Y2=610.0)
    fbTopLine=(X1=0.0,Y1=176.0,X2=1024.0,Y2=202.0)
    fbBottomLine=(X1=0.0,Y1=550.0,X2=1024.0,Y2=592.0)
    fbButtonOK=(X1=453.0,Y1=554.0,X2=573.0,Y2=586.0)
    strTitle="Quest"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    OnOpen=Internal_OnOpen
}