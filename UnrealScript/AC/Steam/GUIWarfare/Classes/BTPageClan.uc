/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageClan.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:52
 *	Functions:55
 *
 *******************************************************************************/
class BTPageClan extends BTNetGUIPageHK
    dependson(BTPageClan_TCP)
    editinlinenew
    instanced;

var bool bReqClanInfo;
var bool bDelayClanInvite;
var bool bClanInviteState;
var string DelayClanName;
var BTRefreshTime rfFriendPosTime;
var ClanInfo ClanInfo;
var localized string strRecord;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbPanelBackground[2];
var export editinline BTOwnerDrawImageHK PanelBackground[2];
var localized string strClanSecession[3];
var localized string strClanClose[3];
var transient wMatchMaker MatchMaker;
var float LastRefreshTime;
var float RefreshCycleTime;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelClanMark;
var export editinline BTLabelClanMarkHK LabelClanMark;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelClanName;
var export editinline BTOwnerDrawImageHK LabelClanName;
var localized string strLabel[15];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel[15];
var export editinline BTOwnerDrawImageHK Label[15];
var localized string strNoRankState;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbEdit[15];
var localized string strEdit[15];
var export editinline BTOwnerDrawTextArrayHK Edit[15];
var export editinline BTMultiLineEditBoxHK ClanIntroduction;
var export editinline BTMultiLineEditBoxHK ClanNotice;
var string strClanNotice;
var export editinline BTAutoScrollListHK ClanIntroduction2;
var export editinline BTAutoScrollListHK ClanNotice2;
var export editinline BTOwnerDrawImageHK LabelTop[4];
var FloatBox fbButtonTop[4];
var localized string strButtonTop[4];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTop[4];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbACLMember;
var export editinline BTACLClanMemberHK ACLMember;
var export editinline BTCMClanUserListHK CMClanUserList;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelClanNews;
var localized string strLabelClanNews;
var export editinline BTOwnerDrawImageHK LabelClanNews;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbACLClanNews;
var export editinline BTACLClanNewsHK ACLClanNews;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelClanWarResult;
var localized string strLabelClanWarResult;
var export editinline BTOwnerDrawImageHK LabelClanWarResult;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbACLClanWarResult;
var export editinline BTACLClanWarResultHK ACLClanWarResult;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbListBottomButton[6];
var localized string strListBottomButton[6];
var export editinline BTOwnerDrawCaptionButtonHK ListBottomButton[6];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPChat;
var export editinline BTTPChatHK TPChat;

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x39
        case 0:
            page_Main.SetPage(23, true);
            // End:0x1a6
            break;
        // End:0x52
        case 1:
            page_Main.SetPage(20, true);
            // End:0x1a6
            break;
        // End:0x6c
        case 2:
            page_Main.SetPage(21, true);
            // End:0x1a6
            break;
        // End:0x86
        case 3:
            page_Main.SetPage(22, true);
            // End:0x1a6
            break;
        // End:0xa0
        case 4:
            page_Main.SetPage(18, true);
            // End:0x1a6
            break;
        // End:0xa8
        case 5:
            // End:0x1a6
            break;
        // End:0xb0
        case 6:
            // End:0x1a6
            break;
        // End:0xb8
        case 7:
            // End:0x1a6
            break;
        // End:0xcf
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x1a6
            break;
        // End:0x10b
        case 9:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x1a6
            break;
        // End:0x152
        case 10:
            PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
            page_Main.SetPage(1, true);
            // End:0x1a6
            break;
        // End:0x195
        case 11:
            Controller.OpenMenu("GuiWarfareControls.BTWindowBTTPQuestInfoHK");
            // End:0x1a6
            break;
        // End:0x1a3
        case 20:
            OpenTodayResultPage();
            // End:0x1a6
            break;
        // End:0xffff
        default:
            return true;
    }
}

function bool ListBottomButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0xac
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
        // End:0x24d
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
            BTWindowClanInfoChangeHK(Controller.TopPage()).SetData(ClanInfo.Region, ClanInfo.IsRecruit, ClanInfo.Keyword, ClanInfo.Intro, strClanNotice, MatchMaker.kInClanGrade);
            BTWindowClanInfoChangeHK(Controller.TopPage()).__OnOK__Delegate = BTWindowClanInfoChangeHK_OnOK;
            // End:0x358
            break;
        // End:0x355
        case 5:
            page_Main.TcpChannel.sfReqClanCharPersonelIntro(MatchMaker.kClanName, MatchMaker.kUserName);
            // End:0x358
            break;
        // End:0xffff
        default:
            return true;
    }
}

function bool BTWindowFindClanHK_OnRequestJoin(GUIComponent Sender)
{
    return true;
}

function bool BTWindowFindClanHK_OnInfo(GUIComponent Sender)
{
    local string ClanName;

    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x93
    if(ClanName != "none" && ClanName != "")
    {
        // End:0x6e
        if(bDelayClanInvite || bClanInviteState)
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 56);
            return true;
        }
        bReqClanInfo = true;
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
    }
    return true;
}

function bool BTWindowSelfIntroductionChangeHK_OnOK(GUIComponent Sender)
{
    local string strSelfIntro;

    Log("[BTPageClan::BTWindowSelfIntroductionChangeHK_OnOK]");
    strSelfIntro = BTWindowSelfIntroductionChangeHK(Controller.TopPage()).SelfIntroduction.TextStr;
    TcpChannel.sfReqClanPersonelIntro(MatchMaker.kClanName, MatchMaker.kUserName, strSelfIntro);
    Controller.CloseMenu(false);
    return true;
}

function bool BTWindowClanInfoChangeHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowClanInfoChangeHK BTWindow;

    Log("[BTPageClan::BTWindowClanInfoChangeHK_OnOK]");
    BTWindow = BTWindowClanInfoChangeHK(Sender);
    page_Main.TcpChannel.sfReqClanChangeInfo(MatchMaker.kClanName, byte(BTWindow.ClanRecruit.ComboBox.GetIndex()), byte(BTWindow.ClanLocation.ComboBox.GetIndex()), BTWindow.ClanKeyword.TextStr, BTWindow.ClanIntroduction.TextStr, BTWindow.ClanNotice.TextStr);
    Controller.CloseMenu(false);
    return true;
}

function bool BTWindowClanSecession_OnOK(GUIComponent Sender)
{
    Log("[BTPageClan::BTWindowClanSecession_OnOK]");
    page_Main.TcpChannel.sfReqClanSecession(MatchMaker.kClanName);
    page_Main.TcpChannel.sfReqCharInfo();
    page_Main.TcpChannel.sfReqChannelUserList(MatchMaker.kChannelID, 0, 100);
    Controller.CloseMenu(false);
    return true;
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
}

function bool BTWindowBackToLastPage_OnOK(GUIComponent Sender)
{
    Log("[BTPageClan::BTWindowBackToLastPage_OnOK]");
    page_Main.TcpChannel.sfReqCharInfo();
    Controller.CloseMenu(false);
    PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
    page_Main.SetPage(1, true);
    return true;
}

