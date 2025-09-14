// Arctic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

#include "../SDK.hpp"

namespace Classes
{
//---------------------------------------------------------------------------
//Functions
//---------------------------------------------------------------------------

// Function IpDrv.InternetLink.ResolveFailed
// (Event, Public)

void AInternetLink::ResolveFailed()
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.InternetLink.ResolveFailed");

	AInternetLink_ResolveFailed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function IpDrv.InternetLink.Resolved
// (Event, Public)
// Parameters:
// struct FIpAddr                 Addr                           (Parm)

void AInternetLink::Resolved(const struct FIpAddr& Addr)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.InternetLink.Resolved");

	AInternetLink_Resolved_Params params;
	params.Addr = Addr;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function IpDrv.InternetLink.GetLocalIP
// (Native, Public)
// Parameters:
// struct FIpAddr                 Arg                            (Parm, OutParm)

void AInternetLink::GetLocalIP(struct FIpAddr* Arg)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.InternetLink.GetLocalIP");

	AInternetLink_GetLocalIP_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Arg != nullptr)
		*Arg = params.Arg;
}


// Function IpDrv.InternetLink.GameSpyGameName
// (Native, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AInternetLink::GameSpyGameName()
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.InternetLink.GameSpyGameName");

	AInternetLink_GameSpyGameName_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function IpDrv.InternetLink.GameSpyValidate
// (Native, Public)
// Parameters:
// struct FString                 ValidationString               (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AInternetLink::GameSpyValidate(const struct FString& ValidationString)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.InternetLink.GameSpyValidate");

	AInternetLink_GameSpyValidate_Params params;
	params.ValidationString = ValidationString;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function IpDrv.InternetLink.StringToIpAddr
// (Native, Public)
// Parameters:
// struct FString                 str                            (Parm, NeedCtorLink)
// struct FIpAddr                 Addr                           (Parm, OutParm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AInternetLink::StringToIpAddr(const struct FString& str, struct FIpAddr* Addr)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.InternetLink.StringToIpAddr");

	AInternetLink_StringToIpAddr_Params params;
	params.str = str;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Addr != nullptr)
		*Addr = params.Addr;

	return params.ReturnValue;
}


// Function IpDrv.InternetLink.IpAddrToString
// (Native, Public)
// Parameters:
// struct FIpAddr                 Arg                            (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AInternetLink::IpAddrToString(const struct FIpAddr& Arg)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.InternetLink.IpAddrToString");

	AInternetLink_IpAddrToString_Params params;
	params.Arg = Arg;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function IpDrv.InternetLink.GetLastError
// (Native, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AInternetLink::GetLastError()
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.InternetLink.GetLastError");

	AInternetLink_GetLastError_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function IpDrv.InternetLink.Resolve
// (Native, Public)
// Parameters:
// struct FString                 domain                         (Parm, CoerceParm, NeedCtorLink)

void AInternetLink::Resolve(const struct FString& domain)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.InternetLink.Resolve");

	AInternetLink_Resolve_Params params;
	params.domain = domain;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function IpDrv.InternetLink.ParseURL
// (Native, Public)
// Parameters:
// struct FString                 URL                            (Parm, CoerceParm, NeedCtorLink)
// struct FString                 Addr                           (Parm, OutParm, NeedCtorLink)
// int                            Port                           (Parm, OutParm)
// struct FString                 LevelName                      (Parm, OutParm, NeedCtorLink)
// struct FString                 EntryName                      (Parm, OutParm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AInternetLink::ParseURL(const struct FString& URL, struct FString* Addr, int* Port, struct FString* LevelName, struct FString* EntryName)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.InternetLink.ParseURL");

	AInternetLink_ParseURL_Params params;
	params.URL = URL;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Addr != nullptr)
		*Addr = params.Addr;
	if (Port != nullptr)
		*Port = params.Port;
	if (LevelName != nullptr)
		*LevelName = params.LevelName;
	if (EntryName != nullptr)
		*EntryName = params.EntryName;

	return params.ReturnValue;
}


// Function IpDrv.InternetLink.IsDataPending
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AInternetLink::IsDataPending()
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.InternetLink.IsDataPending");

	AInternetLink_IsDataPending_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function IpDrv.UdpLink.ReceivedBinary
