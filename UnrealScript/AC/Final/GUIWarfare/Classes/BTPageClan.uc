class BTPageClan extends BTNetGUIPageHK
    editinlinenew
    instanced;

const LABEL_COUNT = 15;

var bool bReqClanInfo;
var bool bDelayClanInvite;
var bool bClanInviteState;
var string DelayClanName;
var BTRefreshTime rfFriendPosTime;
var ClanInfo ClanInfo;
var localized string strRecord;
var() automated FloatBox fbPanelBackground[2];
var export editinline BTOwnerDrawImageHK PanelBackground[2];
var localized string strClanSecession[3];
var localized string strClanClose[3];
var transient wMatchMaker MatchMaker;
var float LastRefreshTime;
var float RefreshCycleTime;
var() automated FloatBox fbLabelClanMark;
var export editinline BTLabelClanMarkHK LabelClanMark;
var() automated FloatBox fbLabelClanName;
var export editinline BTOwnerDrawImageHK LabelClanName;
var localized string strLabel[15];
var() automated FloatBox fbLabel[15];
var export editinline BTOwnerDrawImageHK Label[15];
var localized string strNoRankState;
var() automated FloatBox fbEdit[15];
var localized string strEdit[15];
var export editinline BTOwnerDrawTextArrayHK Edit[15];
var localized string strToolTip[15];
var BTRODecorateStringHK btToolTip;
var export editinline BTMultiLineEditBoxHK ClanIntroduction;
var export editinline BTMultiLineEditBoxHK ClanNotice;
var string strClanNotice;
var export editinline BTAutoScrollListHK ClanIntroduction2;
var export editinline BTAutoScrollListHK ClanNotice2;
var export editinline BTOwnerDrawImageHK LabelTop[4];
var FloatBox fbButtonTop[4];
var localized string strButtonTop[4];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTop[4];
var() automated FloatBox fbACLMember;
var export editinline BTACLClanMemberHK ACLMember;
var export editinline BTCMClanUserListHK CMClanUserList;
var() automated FloatBox fbLabelClanNews;
var localized string strLabelClanNews;
var export editinline BTOwnerDrawImageHK LabelClanNews;
var() automated FloatBox fbACLClanNews;
var export editinline BTACLClanNewsHK ACLClanNews;
var() automated FloatBox fbLabelClanWarResult;
var localized string strLabelClanWarResult;
var export editinline BTOwnerDrawImageHK LabelClanWarResult;
var() automated FloatBox fbACLClanWarResult;
var export editinline BTACLClanWarResultHK ACLClanWarResult;
var() automated FloatBox fbListBottomButton[6];
var localized string strListBottomButton[6];
var export editinline BTOwnerDrawCaptionButtonHK ListBottomButton[6];
var() automated FloatBox fbTPChat;
var export editinline BTTPChatHK TPChat;

function bool ListBottomButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0xAC
        case 0:
            Controller.OpenMenu("GUIWarfareControls.BTWindowSelectHK");
            BTWindowSelectHK(Controller.TopPage()).SetData(strClanSecession[0], 5, strClanSecession[1]);
            BTWindowSelectHK(Controller.TopPage()).__OnOK__Delegate = BTWindowClanSecession_OnOK;
            // End:0x358
            break;
        // End:0x138
        case 1:
            Controller.OpenMenu("GUIWarfareControls.BTWindowSelectHK");
            BTWindowSelectHK(Controller.TopPage()).SetData(strClanClose[0], 5, strClanClose[1]);
            BTWindowSelectHK(Controller.TopPage()).__OnOK__Delegate = BTWindowClanClose_OnOK;
            // End:0x358
            break;
        // End:0x24D
        case 2:
            Controller.OpenMenu("GUIWarfareControls.BTwindowFindClanHK");
            BTWindowFindClanHK(Controller.TopPage()).TcpChannel = page_Main.TcpChannel;
            BTWindowFindClanHK(Controller.TopPage()).ButtonOK.DisableMe();
            BTWindowFindClanHK(Controller.TopPage()).ACLClanList.MultiColumnList.__OnDblClick__Delegate = BTWindowFindClanHK_OnInfo;
            BTWindowFindClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowFindClanHK_OnRequestJoin;
            BTWindowFindClanHK(Controller.TopPage()).ButtonInfo.__OnClick__Delegate = BTWindowFindClanHK_OnInfo;
            // End:0x358
            break;
        // End:0x255
        case 3:
            // End:0x358
            break;
        // End:0x319
        case 4:
            Controller.OpenMenu("GUIWarfareControls.BTWindowClanInfoChangeHK");
            BTWindowClanInfoChangeHK(Controller.TopPage()).SetData(int(ClanInfo.Region), int(ClanInfo.IsRecruit), ClanInfo.Keyword, ClanInfo.Intro, strClanNotice, MatchMaker.kInClanGrade);
            BTWindowClanInfoChangeHK(Controller.TopPage()).__OnOK__Delegate = BTWindowClanInfoChangeHK_OnOK;
            // End:0x358
            break;
        // End:0x355
        case 5:
            page_Main.TcpChannel.sfReqClanCharPersonelIntro(MatchMaker.kClanName, MatchMaker.kUserName);
            // End:0x358
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function bool BTWindowFindClanHK_OnRequestJoin(GUIComponent Sender)
{
    return true;
    //return;    
}

function bool BTWindowFindClanHK_OnInfo(GUIComponent Sender)
{
    local string ClanName;

    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x93
    if((ClanName != "none") && ClanName != "")
    {
        // End:0x6E
        if(bDelayClanInvite || bClanInviteState)
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 56);
            return true;
        }
        bReqClanInfo = true;
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
    }
    return true;
    //return;    
}