function bool BTWindowAdjustClanMasterOnOK(GUIComponent Sender)
{
    local string TargetUser;

    Controller.CloseMenu(false);
    TargetUser = ACLMember.GetUserName(ACLMember.selectIndex);
    page_Main.TcpChannel.sfReqAdjustClanMemberGrade(MatchMaker.kClanName, TargetUser, 1);
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    Log("[BTPageClan::InitComponent]");
    super.InitComponent(MyController, myOwner);
    NewBackground = NewLabelComponent(fbNewBackground, class'BTUIResourcePoolHK'.default.new_Page_Thema, 0.000130);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    LabelRoomName.SetVisibility(false);
    LabelClanMark = BTLabelClanMarkHK(NewComponent(new class'BTLabelClanMarkHK', fbLabelClanMark, 1.0));
    LabelTitle.bVisible = false;
    LabelClanName = NewLabelComponent(fbLabelClanName, class'BTUIResourcePoolHK'.default.empty);
    LabelClanName.CaptionDrawType = 0;
    LabelClanName.SetFontSizeAll(17);
    LabelClanName.SetFontColorAll(class'BTUIColorPoolHK'.static.ClanName());
    LabelClanName.Caption = "";
    i = 0;
    J0x123:
    // End:0x164 [While If]
    if(i < 2)
    {
        PanelBackground[i] = NewLabelComponent(fbPanelBackground[i], class'BTUIResourcePoolHK'.default.panel_1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x123;
    }
    i = 0;
    J0x16b:
    // End:0x1e3 [While If]
    if(i < 15)
    {
        Label[i] = NewLabelComponent(fbLabel[i], class'BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x16b;
    }
    i = 0;
    J0x1ea:
    // End:0x60b [While If]
    if(i < 15)
    {
        // End:0x253
        if(i == 8)
        {
            Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new class'BTLabelLocationHK', fbEdit[i]));
            Edit[i].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
        }
        // End:0x2fe
        else
        {
            // End:0x2b0
            if(i == 10)
            {
                Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new class'BTLabelRecruitHK', fbEdit[i]));
                Edit[i].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
            }
            // End:0x2fe
            else
            {
                Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new class'BTOwnerDrawTextArrayHK', fbEdit[i]));
                Edit[i].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
            }
        }
        // End:0x481
        if(i == 13)
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
        // End:0x601
        else
        {
            // End:0x601
            if(i == 14)
            {
                ClanNotice = BTMultiLineEditBoxHK(NewComponent(new class'BTMultiLineEditBoxHK', class'BTCustomDrawHK'.static.MakeResizeBox(fbEdit[i], -4, -6)));
                ClanNotice.bReadOnly = true;
                ClanNotice.bActiveCursor = false;
                fb = fbEdit[i];
                fb.Y1 += float(1);
                fb.Y2 -= float(1);
                fb.X2 -= float(15);
                ClanNotice2 = BTAutoScrollListHK(NewComponent(new class'BTAutoScrollListHK', fb));
                ClanNotice2.MultiColumnList.MyScrollBar.bUseAWinPos = true;
                ClanNotice2.MultiColumnList.MyScrollBar.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 0.0, 0.0, 0.0);
                ClanNotice2.MultiColumnList.MyScrollBar.ApplyAWinPos();
                ClanNotice2.bAutoShowScrollBar = true;
                ClanNotice2.SelectImage = class'BTUIResourcePoolHK'.default.empty;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1ea;
    }
    i = 0;
    J0x612:
    // End:0x6c5 [While If]
    if(i < 6)
    {
        ListBottomButton[i] = NewButtonComponent(fbListBottomButton[i]);
        ListBottomButton[i].SetDefaultButtonImage();
        ListBottomButton[i].SetFontSizeAll(12);
        ListBottomButton[i].ButtonID = i;
        ListBottomButton[i].Caption = strListBottomButton[i];
        ListBottomButton[i].__OnClick__Delegate = ListBottomButton_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x612;
    }
    ListBottomButton[3].DisableMe();
    i = 0;
    J0x6de:
    // End:0x84e [While If]
    if(i < 4)
    {
        ButtonTop[i] = new class'BTOwnerDrawCaptionButtonHK';
        ButtonTop[i].bUseAWinPos = true;
        ButtonTop[i].AWinPos = fbButtonTop[i];
        ButtonTop[i].buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_list_on;
        ButtonTop[i].buttonImage[3] = class'BTUIResourcePoolHK'.default.butt_list_cli;
        ButtonTop[i].RenderWeight = 0.20;
        ButtonTop[i].SetFontSizeAll(9);
        ButtonTop[i].SetDefaultListTopButtonFontColor();
        ButtonTop[i].Caption = strButtonTop[i];
        ButtonTop[i].CaptionDrawType = 4;
        ButtonTop[i].ButtonID = i;
        ButtonTop[i].InitComponent(Controller, self);
        AppendComponent(ButtonTop[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6de;
    }
    i = 0;
    J0x855:
    // End:0x9e7 [While If]
    if(i < 4 - 1)
    {
        LabelTop[i] = new class'BTOwnerDrawImageHK';
        LabelTop[i].bUseAWinPos = true;
        LabelTop[i].AWinPos.X1 = ButtonTop[i].AWinPos.X2 - float(2);
        LabelTop[i].AWinPos.Y1 = ButtonTop[i].AWinPos.Y1 + float(5);
        LabelTop[i].AWinPos.X2 = ButtonTop[i].AWinPos.X2 + float(2);
        LabelTop[i].AWinPos.Y2 = ButtonTop[i].AWinPos.Y2 - float(5);
        LabelTop[i].BackgroundImage = class'BTUIResourcePoolHK'.default.img_list_divid;
        LabelTop[i].RenderWeight = 0.190;
        LabelTop[i].InitComponent(Controller, self);
        AppendComponent(LabelTop[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x855;
    }
    LabelTop[4 - 1] = new class'BTOwnerDrawImageHK';
    LabelTop[4 - 1].bUseAWinPos = true;
    LabelTop[4 - 1].AWinPos.X1 = ButtonTop[0].AWinPos.X1;
    LabelTop[4 - 1].AWinPos.Y1 = ButtonTop[0].AWinPos.Y1;
    LabelTop[4 - 1].AWinPos.X2 = ButtonTop[4 - 1].AWinPos.X2;
    LabelTop[4 - 1].AWinPos.Y2 = ButtonTop[4 - 1].AWinPos.Y2;
    LabelTop[4 - 1].BackgroundImage = class'BTUIResourcePoolHK'.default.butt_list_n;
    LabelTop[4 - 1].RenderWeight = 0.10;
    LabelTop[4 - 1].InitComponent(Controller, self);
    AppendComponent(LabelTop[4 - 1]);
    ACLMember = BTACLClanMemberHK(NewComponent(new class'BTACLClanMemberHK', fbACLMember));
    CMClanUserList = new class'BTCMClanUserListHK';
    CMClanUserList.InitComponent(self.Controller, none);
    CMClanUserList.__OnOpen__Delegate = ContextMenu_OnOpen;
    CMClanUserList.__OnClose__Delegate = ContextMenu_OnClose;
    CMClanUserList.__OnSelected__Delegate = ContextMenu_OnSelected;
    ACLMember.ContextMenu = CMClanUserList;
    LabelClanNews = NewLabelComponent(fbLabelClanNews, class'BTUIResourcePoolHK'.default.butt_list_n);
    LabelClanNews.Caption = strLabelClanNews;
    LabelClanNews.CaptionDrawType = 3;
    LabelClanNews.CaptionPadding[0] = 10;
    LabelClanNews.SetFontSizeAll(12);
    ACLClanNews = BTACLClanNewsHK(NewComponent(new class'BTACLClanNewsHK', fbACLClanNews));
    LabelClanWarResult = NewLabelComponent(fbLabelClanWarResult, class'BTUIResourcePoolHK'.default.butt_list_n);
    LabelClanWarResult.Caption = strLabelClanWarResult;
    LabelClanWarResult.CaptionDrawType = 3;
    LabelClanWarResult.CaptionPadding[0] = 10;
    LabelClanWarResult.SetFontSizeAll(12);
    ACLClanWarResult = BTACLClanWarResultHK(NewComponent(new class'BTACLClanWarResultHK', fbACLClanWarResult));
    ACLClanNews.MultiColumnBox.MyList.MyScrollBar.AWinPos.X1 = 1024.0;
    ACLClanNews.MultiColumnBox.MyList.MyScrollBar.AWinPos.X2 = 1024.0;
    ACLClanNews.MultiColumnBox.MyList.MyScrollBar.AWinPos.Y1 = 768.0;
    ACLClanNews.MultiColumnBox.MyList.MyScrollBar.AWinPos.Y2 = 768.0;
    ACLClanNews.MultiColumnBox.MyList.MyScrollBar.ApplyAWinPos();
    ACLClanWarResult.MultiColumnBox.MyList.MyScrollBar.AWinPos.X1 = 1024.0;
    ACLClanWarResult.MultiColumnBox.MyList.MyScrollBar.AWinPos.X2 = 1024.0;
    ACLClanWarResult.MultiColumnBox.MyList.MyScrollBar.AWinPos.Y1 = 768.0;
    ACLClanWarResult.MultiColumnBox.MyList.MyScrollBar.AWinPos.Y2 = 768.0;
    ACLClanWarResult.MultiColumnBox.MyList.MyScrollBar.ApplyAWinPos();
    TPChat = BTTPChatHK(NewComponent(new class'BTTPChatHK', fbTPChat));
    page_Main.TPChat = TPChat;
    TPChat.InputBox.__OnChat__Delegate = page_Main.Internal_OnChat;
    TPChat.InputBox.__OnInputTab__Delegate = page_Main.TPChat_OnInputTab;
    TPChat.InputBox.__OnInputSpace__Delegate = page_Main.TPChat_OnInputSpace;
    TPChat.__OnChageChatMode__Delegate = page_Main.TPChat_OnChageChatMode;
    TPChat.__ChangeTab_OnClick__Delegate = page_Main.TPChat_ChangeTab_OnClickTemp;
    TPChat.InputBox.__OnFunctionKey__Delegate = page_Main.Internal_OnFunctionKey;
    rfFriendPosTime = new class'BTRefreshTime';
    rfFriendPosTime.SetMaxTime(1.50);
    LastRefreshTime = PlayerOwner().Level.TimeSeconds;
    Controller.PushPage();
}

function InternalOnReOpen()
{
    UnresolvedNativeFunction_97("BTPageClan::InternalOnReOpen()");
    Log("[BTPageClan::InternalOnReOpen] Start");
    Log("[BTPageClan::InternalOnReOpen] End");
}

function InternalOnOpen()
{
    UnresolvedNativeFunction_97("BTPageClan::InternalOnOpen()");
    Log("[BTPageClan::InternalOnOpen] Start");
    Log("[BTPageClan::InternalOnOpen] End");
}

function OnCompleteOpened()
{
    Log("[BTPageClan::OnCompleteOpened] Start");
    Controller.PushPage();
    RefreshPage();
    Log("[BTPageClan::OnCompleteOpened] End");
}

function UpdateClanInfo(wMatchMaker MM)
{
    Log("[BTPageClan::UpdateClanInfo]");
    ClanInfo = page_Main.MyClanInfo;
    LabelClanName.Caption = MM.kClanName;
    LabelClanMark.SetData(MM.kClanPattern, MM.kClanBG, MM.kClanBL, true);
    Edit[0].SetData(ClanInfo.ClanMasterCharname);
    Edit[1].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[1], string(ClanInfo.ClanWin), string(ClanInfo.ClanLose)));
    Edit[2].SetData(string(ClanInfo.ClanActivity));
    // End:0x12d
    if(ClanInfo.ClanActivityRank == 0)
    {
        Edit[3].SetData(strNoRankState);
    }
    // End:0x162
    else
    {
        Edit[3].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[2], string(ClanInfo.ClanActivityRank)));
    }
    Edit[4].SetData(GameMgr.GetClanLevelName(ClanInfo.ClanLevel));
    Edit[5].SetData(string(ClanInfo.ClanExp) $ "/" $ string(GameMgr.GetClanEndExp(ClanInfo.ClanLevel)));
    // End:0x1f7
    if(ClanInfo.tRankCur == 0)
    {
        Edit[6].SetData(strNoRankState);
    }
    // End:0x22c
    else
    {
        Edit[6].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[2], string(ClanInfo.tRankCur)));
    }
    // End:0x256
    if(ClanInfo.mRankCur == 0)
    {
        Edit[7].SetData(strNoRankState);
    }
    // End:0x28b
    else
    {
        Edit[7].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[8], string(ClanInfo.mRankCur)));
    }
    BTLabelLocationHK(Edit[8]).SetLocationID(ClanInfo.Region);
    Edit[9].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[9], string(ClanInfo.MemberCnt), string(ClanInfo.MemberTotal)));
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
}

