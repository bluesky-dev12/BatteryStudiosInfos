class BTNetMainMenu extends BTNetGUIPage
    editinlinenew
    instanced;

enum GameRoomType
{
    GameRoomType_Normal,            // 0
    GameRoomType_Permanent,         // 1
    GameRoomType_ClanPermanent,     // 2
    GameRoomType_Clan,              // 3
    GameRoomType_League,            // 4
    GameRoomType_End                // 5
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
    var bool IsPracticeChannel;
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
var Object.EPage eCurrPage;
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
var Object.EPage PageOnOpen;
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
//var delegate<delegateCheckNat> __delegateCheckNat__Delegate;
//var delegate<UpdateRecv_ClanInfo> __UpdateRecv_ClanInfo__Delegate;
//var delegate<UpdateExpiredItemList> __UpdateExpiredItemList__Delegate;
//var delegate<UpdateDurabilityWarningItemList> __UpdateDurabilityWarningItemList__Delegate;
//var delegate<UpdateWebzenInvenList> __UpdateWebzenInvenList__Delegate;
//var delegate<UpdateWebzenInvenListEnd> __UpdateWebzenInvenListEnd__Delegate;
//var delegate<ClearChatLog> __ClearChatLog__Delegate;
//var delegate<NormalChatLog> __NormalChatLog__Delegate;
//var delegate<ClanChatLog> __ClanChatLog__Delegate;
//var delegate<WhisperChatLog> __WhisperChatLog__Delegate;
//var delegate<SelfChatLog> __SelfChatLog__Delegate;
//var delegate<SystemChatLog> __SystemChatLog__Delegate;
//var delegate<TeamChatLog> __TeamChatLog__Delegate;
//var delegate<BroadCastItemChatLog> __BroadCastItemChatLog__Delegate;
//var delegate<ClearChatLog_Extra> __ClearChatLog_Extra__Delegate;
//var delegate<NormalChatLog_Extra> __NormalChatLog_Extra__Delegate;
//var delegate<ClanChatLog_Extra> __ClanChatLog_Extra__Delegate;
//var delegate<WhisperChatLog_Extra> __WhisperChatLog_Extra__Delegate;
//var delegate<SelfChatLog_Extra> __SelfChatLog_Extra__Delegate;
//var delegate<SystemChatLog_Extra> __SystemChatLog_Extra__Delegate;
//var delegate<TeamChatLog_Extra> __TeamChatLog_Extra__Delegate;
//var delegate<BroadCastItemChatLog_Extra> __BroadCastItemChatLog_Extra__Delegate;

delegate delegateCheckNat()
{
    //return;    
}

delegate UpdateRecv_ClanInfo(BTNetMainMenu MainMenu)
{
    //return;    
}

delegate UpdateExpiredItemList(BTNetMainMenu MainMenu)
{
    //return;    
}

delegate UpdateDurabilityWarningItemList(BTNetMainMenu MainMenu)
{
    //return;    
}

function SetNewMailArrived(bool B)
{
    bNewMailArrived = B;
    // End:0x40
    if(BTNetGUIPageHK(page_curr) != none)
    {
        BTNetGUIPageHK(page_curr).TPTopMenu.SetNewMailArrived(bNewMailArrived);
    }
    //return;    
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
    //return;    
}

function StopWebzenInvenList()
{
    WZILP.bLock = false;
    //return;    
}

delegate UpdateWebzenInvenList(BTNetMainMenu MainMenu)
{
    //return;    
}

delegate UpdateWebzenInvenListEnd(BTNetMainMenu MainMenu)
{
    //return;    
}

function ChannelToLogin_OnEventTimer(int Index)
{
    Log("[BTNetMainMenu::ChannelToLogin_OnEventTimer]");
    Class'GUIWarfareControls.BTWindowDefineStateHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls.BTWindowDefineStateHK');
    // End:0xBE
    if(bConnectedLoginServer == false)
    {
        Log("InitializeTcpLogin()");
        InitializeTcpLogin(rGameMgr.kEventTimerList[Index].EventDelegate.Data_String[0], rGameMgr.kEventTimerList[Index].EventDelegate.Data_Int[0]);        
    }
    else
    {
        Log("Illegal bConnectedLoginServer==true");
    }
    //return;    
}

function ChannelToLogin(string IP, int Port)
{
    local DelegateEventTimer det;

    Log((("[BTNetMainMenu::ChannelToLogin] ip=" $ IP) $ " port=") $ string(Port));
    Log("TcpChannel.Close()");
    iChannel = -1;
    TcpChannel.Close();
    bConnectedChannelServer = false;
    det = new Class'Engine.DelegateEventTimer';
    det.__OnEventTimer__Delegate = ChannelToLogin_OnEventTimer;
    det.Data_String[0] = IP;
    det.Data_Int[0] = Port;
    rGameMgr.AddEventTimerHMS(0, 0, 0, 0, det, 500);
    Class'GUIWarfareControls.BTWindowDefineStateHK'.static.ShowState(Controller, 7);
    //return;    
}

function ChannelToLogin2(string IP, int Port)
{
    Log((("[BTNetMainMenu::ChannelToLogin2] ip=" $ IP) $ " port=") $ string(Port));
    Log("TcpChannel.Close()");
    iChannel = -1;
    TcpChannel.Close();
    bConnectedChannelServer = false;
    // End:0xB1
    if(bConnectedLoginServer == false)
    {
        Log("InitializeTcpLogin()");
        InitializeTcpLogin(IP, Port);        
    }
    else
    {
        Log("Illegal bConnectedLoginServer==true");
    }
    //return;    
}

function LoginToChannel(string IP, int Port, int DataPort)
{
    Log((((("[BTNetMainMenu::LoginToChannel] ip=" $ IP) $ " port=") $ string(Port)) $ " dataPort=") $ string(DataPort));
    Log("TcpLogin.Close()");
    TcpLogin.Close();
    bConnectedLoginServer = false;
    // End:0xC1
    if(bConnectedChannelServer == false)
    {
        Log("InitializeTcpChannel()");
        InitializeTcpChannel(IP, Port, DataPort);        
    }
    else
    {
        Log("Illegal bConnectedChannelServer==true");
    }
    //return;    
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
    //return;    
}

function AddDurabilityWarningItemRepairCost(BtrDouble UniqueID, int RepairCost)
{
    local int i;
    local wItemBoxHK ItemInfo;

    i = 0;
    J0x07:

    // End:0xB4 [Loop If]
    if(i < DurWarningItems.items.Length)
    {
        // End:0xAA
        if(__NFUN_912__(DurWarningItems.items[i].UniqueID, UniqueID))
        {
            ItemInfo = self.rGameMgr.FindUIItem(DurWarningItems.items[i].ItemID);
            Log((ItemInfo.ItemName $ ", RC=") $ string(RepairCost));
            DurWarningItems.items[i].RepairCost = RepairCost;
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function CompleteDurabilityWarningItem()
{
    DurWarningItems.bDurWarningItem = false;
    DurWarningItems.bReqRepairCost = false;
    DurWarningItems.items.Length = 0;
    //return;    
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
    //return;    
}

function AddExpiredSkillItem(int ItemID, int UniqueID, int SlotPos)
{
    ExpiredItems.bExpiredItem = true;
    ExpiredItems.items.Length = ExpiredItems.items.Length + 1;
    ExpiredItems.items[ExpiredItems.items.Length - 1].ItemID = ItemID;
    ExpiredItems.items[ExpiredItems.items.Length - 1].SlotPos = SlotPos;
    ExpiredItems.items[ExpiredItems.items.Length - 1].PartID = 0;
    ExpiredItems.items[ExpiredItems.items.Length - 1].UniqueItemID = __NFUN_921__(0);
    ExpiredItems.items[ExpiredItems.items.Length - 1].UniqueSkillID = UniqueID;
    //return;    
}

function CompleteExpiredItem()
{
    ExpiredItems.bExpiredItem = false;
    ExpiredItems.items.Length = 0;
    //return;    
}

function bool CheckExpiredItemList()
{
    local int i;
    local export editinline BTWindowItemExpiredHK BTWindow;
    local wMatchMaker MM;
    local Object.EPage Dest;
    local wGameManager GameMgr;

    Log("[BTNetMainMenu::CheckExpiredItemList]");
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x23A
    if(ExpiredItems.bExpiredItem && ExpiredItems.items.Length > 0)
    {
        BTWindow = BTWindowItemExpiredHK(Controller.TopPage());
        // End:0x15F
        if(BTWindow == none)
        {
            // End:0xFB
            if((int(eCurrPage) == int(7)) || int(eCurrPage) == int(5))
            {
                Dest = 7;                
            }
            else
            {
                Dest = 10;
            }
            BTWindow = BTWindowItemExpiredHK(page_Main.pwm.CreateAndPush(Dest, "GUIWarfare.BTWindowItemExpiredHK", true, 0));
            BTWindow.MainMenu = self;
        }
        i = 0;
        J0x166:

        // End:0x1FD [Loop If]
        if(i < ExpiredItems.items.Length)
        {
            BTWindow.AddItem(ExpiredItems.items[i].ItemID, ExpiredItems.items[i].UniqueItemID, ExpiredItems.items[i].UniqueSkillID, ExpiredItems.items[i].PartID, ExpiredItems.items[i].SlotPos);
            i++;
            // [Loop Continue]
            goto J0x166;
        }
        BTWindow.AddSubMenuBtn();
        BTWindow.TPItemList.UpdateServerTime(GameMgr.kClientTime);
        CompleteExpiredItem();
        return true;
    }
    CheckDestroyedDurabilityXItemList();
    return false;
    //return;    
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
        J0x8A:

        // End:0x1F5 [Loop If]
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
                    i--;
                    // [Explicit Continue]
                    goto J0x1EB;
                }
            }
            // End:0x178
            if(instanceInfo != none)
            {
                DurWarningItems.items[i].Durability = instanceInfo.Durability;                
            }
            else
            {
                Log("InstanceInfo!=none");
            }
            // End:0x1EB
            if(ItemInfo.bRepair && ItemInfo.CostType == 0)
            {
                repairuid.Length = repairuid.Length + 1;
                repairuid[repairuid.Length - 1] = DurWarningItems.items[i].UniqueID;
            }
            J0x1EB:

            i++;
            // [Loop Continue]
            goto J0x8A;
        }
        // End:0x22D
        if(DurWarningItems.items.Length == 0)
        {
            CompleteDurabilityWarningItem();
            page_Main.pwm.RemoveWindowOnStack(7, 'BTWindowItemDurabilityWarningHK');
            return true;
        }
        // End:0x25D
        if(repairuid.Length > 0)
        {
            DurWarningItems.bReqRepairCost = true;
            TcpChannel.sfReqRepairCost(repairuid);            
        }
        else
        {
            DurWarningItems.bReqRepairCost = true;
            page_ServerSelection.rfAckRepairCost(0, "", A, B);
        }
        return true;
    }
    return false;
    //return;    
}

