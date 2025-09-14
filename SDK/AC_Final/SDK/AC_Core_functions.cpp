// Artic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

#include "../SDK.hpp"

namespace Classes
{
//---------------------------------------------------------------------------
//Functions
//---------------------------------------------------------------------------

TArray<UObject*>& UObject::GetGlobalObjects()
{
	return *GObjects;
}

std::string UObject::GetFullName() const
{
	std::string name;

	if (Class != nullptr)
	{
		std::string temp;
		for (auto p = Outer; p; p = p->Outer)
		{
			temp = p->GetName() + "." + temp;
		}

		name = Class->GetName();
		name += " ";
		name += temp;
		name += GetName();
	}

	return name;
}

bool UObject::IsA(UClass* cmp) const
{
	for (auto super = Class; super; super = static_cast<UClass*>(super->SuperField))
	{
		if (super == cmp)
		{
			return true;
		}
	}

	return false;
}

// Function Core.Object.UseGP20
// (Defined, Static, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_UseGP20()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.UseGP20");

	UObject_UseGP20_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.CheckInFloatBox
// (Defined, Public)
// Parameters:
// struct FFloatBox               checkFloatBox                  (Parm)
// float                          X                              (Parm)
// float                          Y                              (Parm)
// float                          ClientRatioX                   (Parm)
// float                          ClientRatioY                   (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::CheckInFloatBox(const struct FFloatBox& checkFloatBox, float X, float Y, float ClientRatioX, float ClientRatioY)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.CheckInFloatBox");

	UObject_CheckInFloatBox_Params params;
	params.checkFloatBox = checkFloatBox;
	params.X = X;
	params.Y = Y;
	params.ClientRatioX = ClientRatioX;
	params.ClientRatioY = ClientRatioY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.FloatBoxOffsetY
// (Defined, Public)
// Parameters:
// struct FFloatBox               origBox                        (Parm)
// float                          offset                         (Parm)
// struct FFloatBox               ReturnValue                    (Parm, OutParm, ReturnParm)

struct FFloatBox UObject::FloatBoxOffsetY(const struct FFloatBox& origBox, float offset)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.FloatBoxOffsetY");

	UObject_FloatBoxOffsetY_Params params;
	params.origBox = origBox;
	params.offset = offset;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.FloatBoxOffsetX
// (Defined, Public)
// Parameters:
// struct FFloatBox               origBox                        (Parm)
// float                          offset                         (Parm)
// struct FFloatBox               ReturnValue                    (Parm, OutParm, ReturnParm)

struct FFloatBox UObject::FloatBoxOffsetX(const struct FFloatBox& origBox, float offset)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.FloatBoxOffsetX");

	UObject_FloatBoxOffsetX_Params params;
	params.origBox = origBox;
	params.offset = offset;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.AddFloatBox
// (Defined, Public)
// Parameters:
// int                            startX                         (Parm)
// int                            startY                         (Parm)
// struct FFloatBox               value1                         (Parm)
// struct FFloatBox               ReturnValue                    (Parm, OutParm, ReturnParm)

struct FFloatBox UObject::AddFloatBox(int startX, int startY, const struct FFloatBox& value1)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.AddFloatBox");

	UObject_AddFloatBox_Params params;
	params.startX = startX;
	params.startY = startY;
	params.value1 = value1;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UObject::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.NotifyDestroyed");

	UObject_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.ZeroVector
// (Defined, Public)
// Parameters:
// struct FVector                 V                              (Parm, OutParm)

void UObject::ZeroVector(struct FVector* V)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.ZeroVector");

	UObject_ZeroVector_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (V != nullptr)
		*V = params.V;
}


// Function Core.Object.IsZeroVector
// (Defined, Public)
// Parameters:
// struct FVector                 V                              (Parm, OutParm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::IsZeroVector(struct FVector* V)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.IsZeroVector");

	UObject_IsZeroVector_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (V != nullptr)
		*V = params.V;

	return params.ReturnValue;
}


// Function Core.Object.Pow
// (Defined, Public)
// Parameters:
// float                          A                              (Parm)
// int                            B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::Pow(float A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Pow");

	UObject_Pow_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.StrStartsWith
// (Defined, Static, Public)
// Parameters:
// string                         str                            (Parm, CoerceParm, NeedCtorLink)
// string                         startStr                       (Parm, CoerceParm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_StrStartsWith(const string& str, const string& startStr)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.StrStartsWith");

	UObject_StrStartsWith_Params params;
	params.str = str;
	params.startStr = startStr;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.PadRight
// (Defined, Simulated, Static, Public)
// Parameters:
// string                         str                            (Parm, CoerceParm, NeedCtorLink)
// int                            totalDigits                    (Parm)
// string                         paddingChar                    (OptionalParm, Parm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_PadRight(const string& str, int totalDigits, const string& paddingChar)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.PadRight");

	UObject_PadRight_Params params;
	params.str = str;
	params.totalDigits = totalDigits;
	params.paddingChar = paddingChar;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.PadLeft
// (Defined, Simulated, Static, Public)
// Parameters:
// string                         str                            (Parm, CoerceParm, NeedCtorLink)
// int                            totalDigits                    (Parm)
// string                         paddingChar                    (OptionalParm, Parm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_PadLeft(const string& str, int totalDigits, const string& paddingChar)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.PadLeft");

	UObject_PadLeft_Params params;
	params.str = str;
	params.totalDigits = totalDigits;
	params.paddingChar = paddingChar;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.PadString
// (Defined, Simulated, Static, Public)
// Parameters:
// string                         str                            (Parm, CoerceParm, NeedCtorLink)
// int                            totalDigits                    (Parm)
// string                         paddingChar                    (Parm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_PadString(const string& str, int totalDigits, const string& paddingChar)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.PadString");

	UObject_PadString_Params params;
	params.str = str;
	params.totalDigits = totalDigits;
	params.paddingChar = paddingChar;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.slog
// (Defined, Static, Public)
// Parameters:
// string                         S                              (Parm, CoerceParm, NeedCtorLink)

void UObject::STATIC_slog(const string& S)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.slog");

	UObject_slog_Params params;
	params.S = S;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.MakeVector
// (Defined, Static, Public)
// Parameters:
// float                          X                              (Parm)
// float                          Y                              (Parm)
// float                          Z                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_MakeVector(float X, float Y, float Z)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.MakeVector");

	UObject_MakeVector_Params params;
	params.X = X;
	params.Y = Y;
	params.Z = Z;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.EatStr
// (Final, Defined, Static, Public)
// Parameters:
// string                         Dest                           (Parm, OutParm, NeedCtorLink)
// string                         Source                         (Parm, OutParm, NeedCtorLink)
// int                            Num                            (Parm)

void UObject::STATIC_EatStr(int Num, string* Dest, string* Source)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.EatStr");

	UObject_EatStr_Params params;
	params.Num = Num;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Dest != nullptr)
		*Dest = params.Dest;
	if (Source != nullptr)
		*Source = params.Source;
}


// Function Core.Object.ReplaceText
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// string                         Text                           (Parm, OutParm, NeedCtorLink)
// string                         Replace                        (Parm, NeedCtorLink)
// string                         With                           (Parm, NeedCtorLink)

void UObject::STATIC_ReplaceText(const string& Replace, const string& With, string* Text)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.ReplaceText");

	UObject_ReplaceText_Params params;
	params.Replace = Replace;
	params.With = With;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Text != nullptr)
		*Text = params.Text;
}


// Function Core.Object.GetItemName
// (Defined, Simulated, Static, Public)
// Parameters:
// string                         FullName                       (Parm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_GetItemName(const string& FullName)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GetItemName");

	UObject_GetItemName_Params params;
	params.FullName = FullName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.GetDatefromString
// (Defined, Simulated, Static, Public)
// Parameters:
// string                         in                             (Parm, OutParm, NeedCtorLink)
// string                         char                           (Parm, NeedCtorLink)
// bool                           bFull                          (OptionalParm, Parm)

void UObject::STATIC_GetDatefromString(const string& char, bool bFull, string* in)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GetDatefromString");

	UObject_GetDatefromString_Params params;
	params.char = char;
	params.bFull = bFull;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (in != nullptr)
		*in = params.in;
}


// Function Core.Object.GetReferencers
// (Final, Native, Public)
// Parameters:
// class UObject*                 Target                         (Parm)
// class UObject*[]               Referencers                    (Parm, OutParm, NeedCtorLink)

void UObject::GetReferencers(class UObject* Target, class UObject*[]* Referencers)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GetReferencers");

	UObject_GetReferencers_Params params;
	params.Target = Target;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Referencers != nullptr)
		*Referencers = params.Referencers;
}


// Function Core.Object.AllObjects
// (Final, Iterator, Native, Public)
// Parameters:
// class UClass*                  baseClass                      (Parm)
// class UObject*                 obj                            (Parm, OutParm)

