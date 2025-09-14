/*=============================================================================
	UnObjBas.h: Unreal object base class.
	Copyright 1997-1999 Epic Games, Inc. All Rights Reserved.

	Revision history:
		* Created by Tim Sweeney
=============================================================================*/

/*-----------------------------------------------------------------------------
	Core enumerations.
-----------------------------------------------------------------------------*/

//
// Flags for loading objects.
//
enum ELoadFlags
{
	LOAD_None			= 0x0000,	// No flags.
	LOAD_NoFail			= 0x0001,	// Critical error if load fails.
	LOAD_NoWarn			= 0x0002,	// Don't display warning if load fails.
	LOAD_Throw			= 0x0008,	// Throw exceptions upon failure.
	LOAD_Verify			= 0x0010,	// Only verify existance; don't actually load.
	LOAD_AllowDll		= 0x0020,	// Allow plain DLLs.
	LOAD_DisallowFiles  = 0x0040,	// Don't load from file.
	LOAD_NoVerify       = 0x0080,   // Don't verify imports yet.
	LOAD_Forgiving      = 0x1000,   // Forgive missing imports (set them to NULL).
	LOAD_Quiet			= 0x2000,   // No log warnings.
	LOAD_NoRemap        = 0x4000,   // No remapping of packages.
	LOAD_Propagate      = 0,
};

//
// Package flags.
//
enum EPackageFlags
{
	PKG_AllowDownload	= 0x0001,	// Allow downloading package.
	PKG_ClientOptional  = 0x0002,	// Purely optional for clients.
	PKG_ServerSideOnly  = 0x0004,   // Only needed on the server side.
	PKG_BrokenLinks     = 0x0008,   // Loaded from linker with broken import links.
	PKG_Unsecure        = 0x0010,   // Not trusted.
	PKG_Need			= 0x8000,	// Client needs to download this package.
};

//
// Internal enums.
//
enum ENativeConstructor    {EC_NativeConstructor};
enum EStaticConstructor    {EC_StaticConstructor};
enum EInternal             {EC_Internal};
enum ECppProperty          {EC_CppProperty};
enum EInPlaceConstructor   {EC_InPlaceConstructor};

//
// Result of GotoState.
//
enum EGotoState
{
	GOTOSTATE_NotFound		= 0,
	GOTOSTATE_Success		= 1,
	GOTOSTATE_Preempted		= 2,
};

//
// Flags describing a class.
//
enum EClassFlags
{
	// Base flags.
	CLASS_Abstract          = 0x00001,  // Class is abstract and can't be instantiated directly.
	CLASS_Compiled			= 0x00002,  // Script has been compiled successfully.
	CLASS_Config			= 0x00004,  // Load object configuration at construction time.
	CLASS_Transient			= 0x00008,	// This object type can't be saved; null it out at save time.
	CLASS_Parsed            = 0x00010,	// Successfully parsed.
	CLASS_Localized         = 0x00020,  // Class contains localized text.
	CLASS_SafeReplace       = 0x00040,  // Objects of this class can be safely replaced with default or NULL.
	CLASS_RuntimeStatic     = 0x00080,	// Objects of this class are static during gameplay.
	CLASS_NoExport          = 0x00100,  // Don't export to C++ header.
	CLASS_NoUserCreate      = 0x00200,  // Don't allow users to create in the editor.
	CLASS_PerObjectConfig   = 0x00400,  // Handle object configuration on a per-object basis, rather than per-class.
	CLASS_NativeReplication = 0x00800,  // Replication handled in C++.

	// Flags to inherit from base class.
	CLASS_Inherit           = CLASS_Transient | CLASS_Config | CLASS_Localized | CLASS_SafeReplace | CLASS_RuntimeStatic | CLASS_PerObjectConfig,
	CLASS_RecompilerClear   = CLASS_Inherit | CLASS_Abstract | CLASS_NoExport | CLASS_NativeReplication,
};

//
// Flags associated with each property in a class, overriding the
// property's default behavior.
//
enum EPropertyFlags
{
	// Regular flags.
	CPF_Edit		 = 0x00000001, // Property is user-settable in the editor.
	CPF_Const		 = 0x00000002, // Actor's property always matches class's default actor property.
	CPF_Input		 = 0x00000004, // Variable is writable by the input system.
	CPF_ExportObject = 0x00000008, // Object can be exported with actor.
	CPF_OptionalParm = 0x00000010, // Optional parameter (if CPF_Param is set).
	CPF_Net			 = 0x00000020, // Property is relevant to network replication.
	CPF_ConstRef     = 0x00000040, // Reference to a constant object.
	CPF_Parm		 = 0x00000080, // Function/When call parameter.
	CPF_OutParm		 = 0x00000100, // Value is copied out after function call.
	CPF_SkipParm	 = 0x00000200, // Property is a short-circuitable evaluation function parm.
	CPF_ReturnParm	 = 0x00000400, // Return value.
	CPF_CoerceParm	 = 0x00000800, // Coerce args into this function parameter.
	CPF_Native       = 0x00001000, // Property is native: C++ code is responsible for serializing it.
	CPF_Transient    = 0x00002000, // Property is transient: shouldn't be saved, zero-filled at load time.
	CPF_Config       = 0x00004000, // Property should be loaded/saved as permanent profile.
	CPF_Localized    = 0x00008000, // Property should be loaded as localizable text.
	CPF_Travel       = 0x00010000, // Property travels across levels/servers.
	CPF_EditConst    = 0x00020000, // Property is uneditable in the editor.
	CPF_GlobalConfig = 0x00040000, // Load config from base class, not subclass.
	CPF_OnDemand     = 0x00100000, // Object or dynamic array loaded on demand only.
	CPF_New			 = 0x00200000, // Automatically create inner object.
	CPF_NeedCtorLink = 0x00400000, // Fields need construction/destruction.

	// Combinations of flags.
	CPF_ParmFlags           = CPF_OptionalParm | CPF_Parm | CPF_OutParm | CPF_SkipParm | CPF_ReturnParm | CPF_CoerceParm,
	CPF_PropagateFromStruct = CPF_Const | CPF_Native | CPF_Transient,
};

//
// Flags describing an object instance.
//
enum EObjectFlags
{
	RF_Transactional    = 0x00000001,   // Object is transactional.
	RF_Unreachable		= 0x00000002,	// Object is not reachable on the object graph.
	RF_Public			= 0x00000004,	// Object is visible outside its package.
	RF_TagImp			= 0x00000008,	// Temporary import tag in load/save.
	RF_TagExp			= 0x00000010,	// Temporary export tag in load/save.
	RF_SourceModified   = 0x00000020,   // Modified relative to source files.
	RF_TagGarbage		= 0x00000040,	// Check during garbage collection.
	//
	//
	RF_NeedLoad			= 0x00000200,   // During load, indicates object needs loading.
	RF_HighlightedName  = 0x00000400,	// A hardcoded name which should be syntax-highlighted.
	RF_EliminateObject  = 0x00000400,   // NULL out references to this during garbage collecion.
	RF_InSingularFunc   = 0x00000800,	// In a singular function.
	RF_RemappedName     = 0x00000800,   // Name is remapped.
	RF_Suppress         = 0x00001000,	//warning: Mirrored in UnName.h. Suppressed log name.
	RF_StateChanged     = 0x00001000,   // Object did a state change.
	RF_InEndState       = 0x00002000,   // Within an EndState call.
	RF_Transient        = 0x00004000,	// Don't save object.
	RF_Preloading       = 0x00008000,   // Data is being preloaded from file.
	RF_LoadForClient	= 0x00010000,	// In-file load for client.
	RF_LoadForServer	= 0x00020000,	// In-file load for client.
	RF_LoadForEdit		= 0x00040000,	// In-file load for client.
	RF_Standalone       = 0x00080000,   // Keep object around for editing even if unreferenced.
	RF_NotForClient		= 0x00100000,	// Don't load this object for the game client.
	RF_NotForServer		= 0x00200000,	// Don't load this object for the game server.
	RF_NotForEdit		= 0x00400000,	// Don't load this object for the editor.
	RF_Destroyed        = 0x00800000,	// Object Destroy has already been called.
	RF_NeedPostLoad		= 0x01000000,   // Object needs to be postloaded.
	RF_HasStack         = 0x02000000,	// Has execution stack.
	RF_Native			= 0x04000000,   // Native (UClass only).
	RF_Marked			= 0x08000000,   // Marked (for debugging).
	RF_ErrorShutdown    = 0x10000000,	// ShutdownAfterError called.
	RF_DebugPostLoad    = 0x20000000,   // For debugging Serialize calls.
	RF_DebugSerialize   = 0x40000000,   // For debugging Serialize calls.
	RF_DebugDestroy     = 0x80000000,   // For debugging Destroy calls.
	RF_ContextFlags		= RF_NotForClient | RF_NotForServer | RF_NotForEdit, // All context flags.
	RF_LoadContextFlags	= RF_LoadForClient | RF_LoadForServer | RF_LoadForEdit, // Flags affecting loading.
	RF_Load  			= RF_ContextFlags | RF_LoadContextFlags | RF_Public | RF_Standalone | RF_Native | RF_SourceModified | RF_Transactional | RF_HasStack, // Flags to load from Unrealfiles.
	RF_Keep             = RF_Native | RF_Marked, // Flags to persist across loads.
	RF_ScriptMask		= RF_Transactional | RF_Public | RF_Transient | RF_NotForClient | RF_NotForServer | RF_NotForEdit // Script-accessible flags.
};

