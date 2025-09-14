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

// Function IpDrv.InternetLink.ResolveFailed
struct AInternetLink_ResolveFailed_Params
{
};

// Function IpDrv.InternetLink.Resolved
struct AInternetLink_Resolved_Params
{
	struct FIpAddr                                     Addr;                                                     // (Parm)
};

// Function IpDrv.InternetLink.GetLocalIP
struct AInternetLink_GetLocalIP_Params
{
	struct FIpAddr                                     Arg;                                                      // (Parm, OutParm)
};

// Function IpDrv.InternetLink.GameSpyGameName
struct AInternetLink_GameSpyGameName_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function IpDrv.InternetLink.GameSpyValidate
struct AInternetLink_GameSpyValidate_Params
{
	struct FString                                     ValidationString;                                         // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function IpDrv.InternetLink.StringToIpAddr
struct AInternetLink_StringToIpAddr_Params
{
	struct FString                                     str;                                                      // (Parm, NeedCtorLink)
	struct FIpAddr                                     Addr;                                                     // (Parm, OutParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function IpDrv.InternetLink.IpAddrToString
struct AInternetLink_IpAddrToString_Params
{
	struct FIpAddr                                     Arg;                                                      // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function IpDrv.InternetLink.GetLastError
struct AInternetLink_GetLastError_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function IpDrv.InternetLink.Resolve
struct AInternetLink_Resolve_Params
{
	struct FString                                     domain;                                                   // (Parm, CoerceParm, NeedCtorLink)
};

// Function IpDrv.InternetLink.ParseURL
struct AInternetLink_ParseURL_Params
{
	struct FString                                     URL;                                                      // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     Addr;                                                     // (Parm, OutParm, NeedCtorLink)
	int                                                Port;                                                     // (Parm, OutParm)
	struct FString                                     LevelName;                                                // (Parm, OutParm, NeedCtorLink)
	struct FString                                     EntryName;                                                // (Parm, OutParm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function IpDrv.InternetLink.IsDataPending
struct AInternetLink_IsDataPending_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function IpDrv.UdpLink.ReceivedBinary
struct AUdpLink_ReceivedBinary_Params
{
	struct FIpAddr                                     Addr;                                                     // (Parm)
	int                                                Count;                                                    // (Parm)
	unsigned char                                      B;                                                        // (Parm)
};

// Function IpDrv.UdpLink.ReceivedLine
struct AUdpLink_ReceivedLine_Params
{
	struct FIpAddr                                     Addr;                                                     // (Parm)
	struct FString                                     Line;                                                     // (Parm, NeedCtorLink)
};

// Function IpDrv.UdpLink.ReceivedText
struct AUdpLink_ReceivedText_Params
{
	struct FIpAddr                                     Addr;                                                     // (Parm)
	struct FString                                     Text;                                                     // (Parm, NeedCtorLink)
};

// Function IpDrv.UdpLink.ReadBinary
struct AUdpLink_ReadBinary_Params
{
	struct FIpAddr                                     Addr;                                                     // (Parm, OutParm)
	int                                                Count;                                                    // (Parm)
	unsigned char                                      B;                                                        // (Parm, OutParm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function IpDrv.UdpLink.ReadText
struct AUdpLink_ReadText_Params
{
	struct FIpAddr                                     Addr;                                                     // (Parm, OutParm)
	struct FString                                     str;                                                      // (Parm, OutParm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function IpDrv.UdpLink.SendBinary
struct AUdpLink_SendBinary_Params
{
	struct FIpAddr                                     Addr;                                                     // (Parm)
	int                                                Count;                                                    // (Parm)
	unsigned char                                      B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function IpDrv.UdpLink.SendText
struct AUdpLink_SendText_Params
{
	struct FIpAddr                                     Addr;                                                     // (Parm)
	struct FString                                     str;                                                      // (Parm, CoerceParm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function IpDrv.UdpLink.BindPort
struct AUdpLink_BindPort_Params
{
	int                                                Port;                                                     // (OptionalParm, Parm)
	bool                                               bUseNextAvailable;                                        // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function IpDrv.MasterServerGameStats.Logf
struct AMasterServerGameStats_Logf_Params
{
	struct FString                                     LogString;                                                // (Parm, NeedCtorLink)
};

// Function IpDrv.MasterServerGameStats.Init
struct AMasterServerGameStats_Init_Params
{
};

// Function IpDrv.MasterServerLink.Tick
struct AMasterServerLink_Tick_Params
{
	float                                              Delta;                                                    // (Parm)
};

// Function IpDrv.MasterServerLink.GetMasterServer
struct AMasterServerLink_GetMasterServer_Params
{
	struct FString                                     OutAddress;                                               // (Parm, OutParm, NeedCtorLink)
	int                                                OutPort;                                                  // (Parm, OutParm)
};

// Function IpDrv.MasterServerLink.Poll
struct AMasterServerLink_Poll_Params
{
	int                                                WaitTime;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function IpDrv.MasterServerUplink.GetDescriptionText
struct AMasterServerUplink_GetDescriptionText_Params
{
	struct FString                                     PropName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function IpDrv.MasterServerUplink.FillPlayInfo
struct AMasterServerUplink_FillPlayInfo_Params
{
	class UPlayInfo*                                   PlayInfo;                                                 // (Parm)
};

// Function IpDrv.MasterServerUplink.Tick
struct AMasterServerUplink_Tick_Params
{
	float                                              Delta;                                                    // (Parm)
};

// Function IpDrv.MasterServerUplink.LogStatLine
struct AMasterServerUplink_LogStatLine_Params
{
	struct FString                                     StatLine;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function IpDrv.MasterServerUplink.Refresh
struct AMasterServerUplink_Refresh_Params
{
};

// Function IpDrv.MasterServerUplink.ConnectionFailed
struct AMasterServerUplink_ConnectionFailed_Params
{
	bool                                               bShouldReconnect;                                         // (Parm)
};

// Function IpDrv.MasterServerUplink.BeginPlay
struct AMasterServerUplink_BeginPlay_Params
{
};

// Function IpDrv.MasterServerUplink.ForceGameStateRefresh
struct AMasterServerUplink_ForceGameStateRefresh_Params
{
	int                                                When;                                                     // (Parm)
};

// Function IpDrv.MasterServerUplink.Reconnect
struct AMasterServerUplink_Reconnect_Params
{
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