void UObject::AllObjects(class UClass* baseClass, class UObject** obj)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.AllObjects");

	UObject_AllObjects_Params params;
	params.baseClass = baseClass;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (obj != nullptr)
		*obj = params.obj;
}


// Function Core.Object.Created
// (Event, Public)

void UObject::Created()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Created");

	UObject_Created_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.EndState
// (Event, Public)

void UObject::EndState()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.EndState");

	UObject_EndState_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.BeginState
// (Event, Public)

void UObject::BeginState()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.BeginState");

	UObject_BeginState_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.GetErrMsg
// (Final, Native, Public)
// Parameters:
// int                            ErrCode                        (Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::GetErrMsg(int ErrCode)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GetErrMsg");

	UObject_GetErrMsg_Params params;
	params.ErrCode = ErrCode;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.GetLastErrCode
// (Final, Native, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::GetLastErrCode()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GetLastErrCode");

	UObject_GetLastErrCode_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.PlatformIs64Bit
// (Final, Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::PlatformIs64Bit()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.PlatformIs64Bit");

	UObject_PlatformIs64Bit_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.PlatformIsWindows
// (Final, Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::PlatformIsWindows()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.PlatformIsWindows");

	UObject_PlatformIsWindows_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.PlatformIsUnix
// (Final, Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::PlatformIsUnix()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.PlatformIsUnix");

	UObject_PlatformIsUnix_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.PlatformIsMacOS
// (Final, Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::PlatformIsMacOS()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.PlatformIsMacOS");

	UObject_PlatformIsMacOS_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.IsSoaking
// (Final, Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::IsSoaking()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.IsSoaking");

	UObject_IsSoaking_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.IsOnConsole
// (Final, Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::IsOnConsole()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.IsOnConsole");

	UObject_IsOnConsole_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.StopWatch
// (Final, Native, Static, Public)
// Parameters:
// bool                           bStop                          (OptionalParm, Parm)

void UObject::STATIC_StopWatch(bool bStop)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.StopWatch");

	UObject_StopWatch_Params params;
	params.bStop = bStop;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.RandRange
// (Final, Defined, Public)
// Parameters:
// float                          Min                            (Parm)
// float                          Max                            (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::RandRange(float Min, float Max)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.RandRange");

	UObject_RandRange_Params params;
	params.Min = Min;
	params.Max = Max;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.GetPerObjectNames
// (Final, Native, Static, Public)
// Parameters:
// string                         ININame                        (Parm, NeedCtorLink)
// string                         ObjectClass                    (OptionalParm, Parm, NeedCtorLink)
// int                            MaxResults                     (OptionalParm, Parm)
// string[]                       ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string[] UObject::STATIC_GetPerObjectNames(const string& ININame, const string& ObjectClass, int MaxResults)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GetPerObjectNames");

	UObject_GetPerObjectNames_Params params;
	params.ININame = ININame;
	params.ObjectClass = ObjectClass;
	params.MaxResults = MaxResults;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.StaticClearConfig
// (Final, Native, Static, Public)
// Parameters:
// string                         PropName                       (OptionalParm, Parm, NeedCtorLink)

void UObject::STATIC_StaticClearConfig(const string& PropName)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.StaticClearConfig");

	UObject_StaticClearConfig_Params params;
	params.PropName = PropName;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.ResetConfig
// (Final, Native, Static, Public)
// Parameters:
// string                         PropName                       (OptionalParm, Parm, NeedCtorLink)

void UObject::STATIC_ResetConfig(const string& PropName)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.ResetConfig");

	UObject_ResetConfig_Params params;
	params.PropName = PropName;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.StaticSaveConfig
// (Final, Native, Static, Public)

void UObject::STATIC_StaticSaveConfig()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.StaticSaveConfig");

	UObject_StaticSaveConfig_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.ClearConfig
// (Final, Native, Public)
// Parameters:
// string                         PropName                       (OptionalParm, Parm, NeedCtorLink)

void UObject::ClearConfig(const string& PropName)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.ClearConfig");

	UObject_ClearConfig_Params params;
	params.PropName = PropName;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.SaveConfig
// (Final, Native, Public)

void UObject::SaveConfig()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.SaveConfig");

	UObject_SaveConfig_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.FindObject
// (Final, Native, Static, Public)
// Parameters:
// string                         ObjectName                     (Parm, NeedCtorLink)
// class UClass*                  ObjectClass                    (Parm)
// class UObject*                 ReturnValue                    (Parm, OutParm, ReturnParm)

