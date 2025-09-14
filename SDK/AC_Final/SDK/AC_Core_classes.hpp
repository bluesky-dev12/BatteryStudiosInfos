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

// Class Core.Object
// 0x002C
class UObject
{
public:
	static TArray<UObject*>*                           GObjects;                                                 // 0x0000(0x0000)
	struct FPointer                                    ObjectInternal[0x7];                                      // 0x0000(0x0004) (Const, Native, Transient)
	class UObject*                                     Outer;                                                    // 0x001C(0x0004) (Const, Native)
	int                                                ObjectFlags;                                              // 0x0020(0x0004) (Const, Native)
	FName                                              Name;                                                     // 0x0024(0x0004) (Edit, Const, Native, EditConst, NoExport)
	class UClass*                                      Class;                                                    // 0x0028(0x0004) (Const, Native, EditConst)

	static TArray<UObject*>& GetGlobalObjects();

	inline std::string UObject::GetName() const
	{
		return Name.GetName();
	}

	std::string GetFullName() const;

	template<typename T>
	static T* FindObject(const std::string& name)
	{
		for (auto i = 0u; i < GetGlobalObjects().Num(); ++i)
		{
			auto object = GetGlobalObjects().GetByIndex(i);
	
			if (object == nullptr)
			{
				continue;
			}
	
			if (object->GetFullName() == name)
			{
				return static_cast<T*>(object);
			}
		}
		return nullptr;
	}

	static UClass* FindClass(const std::string& name)
	{
		return FindObject<UClass>(name);
	}

	template<typename T>
	static T* GetObjectCasted(std::size_t index)
	{
		return static_cast<T*>(GetGlobalObjects().GetByIndex(index));
	}