function bool CompleteDestroyedDurabilityXItemList()
{
    Log("[BTNetMainMenu::CompleteDestroyedDurabilityXItemList]");
    DestroyedDurabilityXItems.Length = 0;
    return true;
    //return;    
}

function bool CheckDestroyedDurabilityXItemList_OnOK(GUIComponent Sender)
{
    Log("[BTNetMainMenu::CheckDestroyedDurabilityXItemList_OnOK]");
    Controller.CloseMenu(false);
    SetPage(22, false);
    return true;
    //return;    
}

function bool CheckDestroyedDurabilityXItemList()
{
    local int i;
    local string ddx;

    Log("[BTNetMainMenu::CheckDestroyedDurabilityXItemList]");
    // End:0xD2
    if(DestroyedDurabilityXItems.Length > 0)
    {
        ddx = DestroyedDurabilityXItems[0];
        i = 1;
        J0x56:

        // End:0x8A [Loop If]
        if(i < DestroyedDurabilityXItems.Length)
        {
            ddx $= (", " $ DestroyedDurabilityXItems[i]);
            i++;
            // [Loop Continue]
            goto J0x56;
        }
        DestroyedDurabilityXItems.Length = 0;
        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 17, ddx);
        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = CheckDestroyedDurabilityXItemList_OnOK;
        return true;
    }
    return false;
    //return;    
}

function CheckItemWarning()
{
    Log("[BTNetMainMenu::CheckItemWarning]");
    // End:0x48
    if(bWarningDurabilityAndExpired)
    {
        bWarningDurabilityAndExpired = false;
        // End:0x48
        if((CheckDurabilityWarningItemList()) == false)
        {
            CheckExpiredItemList();
        }
    }
    //return;    
}

function ClearServerChannelList()
{
    SCIList.Length = 0;
    //return;    
}

function AddServerChannelList(int ServerID, int ChannelID, string ServerIP, int serverPort, int ServerDataPort, string ServerName, string ServerShortName, string ChannelName, int ServerGroupID, string ServerGroupName, int IsClanChannel, string ChannelNickName, bool IsPracticeChannel, bool IsDedicatedServer, optional int nCurUser, optional int nMaxUser)
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
    SCIList[AddIdx].IsPracticeChannel = IsPracticeChannel;
    SCIList[AddIdx].IsDedicatedServer = IsDedicatedServer;
    SCIList[AddIdx].nCurUser = nCurUser;
    SCIList[AddIdx].nMaxUser = nMaxUser;
    //return;    
}