class UObject* UObject::STATIC_FindObject(const string& ObjectName, class UClass* ObjectClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.FindObject");

	UObject_FindObject_Params params;
	params.ObjectName = ObjectName;
	params.ObjectClass = ObjectClass;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.DynamicLoadObject
// (Final, Native, Static, Public)
// Parameters:
// string                         ObjectName                     (Parm, NeedCtorLink)
// class UClass*                  ObjectClass                    (Parm)
// bool                           MayFail                        (OptionalParm, Parm)
// class UObject*                 ReturnValue                    (Parm, OutParm, ReturnParm)

class UObject* UObject::STATIC_DynamicLoadObject(const string& ObjectName, class UClass* ObjectClass, bool MayFail)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.DynamicLoadObject");

	UObject_DynamicLoadObject_Params params;
	params.ObjectName = ObjectName;
	params.ObjectClass = ObjectClass;
	params.MayFail = MayFail;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.GetEnum
// (Final, Native, Static, Public)
// Parameters:
// class UObject*                 E                              (Parm)
// int                            i                              (Parm, CoerceParm)
// FName                          ReturnValue                    (Parm, OutParm, ReturnParm)

FName UObject::STATIC_GetEnum(class UObject* E, int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GetEnum");

	UObject_GetEnum_Params params;
	params.E = E;
	params.i = i;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.SetPropertyText
// (Final, Native, Public)
// Parameters:
// string                         PropName                       (Parm, NeedCtorLink)
// string                         PropValue                      (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::SetPropertyText(const string& PropName, const string& PropValue)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.SetPropertyText");

	UObject_SetPropertyText_Params params;
	params.PropName = PropName;
	params.PropValue = PropValue;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.GetPropertyText
// (Final, Native, Public)
// Parameters:
// string                         PropName                       (Parm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::GetPropertyText(const string& PropName)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GetPropertyText");

	UObject_GetPropertyText_Params params;
	params.PropName = PropName;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Disable
// (Final, Native, Public)
// Parameters:
// FName                          ProbeFunc                      (Parm)

void UObject::Disable(const FName& ProbeFunc)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Disable");

	UObject_Disable_Params params;
	params.ProbeFunc = ProbeFunc;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.Enable
// (Final, Native, Public)
// Parameters:
// FName                          ProbeFunc                      (Parm)

void UObject::Enable(const FName& ProbeFunc)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Enable");

	UObject_Enable_Params params;
	params.ProbeFunc = ProbeFunc;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.IsA
// (Final, Native, Public)
// Parameters:
// FName                          ClassName                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::IsA(const FName& ClassName)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.IsA");

	UObject_IsA_Params params;
	params.ClassName = ClassName;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.ClassIsChildOf
// (Final, Native, Static, Public)
// Parameters:
// class UClass*                  TestClass                      (Parm)
// class UClass*                  ParentClass                    (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_ClassIsChildOf(class UClass* TestClass, class UClass* ParentClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.ClassIsChildOf");

	UObject_ClassIsChildOf_Params params;
	params.TestClass = TestClass;
	params.ParentClass = ParentClass;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.GetStateName
// (Final, Native, Public)
// Parameters:
// FName                          ReturnValue                    (Parm, OutParm, ReturnParm)

FName UObject::GetStateName()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GetStateName");

	UObject_GetStateName_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.IsInState
// (Final, Native, Public)
// Parameters:
// FName                          TestState                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::IsInState(const FName& TestState)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.IsInState");

	UObject_IsInState_Params params;
	params.TestState = TestState;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.GotoState
// (Final, Native, Public)
// Parameters:
// FName                          NewState                       (OptionalParm, Parm)
// FName                          Label                          (OptionalParm, Parm)

void UObject::GotoState(const FName& NewState, const FName& Label)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GotoState");

	UObject_GotoState_Params params;
	params.NewState = NewState;
	params.Label = Label;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.ResetCombatLog
// (Final, Native, Static, Public)

void UObject::STATIC_ResetCombatLog()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.ResetCombatLog");

	UObject_ResetCombatLog_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.CombatLog
// (Final, Native, Static, Public)
// Parameters:
// string                         S                              (Parm, CoerceParm, NeedCtorLink)
// FName                          Tag                            (OptionalParm, Parm)

void UObject::STATIC_CombatLog(const string& S, const FName& Tag)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.CombatLog");

	UObject_CombatLog_Params params;
	params.S = S;
	params.Tag = Tag;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.CrashLog
// (Final, Native, Static, Public)
// Parameters:
// string                         S                              (Parm, CoerceParm, NeedCtorLink)
// FName                          Tag                            (OptionalParm, Parm)

void UObject::STATIC_CrashLog(const string& S, const FName& Tag)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.CrashLog");

	UObject_CrashLog_Params params;
	params.S = S;
	params.Tag = Tag;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.Localize
// (Native, Static, Public)
// Parameters:
// string                         SectionName                    (Parm, NeedCtorLink)
// string                         KeyName                        (Parm, NeedCtorLink)
// string                         PackageName                    (Parm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_Localize(const string& SectionName, const string& KeyName, const string& PackageName)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Localize");

	UObject_Localize_Params params;
	params.SectionName = SectionName;
	params.KeyName = KeyName;
	params.PackageName = PackageName;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Warn
// (Final, Native, Static, Public)
// Parameters:
// string                         S                              (Parm, CoerceParm, NeedCtorLink)

void UObject::STATIC_Warn(const string& S)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Warn");

	UObject_Warn_Params params;
	params.S = S;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.Log
// (Final, Native, Static, Public)
// Parameters:
// string                         S                              (Parm, CoerceParm, NeedCtorLink)
// FName                          Tag                            (OptionalParm, Parm)

void UObject::STATIC_Log(const string& S, const FName& Tag)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Log");

	UObject_Log_Params params;
	params.S = S;
	params.Tag = Tag;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.QuatSlerp
// (Final, Native, Static, Public)
// Parameters:
// struct FQuat                   A                              (Parm)
// struct FQuat                   B                              (Parm)
// float                          Slerp                          (Parm)
// struct FQuat                   ReturnValue                    (Parm, OutParm, ReturnParm)

struct FQuat UObject::STATIC_QuatSlerp(const struct FQuat& A, const struct FQuat& B, float Slerp)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.QuatSlerp");

	UObject_QuatSlerp_Params params;
	params.A = A;
	params.B = B;
	params.Slerp = Slerp;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.QuatToRotator
// (Final, Native, Static, Public)
// Parameters:
// struct FQuat                   A                              (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator UObject::STATIC_QuatToRotator(const struct FQuat& A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.QuatToRotator");

	UObject_QuatToRotator_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.QuatFromRotator
// (Final, Native, Static, Public)
// Parameters:
// struct FRotator                A                              (Parm)
// struct FQuat                   ReturnValue                    (Parm, OutParm, ReturnParm)

struct FQuat UObject::STATIC_QuatFromRotator(const struct FRotator& A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.QuatFromRotator");

	UObject_QuatFromRotator_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.QuatFromAxisAndAngle
// (Final, Native, Static, Public)
// Parameters:
// struct FVector                 Axis                           (Parm)
// float                          Angle                          (Parm)
// struct FQuat                   ReturnValue                    (Parm, OutParm, ReturnParm)

struct FQuat UObject::STATIC_QuatFromAxisAndAngle(const struct FVector& Axis, float Angle)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.QuatFromAxisAndAngle");

	UObject_QuatFromAxisAndAngle_Params params;
	params.Axis = Axis;
	params.Angle = Angle;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.QuatFindBetween
// (Final, Native, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm)
// struct FVector                 B                              (Parm)
// struct FQuat                   ReturnValue                    (Parm, OutParm, ReturnParm)

struct FQuat UObject::STATIC_QuatFindBetween(const struct FVector& A, const struct FVector& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.QuatFindBetween");

	UObject_QuatFindBetween_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.QuatRotateVector
// (Final, Native, Static, Public)
// Parameters:
// struct FQuat                   A                              (Parm)
// struct FVector                 B                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_QuatRotateVector(const struct FQuat& A, const struct FVector& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.QuatRotateVector");

	UObject_QuatRotateVector_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.QuatInvert
// (Final, Native, Static, Public)
// Parameters:
// struct FQuat                   A                              (Parm)
// struct FQuat                   ReturnValue                    (Parm, OutParm, ReturnParm)

struct FQuat UObject::STATIC_QuatInvert(const struct FQuat& A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.QuatInvert");

	UObject_QuatInvert_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.QuatProduct
// (Final, Native, Static, Public)
// Parameters:
// struct FQuat                   A                              (Parm)
// struct FQuat                   B                              (Parm)
// struct FQuat                   ReturnValue                    (Parm, OutParm, ReturnParm)

struct FQuat UObject::STATIC_QuatProduct(const struct FQuat& A, const struct FQuat& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.QuatProduct");

	UObject_QuatProduct_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.InterpCurveGetInputDomain
// (Final, Native, Static, Public)
// Parameters:
// struct FInterpCurve            curve                          (Parm, NeedCtorLink)
// float                          Min                            (Parm, OutParm)
// float                          Max                            (Parm, OutParm)

void UObject::STATIC_InterpCurveGetInputDomain(const struct FInterpCurve& curve, float* Min, float* Max)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.InterpCurveGetInputDomain");

	UObject_InterpCurveGetInputDomain_Params params;
	params.curve = curve;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Min != nullptr)
		*Min = params.Min;
	if (Max != nullptr)
		*Max = params.Max;
}


// Function Core.Object.InterpCurveGetOutputRange
// (Final, Native, Static, Public)
// Parameters:
// struct FInterpCurve            curve                          (Parm, NeedCtorLink)
// float                          Min                            (Parm, OutParm)
// float                          Max                            (Parm, OutParm)

void UObject::STATIC_InterpCurveGetOutputRange(const struct FInterpCurve& curve, float* Min, float* Max)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.InterpCurveGetOutputRange");

	UObject_InterpCurveGetOutputRange_Params params;
	params.curve = curve;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Min != nullptr)
		*Min = params.Min;
	if (Max != nullptr)
		*Max = params.Max;
}


// Function Core.Object.InterpCurveEval
// (Final, Native, Static, Public)
// Parameters:
// struct FInterpCurve            curve                          (Parm, NeedCtorLink)
// float                          Input                          (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_InterpCurveEval(const struct FInterpCurve& curve, float Input)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.InterpCurveEval");

	UObject_InterpCurveEval_Params params;
	params.curve = curve;
	params.Input = Input;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.NotEqual_BtrDoubleInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// int                            B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_NotEqual_BtrDoubleInt(const struct FBtrDouble& A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.NotEqual_BtrDoubleInt");

	UObject_NotEqual_BtrDoubleInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.EqualEqual_BtrDoubleInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// int                            B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_EqualEqual_BtrDoubleInt(const struct FBtrDouble& A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.EqualEqual_BtrDoubleInt");

	UObject_EqualEqual_BtrDoubleInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Less_BtrDoubleBtrDouble
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// struct FBtrDouble              B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_Less_BtrDoubleBtrDouble(const struct FBtrDouble& A, const struct FBtrDouble& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Less_BtrDoubleBtrDouble");

	UObject_Less_BtrDoubleBtrDouble_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.StringToBtrDouble
// (Final, Native, Static, Public)
// Parameters:
// string                         A                              (Parm, NeedCtorLink)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_StringToBtrDouble(const string& A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.StringToBtrDouble");

	UObject_StringToBtrDouble_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.BtrDoubleToInt
// (Final, Native, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_BtrDoubleToInt(const struct FBtrDouble& A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.BtrDoubleToInt");

	UObject_BtrDoubleToInt_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.IntToBtrDouble
// (Final, Native, Static, Public)
// Parameters:
// int                            A                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_IntToBtrDouble(int A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.IntToBtrDouble");

	UObject_IntToBtrDouble_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.BtrDoubleGetToStr
// (Final, Native, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_BtrDoubleGetToStr(const struct FBtrDouble& A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.BtrDoubleGetToStr");

	UObject_BtrDoubleGetToStr_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.SubtractEqual_BtrDoubleBtrDouble
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm, OutParm)
// struct FBtrDouble              B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_SubtractEqual_BtrDoubleBtrDouble(const struct FBtrDouble& B, struct FBtrDouble* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.SubtractEqual_BtrDoubleBtrDouble");

	UObject_SubtractEqual_BtrDoubleBtrDouble_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.AddEqual_BtrDoubleBtrDouble
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm, OutParm)
// struct FBtrDouble              B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_AddEqual_BtrDoubleBtrDouble(const struct FBtrDouble& B, struct FBtrDouble* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.AddEqual_BtrDoubleBtrDouble");

	UObject_AddEqual_BtrDoubleBtrDouble_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.DivideEqual_BtrDoubleBtrDouble
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm, OutParm)
// struct FBtrDouble              B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_DivideEqual_BtrDoubleBtrDouble(const struct FBtrDouble& B, struct FBtrDouble* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.DivideEqual_BtrDoubleBtrDouble");

	UObject_DivideEqual_BtrDoubleBtrDouble_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.MultiplyEqual_BtrDoubleBtrDouble
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm, OutParm)
// struct FBtrDouble              B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_MultiplyEqual_BtrDoubleBtrDouble(const struct FBtrDouble& B, struct FBtrDouble* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.MultiplyEqual_BtrDoubleBtrDouble");

	UObject_MultiplyEqual_BtrDoubleBtrDouble_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.NotEqual_BtrDoubleBtrDouble
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// struct FBtrDouble              B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_NotEqual_BtrDoubleBtrDouble(const struct FBtrDouble& A, const struct FBtrDouble& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.NotEqual_BtrDoubleBtrDouble");

	UObject_NotEqual_BtrDoubleBtrDouble_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.EqualEqual_BtrDoubleBtrDouble
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// struct FBtrDouble              B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_EqualEqual_BtrDoubleBtrDouble(const struct FBtrDouble& A, const struct FBtrDouble& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.EqualEqual_BtrDoubleBtrDouble");

	UObject_EqualEqual_BtrDoubleBtrDouble_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Subtract_BtrDoubleFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// float                          B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_Subtract_BtrDoubleFloat(const struct FBtrDouble& A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Subtract_BtrDoubleFloat");

	UObject_Subtract_BtrDoubleFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Subtract_BtrDoubleInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// int                            B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_Subtract_BtrDoubleInt(const struct FBtrDouble& A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Subtract_BtrDoubleInt");

	UObject_Subtract_BtrDoubleInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Subtract_BtrDoubleBtrDouble
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// struct FBtrDouble              B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_Subtract_BtrDoubleBtrDouble(const struct FBtrDouble& A, const struct FBtrDouble& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Subtract_BtrDoubleBtrDouble");

	UObject_Subtract_BtrDoubleBtrDouble_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Add_BtrDoubleFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// float                          B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_Add_BtrDoubleFloat(const struct FBtrDouble& A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Add_BtrDoubleFloat");

	UObject_Add_BtrDoubleFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Add_BtrDoubleInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// int                            B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_Add_BtrDoubleInt(const struct FBtrDouble& A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Add_BtrDoubleInt");

	UObject_Add_BtrDoubleInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Add_BtrDoubleBtrDouble
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// struct FBtrDouble              B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_Add_BtrDoubleBtrDouble(const struct FBtrDouble& A, const struct FBtrDouble& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Add_BtrDoubleBtrDouble");

	UObject_Add_BtrDoubleBtrDouble_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Divide_BtrDoubleFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// float                          B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_Divide_BtrDoubleFloat(const struct FBtrDouble& A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Divide_BtrDoubleFloat");

	UObject_Divide_BtrDoubleFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Divide_BtrDoubleInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// int                            B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_Divide_BtrDoubleInt(const struct FBtrDouble& A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Divide_BtrDoubleInt");

	UObject_Divide_BtrDoubleInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Divide_BtrDoubleBtrDouble
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// struct FBtrDouble              B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_Divide_BtrDoubleBtrDouble(const struct FBtrDouble& A, const struct FBtrDouble& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Divide_BtrDoubleBtrDouble");

	UObject_Divide_BtrDoubleBtrDouble_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Multiply_BtrDoubleFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// float                          B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_Multiply_BtrDoubleFloat(const struct FBtrDouble& A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Multiply_BtrDoubleFloat");

	UObject_Multiply_BtrDoubleFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Multiply_BtrDoubleInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// int                            B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_Multiply_BtrDoubleInt(const struct FBtrDouble& A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Multiply_BtrDoubleInt");

	UObject_Multiply_BtrDoubleInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Multiply_BtrDoubleBtrDouble
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// struct FBtrDouble              B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_Multiply_BtrDoubleBtrDouble(const struct FBtrDouble& A, const struct FBtrDouble& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Multiply_BtrDoubleBtrDouble");

	UObject_Multiply_BtrDoubleBtrDouble_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.NotEqual_NameName