function bool BTWindowSelfIntroductionChangeHK_OnOK(GUIComponent Sender)
{
    local string strSelfIntro;

    Log("[BTPageClan::BTWindowSelfIntroductionChangeHK_OnOK]");
    strSelfIntro = BTWindowSelfIntroductionChangeHK(Controller.TopPage()).SelfIntroduction.TextStr;
    TcpChannel.sfReqClanPersonelIntro(MatchMaker.kClanName, MatchMaker.kUserName, strSelfIntro);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool BTWindowClanInfoChangeHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowClanInfoChangeHK BTWindow;

    Log("[BTPageClan::BTWindowClanInfoChangeHK_OnOK]");
    BTWindow = BTWindowClanInfoChangeHK(Sender);
    page_Main.TcpChannel.sfReqClanChangeInfo(MatchMaker.kClanName, byte(BTWindow.ClanRecruit.ComboBox.GetIndex()), byte(BTWindow.ClanLocation.ComboBox.GetIndex()), BTWindow.ClanKeyword.TextStr, BTWindow.ClanIntroduction.TextStr, BTWindow.ClanNotice.TextStr);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool BTWindowClanSecession_OnOK(GUIComponent Sender)
{
    Log("[BTPageClan::BTWindowClanSecession_OnOK]");
    page_Main.TcpChannel.sfReqClanSecession(MatchMaker.kClanName);
    page_Main.TcpChannel.sfReqCharInfo();
    page_Main.TcpChannel.sfReqChannelUserList(MatchMaker.kChannelID, 0, 100);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool BTWindowClanClose_OnOK(GUIComponent Sender)
{
    Log("[BTPageClan::BTWindowClanClose_OnOK]");
    // End:0x62
    if(MatchMaker.kInClanGrade == 1)
    {
        page_Main.TcpChannel.sfReqClanClose(MatchMaker.kClanName);
    }
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool BTWindowBackToLastPage_OnOK(GUIComponent Sender)
{
    Log("[BTPageClan::BTWindowBackToLastPage_OnOK]");
    page_Main.TcpChannel.sfReqCharInfo();
    Controller.CloseMenu(false);
    PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
    page_Main.SetPage(1, true);
    return true;
    //return;    
}

function bool BTWindowAdjustClanMasterOnOK(GUIComponent Sender)
{
    local string TargetUser;

    Controller.CloseMenu(false);
    TargetUser = ACLMember.GetUserName(ACLMember.selectIndex);
    page_Main.TcpChannel.sfReqAdjustClanMemberGrade(MatchMaker.kClanName, TargetUser, 1);
    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    Log("[BTPageClan::InitComponent]");
    super.InitComponent(MyController, myOwner);
    NewBackground = NewLabelComponent(fbNewBackground, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.new_Page_Thema, 0.0001300);
    SkipTopMenuIndex = int(TPTopMenu.3);
    LabelRoomName.SetVisibility(false);
    LabelClanMark = BTLabelClanMarkHK(NewComponent(new Class'GUIWarfareControls.BTLabelClanMarkHK', fbLabelClanMark, 1.0000000));
    LabelTitle.bVisible = false;
    LabelClanName = NewLabelComponent(fbLabelClanName, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.empty);
    LabelClanName.CaptionDrawType = 0;
    LabelClanName.SetFontSizeAll(17);
    LabelClanName.SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.ClanName());
    LabelClanName.Caption = "";
    i = 0;
    J0x122:

    // End:0x163 [Loop If]
    if(i < 2)
    {
        PanelBackground[i] = NewLabelComponent(fbPanelBackground[i], Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1);
        i++;
        // [Loop Continue]
        goto J0x122;
    }
    i = 0;
    J0x16A:

    // End:0x1E2 [Loop If]
    if(i < 15)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls.BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0x16A;
    }
    i = 0;
    J0x1E9:

    // End:0x60A [Loop If]
    if(i < 15)
    {
        // End:0x252
        if(i == 8)
        {
            Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new Class'GUIWarfareControls.BTLabelLocationHK', fbEdit[i]));
            Edit[i].BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_5;            
        }
        else
        {
            // End:0x2AF
            if(i == 10)
            {
                Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new Class'GUIWarfareControls.BTLabelRecruitHK', fbEdit[i]));
                Edit[i].BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_5;                
            }
            else
            {
                Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new Class'GUIWarfareControls.BTOwnerDrawTextArrayHK', fbEdit[i]));
                Edit[i].BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_5;
            }
        }
        // End:0x480
        if(i == 13)
        {
            ClanIntroduction = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls.BTMultiLineEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeResizeBox(fbEdit[i], -4, -6)));
            ClanIntroduction.bReadOnly = true;
            ClanIntroduction.bActiveCursor = false;
            fb = fbEdit[i];
            fb.Y1 += float(1);
            fb.Y2 -= float(1);
            fb.X2 -= float(15);
            ClanIntroduction2 = BTAutoScrollListHK(NewComponent(new Class'GUIWarfareControls.BTAutoScrollListHK', fb));
            ClanIntroduction2.MultiColumnList.MyScrollBar.bUseAWinPos = true;
            ClanIntroduction2.MultiColumnList.MyScrollBar.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
            ClanIntroduction2.MultiColumnList.MyScrollBar.ApplyAWinPos();
            ClanIntroduction2.bAutoShowScrollBar = true;
            ClanIntroduction2.SelectImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.empty;
            // [Explicit Continue]
            goto J0x600;
        }
        // End:0x600
        if(i == 14)
        {
            ClanNotice = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls.BTMultiLineEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeResizeBox(fbEdit[i], -4, -6)));
            ClanNotice.bReadOnly = true;
            ClanNotice.bActiveCursor = false;
            fb = fbEdit[i];
            fb.Y1 += float(1);
            fb.Y2 -= float(1);
            fb.X2 -= float(15);
            ClanNotice2 = BTAutoScrollListHK(NewComponent(new Class'GUIWarfareControls.BTAutoScrollListHK', fb));
            ClanNotice2.MultiColumnList.MyScrollBar.bUseAWinPos = true;
            ClanNotice2.MultiColumnList.MyScrollBar.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
            ClanNotice2.MultiColumnList.MyScrollBar.ApplyAWinPos();
            ClanNotice2.bAutoShowScrollBar = true;
            ClanNotice2.SelectImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.empty;
        }
        J0x600:

        i++;
        // [Loop Continue]
        goto J0x1E9;
    }
    i = 0;
    J0x611:

    // End:0x6C4 [Loop If]
    if(i < 6)
    {
        ListBottomButton[i] = NewButtonComponent(fbListBottomButton[i]);
        ListBottomButton[i].SetDefaultButtonImage();
        ListBottomButton[i].SetFontSizeAll(12);
        ListBottomButton[i].ButtonID = i;
        ListBottomButton[i].Caption = strListBottomButton[i];
        ListBottomButton[i].__OnClick__Delegate = ListBottomButton_OnClick;
        i++;
        // [Loop Continue]
        goto J0x611;
    }
    ListBottomButton[3].DisableMe();
    i = 0;
    J0x6DD:

    // End:0x84D [Loop If]
    if(i < 4)
    {
        ButtonTop[i] = new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK';
        ButtonTop[i].bUseAWinPos = true;
        ButtonTop[i].AWinPos = fbButtonTop[i];
        ButtonTop[i].buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.butt_list_on;
        ButtonTop[i].buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.butt_list_cli;
        ButtonTop[i].RenderWeight = 0.2000000;
        ButtonTop[i].SetFontSizeAll(9);
        ButtonTop[i].SetDefaultListTopButtonFontColor();
        ButtonTop[i].Caption = strButtonTop[i];
        ButtonTop[i].CaptionDrawType = 4;
        ButtonTop[i].ButtonID = i;
        ButtonTop[i].InitComponent(Controller, self);
        AppendComponent(ButtonTop[i]);
        i++;
        // [Loop Continue]
        goto J0x6DD;
    }
    i = 0;
    J0x854:

    // End:0x9E6 [Loop If]
    if(i < (4 - 1))
    {
        LabelTop[i] = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
        LabelTop[i].bUseAWinPos = true;
        LabelTop[i].AWinPos.X1 = ButtonTop[i].AWinPos.X2 - float(2);
        LabelTop[i].AWinPos.Y1 = ButtonTop[i].AWinPos.Y1 + float(5);
        LabelTop[i].AWinPos.X2 = ButtonTop[i].AWinPos.X2 + float(2);
        LabelTop[i].AWinPos.Y2 = ButtonTop[i].AWinPos.Y2 - float(5);
        LabelTop[i].BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_list_divid;
        LabelTop[i].RenderWeight = 0.1900000;
        LabelTop[i].InitComponent(Controller, self);
        AppendComponent(LabelTop[i]);
        i++;
        // [Loop Continue]
        goto J0x854;
    }
    LabelTop[4 - 1] = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    LabelTop[4 - 1].bUseAWinPos = true;
    LabelTop[4 - 1].AWinPos.X1 = ButtonTop[0].AWinPos.X1;
    LabelTop[4 - 1].AWinPos.Y1 = ButtonTop[0].AWinPos.Y1;
    LabelTop[4 - 1].AWinPos.X2 = ButtonTop[4 - 1].AWinPos.X2;
    LabelTop[4 - 1].AWinPos.Y2 = ButtonTop[4 - 1].AWinPos.Y2;
    LabelTop[4 - 1].BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.butt_list_n;
    LabelTop[4 - 1].RenderWeight = 0.1000000;
    LabelTop[4 - 1].InitComponent(Controller, self);
    AppendComponent(LabelTop[4 - 1]);
    ACLMember = BTACLClanMemberHK(NewComponent(new Class'GUIWarfareControls.BTACLClanMemberHK', fbACLMember));
    CMClanUserList = new Class'GUIWarfareControls.BTCMClanUserListHK';
    CMClanUserList.InitComponent(self.Controller, none);
    CMClanUserList.__OnOpen__Delegate = ContextMenu_OnOpen;
    CMClanUserList.__OnClose__Delegate = ContextMenu_OnClose;
    CMClanUserList.__OnSelected__Delegate = ContextMenu_OnSelected;
    ACLMember.ContextMenu = CMClanUserList;
    LabelClanNews = NewLabelComponent(fbLabelClanNews, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.butt_list_n);
    LabelClanNews.Caption = strLabelClanNews;
    LabelClanNews.CaptionDrawType = 3;
    LabelClanNews.CaptionPadding[0] = 10;
    LabelClanNews.SetFontSizeAll(12);
    ACLClanNews = BTACLClanNewsHK(NewComponent(new Class'GUIWarfareControls.BTACLClanNewsHK', fbACLClanNews));
    LabelClanWarResult = NewLabelComponent(fbLabelClanWarResult, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.butt_list_n);
    LabelClanWarResult.Caption = strLabelClanWarResult;
    LabelClanWarResult.CaptionDrawType = 3;
    LabelClanWarResult.CaptionPadding[0] = 10;
    LabelClanWarResult.SetFontSizeAll(12);
    ACLClanWarResult = BTACLClanWarResultHK(NewComponent(new Class'GUIWarfareControls.BTACLClanWarResultHK', fbACLClanWarResult));
    ACLClanNews.MultiColumnBox.MyList.MyScrollBar.AWinPos.X1 = 1024.0000000;
    ACLClanNews.MultiColumnBox.MyList.MyScrollBar.AWinPos.X2 = 1024.0000000;
    ACLClanNews.MultiColumnBox.MyList.MyScrollBar.AWinPos.Y1 = 768.0000000;
    ACLClanNews.MultiColumnBox.MyList.MyScrollBar.AWinPos.Y2 = 768.0000000;
    ACLClanNews.MultiColumnBox.MyList.MyScrollBar.ApplyAWinPos();
    ACLClanWarResult.MultiColumnBox.MyList.MyScrollBar.AWinPos.X1 = 1024.0000000;
    ACLClanWarResult.MultiColumnBox.MyList.MyScrollBar.AWinPos.X2 = 1024.0000000;
    ACLClanWarResult.MultiColumnBox.MyList.MyScrollBar.AWinPos.Y1 = 768.0000000;
    ACLClanWarResult.MultiColumnBox.MyList.MyScrollBar.AWinPos.Y2 = 768.0000000;
    ACLClanWarResult.MultiColumnBox.MyList.MyScrollBar.ApplyAWinPos();
    TPChat = BTTPChatHK(NewComponent(new Class'GUIWarfareControls.BTTPChatHK', fbTPChat));
    page_Main.TPChat = TPChat;
    TPChat.InputBox.__OnChat__Delegate = page_Main.Internal_OnChat;
    TPChat.InputBox.__OnInputTab__Delegate = page_Main.TPChat_OnInputTab;
    TPChat.InputBox.__OnInputSpace__Delegate = page_Main.TPChat_OnInputSpace;
    TPChat.__OnChageChatMode__Delegate = page_Main.TPChat_OnChageChatMode;
    TPChat.__ChangeTab_OnClick__Delegate = page_Main.TPChat_ChangeTab_OnClickTemp;
    TPChat.InputBox.__OnFunctionKey__Delegate = page_Main.Internal_OnFunctionKey;
    rfFriendPosTime = new Class'GUIWarfare_Decompressed.BTRefreshTime';
    rfFriendPosTime.SetMaxTime(1.5000000);
    LastRefreshTime = PlayerOwner().Level.TimeSeconds;
    btToolTip = new Class'GUIWarfareControls.BTRODecorateStringHK';
    btToolTip.Init();
    btToolTip.OriginalString.FontDrawType = 3;
    btToolTip.InternalPadding[0] = 5;
    btToolTip.InternalPadding[1] = 5;
    btToolTip.InternalPadding[2] = 10;
    btToolTip.InternalPadding[3] = 5;
    btToolTip.bAutoWidth = true;
    Controller.PushPage();
    //return;    
}