	bool IsA(UClass* cmp) const;

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.Object");
		return ptr;
	}


	bool STATIC_UseGP20();
	bool CheckInFloatBox(const struct FFloatBox& checkFloatBox, float X, float Y, float ClientRatioX, float ClientRatioY);
	struct FFloatBox FloatBoxOffsetY(const struct FFloatBox& origBox, float offset);
	struct FFloatBox FloatBoxOffsetX(const struct FFloatBox& origBox, float offset);
	struct FFloatBox AddFloatBox(int startX, int startY, const struct FFloatBox& value1);
	void NotifyDestroyed(class AActor* A);
	void ZeroVector(struct FVector* V);
	bool IsZeroVector(struct FVector* V);
	float Pow(float A, int B);
	bool STATIC_StrStartsWith(const string& str, const string& startStr);
	string STATIC_PadRight(const string& str, int totalDigits, const string& paddingChar);
	string STATIC_PadLeft(const string& str, int totalDigits, const string& paddingChar);
	string STATIC_PadString(const string& str, int totalDigits, const string& paddingChar);
	void STATIC_slog(const string& S);
	struct FVector STATIC_MakeVector(float X, float Y, float Z);
	void STATIC_EatStr(int Num, string* Dest, string* Source);
	void STATIC_ReplaceText(const string& Replace, const string& With, string* Text);
	string STATIC_GetItemName(const string& FullName);
	void STATIC_GetDatefromString(const string& char, bool bFull, string* in);
	void GetReferencers(class UObject* Target, class UObject*[]* Referencers);
	void AllObjects(class UClass* baseClass, class UObject** obj);
	void Created();
	void EndState();
	void BeginState();
	string GetErrMsg(int ErrCode);
	int GetLastErrCode();
	bool PlatformIs64Bit();
	bool PlatformIsWindows();
	bool PlatformIsUnix();
	bool PlatformIsMacOS();
	bool IsSoaking();
	bool IsOnConsole();
	void STATIC_StopWatch(bool bStop);
	float RandRange(float Min, float Max);
	string[] STATIC_GetPerObjectNames(const string& ININame, const string& ObjectClass, int MaxResults);
	void STATIC_StaticClearConfig(const string& PropName);
	void STATIC_ResetConfig(const string& PropName);
	void STATIC_StaticSaveConfig();
	void ClearConfig(const string& PropName);
	void SaveConfig();
	class UObject* STATIC_FindObject(const string& ObjectName, class UClass* ObjectClass);
	class UObject* STATIC_DynamicLoadObject(const string& ObjectName, class UClass* ObjectClass, bool MayFail);
	FName STATIC_GetEnum(class UObject* E, int i);
	bool SetPropertyText(const string& PropName, const string& PropValue);
	string GetPropertyText(const string& PropName);
	void Disable(const FName& ProbeFunc);
	void Enable(const FName& ProbeFunc);
	bool IsA(const FName& ClassName);
	bool STATIC_ClassIsChildOf(class UClass* TestClass, class UClass* ParentClass);
	FName GetStateName();
	bool IsInState(const FName& TestState);
	void GotoState(const FName& NewState, const FName& Label);
	void STATIC_ResetCombatLog();
	void STATIC_CombatLog(const string& S, const FName& Tag);
	void STATIC_CrashLog(const string& S, const FName& Tag);
	string STATIC_Localize(const string& SectionName, const string& KeyName, const string& PackageName);
	void STATIC_Warn(const string& S);
	void STATIC_Log(const string& S, const FName& Tag);
	struct FQuat STATIC_QuatSlerp(const struct FQuat& A, const struct FQuat& B, float Slerp);
	struct FRotator STATIC_QuatToRotator(const struct FQuat& A);
	struct FQuat STATIC_QuatFromRotator(const struct FRotator& A);
	struct FQuat STATIC_QuatFromAxisAndAngle(const struct FVector& Axis, float Angle);
	struct FQuat STATIC_QuatFindBetween(const struct FVector& A, const struct FVector& B);
	struct FVector STATIC_QuatRotateVector(const struct FQuat& A, const struct FVector& B);
	struct FQuat STATIC_QuatInvert(const struct FQuat& A);
	struct FQuat STATIC_QuatProduct(const struct FQuat& A, const struct FQuat& B);
	void STATIC_InterpCurveGetInputDomain(const struct FInterpCurve& curve, float* Min, float* Max);
	void STATIC_InterpCurveGetOutputRange(const struct FInterpCurve& curve, float* Min, float* Max);
	float STATIC_InterpCurveEval(const struct FInterpCurve& curve, float Input);
	bool STATIC_NotEqual_BtrDoubleInt(const struct FBtrDouble& A, int B);
	bool STATIC_EqualEqual_BtrDoubleInt(const struct FBtrDouble& A, int B);
	bool STATIC_Less_BtrDoubleBtrDouble(const struct FBtrDouble& A, const struct FBtrDouble& B);
	struct FBtrDouble STATIC_StringToBtrDouble(const string& A);
	int STATIC_BtrDoubleToInt(const struct FBtrDouble& A);
	struct FBtrDouble STATIC_IntToBtrDouble(int A);
	string STATIC_BtrDoubleGetToStr(const struct FBtrDouble& A);
	struct FBtrDouble STATIC_SubtractEqual_BtrDoubleBtrDouble(const struct FBtrDouble& B, struct FBtrDouble* A);
	struct FBtrDouble STATIC_AddEqual_BtrDoubleBtrDouble(const struct FBtrDouble& B, struct FBtrDouble* A);
	struct FBtrDouble STATIC_DivideEqual_BtrDoubleBtrDouble(const struct FBtrDouble& B, struct FBtrDouble* A);
	struct FBtrDouble STATIC_MultiplyEqual_BtrDoubleBtrDouble(const struct FBtrDouble& B, struct FBtrDouble* A);
	bool STATIC_NotEqual_BtrDoubleBtrDouble(const struct FBtrDouble& A, const struct FBtrDouble& B);
	bool STATIC_EqualEqual_BtrDoubleBtrDouble(const struct FBtrDouble& A, const struct FBtrDouble& B);
	struct FBtrDouble STATIC_Subtract_BtrDoubleFloat(const struct FBtrDouble& A, float B);
	struct FBtrDouble STATIC_Subtract_BtrDoubleInt(const struct FBtrDouble& A, int B);
	struct FBtrDouble STATIC_Subtract_BtrDoubleBtrDouble(const struct FBtrDouble& A, const struct FBtrDouble& B);
	struct FBtrDouble STATIC_Add_BtrDoubleFloat(const struct FBtrDouble& A, float B);
	struct FBtrDouble STATIC_Add_BtrDoubleInt(const struct FBtrDouble& A, int B);
	struct FBtrDouble STATIC_Add_BtrDoubleBtrDouble(const struct FBtrDouble& A, const struct FBtrDouble& B);
	struct FBtrDouble STATIC_Divide_BtrDoubleFloat(const struct FBtrDouble& A, float B);
	struct FBtrDouble STATIC_Divide_BtrDoubleInt(const struct FBtrDouble& A, int B);
	struct FBtrDouble STATIC_Divide_BtrDoubleBtrDouble(const struct FBtrDouble& A, const struct FBtrDouble& B);
	struct FBtrDouble STATIC_Multiply_BtrDoubleFloat(const struct FBtrDouble& A, float B);
	struct FBtrDouble STATIC_Multiply_BtrDoubleInt(const struct FBtrDouble& A, int B);
	struct FBtrDouble STATIC_Multiply_BtrDoubleBtrDouble(const struct FBtrDouble& A, const struct FBtrDouble& B);
	bool STATIC_NotEqual_NameName(const FName& A, const FName& B);
	bool STATIC_EqualEqual_NameName(const FName& A, const FName& B);
	bool STATIC_NotEqual_ObjectObject(class UObject* A, class UObject* B);
	bool STATIC_EqualEqual_ObjectObject(class UObject* A, class UObject* B);
	string STATIC_Eval(bool Condition, const string& ResultIfTrue, const string& ResultIfFalse);
	string STATIC_Repl(const string& Src, const string& Match, const string& With, bool bCaseSensitive);
	int STATIC_StrCmp(const string& S, const string& t, int Count, bool bCaseSensitive);
	int STATIC_KeyCode(const string& S, int i);
	int STATIC_Split(const string& Src, const string& Divider, string[]* Parts);
	bool STATIC_Divide(const string& Src, const string& Divider, string* LeftPart, string* RightPart);
	string STATIC_Locs(const string& S);
	int STATIC_Asc(const string& S);
	string STATIC_Chr(int i);
	string STATIC_Caps(const string& S);
	string STATIC_Right(const string& S, int i);
	string STATIC_Left(const string& S, int i);
	string STATIC_Mid(const string& S, int i, int j);
	int STATIC_InStr(const string& S, const string& t);
	int STATIC_Len(const string& S);
	string STATIC_SubtractEqual_StrStr(const string& B, string* A);
	string STATIC_AtEqual_StrStr(const string& B, string* A);
	string STATIC_ConcatEqual_StrStr(const string& B, string* A);
	bool STATIC_ComplementEqual_StrStr(const string& A, const string& B);
	bool STATIC_NotEqual_StrStr(const string& A, const string& B);
	bool STATIC_EqualEqual_StrStr(const string& A, const string& B);
	bool STATIC_GreaterEqual_StrStr(const string& A, const string& B);
	bool STATIC_LessEqual_StrStr(const string& A, const string& B);
	bool STATIC_Greater_StrStr(const string& A, const string& B);
	bool STATIC_Less_StrStr(const string& A, const string& B);
	string STATIC_At_StrStr(const string& A, const string& B);
	string STATIC_Concat_StrStr(const string& A, const string& B);
	float STATIC_RUU2Degree(int iRUU);
	int STATIC_Degree2RUU(float fAngle);
	bool STATIC_ClockwiseFrom_IntInt(int A, int B);
	struct FRotator STATIC_Normalize(const struct FRotator& Rot);
	struct FRotator STATIC_OrthoRotation(const struct FVector& X, const struct FVector& Y, const struct FVector& Z);
	struct FRotator STATIC_RotRand(bool bRoll);
	void STATIC_GetUnAxes(const struct FRotator& A, struct FVector* X, struct FVector* Y, struct FVector* Z);
	void STATIC_GetAxes(const struct FRotator& A, struct FVector* X, struct FVector* Y, struct FVector* Z);
	struct FRotator STATIC_SubtractEqual_RotatorRotator(const struct FRotator& B, struct FRotator* A);
	struct FRotator STATIC_AddEqual_RotatorRotator(const struct FRotator& B, struct FRotator* A);
	struct FRotator STATIC_Subtract_RotatorRotator(const struct FRotator& A, const struct FRotator& B);
	struct FRotator STATIC_Add_RotatorRotator(const struct FRotator& A, const struct FRotator& B);
	struct FRotator STATIC_DivideEqual_RotatorFloat(float B, struct FRotator* A);
	struct FRotator STATIC_MultiplyEqual_RotatorFloat(float B, struct FRotator* A);
	struct FRotator STATIC_Divide_RotatorFloat(const struct FRotator& A, float B);
	struct FRotator STATIC_Multiply_FloatRotator(float A, const struct FRotator& B);
	struct FRotator STATIC_Multiply_RotatorFloat(const struct FRotator& A, float B);
	bool STATIC_NotEqual_RotatorRotator(const struct FRotator& A, const struct FRotator& B);
	bool STATIC_EqualEqual_RotatorRotator(const struct FRotator& A, const struct FRotator& B);
	struct FVector STATIC_MirrorVectorByNormal(const struct FVector& Vect, const struct FVector& Normal);
	struct FVector STATIC_VRand();
	void STATIC_Invert(struct FVector* X, struct FVector* Y, struct FVector* Z);
	struct FVector STATIC_Normal(const struct FVector& A);
	float STATIC_VSize(const struct FVector& A);
	struct FVector STATIC_SubtractEqual_VectorVector(const struct FVector& B, struct FVector* A);
	struct FVector STATIC_AddEqual_VectorVector(const struct FVector& B, struct FVector* A);
	struct FVector STATIC_DivideEqual_VectorFloat(float B, struct FVector* A);
	struct FVector STATIC_MultiplyEqual_VectorVector(const struct FVector& B, struct FVector* A);
	struct FVector STATIC_MultiplyEqual_VectorFloat(float B, struct FVector* A);
	struct FVector STATIC_Cross_VectorVector(const struct FVector& A, const struct FVector& B);
	float STATIC_Dot_VectorVector(const struct FVector& A, const struct FVector& B);
	bool STATIC_NotEqual_VectorVector(const struct FVector& A, const struct FVector& B);
	bool STATIC_EqualEqual_VectorVector(const struct FVector& A, const struct FVector& B);
	struct FVector STATIC_GreaterGreater_VectorRotator(const struct FVector& A, const struct FRotator& B);
	struct FVector STATIC_LessLess_VectorRotator(const struct FVector& A, const struct FRotator& B);
	struct FVector STATIC_Subtract_VectorVector(const struct FVector& A, const struct FVector& B);
	struct FVector STATIC_Add_VectorVector(const struct FVector& A, const struct FVector& B);
	struct FVector STATIC_Divide_VectorFloat(const struct FVector& A, float B);
	struct FVector STATIC_Multiply_VectorVector(const struct FVector& A, const struct FVector& B);
	struct FVector STATIC_Multiply_FloatVector(float A, const struct FVector& B);
	struct FVector STATIC_Multiply_VectorFloat(const struct FVector& A, float B);
	struct FVector STATIC_Subtract_PreVector(const struct FVector& A);
	float STATIC_Round(float A);
	float STATIC_Ceil(float A);
	float STATIC_Smerp(float Alpha, float A, float B);
	float STATIC_Lerp(float Alpha, float A, float B, bool bClampRange);
	float STATIC_FClamp(float V, float A, float B);
	float STATIC_FMax(float A, float B);
	float STATIC_FMin(float A, float B);
	float STATIC_FRand();
	float STATIC_Square(float A);
	float STATIC_Sqrt(float A);
	float STATIC_Loge(float A);
	float STATIC_Exp(float A);
	float STATIC_Atan(float A, float B);
	float STATIC_Tan(float A);
	float STATIC_Acos(float A);
	float STATIC_Cos(float A);
	float STATIC_Asin(float A);
	float STATIC_Sin(float A);
	float STATIC_Abs(float A);
	float STATIC_SubtractEqual_FloatFloat(float B, float* A);
	float STATIC_AddEqual_FloatFloat(float B, float* A);
	float STATIC_DivideEqual_FloatFloat(float B, float* A);
	float STATIC_MultiplyEqual_FloatFloat(float B, float* A);
	bool STATIC_NotEqual_FloatFloat(float A, float B);
	bool STATIC_ComplementEqual_FloatFloat(float A, float B);
	bool STATIC_EqualEqual_FloatFloat(float A, float B);
	bool STATIC_GreaterEqual_FloatFloat(float A, float B);
	bool STATIC_LessEqual_FloatFloat(float A, float B);
	bool STATIC_Greater_FloatFloat(float A, float B);
	bool STATIC_Less_FloatFloat(float A, float B);
	float STATIC_Subtract_FloatFloat(float A, float B);
	float STATIC_Add_FloatFloat(float A, float B);
	float STATIC_Percent_FloatFloat(float A, float B);
	float STATIC_Divide_FloatFloat(float A, float B);
	float STATIC_Multiply_FloatFloat(float A, float B);
	float STATIC_MultiplyMultiply_FloatFloat(float A, float B);
	float STATIC_Subtract_PreFloat(float A);
	int STATIC_Clamp(int V, int A, int B);
	int STATIC_Max(int A, int B);
	int STATIC_Min(int A, int B);
	int STATIC_SignedRand(int iMin, int iMax);
	void STATIC_SRand(int Seed);
	int STATIC_Rand(int Max);
	int STATIC_SubtractSubtract_Int(int* A);
	int STATIC_AddAdd_Int(int* A);
	int STATIC_SubtractSubtract_PreInt(int* A);
	int STATIC_AddAdd_PreInt(int* A);
	int STATIC_SubtractEqual_IntInt(int B, int* A);
	int STATIC_AddEqual_IntInt(int B, int* A);
	int STATIC_DivideEqual_IntFloat(float B, int* A);
	int STATIC_MultiplyEqual_IntFloat(float B, int* A);
	int STATIC_Or_IntInt(int A, int B);
	int STATIC_Xor_IntInt(int A, int B);
	int STATIC_And_IntInt(int A, int B);
	bool STATIC_NotEqual_IntInt(int A, int B);
	bool STATIC_EqualEqual_IntInt(int A, int B);
	bool STATIC_GreaterEqual_IntInt(int A, int B);
	bool STATIC_LessEqual_IntInt(int A, int B);
	bool STATIC_Greater_IntInt(int A, int B);
	bool STATIC_Less_IntInt(int A, int B);
	int STATIC_GreaterGreaterGreater_IntInt(int A, int B);
	int STATIC_GreaterGreater_IntInt(int A, int B);
	int STATIC_LessLess_IntInt(int A, int B);
	int STATIC_Subtract_IntInt(int A, int B);
	int STATIC_Add_IntInt(int A, int B);
	int STATIC_Divide_IntInt(int A, int B);
	int STATIC_Multiply_IntInt(int A, int B);
	int STATIC_Subtract_PreInt(int A);
	int STATIC_Complement_PreInt(int A);
	byte STATIC_SubtractSubtract_Byte(byte* A);
	byte STATIC_AddAdd_Byte(byte* A);
	byte STATIC_SubtractSubtract_PreByte(byte* A);
	byte STATIC_AddAdd_PreByte(byte* A);
	byte STATIC_SubtractEqual_ByteByte(byte B, byte* A);
	byte STATIC_AddEqual_ByteByte(byte B, byte* A);
	byte STATIC_DivideEqual_ByteByte(byte B, byte* A);
	byte STATIC_MultiplyEqual_ByteByte(byte B, byte* A);
	bool STATIC_OrOr_BoolBool(bool A, bool B);
	bool STATIC_XorXor_BoolBool(bool A, bool B);
	bool STATIC_AndAnd_BoolBool(bool A, bool B);
	bool STATIC_NotEqual_BoolBool(bool A, bool B);
	bool STATIC_EqualEqual_BoolBool(bool A, bool B);
	bool STATIC_Not_PreBool(bool A);
	void BtrTimeToBtrDouble(struct FBtrTime* A, struct FBtrDouble* B);
	bool BtrDoubleLessEqual(struct FBtrDouble* A, struct FBtrDouble* B);
	void BtrDoubleToBtrTime(struct FBtrDouble* A, struct FBtrTime* B);
	void GetLocalTimeToBtrTime(struct FBtrTime* A);
	void GetLocalTimeToBtrDouble(struct FBtrDouble* A);
	struct FBtrDouble BtrDoublePlus(const struct FBtrDouble& A, const struct FBtrDouble& B);
	struct FBtrDouble BtrDoubleMinus(const struct FBtrDouble& A, const struct FBtrDouble& B);
	struct FBtrTime STATIC_EmptyBtrTime();
	struct FBtrDouble STATIC_EmptyBtrDouble();
	struct FBtrTime STATIC_BtrTimeSubstract(const struct FBtrTime& leftT, const struct FBtrTime& rightT);
	struct FBtrTime STATIC_BtrTimeToBtrDayTime(const struct FBtrTime& it);
};


