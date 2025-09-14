class BTAttendQuest extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline BTOwnerDrawImageHK BackgroundImage;
var array<export editinline BTOwnerDrawCaptionButtonHK> ReceiveBtnList;
var array<export editinline BTOwnerDrawImageHK> RewardItemImgList;
var wGameManager GameMgr;
var Image ItemImage;
var export editinline BTOwnerDrawImageHK AttendBg;
var export editinline BTOwnerDrawCaptionButtonHK ButtonClose;
var array<export editinline BTOwnerDrawImageScroll> RewardItemName;
var array<export editinline BTOwnerDrawImageHK> RewardItemPoint;
var array<export editinline BTOwnerDrawImageHK> RewardItemAttend;
var array<export editinline BTOwnerDrawImageHK> RewardItemAttendCnt;
var export editinline BTOwnerDrawImageHK AttendaceDesc;
var export editinline BTOwnerDrawImageHK AttendaceInit;
var export editinline BTOwnerDrawImageHK AttendaceCount;
var localized string strAttend[10];
var export editinline BTItemInfoToolTipWindow RewardItemInfoToolTip;
var array<export editinline BTOwnerDrawCaptionButtonHK> DummyBtn;
var array<int> RewardItemNameChange;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    fb.X1 = 26.0000000;
    fb.Y1 = 50.0000000;
    fb.X2 = 997.0000000;
    fb.Y2 = 759.0000000;
    AttendBg = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_AttendBg, 0.2000000);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    fb.X1 = 836.0000000;
    fb.Y1 = 713.0000000;
    fb.X2 = 960.0000000;
    fb.Y2 = 750.0000000;
    ButtonClose = NewButtonComponent(fb);
    ButtonClose.SetDefaultButtonImage();
    ButtonClose.SetFontSizeAll(11);
    ButtonClose.RenderWeight = 1.0000000;
    fb.X1 = 300.0000000;
    fb.Y1 = 116.0000000;
    fb.X2 = 724.0000000;
    fb.Y2 = 574.0000000;
    RewardItemInfoToolTip = BTItemInfoToolTipWindow(NewComponent(new Class'GUIWarfareControls_Decompressed.BTItemInfoToolTipWindow', fb));
    fb.X1 = 673.0000000;
    fb.Y1 = 517.0000000;
    fb.X2 = 838.0000000;
    fb.Y2 = 605.0000000;
    InitBtnList();
    //return;    
}