function InitializeDelegate()
{
    MM.__UpdateClanInfo__Delegate = UpdateClanInfo;
    page_Main.__UpdateRecv_ClanInfo__Delegate = UpdateRecv_ClanInfo;
}

function UnInitializeDelegate()
{
    MM.__UpdateClanInfo__Delegate = None;
    page_Main.__UpdateRecv_ClanInfo__Delegate = None;
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
    // End:0x288
    else
    {
        ListBottomButton[0].EnableMe();
        ListBottomButton[4].DisableMe();
    }
    // End:0x2bf
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
}

function OnPopupCheck()
{
    local int i, TargetGrade;
    local string TargetUser;

    TargetUser = ACLMember.GetUserName(ACLMember.selectIndex);
    TargetGrade = ACLMember.GetUserGrade(ACLMember.selectIndex);
    i = 0;
    J0x4d:
    // End:0x79 [While If]
    if(i < 9)
    {
        CMClanUserList.ChangeStateByIndex(i, 1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4d;
    }
    // End:0xc0
    if(MM.kUserName == ACLMember.GetUserName(ACLMember.selectIndex))
    {
        CMClanUserList.SetLogOnState(-1);
    }
    // End:0xec
    else
    {
        CMClanUserList.SetLogOnState(ACLMember.GetLogOnState(ACLMember.selectIndex));
    }
    // End:0x1b8
    if(TargetUser != MatchMaker.kUserName && MatchMaker.kInClanGrade == 1)
    {
        CMClanUserList.ChangeStateByIndex(6, 0);
        // End:0x14c
        if(TargetGrade >= 3)
        {
            CMClanUserList.ChangeStateByIndex(7, 0);
        }
        // End:0x16b
        if(TargetGrade == 2)
        {
            CMClanUserList.ChangeStateByIndex(8, 0);
        }
        // End:0x1b8
        if(ACLMember.GetLogOnState(ACLMember.selectIndex) == 0 && MatchMaker.kClanMatch_InChannel == true)
        {
            CMClanUserList.ChangeStateByIndex(5, 0);
        }
    }
    CMClanUserList.ChangeStateByIndex(0, 0);
    CMClanUserList.ChangeStateByIndex(1, 0);
    // End:0x25b
    if(ACLMember.GetLogOnState(ACLMember.selectIndex) > 0)
    {
        // End:0x25b
        if(TargetUser != MatchMaker.kUserName)
        {
            CMClanUserList.ChangeStateByIndex(2, 0);
            // End:0x25b
            if(rfFriendPosTime.CheckCondition())
            {
                page_Main.TcpChannel.sfReqFriendPosition(TargetUser, 2);
            }
        }
    }
}

function bool ContextMenu_OnClose(GUIContextMenu Sender)
{
    ACLMember.MultiColumnList.bHotTrack = true;
    return true;
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
        // End:0x7c
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(ACLMember.GetUserName(ACLMember.selectIndex));
            // End:0x40e
            break;
        // End:0xb1
        case 1:
            bReqClanInfo = true;
            page_Main.TcpChannel.sfReqClanInfo(MatchMaker.kClanName);
            // End:0x40e
            break;
        // End:0x10a
        case 2:
            TPChat.SetEditText("/w " $ ACLMember.GetUserName(ACLMember.selectIndex) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x40e
            break;
        // End:0x1d7
        case 3:
            page_Main.StartAutoMove(page_Main.SCIList[page_Main.FindServerChannelInfoIndexByServerIP(ACLMember.GetServerIP(ACLMember.selectIndex), ACLMember.GetServerPort(ACLMember.selectIndex), ACLMember.GetChannelNumber(ACLMember.selectIndex))].ServerID, ACLMember.GetChannelNumber(ACLMember.selectIndex), ACLMember.GetGameRoomNumber(ACLMember.selectIndex), "");
            // End:0x40e
            break;
        // End:0x277
        case 4:
            // End:0x274
            if(CheckInviteUser(ACLMember.GetCurPos(ACLMember.selectIndex), ACLMember.GetCurState(ACLMember.selectIndex), ACLMember.GetUserName(ACLMember.selectIndex)) == true)
            {
                page_Main.TcpChannel.sfReqInviteGameRoom(ACLMember.GetUserName(ACLMember.selectIndex));
            }
            // End:0x40e
            break;
        // End:0x35b
        case 5:
            // End:0x32b
            if(MatchMaker.kInClanGrade == 1 && MatchMaker.kClanMatch_InChannel == false)
            {
                // End:0x32b
                if(1 == page_Main.IsInClanChannel(ACLMember.GetServerIP(ACLMember.selectIndex), ACLMember.GetServerPort(ACLMember.selectIndex), ACLMember.GetChannelNumber(ACLMember.selectIndex)))
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 222);
                    return;
                }
            }
            page_Main.TcpChannel.sfReqAdjustClanMemberGrade(MatchMaker.kClanName, TargetUser, 5);
            // End:0x40e
            break;
        // End:0x3a1
        case 6:
            class'BTWindowDefineARHK'.static.ShowInfo(Controller, 56, TargetUser);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAdjustClanMasterOnOK;
            // End:0x40e
            break;
        // End:0x3d6
        case 7:
            page_Main.TcpChannel.sfReqAdjustClanMemberGrade(MatchMaker.kClanName, TargetUser, 2);
            // End:0x40e
            break;
        // End:0x40b
        case 8:
            page_Main.TcpChannel.sfReqAdjustClanMemberGrade(MatchMaker.kClanName, TargetUser, 3);
            // End:0x40e
            break;
        // End:0xffff
        default:
}

