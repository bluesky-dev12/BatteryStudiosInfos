class BTDailyQuest extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline BTACLQuestHK ACLQuest;
var export editinline BTLabelQuestDescHK LabelQuestDesc;
var export editinline BTOwnerDrawImageHK puzzelBg;
var export editinline BTOwnerDrawImageHK puzzelPice[8];
var export editinline BTOwnerDrawCaptionButtonHK ButtonClose;
var export editinline BTOwnerDrawImageHK LabelDailyDesc;
var localized string strDaily[5];
var export editinline BTOwnerDrawCaptionButtonHK BtnReceiveReward;
var export editinline BTOwnerDrawImageHK LabelReward;
var export editinline BTOwnerDrawImageHK PuzzleItemImg;
var wGameManager GameMgr;
var export editinline BTOwnerDrawImageScroll RewardItemName;
var export editinline BTOwnerDrawImageHK RewardItemCnt;
var export editinline BTOwnerDrawImageHK PopUpBg;
var export editinline BTItemInfoToolTipWindow RewardItemInfoToolTip;
var export editinline BTOwnerDrawCaptionButtonHK DummyBtn;
var bool RewardItemNameChange;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    fb.X1 = 149.0000000;
    fb.Y1 = 52.0000000;
    fb.X2 = 863.0000000;
    fb.Y2 = 190.0000000;
    ACLQuest = BTACLQuestHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTACLQuestHK', fb, 0.2000000));
    fb.X1 = 165.0000000;
    fb.Y1 = 203.0000000;
    fb.X2 = 850.0000000;
    fb.Y2 = 306.0000000;
    LabelQuestDesc = BTLabelQuestDescHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelQuestDescHK', fb));
    ACLQuest.MultiColumnList.__OnClick__Delegate = ACLQuest_OnClick;
    fb.X1 = 26.0000000;
    fb.Y1 = 50.0000000;
    fb.X2 = 997.0000000;
    fb.Y2 = 759.0000000;
    puzzelBg = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_Info_Puzzle, 0.2000000);
    fb.X1 = 836.0000000;
    fb.Y1 = 713.0000000;
    fb.X2 = 960.0000000;
    fb.Y2 = 750.0000000;
    ButtonClose = NewButtonComponent(fb);
    ButtonClose.SetDefaultButtonImage();
    ButtonClose.SetFontSizeAll(11);
    ButtonClose.RenderWeight = 1.0000000;
    fb.X1 = 165.0000000;
    fb.Y1 = 360.0000000;
    fb.X2 = 850.0000000;
    fb.Y2 = 376.0000000;
    LabelDailyDesc = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
    LabelDailyDesc.CaptionDrawType = 0;
    LabelDailyDesc.SetFontSizeAll(11);
    LabelDailyDesc.FontColor[0].R = byte(255);
    LabelDailyDesc.FontColor[0].G = 204;
    LabelDailyDesc.FontColor[0].B = 0;
    LabelDailyDesc.Caption = strDaily[0];
    fb.X1 = 714.0000000;
    fb.Y1 = 470.0000000;
    fb.X2 = 883.0000000;
    fb.Y2 = 486.0000000;
    LabelReward = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
    LabelReward.CaptionDrawType = 0;
    LabelReward.SetFontSizeAll(11);
    LabelReward.FontColor[0].R = byte(255);
    LabelReward.FontColor[0].G = 204;
    LabelReward.FontColor[0].B = 0;
    LabelReward.Caption = strDaily[1];
    fb.X1 = 734.0000000;
    fb.Y1 = 613.0000000;
    fb.X2 = 858.0000000;
    fb.Y2 = 650.0000000;
    BtnReceiveReward = NewButtonComponent(fb);
    BtnReceiveReward.SetQuestReceiveRewardImage();
    BtnReceiveReward.SetFontSizeAll(11);
    BtnReceiveReward.RenderWeight = 1.0000000;
    BtnReceiveReward.Caption = strDaily[2];
    BtnReceiveReward.__OnClick__Delegate = ReceiveRewardItem;
    fb.X1 = 697.0000000;
    fb.Y1 = 534.0000000;
    fb.X2 = 850.0000000;
    fb.Y2 = 598.0000000;
    PuzzleItemImg = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
    fb.X1 = 696.0000000;
    fb.Y1 = 519.0000000;
    fb.X2 = 851.0000000;
    fb.Y2 = 532.0000000;
    RewardItemName = NewScrollLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
    RewardItemName.CaptionDrawType = 0;
    RewardItemName.SetFontSizeAll(9);
    RewardItemName.FontColor[0].R = 204;
    RewardItemName.FontColor[0].G = 204;
    RewardItemName.FontColor[0].B = 204;
    fb.X1 = 765.0000000;
    fb.Y1 = 584.0000000;
    fb.X2 = 851.0000000;
    fb.Y2 = 597.0000000;
    RewardItemCnt = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.2000000);
    RewardItemCnt.CaptionDrawType = 8;
    RewardItemCnt.SetFontSizeAll(9);
    RewardItemCnt.FontColor[0].R = byte(255);
    RewardItemCnt.FontColor[0].G = byte(255);
    RewardItemCnt.FontColor[0].B = byte(255);
    fb.X1 = 691.0000000;
    fb.Y1 = 513.0000000;
    fb.X2 = 856.0000000;
    fb.Y2 = 601.0000000;
    DummyBtn = NewButtonComponent(fb, 0.2000000);
    DummyBtn.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemImageOn;
    fb.X1 = 300.0000000;
    fb.Y1 = 116.0000000;
    fb.X2 = 724.0000000;
    fb.Y2 = 574.0000000;
    RewardItemInfoToolTip = BTItemInfoToolTipWindow(NewComponent(new Class'GUIWarfareControls_Decompressed.BTItemInfoToolTipWindow', fb));
    SetPuzzleRewardItemImage();
    //return;    
}