function OnRendered(Canvas C)
{
    local int i;

    RewardItemInfoToolTip.SetVisibleGroup(false);
    i = 0;
    J0x17:

    // End:0x15A [Loop If]
    if(i < DummyBtn.Length)
    {
        // End:0xF2
        if(CheckIn(DummyBtn[i].AWinPos, int(Controller.MouseX), int(Controller.MouseY)))
        {
            RewardItemInfoToolTip.SetVisibleGroup(true);
            RewardItemInfoToolTip.FillCapsuleItemList(DummyBtn[i].ButtonID);
            RewardItemName[i].ScrollProcess.bUpdateProcess = true;
            // End:0xEF
            if(RewardItemNameChange[i] == 1)
            {
                RewardItemNameChange[i] = 0;
                RewardItemName[i].CaptionLeftRight(C);
            }
            // [Explicit Continue]
            goto J0x150;
        }
        RewardItemName[i].ScrollProcess.DoNextAnimation(2);
        RewardItemName[i].ScrollProcess.InitValue();
        RewardItemName[i].ScrollProcess.bUpdateProcess = false;
        J0x150:

        i++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function RefreshBtnList()
{
    local int i, cnt;
    local wMatchMaker MM;
    local Color Col;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    i = 0;
    J0x37:

    // End:0x2D4 [Loop If]
    if(i < MM.stAttendInfo.StateList.Length)
    {
        // End:0xE5
        if(int(MM.stAttendInfo.StateList[i]) == 0)
        {
            ReceiveBtnList[i].SetEnabled(false);
            Col.R = byte(255);
            Col.G = byte(255);
            Col.B = byte(255);
            Col.A = byte(255);
            RewardItemAttendCnt[i].SetFontColorAll(Col);
            // [Explicit Continue]
            goto J0x2CA;
        }
        // End:0x171
        if(int(MM.stAttendInfo.StateList[i]) == 1)
        {
            ReceiveBtnList[i].SetEnabled(true);
            Col.R = 204;
            Col.G = byte(255);
            Col.B = 0;
            Col.A = byte(255);
            RewardItemAttendCnt[i].SetFontColorAll(Col);
            // [Explicit Continue]
            goto J0x2CA;
        }
        // End:0x2CA
        if(int(MM.stAttendInfo.StateList[i]) == 2)
        {
            ReceiveBtnList[i].SetEnabled(false);
            Col.R = byte(255);
            Col.G = 204;
            Col.B = 0;
            Col.A = byte(255);
            RewardItemAttendCnt[i].SetFontColorAll(Col);
            RewardItemAttend[i].SetFontColorAll(Col);
            cnt++;
            AttendaceCount.Caption = (("" $ string(cnt)) $ " ") $ strAttend[5];
            DummyBtn[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemImageComp;
            DummyBtn[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemImageComp;
            // End:0x2CA
            if((float(i) % float(5)) == float(4))
            {
                DummyBtn[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemImageOn;
            }
        }
        J0x2CA:

        i++;
        // [Loop Continue]
        goto J0x37;
    }
    //return;    
}

function InitBtnList()
{
    local export editinline BTOwnerDrawCaptionButtonHK temp;
    local export editinline BTOwnerDrawImageHK temp1, Temp2, Temp3, Temp4, Temp5;

    local export editinline BTOwnerDrawImageScroll TempScroll;
    local wItemBoxHK ItemInfo;
    local int i, nOffset;
    local wMatchMaker MM;
    local Color Col;
    local FloatBox fb;

    ItemImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(153, 64, 1, none);
    RewardItemImgList.Length = 0;
    ReceiveBtnList.Length = 0;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    AttendaceDesc = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    AttendaceDesc.bUseAWinPos = true;
    AttendaceDesc.AWinPos.X1 = 54.0000000;
    AttendaceDesc.AWinPos.Y1 = 63.0000000;
    AttendaceDesc.AWinPos.X2 = 641.0000000;
    AttendaceDesc.AWinPos.Y2 = 76.0000000;
    AttendaceDesc.ApplyAWinPos();
    AttendaceDesc.CaptionDrawType = 0;
    AttendaceDesc.SetFontSizeAll(9);
    Col.R = byte(255);
    Col.G = 204;
    Col.B = 0;
    Col.A = byte(255);
    AttendaceDesc.SetFontColorAll(Col);
    AttendaceDesc.RenderWeight = 0.2000000;
    AttendaceDesc.Caption = strAttend[3];
    AttendaceDesc.InitComponent(Controller, self);
    AppendComponent(AttendaceDesc);
    AttendaceInit = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    AttendaceInit.bUseAWinPos = true;
    AttendaceInit.AWinPos.X1 = 54.0000000;
    AttendaceInit.AWinPos.Y1 = 79.0000000;
    AttendaceInit.AWinPos.X2 = 641.0000000;
    AttendaceInit.AWinPos.Y2 = 92.0000000;
    AttendaceInit.ApplyAWinPos();
    AttendaceInit.CaptionDrawType = 0;
    AttendaceInit.SetFontSizeAll(9);
    Col.R = 204;
    Col.G = 204;
    Col.B = 204;
    Col.A = byte(255);
    AttendaceInit.SetFontColorAll(Col);
    AttendaceInit.RenderWeight = 0.2000000;
    AttendaceInit.Caption = strAttend[4];
    AttendaceInit.InitComponent(Controller, self);
    AppendComponent(AttendaceInit);
    AttendaceCount = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    AttendaceCount.bUseAWinPos = true;
    AttendaceCount.AWinPos.X1 = 651.0000000;
    AttendaceCount.AWinPos.Y1 = 69.0000000;
    AttendaceCount.AWinPos.X2 = 975.0000000;
    AttendaceCount.AWinPos.Y2 = 95.0000000;
    AttendaceCount.ApplyAWinPos();
    AttendaceCount.CaptionDrawType = 5;
    AttendaceCount.SetFontSizeAll(20);
    Col.R = byte(255);
    Col.G = byte(255);
    Col.B = byte(255);
    Col.A = byte(255);
    AttendaceCount.SetFontColorAll(Col);
    AttendaceCount.RenderWeight = 0.2000000;
    AttendaceCount.Caption = strAttend[5];
    AttendaceCount.InitComponent(Controller, self);
    AppendComponent(AttendaceCount);
    i = 0;
    J0x449:

    // End:0xF66 [Loop If]
    if(i < MM.stAttendInfo.StateList.Length)
    {
        nOffset = 0;
        // End:0x48C
        if((float(i) % float(5)) == float(4))
        {
            nOffset = 8;
        }
        temp1 = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        temp1.bUseAWinPos = true;
        temp1.AWinPos.X1 = (71.0000000 + float(nOffset)) + ((float(i) % float(5)) * float(180));
        temp1.AWinPos.Y1 = 135.0000000 + float((i / 5) * 152);
        temp1.AWinPos.X2 = temp1.AWinPos.X1 + float(153);
        temp1.AWinPos.Y2 = temp1.AWinPos.Y1 + float(64);
        temp1.ApplyAWinPos();
        temp1.CaptionDrawType = 4;
        temp1.RenderWeight = 0.2000000;
        ItemInfo = GameMgr.FindUIItem(MM.stDailyRewardItemInfo.ItemID[i]);
        ItemImage.Image = ItemInfo.ItemImage;
        temp1.BackgroundImage = ItemImage;
        temp1.InitComponent(Controller, self);
        AppendComponent(temp1);
        RewardItemImgList[RewardItemImgList.Length] = temp1;
        fb = temp1.AWinPos;
        fb.X1 = fb.X1 - float(6);
        fb.Y1 = fb.Y1 - float(21);
        fb.X2 = fb.X2 + float(6);
        fb.Y2 = fb.Y2 + float(3);
        DummyBtn[i] = NewButtonComponent(fb, 0.3000000);
        // End:0x730
        if(int(MM.stAttendInfo.StateList[i]) == 2)
        {
            DummyBtn[i].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemImageComp;
            DummyBtn[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemImageComp;
        }
        RewardItemNameChange[RewardItemNameChange.Length] = 1;
        // End:0x779
        if((float(i) % float(5)) == float(4))
        {
            DummyBtn[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemImageOn;
        }
        DummyBtn[i].ButtonID = MM.stDailyRewardItemInfo.ItemID[i];
        temp = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        temp.bUseAWinPos = true;
        temp.AWinPos.X1 = temp1.AWinPos.X1 + float(93);
        temp.AWinPos.Y1 = temp1.AWinPos.Y2 + float(12);
        temp.AWinPos.X2 = temp.AWinPos.X1 + float(68);
        temp.AWinPos.Y2 = temp.AWinPos.Y1 + float(37);
        temp.ApplyAWinPos();
        temp.Caption = strAttend[0];
        temp.RenderWeight = 0.2000000;
        temp.ButtonID = i;
        temp.dbUniqID = GameMgr.GetUniqueID(MM.stDailyRewardItemInfo.ItemID[i]);
        temp.__OnClick__Delegate = OnRecive;
        temp.SetDefaultButtonImage();
        temp.InitComponent(Controller, self);
        AppendComponent(temp);
        ReceiveBtnList[ReceiveBtnList.Length] = temp;
        TempScroll = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageScroll';
        TempScroll.bUseAWinPos = true;
        TempScroll.AWinPos.X1 = (70.0000000 + float(nOffset)) + ((float(i) % float(5)) * float(180));
        TempScroll.AWinPos.Y1 = 120.0000000 + float((i / 5) * 152);
        TempScroll.AWinPos.X2 = TempScroll.AWinPos.X1 + float(155);
        TempScroll.AWinPos.Y2 = TempScroll.AWinPos.Y1 + float(13);
        TempScroll.ApplyAWinPos();
        TempScroll.CaptionDrawType = 0;
        TempScroll.SetFontSizeAll(9);
        Col.R = byte(255);
        Col.G = 204;
        Col.B = 0;
        Col.A = byte(255);
        TempScroll.SetFontColorAll(Col);
        TempScroll.RenderWeight = 0.2000000;
        ItemInfo = GameMgr.FindUIItem(MM.stDailyRewardItemInfo.ItemID[i]);
        TempScroll.Caption = (ItemInfo.ItemName $ " x") $ string(MM.stDailyRewardItemInfo.ItemCount[i]);
        TempScroll.InitComponent(Controller, self);
        TempScroll.ScrollProcess.bUpdateProcess = false;
        AppendComponent(TempScroll);
        RewardItemName[RewardItemName.Length] = TempScroll;
        Temp4 = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        Temp4.bUseAWinPos = true;
        Temp4.AWinPos.X1 = (63.0000000 + float(nOffset)) + ((float(i) % float(5)) * float(180));
        Temp4.AWinPos.Y1 = 211.0000000 + float((i / 5) * 152);
        Temp4.AWinPos.X2 = Temp4.AWinPos.X1 + float(96);
        Temp4.AWinPos.Y2 = Temp4.AWinPos.Y1 + float(13);
        Temp4.ApplyAWinPos();
        Temp4.CaptionDrawType = 0;
        Temp4.SetFontSizeAll(9);
        Col.R = byte(255);
        Col.G = byte(255);
        Col.B = byte(255);
        Col.A = byte(255);
        Temp4.SetFontColorAll(Col);
        Temp4.RenderWeight = 0.2000000;
        Temp4.Caption = strAttend[1];
        Temp4.InitComponent(Controller, self);
        AppendComponent(Temp4);
        RewardItemAttend[RewardItemAttend.Length] = Temp4;
        Temp5 = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        Temp5.bUseAWinPos = true;
        Temp5.AWinPos.X1 = (63.0000000 + float(nOffset)) + ((float(i) % float(5)) * float(180));
        Temp5.AWinPos.Y1 = 226.0000000 + float((i / 5) * 152);
        Temp5.AWinPos.X2 = Temp5.AWinPos.X1 + float(96);
        Temp5.AWinPos.Y2 = Temp5.AWinPos.Y1 + float(13);
        Temp5.ApplyAWinPos();
        Temp5.CaptionDrawType = 0;
        Temp5.SetFontSizeAll(11);
        Col.R = byte(255);
        Col.G = byte(255);
        Col.B = byte(255);
        Col.A = byte(255);
        Temp5.SetFontColorAll(Col);
        Temp5.RenderWeight = 0.2000000;
        ItemInfo = GameMgr.FindUIItem(MM.stDailyRewardItemInfo.ItemID[i]);
        Temp5.Caption = string(i + 1) $ strAttend[2];
        Temp5.InitComponent(Controller, self);
        AppendComponent(Temp5);
        RewardItemAttendCnt[RewardItemAttendCnt.Length] = Temp5;
        // End:0xF5C
        if(int(MM.stAttendInfo.StateList[i]) != 1)
        {
            ReceiveBtnList[i].SetEnabled(false);
        }
        i++;
        // [Loop Continue]
        goto J0x449;
    }
    //return;    
}

function bool OnRecive(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    btn = BTOwnerDrawCaptionButtonHK(Sender);
    MM.kTcpChannel.sfReqAttendanceList(2, byte(btn.ButtonID + 1), 2, btn.dbUniqID);
    return true;
    //return;    
}

defaultproperties
{
    strAttend[0]="??????"
    strAttend[1]="????????????"
    strAttend[2]="??????"
    strAttend[3]="??????????????????????????????????,????????????????????????????"
    strAttend[4]="(???????????????????? ????????????????????? 00)"
    strAttend[5]="???????????!"
    OnRendered=BTAttendQuest.OnRendered
}