/*----------------------------------------------------------------------------
	Core types.
----------------------------------------------------------------------------*/

//
// Globally unique identifier.
//
class CORE_API FGuid
{
public:
	DWORD A,B,C,D;
	FGuid()
	{}
	FGuid( DWORD InA, DWORD InB, DWORD InC, DWORD InD )
	: A(InA), B(InB), C(InC), D(InD)
	{}
	friend UBOOL operator==(const FGuid& X, const FGuid& Y)
		{return X.A==Y.A && X.B==Y.B && X.C==Y.C && X.D==Y.D;}
	friend UBOOL operator!=(const FGuid& X, const FGuid& Y)
		{return X.A!=Y.A || X.B!=Y.B || X.C!=Y.C || X.D!=Y.D;}
	friend FArchive& operator<<( FArchive& Ar, FGuid& G )
	{
		guard(FGuid<<);
		return Ar << G.A << G.B << G.C << G.D;
		unguard;
	}
	TCHAR* String() const
	{
		TCHAR* Result = appStaticString1024();
		appSprintf( Result, TEXT("%08X%08X%08X%08X"), A, B, C, D );
		return Result;
	}
};
inline INT CompareGuids( FGuid* A, FGuid* B )
{
	INT Diff;
	Diff = A->A-B->A; if( Diff ) return Diff;
	Diff = A->B-B->B; if( Diff ) return Diff;
	Diff = A->C-B->C; if( Diff ) return Diff;
	Diff = A->D-B->D; if( Diff ) return Diff;
	return 0;
}

//
// COM IUnknown interface.
//
class CORE_API FUnknown
{
public:
	virtual DWORD STDCALL QueryInterface( const FGuid& RefIID, void** InterfacePtr ) {return 0;}
	virtual DWORD STDCALL AddRef() {return 0;}
	virtual DWORD STDCALL Release() {return 0;}
};

//
// Information about a driver class.
//
class CORE_API FRegistryObjectInfo
{
public:
	FString Object;
	FString Class;
	FString MetaClass;
	FString Description;
	FString Autodetect;
	FRegistryObjectInfo()
	: Object(), Class(), MetaClass(), Description(), Autodetect()
	{}
};

//
// Information about a preferences menu item.
//
class CORE_API FPreferencesInfo
{
public:
	FString Caption;
	FString ParentCaption;
	FString Class;
	FName Category;
	UBOOL Immediate;
	FPreferencesInfo()
	: Caption(), ParentCaption(), Class(), Category(NAME_None), Immediate(0)
	{}
};

/*----------------------------------------------------------------------------
	Core macros.
----------------------------------------------------------------------------*/

// Special canonical package for FindObject, ParseObject.
#define ANY_PACKAGE ((UPackage*)-1)

// Define private default constructor.
#define NO_DEFAULT_CONSTRUCTOR(cls) \
	protected: cls() {} public:

// Guard macros.
#define unguardobjSlow		unguardfSlow(( TEXT("(%s)"), GetFullName() ))
#define unguardobj			unguardf(( TEXT("(%s)"), GetFullName() ))