// (Final, Native, Operator, Static, Public)
// Parameters:
// FName                          A                              (Parm)
// FName                          B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_NotEqual_NameName(const FName& A, const FName& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.NotEqual_NameName");

	UObject_NotEqual_NameName_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.EqualEqual_NameName
// (Final, Native, Operator, Static, Public)
// Parameters:
// FName                          A                              (Parm)
// FName                          B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_EqualEqual_NameName(const FName& A, const FName& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.EqualEqual_NameName");

	UObject_EqualEqual_NameName_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.NotEqual_ObjectObject
// (Final, Native, Operator, Static, Public)
// Parameters:
// class UObject*                 A                              (Parm)
// class UObject*                 B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_NotEqual_ObjectObject(class UObject* A, class UObject* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.NotEqual_ObjectObject");

	UObject_NotEqual_ObjectObject_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.EqualEqual_ObjectObject
// (Final, Native, Operator, Static, Public)
// Parameters:
// class UObject*                 A                              (Parm)
// class UObject*                 B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_EqualEqual_ObjectObject(class UObject* A, class UObject* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.EqualEqual_ObjectObject");

	UObject_EqualEqual_ObjectObject_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Eval
// (Final, Native, Static, Public)
// Parameters:
// bool                           Condition                      (Parm)
// string                         ResultIfTrue                   (Parm, CoerceParm, NeedCtorLink)
// string                         ResultIfFalse                  (Parm, CoerceParm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_Eval(bool Condition, const string& ResultIfTrue, const string& ResultIfFalse)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Eval");

	UObject_Eval_Params params;
	params.Condition = Condition;
	params.ResultIfTrue = ResultIfTrue;
	params.ResultIfFalse = ResultIfFalse;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Repl
// (Final, Native, Static, Public)
// Parameters:
// string                         Src                            (Parm, CoerceParm, NeedCtorLink)
// string                         Match                          (Parm, CoerceParm, NeedCtorLink)
// string                         With                           (Parm, CoerceParm, NeedCtorLink)
// bool                           bCaseSensitive                 (OptionalParm, Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_Repl(const string& Src, const string& Match, const string& With, bool bCaseSensitive)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Repl");

	UObject_Repl_Params params;
	params.Src = Src;
	params.Match = Match;
	params.With = With;
	params.bCaseSensitive = bCaseSensitive;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.StrCmp
// (Final, Native, Static, Public)
// Parameters:
// string                         S                              (Parm, CoerceParm, NeedCtorLink)
// string                         t                              (Parm, CoerceParm, NeedCtorLink)
// int                            Count                          (OptionalParm, Parm)
// bool                           bCaseSensitive                 (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_StrCmp(const string& S, const string& t, int Count, bool bCaseSensitive)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.StrCmp");

	UObject_StrCmp_Params params;
	params.S = S;
	params.t = t;
	params.Count = Count;
	params.bCaseSensitive = bCaseSensitive;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.KeyCode
// (Final, Native, Static, Public)
// Parameters:
// string                         S                              (Parm, NeedCtorLink)
// int                            i                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_KeyCode(const string& S, int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.KeyCode");

	UObject_KeyCode_Params params;
	params.S = S;
	params.i = i;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Split
// (Final, Native, Static, Public)
// Parameters:
// string                         Src                            (Parm, CoerceParm, NeedCtorLink)
// string                         Divider                        (Parm, NeedCtorLink)
// string[]                       Parts                          (Parm, OutParm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_Split(const string& Src, const string& Divider, string[]* Parts)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Split");

	UObject_Split_Params params;
	params.Src = Src;
	params.Divider = Divider;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Parts != nullptr)
		*Parts = params.Parts;

	return params.ReturnValue;
}


// Function Core.Object.Divide
// (Final, Native, Static, Public)
// Parameters:
// string                         Src                            (Parm, CoerceParm, NeedCtorLink)
// string                         Divider                        (Parm, NeedCtorLink)
// string                         LeftPart                       (Parm, OutParm, NeedCtorLink)
// string                         RightPart                      (Parm, OutParm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_Divide(const string& Src, const string& Divider, string* LeftPart, string* RightPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Divide");

	UObject_Divide_Params params;
	params.Src = Src;
	params.Divider = Divider;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (LeftPart != nullptr)
		*LeftPart = params.LeftPart;
	if (RightPart != nullptr)
		*RightPart = params.RightPart;

	return params.ReturnValue;
}


// Function Core.Object.Locs
// (Final, Native, Static, Public)
// Parameters:
// string                         S                              (Parm, CoerceParm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_Locs(const string& S)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Locs");

	UObject_Locs_Params params;
	params.S = S;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Asc
// (Final, Native, Static, Public)
// Parameters:
// string                         S                              (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_Asc(const string& S)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Asc");

	UObject_Asc_Params params;
	params.S = S;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Chr
// (Final, Native, Static, Public)
// Parameters:
// int                            i                              (Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_Chr(int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Chr");

	UObject_Chr_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Caps
// (Final, Native, Static, Public)
// Parameters:
// string                         S                              (Parm, CoerceParm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_Caps(const string& S)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Caps");

	UObject_Caps_Params params;
	params.S = S;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Right
