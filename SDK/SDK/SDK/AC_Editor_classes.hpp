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

// Class Editor.PolysExporterOBJ
// 0x0000 (0x0044 - 0x0044)
class UPolysExporterOBJ : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.PolysExporterOBJ");
		return ptr;
	}

};


// Class Editor.LevelExporterOBJ
// 0x0000 (0x0044 - 0x0044)
class ULevelExporterOBJ : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.LevelExporterOBJ");
		return ptr;
	}

};


// Class Editor.TextureStripCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UTextureStripCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.TextureStripCommandlet");
		return ptr;
	}

};


// Class Editor.TextureLODCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UTextureLODCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.TextureLODCommandlet");
		return ptr;
	}

};


// Class Editor.TextureInfoCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UTextureInfoCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.TextureInfoCommandlet");
		return ptr;
	}

};


// Class Editor.SurfaceTypeCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class USurfaceTypeCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.SurfaceTypeCommandlet");
		return ptr;
	}

};


// Class Editor.StripSourceCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UStripSourceCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.StripSourceCommandlet");
		return ptr;
	}

};


// Class Editor.SoundLocCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class USoundLocCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.SoundLocCommandlet");
		return ptr;
	}

};


// Class Editor.SetNormalLODCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class USetNormalLODCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.SetNormalLODCommandlet");
		return ptr;
	}

};


// Class Editor.RebuildCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class URebuildCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.RebuildCommandlet");
		return ptr;
	}

};


// Class Editor.PS2ConvertCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UPS2ConvertCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.PS2ConvertCommandlet");
		return ptr;
	}

};


// Class Editor.PkgCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UPkgCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.PkgCommandlet");
		return ptr;
	}

};


// Class Editor.BitArray
// 0x0010 (0x003C - 0x002C)
class UBitArray : public UObject
{
public:
	unsigned char                                      UnknownData00[0x10];                                      // 0x002C(0x0010) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.BitArray");
		return ptr;
	}

};


// Class Editor.BitMatrix
// 0x0004 (0x0040 - 0x003C)
class UBitMatrix : public UBitArray
{
public:
	unsigned char                                      UnknownData00[0x4];                                       // 0x003C(0x0004) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.BitMatrix");
		return ptr;
	}

};


// Class Editor.StaticMeshExporterT3D
// 0x0000 (0x0044 - 0x0044)
class UStaticMeshExporterT3D : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.StaticMeshExporterT3D");
		return ptr;
	}

};


// Class Editor.StaticMeshFactory
// 0x000C (0x0078 - 0x006C)
class UStaticMeshFactory : public UFactory
{
public:
	int                                                Pitch;                                                    // 0x006C(0x0004)
	int                                                Roll;                                                     // 0x0070(0x0004)
	int                                                Yaw;                                                      // 0x0074(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.StaticMeshFactory");
		return ptr;
	}

};


// Class Editor.EditInfo
// 0x0020 (0x004C - 0x002C)
class UEditInfo : public UObject
{
public:
	unsigned char                                      UnknownData00[0x20];                                      // 0x002C(0x0020) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.EditInfo");
		return ptr;
	}

};


// Class Editor.Prefab
// 0x0010 (0x003C - 0x002C)
class UPrefab : public UObject
{
public:
	unsigned char                                      UnknownData00[0x10];                                      // 0x002C(0x0010) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.Prefab");
		return ptr;
	}

};


// Class Editor.Transactor
// 0x0000 (0x002C - 0x002C)
class UTransactor : public UObject
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.Transactor");
		return ptr;
	}

};


// Class Editor.TransBuffer
// 0x0038 (0x0064 - 0x002C)
class UTransBuffer : public UObject
{
public:
	unsigned char                                      UnknownData00[0x38];                                      // 0x002C(0x0038) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.TransBuffer");
		return ptr;
	}

};