function InternalOnReOpen()
{
    __NFUN_270__("BTPageClan::InternalOnReOpen()");
    Log("[BTPageClan::InternalOnReOpen] Start");
    Log("[BTPageClan::InternalOnReOpen] End");
    //return;    
}

function InternalOnOpen()
{
    __NFUN_270__("BTPageClan::InternalOnOpen()");
    Log("[BTPageClan::InternalOnOpen] Start");
    Log("[BTPageClan::InternalOnOpen] End");
    //return;    
}

function OnCompleteOpened()
{
    Log("[BTPageClan::OnCompleteOpened] Start");
    Controller.PushPage();
    RefreshPage();
    Log("[BTPageClan::OnCompleteOpened] End");
    //return;    
}

function UpdateClanInfo(wMatchMaker MM)
{
    Log("[BTPageClan::UpdateClanInfo]");
    ClanInfo = page_Main.MyClanInfo;
    LabelClanName.Caption = MM.kClanName;
    LabelClanMark.SetData(MM.kClanPattern, MM.kClanBG, MM.kClanBL, true);
    Edit[0].SetData(ClanInfo.ClanMasterCharname);
    Edit[1].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[1], string(ClanInfo.ClanWin), string(ClanInfo.ClanLose)));
    Edit[2].SetData(string(ClanInfo.ClanActivity));
    // End:0x12D
    if(ClanInfo.ClanActivityRank == 0)
    {
        Edit[3].SetData(strNoRankState);        
    }
    else
    {
        Edit[3].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[2], string(ClanInfo.ClanActivityRank)));
    }
    Edit[4].SetData(GameMgr.GetClanLevelName(ClanInfo.ClanLevel));
    Edit[5].SetData((string(ClanInfo.ClanExp) $ "/") $ string(GameMgr.GetClanEndExp(ClanInfo.ClanLevel)));
    // End:0x1F7
    if(ClanInfo.tRankCur == 0)
    {
        Edit[6].SetData(strNoRankState);        
    }
    else
    {
        Edit[6].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[2], string(ClanInfo.tRankCur)));
    }
    // End:0x256
    if(ClanInfo.mRankCur == 0)
    {
        Edit[7].SetData(strNoRankState);        
    }
    else
    {
        Edit[7].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[8], string(ClanInfo.mRankCur)));
    }
    BTLabelLocationHK(Edit[8]).SetLocationID(int(ClanInfo.Region));
    Edit[9].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[9], string(ClanInfo.MemberCnt), string(ClanInfo.MemberTotal)));
    BTLabelRecruitHK(Edit[10]).SetRecruitState(ClanInfo.IsRecruit);
    GetDatefromString(ClanInfo.HowOld, "-", true);
    Edit[11].SetData(ClanInfo.HowOld);
    Edit[12].SetData(ClanInfo.Keyword);
    Edit[13].SetData("");
    ClanIntroduction2.Clear();
    ClanIntroduction2.AddLineRow(none, ClanInfo.Intro);
    Edit[14].SetData("");
    strClanNotice = ClanInfo.ClanNoti;
    ClanNotice2.Clear();
    ClanNotice2.AddLineRow(none, ClanInfo.ClanNoti);
    //return;    
}