// (Final, Native, Static, Public)
// Parameters:
// string                         S                              (Parm, CoerceParm, NeedCtorLink)
// int                            i                              (Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_Right(const string& S, int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Right");

	UObject_Right_Params params;
	params.S = S;
	params.i = i;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Left
// (Final, Native, Static, Public)
// Parameters:
// string                         S                              (Parm, CoerceParm, NeedCtorLink)
// int                            i                              (Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_Left(const string& S, int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Left");

	UObject_Left_Params params;
	params.S = S;
	params.i = i;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Mid
// (Final, Native, Static, Public)
// Parameters:
// string                         S                              (Parm, CoerceParm, NeedCtorLink)
// int                            i                              (Parm)
// int                            j                              (OptionalParm, Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_Mid(const string& S, int i, int j)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Mid");

	UObject_Mid_Params params;
	params.S = S;
	params.i = i;
	params.j = j;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.InStr
// (Final, Native, Static, Public)
// Parameters:
// string                         S                              (Parm, CoerceParm, NeedCtorLink)
// string                         t                              (Parm, CoerceParm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_InStr(const string& S, const string& t)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.InStr");

	UObject_InStr_Params params;
	params.S = S;
	params.t = t;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Len
// (Final, Native, Static, Public)
// Parameters:
// string                         S                              (Parm, CoerceParm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_Len(const string& S)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Len");

	UObject_Len_Params params;
	params.S = S;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.SubtractEqual_StrStr
// (Final, Native, Operator, Static, Public)
// Parameters:
// string                         A                              (Parm, OutParm, NeedCtorLink)
// string                         B                              (Parm, CoerceParm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_SubtractEqual_StrStr(const string& B, string* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.SubtractEqual_StrStr");

	UObject_SubtractEqual_StrStr_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.AtEqual_StrStr
// (Final, Native, Operator, Static, Public)
// Parameters:
// string                         A                              (Parm, OutParm, NeedCtorLink)
// string                         B                              (Parm, CoerceParm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_AtEqual_StrStr(const string& B, string* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.AtEqual_StrStr");

	UObject_AtEqual_StrStr_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.ConcatEqual_StrStr
// (Final, Native, Operator, Static, Public)
// Parameters:
// string                         A                              (Parm, OutParm, NeedCtorLink)
// string                         B                              (Parm, CoerceParm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_ConcatEqual_StrStr(const string& B, string* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.ConcatEqual_StrStr");

	UObject_ConcatEqual_StrStr_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.ComplementEqual_StrStr
// (Final, Native, Operator, Static, Public)
// Parameters:
// string                         A                              (Parm, NeedCtorLink)
// string                         B                              (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_ComplementEqual_StrStr(const string& A, const string& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.ComplementEqual_StrStr");

	UObject_ComplementEqual_StrStr_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.NotEqual_StrStr
// (Final, Native, Operator, Static, Public)
// Parameters:
// string                         A                              (Parm, NeedCtorLink)
// string                         B                              (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_NotEqual_StrStr(const string& A, const string& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.NotEqual_StrStr");

	UObject_NotEqual_StrStr_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.EqualEqual_StrStr
// (Final, Native, Operator, Static, Public)
// Parameters:
// string                         A                              (Parm, NeedCtorLink)
// string                         B                              (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_EqualEqual_StrStr(const string& A, const string& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.EqualEqual_StrStr");

	UObject_EqualEqual_StrStr_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.GreaterEqual_StrStr
// (Final, Native, Operator, Static, Public)
// Parameters:
// string                         A                              (Parm, NeedCtorLink)
// string                         B                              (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_GreaterEqual_StrStr(const string& A, const string& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GreaterEqual_StrStr");

	UObject_GreaterEqual_StrStr_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.LessEqual_StrStr
// (Final, Native, Operator, Static, Public)
// Parameters:
// string                         A                              (Parm, NeedCtorLink)
// string                         B                              (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_LessEqual_StrStr(const string& A, const string& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.LessEqual_StrStr");

	UObject_LessEqual_StrStr_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Greater_StrStr
// (Final, Native, Operator, Static, Public)
// Parameters:
// string                         A                              (Parm, NeedCtorLink)
// string                         B                              (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_Greater_StrStr(const string& A, const string& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Greater_StrStr");

	UObject_Greater_StrStr_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Less_StrStr
// (Final, Native, Operator, Static, Public)
// Parameters:
// string                         A                              (Parm, NeedCtorLink)
// string                         B                              (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_Less_StrStr(const string& A, const string& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Less_StrStr");

	UObject_Less_StrStr_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.At_StrStr
// (Final, Native, Operator, Static, Public)
// Parameters:
// string                         A                              (Parm, CoerceParm, NeedCtorLink)
// string                         B                              (Parm, CoerceParm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_At_StrStr(const string& A, const string& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.At_StrStr");

	UObject_At_StrStr_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Concat_StrStr
// (Final, Native, Operator, Static, Public)
// Parameters:
// string                         A                              (Parm, CoerceParm, NeedCtorLink)
// string                         B                              (Parm, CoerceParm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UObject::STATIC_Concat_StrStr(const string& A, const string& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Concat_StrStr");

	UObject_Concat_StrStr_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.RUU2Degree
// (Final, Native, Static, Public)
// Parameters:
// int                            iRUU                           (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_RUU2Degree(int iRUU)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.RUU2Degree");

	UObject_RUU2Degree_Params params;
	params.iRUU = iRUU;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Degree2RUU
// (Final, Native, Static, Public)
// Parameters:
// float                          fAngle                         (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_Degree2RUU(float fAngle)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Degree2RUU");

	UObject_Degree2RUU_Params params;
	params.fAngle = fAngle;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.ClockwiseFrom_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_ClockwiseFrom_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.ClockwiseFrom_IntInt");

	UObject_ClockwiseFrom_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Normalize
// (Final, Native, Static, Public)
// Parameters:
// struct FRotator                Rot                            (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator UObject::STATIC_Normalize(const struct FRotator& Rot)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Normalize");

	UObject_Normalize_Params params;
	params.Rot = Rot;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.OrthoRotation
// (Final, Native, Static, Public)
// Parameters:
// struct FVector                 X                              (Parm)
// struct FVector                 Y                              (Parm)
// struct FVector                 Z                              (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator UObject::STATIC_OrthoRotation(const struct FVector& X, const struct FVector& Y, const struct FVector& Z)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.OrthoRotation");

	UObject_OrthoRotation_Params params;
	params.X = X;
	params.Y = Y;
	params.Z = Z;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.RotRand
// (Final, Native, Static, Public)
// Parameters:
// bool                           bRoll                          (OptionalParm, Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator UObject::STATIC_RotRand(bool bRoll)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.RotRand");

	UObject_RotRand_Params params;
	params.bRoll = bRoll;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.GetUnAxes
// (Final, Native, Static, Public)
// Parameters:
// struct FRotator                A                              (Parm)
// struct FVector                 X                              (Parm, OutParm)
// struct FVector                 Y                              (Parm, OutParm)
// struct FVector                 Z                              (Parm, OutParm)

void UObject::STATIC_GetUnAxes(const struct FRotator& A, struct FVector* X, struct FVector* Y, struct FVector* Z)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GetUnAxes");

	UObject_GetUnAxes_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (X != nullptr)
		*X = params.X;
	if (Y != nullptr)
		*Y = params.Y;
	if (Z != nullptr)
		*Z = params.Z;
}


// Function Core.Object.GetAxes
// (Final, Native, Static, Public)
// Parameters:
// struct FRotator                A                              (Parm)
// struct FVector                 X                              (Parm, OutParm)
// struct FVector                 Y                              (Parm, OutParm)
// struct FVector                 Z                              (Parm, OutParm)

void UObject::STATIC_GetAxes(const struct FRotator& A, struct FVector* X, struct FVector* Y, struct FVector* Z)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GetAxes");

	UObject_GetAxes_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (X != nullptr)
		*X = params.X;
	if (Y != nullptr)
		*Y = params.Y;
	if (Z != nullptr)
		*Z = params.Z;
}


// Function Core.Object.SubtractEqual_RotatorRotator
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FRotator                A                              (Parm, OutParm)
// struct FRotator                B                              (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator UObject::STATIC_SubtractEqual_RotatorRotator(const struct FRotator& B, struct FRotator* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.SubtractEqual_RotatorRotator");

	UObject_SubtractEqual_RotatorRotator_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.AddEqual_RotatorRotator
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FRotator                A                              (Parm, OutParm)
// struct FRotator                B                              (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator UObject::STATIC_AddEqual_RotatorRotator(const struct FRotator& B, struct FRotator* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.AddEqual_RotatorRotator");

	UObject_AddEqual_RotatorRotator_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.Subtract_RotatorRotator
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FRotator                A                              (Parm)
// struct FRotator                B                              (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator UObject::STATIC_Subtract_RotatorRotator(const struct FRotator& A, const struct FRotator& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Subtract_RotatorRotator");

	UObject_Subtract_RotatorRotator_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Add_RotatorRotator
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FRotator                A                              (Parm)
// struct FRotator                B                              (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator UObject::STATIC_Add_RotatorRotator(const struct FRotator& A, const struct FRotator& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Add_RotatorRotator");

	UObject_Add_RotatorRotator_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.DivideEqual_RotatorFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FRotator                A                              (Parm, OutParm)
