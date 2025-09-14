class BTSpecialQuest extends BTTabPanelHK
    editinlinenew
    instanced;

var wGameManager GameMgr;
var export editinline BTOwnerDrawImageHK Quest_SpecialThema;
var export editinline BTOwnerDrawImageHK SpecialQuestBG;
var export editinline BTOwnerDrawImageHK Quest_SpecialMiniemblelm;
var export editinline BTOwnerDrawImageHK SpecialQuestWelcom;
var export editinline BTOwnerDrawImageHK SpecialQuestDesc;
var export editinline BTOwnerDrawImageHK SpecialQuestComp;
var export editinline BTOwnerDrawImageHK SpecialQuestMission;
var export editinline BTOwnerDrawCaptionButtonHK ButtonClose;
var localized string strSpecialQuest[5];
var export editinline BTOwnerDrawCaptionButtonHK DummyBtn;
var export editinline BTOwnerDrawCaptionButtonHK BtnReceiveReward;
var export editinline BTOwnerDrawImageScroll RewardItemName;
var export editinline BTOwnerDrawImageHK RewardItemImg;
var export editinline BTOwnerDrawImageScroll RewardItemUserList;
var export editinline BTLabelQuestDescHK LabelQuestDesc;
var BTROExpBarHKCN expbar;
var export editinline BTItemInfoToolTipWindow RewardItemInfoToolTip;
var int nQuestID;
var bool RewardItemNameChange;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;
    local wMatchMaker MM;
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    fb.X1 = 26.0000000;
    fb.Y1 = 50.0000000;
    fb.X2 = 997.0000000;
    fb.Y2 = 759.0000000;
    SpecialQuestBG = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_SpecialBg, 0.2000000);
    fb.X1 = 32.0000000;
    fb.Y1 = 54.0000000;
    fb.X2 = 991.0000000;
    fb.Y2 = 356.0000000;
    Quest_SpecialThema = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_SpecialThema, 0.2000000);
    fb.X1 = 97.0000000;
    fb.Y1 = 365.0000000;
    fb.X2 = 151.0000000;
    fb.Y2 = 407.0000000;
    Quest_SpecialMiniemblelm = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_SpecialMiniemblelm, 0.2000000);
    fb.X1 = 158.0000000;
    fb.Y1 = 376.0000000;
    fb.X2 = 936.0000000;
    fb.Y2 = 395.0000000;
    SpecialQuestMission = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
    SpecialQuestMission.CaptionDrawType = 3;
    SpecialQuestMission.SetFontSizeAll(15);
    SpecialQuestMission.FontColor[0].R = byte(255);
    SpecialQuestMission.FontColor[0].G = byte(255);
    SpecialQuestMission.FontColor[0].B = byte(255);
    SpecialQuestMission.FontColor[0].A = byte(255);
    fb.X1 = 115.0000000;
    fb.Y1 = 65.0000000;
    fb.X2 = 851.0000000;
    fb.Y2 = 78.0000000;
    SpecialQuestWelcom = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
    SpecialQuestWelcom.CaptionDrawType = 0;
    SpecialQuestWelcom.SetFontSizeAll(9);
    SpecialQuestWelcom.FontColor[0].R = byte(255);
    SpecialQuestWelcom.FontColor[0].G = 204;
    SpecialQuestWelcom.FontColor[0].B = 0;
    SpecialQuestWelcom.FontColor[0].A = byte(255);
    SpecialQuestWelcom.Caption = strSpecialQuest[0];
    fb.X1 = 115.0000000;
    fb.Y1 = 81.0000000;
    fb.X2 = 851.0000000;
    fb.Y2 = 94.0000000;
    SpecialQuestDesc = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
    SpecialQuestDesc.CaptionDrawType = 3;
    SpecialQuestDesc.SetFontSizeAll(9);
    SpecialQuestDesc.FontColor[0].R = 204;
    SpecialQuestDesc.FontColor[0].G = 204;
    SpecialQuestDesc.FontColor[0].B = 204;
    SpecialQuestDesc.FontColor[0].A = byte(255);
    SpecialQuestDesc.Caption = strSpecialQuest[1];
    fb.X1 = 68.0000000;
    fb.Y1 = 717.0000000;
    fb.X2 = 825.0000000;
    fb.Y2 = 730.0000000;
    SpecialQuestComp = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
    SpecialQuestComp.CaptionDrawType = 8;
    SpecialQuestComp.SetFontSizeAll(9);
    SpecialQuestComp.FontColor[0].R = 136;
    SpecialQuestComp.FontColor[0].G = 136;
    SpecialQuestComp.FontColor[0].B = 136;
    SpecialQuestComp.FontColor[0].A = byte(255);
    SpecialQuestComp.Caption = strSpecialQuest[2];
    fb.X1 = 836.0000000;
    fb.Y1 = 713.0000000;
    fb.X2 = 960.0000000;
    fb.Y2 = 750.0000000;
    ButtonClose = NewButtonComponent(fb);
    ButtonClose.SetDefaultButtonImage();
    ButtonClose.SetFontSizeAll(11);
    ButtonClose.RenderWeight = 1.0000000;
    fb.X1 = 716.0000000;
    fb.Y1 = 614.0000000;
    fb.X2 = 840.0000000;
    fb.Y2 = 651.0000000;
    BtnReceiveReward = NewButtonComponent(fb);
    BtnReceiveReward.SetQuestReceiveRewardImage();
    BtnReceiveReward.SetFontSizeAll(11);
    BtnReceiveReward.RenderWeight = 1.0000000;
    BtnReceiveReward.Caption = strSpecialQuest[3];
    BtnReceiveReward.__OnClick__Delegate = ReceiveRewardItem;
    fb.X1 = 673.0000000;
    fb.Y1 = 517.0000000;
    fb.X2 = 838.0000000;
    fb.Y2 = 605.0000000;
    DummyBtn = NewButtonComponent(fb, 0.2000000);
    DummyBtn.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemImageOn;
    fb.X1 = 679.0000000;
    fb.Y1 = 538.0000000;
    fb.X2 = 832.0000000;
    fb.Y2 = 602.0000000;
    RewardItemImg = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
    fb.X1 = 678.0000000;
    fb.Y1 = 523.0000000;
    fb.X2 = 833.0000000;
    fb.Y2 = 536.0000000;
    RewardItemName = NewScrollLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
    RewardItemName.CaptionDrawType = 3;
    RewardItemName.SetFontSizeAll(9);
    RewardItemName.FontColor[0].R = 204;
    RewardItemName.FontColor[0].G = 204;
    RewardItemName.FontColor[0].B = 204;
    fb.X1 = 68.0000000;
    fb.Y1 = 681.0000000;
    fb.X2 = 955.0000000;
    fb.Y2 = 697.0000000;
    RewardItemUserList = NewScrollLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
    RewardItemUserList.SetFontSizeAll(10);
    RewardItemUserList.FontColor[0].R = byte(255);
    RewardItemUserList.FontColor[0].G = 204;
    RewardItemUserList.FontColor[0].B = 0;
    RewardItemUserList.Caption = strSpecialQuest[4];
    RewardItemUserList.Left_Hold_Left();
    i = 0;
    J0x94E:

    // End:0x9EA [Loop If]
    if(i < MM.SpecialQuestRankList.Length)
    {
        // End:0x9A8
        if(i == 0)
        {
            RewardItemUserList.Caption = RewardItemUserList.Caption $ MM.SpecialQuestRankList[i];
            // [Explicit Continue]
            goto J0x9E0;
        }
        RewardItemUserList.Caption = (RewardItemUserList.Caption $ ",") $ MM.SpecialQuestRankList[i];
        J0x9E0:

        i++;
        // [Loop Continue]
        goto J0x94E;
    }
    fb.X1 = 148.0000000;
    fb.Y1 = 480.0000000;
    fb.X2 = 643.0000000;
    fb.Y2 = 512.0000000;
    LabelQuestDesc = BTLabelQuestDescHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelQuestDescHK', fb, 0.2000000));
    LabelQuestDesc.SetFontSizeAll(9);
    LabelQuestDesc.CaptionDrawType = 3;
    LabelQuestDesc.FontColor[0].R = byte(255);
    LabelQuestDesc.FontColor[0].G = byte(255);
    LabelQuestDesc.FontColor[0].B = byte(255);
    LabelQuestDesc.FontColor[0].A = byte(255);
    expbar = new Class'GUIWarfareControls_Decompressed.BTROExpBarHKCN';
    expbar.Init();
    expbar.PercText.FontSize = 8;
    fb.X1 = 300.0000000;
    fb.Y1 = 116.0000000;
    fb.X2 = 724.0000000;
    fb.Y2 = 574.0000000;
    RewardItemInfoToolTip = BTItemInfoToolTipWindow(NewComponent(new Class'GUIWarfareControls_Decompressed.BTItemInfoToolTipWindow', fb, 1.0000000));
    i = 0;
    J0xB77:

    // End:0xC31 [Loop If]
    if(i < MM.QuestList.Length)
    {
        // End:0xC27
        if(GameMgr.GetDailyQuestType(MM.QuestList[i].QuestID) == 7)
        {
            // End:0xC17
            if((int(MM.QuestList[i].IsComplete) == 2) || int(MM.QuestList[i].IsComplete) == 0)
            {
                BtnReceiveReward.SetEnabled(false);
                // [Explicit Continue]
                goto J0xC27;
            }
            BtnReceiveReward.SetEnabled(true);
        }
        J0xC27:

        i++;
        // [Loop Continue]
        goto J0xB77;
    }
    //return;    
}

