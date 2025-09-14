/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageMyInfo.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:33
 *
 *******************************************************************************/
class BTPageMyInfo extends BTNetGUIPageHK
    dependson(BTPageMyInfo_TCP)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTTPMyInfoAllHK TPMyInfoAll;

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x39
        case 1:
            page_Main.SetPage(20, true);
            // End:0x29e
            break;
        // End:0x53
        case 2:
            page_Main.SetPage(21, true);
            // End:0x29e
            break;
        // End:0x6d
        case 3:
            page_Main.SetPage(22, true);
            // End:0x29e
            break;
        // End:0x87
        case 4:
            page_Main.SetPage(18, true);
            // End:0x29e
            break;
        // End:0x1a0
        case 5:
            // End:0xb6
            if(MM.kClanName != "")
            {
                page_Main.SetPage(24, true);
            }
            // End:0x19d
            else
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowClanMenuHK");
                BTWindowClanMenuHK(Controller.TopPage()).SetClanLookingFor(MM.kClanLookingFor);
                BTWindowClanMenuHK(Controller.TopPage()).ButtonCreateClan.__OnClick__Delegate = ClanMenu_ButtonCreateClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonFindClan.__OnClick__Delegate = ClanMenu_ButtonFindClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonOK.__OnClick__Delegate = ClanMenu_ButtonLookingForClan_OnClick;
            }
            // End:0x29e
            break;
        // End:0x1a8
        case 6:
            // End:0x29e
            break;
        // End:0x1b0
        case 7:
            // End:0x29e
            break;
        // End:0x1c7
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x29e
            break;
        // End:0x203
        case 9:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x29e
            break;
        // End:0x24a
        case 10:
            PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
            page_Main.SetPage(1, true);
            // End:0x29e
            break;
        // End:0x28d
        case 11:
            Controller.OpenMenu("GuiWarfareControls.BTWindowBTTPQuestInfoHK");
            // End:0x29e
            break;
        // End:0x29b
        case 20:
            OpenTodayResultPage();
            // End:0x29e
            break;
        // End:0xffff
        default:
            return true;
    }
}

function UpdateCharInfo(wMatchMaker MM)
{
    Log("[BTPageMyInfo::UpdateCharInfo] ");
    TPMyInfoAll.TPBasic.SetData(MM.kUID, MM.kUserName, MM.kClanName, MM.kClanPattern, MM.kClanBG, MM.kClanBL, page_Main.MyCharInfo, page_Main.MyClanInfo, MM.kClanLevel);
    TPMyInfoAll.TPFriendly.SetData(true, MM.kUID, MM.kUserName, MM.kClanName, MM.kClanPattern, MM.kClanBG, MM.kClanBL, page_Main.MyCharInfo, page_Main.MyClanInfo, MM.kClanLevel);
}

function InitializeDelegate()
{
    MM.__UpdateCharInfo__Delegate = UpdateCharInfo;
}

function UnInitializeDelegate()
{
    MM.__UpdateCharInfo__Delegate = None;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    InitializeDelegate();
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    LabelRoomName.ClipArea.X1 = 0.0;
    LabelRoomName.ClipArea.Y1 = 0.0;
    LabelRoomName.ClipArea.X2 = 280.0;
    LabelRoomName.ClipArea.Y2 = 48.0;
    page_Main.ResetChatLog();
    page_Main.__ClearChatLog_Extra__Delegate = ClearChatLog_Extra;
    page_Main.__NormalChatLog_Extra__Delegate = NormalChatLog_Extra;
    page_Main.__ClanChatLog_Extra__Delegate = ClanChatLog_Extra;
    page_Main.__WhisperChatLog_Extra__Delegate = WhisperChatLog_Extra;
    page_Main.__SelfChatLog_Extra__Delegate = SelfChatLog_Extra;
    page_Main.__SystemChatLog_Extra__Delegate = SystemChatLog_Extra;
    page_Main.__BroadCastItemChatLog_Extra__Delegate = BroadCastItemChatLog_Extra;
    page_Main.__TeamChatLog_Extra__Delegate = TeamChatLog_Extra;
    page_Main.UpdateChatLog();
    Controller.PushPage();
}

function ClearChatLog_Extra();
function NormalChatLog_Extra(string cL)
{
    TPMyInfoAll.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatNormal());
}

function ClanChatLog_Extra(string cL)
{
    TPMyInfoAll.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatClan());
}

function WhisperChatLog_Extra(string cL)
{
    TPMyInfoAll.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatWhisper());
}

function SelfChatLog_Extra(string cL)
{
    TPMyInfoAll.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatSelf());
}

function SystemChatLog_Extra(string cL)
{
    TPMyInfoAll.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatSystem());
}

function BroadCastItemChatLog_Extra(string cL)
{
    TPMyInfoAll.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatBroadCastItem());
}