function bool CheckInviteUser(optional int CurPos, optional int CurState, optional string szNickName)
{
    // End:0x37
    if(CurPos == 2 && CurState == 2)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 132, szNickName);
        return false;
    }
    return true;
}

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("BTPageClan::InternalOnClose()");
    Log("[BTPageClan::InternalOnClose] ");
    OnClose(bCanceled);
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    // End:0x29
    if(key == 13)
    {
        TPChat.InputBox.FocusFirst(none);
        return true;
    }
    return false;
}

function bool Internal_OnPreDraw(Canvas C)
{
    local float CurrentTime;

    InternalOnPreDraw(C);
    CurrentTime = PlayerOwner().Level.TimeSeconds;
    // End:0x6d
    if(CurrentTime - LastRefreshTime > RefreshCycleTime)
    {
        page_Main.TcpChannel.sfReqClanUserList(MM.kClanName);
        LastRefreshTime = CurrentTime;
    }
    rfFriendPosTime.Update(PlayerOwner().Level.AppDeltaTime);
    return true;
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageClan_TCP TCP;

    TCP = new class'BTPageClan_TCP';
    TCP.Owner = self;
    return TCP;
}

function ClearChatLog()
{
    TPChat.ClearAll();
}

function NormalChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatNormal());
}

function ClanChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatClan());
    TPChat.AddChatHistory(1, cL, class'BTUIColorPoolHK'.static.ChatClan());
}

function WhisperChatLog(string cL);
function SelfChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatSelf());
}

function SystemChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatSystem());
    TPChat.AddChatHistory(1, cL, class'BTUIColorPoolHK'.static.ChatSystem());
    TPChat.AddChatHistory(2, cL, class'BTUIColorPoolHK'.static.ChatSystem());
}

function BroadCastItemChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatBroadCastItem());
}

function TeamChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatTeam());
}

function bool rfAckClanUserListStart(int Result, int TotalCount)
{
    // End:0x1a
    if(Result == 0)
    {
        ACLMember.RemoveAll();
    }
    Log("[BTPageClan::rfAckClanUserListStart] Result=" $ string(Result) $ " TotalCount=" $ string(TotalCount));
    return true;
}