function InitializeDelegate()
{
    MM.__UpdateClanInfo__Delegate = UpdateClanInfo;
    page_Main.__UpdateRecv_ClanInfo__Delegate = UpdateRecv_ClanInfo;
    //return;    
}

function UnInitializeDelegate()
{
    MM.__UpdateClanInfo__Delegate = None;
    page_Main.__UpdateRecv_ClanInfo__Delegate = None;
    //return;    
}

function RefreshPage()
{
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    super.RefreshPage();
    MM.SetCurSubPos(6);
    MM.kMainMenu = page_Main;
    InitializeDelegate();
    Controller.PushPage();
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ACLMember.RemoveAll();
    ACLClanNews.RemoveAll();
    ACLClanWarResult.RemoveAll();
    page_Main.__ClearChatLog__Delegate = ClearChatLog;
    page_Main.__NormalChatLog__Delegate = NormalChatLog;
    page_Main.__ClanChatLog__Delegate = ClanChatLog;
    page_Main.__WhisperChatLog__Delegate = WhisperChatLog;
    page_Main.__SelfChatLog__Delegate = SelfChatLog;
    page_Main.__SystemChatLog__Delegate = SystemChatLog;
    page_Main.__BroadCastItemChatLog__Delegate = BroadCastItemChatLog;
    page_Main.__TeamChatLog__Delegate = TeamChatLog;
    page_Main.UpdateChatLog();
    page_Main.PrevChatMode.ChatType = 1;
    TPChat.SetChatState(page_Main.PrevChatMode.ChatType);
    currentBGM = page_Main.DefaultLobbyBGM;
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    ListBottomButton[1].DisableMe();
    // End:0x265
    if(MatchMaker.kInClanGrade == 1)
    {
        ListBottomButton[0].DisableMe();
        ListBottomButton[4].EnableMe();        
    }
    else
    {
        ListBottomButton[0].EnableMe();
        ListBottomButton[4].DisableMe();
    }
    // End:0x2BF
    if(MatchMaker.kClanMatch_InChannel == true)
    {
        ListBottomButton[0].DisableMe();
        ListBottomButton[1].DisableMe();
    }
    page_Main.TcpChannel.sfReqClanInfo(MatchMaker.kClanName);
    page_Main.TcpChannel.sfReqClanUserList(MatchMaker.kClanName);
    page_Main.TcpChannel.sfReqClanNews(MatchMaker.kClanName);
    page_Main.TcpChannel.sfReqClanMatchResultHistory(MatchMaker.kClanName);
    TPChat.InputBox.FocusFirst(none);
    Controller.PushPage();
    //return;    
}

function bool ContextMenu_OnOpen(GUIContextMenu Sender)
{
    // End:0x73
    if(ACLMember.selectIndex >= 0)
    {
        ACLMember.MultiColumnList.bHotTrack = false;
        BTContextMenuHK(ACLMember.ContextMenu).OpenContextMenu(int(Controller.MouseX), int(Controller.MouseY));
        OnPopupCheck();
        return true;
    }
    return false;
    //return;    
}

function OnPopupCheck()
{
    local int i, TargetGrade;
    local string TargetUser;

    TargetUser = ACLMember.GetUserName(ACLMember.selectIndex);
    TargetGrade = ACLMember.GetUserGrade(ACLMember.selectIndex);
    i = 0;
    J0x4D:

    // End:0x79 [Loop If]
    if(i < 9)
    {
        CMClanUserList.ChangeStateByIndex(i, 1);
        i++;
        // [Loop Continue]
        goto J0x4D;
    }
    // End:0xC0
    if(MM.kUserName == ACLMember.GetUserName(ACLMember.selectIndex))
    {
        CMClanUserList.SetLogOnState(-1);        
    }
    else
    {
        CMClanUserList.SetLogOnState(ACLMember.GetLogOnState(ACLMember.selectIndex));
    }
    // End:0x17E
    if((TargetUser != MatchMaker.kUserName) && MatchMaker.kInClanGrade == 1)
    {
        CMClanUserList.ChangeStateByIndex(6, 0);
        // End:0x14C
        if(TargetGrade >= 3)
        {
            CMClanUserList.ChangeStateByIndex(7, 0);
        }
        // End:0x16B
        if(TargetGrade == 2)
        {
            CMClanUserList.ChangeStateByIndex(8, 0);
        }
        CMClanUserList.ChangeStateByIndex(5, 0);
    }
    CMClanUserList.ChangeStateByIndex(0, 0);
    CMClanUserList.ChangeStateByIndex(1, 0);
    // End:0x221
    if(ACLMember.GetLogOnState(ACLMember.selectIndex) > 0)
    {
        // End:0x221
        if(TargetUser != MatchMaker.kUserName)
        {
            CMClanUserList.ChangeStateByIndex(2, 0);
            // End:0x221
            if(rfFriendPosTime.CheckCondition())
            {
                page_Main.TcpChannel.sfReqFriendPosition(TargetUser, 2);
            }
        }
    }
    //return;    
}

function bool ContextMenu_OnClose(GUIContextMenu Sender)
{
    ACLMember.MultiColumnList.bHotTrack = true;
    return true;
    //return;    
}

