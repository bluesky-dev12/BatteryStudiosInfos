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
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function IpDrv.InternetLink.GameSpyValidate
struct AInternetLink_GameSpyValidate_Params
{
	string                                             ValidationString;                                         // (Parm, NeedCtorLink)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function IpDrv.InternetLink.StringToIpAddr
struct AInternetLink_StringToIpAddr_Params
{
	string                                             str;                                                      // (Parm, NeedCtorLink)
	struct FIpAddr                                     Addr;                                                     // (Parm, OutParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function IpDrv.InternetLink.IpAddrToString
struct AInternetLink_IpAddrToString_Params
{
	struct FIpAddr                                     Arg;                                                      // (Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function IpDrv.InternetLink.GetLastError
struct AInternetLink_GetLastError_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function IpDrv.InternetLink.Resolve
struct AInternetLink_Resolve_Params
{
	string                                             domain;                                                   // (Parm, CoerceParm, NeedCtorLink)
};

// Function IpDrv.InternetLink.ParseURL
struct AInternetLink_ParseURL_Params
{
	string                                             URL;                                                      // (Parm, CoerceParm, NeedCtorLink)
	string                                             Addr;                                                     // (Parm, OutParm, NeedCtorLink)
	int                                                Port;                                                     // (Parm, OutParm)
	string                                             LevelName;                                                // (Parm, OutParm, NeedCtorLink)
	string                                             EntryName;                                                // (Parm, OutParm, NeedCtorLink)
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
	byte                                               B;                                                        // (Parm)
};

// Function IpDrv.UdpLink.ReceivedLine
struct AUdpLink_ReceivedLine_Params
{
	struct FIpAddr                                     Addr;                                                     // (Parm)
	string                                             Line;                                                     // (Parm, NeedCtorLink)
};

// Function IpDrv.UdpLink.ReceivedText
struct AUdpLink_ReceivedText_Params
{
	struct FIpAddr                                     Addr;                                                     // (Parm)
	string                                             Text;                                                     // (Parm, NeedCtorLink)
};

// Function IpDrv.UdpLink.ReadBinary
struct AUdpLink_ReadBinary_Params
{
	struct FIpAddr                                     Addr;                                                     // (Parm, OutParm)
	int                                                Count;                                                    // (Parm)
	byte                                               B;                                                        // (Parm, OutParm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function IpDrv.UdpLink.ReadText
struct AUdpLink_ReadText_Params
{
	struct FIpAddr                                     Addr;                                                     // (Parm, OutParm)
	string                                             str;                                                      // (Parm, OutParm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function IpDrv.UdpLink.SendBinary
struct AUdpLink_SendBinary_Params
{
	struct FIpAddr                                     Addr;                                                     // (Parm)
	int                                                Count;                                                    // (Parm)
	byte                                               B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function IpDrv.UdpLink.SendText
struct AUdpLink_SendText_Params
{
	struct FIpAddr                                     Addr;                                                     // (Parm)
	string                                             str;                                                      // (Parm, CoerceParm, NeedCtorLink)
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
	string                                             LogString;                                                // (Parm, NeedCtorLink)
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
	string                                             OutAddress;                                               // (Parm, OutParm, NeedCtorLink)
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
	string                                             PropName;                                                 // (Parm, NeedCtorLink)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
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
	string                                             StatLine;                                                 // (Parm, NeedCtorLink)
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