// Verify the a class definition and C++ definition match up.
#define VERIFY_CLASS_OFFSET(Pre,ClassName,Member) \
	{for( TFieldIterator<UProperty> It( FindObjectChecked<UClass>( Pre##ClassName::StaticClass()->GetOuter(), TEXT(#ClassName) ) ); It; ++It ) \
		if( appStricmp(It->GetName(),TEXT(#Member))==0 ) \
			if( It->Offset != STRUCT_OFFSET(Pre##ClassName,Member) ) \
				appErrorf(TEXT("Class %s Member %s problem: Script=%i C++=%i"), TEXT(#ClassName), TEXT(#Member), It->Offset, STRUCT_OFFSET(Pre##ClassName,Member) );}

// Verify that C++ and script code agree on the size of a class.
#define VERIFY_CLASS_SIZE(ClassName) \
	check(sizeof(ClassName)==ClassName::StaticClass()->GetPropertiesSize());

// Declare the base UObject class.

#if !__STATIC_LINK
#define DECLARE_BASE_CLASS( TClass, TSuperClass, TStaticFlags, TPackage ) \
public: \
	/* Identification */ \
	enum {StaticClassFlags=TStaticFlags}; \
	private: static UClass PrivateStaticClass; public: \
	typedef TSuperClass Super;\
	typedef TClass ThisClass;\
	static UClass* StaticClass() \
		{ return &PrivateStaticClass; } \
	void* operator new( size_t Size, UObject* Outer=(UObject*)GetTransientPackage(), FName Name=NAME_None, DWORD SetFlags=0 ) \
		{ return StaticAllocateObject( StaticClass(), Outer, Name, SetFlags ); } \
	void* operator new( size_t Size, EInternal* Mem ) \
		{ return (void*)Mem; }
#else
#define DECLARE_BASE_CLASS( TClass, TSuperClass, TStaticFlags, TPackage ) \
public: \
	/* Identification */ \
	enum {StaticClassFlags=TStaticFlags}; \
	private: \
	static UClass* PrivateStaticClass; \
	public: \
	typedef TSuperClass Super;\
	typedef TClass ThisClass;\
	static UClass* GetPrivateStaticClass##TClass( TCHAR* Package ); \
	static void InitializePrivateStaticClass##TClass(); \
	static UClass* StaticClass() \
	{ \
		if (!PrivateStaticClass) \
		{ \
			PrivateStaticClass = GetPrivateStaticClass##TClass( TEXT(#TPackage) ); \
			InitializePrivateStaticClass##TClass(); \
		} \
		return PrivateStaticClass; \
	} \
	void* operator new( size_t Size, UObject* Outer=(UObject*)GetTransientPackage(), FName Name=NAME_None, DWORD SetFlags=0 ) \
		{ return StaticAllocateObject( StaticClass(), Outer, Name, SetFlags ); } \
	void* operator new( size_t Size, EInternal* Mem ) \
		{ return (void*)Mem; }
#endif

// Declare a concrete class.
#define DECLARE_CLASS( TClass, TSuperClass, TStaticFlags, TPackage ) \
	DECLARE_BASE_CLASS( TClass, TSuperClass, TStaticFlags, TPackage ) \
	friend FArchive &operator<<( FArchive& Ar, TClass*& Res ) \
		{ return Ar << *(UObject**)&Res; } \
	virtual ~TClass() \
		{ ConditionalDestroy(); } \
	static void InternalConstructor( void* X ) \
		{ new( (EInternal*)X )TClass(); } \

// Declare an abstract class.
#define DECLARE_ABSTRACT_CLASS( TClass, TSuperClass, TStaticFlags, TPackage ) \
	DECLARE_BASE_CLASS( TClass, TSuperClass, TStaticFlags | CLASS_Abstract, TPackage ) \
	friend FArchive &operator<<( FArchive& Ar, TClass*& Res ) \
		{ return Ar << *(UObject**)&Res; } \
	virtual ~TClass() \
		{ ConditionalDestroy(); } \

// Declare that objects of class being defined reside within objects of the specified class.
#define DECLARE_WITHIN( TWithinClass ) \
	typedef TWithinClass WithinClass; \
	TWithinClass* GetOuter##TWithinClass() const { return (TWithinClass*)GetOuter(); }

// Register a class at startup time.
#if _MSC_VER
	#define IMPLEMENT_CLASS(TClass) \
		UClass TClass::PrivateStaticClass \
		( \
			EC_NativeConstructor, \
			sizeof(TClass), \
			TClass::StaticClassFlags, \
			TClass::Super::StaticClass(), \
			TClass::WithinClass::StaticClass(), \
			FGuid(TClass::GUID1,TClass::GUID2,TClass::GUID3,TClass::GUID4), \
			TEXT(#TClass)+1, \
			GPackage, \
			StaticConfigName(), \
			RF_Public | RF_Standalone | RF_Transient | RF_Native, \
			(void(*)(void*))TClass::InternalConstructor, \
			(void(UObject::*)())TClass::StaticConstructor \
		); \
		extern "C" DLL_EXPORT UClass* autoclass##TClass;\
		DLL_EXPORT UClass* autoclass##TClass = TClass::StaticClass();
#elif !__STATIC_LINK
	#define IMPLEMENT_CLASS(TClass) \
		UClass TClass::PrivateStaticClass \
		( \
			EC_NativeConstructor, \
			sizeof(TClass), \
			TClass::StaticClassFlags, \
			TClass::Super::StaticClass(), \
			TClass::WithinClass::StaticClass(), \
			FGuid(TClass::GUID1,TClass::GUID2,TClass::GUID3,TClass::GUID4), \
			TEXT(#TClass)+1, \
			GPackage, \
			StaticConfigName(), \
			RF_Public | RF_Standalone | RF_Transient | RF_Native, \
			(void(*)(void*))TClass::InternalConstructor, \
			(void(UObject::*)())&TClass::StaticConstructor \
		); \
		DLL_EXPORT {UClass* autoclass##TClass = TClass::StaticClass();}
#else
	#define IMPLEMENT_CLASS(TClass) \
		UClass* TClass::PrivateStaticClass = NULL; \
		UClass* TClass::GetPrivateStaticClass##TClass( TCHAR* Package ) \
		{ \
			UClass* ReturnClass; \
			ReturnClass = ::new UClass \
			( \
				EC_StaticConstructor, \
				sizeof(TClass), \
				StaticClassFlags, \
				FGuid(GUID1,GUID2,GUID3,GUID4), \
				TEXT(#TClass)+1, \
				Package, \
				StaticConfigName(), \
				RF_Public | RF_Standalone | RF_Transient | RF_Native, \
				(void(*)(void*))TClass::InternalConstructor, \
				(void(UObject::*)())&TClass::StaticConstructor \
			); \
			check(ReturnClass); \
			return ReturnClass; \
		} \
		/* Called from ::StaticClass after GetPrivateStaticClass */ \
		void TClass::InitializePrivateStaticClass##TClass() \
		{ \
			/* No recursive ::StaticClass calls allowed. Setup extras. */ \
			if (TClass::Super::StaticClass() != TClass::PrivateStaticClass) \
				TClass::PrivateStaticClass->SuperField = TClass::Super::StaticClass(); \
			else \
				TClass::PrivateStaticClass->SuperField = NULL; \
			TClass::PrivateStaticClass->ClassWithin = TClass::WithinClass::StaticClass(); \
			TClass::PrivateStaticClass->SetClass(UClass::StaticClass()); \
			/* Perform UObject native registration. */ \
			if( TClass::PrivateStaticClass->GetInitialized() && TClass::PrivateStaticClass->GetClass()==TClass::PrivateStaticClass->StaticClass() ) \
				TClass::PrivateStaticClass->Register(); \
		}
#endif

// Define the package of the current DLL being compiled.
#if _MSC_VER
	#define IMPLEMENT_PACKAGE(pkg) \
		extern "C" DLL_EXPORT TCHAR GPackage[]; \
		DLL_EXPORT TCHAR GPackage[] = TEXT(#pkg); \
		IMPLEMENT_PACKAGE_PLATFORM(pkg)
#else
	#define IMPLEMENT_PACKAGE(pkg) \
	extern "C" DLL_EXPORT {TCHAR GPackage[] = TEXT(#pkg);} \
		IMPLEMENT_PACKAGE_PLATFORM(pkg)
#endif

/*
#------------------------------------------------------------------------------
*/
struct DLL_IMPORT FScriptDelegate
{
    unsigned char UnknownData00[ 0x8 ];
};

/*-----------------------------------------------------------------------------
	UObject.
-----------------------------------------------------------------------------*/

//
// The base class of all objects.
//
class CORE_API UObject
{
	typedef UObject WithinClass;
	enum {GUID1=0,GUID2=0,GUID3=0,GUID4=0};

	// Friends.
	friend class FObjectIterator;
	friend class PawnIterator;
	friend class ULinkerLoad;
	friend class ULinkerSave;
	friend class UPackageMap;
	friend class FArchiveTagUsed;
	friend struct FObjectImport;
	friend struct FObjectExport;

private:

    static TArray<int> GObjAvailable;
    static TArray<UObject *> GObjLoaded;
    static TArray<UObject *> GObjLoaders;
    static TArray<FRegistryObjectInfo> GObjDrivers;
    static TArray<UObject *> GObjObjects;
    static TArray<FPreferencesInfo> GObjPreferences;
    static TArray<UObject *> GObjRegistrants;
    static TArray<UObject *> GObjRoot;

    static int GObjBeginLoadCount;
    static int GObjInitialized;
    static int GObjNoRegister;
    static int GObjRegisterCount;
    static int GImportCount;
    static int ResolveName(UObject * &,unsigned short const * &,int,int);

    static unsigned short * GObjCachedLanguage;
    static unsigned short * GLanguage;

    static UObject * * GObjHash;
    static UObject * * GObjHashOuter;
    static UPackage * GObjTransientPkg;
    static ULinkerLoad * GetLoader(int);
    static UClass PrivateStaticClass;
    static UObject * GAutoRegister;
    static TMultiMap<FName,FName> * GObjPackageRemap;
    static FName MakeUniqueObjectName(UObject *,UClass *);

    void UnhashObject(int);
    void HashObject(void);
    void AddObject(int);

    static void PurgeGarbage(void);
    static void CacheDrivers(int);
    static void SafeLoadError(unsigned long,unsigned short const *,unsigned short const *,...);


public:

	INT ObjectInternal[6];
    UObject* Outer;
    INT ObjectFlags;
    FName* Name;
    UClass* Class;

    UObject(UObject const &);
    UObject(enum EInPlaceConstructor,UClass *,UObject *,FName,unsigned long);
    UObject(enum ENativeConstructor,UClass *,unsigned short const *,unsigned short const *,unsigned long);
    UObject(enum EStaticConstructor,unsigned short const *,unsigned short const *,unsigned long);
    UObject();
    static void *  operator new(unsigned int,UObject *,unsigned short *,unsigned long);
    static void *  operator new(unsigned int,UObject *,unsigned short const *,unsigned long);
    static void *  operator new(unsigned int,UObject *,FName,unsigned long);
    static void *  operator new(unsigned int,enum EInternal *);
    static void  operator delete(void *,unsigned int);
    UObject &  operator=(UObject const &);
    void  AddToRoot();
    static int  AttemptDelete(UObject * &,unsigned long,int);
    static void  BeginLoad();
    static void  BindPackage(class UPackage *);
    static void  CheckDanglingOuter(UObject *);
    static void  CheckDanglingRefs(UObject *);
    void  ClearConfig(UClass *,unsigned short const *);
    void  ClearFlags(unsigned long);
    static void  CollectGarbage(unsigned long);
    int  ConditionalDestroy();
    void  ConditionalPostLoad();
    void  ConditionalRegister();
    void  ConditionalShutdownAfterError();
    static UPackage *  CreatePackage(UObject *,unsigned short const *);
    static int  DeletePackage(unsigned short const *);
    static void  EndLoad();
    static void  ExitProperties(unsigned char *,UClass *);
    static void  ExportProperties(FOutputDevice &,UClass *,unsigned char *,int,UClass *,unsigned char *);
    int  FindArrayProperty(FString,FArray * *,int *);
    int  FindBoolProperty(FString,int *);
    int  FindFNameProperty(FString,FName *);
    int  FindFloatProperty(FString,float *);
    UFunction *  FindFunction(FName,int i=0);
    UFunction *  FindFunctionChecked(FName,int i=0);
    int  FindIntProperty(FString,int *);
    UField *  FindObjectField(FName,int);
    int  FindObjectProperty(FString,UObject * *);
    int  FindPointerProperty(FString,unsigned long *);
    UState *  FindState(FName);
    int  FindStructProperty(FString,UStruct * *);
    UClass *  GetClass()const;
    FName const  GetFName()const;
    unsigned long  GetFlags()const;
    unsigned short const *  GetFullName( TCHAR* Str=NULL )const;
    unsigned long  GetIndex()const;
    static UObject *  GetIndexedObject(int);
    static int  GetInitialized();
    static unsigned short const *  GetLanguage();
    ULinkerLoad *  GetLinker()const;
    int  GetLinkerIndex()const;
    static TArray<UObject *> GetLoaderList();
    unsigned short const *  GetName()const;
    UObject *  GetOuter()const;
    static ULinkerLoad *  GetPackageLinker(UObject *,unsigned short const *,unsigned long,UPackageMap *,FGuid *,int);
    unsigned short const *  GetPathName(UObject *,unsigned short *)const;
    static void  GetPreferences(TArray<FPreferencesInfo> &,unsigned short const *,int);
    static void GetReferencers(UObject *,TArray<UObject *> &);
    static void  GetRegistryObjects(TArray<FRegistryObjectInfo> &,UClass *,UClass *,int);
    static void  GetShortestRoute(UObject *,TArray<UObject *> &);
    struct FStateFrame *  GetStateFrame()const;
    static UPackage *  GetTransientPackage();
    static void  GlobalSetProperty(unsigned short const *,UClass *,UProperty *,int,int);
    void  InitClassDefaultObject(UClass *,int);
    static void  InitProperties(unsigned char *,int,UClass *,unsigned char *,int,UObject *,UObject *,int);
    static void  InternalConstructor(void *);
    int  IsA(UClass *)const;
    int  IsIn(UObject *)const;
    int  IsProbing(FName);
    static int  IsReferenced(UObject * &,unsigned long,int);
    int  IsValid();
    void  LoadConfig(int,UClass *,unsigned short const *,int,int,int,class UProperty *);
    void  LoadLocalized();
    static UObject *  LoadPackage(UObject *,unsigned short const *,unsigned long);
    void  ParseParms(unsigned short const *);
    void  ProcessInternal(struct FFrame &,void * const);
    static void  ProcessRegistrants();
    void  RemoveFromRoot();
    static void  ResetConfig(UClass *,unsigned short const *);
    static void  ResetLoaders(UObject *,int,int);
    void  SaveConfig(unsigned long,unsigned short const *);
    static int  SavePackage(UObject *,UObject *,unsigned long,unsigned short const *,FOutputDevice *,ULinkerLoad *);
    static void  SerializeRootSet(FArchive &,unsigned long,unsigned long);
    void  SetClass(UClass *);
    void  SetFlags(unsigned long);
    static void  SetLanguage(unsigned short const *);
    static UObject *  StaticAllocateObject(UClass * Class, UObject * InOuter=(UObject*)GetTransientPackage(), FName Name=NAME_None, DWORD SetFlags=0, UObject * Template=NULL, FOutputDevice * Error=GError, UObject * Ptr=NULL, UObject * unknown003=NULL);
    static UClass *  StaticClass();
    static unsigned short const *  StaticConfigName();
    static UObject *  StaticConstructObject(UClass *,UObject *,FName,unsigned long,UObject *,FOutputDevice *,UObject *);
    void  StaticConstructor();
    static int  StaticExec(unsigned short const *,FOutputDevice &);
    static void  StaticExit();
    static UObject *  StaticFindObject(UClass *,UObject *,unsigned short const *,UBOOL ExactClass=0);
    static UObject *  StaticFindObjectChecked(UClass *,UObject *,unsigned short const *,UBOOL ExactClass=0);
    static UObject *  StaticFindObjectFast(UClass *,UObject *,FName,int,int);
    static void  StaticInit();
    static UClass *  StaticLoadClass(UClass *,UObject *,unsigned short const *,unsigned short const *,unsigned long,class UPackageMap *);
    static UObject *  StaticLoadObject(UClass *,UObject *,unsigned short const *,unsigned short const *,unsigned long,class UPackageMap *);
    static void  StaticShutdownAfterError();
    static void  StaticTick();
    static void  VerifyLinker(ULinkerLoad *);

	virtual unsigned long QueryInterface(FGuid const &,void * *);
	virtual unsigned long AddRef(void);
	virtual unsigned long Release(void);
	virtual ~UObject(void);
	virtual void SetLinker(ULinkerLoad *,int);
	virtual void ProcessEvent(UFunction *,void *,void *);
	virtual void ProcessDelegate(FName,struct FScriptDelegate *,void *,void *);
	virtual void ProcessState(float);
	virtual int ProcessRemoteFunction(UFunction *,void *,struct FFrame *);
	virtual void Modify(void);
	virtual void PostLoad(void);
	virtual void Destroy(void);
	virtual void Serialize(FArchive &);
	virtual int IsPendingKill(void);
	virtual enum EGotoState GotoState(FName);
	virtual int GotoLabel(FName);
	virtual void ScriptInit(void* LevelInfo);
	virtual void InitExecution(void);
	virtual void ShutdownAfterError(void);
	virtual void PostEditChange(void);
	virtual void PreEditUndo(void);
	virtual void PostEditUndo(void);
	virtual void CallFunction(struct FFrame &,void * const,UFunction *);
	virtual int ScriptConsoleExec(unsigned short const *,FOutputDevice &,UObject *);
	virtual void Register(void);
	virtual void LanguageChange(void);
	virtual void Rename(unsigned short const *,UObject *);
	virtual void NetDirty(UProperty *);
	virtual void ExecutingBadStateCode(struct FFrame &);

	#define DECLARE_FUNCTION(func) void func( FFrame& TheStack, RESULT_DECL );

	// UScript Functions
	 void                      NotifyDestroyed ( class AActor* A );              		//  Core.Object.NotifyDestroyed
	 void                      ZeroVector ( struct FVector* V );                 		//  Core.Object.ZeroVector
	 bool                      IsZeroVector ( struct FVector* V );               		//  Core.Object.IsZeroVector
	 float                     Pow ( float A, int B );                           		//  Core.Object.Pow
	 bool                      StrStartsWith ( struct FString str, struct FString startStr );		//  Core.Object.StrStartsWith
	 struct FString            PadRight ( struct FString str, int totalDigits, struct FString paddingChar );		// [ FUNC_Simulated ] Core.Object.PadRight
	 struct FString            PadLeft ( struct FString str, int totalDigits, struct FString paddingChar );		// [ FUNC_Simulated ] Core.Object.PadLeft
	 struct FString            PadString ( struct FString str, int totalDigits, struct FString paddingChar );		// [ FUNC_Simulated ] Core.Object.PadString
	 void                      slog ( struct FString S );                        		//  Core.Object.slog
	 struct FVector            MakeVector ( float X, float Y, float Z );         		//  Core.Object.MakeVector
	 void                      EatStr ( int Num, struct FString* Dest, struct FString* Source );		// [ FUNC_Final ] Core.Object.EatStr
	 void                      ReplaceText ( struct FString Replace, struct FString With, struct FString* Text );		// [ FUNC_Final | FUNC_Simulated ] Core.Object.ReplaceText
	 struct FString            GetItemName ( struct FString FullName );          		// [ FUNC_Simulated ] Core.Object.GetItemName
	 void                      GetDatefromString ( struct FString _char, bool bFull, struct FString* in );		// [ FUNC_Simulated ] Core.Object.GetDatefromString
	 void                      GetReferencers ( class UObject* Target, class TArray< class UObject* >* Referencers );		// [ FUNC_Final | FUNC_Native ] Core.Object.GetReferencers
	 void                      AllObjects ( class UClass* baseClass, class UObject** obj );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00C5 ] Core.Object.AllObjects
	 void                      eventCreated (  );                                		// [ FUNC_Event ] Core.Object.Created
	 void                      eventEndState (  );                               		// [ FUNC_Event ] Core.Object.EndState
	 void                      eventBeginState (  );                             		// [ FUNC_Event ] Core.Object.BeginState
	 struct FString            GetErrMsg ( int ErrCode );                        		// [ FUNC_Final | FUNC_Native ] Core.Object.GetErrMsg
	 int                       GetLastErrCode (  );                              		// [ FUNC_Final | FUNC_Native ] Core.Object.GetLastErrCode
	 bool                      PlatformIs64Bit (  );                             		// [ FUNC_Final | FUNC_Native ] Core.Object.PlatformIs64Bit
	 bool                      PlatformIsWindows (  );                           		// [ FUNC_Final | FUNC_Native ] Core.Object.PlatformIsWindows
	 bool                      PlatformIsUnix (  );                              		// [ FUNC_Final | FUNC_Native ] Core.Object.PlatformIsUnix
	 bool                      PlatformIsMacOS (  );                             		// [ FUNC_Final | FUNC_Native ] Core.Object.PlatformIsMacOS
	 bool                      IsSoaking (  );                                   		// [ FUNC_Final | FUNC_Native ] Core.Object.IsSoaking
	 bool                      IsOnConsole (  );                                 		// [ FUNC_Final | FUNC_Native ] Core.Object.IsOnConsole
	 void                      StopWatch ( bool bStop );                         		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0217 ] Core.Object.StopWatch
	 float                     RandRange ( float Min, float Max );               		// [ FUNC_Final ] Core.Object.RandRange
	 class TArray< struct FString > GetPerObjectNames ( struct FString ININame, struct FString ObjectClass, int MaxResults );		// [ FUNC_Final | FUNC_Native ] Core.Object.GetPerObjectNames
	 void                      StaticClearConfig ( struct FString PropName );    		// [ FUNC_Final | FUNC_Native ] Core.Object.StaticClearConfig
	 void                      ResetConfig ( struct FString PropName );          		// [ FUNC_Final | FUNC_Native ] Core.Object.ResetConfig
	 void                      StaticSaveConfig (  );                            		// [ FUNC_Final | FUNC_Native ] Core.Object.StaticSaveConfig
	 void                      ClearConfig ( struct FString PropName );          		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0219 ] Core.Object.ClearConfig
	 void                      SaveConfig (  );                                  		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0218 ] Core.Object.SaveConfig
	 class UObject*            FindObject ( struct FString ObjectName, class UClass* ObjectClass );		// [ FUNC_Final | FUNC_Native ] Core.Object.FindObject
	 class UObject*            DynamicLoadObject ( struct FString ObjectName, class UClass* ObjectClass, bool MayFail );		// [ FUNC_Final | FUNC_Native ] Core.Object.DynamicLoadObject
	 struct FName              GetEnum ( class UObject* E, int i );              		// [ FUNC_Final | FUNC_Native ] Core.Object.GetEnum
	 bool                      SetPropertyText ( struct FString PropName, struct FString PropValue );		// [ FUNC_Final | FUNC_Native ] Core.Object.SetPropertyText
	 struct FString            GetPropertyText ( struct FString PropName );      		// [ FUNC_Final | FUNC_Native ] Core.Object.GetPropertyText
	 void                      Disable ( struct FName ProbeFunc );               		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0076 ] Core.Object.Disable
	 void                      Enable ( struct FName ProbeFunc );                		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0075 ] Core.Object.Enable
	 bool                      IsA ( struct FName ClassName );                   		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x012F ] Core.Object.IsA
	 bool                      ClassIsChildOf ( class UClass* TestClass, class UClass* ParentClass );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0102 ] Core.Object.ClassIsChildOf
	 struct FName              GetStateName (  );                                		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x011C ] Core.Object.GetStateName
	 bool                      IsInState ( struct FName TestState );             		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0119 ] Core.Object.IsInState
	 void                      GotoState ( struct FName NewState, struct FName Label );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0071 ] Core.Object.GotoState
	 void                      ResetCombatLog (  );                              		// [ FUNC_Final | FUNC_Native ] Core.Object.ResetCombatLog
	 void                      CombatLog ( struct FString S, struct FName Tag ); 		// [ FUNC_Final | FUNC_Native ] Core.Object.CombatLog
	 void                      CrashLog ( struct FString S, struct FName Tag );  		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x010E ] Core.Object.CrashLog
	 struct FString            Localize ( struct FString SectionName, struct FString KeyName, struct FString PackageName );		// [ FUNC_Native ] Core.Object.Localize
	 void                      Warn ( struct FString S );                        		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00E8 ] Core.Object.Warn
	 void                      Log ( struct FString S, struct FName Tag );       		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00E7 ] Core.Object.Log
	 struct FQuat              QuatSlerp ( struct FQuat A, struct FQuat B, float Slerp );		// [ FUNC_Final | FUNC_Native ] Core.Object.QuatSlerp
	 struct FRotator           QuatToRotator ( struct FQuat A );                 		// [ FUNC_Final | FUNC_Native ] Core.Object.QuatToRotator
	 struct FQuat              QuatFromRotator ( struct FRotator A );            		// [ FUNC_Final | FUNC_Native ] Core.Object.QuatFromRotator
	 struct FQuat              QuatFromAxisAndAngle ( struct FVector Axis, float Angle );		// [ FUNC_Final | FUNC_Native ] Core.Object.QuatFromAxisAndAngle
	 struct FQuat              QuatFindBetween ( struct FVector A, struct FVector B );		// [ FUNC_Final | FUNC_Native ] Core.Object.QuatFindBetween
	 struct FVector            QuatRotateVector ( struct FQuat A, struct FVector B );		// [ FUNC_Final | FUNC_Native ] Core.Object.QuatRotateVector
	 struct FQuat              QuatInvert ( struct FQuat A );                    		// [ FUNC_Final | FUNC_Native ] Core.Object.QuatInvert
	 struct FQuat              QuatProduct ( struct FQuat A, struct FQuat B );   		// [ FUNC_Final | FUNC_Native ] Core.Object.QuatProduct
	 void                      InterpCurveGetInputDomain ( struct FInterpCurve curve, float* Min, float* Max );		// [ FUNC_Final | FUNC_Native ] Core.Object.InterpCurveGetInputDomain
	 void                      InterpCurveGetOutputRange ( struct FInterpCurve curve, float* Min, float* Max );		// [ FUNC_Final | FUNC_Native ] Core.Object.InterpCurveGetOutputRange
	 float                     InterpCurveEval ( struct FInterpCurve curve, float Input );		// [ FUNC_Final | FUNC_Native ] Core.Object.InterpCurveEval
	 bool                      NotEqual_BtrDoubleInt ( struct FBtrDouble A, int B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0398 ] Core.Object.NotEqual_BtrDoubleInt
	 bool                      EqualEqual_BtrDoubleInt ( struct FBtrDouble A, int B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0397 ] Core.Object.EqualEqual_BtrDoubleInt
	 bool                      Less_BtrDoubleBtrDouble ( struct FBtrDouble A, struct FBtrDouble B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x039A ] Core.Object.Less_BtrDoubleBtrDouble
	 struct FBtrDouble         StringToBtrDouble ( struct FString A );           		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x039C ] Core.Object.StringToBtrDouble
	 int                       BtrDoubleToInt ( struct FBtrDouble A );           		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x039B ] Core.Object.BtrDoubleToInt
	 struct FBtrDouble         IntToBtrDouble ( int A );                         		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0399 ] Core.Object.IntToBtrDouble
	 struct FString            BtrDoubleGetToStr ( struct FBtrDouble A );        		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0396 ] Core.Object.BtrDoubleGetToStr
	 struct FBtrDouble         SubtractEqual_BtrDoubleBtrDouble ( struct FBtrDouble B, struct FBtrDouble* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0395 ] Core.Object.SubtractEqual_BtrDoubleBtrDouble
	 struct FBtrDouble         AddEqual_BtrDoubleBtrDouble ( struct FBtrDouble B, struct FBtrDouble* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0394 ] Core.Object.AddEqual_BtrDoubleBtrDouble
	 struct FBtrDouble         DivideEqual_BtrDoubleBtrDouble ( struct FBtrDouble B, struct FBtrDouble* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0393 ] Core.Object.DivideEqual_BtrDoubleBtrDouble
	 struct FBtrDouble         MultiplyEqual_BtrDoubleBtrDouble ( struct FBtrDouble B, struct FBtrDouble* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0392 ] Core.Object.MultiplyEqual_BtrDoubleBtrDouble
	 bool                      NotEqual_BtrDoubleBtrDouble ( struct FBtrDouble A, struct FBtrDouble B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0391 ] Core.Object.NotEqual_BtrDoubleBtrDouble
	 bool                      EqualEqual_BtrDoubleBtrDouble ( struct FBtrDouble A, struct FBtrDouble B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0390 ] Core.Object.EqualEqual_BtrDoubleBtrDouble
	 struct FBtrDouble         Subtract_BtrDoubleFloat ( struct FBtrDouble A, float B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x038F ] Core.Object.Subtract_BtrDoubleFloat
	 struct FBtrDouble         Subtract_BtrDoubleInt ( struct FBtrDouble A, int B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x038E ] Core.Object.Subtract_BtrDoubleInt
	 struct FBtrDouble         Subtract_BtrDoubleBtrDouble ( struct FBtrDouble A, struct FBtrDouble B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x038D ] Core.Object.Subtract_BtrDoubleBtrDouble
	 struct FBtrDouble         Add_BtrDoubleFloat ( struct FBtrDouble A, float B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x038C ] Core.Object.Add_BtrDoubleFloat
	 struct FBtrDouble         Add_BtrDoubleInt ( struct FBtrDouble A, int B );  		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x038B ] Core.Object.Add_BtrDoubleInt
	 struct FBtrDouble         Add_BtrDoubleBtrDouble ( struct FBtrDouble A, struct FBtrDouble B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x038A ] Core.Object.Add_BtrDoubleBtrDouble
	 struct FBtrDouble         Divide_BtrDoubleFloat ( struct FBtrDouble A, float B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0389 ] Core.Object.Divide_BtrDoubleFloat
	 struct FBtrDouble         Divide_BtrDoubleInt ( struct FBtrDouble A, int B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0388 ] Core.Object.Divide_BtrDoubleInt
	 struct FBtrDouble         Divide_BtrDoubleBtrDouble ( struct FBtrDouble A, struct FBtrDouble B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0387 ] Core.Object.Divide_BtrDoubleBtrDouble
	 struct FBtrDouble         Multiply_BtrDoubleFloat ( struct FBtrDouble A, float B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0386 ] Core.Object.Multiply_BtrDoubleFloat
	 struct FBtrDouble         Multiply_BtrDoubleInt ( struct FBtrDouble A, int B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0385 ] Core.Object.Multiply_BtrDoubleInt
	 struct FBtrDouble         Multiply_BtrDoubleBtrDouble ( struct FBtrDouble A, struct FBtrDouble B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0384 ] Core.Object.Multiply_BtrDoubleBtrDouble
	 bool                      NotEqual_NameName ( struct FName A, struct FName B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00FF ] Core.Object.NotEqual_NameName
	 bool                      EqualEqual_NameName ( struct FName A, struct FName B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00FE ] Core.Object.EqualEqual_NameName
	 bool                      NotEqual_ObjectObject ( class UObject* A, class UObject* B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0077 ] Core.Object.NotEqual_ObjectObject
	 bool                      EqualEqual_ObjectObject ( class UObject* A, class UObject* B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0072 ] Core.Object.EqualEqual_ObjectObject
	 struct FString            Eval ( bool Condition, struct FString ResultIfTrue, struct FString ResultIfFalse );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00CA ] Core.Object.Eval
	 struct FString            Repl ( struct FString Src, struct FString Match, struct FString With, bool bCaseSensitive );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00C9 ] Core.Object.Repl
	 int                       StrCmp ( struct FString S, struct FString t, int Count, bool bCaseSensitive );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00C8 ] Core.Object.StrCmp
	 int                       KeyCode ( struct FString S, int i );              		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00F1 ] Core.Object.KeyCode
	 int                       Split ( struct FString Src, struct FString Divider, class TArray< struct FString >* Parts );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00F0 ] Core.Object.Split
	 bool                      Divide ( struct FString Src, struct FString Divider, struct FString* LeftPart, struct FString* RightPart );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00EF ] Core.Object.Divide
	 struct FString            Locs ( struct FString S );                        		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00EE ] Core.Object.Locs
	 int                       Asc ( struct FString S );                         		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00ED ] Core.Object.Asc
	 struct FString            Chr ( int i );                                    		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00EC ] Core.Object.Chr
	 struct FString            Caps ( struct FString S );                        		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00EB ] Core.Object.Caps
	 struct FString            Right ( struct FString S, int i );                		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00EA ] Core.Object.Right
	 struct FString            Left ( struct FString S, int i );                 		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0080 ] Core.Object.Left
	 struct FString            Mid ( struct FString S, int i, int j );           		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x007F ] Core.Object.Mid
	 int                       InStr ( struct FString S, struct FString t );     		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x007E ] Core.Object.InStr
	 int                       Len ( struct FString S );                         		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x007D ] Core.Object.Len
	 struct FString            SubtractEqual_StrStr ( struct FString B, struct FString* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0144 ] Core.Object.SubtractEqual_StrStr
	 struct FString            AtEqual_StrStr ( struct FString B, struct FString* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0143 ] Core.Object.AtEqual_StrStr
	 struct FString            ConcatEqual_StrStr ( struct FString B, struct FString* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0142 ] Core.Object.ConcatEqual_StrStr
	 bool                      ComplementEqual_StrStr ( struct FString A, struct FString B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x007C ] Core.Object.ComplementEqual_StrStr
	 bool                      NotEqual_StrStr ( struct FString A, struct FString B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x007B ] Core.Object.NotEqual_StrStr
	 bool                      EqualEqual_StrStr ( struct FString A, struct FString B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x007A ] Core.Object.EqualEqual_StrStr
	 bool                      GreaterEqual_StrStr ( struct FString A, struct FString B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0079 ] Core.Object.GreaterEqual_StrStr
	 bool                      LessEqual_StrStr ( struct FString A, struct FString B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0078 ] Core.Object.LessEqual_StrStr
	 bool                      Greater_StrStr ( struct FString A, struct FString B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0074 ] Core.Object.Greater_StrStr
	 bool                      Less_StrStr ( struct FString A, struct FString B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0073 ] Core.Object.Less_StrStr
	 struct FString            At_StrStr ( struct FString A, struct FString B ); 		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00A8 ] Core.Object.At_StrStr
	 struct FString            Concat_StrStr ( struct FString A, struct FString B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0070 ] Core.Object.Concat_StrStr
	 bool                      ClockwiseFrom_IntInt ( int A, int B );            		// [ FUNC_Final | FUNC_Native ] Core.Object.ClockwiseFrom_IntInt
	 struct FRotator           Normalize ( struct FRotator Rot );                		// [ FUNC_Final | FUNC_Native ] Core.Object.Normalize
	 struct FRotator           OrthoRotation ( struct FVector X, struct FVector Y, struct FVector Z );		// [ FUNC_Final | FUNC_Native ] Core.Object.OrthoRotation
	 struct FRotator           RotRand ( bool bRoll );                           		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0140 ] Core.Object.RotRand
	 void                      GetUnAxes ( struct FRotator A, struct FVector* X, struct FVector* Y, struct FVector* Z );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00E6 ] Core.Object.GetUnAxes
	 void                      GetAxes ( struct FRotator A, struct FVector* X, struct FVector* Y, struct FVector* Z );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00E5 ] Core.Object.GetAxes
	 struct FRotator           SubtractEqual_RotatorRotator ( struct FRotator B, struct FRotator* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x013F ] Core.Object.SubtractEqual_RotatorRotator
	 struct FRotator           AddEqual_RotatorRotator ( struct FRotator B, struct FRotator* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x013E ] Core.Object.AddEqual_RotatorRotator
	 struct FRotator           Subtract_RotatorRotator ( struct FRotator A, struct FRotator B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x013D ] Core.Object.Subtract_RotatorRotator
	 struct FRotator           Add_RotatorRotator ( struct FRotator A, struct FRotator B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x013C ] Core.Object.Add_RotatorRotator
	 struct FRotator           DivideEqual_RotatorFloat ( float B, struct FRotator* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0123 ] Core.Object.DivideEqual_RotatorFloat
	 struct FRotator           MultiplyEqual_RotatorFloat ( float B, struct FRotator* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0122 ] Core.Object.MultiplyEqual_RotatorFloat
	 struct FRotator           Divide_RotatorFloat ( struct FRotator A, float B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0121 ] Core.Object.Divide_RotatorFloat
	 struct FRotator           Multiply_FloatRotator ( float A, struct FRotator B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0120 ] Core.Object.Multiply_FloatRotator
	 struct FRotator           Multiply_RotatorFloat ( struct FRotator A, float B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x011F ] Core.Object.Multiply_RotatorFloat
	 bool                      NotEqual_RotatorRotator ( struct FRotator A, struct FRotator B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00CB ] Core.Object.NotEqual_RotatorRotator
	 bool                      EqualEqual_RotatorRotator ( struct FRotator A, struct FRotator B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x008E ] Core.Object.EqualEqual_RotatorRotator
	 struct FVector            MirrorVectorByNormal ( struct FVector Vect, struct FVector Normal );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x012C ] Core.Object.MirrorVectorByNormal
	 struct FVector            VRand (  );                                       		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00FC ] Core.Object.VRand
	 void                      Invert ( struct FVector* X, struct FVector* Y, struct FVector* Z );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00E3 ] Core.Object.Invert
	 struct FVector            Normal ( struct FVector A );                      		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00E2 ] Core.Object.Normal
	 float                     VSize ( struct FVector A );                       		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00E1 ] Core.Object.VSize
	 struct FVector            SubtractEqual_VectorVector ( struct FVector B, struct FVector* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00E0 ] Core.Object.SubtractEqual_VectorVector
	 struct FVector            AddEqual_VectorVector ( struct FVector B, struct FVector* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00DF ] Core.Object.AddEqual_VectorVector
	 struct FVector            DivideEqual_VectorFloat ( float B, struct FVector* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00DE ] Core.Object.DivideEqual_VectorFloat
	 struct FVector            MultiplyEqual_VectorVector ( struct FVector B, struct FVector* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0129 ] Core.Object.MultiplyEqual_VectorVector
	 struct FVector            MultiplyEqual_VectorFloat ( float B, struct FVector* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00DD ] Core.Object.MultiplyEqual_VectorFloat
	 struct FVector            Cross_VectorVector ( struct FVector A, struct FVector B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00DC ] Core.Object.Cross_VectorVector
	 float                     Dot_VectorVector ( struct FVector A, struct FVector B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00DB ] Core.Object.Dot_VectorVector
	 bool                      NotEqual_VectorVector ( struct FVector A, struct FVector B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00DA ] Core.Object.NotEqual_VectorVector
	 bool                      EqualEqual_VectorVector ( struct FVector A, struct FVector B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00D9 ] Core.Object.EqualEqual_VectorVector
	 struct FVector            GreaterGreater_VectorRotator ( struct FVector A, struct FRotator B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0114 ] Core.Object.GreaterGreater_VectorRotator
	 struct FVector            LessLess_VectorRotator ( struct FVector A, struct FRotator B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0113 ] Core.Object.LessLess_VectorRotator
	 struct FVector            Subtract_VectorVector ( struct FVector A, struct FVector B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00D8 ] Core.Object.Subtract_VectorVector
	 struct FVector            Add_VectorVector ( struct FVector A, struct FVector B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00D7 ] Core.Object.Add_VectorVector
	 struct FVector            Divide_VectorFloat ( struct FVector A, float B ); 		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00D6 ] Core.Object.Divide_VectorFloat
	 struct FVector            Multiply_VectorVector ( struct FVector A, struct FVector B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0128 ] Core.Object.Multiply_VectorVector
	 struct FVector            Multiply_FloatVector ( float A, struct FVector B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00D5 ] Core.Object.Multiply_FloatVector
	 struct FVector            Multiply_VectorFloat ( struct FVector A, float B );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00D4 ] Core.Object.Multiply_VectorFloat
	 struct FVector            Subtract_PreVector ( struct FVector A );          		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00D3 ] Core.Object.Subtract_PreVector
	 float                     Round ( float A );                                		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0101 ] Core.Object.Round
	 float                     Ceil ( float A );                                 		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00FD ] Core.Object.Ceil
	 float                     Smerp ( float Alpha, float A, float B );          		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00F8 ] Core.Object.Smerp
	 float                     Lerp ( float Alpha, float A, float B, bool bClampRange );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00F7 ] Core.Object.Lerp
	 float                     FClamp ( float V, float A, float B );             		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00F6 ] Core.Object.FClamp
	 float                     FMax ( float A, float B );                        		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00F5 ] Core.Object.FMax
	 float                     FMin ( float A, float B );                        		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00F4 ] Core.Object.FMin
	 float                     FRand (  );                                       		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00C3 ] Core.Object.FRand
	 float                     Square ( float A );                               		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00C2 ] Core.Object.Square
	 float                     Sqrt ( float A );                                 		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00C1 ] Core.Object.Sqrt
	 float                     Loge ( float A );                                 		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00C0 ] Core.Object.Loge
	 float                     Exp ( float A );                                  		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00BF ] Core.Object.Exp
	 float                     Atan ( float A, float B );                        		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00BE ] Core.Object.Atan
	 float                     Tan ( float A );                                  		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00BD ] Core.Object.Tan
	 float                     Acos ( float A );                                 		// [ FUNC_Final | FUNC_Native ] Core.Object.Acos
	 float                     Cos ( float A );                                  		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00BC ] Core.Object.Cos
	 float                     Asin ( float A );                                 		// [ FUNC_Final | FUNC_Native ] Core.Object.Asin
	 float                     Sin ( float A );                                  		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00BB ] Core.Object.Sin
	 float                     Abs ( float A );                                  		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00BA ] Core.Object.Abs
	 float                     SubtractEqual_FloatFloat ( float B, float* A );   		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00B9 ] Core.Object.SubtractEqual_FloatFloat
	 float                     AddEqual_FloatFloat ( float B, float* A );        		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00B8 ] Core.Object.AddEqual_FloatFloat
	 float                     DivideEqual_FloatFloat ( float B, float* A );     		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00B7 ] Core.Object.DivideEqual_FloatFloat
	 float                     MultiplyEqual_FloatFloat ( float B, float* A );   		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00B6 ] Core.Object.MultiplyEqual_FloatFloat
	 bool                      NotEqual_FloatFloat ( float A, float B );         		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00B5 ] Core.Object.NotEqual_FloatFloat
	 bool                      ComplementEqual_FloatFloat ( float A, float B );  		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00D2 ] Core.Object.ComplementEqual_FloatFloat
	 bool                      EqualEqual_FloatFloat ( float A, float B );       		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00B4 ] Core.Object.EqualEqual_FloatFloat
	 bool                      GreaterEqual_FloatFloat ( float A, float B );     		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00B3 ] Core.Object.GreaterEqual_FloatFloat
	 bool                      LessEqual_FloatFloat ( float A, float B );        		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00B2 ] Core.Object.LessEqual_FloatFloat
	 bool                      Greater_FloatFloat ( float A, float B );          		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00B1 ] Core.Object.Greater_FloatFloat
	 bool                      Less_FloatFloat ( float A, float B );             		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00B0 ] Core.Object.Less_FloatFloat
	 float                     Subtract_FloatFloat ( float A, float B );         		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00AF ] Core.Object.Subtract_FloatFloat
	 float                     Add_FloatFloat ( float A, float B );              		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00AE ] Core.Object.Add_FloatFloat
	 float                     Percent_FloatFloat ( float A, float B );          		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00AD ] Core.Object.Percent_FloatFloat
	 float                     Divide_FloatFloat ( float A, float B );           		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00AC ] Core.Object.Divide_FloatFloat
	 float                     Multiply_FloatFloat ( float A, float B );         		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00AB ] Core.Object.Multiply_FloatFloat
	 float                     MultiplyMultiply_FloatFloat ( float A, float B ); 		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00AA ] Core.Object.MultiplyMultiply_FloatFloat
	 float                     Subtract_PreFloat ( float A );                    		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00A9 ] Core.Object.Subtract_PreFloat
	 int                       Clamp ( int V, int A, int B );                    		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00FB ] Core.Object.Clamp
	 int                       Max ( int A, int B );                             		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00FA ] Core.Object.Max
	 int                       Min ( int A, int B );                             		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00F9 ] Core.Object.Min
	 void                      SRand ( int Seed );                               		// [ FUNC_Final | FUNC_Native ] Core.Object.SRand
	 int                       Rand ( int Max );                                 		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00A7 ] Core.Object.Rand
	 int                       SubtractSubtract_Int ( int* A );                  		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00A6 ] Core.Object.SubtractSubtract_Int
	 int                       AddAdd_Int ( int* A );                            		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00A5 ] Core.Object.AddAdd_Int
	 int                       SubtractSubtract_PreInt ( int* A );               		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00A4 ] Core.Object.SubtractSubtract_PreInt
	 int                       AddAdd_PreInt ( int* A );                         		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00A3 ] Core.Object.AddAdd_PreInt
	 int                       SubtractEqual_IntInt ( int B, int* A );           		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00A2 ] Core.Object.SubtractEqual_IntInt
	 int                       AddEqual_IntInt ( int B, int* A );                		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00A1 ] Core.Object.AddEqual_IntInt
	 int                       DivideEqual_IntFloat ( float B, int* A );         		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00A0 ] Core.Object.DivideEqual_IntFloat
	 int                       MultiplyEqual_IntFloat ( float B, int* A );       		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x009F ] Core.Object.MultiplyEqual_IntFloat
	 int                       Or_IntInt ( int A, int B );                       		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x009E ] Core.Object.Or_IntInt
	 int                       Xor_IntInt ( int A, int B );                      		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x009D ] Core.Object.Xor_IntInt
	 int                       And_IntInt ( int A, int B );                      		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x009C ] Core.Object.And_IntInt
	 bool                      NotEqual_IntInt ( int A, int B );                 		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x009B ] Core.Object.NotEqual_IntInt
	 bool                      EqualEqual_IntInt ( int A, int B );               		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x009A ] Core.Object.EqualEqual_IntInt
	 bool                      GreaterEqual_IntInt ( int A, int B );             		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0099 ] Core.Object.GreaterEqual_IntInt
	 bool                      LessEqual_IntInt ( int A, int B );                		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0098 ] Core.Object.LessEqual_IntInt
	 bool                      Greater_IntInt ( int A, int B );                  		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0097 ] Core.Object.Greater_IntInt
	 bool                      Less_IntInt ( int A, int B );                     		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0096 ] Core.Object.Less_IntInt
	 int                       GreaterGreaterGreater_IntInt ( int A, int B );    		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00C4 ] Core.Object.GreaterGreaterGreater_IntInt
	 int                       GreaterGreater_IntInt ( int A, int B );           		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0095 ] Core.Object.GreaterGreater_IntInt
	 int                       LessLess_IntInt ( int A, int B );                 		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0094 ] Core.Object.LessLess_IntInt
	 int                       Subtract_IntInt ( int A, int B );                 		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0093 ] Core.Object.Subtract_IntInt
	 int                       Add_IntInt ( int A, int B );                      		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0092 ] Core.Object.Add_IntInt
	 int                       Divide_IntInt ( int A, int B );                   		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0091 ] Core.Object.Divide_IntInt
	 int                       Multiply_IntInt ( int A, int B );                 		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0090 ] Core.Object.Multiply_IntInt
	 int                       Subtract_PreInt ( int A );                        		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x008F ] Core.Object.Subtract_PreInt
	 int                       Complement_PreInt ( int A );                      		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x008D ] Core.Object.Complement_PreInt
	 unsigned char             SubtractSubtract_Byte ( unsigned char* A );       		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x008C ] Core.Object.SubtractSubtract_Byte
	 unsigned char             AddAdd_Byte ( unsigned char* A );                 		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x008B ] Core.Object.AddAdd_Byte
	 unsigned char             SubtractSubtract_PreByte ( unsigned char* A );    		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x008A ] Core.Object.SubtractSubtract_PreByte
	 unsigned char             AddAdd_PreByte ( unsigned char* A );              		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0089 ] Core.Object.AddAdd_PreByte
	 unsigned char             SubtractEqual_ByteByte ( unsigned char B, unsigned char* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0088 ] Core.Object.SubtractEqual_ByteByte
	 unsigned char             AddEqual_ByteByte ( unsigned char B, unsigned char* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0087 ] Core.Object.AddEqual_ByteByte
	 unsigned char             DivideEqual_ByteByte ( unsigned char B, unsigned char* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0086 ] Core.Object.DivideEqual_ByteByte
	 unsigned char             MultiplyEqual_ByteByte ( unsigned char B, unsigned char* A );		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0085 ] Core.Object.MultiplyEqual_ByteByte
	 bool                      OrOr_BoolBool ( bool A, bool B );                 		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0084 ] Core.Object.OrOr_BoolBool
	 bool                      XorXor_BoolBool ( bool A, bool B );               		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0083 ] Core.Object.XorXor_BoolBool
	 bool                      AndAnd_BoolBool ( bool A, bool B );               		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0082 ] Core.Object.AndAnd_BoolBool
	 bool                      NotEqual_BoolBool ( bool A, bool B );             		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00F3 ] Core.Object.NotEqual_BoolBool
	 bool                      EqualEqual_BoolBool ( bool A, bool B );           		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x00F2 ] Core.Object.EqualEqual_BoolBool
	 bool                      Not_PreBool ( bool A );                           		// [ FUNC_Final | FUNC_Native ] [ iNative : 0x0081 ] Core.Object.Not_PreBool
	 void                      BtrTimeToBtrDouble ( struct FBtrTime* A, struct FBtrDouble* B );		// [ FUNC_Final | FUNC_Native ] Core.Object.BtrTimeToBtrDouble
	 bool                      BtrDoubleLessEqual ( struct FBtrDouble* A, struct FBtrDouble* B );		// [ FUNC_Final | FUNC_Native ] Core.Object.BtrDoubleLessEqual
	 void                      BtrDoubleToBtrTime ( struct FBtrDouble* A, struct FBtrTime* B );		// [ FUNC_Final | FUNC_Native ] Core.Object.BtrDoubleToBtrTime
	 void                      GetLocalTimeToBtrTime ( struct FBtrTime* A );     		// [ FUNC_Final | FUNC_Native ] Core.Object.GetLocalTimeToBtrTime
	 void                      GetLocalTimeToBtrDouble ( struct FBtrDouble* A ); 		// [ FUNC_Final | FUNC_Native ] Core.Object.GetLocalTimeToBtrDouble
	 struct FBtrDouble         BtrDoublePlus ( struct FBtrDouble A, struct FBtrDouble B );		// [ FUNC_Final | FUNC_Native ] Core.Object.BtrDoublePlus
	 struct FBtrDouble         BtrDoubleMinus ( struct FBtrDouble A, struct FBtrDouble B );		// [ FUNC_Final | FUNC_Native ] Core.Object.BtrDoubleMinus
	 struct FBtrTime           EmptyBtrTime (  );                                		//  Core.Object.EmptyBtrTime
	 struct FBtrDouble         EmptyBtrDouble (  );                              		//  Core.Object.EmptyBtrDouble
	 struct FBtrTime           BtrTimeSubstract ( struct FBtrTime leftT, struct FBtrTime rightT );		//  Core.Object.BtrTimeSubstract
	 struct FBtrTime           BtrTimeToBtrDayTime ( struct FBtrTime it );       		//  Core.Object.BtrTimeToBtrDayTime
};