// Class Core.Subsystem
// 0x0004 (0x0030 - 0x002C)
class USubsystem : public UObject
{
public:
	struct FPointer                                    ExecVtbl;                                                 // 0x002C(0x0004) (Const, Native, Transient)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.Subsystem");
		return ptr;
	}

};


// Class Core.PackageMap
// 0x0048 (0x0074 - 0x002C)
class UPackageMap : public UObject
{
public:
	byte                                               Padding00[0x48];                                          // 0x002C(0x0048) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.PackageMap");
		return ptr;
	}

};


// Class Core.Commandlet
// 0x01B4 (0x01E0 - 0x002C)
class UCommandlet : public UObject
{
public:
	string                                             HelpCmd;                                                  // 0x002C(0x000C) (Localized, NeedCtorLink)
	string                                             HelpOneLiner;                                             // 0x0038(0x000C) (Localized, NeedCtorLink)
	string                                             HelpUsage;                                                // 0x0044(0x000C) (Localized, NeedCtorLink)
	string                                             HelpWebLink;                                              // 0x0050(0x000C) (Localized, NeedCtorLink)
	string                                             HelpParm[0x10];                                           // 0x005C(0x000C) (Localized, NeedCtorLink)
	string                                             HelpDesc[0x10];                                           // 0x011C(0x000C) (Localized, NeedCtorLink)
	bool                                               LogToStdout;                                              // 0x01DC(0x0004)
	bool                                               IsServer;                                                 // 0x01DC(0x0004)
	bool                                               IsClient;                                                 // 0x01DC(0x0004)
	bool                                               IsEditor;                                                 // 0x01DC(0x0004)
	bool                                               LazyLoad;                                                 // 0x01DC(0x0004)
	bool                                               ShowErrorCount;                                           // 0x01DC(0x0004)
	bool                                               ShowBanner;                                               // 0x01DC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.Commandlet");
		return ptr;
	}


	int Main(const string& Parms);
};


