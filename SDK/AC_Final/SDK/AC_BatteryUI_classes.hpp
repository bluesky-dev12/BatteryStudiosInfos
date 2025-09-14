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

// Class BatteryUI.BtrMaterial
// 0x0000 (0x002C - 0x002C)
class UBtrMaterial : public UObject
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BatteryUI.BtrMaterial");
		return ptr;
	}

};


// Class BatteryUI.BtrTexture
// 0x0000 (0x002C - 0x002C)
class UBtrTexture : public UBtrMaterial
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BatteryUI.BtrTexture");
		return ptr;
	}

};


// Class BatteryUI.BtrFont
// 0x0000 (0x002C - 0x002C)
class UBtrFont : public UBtrMaterial
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BatteryUI.BtrFont");
		return ptr;
	}

};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