/*----------------------------------------------------------------------------
	Core templates.
----------------------------------------------------------------------------*/

// Hash function.
inline DWORD GetTypeHash( const UObject* A )
{
	return A ? A->GetIndex() : 0;
}

// Parse an object name in the input stream.
template< class T > UBOOL ParseObject( const TCHAR* Stream, const TCHAR* Match, T*& Obj, UObject* Outer )
{
	return ParseObject( Stream, Match, T::StaticClass(), *(UObject **)&Obj, Outer );
}

// Find an optional object.
template< class T > T* FindObject( UObject* Outer, const TCHAR* Name, UBOOL ExactClass=0 )
{
	return (T*)UObject::StaticFindObject( T::StaticClass(), Outer, Name, ExactClass );
}

// Find an object, no failure allowed.
template< class T > T* FindObjectChecked( UObject* Outer, const TCHAR* Name, UBOOL ExactClass=0 )
{
	return (T*)UObject::StaticFindObjectChecked( T::StaticClass(), Outer, Name, ExactClass );
}

// Dynamically cast an object type-safely.
template< class T > T* Cast( UObject* Src )
{
	return Src && Src->IsA(T::StaticClass()) ? (T*)Src : NULL;
}
template< class T, class U > T* CastChecked( U* Src )
{
	if( !Src || !Src->IsA(T::StaticClass()) )
		appErrorf( TEXT("Cast of %s to %s failed"), Src ? Src->GetFullName() : TEXT("NULL"), T::StaticClass()->GetName() );
	return (T*)Src;
}

