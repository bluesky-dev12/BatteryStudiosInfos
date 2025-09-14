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
    ACLCompleteQuest = BTACLQuestHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTACLQuestHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    i = 0;
    J0x70:

    // End:0xB7 [Loop If]
    if(i < MM.CompletedQuestList.Length)
    {
        ACLCompleteQuest.AddQuestInfo(MM.CompletedQuestList[i], 0);
        i++;
        // [Loop Continue]
        goto J0x70;
    }
    ACLCompleteQuest.SetVisibility(false);
    ACLNewQuest = BTACLQuestHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTACLQuestHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    i = 0;
    J0xF7:

    // End:0x13E [Loop If]
    if(i < MM.NewQuestList.Length)
    {
        ACLNewQuest.AddQuestInfo(MM.NewQuestList[i], 0);
        i++;
        // [Loop Continue]
        goto J0xF7;
    }
    ACLNewQuest.SetVisibility(false);
    ButtonCancel.bAcceptsInput = false;
    ButtonCancel.SetVisibility(false);
    TopLine.SetFontDrawType(4);
    TopLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_HUD_back_3;
    BottomLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_HUD_back_3;
    i = 0;
    J0x1C1:

    // End:0x26D [Loop If]
    if(i < 4)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].SetFontDrawType(3);
        Label[i].CaptionPadding[0] = 5;
        Label[i].SetFontSizeAll(11);
        Label[i].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite());
        i++;
        // [Loop Continue]
        goto J0x1C1;
    }
    Label[0].Caption = strLabel[0];
    Label[1].Caption = strLabel[1];
    Label[0].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_ptitl_back;
    Label[1].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_ptitl_back;
    Label[0].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.CompletedQuest_Title());
    Label[1].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.NewQuest_Title());
    Label[2].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
    Label[3].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
    i = 0;
    J0x362:

    // End:0x4FA [Loop If]
    if(i < 5)
    {
        LabelCompletedQuest[i] = BTLabelQuestDescHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelQuestDescHK', fbLabelCompletedQuest[i]));
        LabelCompletedQuest[i].bSummaryMode = true;
        LabelCompletedQuest[i].arrCurQuest[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.CompletedQuest_Content();
        LabelCompletedQuest[i].arrCurQuest[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.CompletedQuest_Content();
        LabelCompletedQuest[i].txtReward.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.CompletedQuest_Reward();
        LabelNewQuest[i] = BTLabelQuestDescHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelQuestDescHK', fbLabelNewQuest[i]));
        LabelNewQuest[i].bSummaryMode = true;
        LabelNewQuest[i].arrCurQuest[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.NewQuest_Content();
        LabelNewQuest[i].arrCurQuest[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.NewQuest_Content();
        LabelNewQuest[i].txtReward.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.NewQuest_Reward();
        i++;
        // [Loop Continue]
        goto J0x362;
    }
    i = 0;
    J0x501:

    // End:0x5D2 [Loop If]
    if(i < 5)
    {
        // End:0x582
        if(i < ACLCompleteQuest.ACLRowListPool.Length)
        {
            LabelCompletedQuest[i].SetData("", "", ACLCompleteQuest.GetQuestName(i), ACLCompleteQuest.GetQuestDesc(i), "", ACLCompleteQuest.GetReward(i), "");
            // [Explicit Continue]
            goto J0x5C8;
        }
        LabelCompletedQuest[i].SetData("", "", "", "", "", "", "");
        LabelCompletedQuest[i].SetVisibility(false);
        ResizeLabelCompletedQuest(i, 26);
        J0x5C8:

        i++;
        // [Loop Continue]
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
    J0x61C:

    // End:0x6ED [Loop If]
    if(i < 5)
    {
        // End:0x69D
        if(i < ACLNewQuest.ACLRowListPool.Length)
        {
            LabelNewQuest[i].SetData("", "", ACLNewQuest.GetQuestName(i), ACLNewQuest.GetQuestDesc(i), "", ACLNewQuest.GetReward(i), "");
            // [Explicit Continue]
            goto J0x6E3;
        }
        LabelNewQuest[i].SetData("", "", "", "", "", "", "");
        LabelNewQuest[i].SetVisibility(false);
        ResizeLabelNewQuest(i, 26);
        J0x6E3:

        i++;
        // [Loop Continue]
        goto J0x61C;
    }
    // End:0x730
    if(ACLNewQuest.ACLRowListPool.Length == 0)
    {
        Label[1].SetVisibility(false);
        Label[3].SetVisibility(false);
        ResizeLabelNewQuest(0, 26);
    }
    TopLine.Caption = "";
    TopLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_quest_top;
    BottomLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_quest_bottom;
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_quest_back;
    //return;    
}

function Internal_OnOpen()
{
    PlayerOwner().PlaySound(Sound'Warfare_Sound_UI.Result.ui_result_prize_giving', 6, 1.0000000);
    //return;    
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

    // End:0x1B3 [Loop If]
    if(i < pos)
    {
        LabelCompletedQuest[i].AWinPos.Y1 += float(halfsize);
        LabelCompletedQuest[i].AWinPos.Y2 += float(halfsize);
        LabelCompletedQuest[i].ApplyAWinPos();
        i++;
        // [Loop Continue]
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

    // End:0x2C6 [Loop If]
    if(i < 5)
    {
        LabelNewQuest[i].AWinPos.Y1 -= float(halfsize);
        LabelNewQuest[i].AWinPos.Y2 -= float(halfsize);
        LabelNewQuest[i].ApplyAWinPos();
        i++;
        // [Loop Continue]
        goto J0x257;
    }
    ButtonOK.AWinPos.Y1 -= float(halfsize);
    ButtonOK.AWinPos.Y2 -= float(halfsize);
    ButtonOK.ApplyAWinPos();
    BottomLine.AWinPos.Y1 -= float(halfsize);
    BottomLine.AWinPos.Y2 -= float(halfsize);
    BottomLine.ApplyAWinPos();
    //return;    
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

    // End:0x1B0 [Loop If]
    if(i < 5)
    {
        LabelCompletedQuest[i].AWinPos.Y1 += float(halfsize);
        LabelCompletedQuest[i].AWinPos.Y2 += float(halfsize);
        LabelCompletedQuest[i].ApplyAWinPos();
        i++;
        // [Loop Continue]
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

    // End:0x2C6 [Loop If]
    if(i < pos)
    {
        LabelNewQuest[i].AWinPos.Y1 += float(halfsize);
        LabelNewQuest[i].AWinPos.Y2 += float(halfsize);
        LabelNewQuest[i].ApplyAWinPos();
        i++;
        // [Loop Continue]
        goto J0x254;
    }
    ButtonOK.AWinPos.Y1 -= float(halfsize);
    ButtonOK.AWinPos.Y2 -= float(halfsize);
    ButtonOK.ApplyAWinPos();
    BottomLine.AWinPos.Y1 -= float(halfsize);
    BottomLine.AWinPos.Y2 -= float(halfsize);
    BottomLine.ApplyAWinPos();
    //return;    
}

defaultproperties
{
    fbLabel[0]=(X1=156.0000000,Y1=214.0000000,X2=868.0000000,Y2=239.0000000)
    fbLabel[1]=(X1=156.0000000,Y1=382.0000000,X2=868.0000000,Y2=407.0000000)
    fbLabel[2]=(X1=156.0000000,Y1=212.0000000,X2=869.0000000,Y2=370.0000000)
    fbLabel[3]=(X1=156.0000000,Y1=382.0000000,X2=869.0000000,Y2=538.0000000)
    strLabel[0]="??? ??"
    strLabel[1]="?? ???"
    fbLabelCompletedQuest[0]=(X1=158.0000000,Y1=239.0000000,X2=867.0000000,Y2=265.0000000)
    fbLabelCompletedQuest[1]=(X1=158.0000000,Y1=265.0000000,X2=867.0000000,Y2=291.0000000)
    fbLabelCompletedQuest[2]=(X1=158.0000000,Y1=291.0000000,X2=867.0000000,Y2=317.0000000)
    fbLabelCompletedQuest[3]=(X1=158.0000000,Y1=317.0000000,X2=867.0000000,Y2=343.0000000)
    fbLabelCompletedQuest[4]=(X1=158.0000000,Y1=343.0000000,X2=867.0000000,Y2=370.0000000)
    fbLabelNewQuest[0]=(X1=158.0000000,Y1=407.0000000,X2=867.0000000,Y2=433.0000000)
    fbLabelNewQuest[1]=(X1=158.0000000,Y1=433.0000000,X2=867.0000000,Y2=459.0000000)
    fbLabelNewQuest[2]=(X1=158.0000000,Y1=459.0000000,X2=867.0000000,Y2=485.0000000)
    fbLabelNewQuest[3]=(X1=158.0000000,Y1=485.0000000,X2=867.0000000,Y2=511.0000000)
    fbLabelNewQuest[4]=(X1=158.0000000,Y1=511.0000000,X2=867.0000000,Y2=538.0000000)
    fbBackgroundImage=(X1=-20.0000000,Y1=157.0000000,X2=1044.0000000,Y2=610.0000000)
    fbTopLine=(X1=0.0000000,Y1=176.0000000,X2=1024.0000000,Y2=202.0000000)
    fbBottomLine=(X1=0.0000000,Y1=550.0000000,X2=1024.0000000,Y2=592.0000000)
    fbButtonOK=(X1=453.0000000,Y1=554.0000000,X2=573.0000000,Y2=586.0000000)
    strTitle="???"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowQuestInfoHK.Internal_OnOpen
}