// Class Core.System
// 0x0068 (0x0098 - 0x0030)
class USystem : public USubsystem
{
public:
	byte                                               Padding00[0x4];                                           // 0x0030(0x0004) MISSED OFFSET
	int                                                PurgeCacheDays;                                           // 0x0034(0x0004) (Edit)
	byte                                               Padding01[0x60];                                          // 0x0038(0x0060) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.System");
		return ptr;
	}

};


// Class Core.Field
// 0x000C (0x0038 - 0x002C)
class UField : public UObject
{
public:
	class UField*                                      SuperField;                                               // 0x0000(0x0000) NOT AUTO-GENERATED PROPERTY
	class UField*                                      Next;                                                     // 0x0000(0x0000) NOT AUTO-GENERATED PROPERTY
	class UField*                                      HashNext;                                                 // 0x0000(0x0000) NOT AUTO-GENERATED PROPERTY

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.Field");
		return ptr;
	}

};


// Class Core.Property
// 0x0038 (0x0070 - 0x0038)
class UProperty : public UField
{
public:
	byte                                               Padding00[0x38];                                          // 0x0038(0x0038) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.Property");
		return ptr;
	}

};


// Class Core.StructProperty
// 0x0004 (0x0074 - 0x0070)
class UStructProperty : public UProperty
{
public:
	byte                                               Padding00[0x4];                                           // 0x0070(0x0004) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.StructProperty");
		return ptr;
	}

};


