#pragma once

// Arctic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

#include "../SDK.hpp"

namespace Classes
{
//---------------------------------------------------------------------------
//Parameters
//---------------------------------------------------------------------------

// Function BatteryNet.BTTcpLink_Process2Agent.sfReqUpdateCurrentRunningInfo
struct UBTTcpLink_Process2Agent_sfReqUpdateCurrentRunningInfo_Params
{
	int                                                GroupID;                                                  // (Parm)
	struct FString                                     GroupName;                                                // (Parm, NeedCtorLink)
	struct FString                                     ServerName;                                               // (Parm, NeedCtorLink)
	int                                                ServerID;                                                 // (Parm)
	TArray<struct FString>                             key;                                                      // (Parm, NeedCtorLink)
	TArray<int>                                        Value;                                                    // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfReqNotifyKickOffUser
struct UBTTcpLink_Process2Agent_sfReqNotifyKickOffUser_Params
{
	int                                                QQID;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfReqUpdatePostAlram
struct UBTTcpLink_Process2Agent_sfReqUpdatePostAlram_Params
{
	int                                                QQID;                                                     // (Parm)
	struct FString                                     Subject;                                                  // (Parm, NeedCtorLink)
	struct FString                                     Text;                                                     // (Parm, NeedCtorLink)
	int                                                ItemID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfReqUpdateProcessState
struct UBTTcpLink_Process2Agent_sfReqUpdateProcessState_Params
{
	int                                                State;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfAckProcessExcuteCmd
struct UBTTcpLink_Process2Agent_sfAckProcessExcuteCmd_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                MajorType;                                                // (Parm)
	int                                                MinorType;                                                // (Parm)
	struct FString                                     CmdValue;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfReqProcessExcuteCmd
struct UBTTcpLink_Process2Agent_sfReqProcessExcuteCmd_Params
{
	int                                                MajorType;                                                // (Parm)
	int                                                MinorType;                                                // (Parm)
	struct FString                                     CmdValue;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfReqUpdateUserCount_DudeServer
struct UBTTcpLink_Process2Agent_sfReqUpdateUserCount_DudeServer_Params
{
	int                                                ServerID;                                                 // (Parm)
	int                                                MaxUserCount;                                             // (Parm)
	int                                                CurUserCount;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfReqUpdateUserCount_LoginServer
struct UBTTcpLink_Process2Agent_sfReqUpdateUserCount_LoginServer_Params
{
	int                                                ServerID;                                                 // (Parm)
	int                                                MaxUserCount;                                             // (Parm)
	int                                                CurUserCount;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfReqUpdateUserCount_ChannelServer
struct UBTTcpLink_Process2Agent_sfReqUpdateUserCount_ChannelServer_Params
{
	int                                                ServerID;                                                 // (Parm)
	int                                                ChannelCount;                                             // (Parm)
	TArray<int>                                        ChannelNum;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        ChannelMaxUserCount;                                      // (Parm, NeedCtorLink)
	TArray<int>                                        ChannelCurUserCount;                                      // (Parm, NeedCtorLink)
	TArray<int>                                        ChannelPlayingUserCount;                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ChannelRoomCount;                                         // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ChannelGrade;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfReqTerminateDedicateHostProcess
struct UBTTcpLink_Process2Agent_sfReqTerminateDedicateHostProcess_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfAckStartDedicateHost
struct UBTTcpLink_Process2Agent_sfAckStartDedicateHost_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                ProcessID;                                                // (Parm)
	int                                                ServerID;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                RoomNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfReqStartDedicateHost
struct UBTTcpLink_Process2Agent_sfReqStartDedicateHost_Params
{
	int                                                ServerID;                                                 // (Parm)
	struct FString                                     ChannelIPAddr;                                            // (Parm, NeedCtorLink)
	int                                                ChannelPortNum;                                           // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                RoomNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfAckQuitDedicateHost
struct UBTTcpLink_Process2Agent_sfAckQuitDedicateHost_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                PID;                                                      // (Parm)
	int                                                ServerID;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                RoomNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfReqQuitDedicateHost
struct UBTTcpLink_Process2Agent_sfReqQuitDedicateHost_Params
{
	int                                                ServerID;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                RoomNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfAckLogin
struct UBTTcpLink_Process2Agent_sfAckLogin_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfReqLogin
struct UBTTcpLink_Process2Agent_sfReqLogin_Params
{
	int                                                PID;                                                      // (Parm)
	int                                                ServerID;                                                 // (Parm)
	TArray<unsigned char>                              ServerIPAddrType;                                         // (Parm, NeedCtorLink)
	TArray<struct FString>                             ServerIPAddr;                                             // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ServerPortType;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        ServerPortNum;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfAckHash
struct UBTTcpLink_Process2Agent_sfAckHash_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfReqHash
struct UBTTcpLink_Process2Agent_sfReqHash_Params
{
	int                                                HashField0;                                               // (Parm)
	int                                                HashField1;                                               // (Parm)
	int                                                HashField2;                                               // (Parm)
	int                                                HashField3;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfReqUpdateCurrentRunningInfo
struct UBTTcpLink_Process2Agent_rfReqUpdateCurrentRunningInfo_Params
{
	int                                                GroupID;                                                  // (Parm)
	struct FString                                     GroupName;                                                // (Parm, NeedCtorLink)
	struct FString                                     ServerName;                                               // (Parm, NeedCtorLink)
	int                                                ServerID;                                                 // (Parm)
	TArray<struct FString>                             key;                                                      // (Parm, NeedCtorLink)
	TArray<int>                                        Value;                                                    // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfReqNotifyKickOffUser
struct UBTTcpLink_Process2Agent_rfReqNotifyKickOffUser_Params
{
	int                                                QQID;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfReqUpdatePostAlram
struct UBTTcpLink_Process2Agent_rfReqUpdatePostAlram_Params
{
	int                                                QQID;                                                     // (Parm)
	struct FString                                     Subject;                                                  // (Parm, NeedCtorLink)
	struct FString                                     Text;                                                     // (Parm, NeedCtorLink)
	int                                                ItemID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfReqUpdateProcessState
struct UBTTcpLink_Process2Agent_rfReqUpdateProcessState_Params
{
	int                                                State;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfAckProcessExcuteCmd
struct UBTTcpLink_Process2Agent_rfAckProcessExcuteCmd_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                MajorType;                                                // (Parm)
	int                                                MinorType;                                                // (Parm)
	struct FString                                     CmdValue;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfReqProcessExcuteCmd
struct UBTTcpLink_Process2Agent_rfReqProcessExcuteCmd_Params
{
	int                                                MajorType;                                                // (Parm)
	int                                                MinorType;                                                // (Parm)
	struct FString                                     CmdValue;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfReqUpdateUserCount_DudeServer
struct UBTTcpLink_Process2Agent_rfReqUpdateUserCount_DudeServer_Params
{
	int                                                ServerID;                                                 // (Parm)
	int                                                MaxUserCount;                                             // (Parm)
	int                                                CurUserCount;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfReqUpdateUserCount_LoginServer
struct UBTTcpLink_Process2Agent_rfReqUpdateUserCount_LoginServer_Params
{
	int                                                ServerID;                                                 // (Parm)
	int                                                MaxUserCount;                                             // (Parm)
	int                                                CurUserCount;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfReqUpdateUserCount_ChannelServer
struct UBTTcpLink_Process2Agent_rfReqUpdateUserCount_ChannelServer_Params
{
	int                                                ServerID;                                                 // (Parm)
	int                                                ChannelCount;                                             // (Parm)
	TArray<int>                                        ChannelNum;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        ChannelMaxUserCount;                                      // (Parm, NeedCtorLink)
	TArray<int>                                        ChannelCurUserCount;                                      // (Parm, NeedCtorLink)
	TArray<int>                                        ChannelPlayingUserCount;                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ChannelRoomCount;                                         // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ChannelGrade;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfReqTerminateDedicateHostProcess
struct UBTTcpLink_Process2Agent_rfReqTerminateDedicateHostProcess_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfAckStartDedicateHost
struct UBTTcpLink_Process2Agent_rfAckStartDedicateHost_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                ProcessID;                                                // (Parm)
	int                                                ServerID;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                RoomNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfReqStartDedicateHost
struct UBTTcpLink_Process2Agent_rfReqStartDedicateHost_Params
{
	int                                                ServerID;                                                 // (Parm)
	struct FString                                     ChannelIPAddr;                                            // (Parm, NeedCtorLink)
	int                                                ChannelPortNum;                                           // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                RoomNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfAckQuitDedicateHost
struct UBTTcpLink_Process2Agent_rfAckQuitDedicateHost_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                PID;                                                      // (Parm)
	int                                                ServerID;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                RoomNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfReqQuitDedicateHost
struct UBTTcpLink_Process2Agent_rfReqQuitDedicateHost_Params
{
	int                                                ServerID;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                RoomNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfAckLogin
struct UBTTcpLink_Process2Agent_rfAckLogin_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfReqLogin
struct UBTTcpLink_Process2Agent_rfReqLogin_Params
{
	int                                                PID;                                                      // (Parm)
	int                                                ServerID;                                                 // (Parm)
	TArray<unsigned char>                              ServerIPAddrType;                                         // (Parm, NeedCtorLink)
	TArray<struct FString>                             ServerIPAddr;                                             // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ServerPortType;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        ServerPortNum;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfAckHash
struct UBTTcpLink_Process2Agent_rfAckHash_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfReqHash
struct UBTTcpLink_Process2Agent_rfReqHash_Params
{
	int                                                HashField0;                                               // (Parm)
	int                                                HashField1;                                               // (Parm)
	int                                                HashField2;                                               // (Parm)
	int                                                HashField3;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.OnError
struct UBTTcpLink_Process2Agent_OnError_Params
{
	int                                                ErrCode;                                                  // (Parm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.OnClose
struct UBTTcpLink_Process2Agent_OnClose_Params
{
	int                                                ErrCode;                                                  // (Parm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.OnConnect
struct UBTTcpLink_Process2Agent_OnConnect_Params
{
	int                                                ErrCode;                                                  // (Parm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.Close
struct UBTTcpLink_Process2Agent_Close_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.Connect
struct UBTTcpLink_Process2Agent_Connect_Params
{
	struct FString                                     sIpaddr;                                                  // (Parm, NeedCtorLink)
	int                                                nPort;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.InitNetwork
struct UBTTcpLink_Process2Agent_InitNetwork_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpHandler_DStoDP_Script_Interface.SetGameManager
struct UBTTcpHandler_DStoDP_Script_Interface_SetGameManager_Params
{
	class UwGameManager*                               pgameMgr;                                                 // (Parm)
};

// Function BatteryNet.BTTcpHandler_DStoDP_Script_Interface.SetMatchMaker
struct UBTTcpHandler_DStoDP_Script_Interface_SetMatchMaker_Params
{
	class UwMatchMaker*                                pMM;                                                      // (Parm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckUseItemDuringGame
struct UBTTcpLink_Channel_sfAckUseItemDuringGame_Params
{
	int                                                ErrorCode;                                                // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	int                                                RemainCount;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqUseItemDuringGame
struct UBTTcpLink_Channel_sfReqUseItemDuringGame_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	unsigned char                                      UsingCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfChangeItemInstanceInfo
struct UBTTcpLink_Channel_sfChangeItemInstanceInfo_Params
{
	int                                                ErrorCode;                                                // (Parm)
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	unsigned char                                      ChangeCount;                                              // (Parm)
	int                                                RemainCount;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckLuckShop_RewardCoupon
struct UBTTcpLink_Channel_sfAckLuckShop_RewardCoupon_Params
{
	int                                                ErrorCode;                                                // (Parm)
	int                                                Coupon_ItemTypeID;                                        // (Parm)
	struct FBtrDouble                                  Coupon_ItemUniqueID;                                      // (Parm)
	int                                                Coupon_Count_AfterReduction;                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqLuckShop_RewardCoupon
struct UBTTcpLink_Channel_sfReqLuckShop_RewardCoupon_Params
{
	int                                                ChooseNum;                                                // (Parm)
	int                                                ItemID;                                                   // (Parm)
	int                                                ItemIDChoose;                                             // (Parm)
	int                                                PartIDChoose;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckLuckShop_RewardBuyingCount
struct UBTTcpLink_Channel_sfAckLuckShop_RewardBuyingCount_Params
{
	int                                                ErrorCode;                                                // (Parm)
	int                                                FinalCapsuleRewardState;                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqLuckShop_RewardBuyingCount
struct UBTTcpLink_Channel_sfReqLuckShop_RewardBuyingCount_Params
{
	int                                                ChooseNum;                                                // (Parm)
	int                                                ItemID;                                                   // (Parm)
	int                                                ItemIDChoose;                                             // (Parm)
	int                                                PartIDChoose;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckLuckShop_StorageInfo
struct UBTTcpLink_Channel_sfAckLuckShop_StorageInfo_Params
{
	int                                                ErrorCode;                                                // (Parm)
	int                                                BuyingCapsuleCount;                                       // (Parm)
	int                                                CapsuleRewardState;                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqLuckShop_StorageInfo
struct UBTTcpLink_Channel_sfReqLuckShop_StorageInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckLuckShop_LotteryWinnerList
struct UBTTcpLink_Channel_sfAckLuckShop_LotteryWinnerList_Params
{
	int                                                CapsuleItemID;                                            // (Parm)
	unsigned char                                      IsNotification;                                           // (Parm)
	TArray<struct FString>                             NickName;                                                 // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          Time;                                                     // (Parm, NeedCtorLink)
	int                                                GetItemID;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqLuckShop_LotteryWinnerList
struct UBTTcpLink_Channel_sfReqLuckShop_LotteryWinnerList_Params
{
	int                                                CapsuleItemID;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSpecialQuestRank
struct UBTTcpLink_Channel_sfAckSpecialQuestRank_Params
{
	TArray<struct FString>                             CharList;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSpecialQuestRank
struct UBTTcpLink_Channel_sfReqSpecialQuestRank_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckReceiveSpecialReward
struct UBTTcpLink_Channel_sfAckReceiveSpecialReward_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                RewardedQuestID;                                          // (Parm)
	unsigned char                                      RewardedQuestIsComplete;                                  // (Parm)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                RewardItemID;                                             // (Parm)
	int                                                RewardItemCount;                                          // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqReceiveSpecialReward
struct UBTTcpLink_Channel_sfReqReceiveSpecialReward_Params
{
	int                                                QuestID;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckDailyRewardListThisMonth
struct UBTTcpLink_Channel_sfAckDailyRewardListThisMonth_Params
{
	TArray<unsigned char>                              Type;                                                     // (Parm, NeedCtorLink)
	TArray<unsigned char>                              Number;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        ItemID;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        ItemCount;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqDailyRewardListThisMonth
struct UBTTcpLink_Channel_sfReqDailyRewardListThisMonth_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPuzzleList
struct UBTTcpLink_Channel_sfAckPuzzleList_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      IsComplete;                                               // (Parm)
	TArray<unsigned char>                              UpdatedNum;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              StateList;                                                // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                RewardItemID;                                             // (Parm)
	int                                                RewardItemCount;                                          // (Parm)
	struct FBtrDouble                                  PaidItemIdx;                                              // (Parm)
	int                                                PaidItemStackCount;                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqPuzzleList
struct UBTTcpLink_Channel_sfReqPuzzleList_Params
{
	unsigned char                                      ReqType;                                                  // (Parm)
	unsigned char                                      UpdateState;                                              // (Parm)
	struct FBtrDouble                                  PaidItemIdx;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAttendanceList
struct UBTTcpLink_Channel_sfAckAttendanceList_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      IsComplete;                                               // (Parm)
	unsigned char                                      UpdatedNum;                                               // (Parm)
	TArray<unsigned char>                              StateList;                                                // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                RewardItemID;                                             // (Parm)
	int                                                RewardItemCount;                                          // (Parm)
	struct FBtrDouble                                  PaidItemIdx;                                              // (Parm)
	int                                                PaidItemStackCount;                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAttendanceList
struct UBTTcpLink_Channel_sfReqAttendanceList_Params
{
	unsigned char                                      ReqType;                                                  // (Parm)
	unsigned char                                      UpdateNum;                                                // (Parm)
	unsigned char                                      UpdateState;                                              // (Parm)
	struct FBtrDouble                                  PaidItemIdx;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAIRewardResult
struct UBTTcpLink_Channel_sfAckAIRewardResult_Params
{
	unsigned char                                      ClearRewardTYPE;                                          // (Parm)
	int                                                ClearRewardID;                                            // (Parm)
	int                                                ClearRewardCount;                                         // (Parm)
	TArray<int>                                        ScoreRewardUserID;                                        // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ScoreRewardTYPE;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        ScoreRewardID;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        ScoreRewardCount;                                         // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfNotifyCouponUseError
struct UBTTcpLink_Channel_sfNotifyCouponUseError_Params
{
	int                                                Time;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckCouponUse
struct UBTTcpLink_Channel_sfAckCouponUse_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqCouponUse
struct UBTTcpLink_Channel_sfReqCouponUse_Params
{
	struct FString                                     Serial;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyShopItemDataEnd
struct UBTTcpLink_Channel_sfReqNotifyShopItemDataEnd_Params
{
	int                                                Ver;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyShopItemData
struct UBTTcpLink_Channel_sfReqNotifyShopItemData_Params
{
	TArray<int>                                        ProductNo;                                                // (Parm, NeedCtorLink)
	TArray<struct FString>                             ProductName;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ProductCode;                                              // (Parm, NeedCtorLink)
	TArray<unsigned char>                              SaleType;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ProductCost;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ProductHour;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ProductQuantity;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        SaleMasterFlag;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        SaleStatus;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        IsGift;                                                   // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          SaleEndTime;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        Discountcost;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckShopItemData
struct UBTTcpLink_Channel_sfAckShopItemData_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqShopItemData
struct UBTTcpLink_Channel_sfReqShopItemData_Params
{
	int                                                Ver;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyLoadingStatus
struct UBTTcpLink_Channel_sfReqNotifyLoadingStatus_Params
{
	int                                                Status;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqUpdateUserPerformenceInfo
struct UBTTcpLink_Channel_sfReqUpdateUserPerformenceInfo_Params
{
	int                                                UserID;                                                   // (Parm)
	int                                                MinFps;                                                   // (Parm)
	int                                                MaxFps;                                                   // (Parm)
	int                                                AvgFps;                                                   // (Parm)
	int                                                MinPing;                                                  // (Parm)
	int                                                MaxPing;                                                  // (Parm)
	int                                                AvgPing;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAhnNotifyDisconnct
struct UBTTcpLink_Channel_sfReqAhnNotifyDisconnct_Params
{
	int                                                Code;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAhnHsObject
struct UBTTcpLink_Channel_sfAckAhnHsObject_Params
{
	TArray<unsigned char>                              Data;                                                     // (Parm, NeedCtorLink)
	int                                                DataSize;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAhnHsObject
struct UBTTcpLink_Channel_sfReqAhnHsObject_Params
{
	TArray<unsigned char>                              Data;                                                     // (Parm, NeedCtorLink)
	int                                                DataSize;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfNotifyClanLevelup
struct UBTTcpLink_Channel_sfNotifyClanLevelup_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                Levelup;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfNotifyNewClanName
struct UBTTcpLink_Channel_sfNotifyNewClanName_Params
{
	struct FString                                     New_NickName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfNotifyNewNickName
struct UBTTcpLink_Channel_sfNotifyNewNickName_Params
{
	int                                                Community_Type;                                           // (Parm)
	struct FString                                     Old_NickName;                                             // (Parm, NeedCtorLink)
	struct FString                                     New_NickName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGameMapData
struct UBTTcpLink_Channel_sfAckGameMapData_Params
{
	TArray<int>                                        nIdx;                                                     // (Parm, NeedCtorLink)
	TArray<int>                                        nMapID;                                                   // (Parm, NeedCtorLink)
	TArray<struct FString>                             nMapNm;                                                   // (Parm, NeedCtorLink)
	TArray<float>                                      fSupHealth;                                               // (Parm, NeedCtorLink)
	TArray<float>                                      fSupHeli;                                                 // (Parm, NeedCtorLink)
	TArray<float>                                      fSupBomb;                                                 // (Parm, NeedCtorLink)
	TArray<float>                                      fSupUAV;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        nModFFA;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        nModFFAMax;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        nModTDM;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        nModTDMMax;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        nModSD;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        nModSDMax;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        nModDOM;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        nModDOMMax;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        nModSab;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        nModSabMax;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGameMapData
struct UBTTcpLink_Channel_sfReqGameMapData_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckTencent_StartTenProtect
struct UBTTcpLink_Channel_sfAckTencent_StartTenProtect_Params
{
	int                                                CharDBID;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckMoveToLobby
struct UBTTcpLink_Channel_sfAckMoveToLobby_Params
{
	unsigned char                                      MessageType;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPopUpMessage
struct UBTTcpLink_Channel_sfAckPopUpMessage_Params
{
	int                                                MessageType;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfUpdateWebzenShopScriptVersion
struct UBTTcpLink_Channel_sfUpdateWebzenShopScriptVersion_Params
{
	int                                                Year;                                                     // (Parm)
	int                                                YearId;                                                   // (Parm)
	int                                                SalesZoneCode;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSetClientVersion
struct UBTTcpLink_Channel_sfReqSetClientVersion_Params
{
	int                                                ClientVersion;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckFriendPosition
struct UBTTcpLink_Channel_sfAckFriendPosition_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     TargetCharName;                                           // (Parm, NeedCtorLink)
	unsigned char                                      ServerType;                                               // (Parm)
	struct FString                                     fServername;                                              // (Parm, NeedCtorLink)
	struct FString                                     fServerShortName;                                         // (Parm, NeedCtorLink)
	struct FString                                     fServerIP;                                                // (Parm, NeedCtorLink)
	int                                                fServerPort;                                              // (Parm)
	unsigned char                                      CurPos;                                                   // (Parm)
	unsigned char                                      CurState;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	struct FString                                     ChannelNickName;                                          // (Parm, NeedCtorLink)
	int                                                GameRoomNum;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqFriendPosition
struct UBTTcpLink_Channel_sfReqFriendPosition_Params
{
	struct FString                                     TargetCharName;                                           // (Parm, NeedCtorLink)
	unsigned char                                      CommunityType;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckDedicateHost_Login
struct UBTTcpLink_Channel_sfAckDedicateHost_Login_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                UserID;                                                   // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                RoomNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqDedicateHost_Login
struct UBTTcpLink_Channel_sfReqDedicateHost_Login_Params
{
	int                                                ProcessID;                                                // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                RoomNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckLogOut
struct UBTTcpLink_Channel_sfAckLogOut_Params
{
	unsigned char                                      Result;                                                   // (Parm)
	unsigned char                                      Reason;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqLogOut
struct UBTTcpLink_Channel_sfReqLogOut_Params
{
	unsigned char                                      Reason;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckTencent_AASInfo
struct UBTTcpLink_Channel_sfAckTencent_AASInfo_Params
{
	int                                                UserID;                                                   // (Parm)
	unsigned char                                      IsAdult;                                                  // (Parm)
	unsigned char                                      IsQQAuth;                                                 // (Parm)
	int                                                AccumTimeSec;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSetCommunityOption
struct UBTTcpLink_Channel_sfAckSetCommunityOption_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrStr;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSetCommunityOption
struct UBTTcpLink_Channel_sfReqSetCommunityOption_Params
{
	int                                                Opt_Wispher;                                              // (Parm)
	int                                                Opt_GameInvite;                                           // (Parm)
	int                                                Opt_FriendInvite;                                         // (Parm)
	int                                                Opt_ClanInvite;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckCommunityOptionList
struct UBTTcpLink_Channel_sfAckCommunityOptionList_Params
{
	int                                                Opt_Wispher;                                              // (Parm)
	int                                                Opt_GameInvite;                                           // (Parm)
	int                                                Opt_FriendInvite;                                         // (Parm)
	int                                                Opt_ClanInvite;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqCommunityOptionList
struct UBTTcpLink_Channel_sfReqCommunityOptionList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyUpdateCharInfo_TitleMark
struct UBTTcpLink_Channel_sfAckNotifyUpdateCharInfo_TitleMark_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                TitleMarkID;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyUpdateCharInfo_LevelMark
struct UBTTcpLink_Channel_sfAckNotifyUpdateCharInfo_LevelMark_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                LevelMarkID;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetRankingInfoListEnd
struct UBTTcpLink_Channel_sfAckGetRankingInfoListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetRankingInfoList
struct UBTTcpLink_Channel_sfAckGetRankingInfoList_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      RankingType;                                              // (Parm)
	unsigned char                                      CommunityType;                                            // (Parm)
	TArray<struct FString>                             CharName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        CharLevel;                                                // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMarkPattern;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMarkBG;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMarkBL;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        Ranking_Accum;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        Ranking_Accum_Prev;                                       // (Parm, NeedCtorLink)
	TArray<int>                                        Ranking_Accum_Exp;                                        // (Parm, NeedCtorLink)
	TArray<int>                                        LevelMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TitleMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved1;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved3;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetRankingInfoListStart
struct UBTTcpLink_Channel_sfAckGetRankingInfoListStart_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      RankingType;                                              // (Parm)
	unsigned char                                      CommunityType;                                            // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGetRankingInfoList
struct UBTTcpLink_Channel_sfReqGetRankingInfoList_Params
{
	unsigned char                                      RankingType;                                              // (Parm)
	unsigned char                                      CommunityType;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckCharDetailInfo
struct UBTTcpLink_Channel_sfAckCharDetailInfo_Params
{
	int                                                MaxSerial;                                                // (Parm)
	int                                                MaxScore;                                                 // (Parm)
	int                                                MaxKill;                                                  // (Parm)
	int                                                MaxAssist;                                                // (Parm)
	int                                                Serial3;                                                  // (Parm)
	int                                                Serial5;                                                  // (Parm)
	int                                                Serial7;                                                  // (Parm)
	int                                                Serial10;                                                 // (Parm)
	int                                                Serial15;                                                 // (Parm)
	int                                                AR;                                                       // (Parm)
	int                                                SMG;                                                      // (Parm)
	int                                                SR;                                                       // (Parm)
	int                                                SW;                                                       // (Parm)
	int                                                Melee;                                                    // (Parm)
	int                                                Grenade;                                                  // (Parm)
	int                                                FlashBang;                                                // (Parm)
	int                                                Foot;                                                     // (Parm)
	int                                                AT4;                                                      // (Parm)
	int                                                MG;                                                       // (Parm)
	int                                                Fire;                                                     // (Parm)
	int                                                RPG7;                                                     // (Parm)
	int                                                TimeBomb;                                                 // (Parm)
	int                                                IcendiaryBomb;                                            // (Parm)
	int                                                ClusterBomb;                                              // (Parm)
	int                                                ByChopper;                                                // (Parm)
	int                                                Artillery;                                                // (Parm)
	int                                                KillChopper;                                              // (Parm)
	int                                                FirstKill;                                                // (Parm)
	int                                                LastKill;                                                 // (Parm)
	int                                                AllKill;                                                  // (Parm)
	int                                                Dominate;                                                 // (Parm)
	int                                                InstallBomb;                                              // (Parm)
	int                                                DefuseBomb;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqCharDetailInfo
struct UBTTcpLink_Channel_sfReqCharDetailInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqInGameRoomUserClanLevelChanged
struct UBTTcpLink_Channel_sfReqInGameRoomUserClanLevelChanged_Params
{
	int                                                UserID;                                                   // (Parm)
	int                                                ClanLevel;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqInGameRoomUserInfoChanged
struct UBTTcpLink_Channel_sfReqInGameRoomUserInfoChanged_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatchResultHistory
struct UBTTcpLink_Channel_sfAckClanMatchResultHistory_Params
{
	TArray<struct FBtrDouble>                          MatchDate;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsWin;                                                    // (Parm, NeedCtorLink)
	TArray<struct FString>                             EnemyClanname;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatchResultHistory
struct UBTTcpLink_Channel_sfReqClanMatchResultHistory_Params
{
	struct FString                                     ClanNm;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckDeleteMailAll
struct UBTTcpLink_Channel_sfAckDeleteMailAll_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      MailType;                                                 // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqDeleteMailAll
struct UBTTcpLink_Channel_sfReqDeleteMailAll_Params
{
	unsigned char                                      MailType;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_PublicWaitRoomChanged
struct UBTTcpLink_Channel_sfAckClanMatch_PublicWaitRoomChanged_Params
{
	int                                                WaitRoomIdx;                                              // (Parm)
	struct FString                                     RoomName;                                                 // (Parm, NeedCtorLink)
	int                                                MapNum;                                                   // (Parm)
	int                                                CurUserCount;                                             // (Parm)
	int                                                MaxUserCount;                                             // (Parm)
	unsigned char                                      Status;                                                   // (Parm)
	unsigned char                                      IsPublic;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckEventNotify
struct UBTTcpLink_Channel_sfAckEventNotify_Params
{
	int                                                Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqEventNotify
struct UBTTcpLink_Channel_sfReqEventNotify_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPaidItem_NotifyChangeClanname
struct UBTTcpLink_Channel_sfAckPaidItem_NotifyChangeClanname_Params
{
	struct FString                                     NewClanname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPaidItem_ChangeClanname
struct UBTTcpLink_Channel_sfAckPaidItem_ChangeClanname_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                RemainCount;                                              // (Parm)
	struct FString                                     NewClanname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqPaidItem_ChangeClanname
struct UBTTcpLink_Channel_sfReqPaidItem_ChangeClanname_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	struct FString                                     NewClanname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_EndPublicWaitRoomList
struct UBTTcpLink_Channel_sfAckClanMatch_EndPublicWaitRoomList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_PublicWaitRoomList
struct UBTTcpLink_Channel_sfAckClanMatch_PublicWaitRoomList_Params
{
	TArray<int>                                        WaitRoomIdx;                                              // (Parm, NeedCtorLink)
	TArray<struct FString>                             LeaderName;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             RoomName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        MapNum;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        CurUserCount;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        MaxUserCount;                                             // (Parm, NeedCtorLink)
	TArray<unsigned char>                              Status;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_StartPublicWaitRoomList
struct UBTTcpLink_Channel_sfAckClanMatch_StartPublicWaitRoomList_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_GetPublicWaitRoomList
struct UBTTcpLink_Channel_sfReqClanMatch_GetPublicWaitRoomList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckServerType
struct UBTTcpLink_Channel_sfAckServerType_Params
{
	unsigned char                                      Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqServerType
struct UBTTcpLink_Channel_sfReqServerType_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckServerShutdown
struct UBTTcpLink_Channel_sfAckServerShutdown_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqServerShutdown
struct UBTTcpLink_Channel_sfReqServerShutdown_Params
{
	struct FString                                     AuthKey;                                                  // (Parm, NeedCtorLink)
	int                                                SecondAfter;                                              // (Parm)
	struct FBtrDouble                                  ShutdownTime;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyEndTutorial
struct UBTTcpLink_Channel_sfAckNotifyEndTutorial_Params
{
	int                                                UserID;                                                   // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                Level;                                                    // (Parm)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanMarkPattern;                                          // (Parm)
	int                                                ClanMarkBG;                                               // (Parm)
	int                                                ClanMarkBL;                                               // (Parm)
	int                                                ClanGrade;                                                // (Parm)
	int                                                ClanWin;                                                  // (Parm)
	int                                                ClanLose;                                                 // (Parm)
	unsigned char                                      IsLookFor;                                                // (Parm)
	int                                                Result;                                                   // (Parm)
	int                                                ClanLevel;                                                // (Parm)
	int                                                LevelMarkID;                                              // (Parm)
	int                                                TitleMarkID;                                              // (Parm)
	int                                                Reserved1;                                                // (Parm)
	int                                                Reserved2;                                                // (Parm)
	int                                                Reserved3;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyEndTutorial
struct UBTTcpLink_Channel_sfReqNotifyEndTutorial_Params
{
	int                                                TutorialResultType;                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyStartTutorial
struct UBTTcpLink_Channel_sfAckNotifyStartTutorial_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyStartTutorial
struct UBTTcpLink_Channel_sfReqNotifyStartTutorial_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRoomUserPingInfo
struct UBTTcpLink_Channel_sfAckRoomUserPingInfo_Params
{
	TArray<int>                                        UnqueID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        Ping;                                                     // (Parm, NeedCtorLink)
	int                                                HostPriorityPoint;                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRoomUserPingInfo
struct UBTTcpLink_Channel_sfReqRoomUserPingInfo_Params
{
	TArray<int>                                        UnqueID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        Ping;                                                     // (Parm, NeedCtorLink)
	int                                                HostPriorityPoint;                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckMyEquipedQSlotList
struct UBTTcpLink_Channel_sfAckMyEquipedQSlotList_Params
{
	TArray<unsigned char>                              QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          MWUniqueID;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        MWItemID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        MWPartID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        MWPaintID;                                                // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          PistolUniqueID;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        PistolItemID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        PistolPartID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        PistolPaintID;                                            // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          TW1UniqueID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TWItemID1;                                                // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          TW2UniqueID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TWItemID2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Skill1ID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Skill2ID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Skill3ID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Skill4ID;                                                 // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqMyEquipedQSlotList
struct UBTTcpLink_Channel_sfReqMyEquipedQSlotList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckMyEquipedSkillList
struct UBTTcpLink_Channel_sfAckMyEquipedSkillList_Params
{
	TArray<int>                                        SkillIDs;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        SlotPositions;                                            // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqMyEquipedSkillList
struct UBTTcpLink_Channel_sfReqMyEquipedSkillList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckMyEquipedItemList
struct UBTTcpLink_Channel_sfAckMyEquipedItemList_Params
{
	TArray<int>                                        ItemIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        SlotPositions;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        AddPartsID;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        PaintID;                                                  // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UniqueID;                                                 // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqMyEquipedItemList
struct UBTTcpLink_Channel_sfReqMyEquipedItemList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetMyMailBoxState
struct UBTTcpLink_Channel_sfAckGetMyMailBoxState_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      IsFull;                                                   // (Parm)
	int                                                NewMailCount;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGetMyMailBoxState
struct UBTTcpLink_Channel_sfReqGetMyMailBoxState_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSetLookForClan
struct UBTTcpLink_Channel_sfAckSetLookForClan_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      IsLookingFor;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSetLookForClan
struct UBTTcpLink_Channel_sfReqSetLookForClan_Params
{
	unsigned char                                      IsLookingFor;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckExteriorRoomOwnerInfo
struct UBTTcpLink_Channel_sfAckExteriorRoomOwnerInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqExteriorRoomOwnerInfo
struct UBTTcpLink_Channel_sfReqExteriorRoomOwnerInfo_Params
{
	int                                                RoomNum;                                                  // (Parm)
	struct FString                                     OwnerName;                                                // (Parm, NeedCtorLink)
	struct FString                                     OwnerIP;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_SetWaitRoomPublic
struct UBTTcpLink_Channel_sfAckClanMatch_SetWaitRoomPublic_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      Set;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_SetWaitRoomPublic
struct UBTTcpLink_Channel_sfReqClanMatch_SetWaitRoomPublic_Params
{
	unsigned char                                      Set;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRemoveCheckTeamBalanceList
struct UBTTcpLink_Channel_sfReqRemoveCheckTeamBalanceList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPaidItem_NotifyChangeClanMark
struct UBTTcpLink_Channel_sfAckPaidItem_NotifyChangeClanMark_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                Pattern;                                                  // (Parm)
	int                                                BG;                                                       // (Parm)
	int                                                BL;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPaidItem_ChangeClanMark
struct UBTTcpLink_Channel_sfAckPaidItem_ChangeClanMark_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                StackCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqPaidItem_ChangeClanMark
struct UBTTcpLink_Channel_sfReqPaidItem_ChangeClanMark_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	unsigned char                                      IsPaid;                                                   // (Parm)
	int                                                Pattern;                                                  // (Parm)
	int                                                BG;                                                       // (Parm)
	int                                                BL;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPaidItem_ClanMarkDupCheck
struct UBTTcpLink_Channel_sfAckPaidItem_ClanMarkDupCheck_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqPaidItem_ClanMarkDupCheck
struct UBTTcpLink_Channel_sfReqPaidItem_ClanMarkDupCheck_Params
{
	unsigned char                                      IsPaid;                                                   // (Parm)
	int                                                Pattern;                                                  // (Parm)
	int                                                BG;                                                       // (Parm)
	int                                                BL;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPaidItem_RelayBroadcast
struct UBTTcpLink_Channel_sfAckPaidItem_RelayBroadcast_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPaidItem_BroadCast
struct UBTTcpLink_Channel_sfAckPaidItem_BroadCast_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                StackCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqPaidItem_BroadCast
struct UBTTcpLink_Channel_sfReqPaidItem_BroadCast_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                Command;                                                  // (Parm)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPaidItem_EraseRecord
struct UBTTcpLink_Channel_sfAckPaidItem_EraseRecord_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                Command;                                                  // (Parm)
	int                                                RemainCount;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqPaidItem_EraseRecord
struct UBTTcpLink_Channel_sfReqPaidItem_EraseRecord_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                Command;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPaidItem_ChangeCharname
struct UBTTcpLink_Channel_sfAckPaidItem_ChangeCharname_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                RemainCount;                                              // (Parm)
	struct FString                                     NewCharname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqPaidItem_ChangeCharname
struct UBTTcpLink_Channel_sfReqPaidItem_ChangeCharname_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	struct FString                                     NewCharname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRecvSystemMsg
struct UBTTcpLink_Channel_sfAckRecvSystemMsg_Params
{
	unsigned char                                      CommunityType;                                            // (Parm)
	struct FSystemMsgParam                             MsgInfo;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSendSystemMsg
struct UBTTcpLink_Channel_sfAckSendSystemMsg_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSendSystemMsg
struct UBTTcpLink_Channel_sfReqSendSystemMsg_Params
{
	unsigned char                                      RecvType;                                                 // (Parm)
	struct FString                                     SendCharName;                                             // (Parm, NeedCtorLink)
	struct FString                                     RecvCharname;                                             // (Parm, NeedCtorLink)
	struct FSystemMsgParam                             MsgInfo;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRandomBox_Use
struct UBTTcpLink_Channel_sfAckRandomBox_Use_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  RandomBoxItemIdx;                                         // (Parm)
	int                                                RandomBxoItemCount;                                       // (Parm)
	struct FBtrDouble                                  KeyItemIdx;                                               // (Parm)
	int                                                KeyItemRemainCount;                                       // (Parm)
	TArray<int>                                        ItemIDChoose;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        PartIDChoose;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        PeriodOnChoosenItem;                                      // (Parm, NeedCtorLink)
	TArray<int>                                        StackCountOnChoosenItem;                                  // (Parm, NeedCtorLink)
	TArray<unsigned char>                              bHave;                                                    // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          ItemIdx;                                                  // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UntilTime;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        StackCount;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRandomBox_Use
struct UBTTcpLink_Channel_sfReqRandomBox_Use_Params
{
	struct FBtrDouble                                  ItemIdx_RandomBox;                                        // (Parm)
	struct FBtrDouble                                  ItemIdx_Key;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChangedRoomTitle_FromGM
struct UBTTcpLink_Channel_sfAckChangedRoomTitle_FromGM_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                RoomNumber;                                               // (Parm)
	struct FString                                     NewRoomTitle;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChangeRoomTitle_GM
struct UBTTcpLink_Channel_sfAckChangeRoomTitle_GM_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                RoomNumber;                                               // (Parm)
	struct FString                                     NewRoomTitle;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChangeRoomTitle_GM
struct UBTTcpLink_Channel_sfReqChangeRoomTitle_GM_Params
{
	int                                                RoomNumber;                                               // (Parm)
	struct FString                                     NewRoomTitle;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGMLeaveRoom
struct UBTTcpLink_Channel_sfAckGMLeaveRoom_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                RoomNumber;                                               // (Parm)
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGMEnterRoom
struct UBTTcpLink_Channel_sfAckGMEnterRoom_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                RoomNumber;                                               // (Parm)
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckQuestGetAvailableEventList
struct UBTTcpLink_Channel_sfAckQuestGetAvailableEventList_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        QuestID;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqQuestGetAvailableEventList
struct UBTTcpLink_Channel_sfReqQuestGetAvailableEventList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckCharBlockInfo
struct UBTTcpLink_Channel_sfAckCharBlockInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FBtrDouble                                  ChatBlockStartTime;                                       // (Parm)
	struct FBtrDouble                                  ChatBlockEndTime;                                         // (Parm)
	TArray<struct FBtrDouble>                          BlockedItemIdx;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqCharBlockInfo
struct UBTTcpLink_Channel_sfReqCharBlockInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqIsPaidWebzenPCBang
struct UBTTcpLink_Channel_sfReqIsPaidWebzenPCBang_Params
{
	unsigned char                                      IsPaid;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_GetClanWaittingRoomInfo
struct UBTTcpLink_Channel_sfAckClanMatch_GetClanWaittingRoomInfo_Params
{
	int                                                WaitRoomIndex;                                            // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	struct FString                                     WaitRoomName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_GetClanWaittingRoomInfo
struct UBTTcpLink_Channel_sfReqClanMatch_GetClanWaittingRoomInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckReturnBotID
struct UBTTcpLink_Channel_sfAckReturnBotID_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqReturnBotID
struct UBTTcpLink_Channel_sfReqReturnBotID_Params
{
	TArray<int>                                        BotID;                                                    // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetBotID
struct UBTTcpLink_Channel_sfAckGetBotID_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      RequestedAFCount;                                         // (Parm)
	unsigned char                                      RequestedRSACount;                                        // (Parm)
	TArray<int>                                        AFBotID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        RSABotID;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGetBotID
struct UBTTcpLink_Channel_sfReqGetBotID_Params
{
	unsigned char                                      AFCount;                                                  // (Parm)
	unsigned char                                      RSACount;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_ChangeRoomSetting
struct UBTTcpLink_Channel_sfAckClanMatch_ChangeRoomSetting_Params
{
	int                                                WaitRoomIndex;                                            // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	unsigned char                                      IsPublic;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_ChangeRoomSetting
struct UBTTcpLink_Channel_sfReqClanMatch_ChangeRoomSetting_Params
{
	int                                                WaitRoomIndex;                                            // (Parm)
	TArray<int>                                        MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	unsigned char                                      IsPublic;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckParamCheckSum
struct UBTTcpLink_Channel_sfAckParamCheckSum_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqParamCheckSum
struct UBTTcpLink_Channel_sfReqParamCheckSum_Params
{
	struct FString                                     key;                                                      // (Parm, NeedCtorLink)
	struct FString                                     Value;                                                    // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckWebzenBillingUseStorageItem
struct UBTTcpLink_Channel_sfAckWebzenBillingUseStorageItem_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemExtra;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqWebzenBillingUseStorageItem
struct UBTTcpLink_Channel_sfReqWebzenBillingUseStorageItem_Params
{
	int                                                StorageSeq;                                               // (Parm)
	int                                                StorageItemSeq;                                           // (Parm)
	unsigned char                                      StorageItemType;                                          // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckWebzenBillingStorageListEnd
struct UBTTcpLink_Channel_sfAckWebzenBillingStorageListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckWebzenBillingStorageList
struct UBTTcpLink_Channel_sfAckWebzenBillingStorageList_Params
{
	TArray<int>                                        Seq;                                                      // (Parm, NeedCtorLink)
	TArray<int>                                        ItemSeq;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        GroupCode;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        ShareFlag;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        ProductSeq;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             CashName;                                                 // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          CashPoint;                                                // (Parm, NeedCtorLink)
	TArray<struct FString>                             SendAccountID;                                            // (Parm, NeedCtorLink)
	TArray<struct FString>                             SendMessage;                                              // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ItemType;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              RelationType;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        ProductType;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        PriceSeq;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckWebzenBillingStorageListStart
struct UBTTcpLink_Channel_sfAckWebzenBillingStorageListStart_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                TotalCount;                                               // (Parm)
	int                                                TotalPage;                                                // (Parm)
	int                                                CurPage;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqWebzenBillingStorageList
struct UBTTcpLink_Channel_sfReqWebzenBillingStorageList_Params
{
	int                                                Page;                                                     // (Parm)
	int                                                CountForPage;                                             // (Parm)
	unsigned char                                      Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGiftItemByWebzenCash
struct UBTTcpLink_Channel_sfAckGiftItemByWebzenCash_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                LeftProductCount;                                         // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGiftItemByWebzenCash
struct UBTTcpLink_Channel_sfReqGiftItemByWebzenCash_Params
{
	struct FString                                     ReceiverCharName;                                         // (Parm, NeedCtorLink)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	int                                                PackageProductSeq;                                        // (Parm)
	int                                                PriceSeq;                                                 // (Parm)
	int                                                ProductDisplaySeq;                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGiftItemByWebzenCashGP20
struct UBTTcpLink_Channel_sfReqGiftItemByWebzenCashGP20_Params
{
	struct FString                                     ReceiverCharName;                                         // (Parm, NeedCtorLink)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	int                                                ProductNo;                                                // (Parm)
	unsigned char                                      Cointype;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckBuyItemByWebzenCash
struct UBTTcpLink_Channel_sfAckBuyItemByWebzenCash_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqBuyItemByWebzenCash
struct UBTTcpLink_Channel_sfReqBuyItemByWebzenCash_Params
{
	int                                                PackageProductSeq;                                        // (Parm)
	int                                                ProductDisplaySeq;                                        // (Parm)
	int                                                PriceSeq;                                                 // (Parm)
	TArray<int>                                        ItemIDs;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	unsigned char                                      BuyOption1;                                               // (Parm)
	unsigned char                                      BuyOption2;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqBuyItemByWebzenCashGP20
struct UBTTcpLink_Channel_sfReqBuyItemByWebzenCashGP20_Params
{
	int                                                ProductNo;                                                // (Parm)
	unsigned char                                      Cointype;                                                 // (Parm)
	struct FBtrDouble                                  ItemID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckWebzenShopScriptVersion
struct UBTTcpLink_Channel_sfAckWebzenShopScriptVersion_Params
{
	int                                                Year;                                                     // (Parm)
	int                                                YearId;                                                   // (Parm)
	int                                                SalesZoneCode;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqWebzenShopScriptVersion
struct UBTTcpLink_Channel_sfReqWebzenShopScriptVersion_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckWebzenCash
struct UBTTcpLink_Channel_sfAckWebzenCash_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  PCoinCash;                                                // (Parm)
	struct FBtrDouble                                  CCoinCash;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqWebzenCash
struct UBTTcpLink_Channel_sfReqWebzenCash_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRegisteredPCBangInfo
struct UBTTcpLink_Channel_sfAckRegisteredPCBangInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      IsRegisteredPCBang;                                       // (Parm)
	unsigned char                                      IsMainPCBang;                                             // (Parm)
	struct FString                                     PCBangName;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRegisteredPCBangInfo
struct UBTTcpLink_Channel_sfReqRegisteredPCBangInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRegisterMainPCBang
struct UBTTcpLink_Channel_sfAckRegisterMainPCBang_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRegisterMainPCBang
struct UBTTcpLink_Channel_sfReqRegisterMainPCBang_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPCBangUserListEnd
struct UBTTcpLink_Channel_sfAckPCBangUserListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPCBangUserList
struct UBTTcpLink_Channel_sfAckPCBangUserList_Params
{
	TArray<struct FString>                             FriendName;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        CM_Pattern;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        CM_BG;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        CM_BL;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        Level;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        ClanGrade;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        ClanWin;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLose;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsLookForClan;                                            // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsCombat;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLevel;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        LevelMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TitleMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved1;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved3;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPCBangUserListStart
struct UBTTcpLink_Channel_sfAckPCBangUserListStart_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqPCBangUserList
struct UBTTcpLink_Channel_sfReqPCBangUserList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqDailyQuestNewAvailable
struct UBTTcpLink_Channel_sfReqDailyQuestNewAvailable_Params
{
	TArray<int>                                        ExpiredQuestID;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        NewQuestID;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqQuestNewAvailable
struct UBTTcpLink_Channel_sfReqQuestNewAvailable_Params
{
	TArray<int>                                        AchivedQuestID;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        NewQuestID;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsDailyQuest;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        ExpiredQuest;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckQuestUpdate
struct UBTTcpLink_Channel_sfAckQuestUpdate_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqQuestUpdate
struct UBTTcpLink_Channel_sfReqQuestUpdate_Params
{
	int                                                UniqueID;                                                 // (Parm)
	int                                                GameRoomNum;                                              // (Parm)
	TArray<int>                                        QuestID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        CountPrograss;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckQuestListEnd
struct UBTTcpLink_Channel_sfAckQuestListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckQuestList
struct UBTTcpLink_Channel_sfAckQuestList_Params
{
	TArray<int>                                        QuestID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        CountPrograss;                                            // (Parm, NeedCtorLink)
	TArray<unsigned char>                              QuestType;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsComplete;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckQuestListStart
struct UBTTcpLink_Channel_sfAckQuestListStart_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqQuestList
struct UBTTcpLink_Channel_sfReqQuestList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPermanentRoomInfo
struct UBTTcpLink_Channel_sfAckPermanentRoomInfo_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                ClanIdx;                                                  // (Parm)
	unsigned char                                      FixedGameMode;                                            // (Parm)
	unsigned char                                      FixedMaxUserCnt;                                          // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqPermanentRoomInfo
struct UBTTcpLink_Channel_sfReqPermanentRoomInfo_Params
{
	int                                                RoomNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_FoundMatch
struct UBTTcpLink_Channel_sfAckClanMatch_FoundMatch_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_FoundMatch
struct UBTTcpLink_Channel_sfReqClanMatch_FoundMatch_Params
{
	int                                                ChannelID;                                                // (Parm)
	int                                                RoomNumber;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_NotifyStartSearching
struct UBTTcpLink_Channel_sfAckClanMatch_NotifyStartSearching_Params
{
	int                                                ShouldWaitMore;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_StartSearching
struct UBTTcpLink_Channel_sfAckClanMatch_StartSearching_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                ShouldWaitMore;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_StartSearching
struct UBTTcpLink_Channel_sfReqClanMatch_StartSearching_Params
{
	int                                                RequestCount;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckLimitedListInChannel
struct UBTTcpLink_Channel_sfAckLimitedListInChannel_Params
{
	int                                                Result;                                                   // (Parm)
	TArray<int>                                        LimitedMapID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        LimitedModeID;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqLimitedListInChannel
struct UBTTcpLink_Channel_sfReqLimitedListInChannel_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRecvInviteGameRoomResult
struct UBTTcpLink_Channel_sfAckRecvInviteGameRoomResult_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRecvInviteGameRoom
struct UBTTcpLink_Channel_sfAckRecvInviteGameRoom_Params
{
	struct FString                                     RoomUniqueID;                                             // (Parm, NeedCtorLink)
	int                                                RoomNumber;                                               // (Parm)
	unsigned char                                      Answer;                                                   // (Parm)
	struct FString                                     InviteCharName;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvInviteGameRoom
struct UBTTcpLink_Channel_sfReqRecvInviteGameRoom_Params
{
	struct FString                                     InviteUserServerName;                                     // (Parm, NeedCtorLink)
	int                                                InviteUserServerID;                                       // (Parm)
	int                                                InviteUserChannelNumber;                                  // (Parm)
	struct FString                                     RoomUniqueID;                                             // (Parm, NeedCtorLink)
	int                                                RoomNumber;                                               // (Parm)
	struct FString                                     RoomName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      RoomState;                                                // (Parm)
	struct FString                                     MapName;                                                  // (Parm, NeedCtorLink)
	struct FString                                     OwnerName;                                                // (Parm, NeedCtorLink)
	unsigned char                                      GameMode;                                                 // (Parm)
	unsigned char                                      WeaponLimit;                                              // (Parm)
	unsigned char                                      IsTeamBalance;                                            // (Parm)
	struct FString                                     Password;                                                 // (Parm, NeedCtorLink)
	struct FString                                     InviteCharName;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckInviteGameRoom
struct UBTTcpLink_Channel_sfAckInviteGameRoom_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      Answer;                                                   // (Parm)
	struct FString                                     GuestCharName;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqInviteGameRoom
struct UBTTcpLink_Channel_sfReqInviteGameRoom_Params
{
	struct FString                                     GuestCharName;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_StopSearching
struct UBTTcpLink_Channel_sfAckClanMatch_StopSearching_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_StopSearching
struct UBTTcpLink_Channel_sfReqClanMatch_StopSearching_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_ChangeLeader
struct UBTTcpLink_Channel_sfAckClanMatch_ChangeLeader_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                NewLeader;                                                // (Parm)
	struct FString                                     NewLeaderName;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_ChangeLeader
struct UBTTcpLink_Channel_sfReqClanMatch_ChangeLeader_Params
{
	int                                                WaitRoomIdx;                                              // (Parm)
	int                                                NewLeaderID;                                              // (Parm)
	struct FString                                     NewLeaderName;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_WaittingTeamList
struct UBTTcpLink_Channel_sfAckClanMatch_WaittingTeamList_Params
{
	int                                                TtotlCount;                                               // (Parm)
	TArray<int>                                        Grade;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        Map;                                                      // (Parm, NeedCtorLink)
	TArray<int>                                        Versus;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_WaittingTeamList
struct UBTTcpLink_Channel_sfReqClanMatch_WaittingTeamList_Params
{
	int                                                StartIndex;                                               // (Parm)
	int                                                ReturnCount;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_Chat
struct UBTTcpLink_Channel_sfAckClanMatch_Chat_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_Chat
struct UBTTcpLink_Channel_sfReqClanMatch_Chat_Params
{
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_LeaveNotify
struct UBTTcpLink_Channel_sfAckClanMatch_LeaveNotify_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_Leave
struct UBTTcpLink_Channel_sfAckClanMatch_Leave_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_Leave
struct UBTTcpLink_Channel_sfReqClanMatch_Leave_Params
{
	int                                                WaittingID;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_MemberList
struct UBTTcpLink_Channel_sfAckClanMatch_MemberList_Params
{
	TArray<unsigned char>                              IsLeader;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMarkPA;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMarkBG;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMarkBL;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        Level;                                                    // (Parm, NeedCtorLink)
	TArray<struct FString>                             CharName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanGrade;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        ClanWin;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLose;                                                 // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLevel;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        LevelMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TitleMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved1;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved3;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_MemberList
struct UBTTcpLink_Channel_sfReqClanMatch_MemberList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_JoinNotify
struct UBTTcpLink_Channel_sfAckClanMatch_JoinNotify_Params
{
	unsigned char                                      IsLeader;                                                 // (Parm)
	int                                                ClanMarkPA;                                               // (Parm)
	int                                                ClanMarkBG;                                               // (Parm)
	int                                                ClanMarkBL;                                               // (Parm)
	int                                                Level;                                                    // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanGrade;                                                // (Parm)
	int                                                ClanWin;                                                  // (Parm)
	int                                                ClanLose;                                                 // (Parm)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanLevel;                                                // (Parm)
	int                                                LevelMarkID;                                              // (Parm)
	int                                                TitleMarkID;                                              // (Parm)
	int                                                Reserved1;                                                // (Parm)
	int                                                Reserved2;                                                // (Parm)
	int                                                Reserved3;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_Join
struct UBTTcpLink_Channel_sfAckClanMatch_Join_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_Join
struct UBTTcpLink_Channel_sfReqClanMatch_Join_Params
{
	int                                                WaittingID;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_InviteCrewResult
struct UBTTcpLink_Channel_sfReqClanMatch_InviteCrewResult_Params
{
	struct FString                                     Invitee;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_RecvInviteCrew
struct UBTTcpLink_Channel_sfAckClanMatch_RecvInviteCrew_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     Inviter;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_RecvInviteCrew
struct UBTTcpLink_Channel_sfReqClanMatch_RecvInviteCrew_Params
{
	struct FString                                     Inviter;                                                  // (Parm, NeedCtorLink)
	struct FString                                     ServerIP;                                                 // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	int                                                WaittingID;                                               // (Parm)
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	int                                                MapNum;                                                   // (Parm)
	int                                                InviteUserChannelNum;                                     // (Parm)
	struct FString                                     LeaderName;                                               // (Parm, NeedCtorLink)
	struct FString                                     RoomName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_InviteCrew
struct UBTTcpLink_Channel_sfAckClanMatch_InviteCrew_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_InviteCrew
struct UBTTcpLink_Channel_sfReqClanMatch_InviteCrew_Params
{
	struct FString                                     Invitee;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_NotifiyStartCombat
struct UBTTcpLink_Channel_sfAckClanMatch_NotifiyStartCombat_Params
{
	TArray<int>                                        MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_StartCombat
struct UBTTcpLink_Channel_sfAckClanMatch_StartCombat_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_StartCombat
struct UBTTcpLink_Channel_sfReqClanMatch_StartCombat_Params
{
	TArray<int>                                        MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_GetReady
struct UBTTcpLink_Channel_sfAckClanMatch_GetReady_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                RoomIndex;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_GetReady
struct UBTTcpLink_Channel_sfReqClanMatch_GetReady_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAutoChangedTeamUserList
struct UBTTcpLink_Channel_sfAckAutoChangedTeamUserList_Params
{
	TArray<int>                                        UserID;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        TeamNum;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetItemFromItemBox
struct UBTTcpLink_Channel_sfAckGetItemFromItemBox_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                ItemIDChoose;                                             // (Parm)
	int                                                PartIDChoose;                                             // (Parm)
	struct FBtrDouble                                  BoxItemIdx;                                               // (Parm)
	int                                                BxoItemCount;                                             // (Parm)
	unsigned char                                      bHave;                                                    // (Parm)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	struct FBtrDouble                                  UntilTime;                                                // (Parm)
	int                                                StackCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGetItemFromItemBox
struct UBTTcpLink_Channel_sfReqGetItemFromItemBox_Params
{
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	int                                                ItemID;                                                   // (Parm)
	int                                                ItemIDChoose;                                             // (Parm)
	int                                                PartIDChoose;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckItemListInItemBox
struct UBTTcpLink_Channel_sfAckItemListInItemBox_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	int                                                BoxItemID;                                                // (Parm)
	TArray<int>                                        ItemID;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        PartID;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      FromContent;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqItemListInItemBox
struct UBTTcpLink_Channel_sfReqItemListInItemBox_Params
{
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	int                                                BoxItemID;                                                // (Parm)
	unsigned char                                      FromContent;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvForceFailedClientLoading
struct UBTTcpLink_Channel_sfReqRecvForceFailedClientLoading_Params
{
	int                                                ErrCode;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckForceFailedClientLoading
struct UBTTcpLink_Channel_sfAckForceFailedClientLoading_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqForceFailedClientLoading
struct UBTTcpLink_Channel_sfReqForceFailedClientLoading_Params
{
	int                                                FailedUserID;                                             // (Parm)
	int                                                ErrCode;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckStartHolePunching
struct UBTTcpLink_Channel_sfAckStartHolePunching_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                GameType;                                                 // (Parm)
	int                                                ReqStartUserID;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqStartHolePunching
struct UBTTcpLink_Channel_sfReqStartHolePunching_Params
{
	int                                                GameType;                                                 // (Parm)
	int                                                ReqStartUserID;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyMyCharInfoToRoomUser
struct UBTTcpLink_Channel_sfAckNotifyMyCharInfoToRoomUser_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UID;                                                      // (Parm)
	struct FString                                     UserName;                                                 // (Parm, NeedCtorLink)
	int                                                Grade;                                                    // (Parm)
	int                                                TeamNum;                                                  // (Parm)
	unsigned char                                      Statue;                                                   // (Parm)
	unsigned char                                      IsHost;                                                   // (Parm)
	struct FString                                     UserIP;                                                   // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                CM_Pattern;                                               // (Parm)
	int                                                CM_BG;                                                    // (Parm)
	int                                                CM_BL;                                                    // (Parm)
	unsigned char                                      IsLookFor;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyMyCharInfoToRoomUser
struct UBTTcpLink_Channel_sfReqNotifyMyCharInfoToRoomUser_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyDurabilityZeroItem
struct UBTTcpLink_Channel_sfReqNotifyDurabilityZeroItem_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	TArray<struct FBtrDouble>                          ItemUniqueIDs;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        ItemIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ItemPartIDs;                                              // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ItemSlotPos;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChatWispherMyCommunity
struct UBTTcpLink_Channel_sfAckChatWispherMyCommunity_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChatWispherMyCommunity
struct UBTTcpLink_Channel_sfReqChatWispherMyCommunity_Params
{
	struct FString                                     SourceCharName;                                           // (Parm, NeedCtorLink)
	struct FString                                     SenderName;                                               // (Parm, NeedCtorLink)
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyDisconnectHostInLoading
struct UBTTcpLink_Channel_sfReqNotifyDisconnectHostInLoading_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                HostID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvForceDisconnected_FromGM
struct UBTTcpLink_Channel_sfReqRecvForceDisconnected_FromGM_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckForceDisconnectUser_GM
struct UBTTcpLink_Channel_sfAckForceDisconnectUser_GM_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqForceDisconnectUser_GM
struct UBTTcpLink_Channel_sfReqForceDisconnectUser_GM_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvNotice_FromGM
struct UBTTcpLink_Channel_sfReqRecvNotice_FromGM_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<struct FString>                             NoticeMsg;                                                // (Parm, NeedCtorLink)
	unsigned char                                      IsFromDB;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotice_GM
struct UBTTcpLink_Channel_sfAckNotice_GM_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      NoticeType;                                               // (Parm)
	int                                                ServerID;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                GameRoomNum;                                              // (Parm)
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotice_GM
struct UBTTcpLink_Channel_sfReqNotice_GM_Params
{
	unsigned char                                      NoticeType;                                               // (Parm)
	int                                                ServerID;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                GameRoomNum;                                              // (Parm)
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSpecificChannelUserInfo
struct UBTTcpLink_Channel_sfAckSpecificChannelUserInfo_Params
{
	int                                                UID;                                                      // (Parm)
	struct FString                                     UserID;                                                   // (Parm, NeedCtorLink)
	int                                                UserLevels;                                               // (Parm)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanPattern;                                              // (Parm)
	int                                                ClanBG;                                                   // (Parm)
	int                                                ClanBL;                                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                LevelMarkID;                                              // (Parm)
	int                                                TitleMarkID;                                              // (Parm)
	int                                                Reserved1;                                                // (Parm)
	int                                                Reserved2;                                                // (Parm)
	int                                                Reserved3;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSpecificChannelUserInfo
struct UBTTcpLink_Channel_sfReqSpecificChannelUserInfo_Params
{
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSpecificGameRoomInfo
struct UBTTcpLink_Channel_sfAckSpecificGameRoomInfo_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                GameNum;                                                  // (Parm)
	struct FString                                     Title;                                                    // (Parm, NeedCtorLink)
	struct FString                                     MapName;                                                  // (Parm, NeedCtorLink)
	int                                                MapNum;                                                   // (Parm)
	unsigned char                                      UserCount;                                                // (Parm)
	unsigned char                                      MaxCount;                                                 // (Parm)
	struct FString                                     GameModeName;                                             // (Parm, NeedCtorLink)
	int                                                ModeNum;                                                  // (Parm)
	unsigned char                                      WeaponLimit;                                              // (Parm)
	unsigned char                                      IsHardCore;                                               // (Parm)
	unsigned char                                      Status;                                                   // (Parm)
	struct FString                                     RoomOwnerIP;                                              // (Parm, NeedCtorLink)
	int                                                GameMinute;                                               // (Parm)
	struct FString                                     RoomOwnerName;                                            // (Parm, NeedCtorLink)
	unsigned char                                      IsSpecial;                                                // (Parm)
	unsigned char                                      IsPassword;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSpecificGameRoomInfo
struct UBTTcpLink_Channel_sfReqSpecificGameRoomInfo_Params
{
	int                                                RoomNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChannelUserListInGameRoom
struct UBTTcpLink_Channel_sfAckChannelUserListInGameRoom_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	int                                                Count;                                                    // (Parm)
	int                                                StartIndex;                                               // (Parm)
	TArray<int>                                        UID;                                                      // (Parm, NeedCtorLink)
	TArray<struct FString>                             CharName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        UserLevel;                                                // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanPattern;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ClanBG;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        ClanBL;                                                   // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsLookForClan;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLevel;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        LevelMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TitleMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved1;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved3;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChannelUserListInGameRoom
struct UBTTcpLink_Channel_sfReqChannelUserListInGameRoom_Params
{
	int                                                ChannelNum;                                               // (Parm)
	int                                                StartIndex;                                               // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvDeleteFriend
struct UBTTcpLink_Channel_sfReqRecvDeleteFriend_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     FromCharName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckDeleteFriend
struct UBTTcpLink_Channel_sfAckDeleteFriend_Params
{
	int                                                Result;                                                   // (Parm)
	TArray<struct FString>                             FailedCharname;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqDeleteFriend
struct UBTTcpLink_Channel_sfReqDeleteFriend_Params
{
	TArray<struct FString>                             DeleteCharName;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGameGuardAuthData
struct UBTTcpLink_Channel_sfAckGameGuardAuthData_Params
{
	int                                                AuthDataIndex;                                            // (Parm)
	int                                                AuthDataVal1;                                             // (Parm)
	int                                                AuthDataVal2;                                             // (Parm)
	int                                                AuthDataVal3;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGameGuardAuthData
struct UBTTcpLink_Channel_sfReqGameGuardAuthData_Params
{
	int                                                AuthDataIndex;                                            // (Parm)
	int                                                AuthDataVal1;                                             // (Parm)
	int                                                AuthDataVal2;                                             // (Parm)
	int                                                AuthDataVal3;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckCheckEquipedWeaponDurability
struct UBTTcpLink_Channel_sfAckCheckEquipedWeaponDurability_Params
{
	int                                                Result;                                                   // (Parm)
	TArray<struct FBtrDouble>                          ItemUniqueID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        ItemSlotNum;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqCheckEquipedWeaponDurability
struct UBTTcpLink_Channel_sfReqCheckEquipedWeaponDurability_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGamePlay_GetChopper
struct UBTTcpLink_Channel_sfReqGamePlay_GetChopper_Params
{
	int                                                GetChopperUID;                                            // (Parm)
	TArray<int>                                        GetChopperAssistUID;                                      // (Parm, NeedCtorLink)
	float                                              KillXCoord;                                               // (Parm)
	float                                              KillYCoord;                                               // (Parm)
	float                                              KillZCoord;                                               // (Parm)
	int                                                KillPos;                                                  // (Parm)
	int                                                KillWeaponID;                                             // (Parm)
	int                                                KillWeaponPartID;                                         // (Parm)
	int                                                KillRange;                                                // (Parm)
	int                                                KillDamage;                                               // (Parm)
	int                                                ChopperCallerID;                                          // (Parm)
	struct FString                                     ChopperCallerName;                                        // (Parm, NeedCtorLink)
	float                                              ChopperXCoord;                                            // (Parm)
	float                                              ChopperYCoord;                                            // (Parm)
	float                                              ChopperZCoord;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAcquirePromotionItems
struct UBTTcpLink_Channel_sfAckAcquirePromotionItems_Params
{
	int                                                UID;                                                      // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          ItemUniqueID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        ItemIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        PartIDs;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckIsAvailClanURL
struct UBTTcpLink_Channel_sfAckIsAvailClanURL_Params
{
	struct FString                                     ClanURL;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqIsAvailClanURL
struct UBTTcpLink_Channel_sfReqIsAvailClanURL_Params
{
	struct FString                                     ClanURL;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetIsHostBlocking
struct UBTTcpLink_Channel_sfAckGetIsHostBlocking_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      Blocking;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGetIsHostBlocking
struct UBTTcpLink_Channel_sfReqGetIsHostBlocking_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyHostBlocking
struct UBTTcpLink_Channel_sfAckNotifyHostBlocking_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      Blocking;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyHostBlocking
struct UBTTcpLink_Channel_sfReqNotifyHostBlocking_Params
{
	unsigned char                                      Blocking;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetHolePunchingResult
struct UBTTcpLink_Channel_sfAckGetHolePunchingResult_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      Phrase;                                                   // (Parm)
	int                                                InterventionUserID;                                       // (Parm)
	unsigned char                                      Intervention;                                             // (Parm)
	TArray<int>                                        FailedUserIDs;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGetHolePunchingResult
struct UBTTcpLink_Channel_sfReqGetHolePunchingResult_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyRecvDummyForHolePunching
struct UBTTcpLink_Channel_sfReqNotifyRecvDummyForHolePunching_Params
{
	int                                                ClientUserID;                                             // (Parm)
	unsigned char                                      Phrase;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGamePlay_ChangeWeaponSet
struct UBTTcpLink_Channel_sfReqGamePlay_ChangeWeaponSet_Params
{
	int                                                UID;                                                      // (Parm)
	int                                                SetNumber;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGamePlay_UpdateDomScore
struct UBTTcpLink_Channel_sfReqGamePlay_UpdateDomScore_Params
{
	int                                                AFScore;                                                  // (Parm)
	int                                                RSAScore;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyRelayServerAddr
struct UBTTcpLink_Channel_sfReqNotifyRelayServerAddr_Params
{
	struct FString                                     RelayIP;                                                  // (Parm, NeedCtorLink)
	int                                                RelayPort;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetUserHostPriorityPoint
struct UBTTcpLink_Channel_sfAckGetUserHostPriorityPoint_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                UserID;                                                   // (Parm)
	int                                                HostPriorityPoint;                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGetUserHostPriorityPoint
struct UBTTcpLink_Channel_sfReqGetUserHostPriorityPoint_Params
{
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqUpdateMyHostPriorityPoint
struct UBTTcpLink_Channel_sfReqUpdateMyHostPriorityPoint_Params
{
	int                                                HostPriorityPoint;                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqWriteServerLog
struct UBTTcpLink_Channel_sfReqWriteServerLog_Params
{
	unsigned char                                      Destination;                                              // (Parm)
	struct FString                                     LogMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGamePlay_SetRoundStartTime
struct UBTTcpLink_Channel_sfReqGamePlay_SetRoundStartTime_Params
{
	TArray<int>                                        UID;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGamePlay_SetGameStartTime
struct UBTTcpLink_Channel_sfReqGamePlay_SetGameStartTime_Params
{
	TArray<int>                                        UID;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvForceDisconnectUDPFromHost
struct UBTTcpLink_Channel_sfReqRecvForceDisconnectUDPFromHost_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckForceDisconnectUDPFromHost
struct UBTTcpLink_Channel_sfAckForceDisconnectUDPFromHost_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqForceDisconnectUDPFromHost
struct UBTTcpLink_Channel_sfReqForceDisconnectUDPFromHost_Params
{
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGamePlay_TakeAPoint
struct UBTTcpLink_Channel_sfReqGamePlay_TakeAPoint_Params
{
	TArray<int>                                        TakerUID;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      TakePos;                                                  // (Parm)
	TArray<float>                                      TakerXCoord;                                              // (Parm, NeedCtorLink)
	TArray<float>                                      TakerYCoord;                                              // (Parm, NeedCtorLink)
	TArray<float>                                      TakerZCoord;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TakerPos;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        TakerWeaponID;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        TakerWeaponPartID;                                        // (Parm, NeedCtorLink)
	TArray<int>                                        TakerRange;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyChangeRoomState
struct UBTTcpLink_Channel_sfReqNotifyChangeRoomState_Params
{
	unsigned char                                      RoomState;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGamePlay_DefuseBomb
struct UBTTcpLink_Channel_sfReqGamePlay_DefuseBomb_Params
{
	int                                                DefuserUID;                                               // (Parm)
	unsigned char                                      DefusePos;                                                // (Parm)
	float                                              DefuserXCoord;                                            // (Parm)
	float                                              DefuserYCoord;                                            // (Parm)
	float                                              DefuserZCoord;                                            // (Parm)
	int                                                DefuserPos;                                               // (Parm)
	int                                                DefuserWeaponID;                                          // (Parm)
	int                                                DefuserWeaponPartID;                                      // (Parm)
	int                                                DefuserRange;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGamePlay_InstallBomb
struct UBTTcpLink_Channel_sfReqGamePlay_InstallBomb_Params
{
	int                                                InstallerUID;                                             // (Parm)
	unsigned char                                      InstallPos;                                               // (Parm)
	float                                              InstallerXCoord;                                          // (Parm)
	float                                              InstallerYCoord;                                          // (Parm)
	float                                              InstallerZCoord;                                          // (Parm)
	int                                                InstallerPos;                                             // (Parm)
	int                                                InstallerWeaponID;                                        // (Parm)
	int                                                InstallerWeaponPartID;                                    // (Parm)
	int                                                InstallerRange;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckDBCharInfo
struct UBTTcpLink_Channel_sfAckDBCharInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                CM_Pattern;                                               // (Parm)
	int                                                CM_BG;                                                    // (Parm)
	int                                                CM_BL;                                                    // (Parm)
	struct FString                                     ClanPersonIntro;                                          // (Parm, NeedCtorLink)
	int                                                MainWeaponItemID;                                         // (Parm)
	int                                                MainWeaponPartID;                                         // (Parm)
	int                                                SubWeaponItemID;                                          // (Parm)
	int                                                SubWeaponPartID;                                          // (Parm)
	int                                                AFSpecialCostumeItemID;                                   // (Parm)
	int                                                RSASpecialCostumeItemID;                                  // (Parm)
	struct FCharInfo                                   stCharInfo;                                               // (Parm)
	int                                                ClanLevel;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqDBCharInfo
struct UBTTcpLink_Channel_sfReqDBCharInfo_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqForceNatTypeSetting
struct UBTTcpLink_Channel_sfReqForceNatTypeSetting_Params
{
	int                                                NatType;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetServerTime
struct UBTTcpLink_Channel_sfAckGetServerTime_Params
{
	struct FBtrDouble                                  ServerTime;                                               // (Parm)
	struct FString                                     ClientIP;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGetServerTime
struct UBTTcpLink_Channel_sfReqGetServerTime_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqLogEndEachRound
struct UBTTcpLink_Channel_sfReqLogEndEachRound_Params
{
	int                                                StartCnt;                                                 // (Parm)
	int                                                EndCnt;                                                   // (Parm)
	int                                                RoundEndType;                                             // (Parm)
	int                                                RoundEndTime;                                             // (Parm)
	unsigned char                                      VTeam;                                                    // (Parm)
	unsigned char                                      VTeamAD;                                                  // (Parm)
	int                                                AFScore;                                                  // (Parm)
	int                                                RSAScore;                                                 // (Parm)
	int                                                Round;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqLogGetScore
struct UBTTcpLink_Channel_sfReqLogGetScore_Params
{
	struct FKillDeathLog                               KillDeathLogParam;                                        // (Parm)
	TArray<int>                                        AssistUIDs;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              AssistScores;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAuctionTradeHistory
struct UBTTcpLink_Channel_sfAckAuctionTradeHistory_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                ItemID;                                                   // (Parm)
	int                                                PartID;                                                   // (Parm)
	TArray<struct FString>                             SellerCharNm;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        DamageDegree;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        Price;                                                    // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAuctionTradeHistory
struct UBTTcpLink_Channel_sfReqAuctionTradeHistory_Params
{
	int                                                ItemID;                                                   // (Parm)
	int                                                PartID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSendGift
struct UBTTcpLink_Channel_sfAckSendGift_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                PointRemain;                                              // (Parm)
	int                                                CashRemain;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSendGift
struct UBTTcpLink_Channel_sfReqSendGift_Params
{
	int                                                ItemID;                                                   // (Parm)
	struct FString                                     RecvCharname;                                             // (Parm, NeedCtorLink)
	struct FString                                     RecvMessage;                                              // (Parm, NeedCtorLink)
	unsigned char                                      BuyOption1;                                               // (Parm)
	unsigned char                                      BuyOption2;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetAttachedItemFromMemo
struct UBTTcpLink_Channel_sfAckGetAttachedItemFromMemo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                ItemID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGetAttachedItemFromMemo
struct UBTTcpLink_Channel_sfReqGetAttachedItemFromMemo_Params
{
	int                                                UserID;                                                   // (Parm)
	int                                                MemoIdx;                                                  // (Parm)
	int                                                ItemID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyNewClanMember
struct UBTTcpLink_Channel_sfAckNotifyNewClanMember_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChatClan
struct UBTTcpLink_Channel_sfAckChatClan_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChatClan
struct UBTTcpLink_Channel_sfReqChatClan_Params
{
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckTestDouble
struct UBTTcpLink_Channel_sfAckTestDouble_Params
{
	struct FBtrDouble                                  vDouble;                                                  // (Parm)
	TArray<struct FBtrDouble>                          vDoubles;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqTestDouble
struct UBTTcpLink_Channel_sfReqTestDouble_Params
{
	struct FBtrDouble                                  vDouble;                                                  // (Parm)
	TArray<struct FBtrDouble>                          vDoubles;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyLoadingState
struct UBTTcpLink_Channel_sfAckNotifyLoadingState_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                UserID;                                                   // (Parm)
	unsigned char                                      LoadingState;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyLoadingState
struct UBTTcpLink_Channel_sfReqNotifyLoadingState_Params
{
	unsigned char                                      LoadingState;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckFailedStartGame
struct UBTTcpLink_Channel_sfAckFailedStartGame_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      IsHost;                                                   // (Parm)
	int                                                FailedUserID;                                             // (Parm)
	int                                                LoadingStep;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqFailedStartGame
struct UBTTcpLink_Channel_sfReqFailedStartGame_Params
{
	int                                                LoadingStep;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSuccessStartGame
struct UBTTcpLink_Channel_sfAckSuccessStartGame_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      IsHost;                                                   // (Parm)
	struct FString                                     HostIP;                                                   // (Parm, NeedCtorLink)
	int                                                HostPort;                                                 // (Parm)
	int                                                LoadingStep;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSuccessStartGame
struct UBTTcpLink_Channel_sfReqSuccessStartGame_Params
{
	int                                                LoadingStep;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanCharPersonelIntro
struct UBTTcpLink_Channel_sfAckClanCharPersonelIntro_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     PersonelIntro;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanCharPersonelIntro
struct UBTTcpLink_Channel_sfReqClanCharPersonelIntro_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanPersonelIntro
struct UBTTcpLink_Channel_sfAckClanPersonelIntro_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanPersonelIntro
struct UBTTcpLink_Channel_sfReqClanPersonelIntro_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     PersonelIntro;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanChangeInfo
struct UBTTcpLink_Channel_sfAckClanChangeInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanChangeInfo
struct UBTTcpLink_Channel_sfReqClanChangeInfo_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      IsRecruit;                                                // (Parm)
	unsigned char                                      Region;                                                   // (Parm)
	struct FString                                     Keyword;                                                  // (Parm, NeedCtorLink)
	struct FString                                     ClanIntro;                                                // (Parm, NeedCtorLink)
	struct FString                                     Notice;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanClose
struct UBTTcpLink_Channel_sfAckClanClose_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanClose
struct UBTTcpLink_Channel_sfReqClanClose_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyClanSecession
struct UBTTcpLink_Channel_sfAckNotifyClanSecession_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanSecession
struct UBTTcpLink_Channel_sfAckClanSecession_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanSecession
struct UBTTcpLink_Channel_sfReqClanSecession_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanNews
struct UBTTcpLink_Channel_sfAckClanNews_Params
{
	TArray<struct FString>                             IssueDate;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IssueType;                                                // (Parm, NeedCtorLink)
	TArray<struct FString>                             IssuedClanMember;                                         // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanNews
struct UBTTcpLink_Channel_sfReqClanNews_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyAdjustClanMemberGrade
struct UBTTcpLink_Channel_sfAckNotifyAdjustClanMemberGrade_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      CharGrade;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAdjustClanMemberGrade
struct UBTTcpLink_Channel_sfAckAdjustClanMemberGrade_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      CharGrade;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAdjustClanMemberGrade
struct UBTTcpLink_Channel_sfReqAdjustClanMemberGrade_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      CharGrade;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanUserListEnd
struct UBTTcpLink_Channel_sfAckClanUserListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanUserList
struct UBTTcpLink_Channel_sfAckClanUserList_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        Level;                                                    // (Parm, NeedCtorLink)
	TArray<struct FString>                             CharName;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ClanGrade;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        ClanWinCnt;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLoseCnt;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        LevelMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TitleMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        DudeId;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanUserListStart
struct UBTTcpLink_Channel_sfAckClanUserListStart_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanUserList
struct UBTTcpLink_Channel_sfReqClanUserList_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSearchClan
struct UBTTcpLink_Channel_sfAckSearchClan_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                TotalPage;                                                // (Parm)
	TArray<int>                                        ClanMarkPattern;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMarkBG;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ClanMarkBL;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanMaster;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMember;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMemberMax;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        ClanCreateDate;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        ClanWin;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLose;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanDraw;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanRank;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ClanRecruit;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLevel;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSerachClan
struct UBTTcpLink_Channel_sfReqSerachClan_Params
{
	unsigned char                                      SearchType;                                               // (Parm)
	struct FString                                     Keyword;                                                  // (Parm, NeedCtorLink)
	unsigned char                                      ClanStatus;                                               // (Parm)
	unsigned char                                      ClanRegion;                                               // (Parm)
	int                                                ReqPage;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckJoinClanResult
struct UBTTcpLink_Channel_sfAckJoinClanResult_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      Permit;                                                   // (Parm)
	struct FString                                     PermitCharName;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRecvJoinClanResult
struct UBTTcpLink_Channel_sfAckRecvJoinClanResult_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRecvJoinClan
struct UBTTcpLink_Channel_sfAckRecvJoinClan_Params
{
	int                                                UserIdx;                                                  // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ReqMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      Permit;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvJoinClan
struct UBTTcpLink_Channel_sfReqRecvJoinClan_Params
{
	int                                                UserIdx;                                                  // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckJoinClan
struct UBTTcpLink_Channel_sfAckJoinClan_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     SpecificCharName;                                         // (Parm, NeedCtorLink)
	struct FString                                     RealRecvCharName;                                         // (Parm, NeedCtorLink)
	unsigned char                                      RealRecvCharClanGrade;                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqJoinClan
struct UBTTcpLink_Channel_sfReqJoinClan_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ClanManagerName;                                          // (Parm, NeedCtorLink)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckInviteClanResult
struct UBTTcpLink_Channel_sfAckInviteClanResult_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      Permit;                                                   // (Parm)
	struct FString                                     ClanNm;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRecvClanInviteResult
struct UBTTcpLink_Channel_sfAckRecvClanInviteResult_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRecvClanInvite
struct UBTTcpLink_Channel_sfAckRecvClanInvite_Params
{
	int                                                InviterUserDBID;                                          // (Parm)
	struct FString                                     InviterCharname;                                          // (Parm, NeedCtorLink)
	struct FString                                     InviterMsg;                                               // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      Permit;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvClanInvite
struct UBTTcpLink_Channel_sfReqRecvClanInvite_Params
{
	int                                                InviterUserDBID;                                          // (Parm)
	struct FString                                     InviterCharname;                                          // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     InviteMsg;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckInviteClan
struct UBTTcpLink_Channel_sfAckInviteClan_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqInviteClan
struct UBTTcpLink_Channel_sfReqInviteClan_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     InviteMsg;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanInfo
struct UBTTcpLink_Channel_sfAckClanInfo_Params
{
	struct FClanInfo                                   stClanInfo;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanInfo
struct UBTTcpLink_Channel_sfReqClanInfo_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckCreateClan
struct UBTTcpLink_Channel_sfAckCreateClan_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                StackCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqCreateClan
struct UBTTcpLink_Channel_sfReqCreateClan_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ClanURL;                                                  // (Parm, NeedCtorLink)
	struct FString                                     ClanIntro;                                                // (Parm, NeedCtorLink)
	struct FString                                     ClanKeyword;                                              // (Parm, NeedCtorLink)
	unsigned char                                      ClanRegion;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckDupCheckClanName
struct UBTTcpLink_Channel_sfAckDupCheckClanName_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqDupCheckClanName
struct UBTTcpLink_Channel_sfReqDupCheckClanName_Params
{
	struct FString                                     ClanNam;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSellShopItemInfo
struct UBTTcpLink_Channel_sfAckSellShopItemInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  UniqueItemID;                                             // (Parm)
	int                                                SellPoint;                                                // (Parm)
	int                                                CurPoint;                                                 // (Parm)
	int                                                AfterPoint;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSellShopItemInfo
struct UBTTcpLink_Channel_sfReqSellShopItemInfo_Params
{
	struct FBtrDouble                                  UniqueItemID;                                             // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGameOverEnd
struct UBTTcpLink_Channel_sfAckGameOverEnd_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGameOverEnd
struct UBTTcpLink_Channel_sfReqGameOverEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAuctionItemListCount
struct UBTTcpLink_Channel_sfAckAuctionItemListCount_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      Section;                                                  // (Parm)
	unsigned char                                      Classfy;                                                  // (Parm)
	int                                                ItemType;                                                 // (Parm)
	int                                                ItemGrade;                                                // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAuctionItemListCount
struct UBTTcpLink_Channel_sfReqAuctionItemListCount_Params
{
	unsigned char                                      Section;                                                  // (Parm)
	unsigned char                                      Classfy;                                                  // (Parm)
	int                                                ItemType;                                                 // (Parm)
	int                                                ItemGrade;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckServerTime
struct UBTTcpLink_Channel_sfAckServerTime_Params
{
	int                                                Time;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqServerTime
struct UBTTcpLink_Channel_sfReqServerTime_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckEntryQSlotIDList
struct UBTTcpLink_Channel_sfAckEntryQSlotIDList_Params
{
	int                                                UserNum;                                                  // (Parm)
	TArray<unsigned char>                              QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        MWItemID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        MWPartID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        MWPaintID;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        PistolItemID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        PistolPartID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        PistolPaintID;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        TWItemID1;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        TWItemID2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Skill1ID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Skill2ID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Skill3ID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Skill4ID;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqEntryQSlotIDList
struct UBTTcpLink_Channel_sfReqEntryQSlotIDList_Params
{
	int                                                UserNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckEntryQSlotUniqueIDList
struct UBTTcpLink_Channel_sfAckEntryQSlotUniqueIDList_Params
{
	int                                                UserNum;                                                  // (Parm)
	TArray<unsigned char>                              QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          MWUniqueID;                                               // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          PistolUniqueID;                                           // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          TW1UniqueID;                                              // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          TW2UniqueID;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqEntryQSlotUniqueIDList
struct UBTTcpLink_Channel_sfReqEntryQSlotUniqueIDList_Params
{
	int                                                UserNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAuctionBidding
struct UBTTcpLink_Channel_sfAckAuctionBidding_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                PointRemain;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAuctionBidding
struct UBTTcpLink_Channel_sfReqAuctionBidding_Params
{
	int                                                UniqueID;                                                 // (Parm)
	int                                                BiddingPrice;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAuctionInstantlyBuying
struct UBTTcpLink_Channel_sfAckAuctionInstantlyBuying_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                PointRemain;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAuctionInstantlyBuying
struct UBTTcpLink_Channel_sfReqAuctionInstantlyBuying_Params
{
	int                                                UniqueID;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAuctionItemListEnd
struct UBTTcpLink_Channel_sfAckAuctionItemListEnd_Params
{
	unsigned char                                      Section;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAuctionItemList
struct UBTTcpLink_Channel_sfAckAuctionItemList_Params
{
	unsigned char                                      Section;                                                  // (Parm)
	TArray<int>                                        UniqueIDs;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        ItemIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        AddPartsIDs;                                              // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UntilTimes;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        BiddingPrices;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        InstantlyByuingPrices;                                    // (Parm, NeedCtorLink)
	TArray<int>                                        ItemDamageds;                                             // (Parm, NeedCtorLink)
	TArray<struct FString>                             HighestBidderNames;                                       // (Parm, NeedCtorLink)
	TArray<struct FString>                             SellerNames;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ItemCount;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAuctionItemListStart
struct UBTTcpLink_Channel_sfAckAuctionItemListStart_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      Section;                                                  // (Parm)
	int                                                PageNum;                                                  // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAuctionItemList
struct UBTTcpLink_Channel_sfReqAuctionItemList_Params
{
	unsigned char                                      Section;                                                  // (Parm)
	struct FString                                     Keyword;                                                  // (Parm, NeedCtorLink)
	int                                                ItemRank;                                                 // (Parm)
	unsigned char                                      ItemClassfy;                                              // (Parm)
	unsigned char                                      IsAvailable;                                              // (Parm)
	int                                                PageNum;                                                  // (Parm)
	int                                                Count;                                                    // (Parm)
	int                                                SortOpt;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAuctionMyItemCancel
struct UBTTcpLink_Channel_sfAckAuctionMyItemCancel_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAuctionMyItemCancel
struct UBTTcpLink_Channel_sfReqAuctionMyItemCancel_Params
{
	int                                                UniqueID;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAuctionMyItemRegister
struct UBTTcpLink_Channel_sfAckAuctionMyItemRegister_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                BeginPrice;                                               // (Parm)
	int                                                BuyPrice;                                                 // (Parm)
	int                                                GuarantyPoint;                                            // (Parm)
	int                                                PointRemain;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAuctionMyItemRegister
struct UBTTcpLink_Channel_sfReqAuctionMyItemRegister_Params
{
	struct FBtrDouble                                  UniqueID;                                                 // (Parm)
	int                                                ItemCount;                                                // (Parm)
	int                                                BeginPrice;                                               // (Parm)
	int                                                PeriodHour;                                               // (Parm)
	int                                                InstantlyBuyingPrice;                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckMyMoney
struct UBTTcpLink_Channel_sfAckMyMoney_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                Point;                                                    // (Parm)
	int                                                Cash;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqMyMoney
struct UBTTcpLink_Channel_sfReqMyMoney_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckUpdateQSlot
struct UBTTcpLink_Channel_sfAckUpdateQSlot_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqUpdateQSlot
struct UBTTcpLink_Channel_sfReqUpdateQSlot_Params
{
	int                                                QSlotID;                                                  // (Parm)
	struct FString                                     QSlotName;                                                // (Parm, NeedCtorLink)
	struct FBtrDouble                                  MWItemID;                                                 // (Parm)
	struct FBtrDouble                                  PistolItemID;                                             // (Parm)
	struct FBtrDouble                                  TWItemID1;                                                // (Parm)
	struct FBtrDouble                                  TWItemID2;                                                // (Parm)
	int                                                Skill1;                                                   // (Parm)
	int                                                Skill2;                                                   // (Parm)
	int                                                Skill3;                                                   // (Parm)
	int                                                Skill4;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckQSlotList
struct UBTTcpLink_Channel_sfAckQSlotList_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        QSlotID;                                                  // (Parm, NeedCtorLink)
	TArray<struct FString>                             QSlotName;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          MWItemID;                                                 // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          PistolItemID;                                             // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          TWItemID1;                                                // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          TWItemID2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Skill1;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        Skill2;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        Skill3;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        Skill4;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqQSlotList
struct UBTTcpLink_Channel_sfReqQSlotList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRepairItem
struct UBTTcpLink_Channel_sfAckRepairItem_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UniqueItemID;                                             // (Parm, NeedCtorLink)
	int                                                RepairCost;                                               // (Parm)
	TArray<int>                                        DamageDegree;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRepairItem
struct UBTTcpLink_Channel_sfReqRepairItem_Params
{
	TArray<struct FBtrDouble>                          UniqueItemID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRepairCost
struct UBTTcpLink_Channel_sfAckRepairCost_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UniqueItemID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        RepairCost;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRepairCost
struct UBTTcpLink_Channel_sfReqRepairCost_Params
{
	TArray<struct FBtrDouble>                          UniqueItemID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckUpdateWeaponDurability
struct UBTTcpLink_Channel_sfAckUpdateWeaponDurability_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UniqueItemID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        Durability;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsDestroy;                                                // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          FailedWeaponUniqueID;                                     // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqUpdateWeaponDurability
struct UBTTcpLink_Channel_sfReqUpdateWeaponDurability_Params
{
	int                                                TotalPlayTime;                                            // (Parm)
	TArray<int>                                        OwnerID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        Number;                                                   // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UniqueItemID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        UsingSec;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        UsingRoundInSD;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckModifyWeapon
struct UBTTcpLink_Channel_sfAckModifyWeapon_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  UniqueID;                                                 // (Parm)
	int                                                AddPartID;                                                // (Parm)
	int                                                PaintID;                                                  // (Parm)
	int                                                Point;                                                    // (Parm)
	int                                                Cash;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqModifyWeapon
struct UBTTcpLink_Channel_sfReqModifyWeapon_Params
{
	struct FBtrDouble                                  UniqueID;                                                 // (Parm)
	int                                                AddPartID;                                                // (Parm)
	int                                                PaintID;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSellShopItem
struct UBTTcpLink_Channel_sfAckSellShopItem_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                PointRemain;                                              // (Parm)
	int                                                CashRemain;                                               // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSellShopItem
struct UBTTcpLink_Channel_sfReqSellShopItem_Params
{
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckBuyShopItem
struct UBTTcpLink_Channel_sfAckBuyShopItem_Params
{
	int                                                ItemCount;                                                // (Parm)
	TArray<int>                                        Result;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        BoughtItemTypeID;                                         // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          BoughtItemUniqueID;                                       // (Parm, NeedCtorLink)
	TArray<int>                                        BoughtPartID;                                             // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          BoughtUntilTIme;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        BoughtStackCnt;                                           // (Parm, NeedCtorLink)
	int                                                PointRemain;                                              // (Parm)
	int                                                CashRemain;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqBuyShopItem
struct UBTTcpLink_Channel_sfReqBuyShopItem_Params
{
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	unsigned char                                      BuyOption1;                                               // (Parm)
	unsigned char                                      BuyOption2;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckShopItemListEnd
struct UBTTcpLink_Channel_sfAckShopItemListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckShopItemList
struct UBTTcpLink_Channel_sfAckShopItemList_Params
{
	TArray<int>                                        ItemID;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckShopItemListStart
struct UBTTcpLink_Channel_sfAckShopItemListStart_Params
{
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqShopItemList
struct UBTTcpLink_Channel_sfReqShopItemList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckForceGameOver
struct UBTTcpLink_Channel_sfAckForceGameOver_Params
{
	int                                                UserID;                                                   // (Parm)
	int                                                GameRoomNumber;                                           // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqForceGameOver
struct UBTTcpLink_Channel_sfReqForceGameOver_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGiveSkill
struct UBTTcpLink_Channel_sfAckGiveSkill_Params
{
	int                                                SkillID;                                                  // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGiveSkill
struct UBTTcpLink_Channel_sfReqGiveSkill_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyExpiredItemIDs
struct UBTTcpLink_Channel_sfAckNotifyExpiredItemIDs_Params
{
	int                                                UserID;                                                   // (Parm)
	TArray<struct FBtrDouble>                          ExpiredItemUniqueIDs;                                     // (Parm, NeedCtorLink)
	TArray<int>                                        ExpiredItemIDs;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        ExpiredItemPartIDs;                                       // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ExpiredItemSlotPos;                                       // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyExpiredItemIDs
struct UBTTcpLink_Channel_sfReqNotifyExpiredItemIDs_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyExpiredSkillIDs
struct UBTTcpLink_Channel_sfAckNotifyExpiredSkillIDs_Params
{
	int                                                UserID;                                                   // (Parm)
	TArray<struct FBtrDouble>                          ExpiredSkillUniqueIDs;                                    // (Parm, NeedCtorLink)
	TArray<int>                                        ExpiredSkillIDs;                                          // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ExpiredSkillSlotPositions;                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyExpiredSkillIDs
struct UBTTcpLink_Channel_sfReqNotifyExpiredSkillIDs_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyChangedSkillState
struct UBTTcpLink_Channel_sfAckNotifyChangedSkillState_Params
{
	int                                                UserID;                                                   // (Parm)
	TArray<int>                                        SkillIDs;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              NewStates;                                                // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyChangedSkillState
struct UBTTcpLink_Channel_sfReqNotifyChangedSkillState_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyChangedItemState
struct UBTTcpLink_Channel_sfAckNotifyChangedItemState_Params
{
	int                                                UserID;                                                   // (Parm)
	TArray<int>                                        ItemIDs;                                                  // (Parm, NeedCtorLink)
	TArray<unsigned char>                              NewStates;                                                // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyChangedItemState
struct UBTTcpLink_Channel_sfReqNotifyChangedItemState_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckConfirmSkillChanged
struct UBTTcpLink_Channel_sfAckConfirmSkillChanged_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqConfirmSkillChanged
struct UBTTcpLink_Channel_sfReqConfirmSkillChanged_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckEquipSkill
struct UBTTcpLink_Channel_sfAckEquipSkill_Params
{
	int                                                ChangedNewSkillID;                                        // (Parm)
	int                                                ChangedNewSkillUniqueID;                                  // (Parm)
	unsigned char                                      ChangedNewSlotPosition;                                   // (Parm)
	int                                                ChangedOldSkillID;                                        // (Parm)
	int                                                ChangedOldSkillUniqueID;                                  // (Parm)
	unsigned char                                      ChangedOldSlotPosition;                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqEquipSkill
struct UBTTcpLink_Channel_sfReqEquipSkill_Params
{
	int                                                SkillID;                                                  // (Parm)
	int                                                SkillUniqueID;                                            // (Parm)
	unsigned char                                      NewSlotPosition;                                          // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckUserSkillListEnd
struct UBTTcpLink_Channel_sfAckUserSkillListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckUserSkillList
struct UBTTcpLink_Channel_sfAckUserSkillList_Params
{
	TArray<int>                                        UniqueSkillID;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        SkillID;                                                  // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UntilTime;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              SlotPosition;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckUserSkillListStart
struct UBTTcpLink_Channel_sfAckUserSkillListStart_Params
{
	int                                                Count;                                                    // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqUserSkillList
struct UBTTcpLink_Channel_sfReqUserSkillList_Params
{
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckDelMemo
struct UBTTcpLink_Channel_sfAckDelMemo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        FailedMemoID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqDelMemo
struct UBTTcpLink_Channel_sfReqDelMemo_Params
{
	TArray<int>                                        MemoIdx;                                                  // (Parm, NeedCtorLink)
	unsigned char                                      Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckReadMemo
struct UBTTcpLink_Channel_sfAckReadMemo_Params
{
	struct FString                                     cnameFrom;                                                // (Parm, NeedCtorLink)
	struct FString                                     Text;                                                     // (Parm, NeedCtorLink)
	struct FString                                     dateRecv;                                                 // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemUID;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqReadMemo
struct UBTTcpLink_Channel_sfReqReadMemo_Params
{
	int                                                MemoIdx;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckEndMemoList
struct UBTTcpLink_Channel_sfAckEndMemoList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckMemoList
struct UBTTcpLink_Channel_sfAckMemoList_Params
{
	TArray<int>                                        MemoIdx;                                                  // (Parm, NeedCtorLink)
	TArray<struct FString>                             cnameFrom;                                                // (Parm, NeedCtorLink)
	TArray<struct FString>                             dateRecv;                                                 // (Parm, NeedCtorLink)
	TArray<struct FString>                             Text;                                                     // (Parm, NeedCtorLink)
	TArray<unsigned char>                              Status;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        UntilExpire;                                              // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          ItemUID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ItemID;                                                   // (Parm, NeedCtorLink)
	TArray<unsigned char>                              MsgType;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ItemPartID;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckStartMemoList
struct UBTTcpLink_Channel_sfAckStartMemoList_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      Type;                                                     // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqMemoList
struct UBTTcpLink_Channel_sfReqMemoList_Params
{
	unsigned char                                      Type;                                                     // (Parm)
	unsigned char                                      MemoType;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvMemo
struct UBTTcpLink_Channel_sfReqRecvMemo_Params
{
	struct FString                                     cnameFrom;                                                // (Parm, NeedCtorLink)
	unsigned char                                      MemoType;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSendMemo
struct UBTTcpLink_Channel_sfAckSendMemo_Params
{
	TArray<struct FString>                             CnamesToFail;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        ResultArray;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSendMemo
struct UBTTcpLink_Channel_sfReqSendMemo_Params
{
	TArray<struct FString>                             cnames;                                                   // (Parm, NeedCtorLink)
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	int                                                ItemUID;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvChatWispher
struct UBTTcpLink_Channel_sfReqRecvChatWispher_Params
{
	struct FString                                     CharnameFrom;                                             // (Parm, NeedCtorLink)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChatWispher
struct UBTTcpLink_Channel_sfAckChatWispher_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     ToCharName;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChatWispher
struct UBTTcpLink_Channel_sfReqChatWispher_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRemoveBlockUserList
struct UBTTcpLink_Channel_sfAckRemoveBlockUserList_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRemoveBlockUserList
struct UBTTcpLink_Channel_sfReqRemoveBlockUserList_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAddBlockUserList
struct UBTTcpLink_Channel_sfAckAddBlockUserList_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAddBlockUserList
struct UBTTcpLink_Channel_sfReqAddBlockUserList_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckBlockUserListEnd
struct UBTTcpLink_Channel_sfAckBlockUserListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckBlockUserList
struct UBTTcpLink_Channel_sfAckBlockUserList_Params
{
	TArray<struct FString>                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckBlockUserListStart
struct UBTTcpLink_Channel_sfAckBlockUserListStart_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqBlockUserList
struct UBTTcpLink_Channel_sfReqBlockUserList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqCompleteFriendInvite
struct UBTTcpLink_Channel_sfReqCompleteFriendInvite_Params
{
	struct FString                                     CharnameToBeInvited;                                      // (Parm, NeedCtorLink)
	unsigned char                                      IsPermit;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckConfirmFriendInvite
struct UBTTcpLink_Channel_sfAckConfirmFriendInvite_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqConfirmFriendInvite
struct UBTTcpLink_Channel_sfReqConfirmFriendInvite_Params
{
	int                                                ReqUserID;                                                // (Parm)
	struct FString                                     ReqedCharname;                                            // (Parm, NeedCtorLink)
	unsigned char                                      IsPermit;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvFriendInvite
struct UBTTcpLink_Channel_sfReqRecvFriendInvite_Params
{
	int                                                ReqUserID;                                                // (Parm)
	struct FString                                     ReqCharname;                                              // (Parm, NeedCtorLink)
	struct FString                                     InviteMsg;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSendFriendInvite
struct UBTTcpLink_Channel_sfAckSendFriendInvite_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSendFriendInvite
struct UBTTcpLink_Channel_sfReqSendFriendInvite_Params
{
	int                                                InviteUserID;                                             // (Parm)
	struct FString                                     InviteName;                                               // (Parm, NeedCtorLink)
	struct FString                                     InviteMsg;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChatNormal
struct UBTTcpLink_Channel_sfAckChatNormal_Params
{
	int                                                id;                                                       // (Parm)
	struct FString                                     Sender;                                                   // (Parm, NeedCtorLink)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChatNormal
struct UBTTcpLink_Channel_sfReqChatNormal_Params
{
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckDummy
struct UBTTcpLink_Channel_sfAckDummy_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqDummy
struct UBTTcpLink_Channel_sfReqDummy_Params
{
	int                                                DelayCheck;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckConfirmItemChanged
struct UBTTcpLink_Channel_sfAckConfirmItemChanged_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqConfirmItemChanged
struct UBTTcpLink_Channel_sfReqConfirmItemChanged_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckEquipItem
struct UBTTcpLink_Channel_sfAckEquipItem_Params
{
	int                                                ChangedNewItemID;                                         // (Parm)
	struct FBtrDouble                                  ChangedNewUniqueID;                                       // (Parm)
	int                                                ChangedNewSlotPosition;                                   // (Parm)
	int                                                ChangedOldItemID;                                         // (Parm)
	struct FBtrDouble                                  ChangedOldUniqueID;                                       // (Parm)
	int                                                ChangedOldSlotPosition;                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqEquipItem
struct UBTTcpLink_Channel_sfReqEquipItem_Params
{
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  UniqueID;                                                 // (Parm)
	int                                                SlotPosition;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckItemListEnd
struct UBTTcpLink_Channel_sfAckItemListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckItemList
struct UBTTcpLink_Channel_sfAckItemList_Params
{
	TArray<struct FBtrDouble>                          UniqueID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ItemID;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        ItemType;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Durability;                                               // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UntilTime;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        SlotPosition;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        AddPartsID;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        DamageDegree;                                             // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ItemState;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        StackCount;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        PaintID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        TradeCount;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckItemListStart
struct UBTTcpLink_Channel_sfAckItemListStart_Params
{
	int                                                Count;                                                    // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqItemList
struct UBTTcpLink_Channel_sfReqItemList_Params
{
	int                                                UID;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckEntrySkillList
struct UBTTcpLink_Channel_sfAckEntrySkillList_Params
{
	TArray<int>                                        UserIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        SkillIDs;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        SlotPositions;                                            // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqEntrySkillList
struct UBTTcpLink_Channel_sfReqEntrySkillList_Params
{
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckEntryItemList
struct UBTTcpLink_Channel_sfAckEntryItemList_Params
{
	TArray<int>                                        UserIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ItemIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        SlotPositions;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        AddPartsID;                                               // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UniqueID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        PaintID;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqEntryItemList
struct UBTTcpLink_Channel_sfReqEntryItemList_Params
{
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChangeUserState
struct UBTTcpLink_Channel_sfAckChangeUserState_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        UserIDs;                                                  // (Parm, NeedCtorLink)
	TArray<unsigned char>                              Positions;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Numbers;                                                  // (Parm, NeedCtorLink)
	TArray<unsigned char>                              OldStates;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              NewStates;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChangeUserState
struct UBTTcpLink_Channel_sfReqChangeUserState_Params
{
	unsigned char                                      NewState;                                                 // (Parm)
	unsigned char                                      CheckPlaying;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckExteriorRoomState
struct UBTTcpLink_Channel_sfAckExteriorRoomState_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqExteriorRoomState
struct UBTTcpLink_Channel_sfReqExteriorRoomState_Params
{
	int                                                RoomNumber;                                               // (Parm)
	unsigned char                                      RoomState;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckExteriorRoomUserCount
struct UBTTcpLink_Channel_sfAckExteriorRoomUserCount_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqExteriorRoomUserCount
struct UBTTcpLink_Channel_sfReqExteriorRoomUserCount_Params
{
	int                                                RoomNumber;                                               // (Parm)
	int                                                RoomUserCount;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckExteriorRoomInfo
struct UBTTcpLink_Channel_sfAckExteriorRoomInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqExteriorRoomInfo
struct UBTTcpLink_Channel_sfReqExteriorRoomInfo_Params
{
	int                                                SP;                                                       // (Parm)
	int                                                RoomNumber;                                               // (Parm)
	unsigned char                                      IsPW;                                                     // (Parm)
	struct FString                                     RoomName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     MapName;                                                  // (Parm, NeedCtorLink)
	struct FString                                     ModeName;                                                 // (Parm, NeedCtorLink)
	int                                                MapNum;                                                   // (Parm)
	int                                                ModeNum;                                                  // (Parm)
	unsigned char                                      IsTeamBalance;                                            // (Parm)
	int                                                MaxUserCount;                                             // (Parm)
	int                                                RoomUserCount;                                            // (Parm)
	unsigned char                                      RoomState;                                                // (Parm)
	unsigned char                                      BotDifficult;                                             // (Parm)
	unsigned char                                      WeaponLimit;                                              // (Parm)
	unsigned char                                      BotModeUserTeamNum;                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetBootyChoose
struct UBTTcpLink_Channel_sfAckGetBootyChoose_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      GiveType;                                                 // (Parm)
	struct FBtrDouble                                  ItemUniqueNumber;                                         // (Parm)
	int                                                ItemID;                                                   // (Parm)
	int                                                PartID;                                                   // (Parm)
	unsigned char                                      ItemType;                                                 // (Parm)
	struct FBtrDouble                                  UntilTime;                                                // (Parm)
	int                                                StackCount;                                               // (Parm)
	int                                                PaintID;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetBooty
struct UBTTcpLink_Channel_sfAckGetBooty_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        PrizeWinUserID;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        BootyItemID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        BootyPartsID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGetBooty
struct UBTTcpLink_Channel_sfReqGetBooty_Params
{
	int                                                RoomNumber;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSetUserBootySeedValue
struct UBTTcpLink_Channel_sfAckSetUserBootySeedValue_Params
{
	int                                                UserID;                                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSetUserBootySeedValue
struct UBTTcpLink_Channel_sfReqSetUserBootySeedValue_Params
{
	int                                                UserID;                                                   // (Parm)
	int                                                SeedValue;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChangeRoomSetting
struct UBTTcpLink_Channel_sfAckChangeRoomSetting_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FGameRoomInfo                               RoomInfo;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChangeRoomSetting
struct UBTTcpLink_Channel_sfReqChangeRoomSetting_Params
{
	struct FGameRoomInfo                               RoomInfo;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyLevelUp
struct UBTTcpLink_Channel_sfReqNotifyLevelUp_Params
{
	int                                                LevelUpUserID;                                            // (Parm)
	int                                                Level;                                                    // (Parm)
	int                                                Exp;                                                      // (Parm)
	TArray<int>                                        ItemID;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        PartID;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClientUdpInfoList
struct UBTTcpLink_Channel_sfAckClientUdpInfoList_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        UID;                                                      // (Parm, NeedCtorLink)
	TArray<struct FString>                             IP;                                                       // (Parm, NeedCtorLink)
	TArray<int>                                        Port;                                                     // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClientUdpInfoList
struct UBTTcpLink_Channel_sfReqClientUdpInfoList_Params
{
	int                                                GameNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRegisterOtherUdpInfo
struct UBTTcpLink_Channel_sfAckRegisterOtherUdpInfo_Params
{
	int                                                UID;                                                      // (Parm)
	struct FString                                     IP;                                                       // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	unsigned char                                      NatType;                                                  // (Parm)
	unsigned char                                      Intervention;                                             // (Parm)
	struct FString                                     HostInnerIP;                                              // (Parm, NeedCtorLink)
	int                                                HostInnerPort;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRegisterMyUdpInfo
struct UBTTcpLink_Channel_sfAckRegisterMyUdpInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRegisterMyUdpInfo
struct UBTTcpLink_Channel_sfReqRegisterMyUdpInfo_Params
{
	unsigned char                                      IsHost;                                                   // (Parm)
	struct FString                                     IP;                                                       // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	unsigned char                                      Intervention;                                             // (Parm)
	struct FString                                     HostInnerIP;                                              // (Parm, NeedCtorLink)
	int                                                HostInnerPort;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyClientJoinTime
struct UBTTcpLink_Channel_sfAckNotifyClientJoinTime_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyClientJoinTime
struct UBTTcpLink_Channel_sfReqNotifyClientJoinTime_Params
{
	int                                                JoinedClientID;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChangeNewGuest
struct UBTTcpLink_Channel_sfAckChangeNewGuest_Params
{
	struct FString                                     HostIP;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChangeHost
struct UBTTcpLink_Channel_sfAckChangeHost_Params
{
	unsigned char                                      ClientNum;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckDisconnectGame
struct UBTTcpLink_Channel_sfAckDisconnectGame_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                DisconnectUserID;                                         // (Parm)
	struct FString                                     DisconnectUserName;                                       // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqDisconnectGame
struct UBTTcpLink_Channel_sfReqDisconnectGame_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckConnectGame
struct UBTTcpLink_Channel_sfAckConnectGame_Params
{
	int                                                UserID;                                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqConnectGame
struct UBTTcpLink_Channel_sfReqConnectGame_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRelayServerOff
struct UBTTcpLink_Channel_sfReqRelayServerOff_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRelayServerOn
struct UBTTcpLink_Channel_sfReqRelayServerOn_Params
{
	struct FString                                     RelayServerIP;                                            // (Parm, NeedCtorLink)
	int                                                RelayServerPortNum;                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGameOver
struct UBTTcpLink_Channel_sfAckGameOver_Params
{
	int                                                UID;                                                      // (Parm)
	int                                                GameRoomNumber;                                           // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGameOver
struct UBTTcpLink_Channel_sfReqGameOver_Params
{
	int                                                UID;                                                      // (Parm)
	int                                                GameRoomNumber;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckIsGameRoomPlaying
struct UBTTcpLink_Channel_sfAckIsGameRoomPlaying_Params
{
	int                                                GameRoomNum;                                              // (Parm)
	unsigned char                                      IsPlaying;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqIsGameRoomPlaying
struct UBTTcpLink_Channel_sfReqIsGameRoomPlaying_Params
{
	int                                                GameRoomNum;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGameRoomDestroy
struct UBTTcpLink_Channel_sfAckGameRoomDestroy_Params
{
	int                                                GameRoomNum;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChangeRoomMaxNum
struct UBTTcpLink_Channel_sfAckChangeRoomMaxNum_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                Number;                                                   // (Parm)
	int                                                TeamNumber;                                               // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChangeRoomMaxNum
struct UBTTcpLink_Channel_sfReqChangeRoomMaxNum_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	int                                                Number;                                                   // (Parm)
	int                                                TeamNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckUpdateScoreResult
struct UBTTcpLink_Channel_sfAckUpdateScoreResult_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckUpdateScore
struct UBTTcpLink_Channel_sfAckUpdateScore_Params
{
	TArray<int>                                        UserIDs;                                                  // (Parm, NeedCtorLink)
	TArray<struct FString>                             NickNames;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              TeamIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        Scores;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        Kills;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        Assists;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        Deaths;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        EXPs;                                                     // (Parm, NeedCtorLink)
	TArray<int>                                        EXPBonuses;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        Points;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        PointBonuses;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        TeamScores;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        BonusOwnerID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        BonusID;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqUpdateScore
struct UBTTcpLink_Channel_sfReqUpdateScore_Params
{
	int                                                GameNumber;                                               // (Parm)
	TArray<int>                                        UserIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        Kills;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        Assists;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        Deaths;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        EXPs;                                                     // (Parm, NeedCtorLink)
	TArray<int>                                        Points;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        Scores;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        TeamScores;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        RoundJoin;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        TimeJoin;                                                 // (Parm, NeedCtorLink)
	int                                                Playtime;                                                 // (Parm)
	unsigned char                                      GameEndType;                                              // (Parm)
	TArray<struct FString>                             UserNames;                                                // (Parm, NeedCtorLink)
	unsigned char                                      IsAIClear;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckStartGame
struct UBTTcpLink_Channel_sfAckStartGame_Params
{
	int                                                GameNumber;                                               // (Parm)
	int                                                ClientsCount;                                             // (Parm)
	int                                                StartSeed;                                                // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqStartGame
struct UBTTcpLink_Channel_sfReqStartGame_Params
{
	int                                                GameNumber;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGameHostInfo
struct UBTTcpLink_Channel_sfAckGameHostInfo_Params
{
	int                                                GameNumber;                                               // (Parm)
	struct FString                                     UserID;                                                   // (Parm, NeedCtorLink)
	struct FString                                     IP;                                                       // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGameHostInfo
struct UBTTcpLink_Channel_sfReqGameHostInfo_Params
{
	int                                                GameNumber;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckIsHostAvailable
struct UBTTcpLink_Channel_sfAckIsHostAvailable_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqIsHostAvailable
struct UBTTcpLink_Channel_sfReqIsHostAvailable_Params
{
	struct FString                                     MyIp;                                                     // (Parm, NeedCtorLink)
	int                                                CPUGrade;                                                 // (Parm)
	int                                                RamGrade;                                                 // (Parm)
	int                                                VGAGrade;                                                 // (Parm)
	int                                                VGARam;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChangeTeam
struct UBTTcpLink_Channel_sfAckChangeTeam_Params
{
	int                                                GameNumber;                                               // (Parm)
	struct FString                                     UserID;                                                   // (Parm, NeedCtorLink)
	int                                                UID;                                                      // (Parm)
	int                                                TeamNum;                                                  // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChangeTeam
struct UBTTcpLink_Channel_sfReqChangeTeam_Params
{
	int                                                TeamNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChangeRoomOwner
struct UBTTcpLink_Channel_sfAckChangeRoomOwner_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                OldOwner;                                                 // (Parm)
	int                                                NewOwner;                                                 // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChangeRoomOwner
struct UBTTcpLink_Channel_sfReqChangeRoomOwner_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	int                                                NewOwner;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChangeGameMode
struct UBTTcpLink_Channel_sfAckChangeGameMode_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	struct FString                                     GameMode;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      GameModeNum;                                              // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChangeGameMode
struct UBTTcpLink_Channel_sfReqChangeGameMode_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	struct FString                                     GameMode;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      GameModeNum;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckBanUser
struct UBTTcpLink_Channel_sfAckBanUser_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	int                                                BanUID;                                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqBanUser
struct UBTTcpLink_Channel_sfReqBanUser_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	int                                                BanUID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSelectMap
struct UBTTcpLink_Channel_sfAckSelectMap_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	struct FString                                     MapName;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSelectMap
struct UBTTcpLink_Channel_sfReqSelectMap_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	struct FString                                     MapName;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGameRoomInfo
struct UBTTcpLink_Channel_sfAckGameRoomInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FGameRoomInfo                               RoomInfo;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGameRoomInfo
struct UBTTcpLink_Channel_sfReqGameRoomInfo_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckCreateGameRoom
struct UBTTcpLink_Channel_sfAckCreateGameRoom_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	struct FString                                     RoomOwnerIP;                                              // (Parm, NeedCtorLink)
	struct FGameRoomInfo                               NetRoomInfo;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqCreateGameRoom
struct UBTTcpLink_Channel_sfReqCreateGameRoom_Params
{
	struct FGameRoomInfo                               NetRoomInfo;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckExceedMaxUser
struct UBTTcpLink_Channel_sfAckExceedMaxUser_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckLeaveRoom
struct UBTTcpLink_Channel_sfAckLeaveRoom_Params
{
	int                                                Num;                                                      // (Parm)
	int                                                UID;                                                      // (Parm)
	struct FString                                     UserID;                                                   // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqLeaveRoom
struct UBTTcpLink_Channel_sfReqLeaveRoom_Params
{
	int                                                Num;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRoomUserList
struct UBTTcpLink_Channel_sfAckRoomUserList_Params
{
	TArray<int>                                        UID;                                                      // (Parm, NeedCtorLink)
	TArray<struct FString>                             UserName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Grade;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        TeamNum;                                                  // (Parm, NeedCtorLink)
	TArray<unsigned char>                              Statue;                                                   // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsHost;                                                   // (Parm, NeedCtorLink)
	TArray<struct FString>                             UserIP;                                                   // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        CM_Pattern;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        CM_BG;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        CM_BL;                                                    // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsLookingFor;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        GMUID;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLevel;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        LevelMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TitleMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved1;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved3;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRoomUserList
struct UBTTcpLink_Channel_sfReqRoomUserList_Params
{
	int                                                GameNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckEnterRoom
struct UBTTcpLink_Channel_sfAckEnterRoom_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                OwnerID;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	struct FString                                     UserID;                                                   // (Parm, NeedCtorLink)
	int                                                TeamNum;                                                  // (Parm)
	int                                                Grade;                                                    // (Parm)
	struct FString                                     UserIP;                                                   // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                Clan_Mark_Pattern;                                        // (Parm)
	int                                                Clan_Mark_BG;                                             // (Parm)
	int                                                Clan_Mark_BL;                                             // (Parm)
	unsigned char                                      IsLookFor;                                                // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                ClanLevel;                                                // (Parm)
	int                                                LevelMarkID;                                              // (Parm)
	int                                                TitleMarkID;                                              // (Parm)
	int                                                Reserved1;                                                // (Parm)
	int                                                Reserved2;                                                // (Parm)
	int                                                Reserved3;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqEnterRoom
struct UBTTcpLink_Channel_sfReqEnterRoom_Params
{
	int                                                GameNum;                                                  // (Parm)
	struct FString                                     Password;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      RoomEnterType;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRoomListEnd
struct UBTTcpLink_Channel_sfAckRoomListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRoomList
struct UBTTcpLink_Channel_sfAckRoomList_Params
{
	TArray<int>                                        GameNum;                                                  // (Parm, NeedCtorLink)
	TArray<struct FString>                             Title;                                                    // (Parm, NeedCtorLink)
	TArray<struct FString>                             MapName;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        MapNum;                                                   // (Parm, NeedCtorLink)
	TArray<unsigned char>                              UserCount;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              MaxCount;                                                 // (Parm, NeedCtorLink)
	TArray<struct FString>                             ModeName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ModeNum;                                                  // (Parm, NeedCtorLink)
	TArray<unsigned char>                              WeaponLimit;                                              // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsTeamBalance;                                            // (Parm, NeedCtorLink)
	TArray<unsigned char>                              Status;                                                   // (Parm, NeedCtorLink)
	TArray<struct FString>                             RoomOwnerIP;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        GameMinute;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             RoomOwnerName;                                            // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsSpecial;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsPassword;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              BotDifficult;                                             // (Parm, NeedCtorLink)
	TArray<unsigned char>                              BotModeUserTeamNum;                                       // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRoomListStart
struct UBTTcpLink_Channel_sfAckRoomListStart_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	int                                                Count;                                                    // (Parm)
	int                                                StartIndex;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRoomList
struct UBTTcpLink_Channel_sfReqRoomList_Params
{
	int                                                id;                                                       // (Parm)
	int                                                StartIndex;                                               // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChannelUserList
struct UBTTcpLink_Channel_sfAckChannelUserList_Params
{
	int                                                TotalCount;                                               // (Parm)
	int                                                Count;                                                    // (Parm)
	int                                                StartIndex;                                               // (Parm)
	TArray<int>                                        UID;                                                      // (Parm, NeedCtorLink)
	TArray<struct FString>                             UserID;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        UserLevels;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanPattern;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ClanBG;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        ClanBL;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        ClanGrade;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        ClanWin;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLose;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsLookForClan;                                            // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLevel;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        LevelMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TitleMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved1;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved3;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChannelUserList
struct UBTTcpLink_Channel_sfReqChannelUserList_Params
{
	int                                                id;                                                       // (Parm)
	int                                                StartIndex;                                               // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckLeaveChannel
struct UBTTcpLink_Channel_sfAckLeaveChannel_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     UserID;                                                   // (Parm, NeedCtorLink)
	int                                                UID;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqLeaveChannel
struct UBTTcpLink_Channel_sfReqLeaveChannel_Params
{
	int                                                id;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckEnterChannel
struct UBTTcpLink_Channel_sfAckEnterChannel_Params
{
	int                                                id;                                                       // (Parm)
	int                                                UID;                                                      // (Parm)
	struct FString                                     UserID;                                                   // (Parm, NeedCtorLink)
	int                                                Level;                                                    // (Parm)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanMarkPattern;                                          // (Parm)
	int                                                ClanMarkBG;                                               // (Parm)
	int                                                ClanMarkBL;                                               // (Parm)
	int                                                ClanGrade;                                                // (Parm)
	int                                                ClanWin;                                                  // (Parm)
	int                                                ClanLose;                                                 // (Parm)
	unsigned char                                      IsLookFor;                                                // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                ClanLevel;                                                // (Parm)
	int                                                LevelMarkID;                                              // (Parm)
	int                                                TitleMarkID;                                              // (Parm)
	int                                                Reserved1;                                                // (Parm)
	int                                                Reserved2;                                                // (Parm)
	int                                                Reserved3;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqEnterChannel
struct UBTTcpLink_Channel_sfReqEnterChannel_Params
{
	int                                                id;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChannelList
struct UBTTcpLink_Channel_sfAckChannelList_Params
{
	TArray<int>                                        id;                                                       // (Parm, NeedCtorLink)
	TArray<struct FString>                             Title;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        CurUser;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        MaxUser;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChannelList
struct UBTTcpLink_Channel_sfReqChannelList_Params
{
	int                                                bChannelType;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckFriendListEnd
struct UBTTcpLink_Channel_sfAckFriendListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckFriendList
struct UBTTcpLink_Channel_sfAckFriendList_Params
{
	TArray<struct FString>                             FriendName;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsLogOn;                                                  // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        CM_Pattern;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        CM_BG;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        CM_BL;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        LevelMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLevel;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Level;                                                    // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsLookForClan;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckFriendListStart
struct UBTTcpLink_Channel_sfAckFriendListStart_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqFriendList
struct UBTTcpLink_Channel_sfReqFriendList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckCharInfo
struct UBTTcpLink_Channel_sfAckCharInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                CM_Pattern;                                               // (Parm)
	int                                                CM_BG;                                                    // (Parm)
	int                                                CM_BL;                                                    // (Parm)
	struct FCharInfo                                   stCharInfo;                                               // (Parm)
	unsigned char                                      InClanRank;                                               // (Parm)
	int                                                ClanLevel;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqCharInfo
struct UBTTcpLink_Channel_sfReqCharInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckLogin2
struct UBTTcpLink_Channel_sfAckLogin2_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FBtrDouble                                  CurServerTime;                                            // (Parm)
	int                                                CharDBID;                                                 // (Parm)
	unsigned char                                      IsGM;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqLogin2
struct UBTTcpLink_Channel_sfReqLogin2_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                TimeStamp;                                                // (Parm)
	int                                                LoginHash1;                                               // (Parm)
	int                                                LoginHash2;                                               // (Parm)
	int                                                LoginHash3;                                               // (Parm)
	int                                                LoginHash4;                                               // (Parm)
	int                                                LoginHash5;                                               // (Parm)
	struct FString                                     Guid;                                                     // (Parm, NeedCtorLink)
	int                                                UserType;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckStartNatDiag
struct UBTTcpLink_Channel_sfAckStartNatDiag_Params
{
	int                                                NatType;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqStartNatDiag
struct UBTTcpLink_Channel_sfReqStartNatDiag_Params
{
	struct FString                                     Server1Addr;                                              // (Parm, NeedCtorLink)
	int                                                Server1Port;                                              // (Parm)
	struct FString                                     Server2Addr;                                              // (Parm, NeedCtorLink)
	int                                                Server2Port;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqForceLogoutByOwner
struct UBTTcpLink_Channel_sfReqForceLogoutByOwner_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckLogin
struct UBTTcpLink_Channel_sfAckLogin_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FCharInfo                                   btCharInfo;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqLogin
struct UBTTcpLink_Channel_sfReqLogin_Params
{
	struct FString                                     id;                                                       // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckHash
struct UBTTcpLink_Channel_sfAckHash_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqHash
struct UBTTcpLink_Channel_sfReqHash_Params
{
	int                                                HashField0;                                               // (Parm)
	int                                                HashField1;                                               // (Parm)
	int                                                HashField2;                                               // (Parm)
	int                                                HashField3;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckUseItemDuringGame
struct UBTTcpLink_Channel_rfAckUseItemDuringGame_Params
{
	int                                                ErrorCode;                                                // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	int                                                RemainCount;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqUseItemDuringGame
struct UBTTcpLink_Channel_rfReqUseItemDuringGame_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	unsigned char                                      UsingCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfChangeItemInstanceInfo
struct UBTTcpLink_Channel_rfChangeItemInstanceInfo_Params
{
	int                                                ErrorCode;                                                // (Parm)
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	unsigned char                                      ChangeCount;                                              // (Parm)
	int                                                RemainCount;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckLuckShop_RewardCoupon
struct UBTTcpLink_Channel_rfAckLuckShop_RewardCoupon_Params
{
	int                                                ErrorCode;                                                // (Parm)
	int                                                Coupon_ItemTypeID;                                        // (Parm)
	struct FBtrDouble                                  Coupon_ItemUniqueID;                                      // (Parm)
	int                                                Coupon_Count_AfterReduction;                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqLuckShop_RewardCoupon
struct UBTTcpLink_Channel_rfReqLuckShop_RewardCoupon_Params
{
	int                                                ChooseNum;                                                // (Parm)
	int                                                ItemID;                                                   // (Parm)
	int                                                ItemIDChoose;                                             // (Parm)
	int                                                PartIDChoose;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckLuckShop_RewardBuyingCount
struct UBTTcpLink_Channel_rfAckLuckShop_RewardBuyingCount_Params
{
	int                                                ErrorCode;                                                // (Parm)
	int                                                FinalCapsuleRewardState;                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqLuckShop_RewardBuyingCount
struct UBTTcpLink_Channel_rfReqLuckShop_RewardBuyingCount_Params
{
	int                                                ChooseNum;                                                // (Parm)
	int                                                ItemID;                                                   // (Parm)
	int                                                ItemIDChoose;                                             // (Parm)
	int                                                PartIDChoose;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckLuckShop_StorageInfo
struct UBTTcpLink_Channel_rfAckLuckShop_StorageInfo_Params
{
	int                                                ErrorCode;                                                // (Parm)
	int                                                BuyingCapsuleCount;                                       // (Parm)
	int                                                CapsuleRewardState;                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqLuckShop_StorageInfo
struct UBTTcpLink_Channel_rfReqLuckShop_StorageInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckLuckShop_LotteryWinnerList
struct UBTTcpLink_Channel_rfAckLuckShop_LotteryWinnerList_Params
{
	int                                                CapsuleItemID;                                            // (Parm)
	unsigned char                                      IsNotification;                                           // (Parm)
	TArray<struct FString>                             NickName;                                                 // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          Time;                                                     // (Parm, NeedCtorLink)
	int                                                GetItemID;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqLuckShop_LotteryWinnerList
struct UBTTcpLink_Channel_rfReqLuckShop_LotteryWinnerList_Params
{
	int                                                CapsuleItemID;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSpecialQuestRank
struct UBTTcpLink_Channel_rfAckSpecialQuestRank_Params
{
	TArray<struct FString>                             CharList;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSpecialQuestRank
struct UBTTcpLink_Channel_rfReqSpecialQuestRank_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckReceiveSpecialReward
struct UBTTcpLink_Channel_rfAckReceiveSpecialReward_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                RewardedQuestID;                                          // (Parm)
	unsigned char                                      RewardedQuestIsComplete;                                  // (Parm)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                RewardItemID;                                             // (Parm)
	int                                                RewardItemCount;                                          // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqReceiveSpecialReward
struct UBTTcpLink_Channel_rfReqReceiveSpecialReward_Params
{
	int                                                QuestID;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckDailyRewardListThisMonth
struct UBTTcpLink_Channel_rfAckDailyRewardListThisMonth_Params
{
	TArray<unsigned char>                              Type;                                                     // (Parm, NeedCtorLink)
	TArray<unsigned char>                              Number;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        ItemID;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        ItemCount;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqDailyRewardListThisMonth
struct UBTTcpLink_Channel_rfReqDailyRewardListThisMonth_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPuzzleList
struct UBTTcpLink_Channel_rfAckPuzzleList_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      IsComplete;                                               // (Parm)
	TArray<unsigned char>                              UpdatedNum;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              StateList;                                                // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                RewardItemID;                                             // (Parm)
	int                                                RewardItemCount;                                          // (Parm)
	struct FBtrDouble                                  PaidItemIdx;                                              // (Parm)
	int                                                PaidItemStackCount;                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqPuzzleList
struct UBTTcpLink_Channel_rfReqPuzzleList_Params
{
	unsigned char                                      ReqType;                                                  // (Parm)
	unsigned char                                      UpdateState;                                              // (Parm)
	struct FBtrDouble                                  PaidItemIdx;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAttendanceList
struct UBTTcpLink_Channel_rfAckAttendanceList_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      IsComplete;                                               // (Parm)
	unsigned char                                      UpdatedNum;                                               // (Parm)
	TArray<unsigned char>                              StateList;                                                // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                RewardItemID;                                             // (Parm)
	int                                                RewardItemCount;                                          // (Parm)
	struct FBtrDouble                                  PaidItemIdx;                                              // (Parm)
	int                                                PaidItemStackCount;                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAttendanceList
struct UBTTcpLink_Channel_rfReqAttendanceList_Params
{
	unsigned char                                      ReqType;                                                  // (Parm)
	unsigned char                                      UpdateNum;                                                // (Parm)
	unsigned char                                      UpdateState;                                              // (Parm)
	struct FBtrDouble                                  PaidItemIdx;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAIRewardResult
struct UBTTcpLink_Channel_rfAckAIRewardResult_Params
{
	unsigned char                                      ClearRewardTYPE;                                          // (Parm)
	int                                                ClearRewardID;                                            // (Parm)
	int                                                ClearRewardCount;                                         // (Parm)
	TArray<int>                                        ScoreRewardUserID;                                        // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ScoreRewardTYPE;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        ScoreRewardID;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        ScoreRewardCount;                                         // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfNotifyCouponUseError
struct UBTTcpLink_Channel_rfNotifyCouponUseError_Params
{
	int                                                Time;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckCouponUse
struct UBTTcpLink_Channel_rfAckCouponUse_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqCouponUse
struct UBTTcpLink_Channel_rfReqCouponUse_Params
{
	struct FString                                     Serial;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyShopItemDataEnd
struct UBTTcpLink_Channel_rfReqNotifyShopItemDataEnd_Params
{
	int                                                Ver;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyShopItemData
struct UBTTcpLink_Channel_rfReqNotifyShopItemData_Params
{
	TArray<int>                                        ProductNo;                                                // (Parm, NeedCtorLink)
	TArray<struct FString>                             ProductName;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ProductCode;                                              // (Parm, NeedCtorLink)
	TArray<unsigned char>                              SaleType;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ProductCost;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ProductHour;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ProductQuantity;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        SaleMasterFlag;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        SaleStatus;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        IsGift;                                                   // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          SaleEndTime;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        Discountcost;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckShopItemData
struct UBTTcpLink_Channel_rfAckShopItemData_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqShopItemData
struct UBTTcpLink_Channel_rfReqShopItemData_Params
{
	int                                                Ver;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyLoadingStatus
struct UBTTcpLink_Channel_rfReqNotifyLoadingStatus_Params
{
	int                                                Status;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqUpdateUserPerformenceInfo
struct UBTTcpLink_Channel_rfReqUpdateUserPerformenceInfo_Params
{
	int                                                UserID;                                                   // (Parm)
	int                                                MinFps;                                                   // (Parm)
	int                                                MaxFps;                                                   // (Parm)
	int                                                AvgFps;                                                   // (Parm)
	int                                                MinPing;                                                  // (Parm)
	int                                                MaxPing;                                                  // (Parm)
	int                                                AvgPing;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAhnNotifyDisconnct
struct UBTTcpLink_Channel_rfReqAhnNotifyDisconnct_Params
{
	int                                                Code;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAhnHsObject
struct UBTTcpLink_Channel_rfAckAhnHsObject_Params
{
	TArray<unsigned char>                              Data;                                                     // (Parm, NeedCtorLink)
	int                                                DataSize;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAhnHsObject
struct UBTTcpLink_Channel_rfReqAhnHsObject_Params
{
	TArray<unsigned char>                              Data;                                                     // (Parm, NeedCtorLink)
	int                                                DataSize;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfNotifyClanLevelup
struct UBTTcpLink_Channel_rfNotifyClanLevelup_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                Levelup;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfNotifyNewClanName
struct UBTTcpLink_Channel_rfNotifyNewClanName_Params
{
	struct FString                                     New_NickName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfNotifyNewNickName
struct UBTTcpLink_Channel_rfNotifyNewNickName_Params
{
	int                                                Community_Type;                                           // (Parm)
	struct FString                                     Old_NickName;                                             // (Parm, NeedCtorLink)
	struct FString                                     New_NickName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGameMapData
struct UBTTcpLink_Channel_rfAckGameMapData_Params
{
	TArray<int>                                        nIdx;                                                     // (Parm, NeedCtorLink)
	TArray<int>                                        nMapID;                                                   // (Parm, NeedCtorLink)
	TArray<struct FString>                             nMapNm;                                                   // (Parm, NeedCtorLink)
	TArray<float>                                      fSupHealth;                                               // (Parm, NeedCtorLink)
	TArray<float>                                      fSupHeli;                                                 // (Parm, NeedCtorLink)
	TArray<float>                                      fSupBomb;                                                 // (Parm, NeedCtorLink)
	TArray<float>                                      fSupUAV;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        nModFFA;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        nModFFAMax;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        nModTDM;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        nModTDMMax;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        nModSD;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        nModSDMax;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        nModDOM;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        nModDOMMax;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        nModSab;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        nModSabMax;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGameMapData
struct UBTTcpLink_Channel_rfReqGameMapData_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckTencent_StartTenProtect
struct UBTTcpLink_Channel_rfAckTencent_StartTenProtect_Params
{
	int                                                CharDBID;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckMoveToLobby
struct UBTTcpLink_Channel_rfAckMoveToLobby_Params
{
	unsigned char                                      MessageType;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPopUpMessage
struct UBTTcpLink_Channel_rfAckPopUpMessage_Params
{
	int                                                MessageType;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfUpdateWebzenShopScriptVersion
struct UBTTcpLink_Channel_rfUpdateWebzenShopScriptVersion_Params
{
	int                                                Year;                                                     // (Parm)
	int                                                YearId;                                                   // (Parm)
	int                                                SalesZoneCode;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSetClientVersion
struct UBTTcpLink_Channel_rfReqSetClientVersion_Params
{
	int                                                ClientVersion;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckFriendPosition
struct UBTTcpLink_Channel_rfAckFriendPosition_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     TargetCharName;                                           // (Parm, NeedCtorLink)
	unsigned char                                      ServerType;                                               // (Parm)
	struct FString                                     fServername;                                              // (Parm, NeedCtorLink)
	struct FString                                     fServerShortName;                                         // (Parm, NeedCtorLink)
	struct FString                                     fServerIP;                                                // (Parm, NeedCtorLink)
	int                                                fServerPort;                                              // (Parm)
	unsigned char                                      CurPos;                                                   // (Parm)
	unsigned char                                      CurState;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	struct FString                                     ChannelNickName;                                          // (Parm, NeedCtorLink)
	int                                                GameRoomNum;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqFriendPosition
struct UBTTcpLink_Channel_rfReqFriendPosition_Params
{
	struct FString                                     TargetCharName;                                           // (Parm, NeedCtorLink)
	unsigned char                                      CommunityType;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckDedicateHost_Login
struct UBTTcpLink_Channel_rfAckDedicateHost_Login_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                UserID;                                                   // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                RoomNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqDedicateHost_Login
struct UBTTcpLink_Channel_rfReqDedicateHost_Login_Params
{
	int                                                ProcessID;                                                // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                RoomNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckLogOut
struct UBTTcpLink_Channel_rfAckLogOut_Params
{
	unsigned char                                      Result;                                                   // (Parm)
	unsigned char                                      Reason;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqLogOut
struct UBTTcpLink_Channel_rfReqLogOut_Params
{
	unsigned char                                      Reason;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckTencent_AASInfo
struct UBTTcpLink_Channel_rfAckTencent_AASInfo_Params
{
	int                                                UserID;                                                   // (Parm)
	unsigned char                                      IsAdult;                                                  // (Parm)
	unsigned char                                      IsQQAuth;                                                 // (Parm)
	int                                                AccumTimeSec;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSetCommunityOption
struct UBTTcpLink_Channel_rfAckSetCommunityOption_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrStr;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSetCommunityOption
struct UBTTcpLink_Channel_rfReqSetCommunityOption_Params
{
	int                                                Opt_Wispher;                                              // (Parm)
	int                                                Opt_GameInvite;                                           // (Parm)
	int                                                Opt_FriendInvite;                                         // (Parm)
	int                                                Opt_ClanInvite;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckCommunityOptionList
struct UBTTcpLink_Channel_rfAckCommunityOptionList_Params
{
	int                                                Opt_Wispher;                                              // (Parm)
	int                                                Opt_GameInvite;                                           // (Parm)
	int                                                Opt_FriendInvite;                                         // (Parm)
	int                                                Opt_ClanInvite;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqCommunityOptionList
struct UBTTcpLink_Channel_rfReqCommunityOptionList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyUpdateCharInfo_TitleMark
struct UBTTcpLink_Channel_rfAckNotifyUpdateCharInfo_TitleMark_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                TitleMarkID;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyUpdateCharInfo_LevelMark
struct UBTTcpLink_Channel_rfAckNotifyUpdateCharInfo_LevelMark_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                LevelMarkID;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetRankingInfoListEnd
struct UBTTcpLink_Channel_rfAckGetRankingInfoListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetRankingInfoList
struct UBTTcpLink_Channel_rfAckGetRankingInfoList_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      RankingType;                                              // (Parm)
	unsigned char                                      CommunityType;                                            // (Parm)
	TArray<struct FString>                             CharName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        CharLevel;                                                // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMarkPattern;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMarkBG;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMarkBL;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        Ranking_Accum;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        Ranking_Accum_Prev;                                       // (Parm, NeedCtorLink)
	TArray<int>                                        Ranking_Accum_Exp;                                        // (Parm, NeedCtorLink)
	TArray<int>                                        LevelMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TitleMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved1;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved3;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetRankingInfoListStart
struct UBTTcpLink_Channel_rfAckGetRankingInfoListStart_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      RankingType;                                              // (Parm)
	unsigned char                                      CommunityType;                                            // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGetRankingInfoList
struct UBTTcpLink_Channel_rfReqGetRankingInfoList_Params
{
	unsigned char                                      RankingType;                                              // (Parm)
	unsigned char                                      CommunityType;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckCharDetailInfo
struct UBTTcpLink_Channel_rfAckCharDetailInfo_Params
{
	int                                                MaxSerial;                                                // (Parm)
	int                                                MaxScore;                                                 // (Parm)
	int                                                MaxKill;                                                  // (Parm)
	int                                                MaxAssist;                                                // (Parm)
	int                                                Serial3;                                                  // (Parm)
	int                                                Serial5;                                                  // (Parm)
	int                                                Serial7;                                                  // (Parm)
	int                                                Serial10;                                                 // (Parm)
	int                                                Serial15;                                                 // (Parm)
	int                                                AR;                                                       // (Parm)
	int                                                SMG;                                                      // (Parm)
	int                                                SR;                                                       // (Parm)
	int                                                SW;                                                       // (Parm)
	int                                                Melee;                                                    // (Parm)
	int                                                Grenade;                                                  // (Parm)
	int                                                FlashBang;                                                // (Parm)
	int                                                Foot;                                                     // (Parm)
	int                                                AT4;                                                      // (Parm)
	int                                                MG;                                                       // (Parm)
	int                                                Fire;                                                     // (Parm)
	int                                                RPG7;                                                     // (Parm)
	int                                                TimeBomb;                                                 // (Parm)
	int                                                IcendiaryBomb;                                            // (Parm)
	int                                                ClusterBomb;                                              // (Parm)
	int                                                ByChopper;                                                // (Parm)
	int                                                Artillery;                                                // (Parm)
	int                                                KillChopper;                                              // (Parm)
	int                                                FirstKill;                                                // (Parm)
	int                                                LastKill;                                                 // (Parm)
	int                                                AllKill;                                                  // (Parm)
	int                                                Dominate;                                                 // (Parm)
	int                                                InstallBomb;                                              // (Parm)
	int                                                DefuseBomb;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqCharDetailInfo
struct UBTTcpLink_Channel_rfReqCharDetailInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqInGameRoomUserClanLevelChanged
struct UBTTcpLink_Channel_rfReqInGameRoomUserClanLevelChanged_Params
{
	int                                                UserID;                                                   // (Parm)
	int                                                ClanLevel;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqInGameRoomUserInfoChanged
struct UBTTcpLink_Channel_rfReqInGameRoomUserInfoChanged_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatchResultHistory
struct UBTTcpLink_Channel_rfAckClanMatchResultHistory_Params
{
	TArray<struct FBtrDouble>                          MatchDate;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsWin;                                                    // (Parm, NeedCtorLink)
	TArray<struct FString>                             EnemyClanname;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatchResultHistory
struct UBTTcpLink_Channel_rfReqClanMatchResultHistory_Params
{
	struct FString                                     ClanNm;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckDeleteMailAll
struct UBTTcpLink_Channel_rfAckDeleteMailAll_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      MailType;                                                 // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqDeleteMailAll
struct UBTTcpLink_Channel_rfReqDeleteMailAll_Params
{
	unsigned char                                      MailType;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_PublicWaitRoomChanged
struct UBTTcpLink_Channel_rfAckClanMatch_PublicWaitRoomChanged_Params
{
	int                                                WaitRoomIdx;                                              // (Parm)
	struct FString                                     RoomName;                                                 // (Parm, NeedCtorLink)
	int                                                MapNum;                                                   // (Parm)
	int                                                CurUserCount;                                             // (Parm)
	int                                                MaxUserCount;                                             // (Parm)
	unsigned char                                      Status;                                                   // (Parm)
	unsigned char                                      IsPublic;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckEventNotify
struct UBTTcpLink_Channel_rfAckEventNotify_Params
{
	int                                                Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqEventNotify
struct UBTTcpLink_Channel_rfReqEventNotify_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPaidItem_NotifyChangeClanname
struct UBTTcpLink_Channel_rfAckPaidItem_NotifyChangeClanname_Params
{
	struct FString                                     NewClanname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPaidItem_ChangeClanname
struct UBTTcpLink_Channel_rfAckPaidItem_ChangeClanname_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                RemainCount;                                              // (Parm)
	struct FString                                     NewClanname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqPaidItem_ChangeClanname
struct UBTTcpLink_Channel_rfReqPaidItem_ChangeClanname_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	struct FString                                     NewClanname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_EndPublicWaitRoomList
struct UBTTcpLink_Channel_rfAckClanMatch_EndPublicWaitRoomList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_PublicWaitRoomList
struct UBTTcpLink_Channel_rfAckClanMatch_PublicWaitRoomList_Params
{
	TArray<int>                                        WaitRoomIdx;                                              // (Parm, NeedCtorLink)
	TArray<struct FString>                             LeaderName;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             RoomName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        MapNum;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        CurUserCount;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        MaxUserCount;                                             // (Parm, NeedCtorLink)
	TArray<unsigned char>                              Status;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_StartPublicWaitRoomList
struct UBTTcpLink_Channel_rfAckClanMatch_StartPublicWaitRoomList_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_GetPublicWaitRoomList
struct UBTTcpLink_Channel_rfReqClanMatch_GetPublicWaitRoomList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckServerType
struct UBTTcpLink_Channel_rfAckServerType_Params
{
	unsigned char                                      Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqServerType
struct UBTTcpLink_Channel_rfReqServerType_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckServerShutdown
struct UBTTcpLink_Channel_rfAckServerShutdown_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqServerShutdown
struct UBTTcpLink_Channel_rfReqServerShutdown_Params
{
	struct FString                                     AuthKey;                                                  // (Parm, NeedCtorLink)
	int                                                SecondAfter;                                              // (Parm)
	struct FBtrDouble                                  ShutdownTime;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyEndTutorial
struct UBTTcpLink_Channel_rfAckNotifyEndTutorial_Params
{
	int                                                UserID;                                                   // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                Level;                                                    // (Parm)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanMarkPattern;                                          // (Parm)
	int                                                ClanMarkBG;                                               // (Parm)
	int                                                ClanMarkBL;                                               // (Parm)
	int                                                ClanGrade;                                                // (Parm)
	int                                                ClanWin;                                                  // (Parm)
	int                                                ClanLose;                                                 // (Parm)
	unsigned char                                      IsLookFor;                                                // (Parm)
	int                                                Result;                                                   // (Parm)
	int                                                ClanLevel;                                                // (Parm)
	int                                                LevelMarkID;                                              // (Parm)
	int                                                TitleMarkID;                                              // (Parm)
	int                                                Reserved1;                                                // (Parm)
	int                                                Reserved2;                                                // (Parm)
	int                                                Reserved3;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyEndTutorial
struct UBTTcpLink_Channel_rfReqNotifyEndTutorial_Params
{
	int                                                TutorialResultType;                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyStartTutorial
struct UBTTcpLink_Channel_rfAckNotifyStartTutorial_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyStartTutorial
struct UBTTcpLink_Channel_rfReqNotifyStartTutorial_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRoomUserPingInfo
struct UBTTcpLink_Channel_rfAckRoomUserPingInfo_Params
{
	TArray<int>                                        UnqueID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        Ping;                                                     // (Parm, NeedCtorLink)
	int                                                HostPriorityPoint;                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRoomUserPingInfo
struct UBTTcpLink_Channel_rfReqRoomUserPingInfo_Params
{
	TArray<int>                                        UnqueID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        Ping;                                                     // (Parm, NeedCtorLink)
	int                                                HostPriorityPoint;                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckMyEquipedQSlotList
struct UBTTcpLink_Channel_rfAckMyEquipedQSlotList_Params
{
	TArray<unsigned char>                              QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          MWUniqueID;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        MWItemID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        MWPartID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        MWPaintID;                                                // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          PistolUniqueID;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        PistolItemID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        PistolPartID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        PistolPaintID;                                            // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          TW1UniqueID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TWItemID1;                                                // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          TW2UniqueID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TWItemID2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Skill1ID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Skill2ID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Skill3ID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Skill4ID;                                                 // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqMyEquipedQSlotList
struct UBTTcpLink_Channel_rfReqMyEquipedQSlotList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckMyEquipedSkillList
struct UBTTcpLink_Channel_rfAckMyEquipedSkillList_Params
{
	TArray<int>                                        SkillIDs;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        SlotPositions;                                            // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqMyEquipedSkillList
struct UBTTcpLink_Channel_rfReqMyEquipedSkillList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckMyEquipedItemList
struct UBTTcpLink_Channel_rfAckMyEquipedItemList_Params
{
	TArray<int>                                        ItemIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        SlotPositions;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        AddPartsID;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        PaintID;                                                  // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UniqueID;                                                 // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqMyEquipedItemList
struct UBTTcpLink_Channel_rfReqMyEquipedItemList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetMyMailBoxState
struct UBTTcpLink_Channel_rfAckGetMyMailBoxState_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      IsFull;                                                   // (Parm)
	int                                                NewMailCount;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGetMyMailBoxState
struct UBTTcpLink_Channel_rfReqGetMyMailBoxState_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSetLookForClan
struct UBTTcpLink_Channel_rfAckSetLookForClan_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      IsLookingFor;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSetLookForClan
struct UBTTcpLink_Channel_rfReqSetLookForClan_Params
{
	unsigned char                                      IsLookingFor;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckExteriorRoomOwnerInfo
struct UBTTcpLink_Channel_rfAckExteriorRoomOwnerInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqExteriorRoomOwnerInfo
struct UBTTcpLink_Channel_rfReqExteriorRoomOwnerInfo_Params
{
	int                                                RoomNum;                                                  // (Parm)
	struct FString                                     OwnerName;                                                // (Parm, NeedCtorLink)
	struct FString                                     OwnerIP;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_SetWaitRoomPublic
struct UBTTcpLink_Channel_rfAckClanMatch_SetWaitRoomPublic_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      Set;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_SetWaitRoomPublic
struct UBTTcpLink_Channel_rfReqClanMatch_SetWaitRoomPublic_Params
{
	unsigned char                                      Set;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRemoveCheckTeamBalanceList
struct UBTTcpLink_Channel_rfReqRemoveCheckTeamBalanceList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPaidItem_NotifyChangeClanMark
struct UBTTcpLink_Channel_rfAckPaidItem_NotifyChangeClanMark_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                Pattern;                                                  // (Parm)
	int                                                BG;                                                       // (Parm)
	int                                                BL;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPaidItem_ChangeClanMark
struct UBTTcpLink_Channel_rfAckPaidItem_ChangeClanMark_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                StackCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqPaidItem_ChangeClanMark
struct UBTTcpLink_Channel_rfReqPaidItem_ChangeClanMark_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	unsigned char                                      IsPaid;                                                   // (Parm)
	int                                                Pattern;                                                  // (Parm)
	int                                                BG;                                                       // (Parm)
	int                                                BL;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPaidItem_ClanMarkDupCheck
struct UBTTcpLink_Channel_rfAckPaidItem_ClanMarkDupCheck_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqPaidItem_ClanMarkDupCheck
struct UBTTcpLink_Channel_rfReqPaidItem_ClanMarkDupCheck_Params
{
	unsigned char                                      IsPaid;                                                   // (Parm)
	int                                                Pattern;                                                  // (Parm)
	int                                                BG;                                                       // (Parm)
	int                                                BL;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPaidItem_RelayBroadcast
struct UBTTcpLink_Channel_rfAckPaidItem_RelayBroadcast_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPaidItem_BroadCast
struct UBTTcpLink_Channel_rfAckPaidItem_BroadCast_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                StackCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqPaidItem_BroadCast
struct UBTTcpLink_Channel_rfReqPaidItem_BroadCast_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                Command;                                                  // (Parm)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPaidItem_EraseRecord
struct UBTTcpLink_Channel_rfAckPaidItem_EraseRecord_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                Command;                                                  // (Parm)
	int                                                RemainCount;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqPaidItem_EraseRecord
struct UBTTcpLink_Channel_rfReqPaidItem_EraseRecord_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                Command;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPaidItem_ChangeCharname
struct UBTTcpLink_Channel_rfAckPaidItem_ChangeCharname_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                RemainCount;                                              // (Parm)
	struct FString                                     NewCharname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqPaidItem_ChangeCharname
struct UBTTcpLink_Channel_rfReqPaidItem_ChangeCharname_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	struct FString                                     NewCharname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRecvSystemMsg
struct UBTTcpLink_Channel_rfAckRecvSystemMsg_Params
{
	unsigned char                                      CommunityType;                                            // (Parm)
	struct FSystemMsgParam                             MsgInfo;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSendSystemMsg
struct UBTTcpLink_Channel_rfAckSendSystemMsg_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSendSystemMsg
struct UBTTcpLink_Channel_rfReqSendSystemMsg_Params
{
	unsigned char                                      RecvType;                                                 // (Parm)
	struct FString                                     SendCharName;                                             // (Parm, NeedCtorLink)
	struct FString                                     RecvCharname;                                             // (Parm, NeedCtorLink)
	struct FSystemMsgParam                             MsgInfo;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRandomBox_Use
struct UBTTcpLink_Channel_rfAckRandomBox_Use_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  RandomBoxItemIdx;                                         // (Parm)
	int                                                RandomBxoItemCount;                                       // (Parm)
	struct FBtrDouble                                  KeyItemIdx;                                               // (Parm)
	int                                                KeyItemRemainCount;                                       // (Parm)
	TArray<int>                                        ItemIDChoose;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        PartIDChoose;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        PeriodOnChoosenItem;                                      // (Parm, NeedCtorLink)
	TArray<int>                                        StackCountOnChoosenItem;                                  // (Parm, NeedCtorLink)
	TArray<unsigned char>                              bHave;                                                    // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          ItemIdx;                                                  // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UntilTime;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        StackCount;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRandomBox_Use
struct UBTTcpLink_Channel_rfReqRandomBox_Use_Params
{
	struct FBtrDouble                                  ItemIdx_RandomBox;                                        // (Parm)
	struct FBtrDouble                                  ItemIdx_Key;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChangedRoomTitle_FromGM
struct UBTTcpLink_Channel_rfAckChangedRoomTitle_FromGM_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                RoomNumber;                                               // (Parm)
	struct FString                                     NewRoomTitle;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChangeRoomTitle_GM
struct UBTTcpLink_Channel_rfAckChangeRoomTitle_GM_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                RoomNumber;                                               // (Parm)
	struct FString                                     NewRoomTitle;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChangeRoomTitle_GM
struct UBTTcpLink_Channel_rfReqChangeRoomTitle_GM_Params
{
	int                                                RoomNumber;                                               // (Parm)
	struct FString                                     NewRoomTitle;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGMLeaveRoom
struct UBTTcpLink_Channel_rfAckGMLeaveRoom_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                RoomNumber;                                               // (Parm)
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGMEnterRoom
struct UBTTcpLink_Channel_rfAckGMEnterRoom_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                RoomNumber;                                               // (Parm)
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckQuestGetAvailableEventList
struct UBTTcpLink_Channel_rfAckQuestGetAvailableEventList_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        QuestID;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqQuestGetAvailableEventList
struct UBTTcpLink_Channel_rfReqQuestGetAvailableEventList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckCharBlockInfo
struct UBTTcpLink_Channel_rfAckCharBlockInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FBtrDouble                                  ChatBlockStartTime;                                       // (Parm)
	struct FBtrDouble                                  ChatBlockEndTime;                                         // (Parm)
	TArray<struct FBtrDouble>                          BlockedItemIdx;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqCharBlockInfo
struct UBTTcpLink_Channel_rfReqCharBlockInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqIsPaidWebzenPCBang
struct UBTTcpLink_Channel_rfReqIsPaidWebzenPCBang_Params
{
	unsigned char                                      IsPaid;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_GetClanWaittingRoomInfo
struct UBTTcpLink_Channel_rfAckClanMatch_GetClanWaittingRoomInfo_Params
{
	int                                                WaitRoomIndex;                                            // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	struct FString                                     WaitRoomName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_GetClanWaittingRoomInfo
struct UBTTcpLink_Channel_rfReqClanMatch_GetClanWaittingRoomInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckReturnBotID
struct UBTTcpLink_Channel_rfAckReturnBotID_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqReturnBotID
struct UBTTcpLink_Channel_rfReqReturnBotID_Params
{
	TArray<int>                                        BotID;                                                    // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetBotID
struct UBTTcpLink_Channel_rfAckGetBotID_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      RequestedAFCount;                                         // (Parm)
	unsigned char                                      RequestedRSACount;                                        // (Parm)
	TArray<int>                                        AFBotID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        RSABotID;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGetBotID
struct UBTTcpLink_Channel_rfReqGetBotID_Params
{
	unsigned char                                      AFCount;                                                  // (Parm)
	unsigned char                                      RSACount;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_ChangeRoomSetting
struct UBTTcpLink_Channel_rfAckClanMatch_ChangeRoomSetting_Params
{
	int                                                WaitRoomIndex;                                            // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	unsigned char                                      IsPublic;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_ChangeRoomSetting
struct UBTTcpLink_Channel_rfReqClanMatch_ChangeRoomSetting_Params
{
	int                                                WaitRoomIndex;                                            // (Parm)
	TArray<int>                                        MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	unsigned char                                      IsPublic;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckParamCheckSum
struct UBTTcpLink_Channel_rfAckParamCheckSum_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqParamCheckSum
struct UBTTcpLink_Channel_rfReqParamCheckSum_Params
{
	struct FString                                     key;                                                      // (Parm, NeedCtorLink)
	struct FString                                     Value;                                                    // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckWebzenBillingUseStorageItem
struct UBTTcpLink_Channel_rfAckWebzenBillingUseStorageItem_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemExtra;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqWebzenBillingUseStorageItem
struct UBTTcpLink_Channel_rfReqWebzenBillingUseStorageItem_Params
{
	int                                                StorageSeq;                                               // (Parm)
	int                                                StorageItemSeq;                                           // (Parm)
	unsigned char                                      StorageItemType;                                          // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckWebzenBillingStorageListEnd
struct UBTTcpLink_Channel_rfAckWebzenBillingStorageListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckWebzenBillingStorageList
struct UBTTcpLink_Channel_rfAckWebzenBillingStorageList_Params
{
	TArray<int>                                        Seq;                                                      // (Parm, NeedCtorLink)
	TArray<int>                                        ItemSeq;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        GroupCode;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        ShareFlag;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        ProductSeq;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             CashName;                                                 // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          CashPoint;                                                // (Parm, NeedCtorLink)
	TArray<struct FString>                             SendAccountID;                                            // (Parm, NeedCtorLink)
	TArray<struct FString>                             SendMessage;                                              // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ItemType;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              RelationType;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        ProductType;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        PriceSeq;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckWebzenBillingStorageListStart
struct UBTTcpLink_Channel_rfAckWebzenBillingStorageListStart_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                TotalCount;                                               // (Parm)
	int                                                TotalPage;                                                // (Parm)
	int                                                CurPage;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqWebzenBillingStorageList
struct UBTTcpLink_Channel_rfReqWebzenBillingStorageList_Params
{
	int                                                Page;                                                     // (Parm)
	int                                                CountForPage;                                             // (Parm)
	unsigned char                                      Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGiftItemByWebzenCash
struct UBTTcpLink_Channel_rfAckGiftItemByWebzenCash_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                LeftProductCount;                                         // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGiftItemByWebzenCash
struct UBTTcpLink_Channel_rfReqGiftItemByWebzenCash_Params
{
	struct FString                                     ReceiverCharName;                                         // (Parm, NeedCtorLink)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	int                                                PackageProductSeq;                                        // (Parm)
	int                                                PriceSeq;                                                 // (Parm)
	int                                                ProductDisplaySeq;                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGiftItemByWebzenCashGP20
struct UBTTcpLink_Channel_rfReqGiftItemByWebzenCashGP20_Params
{
	struct FString                                     ReceiverCharName;                                         // (Parm, NeedCtorLink)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	int                                                ProductNo;                                                // (Parm)
	unsigned char                                      Cointype;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckBuyItemByWebzenCash
struct UBTTcpLink_Channel_rfAckBuyItemByWebzenCash_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqBuyItemByWebzenCash
struct UBTTcpLink_Channel_rfReqBuyItemByWebzenCash_Params
{
	int                                                PackageProductSeq;                                        // (Parm)
	int                                                ProductDisplaySeq;                                        // (Parm)
	int                                                PriceSeq;                                                 // (Parm)
	TArray<int>                                        ItemIDs;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	unsigned char                                      BuyOption1;                                               // (Parm)
	unsigned char                                      BuyOption2;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqBuyItemByWebzenCashGP20
struct UBTTcpLink_Channel_rfReqBuyItemByWebzenCashGP20_Params
{
	int                                                ProductNo;                                                // (Parm)
	unsigned char                                      Cointype;                                                 // (Parm)
	struct FBtrDouble                                  ItemID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckWebzenShopScriptVersion
struct UBTTcpLink_Channel_rfAckWebzenShopScriptVersion_Params
{
	int                                                Year;                                                     // (Parm)
	int                                                YearId;                                                   // (Parm)
	int                                                SalesZoneCode;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqWebzenShopScriptVersion
struct UBTTcpLink_Channel_rfReqWebzenShopScriptVersion_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckWebzenCash
struct UBTTcpLink_Channel_rfAckWebzenCash_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  PCoinCash;                                                // (Parm)
	struct FBtrDouble                                  CCoinCash;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqWebzenCash
struct UBTTcpLink_Channel_rfReqWebzenCash_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRegisteredPCBangInfo
struct UBTTcpLink_Channel_rfAckRegisteredPCBangInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      IsRegisteredPCBang;                                       // (Parm)
	unsigned char                                      IsMainPCBang;                                             // (Parm)
	struct FString                                     PCBangName;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRegisteredPCBangInfo
struct UBTTcpLink_Channel_rfReqRegisteredPCBangInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRegisterMainPCBang
struct UBTTcpLink_Channel_rfAckRegisterMainPCBang_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRegisterMainPCBang
struct UBTTcpLink_Channel_rfReqRegisterMainPCBang_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPCBangUserListEnd
struct UBTTcpLink_Channel_rfAckPCBangUserListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPCBangUserList
struct UBTTcpLink_Channel_rfAckPCBangUserList_Params
{
	TArray<struct FString>                             FriendName;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        CM_Pattern;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        CM_BG;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        CM_BL;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        Level;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        ClanGrade;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        ClanWin;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLose;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsLookForClan;                                            // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsCombat;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLevel;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        LevelMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TitleMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved1;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved3;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPCBangUserListStart
struct UBTTcpLink_Channel_rfAckPCBangUserListStart_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqPCBangUserList
struct UBTTcpLink_Channel_rfReqPCBangUserList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqDailyQuestNewAvailable
struct UBTTcpLink_Channel_rfReqDailyQuestNewAvailable_Params
{
	TArray<int>                                        ExpiredQuestID;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        NewQuestID;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqQuestNewAvailable
struct UBTTcpLink_Channel_rfReqQuestNewAvailable_Params
{
	TArray<int>                                        AchivedQuestID;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        NewQuestID;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsDailyQuest;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        ExpiredQuest;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckQuestUpdate
struct UBTTcpLink_Channel_rfAckQuestUpdate_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqQuestUpdate
struct UBTTcpLink_Channel_rfReqQuestUpdate_Params
{
	int                                                UniqueID;                                                 // (Parm)
	int                                                GameRoomNum;                                              // (Parm)
	TArray<int>                                        QuestID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        CountPrograss;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckQuestListEnd
struct UBTTcpLink_Channel_rfAckQuestListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckQuestList
struct UBTTcpLink_Channel_rfAckQuestList_Params
{
	TArray<int>                                        QuestID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        CountPrograss;                                            // (Parm, NeedCtorLink)
	TArray<unsigned char>                              QuestType;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsComplete;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckQuestListStart
struct UBTTcpLink_Channel_rfAckQuestListStart_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqQuestList
struct UBTTcpLink_Channel_rfReqQuestList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPermanentRoomInfo
struct UBTTcpLink_Channel_rfAckPermanentRoomInfo_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                ClanIdx;                                                  // (Parm)
	unsigned char                                      FixedGameMode;                                            // (Parm)
	unsigned char                                      FixedMaxUserCnt;                                          // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqPermanentRoomInfo
struct UBTTcpLink_Channel_rfReqPermanentRoomInfo_Params
{
	int                                                RoomNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_FoundMatch
struct UBTTcpLink_Channel_rfAckClanMatch_FoundMatch_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_FoundMatch
struct UBTTcpLink_Channel_rfReqClanMatch_FoundMatch_Params
{
	int                                                ChannelID;                                                // (Parm)
	int                                                RoomNumber;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_NotifyStartSearching
struct UBTTcpLink_Channel_rfAckClanMatch_NotifyStartSearching_Params
{
	int                                                ShouldWaitMore;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_StartSearching
struct UBTTcpLink_Channel_rfAckClanMatch_StartSearching_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                ShouldWaitMore;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_StartSearching
struct UBTTcpLink_Channel_rfReqClanMatch_StartSearching_Params
{
	int                                                RequestCount;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckLimitedListInChannel
struct UBTTcpLink_Channel_rfAckLimitedListInChannel_Params
{
	int                                                Result;                                                   // (Parm)
	TArray<int>                                        LimitedMapID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        LimitedModeID;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqLimitedListInChannel
struct UBTTcpLink_Channel_rfReqLimitedListInChannel_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRecvInviteGameRoomResult
struct UBTTcpLink_Channel_rfAckRecvInviteGameRoomResult_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRecvInviteGameRoom
struct UBTTcpLink_Channel_rfAckRecvInviteGameRoom_Params
{
	struct FString                                     RoomUniqueID;                                             // (Parm, NeedCtorLink)
	int                                                RoomNumber;                                               // (Parm)
	unsigned char                                      Answer;                                                   // (Parm)
	struct FString                                     InviteCharName;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvInviteGameRoom
struct UBTTcpLink_Channel_rfReqRecvInviteGameRoom_Params
{
	struct FString                                     InviteUserServerName;                                     // (Parm, NeedCtorLink)
	int                                                InviteUserServerID;                                       // (Parm)
	int                                                InviteUserChannelNumber;                                  // (Parm)
	struct FString                                     RoomUniqueID;                                             // (Parm, NeedCtorLink)
	int                                                RoomNumber;                                               // (Parm)
	struct FString                                     RoomName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      RoomState;                                                // (Parm)
	struct FString                                     MapName;                                                  // (Parm, NeedCtorLink)
	struct FString                                     OwnerName;                                                // (Parm, NeedCtorLink)
	unsigned char                                      GameMode;                                                 // (Parm)
	unsigned char                                      WeaponLimit;                                              // (Parm)
	unsigned char                                      IsTeamBalance;                                            // (Parm)
	struct FString                                     Password;                                                 // (Parm, NeedCtorLink)
	struct FString                                     InviteCharName;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckInviteGameRoom
struct UBTTcpLink_Channel_rfAckInviteGameRoom_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      Answer;                                                   // (Parm)
	struct FString                                     GuestCharName;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqInviteGameRoom
struct UBTTcpLink_Channel_rfReqInviteGameRoom_Params
{
	struct FString                                     GuestCharName;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_StopSearching
struct UBTTcpLink_Channel_rfAckClanMatch_StopSearching_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_StopSearching
struct UBTTcpLink_Channel_rfReqClanMatch_StopSearching_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_ChangeLeader
struct UBTTcpLink_Channel_rfAckClanMatch_ChangeLeader_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                NewLeader;                                                // (Parm)
	struct FString                                     NewLeaderName;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_ChangeLeader
struct UBTTcpLink_Channel_rfReqClanMatch_ChangeLeader_Params
{
	int                                                WaitRoomIdx;                                              // (Parm)
	int                                                NewLeaderID;                                              // (Parm)
	struct FString                                     NewLeaderName;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_WaittingTeamList
struct UBTTcpLink_Channel_rfAckClanMatch_WaittingTeamList_Params
{
	int                                                TtotlCount;                                               // (Parm)
	TArray<int>                                        Grade;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        Map;                                                      // (Parm, NeedCtorLink)
	TArray<int>                                        Versus;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_WaittingTeamList
struct UBTTcpLink_Channel_rfReqClanMatch_WaittingTeamList_Params
{
	int                                                StartIndex;                                               // (Parm)
	int                                                ReturnCount;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_Chat
struct UBTTcpLink_Channel_rfAckClanMatch_Chat_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_Chat
struct UBTTcpLink_Channel_rfReqClanMatch_Chat_Params
{
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_LeaveNotify
struct UBTTcpLink_Channel_rfAckClanMatch_LeaveNotify_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_Leave
struct UBTTcpLink_Channel_rfAckClanMatch_Leave_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_Leave
struct UBTTcpLink_Channel_rfReqClanMatch_Leave_Params
{
	int                                                WaittingID;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_MemberList
struct UBTTcpLink_Channel_rfAckClanMatch_MemberList_Params
{
	TArray<unsigned char>                              IsLeader;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMarkPA;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMarkBG;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMarkBL;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        Level;                                                    // (Parm, NeedCtorLink)
	TArray<struct FString>                             CharName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanGrade;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        ClanWin;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLose;                                                 // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLevel;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        LevelMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TitleMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved1;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved3;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_MemberList
struct UBTTcpLink_Channel_rfReqClanMatch_MemberList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_JoinNotify
struct UBTTcpLink_Channel_rfAckClanMatch_JoinNotify_Params
{
	unsigned char                                      IsLeader;                                                 // (Parm)
	int                                                ClanMarkPA;                                               // (Parm)
	int                                                ClanMarkBG;                                               // (Parm)
	int                                                ClanMarkBL;                                               // (Parm)
	int                                                Level;                                                    // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanGrade;                                                // (Parm)
	int                                                ClanWin;                                                  // (Parm)
	int                                                ClanLose;                                                 // (Parm)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanLevel;                                                // (Parm)
	int                                                LevelMarkID;                                              // (Parm)
	int                                                TitleMarkID;                                              // (Parm)
	int                                                Reserved1;                                                // (Parm)
	int                                                Reserved2;                                                // (Parm)
	int                                                Reserved3;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_Join
struct UBTTcpLink_Channel_rfAckClanMatch_Join_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_Join
struct UBTTcpLink_Channel_rfReqClanMatch_Join_Params
{
	int                                                WaittingID;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_InviteCrewResult
struct UBTTcpLink_Channel_rfReqClanMatch_InviteCrewResult_Params
{
	struct FString                                     Invitee;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_RecvInviteCrew
struct UBTTcpLink_Channel_rfAckClanMatch_RecvInviteCrew_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     Inviter;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_RecvInviteCrew
struct UBTTcpLink_Channel_rfReqClanMatch_RecvInviteCrew_Params
{
	struct FString                                     Inviter;                                                  // (Parm, NeedCtorLink)
	struct FString                                     ServerIP;                                                 // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	int                                                WaittingID;                                               // (Parm)
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	int                                                MapNum;                                                   // (Parm)
	int                                                InviteUserChannelNum;                                     // (Parm)
	struct FString                                     LeaderName;                                               // (Parm, NeedCtorLink)
	struct FString                                     RoomName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_InviteCrew
struct UBTTcpLink_Channel_rfAckClanMatch_InviteCrew_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_InviteCrew
struct UBTTcpLink_Channel_rfReqClanMatch_InviteCrew_Params
{
	struct FString                                     Invitee;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_NotifiyStartCombat
struct UBTTcpLink_Channel_rfAckClanMatch_NotifiyStartCombat_Params
{
	TArray<int>                                        MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_StartCombat
struct UBTTcpLink_Channel_rfAckClanMatch_StartCombat_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_StartCombat
struct UBTTcpLink_Channel_rfReqClanMatch_StartCombat_Params
{
	TArray<int>                                        MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_GetReady
struct UBTTcpLink_Channel_rfAckClanMatch_GetReady_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                RoomIndex;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_GetReady
struct UBTTcpLink_Channel_rfReqClanMatch_GetReady_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAutoChangedTeamUserList
struct UBTTcpLink_Channel_rfAckAutoChangedTeamUserList_Params
{
	TArray<int>                                        UserID;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        TeamNum;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetItemFromItemBox
struct UBTTcpLink_Channel_rfAckGetItemFromItemBox_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                ItemIDChoose;                                             // (Parm)
	int                                                PartIDChoose;                                             // (Parm)
	struct FBtrDouble                                  BoxItemIdx;                                               // (Parm)
	int                                                BxoItemCount;                                             // (Parm)
	unsigned char                                      bHave;                                                    // (Parm)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	struct FBtrDouble                                  UntilTime;                                                // (Parm)
	int                                                StackCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGetItemFromItemBox
struct UBTTcpLink_Channel_rfReqGetItemFromItemBox_Params
{
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	int                                                ItemID;                                                   // (Parm)
	int                                                ItemIDChoose;                                             // (Parm)
	int                                                PartIDChoose;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckItemListInItemBox
struct UBTTcpLink_Channel_rfAckItemListInItemBox_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	int                                                BoxItemID;                                                // (Parm)
	TArray<int>                                        ItemID;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        PartID;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      FromContent;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqItemListInItemBox
struct UBTTcpLink_Channel_rfReqItemListInItemBox_Params
{
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	int                                                BoxItemID;                                                // (Parm)
	unsigned char                                      FromContent;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvForceFailedClientLoading
struct UBTTcpLink_Channel_rfReqRecvForceFailedClientLoading_Params
{
	int                                                ErrCode;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckForceFailedClientLoading
struct UBTTcpLink_Channel_rfAckForceFailedClientLoading_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqForceFailedClientLoading
struct UBTTcpLink_Channel_rfReqForceFailedClientLoading_Params
{
	int                                                FailedUserID;                                             // (Parm)
	int                                                ErrCode;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckStartHolePunching
struct UBTTcpLink_Channel_rfAckStartHolePunching_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                GameType;                                                 // (Parm)
	int                                                ReqStartUserID;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqStartHolePunching
struct UBTTcpLink_Channel_rfReqStartHolePunching_Params
{
	int                                                GameType;                                                 // (Parm)
	int                                                ReqStartUserID;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyMyCharInfoToRoomUser
struct UBTTcpLink_Channel_rfAckNotifyMyCharInfoToRoomUser_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UID;                                                      // (Parm)
	struct FString                                     UserName;                                                 // (Parm, NeedCtorLink)
	int                                                Grade;                                                    // (Parm)
	int                                                TeamNum;                                                  // (Parm)
	unsigned char                                      Statue;                                                   // (Parm)
	unsigned char                                      IsHost;                                                   // (Parm)
	struct FString                                     UserIP;                                                   // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                CM_Pattern;                                               // (Parm)
	int                                                CM_BG;                                                    // (Parm)
	int                                                CM_BL;                                                    // (Parm)
	unsigned char                                      IsLookFor;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyMyCharInfoToRoomUser
struct UBTTcpLink_Channel_rfReqNotifyMyCharInfoToRoomUser_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyDurabilityZeroItem
struct UBTTcpLink_Channel_rfReqNotifyDurabilityZeroItem_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	TArray<struct FBtrDouble>                          ItemUniqueIDs;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        ItemIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ItemPartIDs;                                              // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ItemSlotPos;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChatWispherMyCommunity
struct UBTTcpLink_Channel_rfAckChatWispherMyCommunity_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChatWispherMyCommunity
struct UBTTcpLink_Channel_rfReqChatWispherMyCommunity_Params
{
	struct FString                                     SourceCharName;                                           // (Parm, NeedCtorLink)
	struct FString                                     SenderName;                                               // (Parm, NeedCtorLink)
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyDisconnectHostInLoading
struct UBTTcpLink_Channel_rfReqNotifyDisconnectHostInLoading_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                HostID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvForceDisconnected_FromGM
struct UBTTcpLink_Channel_rfReqRecvForceDisconnected_FromGM_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckForceDisconnectUser_GM
struct UBTTcpLink_Channel_rfAckForceDisconnectUser_GM_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqForceDisconnectUser_GM
struct UBTTcpLink_Channel_rfReqForceDisconnectUser_GM_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvNotice_FromGM
struct UBTTcpLink_Channel_rfReqRecvNotice_FromGM_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<struct FString>                             NoticeMsg;                                                // (Parm, NeedCtorLink)
	unsigned char                                      IsFromDB;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotice_GM
struct UBTTcpLink_Channel_rfAckNotice_GM_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      NoticeType;                                               // (Parm)
	int                                                ServerID;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                GameRoomNum;                                              // (Parm)
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotice_GM
struct UBTTcpLink_Channel_rfReqNotice_GM_Params
{
	unsigned char                                      NoticeType;                                               // (Parm)
	int                                                ServerID;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                GameRoomNum;                                              // (Parm)
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSpecificChannelUserInfo
struct UBTTcpLink_Channel_rfAckSpecificChannelUserInfo_Params
{
	int                                                UID;                                                      // (Parm)
	struct FString                                     UserID;                                                   // (Parm, NeedCtorLink)
	int                                                UserLevels;                                               // (Parm)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanPattern;                                              // (Parm)
	int                                                ClanBG;                                                   // (Parm)
	int                                                ClanBL;                                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                LevelMarkID;                                              // (Parm)
	int                                                TitleMarkID;                                              // (Parm)
	int                                                Reserved1;                                                // (Parm)
	int                                                Reserved2;                                                // (Parm)
	int                                                Reserved3;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSpecificChannelUserInfo
struct UBTTcpLink_Channel_rfReqSpecificChannelUserInfo_Params
{
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSpecificGameRoomInfo
struct UBTTcpLink_Channel_rfAckSpecificGameRoomInfo_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                GameNum;                                                  // (Parm)
	struct FString                                     Title;                                                    // (Parm, NeedCtorLink)
	struct FString                                     MapName;                                                  // (Parm, NeedCtorLink)
	int                                                MapNum;                                                   // (Parm)
	unsigned char                                      UserCount;                                                // (Parm)
	unsigned char                                      MaxCount;                                                 // (Parm)
	struct FString                                     GameModeName;                                             // (Parm, NeedCtorLink)
	int                                                ModeNum;                                                  // (Parm)
	unsigned char                                      WeaponLimit;                                              // (Parm)
	unsigned char                                      IsHardCore;                                               // (Parm)
	unsigned char                                      Status;                                                   // (Parm)
	struct FString                                     RoomOwnerIP;                                              // (Parm, NeedCtorLink)
	int                                                GameMinute;                                               // (Parm)
	struct FString                                     RoomOwnerName;                                            // (Parm, NeedCtorLink)
	unsigned char                                      IsSpecial;                                                // (Parm)
	unsigned char                                      IsPassword;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSpecificGameRoomInfo
struct UBTTcpLink_Channel_rfReqSpecificGameRoomInfo_Params
{
	int                                                RoomNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChannelUserListInGameRoom
struct UBTTcpLink_Channel_rfAckChannelUserListInGameRoom_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	int                                                Count;                                                    // (Parm)
	int                                                StartIndex;                                               // (Parm)
	TArray<int>                                        UID;                                                      // (Parm, NeedCtorLink)
	TArray<struct FString>                             CharName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        UserLevel;                                                // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanPattern;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ClanBG;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        ClanBL;                                                   // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsLookForClan;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLevel;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        LevelMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TitleMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved1;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved3;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChannelUserListInGameRoom
struct UBTTcpLink_Channel_rfReqChannelUserListInGameRoom_Params
{
	int                                                ChannelNum;                                               // (Parm)
	int                                                StartIndex;                                               // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvDeleteFriend
struct UBTTcpLink_Channel_rfReqRecvDeleteFriend_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     FromCharName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckDeleteFriend
struct UBTTcpLink_Channel_rfAckDeleteFriend_Params
{
	int                                                Result;                                                   // (Parm)
	TArray<struct FString>                             FailedCharname;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqDeleteFriend
struct UBTTcpLink_Channel_rfReqDeleteFriend_Params
{
	TArray<struct FString>                             DeleteCharName;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGameGuardAuthData
struct UBTTcpLink_Channel_rfAckGameGuardAuthData_Params
{
	int                                                AuthDataIndex;                                            // (Parm)
	int                                                AuthDataVal1;                                             // (Parm)
	int                                                AuthDataVal2;                                             // (Parm)
	int                                                AuthDataVal3;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGameGuardAuthData
struct UBTTcpLink_Channel_rfReqGameGuardAuthData_Params
{
	int                                                AuthDataIndex;                                            // (Parm)
	int                                                AuthDataVal1;                                             // (Parm)
	int                                                AuthDataVal2;                                             // (Parm)
	int                                                AuthDataVal3;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckCheckEquipedWeaponDurability
struct UBTTcpLink_Channel_rfAckCheckEquipedWeaponDurability_Params
{
	int                                                Result;                                                   // (Parm)
	TArray<struct FBtrDouble>                          ItemUniqueID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        ItemSlotNum;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqCheckEquipedWeaponDurability
struct UBTTcpLink_Channel_rfReqCheckEquipedWeaponDurability_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGamePlay_GetChopper
struct UBTTcpLink_Channel_rfReqGamePlay_GetChopper_Params
{
	int                                                GetChopperUID;                                            // (Parm)
	TArray<int>                                        GetChopperAssistUID;                                      // (Parm, NeedCtorLink)
	float                                              KillXCoord;                                               // (Parm)
	float                                              KillYCoord;                                               // (Parm)
	float                                              KillZCoord;                                               // (Parm)
	int                                                KillPos;                                                  // (Parm)
	int                                                KillWeaponID;                                             // (Parm)
	int                                                KillWeaponPartID;                                         // (Parm)
	int                                                KillRange;                                                // (Parm)
	int                                                KillDamage;                                               // (Parm)
	int                                                ChopperCallerID;                                          // (Parm)
	struct FString                                     ChopperCallerName;                                        // (Parm, NeedCtorLink)
	float                                              ChopperXCoord;                                            // (Parm)
	float                                              ChopperYCoord;                                            // (Parm)
	float                                              ChopperZCoord;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAcquirePromotionItems
struct UBTTcpLink_Channel_rfAckAcquirePromotionItems_Params
{
	int                                                UID;                                                      // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          ItemUniqueID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        ItemIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        PartIDs;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckIsAvailClanURL
struct UBTTcpLink_Channel_rfAckIsAvailClanURL_Params
{
	struct FString                                     ClanURL;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqIsAvailClanURL
struct UBTTcpLink_Channel_rfReqIsAvailClanURL_Params
{
	struct FString                                     ClanURL;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetIsHostBlocking
struct UBTTcpLink_Channel_rfAckGetIsHostBlocking_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      Blocking;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGetIsHostBlocking
struct UBTTcpLink_Channel_rfReqGetIsHostBlocking_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyHostBlocking
struct UBTTcpLink_Channel_rfAckNotifyHostBlocking_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      Blocking;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyHostBlocking
struct UBTTcpLink_Channel_rfReqNotifyHostBlocking_Params
{
	unsigned char                                      Blocking;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetHolePunchingResult
struct UBTTcpLink_Channel_rfAckGetHolePunchingResult_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      Phrase;                                                   // (Parm)
	int                                                InterventionUserID;                                       // (Parm)
	unsigned char                                      Intervention;                                             // (Parm)
	TArray<int>                                        FailedUserIDs;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGetHolePunchingResult
struct UBTTcpLink_Channel_rfReqGetHolePunchingResult_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyRecvDummyForHolePunching
struct UBTTcpLink_Channel_rfReqNotifyRecvDummyForHolePunching_Params
{
	int                                                ClientUserID;                                             // (Parm)
	unsigned char                                      Phrase;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGamePlay_ChangeWeaponSet
struct UBTTcpLink_Channel_rfReqGamePlay_ChangeWeaponSet_Params
{
	int                                                UID;                                                      // (Parm)
	int                                                SetNumber;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGamePlay_UpdateDomScore
struct UBTTcpLink_Channel_rfReqGamePlay_UpdateDomScore_Params
{
	int                                                AFScore;                                                  // (Parm)
	int                                                RSAScore;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyRelayServerAddr
struct UBTTcpLink_Channel_rfReqNotifyRelayServerAddr_Params
{
	struct FString                                     RelayIP;                                                  // (Parm, NeedCtorLink)
	int                                                RelayPort;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetUserHostPriorityPoint
struct UBTTcpLink_Channel_rfAckGetUserHostPriorityPoint_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                UserID;                                                   // (Parm)
	int                                                HostPriorityPoint;                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGetUserHostPriorityPoint
struct UBTTcpLink_Channel_rfReqGetUserHostPriorityPoint_Params
{
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqUpdateMyHostPriorityPoint
struct UBTTcpLink_Channel_rfReqUpdateMyHostPriorityPoint_Params
{
	int                                                HostPriorityPoint;                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqWriteServerLog
struct UBTTcpLink_Channel_rfReqWriteServerLog_Params
{
	unsigned char                                      Destination;                                              // (Parm)
	struct FString                                     LogMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGamePlay_SetRoundStartTime
struct UBTTcpLink_Channel_rfReqGamePlay_SetRoundStartTime_Params
{
	TArray<int>                                        UID;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGamePlay_SetGameStartTime
struct UBTTcpLink_Channel_rfReqGamePlay_SetGameStartTime_Params
{
	TArray<int>                                        UID;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvForceDisconnectUDPFromHost
struct UBTTcpLink_Channel_rfReqRecvForceDisconnectUDPFromHost_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckForceDisconnectUDPFromHost
struct UBTTcpLink_Channel_rfAckForceDisconnectUDPFromHost_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqForceDisconnectUDPFromHost
struct UBTTcpLink_Channel_rfReqForceDisconnectUDPFromHost_Params
{
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGamePlay_TakeAPoint
struct UBTTcpLink_Channel_rfReqGamePlay_TakeAPoint_Params
{
	TArray<int>                                        TakerUID;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      TakePos;                                                  // (Parm)
	TArray<float>                                      TakerXCoord;                                              // (Parm, NeedCtorLink)
	TArray<float>                                      TakerYCoord;                                              // (Parm, NeedCtorLink)
	TArray<float>                                      TakerZCoord;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TakerPos;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        TakerWeaponID;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        TakerWeaponPartID;                                        // (Parm, NeedCtorLink)
	TArray<int>                                        TakerRange;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyChangeRoomState
struct UBTTcpLink_Channel_rfReqNotifyChangeRoomState_Params
{
	unsigned char                                      RoomState;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGamePlay_DefuseBomb
struct UBTTcpLink_Channel_rfReqGamePlay_DefuseBomb_Params
{
	int                                                DefuserUID;                                               // (Parm)
	unsigned char                                      DefusePos;                                                // (Parm)
	float                                              DefuserXCoord;                                            // (Parm)
	float                                              DefuserYCoord;                                            // (Parm)
	float                                              DefuserZCoord;                                            // (Parm)
	int                                                DefuserPos;                                               // (Parm)
	int                                                DefuserWeaponID;                                          // (Parm)
	int                                                DefuserWeaponPartID;                                      // (Parm)
	int                                                DefuserRange;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGamePlay_InstallBomb
struct UBTTcpLink_Channel_rfReqGamePlay_InstallBomb_Params
{
	int                                                InstallerUID;                                             // (Parm)
	unsigned char                                      InstallPos;                                               // (Parm)
	float                                              InstallerXCoord;                                          // (Parm)
	float                                              InstallerYCoord;                                          // (Parm)
	float                                              InstallerZCoord;                                          // (Parm)
	int                                                InstallerPos;                                             // (Parm)
	int                                                InstallerWeaponID;                                        // (Parm)
	int                                                InstallerWeaponPartID;                                    // (Parm)
	int                                                InstallerRange;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckDBCharInfo
struct UBTTcpLink_Channel_rfAckDBCharInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                CM_Pattern;                                               // (Parm)
	int                                                CM_BG;                                                    // (Parm)
	int                                                CM_BL;                                                    // (Parm)
	struct FString                                     ClanPersonIntro;                                          // (Parm, NeedCtorLink)
	int                                                MainWeaponItemID;                                         // (Parm)
	int                                                MainWeaponPartID;                                         // (Parm)
	int                                                SubWeaponItemID;                                          // (Parm)
	int                                                SubWeaponPartID;                                          // (Parm)
	int                                                AFSpecialCostumeItemID;                                   // (Parm)
	int                                                RSASpecialCostumeItemID;                                  // (Parm)
	struct FCharInfo                                   stCharInfo;                                               // (Parm)
	int                                                ClanLevel;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqDBCharInfo
struct UBTTcpLink_Channel_rfReqDBCharInfo_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqForceNatTypeSetting
struct UBTTcpLink_Channel_rfReqForceNatTypeSetting_Params
{
	int                                                NatType;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetServerTime
struct UBTTcpLink_Channel_rfAckGetServerTime_Params
{
	struct FBtrDouble                                  ServerTime;                                               // (Parm)
	struct FString                                     ClientIP;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGetServerTime
struct UBTTcpLink_Channel_rfReqGetServerTime_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqLogEndEachRound
struct UBTTcpLink_Channel_rfReqLogEndEachRound_Params
{
	int                                                StartCnt;                                                 // (Parm)
	int                                                EndCnt;                                                   // (Parm)
	int                                                RoundEndType;                                             // (Parm)
	int                                                RoundEndTime;                                             // (Parm)
	unsigned char                                      VTeam;                                                    // (Parm)
	unsigned char                                      VTeamAD;                                                  // (Parm)
	int                                                AFScore;                                                  // (Parm)
	int                                                RSAScore;                                                 // (Parm)
	int                                                Round;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqLogGetScore
struct UBTTcpLink_Channel_rfReqLogGetScore_Params
{
	struct FKillDeathLog                               KillDeathLogParam;                                        // (Parm)
	TArray<int>                                        AssistUIDs;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              AssistScores;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAuctionTradeHistory
struct UBTTcpLink_Channel_rfAckAuctionTradeHistory_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                ItemID;                                                   // (Parm)
	int                                                PartID;                                                   // (Parm)
	TArray<struct FString>                             SellerCharNm;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        DamageDegree;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        Price;                                                    // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAuctionTradeHistory
struct UBTTcpLink_Channel_rfReqAuctionTradeHistory_Params
{
	int                                                ItemID;                                                   // (Parm)
	int                                                PartID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSendGift
struct UBTTcpLink_Channel_rfAckSendGift_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                PointRemain;                                              // (Parm)
	int                                                CashRemain;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSendGift
struct UBTTcpLink_Channel_rfReqSendGift_Params
{
	int                                                ItemID;                                                   // (Parm)
	struct FString                                     RecvCharname;                                             // (Parm, NeedCtorLink)
	struct FString                                     RecvMessage;                                              // (Parm, NeedCtorLink)
	unsigned char                                      BuyOption1;                                               // (Parm)
	unsigned char                                      BuyOption2;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetAttachedItemFromMemo
struct UBTTcpLink_Channel_rfAckGetAttachedItemFromMemo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                ItemID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGetAttachedItemFromMemo
struct UBTTcpLink_Channel_rfReqGetAttachedItemFromMemo_Params
{
	int                                                UserID;                                                   // (Parm)
	int                                                MemoIdx;                                                  // (Parm)
	int                                                ItemID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyNewClanMember
struct UBTTcpLink_Channel_rfAckNotifyNewClanMember_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChatClan
struct UBTTcpLink_Channel_rfAckChatClan_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChatClan
struct UBTTcpLink_Channel_rfReqChatClan_Params
{
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckTestDouble
struct UBTTcpLink_Channel_rfAckTestDouble_Params
{
	struct FBtrDouble                                  vDouble;                                                  // (Parm)
	TArray<struct FBtrDouble>                          vDoubles;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqTestDouble
struct UBTTcpLink_Channel_rfReqTestDouble_Params
{
	struct FBtrDouble                                  vDouble;                                                  // (Parm)
	TArray<struct FBtrDouble>                          vDoubles;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyLoadingState
struct UBTTcpLink_Channel_rfAckNotifyLoadingState_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                UserID;                                                   // (Parm)
	unsigned char                                      LoadingState;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyLoadingState
struct UBTTcpLink_Channel_rfReqNotifyLoadingState_Params
{
	unsigned char                                      LoadingState;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckFailedStartGame
struct UBTTcpLink_Channel_rfAckFailedStartGame_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      IsHost;                                                   // (Parm)
	int                                                FailedUserID;                                             // (Parm)
	int                                                LoadingStep;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqFailedStartGame
struct UBTTcpLink_Channel_rfReqFailedStartGame_Params
{
	int                                                LoadingStep;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSuccessStartGame
struct UBTTcpLink_Channel_rfAckSuccessStartGame_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      IsHost;                                                   // (Parm)
	struct FString                                     HostIP;                                                   // (Parm, NeedCtorLink)
	int                                                HostPort;                                                 // (Parm)
	int                                                LoadingStep;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSuccessStartGame
struct UBTTcpLink_Channel_rfReqSuccessStartGame_Params
{
	int                                                LoadingStep;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanCharPersonelIntro
struct UBTTcpLink_Channel_rfAckClanCharPersonelIntro_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     PersonelIntro;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanCharPersonelIntro
struct UBTTcpLink_Channel_rfReqClanCharPersonelIntro_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanPersonelIntro
struct UBTTcpLink_Channel_rfAckClanPersonelIntro_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanPersonelIntro
struct UBTTcpLink_Channel_rfReqClanPersonelIntro_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     PersonelIntro;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanChangeInfo
struct UBTTcpLink_Channel_rfAckClanChangeInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanChangeInfo
struct UBTTcpLink_Channel_rfReqClanChangeInfo_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      IsRecruit;                                                // (Parm)
	unsigned char                                      Region;                                                   // (Parm)
	struct FString                                     Keyword;                                                  // (Parm, NeedCtorLink)
	struct FString                                     ClanIntro;                                                // (Parm, NeedCtorLink)
	struct FString                                     Notice;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanClose
struct UBTTcpLink_Channel_rfAckClanClose_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanClose
struct UBTTcpLink_Channel_rfReqClanClose_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyClanSecession
struct UBTTcpLink_Channel_rfAckNotifyClanSecession_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanSecession
struct UBTTcpLink_Channel_rfAckClanSecession_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanSecession
struct UBTTcpLink_Channel_rfReqClanSecession_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanNews
struct UBTTcpLink_Channel_rfAckClanNews_Params
{
	TArray<struct FString>                             IssueDate;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IssueType;                                                // (Parm, NeedCtorLink)
	TArray<struct FString>                             IssuedClanMember;                                         // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanNews
struct UBTTcpLink_Channel_rfReqClanNews_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyAdjustClanMemberGrade
struct UBTTcpLink_Channel_rfAckNotifyAdjustClanMemberGrade_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      CharGrade;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAdjustClanMemberGrade
struct UBTTcpLink_Channel_rfAckAdjustClanMemberGrade_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      CharGrade;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAdjustClanMemberGrade
struct UBTTcpLink_Channel_rfReqAdjustClanMemberGrade_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      CharGrade;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanUserListEnd
struct UBTTcpLink_Channel_rfAckClanUserListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanUserList
struct UBTTcpLink_Channel_rfAckClanUserList_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        Level;                                                    // (Parm, NeedCtorLink)
	TArray<struct FString>                             CharName;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ClanGrade;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        ClanWinCnt;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLoseCnt;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        LevelMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TitleMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        DudeId;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanUserListStart
struct UBTTcpLink_Channel_rfAckClanUserListStart_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanUserList
struct UBTTcpLink_Channel_rfReqClanUserList_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSearchClan
struct UBTTcpLink_Channel_rfAckSearchClan_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                TotalPage;                                                // (Parm)
	TArray<int>                                        ClanMarkPattern;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMarkBG;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ClanMarkBL;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanMaster;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMember;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        ClanMemberMax;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        ClanCreateDate;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        ClanWin;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLose;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanDraw;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanRank;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ClanRecruit;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLevel;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSerachClan
struct UBTTcpLink_Channel_rfReqSerachClan_Params
{
	unsigned char                                      SearchType;                                               // (Parm)
	struct FString                                     Keyword;                                                  // (Parm, NeedCtorLink)
	unsigned char                                      ClanStatus;                                               // (Parm)
	unsigned char                                      ClanRegion;                                               // (Parm)
	int                                                ReqPage;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckJoinClanResult
struct UBTTcpLink_Channel_rfAckJoinClanResult_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      Permit;                                                   // (Parm)
	struct FString                                     PermitCharName;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRecvJoinClanResult
struct UBTTcpLink_Channel_rfAckRecvJoinClanResult_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRecvJoinClan
struct UBTTcpLink_Channel_rfAckRecvJoinClan_Params
{
	int                                                UserIdx;                                                  // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ReqMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      Permit;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvJoinClan
struct UBTTcpLink_Channel_rfReqRecvJoinClan_Params
{
	int                                                UserIdx;                                                  // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckJoinClan
struct UBTTcpLink_Channel_rfAckJoinClan_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     SpecificCharName;                                         // (Parm, NeedCtorLink)
	struct FString                                     RealRecvCharName;                                         // (Parm, NeedCtorLink)
	unsigned char                                      RealRecvCharClanGrade;                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqJoinClan
struct UBTTcpLink_Channel_rfReqJoinClan_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ClanManagerName;                                          // (Parm, NeedCtorLink)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckInviteClanResult
struct UBTTcpLink_Channel_rfAckInviteClanResult_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      Permit;                                                   // (Parm)
	struct FString                                     ClanNm;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRecvClanInviteResult
struct UBTTcpLink_Channel_rfAckRecvClanInviteResult_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRecvClanInvite
struct UBTTcpLink_Channel_rfAckRecvClanInvite_Params
{
	int                                                InviterUserDBID;                                          // (Parm)
	struct FString                                     InviterCharname;                                          // (Parm, NeedCtorLink)
	struct FString                                     InviterMsg;                                               // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      Permit;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvClanInvite
struct UBTTcpLink_Channel_rfReqRecvClanInvite_Params
{
	int                                                InviterUserDBID;                                          // (Parm)
	struct FString                                     InviterCharname;                                          // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     InviteMsg;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckInviteClan
struct UBTTcpLink_Channel_rfAckInviteClan_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqInviteClan
struct UBTTcpLink_Channel_rfReqInviteClan_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     InviteMsg;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanInfo
struct UBTTcpLink_Channel_rfAckClanInfo_Params
{
	struct FClanInfo                                   stClanInfo;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanInfo
struct UBTTcpLink_Channel_rfReqClanInfo_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckCreateClan
struct UBTTcpLink_Channel_rfAckCreateClan_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                StackCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqCreateClan
struct UBTTcpLink_Channel_rfReqCreateClan_Params
{
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ClanURL;                                                  // (Parm, NeedCtorLink)
	struct FString                                     ClanIntro;                                                // (Parm, NeedCtorLink)
	struct FString                                     ClanKeyword;                                              // (Parm, NeedCtorLink)
	unsigned char                                      ClanRegion;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckDupCheckClanName
struct UBTTcpLink_Channel_rfAckDupCheckClanName_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqDupCheckClanName
struct UBTTcpLink_Channel_rfReqDupCheckClanName_Params
{
	struct FString                                     ClanNam;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSellShopItemInfo
struct UBTTcpLink_Channel_rfAckSellShopItemInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  UniqueItemID;                                             // (Parm)
	int                                                SellPoint;                                                // (Parm)
	int                                                CurPoint;                                                 // (Parm)
	int                                                AfterPoint;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSellShopItemInfo
struct UBTTcpLink_Channel_rfReqSellShopItemInfo_Params
{
	struct FBtrDouble                                  UniqueItemID;                                             // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGameOverEnd
struct UBTTcpLink_Channel_rfAckGameOverEnd_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGameOverEnd
struct UBTTcpLink_Channel_rfReqGameOverEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAuctionItemListCount
struct UBTTcpLink_Channel_rfAckAuctionItemListCount_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      Section;                                                  // (Parm)
	unsigned char                                      Classfy;                                                  // (Parm)
	int                                                ItemType;                                                 // (Parm)
	int                                                ItemGrade;                                                // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAuctionItemListCount
struct UBTTcpLink_Channel_rfReqAuctionItemListCount_Params
{
	unsigned char                                      Section;                                                  // (Parm)
	unsigned char                                      Classfy;                                                  // (Parm)
	int                                                ItemType;                                                 // (Parm)
	int                                                ItemGrade;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckServerTime
struct UBTTcpLink_Channel_rfAckServerTime_Params
{
	int                                                Time;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqServerTime
struct UBTTcpLink_Channel_rfReqServerTime_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckEntryQSlotIDList
struct UBTTcpLink_Channel_rfAckEntryQSlotIDList_Params
{
	int                                                UserNum;                                                  // (Parm)
	TArray<unsigned char>                              QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        MWItemID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        MWPartID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        MWPaintID;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        PistolItemID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        PistolPartID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        PistolPaintID;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        TWItemID1;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        TWItemID2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Skill1ID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Skill2ID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Skill3ID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Skill4ID;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqEntryQSlotIDList
struct UBTTcpLink_Channel_rfReqEntryQSlotIDList_Params
{
	int                                                UserNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckEntryQSlotUniqueIDList
struct UBTTcpLink_Channel_rfAckEntryQSlotUniqueIDList_Params
{
	int                                                UserNum;                                                  // (Parm)
	TArray<unsigned char>                              QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          MWUniqueID;                                               // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          PistolUniqueID;                                           // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          TW1UniqueID;                                              // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          TW2UniqueID;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqEntryQSlotUniqueIDList
struct UBTTcpLink_Channel_rfReqEntryQSlotUniqueIDList_Params
{
	int                                                UserNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAuctionBidding
struct UBTTcpLink_Channel_rfAckAuctionBidding_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                PointRemain;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAuctionBidding
struct UBTTcpLink_Channel_rfReqAuctionBidding_Params
{
	int                                                UniqueID;                                                 // (Parm)
	int                                                BiddingPrice;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAuctionInstantlyBuying
struct UBTTcpLink_Channel_rfAckAuctionInstantlyBuying_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                PointRemain;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAuctionInstantlyBuying
struct UBTTcpLink_Channel_rfReqAuctionInstantlyBuying_Params
{
	int                                                UniqueID;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAuctionItemListEnd
struct UBTTcpLink_Channel_rfAckAuctionItemListEnd_Params
{
	unsigned char                                      Section;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAuctionItemList
struct UBTTcpLink_Channel_rfAckAuctionItemList_Params
{
	unsigned char                                      Section;                                                  // (Parm)
	TArray<int>                                        UniqueIDs;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        ItemIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        AddPartsIDs;                                              // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UntilTimes;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        BiddingPrices;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        InstantlyByuingPrices;                                    // (Parm, NeedCtorLink)
	TArray<int>                                        ItemDamageds;                                             // (Parm, NeedCtorLink)
	TArray<struct FString>                             HighestBidderNames;                                       // (Parm, NeedCtorLink)
	TArray<struct FString>                             SellerNames;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ItemCount;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAuctionItemListStart
struct UBTTcpLink_Channel_rfAckAuctionItemListStart_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      Section;                                                  // (Parm)
	int                                                PageNum;                                                  // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAuctionItemList
struct UBTTcpLink_Channel_rfReqAuctionItemList_Params
{
	unsigned char                                      Section;                                                  // (Parm)
	struct FString                                     Keyword;                                                  // (Parm, NeedCtorLink)
	int                                                ItemRank;                                                 // (Parm)
	unsigned char                                      ItemClassfy;                                              // (Parm)
	unsigned char                                      IsAvailable;                                              // (Parm)
	int                                                PageNum;                                                  // (Parm)
	int                                                Count;                                                    // (Parm)
	int                                                SortOpt;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAuctionMyItemCancel
struct UBTTcpLink_Channel_rfAckAuctionMyItemCancel_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAuctionMyItemCancel
struct UBTTcpLink_Channel_rfReqAuctionMyItemCancel_Params
{
	int                                                UniqueID;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAuctionMyItemRegister
struct UBTTcpLink_Channel_rfAckAuctionMyItemRegister_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                BeginPrice;                                               // (Parm)
	int                                                BuyPrice;                                                 // (Parm)
	int                                                GuarantyPoint;                                            // (Parm)
	int                                                PointRemain;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAuctionMyItemRegister
struct UBTTcpLink_Channel_rfReqAuctionMyItemRegister_Params
{
	struct FBtrDouble                                  UniqueID;                                                 // (Parm)
	int                                                ItemCount;                                                // (Parm)
	int                                                BeginPrice;                                               // (Parm)
	int                                                PeriodHour;                                               // (Parm)
	int                                                InstantlyBuyingPrice;                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckMyMoney
struct UBTTcpLink_Channel_rfAckMyMoney_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                Point;                                                    // (Parm)
	int                                                Cash;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqMyMoney
struct UBTTcpLink_Channel_rfReqMyMoney_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckUpdateQSlot
struct UBTTcpLink_Channel_rfAckUpdateQSlot_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqUpdateQSlot
struct UBTTcpLink_Channel_rfReqUpdateQSlot_Params
{
	int                                                QSlotID;                                                  // (Parm)
	struct FString                                     QSlotName;                                                // (Parm, NeedCtorLink)
	struct FBtrDouble                                  MWItemID;                                                 // (Parm)
	struct FBtrDouble                                  PistolItemID;                                             // (Parm)
	struct FBtrDouble                                  TWItemID1;                                                // (Parm)
	struct FBtrDouble                                  TWItemID2;                                                // (Parm)
	int                                                Skill1;                                                   // (Parm)
	int                                                Skill2;                                                   // (Parm)
	int                                                Skill3;                                                   // (Parm)
	int                                                Skill4;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckQSlotList
struct UBTTcpLink_Channel_rfAckQSlotList_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        QSlotID;                                                  // (Parm, NeedCtorLink)
	TArray<struct FString>                             QSlotName;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          MWItemID;                                                 // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          PistolItemID;                                             // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          TWItemID1;                                                // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          TWItemID2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Skill1;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        Skill2;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        Skill3;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        Skill4;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqQSlotList
struct UBTTcpLink_Channel_rfReqQSlotList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRepairItem
struct UBTTcpLink_Channel_rfAckRepairItem_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UniqueItemID;                                             // (Parm, NeedCtorLink)
	int                                                RepairCost;                                               // (Parm)
	TArray<int>                                        DamageDegree;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRepairItem
struct UBTTcpLink_Channel_rfReqRepairItem_Params
{
	TArray<struct FBtrDouble>                          UniqueItemID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRepairCost
struct UBTTcpLink_Channel_rfAckRepairCost_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UniqueItemID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        RepairCost;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRepairCost
struct UBTTcpLink_Channel_rfReqRepairCost_Params
{
	TArray<struct FBtrDouble>                          UniqueItemID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckUpdateWeaponDurability
struct UBTTcpLink_Channel_rfAckUpdateWeaponDurability_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UniqueItemID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        Durability;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsDestroy;                                                // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          FailedWeaponUniqueID;                                     // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqUpdateWeaponDurability
struct UBTTcpLink_Channel_rfReqUpdateWeaponDurability_Params
{
	int                                                TotalPlayTime;                                            // (Parm)
	TArray<int>                                        OwnerID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        Number;                                                   // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UniqueItemID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        UsingSec;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        UsingRoundInSD;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckModifyWeapon
struct UBTTcpLink_Channel_rfAckModifyWeapon_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  UniqueID;                                                 // (Parm)
	int                                                AddPartID;                                                // (Parm)
	int                                                PaintID;                                                  // (Parm)
	int                                                Point;                                                    // (Parm)
	int                                                Cash;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqModifyWeapon
struct UBTTcpLink_Channel_rfReqModifyWeapon_Params
{
	struct FBtrDouble                                  UniqueID;                                                 // (Parm)
	int                                                AddPartID;                                                // (Parm)
	int                                                PaintID;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSellShopItem
struct UBTTcpLink_Channel_rfAckSellShopItem_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                PointRemain;                                              // (Parm)
	int                                                CashRemain;                                               // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSellShopItem
struct UBTTcpLink_Channel_rfReqSellShopItem_Params
{
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckBuyShopItem
struct UBTTcpLink_Channel_rfAckBuyShopItem_Params
{
	int                                                ItemCount;                                                // (Parm)
	TArray<int>                                        Result;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        BoughtItemTypeID;                                         // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          BoughtItemUniqueID;                                       // (Parm, NeedCtorLink)
	TArray<int>                                        BoughtPartID;                                             // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          BoughtUntilTIme;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        BoughtStackCnt;                                           // (Parm, NeedCtorLink)
	int                                                PointRemain;                                              // (Parm)
	int                                                CashRemain;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqBuyShopItem
struct UBTTcpLink_Channel_rfReqBuyShopItem_Params
{
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	unsigned char                                      BuyOption1;                                               // (Parm)
	unsigned char                                      BuyOption2;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckShopItemListEnd
struct UBTTcpLink_Channel_rfAckShopItemListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckShopItemList
struct UBTTcpLink_Channel_rfAckShopItemList_Params
{
	TArray<int>                                        ItemID;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckShopItemListStart
struct UBTTcpLink_Channel_rfAckShopItemListStart_Params
{
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqShopItemList
struct UBTTcpLink_Channel_rfReqShopItemList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckForceGameOver
struct UBTTcpLink_Channel_rfAckForceGameOver_Params
{
	int                                                UserID;                                                   // (Parm)
	int                                                GameRoomNumber;                                           // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqForceGameOver
struct UBTTcpLink_Channel_rfReqForceGameOver_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGiveSkill
struct UBTTcpLink_Channel_rfAckGiveSkill_Params
{
	int                                                SkillID;                                                  // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGiveSkill
struct UBTTcpLink_Channel_rfReqGiveSkill_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyExpiredItemIDs
struct UBTTcpLink_Channel_rfAckNotifyExpiredItemIDs_Params
{
	int                                                UserID;                                                   // (Parm)
	TArray<struct FBtrDouble>                          ExpiredItemUniqueIDs;                                     // (Parm, NeedCtorLink)
	TArray<int>                                        ExpiredItemIDs;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        ExpiredItemPartIDs;                                       // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ExpiredItemSlotPos;                                       // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyExpiredItemIDs
struct UBTTcpLink_Channel_rfReqNotifyExpiredItemIDs_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyExpiredSkillIDs
struct UBTTcpLink_Channel_rfAckNotifyExpiredSkillIDs_Params
{
	int                                                UserID;                                                   // (Parm)
	TArray<struct FBtrDouble>                          ExpiredSkillUniqueIDs;                                    // (Parm, NeedCtorLink)
	TArray<int>                                        ExpiredSkillIDs;                                          // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ExpiredSkillSlotPositions;                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyExpiredSkillIDs
struct UBTTcpLink_Channel_rfReqNotifyExpiredSkillIDs_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyChangedSkillState
struct UBTTcpLink_Channel_rfAckNotifyChangedSkillState_Params
{
	int                                                UserID;                                                   // (Parm)
	TArray<int>                                        SkillIDs;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              NewStates;                                                // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyChangedSkillState
struct UBTTcpLink_Channel_rfReqNotifyChangedSkillState_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyChangedItemState
struct UBTTcpLink_Channel_rfAckNotifyChangedItemState_Params
{
	int                                                UserID;                                                   // (Parm)
	TArray<int>                                        ItemIDs;                                                  // (Parm, NeedCtorLink)
	TArray<unsigned char>                              NewStates;                                                // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyChangedItemState
struct UBTTcpLink_Channel_rfReqNotifyChangedItemState_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckConfirmSkillChanged
struct UBTTcpLink_Channel_rfAckConfirmSkillChanged_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqConfirmSkillChanged
struct UBTTcpLink_Channel_rfReqConfirmSkillChanged_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckEquipSkill
struct UBTTcpLink_Channel_rfAckEquipSkill_Params
{
	int                                                ChangedNewSkillID;                                        // (Parm)
	int                                                ChangedNewSkillUniqueID;                                  // (Parm)
	unsigned char                                      ChangedNewSlotPosition;                                   // (Parm)
	int                                                ChangedOldSkillID;                                        // (Parm)
	int                                                ChangedOldSkillUniqueID;                                  // (Parm)
	unsigned char                                      ChangedOldSlotPosition;                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqEquipSkill
struct UBTTcpLink_Channel_rfReqEquipSkill_Params
{
	int                                                SkillID;                                                  // (Parm)
	int                                                SkillUniqueID;                                            // (Parm)
	unsigned char                                      NewSlotPosition;                                          // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckUserSkillListEnd
struct UBTTcpLink_Channel_rfAckUserSkillListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckUserSkillList
struct UBTTcpLink_Channel_rfAckUserSkillList_Params
{
	TArray<int>                                        UniqueSkillID;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        SkillID;                                                  // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UntilTime;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              SlotPosition;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckUserSkillListStart
struct UBTTcpLink_Channel_rfAckUserSkillListStart_Params
{
	int                                                Count;                                                    // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqUserSkillList
struct UBTTcpLink_Channel_rfReqUserSkillList_Params
{
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckDelMemo
struct UBTTcpLink_Channel_rfAckDelMemo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        FailedMemoID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqDelMemo
struct UBTTcpLink_Channel_rfReqDelMemo_Params
{
	TArray<int>                                        MemoIdx;                                                  // (Parm, NeedCtorLink)
	unsigned char                                      Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckReadMemo
struct UBTTcpLink_Channel_rfAckReadMemo_Params
{
	struct FString                                     cnameFrom;                                                // (Parm, NeedCtorLink)
	struct FString                                     Text;                                                     // (Parm, NeedCtorLink)
	struct FString                                     dateRecv;                                                 // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemUID;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqReadMemo
struct UBTTcpLink_Channel_rfReqReadMemo_Params
{
	int                                                MemoIdx;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckEndMemoList
struct UBTTcpLink_Channel_rfAckEndMemoList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckMemoList
struct UBTTcpLink_Channel_rfAckMemoList_Params
{
	TArray<int>                                        MemoIdx;                                                  // (Parm, NeedCtorLink)
	TArray<struct FString>                             cnameFrom;                                                // (Parm, NeedCtorLink)
	TArray<struct FString>                             dateRecv;                                                 // (Parm, NeedCtorLink)
	TArray<struct FString>                             Text;                                                     // (Parm, NeedCtorLink)
	TArray<unsigned char>                              Status;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        UntilExpire;                                              // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          ItemUID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ItemID;                                                   // (Parm, NeedCtorLink)
	TArray<unsigned char>                              MsgType;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ItemPartID;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckStartMemoList
struct UBTTcpLink_Channel_rfAckStartMemoList_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      Type;                                                     // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqMemoList
struct UBTTcpLink_Channel_rfReqMemoList_Params
{
	unsigned char                                      Type;                                                     // (Parm)
	unsigned char                                      MemoType;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvMemo
struct UBTTcpLink_Channel_rfReqRecvMemo_Params
{
	struct FString                                     cnameFrom;                                                // (Parm, NeedCtorLink)
	unsigned char                                      MemoType;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSendMemo
struct UBTTcpLink_Channel_rfAckSendMemo_Params
{
	TArray<struct FString>                             CnamesToFail;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        ResultArray;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSendMemo
struct UBTTcpLink_Channel_rfReqSendMemo_Params
{
	TArray<struct FString>                             cnames;                                                   // (Parm, NeedCtorLink)
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	int                                                ItemUID;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvChatWispher
struct UBTTcpLink_Channel_rfReqRecvChatWispher_Params
{
	struct FString                                     CharnameFrom;                                             // (Parm, NeedCtorLink)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChatWispher
struct UBTTcpLink_Channel_rfAckChatWispher_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     ToCharName;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChatWispher
struct UBTTcpLink_Channel_rfReqChatWispher_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRemoveBlockUserList
struct UBTTcpLink_Channel_rfAckRemoveBlockUserList_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRemoveBlockUserList
struct UBTTcpLink_Channel_rfReqRemoveBlockUserList_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAddBlockUserList
struct UBTTcpLink_Channel_rfAckAddBlockUserList_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAddBlockUserList
struct UBTTcpLink_Channel_rfReqAddBlockUserList_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckBlockUserListEnd
struct UBTTcpLink_Channel_rfAckBlockUserListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckBlockUserList
struct UBTTcpLink_Channel_rfAckBlockUserList_Params
{
	TArray<struct FString>                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckBlockUserListStart
struct UBTTcpLink_Channel_rfAckBlockUserListStart_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqBlockUserList
struct UBTTcpLink_Channel_rfReqBlockUserList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqCompleteFriendInvite
struct UBTTcpLink_Channel_rfReqCompleteFriendInvite_Params
{
	struct FString                                     CharnameToBeInvited;                                      // (Parm, NeedCtorLink)
	unsigned char                                      IsPermit;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckConfirmFriendInvite
struct UBTTcpLink_Channel_rfAckConfirmFriendInvite_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqConfirmFriendInvite
struct UBTTcpLink_Channel_rfReqConfirmFriendInvite_Params
{
	int                                                ReqUserID;                                                // (Parm)
	struct FString                                     ReqedCharname;                                            // (Parm, NeedCtorLink)
	unsigned char                                      IsPermit;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvFriendInvite
struct UBTTcpLink_Channel_rfReqRecvFriendInvite_Params
{
	int                                                ReqUserID;                                                // (Parm)
	struct FString                                     ReqCharname;                                              // (Parm, NeedCtorLink)
	struct FString                                     InviteMsg;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSendFriendInvite
struct UBTTcpLink_Channel_rfAckSendFriendInvite_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSendFriendInvite
struct UBTTcpLink_Channel_rfReqSendFriendInvite_Params
{
	int                                                InviteUserID;                                             // (Parm)
	struct FString                                     InviteName;                                               // (Parm, NeedCtorLink)
	struct FString                                     InviteMsg;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChatNormal
struct UBTTcpLink_Channel_rfAckChatNormal_Params
{
	int                                                id;                                                       // (Parm)
	struct FString                                     Sender;                                                   // (Parm, NeedCtorLink)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChatNormal
struct UBTTcpLink_Channel_rfReqChatNormal_Params
{
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckDummy
struct UBTTcpLink_Channel_rfAckDummy_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqDummy
struct UBTTcpLink_Channel_rfReqDummy_Params
{
	int                                                DelayCheck;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckConfirmItemChanged
struct UBTTcpLink_Channel_rfAckConfirmItemChanged_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqConfirmItemChanged
struct UBTTcpLink_Channel_rfReqConfirmItemChanged_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckEquipItem
struct UBTTcpLink_Channel_rfAckEquipItem_Params
{
	int                                                ChangedNewItemID;                                         // (Parm)
	struct FBtrDouble                                  ChangedNewUniqueID;                                       // (Parm)
	int                                                ChangedNewSlotPosition;                                   // (Parm)
	int                                                ChangedOldItemID;                                         // (Parm)
	struct FBtrDouble                                  ChangedOldUniqueID;                                       // (Parm)
	int                                                ChangedOldSlotPosition;                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqEquipItem
struct UBTTcpLink_Channel_rfReqEquipItem_Params
{
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  UniqueID;                                                 // (Parm)
	int                                                SlotPosition;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckItemListEnd
struct UBTTcpLink_Channel_rfAckItemListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckItemList
struct UBTTcpLink_Channel_rfAckItemList_Params
{
	TArray<struct FBtrDouble>                          UniqueID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ItemID;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        ItemType;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Durability;                                               // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UntilTime;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        SlotPosition;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        AddPartsID;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        DamageDegree;                                             // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ItemState;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        StackCount;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        PaintID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        TradeCount;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckItemListStart
struct UBTTcpLink_Channel_rfAckItemListStart_Params
{
	int                                                Count;                                                    // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqItemList
struct UBTTcpLink_Channel_rfReqItemList_Params
{
	int                                                UID;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckEntrySkillList
struct UBTTcpLink_Channel_rfAckEntrySkillList_Params
{
	TArray<int>                                        UserIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        SkillIDs;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        SlotPositions;                                            // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqEntrySkillList
struct UBTTcpLink_Channel_rfReqEntrySkillList_Params
{
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckEntryItemList
struct UBTTcpLink_Channel_rfAckEntryItemList_Params
{
	TArray<int>                                        UserIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ItemIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        SlotPositions;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        AddPartsID;                                               // (Parm, NeedCtorLink)
	TArray<struct FBtrDouble>                          UniqueID;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        PaintID;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqEntryItemList
struct UBTTcpLink_Channel_rfReqEntryItemList_Params
{
	int                                                UserID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChangeUserState
struct UBTTcpLink_Channel_rfAckChangeUserState_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        UserIDs;                                                  // (Parm, NeedCtorLink)
	TArray<unsigned char>                              Positions;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Numbers;                                                  // (Parm, NeedCtorLink)
	TArray<unsigned char>                              OldStates;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              NewStates;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChangeUserState
struct UBTTcpLink_Channel_rfReqChangeUserState_Params
{
	unsigned char                                      NewState;                                                 // (Parm)
	unsigned char                                      CheckPlaying;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckExteriorRoomState
struct UBTTcpLink_Channel_rfAckExteriorRoomState_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqExteriorRoomState
struct UBTTcpLink_Channel_rfReqExteriorRoomState_Params
{
	int                                                RoomNumber;                                               // (Parm)
	unsigned char                                      RoomState;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckExteriorRoomUserCount
struct UBTTcpLink_Channel_rfAckExteriorRoomUserCount_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqExteriorRoomUserCount
struct UBTTcpLink_Channel_rfReqExteriorRoomUserCount_Params
{
	int                                                RoomNumber;                                               // (Parm)
	int                                                RoomUserCount;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckExteriorRoomInfo
struct UBTTcpLink_Channel_rfAckExteriorRoomInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqExteriorRoomInfo
struct UBTTcpLink_Channel_rfReqExteriorRoomInfo_Params
{
	int                                                SP;                                                       // (Parm)
	int                                                RoomNumber;                                               // (Parm)
	unsigned char                                      IsPW;                                                     // (Parm)
	struct FString                                     RoomName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     MapName;                                                  // (Parm, NeedCtorLink)
	struct FString                                     ModeName;                                                 // (Parm, NeedCtorLink)
	int                                                MapNum;                                                   // (Parm)
	int                                                ModeNum;                                                  // (Parm)
	unsigned char                                      IsTeamBalance;                                            // (Parm)
	int                                                MaxUserCount;                                             // (Parm)
	int                                                RoomUserCount;                                            // (Parm)
	unsigned char                                      RoomState;                                                // (Parm)
	unsigned char                                      BotDifficult;                                             // (Parm)
	unsigned char                                      WeaponLimit;                                              // (Parm)
	unsigned char                                      BotModeUserTeamNum;                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetBootyChoose
struct UBTTcpLink_Channel_rfAckGetBootyChoose_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      GiveType;                                                 // (Parm)
	struct FBtrDouble                                  ItemUniqueNumber;                                         // (Parm)
	int                                                ItemID;                                                   // (Parm)
	int                                                PartID;                                                   // (Parm)
	unsigned char                                      ItemType;                                                 // (Parm)
	struct FBtrDouble                                  UntilTime;                                                // (Parm)
	int                                                StackCount;                                               // (Parm)
	int                                                PaintID;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetBooty
struct UBTTcpLink_Channel_rfAckGetBooty_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        PrizeWinUserID;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        BootyItemID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        BootyPartsID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGetBooty
struct UBTTcpLink_Channel_rfReqGetBooty_Params
{
	int                                                RoomNumber;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSetUserBootySeedValue
struct UBTTcpLink_Channel_rfAckSetUserBootySeedValue_Params
{
	int                                                UserID;                                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSetUserBootySeedValue
struct UBTTcpLink_Channel_rfReqSetUserBootySeedValue_Params
{
	int                                                UserID;                                                   // (Parm)
	int                                                SeedValue;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChangeRoomSetting
struct UBTTcpLink_Channel_rfAckChangeRoomSetting_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FGameRoomInfo                               RoomInfo;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChangeRoomSetting
struct UBTTcpLink_Channel_rfReqChangeRoomSetting_Params
{
	struct FGameRoomInfo                               RoomInfo;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyLevelUp
struct UBTTcpLink_Channel_rfReqNotifyLevelUp_Params
{
	int                                                LevelUpUserID;                                            // (Parm)
	int                                                Level;                                                    // (Parm)
	int                                                Exp;                                                      // (Parm)
	TArray<int>                                        ItemID;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        PartID;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClientUdpInfoList
struct UBTTcpLink_Channel_rfAckClientUdpInfoList_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        UID;                                                      // (Parm, NeedCtorLink)
	TArray<struct FString>                             IP;                                                       // (Parm, NeedCtorLink)
	TArray<int>                                        Port;                                                     // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClientUdpInfoList
struct UBTTcpLink_Channel_rfReqClientUdpInfoList_Params
{
	int                                                GameNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRegisterOtherUdpInfo
struct UBTTcpLink_Channel_rfAckRegisterOtherUdpInfo_Params
{
	int                                                UID;                                                      // (Parm)
	struct FString                                     IP;                                                       // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	unsigned char                                      NatType;                                                  // (Parm)
	unsigned char                                      Intervention;                                             // (Parm)
	struct FString                                     HostInnerIP;                                              // (Parm, NeedCtorLink)
	int                                                HostInnerPort;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRegisterMyUdpInfo
struct UBTTcpLink_Channel_rfAckRegisterMyUdpInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRegisterMyUdpInfo
struct UBTTcpLink_Channel_rfReqRegisterMyUdpInfo_Params
{
	unsigned char                                      IsHost;                                                   // (Parm)
	struct FString                                     IP;                                                       // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	unsigned char                                      Intervention;                                             // (Parm)
	struct FString                                     HostInnerIP;                                              // (Parm, NeedCtorLink)
	int                                                HostInnerPort;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyClientJoinTime
struct UBTTcpLink_Channel_rfAckNotifyClientJoinTime_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyClientJoinTime
struct UBTTcpLink_Channel_rfReqNotifyClientJoinTime_Params
{
	int                                                JoinedClientID;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChangeNewGuest
struct UBTTcpLink_Channel_rfAckChangeNewGuest_Params
{
	struct FString                                     HostIP;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChangeHost
struct UBTTcpLink_Channel_rfAckChangeHost_Params
{
	unsigned char                                      ClientNum;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckDisconnectGame
struct UBTTcpLink_Channel_rfAckDisconnectGame_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                DisconnectUserID;                                         // (Parm)
	struct FString                                     DisconnectUserName;                                       // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqDisconnectGame
struct UBTTcpLink_Channel_rfReqDisconnectGame_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckConnectGame
struct UBTTcpLink_Channel_rfAckConnectGame_Params
{
	int                                                UserID;                                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqConnectGame
struct UBTTcpLink_Channel_rfReqConnectGame_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRelayServerOff
struct UBTTcpLink_Channel_rfReqRelayServerOff_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRelayServerOn
struct UBTTcpLink_Channel_rfReqRelayServerOn_Params
{
	struct FString                                     RelayServerIP;                                            // (Parm, NeedCtorLink)
	int                                                RelayServerPortNum;                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGameOver
struct UBTTcpLink_Channel_rfAckGameOver_Params
{
	int                                                UID;                                                      // (Parm)
	int                                                GameRoomNumber;                                           // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGameOver
struct UBTTcpLink_Channel_rfReqGameOver_Params
{
	int                                                UID;                                                      // (Parm)
	int                                                GameRoomNumber;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckIsGameRoomPlaying
struct UBTTcpLink_Channel_rfAckIsGameRoomPlaying_Params
{
	int                                                GameRoomNum;                                              // (Parm)
	unsigned char                                      IsPlaying;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqIsGameRoomPlaying
struct UBTTcpLink_Channel_rfReqIsGameRoomPlaying_Params
{
	int                                                GameRoomNum;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGameRoomDestroy
struct UBTTcpLink_Channel_rfAckGameRoomDestroy_Params
{
	int                                                GameRoomNum;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChangeRoomMaxNum
struct UBTTcpLink_Channel_rfAckChangeRoomMaxNum_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                Number;                                                   // (Parm)
	int                                                TeamNumber;                                               // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChangeRoomMaxNum
struct UBTTcpLink_Channel_rfReqChangeRoomMaxNum_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	int                                                Number;                                                   // (Parm)
	int                                                TeamNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckUpdateScoreResult
struct UBTTcpLink_Channel_rfAckUpdateScoreResult_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckUpdateScore
struct UBTTcpLink_Channel_rfAckUpdateScore_Params
{
	TArray<int>                                        UserIDs;                                                  // (Parm, NeedCtorLink)
	TArray<struct FString>                             NickNames;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              TeamIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        Scores;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        Kills;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        Assists;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        Deaths;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        EXPs;                                                     // (Parm, NeedCtorLink)
	TArray<int>                                        EXPBonuses;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        Points;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        PointBonuses;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        TeamScores;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        BonusOwnerID;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        BonusID;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqUpdateScore
struct UBTTcpLink_Channel_rfReqUpdateScore_Params
{
	int                                                GameNumber;                                               // (Parm)
	TArray<int>                                        UserIDs;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        Kills;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        Assists;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        Deaths;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        EXPs;                                                     // (Parm, NeedCtorLink)
	TArray<int>                                        Points;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        Scores;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        TeamScores;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        RoundJoin;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        TimeJoin;                                                 // (Parm, NeedCtorLink)
	int                                                Playtime;                                                 // (Parm)
	unsigned char                                      GameEndType;                                              // (Parm)
	TArray<struct FString>                             UserNames;                                                // (Parm, NeedCtorLink)
	unsigned char                                      IsAIClear;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckStartGame
struct UBTTcpLink_Channel_rfAckStartGame_Params
{
	int                                                GameNumber;                                               // (Parm)
	int                                                ClientsCount;                                             // (Parm)
	int                                                StartSeed;                                                // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqStartGame
struct UBTTcpLink_Channel_rfReqStartGame_Params
{
	int                                                GameNumber;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGameHostInfo
struct UBTTcpLink_Channel_rfAckGameHostInfo_Params
{
	int                                                GameNumber;                                               // (Parm)
	struct FString                                     UserID;                                                   // (Parm, NeedCtorLink)
	struct FString                                     IP;                                                       // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGameHostInfo
struct UBTTcpLink_Channel_rfReqGameHostInfo_Params
{
	int                                                GameNumber;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckIsHostAvailable
struct UBTTcpLink_Channel_rfAckIsHostAvailable_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqIsHostAvailable
struct UBTTcpLink_Channel_rfReqIsHostAvailable_Params
{
	struct FString                                     MyIp;                                                     // (Parm, NeedCtorLink)
	int                                                CPUGrade;                                                 // (Parm)
	int                                                RamGrade;                                                 // (Parm)
	int                                                VGAGrade;                                                 // (Parm)
	int                                                VGARam;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChangeTeam
struct UBTTcpLink_Channel_rfAckChangeTeam_Params
{
	int                                                GameNumber;                                               // (Parm)
	struct FString                                     UserID;                                                   // (Parm, NeedCtorLink)
	int                                                UID;                                                      // (Parm)
	int                                                TeamNum;                                                  // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChangeTeam
struct UBTTcpLink_Channel_rfReqChangeTeam_Params
{
	int                                                TeamNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChangeRoomOwner
struct UBTTcpLink_Channel_rfAckChangeRoomOwner_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                OldOwner;                                                 // (Parm)
	int                                                NewOwner;                                                 // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChangeRoomOwner
struct UBTTcpLink_Channel_rfReqChangeRoomOwner_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	int                                                NewOwner;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChangeGameMode
struct UBTTcpLink_Channel_rfAckChangeGameMode_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	struct FString                                     GameMode;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      GameModeNum;                                              // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChangeGameMode
struct UBTTcpLink_Channel_rfReqChangeGameMode_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	struct FString                                     GameMode;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      GameModeNum;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckBanUser
struct UBTTcpLink_Channel_rfAckBanUser_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	int                                                BanUID;                                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqBanUser
struct UBTTcpLink_Channel_rfReqBanUser_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	int                                                BanUID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSelectMap
struct UBTTcpLink_Channel_rfAckSelectMap_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	struct FString                                     MapName;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSelectMap
struct UBTTcpLink_Channel_rfReqSelectMap_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	struct FString                                     MapName;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGameRoomInfo
struct UBTTcpLink_Channel_rfAckGameRoomInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FGameRoomInfo                               RoomInfo;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGameRoomInfo
struct UBTTcpLink_Channel_rfReqGameRoomInfo_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckCreateGameRoom
struct UBTTcpLink_Channel_rfAckCreateGameRoom_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	struct FString                                     RoomOwnerIP;                                              // (Parm, NeedCtorLink)
	struct FGameRoomInfo                               NetRoomInfo;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqCreateGameRoom
struct UBTTcpLink_Channel_rfReqCreateGameRoom_Params
{
	struct FGameRoomInfo                               NetRoomInfo;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckExceedMaxUser
struct UBTTcpLink_Channel_rfAckExceedMaxUser_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckLeaveRoom
struct UBTTcpLink_Channel_rfAckLeaveRoom_Params
{
	int                                                Num;                                                      // (Parm)
	int                                                UID;                                                      // (Parm)
	struct FString                                     UserID;                                                   // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqLeaveRoom
struct UBTTcpLink_Channel_rfReqLeaveRoom_Params
{
	int                                                Num;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRoomUserList
struct UBTTcpLink_Channel_rfAckRoomUserList_Params
{
	TArray<int>                                        UID;                                                      // (Parm, NeedCtorLink)
	TArray<struct FString>                             UserName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Grade;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        TeamNum;                                                  // (Parm, NeedCtorLink)
	TArray<unsigned char>                              Statue;                                                   // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsHost;                                                   // (Parm, NeedCtorLink)
	TArray<struct FString>                             UserIP;                                                   // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        CM_Pattern;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        CM_BG;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        CM_BL;                                                    // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsLookingFor;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        GMUID;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLevel;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        LevelMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TitleMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved1;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved3;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRoomUserList
struct UBTTcpLink_Channel_rfReqRoomUserList_Params
{
	int                                                GameNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckEnterRoom
struct UBTTcpLink_Channel_rfAckEnterRoom_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                OwnerID;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	struct FString                                     UserID;                                                   // (Parm, NeedCtorLink)
	int                                                TeamNum;                                                  // (Parm)
	int                                                Grade;                                                    // (Parm)
	struct FString                                     UserIP;                                                   // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                Clan_Mark_Pattern;                                        // (Parm)
	int                                                Clan_Mark_BG;                                             // (Parm)
	int                                                Clan_Mark_BL;                                             // (Parm)
	unsigned char                                      IsLookFor;                                                // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                ClanLevel;                                                // (Parm)
	int                                                LevelMarkID;                                              // (Parm)
	int                                                TitleMarkID;                                              // (Parm)
	int                                                Reserved1;                                                // (Parm)
	int                                                Reserved2;                                                // (Parm)
	int                                                Reserved3;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqEnterRoom
struct UBTTcpLink_Channel_rfReqEnterRoom_Params
{
	int                                                GameNum;                                                  // (Parm)
	struct FString                                     Password;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      RoomEnterType;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRoomListEnd
struct UBTTcpLink_Channel_rfAckRoomListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRoomList
struct UBTTcpLink_Channel_rfAckRoomList_Params
{
	TArray<int>                                        GameNum;                                                  // (Parm, NeedCtorLink)
	TArray<struct FString>                             Title;                                                    // (Parm, NeedCtorLink)
	TArray<struct FString>                             MapName;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        MapNum;                                                   // (Parm, NeedCtorLink)
	TArray<unsigned char>                              UserCount;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              MaxCount;                                                 // (Parm, NeedCtorLink)
	TArray<struct FString>                             ModeName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ModeNum;                                                  // (Parm, NeedCtorLink)
	TArray<unsigned char>                              WeaponLimit;                                              // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsTeamBalance;                                            // (Parm, NeedCtorLink)
	TArray<unsigned char>                              Status;                                                   // (Parm, NeedCtorLink)
	TArray<struct FString>                             RoomOwnerIP;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        GameMinute;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             RoomOwnerName;                                            // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsSpecial;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsPassword;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              BotDifficult;                                             // (Parm, NeedCtorLink)
	TArray<unsigned char>                              BotModeUserTeamNum;                                       // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRoomListStart
struct UBTTcpLink_Channel_rfAckRoomListStart_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	int                                                Count;                                                    // (Parm)
	int                                                StartIndex;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRoomList
struct UBTTcpLink_Channel_rfReqRoomList_Params
{
	int                                                id;                                                       // (Parm)
	int                                                StartIndex;                                               // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChannelUserList
struct UBTTcpLink_Channel_rfAckChannelUserList_Params
{
	int                                                TotalCount;                                               // (Parm)
	int                                                Count;                                                    // (Parm)
	int                                                StartIndex;                                               // (Parm)
	TArray<int>                                        UID;                                                      // (Parm, NeedCtorLink)
	TArray<struct FString>                             UserID;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        UserLevels;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        ClanPattern;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ClanBG;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        ClanBL;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        ClanGrade;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        ClanWin;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLose;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsLookForClan;                                            // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLevel;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        LevelMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        TitleMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved1;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved2;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Reserved3;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChannelUserList
struct UBTTcpLink_Channel_rfReqChannelUserList_Params
{
	int                                                id;                                                       // (Parm)
	int                                                StartIndex;                                               // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckLeaveChannel
struct UBTTcpLink_Channel_rfAckLeaveChannel_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     UserID;                                                   // (Parm, NeedCtorLink)
	int                                                UID;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqLeaveChannel
struct UBTTcpLink_Channel_rfReqLeaveChannel_Params
{
	int                                                id;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckEnterChannel
struct UBTTcpLink_Channel_rfAckEnterChannel_Params
{
	int                                                id;                                                       // (Parm)
	int                                                UID;                                                      // (Parm)
	struct FString                                     UserID;                                                   // (Parm, NeedCtorLink)
	int                                                Level;                                                    // (Parm)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanMarkPattern;                                          // (Parm)
	int                                                ClanMarkBG;                                               // (Parm)
	int                                                ClanMarkBL;                                               // (Parm)
	int                                                ClanGrade;                                                // (Parm)
	int                                                ClanWin;                                                  // (Parm)
	int                                                ClanLose;                                                 // (Parm)
	unsigned char                                      IsLookFor;                                                // (Parm)
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                ClanLevel;                                                // (Parm)
	int                                                LevelMarkID;                                              // (Parm)
	int                                                TitleMarkID;                                              // (Parm)
	int                                                Reserved1;                                                // (Parm)
	int                                                Reserved2;                                                // (Parm)
	int                                                Reserved3;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqEnterChannel
struct UBTTcpLink_Channel_rfReqEnterChannel_Params
{
	int                                                id;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChannelList
struct UBTTcpLink_Channel_rfAckChannelList_Params
{
	TArray<int>                                        id;                                                       // (Parm, NeedCtorLink)
	TArray<struct FString>                             Title;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        CurUser;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        MaxUser;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChannelList
struct UBTTcpLink_Channel_rfReqChannelList_Params
{
	int                                                bChannelType;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckFriendListEnd
struct UBTTcpLink_Channel_rfAckFriendListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckFriendList
struct UBTTcpLink_Channel_rfAckFriendList_Params
{
	TArray<struct FString>                             FriendName;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsLogOn;                                                  // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        CM_Pattern;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        CM_BG;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        CM_BL;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        LevelMarkID;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLevel;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        Level;                                                    // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsLookForClan;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckFriendListStart
struct UBTTcpLink_Channel_rfAckFriendListStart_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqFriendList
struct UBTTcpLink_Channel_rfReqFriendList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckCharInfo
struct UBTTcpLink_Channel_rfAckCharInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                CM_Pattern;                                               // (Parm)
	int                                                CM_BG;                                                    // (Parm)
	int                                                CM_BL;                                                    // (Parm)
	struct FCharInfo                                   stCharInfo;                                               // (Parm)
	unsigned char                                      InClanRank;                                               // (Parm)
	int                                                ClanLevel;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqCharInfo
struct UBTTcpLink_Channel_rfReqCharInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckLogin2
struct UBTTcpLink_Channel_rfAckLogin2_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FBtrDouble                                  CurServerTime;                                            // (Parm)
	int                                                CharDBID;                                                 // (Parm)
	unsigned char                                      IsGM;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqLogin2
struct UBTTcpLink_Channel_rfReqLogin2_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                TimeStamp;                                                // (Parm)
	int                                                LoginHash1;                                               // (Parm)
	int                                                LoginHash2;                                               // (Parm)
	int                                                LoginHash3;                                               // (Parm)
	int                                                LoginHash4;                                               // (Parm)
	int                                                LoginHash5;                                               // (Parm)
	struct FString                                     Guid;                                                     // (Parm, NeedCtorLink)
	int                                                UserType;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckStartNatDiag
struct UBTTcpLink_Channel_rfAckStartNatDiag_Params
{
	int                                                NatType;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqStartNatDiag
struct UBTTcpLink_Channel_rfReqStartNatDiag_Params
{
	struct FString                                     Server1Addr;                                              // (Parm, NeedCtorLink)
	int                                                Server1Port;                                              // (Parm)
	struct FString                                     Server2Addr;                                              // (Parm, NeedCtorLink)
	int                                                Server2Port;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqForceLogoutByOwner
struct UBTTcpLink_Channel_rfReqForceLogoutByOwner_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckLogin
struct UBTTcpLink_Channel_rfAckLogin_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	struct FCharInfo                                   btCharInfo;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqLogin
struct UBTTcpLink_Channel_rfReqLogin_Params
{
	struct FString                                     id;                                                       // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckHash
struct UBTTcpLink_Channel_rfAckHash_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqHash
struct UBTTcpLink_Channel_rfReqHash_Params
{
	int                                                HashField0;                                               // (Parm)
	int                                                HashField1;                                               // (Parm)
	int                                                HashField2;                                               // (Parm)
	int                                                HashField3;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.OnError
struct UBTTcpLink_Channel_OnError_Params
{
	int                                                ErrCode;                                                  // (Parm)
};

// Function BatteryNet.BTTcpLink_Channel.OnClose
struct UBTTcpLink_Channel_OnClose_Params
{
	int                                                ErrCode;                                                  // (Parm)
};

// Function BatteryNet.BTTcpLink_Channel.OnConnect
struct UBTTcpLink_Channel_OnConnect_Params
{
	int                                                ErrCode;                                                  // (Parm)
};

// Function BatteryNet.BTTcpLink_Channel.Close
struct UBTTcpLink_Channel_Close_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.ConnectDomain
struct UBTTcpLink_Channel_ConnectDomain_Params
{
	struct FString                                     domain;                                                   // (Parm, NeedCtorLink)
	int                                                nPort;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.Connect
struct UBTTcpLink_Channel_Connect_Params
{
	struct FString                                     sIpaddr;                                                  // (Parm, NeedCtorLink)
	int                                                nPort;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.InitNetwork
struct UBTTcpLink_Channel_InitNetwork_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpHandler_DS_Script_Interface.SetGameManager
struct UBTTcpHandler_DS_Script_Interface_SetGameManager_Params
{
	class UwGameManager*                               pgameMgr;                                                 // (Parm)
};

// Function BatteryNet.BTTcpHandler_DS_Script_Interface.SetMatchMaker
struct UBTTcpHandler_DS_Script_Interface_SetMatchMaker_Params
{
	class UwMatchMaker*                                pMM;                                                      // (Parm)
};

// Function BatteryNet.BTDataTransferClientLink.OnReceivedParamDataComplete
struct UBTDataTransferClientLink_OnReceivedParamDataComplete_Params
{
	int                                                Result;                                                   // (Parm)
};

// Function BatteryNet.BTDataTransferClientLink.Close
struct UBTDataTransferClientLink_Close_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTDataTransferClientLink.RequestData
struct UBTDataTransferClientLink_RequestData_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTDataTransferClientLink.InitNetwork
struct UBTDataTransferClientLink_InitNetwork_Params
{
	struct FString                                     ServerIP;                                                 // (Parm, NeedCtorLink)
	int                                                serverPort;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckLoginWithIndonesia
struct UBTTcpLink_Login_sfAckLoginWithIndonesia_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqLoginWithIndonesia
struct UBTTcpLink_Login_sfReqLoginWithIndonesia_Params
{
	struct FString                                     HashValue;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckLoginWithGlobal
struct UBTTcpLink_Login_sfAckLoginWithGlobal_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqLoginWithGlobal
struct UBTTcpLink_Login_sfReqLoginWithGlobal_Params
{
	struct FString                                     G_AccountID;                                              // (Parm, NeedCtorLink)
	struct FString                                     G_GUID;                                                   // (Parm, NeedCtorLink)
	struct FString                                     G_AuthKey;                                                // (Parm, NeedCtorLink)
	int                                                UserType;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckLoginWithThailand
struct UBTTcpLink_Login_sfAckLoginWithThailand_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqLoginWithThailand
struct UBTTcpLink_Login_sfReqLoginWithThailand_Params
{
	struct FString                                     USN;                                                      // (Parm, NeedCtorLink)
	int                                                BloodDisplayType;                                         // (Parm)
	int                                                PCBangType;                                               // (Parm)
	struct FString                                     UnixTimeStamp;                                            // (Parm, NeedCtorLink)
	struct FString                                     HashValue;                                                // (Parm, NeedCtorLink)
	unsigned char                                      Sex;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckLogOut
struct UBTTcpLink_Login_sfAckLogOut_Params
{
	unsigned char                                      Result;                                                   // (Parm)
	unsigned char                                      Reason;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqLogOut
struct UBTTcpLink_Login_sfReqLogOut_Params
{
	unsigned char                                      Reason;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckLoginWithTencentAuth
struct UBTTcpLink_Login_sfAckLoginWithTencentAuth_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      tc_AccountType;                                           // (Parm)
	unsigned char                                      tc_IsBlock;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqLoginWithTencentAuth
struct UBTTcpLink_Login_sfReqLoginWithTencentAuth_Params
{
	struct FString                                     AccountID;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              Signature;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckTencent_AASInfo
struct UBTTcpLink_Login_sfAckTencent_AASInfo_Params
{
	int                                                UserID;                                                   // (Parm)
	unsigned char                                      IsAdult;                                                  // (Parm)
	unsigned char                                      IsQQAuth;                                                 // (Parm)
	int                                                AccumTimeSec;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckEventNotify
struct UBTTcpLink_Login_sfAckEventNotify_Params
{
	int                                                Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqEventNotify
struct UBTTcpLink_Login_sfReqEventNotify_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckErrorReportServerAddr
struct UBTTcpLink_Login_sfAckErrorReportServerAddr_Params
{
	struct FString                                     Addr;                                                     // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqErrorReportServerAddr
struct UBTTcpLink_Login_sfReqErrorReportServerAddr_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckClientChecksum
struct UBTTcpLink_Login_sfAckClientChecksum_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqClientChecksum
struct UBTTcpLink_Login_sfReqClientChecksum_Params
{
	struct FString                                     Key1;                                                     // (Parm, NeedCtorLink)
	struct FBtrDouble                                  Key2;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckClientChallenge
struct UBTTcpLink_Login_sfAckClientChallenge_Params
{
	struct FString                                     Key1;                                                     // (Parm, NeedCtorLink)
	struct FBtrDouble                                  Key2;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqClientChallenge
struct UBTTcpLink_Login_sfReqClientChallenge_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckServerTime
struct UBTTcpLink_Login_sfAckServerTime_Params
{
	int                                                Time;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqServerTime
struct UBTTcpLink_Login_sfReqServerTime_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckGetCharBlockInfo
struct UBTTcpLink_Login_sfAckGetCharBlockInfo_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      IsAccountBlock;                                           // (Parm)
	unsigned char                                      IsChattingBlock;                                          // (Parm)
	struct FBtrDouble                                  ChattingBlockEndTime;                                     // (Parm)
	TArray<struct FString>                             BlockedItemName;                                          // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqGetCharBlockInfo
struct UBTTcpLink_Login_sfReqGetCharBlockInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckRegisterMainPCBang
struct UBTTcpLink_Login_sfAckRegisterMainPCBang_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqRegisterMainPCBang
struct UBTTcpLink_Login_sfReqRegisterMainPCBang_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckPCBangUserListEnd
struct UBTTcpLink_Login_sfAckPCBangUserListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckPCBangUserList
struct UBTTcpLink_Login_sfAckPCBangUserList_Params
{
	TArray<struct FString>                             FriendName;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsLogOn;                                                  // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        CM_Pattern;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        CM_BG;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        CM_BL;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        Level;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        ClanGrade;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        ClanWin;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLose;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckPCBangUserListStart
struct UBTTcpLink_Login_sfAckPCBangUserListStart_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqPCBangUserList
struct UBTTcpLink_Login_sfReqPCBangUserList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckRegisteredPCBangInfo
struct UBTTcpLink_Login_sfAckRegisteredPCBangInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      IsRegisteredPCBang;                                       // (Parm)
	unsigned char                                      IsMainPCBang;                                             // (Parm)
	struct FString                                     PCBangName;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqRegisteredPCBangInfo
struct UBTTcpLink_Login_sfReqRegisteredPCBangInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckCharInfo
struct UBTTcpLink_Login_sfAckCharInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                Level;                                                    // (Parm)
	int                                                Exp;                                                      // (Parm)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqCharInfo
struct UBTTcpLink_Login_sfReqCharInfo_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqForceLogoutByOwner
struct UBTTcpLink_Login_sfReqForceLogoutByOwner_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqKeepAlive
struct UBTTcpLink_Login_sfReqKeepAlive_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckMaxUserExceed
struct UBTTcpLink_Login_sfAckMaxUserExceed_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckClanMemberListFromClientEnd
struct UBTTcpLink_Login_sfAckClanMemberListFromClientEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckClanMemberListFromClient
struct UBTTcpLink_Login_sfAckClanMemberListFromClient_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        Level;                                                    // (Parm, NeedCtorLink)
	TArray<struct FString>                             CharName;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ClanGrade;                                                // (Parm, NeedCtorLink)
	TArray<struct FString>                             ServerName;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             ServerShortName;                                          // (Parm, NeedCtorLink)
	TArray<struct FString>                             ServerIP;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        serverPort;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              CurPos;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        ChannelNum;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             ChannelNickName;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        GameRoomNum;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckClanMemberListFromClientStart
struct UBTTcpLink_Login_sfAckClanMemberListFromClientStart_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqClanMemberListFromClient
struct UBTTcpLink_Login_sfReqClanMemberListFromClient_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckLoginWithWZAuth
struct UBTTcpLink_Login_sfAckLoginWithWZAuth_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      wzp_AccountType;                                          // (Parm)
	unsigned char                                      wzp_IsBlock;                                              // (Parm)
	unsigned char                                      wzp_AuthKeySuccess;                                       // (Parm)
	unsigned char                                      ChannelType;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqLoginWithWZAuth
struct UBTTcpLink_Login_sfReqLoginWithWZAuth_Params
{
	struct FString                                     AccountID;                                                // (Parm, NeedCtorLink)
	struct FString                                     Guid;                                                     // (Parm, NeedCtorLink)
	struct FString                                     AuthKey;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckProcessPreLoginUser
struct UBTTcpLink_Login_sfAckProcessPreLoginUser_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqProcessPreLoginUser
struct UBTTcpLink_Login_sfReqProcessPreLoginUser_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckLoginInHouseTest
struct UBTTcpLink_Login_sfAckLoginInHouseTest_Params
{
	unsigned char                                      Sucess;                                                   // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                TimeStamp;                                                // (Parm)
	int                                                LoginHash1;                                               // (Parm)
	int                                                LoginHash2;                                               // (Parm)
	int                                                LoginHash3;                                               // (Parm)
	int                                                LoginHash4;                                               // (Parm)
	int                                                LoginHash5;                                               // (Parm)
	unsigned char                                      NeedChar;                                                 // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     BDay;                                                     // (Parm, NeedCtorLink)
	unsigned char                                      Sex;                                                      // (Parm)
	struct FBtrDouble                                  ServerTime;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqLoginInHouseTest
struct UBTTcpLink_Login_sfReqLoginInHouseTest_Params
{
	struct FString                                     UserName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     Password;                                                 // (Parm, NeedCtorLink)
	struct FString                                     Guid;                                                     // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckAdvertisement
struct UBTTcpLink_Login_sfAckAdvertisement_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      Type;                                                     // (Parm)
	struct FString                                     Address;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqAdvertisement
struct UBTTcpLink_Login_sfReqAdvertisement_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckUserDetailInfo
struct UBTTcpLink_Login_sfAckUserDetailInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     UserName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                Ranking;                                                  // (Parm)
	int                                                MatchNum;                                                 // (Parm)
	int                                                WinNum;                                                   // (Parm)
	int                                                LoseNum;                                                  // (Parm)
	int                                                CurrentEXP;                                               // (Parm)
	int                                                NextExp;                                                  // (Parm)
	int                                                ForcedDisconnectedNum;                                    // (Parm)
	int                                                PrimaryWeaponID;                                          // (Parm)
	int                                                SubWeaponID;                                              // (Parm)
	int                                                Point;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqUserDetailInfo
struct UBTTcpLink_Login_sfReqUserDetailInfo_Params
{
	int                                                UserID;                                                   // (Parm)
	struct FString                                     UserName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckFriendsListEnd
struct UBTTcpLink_Login_sfAckFriendsListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckFriendsList
struct UBTTcpLink_Login_sfAckFriendsList_Params
{
	unsigned char                                      ListType;                                                 // (Parm)
	TArray<struct FString>                             UserName;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsLogOn;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        CMarkPattern;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        CMarkBG;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        CMarkBL;                                                  // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Level;                                                    // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckFriendsListStart
struct UBTTcpLink_Login_sfAckFriendsListStart_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqFriendsList
struct UBTTcpLink_Login_sfReqFriendsList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckConnectChannelServer
struct UBTTcpLink_Login_sfAckConnectChannelServer_Params
{
	struct FString                                     SessionKey;                                               // (Parm, NeedCtorLink)
	int                                                TimeStamp;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqConnectChannelServer
struct UBTTcpLink_Login_sfReqConnectChannelServer_Params
{
	struct FString                                     ServerIP;                                                 // (Parm, NeedCtorLink)
	int                                                serverPort;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckServerList
struct UBTTcpLink_Login_sfAckServerList_Params
{
	TArray<struct FString>                             CServername;                                              // (Parm, NeedCtorLink)
	TArray<struct FString>                             CServerShortName;                                         // (Parm, NeedCtorLink)
	TArray<struct FString>                             ServerIP;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        serverPort;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             ChannelName;                                              // (Parm, NeedCtorLink)
	TArray<struct FString>                             ChannelNickName;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        ChannelNum;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        chMaxUser;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        chCurUser;                                                // (Parm, NeedCtorLink)
	TArray<struct FString>                             ServerGroupName;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        ServerGroupID;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        ServerDispOrder;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        DataPort;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              OptionCount_byte;                                         // (Parm, NeedCtorLink)
	TArray<unsigned char>                              OptionKey_byte;                                           // (Parm, NeedCtorLink)
	TArray<unsigned char>                              OptionValue_byte;                                         // (Parm, NeedCtorLink)
	TArray<unsigned char>                              OptionCount_int;                                          // (Parm, NeedCtorLink)
	TArray<unsigned char>                              OptionKey_int;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        OptionValue_int;                                          // (Parm, NeedCtorLink)
	TArray<unsigned char>                              OptionCount_float;                                        // (Parm, NeedCtorLink)
	TArray<unsigned char>                              OptionKey_float;                                          // (Parm, NeedCtorLink)
	TArray<float>                                      OptionValue_float;                                        // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsClanChannel;                                            // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsUseDedicateHost;                                        // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqServerList
struct UBTTcpLink_Login_sfReqServerList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckCreateChar
struct UBTTcpLink_Login_sfAckCreateChar_Params
{
	int                                                Success;                                                  // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqCreateChar
struct UBTTcpLink_Login_sfReqCreateChar_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                HeadItemID;                                               // (Parm)
	int                                                HelmetItemID;                                             // (Parm)
	int                                                AccesoItemID;                                             // (Parm)
	int                                                BackpackItemID;                                           // (Parm)
	int                                                PouchItemID;                                              // (Parm)
	int                                                CamouflageItemID;                                         // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckAccesItemTypeList
struct UBTTcpLink_Login_sfAckAccesItemTypeList_Params
{
	TArray<struct FString>                             AccesoItemName;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        AccesoItemID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqAccesItemTypeList
struct UBTTcpLink_Login_sfReqAccesItemTypeList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckHelmetItemTypeList
struct UBTTcpLink_Login_sfAckHelmetItemTypeList_Params
{
	TArray<struct FString>                             HelmetItemName;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        HelmetItemID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqHelmetItemTypeList
struct UBTTcpLink_Login_sfReqHelmetItemTypeList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckHeadItemTypeList
struct UBTTcpLink_Login_sfAckHeadItemTypeList_Params
{
	TArray<int>                                        HeadItemID;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqHeadItemTypeList
struct UBTTcpLink_Login_sfReqHeadItemTypeList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckLogin
struct UBTTcpLink_Login_sfAckLogin_Params
{
	unsigned char                                      Sucess;                                                   // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                TimeStamp;                                                // (Parm)
	int                                                LoginHash1;                                               // (Parm)
	int                                                LoginHash2;                                               // (Parm)
	int                                                LoginHash3;                                               // (Parm)
	int                                                LoginHash4;                                               // (Parm)
	int                                                LoginHash5;                                               // (Parm)
	unsigned char                                      NeedChar;                                                 // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqLogin
struct UBTTcpLink_Login_sfReqLogin_Params
{
	struct FString                                     PortalID;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckExceedMaxUser
struct UBTTcpLink_Login_sfAckExceedMaxUser_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckHash
struct UBTTcpLink_Login_sfAckHash_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqHash
struct UBTTcpLink_Login_sfReqHash_Params
{
	int                                                HashField0;                                               // (Parm)
	int                                                HashField1;                                               // (Parm)
	int                                                HashField2;                                               // (Parm)
	int                                                HashField3;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckLoginWithIndonesia
struct UBTTcpLink_Login_rfAckLoginWithIndonesia_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqLoginWithIndonesia
struct UBTTcpLink_Login_rfReqLoginWithIndonesia_Params
{
	struct FString                                     HashValue;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckLoginWithGlobal
struct UBTTcpLink_Login_rfAckLoginWithGlobal_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqLoginWithGlobal
struct UBTTcpLink_Login_rfReqLoginWithGlobal_Params
{
	struct FString                                     G_AccountID;                                              // (Parm, NeedCtorLink)
	struct FString                                     G_GUID;                                                   // (Parm, NeedCtorLink)
	struct FString                                     G_AuthKey;                                                // (Parm, NeedCtorLink)
	int                                                UserType;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckLoginWithThailand
struct UBTTcpLink_Login_rfAckLoginWithThailand_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqLoginWithThailand
struct UBTTcpLink_Login_rfReqLoginWithThailand_Params
{
	struct FString                                     USN;                                                      // (Parm, NeedCtorLink)
	int                                                BloodDisplayType;                                         // (Parm)
	int                                                PCBangType;                                               // (Parm)
	struct FString                                     UnixTimeStamp;                                            // (Parm, NeedCtorLink)
	struct FString                                     HashValue;                                                // (Parm, NeedCtorLink)
	unsigned char                                      Sex;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckLogOut
struct UBTTcpLink_Login_rfAckLogOut_Params
{
	unsigned char                                      Result;                                                   // (Parm)
	unsigned char                                      Reason;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqLogOut
struct UBTTcpLink_Login_rfReqLogOut_Params
{
	unsigned char                                      Reason;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckLoginWithTencentAuth
struct UBTTcpLink_Login_rfAckLoginWithTencentAuth_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      tc_AccountType;                                           // (Parm)
	unsigned char                                      tc_IsBlock;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqLoginWithTencentAuth
struct UBTTcpLink_Login_rfReqLoginWithTencentAuth_Params
{
	struct FString                                     AccountID;                                                // (Parm, NeedCtorLink)
	TArray<unsigned char>                              Signature;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckTencent_AASInfo
struct UBTTcpLink_Login_rfAckTencent_AASInfo_Params
{
	int                                                UserID;                                                   // (Parm)
	unsigned char                                      IsAdult;                                                  // (Parm)
	unsigned char                                      IsQQAuth;                                                 // (Parm)
	int                                                AccumTimeSec;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckEventNotify
struct UBTTcpLink_Login_rfAckEventNotify_Params
{
	int                                                Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqEventNotify
struct UBTTcpLink_Login_rfReqEventNotify_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckErrorReportServerAddr
struct UBTTcpLink_Login_rfAckErrorReportServerAddr_Params
{
	struct FString                                     Addr;                                                     // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqErrorReportServerAddr
struct UBTTcpLink_Login_rfReqErrorReportServerAddr_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckClientChecksum
struct UBTTcpLink_Login_rfAckClientChecksum_Params
{
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqClientChecksum
struct UBTTcpLink_Login_rfReqClientChecksum_Params
{
	struct FString                                     Key1;                                                     // (Parm, NeedCtorLink)
	struct FBtrDouble                                  Key2;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckClientChallenge
struct UBTTcpLink_Login_rfAckClientChallenge_Params
{
	struct FString                                     Key1;                                                     // (Parm, NeedCtorLink)
	struct FBtrDouble                                  Key2;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqClientChallenge
struct UBTTcpLink_Login_rfReqClientChallenge_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckServerTime
struct UBTTcpLink_Login_rfAckServerTime_Params
{
	int                                                Time;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqServerTime
struct UBTTcpLink_Login_rfReqServerTime_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckGetCharBlockInfo
struct UBTTcpLink_Login_rfAckGetCharBlockInfo_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      IsAccountBlock;                                           // (Parm)
	unsigned char                                      IsChattingBlock;                                          // (Parm)
	struct FBtrDouble                                  ChattingBlockEndTime;                                     // (Parm)
	TArray<struct FString>                             BlockedItemName;                                          // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqGetCharBlockInfo
struct UBTTcpLink_Login_rfReqGetCharBlockInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckRegisterMainPCBang
struct UBTTcpLink_Login_rfAckRegisterMainPCBang_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqRegisterMainPCBang
struct UBTTcpLink_Login_rfReqRegisterMainPCBang_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckPCBangUserListEnd
struct UBTTcpLink_Login_rfAckPCBangUserListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckPCBangUserList
struct UBTTcpLink_Login_rfAckPCBangUserList_Params
{
	TArray<struct FString>                             FriendName;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsLogOn;                                                  // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        CM_Pattern;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        CM_BG;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        CM_BL;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        Level;                                                    // (Parm, NeedCtorLink)
	TArray<int>                                        ClanGrade;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        ClanWin;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        ClanLose;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckPCBangUserListStart
struct UBTTcpLink_Login_rfAckPCBangUserListStart_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqPCBangUserList
struct UBTTcpLink_Login_rfReqPCBangUserList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckRegisteredPCBangInfo
struct UBTTcpLink_Login_rfAckRegisteredPCBangInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      IsRegisteredPCBang;                                       // (Parm)
	unsigned char                                      IsMainPCBang;                                             // (Parm)
	struct FString                                     PCBangName;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqRegisteredPCBangInfo
struct UBTTcpLink_Login_rfReqRegisteredPCBangInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckCharInfo
struct UBTTcpLink_Login_rfAckCharInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                Level;                                                    // (Parm)
	int                                                Exp;                                                      // (Parm)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqCharInfo
struct UBTTcpLink_Login_rfReqCharInfo_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqForceLogoutByOwner
struct UBTTcpLink_Login_rfReqForceLogoutByOwner_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqKeepAlive
struct UBTTcpLink_Login_rfReqKeepAlive_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckMaxUserExceed
struct UBTTcpLink_Login_rfAckMaxUserExceed_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckClanMemberListFromClientEnd
struct UBTTcpLink_Login_rfAckClanMemberListFromClientEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckClanMemberListFromClient
struct UBTTcpLink_Login_rfAckClanMemberListFromClient_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        Level;                                                    // (Parm, NeedCtorLink)
	TArray<struct FString>                             CharName;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              ClanGrade;                                                // (Parm, NeedCtorLink)
	TArray<struct FString>                             ServerName;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             ServerShortName;                                          // (Parm, NeedCtorLink)
	TArray<struct FString>                             ServerIP;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        serverPort;                                               // (Parm, NeedCtorLink)
	TArray<unsigned char>                              CurPos;                                                   // (Parm, NeedCtorLink)
	TArray<int>                                        ChannelNum;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             ChannelNickName;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        GameRoomNum;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckClanMemberListFromClientStart
struct UBTTcpLink_Login_rfAckClanMemberListFromClientStart_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqClanMemberListFromClient
struct UBTTcpLink_Login_rfReqClanMemberListFromClient_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckLoginWithWZAuth
struct UBTTcpLink_Login_rfAckLoginWithWZAuth_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      wzp_AccountType;                                          // (Parm)
	unsigned char                                      wzp_IsBlock;                                              // (Parm)
	unsigned char                                      wzp_AuthKeySuccess;                                       // (Parm)
	unsigned char                                      ChannelType;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqLoginWithWZAuth
struct UBTTcpLink_Login_rfReqLoginWithWZAuth_Params
{
	struct FString                                     AccountID;                                                // (Parm, NeedCtorLink)
	struct FString                                     Guid;                                                     // (Parm, NeedCtorLink)
	struct FString                                     AuthKey;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckProcessPreLoginUser
struct UBTTcpLink_Login_rfAckProcessPreLoginUser_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqProcessPreLoginUser
struct UBTTcpLink_Login_rfReqProcessPreLoginUser_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	unsigned char                                      Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckLoginInHouseTest
struct UBTTcpLink_Login_rfAckLoginInHouseTest_Params
{
	unsigned char                                      Sucess;                                                   // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                TimeStamp;                                                // (Parm)
	int                                                LoginHash1;                                               // (Parm)
	int                                                LoginHash2;                                               // (Parm)
	int                                                LoginHash3;                                               // (Parm)
	int                                                LoginHash4;                                               // (Parm)
	int                                                LoginHash5;                                               // (Parm)
	unsigned char                                      NeedChar;                                                 // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FString                                     BDay;                                                     // (Parm, NeedCtorLink)
	unsigned char                                      Sex;                                                      // (Parm)
	struct FBtrDouble                                  ServerTime;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqLoginInHouseTest
struct UBTTcpLink_Login_rfReqLoginInHouseTest_Params
{
	struct FString                                     UserName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     Password;                                                 // (Parm, NeedCtorLink)
	struct FString                                     Guid;                                                     // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckAdvertisement
struct UBTTcpLink_Login_rfAckAdvertisement_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      Type;                                                     // (Parm)
	struct FString                                     Address;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqAdvertisement
struct UBTTcpLink_Login_rfReqAdvertisement_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckUserDetailInfo
struct UBTTcpLink_Login_rfAckUserDetailInfo_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     UserName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                Ranking;                                                  // (Parm)
	int                                                MatchNum;                                                 // (Parm)
	int                                                WinNum;                                                   // (Parm)
	int                                                LoseNum;                                                  // (Parm)
	int                                                CurrentEXP;                                               // (Parm)
	int                                                NextExp;                                                  // (Parm)
	int                                                ForcedDisconnectedNum;                                    // (Parm)
	int                                                PrimaryWeaponID;                                          // (Parm)
	int                                                SubWeaponID;                                              // (Parm)
	int                                                Point;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqUserDetailInfo
struct UBTTcpLink_Login_rfReqUserDetailInfo_Params
{
	int                                                UserID;                                                   // (Parm)
	struct FString                                     UserName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckFriendsListEnd
struct UBTTcpLink_Login_rfAckFriendsListEnd_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckFriendsList
struct UBTTcpLink_Login_rfAckFriendsList_Params
{
	unsigned char                                      ListType;                                                 // (Parm)
	TArray<struct FString>                             UserName;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsLogOn;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        CMarkPattern;                                             // (Parm, NeedCtorLink)
	TArray<int>                                        CMarkBG;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        CMarkBL;                                                  // (Parm, NeedCtorLink)
	TArray<struct FString>                             ClanName;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        Level;                                                    // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckFriendsListStart
struct UBTTcpLink_Login_rfAckFriendsListStart_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqFriendsList
struct UBTTcpLink_Login_rfReqFriendsList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckConnectChannelServer
struct UBTTcpLink_Login_rfAckConnectChannelServer_Params
{
	struct FString                                     SessionKey;                                               // (Parm, NeedCtorLink)
	int                                                TimeStamp;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqConnectChannelServer
struct UBTTcpLink_Login_rfReqConnectChannelServer_Params
{
	struct FString                                     ServerIP;                                                 // (Parm, NeedCtorLink)
	int                                                serverPort;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckServerList
struct UBTTcpLink_Login_rfAckServerList_Params
{
	TArray<struct FString>                             CServername;                                              // (Parm, NeedCtorLink)
	TArray<struct FString>                             CServerShortName;                                         // (Parm, NeedCtorLink)
	TArray<struct FString>                             ServerIP;                                                 // (Parm, NeedCtorLink)
	TArray<int>                                        serverPort;                                               // (Parm, NeedCtorLink)
	TArray<struct FString>                             ChannelName;                                              // (Parm, NeedCtorLink)
	TArray<struct FString>                             ChannelNickName;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        ChannelNum;                                               // (Parm, NeedCtorLink)
	TArray<int>                                        chMaxUser;                                                // (Parm, NeedCtorLink)
	TArray<int>                                        chCurUser;                                                // (Parm, NeedCtorLink)
	TArray<struct FString>                             ServerGroupName;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        ServerGroupID;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        ServerDispOrder;                                          // (Parm, NeedCtorLink)
	TArray<int>                                        DataPort;                                                 // (Parm, NeedCtorLink)
	TArray<unsigned char>                              OptionCount_byte;                                         // (Parm, NeedCtorLink)
	TArray<unsigned char>                              OptionKey_byte;                                           // (Parm, NeedCtorLink)
	TArray<unsigned char>                              OptionValue_byte;                                         // (Parm, NeedCtorLink)
	TArray<unsigned char>                              OptionCount_int;                                          // (Parm, NeedCtorLink)
	TArray<unsigned char>                              OptionKey_int;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        OptionValue_int;                                          // (Parm, NeedCtorLink)
	TArray<unsigned char>                              OptionCount_float;                                        // (Parm, NeedCtorLink)
	TArray<unsigned char>                              OptionKey_float;                                          // (Parm, NeedCtorLink)
	TArray<float>                                      OptionValue_float;                                        // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsClanChannel;                                            // (Parm, NeedCtorLink)
	TArray<unsigned char>                              IsUseDedicateHost;                                        // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqServerList
struct UBTTcpLink_Login_rfReqServerList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckCreateChar
struct UBTTcpLink_Login_rfAckCreateChar_Params
{
	int                                                Success;                                                  // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqCreateChar
struct UBTTcpLink_Login_rfReqCreateChar_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                HeadItemID;                                               // (Parm)
	int                                                HelmetItemID;                                             // (Parm)
	int                                                AccesoItemID;                                             // (Parm)
	int                                                BackpackItemID;                                           // (Parm)
	int                                                PouchItemID;                                              // (Parm)
	int                                                CamouflageItemID;                                         // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckAccesItemTypeList
struct UBTTcpLink_Login_rfAckAccesItemTypeList_Params
{
	TArray<struct FString>                             AccesoItemName;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        AccesoItemID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqAccesItemTypeList
struct UBTTcpLink_Login_rfReqAccesItemTypeList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckHelmetItemTypeList
struct UBTTcpLink_Login_rfAckHelmetItemTypeList_Params
{
	TArray<struct FString>                             HelmetItemName;                                           // (Parm, NeedCtorLink)
	TArray<int>                                        HelmetItemID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqHelmetItemTypeList
struct UBTTcpLink_Login_rfReqHelmetItemTypeList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckHeadItemTypeList
struct UBTTcpLink_Login_rfAckHeadItemTypeList_Params
{
	TArray<int>                                        HeadItemID;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqHeadItemTypeList
struct UBTTcpLink_Login_rfReqHeadItemTypeList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckLogin
struct UBTTcpLink_Login_rfAckLogin_Params
{
	unsigned char                                      Sucess;                                                   // (Parm)
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	int                                                TimeStamp;                                                // (Parm)
	int                                                LoginHash1;                                               // (Parm)
	int                                                LoginHash2;                                               // (Parm)
	int                                                LoginHash3;                                               // (Parm)
	int                                                LoginHash4;                                               // (Parm)
	int                                                LoginHash5;                                               // (Parm)
	unsigned char                                      NeedChar;                                                 // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqLogin
struct UBTTcpLink_Login_rfReqLogin_Params
{
	struct FString                                     PortalID;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckExceedMaxUser
struct UBTTcpLink_Login_rfAckExceedMaxUser_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckHash
struct UBTTcpLink_Login_rfAckHash_Params
{
	int                                                Result;                                                   // (Parm)
	struct FString                                     ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqHash
struct UBTTcpLink_Login_rfReqHash_Params
{
	int                                                HashField0;                                               // (Parm)
	int                                                HashField1;                                               // (Parm)
	int                                                HashField2;                                               // (Parm)
	int                                                HashField3;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.OnError
struct UBTTcpLink_Login_OnError_Params
{
	int                                                ErrCode;                                                  // (Parm)
};

// Function BatteryNet.BTTcpLink_Login.OnClose
struct UBTTcpLink_Login_OnClose_Params
{
	int                                                ErrCode;                                                  // (Parm)
};

// Function BatteryNet.BTTcpLink_Login.OnConnect
struct UBTTcpLink_Login_OnConnect_Params
{
	int                                                ErrCode;                                                  // (Parm)
};

// Function BatteryNet.BTTcpLink_Login.Close
struct UBTTcpLink_Login_Close_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.ConnectDomain
struct UBTTcpLink_Login_ConnectDomain_Params
{
	struct FString                                     domain;                                                   // (Parm, NeedCtorLink)
	int                                                nPort;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.Connect
struct UBTTcpLink_Login_Connect_Params
{
	struct FString                                     sIpaddr;                                                  // (Parm, NeedCtorLink)
	int                                                nPort;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.InitNetwork
struct UBTTcpLink_Login_InitNetwork_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTSteamMapping.GetPayURL
struct UBTSteamMapping_GetPayURL_Params
{
	struct FString                                     AccountID;                                                // (Parm, NeedCtorLink)
	unsigned char                                      connectAlpha;                                             // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function BatteryNet.BTNatDiag.ProcessStep2
struct UBTNatDiag_ProcessStep2_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTNatDiag.ProcessStep1
struct UBTNatDiag_ProcessStep1_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTNatDiag.GetNatType
struct UBTNatDiag_GetNatType_Params
{
	TEnumAsByte<ENAT_TYPE>                             ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTNatDiag.CheckPhrase2
struct UBTNatDiag_CheckPhrase2_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTNatDiag.CheckPhrase1
struct UBTNatDiag_CheckPhrase1_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTNatDiag.SetSecondServer
struct UBTNatDiag_SetSecondServer_Params
{
	struct FString                                     server_ip;                                                // (Parm, NeedCtorLink)
	int                                                nPort;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTNatDiag.SetPrimaryServer
struct UBTNatDiag_SetPrimaryServer_Params
{
	struct FString                                     server_ip;                                                // (Parm, NeedCtorLink)
	int                                                nPort;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTNatDiag.StartNatCheck
struct UBTNatDiag_StartNatCheck_Params
{
	struct FString                                     nat_server_ip;                                            // (Parm, NeedCtorLink)
	int                                                nPort;                                                    // (Parm)
	struct FString                                     sLocalBindAddr;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTNatDiag.InitNatSocket
struct UBTNatDiag_InitNatSocket_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTNatDiag.SetNatServerIp
struct UBTNatDiag_SetNatServerIp_Params
{
	TArray<struct FString>                             nat_server_ip;                                            // (Parm, NeedCtorLink)
	TArray<int>                                        nPorts;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTNatDiag.Start
struct UBTNatDiag_Start_Params
{
	TArray<struct FString>                             ipaddresses;                                              // (Parm, NeedCtorLink)
	TArray<int>                                        ports;                                                    // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