// Class Editor.AnimNotifyProps
// 0x0004 (0x0030 - 0x002C)
class UAnimNotifyProps : public UObject
{
public:
	unsigned char                                      UnknownData00[0x4];                                       // 0x002C(0x0004) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.AnimNotifyProps");
		return ptr;
	}

};


// Class Editor.EditorEngine
// 0x010C (0x022C - 0x0120)
class UEditorEngine : public UEngine
{
public:
	unsigned char                                      UnknownData00[0xF0];                                      // 0x0120(0x00F0) MISSED OFFSET
	TArray<struct FString>                             EditPackages;                                             // 0x0210(0x000C) (Edit, NeedCtorLink)
	TArray<struct FString>                             CutdownPackages;                                          // 0x021C(0x000C) (Edit, NeedCtorLink)
	unsigned char                                      UnknownData01[0x4];                                       // 0x0228(0x0004) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.EditorEngine");
		return ptr;
	}

};


// Class Editor.MaterialFactory
// 0x000C (0x0038 - 0x002C)
class UMaterialFactory : public UObject
{
public:
	unsigned char                                      UnknownData00[0xC];                                       // 0x002C(0x000C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.MaterialFactory");
		return ptr;
	}

};


// Class Editor.TextureFactory
// 0x0000 (0x006C - 0x006C)
class UTextureFactory : public UFactory
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.TextureFactory");
		return ptr;
	}

};


// Class Editor.FontFactory
// 0x0000 (0x006C - 0x006C)
class UFontFactory : public UTextureFactory
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.FontFactory");
		return ptr;
	}

};


// Class Editor.TextureExporterDDS
// 0x0000 (0x0044 - 0x0044)
class UTextureExporterDDS : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.TextureExporterDDS");
		return ptr;
	}

};


// Class Editor.TextureExporterUPT
// 0x0000 (0x0044 - 0x0044)
class UTextureExporterUPT : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.TextureExporterUPT");
		return ptr;
	}

};


// Class Editor.TextureExporterTGA
// 0x0000 (0x0044 - 0x0044)
class UTextureExporterTGA : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.TextureExporterTGA");
		return ptr;
	}

};


// Class Editor.TextureExporterBMP
// 0x0000 (0x0044 - 0x0044)
class UTextureExporterBMP : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.TextureExporterBMP");
		return ptr;
	}

};


// Class Editor.TextureExporterPCX
// 0x0000 (0x0044 - 0x0044)
class UTextureExporterPCX : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.TextureExporterPCX");
		return ptr;
	}

};


// Class Editor.PrefabFactory
// 0x0000 (0x006C - 0x006C)
class UPrefabFactory : public UFactory
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.PrefabFactory");
		return ptr;
	}

};


// Class Editor.SoundFactory
// 0x0000 (0x006C - 0x006C)
class USoundFactory : public UFactory
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.SoundFactory");
		return ptr;
	}

};


// Class Editor.ModelFactory
// 0x0000 (0x006C - 0x006C)
class UModelFactory : public UFactory
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.ModelFactory");
		return ptr;
	}

};


// Class Editor.ConvexVolumeFactory
// 0x0000 (0x006C - 0x006C)
class UConvexVolumeFactory : public UFactory
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.ConvexVolumeFactory");
		return ptr;
	}

};


// Class Editor.PolysFactory
// 0x0000 (0x006C - 0x006C)
class UPolysFactory : public UFactory
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.PolysFactory");
		return ptr;
	}

};


// Class Editor.LevelFactory
// 0x0000 (0x006C - 0x006C)
class ULevelFactory : public UFactory
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.LevelFactory");
		return ptr;
	}

};


// Class Editor.ClassFactoryUC
// 0x0000 (0x006C - 0x006C)
class UClassFactoryUC : public UFactory
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.ClassFactoryUC");
		return ptr;
	}

};