// float                          B                              (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator UObject::STATIC_DivideEqual_RotatorFloat(float B, struct FRotator* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.DivideEqual_RotatorFloat");

	UObject_DivideEqual_RotatorFloat_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.MultiplyEqual_RotatorFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FRotator                A                              (Parm, OutParm)
// float                          B                              (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator UObject::STATIC_MultiplyEqual_RotatorFloat(float B, struct FRotator* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.MultiplyEqual_RotatorFloat");

	UObject_MultiplyEqual_RotatorFloat_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.Divide_RotatorFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FRotator                A                              (Parm)
// float                          B                              (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator UObject::STATIC_Divide_RotatorFloat(const struct FRotator& A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Divide_RotatorFloat");

	UObject_Divide_RotatorFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Multiply_FloatRotator
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm)
// struct FRotator                B                              (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator UObject::STATIC_Multiply_FloatRotator(float A, const struct FRotator& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Multiply_FloatRotator");

	UObject_Multiply_FloatRotator_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Multiply_RotatorFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FRotator                A                              (Parm)
// float                          B                              (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator UObject::STATIC_Multiply_RotatorFloat(const struct FRotator& A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Multiply_RotatorFloat");

	UObject_Multiply_RotatorFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.NotEqual_RotatorRotator
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FRotator                A                              (Parm)
// struct FRotator                B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_NotEqual_RotatorRotator(const struct FRotator& A, const struct FRotator& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.NotEqual_RotatorRotator");

	UObject_NotEqual_RotatorRotator_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.EqualEqual_RotatorRotator
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FRotator                A                              (Parm)
// struct FRotator                B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_EqualEqual_RotatorRotator(const struct FRotator& A, const struct FRotator& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.EqualEqual_RotatorRotator");

	UObject_EqualEqual_RotatorRotator_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.MirrorVectorByNormal
// (Final, Native, Static, Public)
// Parameters:
// struct FVector                 Vect                           (Parm)
// struct FVector                 Normal                         (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_MirrorVectorByNormal(const struct FVector& Vect, const struct FVector& Normal)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.MirrorVectorByNormal");

	UObject_MirrorVectorByNormal_Params params;
	params.Vect = Vect;
	params.Normal = Normal;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.VRand
// (Final, Native, Static, Public)
// Parameters:
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_VRand()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.VRand");

	UObject_VRand_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Invert
// (Final, Native, Static, Public)
// Parameters:
// struct FVector                 X                              (Parm, OutParm)
// struct FVector                 Y                              (Parm, OutParm)
// struct FVector                 Z                              (Parm, OutParm)

void UObject::STATIC_Invert(struct FVector* X, struct FVector* Y, struct FVector* Z)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Invert");

	UObject_Invert_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (X != nullptr)
		*X = params.X;
	if (Y != nullptr)
		*Y = params.Y;
	if (Z != nullptr)
		*Z = params.Z;
}


// Function Core.Object.Normal
// (Final, Native, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_Normal(const struct FVector& A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Normal");

	UObject_Normal_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.VSize
// (Final, Native, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_VSize(const struct FVector& A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.VSize");

	UObject_VSize_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.SubtractEqual_VectorVector
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm, OutParm)
// struct FVector                 B                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_SubtractEqual_VectorVector(const struct FVector& B, struct FVector* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.SubtractEqual_VectorVector");

	UObject_SubtractEqual_VectorVector_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.AddEqual_VectorVector
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm, OutParm)
// struct FVector                 B                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_AddEqual_VectorVector(const struct FVector& B, struct FVector* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.AddEqual_VectorVector");

	UObject_AddEqual_VectorVector_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.DivideEqual_VectorFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm, OutParm)
// float                          B                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_DivideEqual_VectorFloat(float B, struct FVector* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.DivideEqual_VectorFloat");

	UObject_DivideEqual_VectorFloat_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.MultiplyEqual_VectorVector
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm, OutParm)
// struct FVector                 B                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_MultiplyEqual_VectorVector(const struct FVector& B, struct FVector* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.MultiplyEqual_VectorVector");

	UObject_MultiplyEqual_VectorVector_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.MultiplyEqual_VectorFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm, OutParm)
// float                          B                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_MultiplyEqual_VectorFloat(float B, struct FVector* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.MultiplyEqual_VectorFloat");

	UObject_MultiplyEqual_VectorFloat_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.Cross_VectorVector
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm)
// struct FVector                 B                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_Cross_VectorVector(const struct FVector& A, const struct FVector& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Cross_VectorVector");

	UObject_Cross_VectorVector_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Dot_VectorVector
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm)
// struct FVector                 B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Dot_VectorVector(const struct FVector& A, const struct FVector& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Dot_VectorVector");

	UObject_Dot_VectorVector_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.NotEqual_VectorVector
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm)
// struct FVector                 B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_NotEqual_VectorVector(const struct FVector& A, const struct FVector& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.NotEqual_VectorVector");

	UObject_NotEqual_VectorVector_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.EqualEqual_VectorVector
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm)
// struct FVector                 B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_EqualEqual_VectorVector(const struct FVector& A, const struct FVector& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.EqualEqual_VectorVector");

	UObject_EqualEqual_VectorVector_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.GreaterGreater_VectorRotator
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm)
// struct FRotator                B                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_GreaterGreater_VectorRotator(const struct FVector& A, const struct FRotator& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GreaterGreater_VectorRotator");

	UObject_GreaterGreater_VectorRotator_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.LessLess_VectorRotator
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm)
// struct FRotator                B                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_LessLess_VectorRotator(const struct FVector& A, const struct FRotator& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.LessLess_VectorRotator");

	UObject_LessLess_VectorRotator_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Subtract_VectorVector
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm)
// struct FVector                 B                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_Subtract_VectorVector(const struct FVector& A, const struct FVector& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Subtract_VectorVector");

	UObject_Subtract_VectorVector_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Add_VectorVector
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm)
// struct FVector                 B                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_Add_VectorVector(const struct FVector& A, const struct FVector& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Add_VectorVector");

	UObject_Add_VectorVector_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Divide_VectorFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm)
// float                          B                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_Divide_VectorFloat(const struct FVector& A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Divide_VectorFloat");

	UObject_Divide_VectorFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Multiply_VectorVector
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm)
// struct FVector                 B                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_Multiply_VectorVector(const struct FVector& A, const struct FVector& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Multiply_VectorVector");

	UObject_Multiply_VectorVector_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Multiply_FloatVector
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm)
// struct FVector                 B                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_Multiply_FloatVector(float A, const struct FVector& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Multiply_FloatVector");

	UObject_Multiply_FloatVector_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Multiply_VectorFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm)
// float                          B                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_Multiply_VectorFloat(const struct FVector& A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Multiply_VectorFloat");

	UObject_Multiply_VectorFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Subtract_PreVector
// (Final, PreOperator, Native, Operator, Static, Public)
// Parameters:
// struct FVector                 A                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector UObject::STATIC_Subtract_PreVector(const struct FVector& A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Subtract_PreVector");

	UObject_Subtract_PreVector_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Round
// (Final, Native, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Round(float A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Round");

	UObject_Round_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Ceil
// (Final, Native, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Ceil(float A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Ceil");

	UObject_Ceil_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Smerp
// (Final, Native, Static, Public)
// Parameters:
// float                          Alpha                          (Parm)
// float                          A                              (Parm)
// float                          B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Smerp(float Alpha, float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Smerp");

	UObject_Smerp_Params params;
	params.Alpha = Alpha;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Lerp
// (Final, Native, Static, Public)
// Parameters:
// float                          Alpha                          (Parm)
// float                          A                              (Parm)
// float                          B                              (Parm)
// bool                           bClampRange                    (OptionalParm, Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Lerp(float Alpha, float A, float B, bool bClampRange)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Lerp");

	UObject_Lerp_Params params;
	params.Alpha = Alpha;
	params.A = A;
	params.B = B;
	params.bClampRange = bClampRange;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.FClamp
// (Final, Native, Static, Public)
// Parameters:
// float                          V                              (Parm)
// float                          A                              (Parm)
// float                          B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_FClamp(float V, float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.FClamp");

	UObject_FClamp_Params params;
	params.V = V;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.FMax