// Class Core.MapProperty
// 0x0008 (0x0078 - 0x0070)
class UMapProperty : public UProperty
{
public:
	byte                                               Padding00[0x8];                                           // 0x0070(0x0008) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.MapProperty");
		return ptr;
	}

};


// Class Core.ArrayProperty
// 0x0004 (0x0074 - 0x0070)
class UArrayProperty : public UProperty
{
public:
	byte                                               Padding00[0x4];                                           // 0x0070(0x0004) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.ArrayProperty");
		return ptr;
	}

};


// Class Core.FixedArrayProperty
// 0x0008 (0x0078 - 0x0070)
class UFixedArrayProperty : public UProperty
{
public:
	byte                                               Padding00[0x8];                                           // 0x0070(0x0008) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.FixedArrayProperty");
		return ptr;
	}

};


// Class Core.StrProperty
// 0x0000 (0x0070 - 0x0070)
class UStrProperty : public UProperty
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.StrProperty");
		return ptr;
	}

};


// Class Core.NameProperty
// 0x0000 (0x0070 - 0x0070)
class UNameProperty : public UProperty
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.NameProperty");
		return ptr;
	}

};


// Class Core.ObjectProperty
// 0x0004 (0x0074 - 0x0070)
class UObjectProperty : public UProperty
{
public:
	byte                                               Padding00[0x4];                                           // 0x0070(0x0004) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.ObjectProperty");
		return ptr;
	}

};