// Class Editor.TextureFactoryNew
// 0x0014 (0x0080 - 0x006C)
class UTextureFactoryNew : public UFactory
{
public:
	struct FName                                       TextureName;                                              // 0x006C(0x0004) (Edit)
	class UPackage*                                    TexturePackage;                                           // 0x0070(0x0004) (Edit)
	class UClass*                                      TextureClass;                                             // 0x0074(0x0004) (Edit)
	int                                                USize;                                                    // 0x0078(0x0004) (Edit)
	int                                                VSize;                                                    // 0x007C(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.TextureFactoryNew");
		return ptr;
	}

};


// Class Editor.ClassFactoryNew
// 0x000C (0x0078 - 0x006C)
class UClassFactoryNew : public UFactory
{
public:
	struct FName                                       ClassName;                                                // 0x006C(0x0004) (Edit)
	class UPackage*                                    ClassPackage;                                             // 0x0070(0x0004) (Edit)
	class UClass*                                      Superclass;                                               // 0x0074(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.ClassFactoryNew");
		return ptr;
	}

};


// Class Editor.LevelFactoryNew
// 0x001C (0x0088 - 0x006C)
class ULevelFactoryNew : public UFactory
{
public:
	struct FString                                     LevelTitle;                                               // 0x006C(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Author;                                                   // 0x0078(0x000C) (Edit, NeedCtorLink)
	unsigned long                                      CloseExistingWindows : 1;                                 // 0x0084(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.LevelFactoryNew");
		return ptr;
	}

};


// Class Editor.PrefabExporterT3D
// 0x0000 (0x0044 - 0x0044)
class UPrefabExporterT3D : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.PrefabExporterT3D");
		return ptr;
	}

};


// Class Editor.LevelExporterSTL
// 0x0000 (0x0044 - 0x0044)
class ULevelExporterSTL : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.LevelExporterSTL");
		return ptr;
	}

};


// Class Editor.LevelExporterT3D
// 0x0000 (0x0044 - 0x0044)
class ULevelExporterT3D : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.LevelExporterT3D");
		return ptr;
	}

};


// Class Editor.ModelExporterT3D
// 0x0000 (0x0044 - 0x0044)
class UModelExporterT3D : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.ModelExporterT3D");
		return ptr;
	}

};


// Class Editor.PolysExporterT3D
// 0x0000 (0x0044 - 0x0044)
class UPolysExporterT3D : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.PolysExporterT3D");
		return ptr;
	}

};


// Class Editor.ConvexVolumeExporterT3D
// 0x0000 (0x0044 - 0x0044)
class UConvexVolumeExporterT3D : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.ConvexVolumeExporterT3D");
		return ptr;
	}

};


// Class Editor.ClassExporterUC
// 0x0000 (0x0044 - 0x0044)
class UClassExporterUC : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.ClassExporterUC");
		return ptr;
	}

};


// Class Editor.ClassExporterH
// 0x0008 (0x004C - 0x0044)
class UClassExporterH : public UExporter
{
public:
	unsigned char                                      UnknownData00[0x8];                                       // 0x0044(0x0008) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.ClassExporterH");
		return ptr;
	}

};


// Class Editor.SoundExporterWAV
// 0x0000 (0x0044 - 0x0044)
class USoundExporterWAV : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.SoundExporterWAV");
		return ptr;
	}

};


// Class Editor.TextBufferExporterTXT
// 0x0000 (0x0044 - 0x0044)
class UTextBufferExporterTXT : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.TextBufferExporterTXT");
		return ptr;
	}

};


// Class Editor.DumpConfigCommandlet
// 0x0008 (0x01E8 - 0x01E0)
class UDumpConfigCommandlet : public UCommandlet
{
public:
	unsigned char                                      UnknownData00[0x8];                                       // 0x01E0(0x0008) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.DumpConfigCommandlet");
		return ptr;
	}

};


// Class Editor.ChecksumPackageCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UChecksumPackageCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.ChecksumPackageCommandlet");
		return ptr;
	}

};


