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

// Class D3D9Drv.D3D9RenderDevice
// 0x3BE34 (0x3BEF8 - 0x00C4)
class UD3D9RenderDevice : public URenderDevice
{
public:
	byte                                               Padding00[0x403C];                                        // 0x00C4(0x403C) MISSED OFFSET
	bool                                               UseVSync;                                                 // 0x4100(0x0004) (Edit)
	byte                                               Padding01[0x80];                                          // 0x4104(0x0080) MISSED OFFSET
	int                                                LevelOfAnisotropy;                                        // 0x4184(0x0004) (Edit)
	byte                                               Padding02[0x37D70];                                       // 0x4188(0x37D70) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class D3D9Drv.D3D9RenderDevice");
		return ptr;
	}

};


// Class D3D9Drv.D3D9BtrTexture
// 0x0010 (0x003C - 0x002C)
class UD3D9BtrTexture : public UBtrTexture
{
public:
	byte                                               Padding00[0x10];                                          // 0x002C(0x0010) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class D3D9Drv.D3D9BtrTexture");
		return ptr;
	}

};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