function bool rfAckClanUserList(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<int> ClanWinCnt, array<int> ClanLoseCnt, array<int> LevelMarkID, array<int> TitleMarkID, array<int> DudeId)
{
    local int i;

    Log("[BTPageClan::rfAckClanUserList]");
    // End:0x49
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    i = 0;
    J0x50:
    // End:0xc0 [While If]
    if(i < Level.Length)
    {
        ACLMember.AddClanMember(byte(DudeId[i] != 0), Level[i], CharName[i], ClanGrade[i], LevelMarkID[i], TitleMarkID[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x50;
    }
    return true;
}

function bool rfAckClanUserListEnd()
{
    Log("[BTPageClan::rfAckClanUserListEnd]");
    // End:0x97
    if(MatchMaker.kInClanGrade == 1 && ACLMember.ACLRowList.Length == 1 && ACLMember.ACLRowList[0].DataPerColumn[1].strValue == MatchMaker.kUserName)
    {
        ListBottomButton[1].EnableMe();
    }
    return true;
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
    J0x5d:
    // End:0xa7 [While If]
    if(i < IssueDate.Length)
    {
        ACLClanNews.AddNews(IssueDate[i], IssueType[i], IssuedClanMember[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5d;
    }
    return true;
}

function bool rfAckClanMatchResultHistory(array<BtrDouble> MatchDate, array<byte> IsWin, array<string> EnemyClanname)
{
    local int i, starti;
    local BtrTime t;

    Log("[BTPageClan::sfAckClanMatchResultHistory]" $ string(MatchDate.Length));
    PlayerOwner().dblog("[BTPageClan::sfAckClanMatchResultHistory]" $ string(MatchDate.Length));
    starti = 0;
    // End:0x9d
    if(MatchDate.Length > 11)
    {
        starti = MatchDate.Length - 11;
    }
    ACLClanWarResult.RemoveAll();
    i = starti;
    J0xb7:
    // End:0x101 [While If]
    if(i < MatchDate.Length)
    {
        ACLClanWarResult.addResult(MatchDate[i], IsWin[i], EnemyClanname[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xb7;
    }
    PlayerOwner().dblog("------");
    i = 0;
    J0x11d:
    // End:0x1e9 [While If]
    if(i < starti)
    {
        BtrDoubleToBtrTime(MatchDate[i], t);
        PlayerOwner().dblog(string(i) @ string(t.Year) $ "/" $ string(t.Month) $ "/" $ string(t.Day) $ " " $ string(t.Hour) $ ":" $ string(t.Minute) $ ":" $ string(t.Second) @ string(IsWin[i]) @ EnemyClanname[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x11d;
    }
    PlayerOwner().dblog("------");
    i = starti;
    J0x209:
    // End:0x2d6 [While If]
    if(i < MatchDate.Length)
    {
        BtrDoubleToBtrTime(MatchDate[i], t);
        PlayerOwner().dblog(string(i) @ string(t.Year) $ "/" $ string(t.Month) $ "/" $ string(t.Day) $ " " $ string(t.Hour) $ ":" $ string(t.Minute) $ ":" $ string(t.Second) @ string(IsWin[i]) @ EnemyClanname[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x209;
    }
    PlayerOwner().dblog("------");
    return true;
}

function bool rfAckClanClose(int Result, string ErrMsg, string ClanName)
{
    Log("[BTPageClan::rfAckClanClose]");
    // End:0x46
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowInfoHK");
    BTWindowInfoHK(Controller.TopPage()).SetData(strClanClose[0], 5, strClanClose[2]);
    BTWindowInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowBackToLastPage_OnOK;
    return true;
}

function bool rfAckClanSecession(int Result, string ErrMsg)
{
    Log("[BTPageClan::rfAckClanSecession]");
    // End:0x4a
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowInfoHK");
    BTWindowInfoHK(Controller.TopPage()).SetData(strClanSecession[0], 5, strClanSecession[2]);
    BTWindowInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowBackToLastPage_OnOK;
    return true;
}

function bool rfAckClanChangeInfo(int Result, string ErrMsg)
{
    Log("[BTPageClan::rfAckClanChangeInfo]");
    // End:0x4b
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 47);
    page_Main.TcpChannel.sfReqClanInfo(MatchMaker.kClanName);
    return true;
}

function bool rfAckClanPersonelIntro(int Result, string ErrMsg)
{
    Log("[BTPageClan::rfAckClanPersonelIntro]");
    // End:0x4e
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 48);
    return true;
}

function bool rfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> ClanName, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    local export editinline BTWindowFindClanHK BTWindow;

    Log("[BTPageClan::rfAckSearchClan]");
    // End:0x47
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    BTWindow = BTWindowFindClanHK(Controller.TopPage());
    // End:0xdb
    if(BTWindow != none)
    {
        BTWindow.SetPageLimit(1, TotalPage);
        BTWindow.SetData(TotalPage, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanName, ClanMaster, ClanMember, ClanMemberMax, ClanCreateDate, ClanWin, ClanLose, ClanDraw, ClanRank, ClanRecruit, ClanLevel);
    }
    return true;
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    Log("[BTPageClan::rfAckDBCharInfo]");
    // End:0x1c7
    if(Controller.TopPage() == self)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowUserDetailInfoHK");
        BTWindowUserDetailInfoHK(Controller.TopPage()).SetData(CharName, ClanName, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID, stCharInfo.DispHeadItem, stCharInfo.DispFaceItem, stCharInfo.DispHeadAddItem, AFSpecialCostumeItemID, RSASpecialCostumeItemID, stCharInfo);
        BTWindowUserDetailInfoHK(Controller.TopPage()).SetClanInfo(ClanName, CM_Pattern, CM_BG, CM_BL, ClanLevel);
        BTWindowUserDetailInfoHK(Controller.TopPage()).SetSelfIntro(ClanPersonIntro);
        // End:0x17d
        if(ClanName == "none" || ClanName == "")
        {
            BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.DisableMe();
        }
        // End:0x1c7
        else
        {
            BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.EnableMe();
            BTWindowUserDetailInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowUserDetailInfoHK_OnClanInfo;
        }
    }
    return true;
}

function bool BTWindowUserDetailInfoHK_OnClanInfo(GUIComponent Sender)
{
    local string ClanName;

    ClanName = BTWindowUserDetailInfoHK(Controller.TopPage()).ClanName;
    Controller.TopPage().FadeOut(false, true);
    TcpChannel.sfReqClanInfo(ClanName);
    return true;
}

function bool rfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    Log("[BTPageClan::rfAckClanCharPersonelIntro]");
    // End:0x52
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowSelfIntroductionChangeHK");
    BTWindowSelfIntroductionChangeHK(Controller.TopPage()).SetData(PersonelIntro);
    BTWindowSelfIntroductionChangeHK(Controller.TopPage()).__OnOK__Delegate = BTWindowSelfIntroductionChangeHK_OnOK;
    return true;
}

function bool rfAckAdjustClanMemberGrade(int Result, string ErrMsg, string ClanName, string CharName, byte CharGrade)
{
    Log("[BTPageClan::rfAckAdjustClanMemberGrade]");
    // End:0x52
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x70
    if(CharGrade == 1)
    {
        MatchMaker.kInClanGrade = 3;
    }
    // End:0x9e
    if(MatchMaker.kUserName == CharName)
    {
        MatchMaker.kInClanGrade = CharGrade;
    }
    RefreshPage();
    return true;
}

function bool rfAckNotifyAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    Log("[BTPageClan::rfAckNotifyAdjustClanMemberGrade]");
    // End:0x78
    if(CharGrade != 5)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(55, CharName, strClanGrade[CharGrade]), 5, true);
    }
    // End:0xa0
    else
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(58, CharName), 5, true);
    }
    // End:0x12d
    if(MatchMaker.kUserName == CharName)
    {
        // End:0x117
        if(CharGrade == 5)
        {
            MatchMaker.kInClanGrade = 0;
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 58, CharName);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowBackToLastPage_OnOK;
        }
        // End:0x12d
        else
        {
            MatchMaker.kInClanGrade = CharGrade;
        }
    }
    RefreshPage();
    return true;
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
    // End:0x69
    else
    {
        bClanInviteState = true;
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
    }
    return false;
}