// Class Editor.UpdateUModCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UUpdateUModCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.UpdateUModCommandlet");
		return ptr;
	}

};


// Class Editor.MasterCommandlet
// 0x0088 (0x0268 - 0x01E0)
class UMasterCommandlet : public UCommandlet
{
public:
	unsigned char                                      UnknownData00[0x88];                                      // 0x01E0(0x0088) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.MasterCommandlet");
		return ptr;
	}

};


// Class Editor.MapConvertCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UMapConvertCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.MapConvertCommandlet");
		return ptr;
	}

};


// Class Editor.MakeCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UMakeCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.MakeCommandlet");
		return ptr;
	}

};


// Class Editor.GroupRepairCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UGroupRepairCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.GroupRepairCommandlet");
		return ptr;
	}

};


// Class Editor.DXTConvertCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UDXTConvertCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.DXTConvertCommandlet");
		return ptr;
	}

};


// Class Editor.RearrangeIntCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class URearrangeIntCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.RearrangeIntCommandlet");
		return ptr;
	}

};


// Class Editor.MergeIntCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UMergeIntCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.MergeIntCommandlet");
		return ptr;
	}

};


// Class Editor.CompareIntCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UCompareIntCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.CompareIntCommandlet");
		return ptr;
	}

};


// Class Editor.DumpIntCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UDumpIntCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.DumpIntCommandlet");
		return ptr;
	}

};


// Class Editor.ObjectRenameCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UObjectRenameCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.ObjectRenameCommandlet");
		return ptr;
	}

};


// Class Editor.CutdownContentCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UCutdownContentCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.CutdownContentCommandlet");
		return ptr;
	}

};


// Class Editor.ConvertMaterialCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UConvertMaterialCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.ConvertMaterialCommandlet");
		return ptr;
	}

};


// Class Editor.CheckSounds
// 0x0000 (0x01E0 - 0x01E0)
class UCheckSounds : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.CheckSounds");
		return ptr;
	}

};


// Class Editor.BatchingSummary
// 0x0000 (0x01E0 - 0x01E0)
class UBatchingSummary : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.BatchingSummary");
		return ptr;
	}

};


// Class Editor.CompressTextures
// 0x0000 (0x01E0 - 0x01E0)
class UCompressTextures : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.CompressTextures");
		return ptr;
	}

};


// Class Editor.SoundConvert
// 0x0000 (0x01E0 - 0x01E0)
class USoundConvert : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.SoundConvert");
		return ptr;
	}

};


// Class Editor.MapKillZ
// 0x0000 (0x01E0 - 0x01E0)
class UMapKillZ : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.MapKillZ");
		return ptr;
	}

};


// Class Editor.ListExports
// 0x0000 (0x01E0 - 0x01E0)
class UListExports : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.ListExports");
		return ptr;
	}

};


// Class Editor.CheckEmitters
// 0x0000 (0x01E0 - 0x01E0)
class UCheckEmitters : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.CheckEmitters");
		return ptr;
	}

};


// Class Editor.CheckStaticMeshes
// 0x0000 (0x01E0 - 0x01E0)
class UCheckStaticMeshes : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.CheckStaticMeshes");
		return ptr;
	}

};


// Class Editor.StaticMeshConvert
// 0x0000 (0x01E0 - 0x01E0)
class UStaticMeshConvert : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.StaticMeshConvert");
		return ptr;
	}

};


// Class Editor.LoadPackage
// 0x0000 (0x01E0 - 0x01E0)
class ULoadPackage : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.LoadPackage");
		return ptr;
	}

};


// Class Editor.CheckTextures
// 0x0000 (0x01E0 - 0x01E0)
class UCheckTextures : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.CheckTextures");
		return ptr;
	}

};


// Class Editor.DataRipCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UDataRipCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.DataRipCommandlet");
		return ptr;
	}

};


// Class Editor.PackageFlagCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UPackageFlagCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.PackageFlagCommandlet");
		return ptr;
	}

};


