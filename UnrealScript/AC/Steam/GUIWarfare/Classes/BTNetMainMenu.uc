/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTNetMainMenu.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Structs:10
 *	Properties:171
 *	Functions:129
 *
 *******************************************************************************/
class BTNetMainMenu extends BTNetGUIPage
    dependson(BTNetGUIPage)
    dependson(BTPageRoomLobby)
    dependson(BTConsole)
    dependson(BTTcpLoginHandler)
    dependson(BTTcpHandler)
    dependson(BTPageLobby)
    dependson(BTPageServerSelection)
    dependson(BTNetGUIPageHK)
    dependson(BTWindowItemExpiredHK)
    editinlinenew
    instanced;

enum GameRoomType
{
    GameRoomType_Normal,
    GameRoomType_Permanent,
    GameRoomType_ClanPermanent,
    GameRoomType_Clan,
    GameRoomType_League,
    GameRoomType_End
};

struct WZInvenListProcess
{
    var bool bLock;
    var int MaxPage;
    var int CurPage;
    var int CountPerPage;
    var string StorageType;
};

struct ServerConnectionInfo
{
    var int ServerID;
    var int ChannelID;
    var string ServerIP;
    var int serverPort;
    var int ServerDataPort;
    var string ServerName;
    var string ServerShortName;
    var string ChannelName;
    var int ServerGroupID;
    var string ServerGroupName;
    var int IsClanChannel;
    var string ChannelNickName;
    var int ChannelTypeValue;
    var bool IsDedicatedServer;
    var int nCurUser;
    var int nMaxUser;
};

struct MapNameInfo
{
    var string FriendlyName;
    var string fileName;
};

struct ChatHistory
{
    var int ChatType;
    var string chatText;
};

struct AAS_Struct
{
    var byte Level;
    var bool Activated;
    var string Text;
    var float Time;
    var int iRepeatTime;
    var int iCount;
    var float fBeginTime;
};

struct LevelUpInfoStruct
{
    var bool bLevelUp;
    var bool bCompleteLevelUp;
    var int Level;
    var int Exp;
    var array<int> ItemID;
    var array<int> PartID;
};

struct EachExpiredItem
{
    var int ItemID;
    var int SlotPos;
    var int PartID;
    var BtrDouble UniqueItemID;
    var int UniqueSkillID;
};

struct ExpiredItemsStruct
{
    var bool bExpiredItem;
    var array<EachExpiredItem> items;
};

struct EachDurabilityWarningItem
{
    var BtrDouble UniqueID;
    var int ItemID;
    var int SlotPos;
    var int PartID;
    var int Durability;
    var int RepairCost;
};

struct DurabilityWarningItemsStruct
{
    var bool bDurWarningItem;
    var bool bReqRepairCost;
    var array<EachDurabilityWarningItem> items;
};

var export editinline BTTPChatHK TPChat;
var int CheckOneHour;
var Core.Object.EPage eCurrPage;
var bool kClanWarUserCountIgnore;
var PageOnWindowManager pwm;
var transient wMatchMaker rMM;
var transient wMyPlayerStatus rMyStatus;
var transient wGameManager rGameMgr;
var ClanInfo MyClanInfo;
var ClanInfo kRecvClanInfo;
var CharInfo MyCharInfo;
var string MyClanName;
var string SaveClanName;
var bool InTutorial;
var bool EnterBotMode;
var bool CreateBotMode;
var bool bRequestItemList;
var WZInvenListProcess WZILP;
var int CommandType;
var int CommandParameter_int;
var string CommandParameter_string;
var bool bIsInPCBang;
var bool bFirstLogin;
var bool bAutoMove;
var byte AutoMoveState;
var bool AutoMoveDirectionOut;
var int AutoMoveClanWar;
var int AutoMoveServerID;
var int AutoMoveChannelID;
var int AutoMoveGameRoomNum;
var string AutoMoveGameRoomPassword;
var bool bPostBoxFull;
var bool bNewMailArrived;
var int NewMailCount;
var array<ServerConnectionInfo> SCIList;
var array<MapNameInfo> MapNameList;
var string AuthLogin_ClientIP;
var byte AuthLogin_ChannelType;
var byte AuthLogin_ConnectAlpha;
var byte AuthLogin_AccountType;
var string AuthLogin_GUID;
var string AuthLogin_AccountID;
var int AuthLogin_ChannelingType;
var string AuthLogin_AuthKey;
var string AuthLogin_RegionKey;
var string BirthDay;
var byte Sex;
var string szLoginPassword;
var int LoginTimeStamp;
var int LoginHash1;
var int LoginHash2;
var int LoginHash3;
var int LoginHash4;
var int LoginHash5;
var bool bWarningDurabilityAndExpired;
var localized string strGMList;
var bool bChatBan;
var bool bSystemChatBlock;
var float ChatAccumTime[4];
var int ChatLogTop;
var array<ChatHistory> ChatLog;
var string LastRecvWhispherName;
var ChatInfo PrevChatMode;
var localized string strNotice_All;
var localized string strNotice_Server;
var localized string strNotice_Channel;
var localized string strNotice_Room;
var localized string strKick;
var localized string strChangeRoomTitle;
var float NoticeUITimeSeconds;
var float NoticeUIPos;
var int NoticeIndex;
var array<string> BatteryNotice;
var float AASUITimeSeconds;
var float AASUIPos;
var array<AAS_Struct> BatteryAAS;
var AAS_Struct AASTemp[2];
var localized string strAASMessage[6];
var bool bNewAvailableQuest;
var bool bNewAvailableEventQuest;
var LevelUpInfoStruct LevelUpInfo;
var ExpiredItemsStruct ExpiredItems;
var DurabilityWarningItemsStruct DurWarningItems;
var array<string> DestroyedDurabilityXItems;
var array<int> iSendUpdateQuickSlotList;
var export editinline BTPageLogo page_Logo;
var string pagename_Logo;
var export editinline BTPageLogin page_Login;
var string pagename_Login;
var export editinline BTPageLobby page_Lobby2;
var string pagename_Lobby2;
var export editinline BTPageCharacterCreation page_CharacterCreation;
var string pagename_CharacterCreation;
var export editinline BTPageServerSelection page_ServerSelection;
var string pagename_ServerSelection;
var export editinline BTPageRoomLobby page_RoomLobby;
var string pagename_RoomLobby;
var export editinline BTPageMatchResult page_MatchResult2;
var string pagename_MatchResult2;
var export editinline BTPageAuction page_Auction;
var string pagename_Auction;
var export editinline BTPageHelp page_Help;
var string pagename_Help;
var export editinline BTPageMail page_Mail;
var string pagename_Mail;
var export editinline BTPageStore page_Store;
var string pagename_Store;
var export editinline BTPageInventory page_Inventory;
var string pagename_Inventory;
var export editinline BTPageMyInfo page_MyInfo;
var string pagename_MyInfo;
var export editinline BTPageClan page_Clan;
var string pagename_Clan;
var export editinline BTPageCredit page_Credit;
var string pagename_Credit;
var export editinline BTPageClanWar page_ClanWar;
var string pagename_ClanWar;
var Core.Object.EPage PageOnOpen;
var export editinline BTNetGUIPage page_curr;
var array<export editinline BTNetGUIPage> Pages;
var string szAccountName;
var string szLoginServerIP;
var int szLoginServerPort;
var int GameRunningCount;
var bool bConnectedLoginServer;
var bool bConnectedChannelServer;
var bool bAuthKeySuccess;
var string DefaultLobbyBGM;
var string LastMainPageBGM;
var transient int iUID;
var transient int iChannel;
var string ServerName;
var string ServerShortName;
var int ServerGroupID;
var int ServerID;
var int GameRoomID;
var string ServerGroupName;
var string ChannelName;
var transient int iRoomNum;
var int NatType;
var array<string> NatAddrs;
var array<int> NatPorts;
var BTNatDiag NatDiag;
var float TimeNatDiagStarted;
var int NatCheckLoop;
var float NatDiagInterval;
var localized string LocalLogStr[9];
var localized string strNatType[4];
var localized string strCashCharge;
var delegate<delegateCheckNat> __delegateCheckNat__Delegate;
var delegate<UpdateRecv_ClanInfo> __UpdateRecv_ClanInfo__Delegate;
var delegate<UpdateExpiredItemList> __UpdateExpiredItemList__Delegate;
var delegate<UpdateDurabilityWarningItemList> __UpdateDurabilityWarningItemList__Delegate;
var delegate<UpdateWebzenInvenList> __UpdateWebzenInvenList__Delegate;
var delegate<UpdateWebzenInvenListEnd> __UpdateWebzenInvenListEnd__Delegate;
var delegate<ClearChatLog> __ClearChatLog__Delegate;
var delegate<NormalChatLog> __NormalChatLog__Delegate;
var delegate<ClanChatLog> __ClanChatLog__Delegate;
var delegate<WhisperChatLog> __WhisperChatLog__Delegate;
var delegate<SelfChatLog> __SelfChatLog__Delegate;
var delegate<SystemChatLog> __SystemChatLog__Delegate;
var delegate<TeamChatLog> __TeamChatLog__Delegate;
var delegate<BroadCastItemChatLog> __BroadCastItemChatLog__Delegate;
var delegate<ClearChatLog_Extra> __ClearChatLog_Extra__Delegate;
var delegate<NormalChatLog_Extra> __NormalChatLog_Extra__Delegate;
var delegate<ClanChatLog_Extra> __ClanChatLog_Extra__Delegate;
var delegate<WhisperChatLog_Extra> __WhisperChatLog_Extra__Delegate;
var delegate<SelfChatLog_Extra> __SelfChatLog_Extra__Delegate;
var delegate<SystemChatLog_Extra> __SystemChatLog_Extra__Delegate;
var delegate<TeamChatLog_Extra> __TeamChatLog_Extra__Delegate;
var delegate<BroadCastItemChatLog_Extra> __BroadCastItemChatLog_Extra__Delegate;

delegate delegateCheckNat();
delegate UpdateRecv_ClanInfo(BTNetMainMenu MainMenu);
delegate UpdateExpiredItemList(BTNetMainMenu MainMenu);
delegate UpdateDurabilityWarningItemList(BTNetMainMenu MainMenu);
function SetNewMailArrived(bool B)
{
    bNewMailArrived = B;
    // End:0x40
    if(BTNetGUIPageHK(page_curr) != none)
    {
        BTNetGUIPageHK(page_curr).TPTopMenu.SetNewMailArrived(bNewMailArrived);
    }
}

function bool sfReqWebzenInvenList(string StorageType)
{
    // End:0x27
    if(WZILP.bLock)
    {
        Log("WZILP.bLock is true");
        return false;
    }
    Log("[BTNetMainMenu::sfReqWebzenInvenList] Global Version false");
    return false;
}

function StopWebzenInvenList()
{
    WZILP.bLock = false;
}

delegate UpdateWebzenInvenList(BTNetMainMenu MainMenu);
delegate UpdateWebzenInvenListEnd(BTNetMainMenu MainMenu);
function ChannelToLogin_OnEventTimer(int Index)
{
    Log("[BTNetMainMenu::ChannelToLogin_OnEventTimer]");
    class'BTWindowDefineStateHK'.static.CloseWindowAllByName(Controller, class'BTWindowDefineStateHK');
    // End:0xbe
    if(bConnectedLoginServer == false)
    {
        Log("InitializeTcpLogin()");
        InitializeTcpLogin(rGameMgr.kEventTimerList[Index].EventDelegate.Data_String[0], rGameMgr.kEventTimerList[Index].EventDelegate.Data_Int[0]);
    }
    // End:0xe5
    else
    {
        Log("Illegal bConnectedLoginServer==true");
    }
}

function ChannelToLogin(string IP, int Port)
{
    local DelegateEventTimer det;

    Log("[BTNetMainMenu::ChannelToLogin] ip=" $ IP $ " port=" $ string(Port));
    Log("TcpChannel.Close()");
    iChannel = -1;
    TcpChannel.Close();
    bConnectedChannelServer = false;
    det = new class'DelegateEventTimer';
    det.__OnEventTimer__Delegate = ChannelToLogin_OnEventTimer;
    det.Data_String[0] = IP;
    det.Data_Int[0] = Port;
    rGameMgr.AddEventTimerHMS(0, 0, 0, 0, det, 500);
    class'BTWindowDefineStateHK'.static.ShowState(Controller, 7);
}

function ChannelToLogin2(string IP, int Port)
{
    Log("[BTNetMainMenu::ChannelToLogin2] ip=" $ IP $ " port=" $ string(Port));
    Log("TcpChannel.Close()");
    iChannel = -1;
    TcpChannel.Close();
    bConnectedChannelServer = false;
    // End:0xb1
    if(bConnectedLoginServer == false)
    {
        Log("InitializeTcpLogin()");
        InitializeTcpLogin(IP, Port);
    }
    // End:0xd8
    else
    {
        Log("Illegal bConnectedLoginServer==true");
    }
}

