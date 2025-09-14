class BTWindowQuestInfoHK extends BTWindowHK
    editinlinenew
    instanced;

var export editinline BTACLQuestHK ACLCompleteQuest;
var export editinline BTACLQuestHK ACLNewQuest;
var FloatBox fbLabel[4];
var localized string strLabel[12];
var export editinline BTOwnerDrawImageHK Label[4];
var export editinline BTOwnerDrawImageHK Result_BG;
var FloatBox fbLabelCompletedQuest[5];
var export editinline BTLabelQuestDescHK LabelCompletedQuest[5];
var FloatBox fbLabelNewQuest[5];
var export editinline BTLabelQuestDescHK LabelNewQuest[5];
var export editinline BTOwnerDrawImageHK Title;
var export editinline BTOwnerDrawImageHK CompQuestTitle;
var export editinline BTOwnerDrawImageHK PuzzlePiceTitle;
var export editinline BTOwnerDrawImageHK PuzzlePiceDesc[3];
var export editinline BTOwnerDrawImageHK PuzzlePiceCnt[3];
var export editinline BTOwnerDrawImageHK CompQuestList[4];
var export editinline BTOwnerDrawImageHK CompQuestRewardList1[4];
var export editinline BTOwnerDrawImageHK CompQuestRewardList2[4];
var export editinline BTOwnerDrawImageHK RewardPuzzlePiceItem[3];
var Image RewardPuzzlePice[8];
var FloatBox fbPuzzelPice[8];
var array<int> ReceivePuzzlePice;
var export editinline BTOwnerDrawCaptionButtonHK ButtonClose;
var wGameManager GameMgr;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i, nDailyQuestType;
    local wMatchMaker MM;
    local FloatBox fb;
    local Color Col;

    super.InitComponent(MyController, myOwner);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    fb.X1 = 12.0000000;
    fb.Y1 = 60.0000000;
    fb.X2 = 1012.0000000;
    fb.Y2 = 681.0000000;
    Result_BG = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Queest_Result_BG, 0.2000000);
    fb.X1 = 265.0000000;
    fb.Y1 = 104.0000000;
    fb.X2 = 759.0000000;
    fb.Y2 = 120.0000000;
    Title = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
    Col.R = byte(255);
    Col.G = 204;
    Col.B = 0;
    Col.A = byte(255);
    Title.SetFontColorAll(Col);
    Title.SetFontSizeAll(11);
    Title.CaptionDrawType = 4;
    Title.Caption = strLabel[0];
    fb.X1 = 22.0000000;
    fb.Y1 = 151.0000000;
    fb.X2 = 178.0000000;
    fb.Y2 = 167.0000000;
    CompQuestTitle = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
    CompQuestTitle.CaptionDrawType = 5;
    Col.R = 204;
    Col.G = 204;
    Col.B = 204;
    Col.A = byte(255);
    CompQuestTitle.SetFontColorAll(Col);
    CompQuestTitle.SetFontSizeAll(11);
    CompQuestTitle.Caption = strLabel[1];
    fb.X1 = 62.0000000;
    fb.Y1 = 389.0000000;
    fb.X2 = 180.0000000;
    fb.Y2 = 405.0000000;
    PuzzlePiceTitle = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
    PuzzlePiceTitle.CaptionDrawType = 5;
    Col.R = byte(255);
    Col.G = byte(255);
    Col.B = byte(255);
    Col.A = byte(255);
    PuzzlePiceTitle.SetFontColorAll(Col);
    PuzzlePiceTitle.SetFontSizeAll(11);
    PuzzlePiceTitle.Caption = strLabel[2];
    i = 0;
    J0x395:

    // End:0x4D7 [Loop If]
    if(i < 3)
    {
        fb.X1 = 62.0000000;
        fb.Y1 = 525.0000000 + float(i * 15);
        fb.X2 = 180.0000000;
        fb.Y2 = 538.0000000 + float(i * 15);
        PuzzlePiceDesc[i] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
        PuzzlePiceDesc[i].CaptionDrawType = 5;
        Col.R = byte(255);
        Col.G = byte(255);
        Col.B = byte(255);
        Col.A = byte(255);
        PuzzlePiceDesc[i].SetFontColorAll(Col);
        PuzzlePiceDesc[i].SetFontSizeAll(8);
        PuzzlePiceDesc[i].Caption = strLabel[3 + i];
        i++;
        // [Loop Continue]
        goto J0x395;
    }
    i = 0;
    J0x4DE:

    // End:0x620 [Loop If]
    if(i < 3)
    {
        fb.X1 = 279.0000000 + float(i * 261);
        fb.Y1 = 559.0000000;
        fb.X2 = 433.0000000 + float(i * 261);
        fb.Y2 = 572.0000000;
        PuzzlePiceCnt[i] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
        PuzzlePiceCnt[i].CaptionDrawType = 5;
        Col.R = 204;
        Col.G = 204;
        Col.B = 204;
        Col.A = byte(255);
        PuzzlePiceCnt[i].SetFontColorAll(Col);
        PuzzlePiceCnt[i].SetFontSizeAll(8);
        PuzzlePiceCnt[i].Caption = strLabel[6 + i];
        i++;
        // [Loop Continue]
        goto J0x4DE;
    }
    i = 0;
    J0x627:

    // End:0x949 [Loop If]
    if(i < 4)
    {
        fb.X1 = 208.0000000;
        fb.Y1 = 155.0000000 + float(i * 53);
        fb.X2 = 683.0000000;
        fb.Y2 = 171.0000000 + float(i * 53);
        CompQuestList[i] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
        CompQuestList[i].CaptionDrawType = 3;
        Col.R = 198;
        Col.G = byte(255);
        Col.B = 0;
        Col.A = byte(255);
        CompQuestList[i].SetFontColorAll(Col);
        CompQuestList[i].SetFontSizeAll(11);
        fb.X1 = 688.0000000;
        fb.Y1 = 154.0000000 + float(i * 53);
        fb.X2 = 983.0000000;
        fb.Y2 = 167.0000000 + float(i * 53);
        CompQuestRewardList1[i] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
        CompQuestRewardList1[i].CaptionDrawType = 3;
        Col.R = byte(255);
        Col.G = 192;
        Col.B = 0;
        Col.A = byte(255);
        CompQuestRewardList1[i].SetFontColorAll(Col);
        CompQuestRewardList1[i].SetFontSizeAll(9);
        fb.X1 = 688.0000000;
        fb.Y1 = 171.0000000 + float(i * 53);
        fb.X2 = 983.0000000;
        fb.Y2 = 184.0000000 + float(i * 53);
        CompQuestRewardList2[i] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
        CompQuestRewardList2[i].CaptionDrawType = 3;
        Col.R = byte(255);
        Col.G = 192;
        Col.B = 0;
        Col.A = byte(255);
        CompQuestRewardList2[i].SetFontColorAll(Col);
        CompQuestRewardList2[i].SetFontSizeAll(9);
        i++;
        // [Loop Continue]
        goto J0x627;
    }
    fb.X1 = 450.0000000;
    fb.Y1 = 634.0000000;
    fb.X2 = 574.0000000;
    fb.Y2 = 671.0000000;
    ButtonClose = NewButtonComponent(fb);
    ButtonClose.SetDefaultButtonImage();
    ButtonClose.SetFontSizeAll(11);
    ButtonClose.RenderWeight = 1.0000000;
    ButtonClose.__OnClick__Delegate = ButtonOK_OnClick;
    ButtonClose.Caption = strOK;
    ButtonCancel.bAcceptsInput = false;
    ButtonCancel.SetVisibility(false);
    ButtonOK.bAcceptsInput = false;
    ButtonOK.SetVisibility(false);
    ACLCompleteQuest = BTACLQuestHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTACLQuestHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    i = 0;
    J0xA68:

    // End:0xB53 [Loop If]
    if(i < MM.CompletedQuestList.Length)
    {
        ACLCompleteQuest.AddQuestInfo(MM.CompletedQuestList[i], 0);
        nDailyQuestType = GameMgr.GetDailyQuestType(ACLCompleteQuest.GetQuestId(i));
        CompQuestList[i].Caption = ACLCompleteQuest.GetQuestDesc(i);
        CompQuestRewardList1[i].Caption = ACLCompleteQuest.GetReward(i);
        CompQuestRewardList2[i].Caption = ACLCompleteQuest.GetDailyReward(i);
        i++;
        // [Loop Continue]
        goto J0xA68;
    }
    RewardPuzzlePice[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Reward_PuzzlePiece_1;
    RewardPuzzlePice[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Reward_PuzzlePiece_2;
    RewardPuzzlePice[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Reward_PuzzlePiece_3;
    RewardPuzzlePice[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Reward_PuzzlePiece_4;
    RewardPuzzlePice[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Reward_PuzzlePiece_5;
    RewardPuzzlePice[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Reward_PuzzlePiece_6;
    RewardPuzzlePice[6] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Reward_PuzzlePiece_7;
    RewardPuzzlePice[7] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Reward_PuzzlePiece_8;
    i = 0;
    J0xC10:

    // End:0xD68 [Loop If]
    if(i < MM.stPuzzleInfo.UpdatedNum.Length)
    {
        fb.X1 = fbPuzzelPice[int(MM.stPuzzleInfo.UpdatedNum[i]) - 1].X1 + float(i * 261);
        fb.Y1 = fbPuzzelPice[int(MM.stPuzzleInfo.UpdatedNum[i]) - 1].Y1;
        fb.X2 = fbPuzzelPice[int(MM.stPuzzleInfo.UpdatedNum[i]) - 1].X2 + float(i * 261);
        fb.Y2 = fbPuzzelPice[int(MM.stPuzzleInfo.UpdatedNum[i]) - 1].Y2;
        RewardPuzzlePiceItem[i] = NewLabelComponent(fb, RewardPuzzlePice[int(MM.stPuzzleInfo.UpdatedNum[i]) - 1], 0.2000000);
        i++;
        // [Loop Continue]
        goto J0xC10;
    }
    MM.stPuzzleInfo.UpdatedNum.Length = 0;
    //return;    
}

function SetRewardPuzzlePice(int nIdx)
{
    ReceivePuzzlePice[ReceivePuzzlePice.Length] = nIdx;
    //return;    
}

function Internal_OnOpen()
{
    PlayerOwner().FmodClientPlaySound("Warfare_Sound_UI/Quest/complete",,, 6);
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
    strLabel[0]="Mission Complete"
    strLabel[1]="Mission Complete"
    strLabel[2]="Puzzle Piece"
    strLabel[3]="The max number of "
    strLabel[4]="puzzle pieces received"
    strLabel[5]="at a time are 3 pieces."
    strLabel[6]="1st piece"
    strLabel[7]="2nd piece"
    strLabel[8]="3rd piece"
    strLabel[9]="One puzzle piece"
    strLabel[10]="Roll Call one-time ticket"
    strLabel[11]=" - Reward "
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
    fbPuzzelPice[0]=(X1=232.0000000,Y1=424.0000000,X2=405.0000000,Y2=545.0000000)
    fbPuzzelPice[1]=(X1=245.0000000,Y1=406.0000000,X2=386.0000000,Y2=564.0000000)
    fbPuzzelPice[2]=(X1=204.0000000,Y1=424.0000000,X2=427.0000000,Y2=545.0000000)
    fbPuzzelPice[3]=(X1=248.0000000,Y1=406.0000000,X2=383.0000000,Y2=564.0000000)
    fbPuzzelPice[4]=(X1=250.0000000,Y1=404.0000000,X2=381.0000000,Y2=555.0000000)
    fbPuzzelPice[5]=(X1=204.0000000,Y1=426.0000000,X2=427.0000000,Y2=540.0000000)
    fbPuzzelPice[6]=(X1=245.0000000,Y1=402.0000000,X2=385.0000000,Y2=553.0000000)
    fbPuzzelPice[7]=(X1=222.0000000,Y1=424.0000000,X2=398.0000000,Y2=538.0000000)
    fbBackgroundImage=(X1=-20.0000000,Y1=157.0000000,X2=1044.0000000,Y2=610.0000000)
    fbTopLine=(X1=0.0000000,Y1=176.0000000,X2=1024.0000000,Y2=202.0000000)
    fbBottomLine=(X1=0.0000000,Y1=550.0000000,X2=1024.0000000,Y2=592.0000000)
    fbButtonOK=(X1=450.0000000,Y1=634.0000000,X2=574.0000000,Y2=671.0000000)
    strTitle="Quest"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowQuestInfoHK.Internal_OnOpen
}