// Class Editor.ClassFlagCommandlet
// 0x0004 (0x01E4 - 0x01E0)
class UClassFlagCommandlet : public UCommandlet
{
public:
	unsigned char                                      UnknownData00[0x4];                                       // 0x01E0(0x0004) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.ClassFlagCommandlet");
		return ptr;
	}

};


// Class Editor.CheckUnicodeCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UCheckUnicodeCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.CheckUnicodeCommandlet");
		return ptr;
	}

};


// Class Editor.ConformCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UConformCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.ConformCommandlet");
		return ptr;
	}

};


// Class Editor.BrushBuilder
// 0x0038 (0x0064 - 0x002C)
class UBrushBuilder : public UObject
{
public:
	unsigned char                                      UnknownData00[0x38];                                      // 0x002C(0x0038) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.BrushBuilder");
		return ptr;
	}

};


// Class Editor.BatchImportCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UBatchImportCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.BatchImportCommandlet");
		return ptr;
	}

};


// Class Editor.BatchExportCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UBatchExportCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.BatchExportCommandlet");
		return ptr;
	}

};


// Class Editor.AnalyzeContentCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UAnalyzeContentCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.AnalyzeContentCommandlet");
		return ptr;
	}

};


// Class Editor.AnalyzeBuildCommandlet
// 0x0000 (0x01E0 - 0x01E0)
class UAnalyzeBuildCommandlet : public UCommandlet
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.AnalyzeBuildCommandlet");
		return ptr;
	}

};


// Class Editor.TrueTypeFontFactory
// 0x0088 (0x00F4 - 0x006C)
class UTrueTypeFontFactory : public UFontFactory
{
public:
	struct FString                                     FontName;                                                 // 0x006C(0x000C) (Edit, NeedCtorLink)
	float                                              Height;                                                   // 0x0078(0x0004) (Edit)
	int                                                USize;                                                    // 0x007C(0x0004) (Edit)
	int                                                VSize;                                                    // 0x0080(0x0004) (Edit)
	int                                                XPad;                                                     // 0x0084(0x0004) (Edit)
	int                                                YPad;                                                     // 0x0088(0x0004) (Edit)
	int                                                Count;                                                    // 0x008C(0x0004) (Edit)
	float                                              Gamma;                                                    // 0x0090(0x0004) (Edit)
	struct FString                                     Chars;                                                    // 0x0094(0x000C) (Edit, NeedCtorLink)
	unsigned long                                      AntiAlias : 1;                                            // 0x00A0(0x0004) (Edit)
	struct FString                                     UnicodeRange;                                             // 0x00A4(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Wildcard;                                                 // 0x00B0(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Path;                                                     // 0x00BC(0x000C) (Edit, NeedCtorLink)
	int                                                Style;                                                    // 0x00C8(0x0004) (Edit)
	unsigned long                                      Italic : 1;                                               // 0x00CC(0x0004) (Edit)
	unsigned long                                      UnknownData00 : 31;                                       // 0x00CC(0x0001)
	unsigned long                                      Underline : 1;                                            // 0x00D0(0x0004) (Edit)
	int                                                Kerning;                                                  // 0x00D4(0x0004) (Edit)
	int                                                DropShadowX;                                              // 0x00D8(0x0004) (Edit)
	int                                                DropShadowY;                                              // 0x00DC(0x0004) (Edit)
	int                                                ExtendBoxTop;                                             // 0x00E0(0x0004) (Edit)
	int                                                ExtendBoxBottom;                                          // 0x00E4(0x0004) (Edit)
	int                                                ExtendBoxRight;                                           // 0x00E8(0x0004) (Edit)
	int                                                ExtendBoxLeft;                                            // 0x00EC(0x0004) (Edit)
	int                                                Compression;                                              // 0x00F0(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Editor.TrueTypeFontFactory");
		return ptr;
	}

};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
