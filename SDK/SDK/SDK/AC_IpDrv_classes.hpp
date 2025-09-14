#pragma once

// Arctic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

namespace Classes
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class IpDrv.TcpBTMapLoader
// 0x0028 (0x0064 - 0x003C)
class UTcpBTMapLoader : public UBTMapLoader
{
public:
	unsigned char                                      UnknownData00[0x28];                                      // 0x003C(0x0028) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.TcpBTMapLoader");
		return ptr;
	}

};


// Class IpDrv.TcpBTLoadingState_ChangeClient
// 0x0020 (0x00D8 - 0x00B8)
class UTcpBTLoadingState_ChangeClient : public UBTLoadingState
{
public:
	unsigned char                                      UnknownData00[0x20];                                      // 0x00B8(0x0020) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.TcpBTLoadingState_ChangeClient");
		return ptr;
	}

};


// Class IpDrv.TcpBTLoadingState_ChangeHost
// 0x0010 (0x00C8 - 0x00B8)
class UTcpBTLoadingState_ChangeHost : public UBTLoadingState
{
public:
	unsigned char                                      UnknownData00[0x10];                                      // 0x00B8(0x0010) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.TcpBTLoadingState_ChangeHost");
		return ptr;
	}

};


// Class IpDrv.TcpBTLoadingState_ClientLoading
// 0x0034 (0x00EC - 0x00B8)
class UTcpBTLoadingState_ClientLoading : public UBTLoadingState
{
public:
	unsigned char                                      UnknownData00[0x34];                                      // 0x00B8(0x0034) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.TcpBTLoadingState_ClientLoading");
		return ptr;
	}

};


// Class IpDrv.TcpBTLoadingState_HostLoading
// 0x001C (0x00D4 - 0x00B8)
class UTcpBTLoadingState_HostLoading : public UBTLoadingState
{
public:
	unsigned char                                      UnknownData00[0x1C];                                      // 0x00B8(0x001C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.TcpBTLoadingState_HostLoading");
		return ptr;
	}

};


// Class IpDrv.BTUdpPingChecker
// 0x0818 (0x0848 - 0x0030)
class UBTUdpPingChecker : public UBTPingChecker
{
public:
	unsigned char                                      UnknownData00[0x818];                                     // 0x0030(0x0818) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.BTUdpPingChecker");
		return ptr;
	}

};


// Class IpDrv.DWebzenShopItemListDownloader
// 0x0000 (0x0030 - 0x0030)
class UDWebzenShopItemListDownloader : public UWebzenShopItemListDownloader
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.DWebzenShopItemListDownloader");
		return ptr;
	}

};


// Class IpDrv.InternetLink
// 0x001C (0x0448 - 0x042C)
class AInternetLink : public AInternetInfo
{
public:
	TEnumAsByte<ELinkMode>                             LinkMode;                                                 // 0x042C(0x0001)
	TEnumAsByte<ELineMode>                             InLineMode;                                               // 0x042D(0x0001)
	TEnumAsByte<ELineMode>                             OutLineMode;                                              // 0x042E(0x0001)
	unsigned char                                      UnknownData00[0x1];                                       // 0x042F(0x0001) MISSED OFFSET
	struct FPointer                                    Socket;                                                   // 0x0430(0x0004) (Const, Transient)
	int                                                Port;                                                     // 0x0434(0x0004) (Const)
	struct FPointer                                    RemoteSocket;                                             // 0x0438(0x0004) (Const, Transient)
	struct FPointer                                    PrivateResolveInfo;                                       // 0x043C(0x0004) (Const, Native, Transient)
	int                                                DataPending;                                              // 0x0440(0x0004) (Const)
	TEnumAsByte<EReceiveMode>                          ReceiveMode;                                              // 0x0444(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x0445(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.InternetLink");
		return ptr;
	}


	void ResolveFailed();
	void Resolved(const struct FIpAddr& Addr);
	void GetLocalIP(struct FIpAddr* Arg);
	struct FString GameSpyGameName();
	struct FString GameSpyValidate(const struct FString& ValidationString);
	bool StringToIpAddr(const struct FString& str, struct FIpAddr* Addr);
	struct FString IpAddrToString(const struct FIpAddr& Arg);
	int GetLastError();
	void Resolve(const struct FString& domain);
	bool ParseURL(const struct FString& URL, struct FString* Addr, int* Port, struct FString* LevelName, struct FString* EntryName);
	bool IsDataPending();
};