// (Event, Public)
// Parameters:
// struct FIpAddr                 Addr                           (Parm)
// int                            Count                          (Parm)
// unsigned char                  B                              (Parm)

void AUdpLink::ReceivedBinary(const struct FIpAddr& Addr, int Count, unsigned char B)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.UdpLink.ReceivedBinary");

	AUdpLink_ReceivedBinary_Params params;
	params.Addr = Addr;
	params.Count = Count;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function IpDrv.UdpLink.ReceivedLine
// (Event, Public)
// Parameters:
// struct FIpAddr                 Addr                           (Parm)
// struct FString                 Line                           (Parm, NeedCtorLink)

void AUdpLink::ReceivedLine(const struct FIpAddr& Addr, const struct FString& Line)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.UdpLink.ReceivedLine");

	AUdpLink_ReceivedLine_Params params;
	params.Addr = Addr;
	params.Line = Line;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function IpDrv.UdpLink.ReceivedText
// (Event, Public)
// Parameters:
// struct FIpAddr                 Addr                           (Parm)
// struct FString                 Text                           (Parm, NeedCtorLink)

void AUdpLink::ReceivedText(const struct FIpAddr& Addr, const struct FString& Text)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.UdpLink.ReceivedText");

	AUdpLink_ReceivedText_Params params;
	params.Addr = Addr;
	params.Text = Text;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function IpDrv.UdpLink.ReadBinary
// (Native, Public)
// Parameters:
// struct FIpAddr                 Addr                           (Parm, OutParm)
// int                            Count                          (Parm)
// unsigned char                  B                              (Parm, OutParm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUdpLink::ReadBinary(int Count, struct FIpAddr* Addr, unsigned char* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.UdpLink.ReadBinary");

	AUdpLink_ReadBinary_Params params;
	params.Count = Count;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Addr != nullptr)
		*Addr = params.Addr;
	if (B != nullptr)
		*B = params.B;

	return params.ReturnValue;
}


// Function IpDrv.UdpLink.ReadText
// (Native, Public)
// Parameters:
// struct FIpAddr                 Addr                           (Parm, OutParm)
// struct FString                 str                            (Parm, OutParm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUdpLink::ReadText(struct FIpAddr* Addr, struct FString* str)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.UdpLink.ReadText");

	AUdpLink_ReadText_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Addr != nullptr)
		*Addr = params.Addr;
	if (str != nullptr)
		*str = params.str;

	return params.ReturnValue;
}


// Function IpDrv.UdpLink.SendBinary
// (Native, Public)
// Parameters:
// struct FIpAddr                 Addr                           (Parm)
// int                            Count                          (Parm)
// unsigned char                  B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUdpLink::SendBinary(const struct FIpAddr& Addr, int Count, unsigned char B)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.UdpLink.SendBinary");

	AUdpLink_SendBinary_Params params;
	params.Addr = Addr;
	params.Count = Count;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function IpDrv.UdpLink.SendText
// (Native, Public)
// Parameters:
// struct FIpAddr                 Addr                           (Parm)
// struct FString                 str                            (Parm, CoerceParm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUdpLink::SendText(const struct FIpAddr& Addr, const struct FString& str)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.UdpLink.SendText");

	AUdpLink_SendText_Params params;
	params.Addr = Addr;
	params.str = str;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function IpDrv.UdpLink.BindPort
// (Native, Public)
// Parameters:
// int                            Port                           (OptionalParm, Parm)
// bool                           bUseNextAvailable              (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUdpLink::BindPort(int Port, bool bUseNextAvailable)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.UdpLink.BindPort");

	AUdpLink_BindPort_Params params;
	params.Port = Port;
	params.bUseNextAvailable = bUseNextAvailable;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function IpDrv.MasterServerGameStats.Logf
// (Defined, Public)
// Parameters:
// struct FString                 LogString                      (Parm, NeedCtorLink)

void AMasterServerGameStats::Logf(const struct FString& LogString)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.MasterServerGameStats.Logf");

	AMasterServerGameStats_Logf_Params params;
	params.LogString = LogString;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function IpDrv.MasterServerGameStats.Init
// (Defined, Public)