function bool rfAckChatWispher(int Result, string ErrMsg, string ToCharName)
{
    Log("[BTPageLobby::rfAckChatWispher]");
    // End:0x5a
    if(Result == 252)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(76, ToCharName), 5, true);
    }
    // End:0xb5
    else
    {
        // End:0x91
        if(Result == 182)
        {
            page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(77, ToCharName), 5, true);
        }
        // End:0xb5
        else
        {
            // End:0xb5
            if(Result != 0)
            {
                class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            }
        }
    }
    return true;
}

function bool rfAckNotifyUpdateCharInfo_LevelMark(string CharName, int LevelMarkID)
{
    Log("[BTPageClan::rfAckNotifyUpdateCharInfo_LevelMark] CharName = " $ CharName $ ", LevelMarkID=" $ string(LevelMarkID));
    ACLMember.ChangeLevelMarkID(CharName, LevelMarkID);
    return true;
}

function UpdateRecv_ClanInfo(BTNetMainMenu MainMenu)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageClan::UpdateRecv_ClanInfo]");
    // End:0xe3
    if(bReqClanInfo)
    {
        Log("bReqClanInfo=On");
        Controller.OpenMenu("GUIWarfareControls.BTWindowClanInfoHK");
        BTWindowClanInfoHK(Controller.TopPage()).SetData(MainMenu.kRecvClanInfo);
        bReqClanInfo = false;
        // End:0xe1
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
                ACLMember.SetCurLocationName(iRowIndex, ChannelNickName $ "/" $ string(GameRoomNum));
            // End:0xffff
            default:
                // End:0xa0
                if(CurPos == 2)
                {
                    ACLMember.SetGameRoomNumber(iRowIndex, GameRoomNum);
                }
                // End:0xb9
                else
                {
                    ACLMember.SetGameRoomNumber(iRowIndex, -1);
                }
                ACLMember.SetServerIP(iRowIndex, fServerIP);
                ACLMember.SetServerPort(iRowIndex, fServerPort);
                // End:0x111
                if(CurPos == 0)
                {
                    ACLMember.SetServerName(iRowIndex, "");
                }
                // End:0x12a
                else
                {
                    ACLMember.SetServerName(iRowIndex, fServername);
                }
                ACLMember.SetChannelNumber(iRowIndex, ChannelNum);
                ACLMember.SetCurState(iRowIndex, CurState);
                bPlaying = CurPos == 2 && CurState == 2;
                // End:0x1ab
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
                // End:0x31e
                else
                {
                    // End:0x28a
                    if(MM.kRoomID < 0)
                    {
                        BTCMMessengerOnOffline(ACLMember.ContextMenu).ChangeInviteState(false);
                        // End:0x287
                        if(CurPos == 2)
                        {
                            BTCMMessengerOnOffline(ACLMember.ContextMenu).ChangeMoveRoomState(true);
                        }
                    }
                    // End:0x31e
                    else
                    {
                        // End:0x31e
                        if(CurPos >= 1)
                        {
                            // End:0x2c4
                            if(bPlaying == true)
                            {
                                BTCMMessengerOnOffline(ACLMember.ContextMenu).ChangeInviteState(false);
                            }
                            // End:0x2e2
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
}

defaultproperties
{
    fbPanelBackground[0]=(X1=10.0,Y1=87.0,X2=762.0,Y2=499.0)
    fbPanelBackground[1]=(X1=773.0,Y1=89.0,X2=1015.0,Y2=736.0)
    strClanSecession[0]="Leave Clan"
    strClanSecession[1]="Leave the clan?"
    strClanSecession[2]="You have left the clan. Returning to the previous page."
    strClanClose[0]="Disband Clan"
    strClanClose[1]="Disband the clan? You cannot restore the clan once it has been disbanded."
    strClanClose[2]="You have disbanded the clan. Returning to the previous page."
    RefreshCycleTime=30.0
    fbLabelClanMark=(X1=11.0,Y1=7.0,X2=77.0,Y2=73.0)
    fbLabelClanName=(X1=87.0,Y1=27.0,X2=288.0,Y2=52.0)
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
    fbLabel[0]=(X1=21.0,Y1=102.0,X2=401.0,Y2=440.0)
    fbLabel[1]=(X1=222.0,Y1=102.0,X2=401.0,Y2=440.0)
    fbLabel[2]=(X1=21.0,Y1=134.0,X2=401.0,Y2=440.0)
    fbLabel[3]=(X1=222.0,Y1=134.0,X2=401.0,Y2=440.0)
    fbLabel[4]=(X1=21.0,Y1=165.0,X2=401.0,Y2=440.0)
    fbLabel[5]=(X1=222.0,Y1=165.0,X2=401.0,Y2=440.0)
    fbLabel[6]=(X1=21.0,Y1=197.0,X2=401.0,Y2=440.0)
    fbLabel[7]=(X1=222.0,Y1=197.0,X2=401.0,Y2=440.0)
    fbLabel[8]=(X1=21.0,Y1=229.0,X2=401.0,Y2=440.0)
    fbLabel[9]=(X1=222.0,Y1=229.0,X2=401.0,Y2=440.0)
    fbLabel[10]=(X1=21.0,Y1=261.0,X2=401.0,Y2=440.0)
    fbLabel[11]=(X1=222.0,Y1=261.0,X2=401.0,Y2=440.0)
    fbLabel[12]=(X1=21.0,Y1=293.0,X2=401.0,Y2=440.0)
    fbLabel[13]=(X1=21.0,Y1=323.0,X2=401.0,Y2=440.0)
    fbLabel[14]=(X1=21.0,Y1=388.0,X2=401.0,Y2=440.0)
    strNoRankState="None"
    fbEdit[0]=(X1=91.0,Y1=95.0,X2=207.0,Y2=122.0)
    fbEdit[1]=(X1=292.0,Y1=95.0,X2=408.0,Y2=122.0)
    fbEdit[2]=(X1=91.0,Y1=127.0,X2=207.0,Y2=154.0)
    fbEdit[3]=(X1=292.0,Y1=127.0,X2=408.0,Y2=154.0)
    fbEdit[4]=(X1=91.0,Y1=158.0,X2=207.0,Y2=185.0)
    fbEdit[5]=(X1=292.0,Y1=158.0,X2=408.0,Y2=185.0)
    fbEdit[6]=(X1=91.0,Y1=190.0,X2=207.0,Y2=217.0)
    fbEdit[7]=(X1=292.0,Y1=190.0,X2=408.0,Y2=217.0)
    fbEdit[8]=(X1=91.0,Y1=222.0,X2=207.0,Y2=249.0)
    fbEdit[9]=(X1=292.0,Y1=222.0,X2=408.0,Y2=249.0)
    fbEdit[10]=(X1=91.0,Y1=254.0,X2=207.0,Y2=281.0)
    fbEdit[11]=(X1=292.0,Y1=254.0,X2=408.0,Y2=281.0)
    fbEdit[12]=(X1=91.0,Y1=286.0,X2=408.0,Y2=313.0)
    fbEdit[13]=(X1=91.0,Y1=330.0,X2=408.0,Y2=384.0)
    fbEdit[14]=(X1=91.0,Y1=395.0,X2=408.0,Y2=449.0)
    strEdit[1]="%0 W / %1 L"
    strEdit[2]="Place: %0"
    strEdit[8]="Place: %0"
    strEdit[9]="%0 / %1"
    strEdit[10]="%0 year(s), %1 day(s)"
    fbButtonTop[0]=(X1=420.0,Y1=89.0,X2=454.0,Y2=115.0)
    fbButtonTop[1]=(X1=454.0,Y1=89.0,X2=575.0,Y2=115.0)
    fbButtonTop[2]=(X1=575.0,Y1=89.0,X2=638.0,Y2=115.0)
    fbButtonTop[3]=(X1=638.0,Y1=89.0,X2=760.0,Y2=115.0)
    strButtonTop[0]="Lv."
    strButtonTop[1]="Name"
    strButtonTop[2]="Rank"
    strButtonTop[3]="Location"
    fbACLMember=(X1=420.0,Y1=116.0,X2=745.0,Y2=455.0)
    fbLabelClanNews=(X1=774.0,Y1=89.0,X2=1013.0,Y2=116.0)
    strLabelClanNews="Clan News"
    fbACLClanNews=(X1=774.0,Y1=116.0,X2=1013.0,Y2=402.0)
    fbLabelClanWarResult=(X1=774.0,Y1=411.0,X2=1013.0,Y2=438.0)
    strLabelClanWarResult="Clan Battle Results"
    fbACLClanWarResult=(X1=774.0,Y1=438.0,X2=1013.0,Y2=724.0)
    fbListBottomButton[0]=(X1=16.0,Y1=460.0,X2=136.0,Y2=493.0)
    fbListBottomButton[1]=(X1=140.0,Y1=460.0,X2=260.0,Y2=493.0)
    fbListBottomButton[2]=(X1=264.0,Y1=460.0,X2=384.0,Y2=493.0)
    fbListBottomButton[3]=(X1=388.0,Y1=460.0,X2=508.0,Y2=493.0)
    fbListBottomButton[4]=(X1=512.0,Y1=460.0,X2=632.0,Y2=493.0)
    fbListBottomButton[5]=(X1=636.0,Y1=460.0,X2=756.0,Y2=493.0)
    strListBottomButton[0]="Leave Clan"
    strListBottomButton[1]="Disband Clan"
    strListBottomButton[2]="Clan Search"
    strListBottomButton[3]="Clan Cafe"
    strListBottomButton[4]="Change Info"
    strListBottomButton[5]="Change Intro"
    fbTPChat=(X1=10.0,Y1=504.0,X2=761.0,Y2=735.0)
    bPersistent=true
    OnOpen=InternalOnOpen
    OnReOpen=InternalOnReOpen
    OnClose=InternalOnClose
    OnKeyEvent=internalKeyEvent
}