// Class IpDrv.UdpLink
// 0x0010 (0x0458 - 0x0448)
class AUdpLink : public AInternetLink
{
public:
	int                                                BroadcastAddr;                                            // 0x0448(0x0004) (Edit, Const)
	struct FString                                     RecvBuf;                                                  // 0x044C(0x000C) (Const, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.UdpLink");
		return ptr;
	}


	void ReceivedBinary(const struct FIpAddr& Addr, int Count, unsigned char B);
	void ReceivedLine(const struct FIpAddr& Addr, const struct FString& Line);
	void ReceivedText(const struct FIpAddr& Addr, const struct FString& Text);
	int ReadBinary(int Count, struct FIpAddr* Addr, unsigned char* B);
	int ReadText(struct FIpAddr* Addr, struct FString* str);
	bool SendBinary(const struct FIpAddr& Addr, int Count, unsigned char B);
	bool SendText(const struct FIpAddr& Addr, const struct FString& str);
	int BindPort(int Port, bool bUseNextAvailable);
};


// Class IpDrv.DecompressCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UDecompressCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.DecompressCommandlet");
		return ptr;
	}

};


// Class IpDrv.CompressCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UCompressCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.CompressCommandlet");
		return ptr;
	}

};


// Class IpDrv.TcpNetDriver
// 0x003C (0x1248 - 0x120C)
class UTcpNetDriver : public UNetDriver
{
public:
	unsigned char                                      UnknownData00[0x10];                                      // 0x120C(0x0010) MISSED OFFSET
	unsigned long                                      LimitConnPerIPRangePerMinute : 1;                         // 0x121C(0x0004) (Config)
	unsigned char                                      UnknownData01[0x28];                                      // 0x1220(0x0028) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.TcpNetDriver");
		return ptr;
	}

};


// Class IpDrv.TcpipConnection
// 0x0034 (0x4FE0 - 0x4FAC)
class UTcpipConnection : public UNetConnection
{
public:
	unsigned char                                      UnknownData00[0x34];                                      // 0x4FAC(0x0034) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.TcpipConnection");
		return ptr;
	}

};


// Class IpDrv.NatChecker
// 0x00A8 (0x00D4 - 0x002C)
class UNatChecker : public UObject
{
public:
	unsigned char                                      UnknownData00[0xA8];                                      // 0x002C(0x00A8) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.NatChecker");
		return ptr;
	}

};


// Class IpDrv.NatCheckStater
// 0x0050 (0x007C - 0x002C)
class UNatCheckStater : public UObject
{
public:
	unsigned char                                      UnknownData00[0x50];                                      // 0x002C(0x0050) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.NatCheckStater");
		return ptr;
	}

};


// Class IpDrv.TcpTickChecker
// 0x001C (0x0060 - 0x0044)
class UTcpTickChecker : public UTickChecker
{
public:
	unsigned char                                      UnknownData00[0x1C];                                      // 0x0044(0x001C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.TcpTickChecker");
		return ptr;
	}

};


// Class IpDrv.TcpLink
// 0x0028 (0x0470 - 0x0448)
class ATcpLink : public AInternetLink
{
public:
	unsigned char                                      UnknownData00[0x28];                                      // 0x0448(0x0028) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.TcpLink");
		return ptr;
	}

};


// Class IpDrv.MasterServerGameStats
// 0x0004 (0x0458 - 0x0454)
class AMasterServerGameStats : public AGameStats
{
public:
	class AMasterServerUplink*                         Uplink;                                                   // 0x0454(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.MasterServerGameStats");
		return ptr;
	}


	void Logf(const struct FString& LogString);
	void Init();
};


