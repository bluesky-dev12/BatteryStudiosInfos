#pragma once

// Artic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

namespace Classes
{
//---------------------------------------------------------------------------
//Constants
//---------------------------------------------------------------------------

#define CONST_MSUPROPNUM                                          3

//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum IpDrv.MasterServerUplink.EHeartbeatType
enum class EHeartbeatType : uint8_t
{
	HB_QueryInterface              = 0,
	HB_GamePort                    = 1,
	HB_GamespyQueryPort            = 2
};


// Enum IpDrv.MasterServerUplink.EMasterToServer
enum class EMasterToServer : uint8_t
{
	MTS_ClientChallenge            = 0,
	MTS_ClientAuthFailed           = 1,
	MTS_Shutdown                   = 2,
	MTS_MatchID                    = 3,
	MTS_MD5Update                  = 4,
	MTS_UpdateOption               = 5,
	MTS_CheckOption                = 6,
	MTS_ClientMD5Fail              = 7,
	MTS_ClientBanned               = 8,
	MTS_ClientDupKey               = 9,
	MTS_UTANBan                    = 10
};


// Enum IpDrv.MasterServerUplink.EServerToMaster
enum class EServerToMaster : uint8_t
{
	STM_ClientResponse             = 0,
	STM_GameState                  = 1,
	STM_Stats                      = 2,
	STM_ClientDisconnectFailed     = 3,
	STM_MD5Version                 = 4,
	STM_CheckOptionReply           = 5
};


// Enum IpDrv.InternetLink.EReceiveMode
enum class EReceiveMode : uint8_t
{
	RMODE_Manual                   = 0,
	RMODE_Event                    = 1
};


// Enum IpDrv.InternetLink.ELineMode
enum class ELineMode : uint8_t
{
	LMODE_auto                     = 0,
	LMODE_DOS                      = 1,
	LMODE_UNIX                     = 2,
	LMODE_MAC                      = 3
};


// Enum IpDrv.InternetLink.ELinkMode
enum class ELinkMode : uint8_t
{
	MODE_Text                      = 0,
	MODE_Line                      = 1,
	MODE_Binary                    = 2
};



//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// Struct IpDrv.InternetLink.IpAddr
// 0x0008
struct FIpAddr
{
	int                                                Addr;                                                     // 0x0000(0x0004)
	int                                                Port;                                                     // 0x0004(0x0004)
};

// Struct IpDrv.MasterServerLink.tMasterServerEntry
// 0x0010
struct FtMasterServerEntry
{
	string                                             Address;                                                  // 0x0000(0x000C) (NeedCtorLink)
	int                                                Port;                                                     // 0x000C(0x0004)
};

// Struct IpDrv.MasterServerUplink.MD5UpdateData
// 0x001C
struct FMD5UpdateData
{
	string                                             Guid;                                                     // 0x0000(0x000C) (NeedCtorLink)
	string                                             MD5;                                                      // 0x000C(0x000C) (NeedCtorLink)
	int                                                Revision;                                                 // 0x0018(0x0004)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