// Class Core.ClassProperty
// 0x0004 (0x0078 - 0x0074)
class UClassProperty : public UObjectProperty
{
public:
	byte                                               Padding00[0x4];                                           // 0x0074(0x0004) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.ClassProperty");
		return ptr;
	}

};


// Class Core.FloatProperty
// 0x0000 (0x0070 - 0x0070)
class UFloatProperty : public UProperty
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.FloatProperty");
		return ptr;
	}

};


// Class Core.BoolProperty
// 0x0004 (0x0074 - 0x0070)
class UBoolProperty : public UProperty
{
public:
	byte                                               Padding00[0x4];                                           // 0x0070(0x0004) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.BoolProperty");
		return ptr;
	}

};


// Class Core.DelegateProperty
// 0x0004 (0x0074 - 0x0070)
class UDelegateProperty : public UProperty
{
public:
	byte                                               Padding00[0x4];                                           // 0x0070(0x0004) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.DelegateProperty");
		return ptr;
	}

};


// Class Core.PointerProperty
// 0x0000 (0x0070 - 0x0070)
class UPointerProperty : public UProperty
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.PointerProperty");
		return ptr;
	}

};


// Class Core.IntProperty
// 0x0000 (0x0070 - 0x0070)
class UIntProperty : public UProperty
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.IntProperty");
		return ptr;
	}

};