// Class IpDrv.MasterServerLink
// 0x0028 (0x0454 - 0x042C)
class AMasterServerLink : public AInfo
{
public:
	struct FPointer                                    LinkPtr;                                                  // 0x042C(0x0004) (Const, Native, Transient)
	int                                                LANPort;                                                  // 0x0430(0x0004)
	int                                                LANServerPort;                                            // 0x0434(0x0004)
	TArray<struct FtMasterServerEntry>                 MasterServerList;                                         // 0x0438(0x000C) (NeedCtorLink)
	TArray<struct FtMasterServerEntry>                 ActiveMasterServerList;                                   // 0x0444(0x000C) (NeedCtorLink)
	int                                                LastMSIndex;                                              // 0x0450(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.MasterServerLink");
		return ptr;
	}


	void Tick(float Delta);
	void GetMasterServer(struct FString* OutAddress, int* OutPort);
	bool Poll(int WaitTime);
};


// Class IpDrv.MasterServerUplink
// 0x01B8 (0x060C - 0x0454)
class AMasterServerUplink : public AMasterServerLink
{
public:
	unsigned long                                      bInitialStateCached : 1;                                  // 0x0454(0x0004)
	struct FServerResponseLine                         ServerState;                                              // 0x0458(0x0070) (NeedCtorLink)
	struct FServerResponseLine                         FullCachedServerState;                                    // 0x04C8(0x0070) (NeedCtorLink)
	struct FServerResponseLine                         CachedServerState;                                        // 0x0538(0x0070) (NeedCtorLink)
	float                                              CacheRefreshTime;                                         // 0x05A8(0x0004)
	int                                                CachePlayerCount;                                         // 0x05AC(0x0004)
	class AMasterServerGameStats*                      GameStats;                                                // 0x05B0(0x0004)
	class AUdpLink*                                    GamespyQueryLink;                                         // 0x05B4(0x0004)
	int                                                MatchID;                                                  // 0x05B8(0x0004) (Const)
	float                                              ReconnectTime;                                            // 0x05BC(0x0004)
	unsigned long                                      bReconnectPending : 1;                                    // 0x05C0(0x0004)
	unsigned long                                      DoUplink : 1;                                             // 0x05C0(0x0004)
	unsigned long                                      UplinkToGamespy : 1;                                      // 0x05C0(0x0004)
	unsigned long                                      SendStats : 1;                                            // 0x05C0(0x0004)
	unsigned long                                      ServerBehindNAT : 1;                                      // 0x05C0(0x0004)
	unsigned long                                      DoLANBroadcast : 1;                                       // 0x05C0(0x0004)
	unsigned long                                      bIgnoreUTANBans : 1;                                      // 0x05C0(0x0004)
	struct FString                                     MSUPropText[0x3];                                         // 0x05C4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MSUPropDesc[0x3];                                         // 0x05E8(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.MasterServerUplink");
		return ptr;
	}


	struct FString STATIC_GetDescriptionText(const struct FString& PropName);
	void STATIC_FillPlayInfo(class UPlayInfo* PlayInfo);
	void Tick(float Delta);
	bool LogStatLine(const struct FString& StatLine);
	void Refresh();
	void ConnectionFailed(bool bShouldReconnect);
	void BeginPlay();
	void ForceGameStateRefresh(int When);
	void Reconnect();
};


// Class IpDrv.ServerQueryClient
// 0x0014 (0x0468 - 0x0454)
class AServerQueryClient : public AMasterServerLink
{
public:
	unsigned char                                      UnknownData00[0x14];                                      // 0x0454(0x0014) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.ServerQueryClient");
		return ptr;
	}

};


// Class IpDrv.MasterServerClient
// 0x0050 (0x04B8 - 0x0468)
class AMasterServerClient : public AServerQueryClient
{
public:
	unsigned char                                      UnknownData00[0x50];                                      // 0x0468(0x0050) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.MasterServerClient");
		return ptr;
	}

};


// Class IpDrv.HTTPDownload
// 0x00A8 (0x0504 - 0x045C)
class UHTTPDownload : public UDownload
{
public:
	unsigned char                                      UnknownData00[0xA8];                                      // 0x045C(0x00A8) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class IpDrv.HTTPDownload");
		return ptr;
	}

};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
