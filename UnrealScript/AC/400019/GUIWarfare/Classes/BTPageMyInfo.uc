class BTPageMyInfo extends BTNetGUIPageHK
    editinlinenew
    instanced;

var() automated BTTPMyInfoAllHK TPMyInfoAll;

function UpdateCharInfo(wMatchMaker MM)
{
    Log("[BTPageMyInfo::UpdateCharInfo] ");
    TPMyInfoAll.TPBasic.SetData(MM.kUID, MM.kUserName, MM.kClanName, MM.kClanPattern, MM.kClanBG, MM.kClanBL, page_Main.MyCharInfo, page_Main.MyClanInfo, MM.kClanLevel);
    TPMyInfoAll.TPFriendly.SetData(true, MM.kUID, MM.kUserName, MM.kClanName, MM.kClanPattern, MM.kClanBG, MM.kClanBL, page_Main.MyCharInfo, page_Main.MyClanInfo, MM.kClanLevel);
    //return;    
}

function InitializeDelegate()
{
    MM.__UpdateCharInfo__Delegate = UpdateCharInfo;
    //return;    
}

function UnInitializeDelegate()
{
    MM.__UpdateCharInfo__Delegate = None;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    InitializeDelegate();
    LabelRoomName.ClipArea.X1 = 0.0000000;
    LabelRoomName.ClipArea.Y1 = 0.0000000;
    LabelRoomName.ClipArea.X2 = 280.0000000;
    LabelRoomName.ClipArea.Y2 = 48.0000000;
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
    //return;    
}

function ClearChatLog_Extra()
{
    //return;    
}

function NormalChatLog_Extra(string cL)
{
    TPMyInfoAll.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatNormal());
    //return;    
}

function ClanChatLog_Extra(string cL)
{
    TPMyInfoAll.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatClan());
    //return;    
}

function WhisperChatLog_Extra(string cL)
{
    TPMyInfoAll.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatWhisper());
    //return;    
}

function SelfChatLog_Extra(string cL)
{
    TPMyInfoAll.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSelf());
    //return;    
}

function SystemChatLog_Extra(string cL)
{
    TPMyInfoAll.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    //return;    
}

function BroadCastItemChatLog_Extra(string cL)
{
    TPMyInfoAll.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatBroadCastItem());
    //return;    
}

function TeamChatLog_Extra(string cL)
{
    TPMyInfoAll.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatTeam());
    //return;    
}

function InternalOnOpen()
{
    __NFUN_270__("BTPageMyInfo::InternalOnOpen()");
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
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageMyInfo::InternalOnClose()");
    Log("[BTPageMyInfo::InternalOnClose] ");
    TPMyInfoAll.CharacterModel.EndModel();
    UnInitializeDelegate();
    OnClose(bCanceled);
    //return;    
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
    //return;    
}

function InternalOnChangeRankingComboBox()
{
    local byte MainIdx, SubIdx;

    MainIdx = byte(TPMyInfoAll.TPRank.GetRankComboboxSelectedIndex(0));
    SubIdx = byte(TPMyInfoAll.TPRank.GetRankComboboxSelectedIndex(1));
    page_Main.TcpChannel.sfReqGetRankingInfoList(MainIdx, SubIdx);
    //return;    
}

function InternalOnHideComboBoxList()
{
    LoseFocus(none);
    MenuStateChange(2);
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte KeyState, float Delta)
{
    local Interactions.EInputKey iKey;

    // End:0x40
    if(TPMyInfoAll.TPPanel[TPMyInfoAll.VisiblePanelIdx].ACLList.ImageList.ItemsPerPage == 0)
    {
        return false;
    }
    iKey = key;
    // End:0xA6
    if((int(KeyState) == 3) && int(iKey) == int(236))
    {
        TPMyInfoAll.TPPanel[TPMyInfoAll.VisiblePanelIdx].ACLList.ImageList.WheelUp();
        return true;
    }
    // End:0x101
    if((int(KeyState) == 3) && int(iKey) == int(237))
    {
        TPMyInfoAll.TPPanel[TPMyInfoAll.VisiblePanelIdx].ACLList.ImageList.WheelDown();
        return true;
    }
    return false;
    //return;    
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageMyInfo_TCP TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageMyInfo_TCP';
    TCP.Owner = self;
    return TCP;
    //return;    
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    local ClanInfo stClanInfo;

    Log("[BTPageMyInfo::rfAckDBCharInfo]");
    TPMyInfoAll.TPFriendly.SetData(false, 0, CharName, ClanName, CM_Pattern, CM_BG, CM_BL, stCharInfo, stClanInfo, ClanLevel);
    return true;
    //return;    
}

function bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb)
{
    TPMyInfoAll.TPStat.SetData(MaxSerial, MaxScore, MaxKill, MaxAssist, Serial3, Serial5, Serial7, Serial10, Serial15, AR, SMG, SR, SW, Melee, Grenade, FlashBang, Foot, AT4, MG, Fire, RPG7, TimeBomb, IcendiaryBomb, ClusterBomb, ByChopper, Artillery, KillChopper, FirstKill, LastKill, AllKill, Dominate, InstallBomb, DefuseBomb);
    return true;
    //return;    
}

function bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount)
{
    TPMyInfoAll.TPRank.InitializeContent(RankingType, TotalCount);
    return true;
    //return;    
}

function bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, array<string> CharName, array<int> CharLevel, array<string> ClanName, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Ranking_Accum, array<int> Ranking_Accum_Prev, array<int> Ranking_Accum_Exp, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    TPMyInfoAll.TPRank.SetRankingInfo(RankingType, CommunityType, CharName, CharLevel, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, Ranking_Accum, Ranking_Accum_Prev, Ranking_Accum_Exp, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    return true;
    //return;    
}

function bool rfAckGetRankingInfoListEnd()
{
    TPMyInfoAll.TPRank.CompleteSetRankingInfo();
    return true;
    //return;    
}

defaultproperties
{
    // Reference: BTTPMyInfoAllHK'GUIWarfare_Decompressed.BTPageMyInfo.mTPMyInfoAll'
    begin object name="mTPMyInfoAll" class=GUIWarfareControls.BTTPMyInfoAllHK
        bUseAWinPos=true
        AWinPos=(X1=10.0000000,Y1=88.0000000,X2=500.0000000,Y2=736.0000000)
        OnPreDraw=mTPMyInfoAll.Internal_OnPreDraw
    end object
    TPMyInfoAll=mTPMyInfoAll
    bPersistent=false
    OnOpen=BTPageMyInfo.InternalOnOpen
    OnClose=BTPageMyInfo.InternalOnClose
    OnKeyEvent=BTPageMyInfo.InternalOnKeyEvent
}