// (Final, Native, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_FMax(float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.FMax");

	UObject_FMax_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.FMin
// (Final, Native, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_FMin(float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.FMin");

	UObject_FMin_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.FRand
// (Final, Native, Static, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_FRand()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.FRand");

	UObject_FRand_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Square
// (Final, Native, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Square(float A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Square");

	UObject_Square_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Sqrt
// (Final, Native, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Sqrt(float A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Sqrt");

	UObject_Sqrt_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Loge
// (Final, Native, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Loge(float A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Loge");

	UObject_Loge_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Exp
// (Final, Native, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Exp(float A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Exp");

	UObject_Exp_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Atan
// (Final, Native, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Atan(float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Atan");

	UObject_Atan_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Tan
// (Final, Native, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Tan(float A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Tan");

	UObject_Tan_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Acos
// (Final, Native, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Acos(float A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Acos");

	UObject_Acos_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Cos
// (Final, Native, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Cos(float A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Cos");

	UObject_Cos_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Asin
// (Final, Native, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Asin(float A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Asin");

	UObject_Asin_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Sin
// (Final, Native, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Sin(float A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Sin");

	UObject_Sin_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Abs
// (Final, Native, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Abs(float A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Abs");

	UObject_Abs_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.SubtractEqual_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm, OutParm)
// float                          B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_SubtractEqual_FloatFloat(float B, float* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.SubtractEqual_FloatFloat");

	UObject_SubtractEqual_FloatFloat_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.AddEqual_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm, OutParm)
// float                          B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_AddEqual_FloatFloat(float B, float* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.AddEqual_FloatFloat");

	UObject_AddEqual_FloatFloat_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.DivideEqual_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm, OutParm)
// float                          B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_DivideEqual_FloatFloat(float B, float* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.DivideEqual_FloatFloat");

	UObject_DivideEqual_FloatFloat_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.MultiplyEqual_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm, OutParm)