void AMasterServerGameStats::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.MasterServerGameStats.Init");

	AMasterServerGameStats_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function IpDrv.MasterServerLink.Tick
// (Defined, Simulated, Public)
// Parameters:
// float                          Delta                          (Parm)

void AMasterServerLink::Tick(float Delta)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.MasterServerLink.Tick");

	AMasterServerLink_Tick_Params params;
	params.Delta = Delta;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function IpDrv.MasterServerLink.GetMasterServer
// (Defined, Event, Public)
// Parameters:
// struct FString                 OutAddress                     (Parm, OutParm, NeedCtorLink)
// int                            OutPort                        (Parm, OutParm)

void AMasterServerLink::GetMasterServer(struct FString* OutAddress, int* OutPort)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.MasterServerLink.GetMasterServer");

	AMasterServerLink_GetMasterServer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (OutAddress != nullptr)
		*OutAddress = params.OutAddress;
	if (OutPort != nullptr)
		*OutPort = params.OutPort;
}


// Function IpDrv.MasterServerLink.Poll
// (Native, Public)
// Parameters:
// int                            WaitTime                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AMasterServerLink::Poll(int WaitTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.MasterServerLink.Poll");

	AMasterServerLink_Poll_Params params;
	params.WaitTime = WaitTime;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function IpDrv.MasterServerUplink.GetDescriptionText
// (Defined, Event, Static, Public)
// Parameters:
// struct FString                 PropName                       (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AMasterServerUplink::STATIC_GetDescriptionText(const struct FString& PropName)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.MasterServerUplink.GetDescriptionText");

	AMasterServerUplink_GetDescriptionText_Params params;
	params.PropName = PropName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function IpDrv.MasterServerUplink.FillPlayInfo
// (Defined, Static, Public)
// Parameters:
// class UPlayInfo*               PlayInfo                       (Parm)

void AMasterServerUplink::STATIC_FillPlayInfo(class UPlayInfo* PlayInfo)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.MasterServerUplink.FillPlayInfo");

	AMasterServerUplink_FillPlayInfo_Params params;
	params.PlayInfo = PlayInfo;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function IpDrv.MasterServerUplink.Tick
// (Defined, Simulated, Public)
// Parameters:
// float                          Delta                          (Parm)

void AMasterServerUplink::Tick(float Delta)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.MasterServerUplink.Tick");

	AMasterServerUplink_Tick_Params params;
	params.Delta = Delta;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function IpDrv.MasterServerUplink.LogStatLine
// (Native, Event, Public)
// Parameters:
// struct FString                 StatLine                       (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AMasterServerUplink::LogStatLine(const struct FString& StatLine)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.MasterServerUplink.LogStatLine");

	AMasterServerUplink_LogStatLine_Params params;
	params.StatLine = StatLine;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function IpDrv.MasterServerUplink.Refresh
// (Defined, Event, Public)

void AMasterServerUplink::Refresh()
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.MasterServerUplink.Refresh");

	AMasterServerUplink_Refresh_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function IpDrv.MasterServerUplink.ConnectionFailed
// (Defined, Event, Public)
// Parameters:
// bool                           bShouldReconnect               (Parm)

void AMasterServerUplink::ConnectionFailed(bool bShouldReconnect)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.MasterServerUplink.ConnectionFailed");

	AMasterServerUplink_ConnectionFailed_Params params;
	params.bShouldReconnect = bShouldReconnect;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function IpDrv.MasterServerUplink.BeginPlay
// (Defined, Event, Public)

void AMasterServerUplink::BeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.MasterServerUplink.BeginPlay");

	AMasterServerUplink_BeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function IpDrv.MasterServerUplink.ForceGameStateRefresh
// (Native, Public)
// Parameters:
// int                            When                           (Parm)

void AMasterServerUplink::ForceGameStateRefresh(int When)
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.MasterServerUplink.ForceGameStateRefresh");

	AMasterServerUplink_ForceGameStateRefresh_Params params;
	params.When = When;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function IpDrv.MasterServerUplink.Reconnect
// (Native, Public)

void AMasterServerUplink::Reconnect()
{
	static auto fn = UObject::FindObject<UFunction>("Function IpDrv.MasterServerUplink.Reconnect");

	AMasterServerUplink_Reconnect_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