function ContextMenu_OnSelected(int ContextMenuIndex)
{
    local string TargetUser;

    // End:0x16
    if(ACLMember.selectIndex < 0)
    {
        return;
    }
    TargetUser = ACLMember.GetUserName(ACLMember.selectIndex);
    switch(ContextMenuIndex)
    {
        // End:0x7C
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(ACLMember.GetUserName(ACLMember.selectIndex));
            // End:0x40E
            break;
        // End:0xB1
        case 1:
            bReqClanInfo = true;
            page_Main.TcpChannel.sfReqClanInfo(MatchMaker.kClanName);
            // End:0x40E
            break;
        // End:0x10A
        case 2:
            TPChat.SetEditText(("/w " $ ACLMember.GetUserName(ACLMember.selectIndex)) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x40E
            break;
        // End:0x1D7
        case 3:
            page_Main.StartAutoMove(page_Main.SCIList[page_Main.FindServerChannelInfoIndexByServerIP(ACLMember.GetServerIP(ACLMember.selectIndex), ACLMember.GetServerPort(ACLMember.selectIndex), ACLMember.GetChannelNumber(ACLMember.selectIndex))].ServerID, ACLMember.GetChannelNumber(ACLMember.selectIndex), ACLMember.GetGameRoomNumber(ACLMember.selectIndex), "");
            // End:0x40E
            break;
        // End:0x277
        case 4:
            // End:0x274
            if((CheckInviteUser(ACLMember.GetCurPos(ACLMember.selectIndex), ACLMember.GetCurState(ACLMember.selectIndex), ACLMember.GetUserName(ACLMember.selectIndex))) == true)
            {
                page_Main.TcpChannel.sfReqInviteGameRoom(ACLMember.GetUserName(ACLMember.selectIndex));
            }
            // End:0x40E
            break;
        // End:0x35B
        case 5:
            // End:0x32B
            if((MatchMaker.kInClanGrade == 1) && MatchMaker.kClanMatch_InChannel == false)
            {
                // End:0x32B
                if(1 == page_Main.IsInClanChannel(ACLMember.GetServerIP(ACLMember.selectIndex), ACLMember.GetServerPort(ACLMember.selectIndex), ACLMember.GetChannelNumber(ACLMember.selectIndex)))
                {
                    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 222);
                    return;
                }
            }
            page_Main.TcpChannel.sfReqAdjustClanMemberGrade(MatchMaker.kClanName, TargetUser, 5);
            // End:0x40E
            break;
        // End:0x3A1
        case 6:
            Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 56, TargetUser);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAdjustClanMasterOnOK;
            // End:0x40E
            break;
        // End:0x3D6
        case 7:
            page_Main.TcpChannel.sfReqAdjustClanMemberGrade(MatchMaker.kClanName, TargetUser, 2);
            // End:0x40E
            break;
        // End:0x40B
        case 8:
            page_Main.TcpChannel.sfReqAdjustClanMemberGrade(MatchMaker.kClanName, TargetUser, 3);
            // End:0x40E
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function bool CheckInviteUser(optional int CurPos, optional int CurState, optional string szNickName)
{
    // End:0x37
    if((CurPos == 2) && CurState == 2)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 132, szNickName);
        return false;
    }
    return true;
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageClan::InternalOnClose()");
    Log("[BTPageClan::InternalOnClose] ");
    OnClose(bCanceled);
    //return;    
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    // End:0x29
    if(int(key) == 13)
    {
        TPChat.InputBox.FocusFirst(none);
        return true;
    }
    return false;
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    local float CurrentTime;

    InternalOnPreDraw(C);
    CurrentTime = PlayerOwner().Level.TimeSeconds;
    // End:0x6D
    if((CurrentTime - LastRefreshTime) > RefreshCycleTime)
    {
        page_Main.TcpChannel.sfReqClanUserList(MM.kClanName);
        LastRefreshTime = CurrentTime;
    }
    rfFriendPosTime.Update(PlayerOwner().Level.AppDeltaTime);
    return true;
    //return;    
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageClan_TCP TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageClan_TCP';
    TCP.Owner = self;
    return TCP;
    //return;    
}

function ClearChatLog()
{
    TPChat.ClearAll();
    //return;    
}

function NormalChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatNormal());
    //return;    
}

function ClanChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatClan());
    TPChat.AddChatHistory(1, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatClan());
    //return;    
}

function WhisperChatLog(string cL)
{
    //return;    
}

function SelfChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSelf());
    //return;    
}

function SystemChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    TPChat.AddChatHistory(1, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    TPChat.AddChatHistory(2, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    //return;    
}

function BroadCastItemChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatBroadCastItem());
    //return;    
}

function TeamChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatTeam());
    //return;    
}

function bool rfAckClanUserListStart(int Result, int TotalCount)
{
    // End:0x1A
    if(Result == 0)
    {
        ACLMember.RemoveAll();
    }
    Log((("[BTPageClan::rfAckClanUserListStart] Result=" $ string(Result)) $ " TotalCount=") $ string(TotalCount));
    return true;
    //return;    
}

function bool rfAckClanUserList(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<int> ClanWinCnt, array<int> ClanLoseCnt, array<int> LevelMarkID, array<int> TitleMarkID, array<int> DudeId)
{
    local int i;

    Log("[BTPageClan::rfAckClanUserList]");
    // End:0x49
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    i = 0;
    J0x50:

    // End:0xC0 [Loop If]
    if(i < Level.Length)
    {
        ACLMember.AddClanMember(byte(DudeId[i] != 0), Level[i], CharName[i], ClanGrade[i], LevelMarkID[i], TitleMarkID[i]);
        i++;
        // [Loop Continue]
        goto J0x50;
    }
    return true;
    //return;    
}

function bool rfAckClanUserListEnd()
{
    Log("[BTPageClan::rfAckClanUserListEnd]");
    // End:0x97
    if(((MatchMaker.kInClanGrade == 1) && ACLMember.ACLRowList.Length == 1) && ACLMember.ACLRowList[0].DataPerColumn[1].strValue == MatchMaker.kUserName)
    {
        ListBottomButton[1].EnableMe();
    }
    return true;
    //return;    
}

function bool rfAckClanNews(array<string> IssueDate, array<byte> IssueType, array<string> IssuedClanMember)
{
    local int i, starti;

    Log("[BTPageClan::rfAckClanNews]");
    starti = 0;
    // End:0x43
    if(IssueDate.Length > 11)
    {
        starti = IssueDate.Length - 11;
    }
    ACLClanNews.RemoveAll();
    i = starti;
    J0x5D:

    // End:0xA7 [Loop If]
    if(i < IssueDate.Length)
    {
        ACLClanNews.AddNews(IssueDate[i], IssueType[i], IssuedClanMember[i]);
        i++;
        // [Loop Continue]
        goto J0x5D;
    }
    return true;
    //return;    
}