// Class Core.ByteProperty
// 0x0004 (0x0074 - 0x0070)
class UByteProperty : public UProperty
{
public:
	byte                                               Padding00[0x4];                                           // 0x0070(0x0004) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.ByteProperty");
		return ptr;
	}

};


// Class Core.Language
// 0x0004 (0x0030 - 0x002C)
class ULanguage : public UObject
{
public:
	byte                                               Padding00[0x4];                                           // 0x002C(0x0004) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.Language");
		return ptr;
	}

};


// Class Core.Factory
// 0x0040 (0x006C - 0x002C)
class UFactory : public UObject
{
public:
	byte                                               Padding00[0x8];                                           // 0x002C(0x0008) MISSED OFFSET
	string                                             Description;                                              // 0x0034(0x000C) (NeedCtorLink)
	string                                             InContextCommand;                                         // 0x0040(0x000C) (NeedCtorLink)
	string                                             OutOfContextCommand;                                      // 0x004C(0x000C) (NeedCtorLink)
	string[]                                           Formats;                                                  // 0x0058(0x000C) (NeedCtorLink)
	byte                                               Padding01[0x8];                                           // 0x0064(0x0008) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.Factory");
		return ptr;
	}

};


// Class Core.TextBufferFactory
// 0x0000 (0x006C - 0x006C)
class UTextBufferFactory : public UFactory
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.TextBufferFactory");
		return ptr;
	}

};


// Class Core.Package
// 0x0010 (0x003C - 0x002C)
class UPackage : public UObject
{
public:
	byte                                               Padding00[0x10];                                          // 0x002C(0x0010) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.Package");
		return ptr;
	}

};


// Class Core.Linker
// 0x008C (0x00B8 - 0x002C)
class ULinker : public UObject
{
public:
	byte                                               Padding00[0x8C];                                          // 0x002C(0x008C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.Linker");
		return ptr;
	}

};


// Class Core.LinkerSave
// 0x0060 (0x0118 - 0x00B8)
class ULinkerSave : public ULinker
{
public:
	byte                                               Padding00[0x60];                                          // 0x00B8(0x0060) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.LinkerSave");
		return ptr;
	}

};


// Class Core.LinkerLoad
// 0x0460 (0x0518 - 0x00B8)
class ULinkerLoad : public ULinker
{
public:
	byte                                               Padding00[0x460];                                         // 0x00B8(0x0460) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.LinkerLoad");
		return ptr;
	}

};