function int FindServerChannelInfoIndexByServerIP(string ServerIP, int serverPort, int ChannelID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x79 [Loop If]
    if(i < SCIList.Length)
    {
        // End:0x6F
        if(((SCIList[i].ServerIP == ServerIP) && SCIList[i].serverPort == serverPort) && SCIList[i].ChannelID == ChannelID)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function int FindServerConnectionInfoIndex(int ServerID, int ChannelID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5D [Loop If]
    if(i < SCIList.Length)
    {
        // End:0x53
        if((SCIList[i].ServerID == ServerID) && SCIList[i].ChannelID == ChannelID)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function string FindServerName(int ServerID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4C [Loop If]
    if(i < SCIList.Length)
    {
        // End:0x42
        if(SCIList[i].ServerID == ServerID)
        {
            return SCIList[i].ServerName;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return "";
    //return;    
}

function string FindServerShortName(int ServerID, int ChannelID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x68 [Loop If]
    if(i < SCIList.Length)
    {
        // End:0x5E
        if((SCIList[i].ServerID == ServerID) && SCIList[i].ChannelID == ChannelID)
        {
            return SCIList[i].ServerShortName;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return "";
    //return;    
}

function string FindChannelNickName(int ServerID, int ChannelID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x68 [Loop If]
    if(i < SCIList.Length)
    {
        // End:0x5E
        if((SCIList[i].ServerID == ServerID) && SCIList[i].ChannelID == ChannelID)
        {
            return SCIList[i].ChannelNickName;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return "";
    //return;    
}

function StartAutoMove(int Server, int Channel, int gameroom, optional string Password, optional int ClanMatch_EnterState)
{
    local export editinline BTNetGUIPageHK currp;

    __NFUN_270__(((((((("[BTNetMainMenu::StartAutoMove] (" $ string(Server)) $ ",") $ string(Channel)) $ ",") $ string(gameroom)) $ ",") $ Password) $ ")");
    Log(((((((("[BTNetMainMenu::StartAutoMove] (" $ string(Server)) $ ",") $ string(Channel)) $ ",") $ string(gameroom)) $ ",") $ Password) $ ")");
    // End:0xC0
    if(bAutoMove)
    {
        return;
    }
    // End:0xCD
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
    // End:0x1BD
    if((rMM.kServerID == AutoMoveServerID) && rMM.kChannelID == AutoMoveChannelID)
    {
        // End:0x195
        if(((AutoMoveClanWar == 0) && AutoMoveGameRoomNum != -1) && rMM.kRoomID == AutoMoveGameRoomNum)
        {
            AutoMoveState = 2;
            EndAutoMove();            
        }
        else
        {
            AutoMoveState = 1;
            // End:0x1BD
            if(rMM.kRoomID == -1)
            {
                AutoMoveDirectionOut = false;
            }
        }
    }
    __NFUN_270__((("[BTNetMainMenu::StartAutoMove] AutoMoveState=" $ string(AutoMoveState)) $ ", AutoMoveDirectionOut=") $ string(AutoMoveDirectionOut));
    Log((("[BTNetMainMenu::StartAutoMove] AutoMoveState=" $ string(AutoMoveState)) $ ", AutoMoveDirectionOut=") $ string(AutoMoveDirectionOut));
    // End:0x2EC
    if(((page_Lobby2 != none) && page_curr == page_Lobby2) || (page_RoomLobby != none) && page_curr == page_RoomLobby)
    {
        __NFUN_270__("lobby or roomlobby");
        Log("lobby or roomlobby");
        KeepMoving();        
    }
    else
    {
        currp = BTNetGUIPageHK(page_curr);
        // End:0x3A7
        if(currp != none)
        {
            // End:0x356
            if(page_curr == page_ServerSelection)
            {
                __NFUN_270__("serverselection");
                Log("serverselection");
                AutoMoveState = 0;
                AutoMoveDirectionOut = false;
                KeepMoving();                
            }
            else
            {
                __NFUN_270__("other page");
                Log("other page");
                currp.TPTopMenu.TopMenuButton_OnClick(currp.TPTopMenu.GoBack);
            }
            return;            
        }
        else
        {
            __NFUN_270__("is not guipage");
            Log("is not guipage");
            EndAutoMove();
            return;
        }
    }
    //return;    
}

function EndAutoMove()
{
    local export editinline BTWindowHK BTWindow;

    __NFUN_270__("[BTNetMainMenu::EndAutoMove]");
    Log("[BTNetMainMenu::EndAutoMove]");
    // End:0x7E
    if(bAutoMove)
    {
        __NFUN_270__("Prev bAutoMove==true");
        Log("Prev bAutoMove==true");        
    }
    else
    {
        __NFUN_270__("Prev bAutoMove==false");
        Log("Prev bAutoMove==false");
    }
    bAutoMove = false;
    BTWindow = BTWindowHK(Controller.TopPage());
    J0xD3:

    // End:0x14A [Loop If]
    if(BTWindow != none)
    {
        __NFUN_270__(string(BTWindow.Name) @ "CloseMenu");
        Log(string(BTWindow.Name) @ "CloseMenu");
        Controller.CloseMenu(false);
        BTWindow = BTWindowHK(Controller.TopPage());
        // [Loop Continue]
        goto J0xD3;
    }
    //return;    
}

function KeepMoving()
{
    __NFUN_270__(((((((((((("[BTNetMainMenu::KeepMoving] bAutoMove=" $ string(bAutoMove)) $ ", AutoMoveDirectionOut=") $ string(AutoMoveDirectionOut)) $ "(") $ string(AutoMoveServerID)) $ ",") $ string(AutoMoveChannelID)) $ ",") $ string(AutoMoveGameRoomNum)) $ ",") $ AutoMoveGameRoomPassword) $ ")");
    __NFUN_270__((((((("[BTNetMainMenu::KeepMoving] CurrentPos=" $ "(") $ string(rMM.kServerID)) $ ",") $ string(rMM.kChannelID)) $ ",") $ string(rMM.kRoomID)) $ ")");
    Log(((((((((((("[BTNetMainMenu::KeepMoving] bAutoMove=" $ string(bAutoMove)) $ ", AutoMoveDirectionOut=") $ string(AutoMoveDirectionOut)) $ "(") $ string(AutoMoveServerID)) $ ",") $ string(AutoMoveChannelID)) $ ",") $ string(AutoMoveGameRoomNum)) $ ",") $ AutoMoveGameRoomPassword) $ ")");
    Log((((((("[BTNetMainMenu::KeepMoving] CurrentPos=" $ "(") $ string(rMM.kServerID)) $ ",") $ string(rMM.kChannelID)) $ ",") $ string(rMM.kRoomID)) $ ")");
    // End:0x225
    if(bAutoMove == false)
    {
        return;        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowAutoStateHK'.static.ShowState(Controller, 1);
    }
    // End:0x4F1
    if(AutoMoveDirectionOut)
    {
        // End:0x396
        if(int(AutoMoveState) <= 0)
        {
            // End:0x396
            if((page_Lobby2 != none) && page_Lobby2 == page_curr)
            {
                __NFUN_270__((("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut)) $ ", AutoMoveState=") $ string(AutoMoveState));
                __NFUN_270__(("TcpChannel.sfReqLeaveChannel(" $ string(rMM.kChannelID)) $ ")");
                Log((("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut)) $ ", AutoMoveState=") $ string(AutoMoveState));
                Log(("TcpChannel.sfReqLeaveChannel(" $ string(rMM.kChannelID)) $ ")");
                page_Lobby2.bGoBack = true;
                TcpChannel.sfReqLeaveChannel(rMM.kChannelID);
                AutoMoveDirectionOut = false;
                return;
            }
        }
        // End:0x4EE
        if(int(AutoMoveState) <= 1)
        {
            // End:0x4EE
            if((page_RoomLobby != none) && page_RoomLobby == page_curr)
            {
                __NFUN_270__((("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut)) $ ", AutoMoveState=") $ string(AutoMoveState));
                __NFUN_270__(("TcpChannel.sfReqLeaveRoom(" $ string(rMM.kRoomID)) $ ")");
                Log((("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut)) $ ", AutoMoveState=") $ string(AutoMoveState));
                Log(("TcpChannel.sfReqLeaveRoom(" $ string(rMM.kRoomID)) $ ")");
                page_RoomLobby.bSafeLeaveRoom = true;
                TcpChannel.sfReqLeaveRoom(rMM.kRoomID);
                // End:0x4EE
                if(int(AutoMoveState) == 1)
                {
                    AutoMoveDirectionOut = false;
                }
            }
        }        
    }
    else
    {
        // End:0x68E
        if(int(AutoMoveState) <= 0)
        {
            // End:0x68E
            if((page_ServerSelection != none) && page_curr == page_ServerSelection)
            {
                __NFUN_270__((("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut)) $ ", AutoMoveState=") $ string(AutoMoveState));
                __NFUN_270__("page_ServerSelection.AutoMoveTochannel()");
                __NFUN_270__((("AutoMoveServerID=" $ string(AutoMoveServerID)) $ ", AutoMoveChannelID=") $ string(AutoMoveChannelID));
                Log((("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut)) $ ", AutoMoveState=") $ string(AutoMoveState));
                Log("page_ServerSelection.AutoMoveTochannel()");
                Log((("AutoMoveServerID=" $ string(AutoMoveServerID)) $ ", AutoMoveChannelID=") $ string(AutoMoveChannelID));
                page_ServerSelection.AutoMoveTochannel(AutoMoveServerID, AutoMoveChannelID);
                return;
            }
        }
        // End:0x9AC
        if(int(AutoMoveState) <= 1)
        {
            // End:0x9AC
            if((page_Lobby2 != none) && page_curr == page_Lobby2)
            {
                // End:0x894
                if(AutoMoveGameRoomNum != -1)
                {
                    __NFUN_270__((("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut)) $ ", AutoMoveState=") $ string(AutoMoveState));
                    __NFUN_270__("page_ServerSelection.AutoMoveToRoom()");
                    __NFUN_270__((("AutoMoveGameRoomNum=" $ string(AutoMoveGameRoomNum)) $ ", AutoMoveGameRoomPassword=") $ AutoMoveGameRoomPassword);
                    Log((("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut)) $ ", AutoMoveState=") $ string(AutoMoveState));
                    Log("page_ServerSelection.AutoMoveToRoom()");
                    Log((("AutoMoveGameRoomNum=" $ string(AutoMoveGameRoomNum)) $ ", AutoMoveGameRoomPassword=") $ AutoMoveGameRoomPassword);
                    // End:0x850
                    if(AutoMoveClanWar == 1)
                    {
                        page_Lobby2.AutoMoveToClanReadyRoom(AutoMoveGameRoomNum, AutoMoveGameRoomPassword);                        
                    }
                    else
                    {
                        // End:0x878
                        if(AutoMoveClanWar == 2)
                        {
                            page_Lobby2.AutoMoveReturnClanReadyRoom(AutoMoveGameRoomNum, AutoMoveGameRoomPassword);                            
                        }
                        else
                        {
                            page_Lobby2.AutoMoveToRoom(AutoMoveGameRoomNum, AutoMoveGameRoomPassword);
                        }
                    }                    
                }
                else
                {
                    __NFUN_270__((("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut)) $ ", AutoMoveState=") $ string(AutoMoveState));
                    __NFUN_270__((("AutoMoveGameRoomNum=" $ string(AutoMoveGameRoomNum)) $ ", AutoMoveGameRoomPassword=") $ AutoMoveGameRoomPassword);
                    Log((("AutoMoveDirectionOut=" $ string(AutoMoveDirectionOut)) $ ", AutoMoveState=") $ string(AutoMoveState));
                    Log((("AutoMoveGameRoomNum=" $ string(AutoMoveGameRoomNum)) $ ", AutoMoveGameRoomPassword=") $ AutoMoveGameRoomPassword);
                    EndAutoMove();
                }
                return;
            }
        }
        // End:0x9C2
        if(int(AutoMoveState) <= 2)
        {
            EndAutoMove();
            return;
        }
    }
    //return;    
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
    // End:0x2FB
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
        // End:0x1DB
        if(strTemp != "")
        {
            szLoginServerPort = int(strTemp);
        }
        // End:0x2F8
        if(bFind == false)
        {
            // End:0x231
            if("NA" == Controller.ViewportOwner.Actor.Level.AuthLogin_RegionKey)
            {
                szLoginServerIP = "211.43.146.69";                
            }
            else
            {
                // End:0x27C
                if("EU" == Controller.ViewportOwner.Actor.Level.AuthLogin_RegionKey)
                {
                    szLoginServerIP = "211.43.159.197";                    
                }
                else
                {
                    szLoginServerIP = "";
                }
            }
            Log((((string(self) $ " AuthLogin_RegionKey :") $ Controller.ViewportOwner.Actor.Level.AuthLogin_RegionKey) $ "/ szLoginServerIP : ") $ szLoginServerIP);
            szLoginServerPort = 56000;
        }        
    }
    else
    {
        bFind = false;
        strTemp = "";
        strTemp = Controller.ViewportOwner.Actor.ConsoleCommand("GETTEST_STRING TEST IP");
        // End:0x369
        if(strTemp != "")
        {
            szLoginServerIP = strTemp;
            bFind = true;
        }
        strTemp = "";
        strTemp = Controller.ViewportOwner.Actor.ConsoleCommand("GETTEST_STRING TEST Port");
        // End:0x3CB
        if(strTemp != "")
        {
            szLoginServerPort = int(strTemp);
        }
        // End:0x43C
        if(bFind == false)
        {
            // End:0x41C
            if(Controller.ViewportOwner.Actor.Level.bServiceTestBuild)
            {
                szLoginServerIP = "218.234.76.43";                
            }
            else
            {
                szLoginServerIP = "202.31.212.65";
            }
            szLoginServerPort = 55000;
        }
    }
    Log(((("page_Main.TcpLogin.Connect( " $ szLoginServerIP) $ ", ") $ string(szLoginServerPort)) $ " ) Start");
    rMM.bServerConnected = page_Main.TcpLogin.Connect(szLoginServerIP, szLoginServerPort);
    Log(((("page_Main.TcpLogin.Connect( " $ szLoginServerIP) $ ", ") $ string(szLoginServerPort)) $ " ) End");
    pwm = new Class'GUIWarfareControls.PageOnWindowManager';
    pwm.Init(Controller);
    //return;    
}

function ShowPlayTimePerHour_OnEventTimer(int Index)
{
    local string Msg;

    CheckOneHour += 1;
    Msg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(174, string(CheckOneHour));
    PlayerOwner().dblog(Msg);
    AddChatLog(Msg, 5, true);
    //return;    
}

function InitializeTcpChannel(string IP, int Port, int DataPort)
{
    Log(((("[BTNetMainMenu::InitializeTcpChannel]" $ " ip=") $ IP) $ " port=") $ string(Port));
    // End:0x65
    if(NetGameData != none)
    {
        NetGameData.ClearNetData();
    }
    NetGameData = new Class'BTData.BTNetGameData';
    // End:0xBA
    if(TcpChannel != none)
    {
        Log("TcpChannel is none");
        Log("TcpChannel.Close()");
        TcpChannel.Close();
    }
    Log("TcpChannel = new class'BTTcpHandler'");
    TcpChannel = new Class'GUIWarfare_Decompressed.BTTcpHandler';
    Log("TcpChannel.InitNetwork()");
    TcpChannel.InitNetwork();
    BTTcpHandler(TcpChannel).MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    BTTcpHandler(TcpChannel).GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Controller.ViewportOwner.Actor.Level.GetMatchMaker().kTcpChannel = TcpChannel;
    Controller.ViewportOwner.Actor.Level.GetMatchMaker().__OnReqSuccessStartGame__Delegate = BTTcpHandler(TcpChannel).OnReqSuccessStartGame;
    Log(((("TcpChannel.Connect(" $ IP) $ ", ") $ string(Port)) $ ")");
    TcpChannel.Connect(IP, Port);
    BTTcpHandler(TcpChannel).MainMenu = self;
    rMM.szChannelIP = IP;
    rMM.nChannelPort = Port;
    rMM.StartTickCheck();
    Controller.TcpHandler = TcpChannel;
    //return;    
}

function InitializeTcpLogin(string IP, int Port)
{
    TcpLogin = GetTcpLogin();
    TcpLogin.Connect(IP, Port);
    //return;    
}

function BTTcpLink_Login GetTcpLogin()
{
    local BTTcpLoginHandler Login;

    Log("[BTNetMainMenu::GetTcpLogin]");
    Log("login = new class'BTTcpLoginHandler';");
    Login = new Class'GUIWarfare_Decompressed.BTTcpLoginHandler';
    Log("login.InitNetwork();");
    Login.InitNetwork();
    Log("login.MainMenu = self;");
    Login.MainMenu = self;
    return Login;
    //return;    
}

function deleOnOpen()
{
    OnOpen();
    Log("[BTNetMainMenu::deleOnOpen]");
    // End:0x5C
    if(PlayerOwner().Level.GetMatchMaker().InGamePlaying)
    {
        Controller.CloseAll(false, true);        
    }
    else
    {
        SetPage(PageOnOpen, false);
    }
    //return;    
}

function bool deleOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x22
    if((int(key) == 27) && int(State) == 1)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function deleOnClose(optional bool bCancelled)
{
    Log("[BTNetMainMenu::deleOnClose]");
    SaveConfig();
    //return;    
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
    //return;    
}

function StartNatCheck()
{
    // End:0x56
    if(NatType != -1)
    {
        TcpChannel.sfAckStartNatDiag(NatType);
        __NFUN_270__("NatType is " $ string(NatType));
        Log("NatType is " $ string(NatType));
        return;
    }
    // End:0xF9
    if(NatCheckLoop <= 0)
    {
        __NFUN_270__("[BTNetMainMenu::StartNatCheck] Start!!");
        Log("[BTNetMainMenu::StartNatCheck] Start!!");
        NatCheckLoop = 3;
        Console(Controller.Master.Console).ConsoleCommand("NatCheckOn");
        CheckNatPhrase0HK();        
    }
    else
    {
        __NFUN_270__("[BTNetMainMenu::StartNatCheck] Now Checking!! NatCheckLoop=" $ string(NatCheckLoop));
        Log("[BTNetMainMenu::StartNatCheck] Now Checking!! NatCheckLoop=" $ string(NatCheckLoop));
    }
    //return;    
}

function CheckNatPhrase0HK()
{
    // End:0x15
    if(NatCheckLoop > 0)
    {
        NatCheckLoop--;        
    }
    else
    {
        NatDiag = none;
        NatCheckLoop = 0;
        __delegateCheckNat__Delegate = None;
        __NFUN_270__("[BTNetMainMenu::CheckNatPhrase0HK] NatCheckLoop Over!!! Stop Nat Checking!!!");
        Log("[BTNetMainMenu::CheckNatPhrase0HK] NatCheckLoop Over!!! Stop Nat Checking!!!");
        return;
    }
    __NFUN_270__("[BTNetMainMenu::CheckNatPhrase0HK] Start!!!");
    Log("[BTNetMainMenu::CheckNatPhrase0HK] Start!!!");
    NatDiag = new Class'BatteryNet.BTNatDiag';
    Log("[BTNetMainMenu::CheckNatPhrase0HK] NatDiag.Start before");
    NatDiag.Start(NatAddrs, NatPorts);
    Log("[BTNetMainMenu::CheckNatPhrase0HK] NatDiag.Start successful");
    TimeNatDiagStarted = Controller.ViewportOwner.Actor.Level.TimeSeconds;
    NatDiagInterval = 3.0000000;
    __delegateCheckNat__Delegate = CheckNatPhrase1HK;
    //return;    
}

function CheckNatPhrase1HK()
{
    __NFUN_270__("[BTNetMainMenu::CheckNatPhrase1HK] before NatDiag.ProcessStep1()");
    Log("[BTNetMainMenu::CheckNatPhrase1HK] before NatDiag.ProcessStep1()");
    // End:0x194
    if(NatDiag.ProcessStep1())
    {
        __NFUN_270__("[BTNetMainMenu::CheckNatPhrase1HK] Success!!!");
        Log("[BTNetMainMenu::CheckNatPhrase1HK] Success!!!");
        __delegateCheckNat__Delegate = None;
        NatType = NatDiag.NatType;
        rMM.nNatType = NatType;
        rMM.SetNatTypeToEngine(NatType);
        TcpChannel.sfAckStartNatDiag(NatType);
        __NFUN_270__("NatType is " $ string(NatType));
        Log("NatType is " $ string(NatType));
        NatCheckLoop = 0;        
    }
    else
    {
        __NFUN_270__("[BTNetMainMenu::CheckNatPhrase1HK] Failed");
        Log("[BTNetMainMenu::CheckNatPhrase1HK] Failed");
        TimeNatDiagStarted = Controller.ViewportOwner.Actor.Level.TimeSeconds;
        NatDiagInterval = 3.0000000;
        __delegateCheckNat__Delegate = CheckNatPhrase2HK;
    }
    //return;    
}

function CheckNatPhrase2HK()
{
    __NFUN_270__("[BTNetMainMenu::CheckNatPhrase2HK] before NatDiag.ProcessStep2()");
    Log("[BTNetMainMenu::CheckNatPhrase2HK] before NatDiag.ProcessStep2()");
    // End:0x194
    if(NatDiag.ProcessStep2())
    {
        __NFUN_270__("[BTNetMainMenu::CheckNatPhrase2HK] Success!!!");
        Log("[BTNetMainMenu::CheckNatPhrase2HK] Success!!!");
        __delegateCheckNat__Delegate = None;
        NatType = NatDiag.NatType;
        rMM.nNatType = NatType;
        rMM.SetNatTypeToEngine(NatType);
        TcpChannel.sfAckStartNatDiag(NatType);
        __NFUN_270__("NatType is " $ string(NatType));
        Log("NatType is " $ string(NatType));
        NatCheckLoop = 0;        
    }
    else
    {
        __NFUN_270__("[BTNetMainMenu::CheckNatPhrase2HK] Failed");
        Log("[BTNetMainMenu::CheckNatPhrase2HK] Failed");
        TimeNatDiagStarted = Controller.ViewportOwner.Actor.Level.TimeSeconds;
        NatDiagInterval = 3.0000000;
        __delegateCheckNat__Delegate = CheckNatPhrase0HK;
    }
    //return;    
}

event bool rfReqForceNatTypeSetting(int NatType)
{
    __NFUN_270__("[BTNetMainMenu::rfReqForceNatTypeSetting] NatType=" $ string(NatType));
    Log("[BTNetMainMenu::rfReqForceNatTypeSetting] NatType=" $ string(NatType));
    self.NatType = NatType;
    rMM.nNatType = NatType;
    rMM.SetNatTypeToEngine(NatType);
    __delegateCheckNat__Delegate = None;
    return true;
    //return;    
}

function HaltNetwork()
{
    local bool resultChannel, resultLogin;

    Log("[BTNetMainMenu::HaltNetwork]");
    resultChannel = TcpChannel.Close();
    resultLogin = TcpLogin.Close();
    Log(((("[BTNetMainMenu::HaltNetwork]" $ " Channel=") $ string(resultChannel)) $ " Login=") $ string(resultLogin));
    //return;    
}

function SetPage(Object.EPage PageType, bool closeLastMenu)
{
    local int i;
    local bool bExistPage;

    Log(((("[BTNetMainMenu::SetPage]" $ " PageType=") $ string(GetEnum(Enum'Core.Object.EPage', int(PageType)))) $ " CloseLastMenu=") $ string(closeLastMenu));
    SaveConfig();
    J0x60:

    // End:0xD5 [Loop If]
    if((page_curr != none) && page_curr != self)
    {
        // End:0xC2
        if(((Controller.TopPage() == none) || Controller.TopPage() == self) || Controller.TopPage() == page_curr)
        {
            // [Explicit Break]
            goto J0xD5;
        }
        Controller.CloseMenu(false);
        // [Loop Continue]
        goto J0x60;
    }
    J0xD5:

    // End:0x105
    if((Controller.TopPage() != self) && closeLastMenu)
    {
        Controller.CloseMenu(false);
    }
    switch(PageType)
    {
        // End:0x114
        case 1:
            // End:0x577
            break;
        // End:0x15A
        case 2:
            Controller.OpenMenu(pagename_Logo);
            // End:0x157
            if(page_Logo == none)
            {
                page_Logo = BTPageLogo(Controller.FindPersistentMenuByName(pagename_Logo));
            }
            // End:0x577
            break;
        // End:0x1A0
        case 3:
            Controller.OpenMenu(pagename_Login);
            // End:0x19D
            if(page_Login == none)
            {
                page_Login = BTPageLogin(Controller.FindPersistentMenuByName(pagename_Login));
            }
            // End:0x577
            break;
        // End:0x1E6
        case 4:
            Controller.OpenMenu(pagename_CharacterCreation);
            // End:0x1E3
            if(page_CharacterCreation == none)
            {
                page_CharacterCreation = BTPageCharacterCreation(Controller.FindPersistentMenuByName(pagename_CharacterCreation));
            }
            // End:0x577
            break;
        // End:0x22C
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
            // End:0x26F
            if(page_ServerSelection == none)
            {
                page_ServerSelection = BTPageServerSelection(Controller.FindPersistentMenuByName(pagename_ServerSelection));
            }
            // End:0x577
            break;
        // End:0x2B8
        case 10:
            Controller.OpenMenu(pagename_RoomLobby);
            // End:0x2B5
            if(page_RoomLobby == none)
            {
                page_RoomLobby = BTPageRoomLobby(Controller.FindPersistentMenuByName(pagename_RoomLobby));
            }
            // End:0x577
            break;
        // End:0x2FE
        case 12:
            Controller.OpenMenu(pagename_MatchResult2);
            // End:0x2FB
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
        // End:0x38A
        case 19:
            Controller.OpenMenu(pagename_Help);
            // End:0x387
            if(page_Help == none)
            {
                page_Help = BTPageHelp(Controller.FindPersistentMenuByName(pagename_Help));
            }
            // End:0x577
            break;
        // End:0x3D0
        case 20:
            Controller.OpenMenu(pagename_Mail);
            // End:0x3CD
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
        // End:0x45C
        case 22:
            Controller.OpenMenu(pagename_Inventory);
            // End:0x459
            if(page_Inventory == none)
            {
                page_Inventory = BTPageInventory(Controller.FindPersistentMenuByName(pagename_Inventory));
            }
            // End:0x577
            break;
        // End:0x4A2
        case 23:
            Controller.OpenMenu(pagename_MyInfo);
            // End:0x49F
            if(page_MyInfo == none)
            {
                page_MyInfo = BTPageMyInfo(Controller.FindPersistentMenuByName(pagename_MyInfo));
            }
            // End:0x577
            break;
        // End:0x4E8
        case 24:
            Controller.OpenMenu(pagename_Clan);
            // End:0x4E5
            if(page_Clan == none)
            {
                page_Clan = BTPageClan(Controller.FindPersistentMenuByName(pagename_Clan));
            }
            // End:0x577
            break;
        // End:0x52E
        case 25:
            Controller.OpenMenu(pagename_Credit);
            // End:0x52B
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
        // End:0xFFFF
        default:
            break;
    }
    eCurrPage = PageType;
    page_curr = BTNetGUIPage(Controller.TopPage());
    // End:0x5B5
    if(closeLastMenu)
    {
        Pages.Remove(Pages.Length - 1, 1);
    }
    // End:0x65A
    if((int(PageType) != int(1)) && int(PageType) != int(0))
    {
        i = 0;
        J0x5DE:

        // End:0x623 [Loop If]
        if(i < Pages.Length)
        {
            // End:0x619
            if(Pages[i] == page_curr)
            {
                Pages.Remove(i--, 1);
                bExistPage = true;
            }
            i++;
            // [Loop Continue]
            goto J0x5DE;
        }
        Pages.Length = Pages.Length + 1;
        Pages[Pages.Length - 1] = page_curr;
        page_curr.OnCompleteOpened();        
    }
    else
    {
        // End:0x681
        if(int(PageType) == int(1))
        {
            page_curr.OnBackToLastPage();
            bExistPage = true;
        }
    }
    // End:0x69B
    if(bExistPage)
    {
        page_curr.FadeIn(false, true);
    }
    //return;    
}

function TcpLogin_OnConnect(int ErrCode)
{
    Log("[BTNetMainMenu::TcpLogin_OnConnect] ErrCode=" $ string(ErrCode));
    BTConsole(Controller.ViewportOwner.Console).MainMenu = self;
    // End:0xFF
    if(ErrCode != 0)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 6, string(ErrCode));
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        Controller.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportS(ErrCode, Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(6, string(ErrCode)));        
    }
    else
    {
        bConnectedLoginServer = true;
    }
    //return;    
}

function TcpLogin_OnClose(int ErrCode)
{
    Log("[BTNetMainMenu::TcpLogin_OnClose] ErrCode=" $ string(ErrCode));
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 7, string(ErrCode));
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    Controller.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportS(ErrCode, Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(7, string(ErrCode)));
    bConnectedLoginServer = false;
    //return;    
}

function TcpLogin_OnError(int ErrCode)
{
    Log("[BTNetMainMenu::TcpLogin_OnError] ErrCode=" $ string(ErrCode));
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 8, string(ErrCode));
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    Controller.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportS(ErrCode, Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(8, string(ErrCode)));
    bConnectedLoginServer = false;
    //return;    
}

function bool TcpLogin_rfAckHash(int Result, string Error)
{
    Log((("[BTNetMainMenu::TcpLogin_rfAckHash] Result=" $ string(Result)) $ " Error=") $ Error);
    // End:0x58
    if(Result == 0)
    {        
    }
    else
    {
        // End:0x102
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() && Controller.ViewportOwner.Actor.Level.bServiceBuildHK == false)
        {
            page_Main.HaltNetwork();
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 104);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;            
        }
        else
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 104);
        }
    }
    return true;
    //return;    
}

function bool Exit_OnOK(GUIComponent Sender)
{
    Log("[BTNetMainMenu::Exit_OnOK]");
    Controller.ConsoleCommand("exit");
    return true;
    //return;    
}

function AddChatLog(string chatText, int ChatType, optional bool bForceUpdateLast)
{
    ChatLog[ChatLogTop].chatText = chatText;
    ChatLog[ChatLogTop].ChatType = ChatType;
    ChatLogTop++;
    // End:0x4A
    if(ChatLogTop >= ChatLog.Length)
    {
        ChatLogTop = 0;
    }
    // End:0x63
    if(bForceUpdateLast)
    {
        SelectChatLog(ChatType, chatText);
    }
    //return;    
}

function int GetChatLogTopIndex()
{
    return ChatLogTop;
    //return;    
}

delegate ClearChatLog()
{
    //return;    
}

delegate NormalChatLog(string cL)
{
    //return;    
}

delegate ClanChatLog(string cL)
{
    //return;    
}

delegate WhisperChatLog(string cL)
{
    //return;    
}

delegate SelfChatLog(string cL)
{
    //return;    
}

delegate SystemChatLog(string cL)
{
    //return;    
}

delegate TeamChatLog(string cL)
{
    //return;    
}

delegate BroadCastItemChatLog(string cL)
{
    //return;    
}

delegate ClearChatLog_Extra()
{
    //return;    
}

delegate NormalChatLog_Extra(string cL)
{
    //return;    
}

delegate ClanChatLog_Extra(string cL)
{
    //return;    
}

delegate WhisperChatLog_Extra(string cL)
{
    //return;    
}

delegate SelfChatLog_Extra(string cL)
{
    //return;    
}

delegate SystemChatLog_Extra(string cL)
{
    //return;    
}

delegate TeamChatLog_Extra(string cL)
{
    //return;    
}

delegate BroadCastItemChatLog_Extra(string cL)
{
    //return;    
}

function bool SelectChatLog(int ChatType, string chatText)
{
    switch(ChatType)
    {
        // End:0x0D
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
        // End:0x7E
        case 3:
            WhisperChatLog(chatText);
            WhisperChatLog_Extra(chatText);
            // End:0x119
            break;
        // End:0xA4
        case 4:
            SelfChatLog(chatText);
            SelfChatLog_Extra(chatText);
            // End:0x119
            break;
        // End:0xCA
        case 5:
            SystemChatLog(chatText);
            SystemChatLog_Extra(chatText);
            // End:0x119
            break;
        // End:0xF0
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
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function ResetChatLog()
{
    local int i;

    ChatLogTop = 0;
    i = 0;
    J0x0E:

    // End:0x3A [Loop If]
    if(i < ChatLog.Length)
    {
        ChatLog[i].ChatType = 0;
        i++;
        // [Loop Continue]
        goto J0x0E;
    }
    //return;    
}

function UpdateChatLog()
{
    local int i, GCLTI;

    GCLTI = GetChatLogTopIndex();
    ClearChatLog();
    i = GCLTI;
    J0x21:

    // End:0x6A [Loop If]
    if(i < ChatLog.Length)
    {
        // End:0x60
        if((SelectChatLog(ChatLog[i].ChatType, ChatLog[i].chatText)) == false)
        {
            // [Explicit Break]
            goto J0x6A;
        }
        i++;
        // [Loop Continue]
        goto J0x21;
    }
    J0x6A:

    // End:0xC4
    if(GCLTI != 0)
    {
        i = 0;
        J0x7C:

        // End:0xC4 [Loop If]
        if(i < GCLTI)
        {
            // End:0xBA
            if((SelectChatLog(ChatLog[i].ChatType, ChatLog[i].chatText)) == false)
            {
                // [Explicit Break]
                goto J0xC4;
            }
            i++;
            // [Loop Continue]
            goto J0x7C;
        }
    }
    J0xC4:

    //return;    
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
            // End:0xFFFF
            default:
                break;
            }
    }
    else
    {
        return false;
        //return;        
    }
}

function bool TextToGMCommand(string Text)
{
    local array<string> arrText;
    local string Content, content2;

    Split(Text, " ", arrText);
    Content = Mid(Text, Len(arrText[0]) + 1);
    content2 = Mid(Text, (Len(arrText[0]) + Len(arrText[1])) + 1);
    // End:0x3A6
    if(arrText.Length >= 2)
    {
        switch(Locs(arrText[0]))
        {
            // End:0x75
            case "//notice_all":
            // End:0xDD
            case strNotice_All:
                TcpChannel.sfReqNotice_GM(0, rMM.kServerID, rMM.kChannelID, rMM.kRoomID, Content);
                AddChatLog("GMCommand : " $ Text, 5, true);
                return true;
            // End:0xF1
            case "//notice_server":
            // End:0x159
            case strNotice_Server:
                TcpChannel.sfReqNotice_GM(1, rMM.kServerID, rMM.kChannelID, rMM.kRoomID, Content);
                AddChatLog("GMCommand : " $ Text, 5, true);
                return true;
            // End:0x16E
            case "//notice_channel":
            // End:0x1D6
            case strNotice_Channel:
                TcpChannel.sfReqNotice_GM(2, rMM.kServerID, rMM.kChannelID, rMM.kRoomID, Content);
                AddChatLog("GMCommand : " $ Text, 5, true);
                return true;
            // End:0x1E8
            case "//notice_room":
            // End:0x309
            case strNotice_Room:
                // End:0x290
                if((arrText.Length >= 3) && IsDigit(arrText[1]))
                {
                    Content = Mid(Text, (Len(arrText[0]) + Len(arrText[1])) + 2);
                    TcpChannel.sfReqNotice_GM(3, rMM.kServerID, rMM.kChannelID, int(arrText[1]), Content);
                    AddChatLog("GMCommand : " $ Text, 5, true);                    
                }
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
            // End:0x35E
            case "//title":
            // End:0x3A3
            case strChangeRoomTitle:
                TcpChannel.sfReqChangeRoomTitle_GM(int(arrText[1]), content2);
                AddChatLog("GMCommand : " $ Text, 5, true);
                return true;
            // End:0xFFFF
            default:
                break;
            }
    }
    else
    {
        return false;
        //return;        
    }
}

function ResetBatteryNotice()
{
    NoticeUIPos = 1024.0000000;
    BatteryNotice.Length = 0;
    UpdateTimeBatteryNotice();
    //return;    
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
    //return;    
}

function string GetNoticeFirst()
{
    // End:0x14
    if(BatteryNotice.Length > 0)
    {
        return BatteryNotice[0];
    }
    return "";
    //return;    
}

function PopNoticeQueue()
{
    // End:0x1F
    if(BatteryNotice.Length > 0)
    {
        NoticeUIPos = 1024.0000000;
        BatteryNotice.Remove(0, 1);
    }
    //return;    
}

function UpdateTimeBatteryNotice()
{
    NoticeUITimeSeconds = Controller.ViewportOwner.Actor.Level.TimeSeconds;
    //return;    
}

function ResetBatteryAAS()
{
    AASUIPos = 0.0000000;
    BatteryAAS.Length = 0;
    UpdateTimeBatteryAAS();
    //return;    
}

function SetAASMessage(byte byType, int AccumTime)
{
    local byte AASLevel, PreLevel;
    local int i;

    // End:0x18
    if(AASTemp[int(byType)].Activated)
    {
        return;
    }
    PreLevel = AASTemp[int(byType)].Level;
    // End:0xF8
    if(1 == int(byType))
    {
        // End:0x57
        if(AccumTime >= 18000)
        {
            AASLevel = 7;            
        }
        else
        {
            // End:0x71
            if(AccumTime >= 16200)
            {
                AASLevel = 6;                
            }
            else
            {
                // End:0x8B
                if(AccumTime >= 14400)
                {
                    AASLevel = 5;                    
                }
                else
                {
                    // End:0xA5
                    if(AccumTime >= 12600)
                    {
                        AASLevel = 4;                        
                    }
                    else
                    {
                        // End:0xBF
                        if(AccumTime >= 10800)
                        {
                            AASLevel = 3;                            
                        }
                        else
                        {
                            // End:0xD9
                            if(AccumTime >= 7200)
                            {
                                AASLevel = 2;                                
                            }
                            else
                            {
                                // End:0xF3
                                if(AccumTime >= 3600)
                                {
                                    AASLevel = 1;                                    
                                }
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
    else
    {
        AASLevel = 0;
    }
    // End:0x15E
    if(int(PreLevel) == int(AASLevel))
    {
        i = 0;
        J0x11A:

        // End:0x15E [Loop If]
        if(i < BatteryAAS.Length)
        {
            // End:0x154
            if(int(BatteryAAS[i].Level) == int(AASLevel))
            {
                BatteryAAS.Remove(i, 1);
            }
            i++;
            // [Loop Continue]
            goto J0x11A;
        }
    }
    AASTemp[int(byType)].Level = AASLevel;
    Controller.ViewportOwner.Actor.AASLevel = AASLevel;
    rMM.SetAASLevel(AASLevel);
    switch(AASLevel)
    {
        // End:0x1D9
        case 0:
            AASTemp[int(byType)].Text = strAASMessage[0];
            // End:0x299
            break;
        // End:0x1FB
        case 1:
            AASTemp[int(byType)].Text = strAASMessage[1];
            // End:0x299
            break;
        // End:0x21E
        case 2:
            AASTemp[int(byType)].Text = strAASMessage[2];
            // End:0x299
            break;
        // End:0x241
        case 3:
            AASTemp[int(byType)].Text = strAASMessage[3];
            // End:0x299
            break;
        // End:0x246
        case 4:
        // End:0x24B
        case 5:
        // End:0x26E
        case 6:
            AASTemp[int(byType)].Text = strAASMessage[4];
            // End:0x299
            break;
        // End:0x273
        case 7:
        // End:0x296
        case 8:
            AASTemp[int(byType)].Text = strAASMessage[5];
            // End:0x299
            break;
        // End:0xFFFF
        default:
            break;
    }
    switch(byType)
    {
        // End:0x329
        case 0:
            AASTemp[0].Activated = true;
            AASTemp[0].Time = 15.0000000;
            AASTemp[0].fBeginTime = Controller.ViewportOwner.Actor.Level.TimeSeconds;
            PushAASQueue(AASTemp[0].Text, 15.0000000 * 1.1000000, AASTemp[0].Level);
            // End:0x3B5
            break;
        // End:0x3B2
        case 1:
            AASTemp[1].Activated = false;
            AASTemp[1].Time = 60.0000000;
            AASTemp[1].fBeginTime = Controller.ViewportOwner.Actor.Level.TimeSeconds;
            PushAASQueue(AASTemp[1].Text, 60.0000000 * 1.1000000, AASTemp[1].Level);
            // End:0x3B5
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function byte GetAASLevel()
{
    return BatteryAAS[0].Level;
    //return;    
}

function float GetAASBeginTime(byte byLevel)
{
    local float DeltaTime;

    DeltaTime = AASTemp[1].fBeginTime - AASTemp[0].fBeginTime;
    // End:0x30
    if(DeltaTime < float(0))
    {        
    }
    else
    {
        // End:0x67
        if(DeltaTime <= AASTemp[0].Time)
        {
            AASTemp[1].fBeginTime += (AASTemp[0].Time - DeltaTime);
        }
    }
    // End:0x84
    if(int(byLevel) > 0)
    {
        return AASTemp[1].fBeginTime;        
    }
    else
    {
        return AASTemp[0].fBeginTime;
    }
    //return;    
}

function PushAASQueue(string Text, float Time, byte AASLevel)
{
    // End:0x1D
    if(BatteryAAS.Length == 0)
    {
        ResetBatteryAAS();
        AASUIPos = Time;
    }
    BatteryAAS.Length = BatteryAAS.Length + 1;
    BatteryAAS[BatteryAAS.Length - 1].Text = Text;
    BatteryAAS[BatteryAAS.Length - 1].Time = Time;
    BatteryAAS[BatteryAAS.Length - 1].Level = AASLevel;
    //return;    
}

function string GetAASFirst()
{
    // End:0x19
    if(BatteryAAS.Length > 0)
    {
        return BatteryAAS[0].Text;
    }
    return "";
    //return;    
}

function float GetAASFirstTime()
{
    // End:0x19
    if(BatteryAAS.Length > 0)
    {
        return BatteryAAS[0].Time;
    }
    return 0.0000000;
    //return;    
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
        else
        {
            AASUIPos = 0.0000000;
        }
    }
    //return;    
}

function UpdateTimeBatteryAAS()
{
    AASUITimeSeconds = Controller.ViewportOwner.Actor.Level.TimeSeconds;
    //return;    
}

function bool Is18YearsOld(BtrDouble ServerTime, string BirthDay)
{
    local BtrTime Time;
    local int cyear, cmonth, cday;

    BtrDoubleToBtrTime(ServerTime, Time);
    cyear = int(Mid(BirthDay, 0, 4));
    cmonth = int(Mid(BirthDay, 4, 2));
    cday = int(Mid(BirthDay, 6, 2));
    Log((((((((("[BTNetMainMenu::IsInRangeDate] " $ string(Time.Year)) $ ", ") $ string(Time.Month)) $ ", ") $ string(Time.Day)) $ " ") $ string(Time.Hour)) $ "-") $ string(Time.Minute));
    Log("BirthDay = " $ BirthDay);
    // End:0xFA
    if((Time.Year - cyear) >= 19)
    {
        return true;        
    }
    else
    {
        // End:0x15C
        if((Time.Year - cyear) == 18)
        {
            // End:0x12B
            if(cmonth < Time.Month)
            {
                return true;                
            }
            else
            {
                // End:0x15A
                if((cmonth == Time.Month) && cday < Time.Day)
                {
                    return true;                    
                }
                else
                {
                    return false;
                }
            }
        }
    }
    return false;
    //return;    
}

function bool IsInRangeDate(BtrDouble ServerTime, int syear, int smonth, int sday, int shour, int smin, int eyear, int emonth, int eday, int ehour, int emin)
{
    local BtrTime Time;
    local float ssum, esum, sum;

    BtrDoubleToBtrTime(ServerTime, Time);
    Log((((((((("[BTNetMainMenu::IsInRangeDate] " $ string(Time.Year)) $ ", ") $ string(Time.Month)) $ ", ") $ string(Time.Day)) $ " ") $ string(Time.Hour)) $ "-") $ string(Time.Minute));
    Log((((((((((("StartDate=" $ string(syear)) $ string(smonth)) $ string(sday)) $ string(shour)) $ string(smin)) $ ", EndDate=") $ string(eyear)) $ string(emonth)) $ string(eday)) $ string(ehour)) $ string(emin));
    sum = float((((((Time.Month * 30) * 24) * 60) + ((Time.Day * 24) * 60)) + (Time.Hour * 60)) + Time.Minute);
    ssum = float((((((smonth * 30) * 24) * 60) + ((sday * 24) * 60)) + (shour * 60)) + smin);
    esum = float((((((emonth * 30) * 24) * 60) + ((eday * 24) * 60)) + (ehour * 60)) + emin);
    // End:0x1F6
    if((syear < Time.Year) && Time.Year < eyear)
    {
        return true;        
    }
    else
    {
        // End:0x247
        if((((syear == Time.Year) && eyear == Time.Year) && ssum <= sum) && sum <= esum)
        {
            return true;            
        }
        else
        {
            // End:0x271
            if((syear == Time.Year) && ssum <= sum)
            {
                return true;                
            }
            else
            {
                // End:0x298
                if((eyear == Time.Year) && sum <= esum)
                {
                    return true;
                }
            }
        }
    }
    return false;
    //return;    
}

function bool IsGameReadyOrPlaying()
{
    // End:0x2C
    if((page_RoomLobby != none) && page_curr == page_RoomLobby)
    {
        return page_RoomLobby.IsGameReadyOrPlaying();
    }
    return false;
    //return;    
}

function bool IsInPageServerSelection()
{
    // End:0x1E
    if((page_ServerSelection != none) && page_curr == page_ServerSelection)
    {
        return true;
    }
    return false;
    //return;    
}

function bool IsInPageLobby()
{
    // End:0x1E
    if((page_Lobby2 != none) && page_curr == page_Lobby2)
    {
        return true;
    }
    return false;
    //return;    
}

function int IsInClanChannel(string ServerIP, int serverPort, int ChannelID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x84 [Loop If]
    if(i < SCIList.Length)
    {
        // End:0x7A
        if(((SCIList[i].ChannelID == ChannelID) && SCIList[i].ServerIP == ServerIP) && SCIList[i].serverPort == serverPort)
        {
            return SCIList[i].IsClanChannel;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function bool UpdateChatBan()
{
    local BtrDouble D;
    local BtrTime t;
    local wGameManager GameMgr;
    local int i;

    // End:0xDF
    if(bSystemChatBlock)
    {
        GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
        D = GameMgr.GetLeftEventTime(1001);
        // End:0xDD
        if((D.dummy_1_DO_NOT_USE != 0) || D.dummy_2_DO_NOT_USE != 0)
        {
            BtrDoubleToBtrTime(D, t);
            i = __NFUN_923__(D);
            AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(162, rMM.kUserName, string((i * 24) + t.Hour), string(t.Minute)), 5, true);
        }
        return true;
    }
    // End:0x1AE
    if(bChatBan)
    {
        GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
        D = GameMgr.GetLeftEventTime(1010);
        // End:0x1AC
        if((D.dummy_1_DO_NOT_USE != 0) || D.dummy_2_DO_NOT_USE != 0)
        {
            BtrDoubleToBtrTime(D, t);
            AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(154, string(((t.Hour * 3600) + (t.Minute * 60)) + t.Second)), 5, true);
        }
        return true;
    }
    // End:0x202
    if((CheckChatBan()) == false)
    {
        i = 1;
        J0x1C1:

        // End:0x1F1 [Loop If]
        if(i < 4)
        {
            ChatAccumTime[i - 1] = ChatAccumTime[i];
            i++;
            // [Loop Continue]
            goto J0x1C1;
        }
        ChatAccumTime[i] = 0.0000000;
    }
    return bChatBan;
    //return;    
}

function bool CheckChatBan()
{
    local int i;
    local float sum;
    local wGameManager GameMgr;
    local DelegateEventTimer det;

    i = 0;
    J0x07:

    // End:0x2F [Loop If]
    if(i < 4)
    {
        sum += ChatAccumTime[i];
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0xCF
    if(sum <= float(3))
    {
        GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
        bChatBan = true;
        det = new Class'Engine.DelegateEventTimer';
        det.__OnEventTimer__Delegate = ChatBanEnd_OnTimer;
        GameMgr.AddEventTimerHMS(1010, 0, 1, 0, det);
        AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(153), 5, true);
        return true;
    }
    return false;
    //return;    
}

function ChatBanEnd_OnTimer(int Index)
{
    Log("[BTNetMainMenu::ChatBanEnd_OnTimer]");
    AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(155), 5, true);
    bChatBan = false;
    //return;    
}

function bool Internal_OnChat(GUIComponent Sender, string Text)
{
    local ChatInfo ci;
    local string SendWhisperMsg, filter;

    Log("[BTNetMainMenu::Internal_OnChat]");
    rGameMgr.FilterBadWords(Text);
    // End:0x62
    if((int(rMM.GMLevelFlag) & 3) > 0)
    {
        // End:0x62
        if(TextToGMCommand(Text))
        {
            return true;
        }
    }
    // End:0xA3
    if(int(rMM.kConnectAlpha) > 0)
    {
        // End:0xA3
        if(TextToCommand(Text))
        {
            Text = "/n dice = " $ string(Rand(CommandParameter_int));
        }
    }
    ci = TextToChatInfo(Text);
    switch(ci.ChatType)
    {
        // End:0xEC
        case 1:
            // End:0xE9
            if((UpdateChatBan()) == false)
            {
                TcpChannel.sfReqChatNormal(ci.chatText);
            }
            // End:0x32A
            break;
        // End:0x10D
        case 2:
            TcpChannel.sfReqChatClan(ci.chatText);
            // End:0x32A
            break;
        // End:0x327
        case 3:
            // End:0x15E
            if(ci.ChatTo == "")
            {
                TPChat.InputBox.SetText("/w ");
                TPChat.SetChatState(PrevChatMode.ChatType);
                return false;                
            }
            else
            {
                // End:0x206
                if(ci.chatText == "")
                {
                    AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(143), 5, true);
                    // End:0x1CB
                    if(ci.ChatTo != "")
                    {
                        TPChat.InputBox.SetText(("/w " $ ci.ChatTo) $ " ");                        
                    }
                    else
                    {
                        TPChat.InputBox.SetText("/w ");
                    }
                    TPChat.SetChatState(PrevChatMode.ChatType);
                    return false;                    
                }
                else
                {
                    // End:0x278
                    if(Controller.ViewportOwner.Actor.Level.GameMgr.ContainsBadNicks(ci.ChatTo, filter))
                    {
                        TPChat.InputBox.SetText("/w ");
                        PrevChatMode.ChatTo = "";                        
                    }
                    else
                    {
                        TcpChannel.sfReqChatWispher(ci.ChatTo, ci.chatText);
                        SendWhisperMsg = (((("" $ strTo) $ " [") $ ci.ChatTo) $ "]") @ ci.chatText;
                        AddChatLog(SendWhisperMsg, 3, true);
                        TPChat.InputBox.SetText(("/w " $ ci.ChatTo) $ " ");
                    }
                    TPChat.SetChatState(PrevChatMode.ChatType);
                    return false;
                }
            }
            // End:0x32A
            break;
        // End:0xFFFF
        default:
            break;
    }
    TPChat.SetChatState(PrevChatMode.ChatType);
    return true;
    //return;    
}

function TPChat_OnInputSpace(GUIComponent Sender, string Text)
{
    local ChatInfo ci;

    Log("[BTNetMainMenu::TPChat_OnInputSpace]");
    ci = TextToChatInfo(Text);
    // End:0xE8
    if(ci.ChatType == 3)
    {
        // End:0xAE
        if(ci.ChatTo == "")
        {
            // End:0x8E
            if(LastRecvWhispherName != "")
            {
                TPChat.InputBox.SetText("/w " $ LastRecvWhispherName);                
            }
            else
            {
                TPChat.InputBox.SetText("/w ");
            }            
        }
        else
        {
            // End:0xE8
            if(ci.chatText == "")
            {
                TPChat.InputBox.SetText("/w " $ ci.ChatTo);
            }
        }
    }
    TPChat.SetChatState(PrevChatMode.ChatType);
    //return;    
}

function TPChat_OnInputTab(GUIComponent Sender, string Text)
{
    Log("[BTNetMainMenu::TPChat_OnInputTab]");
    // End:0x45
    if(PrevChatMode.ChatType++ >= 3)
    {
        PrevChatMode.ChatType = 1;
    }
    switch(PrevChatMode.ChatType)
    {
        // End:0x72
        case 1:
            TPChat.InputBox.SetText("");
            // End:0x10E
            break;
        // End:0xE9
        case 3:
            PrevChatMode.ChatTo = LastRecvWhispherName;
            // End:0xC9
            if(PrevChatMode.ChatTo != "")
            {
                TPChat.InputBox.SetText(("/w " $ PrevChatMode.ChatTo) $ " ");                
            }
            else
            {
                TPChat.InputBox.SetText("/w ");
            }
            // End:0x10E
            break;
        // End:0x10B
        case 2:
            TPChat.InputBox.SetText("");
            // End:0x10E
            break;
        // End:0xFFFF
        default:
            break;
    }
    TPChat.SetChatState(PrevChatMode.ChatType);
    TPChat.InputBox.FocusFirst(none);
    //return;    
}

function TPChat_OnChageChatMode(int ChatMode)
{
    Log("[BTNetMainMenu::TPChat_OnChageChatMode]");
    switch(ChatMode)
    {
        // End:0x5F
        case 1:
            PrevChatMode.ChatType = 1;
            TPChat.InputBox.SetText("");
            // End:0x115
            break;
        // End:0x8E
        case 2:
            PrevChatMode.ChatType = 2;
            TPChat.InputBox.SetText("");
            // End:0x115
            break;
        // End:0x112
        case 3:
            PrevChatMode.ChatType = 3;
            PrevChatMode.ChatTo = LastRecvWhispherName;
            // End:0xF2
            if(PrevChatMode.ChatTo != "")
            {
                TPChat.InputBox.SetText(("/w " $ PrevChatMode.ChatTo) $ " ");                
            }
            else
            {
                TPChat.InputBox.SetText("/w ");
            }
            // End:0x115
            break;
        // End:0xFFFF
        default:
            break;
    }
    TPChat.SetChatState(PrevChatMode.ChatType);
    TPChat.InputBox.FocusFirst(none);
    //return;    
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
        // End:0xE4
        case 1:
            PrevChatMode.ChatType = 3;
            PrevChatMode.ChatTo = LastRecvWhispherName;
            // End:0xC4
            if(PrevChatMode.ChatTo != "")
            {
                TPChat.InputBox.SetText(("/w " $ PrevChatMode.ChatTo) $ " ");                
            }
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
        // End:0xFFFF
        default:
            break;
    }
    TPChat.SetChatState(PrevChatMode.ChatType);
    TPChat.InputBox.FocusFirst(none);
    //return;    
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
        // End:0x8F
        case 1:
            PrevChatMode.ChatType = 2;
            TPChat.InputBox.SetText("");
            // End:0x92
            break;
        // End:0xFFFF
        default:
            break;
    }
    TPChat.SetChatState(PrevChatMode.ChatType);
    TPChat.InputBox.FocusFirst(none);
    //return;    
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
            // End:0x11B
            break;
        // End:0x94
        case 115:
            PrevChatMode.ChatType = 2;
            TPChat.InputBox.SetText("");
            // End:0x11B
            break;
        // End:0x118
        case 116:
            PrevChatMode.ChatType = 3;
            PrevChatMode.ChatTo = LastRecvWhispherName;
            // End:0xF8
            if(PrevChatMode.ChatTo != "")
            {
                TPChat.InputBox.SetText(("/w " $ PrevChatMode.ChatTo) $ " ");                
            }
            else
            {
                TPChat.InputBox.SetText("/w ");
            }
            // End:0x11B
            break;
        // End:0xFFFF
        default:
            break;
    }
    TPChat.SetChatState(PrevChatMode.ChatType);
    return true;
    //return;    
}

function ShowCashChargeWindow()
{
    local string payURL;

    payURL = Class'BatteryNet.BTSteamMapping'.static.GetPayURL(AuthLogin_GUID, AuthLogin_ConnectAlpha);
    Log((("[GetPayURL] : AuthLogin_AccountID:" $ AuthLogin_AccountID) $ "AuthLogin_ConnectAlpha:") $ string(AuthLogin_ConnectAlpha));
    Class'GUIWarfareControls.BTWindowWebBrowser'.static.OpenWebWindow(Controller, payURL, 48, 116, 976, 625, strCashCharge);
    BTWindowWebBrowser(Controller.TopPage()).__OnOK__Delegate = ShowReqCashWindow_OnOK;
    //return;    
}

function bool ShowCashChargeWindow_OnOK(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 176);
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = ShowReqCashWindow_OnOK;
    return true;
    //return;    
}

function bool ShowReqCashWindow_OnOK(GUIComponent Sender)
{
    TcpChannel.sfReqWebzenCash();
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function ShowHelpWindow()
{
    Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 55);
    BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = ShowHelpWindow_OnOK;
    //return;    
}

function bool ShowHelpWindow_OnOK(GUIComponent Sender)
{
    // End:0x62
    if(int(page_Main.AuthLogin_ChannelType) == 1)
    {
        Controller.LaunchURL("http://btr.playnetwork.co.kr/Guide/GameGuide/combatA.asp");        
    }
    else
    {
        // End:0xBC
        if(int(page_Main.AuthLogin_ChannelType) == 0)
        {
            Controller.LaunchURL("http://btr.webzen.co.kr/Guide/GameGuide/combatA.asp");
        }
    }
    Controller.CloseMenu(false);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 176);
    return true;
    //return;    
}

function UpdateWebzenShopItemList(int Year, int YearId, int SalesZoneCode)
{
    local wGameManager GameMgr;

    Log((((("[BTNetMainMenu:::UpdateWebzenShopItemList] Year=" $ string(Year)) $ " YearID= ") $ string(YearId)) $ " SalesZoneCode= ") $ string(SalesZoneCode));
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0xED
    if(((GameMgr.kWebzenShopVer_Year == Year) && GameMgr.kWebzenShopVer_YearID == YearId) && GameMgr.kWebzenShopVer_SalesZoneCode == SalesZoneCode)
    {
        return;
    }
    GameMgr.kWebzenShopVer_Year = Year;
    GameMgr.kWebzenShopVer_YearID = YearId;
    GameMgr.kWebzenShopVer_SalesZoneCode = SalesZoneCode;
    Log("Start Download WebzenShopScript!!");
    __NFUN_270__(((((("Start Download WebzenShopScript!! (Year=" $ string(Year)) $ ", YearID=") $ string(YearId)) $ ", SalesZoneCode=") $ string(SalesZoneCode)) $ ")");
    GameMgr.DownloadWebzenShopItemList(GameMgr.kWebzenShopVer_Year, GameMgr.kWebzenShopVer_YearID, GameMgr.kWebzenShopVer_SalesZoneCode);
    Log("PackageLength = " $ string(GameMgr.kWZPackageList.Length));
    __NFUN_270__("PackageLength = " $ string(GameMgr.kWZPackageList.Length));
    __NFUN_270__("End Download WebzenShopScript!!");
    Log("End Download WebzenShopScript!!");
    //return;    
}

function CheckWebzenShopItemList()
{
    local wGameManager GameMgr;

    Log("[BTNetMainMenu:::CheckWebzenShopItemList]");
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Log(("BTNetMainMenu::sfReqShopItemData(" $ string(GameMgr.GP20ShopVersion)) $ ")");
    page_Main.TcpChannel.sfReqShopItemData(GameMgr.GP20ShopVersion);
    //return;    
}

function bool CheckMoveToChannel(int iServerIndex)
{
    // End:0x12
    if(SCIList.Length <= iServerIndex)
    {
        return false;
    }
    // End:0x3F
    if(SCIList[iServerIndex].IsClanChannel > 0)
    {
        // End:0x3F
        if(rMM.kClanName == "")
        {
            return false;
        }
    }
    return true;
    //return;    
}

function UpdateSendQuickSlotIndex(int iQuickSlotIndex)
{
    local int i;

    Log("BTNetMainMenu::UpdateSendQuickSlotIndex] QuickSlotIndex : " $ string(iQuickSlotIndex));
    i = 0;
    J0x4E:

    // End:0x7F [Loop If]
    if(i < iSendUpdateQuickSlotList.Length)
    {
        // End:0x75
        if(iSendUpdateQuickSlotList[i] == iQuickSlotIndex)
        {
            return;
        }
        ++i;
        // [Loop Continue]
        goto J0x4E;
    }
    iSendUpdateQuickSlotList.Length = iSendUpdateQuickSlotList.Length + 1;
    iSendUpdateQuickSlotList[iSendUpdateQuickSlotList.Length - 1] = iQuickSlotIndex;
    //return;    
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
    PlayerOwner().dblog((((("DispOrder = " $ string(iQuickSlotIdx)) $ ", QSlotID = ") $ string(arQslotID)) $ ", QSlotName = ") $ arQslotName);
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[iQuickSlotIdx].ItemID[0]);
    // End:0x334
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("0 ItemName = " $ ItemInfo.ItemName) $ ", ItemID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[iQuickSlotIdx].ItemID[1]);
    // End:0x3C0
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("1 ItemName = " $ ItemInfo.ItemName) $ ", ItemID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[iQuickSlotIdx].ItemID[2]);
    // End:0x44D
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("2 ItemName = " $ ItemInfo.ItemName) $ ", ItemID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[iQuickSlotIdx].ItemID[3]);
    // End:0x4DA
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("3 ItemName = " $ ItemInfo.ItemName) $ ", ItemID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[iQuickSlotIdx].SkillID[0]);
    // End:0x568
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("0 SkillName = " $ ItemInfo.ItemName) $ ", SkillID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[iQuickSlotIdx].SkillID[1]);
    // End:0x5F6
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("1 SkillName = " $ ItemInfo.ItemName) $ ", SkillID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[iQuickSlotIdx].SkillID[2]);
    // End:0x685
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("2 SkillName = " $ ItemInfo.ItemName) $ ", SkillID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[iQuickSlotIdx].SkillID[3]);
    // End:0x714
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("3 SkillName = " $ ItemInfo.ItemName) $ ", SkillID = ") $ string(ItemInfo.ItemID));
    }
    TcpChannel.sfReqUpdateQSlot(arQslotID, arQslotName, arMWItemID, arPistolItemID, arTWItemID1, arTWItemID2, arSkill1, arSkill2, arSkill3, arSkill4);
    //return;    
}

function bool TcpLogin_rfAckLoginWithTencentAuth_Live(int Result, byte tc_AccountType, byte tc_IsBlock)
{
    // End:0x4F
    if(Result != 0)
    {
        HaltNetwork();
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    // End:0xC0
    if(int(tc_IsBlock) == 1)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 87, Controller.ViewportOwner.Actor.Level.AuthLogin_AccountID);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    // End:0xF2
    if(int(tc_AccountType) == 0)
    {
        rMM.GMLevelFlag = 0;
        rMM.bAdminSpectator = false;        
    }
    else
    {
        // End:0x124
        if(int(tc_AccountType) == 1)
        {
            rMM.GMLevelFlag = 1;
            rMM.bAdminSpectator = true;            
        }
        else
        {
            // End:0x154
            if(int(tc_AccountType) == 2)
            {
                rMM.GMLevelFlag = 0;
                rMM.bAdminSpectator = false;
            }
        }
    }
    AuthLogin_AccountType = tc_AccountType;
    TcpLogin.sfReqLoginInHouseTest(AuthLogin_AccountID, "battery", AuthLogin_GUID);
    return true;
    //return;    
}

function bool TcpLogin_rfAckLoginWithTencentAuth_Test(int Result, byte tc_AccountType, byte tc_IsBlock)
{
    // End:0x49
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
    return true;
    //return;    
}

function bool TcpLogin_rfAckLoginWithWZAuth_Live(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType)
{
    // End:0x4F
    if(Result != 0)
    {
        HaltNetwork();
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    // End:0x5F
    if(int(wzp_AuthKeySuccess) == 1)
    {        
    }
    else
    {
        // End:0xAF
        if(int(wzp_AuthKeySuccess) == 0)
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 88, AuthLogin_AccountID);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
            return true;            
        }
        else
        {
            // End:0x100
            if(int(wzp_AuthKeySuccess) == 2)
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 89, AuthLogin_AccountID);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
                return true;                
            }
            else
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 90, AuthLogin_AccountID);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
                return true;
            }
        }
    }
    // End:0x1B1
    if(int(wzp_IsBlock) == 1)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 87, Controller.ViewportOwner.Actor.Level.AuthLogin_AccountID);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    // End:0x1E3
    if(int(wzp_AccountType) == 0)
    {
        rMM.GMLevelFlag = 0;
        rMM.bAdminSpectator = false;        
    }
    else
    {
        // End:0x215
        if(int(wzp_AccountType) == 1)
        {
            rMM.GMLevelFlag = 1;
            rMM.bAdminSpectator = true;            
        }
        else
        {
            // End:0x245
            if(int(wzp_AccountType) == 2)
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
    //return;    
}

function bool TcpLogin_rfAckLoginWithWZAuth_Test(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType)
{
    Log("[BTNetMainMenu::TcpLogin_rfAckLoginWithWZAuth_Test] Result=" $ string(Result));
    // End:0x91
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    Log(((((("[BTNetMainMenu::TcpLogin_rfAckLoginWithWZAuth_Test] sfReqLoginInHouseTest(" $ szAccountName) $ ", ") $ szLoginPassword) $ ", ") $ AuthLogin_GUID) $ ")");
    TcpLogin.sfReqLoginInHouseTest(szAccountName, szLoginPassword, AuthLogin_GUID);
    return true;
    //return;    
}

function bool TcpLogin_rfAckLoginWithThailand_Live(int Result)
{
    // End:0x4F
    if(Result != 0)
    {
        HaltNetwork();
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    TcpLogin.sfReqLoginInHouseTest(AuthLogin_AccountID, "battery", AuthLogin_GUID);
    return true;
    //return;    
}

function bool TcpLogin_rfAckLoginWithThailand_Test(int Result)
{
    // End:0x49
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    TcpLogin.sfReqLoginInHouseTest(szAccountName, szLoginPassword, AuthLogin_GUID);
    return true;
    //return;    
}

function bool TcpLogin_rfAckLoginWithGlobal_Live(int Result)
{
    local int webLogFailCode;

    // End:0x19
    if(Result == 0)
    {
        webLogFailCode = -1;        
    }
    else
    {
        webLogFailCode = 0;
    }
    PlayerOwner().SendWebLog(4080, webLogFailCode);
    // End:0x86
    if(Result != 0)
    {
        HaltNetwork();
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    TcpLogin.sfReqLoginInHouseTest(AuthLogin_AccountID, "battery", AuthLogin_GUID);
    return true;
    //return;    
}

function bool TcpLogin_rfAckLoginWithGlobal_Test(int Result)
{
    Log("[BTNetMainMenu::TcpLogin_rfAckLoginWithGlobal_Test] Result=" $ string(Result));
    __NFUN_270__("[BTNetMainMenu::TcpLogin_rfAckLoginWithGlobal_Test] Result=" $ string(Result));
    // End:0xDA
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = OnAppExit;
        return true;
    }
    TcpLogin.sfReqLoginInHouseTest(szAccountName, szLoginPassword, AuthLogin_GUID);
    return true;
    //return;    
}

function bool OnAppExit(GUIComponent Sender)
{
    Log("[BTNetMainMenu::OnAppExit]");
    Controller.ConsoleCommand("exit");
    return true;
    //return;    
}

function SendLogin()
{
    // End:0xA4
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        PlayerOwner().SendWebLog(4070, -1);
        Log(((((("sfReqLoginWithGlobal(" $ AuthLogin_AccountID) $ ", ") $ AuthLogin_GUID) $ ", ") $ AuthLogin_AuthKey) $ ")");
        TcpLogin.sfReqLoginWithGlobal(AuthLogin_AccountID, AuthLogin_GUID, AuthLogin_AuthKey);        
    }
    else
    {
        Log(((((("sfReqLoginWithGlobal(" $ szAccountName) $ ", ") $ AuthLogin_GUID) $ ", ") $ AuthLogin_AuthKey) $ ")");
        TcpLogin.sfReqLoginWithGlobal(szAccountName, AuthLogin_GUID, AuthLogin_AuthKey);
    }
    //return;    
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
    OnOpen=BTNetMainMenu.deleOnOpen
    OnClose=BTNetMainMenu.deleOnClose
    OnKeyEvent=BTNetMainMenu.deleOnKeyEvent
}