function bool rfAckClanMatchResultHistory(array<BtrDouble> MatchDate, array<byte> IsWin, array<string> EnemyClanname)
{
    local int i, starti;
    local BtrTime t;

    Log("[BTPageClan::sfAckClanMatchResultHistory]" $ string(MatchDate.Length));
    PlayerOwner().dblog("[BTPageClan::sfAckClanMatchResultHistory]" $ string(MatchDate.Length));
    starti = 0;
    // End:0x9D
    if(MatchDate.Length > 11)
    {
        starti = MatchDate.Length - 11;
    }
    ACLClanWarResult.RemoveAll();
    i = starti;
    J0xB7:

    // End:0x101 [Loop If]
    if(i < MatchDate.Length)
    {
        ACLClanWarResult.addResult(MatchDate[i], IsWin[i], EnemyClanname[i]);
        i++;
        // [Loop Continue]
        goto J0xB7;
    }
    PlayerOwner().dblog("------");
    i = 0;
    J0x11D:

    // End:0x1E9 [Loop If]
    if(i < starti)
    {
        BtrDoubleToBtrTime(MatchDate[i], t);
        PlayerOwner().dblog(((((((((((((string(i) @ string(t.Year)) $ "/") $ string(t.Month)) $ "/") $ string(t.Day)) $ " ") $ string(t.Hour)) $ ":") $ string(t.Minute)) $ ":") $ string(t.Second)) @ string(IsWin[i])) @ EnemyClanname[i]);
        i++;
        // [Loop Continue]
        goto J0x11D;
    }
    PlayerOwner().dblog("------");
    i = starti;
    J0x209:

    // End:0x2D6 [Loop If]
    if(i < MatchDate.Length)
    {
        BtrDoubleToBtrTime(MatchDate[i], t);
        PlayerOwner().dblog(((((((((((((string(i) @ string(t.Year)) $ "/") $ string(t.Month)) $ "/") $ string(t.Day)) $ " ") $ string(t.Hour)) $ ":") $ string(t.Minute)) $ ":") $ string(t.Second)) @ string(IsWin[i])) @ EnemyClanname[i]);
        i++;
        // [Loop Continue]
        goto J0x209;
    }
    PlayerOwner().dblog("------");
    return true;
    //return;    
}

function bool rfAckClanClose(int Result, string ErrMsg, string ClanName)
{
    Log("[BTPageClan::rfAckClanClose]");
    // End:0x46
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowInfoHK");
    BTWindowInfoHK(Controller.TopPage()).SetData(strClanClose[0], 5, strClanClose[2]);
    BTWindowInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowBackToLastPage_OnOK;
    return true;
    //return;    
}

function bool rfAckClanSecession(int Result, string ErrMsg)
{
    Log("[BTPageClan::rfAckClanSecession]");
    // End:0x4A
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowInfoHK");
    BTWindowInfoHK(Controller.TopPage()).SetData(strClanSecession[0], 5, strClanSecession[2]);
    BTWindowInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowBackToLastPage_OnOK;
    return true;
    //return;    
}

function bool rfAckClanChangeInfo(int Result, string ErrMsg)
{
    Log("[BTPageClan::rfAckClanChangeInfo]");
    // End:0x4B
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 47);
    page_Main.TcpChannel.sfReqClanInfo(MatchMaker.kClanName);
    return true;
    //return;    
}

function bool rfAckClanPersonelIntro(int Result, string ErrMsg)
{
    Log("[BTPageClan::rfAckClanPersonelIntro]");
    // End:0x4E
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 48);
    return true;
    //return;    
}

function bool rfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> ClanName, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    local export editinline BTWindowFindClanHK BTWindow;

    Log("[BTPageClan::rfAckSearchClan]");
    // End:0x47
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    BTWindow = BTWindowFindClanHK(Controller.TopPage());
    // End:0xDB
    if(BTWindow != none)
    {
        BTWindow.SetPageLimit(1, TotalPage);
        BTWindow.SetData(TotalPage, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanName, ClanMaster, ClanMember, ClanMemberMax, ClanCreateDate, ClanWin, ClanLose, ClanDraw, ClanRank, ClanRecruit, ClanLevel);
    }
    return true;
    //return;    
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    Log("[BTPageClan::rfAckDBCharInfo]");
    // End:0x1A9
    if(Controller.TopPage() == self)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowUserDetailInfoHK");
        BTWindowUserDetailInfoHK(Controller.TopPage()).SetData(CharName, ClanName, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID, AFSpecialCostumeItemID, RSASpecialCostumeItemID, stCharInfo);
        BTWindowUserDetailInfoHK(Controller.TopPage()).SetClanInfo(ClanName, CM_Pattern, CM_BG, CM_BL, ClanLevel);
        BTWindowUserDetailInfoHK(Controller.TopPage()).SetSelfIntro(ClanPersonIntro);
        // End:0x15F
        if((ClanName == "none") || ClanName == "")
        {
            BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.DisableMe();            
        }
        else
        {
            BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.EnableMe();
            BTWindowUserDetailInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowUserDetailInfoHK_OnClanInfo;
        }
    }
    return true;
    //return;    
}

function bool BTWindowUserDetailInfoHK_OnClanInfo(GUIComponent Sender)
{
    local string ClanName;

    ClanName = BTWindowUserDetailInfoHK(Controller.TopPage()).ClanName;
    Controller.TopPage().FadeOut(false, true);
    TcpChannel.sfReqClanInfo(ClanName);
    return true;
    //return;    
}

function bool rfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    Log("[BTPageClan::rfAckClanCharPersonelIntro]");
    // End:0x52
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowSelfIntroductionChangeHK");
    BTWindowSelfIntroductionChangeHK(Controller.TopPage()).SetData(PersonelIntro);
    BTWindowSelfIntroductionChangeHK(Controller.TopPage()).__OnOK__Delegate = BTWindowSelfIntroductionChangeHK_OnOK;
    return true;
    //return;    
}

function bool rfAckAdjustClanMemberGrade(int Result, string ErrMsg, string ClanName, string CharName, byte CharGrade)
{
    Log("[BTPageClan::rfAckAdjustClanMemberGrade]");
    // End:0x52
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x70
    if(int(CharGrade) == 1)
    {
        MatchMaker.kInClanGrade = 3;
    }
    // End:0x9E
    if(MatchMaker.kUserName == CharName)
    {
        MatchMaker.kInClanGrade = int(CharGrade);
    }
    RefreshPage();
    return true;
    //return;    
}

function bool rfAckNotifyAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    Log("[BTPageClan::rfAckNotifyAdjustClanMemberGrade]");
    // End:0x78
    if(int(CharGrade) != 5)
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(55, CharName, strClanGrade[int(CharGrade)]), 5, true);        
    }
    else
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(58, CharName), 5, true);
    }
    // End:0x12D
    if(MatchMaker.kUserName == CharName)
    {
        // End:0x117
        if(int(CharGrade) == 5)
        {
            MatchMaker.kInClanGrade = 0;
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 58, CharName);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowBackToLastPage_OnOK;            
        }
        else
        {
            MatchMaker.kInClanGrade = int(CharGrade);
        }
    }
    RefreshPage();
    return true;
    //return;    
}

function bool rfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    Log("[BTPageClan::rfReqRecvClanInvite]");
    // End:0x44
    if(bReqClanInfo)
    {
        bDelayClanInvite = true;
        DelayClanName = ClanName;        
    }
    else
    {
        bClanInviteState = true;
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
    }
    return false;
    //return;    
}

