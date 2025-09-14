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

// Class WinDrv.WindowsWebLog
// 0x0000 (0x003C - 0x003C)
class UWindowsWebLog : public UWebLog
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WinDrv.WindowsWebLog");
		return ptr;
	}

};


// Class WinDrv.WindowsViewport
// 0x0148 (0x02F8 - 0x01B0)
class UWindowsViewport : public UViewport
{
public:
	byte                                               Padding00[0x148];                                         // 0x01B0(0x0148) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WinDrv.WindowsViewport");
		return ptr;
	}

};


// Class WinDrv.WindowsClient
// 0x0054 (0x01CC - 0x0178)
class UWindowsClient : public UClient
{
public:
	byte                                               Padding00[0x4];                                           // 0x0178(0x0004) MISSED OFFSET
	bool                                               UseJoystick;                                              // 0x017C(0x0004) (Edit)
	bool                                               Padding01 : 31;                                           // 0x017C(0x0001)
	bool                                               StartupFullscreen;                                        // 0x0180(0x0004) (Edit)
	bool                                               Padding02 : 31;                                           // 0x0180(0x0001)
	bool                                               LobbyWindowMode;                                          // 0x0184(0x0004) (Edit)
	bool                                               Padding03 : 31;                                           // 0x0184(0x0001)
	bool                                               UseSpeechRecognition;                                     // 0x0188(0x0004) (Edit)
	float                                              MouseXMultiplier;                                         // 0x018C(0x0004) (Edit)
	float                                              MouseYMultiplier;                                         // 0x0190(0x0004) (Edit)
	byte                                               Padding04[0x38];                                          // 0x0194(0x0038) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WinDrv.WindowsClient");
		return ptr;
	}

};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