function bool ReceiveRewardItem(GUIComponent Sender)
{
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x58
    if(nQuestID > 0)
    {
        MM.kTcpChannel.sfReqReceiveSpecialReward(nQuestID);
    }
    return true;
    //return;    
}

function SetRewardItemImage(int nItemID)
{
    local wItemBoxHK ItemInfo;
    local Image ItemImage;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ItemImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(153, 64, 1, none);
    ItemInfo = GameMgr.FindUIItem(nItemID);
    ItemImage.Image = ItemInfo.ItemImage;
    RewardItemImg.BackgroundImage = ItemImage;
    RewardItemName.Caption = (ItemInfo.ItemName $ " x") $ string(MM.stDailyRewardItemInfo.ItemCount[21]);
    RewardItemNameChange = true;
    //return;    
}

function bool AddQuestInfo(int QuestID, int currentstatus)
{
    local int i, PrevQuestID, questindex, linkquestindex, linkquestmaxstep;

    local wQuestParam q, linkq, tempq;
    local string Reward;
    local BtrDouble CurrentTime;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    questindex = GameMgr.GetQuestInfoIndex(QuestID);
    // End:0x57
    if(questindex < 0)
    {
        return false;
    }
    q = GameMgr.GetQuestInfoFromIndex(questindex);
    // End:0x88
    if(q.QuestType == 8)
    {
        return true;
    }
    q = GameMgr.GetQuestInfo(QuestID);
    nQuestID = QuestID;
    SpecialQuestMission.Caption = q.QuestMissionDesc;
    SetRewardItemImage(MM.stDailyRewardItemInfo.ItemID[21]);
    RewardItemInfoToolTip.FillCapsuleItemList(MM.stDailyRewardItemInfo.ItemID[21]);
    LabelQuestDesc.SetData("", "", "", "", q.QuestExtDesc, "", "");
    expbar.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(145.0000000, 427.0000000, 299.0000000, 455.0000000);
    expbar.SetData(currentstatus, q.MissionCount, false, true);
    expbar.PercTextPadding[4] = 3.0000000;
    return true;
    //return;    
}