function LoginToChannel(string IP, int Port, int DataPort)
{
    Log("[BTNetMainMenu::LoginToChannel] ip=" $ IP $ " port=" $ string(Port) $ " dataPort=" $ string(DataPort));
    Log("TcpLogin.Close()");
    TcpLogin.Close();
    bConnectedLoginServer = false;
    // End:0xc1
    if(bConnectedChannelServer == false)
    {
        Log("InitializeTcpChannel()");
        InitializeTcpChannel(IP, Port, DataPort);
    }
    // End:0xea
    else
    {
        Log("Illegal bConnectedChannelServer==true");
    }
}

function AddDurabilityWarningItem(BtrDouble UniqueID, int ItemID, int SlotPos, int PartID, int Durability)
{
    DurWarningItems.bDurWarningItem = true;
    DurWarningItems.items.Length = DurWarningItems.items.Length + 1;
    DurWarningItems.items[DurWarningItems.items.Length - 1].UniqueID = UniqueID;
    DurWarningItems.items[DurWarningItems.items.Length - 1].ItemID = ItemID;
    DurWarningItems.items[DurWarningItems.items.Length - 1].SlotPos = SlotPos;
    DurWarningItems.items[DurWarningItems.items.Length - 1].PartID = PartID;
    DurWarningItems.items[DurWarningItems.items.Length - 1].Durability = Durability;
}