function TeamChatLog_Extra(string cL)
{
    TPMyInfoAll.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatTeam());
}

function InternalOnOpen()
{
    UnresolvedNativeFunction_97("BTPageMyInfo::InternalOnOpen()");
    Log("[BTPageMyInfo::InternalOnOpen] ");
    MM.SetCurSubPos(1);
    TPMyInfoAll.CharacterModel.BeginModel();
    page_Main.TcpChannel.sfReqChangeUserState(8, 0);
    TPMyInfoAll.TPFriendly.__OnChangeFriendlyUser__Delegate = InternalOnChangeFriendlyUser;
    TPMyInfoAll.TPFriendly.__OnHideFriendlyUserList__Delegate = InternalOnHideComboBoxList;
    TPMyInfoAll.TPRank.__OnChangeMainComboBox__Delegate = InternalOnChangeRankingComboBox;
    TPMyInfoAll.TPRank.__OnChangeSubComboBox__Delegate = InternalOnChangeRankingComboBox;
    TPMyInfoAll.TPRank.__OnHideComboBoxList__Delegate = InternalOnHideComboBoxList;
    currentBGM = page_Main.DefaultLobbyBGM;
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    page_Main.TcpChannel.sfReqGetServerTime();
    page_Main.TcpChannel.sfReqCharInfo();
    page_Main.TcpChannel.sfReqCharDetailInfo();
    page_Main.TcpChannel.sfReqGetRankingInfoList(0, 0);
    InternalOnChangeFriendlyUser();
}

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("BTPageMyInfo::InternalOnClose()");
    Log("[BTPageMyInfo::InternalOnClose] ");
    TPMyInfoAll.CharacterModel.EndModel();
    UnInitializeDelegate();
    OnClose(bCanceled);
}

function InternalOnChangeFriendlyUser()
{
    local string UserName;

    UserName = TPMyInfoAll.TPFriendly.GetSelectedFriendlyUserName();
    // End:0x47
    if(UserName != "")
    {
        page_Main.TcpChannel.sfReqDBCharInfo(UserName);
    }
}

function InternalOnChangeRankingComboBox()
{
    local byte MainIdx, SubIdx;

    MainIdx = byte(TPMyInfoAll.TPRank.GetRankComboboxSelectedIndex(0));
    SubIdx = byte(TPMyInfoAll.TPRank.GetRankComboboxSelectedIndex(1));
    page_Main.TcpChannel.sfReqGetRankingInfoList(MainIdx, SubIdx);
}

function InternalOnHideComboBoxList()
{
    LoseFocus(none);
    MenuStateChange(2);
}

function bool InternalOnKeyEvent(out byte key, out byte KeyState, float Delta)
{
    local Engine.Interactions.EInputKey iKey;

    // End:0x40
    if(TPMyInfoAll.TPPanel[TPMyInfoAll.VisiblePanelIdx].ACLList.ImageList.ItemsPerPage == 0)
    {
        return false;
    }
    iKey = key;
    // End:0xa6
    if(KeyState == 3 && iKey == 236)
    {
        TPMyInfoAll.TPPanel[TPMyInfoAll.VisiblePanelIdx].ACLList.ImageList.WheelUp();
        return true;
    }
    // End:0x101
    if(KeyState == 3 && iKey == 237)
    {
        TPMyInfoAll.TPPanel[TPMyInfoAll.VisiblePanelIdx].ACLList.ImageList.WheelDown();
        return true;
    }
    return false;
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageMyInfo_TCP TCP;

    TCP = new class'BTPageMyInfo_TCP';
    TCP.Owner = self;
    return TCP;
}

function bool ClanMenu_ButtonLookingForClan_OnClick(GUIComponent Sender)
{
    local bool bCurLookingFor;

    Log("[BTPageMyInfo::ClanMenu_ButtonLookingForClan_OnClick]");
    bCurLookingFor = MM.kClanLookingFor;
    // End:0x75
    if(bCurLookingFor)
    {
        page_Main.TcpChannel.sfReqSetLookForClan(0);
    }
    // End:0x8f
    else
    {
        page_Main.TcpChannel.sfReqSetLookForClan(1);
    }
    return true;
}

function bool ClanMenu_ButtonFindClan_OnClick(GUIComponent Sender)
{
    local export editinline BTWindowFindClanHK BTWindow;

    Log("[BTPageMyInfo::ClanMenu_ButtonFindClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowFindClanHK");
    BTWindow = BTWindowFindClanHK(Controller.TopPage());
    BTWindow.TcpChannel = page_Main.TcpChannel;
    BTWindow.__OnOK__Delegate = BTWindowFindClanHK_OnRequestJoin;
    BTWindow.ButtonInfo.__OnClick__Delegate = BTWindowFindClanHK_OnInfo;
    return true;
}