function bool ReceiveRewardItem(GUIComponent Sender)
{
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.kTcpChannel.sfReqPuzzleList(2, 2, GameMgr.GetUniqueID(MM.stDailyRewardItemInfo.ItemID[20]));
    return true;
    //return;    
}

function Internal_OnRendered(Canvas Canvas)
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
            RewardItemName.CaptionLeftRight(Canvas);
        }        
    }
    else
    {
        RewardItemName.ScrollProcess.DoNextAnimation(2);
        RewardItemName.ScrollProcess.InitValue();
        RewardItemName.ScrollProcess.bUpdateProcess = false;
    }
    //return;    
}

function SetPuzzleRewardItemImage()
{
    local wItemBoxHK ItemInfo;
    local Image ItemImage;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ItemImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(153, 64, 1, none);
    ItemInfo = GameMgr.FindUIItem(MM.stDailyRewardItemInfo.ItemID[20]);
    RewardItemInfoToolTip.FillCapsuleItemList(MM.stDailyRewardItemInfo.ItemID[20]);
    ItemImage.Image = ItemInfo.ItemImage;
    PuzzleItemImg.BackgroundImage = ItemImage;
    RewardItemName.Caption = (ItemInfo.ItemName $ " x") $ string(MM.stDailyRewardItemInfo.ItemCount[20]);
    RewardItemNameChange = true;
    //return;    
}

function ResetPuzzlepiece()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x34 [Loop If]
    if(i < 8)
    {
        puzzelPice[i].bVisible = false;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function SetVisiblePuzzlePiece()
{
    local wMatchMaker MM;
    local int i, IsComp;

    ResetPuzzlepiece();
    IsComp = 0;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    i = 0;
    J0x44:

    // End:0x109 [Loop If]
    if(i < MM.stPuzzleInfo.StateList.Length)
    {
        // End:0xA4
        if(int(MM.stPuzzleInfo.StateList[i]) == 1)
        {
            puzzelPice[i].bVisible = true;
            IsComp++;
            // [Explicit Continue]
            goto J0xFF;
        }
        // End:0xE8
        if(int(MM.stPuzzleInfo.StateList[i]) == 2)
        {
            puzzelPice[i].bVisible = true;
            IsComp = 9;
            // [Explicit Continue]
            goto J0xFF;
        }
        puzzelPice[i].bVisible = false;
        J0xFF:

        i++;
        // [Loop Continue]
        goto J0x44;
    }
    // End:0x158
    if(IsComp == 8)
    {
        BtnReceiveReward.SetEnabled(true);
        PlayerOwner().FmodClientPlaySound("Warfare_Sound_UI/Quest/puzzle",,, 6);        
    }
    else
    {
        BtnReceiveReward.SetEnabled(false);
    }
    //return;    
}

function InitPuzzlePiece()
{
    local FloatBox fb;

    fb.X1 = 153.0000000;
    fb.Y1 = 399.0000000;
    fb.X2 = 663.0000000;
    fb.Y2 = 622.0000000;
    puzzelPice[0] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_PuzzlePiece_0, 0.2000000);
    puzzelPice[1] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_PuzzlePiece_1, 0.2000000);
    puzzelPice[2] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_PuzzlePiece_2, 0.2000000);
    puzzelPice[3] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_PuzzlePiece_3, 0.2000000);
    puzzelPice[4] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_PuzzlePiece_4, 0.2000000);
    puzzelPice[5] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_PuzzlePiece_5, 0.2000000);
    puzzelPice[6] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_PuzzlePiece_6, 0.2000000);
    puzzelPice[7] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_PuzzlePiece_7, 0.2000000);
    //return;    
}

function bool ACLQuest_OnClick(GUIComponent Sender)
{
    // End:0x28
    if(ACLQuest.LastSelectedIndex >= 0)
    {
        SetLabelQuestDesc(ACLQuest.LastSelectedIndex);
    }
    return true;
    //return;    
}

function SetLabelQuestDesc(int RowIndex)
{
    local BTAutoColumnListDataHK row;
    local int nDailyQuestType;

    // End:0xEA
    if((RowIndex >= 0) && RowIndex < ACLQuest.ACLRowList.Length)
    {
        row = ACLQuest.ACLRowList[RowIndex];
        LabelQuestDesc.SetData(row.DataPerColumn[3].strValue, row.DataPerColumn[4].strValue, row.DataPerColumn[2].strValue, row.DataPerColumn[0].strValue, row.DataPerColumn[1].strValue, row.DataPerColumn[5].strValue, row.DataPerColumn[7].strValue);        
    }
    else
    {
        LabelQuestDesc.SetData("", "", "", "", "", "", "");
    }
    //return;    
}

defaultproperties
{
    strDaily[0]="?????????? Puzzle ?????????????????? Daily Quest, ???????????????"
    strDaily[1]="Puzzle Reward [Capsules]"
    strDaily[2]="???????????????"
    OnRender=BTDailyQuest.Internal_OnRendered
}