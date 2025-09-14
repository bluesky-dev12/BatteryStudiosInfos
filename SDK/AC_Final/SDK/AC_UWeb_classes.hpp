#pragma once

// Artic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

namespace Classes
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class UWeb.WebRequest
// 0x004C (0x0078 - 0x002C)
class UWebRequest : public UObject
{
public:
	byte                                               Padding00[0x4C];                                          // 0x002C(0x004C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UWeb.WebRequest");
		return ptr;
	}

};


// Class UWeb.WebResponse
// 0x0034 (0x0060 - 0x002C)
class UWebResponse : public UObject
{
public:
	byte                                               Padding00[0x34];                                          // 0x002C(0x0034) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UWeb.WebResponse");
		return ptr;
	}

};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