// Class Core.Enum
// 0x000C (0x0044 - 0x0038)
class UEnum : public UField
{
public:
	byte                                               Padding00[0xC];                                           // 0x0038(0x000C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.Enum");
		return ptr;
	}

};


// Class Core.TextBuffer
// 0x0018 (0x0044 - 0x002C)
class UTextBuffer : public UObject
{
public:
	byte                                               Padding00[0x18];                                          // 0x002C(0x0018) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.TextBuffer");
		return ptr;
	}

};


// Class Core.Const
// 0x000C (0x0044 - 0x0038)
class UConst : public UField
{
public:
	byte                                               Padding00[0xC];                                           // 0x0038(0x000C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.Const");
		return ptr;
	}

};


// Class Core.Struct
// 0x004C (0x0084 - 0x0038)
class UStruct : public UField
{
public:
	unsigned char                                      UnknownData00[0x08];                                      // 0x0000(0x0000) NOT AUTO-GENERATED PROPERTY
	class UField*                                      Children;                                                 // 0x0000(0x0000) NOT AUTO-GENERATED PROPERTY
	unsigned long                                      PropertySize;                                             // 0x0000(0x0000) NOT AUTO-GENERATED PROPERTY
	unsigned char                                      UnknownData01[0x3C];                                      // 0x0000(0x0000) NOT AUTO-GENERATED PROPERTY

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.Struct");
		return ptr;
	}

};


// Class Core.Function
// 0x0014 (0x0098 - 0x0084)
class UFunction : public UStruct
{
public:
	uint32_t                                           FunctionFlags;                                            // 0x0000(0x0000) NOT AUTO-GENERATED PROPERTY
	uint16_t                                           iNative;                                                  // 0x0000(0x0000) NOT AUTO-GENERATED PROPERTY
	uint16_t                                           RepOffset;                                                // 0x0000(0x0000) NOT AUTO-GENERATED PROPERTY
	uint8_t                                            OperPrecedence;                                           // 0x0000(0x0000) NOT AUTO-GENERATED PROPERTY
	uint8_t                                            NumParms;                                                 // 0x0000(0x0000) NOT AUTO-GENERATED PROPERTY
	uint16_t                                           ParmsSize;                                                // 0x0000(0x0000) NOT AUTO-GENERATED PROPERTY
	uint16_t                                           ReturnValueOffset;                                        // 0x0000(0x0000) NOT AUTO-GENERATED PROPERTY
	char                                               UnknownData00[0x02];                                      // 0x0000(0x0000) NOT AUTO-GENERATED PROPERTY
	void*                                              Func;                                                     // 0x0000(0x0000) NOT AUTO-GENERATED PROPERTY

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.Function");
		return ptr;
	}

};


// Class Core.State
// 0x0418 (0x049C - 0x0084)
class UState : public UStruct
{
public:
	byte                                               Padding00[0x418];                                         // 0x0084(0x0418) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.State");
		return ptr;
	}

};


// Class Core.Class
// 0x0088 (0x0524 - 0x049C)
class UClass : public UState
{
public:
	byte                                               Padding00[0x88];                                          // 0x049C(0x0088) MISSED OFFSET

	template<typename T>
	T* CreateDefaultObject()
	{
		return static_cast<T*>(CreateDefaultObject());
	}

	UObject* CreateDefaultObject()
	{
		using Fn = UObject*(__thiscall *)(UClass*);
		//UClass::GetDefaultObject can be found with the sig
		//56 8B F1 8B 06 57 8B BE ?? ?? ?? ?? FF
		static Fn fn = nullptr;
		
		return fn(this);
	}

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.Class");
		return ptr;
	}

};


// Class Core.Exporter
// 0x0018 (0x0044 - 0x002C)
class UExporter : public UObject
{
public:
	byte                                               Padding00[0x4];                                           // 0x002C(0x0004) MISSED OFFSET
	string[]                                           Formats;                                                  // 0x0030(0x000C) (NeedCtorLink)
	byte                                               Padding01[0x8];                                           // 0x003C(0x0008) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.Exporter");
		return ptr;
	}

};


// Class Core.ObjectExporterT3D
// 0x0000 (0x0044 - 0x0044)
class UObjectExporterT3D : public UExporter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Core.ObjectExporterT3D");
		return ptr;
	}

};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