function AddDurabilityWarningItemRepairCost(BtrDouble UniqueID, int RepairCost)
{
    local int i;
    local wItemBoxHK ItemInfo;

    i = 0;
    J0x07:
    // End:0xb4 [While If]
    if(i < DurWarningItems.items.Length)
    {
        // End:0xaa
        if(UnresolvedNativeFunction_99(DurWarningItems.items[i].UniqueID, UniqueID))
        {
            ItemInfo = self.rGameMgr.FindUIItem(DurWarningItems.items[i].ItemID);
            Log(ItemInfo.ItemName $ ", RC=" $ string(RepairCost));
            DurWarningItems.items[i].RepairCost = RepairCost;
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function CompleteDurabilityWarningItem()
{
    DurWarningItems.bDurWarningItem = false;
    DurWarningItems.bReqRepairCost = false;
    DurWarningItems.items.Length = 0;
}

function AddExpiredItem(int ItemID, BtrDouble UniqueID, int SlotPos, int PartID)
{
    ExpiredItems.bExpiredItem = true;
    ExpiredItems.items.Length = ExpiredItems.items.Length + 1;
    ExpiredItems.items[ExpiredItems.items.Length - 1].ItemID = ItemID;
    ExpiredItems.items[ExpiredItems.items.Length - 1].SlotPos = SlotPos;
    ExpiredItems.items[ExpiredItems.items.Length - 1].PartID = PartID;
    ExpiredItems.items[ExpiredItems.items.Length - 1].UniqueItemID = UniqueID;
    ExpiredItems.items[ExpiredItems.items.Length - 1].UniqueSkillID = 0;
}

function AddExpiredSkillItem(int ItemID, int UniqueID, int SlotPos)
{
    ExpiredItems.bExpiredItem = true;
    ExpiredItems.items.Length = ExpiredItems.items.Length + 1;
    ExpiredItems.items[ExpiredItems.items.Length - 1].ItemID = ItemID;
    ExpiredItems.items[ExpiredItems.items.Length - 1].SlotPos = SlotPos;
    ExpiredItems.items[ExpiredItems.items.Length - 1].PartID = 0;
    ExpiredItems.items[ExpiredItems.items.Length - 1].UniqueItemID = UnresolvedNativeFunction_99(0);
    ExpiredItems.items[ExpiredItems.items.Length - 1].UniqueSkillID = UniqueID;
}

function CompleteExpiredItem()
{
    ExpiredItems.bExpiredItem = false;
    ExpiredItems.items.Length = 0;
}

function bool CheckExpiredItemList()
{
    local int i;
    local export editinline BTWindowItemExpiredHK BTWindow;
    local wMatchMaker MM;
    local Core.Object.EPage Dest;
    local wGameManager GameMgr;

    Log("[BTNetMainMenu::CheckExpiredItemList]");
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x23a
    if(ExpiredItems.bExpiredItem && ExpiredItems.items.Length > 0)
    {
        BTWindow = BTWindowItemExpiredHK(Controller.TopPage());
        // End:0x15f
        if(BTWindow == none)
        {
            // End:0xfb
            if(eCurrPage == 7 || eCurrPage == 5)
            {
                Dest = 7;
            }
            // End:0x103
            else
            {
                Dest = 10;
            }
            BTWindow = BTWindowItemExpiredHK(page_Main.pwm.CreateAndPush(Dest, "GUIWarfare.BTWindowItemExpiredHK", true, 0));
            BTWindow.MainMenu = self;
        }
        i = 0;
        J0x166:
        // End:0x1fd [While If]
        if(i < ExpiredItems.items.Length)
        {
            BTWindow.AddItem(ExpiredItems.items[i].ItemID, ExpiredItems.items[i].UniqueItemID, ExpiredItems.items[i].UniqueSkillID, ExpiredItems.items[i].PartID, ExpiredItems.items[i].SlotPos);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x166;
        }
        BTWindow.AddSubMenuBtn();
        BTWindow.TPItemList.UpdateServerTime(GameMgr.kClientTime);
        CompleteExpiredItem();
        return true;
    }
    CheckDestroyedDurabilityXItemList();
    return false;
}

function bool CheckDurabilityWarningItemList()
{
    local int i;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local array<BtrDouble> repairuid;
    local wGameManager GameMgr;
    local array<BtrDouble> A;
    local array<int> B;

    Log("[BTNetMainMenu::CheckDurabilityWarningItemList]");
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x288
    if(DurWarningItems.bDurWarningItem && DurWarningItems.items.Length > 0)
    {
        i = 0;
        J0x8a:
        // End:0x1f5 [While If]
        if(i < DurWarningItems.items.Length)
        {
            ItemInfo = GameMgr.FindUIItem(DurWarningItems.items[i].ItemID);
            instanceInfo = GameMgr.FindInstanceItem(DurWarningItems.items[i].UniqueID);
            // End:0x146
            if(instanceInfo.SlotPosition == 13)
            {
                // End:0x146
                if(GameMgr.IsQuickSlotBoxItem(instanceInfo.UniqueID) == false)
                {
                    DurWarningItems.items.Remove(i, 1);
                    -- i;
                }
                // End:0x1eb
                else
                {
                }
                // End:0x178
                if(instanceInfo != none)
                {
                    DurWarningItems.items[i].Durability = instanceInfo.Durability;
                }
                // End:0x18e
                else
                {
                    Log("InstanceInfo!=none");
                }
                // End:0x1eb
                if(ItemInfo.bRepair && ItemInfo.CostType == 0)
                {
                    repairuid.Length = repairuid.Length + 1;
                    repairuid[repairuid.Length - 1] = DurWarningItems.items[i].UniqueID;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x8a;
        }
        // End:0x22d
        if(DurWarningItems.items.Length == 0)
        {
            CompleteDurabilityWarningItem();
            page_Main.pwm.RemoveWindowOnStack(7, 'BTWindowItemDurabilityWarningHK');
            return true;
        }
        // End:0x25d
        if(repairuid.Length > 0)
        {
            DurWarningItems.bReqRepairCost = true;
            TcpChannel.sfReqRepairCost(repairuid);
        }
        // End:0x286
        else
        {
            DurWarningItems.bReqRepairCost = true;
            page_ServerSelection.rfAckRepairCost(0, "", A, B);
        }
        return true;
    }
    return false;
}

function bool CompleteDestroyedDurabilityXItemList()
{
    Log("[BTNetMainMenu::CompleteDestroyedDurabilityXItemList]");
    DestroyedDurabilityXItems.Length = 0;
    return true;
}

function bool CheckDestroyedDurabilityXItemList_OnOK(GUIComponent Sender)
{
    Log("[BTNetMainMenu::CheckDestroyedDurabilityXItemList_OnOK]");
    Controller.CloseMenu(false);
    SetPage(22, false);
    return true;
}

function bool CheckDestroyedDurabilityXItemList()
{
    local int i;
    local string ddx;

    Log("[BTNetMainMenu::CheckDestroyedDurabilityXItemList]");
    // End:0xd2
    if(DestroyedDurabilityXItems.Length > 0)
    {
        ddx = DestroyedDurabilityXItems[0];
        i = 1;
        J0x56:
        // End:0x8a [While If]
        if(i < DestroyedDurabilityXItems.Length)
        {
            ddx $= ", " $ DestroyedDurabilityXItems[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x56;
        }
        DestroyedDurabilityXItems.Length = 0;
        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 17, ddx);
        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = CheckDestroyedDurabilityXItemList_OnOK;
        return true;
    }
    return false;
}

function CheckItemWarning()
{
    Log("[BTNetMainMenu::CheckItemWarning]");
    // End:0x48
    if(bWarningDurabilityAndExpired)
    {
        bWarningDurabilityAndExpired = false;
        // End:0x48
        if(CheckDurabilityWarningItemList() == false)
        {
            CheckExpiredItemList();
        }
    }
}

function ClearServerChannelList()
{
    SCIList.Length = 0;
}

function AddServerChannelList(int ServerID, int ChannelID, string ServerIP, int serverPort, int ServerDataPort, string ServerName, string ServerShortName, string ChannelName, int ServerGroupID, string ServerGroupName, int IsClanChannel, string ChannelNickName, int ChannelType, bool IsDedicatedServer, optional int nCurUser, optional int nMaxUser)
{
    local int AddIdx;

    AddIdx = SCIList.Length;
    SCIList.Length = SCIList.Length + 1;
    SCIList[AddIdx].ServerID = ServerID;
    SCIList[AddIdx].ChannelID = ChannelID;
    SCIList[AddIdx].ServerIP = ServerIP;
    SCIList[AddIdx].serverPort = serverPort;
    SCIList[AddIdx].ServerDataPort = ServerDataPort;
    SCIList[AddIdx].ServerName = ServerName;
    SCIList[AddIdx].ServerShortName = ServerShortName;
    SCIList[AddIdx].ChannelName = ChannelName;
    SCIList[AddIdx].ServerGroupName = ServerGroupName;
    SCIList[AddIdx].ServerGroupID = ServerGroupID;
    SCIList[AddIdx].IsClanChannel = IsClanChannel;
    SCIList[AddIdx].ChannelNickName = ChannelNickName;
    SCIList[AddIdx].ChannelTypeValue = ChannelType;
    SCIList[AddIdx].IsDedicatedServer = IsDedicatedServer;
    SCIList[AddIdx].nCurUser = nCurUser;
    SCIList[AddIdx].nMaxUser = nMaxUser;
}

function int FindServerChannelInfoIndexByServerIP(string ServerIP, int serverPort, int ChannelID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x79 [While If]
    if(i < SCIList.Length)
    {
        // End:0x6f
        if(SCIList[i].ServerIP == ServerIP && SCIList[i].serverPort == serverPort && SCIList[i].ChannelID == ChannelID)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function int FindServerConnectionInfoIndex(int ServerID, int ChannelID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5d [While If]
    if(i < SCIList.Length)
    {
        // End:0x53
        if(SCIList[i].ServerID == ServerID && SCIList[i].ChannelID == ChannelID)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function string FindServerName(int ServerID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4c [While If]
    if(i < SCIList.Length)
    {
        // End:0x42
        if(SCIList[i].ServerID == ServerID)
        {
            return SCIList[i].ServerName;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return "";
}

function string FindServerShortName(int ServerID, int ChannelID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x68 [While If]
    if(i < SCIList.Length)
    {
        // End:0x5e
        if(SCIList[i].ServerID == ServerID && SCIList[i].ChannelID == ChannelID)
        {
            return SCIList[i].ServerShortName;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return "";
}

function string FindChannelNickName(int ServerID, int ChannelID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x68 [While If]
    if(i < SCIList.Length)
    {
        // End:0x5e
        if(SCIList[i].ServerID == ServerID && SCIList[i].ChannelID == ChannelID)
        {
            return SCIList[i].ChannelNickName;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return "";
}

function StartAutoMove(int Server, int Channel, int gameroom, optional string Password, optional int ClanMatch_EnterState)
{
    local export editinline BTNetGUIPageHK currp;

    UnresolvedNativeFunction_97("[BTNetMainMenu::StartAutoMove] (" $ string(Server) $ "," $ string(Channel) $ "," $ string(gameroom) $ "," $ Password $ ")");
    Log("[BTNetMainMenu::StartAutoMove] (" $ string(Server) $ "," $ string(Channel) $ "," $ string(gameroom) $ "," $ Password $ ")");
    // End:0xc0
    if(bAutoMove)
    {
        return;
    }
    // End:0xcd
    if(page_curr == none)
    {
        return;
    }
    bAutoMove = true;
    AutoMoveClanWar = ClanMatch_EnterState;
    AutoMoveServerID = Server;
    AutoMoveChannelID = Channel;
    AutoMoveGameRoomNum = gameroom;
    AutoMoveGameRoomPassword = Password;
    AutoMoveState = 0;
    AutoMoveDirectionOut = true;
    // End:0x1bd
    if(rMM.kServerID == AutoMoveServerID && rMM.kChannelID == AutoMoveChannelID)
    {
        // End:0x195
        if(AutoMoveClanWar == 0 && AutoMoveGameRoomNum != -1 && rMM.kRoomID == AutoMoveGameRoomNum)
        {
            AutoMoveState = 2;
            EndAutoMove();
        }
        // End:0x1bd
        else
        {
            AutoMoveState = 1;
            // End:0x1bd
            if(rMM.kRoomID == -1)
            {
                AutoMoveDirectionOut = false;
            }
        }
    }
    UnresolvedNativeFunction_97("[BTNetMainMenu::StartAutoMove] AutoMoveState=" $ string(AutoMoveState) $ ", AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut));
    Log("[BTNetMainMenu::StartAutoMove] AutoMoveState=" $ string(AutoMoveState) $ ", AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut));
    // End:0x2ec
    if(page_Lobby2 != none && page_curr == page_Lobby2 || page_RoomLobby != none && page_curr == page_RoomLobby)
    {
        UnresolvedNativeFunction_97("lobby or roomlobby");
        Log("lobby or roomlobby");
        KeepMoving();
    }
    // End:0x3d4
    else
    {
        currp = BTNetGUIPageHK(page_curr);
        // End:0x3a7
        if(currp != none)
        {
            // End:0x356
            if(page_curr == page_ServerSelection)
            {
                UnresolvedNativeFunction_97("serverselection");
                Log("serverselection");
                AutoMoveState = 0;
                AutoMoveDirectionOut = false;
                KeepMoving();
            }
            // End:0x3a2
            else
            {
                UnresolvedNativeFunction_97("other page");
                Log("other page");
                currp.TPTopMenu.TopMenuButton_OnClick(currp.TPTopMenu.GoBack);
            }
            return;
        }
        // End:0x3d4
        else
        {
            UnresolvedNativeFunction_97("is not guipage");
            Log("is not guipage");
            EndAutoMove();
            return;
        }
    }
}

function EndAutoMove()
{
    local export editinline BTWindowHK BTWindow;

    UnresolvedNativeFunction_97("[BTNetMainMenu::EndAutoMove]");
    Log("[BTNetMainMenu::EndAutoMove]");
    // End:0x7e
    if(bAutoMove)
    {
        UnresolvedNativeFunction_97("Prev bAutoMove==true");
        Log("Prev bAutoMove==true");
    }
    // End:0xb1
    else
    {
        UnresolvedNativeFunction_97("Prev bAutoMove==false");
        Log("Prev bAutoMove==false");
    }
    bAutoMove = false;
    BTWindow = BTWindowHK(Controller.TopPage());
    J0xd3:
    // End:0x14a [While If]
    if(BTWindow != none)
    {
        UnresolvedNativeFunction_97(string(BTWindow.Name) @ "CloseMenu");
        Log(string(BTWindow.Name) @ "CloseMenu");
        Controller.CloseMenu(false);
        BTWindow = BTWindowHK(Controller.TopPage());
        // This is an implied JumpToken; Continue!
        goto J0xd3;
    }
}

function KeepMoving()
{
    UnresolvedNativeFunction_97("[BTNetMainMenu::KeepMoving] bAutoMove=" $ string(bAutoMove) $ ", AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut) $ "(" $ string(AutoMoveServerID) $ "," $ string(AutoMoveChannelID) $ "," $ string(AutoMoveGameRoomNum) $ "," $ AutoMoveGameRoomPassword $ ")");
    UnresolvedNativeFunction_97("[BTNetMainMenu::KeepMoving] CurrentPos=" $ "(" $ string(rMM.kServerID) $ "," $ string(rMM.kChannelID) $ "," $ string(rMM.kRoomID) $ ")");
    Log("[BTNetMainMenu::KeepMoving] bAutoMove=" $ string(bAutoMove) $ ", AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut) $ "(" $ string(AutoMoveServerID) $ "," $ string(AutoMoveChannelID) $ "," $ string(AutoMoveGameRoomNum) $ "," $ AutoMoveGameRoomPassword $ ")");
    Log("[BTNetMainMenu::KeepMoving] CurrentPos=" $ "(" $ string(rMM.kServerID) $ "," $ string(rMM.kChannelID) $ "," $ string(rMM.kRoomID) $ ")");
    // End:0x225
    if(bAutoMove == false)
    {
        return;
    }
    // End:0x23a
    else
    {
        class'BTWindowAutoStateHK'.static.ShowState(Controller, 1);
    }
    // End:0x4f1
    if(AutoMoveDirectionOut)
    {
        // End:0x396
        if(AutoMoveState <= 0)
        {
            // End:0x396
            if(page_Lobby2 != none && page_Lobby2 == page_curr)
            {
                UnresolvedNativeFunction_97("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut) $ ", AutoMoveState=" $ string(AutoMoveState));
                UnresolvedNativeFunction_97("TcpChannel.sfReqLeaveChannel(" $ string(rMM.kChannelID) $ ")");
                Log("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut) $ ", AutoMoveState=" $ string(AutoMoveState));
                Log("TcpChannel.sfReqLeaveChannel(" $ string(rMM.kChannelID) $ ")");
                page_Lobby2.bGoBack = true;
                TcpChannel.sfReqLeaveChannel(rMM.kChannelID);
                AutoMoveDirectionOut = false;
                return;
            }
        }
        // End:0x4ee
        if(AutoMoveState <= 1)
        {
            // End:0x4ee
            if(page_RoomLobby != none && page_RoomLobby == page_curr)
            {
                UnresolvedNativeFunction_97("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut) $ ", AutoMoveState=" $ string(AutoMoveState));
                UnresolvedNativeFunction_97("TcpChannel.sfReqLeaveRoom(" $ string(rMM.kRoomID) $ ")");
                Log("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut) $ ", AutoMoveState=" $ string(AutoMoveState));
                Log("TcpChannel.sfReqLeaveRoom(" $ string(rMM.kRoomID) $ ")");
                page_RoomLobby.bSafeLeaveRoom = true;
                TcpChannel.sfReqLeaveRoom(rMM.kRoomID);
                // End:0x4ee
                if(AutoMoveState == 1)
                {
                    AutoMoveDirectionOut = false;
                }
            }
        }
    }
    // End:0x9c2
    else
    {
        // End:0x68e
        if(AutoMoveState <= 0)
        {
            // End:0x68e
            if(page_ServerSelection != none && page_curr == page_ServerSelection)
            {
                UnresolvedNativeFunction_97("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut) $ ", AutoMoveState=" $ string(AutoMoveState));
                UnresolvedNativeFunction_97("page_ServerSelection.AutoMoveTochannel()");
                UnresolvedNativeFunction_97("AutoMoveServerID=" $ string(AutoMoveServerID) $ ", AutoMoveChannelID=" $ string(AutoMoveChannelID));
                Log("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut) $ ", AutoMoveState=" $ string(AutoMoveState));
                Log("page_ServerSelection.AutoMoveTochannel()");
                Log("AutoMoveServerID=" $ string(AutoMoveServerID) $ ", AutoMoveChannelID=" $ string(AutoMoveChannelID));
                page_ServerSelection.AutoMoveTochannel(AutoMoveServerID, AutoMoveChannelID);
                return;
            }
        }
        // End:0x9ac
        if(AutoMoveState <= 1)
        {
            // End:0x9ac
            if(page_Lobby2 != none && page_curr == page_Lobby2)
            {
                // End:0x894
                if(AutoMoveGameRoomNum != -1)
                {
                    UnresolvedNativeFunction_97("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut) $ ", AutoMoveState=" $ string(AutoMoveState));
                    UnresolvedNativeFunction_97("page_ServerSelection.AutoMoveToRoom()");
                    UnresolvedNativeFunction_97("AutoMoveGameRoomNum=" $ string(AutoMoveGameRoomNum) $ ", AutoMoveGameRoomPassword=" $ AutoMoveGameRoomPassword);
                    Log("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut) $ ", AutoMoveState=" $ string(AutoMoveState));
                    Log("page_ServerSelection.AutoMoveToRoom()");
                    Log("AutoMoveGameRoomNum=" $ string(AutoMoveGameRoomNum) $ ", AutoMoveGameRoomPassword=" $ AutoMoveGameRoomPassword);
                    // End:0x850
                    if(AutoMoveClanWar == 1)
                    {
                        page_Lobby2.AutoMoveToClanReadyRoom(AutoMoveGameRoomNum, AutoMoveGameRoomPassword);
                    }
                    // End:0x891
                    else
                    {
                        // End:0x878
                        if(AutoMoveClanWar == 2)
                        {
                            page_Lobby2.AutoMoveReturnClanReadyRoom(AutoMoveGameRoomNum, AutoMoveGameRoomPassword);
                        }
                        // End:0x891
                        else
                        {
                            page_Lobby2.AutoMoveToRoom(AutoMoveGameRoomNum, AutoMoveGameRoomPassword);
                        }
                    }
                }
                // End:0x9aa
                else
                {
                    UnresolvedNativeFunction_97("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut) $ ", AutoMoveState=" $ string(AutoMoveState));
                    UnresolvedNativeFunction_97("AutoMoveGameRoomNum=" $ string(AutoMoveGameRoomNum) $ ", AutoMoveGameRoomPassword=" $ AutoMoveGameRoomPassword);
                    Log("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut) $ ", AutoMoveState=" $ string(AutoMoveState));
                    Log("AutoMoveGameRoomNum=" $ string(AutoMoveGameRoomNum) $ ", AutoMoveGameRoomPassword=" $ AutoMoveGameRoomPassword);
                    EndAutoMove();
                }
                return;
            }
        }
        // End:0x9c2
        if(AutoMoveState <= 2)
        {
            EndAutoMove();
            return;
        }
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local string strTemp;
    local bool bFind;

    super.InitComponent(MyController, myOwner);
    Log("[BTNetMainMenu::InitComponent]");
    PrevChatMode.ChatType = 1;
    ChatLog.Length = 10;
    rMM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    rMyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    rGameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x345
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        bFind = false;
        strTemp = "";
        strTemp = Controller.ViewportOwner.Actor.ConsoleCommand("GETTEST_STRING TEST IP");
        // End:0x179
        if(strTemp != "")
        {
            szLoginServerIP = strTemp;
            bFind = true;
        }
        strTemp = "";
        strTemp = Controller.ViewportOwner.Actor.ConsoleCommand("GETTEST_STRING TEST Port");
        // End:0x1db
        if(strTemp != "")
        {
            szLoginServerPort = int(strTemp);
        }
        // End:0x342
        if(bFind == false)
        {
            // End:0x231
            if("NA" == Controller.ViewportOwner.Actor.Level.AuthLogin_RegionKey)
            {
                szLoginServerIP = "211.43.146.69";
            }
            // End:0x2ce
            else
            {
                // End:0x27c
                if("EU" == Controller.ViewportOwner.Actor.Level.AuthLogin_RegionKey)
                {
                    szLoginServerIP = "211.43.159.197";
                }
                // End:0x2ce
                else
                {
                    // End:0x2c6
                    if("SA" == Controller.ViewportOwner.Actor.Level.AuthLogin_RegionKey)
                    {
                        szLoginServerIP = "211.43.146.74";
                    }
                    // End:0x2ce
                    else
                    {
                        szLoginServerIP = "";
                    }
                }
            }
            Log(string(self) $ " AuthLogin_RegionKey :" $ Controller.ViewportOwner.Actor.Level.AuthLogin_RegionKey $ "/ szLoginServerIP : " $ szLoginServerIP);
            szLoginServerPort = 56000;
        }
    }
    // End:0x486
    else
    {
        bFind = false;
        strTemp = "";
        strTemp = Controller.ViewportOwner.Actor.ConsoleCommand("GETTEST_STRING TEST IP");
        // End:0x3b3
        if(strTemp != "")
        {
            szLoginServerIP = strTemp;
            bFind = true;
        }
        strTemp = "";
        strTemp = Controller.ViewportOwner.Actor.ConsoleCommand("GETTEST_STRING TEST Port");
        // End:0x415
        if(strTemp != "")
        {
            szLoginServerPort = int(strTemp);
        }
        // End:0x486
        if(bFind == false)
        {
            // End:0x466
            if(Controller.ViewportOwner.Actor.Level.bServiceTestBuild)
            {
                szLoginServerIP = "218.234.76.43";
            }
            // End:0x47b
            else
            {
                szLoginServerIP = "202.31.212.65";
            }
            szLoginServerPort = 55000;
        }
    }
    Log("page_Main.TcpLogin.Connect( " $ szLoginServerIP $ ", " $ string(szLoginServerPort) $ " ) Start");
    rMM.bServerConnected = page_Main.TcpLogin.Connect(szLoginServerIP, szLoginServerPort);
    Log("page_Main.TcpLogin.Connect( " $ szLoginServerIP $ ", " $ string(szLoginServerPort) $ " ) End");
    pwm = new class'PageOnWindowManager';
    pwm.Init(Controller);
}

function ShowPlayTimePerHour_OnEventTimer(int Index)
{
    local string Msg;

    CheckOneHour += 1;
    Msg = class'BTWindowDefineInfoHK'.static.GetFormatString(174, string(CheckOneHour));
    PlayerOwner().dblog(Msg);
    AddChatLog(Msg, 5, true);
}

function InitializeTcpChannel(string IP, int Port, int DataPort)
{
    Log("[BTNetMainMenu::InitializeTcpChannel]" $ " ip=" $ IP $ " port=" $ string(Port));
    // End:0x65
    if(NetGameData != none)
    {
        NetGameData.ClearNetData();
    }
    NetGameData = new class'BTNetGameData';
    // End:0xba
    if(TcpChannel != none)
    {
        Log("TcpChannel is none");
        Log("TcpChannel.Close()");
        TcpChannel.Close();
    }
    Log("TcpChannel = new class'BTTcpHandler'");
    TcpChannel = new class'BTTcpHandler';
    Log("TcpChannel.InitNetwork()");
    TcpChannel.InitNetwork();
    BTTcpHandler(TcpChannel).MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    BTTcpHandler(TcpChannel).GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Controller.ViewportOwner.Actor.Level.GetMatchMaker().kTcpChannel = TcpChannel;
    Controller.ViewportOwner.Actor.Level.GetMatchMaker().__OnReqSuccessStartGame__Delegate = BTTcpHandler(TcpChannel).OnReqSuccessStartGame;
    Log("TcpChannel.Connect(" $ IP $ ", " $ string(Port) $ ")");
    TcpChannel.Connect(IP, Port);
    BTTcpHandler(TcpChannel).MainMenu = self;
    rMM.szChannelIP = IP;
    rMM.nChannelPort = Port;
    rMM.StartTickCheck();
    Controller.TcpHandler = TcpChannel;
}

function InitializeTcpLogin(string IP, int Port)
{
    TcpLogin = GetTcpLogin();
    TcpLogin.Connect(IP, Port);
}

function BTTcpLink_Login GetTcpLogin()
{
    local BTTcpLoginHandler Login;

    Log("[BTNetMainMenu::GetTcpLogin]");
    Log("login = new class'BTTcpLoginHandler';");
    Login = new class'BTTcpLoginHandler';
    Log("login.InitNetwork();");
    Login.InitNetwork();
    Log("login.MainMenu = self;");
    Login.MainMenu = self;
    return Login;
}

function deleOnOpen()
{
    OnOpen();
    Log("[BTNetMainMenu::deleOnOpen]");
    // End:0x5c
    if(PlayerOwner().Level.GetMatchMaker().InGamePlaying)
    {
        Controller.CloseAll(false, true);
    }
    // End:0x68
    else
    {
        SetPage(PageOnOpen, false);
    }
}

function bool deleOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x22
    if(key == 27 && State == 1)
    {
        return true;
    }
    // End:0x24
    else
    {
        return false;
    }
}

function deleOnClose(optional bool bCancelled)
{
    Log("[BTNetMainMenu::deleOnClose]");
    SaveConfig();
}

event rfReqStartNatDiag(string Server1Addr, int Server1Port, string Server2Addr, int Server2Port)
{
    Log("[BTNetMainMenu::rfReqStartNatDiag]");
    NatAddrs.Length = 2;
    NatAddrs[0] = Server1Addr;
    NatAddrs[1] = Server2Addr;
    NatPorts.Length = 2;
    NatPorts[0] = Server1Port;
    NatPorts[1] = Server2Port;
    Console(Controller.Master.Console).ConsoleCommand("NatCheckOn");
}

function StartNatCheck()
{
    // End:0x56
    if(NatType != -1)
    {
        TcpChannel.sfAckStartNatDiag(NatType);
        UnresolvedNativeFunction_97("NatType is " $ string(NatType));
        Log("NatType is " $ string(NatType));
        return;
    }
    // End:0xf9
    if(NatCheckLoop <= 0)
    {
        UnresolvedNativeFunction_97("[BTNetMainMenu::StartNatCheck] Start!!");
        Log("[BTNetMainMenu::StartNatCheck] Start!!");
        NatCheckLoop = 3;
        Console(Controller.Master.Console).ConsoleCommand("NatCheckOn");
        CheckNatPhrase0HK();
    }
    // End:0x18a
    else
    {
        UnresolvedNativeFunction_97("[BTNetMainMenu::StartNatCheck] Now Checking!! NatCheckLoop=" $ string(NatCheckLoop));
        Log("[BTNetMainMenu::StartNatCheck] Now Checking!! NatCheckLoop=" $ string(NatCheckLoop));
    }
}

function CheckNatPhrase0HK()
{
    // End:0x15
    if(NatCheckLoop > 0)
    {
        -- NatCheckLoop;
    }
    // End:0xd1
    else
    {
        NatDiag = none;
        NatCheckLoop = 0;
        __delegateCheckNat__Delegate = None;
        UnresolvedNativeFunction_97("[BTNetMainMenu::CheckNatPhrase0HK] NatCheckLoop Over!!! Stop Nat Checking!!!");
        Log("[BTNetMainMenu::CheckNatPhrase0HK] NatCheckLoop Over!!! Stop Nat Checking!!!");
        return;
    }
    UnresolvedNativeFunction_97("[BTNetMainMenu::CheckNatPhrase0HK] Start!!!");
    Log("[BTNetMainMenu::CheckNatPhrase0HK] Start!!!");
    NatDiag = new class'BTNatDiag';
    Log("[BTNetMainMenu::CheckNatPhrase0HK] NatDiag.Start before");
    NatDiag.Start(NatAddrs, NatPorts);
    Log("[BTNetMainMenu::CheckNatPhrase0HK] NatDiag.Start successful");
    TimeNatDiagStarted = Controller.ViewportOwner.Actor.Level.TimeSeconds;
    NatDiagInterval = 3.0;
    __delegateCheckNat__Delegate = CheckNatPhrase1HK;
}

function CheckNatPhrase1HK()
{
    UnresolvedNativeFunction_97("[BTNetMainMenu::CheckNatPhrase1HK] before NatDiag.ProcessStep1()");
    Log("[BTNetMainMenu::CheckNatPhrase1HK] before NatDiag.ProcessStep1()");
    // End:0x194
    if(NatDiag.ProcessStep1())
    {
        UnresolvedNativeFunction_97("[BTNetMainMenu::CheckNatPhrase1HK] Success!!!");
        Log("[BTNetMainMenu::CheckNatPhrase1HK] Success!!!");
        __delegateCheckNat__Delegate = None;
        NatType = NatDiag.NatType;
        rMM.nNatType = NatType;
        rMM.SetNatTypeToEngine(NatType);
        TcpChannel.sfAckStartNatDiag(NatType);
        UnresolvedNativeFunction_97("NatType is " $ string(NatType));
        Log("NatType is " $ string(NatType));
        NatCheckLoop = 0;
    }
    // End:0x234
    else
    {
        UnresolvedNativeFunction_97("[BTNetMainMenu::CheckNatPhrase1HK] Failed");
        Log("[BTNetMainMenu::CheckNatPhrase1HK] Failed");
        TimeNatDiagStarted = Controller.ViewportOwner.Actor.Level.TimeSeconds;
        NatDiagInterval = 3.0;
        __delegateCheckNat__Delegate = CheckNatPhrase2HK;
    }
}

function CheckNatPhrase2HK()
{
    UnresolvedNativeFunction_97("[BTNetMainMenu::CheckNatPhrase2HK] before NatDiag.ProcessStep2()");
    Log("[BTNetMainMenu::CheckNatPhrase2HK] before NatDiag.ProcessStep2()");
    // End:0x194
    if(NatDiag.ProcessStep2())
    {
        UnresolvedNativeFunction_97("[BTNetMainMenu::CheckNatPhrase2HK] Success!!!");
        Log("[BTNetMainMenu::CheckNatPhrase2HK] Success!!!");
        __delegateCheckNat__Delegate = None;
        NatType = NatDiag.NatType;
        rMM.nNatType = NatType;
        rMM.SetNatTypeToEngine(NatType);
        TcpChannel.sfAckStartNatDiag(NatType);
        UnresolvedNativeFunction_97("NatType is " $ string(NatType));
        Log("NatType is " $ string(NatType));
        NatCheckLoop = 0;
    }
    // End:0x234
    else
    {
        UnresolvedNativeFunction_97("[BTNetMainMenu::CheckNatPhrase2HK] Failed");
        Log("[BTNetMainMenu::CheckNatPhrase2HK] Failed");
        TimeNatDiagStarted = Controller.ViewportOwner.Actor.Level.TimeSeconds;
        NatDiagInterval = 3.0;
        __delegateCheckNat__Delegate = CheckNatPhrase0HK;
    }
}

event bool rfReqForceNatTypeSetting(int NatType)
{
    UnresolvedNativeFunction_97("[BTNetMainMenu::rfReqForceNatTypeSetting] NatType=" $ string(NatType));
    Log("[BTNetMainMenu::rfReqForceNatTypeSetting] NatType=" $ string(NatType));
    self.NatType = NatType;
    rMM.nNatType = NatType;
    rMM.SetNatTypeToEngine(NatType);
    __delegateCheckNat__Delegate = None;
    return true;
}

function HaltNetwork()
{
    local bool resultChannel, resultLogin;

    Log("[BTNetMainMenu::HaltNetwork]");
    resultChannel = TcpChannel.Close();
    resultLogin = TcpLogin.Close();
    Log("[BTNetMainMenu::HaltNetwork]" $ " Channel=" $ string(resultChannel) $ " Login=" $ string(resultLogin));
}

function SetPage(Core.Object.EPage PageType, bool closeLastMenu)
{
    local int i;
    local bool bExistPage;

    Log("[BTNetMainMenu::SetPage]" $ " PageType=" $ string(GetEnum(enum'EPage', PageType)) $ " CloseLastMenu=" $ string(closeLastMenu));
    SaveConfig();
    J0x60:
    // End:0xd5 [While If]
    if(page_curr != none && page_curr != self)
    {
        // End:0xc2
        if(Controller.TopPage() == none || Controller.TopPage() == self || Controller.TopPage() == page_curr)
        {
        }
        // End:0xd5
        else
        {
            Controller.CloseMenu(false);
            // This is an implied JumpToken; Continue!
            goto J0x60;
        }
    }
    // End:0x105
    if(Controller.TopPage() != self && closeLastMenu)
    {
        Controller.CloseMenu(false);
    }
    switch(PageType)
    {
        // End:0x114
        case 1:
            // End:0x577
            break;
        // End:0x15a
        case 2:
            Controller.OpenMenu(pagename_Logo);
            // End:0x157
            if(page_Logo == none)
            {
                page_Logo = BTPageLogo(Controller.FindPersistentMenuByName(pagename_Logo));
            }
            // End:0x577
            break;
        // End:0x1a0
        case 3:
            Controller.OpenMenu(pagename_Login);
            // End:0x19d
            if(page_Login == none)
            {
                page_Login = BTPageLogin(Controller.FindPersistentMenuByName(pagename_Login));
            }
            // End:0x577
            break;
        // End:0x1e6
        case 4:
            Controller.OpenMenu(pagename_CharacterCreation);
            // End:0x1e3
            if(page_CharacterCreation == none)
            {
                page_CharacterCreation = BTPageCharacterCreation(Controller.FindPersistentMenuByName(pagename_CharacterCreation));
            }
            // End:0x577
            break;
        // End:0x22c
        case 7:
            Controller.OpenMenu(pagename_Lobby2);
            // End:0x229
            if(page_Lobby2 == none)
            {
                page_Lobby2 = BTPageLobby(Controller.FindPersistentMenuByName(pagename_Lobby2));
            }
            // End:0x577
            break;
        // End:0x272
        case 5:
            Controller.OpenMenu(pagename_ServerSelection);
            // End:0x26f
            if(page_ServerSelection == none)
            {
                page_ServerSelection = BTPageServerSelection(Controller.FindPersistentMenuByName(pagename_ServerSelection));
            }
            // End:0x577
            break;
        // End:0x2b8
        case 10:
            Controller.OpenMenu(pagename_RoomLobby);
            // End:0x2b5
            if(page_RoomLobby == none)
            {
                page_RoomLobby = BTPageRoomLobby(Controller.FindPersistentMenuByName(pagename_RoomLobby));
            }
            // End:0x577
            break;
        // End:0x2fe
        case 12:
            Controller.OpenMenu(pagename_MatchResult2);
            // End:0x2fb
            if(page_MatchResult2 == none)
            {
                page_MatchResult2 = BTPageMatchResult(Controller.FindPersistentMenuByName(pagename_MatchResult2));
            }
            // End:0x577
            break;
        // End:0x344
        case 18:
            Controller.OpenMenu(pagename_Auction);
            // End:0x341
            if(page_Auction == none)
            {
                page_Auction = BTPageAuction(Controller.FindPersistentMenuByName(pagename_Auction));
            }
            // End:0x577
            break;
        // End:0x38a
        case 19:
            Controller.OpenMenu(pagename_Help);
            // End:0x387
            if(page_Help == none)
            {
                page_Help = BTPageHelp(Controller.FindPersistentMenuByName(pagename_Help));
            }
            // End:0x577
            break;
        // End:0x3d0
        case 20:
            Controller.OpenMenu(pagename_Mail);
            // End:0x3cd
            if(page_Mail == none)
            {
                page_Mail = BTPageMail(Controller.FindPersistentMenuByName(pagename_Mail));
            }
            // End:0x577
            break;
        // End:0x416
        case 21:
            Controller.OpenMenu(pagename_Store);
            // End:0x413
            if(page_Store == none)
            {
                page_Store = BTPageStore(Controller.FindPersistentMenuByName(pagename_Store));
            }
            // End:0x577
            break;
        // End:0x45c
        case 22:
            Controller.OpenMenu(pagename_Inventory);
            // End:0x459
            if(page_Inventory == none)
            {
                page_Inventory = BTPageInventory(Controller.FindPersistentMenuByName(pagename_Inventory));
            }
            // End:0x577
            break;
        // End:0x4a2
        case 23:
            Controller.OpenMenu(pagename_MyInfo);
            // End:0x49f
            if(page_MyInfo == none)
            {
                page_MyInfo = BTPageMyInfo(Controller.FindPersistentMenuByName(pagename_MyInfo));
            }
            // End:0x577
            break;
        // End:0x4e8
        case 24:
            Controller.OpenMenu(pagename_Clan);
            // End:0x4e5
            if(page_Clan == none)
            {
                page_Clan = BTPageClan(Controller.FindPersistentMenuByName(pagename_Clan));
            }
            // End:0x577
            break;
        // End:0x52e
        case 25:
            Controller.OpenMenu(pagename_Credit);
            // End:0x52b
            if(page_Credit == none)
            {
                page_Credit = BTPageCredit(Controller.FindPersistentMenuByName(pagename_Credit));
            }
            // End:0x577
            break;
        // End:0x574
        case 26:
            Controller.OpenMenu(pagename_ClanWar);
            // End:0x571
            if(page_ClanWar == none)
            {
                page_ClanWar = BTPageClanWar(Controller.FindPersistentMenuByName(pagename_ClanWar));
            }
            // End:0x577
            break;
        // End:0xffff
        default:
            eCurrPage = PageType;
            page_curr = BTNetGUIPage(Controller.TopPage());
            // End:0x5b5
            if(closeLastMenu)
            {
                Pages.Remove(Pages.Length - 1, 1);
            }
            // End:0x65a
            if(PageType != 1 && PageType != 0)
            {
                i = 0;
                J0x5de:
                // End:0x623 [While If]
                if(i < Pages.Length)
                {
                    // End:0x619
                    if(Pages[i] == page_curr)
                    {
                        Pages.Remove(-- i, 1);
                        bExistPage = true;
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x5de;
                }
                Pages.Length = Pages.Length + 1;
                Pages[Pages.Length - 1] = page_curr;
                page_curr.OnCompleteOpened();
            }
            // End:0x681
            else
            {
                // End:0x681
                if(PageType == 1)
                {
                    page_curr.OnBackToLastPage();
                    bExistPage = true;
                }
            }
            // End:0x69b
            if(bExistPage)
            {
                page_curr.FadeIn(false, true);
            }
}

function TcpLogin_OnConnect(int ErrCode)
{
    Log("[BTNetMainMenu::TcpLogin_OnConnect] ErrCode=" $ string(ErrCode));
    BTConsole(Controller.ViewportOwner.Console).MainMenu = self;
    // End:0xff
    if(ErrCode != 0)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 6, string(ErrCode));
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        Controller.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportS(ErrCode, class'BTWindowDefineInfoHK'.static.GetFormatString(6, string(ErrCode)));
    }
    // End:0x107
    else
    {
        bConnectedLoginServer = true;
    }
}

function TcpLogin_OnClose(int ErrCode)
{
    Log("[BTNetMainMenu::TcpLogin_OnClose] ErrCode=" $ string(ErrCode));
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 7, string(ErrCode));
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    Controller.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportS(ErrCode, class'BTWindowDefineInfoHK'.static.GetFormatString(7, string(ErrCode)));
    bConnectedLoginServer = false;
}

function TcpLogin_OnError(int ErrCode)
{
    Log("[BTNetMainMenu::TcpLogin_OnError] ErrCode=" $ string(ErrCode));
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 8, string(ErrCode));
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    Controller.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportS(ErrCode, class'BTWindowDefineInfoHK'.static.GetFormatString(8, string(ErrCode)));
    bConnectedLoginServer = false;
}

function bool TcpLogin_rfAckHash(int Result, string Error)
{
    Log("[BTNetMainMenu::TcpLogin_rfAckHash] Result=" $ string(Result) $ " Error=" $ Error);
    // End:0x58
    if(Result == 0)
    {
    }
    // End:0x118
    else
    {
        // End:0x102
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() && Controller.ViewportOwner.Actor.Level.bServiceBuildHK == false)
        {
            page_Main.HaltNetwork();
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 104);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        }
        // End:0x118
        else
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 104);
        }
    }
    return true;
}

function bool Exit_OnOK(GUIComponent Sender)
{
    Log("[BTNetMainMenu::Exit_OnOK]");
    Controller.ConsoleCommand("exit");
    return true;
}

function AddChatLog(string chatText, int ChatType, optional bool bForceUpdateLast)
{
    ChatLog[ChatLogTop].chatText = chatText;
    ChatLog[ChatLogTop].ChatType = ChatType;
    ++ ChatLogTop;
    // End:0x4a
    if(ChatLogTop >= ChatLog.Length)
    {
        ChatLogTop = 0;
    }
    // End:0x63
    if(bForceUpdateLast)
    {
        SelectChatLog(ChatType, chatText);
    }
}

function int GetChatLogTopIndex()
{
    return ChatLogTop;
}

delegate ClearChatLog();
delegate NormalChatLog(string cL);
delegate ClanChatLog(string cL);
delegate WhisperChatLog(string cL);
delegate SelfChatLog(string cL);
delegate SystemChatLog(string cL);
delegate TeamChatLog(string cL);
delegate BroadCastItemChatLog(string cL);
delegate ClearChatLog_Extra();
delegate NormalChatLog_Extra(string cL);
delegate ClanChatLog_Extra(string cL);
delegate WhisperChatLog_Extra(string cL);
delegate SelfChatLog_Extra(string cL);
delegate SystemChatLog_Extra(string cL);
delegate TeamChatLog_Extra(string cL);
delegate BroadCastItemChatLog_Extra(string cL);
function bool SelectChatLog(int ChatType, string chatText)
{
    switch(ChatType)
    {
        // End:0x0d
        case 0:
            return false;
        // End:0x32
        case 1:
            NormalChatLog(chatText);
            NormalChatLog_Extra(chatText);
            // End:0x119
            break;
        // End:0x58
        case 2:
            ClanChatLog(chatText);
            ClanChatLog_Extra(chatText);
            // End:0x119
            break;
        // End:0x7e
        case 3:
            WhisperChatLog(chatText);
            WhisperChatLog_Extra(chatText);
            // End:0x119
            break;
        // End:0xa4
        case 4:
            SelfChatLog(chatText);
            SelfChatLog_Extra(chatText);
            // End:0x119
            break;
        // End:0xca
        case 5:
            SystemChatLog(chatText);
            SystemChatLog_Extra(chatText);
            // End:0x119
            break;
        // End:0xf0
        case 6:
            TeamChatLog(chatText);
            TeamChatLog_Extra(chatText);
            // End:0x119
            break;
        // End:0x116
        case 7:
            BroadCastItemChatLog(chatText);
            BroadCastItemChatLog_Extra(chatText);
            // End:0x119
            break;
        // End:0xffff
        default:
            return true;
    }
}

function ResetChatLog()
{
    local int i;

    ChatLogTop = 0;
    i = 0;
    J0x0e:
    // End:0x3a [While If]
    if(i < ChatLog.Length)
    {
        ChatLog[i].ChatType = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0e;
    }
}

function UpdateChatLog()
{
    local int i, GCLTI;

    GCLTI = GetChatLogTopIndex();
    ClearChatLog();
    i = GCLTI;
    J0x21:
    // End:0x6a [While If]
    if(i < ChatLog.Length)
    {
        // End:0x60
        if(SelectChatLog(ChatLog[i].ChatType, ChatLog[i].chatText) == false)
        {
        }
        // End:0x6a
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x21;
        }
    }
    // End:0xc4
    if(GCLTI != 0)
    {
        i = 0;
        J0x7c:
        // End:0xc4 [While If]
        if(i < GCLTI)
        {
            // End:0xba
            if(SelectChatLog(ChatLog[i].ChatType, ChatLog[i].chatText) == false)
            {
            }
            // End:0xc4
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x7c;
            }
        }
    }
}

function bool TextToCommand(string Text)
{
    local array<string> arrText;
    local string Content;

    Split(Text, " ", arrText);
    Content = Mid(Text, Len(arrText[0]) + 1);
    // End:0x66
    if(arrText.Length >= 2)
    {
        switch(Locs(arrText[0]))
        {
            // End:0x63
            case "//dice":
                CommandType = 1;
                CommandParameter_int = int(arrText[1]);
                return true;
            // End:0xffff
            default:
            }
            return false;
}

function bool TextToGMCommand(string Text)
{
    local array<string> arrText;
    local string Content, content2;

    Split(Text, " ", arrText);
    Content = Mid(Text, Len(arrText[0]) + 1);
    content2 = Mid(Text, Len(arrText[0]) + Len(arrText[1]) + 1);
    // End:0x3a6
    if(arrText.Length >= 2)
    {
        switch(Locs(arrText[0]))
        {
            // End:0x75
            case "//notice_all":
            // End:0xdd
            case strNotice_All:
                TcpChannel.sfReqNotice_GM(0, rMM.kServerID, rMM.kChannelID, rMM.kRoomID, Content);
                AddChatLog("GMCommand : " $ Text, 5, true);
                return true;
            // End:0xf1
            case "//notice_server":
            // End:0x159
            case strNotice_Server:
                TcpChannel.sfReqNotice_GM(1, rMM.kServerID, rMM.kChannelID, rMM.kRoomID, Content);
                AddChatLog("GMCommand : " $ Text, 5, true);
                return true;
            // End:0x16e
            case "//notice_channel":
            // End:0x1d6
            case strNotice_Channel:
                TcpChannel.sfReqNotice_GM(2, rMM.kServerID, rMM.kChannelID, rMM.kRoomID, Content);
                AddChatLog("GMCommand : " $ Text, 5, true);
                return true;
            // End:0x1e8
            case "//notice_room":
            // End:0x309
            case strNotice_Room:
                // End:0x290
                if(arrText.Length >= 3 && IsDigit(arrText[1]))
                {
                    Content = Mid(Text, Len(arrText[0]) + Len(arrText[1]) + 2);
                    TcpChannel.sfReqNotice_GM(3, rMM.kServerID, rMM.kChannelID, int(arrText[1]), Content);
                    AddChatLog("GMCommand : " $ Text, 5, true);
                }
                // End:0x307
                else
                {
                    Content = Mid(Text, Len(arrText[0]) + 1);
                    TcpChannel.sfReqNotice_GM(3, rMM.kServerID, rMM.kChannelID, rMM.kRoomID, Content);
                    AddChatLog("GMCommand : " $ Text, 5, true);
                }
                return true;
            // End:0x314
            case "//kick":
            // End:0x352
            case strKick:
                TcpChannel.sfReqForceDisconnectUser_GM(arrText[1]);
                AddChatLog("GMCommand : " $ Text, 5, true);
                return true;
            // End:0x35e
            case "//title":
            // End:0x3a3
            case strChangeRoomTitle:
                TcpChannel.sfReqChangeRoomTitle_GM(int(arrText[1]), content2);
                AddChatLog("GMCommand : " $ Text, 5, true);
                return true;
            // End:0xffff
            default:
            }
            return false;
}

function ResetBatteryNotice()
{
    NoticeUIPos = 1024.0;
    BatteryNotice.Length = 0;
    UpdateTimeBatteryNotice();
}

function PushNoticeQueue(string Notice)
{
    // End:0x12
    if(BatteryNotice.Length == 0)
    {
        ResetBatteryNotice();
    }
    BatteryNotice.Length = BatteryNotice.Length + 1;
    BatteryNotice[BatteryNotice.Length - 1] = Notice;
}

function string GetNoticeFirst()
{
    // End:0x14
    if(BatteryNotice.Length > 0)
    {
        return BatteryNotice[0];
    }
    return "";
}

function PopNoticeQueue()
{
    // End:0x1f
    if(BatteryNotice.Length > 0)
    {
        NoticeUIPos = 1024.0;
        BatteryNotice.Remove(0, 1);
    }
}

function UpdateTimeBatteryNotice()
{
    NoticeUITimeSeconds = Controller.ViewportOwner.Actor.Level.TimeSeconds;
}

function ResetBatteryAAS()
{
    AASUIPos = 0.0;
    BatteryAAS.Length = 0;
    UpdateTimeBatteryAAS();
}

function SetAASMessage(byte byType, int AccumTime)
{
    local byte AASLevel, PreLevel;
    local int i;

    // End:0x18
    if(AASTemp[byType].Activated)
    {
        return;
    }
    PreLevel = AASTemp[byType].Level;
    // End:0xf8
    if(1 == byType)
    {
        // End:0x57
        if(AccumTime >= 18000)
        {
            AASLevel = 7;
        }
        // End:0xf5
        else
        {
            // End:0x71
            if(AccumTime >= 16200)
            {
                AASLevel = 6;
            }
            // End:0xf5
            else
            {
                // End:0x8b
                if(AccumTime >= 14400)
                {
                    AASLevel = 5;
                }
                // End:0xf5
                else
                {
                    // End:0xa5
                    if(AccumTime >= 12600)
                    {
                        AASLevel = 4;
                    }
                    // End:0xf5
                    else
                    {
                        // End:0xbf
                        if(AccumTime >= 10800)
                        {
                            AASLevel = 3;
                        }
                        // End:0xf5
                        else
                        {
                            // End:0xd9
                            if(AccumTime >= 7200)
                            {
                                AASLevel = 2;
                            }
                            // End:0xf5
                            else
                            {
                                // End:0xf3
                                if(AccumTime >= 3600)
                                {
                                    AASLevel = 1;
                                }
                                // End:0xf5
                                else
                                {
                                    return;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    // End:0x100
    else
    {
        AASLevel = 0;
    }
    // End:0x15e
    if(PreLevel == AASLevel)
    {
        i = 0;
        J0x11a:
        // End:0x15e [While If]
        if(i < BatteryAAS.Length)
        {
            // End:0x154
            if(BatteryAAS[i].Level == AASLevel)
            {
                BatteryAAS.Remove(i, 1);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x11a;
        }
    }
    AASTemp[byType].Level = AASLevel;
    Controller.ViewportOwner.Actor.AASLevel = AASLevel;
    rMM.SetAASLevel(AASLevel);
    switch(AASLevel)
    {
        // End:0x1d9
        case 0:
            AASTemp[byType].Text = strAASMessage[0];
            // End:0x299
            break;
        // End:0x1fb
        case 1:
            AASTemp[byType].Text = strAASMessage[1];
            // End:0x299
            break;
        // End:0x21e
        case 2:
            AASTemp[byType].Text = strAASMessage[2];
            // End:0x299
            break;
        // End:0x241
        case 3:
            AASTemp[byType].Text = strAASMessage[3];
            // End:0x299
            break;
        // End:0x246
        case 4:
        // End:0x24b
        case 5:
        // End:0x26e
        case 6:
            AASTemp[byType].Text = strAASMessage[4];
            // End:0x299
            break;
        // End:0x273
        case 7:
        // End:0x296
        case 8:
            AASTemp[byType].Text = strAASMessage[5];
            // End:0x299
            break;
        // End:0xffff
        default:
            switch(byType)
            {
                // End:0x329
                case 0:
                    AASTemp[0].Activated = true;
                    AASTemp[0].Time = 15.0;
                    AASTemp[0].fBeginTime = Controller.ViewportOwner.Actor.Level.TimeSeconds;
                    PushAASQueue(AASTemp[0].Text, 15.0 * 1.10, AASTemp[0].Level);
                    // End:0x3b5
                    break;
                // End:0x3b2
                case 1:
                    AASTemp[1].Activated = false;
                    AASTemp[1].Time = 60.0;
                    AASTemp[1].fBeginTime = Controller.ViewportOwner.Actor.Level.TimeSeconds;
                    PushAASQueue(AASTemp[1].Text, 60.0 * 1.10, AASTemp[1].Level);
                    // End:0x3b5
                    break;
                // End:0xffff
                default:
}

function byte GetAASLevel()
{
    return BatteryAAS[0].Level;
}

function float GetAASBeginTime(byte byLevel)
{
    local float DeltaTime;

    DeltaTime = AASTemp[1].fBeginTime - AASTemp[0].fBeginTime;
    // End:0x30
    if(DeltaTime < float(0))
    {
    }
    // End:0x67
    else
    {
        // End:0x67
        if(DeltaTime <= AASTemp[0].Time)
        {
            AASTemp[1].fBeginTime += AASTemp[0].Time - DeltaTime;
        }
    }
    // End:0x84
    if(byLevel > 0)
    {
        return AASTemp[1].fBeginTime;
    }
    // End:0x91
    else
    {
        return AASTemp[0].fBeginTime;
    }
}

function PushAASQueue(string Text, float Time, byte AASLevel)
{
    // End:0x1d
    if(BatteryAAS.Length == 0)
    {
        ResetBatteryAAS();
        AASUIPos = Time;
    }
    BatteryAAS.Length = BatteryAAS.Length + 1;
    BatteryAAS[BatteryAAS.Length - 1].Text = Text;
    BatteryAAS[BatteryAAS.Length - 1].Time = Time;
    BatteryAAS[BatteryAAS.Length - 1].Level = AASLevel;
}

function string GetAASFirst()
{
    // End:0x19
    if(BatteryAAS.Length > 0)
    {
        return BatteryAAS[0].Text;
    }
    return "";
}

function float GetAASFirstTime()
{
    // End:0x19
    if(BatteryAAS.Length > 0)
    {
        return BatteryAAS[0].Time;
    }
    return 0.0;
}

function PopAASQueue()
{
    // End:0x40
    if(BatteryAAS.Length > 0)
    {
        BatteryAAS.Remove(0, 1);
        // End:0x35
        if(BatteryAAS.Length > 0)
        {
            AASUIPos = BatteryAAS[0].Time;
        }
        // End:0x40
        else
        {
            AASUIPos = 0.0;
        }
    }
}

function UpdateTimeBatteryAAS()
{
    AASUITimeSeconds = Controller.ViewportOwner.Actor.Level.TimeSeconds;
}

function bool Is18YearsOld(BtrDouble ServerTime, string BirthDay)
{
    local BtrTime Time;
    local int cyear, cmonth, cday;

    BtrDoubleToBtrTime(ServerTime, Time);
    cyear = int(Mid(BirthDay, 0, 4));
    cmonth = int(Mid(BirthDay, 4, 2));
    cday = int(Mid(BirthDay, 6, 2));
    Log("[BTNetMainMenu::IsInRangeDate] " $ string(Time.Year) $ ", " $ string(Time.Month) $ ", " $ string(Time.Day) $ " " $ string(Time.Hour) $ "-" $ string(Time.Minute));
    Log("BirthDay = " $ BirthDay);
    // End:0xfa
    if(Time.Year - cyear >= 19)
    {
        return true;
    }
    // End:0x15c
    else
    {
        // End:0x15c
        if(Time.Year - cyear == 18)
        {
            // End:0x12b
            if(cmonth < Time.Month)
            {
                return true;
            }
            // End:0x15c
            else
            {
                // End:0x15a
                if(cmonth == Time.Month && cday < Time.Day)
                {
                    return true;
                }
                // End:0x15c
                else
                {
                    return false;
                }
            }
        }
    }
    return false;
}

function bool IsInRangeDate(BtrDouble ServerTime, int syear, int smonth, int sday, int shour, int smin, int eyear, int emonth, int eday, int ehour, int emin)
{
    local BtrTime Time;
    local float ssum, esum, sum;

    BtrDoubleToBtrTime(ServerTime, Time);
    Log("[BTNetMainMenu::IsInRangeDate] " $ string(Time.Year) $ ", " $ string(Time.Month) $ ", " $ string(Time.Day) $ " " $ string(Time.Hour) $ "-" $ string(Time.Minute));
    Log("StartDate=" $ string(syear) $ string(smonth) $ string(sday) $ string(shour) $ string(smin) $ ", EndDate=" $ string(eyear) $ string(emonth) $ string(eday) $ string(ehour) $ string(emin));
    sum = float(Time.Month * 30 * 24 * 60 + Time.Day * 24 * 60 + Time.Hour * 60 + Time.Minute);
    ssum = float(smonth * 30 * 24 * 60 + sday * 24 * 60 + shour * 60 + smin);
    esum = float(emonth * 30 * 24 * 60 + eday * 24 * 60 + ehour * 60 + emin);
    // End:0x1f6
    if(syear < Time.Year && Time.Year < eyear)
    {
        return true;
    }
    // End:0x298
    else
    {
        // End:0x247
        if(syear == Time.Year && eyear == Time.Year && ssum <= sum && sum <= esum)
        {
            return true;
        }
        // End:0x298
        else
        {
            // End:0x271
            if(syear == Time.Year && ssum <= sum)
            {
                return true;
            }
            // End:0x298
            else
            {
                // End:0x298
                if(eyear == Time.Year && sum <= esum)
                {
                    return true;
                }
            }
        }
    }
    return false;
}

function bool IsGameReadyOrPlaying()
{
    // End:0x2c
    if(page_RoomLobby != none && page_curr == page_RoomLobby)
    {
        return page_RoomLobby.IsGameReadyOrPlaying();
    }
    return false;
}

function bool IsInPageServerSelection()
{
    // End:0x1e
    if(page_ServerSelection != none && page_curr == page_ServerSelection)
    {
        return true;
    }
    return false;
}

function bool IsInPageLobby()
{
    // End:0x1e
    if(page_Lobby2 != none && page_curr == page_Lobby2)
    {
        return true;
    }
    return false;
}

function int IsInClanChannel(string ServerIP, int serverPort, int ChannelID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x84 [While If]
    if(i < SCIList.Length)
    {
        // End:0x7a
        if(SCIList[i].ChannelID == ChannelID && SCIList[i].ServerIP == ServerIP && SCIList[i].serverPort == serverPort)
        {
            return SCIList[i].IsClanChannel;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function bool UpdateChatBan()
{
    local BtrDouble D;
    local BtrTime t;
    local wGameManager GameMgr;
    local int i;

    // End:0xdf
    if(bSystemChatBlock)
    {
        GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
        D = GameMgr.GetLeftEventTime(1001);
        // End:0xdd
        if(D.dummy_1_DO_NOT_USE != 0 || D.dummy_2_DO_NOT_USE != 0)
        {
            BtrDoubleToBtrTime(D, t);
            i = UnresolvedNativeFunction_99(D);
            AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(162, rMM.kUserName, string(i * 24 + t.Hour), string(t.Minute)), 5, true);
        }
        return true;
    }
    // End:0x1ae
    if(bChatBan)
    {
        GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
        D = GameMgr.GetLeftEventTime(1010);
        // End:0x1ac
        if(D.dummy_1_DO_NOT_USE != 0 || D.dummy_2_DO_NOT_USE != 0)
        {
            BtrDoubleToBtrTime(D, t);
            AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(154, string(t.Hour * 3600 + t.Minute * 60 + t.Second)), 5, true);
        }
        return true;
    }
    // End:0x202
    if(CheckChatBan() == false)
    {
        i = 1;
        J0x1c1:
        // End:0x1f1 [While If]
        if(i < 4)
        {
            ChatAccumTime[i - 1] = ChatAccumTime[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1c1;
        }
        ChatAccumTime[i] = 0.0;
    }
    return bChatBan;
}

function bool CheckChatBan()
{
    local int i;
    local float sum;
    local wGameManager GameMgr;
    local DelegateEventTimer det;

    i = 0;
    J0x07:
    // End:0x2f [While If]
    if(i < 4)
    {
        sum += ChatAccumTime[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0xcf
    if(sum <= float(3))
    {
        GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
        bChatBan = true;
        det = new class'DelegateEventTimer';
        det.__OnEventTimer__Delegate = ChatBanEnd_OnTimer;
        GameMgr.AddEventTimerHMS(1010, 0, 1, 0, det);
        AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(153), 5, true);
        return true;
    }
    return false;
}

function ChatBanEnd_OnTimer(int Index)
{
    Log("[BTNetMainMenu::ChatBanEnd_OnTimer]");
    AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(155), 5, true);
    bChatBan = false;
}

function bool Internal_OnChat(GUIComponent Sender, string Text)
{
    local ChatInfo ci;
    local string SendWhisperMsg, filter;

    Log("[BTNetMainMenu::Internal_OnChat]");
    rGameMgr.FilterBadWords(Text);
    // End:0x62
    if(rMM.GMLevelFlag & 3 > 0)
    {
        // End:0x62
        if(TextToGMCommand(Text))
        {
            return true;
        }
    }
    // End:0xa3
    if(rMM.kConnectAlpha > 0)
    {
        // End:0xa3
        if(TextToCommand(Text))
        {
            Text = "/n dice = " $ string(Rand(CommandParameter_int));
        }
    }
    ci = TextToChatInfo(Text);
    switch(ci.ChatType)
    {
        // End:0xec
        case 1:
            // End:0xe9
            if(UpdateChatBan() == false)
            {
                TcpChannel.sfReqChatNormal(ci.chatText);
            }
            // End:0x2b8
            break;
        // End:0x10d
        case 2:
            TcpChannel.sfReqChatClan(ci.chatText);
            // End:0x2b8
            break;
        // End:0x2b5
        case 3:
            // End:0x15e
            if(ci.ChatTo == "")
            {
                TPChat.InputBox.SetText("/w ");
                TPChat.SetChatState(PrevChatMode.ChatType);
                return false;
            }
            // End:0x2b2
            else
            {
                // End:0x206
                if(ci.chatText == "")
                {
                    AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(143), 5, true);
                    // End:0x1cb
                    if(ci.ChatTo != "")
                    {
                        TPChat.InputBox.SetText("/w " $ ci.ChatTo $ " ");
                    }
                    // End:0x1e8
                    else
                    {
                        TPChat.InputBox.SetText("/w ");
                    }
                    TPChat.SetChatState(PrevChatMode.ChatType);
                    return false;
                }
                // End:0x2b2
                else
                {
                    TcpChannel.sfReqChatWispher(ci.ChatTo, ci.chatText);
                    SendWhisperMsg = "" $ strTo $ " [" $ ci.ChatTo $ "]" @ ci.chatText;
                    AddChatLog(SendWhisperMsg, 3, true);
                    TPChat.InputBox.SetText("/w " $ ci.ChatTo $ " ");
                    TPChat.SetChatState(PrevChatMode.ChatType);
                    return false;
                }
            }
            // End:0x2b8
            break;
        // End:0xffff
        default:
            TPChat.SetChatState(PrevChatMode.ChatType);
            return true;
    }
}

function TPChat_OnInputSpace(GUIComponent Sender, string Text)
{
    local ChatInfo ci;

    Log("[BTNetMainMenu::TPChat_OnInputSpace]");
    ci = TextToChatInfo(Text);
    // End:0xe8
    if(ci.ChatType == 3)
    {
        // End:0xae
        if(ci.ChatTo == "")
        {
            // End:0x8e
            if(LastRecvWhispherName != "")
            {
                TPChat.InputBox.SetText("/w " $ LastRecvWhispherName);
            }
            // End:0xab
            else
            {
                TPChat.InputBox.SetText("/w ");
            }
        }
        // End:0xe8
        else
        {
            // End:0xe8
            if(ci.chatText == "")
            {
                TPChat.InputBox.SetText("/w " $ ci.ChatTo);
            }
        }
    }
    TPChat.SetChatState(PrevChatMode.ChatType);
}

function TPChat_OnInputTab(GUIComponent Sender, string Text)
{
    Log("[BTNetMainMenu::TPChat_OnInputTab]");
    // End:0x45
    if(++ PrevChatMode.ChatType >= 3)
    {
        PrevChatMode.ChatType = 1;
    }
    switch(PrevChatMode.ChatType)
    {
        // End:0x72
        case 1:
            TPChat.InputBox.SetText("");
            // End:0x10e
            break;
        // End:0xe9
        case 3:
            PrevChatMode.ChatTo = LastRecvWhispherName;
            // End:0xc9
            if(PrevChatMode.ChatTo != "")
            {
                TPChat.InputBox.SetText("/w " $ PrevChatMode.ChatTo $ " ");
            }
            // End:0xe6
            else
            {
                TPChat.InputBox.SetText("/w ");
            }
            // End:0x10e
            break;
        // End:0x10b
        case 2:
            TPChat.InputBox.SetText("");
            // End:0x10e
            break;
        // End:0xffff
        default:
            TPChat.SetChatState(PrevChatMode.ChatType);
            TPChat.InputBox.FocusFirst(none);
}

function TPChat_OnChageChatMode(int ChatMode)
{
    Log("[BTNetMainMenu::TPChat_OnChageChatMode]");
    switch(ChatMode)
    {
        // End:0x5f
        case 1:
            PrevChatMode.ChatType = 1;
            TPChat.InputBox.SetText("");
            // End:0x115
            break;
        // End:0x8e
        case 2:
            PrevChatMode.ChatType = 2;
            TPChat.InputBox.SetText("");
            // End:0x115
            break;
        // End:0x112
        case 3:
            PrevChatMode.ChatType = 3;
            PrevChatMode.ChatTo = LastRecvWhispherName;
            // End:0xf2
            if(PrevChatMode.ChatTo != "")
            {
                TPChat.InputBox.SetText("/w " $ PrevChatMode.ChatTo $ " ");
            }
            // End:0x10f
            else
            {
                TPChat.InputBox.SetText("/w ");
            }
            // End:0x115
            break;
        // End:0xffff
        default:
            TPChat.SetChatState(PrevChatMode.ChatType);
            TPChat.InputBox.FocusFirst(none);
}

function TPChat_ChangeTab_OnClick(int TabIndex)
{
    Log("[BTNetMainMenu::TPChat_ChangeTab_OnClick]");
    switch(TabIndex)
    {
        // End:0x61
        case 0:
            PrevChatMode.ChatType = 1;
            TPChat.InputBox.SetText("");
            // End:0x116
            break;
        // End:0xe4
        case 1:
            PrevChatMode.ChatType = 3;
            PrevChatMode.ChatTo = LastRecvWhispherName;
            // End:0xc4
            if(PrevChatMode.ChatTo != "")
            {
                TPChat.InputBox.SetText("/w " $ PrevChatMode.ChatTo $ " ");
            }
            // End:0xe1
            else
            {
                TPChat.InputBox.SetText("/w ");
            }
            // End:0x116
            break;
        // End:0x113
        case 2:
            PrevChatMode.ChatType = 2;
            TPChat.InputBox.SetText("");
            // End:0x116
            break;
        // End:0xffff
        default:
            TPChat.SetChatState(PrevChatMode.ChatType);
            TPChat.InputBox.FocusFirst(none);
}

function TPChat_ChangeTab_OnClickTemp(int TabIndex)
{
    Log("[BTNetMainMenu::TPChat_ChangeTab_OnClick]");
    switch(TabIndex)
    {
        // End:0x61
        case 0:
            PrevChatMode.ChatType = 1;
            TPChat.InputBox.SetText("");
            // End:0x92
            break;
        // End:0x8f
        case 1:
            PrevChatMode.ChatType = 2;
            TPChat.InputBox.SetText("");
            // End:0x92
            break;
        // End:0xffff
        default:
            TPChat.SetChatState(PrevChatMode.ChatType);
            TPChat.InputBox.FocusFirst(none);
}

function bool Internal_OnFunctionKey(GUIComponent Sender, byte FunctionKey, string Text)
{
    Log("[BTNetMainMenu::Internal_OnFunctionKey]");
    switch(FunctionKey)
    {
        // End:0x37
        case 113:
        // End:0x65
        case 114:
            PrevChatMode.ChatType = 1;
            TPChat.InputBox.SetText("");
            // End:0x11b
            break;
        // End:0x94
        case 115:
            PrevChatMode.ChatType = 2;
            TPChat.InputBox.SetText("");
            // End:0x11b
            break;
        // End:0x118
        case 116:
            PrevChatMode.ChatType = 3;
            PrevChatMode.ChatTo = LastRecvWhispherName;
            // End:0xf8
            if(PrevChatMode.ChatTo != "")
            {
                TPChat.InputBox.SetText("/w " $ PrevChatMode.ChatTo $ " ");
            }
            // End:0x115
            else
            {
                TPChat.InputBox.SetText("/w ");
            }
            // End:0x11b
            break;
        // End:0xffff
        default:
            TPChat.SetChatState(PrevChatMode.ChatType);
            return true;
    }
}

function ShowCashChargeWindow()
{
    local string payURL;

    payURL = class'BTSteamMapping'.static.GetPayURL(AuthLogin_GUID, AuthLogin_ConnectAlpha);
    Log("[GetPayURL] : AuthLogin_AccountID:" $ AuthLogin_AccountID $ "AuthLogin_ConnectAlpha:" $ string(AuthLogin_ConnectAlpha));
    class'BTWindowWebBrowser'.static.OpenWebWindow(Controller, payURL, 48, 116, 976, 625, strCashCharge);
    BTWindowWebBrowser(Controller.TopPage()).__OnOK__Delegate = ShowReqCashWindow_OnOK;
}

function bool ShowCashChargeWindow_OnOK(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 176);
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = ShowReqCashWindow_OnOK;
    return true;
}

function bool ShowReqCashWindow_OnOK(GUIComponent Sender)
{
    TcpChannel.sfReqWebzenCash();
    Controller.CloseMenu(false);
    return true;
}

function ShowHelpWindow()
{
    class'BTWindowDefineARHK'.static.ShowInfo(Controller, 55);
    BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = ShowHelpWindow_OnOK;
}

function bool ShowHelpWindow_OnOK(GUIComponent Sender)
{
    // End:0x62
    if(page_Main.AuthLogin_ChannelType == 1)
    {
        Controller.LaunchURL("http://btr.playnetwork.co.kr/Guide/GameGuide/combatA.asp");
    }
    // End:0xbc
    else
    {
        // End:0xbc
        if(page_Main.AuthLogin_ChannelType == 0)
        {
            Controller.LaunchURL("http://btr.webzen.co.kr/Guide/GameGuide/combatA.asp");
        }
    }
    Controller.CloseMenu(false);
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 176);
    return true;
}

function UpdateWebzenShopItemList(int Year, int YearId, int SalesZoneCode)
{
    local wGameManager GameMgr;

    Log("[BTNetMainMenu:::UpdateWebzenShopItemList] Year=" $ string(Year) $ " YearID= " $ string(YearId) $ " SalesZoneCode= " $ string(SalesZoneCode));
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0xed
    if(GameMgr.kWebzenShopVer_Year == Year && GameMgr.kWebzenShopVer_YearID == YearId && GameMgr.kWebzenShopVer_SalesZoneCode == SalesZoneCode)
    {
        return;
    }
    GameMgr.kWebzenShopVer_Year = Year;
    GameMgr.kWebzenShopVer_YearID = YearId;
    GameMgr.kWebzenShopVer_SalesZoneCode = SalesZoneCode;
    Log("Start Download WebzenShopScript!!");
    UnresolvedNativeFunction_97("Start Download WebzenShopScript!! (Year=" $ string(Year) $ ", YearID=" $ string(YearId) $ ", SalesZoneCode=" $ string(SalesZoneCode) $ ")");
    GameMgr.DownloadWebzenShopItemList(GameMgr.kWebzenShopVer_Year, GameMgr.kWebzenShopVer_YearID, GameMgr.kWebzenShopVer_SalesZoneCode);
    Log("PackageLength = " $ string(GameMgr.kWZPackageList.Length));
    UnresolvedNativeFunction_97("PackageLength = " $ string(GameMgr.kWZPackageList.Length));
    UnresolvedNativeFunction_97("End Download WebzenShopScript!!");
    Log("End Download WebzenShopScript!!");
}

function CheckWebzenShopItemList()
{
    local wGameManager GameMgr;

    Log("[BTNetMainMenu:::CheckWebzenShopItemList]");
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Log("BTNetMainMenu::sfReqShopItemData(" $ string(GameMgr.GP20ShopVersion) $ ")");
    page_Main.TcpChannel.sfReqShopItemData(GameMgr.GP20ShopVersion);
}

function bool CheckMoveToChannel(int iServerIndex)
{
    // End:0x12
    if(SCIList.Length <= iServerIndex)
    {
        return false;
    }
    // End:0x3f
    if(SCIList[iServerIndex].IsClanChannel > 0)
    {
        // End:0x3f
        if(rMM.kClanName == "")
        {
            return false;
        }
    }
    return true;
}

function UpdateSendQuickSlotIndex(int iQuickSlotIndex)
{
    local int i;

    Log("BTNetMainMenu::UpdateSendQuickSlotIndex] QuickSlotIndex : " $ string(iQuickSlotIndex));
    i = 0;
    J0x4e:
    // End:0x7f [While If]
    if(i < iSendUpdateQuickSlotList.Length)
    {
        // End:0x75
        if(iSendUpdateQuickSlotList[i] == iQuickSlotIndex)
        {
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4e;
    }
    iSendUpdateQuickSlotList.Length = iSendUpdateQuickSlotList.Length + 1;
    iSendUpdateQuickSlotList[iSendUpdateQuickSlotList.Length - 1] = iQuickSlotIndex;
}

function RequestUpdateQuickSlot(int iQuickSlotIdx)
{
    local int arQslotID, arSkill1, arSkill2, arSkill3, arSkill4;

    local BtrDouble arMWItemID, arPistolItemID, arTWItemID1, arTWItemID2;
    local string arQslotName;
    local wItemBoxHK ItemInfo;
    local wGameManager GameMgr;

    Log("BTNetMainMenu::RequestUpdateQuickSlot] iQuickSlotIdx : " $ string(iQuickSlotIdx));
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    arQslotID = GameMgr.QuickSlotBoxList[iQuickSlotIdx].QuickSlotID;
    arQslotName = GameMgr.QuickSlotBoxList[iQuickSlotIdx].QuickSlotName;
    arMWItemID = GameMgr.QuickSlotBoxList[iQuickSlotIdx].UniqueID[0];
    arPistolItemID = GameMgr.QuickSlotBoxList[iQuickSlotIdx].UniqueID[1];
    arTWItemID1 = GameMgr.QuickSlotBoxList[iQuickSlotIdx].UniqueID[2];
    arTWItemID2 = GameMgr.QuickSlotBoxList[iQuickSlotIdx].UniqueID[3];
    arSkill1 = GameMgr.QuickSlotBoxList[iQuickSlotIdx].UniqueSkillID[0];
    arSkill2 = GameMgr.QuickSlotBoxList[iQuickSlotIdx].UniqueSkillID[1];
    arSkill3 = GameMgr.QuickSlotBoxList[iQuickSlotIdx].UniqueSkillID[2];
    arSkill4 = GameMgr.QuickSlotBoxList[iQuickSlotIdx].UniqueSkillID[3];
    PlayerOwner().dblog("[BTNetMainMenu::UpdateQuickSlot]");
    PlayerOwner().dblog("===============================================");
    PlayerOwner().dblog("DispOrder = " $ string(iQuickSlotIdx) $ ", QSlotID = " $ string(arQslotID) $ ", QSlotName = " $ arQslotName);
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[iQuickSlotIdx].ItemID[0]);
    // End:0x334
    if(ItemInfo != none)
    {
        PlayerOwner().dblog("0 ItemName = " $ ItemInfo.ItemName $ ", ItemID = " $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[iQuickSlotIdx].ItemID[1]);
    // End:0x3c0
    if(ItemInfo != none)
    {
        PlayerOwner().dblog("1 ItemName = " $ ItemInfo.ItemName $ ", ItemID = " $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[iQuickSlotIdx].ItemID[2]);
    // End:0x44d
    if(ItemInfo != none)
    {
        PlayerOwner().dblog("2 ItemName = " $ ItemInfo.ItemName $ ", ItemID = " $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[iQuickSlotIdx].ItemID[3]);
    // End:0x4da
    if(ItemInfo != none)
    {
        PlayerOwner().dblog("3 ItemName = " $ ItemInfo.ItemName $ ", ItemID = " $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[iQuickSlotIdx].SkillID[0]);
    // End:0x568
    if(ItemInfo != none)
    {
        PlayerOwner().dblog("0 SkillName = " $ ItemInfo.ItemName $ ", SkillID = " $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[iQuickSlotIdx].SkillID[1]);
    // End:0x5f6
    if(ItemInfo != none)
    {
        PlayerOwner().dblog("1 SkillName = " $ ItemInfo.ItemName $ ", SkillID = " $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[iQuickSlotIdx].SkillID[2]);
    // End:0x685
    if(ItemInfo != none)
    {
        PlayerOwner().dblog("2 SkillName = " $ ItemInfo.ItemName $ ", SkillID = " $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[iQuickSlotIdx].SkillID[3]);
    // End:0x714
    if(ItemInfo != none)
    {
        PlayerOwner().dblog("3 SkillName = " $ ItemInfo.ItemName $ ", SkillID = " $ string(ItemInfo.ItemID));
    }
    TcpChannel.sfReqUpdateQSlot(arQslotID, arQslotName, arMWItemID, arPistolItemID, arTWItemID1, arTWItemID2, arSkill1, arSkill2, arSkill3, arSkill4);
}

function bool TcpLogin_rfAckLoginWithTencentAuth_Live(int Result, byte tc_AccountType, byte tc_IsBlock)
{
    // End:0x4f
    if(Result != 0)
    {
        HaltNetwork();
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    // End:0xc0
    if(tc_IsBlock == 1)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 87, Controller.ViewportOwner.Actor.Level.AuthLogin_AccountID);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    // End:0xf2
    if(tc_AccountType == 0)
    {
        rMM.GMLevelFlag = 0;
        rMM.bAdminSpectator = false;
    }
    // End:0x154
    else
    {
        // End:0x124
        if(tc_AccountType == 1)
        {
            rMM.GMLevelFlag = 1;
            rMM.bAdminSpectator = true;
        }
        // End:0x154
        else
        {
            // End:0x154
            if(tc_AccountType == 2)
            {
                rMM.GMLevelFlag = 0;
                rMM.bAdminSpectator = false;
            }
        }
    }
    AuthLogin_AccountType = tc_AccountType;
    TcpLogin.sfReqLoginInHouseTest(AuthLogin_AccountID, "battery", AuthLogin_GUID);
    return true;
}

function bool TcpLogin_rfAckLoginWithTencentAuth_Test(int Result, byte tc_AccountType, byte tc_IsBlock)
{
    // End:0x49
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
    return true;
}

function bool TcpLogin_rfAckLoginWithWZAuth_Live(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType)
{
    // End:0x4f
    if(Result != 0)
    {
        HaltNetwork();
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    // End:0x5f
    if(wzp_AuthKeySuccess == 1)
    {
    }
    // End:0x140
    else
    {
        // End:0xaf
        if(wzp_AuthKeySuccess == 0)
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 88, AuthLogin_AccountID);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
            return true;
        }
        // End:0x140
        else
        {
            // End:0x100
            if(wzp_AuthKeySuccess == 2)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 89, AuthLogin_AccountID);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
                return true;
            }
            // End:0x140
            else
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 90, AuthLogin_AccountID);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
                return true;
            }
        }
    }
    // End:0x1b1
    if(wzp_IsBlock == 1)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 87, Controller.ViewportOwner.Actor.Level.AuthLogin_AccountID);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    // End:0x1e3
    if(wzp_AccountType == 0)
    {
        rMM.GMLevelFlag = 0;
        rMM.bAdminSpectator = false;
    }
    // End:0x245
    else
    {
        // End:0x215
        if(wzp_AccountType == 1)
        {
            rMM.GMLevelFlag = 1;
            rMM.bAdminSpectator = true;
        }
        // End:0x245
        else
        {
            // End:0x245
            if(wzp_AccountType == 2)
            {
                rMM.GMLevelFlag = 0;
                rMM.bAdminSpectator = false;
            }
        }
    }
    AuthLogin_AccountType = wzp_AccountType;
    AuthLogin_ChannelType = ChannelType;
    rMM.kChannelingType = ChannelType;
    TcpLogin.sfReqLoginInHouseTest(AuthLogin_AccountID, "battery", AuthLogin_GUID);
    return true;
}

function bool TcpLogin_rfAckLoginWithWZAuth_Test(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType)
{
    Log("[BTNetMainMenu::TcpLogin_rfAckLoginWithWZAuth_Test] Result=" $ string(Result));
    // End:0x91
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    Log("[BTNetMainMenu::TcpLogin_rfAckLoginWithWZAuth_Test] sfReqLoginInHouseTest(" $ szAccountName $ ", " $ szLoginPassword $ ", " $ AuthLogin_GUID $ ")");
    TcpLogin.sfReqLoginInHouseTest(szAccountName, szLoginPassword, AuthLogin_GUID);
    return true;
}

function bool TcpLogin_rfAckLoginWithThailand_Live(int Result)
{
    // End:0x4f
    if(Result != 0)
    {
        HaltNetwork();
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    TcpLogin.sfReqLoginInHouseTest(AuthLogin_AccountID, "battery", AuthLogin_GUID);
    return true;
}

function bool TcpLogin_rfAckLoginWithThailand_Test(int Result)
{
    // End:0x49
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    TcpLogin.sfReqLoginInHouseTest(szAccountName, szLoginPassword, AuthLogin_GUID);
    return true;
}

function bool TcpLogin_rfAckLoginWithGlobal_Live(int Result)
{
    local int webLogFailCode;

    // End:0x19
    if(Result == 0)
    {
        webLogFailCode = -1;
    }
    // End:0x20
    else
    {
        webLogFailCode = 0;
    }
    PlayerOwner().SendWebLog(4080, webLogFailCode);
    // End:0x86
    if(Result != 0)
    {
        HaltNetwork();
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    TcpLogin.sfReqLoginInHouseTest(AuthLogin_AccountID, "battery", AuthLogin_GUID);
    return true;
}

function bool TcpLogin_rfAckLoginWithGlobal_Test(int Result)
{
    Log("[BTNetMainMenu::TcpLogin_rfAckLoginWithGlobal_Test] Result=" $ string(Result));
    UnresolvedNativeFunction_97("[BTNetMainMenu::TcpLogin_rfAckLoginWithGlobal_Test] Result=" $ string(Result));
    // End:0xda
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    TcpLogin.sfReqLoginInHouseTest(szAccountName, szLoginPassword, AuthLogin_GUID);
    return true;
}

function bool OnAppExit(GUIComponent Sender)
{
    Log("[BTNetMainMenu::OnAppExit]");
    Controller.ConsoleCommand("exit");
    return true;
}

function SendLogin()
{
    // End:0xb6
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        PlayerOwner().SendWebLog(4070, -1);
        Log("sfReqLoginWithGlobal(" $ AuthLogin_AccountID $ ", " $ AuthLogin_GUID $ ", " $ AuthLogin_AuthKey $ ", " $ AuthLogin_AuthKey $ ")");
        TcpLogin.sfReqLoginWithGlobal(AuthLogin_AccountID, AuthLogin_GUID, AuthLogin_AuthKey, AuthLogin_ChannelingType);
    }
    // End:0x125
    else
    {
        Log("sfReqLoginWithGlobal(" $ szAccountName $ ", " $ AuthLogin_GUID $ ", " $ AuthLogin_AuthKey $ ", " $ AuthLogin_AuthKey $ ")");
        TcpLogin.sfReqLoginWithGlobal(szAccountName, AuthLogin_GUID, AuthLogin_AuthKey, AuthLogin_ChannelingType);
    }
}

defaultproperties
{
    eCurrPage=2
    AuthLogin_GUID="0"
    strGMList="[GM]"
    strNotice_All="//Global_Notice"
    strNotice_Server="//Server_Notice"
    strNotice_Channel="//Channel_Notice"
    strNotice_Room="//Game_Notice"
    strKick="//Logout"
    strChangeRoomTitle="//ChangeGameName"
    bNewAvailableEventQuest=true
    pagename_Logo="GUIWarfare.BTPageLogo"
    pagename_Login="GUIWarfare.BTPageLogin"
    pagename_Lobby2="GUIWarfare.BTPageLobbyCN"
    pagename_CharacterCreation="GUIWarfare.BTPageCharacterCreation"
    pagename_ServerSelection="GUIWarfare.BTPageServerSelectionCN"
    pagename_RoomLobby="GUIWarfare.BTPageRoomLobby"
    pagename_MatchResult2="GUIWarfare.BTPageMatchResult"
    pagename_Auction="GUIWarfare.BTPageAuction"
    pagename_Help="GUIWarfare.BTPageHelp"
    pagename_Mail="GUIWarfare.BTPageMail"
    pagename_Store="GUIWarfare.BTPageStoreCN"
    pagename_Inventory="GUIWarfare.BTPageInventory"
    pagename_MyInfo="GUIWarfare.BTPageMyInfo"
    pagename_Clan="GUIWarfare.BTPageClan"
    pagename_Credit="GUIWarfare.BTPageCredit"
    pagename_ClanWar="GUIWarfare.BTPageClanWar"
    PageOnOpen=2
    szAccountName="NG"
    szLoginServerIP="10.95.2.193"
    szLoginServerPort=55000
    NatType=-1
    LocalLogStr[0]="Starting NAT (IP routing) diagnostics."
    LocalLogStr[1]="Unable to run NAT diagnostics. Attempting to retry."
    LocalLogStr[2]="Unable to run NAT diagnostics. Will attempt to retry when the game starts."
    LocalLogStr[3]="Starting first NAT (IP routing) diagnostic process."
    LocalLogStr[4]="Starting second NAT (IP routing) diagnostic process."
    LocalLogStr[5]="Your current NAT type is"
    LocalLogStr[6]="."
    LocalLogStr[7]="NAT diagnostics complete."
    LocalLogStr[8]="Received NAT type from the server."
    strNatType[0]="Open"
    strNatType[1]="Moderate"
    strNatType[2]="Strict"
    strNatType[3]="Closed"
    strCashCharge="Buy W Coins"
    bPersistent=true
    OnOpen=deleOnOpen
    OnClose=deleOnClose
    OnKeyEvent=deleOnKeyEvent
}