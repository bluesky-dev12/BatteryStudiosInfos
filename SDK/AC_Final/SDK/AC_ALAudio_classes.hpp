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

// Class ALAudio.FModAudioSubsystem
// 0x007C (0x0128 - 0x00AC)
class UFModAudioSubsystem : public UAudioSubsystem
{
public:
	byte                                               Padding00[0x78];                                          // 0x00AC(0x0078) MISSED OFFSET
	bool                                               UseEAX;                                                   // 0x0124(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class ALAudio.FModAudioSubsystem");
		return ptr;
	}

};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