function bool rfAckChatWispher(int Result, string ErrMsg, string ToCharName)
{
    Log("[BTPageLobby::rfAckChatWispher]");
    // End:0x5A
    if(Result == 252)
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(76, ToCharName), 5, true);        
    }
    else
    {
        // End:0x91
        if(Result == 182)
        {
            page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(77, ToCharName), 5, true);            
        }
        else
        {
            // End:0xB5
            if(Result != 0)
            {
                Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckNotifyUpdateCharInfo_LevelMark(string CharName, int LevelMarkID)
{
    Log((("[BTPageClan::rfAckNotifyUpdateCharInfo_LevelMark] CharName = " $ CharName) $ ", LevelMarkID=") $ string(LevelMarkID));
    ACLMember.ChangeLevelMarkID(CharName, LevelMarkID);
    return true;
    //return;    
}

function UpdateRecv_ClanInfo(BTNetMainMenu MainMenu)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageClan::UpdateRecv_ClanInfo]");
    // End:0xE3
    if(bReqClanInfo)
    {
        Log("bReqClanInfo=On");
        Controller.OpenMenu("GUIWarfareControls.BTWindowClanInfoHK");
        BTWindowClanInfoHK(Controller.TopPage()).SetData(MainMenu.kRecvClanInfo);
        bReqClanInfo = false;
        // End:0xE1
        if(bDelayClanInvite)
        {
            bDelayClanInvite = false;
            bClanInviteState = true;
            page_Main.TcpChannel.sfReqClanInfo(DelayClanName);
        }
        return;
    }
    // End:0x144
    if(bClanInviteState)
    {
        Log("bClanInviteState=On");
        BTWindow = BTWindowRequestClanHK(Controller.TopPage());
        BTWindow.SetClanInfo(MainMenu.kRecvClanInfo);
        bClanInviteState = false;
        return;
    }
    //return;    
}

function bool rfAckFriendPosition(int Result, string TargetCharName, byte ServerType, string fServername, string fServerShortName, string fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, string ChannelNickName, int GameRoomNum)
{
    local int iRowIndex;
    local bool bPlaying;

    // End:0x331
    if(Result == 0)
    {
        iRowIndex = ACLMember.selectIndex;
        switch(CurPos)
        {
            // End:0x47
            case 1:
                ACLMember.SetCurLocationName(iRowIndex, ChannelNickName);
                // End:0x76
                break;
            // End:0x73
            case 2:
                ACLMember.SetCurLocationName(iRowIndex, (ChannelNickName $ "/") $ string(GameRoomNum));
            // End:0xFFFF
            default:
                break;
        }
        // End:0xA0
        if(int(CurPos) == 2)
        {
            ACLMember.SetGameRoomNumber(iRowIndex, GameRoomNum);            
        }
        else
        {
            ACLMember.SetGameRoomNumber(iRowIndex, -1);
        }
        ACLMember.SetServerIP(iRowIndex, fServerIP);
        ACLMember.SetServerPort(iRowIndex, fServerPort);
        // End:0x111
        if(int(CurPos) == 0)
        {
            ACLMember.SetServerName(iRowIndex, "");            
        }
        else
        {
            ACLMember.SetServerName(iRowIndex, fServername);
        }
        ACLMember.SetChannelNumber(iRowIndex, ChannelNum);
        ACLMember.SetCurState(iRowIndex, int(CurState));
        bPlaying = (int(CurPos) == 2) && int(CurState) == 2;
        // End:0x1AB
        if(bPlaying == true)
        {
            BTCMMessengerOnOffline(ACLMember.ContextMenu).SetLogOnState(2);
        }
        BTCMMessengerOnOffline(ACLMember.ContextMenu).SetLocation(ChannelNickName, GameRoomNum);
        // End:0x229
        if(MM.kRoomID == GameRoomNum)
        {
            BTCMMessengerOnOffline(ACLMember.ContextMenu).ChangeMoveRoomState(false);
            BTCMMessengerOnOffline(ACLMember.ContextMenu).ChangeInviteState(false);            
        }
        else
        {
            // End:0x28A
            if(MM.kRoomID < 0)
            {
                BTCMMessengerOnOffline(ACLMember.ContextMenu).ChangeInviteState(false);
                // End:0x287
                if(int(CurPos) == 2)
                {
                    BTCMMessengerOnOffline(ACLMember.ContextMenu).ChangeMoveRoomState(true);
                }                
            }
            else
            {
                // End:0x31E
                if(int(CurPos) >= 1)
                {
                    // End:0x2C4
                    if(bPlaying == true)
                    {
                        BTCMMessengerOnOffline(ACLMember.ContextMenu).ChangeInviteState(false);                        
                    }
                    else
                    {
                        BTCMMessengerOnOffline(ACLMember.ContextMenu).ChangeInviteState(true);
                    }
                    BTCMMessengerOnOffline(ACLMember.ContextMenu).ChangeMoveRoomState(true);
                    BTCMMessengerOnOffline(ACLMember.ContextMenu).ChangeWispherState(true);
                }
            }
        }
        CMClanUserList.ChangeStateByIndex(5, 0);
    }
    return true;
    //return;    
}