// Construct an object of a particular class.
template< class T > T* ConstructObject( UClass* Class, UObject* Outer=(UObject*)-1, FName Name=NAME_None, DWORD SetFlags=0 )
{
	check(Class->IsChildOf(T::StaticClass()));
	if( Outer==(UObject*)-1 )
		Outer = UObject::GetTransientPackage();
	return (T*)UObject::StaticConstructObject( Class, Outer, Name, SetFlags );
}

// Load an object.
template< class T > T* LoadObject( UObject* Outer, const TCHAR* Name, const TCHAR* Filename, DWORD LoadFlags, UPackageMap* Sandbox )
{
	return (T*)UObject::StaticLoadObject( T::StaticClass(), Outer, Name, Filename, LoadFlags, Sandbox );
}

// Load a class object.
template< class T > UClass* LoadClass( UObject* Outer, const TCHAR* Name, const TCHAR* Filename, DWORD LoadFlags, UPackageMap* Sandbox )
{
	return UObject::StaticLoadClass( T::StaticClass(), Outer, Name, Filename, LoadFlags, Sandbox );
}

// Get default object of a class.
template< class T > T* GetDefault()
{
	return (T*)&T::StaticClass()->Defaults(0);
}

/*----------------------------------------------------------------------------
	Object iterators.
----------------------------------------------------------------------------*/