function OnRendered(Canvas C)
{
    RewardItemInfoToolTip.SetVisibleGroup(false);
    // End:0x99
    if(CheckIn(DummyBtn.AWinPos, int(Controller.MouseX), int(Controller.MouseY)))
    {
        RewardItemInfoToolTip.SetVisibleGroup(true);
        RewardItemName.ScrollProcess.bUpdateProcess = true;
        // End:0x96
        if(RewardItemNameChange)
        {
            RewardItemNameChange = false;
            RewardItemName.CaptionLeftRight(C);
        }        
    }
    else
    {
        RewardItemName.ScrollProcess.DoNextAnimation(2);
        RewardItemName.ScrollProcess.InitValue();
        RewardItemName.ScrollProcess.bUpdateProcess = false;
    }
    RewardItemUserList.AWinPos = RewardItemUserList.ScrollProcess.Process(Controller.RenderDelta);
    RewardItemUserList.ApplyAWinPos();
    //return;    
}

defaultproperties
{
    strSpecialQuest[0]="Welcome to the Special Mission. Are you ready?"
    strSpecialQuest[1]="(Special missions reset every day at 00:00)"
    strSpecialQuest[2]="Promote your name throughout the server by completing the Special Missions"
    strSpecialQuest[3]="Receive reward"
    strSpecialQuest[4]="Special Mission Achievers :"
    OnRendered=BTSpecialQuest.OnRendered
}