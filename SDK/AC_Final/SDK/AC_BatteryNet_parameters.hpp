#pragma once

// Artic Combat (3369) SDK

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
	string                                             GroupName;                                                // (Parm, NeedCtorLink)
	string                                             ServerName;                                               // (Parm, NeedCtorLink)
	int                                                ServerID;                                                 // (Parm)
	string[]                                           key;                                                      // (Parm, NeedCtorLink)
	int[]                                              Value;                                                    // (Parm, NeedCtorLink)
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
	string                                             Subject;                                                  // (Parm, NeedCtorLink)
	string                                             Text;                                                     // (Parm, NeedCtorLink)
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
	string                                             CmdValue;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfReqProcessExcuteCmd
struct UBTTcpLink_Process2Agent_sfReqProcessExcuteCmd_Params
{
	int                                                MajorType;                                                // (Parm)
	int                                                MinorType;                                                // (Parm)
	string                                             CmdValue;                                                 // (Parm, NeedCtorLink)
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
	int[]                                              ChannelNum;                                               // (Parm, NeedCtorLink)
	int[]                                              ChannelMaxUserCount;                                      // (Parm, NeedCtorLink)
	int[]                                              ChannelCurUserCount;                                      // (Parm, NeedCtorLink)
	int[]                                              ChannelPlayingUserCount;                                  // (Parm, NeedCtorLink)
	int[]                                              ChannelRoomCount;                                         // (Parm, NeedCtorLink)
	byte[]                                             ChannelGrade;                                             // (Parm, NeedCtorLink)
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
	string                                             ChannelIPAddr;                                            // (Parm, NeedCtorLink)
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
	byte[]                                             ServerIPAddrType;                                         // (Parm, NeedCtorLink)
	string[]                                           ServerIPAddr;                                             // (Parm, NeedCtorLink)
	byte[]                                             ServerPortType;                                           // (Parm, NeedCtorLink)
	int[]                                              ServerPortNum;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.sfAckHash
struct UBTTcpLink_Process2Agent_sfAckHash_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             GroupName;                                                // (Parm, NeedCtorLink)
	string                                             ServerName;                                               // (Parm, NeedCtorLink)
	int                                                ServerID;                                                 // (Parm)
	string[]                                           key;                                                      // (Parm, NeedCtorLink)
	int[]                                              Value;                                                    // (Parm, NeedCtorLink)
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
	string                                             Subject;                                                  // (Parm, NeedCtorLink)
	string                                             Text;                                                     // (Parm, NeedCtorLink)
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
	string                                             CmdValue;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfReqProcessExcuteCmd
struct UBTTcpLink_Process2Agent_rfReqProcessExcuteCmd_Params
{
	int                                                MajorType;                                                // (Parm)
	int                                                MinorType;                                                // (Parm)
	string                                             CmdValue;                                                 // (Parm, NeedCtorLink)
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
	int[]                                              ChannelNum;                                               // (Parm, NeedCtorLink)
	int[]                                              ChannelMaxUserCount;                                      // (Parm, NeedCtorLink)
	int[]                                              ChannelCurUserCount;                                      // (Parm, NeedCtorLink)
	int[]                                              ChannelPlayingUserCount;                                  // (Parm, NeedCtorLink)
	int[]                                              ChannelRoomCount;                                         // (Parm, NeedCtorLink)
	byte[]                                             ChannelGrade;                                             // (Parm, NeedCtorLink)
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
	string                                             ChannelIPAddr;                                            // (Parm, NeedCtorLink)
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
	byte[]                                             ServerIPAddrType;                                         // (Parm, NeedCtorLink)
	string[]                                           ServerIPAddr;                                             // (Parm, NeedCtorLink)
	byte[]                                             ServerPortType;                                           // (Parm, NeedCtorLink)
	int[]                                              ServerPortNum;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Process2Agent.rfAckHash
struct UBTTcpLink_Process2Agent_rfAckHash_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             sIpaddr;                                                  // (Parm, NeedCtorLink)
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

// Function BatteryNet.BTTcpLink_Channel.sfReqAddSpecialRank
struct UBTTcpLink_Channel_sfReqAddSpecialRank_Params
{
	string                                             NickName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckExpandSlotConfirm
struct UBTTcpLink_Channel_sfAckExpandSlotConfirm_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                QSlotID;                                                  // (Parm)
	struct FBtrDouble                                  MWItemID;                                                 // (Parm)
	struct FBtrDouble                                  PistolItemID;                                             // (Parm)
	struct FBtrDouble                                  TWItemID1;                                                // (Parm)
	struct FBtrDouble                                  TWItemID2;                                                // (Parm)
	int                                                Skill1;                                                   // (Parm)
	int                                                Skill2;                                                   // (Parm)
	int                                                Skill3;                                                   // (Parm)
	int                                                Skill4;                                                   // (Parm)
	struct FBtrDouble                                  KnifeItemID;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqExpandSlotConfirm
struct UBTTcpLink_Channel_sfReqExpandSlotConfirm_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGP20CashModifyWeapon
struct UBTTcpLink_Channel_sfAckGP20CashModifyWeapon_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  UniqueID;                                                 // (Parm)
	int                                                AddPartID;                                                // (Parm)
	int                                                PaintID;                                                  // (Parm)
	int                                                Point;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGP20CashModifyWeapon
struct UBTTcpLink_Channel_sfReqGP20CashModifyWeapon_Params
{
	struct FBtrDouble                                  UniqueID;                                                 // (Parm)
	int                                                AddPartID;                                                // (Parm)
	int                                                PaintID;                                                  // (Parm)
	int[]                                              ProductNo;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckCharDetailInfoWithClan
struct UBTTcpLink_Channel_sfAckCharDetailInfoWithClan_Params
{
	int                                                ErrorCode;                                                // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                Exp;                                                      // (Parm)
	int                                                Level;                                                    // (Parm)
	int                                                LevelMarkID;                                              // (Parm)
	int                                                PreMonthlyRanking;                                        // (Parm)
	int                                                MonthlyRanking;                                           // (Parm)
	int                                                Win;                                                      // (Parm)
	int                                                Lose;                                                     // (Parm)
	int                                                Kill;                                                     // (Parm)
	int                                                Death;                                                    // (Parm)
	int                                                Assist;                                                   // (Parm)
	int                                                KillCountByAimShooting;                                   // (Parm)
	int                                                HeadShot2;                                                // (Parm)
	int                                                TotPlayTime;                                              // (Parm)
	int                                                DisCon;                                                   // (Parm)
	int                                                MainWeaponItemID;                                         // (Parm)
	int                                                MainWeaponPartID;                                         // (Parm)
	int                                                SubWeaponItemID;                                          // (Parm)
	int                                                SubWeaponPartID;                                          // (Parm)
	int                                                AFSpecialCostumeItemID;                                   // (Parm)
	int                                                RSASpecialCostumeItemID;                                  // (Parm)
	int                                                DispHeadItem;                                             // (Parm)
	int                                                DispFaceItem;                                             // (Parm)
	int                                                DispBackpack;                                             // (Parm)
	int                                                DispPouch;                                                // (Parm)
	int                                                DispCamouflage;                                           // (Parm)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanLevel;                                                // (Parm)
	int                                                CM_Pattern;                                               // (Parm)
	int                                                CM_BG;                                                    // (Parm)
	int                                                CM_BL;                                                    // (Parm)
	int                                                ClanExp;                                                  // (Parm)
	byte                                               ClanGrade;                                                // (Parm)
	int                                                ClanActivity;                                             // (Parm)
	int                                                MonthlyConnectingCount;                                   // (Parm)
	int                                                UserClanWin;                                              // (Parm)
	int                                                UserClanLose;                                             // (Parm)
	int                                                UserClanDraw;                                             // (Parm)
	int                                                ClanWin;                                                  // (Parm)
	int                                                ClanLose;                                                 // (Parm)
	int                                                ClanDraw;                                                 // (Parm)
	int                                                PreClanTotalRankCur;                                      // (Parm)
	int                                                ClanTotalRankCur;                                         // (Parm)
	int                                                PreClanMonthlyRankCur;                                    // (Parm)
	int                                                ClanMonthlyRankCur;                                       // (Parm)
	int                                                PreClanMonthlyConnectingRank;                             // (Parm)
	int                                                ClanMonthlyConnectingRank;                                // (Parm)
	string                                             ClanIntro;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqCharDetailInfoWithClan
struct UBTTcpLink_Channel_sfReqCharDetailInfoWithClan_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPcBangItemList
struct UBTTcpLink_Channel_sfAckPcBangItemList_Params
{
	int[]                                              ItemTID;                                                  // (Parm, NeedCtorLink)
	int[]                                              PartID;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqPcBangItemList
struct UBTTcpLink_Channel_sfReqPcBangItemList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyShopPackageItemData
struct UBTTcpLink_Channel_sfReqNotifyShopPackageItemData_Params
{
	int                                                PackageProductNo;                                         // (Parm)
	int[]                                              ProductCode;                                              // (Parm, NeedCtorLink)
	int[]                                              ProductQuantity;                                          // (Parm, NeedCtorLink)
	int[]                                              ProductHour;                                              // (Parm, NeedCtorLink)
	string                                             Description;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckUseItemDuringGame
struct UBTTcpLink_Channel_sfAckUseItemDuringGame_Params
{
	int                                                ErrorCode;                                                // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	int                                                RemainCount;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqUseItemDuringGame
struct UBTTcpLink_Channel_sfReqUseItemDuringGame_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	byte                                               UsingCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfChangeItemInstanceInfo
struct UBTTcpLink_Channel_sfChangeItemInstanceInfo_Params
{
	int                                                ErrorCode;                                                // (Parm)
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	byte                                               ChangeCount;                                              // (Parm)
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
	byte                                               IsNotification;                                           // (Parm)
	string[]                                           NickName;                                                 // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                Time;                                                     // (Parm, NeedCtorLink)
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
	string[]                                           CharList;                                                 // (Parm, NeedCtorLink)
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
	byte                                               RewardedQuestIsComplete;                                  // (Parm)
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
	byte[]                                             Type;                                                     // (Parm, NeedCtorLink)
	byte[]                                             Number;                                                   // (Parm, NeedCtorLink)
	int[]                                              ItemID;                                                   // (Parm, NeedCtorLink)
	int[]                                              ItemCount;                                                // (Parm, NeedCtorLink)
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
	byte                                               IsComplete;                                               // (Parm)
	byte[]                                             UpdatedNum;                                               // (Parm, NeedCtorLink)
	byte[]                                             StateList;                                                // (Parm, NeedCtorLink)
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
	byte                                               ReqType;                                                  // (Parm)
	byte                                               UpdateState;                                              // (Parm)
	struct FBtrDouble                                  PaidItemIdx;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAttendanceList
struct UBTTcpLink_Channel_sfAckAttendanceList_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               IsComplete;                                               // (Parm)
	byte                                               UpdatedNum;                                               // (Parm)
	byte[]                                             StateList;                                                // (Parm, NeedCtorLink)
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
	byte                                               ReqType;                                                  // (Parm)
	byte                                               UpdateNum;                                                // (Parm)
	byte                                               UpdateState;                                              // (Parm)
	struct FBtrDouble                                  PaidItemIdx;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAIRewardResult
struct UBTTcpLink_Channel_sfAckAIRewardResult_Params
{
	byte                                               ClearRewardTYPE;                                          // (Parm)
	int                                                ClearRewardID;                                            // (Parm)
	int                                                ClearRewardCount;                                         // (Parm)
	int[]                                              ScoreRewardUserID;                                        // (Parm, NeedCtorLink)
	byte[]                                             ScoreRewardTYPE;                                          // (Parm, NeedCtorLink)
	int[]                                              ScoreRewardID;                                            // (Parm, NeedCtorLink)
	int[]                                              ScoreRewardCount;                                         // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqCouponUse
struct UBTTcpLink_Channel_sfReqCouponUse_Params
{
	string                                             Serial;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              ProductNo;                                                // (Parm, NeedCtorLink)
	string[]                                           ProductName;                                              // (Parm, NeedCtorLink)
	int[]                                              ProductCode;                                              // (Parm, NeedCtorLink)
	byte[]                                             SaleType;                                                 // (Parm, NeedCtorLink)
	int[]                                              ProductCost;                                              // (Parm, NeedCtorLink)
	int[]                                              ProductHour;                                              // (Parm, NeedCtorLink)
	int[]                                              ProductQuantity;                                          // (Parm, NeedCtorLink)
	int[]                                              SaleMasterFlag;                                           // (Parm, NeedCtorLink)
	int[]                                              SaleStatus;                                               // (Parm, NeedCtorLink)
	int[]                                              IsGift;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                SaleEndTime;                                              // (Parm, NeedCtorLink)
	int[]                                              Discountcost;                                             // (Parm, NeedCtorLink)
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
	byte[]                                             Data;                                                     // (Parm, NeedCtorLink)
	int                                                DataSize;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAhnHsObject
struct UBTTcpLink_Channel_sfReqAhnHsObject_Params
{
	byte[]                                             Data;                                                     // (Parm, NeedCtorLink)
	int                                                DataSize;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfNotifyClanLevelup
struct UBTTcpLink_Channel_sfNotifyClanLevelup_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                Levelup;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfNotifyNewClanName
struct UBTTcpLink_Channel_sfNotifyNewClanName_Params
{
	string                                             New_NickName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfNotifyNewNickName
struct UBTTcpLink_Channel_sfNotifyNewNickName_Params
{
	int                                                Community_Type;                                           // (Parm)
	string                                             Old_NickName;                                             // (Parm, NeedCtorLink)
	string                                             New_NickName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGameMapData
struct UBTTcpLink_Channel_sfAckGameMapData_Params
{
	int[]                                              nIdx;                                                     // (Parm, NeedCtorLink)
	int[]                                              nMapID;                                                   // (Parm, NeedCtorLink)
	string[]                                           nMapNm;                                                   // (Parm, NeedCtorLink)
	float[]                                            fSupHealth;                                               // (Parm, NeedCtorLink)
	float[]                                            fSupHeli;                                                 // (Parm, NeedCtorLink)
	float[]                                            fSupBomb;                                                 // (Parm, NeedCtorLink)
	float[]                                            fSupUAV;                                                  // (Parm, NeedCtorLink)
	int[]                                              nModFFA;                                                  // (Parm, NeedCtorLink)
	int[]                                              nModFFAMax;                                               // (Parm, NeedCtorLink)
	int[]                                              nModTDM;                                                  // (Parm, NeedCtorLink)
	int[]                                              nModTDMMax;                                               // (Parm, NeedCtorLink)
	int[]                                              nModSD;                                                   // (Parm, NeedCtorLink)
	int[]                                              nModSDMax;                                                // (Parm, NeedCtorLink)
	int[]                                              nModDOM;                                                  // (Parm, NeedCtorLink)
	int[]                                              nModDOMMax;                                               // (Parm, NeedCtorLink)
	int[]                                              nModSab;                                                  // (Parm, NeedCtorLink)
	int[]                                              nModSabMax;                                               // (Parm, NeedCtorLink)
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
	byte                                               MessageType;                                              // (Parm)
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
	string                                             TargetCharName;                                           // (Parm, NeedCtorLink)
	byte                                               ServerType;                                               // (Parm)
	string                                             fServername;                                              // (Parm, NeedCtorLink)
	string                                             fServerShortName;                                         // (Parm, NeedCtorLink)
	string                                             fServerIP;                                                // (Parm, NeedCtorLink)
	int                                                fServerPort;                                              // (Parm)
	byte                                               CurPos;                                                   // (Parm)
	byte                                               CurState;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	string                                             ChannelNickName;                                          // (Parm, NeedCtorLink)
	int                                                GameRoomNum;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqFriendPosition
struct UBTTcpLink_Channel_sfReqFriendPosition_Params
{
	string                                             TargetCharName;                                           // (Parm, NeedCtorLink)
	byte                                               CommunityType;                                            // (Parm)
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
	byte                                               Result;                                                   // (Parm)
	byte                                               Reason;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqLogOut
struct UBTTcpLink_Channel_sfReqLogOut_Params
{
	byte                                               Reason;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckTencent_AASInfo
struct UBTTcpLink_Channel_sfAckTencent_AASInfo_Params
{
	int                                                UserID;                                                   // (Parm)
	byte                                               IsAdult;                                                  // (Parm)
	byte                                               IsQQAuth;                                                 // (Parm)
	int                                                AccumTimeSec;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSetCommunityOption
struct UBTTcpLink_Channel_sfAckSetCommunityOption_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrStr;                                                   // (Parm, NeedCtorLink)
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
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                TitleMarkID;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyUpdateCharInfo_LevelMark
struct UBTTcpLink_Channel_sfAckNotifyUpdateCharInfo_LevelMark_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
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
	byte                                               RankingType;                                              // (Parm)
	byte                                               CommunityType;                                            // (Parm)
	string[]                                           CharName;                                                 // (Parm, NeedCtorLink)
	int[]                                              CharLevel;                                                // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanMarkPattern;                                          // (Parm, NeedCtorLink)
	int[]                                              ClanMarkBG;                                               // (Parm, NeedCtorLink)
	int[]                                              ClanMarkBL;                                               // (Parm, NeedCtorLink)
	int[]                                              Ranking_Accum;                                            // (Parm, NeedCtorLink)
	int[]                                              Ranking_Accum_Prev;                                       // (Parm, NeedCtorLink)
	int[]                                              Ranking_Accum_Exp;                                        // (Parm, NeedCtorLink)
	int[]                                              LevelMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              TitleMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              Reserved1;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved2;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved3;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetRankingInfoListStart
struct UBTTcpLink_Channel_sfAckGetRankingInfoListStart_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               RankingType;                                              // (Parm)
	byte                                               CommunityType;                                            // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGetRankingInfoList
struct UBTTcpLink_Channel_sfReqGetRankingInfoList_Params
{
	byte                                               RankingType;                                              // (Parm)
	byte                                               CommunityType;                                            // (Parm)
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
	struct FBtrDouble[]                                MatchDate;                                                // (Parm, NeedCtorLink)
	byte[]                                             IsWin;                                                    // (Parm, NeedCtorLink)
	string[]                                           EnemyClanname;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatchResultHistory
struct UBTTcpLink_Channel_sfReqClanMatchResultHistory_Params
{
	string                                             ClanNm;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckDeleteMailAll
struct UBTTcpLink_Channel_sfAckDeleteMailAll_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               MailType;                                                 // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqDeleteMailAll
struct UBTTcpLink_Channel_sfReqDeleteMailAll_Params
{
	byte                                               MailType;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_PublicWaitRoomChanged
struct UBTTcpLink_Channel_sfAckClanMatch_PublicWaitRoomChanged_Params
{
	int                                                WaitRoomIdx;                                              // (Parm)
	string                                             RoomName;                                                 // (Parm, NeedCtorLink)
	int                                                MapNum;                                                   // (Parm)
	int                                                CurUserCount;                                             // (Parm)
	int                                                MaxUserCount;                                             // (Parm)
	byte                                               Status;                                                   // (Parm)
	byte                                               IsPublic;                                                 // (Parm)
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
	string                                             NewClanname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPaidItem_ChangeClanname
struct UBTTcpLink_Channel_sfAckPaidItem_ChangeClanname_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                RemainCount;                                              // (Parm)
	string                                             NewClanname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqPaidItem_ChangeClanname
struct UBTTcpLink_Channel_sfReqPaidItem_ChangeClanname_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	string                                             NewClanname;                                              // (Parm, NeedCtorLink)
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
	int[]                                              WaitRoomIdx;                                              // (Parm, NeedCtorLink)
	string[]                                           LeaderName;                                               // (Parm, NeedCtorLink)
	string[]                                           RoomName;                                                 // (Parm, NeedCtorLink)
	int[]                                              MapNum;                                                   // (Parm, NeedCtorLink)
	int[]                                              CurUserCount;                                             // (Parm, NeedCtorLink)
	int[]                                              MaxUserCount;                                             // (Parm, NeedCtorLink)
	byte[]                                             Status;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_StartPublicWaitRoomList
struct UBTTcpLink_Channel_sfAckClanMatch_StartPublicWaitRoomList_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte                                               Type;                                                     // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqServerShutdown
struct UBTTcpLink_Channel_sfReqServerShutdown_Params
{
	string                                             AuthKey;                                                  // (Parm, NeedCtorLink)
	int                                                SecondAfter;                                              // (Parm)
	struct FBtrDouble                                  ShutdownTime;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyEndTutorial
struct UBTTcpLink_Channel_sfAckNotifyEndTutorial_Params
{
	int                                                UserID;                                                   // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                Level;                                                    // (Parm)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanMarkPattern;                                          // (Parm)
	int                                                ClanMarkBG;                                               // (Parm)
	int                                                ClanMarkBL;                                               // (Parm)
	int                                                ClanGrade;                                                // (Parm)
	int                                                ClanWin;                                                  // (Parm)
	int                                                ClanLose;                                                 // (Parm)
	byte                                               IsLookFor;                                                // (Parm)
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
	int[]                                              UnqueID;                                                  // (Parm, NeedCtorLink)
	int[]                                              Ping;                                                     // (Parm, NeedCtorLink)
	int                                                HostPriorityPoint;                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRoomUserPingInfo
struct UBTTcpLink_Channel_sfReqRoomUserPingInfo_Params
{
	int[]                                              UnqueID;                                                  // (Parm, NeedCtorLink)
	int[]                                              Ping;                                                     // (Parm, NeedCtorLink)
	int                                                HostPriorityPoint;                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckMyEquipedQSlotList
struct UBTTcpLink_Channel_sfAckMyEquipedQSlotList_Params
{
	byte[]                                             QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                MWUniqueID;                                               // (Parm, NeedCtorLink)
	int[]                                              MWItemID;                                                 // (Parm, NeedCtorLink)
	int[]                                              MWPartID;                                                 // (Parm, NeedCtorLink)
	int[]                                              MWPaintID;                                                // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                PistolUniqueID;                                           // (Parm, NeedCtorLink)
	int[]                                              PistolItemID;                                             // (Parm, NeedCtorLink)
	int[]                                              PistolPartID;                                             // (Parm, NeedCtorLink)
	int[]                                              PistolPaintID;                                            // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                TW1UniqueID;                                              // (Parm, NeedCtorLink)
	int[]                                              TWItemID1;                                                // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                TW2UniqueID;                                              // (Parm, NeedCtorLink)
	int[]                                              TWItemID2;                                                // (Parm, NeedCtorLink)
	int[]                                              Skill1ID;                                                 // (Parm, NeedCtorLink)
	int[]                                              Skill2ID;                                                 // (Parm, NeedCtorLink)
	int[]                                              Skill3ID;                                                 // (Parm, NeedCtorLink)
	int[]                                              Skill4ID;                                                 // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FBtrDouble[]                                KnifeUniqueID;                                            // (Parm, NeedCtorLink)
	int[]                                              KnifeItemID;                                              // (Parm, NeedCtorLink)
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
	int[]                                              SkillIDs;                                                 // (Parm, NeedCtorLink)
	int[]                                              SlotPositions;                                            // (Parm, NeedCtorLink)
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
	int[]                                              ItemIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              SlotPositions;                                            // (Parm, NeedCtorLink)
	int[]                                              AddPartsID;                                               // (Parm, NeedCtorLink)
	int[]                                              PaintID;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UniqueID;                                                 // (Parm, NeedCtorLink)
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
	byte                                               IsFull;                                                   // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               IsLookingFor;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSetLookForClan
struct UBTTcpLink_Channel_sfReqSetLookForClan_Params
{
	byte                                               IsLookingFor;                                             // (Parm)
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
	string                                             OwnerName;                                                // (Parm, NeedCtorLink)
	string                                             OwnerIP;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_SetWaitRoomPublic
struct UBTTcpLink_Channel_sfAckClanMatch_SetWaitRoomPublic_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               Set;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_SetWaitRoomPublic
struct UBTTcpLink_Channel_sfReqClanMatch_SetWaitRoomPublic_Params
{
	byte                                               Set;                                                      // (Parm)
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
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                Pattern;                                                  // (Parm)
	int                                                BG;                                                       // (Parm)
	int                                                BL;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPaidItem_ChangeClanMark
struct UBTTcpLink_Channel_sfAckPaidItem_ChangeClanMark_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                StackCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqPaidItem_ChangeClanMark
struct UBTTcpLink_Channel_sfReqPaidItem_ChangeClanMark_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	byte                                               IsPaid;                                                   // (Parm)
	int                                                Pattern;                                                  // (Parm)
	int                                                BG;                                                       // (Parm)
	int                                                BL;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPaidItem_ClanMarkDupCheck
struct UBTTcpLink_Channel_sfAckPaidItem_ClanMarkDupCheck_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqPaidItem_ClanMarkDupCheck
struct UBTTcpLink_Channel_sfReqPaidItem_ClanMarkDupCheck_Params
{
	byte                                               IsPaid;                                                   // (Parm)
	int                                                Pattern;                                                  // (Parm)
	int                                                BG;                                                       // (Parm)
	int                                                BL;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPaidItem_RelayBroadcast
struct UBTTcpLink_Channel_sfAckPaidItem_RelayBroadcast_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPaidItem_BroadCast
struct UBTTcpLink_Channel_sfAckPaidItem_BroadCast_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                StackCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqPaidItem_BroadCast
struct UBTTcpLink_Channel_sfReqPaidItem_BroadCast_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                Command;                                                  // (Parm)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckPaidItem_EraseRecord
struct UBTTcpLink_Channel_sfAckPaidItem_EraseRecord_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                RemainCount;                                              // (Parm)
	string                                             NewCharname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqPaidItem_ChangeCharname
struct UBTTcpLink_Channel_sfReqPaidItem_ChangeCharname_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	string                                             NewCharname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRecvSystemMsg
struct UBTTcpLink_Channel_sfAckRecvSystemMsg_Params
{
	byte                                               CommunityType;                                            // (Parm)
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
	byte                                               RecvType;                                                 // (Parm)
	string                                             SendCharName;                                             // (Parm, NeedCtorLink)
	string                                             RecvCharname;                                             // (Parm, NeedCtorLink)
	struct FSystemMsgParam                             MsgInfo;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRandomBox_Use
struct UBTTcpLink_Channel_sfAckRandomBox_Use_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  RandomBoxItemIdx;                                         // (Parm)
	int                                                RandomBxoItemCount;                                       // (Parm)
	struct FBtrDouble                                  KeyItemIdx;                                               // (Parm)
	int                                                KeyItemRemainCount;                                       // (Parm)
	int[]                                              ItemIDChoose;                                             // (Parm, NeedCtorLink)
	int[]                                              PartIDChoose;                                             // (Parm, NeedCtorLink)
	int[]                                              PeriodOnChoosenItem;                                      // (Parm, NeedCtorLink)
	int[]                                              StackCountOnChoosenItem;                                  // (Parm, NeedCtorLink)
	byte[]                                             bHave;                                                    // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                ItemIdx;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UntilTime;                                                // (Parm, NeedCtorLink)
	int[]                                              StackCount;                                               // (Parm, NeedCtorLink)
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
	string                                             NewRoomTitle;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChangeRoomTitle_GM
struct UBTTcpLink_Channel_sfAckChangeRoomTitle_GM_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                RoomNumber;                                               // (Parm)
	string                                             NewRoomTitle;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChangeRoomTitle_GM
struct UBTTcpLink_Channel_sfReqChangeRoomTitle_GM_Params
{
	int                                                RoomNumber;                                               // (Parm)
	string                                             NewRoomTitle;                                             // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              QuestID;                                                  // (Parm, NeedCtorLink)
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
	struct FBtrDouble[]                                BlockedItemIdx;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqCharBlockInfo
struct UBTTcpLink_Channel_sfReqCharBlockInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfNotifyPcBangInfo
struct UBTTcpLink_Channel_sfNotifyPcBangInfo_Params
{
	byte                                               PcBang_Grade;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_GetClanWaittingRoomInfo
struct UBTTcpLink_Channel_sfAckClanMatch_GetClanWaittingRoomInfo_Params
{
	int                                                WaitRoomIndex;                                            // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	string                                             WaitRoomName;                                             // (Parm, NeedCtorLink)
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
	int[]                                              BotID;                                                    // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetBotID
struct UBTTcpLink_Channel_sfAckGetBotID_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               RequestedAFCount;                                         // (Parm)
	byte                                               RequestedRSACount;                                        // (Parm)
	int[]                                              AFBotID;                                                  // (Parm, NeedCtorLink)
	int[]                                              RSABotID;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGetBotID
struct UBTTcpLink_Channel_sfReqGetBotID_Params
{
	byte                                               AFCount;                                                  // (Parm)
	byte                                               RSACount;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_ChangeRoomSetting
struct UBTTcpLink_Channel_sfAckClanMatch_ChangeRoomSetting_Params
{
	int                                                WaitRoomIndex;                                            // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	byte                                               IsPublic;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_ChangeRoomSetting
struct UBTTcpLink_Channel_sfReqClanMatch_ChangeRoomSetting_Params
{
	int                                                WaitRoomIndex;                                            // (Parm)
	int[]                                              MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	byte                                               IsPublic;                                                 // (Parm)
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
	string                                             key;                                                      // (Parm, NeedCtorLink)
	string                                             Value;                                                    // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckWebzenBillingUseStorageItem
struct UBTTcpLink_Channel_sfAckWebzenBillingUseStorageItem_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte                                               StorageItemType;                                          // (Parm)
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
	int[]                                              Seq;                                                      // (Parm, NeedCtorLink)
	int[]                                              ItemSeq;                                                  // (Parm, NeedCtorLink)
	int[]                                              GroupCode;                                                // (Parm, NeedCtorLink)
	int[]                                              ShareFlag;                                                // (Parm, NeedCtorLink)
	int[]                                              ProductSeq;                                               // (Parm, NeedCtorLink)
	string[]                                           CashName;                                                 // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                CashPoint;                                                // (Parm, NeedCtorLink)
	string[]                                           SendAccountID;                                            // (Parm, NeedCtorLink)
	string[]                                           SendMessage;                                              // (Parm, NeedCtorLink)
	byte[]                                             ItemType;                                                 // (Parm, NeedCtorLink)
	byte[]                                             RelationType;                                             // (Parm, NeedCtorLink)
	int[]                                              ProductType;                                              // (Parm, NeedCtorLink)
	int[]                                              PriceSeq;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckWebzenBillingStorageListStart
struct UBTTcpLink_Channel_sfAckWebzenBillingStorageListStart_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte                                               Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGiftItemByWebzenCash
struct UBTTcpLink_Channel_sfAckGiftItemByWebzenCash_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                LeftProductCount;                                         // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGiftItemByWebzenCash
struct UBTTcpLink_Channel_sfReqGiftItemByWebzenCash_Params
{
	string                                             ReceiverCharName;                                         // (Parm, NeedCtorLink)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	int                                                PackageProductSeq;                                        // (Parm)
	int                                                PriceSeq;                                                 // (Parm)
	int                                                ProductDisplaySeq;                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGiftItemByWebzenCashGP20
struct UBTTcpLink_Channel_sfReqGiftItemByWebzenCashGP20_Params
{
	string                                             ReceiverCharName;                                         // (Parm, NeedCtorLink)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	int                                                ProductNo;                                                // (Parm)
	byte                                               Cointype;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckBuyItemByWebzenCash
struct UBTTcpLink_Channel_sfAckBuyItemByWebzenCash_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqBuyItemByWebzenCash
struct UBTTcpLink_Channel_sfReqBuyItemByWebzenCash_Params
{
	int                                                PackageProductSeq;                                        // (Parm)
	int                                                ProductDisplaySeq;                                        // (Parm)
	int                                                PriceSeq;                                                 // (Parm)
	int[]                                              ItemIDs;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	byte                                               BuyOption1;                                               // (Parm)
	byte                                               BuyOption2;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqBuyItemByWebzenCashGP20
struct UBTTcpLink_Channel_sfReqBuyItemByWebzenCashGP20_Params
{
	int                                                ProductNo;                                                // (Parm)
	byte                                               Cointype;                                                 // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               IsRegisteredPCBang;                                       // (Parm)
	byte                                               IsMainPCBang;                                             // (Parm)
	string                                             PCBangName;                                               // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string[]                                           FriendName;                                               // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              CM_Pattern;                                               // (Parm, NeedCtorLink)
	int[]                                              CM_BG;                                                    // (Parm, NeedCtorLink)
	int[]                                              CM_BL;                                                    // (Parm, NeedCtorLink)
	int[]                                              Level;                                                    // (Parm, NeedCtorLink)
	int[]                                              ClanGrade;                                                // (Parm, NeedCtorLink)
	int[]                                              ClanWin;                                                  // (Parm, NeedCtorLink)
	int[]                                              ClanLose;                                                 // (Parm, NeedCtorLink)
	byte[]                                             IsLookForClan;                                            // (Parm, NeedCtorLink)
	byte[]                                             IsCombat;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanLevel;                                                // (Parm, NeedCtorLink)
	int[]                                              LevelMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              TitleMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              Reserved1;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved2;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved3;                                                // (Parm, NeedCtorLink)
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
	int[]                                              ExpiredQuestID;                                           // (Parm, NeedCtorLink)
	int[]                                              NewQuestID;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqQuestNewAvailable
struct UBTTcpLink_Channel_sfReqQuestNewAvailable_Params
{
	int[]                                              AchivedQuestID;                                           // (Parm, NeedCtorLink)
	int[]                                              NewQuestID;                                               // (Parm, NeedCtorLink)
	byte[]                                             IsDailyQuest;                                             // (Parm, NeedCtorLink)
	int[]                                              ExpiredQuest;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckQuestUpdate
struct UBTTcpLink_Channel_sfAckQuestUpdate_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqQuestUpdate
struct UBTTcpLink_Channel_sfReqQuestUpdate_Params
{
	int                                                UniqueID;                                                 // (Parm)
	int                                                GameRoomNum;                                              // (Parm)
	int[]                                              QuestID;                                                  // (Parm, NeedCtorLink)
	int[]                                              CountPrograss;                                            // (Parm, NeedCtorLink)
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
	int[]                                              QuestID;                                                  // (Parm, NeedCtorLink)
	int[]                                              CountPrograss;                                            // (Parm, NeedCtorLink)
	byte[]                                             QuestType;                                                // (Parm, NeedCtorLink)
	byte[]                                             IsComplete;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckQuestListStart
struct UBTTcpLink_Channel_sfAckQuestListStart_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte                                               FixedGameMode;                                            // (Parm)
	byte                                               FixedMaxUserCnt;                                          // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              LimitedMapID;                                             // (Parm, NeedCtorLink)
	int[]                                              LimitedModeID;                                            // (Parm, NeedCtorLink)
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
	string                                             RoomUniqueID;                                             // (Parm, NeedCtorLink)
	int                                                RoomNumber;                                               // (Parm)
	byte                                               Answer;                                                   // (Parm)
	string                                             InviteCharName;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvInviteGameRoom
struct UBTTcpLink_Channel_sfReqRecvInviteGameRoom_Params
{
	string                                             InviteUserServerName;                                     // (Parm, NeedCtorLink)
	int                                                InviteUserServerID;                                       // (Parm)
	int                                                InviteUserChannelNumber;                                  // (Parm)
	string                                             RoomUniqueID;                                             // (Parm, NeedCtorLink)
	int                                                RoomNumber;                                               // (Parm)
	string                                             RoomName;                                                 // (Parm, NeedCtorLink)
	byte                                               RoomState;                                                // (Parm)
	string                                             MapName;                                                  // (Parm, NeedCtorLink)
	string                                             OwnerName;                                                // (Parm, NeedCtorLink)
	byte                                               GameMode;                                                 // (Parm)
	byte                                               WeaponLimit;                                              // (Parm)
	byte                                               IsTeamBalance;                                            // (Parm)
	string                                             Password;                                                 // (Parm, NeedCtorLink)
	string                                             InviteCharName;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckInviteGameRoom
struct UBTTcpLink_Channel_sfAckInviteGameRoom_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               Answer;                                                   // (Parm)
	string                                             GuestCharName;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqInviteGameRoom
struct UBTTcpLink_Channel_sfReqInviteGameRoom_Params
{
	string                                             GuestCharName;                                            // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                NewLeader;                                                // (Parm)
	string                                             NewLeaderName;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_ChangeLeader
struct UBTTcpLink_Channel_sfReqClanMatch_ChangeLeader_Params
{
	int                                                WaitRoomIdx;                                              // (Parm)
	int                                                NewLeaderID;                                              // (Parm)
	string                                             NewLeaderName;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_WaittingTeamList
struct UBTTcpLink_Channel_sfAckClanMatch_WaittingTeamList_Params
{
	int                                                TtotlCount;                                               // (Parm)
	int[]                                              Grade;                                                    // (Parm, NeedCtorLink)
	int[]                                              Map;                                                      // (Parm, NeedCtorLink)
	int[]                                              Versus;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_Chat
struct UBTTcpLink_Channel_sfReqClanMatch_Chat_Params
{
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_LeaveNotify
struct UBTTcpLink_Channel_sfAckClanMatch_LeaveNotify_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_Leave
struct UBTTcpLink_Channel_sfAckClanMatch_Leave_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte[]                                             IsLeader;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanMarkPA;                                               // (Parm, NeedCtorLink)
	int[]                                              ClanMarkBG;                                               // (Parm, NeedCtorLink)
	int[]                                              ClanMarkBL;                                               // (Parm, NeedCtorLink)
	int[]                                              Level;                                                    // (Parm, NeedCtorLink)
	string[]                                           CharName;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanGrade;                                                // (Parm, NeedCtorLink)
	int[]                                              ClanWin;                                                  // (Parm, NeedCtorLink)
	int[]                                              ClanLose;                                                 // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanLevel;                                                // (Parm, NeedCtorLink)
	int[]                                              LevelMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              TitleMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              Reserved1;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved2;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved3;                                                // (Parm, NeedCtorLink)
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
	byte                                               IsLeader;                                                 // (Parm)
	int                                                ClanMarkPA;                                               // (Parm)
	int                                                ClanMarkBG;                                               // (Parm)
	int                                                ClanMarkBL;                                               // (Parm)
	int                                                Level;                                                    // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanGrade;                                                // (Parm)
	int                                                ClanWin;                                                  // (Parm)
	int                                                ClanLose;                                                 // (Parm)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             Invitee;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_RecvInviteCrew
struct UBTTcpLink_Channel_sfAckClanMatch_RecvInviteCrew_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             Inviter;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_RecvInviteCrew
struct UBTTcpLink_Channel_sfReqClanMatch_RecvInviteCrew_Params
{
	string                                             Inviter;                                                  // (Parm, NeedCtorLink)
	string                                             ServerIP;                                                 // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	int                                                WaittingID;                                               // (Parm)
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	int                                                MapNum;                                                   // (Parm)
	int                                                InviteUserChannelNum;                                     // (Parm)
	string                                             LeaderName;                                               // (Parm, NeedCtorLink)
	string                                             RoomName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_InviteCrew
struct UBTTcpLink_Channel_sfAckClanMatch_InviteCrew_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_InviteCrew
struct UBTTcpLink_Channel_sfReqClanMatch_InviteCrew_Params
{
	string                                             Invitee;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_NotifiyStartCombat
struct UBTTcpLink_Channel_sfAckClanMatch_NotifiyStartCombat_Params
{
	int[]                                              MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_StartCombat
struct UBTTcpLink_Channel_sfAckClanMatch_StartCombat_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanMatch_StartCombat
struct UBTTcpLink_Channel_sfReqClanMatch_StartCombat_Params
{
	int[]                                              MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanMatch_GetReady
struct UBTTcpLink_Channel_sfAckClanMatch_GetReady_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              UserID;                                                   // (Parm, NeedCtorLink)
	int[]                                              TeamNum;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetItemFromItemBox
struct UBTTcpLink_Channel_sfAckGetItemFromItemBox_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                ItemIDChoose;                                             // (Parm)
	int                                                PartIDChoose;                                             // (Parm)
	struct FBtrDouble                                  BoxItemIdx;                                               // (Parm)
	int                                                BxoItemCount;                                             // (Parm)
	byte                                               bHave;                                                    // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	int                                                BoxItemID;                                                // (Parm)
	int[]                                              ItemID;                                                   // (Parm, NeedCtorLink)
	int[]                                              PartID;                                                   // (Parm, NeedCtorLink)
	byte                                               FromContent;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqItemListInItemBox
struct UBTTcpLink_Channel_sfReqItemListInItemBox_Params
{
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	int                                                BoxItemID;                                                // (Parm)
	byte                                               FromContent;                                              // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UID;                                                      // (Parm)
	string                                             UserName;                                                 // (Parm, NeedCtorLink)
	int                                                Grade;                                                    // (Parm)
	int                                                TeamNum;                                                  // (Parm)
	byte                                               Statue;                                                   // (Parm)
	byte                                               IsHost;                                                   // (Parm)
	string                                             UserIP;                                                   // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                CM_Pattern;                                               // (Parm)
	int                                                CM_BG;                                                    // (Parm)
	int                                                CM_BL;                                                    // (Parm)
	byte                                               IsLookFor;                                                // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	struct FBtrDouble[]                                ItemUniqueIDs;                                            // (Parm, NeedCtorLink)
	int[]                                              ItemIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              ItemPartIDs;                                              // (Parm, NeedCtorLink)
	byte[]                                             ItemSlotPos;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChatWispherMyCommunity
struct UBTTcpLink_Channel_sfAckChatWispherMyCommunity_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChatWispherMyCommunity
struct UBTTcpLink_Channel_sfReqChatWispherMyCommunity_Params
{
	string                                             SourceCharName;                                           // (Parm, NeedCtorLink)
	string                                             SenderName;                                               // (Parm, NeedCtorLink)
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyDisconnectHostInLoading
struct UBTTcpLink_Channel_sfReqNotifyDisconnectHostInLoading_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                HostID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvForceDisconnected_FromGM
struct UBTTcpLink_Channel_sfReqRecvForceDisconnected_FromGM_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckForceDisconnectUser_GM
struct UBTTcpLink_Channel_sfAckForceDisconnectUser_GM_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqForceDisconnectUser_GM
struct UBTTcpLink_Channel_sfReqForceDisconnectUser_GM_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvNotice_FromGM
struct UBTTcpLink_Channel_sfReqRecvNotice_FromGM_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string[]                                           NoticeMsg;                                                // (Parm, NeedCtorLink)
	byte                                               IsFromDB;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotice_GM
struct UBTTcpLink_Channel_sfAckNotice_GM_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               NoticeType;                                               // (Parm)
	int                                                ServerID;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                GameRoomNum;                                              // (Parm)
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotice_GM
struct UBTTcpLink_Channel_sfReqNotice_GM_Params
{
	byte                                               NoticeType;                                               // (Parm)
	int                                                ServerID;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                GameRoomNum;                                              // (Parm)
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSpecificChannelUserInfo
struct UBTTcpLink_Channel_sfAckSpecificChannelUserInfo_Params
{
	int                                                UID;                                                      // (Parm)
	string                                             UserID;                                                   // (Parm, NeedCtorLink)
	int                                                UserLevels;                                               // (Parm)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanPattern;                                              // (Parm)
	int                                                ClanBG;                                                   // (Parm)
	int                                                ClanBL;                                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             Title;                                                    // (Parm, NeedCtorLink)
	string                                             MapName;                                                  // (Parm, NeedCtorLink)
	int                                                MapNum;                                                   // (Parm)
	byte                                               UserCount;                                                // (Parm)
	byte                                               MaxCount;                                                 // (Parm)
	string                                             GameModeName;                                             // (Parm, NeedCtorLink)
	int                                                ModeNum;                                                  // (Parm)
	byte                                               WeaponLimit;                                              // (Parm)
	byte                                               IsHardCore;                                               // (Parm)
	byte                                               Status;                                                   // (Parm)
	string                                             RoomOwnerIP;                                              // (Parm, NeedCtorLink)
	int                                                GameMinute;                                               // (Parm)
	string                                             RoomOwnerName;                                            // (Parm, NeedCtorLink)
	byte                                               IsSpecial;                                                // (Parm)
	byte                                               IsPassword;                                               // (Parm)
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
	int[]                                              UID;                                                      // (Parm, NeedCtorLink)
	string[]                                           CharName;                                                 // (Parm, NeedCtorLink)
	int[]                                              UserLevel;                                                // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanPattern;                                              // (Parm, NeedCtorLink)
	int[]                                              ClanBG;                                                   // (Parm, NeedCtorLink)
	int[]                                              ClanBL;                                                   // (Parm, NeedCtorLink)
	byte[]                                             IsLookForClan;                                            // (Parm, NeedCtorLink)
	int[]                                              ClanLevel;                                                // (Parm, NeedCtorLink)
	int[]                                              LevelMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              TitleMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              Reserved1;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved2;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved3;                                                // (Parm, NeedCtorLink)
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
	string                                             FromCharName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckDeleteFriend
struct UBTTcpLink_Channel_sfAckDeleteFriend_Params
{
	int                                                Result;                                                   // (Parm)
	string[]                                           FailedCharname;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqDeleteFriend
struct UBTTcpLink_Channel_sfReqDeleteFriend_Params
{
	string[]                                           DeleteCharName;                                           // (Parm, NeedCtorLink)
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
	struct FBtrDouble[]                                ItemUniqueID;                                             // (Parm, NeedCtorLink)
	int[]                                              ItemSlotNum;                                              // (Parm, NeedCtorLink)
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
	int[]                                              GetChopperAssistUID;                                      // (Parm, NeedCtorLink)
	float                                              KillXCoord;                                               // (Parm)
	float                                              KillYCoord;                                               // (Parm)
	float                                              KillZCoord;                                               // (Parm)
	int                                                KillPos;                                                  // (Parm)
	int                                                KillWeaponID;                                             // (Parm)
	int                                                KillWeaponPartID;                                         // (Parm)
	int                                                KillRange;                                                // (Parm)
	int                                                KillDamage;                                               // (Parm)
	int                                                ChopperCallerID;                                          // (Parm)
	string                                             ChopperCallerName;                                        // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                ItemUniqueID;                                             // (Parm, NeedCtorLink)
	int[]                                              ItemIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              PartIDs;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckIsAvailClanURL
struct UBTTcpLink_Channel_sfAckIsAvailClanURL_Params
{
	string                                             ClanURL;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqIsAvailClanURL
struct UBTTcpLink_Channel_sfReqIsAvailClanURL_Params
{
	string                                             ClanURL;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetIsHostBlocking
struct UBTTcpLink_Channel_sfAckGetIsHostBlocking_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               Blocking;                                                 // (Parm)
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
	byte                                               Blocking;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyHostBlocking
struct UBTTcpLink_Channel_sfReqNotifyHostBlocking_Params
{
	byte                                               Blocking;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetHolePunchingResult
struct UBTTcpLink_Channel_sfAckGetHolePunchingResult_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               Phrase;                                                   // (Parm)
	int                                                InterventionUserID;                                       // (Parm)
	byte                                               Intervention;                                             // (Parm)
	int[]                                              FailedUserIDs;                                            // (Parm, NeedCtorLink)
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
	byte                                               Phrase;                                                   // (Parm)
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
	string                                             RelayIP;                                                  // (Parm, NeedCtorLink)
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
	byte                                               Destination;                                              // (Parm)
	string                                             LogMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGamePlay_SetRoundStartTime
struct UBTTcpLink_Channel_sfReqGamePlay_SetRoundStartTime_Params
{
	int[]                                              UID;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGamePlay_SetGameStartTime
struct UBTTcpLink_Channel_sfReqGamePlay_SetGameStartTime_Params
{
	int[]                                              UID;                                                      // (Parm, NeedCtorLink)
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
	int[]                                              TakerUID;                                                 // (Parm, NeedCtorLink)
	byte                                               TakePos;                                                  // (Parm)
	float[]                                            TakerXCoord;                                              // (Parm, NeedCtorLink)
	float[]                                            TakerYCoord;                                              // (Parm, NeedCtorLink)
	float[]                                            TakerZCoord;                                              // (Parm, NeedCtorLink)
	int[]                                              TakerPos;                                                 // (Parm, NeedCtorLink)
	int[]                                              TakerWeaponID;                                            // (Parm, NeedCtorLink)
	int[]                                              TakerWeaponPartID;                                        // (Parm, NeedCtorLink)
	int[]                                              TakerRange;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyChangeRoomState
struct UBTTcpLink_Channel_sfReqNotifyChangeRoomState_Params
{
	byte                                               RoomState;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqGamePlay_DefuseBomb
struct UBTTcpLink_Channel_sfReqGamePlay_DefuseBomb_Params
{
	int                                                DefuserUID;                                               // (Parm)
	byte                                               DefusePos;                                                // (Parm)
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
	byte                                               InstallPos;                                               // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                CM_Pattern;                                               // (Parm)
	int                                                CM_BG;                                                    // (Parm)
	int                                                CM_BL;                                                    // (Parm)
	string                                             ClanPersonIntro;                                          // (Parm, NeedCtorLink)
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
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
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
	string                                             ClientIP;                                                 // (Parm, NeedCtorLink)
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
	byte                                               VTeam;                                                    // (Parm)
	byte                                               VTeamAD;                                                  // (Parm)
	int                                                AFScore;                                                  // (Parm)
	int                                                RSAScore;                                                 // (Parm)
	int                                                Round;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqLogGetScore
struct UBTTcpLink_Channel_sfReqLogGetScore_Params
{
	struct FKillDeathLog                               KillDeathLogParam;                                        // (Parm)
	int[]                                              AssistUIDs;                                               // (Parm, NeedCtorLink)
	byte[]                                             AssistScores;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAuctionTradeHistory
struct UBTTcpLink_Channel_sfAckAuctionTradeHistory_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                ItemID;                                                   // (Parm)
	int                                                PartID;                                                   // (Parm)
	string[]                                           SellerCharNm;                                             // (Parm, NeedCtorLink)
	int[]                                              DamageDegree;                                             // (Parm, NeedCtorLink)
	int[]                                              Price;                                                    // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                PointRemain;                                              // (Parm)
	int                                                CashRemain;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSendGift
struct UBTTcpLink_Channel_sfReqSendGift_Params
{
	int                                                ItemID;                                                   // (Parm)
	string                                             RecvCharname;                                             // (Parm, NeedCtorLink)
	string                                             RecvMessage;                                              // (Parm, NeedCtorLink)
	byte                                               BuyOption1;                                               // (Parm)
	byte                                               BuyOption2;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetAttachedItemFromMemo
struct UBTTcpLink_Channel_sfAckGetAttachedItemFromMemo_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChatClan
struct UBTTcpLink_Channel_sfAckChatClan_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChatClan
struct UBTTcpLink_Channel_sfReqChatClan_Params
{
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckTestDouble
struct UBTTcpLink_Channel_sfAckTestDouble_Params
{
	struct FBtrDouble                                  vDouble;                                                  // (Parm)
	struct FBtrDouble[]                                vDoubles;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqTestDouble
struct UBTTcpLink_Channel_sfReqTestDouble_Params
{
	struct FBtrDouble                                  vDouble;                                                  // (Parm)
	struct FBtrDouble[]                                vDoubles;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyLoadingState
struct UBTTcpLink_Channel_sfAckNotifyLoadingState_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                UserID;                                                   // (Parm)
	byte                                               LoadingState;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqNotifyLoadingState
struct UBTTcpLink_Channel_sfReqNotifyLoadingState_Params
{
	byte                                               LoadingState;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckFailedStartGame
struct UBTTcpLink_Channel_sfAckFailedStartGame_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               IsHost;                                                   // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               IsHost;                                                   // (Parm)
	string                                             HostIP;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             PersonelIntro;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanCharPersonelIntro
struct UBTTcpLink_Channel_sfReqClanCharPersonelIntro_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanPersonelIntro
struct UBTTcpLink_Channel_sfAckClanPersonelIntro_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanPersonelIntro
struct UBTTcpLink_Channel_sfReqClanPersonelIntro_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             PersonelIntro;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanChangeInfo
struct UBTTcpLink_Channel_sfAckClanChangeInfo_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanChangeInfo
struct UBTTcpLink_Channel_sfReqClanChangeInfo_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	byte                                               IsRecruit;                                                // (Parm)
	byte                                               Region;                                                   // (Parm)
	string                                             Keyword;                                                  // (Parm, NeedCtorLink)
	string                                             ClanIntro;                                                // (Parm, NeedCtorLink)
	string                                             Notice;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanClose
struct UBTTcpLink_Channel_sfAckClanClose_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanClose
struct UBTTcpLink_Channel_sfReqClanClose_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyClanSecession
struct UBTTcpLink_Channel_sfAckNotifyClanSecession_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanSecession
struct UBTTcpLink_Channel_sfAckClanSecession_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanSecession
struct UBTTcpLink_Channel_sfReqClanSecession_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClanNews
struct UBTTcpLink_Channel_sfAckClanNews_Params
{
	string[]                                           IssueDate;                                                // (Parm, NeedCtorLink)
	byte[]                                             IssueType;                                                // (Parm, NeedCtorLink)
	string[]                                           IssuedClanMember;                                         // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqClanNews
struct UBTTcpLink_Channel_sfReqClanNews_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyAdjustClanMemberGrade
struct UBTTcpLink_Channel_sfAckNotifyAdjustClanMemberGrade_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	byte                                               CharGrade;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAdjustClanMemberGrade
struct UBTTcpLink_Channel_sfAckAdjustClanMemberGrade_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	byte                                               CharGrade;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAdjustClanMemberGrade
struct UBTTcpLink_Channel_sfReqAdjustClanMemberGrade_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	byte                                               CharGrade;                                                // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              Level;                                                    // (Parm, NeedCtorLink)
	string[]                                           CharName;                                                 // (Parm, NeedCtorLink)
	byte[]                                             ClanGrade;                                                // (Parm, NeedCtorLink)
	int[]                                              ClanWinCnt;                                               // (Parm, NeedCtorLink)
	int[]                                              ClanLoseCnt;                                              // (Parm, NeedCtorLink)
	int[]                                              LevelMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              TitleMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              DudeId;                                                   // (Parm, NeedCtorLink)
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
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSearchClan
struct UBTTcpLink_Channel_sfAckSearchClan_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                TotalPage;                                                // (Parm)
	int[]                                              ClanMarkPattern;                                          // (Parm, NeedCtorLink)
	int[]                                              ClanMarkBG;                                               // (Parm, NeedCtorLink)
	byte[]                                             ClanMarkBL;                                               // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	string[]                                           ClanMaster;                                               // (Parm, NeedCtorLink)
	int[]                                              ClanMember;                                               // (Parm, NeedCtorLink)
	int[]                                              ClanMemberMax;                                            // (Parm, NeedCtorLink)
	int[]                                              ClanCreateDate;                                           // (Parm, NeedCtorLink)
	int[]                                              ClanWin;                                                  // (Parm, NeedCtorLink)
	int[]                                              ClanLose;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanDraw;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanRank;                                                 // (Parm, NeedCtorLink)
	byte[]                                             ClanRecruit;                                              // (Parm, NeedCtorLink)
	int[]                                              ClanLevel;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSerachClan
struct UBTTcpLink_Channel_sfReqSerachClan_Params
{
	byte                                               SearchType;                                               // (Parm)
	string                                             Keyword;                                                  // (Parm, NeedCtorLink)
	byte                                               ClanStatus;                                               // (Parm)
	byte                                               ClanRegion;                                               // (Parm)
	int                                                ReqPage;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckJoinClanResult
struct UBTTcpLink_Channel_sfAckJoinClanResult_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	byte                                               Permit;                                                   // (Parm)
	string                                             PermitCharName;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRecvJoinClanResult
struct UBTTcpLink_Channel_sfAckRecvJoinClanResult_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRecvJoinClan
struct UBTTcpLink_Channel_sfAckRecvJoinClan_Params
{
	int                                                UserIdx;                                                  // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             ReqMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               Permit;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvJoinClan
struct UBTTcpLink_Channel_sfReqRecvJoinClan_Params
{
	int                                                UserIdx;                                                  // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckJoinClan
struct UBTTcpLink_Channel_sfAckJoinClan_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             SpecificCharName;                                         // (Parm, NeedCtorLink)
	string                                             RealRecvCharName;                                         // (Parm, NeedCtorLink)
	byte                                               RealRecvCharClanGrade;                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqJoinClan
struct UBTTcpLink_Channel_sfReqJoinClan_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             ClanManagerName;                                          // (Parm, NeedCtorLink)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckInviteClanResult
struct UBTTcpLink_Channel_sfAckInviteClanResult_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	byte                                               Permit;                                                   // (Parm)
	string                                             ClanNm;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRecvClanInviteResult
struct UBTTcpLink_Channel_sfAckRecvClanInviteResult_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRecvClanInvite
struct UBTTcpLink_Channel_sfAckRecvClanInvite_Params
{
	int                                                InviterUserDBID;                                          // (Parm)
	string                                             InviterCharname;                                          // (Parm, NeedCtorLink)
	string                                             InviterMsg;                                               // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	byte                                               Permit;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvClanInvite
struct UBTTcpLink_Channel_sfReqRecvClanInvite_Params
{
	int                                                InviterUserDBID;                                          // (Parm)
	string                                             InviterCharname;                                          // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             InviteMsg;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckInviteClan
struct UBTTcpLink_Channel_sfAckInviteClan_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqInviteClan
struct UBTTcpLink_Channel_sfReqInviteClan_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             InviteMsg;                                                // (Parm, NeedCtorLink)
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
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckCreateClan
struct UBTTcpLink_Channel_sfAckCreateClan_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                StackCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqCreateClan
struct UBTTcpLink_Channel_sfReqCreateClan_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             ClanURL;                                                  // (Parm, NeedCtorLink)
	string                                             ClanIntro;                                                // (Parm, NeedCtorLink)
	string                                             ClanKeyword;                                              // (Parm, NeedCtorLink)
	byte                                               ClanRegion;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckDupCheckClanName
struct UBTTcpLink_Channel_sfAckDupCheckClanName_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqDupCheckClanName
struct UBTTcpLink_Channel_sfReqDupCheckClanName_Params
{
	string                                             ClanNam;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSellShopItemInfo
struct UBTTcpLink_Channel_sfAckSellShopItemInfo_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               Section;                                                  // (Parm)
	byte                                               Classfy;                                                  // (Parm)
	int                                                ItemType;                                                 // (Parm)
	int                                                ItemGrade;                                                // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAuctionItemListCount
struct UBTTcpLink_Channel_sfReqAuctionItemListCount_Params
{
	byte                                               Section;                                                  // (Parm)
	byte                                               Classfy;                                                  // (Parm)
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
	byte[]                                             QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	int[]                                              MWItemID;                                                 // (Parm, NeedCtorLink)
	int[]                                              MWPartID;                                                 // (Parm, NeedCtorLink)
	int[]                                              MWPaintID;                                                // (Parm, NeedCtorLink)
	int[]                                              PistolItemID;                                             // (Parm, NeedCtorLink)
	int[]                                              PistolPartID;                                             // (Parm, NeedCtorLink)
	int[]                                              PistolPaintID;                                            // (Parm, NeedCtorLink)
	int[]                                              TWItemID1;                                                // (Parm, NeedCtorLink)
	int[]                                              TWItemID2;                                                // (Parm, NeedCtorLink)
	int[]                                              Skill1ID;                                                 // (Parm, NeedCtorLink)
	int[]                                              Skill2ID;                                                 // (Parm, NeedCtorLink)
	int[]                                              Skill3ID;                                                 // (Parm, NeedCtorLink)
	int[]                                              Skill4ID;                                                 // (Parm, NeedCtorLink)
	int[]                                              KWItemID;                                                 // (Parm, NeedCtorLink)
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
	byte[]                                             QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                MWUniqueID;                                               // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                PistolUniqueID;                                           // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                TW1UniqueID;                                              // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                TW2UniqueID;                                              // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                KnifeUniqueID;                                            // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte                                               Section;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAuctionItemList
struct UBTTcpLink_Channel_sfAckAuctionItemList_Params
{
	byte                                               Section;                                                  // (Parm)
	int[]                                              UniqueIDs;                                                // (Parm, NeedCtorLink)
	int[]                                              ItemIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              AddPartsIDs;                                              // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UntilTimes;                                               // (Parm, NeedCtorLink)
	int[]                                              BiddingPrices;                                            // (Parm, NeedCtorLink)
	int[]                                              InstantlyByuingPrices;                                    // (Parm, NeedCtorLink)
	int[]                                              ItemDamageds;                                             // (Parm, NeedCtorLink)
	string[]                                           HighestBidderNames;                                       // (Parm, NeedCtorLink)
	string[]                                           SellerNames;                                              // (Parm, NeedCtorLink)
	int[]                                              ItemCount;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAuctionItemListStart
struct UBTTcpLink_Channel_sfAckAuctionItemListStart_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               Section;                                                  // (Parm)
	int                                                PageNum;                                                  // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAuctionItemList
struct UBTTcpLink_Channel_sfReqAuctionItemList_Params
{
	byte                                               Section;                                                  // (Parm)
	string                                             Keyword;                                                  // (Parm, NeedCtorLink)
	int                                                ItemRank;                                                 // (Parm)
	byte                                               ItemClassfy;                                              // (Parm)
	byte                                               IsAvailable;                                              // (Parm)
	int                                                PageNum;                                                  // (Parm)
	int                                                Count;                                                    // (Parm)
	int                                                SortOpt;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAuctionMyItemCancel
struct UBTTcpLink_Channel_sfAckAuctionMyItemCancel_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                Point;                                                    // (Parm)
	int                                                Cash;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqMyMoney
struct UBTTcpLink_Channel_sfReqMyMoney_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckUpdateQSlot_2
struct UBTTcpLink_Channel_sfAckUpdateQSlot_2_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte[]                                             DisplayOrder;                                             // (Parm, NeedCtorLink)
	int[]                                              ItemTID;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                ItemUID;                                                  // (Parm, NeedCtorLink)
	byte[]                                             SlotPos_Key;                                              // (Parm, NeedCtorLink)
	byte[]                                             SlotPos_Value;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqUpdateQSlot_2
struct UBTTcpLink_Channel_sfReqUpdateQSlot_2_Params
{
	byte[]                                             DisplayOrder;                                             // (Parm, NeedCtorLink)
	int[]                                              ItemTID;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                ItemUID;                                                  // (Parm, NeedCtorLink)
	byte[]                                             SlotPos_Key;                                              // (Parm, NeedCtorLink)
	byte[]                                             SlotPos_Value;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckUpdateQSlot
struct UBTTcpLink_Channel_sfAckUpdateQSlot_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqUpdateQSlot
struct UBTTcpLink_Channel_sfReqUpdateQSlot_Params
{
	int                                                QSlotID;                                                  // (Parm)
	string                                             QSlotName;                                                // (Parm, NeedCtorLink)
	struct FBtrDouble                                  MWItemID;                                                 // (Parm)
	struct FBtrDouble                                  PistolItemID;                                             // (Parm)
	struct FBtrDouble                                  TWItemID1;                                                // (Parm)
	struct FBtrDouble                                  TWItemID2;                                                // (Parm)
	int                                                Skill1;                                                   // (Parm)
	int                                                Skill2;                                                   // (Parm)
	int                                                Skill3;                                                   // (Parm)
	int                                                Skill4;                                                   // (Parm)
	struct FBtrDouble                                  KnifeItemID;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckQSlotList_2
struct UBTTcpLink_Channel_sfAckQSlotList_2_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte[]                                             QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	int[]                                              QSlotIDX;                                                 // (Parm, NeedCtorLink)
	int[]                                              ItemTID;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                ItemUID;                                                  // (Parm, NeedCtorLink)
	byte[]                                             SlotPos;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqQSlotList_2
struct UBTTcpLink_Channel_sfReqQSlotList_2_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckQSlotList
struct UBTTcpLink_Channel_sfAckQSlotList_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              QSlotID;                                                  // (Parm, NeedCtorLink)
	string[]                                           QSlotName;                                                // (Parm, NeedCtorLink)
	byte[]                                             QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                MWItemID;                                                 // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                PistolItemID;                                             // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                TWItemID1;                                                // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                TWItemID2;                                                // (Parm, NeedCtorLink)
	int[]                                              Skill1;                                                   // (Parm, NeedCtorLink)
	int[]                                              Skill2;                                                   // (Parm, NeedCtorLink)
	int[]                                              Skill3;                                                   // (Parm, NeedCtorLink)
	int[]                                              Skill4;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                KnifeItemID;                                              // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UniqueItemID;                                             // (Parm, NeedCtorLink)
	int                                                RepairCost;                                               // (Parm)
	int[]                                              DamageDegree;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRepairItem
struct UBTTcpLink_Channel_sfReqRepairItem_Params
{
	struct FBtrDouble[]                                UniqueItemID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRepairCost
struct UBTTcpLink_Channel_sfAckRepairCost_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UniqueItemID;                                             // (Parm, NeedCtorLink)
	int[]                                              RepairCost;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRepairCost
struct UBTTcpLink_Channel_sfReqRepairCost_Params
{
	struct FBtrDouble[]                                UniqueItemID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckUpdateWeaponDurability
struct UBTTcpLink_Channel_sfAckUpdateWeaponDurability_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UniqueItemID;                                             // (Parm, NeedCtorLink)
	int[]                                              Durability;                                               // (Parm, NeedCtorLink)
	byte[]                                             IsDestroy;                                                // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                FailedWeaponUniqueID;                                     // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqUpdateWeaponDurability
struct UBTTcpLink_Channel_sfReqUpdateWeaponDurability_Params
{
	int                                                TotalPlayTime;                                            // (Parm)
	int[]                                              OwnerID;                                                  // (Parm, NeedCtorLink)
	int[]                                              Number;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UniqueItemID;                                             // (Parm, NeedCtorLink)
	int[]                                              UsingSec;                                                 // (Parm, NeedCtorLink)
	int[]                                              UsingRoundInSD;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckModifyWeapon
struct UBTTcpLink_Channel_sfAckModifyWeapon_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              Result;                                                   // (Parm, NeedCtorLink)
	int[]                                              BoughtItemTypeID;                                         // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                BoughtItemUniqueID;                                       // (Parm, NeedCtorLink)
	int[]                                              BoughtPartID;                                             // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                BoughtUntilTIme;                                          // (Parm, NeedCtorLink)
	int[]                                              BoughtStackCnt;                                           // (Parm, NeedCtorLink)
	int                                                PointRemain;                                              // (Parm)
	int                                                CashRemain;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqBuyShopItem
struct UBTTcpLink_Channel_sfReqBuyShopItem_Params
{
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	byte                                               BuyOption1;                                               // (Parm)
	byte                                               BuyOption2;                                               // (Parm)
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
	int[]                                              ItemID;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte[]                                             DisplayOrder;                                             // (Parm, NeedCtorLink)
	byte[]                                             SlotPos;                                                  // (Parm, NeedCtorLink)
	int[]                                              ItemTID;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                ItemUID;                                                  // (Parm, NeedCtorLink)
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
	byte[]                                             DisplayOrder;                                             // (Parm, NeedCtorLink)
	byte[]                                             SlotPos;                                                  // (Parm, NeedCtorLink)
	int[]                                              ItemTID;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                ItemUID;                                                  // (Parm, NeedCtorLink)
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
	int[]                                              SkillIDs;                                                 // (Parm, NeedCtorLink)
	byte[]                                             NewStates;                                                // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              ItemIDs;                                                  // (Parm, NeedCtorLink)
	byte[]                                             NewStates;                                                // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte                                               ChangedNewSlotPosition;                                   // (Parm)
	int                                                ChangedOldSkillID;                                        // (Parm)
	int                                                ChangedOldSkillUniqueID;                                  // (Parm)
	byte                                               ChangedOldSlotPosition;                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqEquipSkill
struct UBTTcpLink_Channel_sfReqEquipSkill_Params
{
	int                                                SkillID;                                                  // (Parm)
	int                                                SkillUniqueID;                                            // (Parm)
	byte                                               NewSlotPosition;                                          // (Parm)
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
	int[]                                              UniqueSkillID;                                            // (Parm, NeedCtorLink)
	int[]                                              SkillID;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UntilTime;                                                // (Parm, NeedCtorLink)
	byte[]                                             SlotPosition;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckUserSkillListStart
struct UBTTcpLink_Channel_sfAckUserSkillListStart_Params
{
	int                                                Count;                                                    // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              FailedMemoID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqDelMemo
struct UBTTcpLink_Channel_sfReqDelMemo_Params
{
	int[]                                              MemoIdx;                                                  // (Parm, NeedCtorLink)
	byte                                               Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckReadMemo
struct UBTTcpLink_Channel_sfAckReadMemo_Params
{
	string                                             cnameFrom;                                                // (Parm, NeedCtorLink)
	string                                             Text;                                                     // (Parm, NeedCtorLink)
	string                                             dateRecv;                                                 // (Parm, NeedCtorLink)
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
	int[]                                              MemoIdx;                                                  // (Parm, NeedCtorLink)
	string[]                                           cnameFrom;                                                // (Parm, NeedCtorLink)
	string[]                                           dateRecv;                                                 // (Parm, NeedCtorLink)
	string[]                                           Text;                                                     // (Parm, NeedCtorLink)
	byte[]                                             Status;                                                   // (Parm, NeedCtorLink)
	int[]                                              UntilExpire;                                              // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                ItemUID;                                                  // (Parm, NeedCtorLink)
	int[]                                              ItemID;                                                   // (Parm, NeedCtorLink)
	byte[]                                             MsgType;                                                  // (Parm, NeedCtorLink)
	int[]                                              ItemPartID;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckStartMemoList
struct UBTTcpLink_Channel_sfAckStartMemoList_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               Type;                                                     // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqMemoList
struct UBTTcpLink_Channel_sfReqMemoList_Params
{
	byte                                               Type;                                                     // (Parm)
	byte                                               MemoType;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvMemo
struct UBTTcpLink_Channel_sfReqRecvMemo_Params
{
	string                                             cnameFrom;                                                // (Parm, NeedCtorLink)
	byte                                               MemoType;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSendMemo
struct UBTTcpLink_Channel_sfAckSendMemo_Params
{
	string[]                                           CnamesToFail;                                             // (Parm, NeedCtorLink)
	int[]                                              ResultArray;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSendMemo
struct UBTTcpLink_Channel_sfReqSendMemo_Params
{
	string[]                                           cnames;                                                   // (Parm, NeedCtorLink)
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	int                                                ItemUID;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvChatWispher
struct UBTTcpLink_Channel_sfReqRecvChatWispher_Params
{
	string                                             CharnameFrom;                                             // (Parm, NeedCtorLink)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChatWispher
struct UBTTcpLink_Channel_sfAckChatWispher_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             ToCharName;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChatWispher
struct UBTTcpLink_Channel_sfReqChatWispher_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRemoveBlockUserList
struct UBTTcpLink_Channel_sfAckRemoveBlockUserList_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRemoveBlockUserList
struct UBTTcpLink_Channel_sfReqRemoveBlockUserList_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckAddBlockUserList
struct UBTTcpLink_Channel_sfAckAddBlockUserList_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqAddBlockUserList
struct UBTTcpLink_Channel_sfReqAddBlockUserList_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
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
	string[]                                           CharName;                                                 // (Parm, NeedCtorLink)
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
	string                                             CharnameToBeInvited;                                      // (Parm, NeedCtorLink)
	byte                                               IsPermit;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckConfirmFriendInvite
struct UBTTcpLink_Channel_sfAckConfirmFriendInvite_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqConfirmFriendInvite
struct UBTTcpLink_Channel_sfReqConfirmFriendInvite_Params
{
	int                                                ReqUserID;                                                // (Parm)
	string                                             ReqedCharname;                                            // (Parm, NeedCtorLink)
	byte                                               IsPermit;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRecvFriendInvite
struct UBTTcpLink_Channel_sfReqRecvFriendInvite_Params
{
	int                                                ReqUserID;                                                // (Parm)
	string                                             ReqCharname;                                              // (Parm, NeedCtorLink)
	string                                             InviteMsg;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckSendFriendInvite
struct UBTTcpLink_Channel_sfAckSendFriendInvite_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSendFriendInvite
struct UBTTcpLink_Channel_sfReqSendFriendInvite_Params
{
	int                                                InviteUserID;                                             // (Parm)
	string                                             InviteName;                                               // (Parm, NeedCtorLink)
	string                                             InviteMsg;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChatNormal
struct UBTTcpLink_Channel_sfAckChatNormal_Params
{
	int                                                id;                                                       // (Parm)
	string                                             Sender;                                                   // (Parm, NeedCtorLink)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChatNormal
struct UBTTcpLink_Channel_sfReqChatNormal_Params
{
	string                                             Message;                                                  // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqEquipItem
struct UBTTcpLink_Channel_sfReqEquipItem_Params
{
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  UniqueID;                                                 // (Parm)
	int                                                SlotPos_Key;                                              // (Parm)
	byte                                               SlotPos_Value;                                            // (Parm)
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
	struct FBtrDouble[]                                UniqueID;                                                 // (Parm, NeedCtorLink)
	int[]                                              ItemID;                                                   // (Parm, NeedCtorLink)
	int[]                                              ItemType;                                                 // (Parm, NeedCtorLink)
	int[]                                              Durability;                                               // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UntilTime;                                                // (Parm, NeedCtorLink)
	int[]                                              SlotPosition;                                             // (Parm, NeedCtorLink)
	int[]                                              AddPartsID;                                               // (Parm, NeedCtorLink)
	int[]                                              DamageDegree;                                             // (Parm, NeedCtorLink)
	byte[]                                             ItemState;                                                // (Parm, NeedCtorLink)
	int[]                                              StackCount;                                               // (Parm, NeedCtorLink)
	int[]                                              PaintID;                                                  // (Parm, NeedCtorLink)
	int[]                                              TradeCount;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckItemListStart
struct UBTTcpLink_Channel_sfAckItemListStart_Params
{
	int                                                Count;                                                    // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              UserIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              SkillIDs;                                                 // (Parm, NeedCtorLink)
	int[]                                              SlotPositions;                                            // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              UserIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              ItemIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              SlotPositions;                                            // (Parm, NeedCtorLink)
	int[]                                              AddPartsID;                                               // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UniqueID;                                                 // (Parm, NeedCtorLink)
	int[]                                              PaintID;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              UserIDs;                                                  // (Parm, NeedCtorLink)
	byte[]                                             Positions;                                                // (Parm, NeedCtorLink)
	int[]                                              Numbers;                                                  // (Parm, NeedCtorLink)
	byte[]                                             OldStates;                                                // (Parm, NeedCtorLink)
	byte[]                                             NewStates;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChangeUserState
struct UBTTcpLink_Channel_sfReqChangeUserState_Params
{
	byte                                               NewState;                                                 // (Parm)
	byte                                               CheckPlaying;                                             // (Parm)
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
	byte                                               RoomState;                                                // (Parm)
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
	byte                                               IsPW;                                                     // (Parm)
	string                                             RoomName;                                                 // (Parm, NeedCtorLink)
	string                                             MapName;                                                  // (Parm, NeedCtorLink)
	string                                             ModeName;                                                 // (Parm, NeedCtorLink)
	int                                                MapNum;                                                   // (Parm)
	int                                                ModeNum;                                                  // (Parm)
	byte                                               IsTeamBalance;                                            // (Parm)
	int                                                MaxUserCount;                                             // (Parm)
	int                                                RoomUserCount;                                            // (Parm)
	byte                                               RoomState;                                                // (Parm)
	byte                                               BotDifficult;                                             // (Parm)
	byte                                               WeaponLimit;                                              // (Parm)
	byte                                               BotModeUserTeamNum;                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetBootyChoose
struct UBTTcpLink_Channel_sfAckGetBootyChoose_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               GiveType;                                                 // (Parm)
	struct FBtrDouble                                  ItemUniqueNumber;                                         // (Parm)
	int                                                ItemID;                                                   // (Parm)
	int                                                PartID;                                                   // (Parm)
	byte                                               ItemType;                                                 // (Parm)
	struct FBtrDouble                                  UntilTime;                                                // (Parm)
	int                                                StackCount;                                               // (Parm)
	int                                                PaintID;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGetBooty
struct UBTTcpLink_Channel_sfAckGetBooty_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              PrizeWinUserID;                                           // (Parm, NeedCtorLink)
	int[]                                              BootyItemID;                                              // (Parm, NeedCtorLink)
	int[]                                              BootyPartsID;                                             // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              ItemID;                                                   // (Parm, NeedCtorLink)
	int[]                                              PartID;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckClientUdpInfoList
struct UBTTcpLink_Channel_sfAckClientUdpInfoList_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              UID;                                                      // (Parm, NeedCtorLink)
	string[]                                           IP;                                                       // (Parm, NeedCtorLink)
	int[]                                              Port;                                                     // (Parm, NeedCtorLink)
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
	string                                             IP;                                                       // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	byte                                               NatType;                                                  // (Parm)
	byte                                               Intervention;                                             // (Parm)
	string                                             HostInnerIP;                                              // (Parm, NeedCtorLink)
	int                                                HostInnerPort;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckRegisterMyUdpInfo
struct UBTTcpLink_Channel_sfAckRegisterMyUdpInfo_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqRegisterMyUdpInfo
struct UBTTcpLink_Channel_sfReqRegisterMyUdpInfo_Params
{
	byte                                               IsHost;                                                   // (Parm)
	string                                             IP;                                                       // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	byte                                               Intervention;                                             // (Parm)
	string                                             HostInnerIP;                                              // (Parm, NeedCtorLink)
	int                                                HostInnerPort;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckNotifyClientJoinTime
struct UBTTcpLink_Channel_sfAckNotifyClientJoinTime_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             HostIP;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckChangeHost
struct UBTTcpLink_Channel_sfAckChangeHost_Params
{
	byte                                               ClientNum;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckDisconnectGame
struct UBTTcpLink_Channel_sfAckDisconnectGame_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                DisconnectUserID;                                         // (Parm)
	string                                             DisconnectUserName;                                       // (Parm, NeedCtorLink)
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
	string                                             RelayServerIP;                                            // (Parm, NeedCtorLink)
	int                                                RelayServerPortNum;                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGameOver
struct UBTTcpLink_Channel_sfAckGameOver_Params
{
	int                                                UID;                                                      // (Parm)
	int                                                GameRoomNumber;                                           // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte                                               IsPlaying;                                                // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckUpdateScore
struct UBTTcpLink_Channel_sfAckUpdateScore_Params
{
	int[]                                              UserIDs;                                                  // (Parm, NeedCtorLink)
	string[]                                           NickNames;                                                // (Parm, NeedCtorLink)
	byte[]                                             TeamIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              Scores;                                                   // (Parm, NeedCtorLink)
	int[]                                              Kills;                                                    // (Parm, NeedCtorLink)
	int[]                                              Assists;                                                  // (Parm, NeedCtorLink)
	int[]                                              Deaths;                                                   // (Parm, NeedCtorLink)
	int[]                                              EXPs;                                                     // (Parm, NeedCtorLink)
	int[]                                              EXPBonuses;                                               // (Parm, NeedCtorLink)
	int[]                                              Points;                                                   // (Parm, NeedCtorLink)
	int[]                                              PointBonuses;                                             // (Parm, NeedCtorLink)
	int[]                                              TeamScores;                                               // (Parm, NeedCtorLink)
	int[]                                              BonusOwnerID;                                             // (Parm, NeedCtorLink)
	int[]                                              BonusID;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqUpdateScore
struct UBTTcpLink_Channel_sfReqUpdateScore_Params
{
	int                                                GameNumber;                                               // (Parm)
	int[]                                              UserIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              Kills;                                                    // (Parm, NeedCtorLink)
	int[]                                              Assists;                                                  // (Parm, NeedCtorLink)
	int[]                                              Deaths;                                                   // (Parm, NeedCtorLink)
	int[]                                              EXPs;                                                     // (Parm, NeedCtorLink)
	int[]                                              Points;                                                   // (Parm, NeedCtorLink)
	int[]                                              Scores;                                                   // (Parm, NeedCtorLink)
	int[]                                              TeamScores;                                               // (Parm, NeedCtorLink)
	int[]                                              RoundJoin;                                                // (Parm, NeedCtorLink)
	int[]                                              TimeJoin;                                                 // (Parm, NeedCtorLink)
	int                                                Playtime;                                                 // (Parm)
	byte                                               GameEndType;                                              // (Parm)
	string[]                                           UserNames;                                                // (Parm, NeedCtorLink)
	byte                                               IsAIClear;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckStartGame
struct UBTTcpLink_Channel_sfAckStartGame_Params
{
	int                                                GameNumber;                                               // (Parm)
	int                                                ClientsCount;                                             // (Parm)
	int                                                StartSeed;                                                // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             UserID;                                                   // (Parm, NeedCtorLink)
	string                                             IP;                                                       // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             MyIp;                                                     // (Parm, NeedCtorLink)
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
	string                                             UserID;                                                   // (Parm, NeedCtorLink)
	int                                                UID;                                                      // (Parm)
	int                                                TeamNum;                                                  // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             GameMode;                                                 // (Parm, NeedCtorLink)
	byte                                               GameModeNum;                                              // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqChangeGameMode
struct UBTTcpLink_Channel_sfReqChangeGameMode_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	string                                             GameMode;                                                 // (Parm, NeedCtorLink)
	byte                                               GameModeNum;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckBanUser
struct UBTTcpLink_Channel_sfAckBanUser_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	int                                                BanUID;                                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             MapName;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqSelectMap
struct UBTTcpLink_Channel_sfReqSelectMap_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	string                                             MapName;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckGameRoomInfo
struct UBTTcpLink_Channel_sfAckGameRoomInfo_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	string                                             RoomOwnerIP;                                              // (Parm, NeedCtorLink)
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
	string                                             UserID;                                                   // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              UID;                                                      // (Parm, NeedCtorLink)
	string[]                                           UserName;                                                 // (Parm, NeedCtorLink)
	int[]                                              Grade;                                                    // (Parm, NeedCtorLink)
	int[]                                              TeamNum;                                                  // (Parm, NeedCtorLink)
	byte[]                                             Statue;                                                   // (Parm, NeedCtorLink)
	byte[]                                             IsHost;                                                   // (Parm, NeedCtorLink)
	string[]                                           UserIP;                                                   // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              CM_Pattern;                                               // (Parm, NeedCtorLink)
	int[]                                              CM_BG;                                                    // (Parm, NeedCtorLink)
	int[]                                              CM_BL;                                                    // (Parm, NeedCtorLink)
	byte[]                                             IsLookingFor;                                             // (Parm, NeedCtorLink)
	int[]                                              GMUID;                                                    // (Parm, NeedCtorLink)
	int[]                                              ClanLevel;                                                // (Parm, NeedCtorLink)
	int[]                                              LevelMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              TitleMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              Reserved1;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved2;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved3;                                                // (Parm, NeedCtorLink)
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
	string                                             UserID;                                                   // (Parm, NeedCtorLink)
	int                                                TeamNum;                                                  // (Parm)
	int                                                Grade;                                                    // (Parm)
	string                                             UserIP;                                                   // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                Clan_Mark_Pattern;                                        // (Parm)
	int                                                Clan_Mark_BG;                                             // (Parm)
	int                                                Clan_Mark_BL;                                             // (Parm)
	byte                                               IsLookFor;                                                // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             Password;                                                 // (Parm, NeedCtorLink)
	byte                                               RoomEnterType;                                            // (Parm)
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
	int[]                                              GameNum;                                                  // (Parm, NeedCtorLink)
	string[]                                           Title;                                                    // (Parm, NeedCtorLink)
	string[]                                           MapName;                                                  // (Parm, NeedCtorLink)
	int[]                                              MapNum;                                                   // (Parm, NeedCtorLink)
	byte[]                                             UserCount;                                                // (Parm, NeedCtorLink)
	byte[]                                             MaxCount;                                                 // (Parm, NeedCtorLink)
	string[]                                           ModeName;                                                 // (Parm, NeedCtorLink)
	int[]                                              ModeNum;                                                  // (Parm, NeedCtorLink)
	byte[]                                             WeaponLimit;                                              // (Parm, NeedCtorLink)
	byte[]                                             IsTeamBalance;                                            // (Parm, NeedCtorLink)
	byte[]                                             Status;                                                   // (Parm, NeedCtorLink)
	string[]                                           RoomOwnerIP;                                              // (Parm, NeedCtorLink)
	int[]                                              GameMinute;                                               // (Parm, NeedCtorLink)
	string[]                                           RoomOwnerName;                                            // (Parm, NeedCtorLink)
	byte[]                                             IsSpecial;                                                // (Parm, NeedCtorLink)
	byte[]                                             IsPassword;                                               // (Parm, NeedCtorLink)
	byte[]                                             BotDifficult;                                             // (Parm, NeedCtorLink)
	byte[]                                             BotModeUserTeamNum;                                       // (Parm, NeedCtorLink)
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
	int[]                                              UID;                                                      // (Parm, NeedCtorLink)
	string[]                                           UserID;                                                   // (Parm, NeedCtorLink)
	int[]                                              UserLevels;                                               // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanPattern;                                              // (Parm, NeedCtorLink)
	int[]                                              ClanBG;                                                   // (Parm, NeedCtorLink)
	int[]                                              ClanBL;                                                   // (Parm, NeedCtorLink)
	int[]                                              ClanGrade;                                                // (Parm, NeedCtorLink)
	int[]                                              ClanWin;                                                  // (Parm, NeedCtorLink)
	int[]                                              ClanLose;                                                 // (Parm, NeedCtorLink)
	byte[]                                             IsLookForClan;                                            // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              ClanLevel;                                                // (Parm, NeedCtorLink)
	int[]                                              LevelMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              TitleMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              Reserved1;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved2;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved3;                                                // (Parm, NeedCtorLink)
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
	string                                             UserID;                                                   // (Parm, NeedCtorLink)
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
	string                                             UserID;                                                   // (Parm, NeedCtorLink)
	int                                                Level;                                                    // (Parm)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanMarkPattern;                                          // (Parm)
	int                                                ClanMarkBG;                                               // (Parm)
	int                                                ClanMarkBL;                                               // (Parm)
	int                                                ClanGrade;                                                // (Parm)
	int                                                ClanWin;                                                  // (Parm)
	int                                                ClanLose;                                                 // (Parm)
	byte                                               IsLookFor;                                                // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              id;                                                       // (Parm, NeedCtorLink)
	string[]                                           Title;                                                    // (Parm, NeedCtorLink)
	int[]                                              CurUser;                                                  // (Parm, NeedCtorLink)
	int[]                                              MaxUser;                                                  // (Parm, NeedCtorLink)
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
	string[]                                           FriendName;                                               // (Parm, NeedCtorLink)
	byte[]                                             IsLogOn;                                                  // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              CM_Pattern;                                               // (Parm, NeedCtorLink)
	int[]                                              CM_BG;                                                    // (Parm, NeedCtorLink)
	int[]                                              CM_BL;                                                    // (Parm, NeedCtorLink)
	int[]                                              LevelMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              ClanLevel;                                                // (Parm, NeedCtorLink)
	int[]                                              Level;                                                    // (Parm, NeedCtorLink)
	byte[]                                             IsLookForClan;                                            // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                CM_Pattern;                                               // (Parm)
	int                                                CM_BG;                                                    // (Parm)
	int                                                CM_BL;                                                    // (Parm)
	struct FCharInfo                                   stCharInfo;                                               // (Parm)
	byte                                               InClanRank;                                               // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	struct FBtrDouble                                  CurServerTime;                                            // (Parm)
	int                                                CharDBID;                                                 // (Parm)
	byte                                               IsGM;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqLogin2
struct UBTTcpLink_Channel_sfReqLogin2_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                TimeStamp;                                                // (Parm)
	int                                                LoginHash1;                                               // (Parm)
	int                                                LoginHash2;                                               // (Parm)
	int                                                LoginHash3;                                               // (Parm)
	int                                                LoginHash4;                                               // (Parm)
	int                                                LoginHash5;                                               // (Parm)
	string                                             Guid;                                                     // (Parm, NeedCtorLink)
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
	string                                             Server1Addr;                                              // (Parm, NeedCtorLink)
	int                                                Server1Port;                                              // (Parm)
	string                                             Server2Addr;                                              // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	struct FCharInfo                                   btCharInfo;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfReqLogin
struct UBTTcpLink_Channel_sfReqLogin_Params
{
	string                                             id;                                                       // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.sfAckHash
struct UBTTcpLink_Channel_sfAckHash_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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

// Function BatteryNet.BTTcpLink_Channel.rfReqAddSpecialRank
struct UBTTcpLink_Channel_rfReqAddSpecialRank_Params
{
	string                                             NickName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckExpandSlotConfirm
struct UBTTcpLink_Channel_rfAckExpandSlotConfirm_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                QSlotID;                                                  // (Parm)
	struct FBtrDouble                                  MWItemID;                                                 // (Parm)
	struct FBtrDouble                                  PistolItemID;                                             // (Parm)
	struct FBtrDouble                                  TWItemID1;                                                // (Parm)
	struct FBtrDouble                                  TWItemID2;                                                // (Parm)
	int                                                Skill1;                                                   // (Parm)
	int                                                Skill2;                                                   // (Parm)
	int                                                Skill3;                                                   // (Parm)
	int                                                Skill4;                                                   // (Parm)
	struct FBtrDouble                                  KnifeItemID;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqExpandSlotConfirm
struct UBTTcpLink_Channel_rfReqExpandSlotConfirm_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGP20CashModifyWeapon
struct UBTTcpLink_Channel_rfAckGP20CashModifyWeapon_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  UniqueID;                                                 // (Parm)
	int                                                AddPartID;                                                // (Parm)
	int                                                PaintID;                                                  // (Parm)
	int                                                Point;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGP20CashModifyWeapon
struct UBTTcpLink_Channel_rfReqGP20CashModifyWeapon_Params
{
	struct FBtrDouble                                  UniqueID;                                                 // (Parm)
	int                                                AddPartID;                                                // (Parm)
	int                                                PaintID;                                                  // (Parm)
	int[]                                              ProductNo;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckCharDetailInfoWithClan
struct UBTTcpLink_Channel_rfAckCharDetailInfoWithClan_Params
{
	int                                                ErrorCode;                                                // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                Exp;                                                      // (Parm)
	int                                                Level;                                                    // (Parm)
	int                                                LevelMarkID;                                              // (Parm)
	int                                                PreMonthlyRanking;                                        // (Parm)
	int                                                MonthlyRanking;                                           // (Parm)
	int                                                Win;                                                      // (Parm)
	int                                                Lose;                                                     // (Parm)
	int                                                Kill;                                                     // (Parm)
	int                                                Death;                                                    // (Parm)
	int                                                Assist;                                                   // (Parm)
	int                                                KillCountByAimShooting;                                   // (Parm)
	int                                                HeadShot2;                                                // (Parm)
	int                                                TotPlayTime;                                              // (Parm)
	int                                                DisCon;                                                   // (Parm)
	int                                                MainWeaponItemID;                                         // (Parm)
	int                                                MainWeaponPartID;                                         // (Parm)
	int                                                SubWeaponItemID;                                          // (Parm)
	int                                                SubWeaponPartID;                                          // (Parm)
	int                                                AFSpecialCostumeItemID;                                   // (Parm)
	int                                                RSASpecialCostumeItemID;                                  // (Parm)
	int                                                DispHeadItem;                                             // (Parm)
	int                                                DispFaceItem;                                             // (Parm)
	int                                                DispBackpack;                                             // (Parm)
	int                                                DispPouch;                                                // (Parm)
	int                                                DispCamouflage;                                           // (Parm)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanLevel;                                                // (Parm)
	int                                                CM_Pattern;                                               // (Parm)
	int                                                CM_BG;                                                    // (Parm)
	int                                                CM_BL;                                                    // (Parm)
	int                                                ClanExp;                                                  // (Parm)
	byte                                               ClanGrade;                                                // (Parm)
	int                                                ClanActivity;                                             // (Parm)
	int                                                MonthlyConnectingCount;                                   // (Parm)
	int                                                UserClanWin;                                              // (Parm)
	int                                                UserClanLose;                                             // (Parm)
	int                                                UserClanDraw;                                             // (Parm)
	int                                                ClanWin;                                                  // (Parm)
	int                                                ClanLose;                                                 // (Parm)
	int                                                ClanDraw;                                                 // (Parm)
	int                                                PreClanTotalRankCur;                                      // (Parm)
	int                                                ClanTotalRankCur;                                         // (Parm)
	int                                                PreClanMonthlyRankCur;                                    // (Parm)
	int                                                ClanMonthlyRankCur;                                       // (Parm)
	int                                                PreClanMonthlyConnectingRank;                             // (Parm)
	int                                                ClanMonthlyConnectingRank;                                // (Parm)
	string                                             ClanIntro;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqCharDetailInfoWithClan
struct UBTTcpLink_Channel_rfReqCharDetailInfoWithClan_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPcBangItemList
struct UBTTcpLink_Channel_rfAckPcBangItemList_Params
{
	int[]                                              ItemTID;                                                  // (Parm, NeedCtorLink)
	int[]                                              PartID;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqPcBangItemList
struct UBTTcpLink_Channel_rfReqPcBangItemList_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyShopPackageItemData
struct UBTTcpLink_Channel_rfReqNotifyShopPackageItemData_Params
{
	int                                                PackageProductNo;                                         // (Parm)
	int[]                                              ProductCode;                                              // (Parm, NeedCtorLink)
	int[]                                              ProductQuantity;                                          // (Parm, NeedCtorLink)
	int[]                                              ProductHour;                                              // (Parm, NeedCtorLink)
	string                                             Description;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckUseItemDuringGame
struct UBTTcpLink_Channel_rfAckUseItemDuringGame_Params
{
	int                                                ErrorCode;                                                // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	int                                                RemainCount;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqUseItemDuringGame
struct UBTTcpLink_Channel_rfReqUseItemDuringGame_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	byte                                               UsingCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfChangeItemInstanceInfo
struct UBTTcpLink_Channel_rfChangeItemInstanceInfo_Params
{
	int                                                ErrorCode;                                                // (Parm)
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	byte                                               ChangeCount;                                              // (Parm)
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
	byte                                               IsNotification;                                           // (Parm)
	string[]                                           NickName;                                                 // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                Time;                                                     // (Parm, NeedCtorLink)
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
	string[]                                           CharList;                                                 // (Parm, NeedCtorLink)
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
	byte                                               RewardedQuestIsComplete;                                  // (Parm)
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
	byte[]                                             Type;                                                     // (Parm, NeedCtorLink)
	byte[]                                             Number;                                                   // (Parm, NeedCtorLink)
	int[]                                              ItemID;                                                   // (Parm, NeedCtorLink)
	int[]                                              ItemCount;                                                // (Parm, NeedCtorLink)
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
	byte                                               IsComplete;                                               // (Parm)
	byte[]                                             UpdatedNum;                                               // (Parm, NeedCtorLink)
	byte[]                                             StateList;                                                // (Parm, NeedCtorLink)
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
	byte                                               ReqType;                                                  // (Parm)
	byte                                               UpdateState;                                              // (Parm)
	struct FBtrDouble                                  PaidItemIdx;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAttendanceList
struct UBTTcpLink_Channel_rfAckAttendanceList_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               IsComplete;                                               // (Parm)
	byte                                               UpdatedNum;                                               // (Parm)
	byte[]                                             StateList;                                                // (Parm, NeedCtorLink)
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
	byte                                               ReqType;                                                  // (Parm)
	byte                                               UpdateNum;                                                // (Parm)
	byte                                               UpdateState;                                              // (Parm)
	struct FBtrDouble                                  PaidItemIdx;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAIRewardResult
struct UBTTcpLink_Channel_rfAckAIRewardResult_Params
{
	byte                                               ClearRewardTYPE;                                          // (Parm)
	int                                                ClearRewardID;                                            // (Parm)
	int                                                ClearRewardCount;                                         // (Parm)
	int[]                                              ScoreRewardUserID;                                        // (Parm, NeedCtorLink)
	byte[]                                             ScoreRewardTYPE;                                          // (Parm, NeedCtorLink)
	int[]                                              ScoreRewardID;                                            // (Parm, NeedCtorLink)
	int[]                                              ScoreRewardCount;                                         // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqCouponUse
struct UBTTcpLink_Channel_rfReqCouponUse_Params
{
	string                                             Serial;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              ProductNo;                                                // (Parm, NeedCtorLink)
	string[]                                           ProductName;                                              // (Parm, NeedCtorLink)
	int[]                                              ProductCode;                                              // (Parm, NeedCtorLink)
	byte[]                                             SaleType;                                                 // (Parm, NeedCtorLink)
	int[]                                              ProductCost;                                              // (Parm, NeedCtorLink)
	int[]                                              ProductHour;                                              // (Parm, NeedCtorLink)
	int[]                                              ProductQuantity;                                          // (Parm, NeedCtorLink)
	int[]                                              SaleMasterFlag;                                           // (Parm, NeedCtorLink)
	int[]                                              SaleStatus;                                               // (Parm, NeedCtorLink)
	int[]                                              IsGift;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                SaleEndTime;                                              // (Parm, NeedCtorLink)
	int[]                                              Discountcost;                                             // (Parm, NeedCtorLink)
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
	byte[]                                             Data;                                                     // (Parm, NeedCtorLink)
	int                                                DataSize;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAhnHsObject
struct UBTTcpLink_Channel_rfReqAhnHsObject_Params
{
	byte[]                                             Data;                                                     // (Parm, NeedCtorLink)
	int                                                DataSize;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfNotifyClanLevelup
struct UBTTcpLink_Channel_rfNotifyClanLevelup_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                Levelup;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfNotifyNewClanName
struct UBTTcpLink_Channel_rfNotifyNewClanName_Params
{
	string                                             New_NickName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfNotifyNewNickName
struct UBTTcpLink_Channel_rfNotifyNewNickName_Params
{
	int                                                Community_Type;                                           // (Parm)
	string                                             Old_NickName;                                             // (Parm, NeedCtorLink)
	string                                             New_NickName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGameMapData
struct UBTTcpLink_Channel_rfAckGameMapData_Params
{
	int[]                                              nIdx;                                                     // (Parm, NeedCtorLink)
	int[]                                              nMapID;                                                   // (Parm, NeedCtorLink)
	string[]                                           nMapNm;                                                   // (Parm, NeedCtorLink)
	float[]                                            fSupHealth;                                               // (Parm, NeedCtorLink)
	float[]                                            fSupHeli;                                                 // (Parm, NeedCtorLink)
	float[]                                            fSupBomb;                                                 // (Parm, NeedCtorLink)
	float[]                                            fSupUAV;                                                  // (Parm, NeedCtorLink)
	int[]                                              nModFFA;                                                  // (Parm, NeedCtorLink)
	int[]                                              nModFFAMax;                                               // (Parm, NeedCtorLink)
	int[]                                              nModTDM;                                                  // (Parm, NeedCtorLink)
	int[]                                              nModTDMMax;                                               // (Parm, NeedCtorLink)
	int[]                                              nModSD;                                                   // (Parm, NeedCtorLink)
	int[]                                              nModSDMax;                                                // (Parm, NeedCtorLink)
	int[]                                              nModDOM;                                                  // (Parm, NeedCtorLink)
	int[]                                              nModDOMMax;                                               // (Parm, NeedCtorLink)
	int[]                                              nModSab;                                                  // (Parm, NeedCtorLink)
	int[]                                              nModSabMax;                                               // (Parm, NeedCtorLink)
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
	byte                                               MessageType;                                              // (Parm)
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
	string                                             TargetCharName;                                           // (Parm, NeedCtorLink)
	byte                                               ServerType;                                               // (Parm)
	string                                             fServername;                                              // (Parm, NeedCtorLink)
	string                                             fServerShortName;                                         // (Parm, NeedCtorLink)
	string                                             fServerIP;                                                // (Parm, NeedCtorLink)
	int                                                fServerPort;                                              // (Parm)
	byte                                               CurPos;                                                   // (Parm)
	byte                                               CurState;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	string                                             ChannelNickName;                                          // (Parm, NeedCtorLink)
	int                                                GameRoomNum;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqFriendPosition
struct UBTTcpLink_Channel_rfReqFriendPosition_Params
{
	string                                             TargetCharName;                                           // (Parm, NeedCtorLink)
	byte                                               CommunityType;                                            // (Parm)
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
	byte                                               Result;                                                   // (Parm)
	byte                                               Reason;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqLogOut
struct UBTTcpLink_Channel_rfReqLogOut_Params
{
	byte                                               Reason;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckTencent_AASInfo
struct UBTTcpLink_Channel_rfAckTencent_AASInfo_Params
{
	int                                                UserID;                                                   // (Parm)
	byte                                               IsAdult;                                                  // (Parm)
	byte                                               IsQQAuth;                                                 // (Parm)
	int                                                AccumTimeSec;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSetCommunityOption
struct UBTTcpLink_Channel_rfAckSetCommunityOption_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrStr;                                                   // (Parm, NeedCtorLink)
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
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                TitleMarkID;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyUpdateCharInfo_LevelMark
struct UBTTcpLink_Channel_rfAckNotifyUpdateCharInfo_LevelMark_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
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
	byte                                               RankingType;                                              // (Parm)
	byte                                               CommunityType;                                            // (Parm)
	string[]                                           CharName;                                                 // (Parm, NeedCtorLink)
	int[]                                              CharLevel;                                                // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanMarkPattern;                                          // (Parm, NeedCtorLink)
	int[]                                              ClanMarkBG;                                               // (Parm, NeedCtorLink)
	int[]                                              ClanMarkBL;                                               // (Parm, NeedCtorLink)
	int[]                                              Ranking_Accum;                                            // (Parm, NeedCtorLink)
	int[]                                              Ranking_Accum_Prev;                                       // (Parm, NeedCtorLink)
	int[]                                              Ranking_Accum_Exp;                                        // (Parm, NeedCtorLink)
	int[]                                              LevelMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              TitleMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              Reserved1;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved2;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved3;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetRankingInfoListStart
struct UBTTcpLink_Channel_rfAckGetRankingInfoListStart_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               RankingType;                                              // (Parm)
	byte                                               CommunityType;                                            // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGetRankingInfoList
struct UBTTcpLink_Channel_rfReqGetRankingInfoList_Params
{
	byte                                               RankingType;                                              // (Parm)
	byte                                               CommunityType;                                            // (Parm)
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
	struct FBtrDouble[]                                MatchDate;                                                // (Parm, NeedCtorLink)
	byte[]                                             IsWin;                                                    // (Parm, NeedCtorLink)
	string[]                                           EnemyClanname;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatchResultHistory
struct UBTTcpLink_Channel_rfReqClanMatchResultHistory_Params
{
	string                                             ClanNm;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckDeleteMailAll
struct UBTTcpLink_Channel_rfAckDeleteMailAll_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               MailType;                                                 // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqDeleteMailAll
struct UBTTcpLink_Channel_rfReqDeleteMailAll_Params
{
	byte                                               MailType;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_PublicWaitRoomChanged
struct UBTTcpLink_Channel_rfAckClanMatch_PublicWaitRoomChanged_Params
{
	int                                                WaitRoomIdx;                                              // (Parm)
	string                                             RoomName;                                                 // (Parm, NeedCtorLink)
	int                                                MapNum;                                                   // (Parm)
	int                                                CurUserCount;                                             // (Parm)
	int                                                MaxUserCount;                                             // (Parm)
	byte                                               Status;                                                   // (Parm)
	byte                                               IsPublic;                                                 // (Parm)
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
	string                                             NewClanname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPaidItem_ChangeClanname
struct UBTTcpLink_Channel_rfAckPaidItem_ChangeClanname_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                RemainCount;                                              // (Parm)
	string                                             NewClanname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqPaidItem_ChangeClanname
struct UBTTcpLink_Channel_rfReqPaidItem_ChangeClanname_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	string                                             NewClanname;                                              // (Parm, NeedCtorLink)
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
	int[]                                              WaitRoomIdx;                                              // (Parm, NeedCtorLink)
	string[]                                           LeaderName;                                               // (Parm, NeedCtorLink)
	string[]                                           RoomName;                                                 // (Parm, NeedCtorLink)
	int[]                                              MapNum;                                                   // (Parm, NeedCtorLink)
	int[]                                              CurUserCount;                                             // (Parm, NeedCtorLink)
	int[]                                              MaxUserCount;                                             // (Parm, NeedCtorLink)
	byte[]                                             Status;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_StartPublicWaitRoomList
struct UBTTcpLink_Channel_rfAckClanMatch_StartPublicWaitRoomList_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte                                               Type;                                                     // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqServerShutdown
struct UBTTcpLink_Channel_rfReqServerShutdown_Params
{
	string                                             AuthKey;                                                  // (Parm, NeedCtorLink)
	int                                                SecondAfter;                                              // (Parm)
	struct FBtrDouble                                  ShutdownTime;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyEndTutorial
struct UBTTcpLink_Channel_rfAckNotifyEndTutorial_Params
{
	int                                                UserID;                                                   // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                Level;                                                    // (Parm)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanMarkPattern;                                          // (Parm)
	int                                                ClanMarkBG;                                               // (Parm)
	int                                                ClanMarkBL;                                               // (Parm)
	int                                                ClanGrade;                                                // (Parm)
	int                                                ClanWin;                                                  // (Parm)
	int                                                ClanLose;                                                 // (Parm)
	byte                                               IsLookFor;                                                // (Parm)
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
	int[]                                              UnqueID;                                                  // (Parm, NeedCtorLink)
	int[]                                              Ping;                                                     // (Parm, NeedCtorLink)
	int                                                HostPriorityPoint;                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRoomUserPingInfo
struct UBTTcpLink_Channel_rfReqRoomUserPingInfo_Params
{
	int[]                                              UnqueID;                                                  // (Parm, NeedCtorLink)
	int[]                                              Ping;                                                     // (Parm, NeedCtorLink)
	int                                                HostPriorityPoint;                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckMyEquipedQSlotList
struct UBTTcpLink_Channel_rfAckMyEquipedQSlotList_Params
{
	byte[]                                             QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                MWUniqueID;                                               // (Parm, NeedCtorLink)
	int[]                                              MWItemID;                                                 // (Parm, NeedCtorLink)
	int[]                                              MWPartID;                                                 // (Parm, NeedCtorLink)
	int[]                                              MWPaintID;                                                // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                PistolUniqueID;                                           // (Parm, NeedCtorLink)
	int[]                                              PistolItemID;                                             // (Parm, NeedCtorLink)
	int[]                                              PistolPartID;                                             // (Parm, NeedCtorLink)
	int[]                                              PistolPaintID;                                            // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                TW1UniqueID;                                              // (Parm, NeedCtorLink)
	int[]                                              TWItemID1;                                                // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                TW2UniqueID;                                              // (Parm, NeedCtorLink)
	int[]                                              TWItemID2;                                                // (Parm, NeedCtorLink)
	int[]                                              Skill1ID;                                                 // (Parm, NeedCtorLink)
	int[]                                              Skill2ID;                                                 // (Parm, NeedCtorLink)
	int[]                                              Skill3ID;                                                 // (Parm, NeedCtorLink)
	int[]                                              Skill4ID;                                                 // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	struct FBtrDouble[]                                KnifeUniqueID;                                            // (Parm, NeedCtorLink)
	int[]                                              KnifeItemID;                                              // (Parm, NeedCtorLink)
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
	int[]                                              SkillIDs;                                                 // (Parm, NeedCtorLink)
	int[]                                              SlotPositions;                                            // (Parm, NeedCtorLink)
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
	int[]                                              ItemIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              SlotPositions;                                            // (Parm, NeedCtorLink)
	int[]                                              AddPartsID;                                               // (Parm, NeedCtorLink)
	int[]                                              PaintID;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UniqueID;                                                 // (Parm, NeedCtorLink)
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
	byte                                               IsFull;                                                   // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               IsLookingFor;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSetLookForClan
struct UBTTcpLink_Channel_rfReqSetLookForClan_Params
{
	byte                                               IsLookingFor;                                             // (Parm)
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
	string                                             OwnerName;                                                // (Parm, NeedCtorLink)
	string                                             OwnerIP;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_SetWaitRoomPublic
struct UBTTcpLink_Channel_rfAckClanMatch_SetWaitRoomPublic_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               Set;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_SetWaitRoomPublic
struct UBTTcpLink_Channel_rfReqClanMatch_SetWaitRoomPublic_Params
{
	byte                                               Set;                                                      // (Parm)
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
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                Pattern;                                                  // (Parm)
	int                                                BG;                                                       // (Parm)
	int                                                BL;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPaidItem_ChangeClanMark
struct UBTTcpLink_Channel_rfAckPaidItem_ChangeClanMark_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                StackCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqPaidItem_ChangeClanMark
struct UBTTcpLink_Channel_rfReqPaidItem_ChangeClanMark_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	byte                                               IsPaid;                                                   // (Parm)
	int                                                Pattern;                                                  // (Parm)
	int                                                BG;                                                       // (Parm)
	int                                                BL;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPaidItem_ClanMarkDupCheck
struct UBTTcpLink_Channel_rfAckPaidItem_ClanMarkDupCheck_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqPaidItem_ClanMarkDupCheck
struct UBTTcpLink_Channel_rfReqPaidItem_ClanMarkDupCheck_Params
{
	byte                                               IsPaid;                                                   // (Parm)
	int                                                Pattern;                                                  // (Parm)
	int                                                BG;                                                       // (Parm)
	int                                                BL;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPaidItem_RelayBroadcast
struct UBTTcpLink_Channel_rfAckPaidItem_RelayBroadcast_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPaidItem_BroadCast
struct UBTTcpLink_Channel_rfAckPaidItem_BroadCast_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                StackCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqPaidItem_BroadCast
struct UBTTcpLink_Channel_rfReqPaidItem_BroadCast_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                Command;                                                  // (Parm)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckPaidItem_EraseRecord
struct UBTTcpLink_Channel_rfAckPaidItem_EraseRecord_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                RemainCount;                                              // (Parm)
	string                                             NewCharname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqPaidItem_ChangeCharname
struct UBTTcpLink_Channel_rfReqPaidItem_ChangeCharname_Params
{
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	string                                             NewCharname;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRecvSystemMsg
struct UBTTcpLink_Channel_rfAckRecvSystemMsg_Params
{
	byte                                               CommunityType;                                            // (Parm)
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
	byte                                               RecvType;                                                 // (Parm)
	string                                             SendCharName;                                             // (Parm, NeedCtorLink)
	string                                             RecvCharname;                                             // (Parm, NeedCtorLink)
	struct FSystemMsgParam                             MsgInfo;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRandomBox_Use
struct UBTTcpLink_Channel_rfAckRandomBox_Use_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  RandomBoxItemIdx;                                         // (Parm)
	int                                                RandomBxoItemCount;                                       // (Parm)
	struct FBtrDouble                                  KeyItemIdx;                                               // (Parm)
	int                                                KeyItemRemainCount;                                       // (Parm)
	int[]                                              ItemIDChoose;                                             // (Parm, NeedCtorLink)
	int[]                                              PartIDChoose;                                             // (Parm, NeedCtorLink)
	int[]                                              PeriodOnChoosenItem;                                      // (Parm, NeedCtorLink)
	int[]                                              StackCountOnChoosenItem;                                  // (Parm, NeedCtorLink)
	byte[]                                             bHave;                                                    // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                ItemIdx;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UntilTime;                                                // (Parm, NeedCtorLink)
	int[]                                              StackCount;                                               // (Parm, NeedCtorLink)
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
	string                                             NewRoomTitle;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChangeRoomTitle_GM
struct UBTTcpLink_Channel_rfAckChangeRoomTitle_GM_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                RoomNumber;                                               // (Parm)
	string                                             NewRoomTitle;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChangeRoomTitle_GM
struct UBTTcpLink_Channel_rfReqChangeRoomTitle_GM_Params
{
	int                                                RoomNumber;                                               // (Parm)
	string                                             NewRoomTitle;                                             // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              QuestID;                                                  // (Parm, NeedCtorLink)
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
	struct FBtrDouble[]                                BlockedItemIdx;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqCharBlockInfo
struct UBTTcpLink_Channel_rfReqCharBlockInfo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfNotifyPcBangInfo
struct UBTTcpLink_Channel_rfNotifyPcBangInfo_Params
{
	byte                                               PcBang_Grade;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_GetClanWaittingRoomInfo
struct UBTTcpLink_Channel_rfAckClanMatch_GetClanWaittingRoomInfo_Params
{
	int                                                WaitRoomIndex;                                            // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	string                                             WaitRoomName;                                             // (Parm, NeedCtorLink)
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
	int[]                                              BotID;                                                    // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetBotID
struct UBTTcpLink_Channel_rfAckGetBotID_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               RequestedAFCount;                                         // (Parm)
	byte                                               RequestedRSACount;                                        // (Parm)
	int[]                                              AFBotID;                                                  // (Parm, NeedCtorLink)
	int[]                                              RSABotID;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGetBotID
struct UBTTcpLink_Channel_rfReqGetBotID_Params
{
	byte                                               AFCount;                                                  // (Parm)
	byte                                               RSACount;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_ChangeRoomSetting
struct UBTTcpLink_Channel_rfAckClanMatch_ChangeRoomSetting_Params
{
	int                                                WaitRoomIndex;                                            // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	byte                                               IsPublic;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_ChangeRoomSetting
struct UBTTcpLink_Channel_rfReqClanMatch_ChangeRoomSetting_Params
{
	int                                                WaitRoomIndex;                                            // (Parm)
	int[]                                              MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	byte                                               IsPublic;                                                 // (Parm)
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
	string                                             key;                                                      // (Parm, NeedCtorLink)
	string                                             Value;                                                    // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckWebzenBillingUseStorageItem
struct UBTTcpLink_Channel_rfAckWebzenBillingUseStorageItem_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte                                               StorageItemType;                                          // (Parm)
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
	int[]                                              Seq;                                                      // (Parm, NeedCtorLink)
	int[]                                              ItemSeq;                                                  // (Parm, NeedCtorLink)
	int[]                                              GroupCode;                                                // (Parm, NeedCtorLink)
	int[]                                              ShareFlag;                                                // (Parm, NeedCtorLink)
	int[]                                              ProductSeq;                                               // (Parm, NeedCtorLink)
	string[]                                           CashName;                                                 // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                CashPoint;                                                // (Parm, NeedCtorLink)
	string[]                                           SendAccountID;                                            // (Parm, NeedCtorLink)
	string[]                                           SendMessage;                                              // (Parm, NeedCtorLink)
	byte[]                                             ItemType;                                                 // (Parm, NeedCtorLink)
	byte[]                                             RelationType;                                             // (Parm, NeedCtorLink)
	int[]                                              ProductType;                                              // (Parm, NeedCtorLink)
	int[]                                              PriceSeq;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckWebzenBillingStorageListStart
struct UBTTcpLink_Channel_rfAckWebzenBillingStorageListStart_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte                                               Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGiftItemByWebzenCash
struct UBTTcpLink_Channel_rfAckGiftItemByWebzenCash_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                LeftProductCount;                                         // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGiftItemByWebzenCash
struct UBTTcpLink_Channel_rfReqGiftItemByWebzenCash_Params
{
	string                                             ReceiverCharName;                                         // (Parm, NeedCtorLink)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	int                                                PackageProductSeq;                                        // (Parm)
	int                                                PriceSeq;                                                 // (Parm)
	int                                                ProductDisplaySeq;                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGiftItemByWebzenCashGP20
struct UBTTcpLink_Channel_rfReqGiftItemByWebzenCashGP20_Params
{
	string                                             ReceiverCharName;                                         // (Parm, NeedCtorLink)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	int                                                ProductNo;                                                // (Parm)
	byte                                               Cointype;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckBuyItemByWebzenCash
struct UBTTcpLink_Channel_rfAckBuyItemByWebzenCash_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqBuyItemByWebzenCash
struct UBTTcpLink_Channel_rfReqBuyItemByWebzenCash_Params
{
	int                                                PackageProductSeq;                                        // (Parm)
	int                                                ProductDisplaySeq;                                        // (Parm)
	int                                                PriceSeq;                                                 // (Parm)
	int[]                                              ItemIDs;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	byte                                               BuyOption1;                                               // (Parm)
	byte                                               BuyOption2;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqBuyItemByWebzenCashGP20
struct UBTTcpLink_Channel_rfReqBuyItemByWebzenCashGP20_Params
{
	int                                                ProductNo;                                                // (Parm)
	byte                                               Cointype;                                                 // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               IsRegisteredPCBang;                                       // (Parm)
	byte                                               IsMainPCBang;                                             // (Parm)
	string                                             PCBangName;                                               // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string[]                                           FriendName;                                               // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              CM_Pattern;                                               // (Parm, NeedCtorLink)
	int[]                                              CM_BG;                                                    // (Parm, NeedCtorLink)
	int[]                                              CM_BL;                                                    // (Parm, NeedCtorLink)
	int[]                                              Level;                                                    // (Parm, NeedCtorLink)
	int[]                                              ClanGrade;                                                // (Parm, NeedCtorLink)
	int[]                                              ClanWin;                                                  // (Parm, NeedCtorLink)
	int[]                                              ClanLose;                                                 // (Parm, NeedCtorLink)
	byte[]                                             IsLookForClan;                                            // (Parm, NeedCtorLink)
	byte[]                                             IsCombat;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanLevel;                                                // (Parm, NeedCtorLink)
	int[]                                              LevelMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              TitleMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              Reserved1;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved2;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved3;                                                // (Parm, NeedCtorLink)
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
	int[]                                              ExpiredQuestID;                                           // (Parm, NeedCtorLink)
	int[]                                              NewQuestID;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqQuestNewAvailable
struct UBTTcpLink_Channel_rfReqQuestNewAvailable_Params
{
	int[]                                              AchivedQuestID;                                           // (Parm, NeedCtorLink)
	int[]                                              NewQuestID;                                               // (Parm, NeedCtorLink)
	byte[]                                             IsDailyQuest;                                             // (Parm, NeedCtorLink)
	int[]                                              ExpiredQuest;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckQuestUpdate
struct UBTTcpLink_Channel_rfAckQuestUpdate_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqQuestUpdate
struct UBTTcpLink_Channel_rfReqQuestUpdate_Params
{
	int                                                UniqueID;                                                 // (Parm)
	int                                                GameRoomNum;                                              // (Parm)
	int[]                                              QuestID;                                                  // (Parm, NeedCtorLink)
	int[]                                              CountPrograss;                                            // (Parm, NeedCtorLink)
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
	int[]                                              QuestID;                                                  // (Parm, NeedCtorLink)
	int[]                                              CountPrograss;                                            // (Parm, NeedCtorLink)
	byte[]                                             QuestType;                                                // (Parm, NeedCtorLink)
	byte[]                                             IsComplete;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckQuestListStart
struct UBTTcpLink_Channel_rfAckQuestListStart_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte                                               FixedGameMode;                                            // (Parm)
	byte                                               FixedMaxUserCnt;                                          // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              LimitedMapID;                                             // (Parm, NeedCtorLink)
	int[]                                              LimitedModeID;                                            // (Parm, NeedCtorLink)
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
	string                                             RoomUniqueID;                                             // (Parm, NeedCtorLink)
	int                                                RoomNumber;                                               // (Parm)
	byte                                               Answer;                                                   // (Parm)
	string                                             InviteCharName;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvInviteGameRoom
struct UBTTcpLink_Channel_rfReqRecvInviteGameRoom_Params
{
	string                                             InviteUserServerName;                                     // (Parm, NeedCtorLink)
	int                                                InviteUserServerID;                                       // (Parm)
	int                                                InviteUserChannelNumber;                                  // (Parm)
	string                                             RoomUniqueID;                                             // (Parm, NeedCtorLink)
	int                                                RoomNumber;                                               // (Parm)
	string                                             RoomName;                                                 // (Parm, NeedCtorLink)
	byte                                               RoomState;                                                // (Parm)
	string                                             MapName;                                                  // (Parm, NeedCtorLink)
	string                                             OwnerName;                                                // (Parm, NeedCtorLink)
	byte                                               GameMode;                                                 // (Parm)
	byte                                               WeaponLimit;                                              // (Parm)
	byte                                               IsTeamBalance;                                            // (Parm)
	string                                             Password;                                                 // (Parm, NeedCtorLink)
	string                                             InviteCharName;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckInviteGameRoom
struct UBTTcpLink_Channel_rfAckInviteGameRoom_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               Answer;                                                   // (Parm)
	string                                             GuestCharName;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqInviteGameRoom
struct UBTTcpLink_Channel_rfReqInviteGameRoom_Params
{
	string                                             GuestCharName;                                            // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                NewLeader;                                                // (Parm)
	string                                             NewLeaderName;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_ChangeLeader
struct UBTTcpLink_Channel_rfReqClanMatch_ChangeLeader_Params
{
	int                                                WaitRoomIdx;                                              // (Parm)
	int                                                NewLeaderID;                                              // (Parm)
	string                                             NewLeaderName;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_WaittingTeamList
struct UBTTcpLink_Channel_rfAckClanMatch_WaittingTeamList_Params
{
	int                                                TtotlCount;                                               // (Parm)
	int[]                                              Grade;                                                    // (Parm, NeedCtorLink)
	int[]                                              Map;                                                      // (Parm, NeedCtorLink)
	int[]                                              Versus;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_Chat
struct UBTTcpLink_Channel_rfReqClanMatch_Chat_Params
{
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_LeaveNotify
struct UBTTcpLink_Channel_rfAckClanMatch_LeaveNotify_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_Leave
struct UBTTcpLink_Channel_rfAckClanMatch_Leave_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte[]                                             IsLeader;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanMarkPA;                                               // (Parm, NeedCtorLink)
	int[]                                              ClanMarkBG;                                               // (Parm, NeedCtorLink)
	int[]                                              ClanMarkBL;                                               // (Parm, NeedCtorLink)
	int[]                                              Level;                                                    // (Parm, NeedCtorLink)
	string[]                                           CharName;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanGrade;                                                // (Parm, NeedCtorLink)
	int[]                                              ClanWin;                                                  // (Parm, NeedCtorLink)
	int[]                                              ClanLose;                                                 // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanLevel;                                                // (Parm, NeedCtorLink)
	int[]                                              LevelMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              TitleMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              Reserved1;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved2;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved3;                                                // (Parm, NeedCtorLink)
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
	byte                                               IsLeader;                                                 // (Parm)
	int                                                ClanMarkPA;                                               // (Parm)
	int                                                ClanMarkBG;                                               // (Parm)
	int                                                ClanMarkBL;                                               // (Parm)
	int                                                Level;                                                    // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanGrade;                                                // (Parm)
	int                                                ClanWin;                                                  // (Parm)
	int                                                ClanLose;                                                 // (Parm)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             Invitee;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_RecvInviteCrew
struct UBTTcpLink_Channel_rfAckClanMatch_RecvInviteCrew_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             Inviter;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_RecvInviteCrew
struct UBTTcpLink_Channel_rfReqClanMatch_RecvInviteCrew_Params
{
	string                                             Inviter;                                                  // (Parm, NeedCtorLink)
	string                                             ServerIP;                                                 // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	int                                                WaittingID;                                               // (Parm)
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	int                                                MapNum;                                                   // (Parm)
	int                                                InviteUserChannelNum;                                     // (Parm)
	string                                             LeaderName;                                               // (Parm, NeedCtorLink)
	string                                             RoomName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_InviteCrew
struct UBTTcpLink_Channel_rfAckClanMatch_InviteCrew_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_InviteCrew
struct UBTTcpLink_Channel_rfReqClanMatch_InviteCrew_Params
{
	string                                             Invitee;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_NotifiyStartCombat
struct UBTTcpLink_Channel_rfAckClanMatch_NotifiyStartCombat_Params
{
	int[]                                              MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_StartCombat
struct UBTTcpLink_Channel_rfAckClanMatch_StartCombat_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanMatch_StartCombat
struct UBTTcpLink_Channel_rfReqClanMatch_StartCombat_Params
{
	int[]                                              MapNumArray;                                              // (Parm, NeedCtorLink)
	int                                                VersusMode;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanMatch_GetReady
struct UBTTcpLink_Channel_rfAckClanMatch_GetReady_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              UserID;                                                   // (Parm, NeedCtorLink)
	int[]                                              TeamNum;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetItemFromItemBox
struct UBTTcpLink_Channel_rfAckGetItemFromItemBox_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                ItemIDChoose;                                             // (Parm)
	int                                                PartIDChoose;                                             // (Parm)
	struct FBtrDouble                                  BoxItemIdx;                                               // (Parm)
	int                                                BxoItemCount;                                             // (Parm)
	byte                                               bHave;                                                    // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	int                                                BoxItemID;                                                // (Parm)
	int[]                                              ItemID;                                                   // (Parm, NeedCtorLink)
	int[]                                              PartID;                                                   // (Parm, NeedCtorLink)
	byte                                               FromContent;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqItemListInItemBox
struct UBTTcpLink_Channel_rfReqItemListInItemBox_Params
{
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	int                                                BoxItemID;                                                // (Parm)
	byte                                               FromContent;                                              // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UID;                                                      // (Parm)
	string                                             UserName;                                                 // (Parm, NeedCtorLink)
	int                                                Grade;                                                    // (Parm)
	int                                                TeamNum;                                                  // (Parm)
	byte                                               Statue;                                                   // (Parm)
	byte                                               IsHost;                                                   // (Parm)
	string                                             UserIP;                                                   // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                CM_Pattern;                                               // (Parm)
	int                                                CM_BG;                                                    // (Parm)
	int                                                CM_BL;                                                    // (Parm)
	byte                                               IsLookFor;                                                // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	struct FBtrDouble[]                                ItemUniqueIDs;                                            // (Parm, NeedCtorLink)
	int[]                                              ItemIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              ItemPartIDs;                                              // (Parm, NeedCtorLink)
	byte[]                                             ItemSlotPos;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChatWispherMyCommunity
struct UBTTcpLink_Channel_rfAckChatWispherMyCommunity_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChatWispherMyCommunity
struct UBTTcpLink_Channel_rfReqChatWispherMyCommunity_Params
{
	string                                             SourceCharName;                                           // (Parm, NeedCtorLink)
	string                                             SenderName;                                               // (Parm, NeedCtorLink)
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyDisconnectHostInLoading
struct UBTTcpLink_Channel_rfReqNotifyDisconnectHostInLoading_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                HostID;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvForceDisconnected_FromGM
struct UBTTcpLink_Channel_rfReqRecvForceDisconnected_FromGM_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckForceDisconnectUser_GM
struct UBTTcpLink_Channel_rfAckForceDisconnectUser_GM_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqForceDisconnectUser_GM
struct UBTTcpLink_Channel_rfReqForceDisconnectUser_GM_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvNotice_FromGM
struct UBTTcpLink_Channel_rfReqRecvNotice_FromGM_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string[]                                           NoticeMsg;                                                // (Parm, NeedCtorLink)
	byte                                               IsFromDB;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotice_GM
struct UBTTcpLink_Channel_rfAckNotice_GM_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               NoticeType;                                               // (Parm)
	int                                                ServerID;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                GameRoomNum;                                              // (Parm)
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotice_GM
struct UBTTcpLink_Channel_rfReqNotice_GM_Params
{
	byte                                               NoticeType;                                               // (Parm)
	int                                                ServerID;                                                 // (Parm)
	int                                                ChannelNum;                                               // (Parm)
	int                                                GameRoomNum;                                              // (Parm)
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSpecificChannelUserInfo
struct UBTTcpLink_Channel_rfAckSpecificChannelUserInfo_Params
{
	int                                                UID;                                                      // (Parm)
	string                                             UserID;                                                   // (Parm, NeedCtorLink)
	int                                                UserLevels;                                               // (Parm)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanPattern;                                              // (Parm)
	int                                                ClanBG;                                                   // (Parm)
	int                                                ClanBL;                                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             Title;                                                    // (Parm, NeedCtorLink)
	string                                             MapName;                                                  // (Parm, NeedCtorLink)
	int                                                MapNum;                                                   // (Parm)
	byte                                               UserCount;                                                // (Parm)
	byte                                               MaxCount;                                                 // (Parm)
	string                                             GameModeName;                                             // (Parm, NeedCtorLink)
	int                                                ModeNum;                                                  // (Parm)
	byte                                               WeaponLimit;                                              // (Parm)
	byte                                               IsHardCore;                                               // (Parm)
	byte                                               Status;                                                   // (Parm)
	string                                             RoomOwnerIP;                                              // (Parm, NeedCtorLink)
	int                                                GameMinute;                                               // (Parm)
	string                                             RoomOwnerName;                                            // (Parm, NeedCtorLink)
	byte                                               IsSpecial;                                                // (Parm)
	byte                                               IsPassword;                                               // (Parm)
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
	int[]                                              UID;                                                      // (Parm, NeedCtorLink)
	string[]                                           CharName;                                                 // (Parm, NeedCtorLink)
	int[]                                              UserLevel;                                                // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanPattern;                                              // (Parm, NeedCtorLink)
	int[]                                              ClanBG;                                                   // (Parm, NeedCtorLink)
	int[]                                              ClanBL;                                                   // (Parm, NeedCtorLink)
	byte[]                                             IsLookForClan;                                            // (Parm, NeedCtorLink)
	int[]                                              ClanLevel;                                                // (Parm, NeedCtorLink)
	int[]                                              LevelMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              TitleMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              Reserved1;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved2;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved3;                                                // (Parm, NeedCtorLink)
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
	string                                             FromCharName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckDeleteFriend
struct UBTTcpLink_Channel_rfAckDeleteFriend_Params
{
	int                                                Result;                                                   // (Parm)
	string[]                                           FailedCharname;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqDeleteFriend
struct UBTTcpLink_Channel_rfReqDeleteFriend_Params
{
	string[]                                           DeleteCharName;                                           // (Parm, NeedCtorLink)
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
	struct FBtrDouble[]                                ItemUniqueID;                                             // (Parm, NeedCtorLink)
	int[]                                              ItemSlotNum;                                              // (Parm, NeedCtorLink)
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
	int[]                                              GetChopperAssistUID;                                      // (Parm, NeedCtorLink)
	float                                              KillXCoord;                                               // (Parm)
	float                                              KillYCoord;                                               // (Parm)
	float                                              KillZCoord;                                               // (Parm)
	int                                                KillPos;                                                  // (Parm)
	int                                                KillWeaponID;                                             // (Parm)
	int                                                KillWeaponPartID;                                         // (Parm)
	int                                                KillRange;                                                // (Parm)
	int                                                KillDamage;                                               // (Parm)
	int                                                ChopperCallerID;                                          // (Parm)
	string                                             ChopperCallerName;                                        // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                ItemUniqueID;                                             // (Parm, NeedCtorLink)
	int[]                                              ItemIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              PartIDs;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckIsAvailClanURL
struct UBTTcpLink_Channel_rfAckIsAvailClanURL_Params
{
	string                                             ClanURL;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqIsAvailClanURL
struct UBTTcpLink_Channel_rfReqIsAvailClanURL_Params
{
	string                                             ClanURL;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetIsHostBlocking
struct UBTTcpLink_Channel_rfAckGetIsHostBlocking_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               Blocking;                                                 // (Parm)
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
	byte                                               Blocking;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyHostBlocking
struct UBTTcpLink_Channel_rfReqNotifyHostBlocking_Params
{
	byte                                               Blocking;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetHolePunchingResult
struct UBTTcpLink_Channel_rfAckGetHolePunchingResult_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               Phrase;                                                   // (Parm)
	int                                                InterventionUserID;                                       // (Parm)
	byte                                               Intervention;                                             // (Parm)
	int[]                                              FailedUserIDs;                                            // (Parm, NeedCtorLink)
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
	byte                                               Phrase;                                                   // (Parm)
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
	string                                             RelayIP;                                                  // (Parm, NeedCtorLink)
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
	byte                                               Destination;                                              // (Parm)
	string                                             LogMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGamePlay_SetRoundStartTime
struct UBTTcpLink_Channel_rfReqGamePlay_SetRoundStartTime_Params
{
	int[]                                              UID;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGamePlay_SetGameStartTime
struct UBTTcpLink_Channel_rfReqGamePlay_SetGameStartTime_Params
{
	int[]                                              UID;                                                      // (Parm, NeedCtorLink)
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
	int[]                                              TakerUID;                                                 // (Parm, NeedCtorLink)
	byte                                               TakePos;                                                  // (Parm)
	float[]                                            TakerXCoord;                                              // (Parm, NeedCtorLink)
	float[]                                            TakerYCoord;                                              // (Parm, NeedCtorLink)
	float[]                                            TakerZCoord;                                              // (Parm, NeedCtorLink)
	int[]                                              TakerPos;                                                 // (Parm, NeedCtorLink)
	int[]                                              TakerWeaponID;                                            // (Parm, NeedCtorLink)
	int[]                                              TakerWeaponPartID;                                        // (Parm, NeedCtorLink)
	int[]                                              TakerRange;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyChangeRoomState
struct UBTTcpLink_Channel_rfReqNotifyChangeRoomState_Params
{
	byte                                               RoomState;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqGamePlay_DefuseBomb
struct UBTTcpLink_Channel_rfReqGamePlay_DefuseBomb_Params
{
	int                                                DefuserUID;                                               // (Parm)
	byte                                               DefusePos;                                                // (Parm)
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
	byte                                               InstallPos;                                               // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                CM_Pattern;                                               // (Parm)
	int                                                CM_BG;                                                    // (Parm)
	int                                                CM_BL;                                                    // (Parm)
	string                                             ClanPersonIntro;                                          // (Parm, NeedCtorLink)
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
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
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
	string                                             ClientIP;                                                 // (Parm, NeedCtorLink)
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
	byte                                               VTeam;                                                    // (Parm)
	byte                                               VTeamAD;                                                  // (Parm)
	int                                                AFScore;                                                  // (Parm)
	int                                                RSAScore;                                                 // (Parm)
	int                                                Round;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqLogGetScore
struct UBTTcpLink_Channel_rfReqLogGetScore_Params
{
	struct FKillDeathLog                               KillDeathLogParam;                                        // (Parm)
	int[]                                              AssistUIDs;                                               // (Parm, NeedCtorLink)
	byte[]                                             AssistScores;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAuctionTradeHistory
struct UBTTcpLink_Channel_rfAckAuctionTradeHistory_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                ItemID;                                                   // (Parm)
	int                                                PartID;                                                   // (Parm)
	string[]                                           SellerCharNm;                                             // (Parm, NeedCtorLink)
	int[]                                              DamageDegree;                                             // (Parm, NeedCtorLink)
	int[]                                              Price;                                                    // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                PointRemain;                                              // (Parm)
	int                                                CashRemain;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSendGift
struct UBTTcpLink_Channel_rfReqSendGift_Params
{
	int                                                ItemID;                                                   // (Parm)
	string                                             RecvCharname;                                             // (Parm, NeedCtorLink)
	string                                             RecvMessage;                                              // (Parm, NeedCtorLink)
	byte                                               BuyOption1;                                               // (Parm)
	byte                                               BuyOption2;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetAttachedItemFromMemo
struct UBTTcpLink_Channel_rfAckGetAttachedItemFromMemo_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChatClan
struct UBTTcpLink_Channel_rfAckChatClan_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChatClan
struct UBTTcpLink_Channel_rfReqChatClan_Params
{
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckTestDouble
struct UBTTcpLink_Channel_rfAckTestDouble_Params
{
	struct FBtrDouble                                  vDouble;                                                  // (Parm)
	struct FBtrDouble[]                                vDoubles;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqTestDouble
struct UBTTcpLink_Channel_rfReqTestDouble_Params
{
	struct FBtrDouble                                  vDouble;                                                  // (Parm)
	struct FBtrDouble[]                                vDoubles;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyLoadingState
struct UBTTcpLink_Channel_rfAckNotifyLoadingState_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                UserID;                                                   // (Parm)
	byte                                               LoadingState;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqNotifyLoadingState
struct UBTTcpLink_Channel_rfReqNotifyLoadingState_Params
{
	byte                                               LoadingState;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckFailedStartGame
struct UBTTcpLink_Channel_rfAckFailedStartGame_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               IsHost;                                                   // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               IsHost;                                                   // (Parm)
	string                                             HostIP;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             PersonelIntro;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanCharPersonelIntro
struct UBTTcpLink_Channel_rfReqClanCharPersonelIntro_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanPersonelIntro
struct UBTTcpLink_Channel_rfAckClanPersonelIntro_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanPersonelIntro
struct UBTTcpLink_Channel_rfReqClanPersonelIntro_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             PersonelIntro;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanChangeInfo
struct UBTTcpLink_Channel_rfAckClanChangeInfo_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanChangeInfo
struct UBTTcpLink_Channel_rfReqClanChangeInfo_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	byte                                               IsRecruit;                                                // (Parm)
	byte                                               Region;                                                   // (Parm)
	string                                             Keyword;                                                  // (Parm, NeedCtorLink)
	string                                             ClanIntro;                                                // (Parm, NeedCtorLink)
	string                                             Notice;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanClose
struct UBTTcpLink_Channel_rfAckClanClose_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanClose
struct UBTTcpLink_Channel_rfReqClanClose_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyClanSecession
struct UBTTcpLink_Channel_rfAckNotifyClanSecession_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanSecession
struct UBTTcpLink_Channel_rfAckClanSecession_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanSecession
struct UBTTcpLink_Channel_rfReqClanSecession_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClanNews
struct UBTTcpLink_Channel_rfAckClanNews_Params
{
	string[]                                           IssueDate;                                                // (Parm, NeedCtorLink)
	byte[]                                             IssueType;                                                // (Parm, NeedCtorLink)
	string[]                                           IssuedClanMember;                                         // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqClanNews
struct UBTTcpLink_Channel_rfReqClanNews_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyAdjustClanMemberGrade
struct UBTTcpLink_Channel_rfAckNotifyAdjustClanMemberGrade_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	byte                                               CharGrade;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAdjustClanMemberGrade
struct UBTTcpLink_Channel_rfAckAdjustClanMemberGrade_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	byte                                               CharGrade;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAdjustClanMemberGrade
struct UBTTcpLink_Channel_rfReqAdjustClanMemberGrade_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	byte                                               CharGrade;                                                // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              Level;                                                    // (Parm, NeedCtorLink)
	string[]                                           CharName;                                                 // (Parm, NeedCtorLink)
	byte[]                                             ClanGrade;                                                // (Parm, NeedCtorLink)
	int[]                                              ClanWinCnt;                                               // (Parm, NeedCtorLink)
	int[]                                              ClanLoseCnt;                                              // (Parm, NeedCtorLink)
	int[]                                              LevelMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              TitleMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              DudeId;                                                   // (Parm, NeedCtorLink)
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
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSearchClan
struct UBTTcpLink_Channel_rfAckSearchClan_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                TotalPage;                                                // (Parm)
	int[]                                              ClanMarkPattern;                                          // (Parm, NeedCtorLink)
	int[]                                              ClanMarkBG;                                               // (Parm, NeedCtorLink)
	byte[]                                             ClanMarkBL;                                               // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	string[]                                           ClanMaster;                                               // (Parm, NeedCtorLink)
	int[]                                              ClanMember;                                               // (Parm, NeedCtorLink)
	int[]                                              ClanMemberMax;                                            // (Parm, NeedCtorLink)
	int[]                                              ClanCreateDate;                                           // (Parm, NeedCtorLink)
	int[]                                              ClanWin;                                                  // (Parm, NeedCtorLink)
	int[]                                              ClanLose;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanDraw;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanRank;                                                 // (Parm, NeedCtorLink)
	byte[]                                             ClanRecruit;                                              // (Parm, NeedCtorLink)
	int[]                                              ClanLevel;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSerachClan
struct UBTTcpLink_Channel_rfReqSerachClan_Params
{
	byte                                               SearchType;                                               // (Parm)
	string                                             Keyword;                                                  // (Parm, NeedCtorLink)
	byte                                               ClanStatus;                                               // (Parm)
	byte                                               ClanRegion;                                               // (Parm)
	int                                                ReqPage;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckJoinClanResult
struct UBTTcpLink_Channel_rfAckJoinClanResult_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	byte                                               Permit;                                                   // (Parm)
	string                                             PermitCharName;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRecvJoinClanResult
struct UBTTcpLink_Channel_rfAckRecvJoinClanResult_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRecvJoinClan
struct UBTTcpLink_Channel_rfAckRecvJoinClan_Params
{
	int                                                UserIdx;                                                  // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             ReqMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               Permit;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvJoinClan
struct UBTTcpLink_Channel_rfReqRecvJoinClan_Params
{
	int                                                UserIdx;                                                  // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckJoinClan
struct UBTTcpLink_Channel_rfAckJoinClan_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             SpecificCharName;                                         // (Parm, NeedCtorLink)
	string                                             RealRecvCharName;                                         // (Parm, NeedCtorLink)
	byte                                               RealRecvCharClanGrade;                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqJoinClan
struct UBTTcpLink_Channel_rfReqJoinClan_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             ClanManagerName;                                          // (Parm, NeedCtorLink)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckInviteClanResult
struct UBTTcpLink_Channel_rfAckInviteClanResult_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	byte                                               Permit;                                                   // (Parm)
	string                                             ClanNm;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRecvClanInviteResult
struct UBTTcpLink_Channel_rfAckRecvClanInviteResult_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRecvClanInvite
struct UBTTcpLink_Channel_rfAckRecvClanInvite_Params
{
	int                                                InviterUserDBID;                                          // (Parm)
	string                                             InviterCharname;                                          // (Parm, NeedCtorLink)
	string                                             InviterMsg;                                               // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	byte                                               Permit;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvClanInvite
struct UBTTcpLink_Channel_rfReqRecvClanInvite_Params
{
	int                                                InviterUserDBID;                                          // (Parm)
	string                                             InviterCharname;                                          // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             InviteMsg;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckInviteClan
struct UBTTcpLink_Channel_rfAckInviteClan_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqInviteClan
struct UBTTcpLink_Channel_rfReqInviteClan_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             InviteMsg;                                                // (Parm, NeedCtorLink)
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
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckCreateClan
struct UBTTcpLink_Channel_rfAckCreateClan_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // (Parm)
	int                                                StackCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqCreateClan
struct UBTTcpLink_Channel_rfReqCreateClan_Params
{
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	string                                             ClanURL;                                                  // (Parm, NeedCtorLink)
	string                                             ClanIntro;                                                // (Parm, NeedCtorLink)
	string                                             ClanKeyword;                                              // (Parm, NeedCtorLink)
	byte                                               ClanRegion;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckDupCheckClanName
struct UBTTcpLink_Channel_rfAckDupCheckClanName_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqDupCheckClanName
struct UBTTcpLink_Channel_rfReqDupCheckClanName_Params
{
	string                                             ClanNam;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSellShopItemInfo
struct UBTTcpLink_Channel_rfAckSellShopItemInfo_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               Section;                                                  // (Parm)
	byte                                               Classfy;                                                  // (Parm)
	int                                                ItemType;                                                 // (Parm)
	int                                                ItemGrade;                                                // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAuctionItemListCount
struct UBTTcpLink_Channel_rfReqAuctionItemListCount_Params
{
	byte                                               Section;                                                  // (Parm)
	byte                                               Classfy;                                                  // (Parm)
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
	byte[]                                             QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	int[]                                              MWItemID;                                                 // (Parm, NeedCtorLink)
	int[]                                              MWPartID;                                                 // (Parm, NeedCtorLink)
	int[]                                              MWPaintID;                                                // (Parm, NeedCtorLink)
	int[]                                              PistolItemID;                                             // (Parm, NeedCtorLink)
	int[]                                              PistolPartID;                                             // (Parm, NeedCtorLink)
	int[]                                              PistolPaintID;                                            // (Parm, NeedCtorLink)
	int[]                                              TWItemID1;                                                // (Parm, NeedCtorLink)
	int[]                                              TWItemID2;                                                // (Parm, NeedCtorLink)
	int[]                                              Skill1ID;                                                 // (Parm, NeedCtorLink)
	int[]                                              Skill2ID;                                                 // (Parm, NeedCtorLink)
	int[]                                              Skill3ID;                                                 // (Parm, NeedCtorLink)
	int[]                                              Skill4ID;                                                 // (Parm, NeedCtorLink)
	int[]                                              KWItemID;                                                 // (Parm, NeedCtorLink)
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
	byte[]                                             QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                MWUniqueID;                                               // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                PistolUniqueID;                                           // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                TW1UniqueID;                                              // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                TW2UniqueID;                                              // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                KnifeUniqueID;                                            // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte                                               Section;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAuctionItemList
struct UBTTcpLink_Channel_rfAckAuctionItemList_Params
{
	byte                                               Section;                                                  // (Parm)
	int[]                                              UniqueIDs;                                                // (Parm, NeedCtorLink)
	int[]                                              ItemIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              AddPartsIDs;                                              // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UntilTimes;                                               // (Parm, NeedCtorLink)
	int[]                                              BiddingPrices;                                            // (Parm, NeedCtorLink)
	int[]                                              InstantlyByuingPrices;                                    // (Parm, NeedCtorLink)
	int[]                                              ItemDamageds;                                             // (Parm, NeedCtorLink)
	string[]                                           HighestBidderNames;                                       // (Parm, NeedCtorLink)
	string[]                                           SellerNames;                                              // (Parm, NeedCtorLink)
	int[]                                              ItemCount;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAuctionItemListStart
struct UBTTcpLink_Channel_rfAckAuctionItemListStart_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               Section;                                                  // (Parm)
	int                                                PageNum;                                                  // (Parm)
	int                                                Count;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAuctionItemList
struct UBTTcpLink_Channel_rfReqAuctionItemList_Params
{
	byte                                               Section;                                                  // (Parm)
	string                                             Keyword;                                                  // (Parm, NeedCtorLink)
	int                                                ItemRank;                                                 // (Parm)
	byte                                               ItemClassfy;                                              // (Parm)
	byte                                               IsAvailable;                                              // (Parm)
	int                                                PageNum;                                                  // (Parm)
	int                                                Count;                                                    // (Parm)
	int                                                SortOpt;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAuctionMyItemCancel
struct UBTTcpLink_Channel_rfAckAuctionMyItemCancel_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                Point;                                                    // (Parm)
	int                                                Cash;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqMyMoney
struct UBTTcpLink_Channel_rfReqMyMoney_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckUpdateQSlot_2
struct UBTTcpLink_Channel_rfAckUpdateQSlot_2_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte[]                                             DisplayOrder;                                             // (Parm, NeedCtorLink)
	int[]                                              ItemTID;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                ItemUID;                                                  // (Parm, NeedCtorLink)
	byte[]                                             SlotPos_Key;                                              // (Parm, NeedCtorLink)
	byte[]                                             SlotPos_Value;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqUpdateQSlot_2
struct UBTTcpLink_Channel_rfReqUpdateQSlot_2_Params
{
	byte[]                                             DisplayOrder;                                             // (Parm, NeedCtorLink)
	int[]                                              ItemTID;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                ItemUID;                                                  // (Parm, NeedCtorLink)
	byte[]                                             SlotPos_Key;                                              // (Parm, NeedCtorLink)
	byte[]                                             SlotPos_Value;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckUpdateQSlot
struct UBTTcpLink_Channel_rfAckUpdateQSlot_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqUpdateQSlot
struct UBTTcpLink_Channel_rfReqUpdateQSlot_Params
{
	int                                                QSlotID;                                                  // (Parm)
	string                                             QSlotName;                                                // (Parm, NeedCtorLink)
	struct FBtrDouble                                  MWItemID;                                                 // (Parm)
	struct FBtrDouble                                  PistolItemID;                                             // (Parm)
	struct FBtrDouble                                  TWItemID1;                                                // (Parm)
	struct FBtrDouble                                  TWItemID2;                                                // (Parm)
	int                                                Skill1;                                                   // (Parm)
	int                                                Skill2;                                                   // (Parm)
	int                                                Skill3;                                                   // (Parm)
	int                                                Skill4;                                                   // (Parm)
	struct FBtrDouble                                  KnifeItemID;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckQSlotList_2
struct UBTTcpLink_Channel_rfAckQSlotList_2_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte[]                                             QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	int[]                                              QSlotIDX;                                                 // (Parm, NeedCtorLink)
	int[]                                              ItemTID;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                ItemUID;                                                  // (Parm, NeedCtorLink)
	byte[]                                             SlotPos;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqQSlotList_2
struct UBTTcpLink_Channel_rfReqQSlotList_2_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckQSlotList
struct UBTTcpLink_Channel_rfAckQSlotList_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              QSlotID;                                                  // (Parm, NeedCtorLink)
	string[]                                           QSlotName;                                                // (Parm, NeedCtorLink)
	byte[]                                             QSlotDispOrder;                                           // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                MWItemID;                                                 // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                PistolItemID;                                             // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                TWItemID1;                                                // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                TWItemID2;                                                // (Parm, NeedCtorLink)
	int[]                                              Skill1;                                                   // (Parm, NeedCtorLink)
	int[]                                              Skill2;                                                   // (Parm, NeedCtorLink)
	int[]                                              Skill3;                                                   // (Parm, NeedCtorLink)
	int[]                                              Skill4;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                KnifeItemID;                                              // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UniqueItemID;                                             // (Parm, NeedCtorLink)
	int                                                RepairCost;                                               // (Parm)
	int[]                                              DamageDegree;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRepairItem
struct UBTTcpLink_Channel_rfReqRepairItem_Params
{
	struct FBtrDouble[]                                UniqueItemID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRepairCost
struct UBTTcpLink_Channel_rfAckRepairCost_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UniqueItemID;                                             // (Parm, NeedCtorLink)
	int[]                                              RepairCost;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRepairCost
struct UBTTcpLink_Channel_rfReqRepairCost_Params
{
	struct FBtrDouble[]                                UniqueItemID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckUpdateWeaponDurability
struct UBTTcpLink_Channel_rfAckUpdateWeaponDurability_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UniqueItemID;                                             // (Parm, NeedCtorLink)
	int[]                                              Durability;                                               // (Parm, NeedCtorLink)
	byte[]                                             IsDestroy;                                                // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                FailedWeaponUniqueID;                                     // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqUpdateWeaponDurability
struct UBTTcpLink_Channel_rfReqUpdateWeaponDurability_Params
{
	int                                                TotalPlayTime;                                            // (Parm)
	int[]                                              OwnerID;                                                  // (Parm, NeedCtorLink)
	int[]                                              Number;                                                   // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UniqueItemID;                                             // (Parm, NeedCtorLink)
	int[]                                              UsingSec;                                                 // (Parm, NeedCtorLink)
	int[]                                              UsingRoundInSD;                                           // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckModifyWeapon
struct UBTTcpLink_Channel_rfAckModifyWeapon_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              Result;                                                   // (Parm, NeedCtorLink)
	int[]                                              BoughtItemTypeID;                                         // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                BoughtItemUniqueID;                                       // (Parm, NeedCtorLink)
	int[]                                              BoughtPartID;                                             // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                BoughtUntilTIme;                                          // (Parm, NeedCtorLink)
	int[]                                              BoughtStackCnt;                                           // (Parm, NeedCtorLink)
	int                                                PointRemain;                                              // (Parm)
	int                                                CashRemain;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqBuyShopItem
struct UBTTcpLink_Channel_rfReqBuyShopItem_Params
{
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  ItemUniqueID;                                             // (Parm)
	byte                                               BuyOption1;                                               // (Parm)
	byte                                               BuyOption2;                                               // (Parm)
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
	int[]                                              ItemID;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte[]                                             DisplayOrder;                                             // (Parm, NeedCtorLink)
	byte[]                                             SlotPos;                                                  // (Parm, NeedCtorLink)
	int[]                                              ItemTID;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                ItemUID;                                                  // (Parm, NeedCtorLink)
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
	byte[]                                             DisplayOrder;                                             // (Parm, NeedCtorLink)
	byte[]                                             SlotPos;                                                  // (Parm, NeedCtorLink)
	int[]                                              ItemTID;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                ItemUID;                                                  // (Parm, NeedCtorLink)
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
	int[]                                              SkillIDs;                                                 // (Parm, NeedCtorLink)
	byte[]                                             NewStates;                                                // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              ItemIDs;                                                  // (Parm, NeedCtorLink)
	byte[]                                             NewStates;                                                // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte                                               ChangedNewSlotPosition;                                   // (Parm)
	int                                                ChangedOldSkillID;                                        // (Parm)
	int                                                ChangedOldSkillUniqueID;                                  // (Parm)
	byte                                               ChangedOldSlotPosition;                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqEquipSkill
struct UBTTcpLink_Channel_rfReqEquipSkill_Params
{
	int                                                SkillID;                                                  // (Parm)
	int                                                SkillUniqueID;                                            // (Parm)
	byte                                               NewSlotPosition;                                          // (Parm)
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
	int[]                                              UniqueSkillID;                                            // (Parm, NeedCtorLink)
	int[]                                              SkillID;                                                  // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UntilTime;                                                // (Parm, NeedCtorLink)
	byte[]                                             SlotPosition;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckUserSkillListStart
struct UBTTcpLink_Channel_rfAckUserSkillListStart_Params
{
	int                                                Count;                                                    // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              FailedMemoID;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqDelMemo
struct UBTTcpLink_Channel_rfReqDelMemo_Params
{
	int[]                                              MemoIdx;                                                  // (Parm, NeedCtorLink)
	byte                                               Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckReadMemo
struct UBTTcpLink_Channel_rfAckReadMemo_Params
{
	string                                             cnameFrom;                                                // (Parm, NeedCtorLink)
	string                                             Text;                                                     // (Parm, NeedCtorLink)
	string                                             dateRecv;                                                 // (Parm, NeedCtorLink)
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
	int[]                                              MemoIdx;                                                  // (Parm, NeedCtorLink)
	string[]                                           cnameFrom;                                                // (Parm, NeedCtorLink)
	string[]                                           dateRecv;                                                 // (Parm, NeedCtorLink)
	string[]                                           Text;                                                     // (Parm, NeedCtorLink)
	byte[]                                             Status;                                                   // (Parm, NeedCtorLink)
	int[]                                              UntilExpire;                                              // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                ItemUID;                                                  // (Parm, NeedCtorLink)
	int[]                                              ItemID;                                                   // (Parm, NeedCtorLink)
	byte[]                                             MsgType;                                                  // (Parm, NeedCtorLink)
	int[]                                              ItemPartID;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckStartMemoList
struct UBTTcpLink_Channel_rfAckStartMemoList_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               Type;                                                     // (Parm)
	int                                                TotalCount;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqMemoList
struct UBTTcpLink_Channel_rfReqMemoList_Params
{
	byte                                               Type;                                                     // (Parm)
	byte                                               MemoType;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvMemo
struct UBTTcpLink_Channel_rfReqRecvMemo_Params
{
	string                                             cnameFrom;                                                // (Parm, NeedCtorLink)
	byte                                               MemoType;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSendMemo
struct UBTTcpLink_Channel_rfAckSendMemo_Params
{
	string[]                                           CnamesToFail;                                             // (Parm, NeedCtorLink)
	int[]                                              ResultArray;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSendMemo
struct UBTTcpLink_Channel_rfReqSendMemo_Params
{
	string[]                                           cnames;                                                   // (Parm, NeedCtorLink)
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	int                                                ItemUID;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvChatWispher
struct UBTTcpLink_Channel_rfReqRecvChatWispher_Params
{
	string                                             CharnameFrom;                                             // (Parm, NeedCtorLink)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChatWispher
struct UBTTcpLink_Channel_rfAckChatWispher_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             ToCharName;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChatWispher
struct UBTTcpLink_Channel_rfReqChatWispher_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRemoveBlockUserList
struct UBTTcpLink_Channel_rfAckRemoveBlockUserList_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRemoveBlockUserList
struct UBTTcpLink_Channel_rfReqRemoveBlockUserList_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckAddBlockUserList
struct UBTTcpLink_Channel_rfAckAddBlockUserList_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqAddBlockUserList
struct UBTTcpLink_Channel_rfReqAddBlockUserList_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
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
	string[]                                           CharName;                                                 // (Parm, NeedCtorLink)
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
	string                                             CharnameToBeInvited;                                      // (Parm, NeedCtorLink)
	byte                                               IsPermit;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckConfirmFriendInvite
struct UBTTcpLink_Channel_rfAckConfirmFriendInvite_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqConfirmFriendInvite
struct UBTTcpLink_Channel_rfReqConfirmFriendInvite_Params
{
	int                                                ReqUserID;                                                // (Parm)
	string                                             ReqedCharname;                                            // (Parm, NeedCtorLink)
	byte                                               IsPermit;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRecvFriendInvite
struct UBTTcpLink_Channel_rfReqRecvFriendInvite_Params
{
	int                                                ReqUserID;                                                // (Parm)
	string                                             ReqCharname;                                              // (Parm, NeedCtorLink)
	string                                             InviteMsg;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckSendFriendInvite
struct UBTTcpLink_Channel_rfAckSendFriendInvite_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSendFriendInvite
struct UBTTcpLink_Channel_rfReqSendFriendInvite_Params
{
	int                                                InviteUserID;                                             // (Parm)
	string                                             InviteName;                                               // (Parm, NeedCtorLink)
	string                                             InviteMsg;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChatNormal
struct UBTTcpLink_Channel_rfAckChatNormal_Params
{
	int                                                id;                                                       // (Parm)
	string                                             Sender;                                                   // (Parm, NeedCtorLink)
	string                                             Message;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChatNormal
struct UBTTcpLink_Channel_rfReqChatNormal_Params
{
	string                                             Message;                                                  // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqEquipItem
struct UBTTcpLink_Channel_rfReqEquipItem_Params
{
	int                                                ItemID;                                                   // (Parm)
	struct FBtrDouble                                  UniqueID;                                                 // (Parm)
	int                                                SlotPos_Key;                                              // (Parm)
	byte                                               SlotPos_Value;                                            // (Parm)
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
	struct FBtrDouble[]                                UniqueID;                                                 // (Parm, NeedCtorLink)
	int[]                                              ItemID;                                                   // (Parm, NeedCtorLink)
	int[]                                              ItemType;                                                 // (Parm, NeedCtorLink)
	int[]                                              Durability;                                               // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UntilTime;                                                // (Parm, NeedCtorLink)
	int[]                                              SlotPosition;                                             // (Parm, NeedCtorLink)
	int[]                                              AddPartsID;                                               // (Parm, NeedCtorLink)
	int[]                                              DamageDegree;                                             // (Parm, NeedCtorLink)
	byte[]                                             ItemState;                                                // (Parm, NeedCtorLink)
	int[]                                              StackCount;                                               // (Parm, NeedCtorLink)
	int[]                                              PaintID;                                                  // (Parm, NeedCtorLink)
	int[]                                              TradeCount;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckItemListStart
struct UBTTcpLink_Channel_rfAckItemListStart_Params
{
	int                                                Count;                                                    // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              UserIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              SkillIDs;                                                 // (Parm, NeedCtorLink)
	int[]                                              SlotPositions;                                            // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              UserIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              ItemIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              SlotPositions;                                            // (Parm, NeedCtorLink)
	int[]                                              AddPartsID;                                               // (Parm, NeedCtorLink)
	struct FBtrDouble[]                                UniqueID;                                                 // (Parm, NeedCtorLink)
	int[]                                              PaintID;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              UserIDs;                                                  // (Parm, NeedCtorLink)
	byte[]                                             Positions;                                                // (Parm, NeedCtorLink)
	int[]                                              Numbers;                                                  // (Parm, NeedCtorLink)
	byte[]                                             OldStates;                                                // (Parm, NeedCtorLink)
	byte[]                                             NewStates;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChangeUserState
struct UBTTcpLink_Channel_rfReqChangeUserState_Params
{
	byte                                               NewState;                                                 // (Parm)
	byte                                               CheckPlaying;                                             // (Parm)
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
	byte                                               RoomState;                                                // (Parm)
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
	byte                                               IsPW;                                                     // (Parm)
	string                                             RoomName;                                                 // (Parm, NeedCtorLink)
	string                                             MapName;                                                  // (Parm, NeedCtorLink)
	string                                             ModeName;                                                 // (Parm, NeedCtorLink)
	int                                                MapNum;                                                   // (Parm)
	int                                                ModeNum;                                                  // (Parm)
	byte                                               IsTeamBalance;                                            // (Parm)
	int                                                MaxUserCount;                                             // (Parm)
	int                                                RoomUserCount;                                            // (Parm)
	byte                                               RoomState;                                                // (Parm)
	byte                                               BotDifficult;                                             // (Parm)
	byte                                               WeaponLimit;                                              // (Parm)
	byte                                               BotModeUserTeamNum;                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetBootyChoose
struct UBTTcpLink_Channel_rfAckGetBootyChoose_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               GiveType;                                                 // (Parm)
	struct FBtrDouble                                  ItemUniqueNumber;                                         // (Parm)
	int                                                ItemID;                                                   // (Parm)
	int                                                PartID;                                                   // (Parm)
	byte                                               ItemType;                                                 // (Parm)
	struct FBtrDouble                                  UntilTime;                                                // (Parm)
	int                                                StackCount;                                               // (Parm)
	int                                                PaintID;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGetBooty
struct UBTTcpLink_Channel_rfAckGetBooty_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              PrizeWinUserID;                                           // (Parm, NeedCtorLink)
	int[]                                              BootyItemID;                                              // (Parm, NeedCtorLink)
	int[]                                              BootyPartsID;                                             // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              ItemID;                                                   // (Parm, NeedCtorLink)
	int[]                                              PartID;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckClientUdpInfoList
struct UBTTcpLink_Channel_rfAckClientUdpInfoList_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              UID;                                                      // (Parm, NeedCtorLink)
	string[]                                           IP;                                                       // (Parm, NeedCtorLink)
	int[]                                              Port;                                                     // (Parm, NeedCtorLink)
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
	string                                             IP;                                                       // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	byte                                               NatType;                                                  // (Parm)
	byte                                               Intervention;                                             // (Parm)
	string                                             HostInnerIP;                                              // (Parm, NeedCtorLink)
	int                                                HostInnerPort;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckRegisterMyUdpInfo
struct UBTTcpLink_Channel_rfAckRegisterMyUdpInfo_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqRegisterMyUdpInfo
struct UBTTcpLink_Channel_rfReqRegisterMyUdpInfo_Params
{
	byte                                               IsHost;                                                   // (Parm)
	string                                             IP;                                                       // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	byte                                               Intervention;                                             // (Parm)
	string                                             HostInnerIP;                                              // (Parm, NeedCtorLink)
	int                                                HostInnerPort;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckNotifyClientJoinTime
struct UBTTcpLink_Channel_rfAckNotifyClientJoinTime_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             HostIP;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckChangeHost
struct UBTTcpLink_Channel_rfAckChangeHost_Params
{
	byte                                               ClientNum;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckDisconnectGame
struct UBTTcpLink_Channel_rfAckDisconnectGame_Params
{
	int                                                Result;                                                   // (Parm)
	int                                                DisconnectUserID;                                         // (Parm)
	string                                             DisconnectUserName;                                       // (Parm, NeedCtorLink)
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
	string                                             RelayServerIP;                                            // (Parm, NeedCtorLink)
	int                                                RelayServerPortNum;                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGameOver
struct UBTTcpLink_Channel_rfAckGameOver_Params
{
	int                                                UID;                                                      // (Parm)
	int                                                GameRoomNumber;                                           // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	byte                                               IsPlaying;                                                // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckUpdateScore
struct UBTTcpLink_Channel_rfAckUpdateScore_Params
{
	int[]                                              UserIDs;                                                  // (Parm, NeedCtorLink)
	string[]                                           NickNames;                                                // (Parm, NeedCtorLink)
	byte[]                                             TeamIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              Scores;                                                   // (Parm, NeedCtorLink)
	int[]                                              Kills;                                                    // (Parm, NeedCtorLink)
	int[]                                              Assists;                                                  // (Parm, NeedCtorLink)
	int[]                                              Deaths;                                                   // (Parm, NeedCtorLink)
	int[]                                              EXPs;                                                     // (Parm, NeedCtorLink)
	int[]                                              EXPBonuses;                                               // (Parm, NeedCtorLink)
	int[]                                              Points;                                                   // (Parm, NeedCtorLink)
	int[]                                              PointBonuses;                                             // (Parm, NeedCtorLink)
	int[]                                              TeamScores;                                               // (Parm, NeedCtorLink)
	int[]                                              BonusOwnerID;                                             // (Parm, NeedCtorLink)
	int[]                                              BonusID;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqUpdateScore
struct UBTTcpLink_Channel_rfReqUpdateScore_Params
{
	int                                                GameNumber;                                               // (Parm)
	int[]                                              UserIDs;                                                  // (Parm, NeedCtorLink)
	int[]                                              Kills;                                                    // (Parm, NeedCtorLink)
	int[]                                              Assists;                                                  // (Parm, NeedCtorLink)
	int[]                                              Deaths;                                                   // (Parm, NeedCtorLink)
	int[]                                              EXPs;                                                     // (Parm, NeedCtorLink)
	int[]                                              Points;                                                   // (Parm, NeedCtorLink)
	int[]                                              Scores;                                                   // (Parm, NeedCtorLink)
	int[]                                              TeamScores;                                               // (Parm, NeedCtorLink)
	int[]                                              RoundJoin;                                                // (Parm, NeedCtorLink)
	int[]                                              TimeJoin;                                                 // (Parm, NeedCtorLink)
	int                                                Playtime;                                                 // (Parm)
	byte                                               GameEndType;                                              // (Parm)
	string[]                                           UserNames;                                                // (Parm, NeedCtorLink)
	byte                                               IsAIClear;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckStartGame
struct UBTTcpLink_Channel_rfAckStartGame_Params
{
	int                                                GameNumber;                                               // (Parm)
	int                                                ClientsCount;                                             // (Parm)
	int                                                StartSeed;                                                // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             UserID;                                                   // (Parm, NeedCtorLink)
	string                                             IP;                                                       // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             MyIp;                                                     // (Parm, NeedCtorLink)
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
	string                                             UserID;                                                   // (Parm, NeedCtorLink)
	int                                                UID;                                                      // (Parm)
	int                                                TeamNum;                                                  // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             GameMode;                                                 // (Parm, NeedCtorLink)
	byte                                               GameModeNum;                                              // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqChangeGameMode
struct UBTTcpLink_Channel_rfReqChangeGameMode_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	string                                             GameMode;                                                 // (Parm, NeedCtorLink)
	byte                                               GameModeNum;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckBanUser
struct UBTTcpLink_Channel_rfAckBanUser_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	int                                                BanUID;                                                   // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             MapName;                                                  // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqSelectMap
struct UBTTcpLink_Channel_rfReqSelectMap_Params
{
	int                                                GameNum;                                                  // (Parm)
	int                                                UID;                                                      // (Parm)
	string                                             MapName;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckGameRoomInfo
struct UBTTcpLink_Channel_rfAckGameRoomInfo_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	string                                             RoomOwnerIP;                                              // (Parm, NeedCtorLink)
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
	string                                             UserID;                                                   // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              UID;                                                      // (Parm, NeedCtorLink)
	string[]                                           UserName;                                                 // (Parm, NeedCtorLink)
	int[]                                              Grade;                                                    // (Parm, NeedCtorLink)
	int[]                                              TeamNum;                                                  // (Parm, NeedCtorLink)
	byte[]                                             Statue;                                                   // (Parm, NeedCtorLink)
	byte[]                                             IsHost;                                                   // (Parm, NeedCtorLink)
	string[]                                           UserIP;                                                   // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              CM_Pattern;                                               // (Parm, NeedCtorLink)
	int[]                                              CM_BG;                                                    // (Parm, NeedCtorLink)
	int[]                                              CM_BL;                                                    // (Parm, NeedCtorLink)
	byte[]                                             IsLookingFor;                                             // (Parm, NeedCtorLink)
	int[]                                              GMUID;                                                    // (Parm, NeedCtorLink)
	int[]                                              ClanLevel;                                                // (Parm, NeedCtorLink)
	int[]                                              LevelMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              TitleMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              Reserved1;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved2;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved3;                                                // (Parm, NeedCtorLink)
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
	string                                             UserID;                                                   // (Parm, NeedCtorLink)
	int                                                TeamNum;                                                  // (Parm)
	int                                                Grade;                                                    // (Parm)
	string                                             UserIP;                                                   // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                Clan_Mark_Pattern;                                        // (Parm)
	int                                                Clan_Mark_BG;                                             // (Parm)
	int                                                Clan_Mark_BL;                                             // (Parm)
	byte                                               IsLookFor;                                                // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             Password;                                                 // (Parm, NeedCtorLink)
	byte                                               RoomEnterType;                                            // (Parm)
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
	int[]                                              GameNum;                                                  // (Parm, NeedCtorLink)
	string[]                                           Title;                                                    // (Parm, NeedCtorLink)
	string[]                                           MapName;                                                  // (Parm, NeedCtorLink)
	int[]                                              MapNum;                                                   // (Parm, NeedCtorLink)
	byte[]                                             UserCount;                                                // (Parm, NeedCtorLink)
	byte[]                                             MaxCount;                                                 // (Parm, NeedCtorLink)
	string[]                                           ModeName;                                                 // (Parm, NeedCtorLink)
	int[]                                              ModeNum;                                                  // (Parm, NeedCtorLink)
	byte[]                                             WeaponLimit;                                              // (Parm, NeedCtorLink)
	byte[]                                             IsTeamBalance;                                            // (Parm, NeedCtorLink)
	byte[]                                             Status;                                                   // (Parm, NeedCtorLink)
	string[]                                           RoomOwnerIP;                                              // (Parm, NeedCtorLink)
	int[]                                              GameMinute;                                               // (Parm, NeedCtorLink)
	string[]                                           RoomOwnerName;                                            // (Parm, NeedCtorLink)
	byte[]                                             IsSpecial;                                                // (Parm, NeedCtorLink)
	byte[]                                             IsPassword;                                               // (Parm, NeedCtorLink)
	byte[]                                             BotDifficult;                                             // (Parm, NeedCtorLink)
	byte[]                                             BotModeUserTeamNum;                                       // (Parm, NeedCtorLink)
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
	int[]                                              UID;                                                      // (Parm, NeedCtorLink)
	string[]                                           UserID;                                                   // (Parm, NeedCtorLink)
	int[]                                              UserLevels;                                               // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              ClanPattern;                                              // (Parm, NeedCtorLink)
	int[]                                              ClanBG;                                                   // (Parm, NeedCtorLink)
	int[]                                              ClanBL;                                                   // (Parm, NeedCtorLink)
	int[]                                              ClanGrade;                                                // (Parm, NeedCtorLink)
	int[]                                              ClanWin;                                                  // (Parm, NeedCtorLink)
	int[]                                              ClanLose;                                                 // (Parm, NeedCtorLink)
	byte[]                                             IsLookForClan;                                            // (Parm, NeedCtorLink)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              ClanLevel;                                                // (Parm, NeedCtorLink)
	int[]                                              LevelMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              TitleMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              Reserved1;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved2;                                                // (Parm, NeedCtorLink)
	int[]                                              Reserved3;                                                // (Parm, NeedCtorLink)
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
	string                                             UserID;                                                   // (Parm, NeedCtorLink)
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
	string                                             UserID;                                                   // (Parm, NeedCtorLink)
	int                                                Level;                                                    // (Parm)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                ClanMarkPattern;                                          // (Parm)
	int                                                ClanMarkBG;                                               // (Parm)
	int                                                ClanMarkBL;                                               // (Parm)
	int                                                ClanGrade;                                                // (Parm)
	int                                                ClanWin;                                                  // (Parm)
	int                                                ClanLose;                                                 // (Parm)
	byte                                               IsLookFor;                                                // (Parm)
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	int[]                                              id;                                                       // (Parm, NeedCtorLink)
	string[]                                           Title;                                                    // (Parm, NeedCtorLink)
	int[]                                              CurUser;                                                  // (Parm, NeedCtorLink)
	int[]                                              MaxUser;                                                  // (Parm, NeedCtorLink)
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
	string[]                                           FriendName;                                               // (Parm, NeedCtorLink)
	byte[]                                             IsLogOn;                                                  // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              CM_Pattern;                                               // (Parm, NeedCtorLink)
	int[]                                              CM_BG;                                                    // (Parm, NeedCtorLink)
	int[]                                              CM_BL;                                                    // (Parm, NeedCtorLink)
	int[]                                              LevelMarkID;                                              // (Parm, NeedCtorLink)
	int[]                                              ClanLevel;                                                // (Parm, NeedCtorLink)
	int[]                                              Level;                                                    // (Parm, NeedCtorLink)
	byte[]                                             IsLookForClan;                                            // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	int                                                CM_Pattern;                                               // (Parm)
	int                                                CM_BG;                                                    // (Parm)
	int                                                CM_BL;                                                    // (Parm)
	struct FCharInfo                                   stCharInfo;                                               // (Parm)
	byte                                               InClanRank;                                               // (Parm)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	struct FBtrDouble                                  CurServerTime;                                            // (Parm)
	int                                                CharDBID;                                                 // (Parm)
	byte                                               IsGM;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqLogin2
struct UBTTcpLink_Channel_rfReqLogin2_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                TimeStamp;                                                // (Parm)
	int                                                LoginHash1;                                               // (Parm)
	int                                                LoginHash2;                                               // (Parm)
	int                                                LoginHash3;                                               // (Parm)
	int                                                LoginHash4;                                               // (Parm)
	int                                                LoginHash5;                                               // (Parm)
	string                                             Guid;                                                     // (Parm, NeedCtorLink)
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
	string                                             Server1Addr;                                              // (Parm, NeedCtorLink)
	int                                                Server1Port;                                              // (Parm)
	string                                             Server2Addr;                                              // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int                                                UserID;                                                   // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	struct FCharInfo                                   btCharInfo;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfReqLogin
struct UBTTcpLink_Channel_rfReqLogin_Params
{
	string                                             id;                                                       // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.rfAckHash
struct UBTTcpLink_Channel_rfAckHash_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             domain;                                                   // (Parm, NeedCtorLink)
	int                                                nPort;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Channel.Connect
struct UBTTcpLink_Channel_Connect_Params
{
	string                                             sIpaddr;                                                  // (Parm, NeedCtorLink)
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
	string                                             ServerIP;                                                 // (Parm, NeedCtorLink)
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
	string                                             HashValue;                                                // (Parm, NeedCtorLink)
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
	string                                             G_AccountID;                                              // (Parm, NeedCtorLink)
	string                                             G_GUID;                                                   // (Parm, NeedCtorLink)
	string                                             G_AuthKey;                                                // (Parm, NeedCtorLink)
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
	string                                             USN;                                                      // (Parm, NeedCtorLink)
	int                                                BloodDisplayType;                                         // (Parm)
	int                                                PCBangType;                                               // (Parm)
	string                                             UnixTimeStamp;                                            // (Parm, NeedCtorLink)
	string                                             HashValue;                                                // (Parm, NeedCtorLink)
	byte                                               Sex;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckLogOut
struct UBTTcpLink_Login_sfAckLogOut_Params
{
	byte                                               Result;                                                   // (Parm)
	byte                                               Reason;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqLogOut
struct UBTTcpLink_Login_sfReqLogOut_Params
{
	byte                                               Reason;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckLoginWithTencentAuth
struct UBTTcpLink_Login_sfAckLoginWithTencentAuth_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               tc_AccountType;                                           // (Parm)
	byte                                               tc_IsBlock;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqLoginWithTencentAuth
struct UBTTcpLink_Login_sfReqLoginWithTencentAuth_Params
{
	string                                             AccountID;                                                // (Parm, NeedCtorLink)
	byte[]                                             Signature;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckTencent_AASInfo
struct UBTTcpLink_Login_sfAckTencent_AASInfo_Params
{
	int                                                UserID;                                                   // (Parm)
	byte                                               IsAdult;                                                  // (Parm)
	byte                                               IsQQAuth;                                                 // (Parm)
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
	string                                             Addr;                                                     // (Parm, NeedCtorLink)
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
	string                                             Key1;                                                     // (Parm, NeedCtorLink)
	struct FBtrDouble                                  Key2;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckClientChallenge
struct UBTTcpLink_Login_sfAckClientChallenge_Params
{
	string                                             Key1;                                                     // (Parm, NeedCtorLink)
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
	byte                                               IsAccountBlock;                                           // (Parm)
	byte                                               IsChattingBlock;                                          // (Parm)
	struct FBtrDouble                                  ChattingBlockEndTime;                                     // (Parm)
	string[]                                           BlockedItemName;                                          // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string[]                                           FriendName;                                               // (Parm, NeedCtorLink)
	byte[]                                             IsLogOn;                                                  // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              CM_Pattern;                                               // (Parm, NeedCtorLink)
	int[]                                              CM_BG;                                                    // (Parm, NeedCtorLink)
	int[]                                              CM_BL;                                                    // (Parm, NeedCtorLink)
	int[]                                              Level;                                                    // (Parm, NeedCtorLink)
	int[]                                              ClanGrade;                                                // (Parm, NeedCtorLink)
	int[]                                              ClanWin;                                                  // (Parm, NeedCtorLink)
	int[]                                              ClanLose;                                                 // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               IsRegisteredPCBang;                                       // (Parm)
	byte                                               IsMainPCBang;                                             // (Parm)
	string                                             PCBangName;                                               // (Parm, NeedCtorLink)
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
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                Level;                                                    // (Parm)
	int                                                Exp;                                                      // (Parm)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqCharInfo
struct UBTTcpLink_Login_sfReqCharInfo_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              Level;                                                    // (Parm, NeedCtorLink)
	string[]                                           CharName;                                                 // (Parm, NeedCtorLink)
	byte[]                                             ClanGrade;                                                // (Parm, NeedCtorLink)
	string[]                                           ServerName;                                               // (Parm, NeedCtorLink)
	string[]                                           ServerShortName;                                          // (Parm, NeedCtorLink)
	string[]                                           ServerIP;                                                 // (Parm, NeedCtorLink)
	int[]                                              serverPort;                                               // (Parm, NeedCtorLink)
	byte[]                                             CurPos;                                                   // (Parm, NeedCtorLink)
	int[]                                              ChannelNum;                                               // (Parm, NeedCtorLink)
	string[]                                           ChannelNickName;                                          // (Parm, NeedCtorLink)
	int[]                                              GameRoomNum;                                              // (Parm, NeedCtorLink)
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
	byte                                               wzp_AccountType;                                          // (Parm)
	byte                                               wzp_IsBlock;                                              // (Parm)
	byte                                               wzp_AuthKeySuccess;                                       // (Parm)
	byte                                               ChannelType;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqLoginWithWZAuth
struct UBTTcpLink_Login_sfReqLoginWithWZAuth_Params
{
	string                                             AccountID;                                                // (Parm, NeedCtorLink)
	string                                             Guid;                                                     // (Parm, NeedCtorLink)
	string                                             AuthKey;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckProcessPreLoginUser
struct UBTTcpLink_Login_sfAckProcessPreLoginUser_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqProcessPreLoginUser
struct UBTTcpLink_Login_sfReqProcessPreLoginUser_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	byte                                               Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckLoginInHouseTest
struct UBTTcpLink_Login_sfAckLoginInHouseTest_Params
{
	byte                                               Sucess;                                                   // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                TimeStamp;                                                // (Parm)
	int                                                LoginHash1;                                               // (Parm)
	int                                                LoginHash2;                                               // (Parm)
	int                                                LoginHash3;                                               // (Parm)
	int                                                LoginHash4;                                               // (Parm)
	int                                                LoginHash5;                                               // (Parm)
	byte                                               NeedChar;                                                 // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             BDay;                                                     // (Parm, NeedCtorLink)
	byte                                               Sex;                                                      // (Parm)
	struct FBtrDouble                                  ServerTime;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqLoginInHouseTest
struct UBTTcpLink_Login_sfReqLoginInHouseTest_Params
{
	string                                             UserName;                                                 // (Parm, NeedCtorLink)
	string                                             Password;                                                 // (Parm, NeedCtorLink)
	string                                             Guid;                                                     // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckAdvertisement
struct UBTTcpLink_Login_sfAckAdvertisement_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               Type;                                                     // (Parm)
	string                                             Address;                                                  // (Parm, NeedCtorLink)
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
	string                                             UserName;                                                 // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
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
	string                                             UserName;                                                 // (Parm, NeedCtorLink)
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
	byte                                               ListType;                                                 // (Parm)
	string[]                                           UserName;                                                 // (Parm, NeedCtorLink)
	byte[]                                             IsLogOn;                                                  // (Parm, NeedCtorLink)
	int[]                                              CMarkPattern;                                             // (Parm, NeedCtorLink)
	int[]                                              CMarkBG;                                                  // (Parm, NeedCtorLink)
	int[]                                              CMarkBL;                                                  // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              Level;                                                    // (Parm, NeedCtorLink)
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
	string                                             SessionKey;                                               // (Parm, NeedCtorLink)
	int                                                TimeStamp;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqConnectChannelServer
struct UBTTcpLink_Login_sfReqConnectChannelServer_Params
{
	string                                             ServerIP;                                                 // (Parm, NeedCtorLink)
	int                                                serverPort;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfAckServerList
struct UBTTcpLink_Login_sfAckServerList_Params
{
	string[]                                           CServername;                                              // (Parm, NeedCtorLink)
	string[]                                           CServerShortName;                                         // (Parm, NeedCtorLink)
	string[]                                           ServerIP;                                                 // (Parm, NeedCtorLink)
	int[]                                              serverPort;                                               // (Parm, NeedCtorLink)
	string[]                                           ChannelName;                                              // (Parm, NeedCtorLink)
	string[]                                           ChannelNickName;                                          // (Parm, NeedCtorLink)
	int[]                                              ChannelNum;                                               // (Parm, NeedCtorLink)
	int[]                                              chMaxUser;                                                // (Parm, NeedCtorLink)
	int[]                                              chCurUser;                                                // (Parm, NeedCtorLink)
	string[]                                           ServerGroupName;                                          // (Parm, NeedCtorLink)
	int[]                                              ServerGroupID;                                            // (Parm, NeedCtorLink)
	int[]                                              ServerDispOrder;                                          // (Parm, NeedCtorLink)
	int[]                                              DataPort;                                                 // (Parm, NeedCtorLink)
	byte[]                                             OptionCount_byte;                                         // (Parm, NeedCtorLink)
	byte[]                                             OptionKey_byte;                                           // (Parm, NeedCtorLink)
	byte[]                                             OptionValue_byte;                                         // (Parm, NeedCtorLink)
	byte[]                                             OptionCount_int;                                          // (Parm, NeedCtorLink)
	byte[]                                             OptionKey_int;                                            // (Parm, NeedCtorLink)
	int[]                                              OptionValue_int;                                          // (Parm, NeedCtorLink)
	byte[]                                             OptionCount_float;                                        // (Parm, NeedCtorLink)
	byte[]                                             OptionKey_float;                                          // (Parm, NeedCtorLink)
	float[]                                            OptionValue_float;                                        // (Parm, NeedCtorLink)
	byte[]                                             IsClanChannel;                                            // (Parm, NeedCtorLink)
	byte[]                                             IsUseDedicateHost;                                        // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqCreateChar
struct UBTTcpLink_Login_sfReqCreateChar_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
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
	string[]                                           AccesoItemName;                                           // (Parm, NeedCtorLink)
	int[]                                              AccesoItemID;                                             // (Parm, NeedCtorLink)
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
	string[]                                           HelmetItemName;                                           // (Parm, NeedCtorLink)
	int[]                                              HelmetItemID;                                             // (Parm, NeedCtorLink)
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
	int[]                                              HeadItemID;                                               // (Parm, NeedCtorLink)
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
	byte                                               Sucess;                                                   // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                TimeStamp;                                                // (Parm)
	int                                                LoginHash1;                                               // (Parm)
	int                                                LoginHash2;                                               // (Parm)
	int                                                LoginHash3;                                               // (Parm)
	int                                                LoginHash4;                                               // (Parm)
	int                                                LoginHash5;                                               // (Parm)
	byte                                               NeedChar;                                                 // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.sfReqLogin
struct UBTTcpLink_Login_sfReqLogin_Params
{
	string                                             PortalID;                                                 // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             HashValue;                                                // (Parm, NeedCtorLink)
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
	string                                             G_AccountID;                                              // (Parm, NeedCtorLink)
	string                                             G_GUID;                                                   // (Parm, NeedCtorLink)
	string                                             G_AuthKey;                                                // (Parm, NeedCtorLink)
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
	string                                             USN;                                                      // (Parm, NeedCtorLink)
	int                                                BloodDisplayType;                                         // (Parm)
	int                                                PCBangType;                                               // (Parm)
	string                                             UnixTimeStamp;                                            // (Parm, NeedCtorLink)
	string                                             HashValue;                                                // (Parm, NeedCtorLink)
	byte                                               Sex;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckLogOut
struct UBTTcpLink_Login_rfAckLogOut_Params
{
	byte                                               Result;                                                   // (Parm)
	byte                                               Reason;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqLogOut
struct UBTTcpLink_Login_rfReqLogOut_Params
{
	byte                                               Reason;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckLoginWithTencentAuth
struct UBTTcpLink_Login_rfAckLoginWithTencentAuth_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               tc_AccountType;                                           // (Parm)
	byte                                               tc_IsBlock;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqLoginWithTencentAuth
struct UBTTcpLink_Login_rfReqLoginWithTencentAuth_Params
{
	string                                             AccountID;                                                // (Parm, NeedCtorLink)
	byte[]                                             Signature;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckTencent_AASInfo
struct UBTTcpLink_Login_rfAckTencent_AASInfo_Params
{
	int                                                UserID;                                                   // (Parm)
	byte                                               IsAdult;                                                  // (Parm)
	byte                                               IsQQAuth;                                                 // (Parm)
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
	string                                             Addr;                                                     // (Parm, NeedCtorLink)
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
	string                                             Key1;                                                     // (Parm, NeedCtorLink)
	struct FBtrDouble                                  Key2;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckClientChallenge
struct UBTTcpLink_Login_rfAckClientChallenge_Params
{
	string                                             Key1;                                                     // (Parm, NeedCtorLink)
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
	byte                                               IsAccountBlock;                                           // (Parm)
	byte                                               IsChattingBlock;                                          // (Parm)
	struct FBtrDouble                                  ChattingBlockEndTime;                                     // (Parm)
	string[]                                           BlockedItemName;                                          // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string[]                                           FriendName;                                               // (Parm, NeedCtorLink)
	byte[]                                             IsLogOn;                                                  // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              CM_Pattern;                                               // (Parm, NeedCtorLink)
	int[]                                              CM_BG;                                                    // (Parm, NeedCtorLink)
	int[]                                              CM_BL;                                                    // (Parm, NeedCtorLink)
	int[]                                              Level;                                                    // (Parm, NeedCtorLink)
	int[]                                              ClanGrade;                                                // (Parm, NeedCtorLink)
	int[]                                              ClanWin;                                                  // (Parm, NeedCtorLink)
	int[]                                              ClanLose;                                                 // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	byte                                               IsRegisteredPCBang;                                       // (Parm)
	byte                                               IsMainPCBang;                                             // (Parm)
	string                                             PCBangName;                                               // (Parm, NeedCtorLink)
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
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                Level;                                                    // (Parm)
	int                                                Exp;                                                      // (Parm)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqCharInfo
struct UBTTcpLink_Login_rfReqCharInfo_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	int[]                                              Level;                                                    // (Parm, NeedCtorLink)
	string[]                                           CharName;                                                 // (Parm, NeedCtorLink)
	byte[]                                             ClanGrade;                                                // (Parm, NeedCtorLink)
	string[]                                           ServerName;                                               // (Parm, NeedCtorLink)
	string[]                                           ServerShortName;                                          // (Parm, NeedCtorLink)
	string[]                                           ServerIP;                                                 // (Parm, NeedCtorLink)
	int[]                                              serverPort;                                               // (Parm, NeedCtorLink)
	byte[]                                             CurPos;                                                   // (Parm, NeedCtorLink)
	int[]                                              ChannelNum;                                               // (Parm, NeedCtorLink)
	string[]                                           ChannelNickName;                                          // (Parm, NeedCtorLink)
	int[]                                              GameRoomNum;                                              // (Parm, NeedCtorLink)
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
	byte                                               wzp_AccountType;                                          // (Parm)
	byte                                               wzp_IsBlock;                                              // (Parm)
	byte                                               wzp_AuthKeySuccess;                                       // (Parm)
	byte                                               ChannelType;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqLoginWithWZAuth
struct UBTTcpLink_Login_rfReqLoginWithWZAuth_Params
{
	string                                             AccountID;                                                // (Parm, NeedCtorLink)
	string                                             Guid;                                                     // (Parm, NeedCtorLink)
	string                                             AuthKey;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckProcessPreLoginUser
struct UBTTcpLink_Login_rfAckProcessPreLoginUser_Params
{
	int                                                Result;                                                   // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqProcessPreLoginUser
struct UBTTcpLink_Login_rfReqProcessPreLoginUser_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	byte                                               Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckLoginInHouseTest
struct UBTTcpLink_Login_rfAckLoginInHouseTest_Params
{
	byte                                               Sucess;                                                   // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                TimeStamp;                                                // (Parm)
	int                                                LoginHash1;                                               // (Parm)
	int                                                LoginHash2;                                               // (Parm)
	int                                                LoginHash3;                                               // (Parm)
	int                                                LoginHash4;                                               // (Parm)
	int                                                LoginHash5;                                               // (Parm)
	byte                                               NeedChar;                                                 // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	string                                             BDay;                                                     // (Parm, NeedCtorLink)
	byte                                               Sex;                                                      // (Parm)
	struct FBtrDouble                                  ServerTime;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqLoginInHouseTest
struct UBTTcpLink_Login_rfReqLoginInHouseTest_Params
{
	string                                             UserName;                                                 // (Parm, NeedCtorLink)
	string                                             Password;                                                 // (Parm, NeedCtorLink)
	string                                             Guid;                                                     // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckAdvertisement
struct UBTTcpLink_Login_rfAckAdvertisement_Params
{
	int                                                Result;                                                   // (Parm)
	byte                                               Type;                                                     // (Parm)
	string                                             Address;                                                  // (Parm, NeedCtorLink)
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
	string                                             UserName;                                                 // (Parm, NeedCtorLink)
	string                                             ClanName;                                                 // (Parm, NeedCtorLink)
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
	string                                             UserName;                                                 // (Parm, NeedCtorLink)
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
	byte                                               ListType;                                                 // (Parm)
	string[]                                           UserName;                                                 // (Parm, NeedCtorLink)
	byte[]                                             IsLogOn;                                                  // (Parm, NeedCtorLink)
	int[]                                              CMarkPattern;                                             // (Parm, NeedCtorLink)
	int[]                                              CMarkBG;                                                  // (Parm, NeedCtorLink)
	int[]                                              CMarkBL;                                                  // (Parm, NeedCtorLink)
	string[]                                           ClanName;                                                 // (Parm, NeedCtorLink)
	int[]                                              Level;                                                    // (Parm, NeedCtorLink)
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
	string                                             SessionKey;                                               // (Parm, NeedCtorLink)
	int                                                TimeStamp;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqConnectChannelServer
struct UBTTcpLink_Login_rfReqConnectChannelServer_Params
{
	string                                             ServerIP;                                                 // (Parm, NeedCtorLink)
	int                                                serverPort;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfAckServerList
struct UBTTcpLink_Login_rfAckServerList_Params
{
	string[]                                           CServername;                                              // (Parm, NeedCtorLink)
	string[]                                           CServerShortName;                                         // (Parm, NeedCtorLink)
	string[]                                           ServerIP;                                                 // (Parm, NeedCtorLink)
	int[]                                              serverPort;                                               // (Parm, NeedCtorLink)
	string[]                                           ChannelName;                                              // (Parm, NeedCtorLink)
	string[]                                           ChannelNickName;                                          // (Parm, NeedCtorLink)
	int[]                                              ChannelNum;                                               // (Parm, NeedCtorLink)
	int[]                                              chMaxUser;                                                // (Parm, NeedCtorLink)
	int[]                                              chCurUser;                                                // (Parm, NeedCtorLink)
	string[]                                           ServerGroupName;                                          // (Parm, NeedCtorLink)
	int[]                                              ServerGroupID;                                            // (Parm, NeedCtorLink)
	int[]                                              ServerDispOrder;                                          // (Parm, NeedCtorLink)
	int[]                                              DataPort;                                                 // (Parm, NeedCtorLink)
	byte[]                                             OptionCount_byte;                                         // (Parm, NeedCtorLink)
	byte[]                                             OptionKey_byte;                                           // (Parm, NeedCtorLink)
	byte[]                                             OptionValue_byte;                                         // (Parm, NeedCtorLink)
	byte[]                                             OptionCount_int;                                          // (Parm, NeedCtorLink)
	byte[]                                             OptionKey_int;                                            // (Parm, NeedCtorLink)
	int[]                                              OptionValue_int;                                          // (Parm, NeedCtorLink)
	byte[]                                             OptionCount_float;                                        // (Parm, NeedCtorLink)
	byte[]                                             OptionKey_float;                                          // (Parm, NeedCtorLink)
	float[]                                            OptionValue_float;                                        // (Parm, NeedCtorLink)
	byte[]                                             IsClanChannel;                                            // (Parm, NeedCtorLink)
	byte[]                                             IsUseDedicateHost;                                        // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqCreateChar
struct UBTTcpLink_Login_rfReqCreateChar_Params
{
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
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
	string[]                                           AccesoItemName;                                           // (Parm, NeedCtorLink)
	int[]                                              AccesoItemID;                                             // (Parm, NeedCtorLink)
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
	string[]                                           HelmetItemName;                                           // (Parm, NeedCtorLink)
	int[]                                              HelmetItemID;                                             // (Parm, NeedCtorLink)
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
	int[]                                              HeadItemID;                                               // (Parm, NeedCtorLink)
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
	byte                                               Sucess;                                                   // (Parm)
	string                                             CharName;                                                 // (Parm, NeedCtorLink)
	int                                                TimeStamp;                                                // (Parm)
	int                                                LoginHash1;                                               // (Parm)
	int                                                LoginHash2;                                               // (Parm)
	int                                                LoginHash3;                                               // (Parm)
	int                                                LoginHash4;                                               // (Parm)
	int                                                LoginHash5;                                               // (Parm)
	byte                                               NeedChar;                                                 // (Parm)
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.rfReqLogin
struct UBTTcpLink_Login_rfReqLogin_Params
{
	string                                             PortalID;                                                 // (Parm, NeedCtorLink)
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
	string                                             ErrMsg;                                                   // (Parm, NeedCtorLink)
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
	string                                             domain;                                                   // (Parm, NeedCtorLink)
	int                                                nPort;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTTcpLink_Login.Connect
struct UBTTcpLink_Login_Connect_Params
{
	string                                             sIpaddr;                                                  // (Parm, NeedCtorLink)
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
	string                                             AccountID;                                                // (Parm, NeedCtorLink)
	byte                                               connectAlpha;                                             // (Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
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
	ENAT_TYPE                                          ReturnValue;                                              // (Parm, OutParm, ReturnParm)
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
	string                                             server_ip;                                                // (Parm, NeedCtorLink)
	int                                                nPort;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTNatDiag.SetPrimaryServer
struct UBTNatDiag_SetPrimaryServer_Params
{
	string                                             server_ip;                                                // (Parm, NeedCtorLink)
	int                                                nPort;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTNatDiag.StartNatCheck
struct UBTNatDiag_StartNatCheck_Params
{
	string                                             nat_server_ip;                                            // (Parm, NeedCtorLink)
	int                                                nPort;                                                    // (Parm)
	string                                             sLocalBindAddr;                                           // (Parm, NeedCtorLink)
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
	string[]                                           nat_server_ip;                                            // (Parm, NeedCtorLink)
	int[]                                              nPorts;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BatteryNet.BTNatDiag.Start
struct UBTNatDiag_Start_Params
{
	string[]                                           ipaddresses;                                              // (Parm, NeedCtorLink)
	int[]                                              ports;                                                    // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