function Internal_OnRendered(Canvas Canvas)
{
    local string strApplyTooltip;
    local int i;

    i = 0;
    J0x07:

    // End:0xE0 [Loop If]
    if(i < 15)
    {
        // End:0xD6
        if(CheckInFloatBox(fbLabel[i], Controller.MouseX, Controller.MouseY, 1.0000000, Canvas.GetClientHeightRatio()))
        {
            strApplyTooltip = strToolTip[i];
            // End:0xD6
            if(strApplyTooltip != "")
            {
                btToolTip.OriginalString.Text = strApplyTooltip;
                btToolTip.AWinPos = GetTooltipPosFinal(0, 0, 12.0000000, 19.0000000);
                btToolTip.bNeedUpdate = true;
                btToolTip.Render(Canvas);
                // [Explicit Break]
                goto J0xE0;
            }
        }
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    J0xE0:

    super.Internal_OnRendered(Canvas);
    //return;    
}

defaultproperties
{
    fbPanelBackground[0]=(X1=10.0000000,Y1=87.0000000,X2=762.0000000,Y2=499.0000000)
    fbPanelBackground[1]=(X1=773.0000000,Y1=89.0000000,X2=1015.0000000,Y2=736.0000000)
    strClanSecession[0]="Leave Clan"
    strClanSecession[1]="Leave the clan?"
    strClanSecession[2]="You have left the clan. Returning to the previous page."
    strClanClose[0]="Disband Clan"
    strClanClose[1]="Disband the clan? You cannot restore the clan once it has been disbanded."
    strClanClose[2]="You have disbanded the clan. Returning to the previous page."
    RefreshCycleTime=30.0000000
    fbLabelClanMark=(X1=11.0000000,Y1=7.0000000,X2=77.0000000,Y2=73.0000000)
    fbLabelClanName=(X1=87.0000000,Y1=27.0000000,X2=288.0000000,Y2=52.0000000)
    strLabel[0]="Master"
    strLabel[1]="Records"
    strLabel[2]="Activity (m)"
    strLabel[3]="A. Rank (m)"
    strLabel[4]="Grade"
    strLabel[5]="EXP"
    strLabel[6]="Rank"
    strLabel[7]="Rank (m)"
    strLabel[8]="Region"
    strLabel[9]="Players"
    strLabel[10]="Status"
    strLabel[11]="History"
    strLabel[12]="Keywords"
    strLabel[13]="Intro"
    strLabel[14]="Notice"
    fbLabel[0]=(X1=21.0000000,Y1=102.0000000,X2=89.0000000,Y2=122.0000000)
    fbLabel[1]=(X1=222.0000000,Y1=102.0000000,X2=290.0000000,Y2=122.0000000)
    fbLabel[2]=(X1=21.0000000,Y1=134.0000000,X2=89.0000000,Y2=154.0000000)
    fbLabel[3]=(X1=222.0000000,Y1=134.0000000,X2=290.0000000,Y2=154.0000000)
    fbLabel[4]=(X1=21.0000000,Y1=165.0000000,X2=89.0000000,Y2=185.0000000)
    fbLabel[5]=(X1=222.0000000,Y1=165.0000000,X2=290.0000000,Y2=185.0000000)
    fbLabel[6]=(X1=21.0000000,Y1=197.0000000,X2=89.0000000,Y2=217.0000000)
    fbLabel[7]=(X1=222.0000000,Y1=197.0000000,X2=290.0000000,Y2=217.0000000)
    fbLabel[8]=(X1=21.0000000,Y1=229.0000000,X2=89.0000000,Y2=249.0000000)
    fbLabel[9]=(X1=222.0000000,Y1=229.0000000,X2=290.0000000,Y2=249.0000000)
    fbLabel[10]=(X1=21.0000000,Y1=261.0000000,X2=89.0000000,Y2=281.0000000)
    fbLabel[11]=(X1=222.0000000,Y1=261.0000000,X2=290.0000000,Y2=281.0000000)
    fbLabel[12]=(X1=21.0000000,Y1=293.0000000,X2=89.0000000,Y2=313.0000000)
    fbLabel[13]=(X1=21.0000000,Y1=323.0000000,X2=89.0000000,Y2=384.0000000)
    fbLabel[14]=(X1=21.0000000,Y1=388.0000000,X2=89.0000000,Y2=449.0000000)
    strNoRankState="None"
    fbEdit[0]=(X1=91.0000000,Y1=95.0000000,X2=207.0000000,Y2=122.0000000)
    fbEdit[1]=(X1=292.0000000,Y1=95.0000000,X2=408.0000000,Y2=122.0000000)
    fbEdit[2]=(X1=91.0000000,Y1=127.0000000,X2=207.0000000,Y2=154.0000000)
    fbEdit[3]=(X1=292.0000000,Y1=127.0000000,X2=408.0000000,Y2=154.0000000)
    fbEdit[4]=(X1=91.0000000,Y1=158.0000000,X2=207.0000000,Y2=185.0000000)
    fbEdit[5]=(X1=292.0000000,Y1=158.0000000,X2=408.0000000,Y2=185.0000000)
    fbEdit[6]=(X1=91.0000000,Y1=190.0000000,X2=207.0000000,Y2=217.0000000)
    fbEdit[7]=(X1=292.0000000,Y1=190.0000000,X2=408.0000000,Y2=217.0000000)
    fbEdit[8]=(X1=91.0000000,Y1=222.0000000,X2=207.0000000,Y2=249.0000000)
    fbEdit[9]=(X1=292.0000000,Y1=222.0000000,X2=408.0000000,Y2=249.0000000)
    fbEdit[10]=(X1=91.0000000,Y1=254.0000000,X2=207.0000000,Y2=281.0000000)
    fbEdit[11]=(X1=292.0000000,Y1=254.0000000,X2=408.0000000,Y2=281.0000000)
    fbEdit[12]=(X1=91.0000000,Y1=286.0000000,X2=408.0000000,Y2=313.0000000)
    fbEdit[13]=(X1=91.0000000,Y1=330.0000000,X2=408.0000000,Y2=384.0000000)
    fbEdit[14]=(X1=91.0000000,Y1=395.0000000,X2=408.0000000,Y2=449.0000000)
    strEdit[1]="%0 W / %1 L"
    strEdit[2]="Place: %0"
    strEdit[8]="Place: %0"
    strEdit[9]="%0 / %1"
    strEdit[10]="%0 year(s), %1 day(s)"
    fbButtonTop[0]=(X1=420.0000000,Y1=89.0000000,X2=454.0000000,Y2=115.0000000)
    fbButtonTop[1]=(X1=454.0000000,Y1=89.0000000,X2=575.0000000,Y2=115.0000000)
    fbButtonTop[2]=(X1=575.0000000,Y1=89.0000000,X2=638.0000000,Y2=115.0000000)
    fbButtonTop[3]=(X1=638.0000000,Y1=89.0000000,X2=760.0000000,Y2=115.0000000)
    strButtonTop[0]="Lv."
    strButtonTop[1]="Name"
    strButtonTop[2]="Rank"
    strButtonTop[3]="Location"
    fbACLMember=(X1=420.0000000,Y1=116.0000000,X2=745.0000000,Y2=455.0000000)
    fbLabelClanNews=(X1=774.0000000,Y1=89.0000000,X2=1013.0000000,Y2=116.0000000)
    strLabelClanNews="Clan News"
    fbACLClanNews=(X1=774.0000000,Y1=116.0000000,X2=1013.0000000,Y2=402.0000000)
    fbLabelClanWarResult=(X1=774.0000000,Y1=411.0000000,X2=1013.0000000,Y2=438.0000000)
    strLabelClanWarResult="Clan Battle Results"
    fbACLClanWarResult=(X1=774.0000000,Y1=438.0000000,X2=1013.0000000,Y2=724.0000000)
    fbListBottomButton[0]=(X1=16.0000000,Y1=460.0000000,X2=136.0000000,Y2=493.0000000)
    fbListBottomButton[1]=(X1=140.0000000,Y1=460.0000000,X2=260.0000000,Y2=493.0000000)
    fbListBottomButton[2]=(X1=264.0000000,Y1=460.0000000,X2=384.0000000,Y2=493.0000000)
    fbListBottomButton[3]=(X1=388.0000000,Y1=460.0000000,X2=508.0000000,Y2=493.0000000)
    fbListBottomButton[4]=(X1=512.0000000,Y1=460.0000000,X2=632.0000000,Y2=493.0000000)
    fbListBottomButton[5]=(X1=636.0000000,Y1=460.0000000,X2=756.0000000,Y2=493.0000000)
    strListBottomButton[0]="Leave Clan"
    strListBottomButton[1]="Disband Clan"
    strListBottomButton[2]="Clan Search"
    strListBottomButton[3]="Clan Cafe"
    strListBottomButton[4]="Change Info"
    strListBottomButton[5]="Change Intro"
    fbTPChat=(X1=10.0000000,Y1=504.0000000,X2=761.0000000,Y2=735.0000000)
    bPersistent=false
    OnOpen=BTPageClan.InternalOnOpen
    OnReOpen=BTPageClan.InternalOnReOpen
    OnClose=BTPageClan.InternalOnClose
    OnKeyEvent=BTPageClan.internalKeyEvent
}