// float                          B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_MultiplyEqual_FloatFloat(float B, float* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.MultiplyEqual_FloatFloat");

	UObject_MultiplyEqual_FloatFloat_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.NotEqual_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_NotEqual_FloatFloat(float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.NotEqual_FloatFloat");

	UObject_NotEqual_FloatFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.ComplementEqual_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_ComplementEqual_FloatFloat(float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.ComplementEqual_FloatFloat");

	UObject_ComplementEqual_FloatFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.EqualEqual_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_EqualEqual_FloatFloat(float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.EqualEqual_FloatFloat");

	UObject_EqualEqual_FloatFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.GreaterEqual_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_GreaterEqual_FloatFloat(float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GreaterEqual_FloatFloat");

	UObject_GreaterEqual_FloatFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.LessEqual_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_LessEqual_FloatFloat(float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.LessEqual_FloatFloat");

	UObject_LessEqual_FloatFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Greater_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_Greater_FloatFloat(float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Greater_FloatFloat");

	UObject_Greater_FloatFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Less_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_Less_FloatFloat(float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Less_FloatFloat");

	UObject_Less_FloatFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Subtract_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Subtract_FloatFloat(float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Subtract_FloatFloat");

	UObject_Subtract_FloatFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Add_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Add_FloatFloat(float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Add_FloatFloat");

	UObject_Add_FloatFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Percent_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Percent_FloatFloat(float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Percent_FloatFloat");

	UObject_Percent_FloatFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Divide_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Divide_FloatFloat(float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Divide_FloatFloat");

	UObject_Divide_FloatFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Multiply_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Multiply_FloatFloat(float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Multiply_FloatFloat");

	UObject_Multiply_FloatFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.MultiplyMultiply_FloatFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_MultiplyMultiply_FloatFloat(float A, float B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.MultiplyMultiply_FloatFloat");

	UObject_MultiplyMultiply_FloatFloat_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Subtract_PreFloat
// (Final, PreOperator, Native, Operator, Static, Public)
// Parameters:
// float                          A                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UObject::STATIC_Subtract_PreFloat(float A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Subtract_PreFloat");

	UObject_Subtract_PreFloat_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Clamp
// (Final, Native, Static, Public)
// Parameters:
// int                            V                              (Parm)
// int                            A                              (Parm)
// int                            B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_Clamp(int V, int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Clamp");

	UObject_Clamp_Params params;
	params.V = V;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Max
// (Final, Native, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_Max(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Max");

	UObject_Max_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Min
// (Final, Native, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_Min(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Min");

	UObject_Min_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.SignedRand
// (Final, Native, Static, Public)
// Parameters:
// int                            iMin                           (Parm)
// int                            iMax                           (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_SignedRand(int iMin, int iMax)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.SignedRand");

	UObject_SignedRand_Params params;
	params.iMin = iMin;
	params.iMax = iMax;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.SRand
// (Final, Native, Static, Public)
// Parameters:
// int                            Seed                           (Parm)

void UObject::STATIC_SRand(int Seed)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.SRand");

	UObject_SRand_Params params;
	params.Seed = Seed;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Core.Object.Rand
// (Final, Native, Static, Public)
// Parameters:
// int                            Max                            (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_Rand(int Max)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Rand");

	UObject_Rand_Params params;
	params.Max = Max;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.SubtractSubtract_Int
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm, OutParm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_SubtractSubtract_Int(int* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.SubtractSubtract_Int");

	UObject_SubtractSubtract_Int_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.AddAdd_Int
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm, OutParm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_AddAdd_Int(int* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.AddAdd_Int");

	UObject_AddAdd_Int_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.SubtractSubtract_PreInt
// (Final, PreOperator, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm, OutParm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_SubtractSubtract_PreInt(int* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.SubtractSubtract_PreInt");

	UObject_SubtractSubtract_PreInt_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.AddAdd_PreInt
// (Final, PreOperator, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm, OutParm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_AddAdd_PreInt(int* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.AddAdd_PreInt");

	UObject_AddAdd_PreInt_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.SubtractEqual_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm, OutParm)
// int                            B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_SubtractEqual_IntInt(int B, int* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.SubtractEqual_IntInt");

	UObject_SubtractEqual_IntInt_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.AddEqual_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm, OutParm)
// int                            B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_AddEqual_IntInt(int B, int* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.AddEqual_IntInt");

	UObject_AddEqual_IntInt_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.DivideEqual_IntFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm, OutParm)
// float                          B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_DivideEqual_IntFloat(float B, int* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.DivideEqual_IntFloat");

	UObject_DivideEqual_IntFloat_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.MultiplyEqual_IntFloat
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm, OutParm)
// float                          B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_MultiplyEqual_IntFloat(float B, int* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.MultiplyEqual_IntFloat");

	UObject_MultiplyEqual_IntFloat_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.Or_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_Or_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Or_IntInt");

	UObject_Or_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Xor_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_Xor_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Xor_IntInt");

	UObject_Xor_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.And_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_And_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.And_IntInt");

	UObject_And_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.NotEqual_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_NotEqual_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.NotEqual_IntInt");

	UObject_NotEqual_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.EqualEqual_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_EqualEqual_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.EqualEqual_IntInt");

	UObject_EqualEqual_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.GreaterEqual_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_GreaterEqual_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GreaterEqual_IntInt");

	UObject_GreaterEqual_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.LessEqual_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_LessEqual_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.LessEqual_IntInt");

	UObject_LessEqual_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Greater_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_Greater_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Greater_IntInt");

	UObject_Greater_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Less_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_Less_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Less_IntInt");

	UObject_Less_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.GreaterGreaterGreater_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_GreaterGreaterGreater_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GreaterGreaterGreater_IntInt");

	UObject_GreaterGreaterGreater_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.GreaterGreater_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_GreaterGreater_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GreaterGreater_IntInt");

	UObject_GreaterGreater_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.LessLess_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_LessLess_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.LessLess_IntInt");

	UObject_LessLess_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Subtract_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_Subtract_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Subtract_IntInt");

	UObject_Subtract_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Add_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_Add_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Add_IntInt");

	UObject_Add_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Divide_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_Divide_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Divide_IntInt");

	UObject_Divide_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Multiply_IntInt
// (Final, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_Multiply_IntInt(int A, int B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Multiply_IntInt");

	UObject_Multiply_IntInt_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Subtract_PreInt
// (Final, PreOperator, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_Subtract_PreInt(int A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Subtract_PreInt");

	UObject_Subtract_PreInt_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Complement_PreInt
// (Final, PreOperator, Native, Operator, Static, Public)
// Parameters:
// int                            A                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UObject::STATIC_Complement_PreInt(int A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Complement_PreInt");

	UObject_Complement_PreInt_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.SubtractSubtract_Byte
// (Final, Native, Operator, Static, Public)
// Parameters:
// byte                           A                              (Parm, OutParm)
// byte                           ReturnValue                    (Parm, OutParm, ReturnParm)

byte UObject::STATIC_SubtractSubtract_Byte(byte* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.SubtractSubtract_Byte");

	UObject_SubtractSubtract_Byte_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.AddAdd_Byte
// (Final, Native, Operator, Static, Public)
// Parameters:
// byte                           A                              (Parm, OutParm)
// byte                           ReturnValue                    (Parm, OutParm, ReturnParm)

byte UObject::STATIC_AddAdd_Byte(byte* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.AddAdd_Byte");

	UObject_AddAdd_Byte_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.SubtractSubtract_PreByte
// (Final, PreOperator, Native, Operator, Static, Public)
// Parameters:
// byte                           A                              (Parm, OutParm)
// byte                           ReturnValue                    (Parm, OutParm, ReturnParm)

byte UObject::STATIC_SubtractSubtract_PreByte(byte* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.SubtractSubtract_PreByte");

	UObject_SubtractSubtract_PreByte_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.AddAdd_PreByte
// (Final, PreOperator, Native, Operator, Static, Public)
// Parameters:
// byte                           A                              (Parm, OutParm)
// byte                           ReturnValue                    (Parm, OutParm, ReturnParm)

byte UObject::STATIC_AddAdd_PreByte(byte* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.AddAdd_PreByte");

	UObject_AddAdd_PreByte_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.SubtractEqual_ByteByte
// (Final, Native, Operator, Static, Public)
// Parameters:
// byte                           A                              (Parm, OutParm)
// byte                           B                              (Parm)
// byte                           ReturnValue                    (Parm, OutParm, ReturnParm)

byte UObject::STATIC_SubtractEqual_ByteByte(byte B, byte* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.SubtractEqual_ByteByte");

	UObject_SubtractEqual_ByteByte_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.AddEqual_ByteByte
// (Final, Native, Operator, Static, Public)
// Parameters:
// byte                           A                              (Parm, OutParm)
// byte                           B                              (Parm)
// byte                           ReturnValue                    (Parm, OutParm, ReturnParm)

byte UObject::STATIC_AddEqual_ByteByte(byte B, byte* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.AddEqual_ByteByte");

	UObject_AddEqual_ByteByte_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.DivideEqual_ByteByte
// (Final, Native, Operator, Static, Public)
// Parameters:
// byte                           A                              (Parm, OutParm)
// byte                           B                              (Parm)
// byte                           ReturnValue                    (Parm, OutParm, ReturnParm)

byte UObject::STATIC_DivideEqual_ByteByte(byte B, byte* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.DivideEqual_ByteByte");

	UObject_DivideEqual_ByteByte_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.MultiplyEqual_ByteByte
// (Final, Native, Operator, Static, Public)
// Parameters:
// byte                           A                              (Parm, OutParm)
// byte                           B                              (Parm)
// byte                           ReturnValue                    (Parm, OutParm, ReturnParm)

byte UObject::STATIC_MultiplyEqual_ByteByte(byte B, byte* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.MultiplyEqual_ByteByte");

	UObject_MultiplyEqual_ByteByte_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;

	return params.ReturnValue;
}


// Function Core.Object.OrOr_BoolBool
// (Final, Native, Operator, Static, Public)
// Parameters:
// bool                           A                              (Parm)
// bool                           B                              (Parm, SkipParm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_OrOr_BoolBool(bool A, bool B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.OrOr_BoolBool");

	UObject_OrOr_BoolBool_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.XorXor_BoolBool
// (Final, Native, Operator, Static, Public)
// Parameters:
// bool                           A                              (Parm)
// bool                           B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_XorXor_BoolBool(bool A, bool B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.XorXor_BoolBool");

	UObject_XorXor_BoolBool_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.AndAnd_BoolBool
// (Final, Native, Operator, Static, Public)
// Parameters:
// bool                           A                              (Parm)
// bool                           B                              (Parm, SkipParm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_AndAnd_BoolBool(bool A, bool B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.AndAnd_BoolBool");

	UObject_AndAnd_BoolBool_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.NotEqual_BoolBool
// (Final, Native, Operator, Static, Public)
// Parameters:
// bool                           A                              (Parm)
// bool                           B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_NotEqual_BoolBool(bool A, bool B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.NotEqual_BoolBool");

	UObject_NotEqual_BoolBool_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.EqualEqual_BoolBool
// (Final, Native, Operator, Static, Public)
// Parameters:
// bool                           A                              (Parm)
// bool                           B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_EqualEqual_BoolBool(bool A, bool B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.EqualEqual_BoolBool");

	UObject_EqualEqual_BoolBool_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.Not_PreBool
// (Final, PreOperator, Native, Operator, Static, Public)
// Parameters:
// bool                           A                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::STATIC_Not_PreBool(bool A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.Not_PreBool");

	UObject_Not_PreBool_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.BtrTimeToBtrDouble
// (Final, Native, Public)
// Parameters:
// struct FBtrTime                A                              (Parm, OutParm)
// struct FBtrDouble              B                              (Parm, OutParm)

void UObject::BtrTimeToBtrDouble(struct FBtrTime* A, struct FBtrDouble* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.BtrTimeToBtrDouble");

	UObject_BtrTimeToBtrDouble_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;
	if (B != nullptr)
		*B = params.B;
}


// Function Core.Object.BtrDoubleLessEqual
// (Final, Native, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm, OutParm)
// struct FBtrDouble              B                              (Parm, OutParm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UObject::BtrDoubleLessEqual(struct FBtrDouble* A, struct FBtrDouble* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.BtrDoubleLessEqual");

	UObject_BtrDoubleLessEqual_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;
	if (B != nullptr)
		*B = params.B;

	return params.ReturnValue;
}


// Function Core.Object.BtrDoubleToBtrTime
// (Final, Native, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm, OutParm)
// struct FBtrTime                B                              (Parm, OutParm)

void UObject::BtrDoubleToBtrTime(struct FBtrDouble* A, struct FBtrTime* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.BtrDoubleToBtrTime");

	UObject_BtrDoubleToBtrTime_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;
	if (B != nullptr)
		*B = params.B;
}


// Function Core.Object.GetLocalTimeToBtrTime
// (Final, Native, Public)
// Parameters:
// struct FBtrTime                A                              (Parm, OutParm)

void UObject::GetLocalTimeToBtrTime(struct FBtrTime* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GetLocalTimeToBtrTime");

	UObject_GetLocalTimeToBtrTime_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;
}


// Function Core.Object.GetLocalTimeToBtrDouble
// (Final, Native, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm, OutParm)

void UObject::GetLocalTimeToBtrDouble(struct FBtrDouble* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.GetLocalTimeToBtrDouble");

	UObject_GetLocalTimeToBtrDouble_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (A != nullptr)
		*A = params.A;
}


// Function Core.Object.BtrDoublePlus
// (Final, Native, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// struct FBtrDouble              B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::BtrDoublePlus(const struct FBtrDouble& A, const struct FBtrDouble& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.BtrDoublePlus");

	UObject_BtrDoublePlus_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.BtrDoubleMinus
// (Final, Native, Public)
// Parameters:
// struct FBtrDouble              A                              (Parm)
// struct FBtrDouble              B                              (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::BtrDoubleMinus(const struct FBtrDouble& A, const struct FBtrDouble& B)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.BtrDoubleMinus");

	UObject_BtrDoubleMinus_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.EmptyBtrTime
// (Defined, Static, Public)
// Parameters:
// struct FBtrTime                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrTime UObject::STATIC_EmptyBtrTime()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.EmptyBtrTime");

	UObject_EmptyBtrTime_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.EmptyBtrDouble
// (Defined, Static, Public)
// Parameters:
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble UObject::STATIC_EmptyBtrDouble()
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.EmptyBtrDouble");

	UObject_EmptyBtrDouble_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.BtrTimeSubstract
// (Defined, Static, Public)
// Parameters:
// struct FBtrTime                leftT                          (Parm)
// struct FBtrTime                rightT                         (Parm)
// struct FBtrTime                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrTime UObject::STATIC_BtrTimeSubstract(const struct FBtrTime& leftT, const struct FBtrTime& rightT)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.BtrTimeSubstract");

	UObject_BtrTimeSubstract_Params params;
	params.leftT = leftT;
	params.rightT = rightT;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Object.BtrTimeToBtrDayTime
// (Defined, Static, Public)
// Parameters:
// struct FBtrTime                it                             (Parm)
// struct FBtrTime                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrTime UObject::STATIC_BtrTimeToBtrDayTime(const struct FBtrTime& it)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Object.BtrTimeToBtrDayTime");

	UObject_BtrTimeToBtrDayTime_Params params;
	params.it = it;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Core.Commandlet.Main
// (Native, Event, Public)
// Parameters:
// string                         Parms                          (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UCommandlet::Main(const string& Parms)
{
	static auto fn = UObject::FindObject<UFunction>("Function Core.Commandlet.Main");

	UCommandlet_Main_Params params;
	params.Parms = Parms;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
