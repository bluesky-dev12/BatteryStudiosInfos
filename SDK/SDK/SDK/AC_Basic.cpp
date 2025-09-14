// Arctic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

#include "../SDK.hpp"

namespace Classes
{
	// had to edit this and add the adress!
	TArray<FNameEntry*>* FName::GNames = (TArray<FNameEntry*>*)(0x101F733C);
	TArray<UObject*>* UObject::GObjects = (TArray<UObject*>*)(0x101F7360);
}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