//
// Class for iterating through all objects.
//
class FObjectIterator
{
public:
	FObjectIterator( UClass* InClass=UObject::StaticClass() )
	:	Class( InClass ), Index( -1 )
	{
		check(Class);
		++*this;
	}
	void operator++()
	{
		while( ++Index<UObject::GObjObjects.Num() && (!UObject::GObjObjects(Index) || !UObject::GObjObjects(Index)->IsA(Class)) );
	}
	UObject* operator*()
	{
		return UObject::GObjObjects(Index);
	}
	UObject* operator->()
	{
		return UObject::GObjObjects(Index);
	}
	operator UBOOL()
	{
		return Index<UObject::GObjObjects.Num();
	}
protected:
	UClass* Class;
	INT Index;
};

//
// Class for iterating through all objects which inherit from a
// specified base class.
//
template< class T > class TObjectIterator : public FObjectIterator
{
public:
	TObjectIterator()
	:	FObjectIterator( T::StaticClass() )
	{}
	T* operator* ()
	{
		return (T*)FObjectIterator::operator*();
	}
	T* operator-> ()
	{
		return (T*)FObjectIterator::operator->();
	}
};

#define AUTO_INITIALIZE_REGISTRANTS \
	UObject::StaticClass(); \
	UClass::StaticClass(); \
	USubsystem::StaticClass(); \
	USystem::StaticClass(); \
	UProperty::StaticClass(); \
	UStructProperty::StaticClass(); \
	UField::StaticClass(); \
	UMapProperty::StaticClass(); \
	UArrayProperty::StaticClass(); \
	UFixedArrayProperty::StaticClass(); \
	UStrProperty::StaticClass(); \
	UNameProperty::StaticClass(); \
	UClassProperty::StaticClass(); \
	UObjectProperty::StaticClass(); \
	UFloatProperty::StaticClass(); \
	UBoolProperty::StaticClass(); \
	UIntProperty::StaticClass(); \
	UByteProperty::StaticClass(); \
	ULanguage::StaticClass(); \
	UTextBufferFactory::StaticClass(); \
	UFactory::StaticClass(); \
	UPackage::StaticClass(); \
	UCommandlet::StaticClass(); \
	ULinkerSave::StaticClass(); \
	ULinker::StaticClass(); \
	ULinkerLoad::StaticClass(); \
	UEnum::StaticClass(); \
	UTextBuffer::StaticClass(); \
	UPackageMap::StaticClass(); \
	UConst::StaticClass(); \
	UFunction::StaticClass(); \
	UStruct::StaticClass();

/*----------------------------------------------------------------------------
	The End.
----------------------------------------------------------------------------*/