function bool BTWindowFindClanHK_OnRequestJoin(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageMyInfo::BTWindowFindClanHK_OnRequestJoin]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0xf4
    if(ClanName != "none" && ClanName != "")
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
        BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(ClanName);
        BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
    }
    return true;
}

function bool BTWindowFindClanHK_OnInfo(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageMyInfo::BTWindowFindClanHK_OnInfo]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x8c
    if(ClanName != "none" && ClanName != "")
    {
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
    }
    return true;
}

function bool ClanMenu_ButtonCreateClan_OnClick(GUIComponent Sender)
{
    Log("[BTPageMyInfo::ClanMenu_ButtonCreateClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanNeedPointHK");
    BTWindowCreateClanNeedPointHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanNeedPointHK_OnClick;
    return true;
}

function bool BTWindowCreateClanNeedPointHK_OnClick(GUIComponent Sender)
{
    Log("[BTPageMyInfo::BTWindowCreateClanNeedPointHK_OnClick]");
    // End:0xdb
    if(MM.kPoint >= 5000)
    {
        Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanHK");
        BTWindowCreateClanHK(Controller.TopPage()).TcpChannel = page_Main.TcpChannel;
        BTWindowCreateClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanHK_OnOK;
    }
    // End:0x101
    else
    {
        Controller.CloseMenu(false);
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 62);
    }
    return true;
}

function bool BTWindowCreateClanHK_OnOK(GUIComponent Sender)
{
    local string ClanName, Intro, Keyword;
    local int Region;

    Log("[BTPageMyInfo::BTWindowCreateClanHK_OnOK]");
    // End:0x162
    if(BTWindowCreateClanHK(Controller.TopPage()).CheckDup())
    {
        ClanName = BTWindowCreateClanHK(Controller.TopPage()).ClanName.TextStr;
        Intro = BTWindowCreateClanHK(Controller.TopPage()).ClanIntroduction.TextStr;
        Keyword = BTWindowCreateClanHK(Controller.TopPage()).ClanKeyword.TextStr;
        Region = BTWindowCreateClanHK(Controller.TopPage()).ClanLocation.ComboBox.GetIndex();
        page_Main.SaveClanName = ClanName;
        page_Main.TcpChannel.sfReqCreateClan(ClanName, ClanName, Intro, Keyword, byte(Region));
        Controller.CloseMenu(false);
    }
    // End:0x178
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 52);
    }
    return true;
}

function bool BTWindowJoinClan_OK(GUIComponent Sender)
{
    Log("[BTPageMyInfo::BTWindowJoinClan_OK]");
    page_Main.TcpChannel.sfReqJoinClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).SaveInviterName, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    local ClanInfo stClanInfo;

    Log("[BTPageMyInfo::rfAckDBCharInfo]");
    TPMyInfoAll.TPFriendly.SetData(false, 0, CharName, ClanName, CM_Pattern, CM_BG, CM_BL, stCharInfo, stClanInfo, ClanLevel);
    return true;
}

function bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb)
{
    TPMyInfoAll.TPStat.SetData(MaxSerial, MaxScore, MaxKill, MaxAssist, Serial3, Serial5, Serial7, Serial10, Serial15, AR, SMG, SR, SW, Melee, Grenade, FlashBang, Foot, AT4, MG, Fire, RPG7, TimeBomb, IcendiaryBomb, ClusterBomb, ByChopper, Artillery, KillChopper, FirstKill, LastKill, AllKill, Dominate, InstallBomb, DefuseBomb);
    return true;
}

function bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount)
{
    TPMyInfoAll.TPRank.InitializeContent(RankingType, TotalCount);
    return true;
}

function bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, array<string> CharName, array<int> CharLevel, array<string> ClanName, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Ranking_Accum, array<int> Ranking_Accum_Prev, array<int> Ranking_Accum_Exp, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    TPMyInfoAll.TPRank.SetRankingInfo(RankingType, CommunityType, CharName, CharLevel, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, Ranking_Accum, Ranking_Accum_Prev, Ranking_Accum_Exp, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    return true;
}

function bool rfAckGetRankingInfoListEnd()
{
    TPMyInfoAll.TPRank.CompleteSetRankingInfo();
    return true;
}

defaultproperties
{
    begin object name=mTPMyInfoAll class=BTTPMyInfoAllHK
        bUseAWinPos=true
        AWinPos=(X1=10.0,Y1=88.0,X2=500.0,Y2=736.0)
        OnPreDraw=Internal_OnPreDraw
    object end
    // Reference: BTTPMyInfoAllHK'BTPageMyInfo.mTPMyInfoAll'
    TPMyInfoAll=mTPMyInfoAll
    bPersistent=true
    OnOpen=InternalOnOpen
    OnClose=InternalOnClose
    OnKeyEvent=InternalOnKeyEvent
}