#pragma once

// Arctic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

#include "../SDK.hpp"

namespace Classes
{
//---------------------------------------------------------------------------
//Parameters
//---------------------------------------------------------------------------

// Function Core.Object.UseGP20
struct UObject_UseGP20_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.CheckInFloatBox
struct UObject_CheckInFloatBox_Params
{
	struct FFloatBox                                   checkFloatBox;                                            // (Parm)
	float                                              X;                                                        // (Parm)
	float                                              Y;                                                        // (Parm)
	float                                              ClientRatioX;                                             // (Parm)
	float                                              ClientRatioY;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.FloatBoxOffsetY
struct UObject_FloatBoxOffsetY_Params
{
	struct FFloatBox                                   origBox;                                                  // (Parm)
	float                                              offset;                                                   // (Parm)
	struct FFloatBox                                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.FloatBoxOffsetX
struct UObject_FloatBoxOffsetX_Params
{
	struct FFloatBox                                   origBox;                                                  // (Parm)
	float                                              offset;                                                   // (Parm)
	struct FFloatBox                                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.AddFloatBox
struct UObject_AddFloatBox_Params
{
	int                                                startX;                                                   // (Parm)
	int                                                startY;                                                   // (Parm)
	struct FFloatBox                                   value1;                                                   // (Parm)
	struct FFloatBox                                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.NotifyDestroyed
struct UObject_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function Core.Object.ZeroVector
struct UObject_ZeroVector_Params
{
	struct FVector                                     V;                                                        // (Parm, OutParm)
};

// Function Core.Object.IsZeroVector
struct UObject_IsZeroVector_Params
{
	struct FVector                                     V;                                                        // (Parm, OutParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Pow
struct UObject_Pow_Params
{
	float                                              A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.StrStartsWith
struct UObject_StrStartsWith_Params
{
	struct FString                                     str;                                                      // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     startStr;                                                 // (Parm, CoerceParm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.PadRight
struct UObject_PadRight_Params
{
	struct FString                                     str;                                                      // (Parm, CoerceParm, NeedCtorLink)
	int                                                totalDigits;                                              // (Parm)
	struct FString                                     paddingChar;                                              // (OptionalParm, Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.PadLeft
struct UObject_PadLeft_Params
{
	struct FString                                     str;                                                      // (Parm, CoerceParm, NeedCtorLink)
	int                                                totalDigits;                                              // (Parm)
	struct FString                                     paddingChar;                                              // (OptionalParm, Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.PadString
struct UObject_PadString_Params
{
	struct FString                                     str;                                                      // (Parm, CoerceParm, NeedCtorLink)
	int                                                totalDigits;                                              // (Parm)
	struct FString                                     paddingChar;                                              // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.slog
struct UObject_slog_Params
{
	struct FString                                     S;                                                        // (Parm, CoerceParm, NeedCtorLink)
};

// Function Core.Object.MakeVector
struct UObject_MakeVector_Params
{
	float                                              X;                                                        // (Parm)
	float                                              Y;                                                        // (Parm)
	float                                              Z;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.EatStr
struct UObject_EatStr_Params
{
	struct FString                                     Dest;                                                     // (Parm, OutParm, NeedCtorLink)
	struct FString                                     Source;                                                   // (Parm, OutParm, NeedCtorLink)
	int                                                Num;                                                      // (Parm)
};

// Function Core.Object.ReplaceText
struct UObject_ReplaceText_Params
{
	struct FString                                     Text;                                                     // (Parm, OutParm, NeedCtorLink)
	struct FString                                     Replace;                                                  // (Parm, NeedCtorLink)
	struct FString                                     With;                                                     // (Parm, NeedCtorLink)
};

// Function Core.Object.GetItemName
struct UObject_GetItemName_Params
{
	struct FString                                     FullName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.GetDatefromString
struct UObject_GetDatefromString_Params
{
	struct FString                                     in;                                                       // (Parm, OutParm, NeedCtorLink)
	struct FString                                     GEchar;                                                     // (Parm, NeedCtorLink)
	bool                                               bFull;                                                    // (OptionalParm, Parm)
};

// Function Core.Object.GetReferencers
struct UObject_GetReferencers_Params
{
	class UObject*                                     Target;                                                   // (Parm)
	TArray<class UObject*>                             Referencers;                                              // (Parm, OutParm, NeedCtorLink)
};

// Function Core.Object.AllObjects
struct UObject_AllObjects_Params
{
	class UClass*                                      baseClass;                                                // (Parm)
	class UObject*                                     obj;                                                      // (Parm, OutParm)
};

// Function Core.Object.Created
struct UObject_Created_Params
{
};

// Function Core.Object.EndState
struct UObject_EndState_Params
{
};

// Function Core.Object.BeginState
struct UObject_BeginState_Params
{
};

// Function Core.Object.GetErrMsg
struct UObject_GetErrMsg_Params
{
	int                                                ErrCode;                                                  // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.GetLastErrCode
struct UObject_GetLastErrCode_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.PlatformIs64Bit
struct UObject_PlatformIs64Bit_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.PlatformIsWindows
struct UObject_PlatformIsWindows_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.PlatformIsUnix
struct UObject_PlatformIsUnix_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.PlatformIsMacOS
struct UObject_PlatformIsMacOS_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.IsSoaking
struct UObject_IsSoaking_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.IsOnConsole
struct UObject_IsOnConsole_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.StopWatch
struct UObject_StopWatch_Params
{
	bool                                               bStop;                                                    // (OptionalParm, Parm)
};

// Function Core.Object.RandRange
struct UObject_RandRange_Params
{
	float                                              Min;                                                      // (Parm)
	float                                              Max;                                                      // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.GetPerObjectNames
struct UObject_GetPerObjectNames_Params
{
	struct FString                                     ININame;                                                  // (Parm, NeedCtorLink)
	struct FString                                     ObjectClass;                                              // (OptionalParm, Parm, NeedCtorLink)
	int                                                MaxResults;                                               // (OptionalParm, Parm)
	TArray<struct FString>                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.StaticClearConfig
struct UObject_StaticClearConfig_Params
{
	struct FString                                     PropName;                                                 // (OptionalParm, Parm, NeedCtorLink)
};

// Function Core.Object.ResetConfig
struct UObject_ResetConfig_Params
{
	struct FString                                     PropName;                                                 // (OptionalParm, Parm, NeedCtorLink)
};

// Function Core.Object.StaticSaveConfig
struct UObject_StaticSaveConfig_Params
{
};

// Function Core.Object.ClearConfig
struct UObject_ClearConfig_Params
{
	struct FString                                     PropName;                                                 // (OptionalParm, Parm, NeedCtorLink)
};

// Function Core.Object.SaveConfig
struct UObject_SaveConfig_Params
{
};

// Function Core.Object.FindObject
struct UObject_FindObject_Params
{
	struct FString                                     ObjectName;                                               // (Parm, NeedCtorLink)
	class UClass*                                      ObjectClass;                                              // (Parm)
	class UObject*                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.DynamicLoadObject
struct UObject_DynamicLoadObject_Params
{
	struct FString                                     ObjectName;                                               // (Parm, NeedCtorLink)
	class UClass*                                      ObjectClass;                                              // (Parm)
	bool                                               MayFail;                                                  // (OptionalParm, Parm)
	class UObject*                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.GetEnum
struct UObject_GetEnum_Params
{
	class UObject*                                     E;                                                        // (Parm)
	int                                                i;                                                        // (Parm, CoerceParm)
	struct FName                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.SetPropertyText
struct UObject_SetPropertyText_Params
{
	struct FString                                     PropName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     PropValue;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.GetPropertyText
struct UObject_GetPropertyText_Params
{
	struct FString                                     PropName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.Disable
struct UObject_Disable_Params
{
	struct FName                                       ProbeFunc;                                                // (Parm)
};

// Function Core.Object.Enable
struct UObject_Enable_Params
{
	struct FName                                       ProbeFunc;                                                // (Parm)
};

// Function Core.Object.IsA
struct UObject_IsA_Params
{
	struct FName                                       ClassName;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.ClassIsChildOf
struct UObject_ClassIsChildOf_Params
{
	class UClass*                                      TestClass;                                                // (Parm)
	class UClass*                                      ParentClass;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.GetStateName
struct UObject_GetStateName_Params
{
	struct FName                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.IsInState
struct UObject_IsInState_Params
{
	struct FName                                       TestState;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.GotoState
struct UObject_GotoState_Params
{
	struct FName                                       NewState;                                                 // (OptionalParm, Parm)
	struct FName                                       Label;                                                    // (OptionalParm, Parm)
};

// Function Core.Object.ResetCombatLog
struct UObject_ResetCombatLog_Params
{
};

// Function Core.Object.CombatLog
struct UObject_CombatLog_Params
{
	struct FString                                     S;                                                        // (Parm, CoerceParm, NeedCtorLink)
	struct FName                                       Tag;                                                      // (OptionalParm, Parm)
};

// Function Core.Object.CrashLog
struct UObject_CrashLog_Params
{
	struct FString                                     S;                                                        // (Parm, CoerceParm, NeedCtorLink)
	struct FName                                       Tag;                                                      // (OptionalParm, Parm)
};

// Function Core.Object.Localize
struct UObject_Localize_Params
{
	struct FString                                     SectionName;                                              // (Parm, NeedCtorLink)
	struct FString                                     KeyName;                                                  // (Parm, NeedCtorLink)
	struct FString                                     PackageName;                                              // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.Warn
struct UObject_Warn_Params
{
	struct FString                                     S;                                                        // (Parm, CoerceParm, NeedCtorLink)
};

// Function Core.Object.Log
struct UObject_Log_Params
{
	struct FString                                     S;                                                        // (Parm, CoerceParm, NeedCtorLink)
	struct FName                                       Tag;                                                      // (OptionalParm, Parm)
};

// Function Core.Object.QuatSlerp
struct UObject_QuatSlerp_Params
{
	struct FQuat                                       A;                                                        // (Parm)
	struct FQuat                                       B;                                                        // (Parm)
	float                                              Slerp;                                                    // (Parm)
	struct FQuat                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.QuatToRotator
struct UObject_QuatToRotator_Params
{
	struct FQuat                                       A;                                                        // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.QuatFromRotator
struct UObject_QuatFromRotator_Params
{
	struct FRotator                                    A;                                                        // (Parm)
	struct FQuat                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.QuatFromAxisAndAngle
struct UObject_QuatFromAxisAndAngle_Params
{
	struct FVector                                     Axis;                                                     // (Parm)
	float                                              Angle;                                                    // (Parm)
	struct FQuat                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.QuatFindBetween
struct UObject_QuatFindBetween_Params
{
	struct FVector                                     A;                                                        // (Parm)
	struct FVector                                     B;                                                        // (Parm)
	struct FQuat                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.QuatRotateVector
struct UObject_QuatRotateVector_Params
{
	struct FQuat                                       A;                                                        // (Parm)
	struct FVector                                     B;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.QuatInvert
struct UObject_QuatInvert_Params
{
	struct FQuat                                       A;                                                        // (Parm)
	struct FQuat                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.QuatProduct
struct UObject_QuatProduct_Params
{
	struct FQuat                                       A;                                                        // (Parm)
	struct FQuat                                       B;                                                        // (Parm)
	struct FQuat                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.InterpCurveGetInputDomain
struct UObject_InterpCurveGetInputDomain_Params
{
	struct FInterpCurve                                curve;                                                    // (Parm, NeedCtorLink)
	float                                              Min;                                                      // (Parm, OutParm)
	float                                              Max;                                                      // (Parm, OutParm)
};

// Function Core.Object.InterpCurveGetOutputRange
struct UObject_InterpCurveGetOutputRange_Params
{
	struct FInterpCurve                                curve;                                                    // (Parm, NeedCtorLink)
	float                                              Min;                                                      // (Parm, OutParm)
	float                                              Max;                                                      // (Parm, OutParm)
};

// Function Core.Object.InterpCurveEval
struct UObject_InterpCurveEval_Params
{
	struct FInterpCurve                                curve;                                                    // (Parm, NeedCtorLink)
	float                                              Input;                                                    // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.NotEqual_BtrDoubleInt
struct UObject_NotEqual_BtrDoubleInt_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.EqualEqual_BtrDoubleInt
struct UObject_EqualEqual_BtrDoubleInt_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Less_BtrDoubleBtrDouble
struct UObject_Less_BtrDoubleBtrDouble_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	struct FBtrDouble                                  B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.StringToBtrDouble
struct UObject_StringToBtrDouble_Params
{
	struct FString                                     A;                                                        // (Parm, NeedCtorLink)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.BtrDoubleToInt
struct UObject_BtrDoubleToInt_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.IntToBtrDouble
struct UObject_IntToBtrDouble_Params
{
	int                                                A;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.BtrDoubleGetToStr
struct UObject_BtrDoubleGetToStr_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.SubtractEqual_BtrDoubleBtrDouble
struct UObject_SubtractEqual_BtrDoubleBtrDouble_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm, OutParm)
	struct FBtrDouble                                  B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.AddEqual_BtrDoubleBtrDouble
struct UObject_AddEqual_BtrDoubleBtrDouble_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm, OutParm)
	struct FBtrDouble                                  B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.DivideEqual_BtrDoubleBtrDouble
struct UObject_DivideEqual_BtrDoubleBtrDouble_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm, OutParm)
	struct FBtrDouble                                  B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.MultiplyEqual_BtrDoubleBtrDouble
struct UObject_MultiplyEqual_BtrDoubleBtrDouble_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm, OutParm)
	struct FBtrDouble                                  B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.NotEqual_BtrDoubleBtrDouble
struct UObject_NotEqual_BtrDoubleBtrDouble_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	struct FBtrDouble                                  B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.EqualEqual_BtrDoubleBtrDouble
struct UObject_EqualEqual_BtrDoubleBtrDouble_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	struct FBtrDouble                                  B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Subtract_BtrDoubleFloat
struct UObject_Subtract_BtrDoubleFloat_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Subtract_BtrDoubleInt
struct UObject_Subtract_BtrDoubleInt_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Subtract_BtrDoubleBtrDouble
struct UObject_Subtract_BtrDoubleBtrDouble_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	struct FBtrDouble                                  B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Add_BtrDoubleFloat
struct UObject_Add_BtrDoubleFloat_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Add_BtrDoubleInt
struct UObject_Add_BtrDoubleInt_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Add_BtrDoubleBtrDouble
struct UObject_Add_BtrDoubleBtrDouble_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	struct FBtrDouble                                  B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Divide_BtrDoubleFloat
struct UObject_Divide_BtrDoubleFloat_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Divide_BtrDoubleInt
struct UObject_Divide_BtrDoubleInt_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Divide_BtrDoubleBtrDouble
struct UObject_Divide_BtrDoubleBtrDouble_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	struct FBtrDouble                                  B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Multiply_BtrDoubleFloat
struct UObject_Multiply_BtrDoubleFloat_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Multiply_BtrDoubleInt
struct UObject_Multiply_BtrDoubleInt_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Multiply_BtrDoubleBtrDouble
struct UObject_Multiply_BtrDoubleBtrDouble_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	struct FBtrDouble                                  B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.NotEqual_NameName
struct UObject_NotEqual_NameName_Params
{
	struct FName                                       A;                                                        // (Parm)
	struct FName                                       B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.EqualEqual_NameName
struct UObject_EqualEqual_NameName_Params
{
	struct FName                                       A;                                                        // (Parm)
	struct FName                                       B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.NotEqual_ObjectObject
struct UObject_NotEqual_ObjectObject_Params
{
	class UObject*                                     A;                                                        // (Parm)
	class UObject*                                     B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.EqualEqual_ObjectObject
struct UObject_EqualEqual_ObjectObject_Params
{
	class UObject*                                     A;                                                        // (Parm)
	class UObject*                                     B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Eval
struct UObject_Eval_Params
{
	bool                                               Condition;                                                // (Parm)
	struct FString                                     ResultIfTrue;                                             // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     ResultIfFalse;                                            // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.Repl
struct UObject_Repl_Params
{
	struct FString                                     Src;                                                      // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     Match;                                                    // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     With;                                                     // (Parm, CoerceParm, NeedCtorLink)
	bool                                               bCaseSensitive;                                           // (OptionalParm, Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.StrCmp
struct UObject_StrCmp_Params
{
	struct FString                                     S;                                                        // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     t;                                                        // (Parm, CoerceParm, NeedCtorLink)
	int                                                Count;                                                    // (OptionalParm, Parm)
	bool                                               bCaseSensitive;                                           // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.KeyCode
struct UObject_KeyCode_Params
{
	struct FString                                     S;                                                        // (Parm, NeedCtorLink)
	int                                                i;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Split
struct UObject_Split_Params
{
	struct FString                                     Src;                                                      // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     Divider;                                                  // (Parm, NeedCtorLink)
	TArray<struct FString>                             Parts;                                                    // (Parm, OutParm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Divide
struct UObject_Divide_Params
{
	struct FString                                     Src;                                                      // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     Divider;                                                  // (Parm, NeedCtorLink)
	struct FString                                     LeftPart;                                                 // (Parm, OutParm, NeedCtorLink)
	struct FString                                     RightPart;                                                // (Parm, OutParm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Locs
struct UObject_Locs_Params
{
	struct FString                                     S;                                                        // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.Asc
struct UObject_Asc_Params
{
	struct FString                                     S;                                                        // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Chr
struct UObject_Chr_Params
{
	int                                                i;                                                        // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.Caps
struct UObject_Caps_Params
{
	struct FString                                     S;                                                        // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.Right
struct UObject_Right_Params
{
	struct FString                                     S;                                                        // (Parm, CoerceParm, NeedCtorLink)
	int                                                i;                                                        // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.Left
struct UObject_Left_Params
{
	struct FString                                     S;                                                        // (Parm, CoerceParm, NeedCtorLink)
	int                                                i;                                                        // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.Mid
struct UObject_Mid_Params
{
	struct FString                                     S;                                                        // (Parm, CoerceParm, NeedCtorLink)
	int                                                i;                                                        // (Parm)
	int                                                j;                                                        // (OptionalParm, Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.InStr
struct UObject_InStr_Params
{
	struct FString                                     S;                                                        // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     t;                                                        // (Parm, CoerceParm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Len
struct UObject_Len_Params
{
	struct FString                                     S;                                                        // (Parm, CoerceParm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.SubtractEqual_StrStr
struct UObject_SubtractEqual_StrStr_Params
{
	struct FString                                     A;                                                        // (Parm, OutParm, NeedCtorLink)
	struct FString                                     B;                                                        // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.AtEqual_StrStr
struct UObject_AtEqual_StrStr_Params
{
	struct FString                                     A;                                                        // (Parm, OutParm, NeedCtorLink)
	struct FString                                     B;                                                        // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.ConcatEqual_StrStr
struct UObject_ConcatEqual_StrStr_Params
{
	struct FString                                     A;                                                        // (Parm, OutParm, NeedCtorLink)
	struct FString                                     B;                                                        // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.ComplementEqual_StrStr
struct UObject_ComplementEqual_StrStr_Params
{
	struct FString                                     A;                                                        // (Parm, NeedCtorLink)
	struct FString                                     B;                                                        // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.NotEqual_StrStr
struct UObject_NotEqual_StrStr_Params
{
	struct FString                                     A;                                                        // (Parm, NeedCtorLink)
	struct FString                                     B;                                                        // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.EqualEqual_StrStr
struct UObject_EqualEqual_StrStr_Params
{
	struct FString                                     A;                                                        // (Parm, NeedCtorLink)
	struct FString                                     B;                                                        // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.GreaterEqual_StrStr
struct UObject_GreaterEqual_StrStr_Params
{
	struct FString                                     A;                                                        // (Parm, NeedCtorLink)
	struct FString                                     B;                                                        // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.LessEqual_StrStr
struct UObject_LessEqual_StrStr_Params
{
	struct FString                                     A;                                                        // (Parm, NeedCtorLink)
	struct FString                                     B;                                                        // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Greater_StrStr
struct UObject_Greater_StrStr_Params
{
	struct FString                                     A;                                                        // (Parm, NeedCtorLink)
	struct FString                                     B;                                                        // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Less_StrStr
struct UObject_Less_StrStr_Params
{
	struct FString                                     A;                                                        // (Parm, NeedCtorLink)
	struct FString                                     B;                                                        // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.At_StrStr
struct UObject_At_StrStr_Params
{
	struct FString                                     A;                                                        // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     B;                                                        // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.Concat_StrStr
struct UObject_Concat_StrStr_Params
{
	struct FString                                     A;                                                        // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     B;                                                        // (Parm, CoerceParm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Core.Object.ClockwiseFrom_IntInt
struct UObject_ClockwiseFrom_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Normalize
struct UObject_Normalize_Params
{
	struct FRotator                                    Rot;                                                      // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.OrthoRotation
struct UObject_OrthoRotation_Params
{
	struct FVector                                     X;                                                        // (Parm)
	struct FVector                                     Y;                                                        // (Parm)
	struct FVector                                     Z;                                                        // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.RotRand
struct UObject_RotRand_Params
{
	bool                                               bRoll;                                                    // (OptionalParm, Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.GetUnAxes
struct UObject_GetUnAxes_Params
{
	struct FRotator                                    A;                                                        // (Parm)
	struct FVector                                     X;                                                        // (Parm, OutParm)
	struct FVector                                     Y;                                                        // (Parm, OutParm)
	struct FVector                                     Z;                                                        // (Parm, OutParm)
};

// Function Core.Object.GetAxes
struct UObject_GetAxes_Params
{
	struct FRotator                                    A;                                                        // (Parm)
	struct FVector                                     X;                                                        // (Parm, OutParm)
	struct FVector                                     Y;                                                        // (Parm, OutParm)
	struct FVector                                     Z;                                                        // (Parm, OutParm)
};

// Function Core.Object.SubtractEqual_RotatorRotator
struct UObject_SubtractEqual_RotatorRotator_Params
{
	struct FRotator                                    A;                                                        // (Parm, OutParm)
	struct FRotator                                    B;                                                        // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.AddEqual_RotatorRotator
struct UObject_AddEqual_RotatorRotator_Params
{
	struct FRotator                                    A;                                                        // (Parm, OutParm)
	struct FRotator                                    B;                                                        // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Subtract_RotatorRotator
struct UObject_Subtract_RotatorRotator_Params
{
	struct FRotator                                    A;                                                        // (Parm)
	struct FRotator                                    B;                                                        // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Add_RotatorRotator
struct UObject_Add_RotatorRotator_Params
{
	struct FRotator                                    A;                                                        // (Parm)
	struct FRotator                                    B;                                                        // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.DivideEqual_RotatorFloat
struct UObject_DivideEqual_RotatorFloat_Params
{
	struct FRotator                                    A;                                                        // (Parm, OutParm)
	float                                              B;                                                        // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.MultiplyEqual_RotatorFloat
struct UObject_MultiplyEqual_RotatorFloat_Params
{
	struct FRotator                                    A;                                                        // (Parm, OutParm)
	float                                              B;                                                        // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Divide_RotatorFloat
struct UObject_Divide_RotatorFloat_Params
{
	struct FRotator                                    A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Multiply_FloatRotator
struct UObject_Multiply_FloatRotator_Params
{
	float                                              A;                                                        // (Parm)
	struct FRotator                                    B;                                                        // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Multiply_RotatorFloat
struct UObject_Multiply_RotatorFloat_Params
{
	struct FRotator                                    A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.NotEqual_RotatorRotator
struct UObject_NotEqual_RotatorRotator_Params
{
	struct FRotator                                    A;                                                        // (Parm)
	struct FRotator                                    B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.EqualEqual_RotatorRotator
struct UObject_EqualEqual_RotatorRotator_Params
{
	struct FRotator                                    A;                                                        // (Parm)
	struct FRotator                                    B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.MirrorVectorByNormal
struct UObject_MirrorVectorByNormal_Params
{
	struct FVector                                     Vect;                                                     // (Parm)
	struct FVector                                     Normal;                                                   // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.VRand
struct UObject_VRand_Params
{
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Invert
struct UObject_Invert_Params
{
	struct FVector                                     X;                                                        // (Parm, OutParm)
	struct FVector                                     Y;                                                        // (Parm, OutParm)
	struct FVector                                     Z;                                                        // (Parm, OutParm)
};

// Function Core.Object.Normal
struct UObject_Normal_Params
{
	struct FVector                                     A;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.VSize
struct UObject_VSize_Params
{
	struct FVector                                     A;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.SubtractEqual_VectorVector
struct UObject_SubtractEqual_VectorVector_Params
{
	struct FVector                                     A;                                                        // (Parm, OutParm)
	struct FVector                                     B;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.AddEqual_VectorVector
struct UObject_AddEqual_VectorVector_Params
{
	struct FVector                                     A;                                                        // (Parm, OutParm)
	struct FVector                                     B;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.DivideEqual_VectorFloat
struct UObject_DivideEqual_VectorFloat_Params
{
	struct FVector                                     A;                                                        // (Parm, OutParm)
	float                                              B;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.MultiplyEqual_VectorVector
struct UObject_MultiplyEqual_VectorVector_Params
{
	struct FVector                                     A;                                                        // (Parm, OutParm)
	struct FVector                                     B;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.MultiplyEqual_VectorFloat
struct UObject_MultiplyEqual_VectorFloat_Params
{
	struct FVector                                     A;                                                        // (Parm, OutParm)
	float                                              B;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Cross_VectorVector
struct UObject_Cross_VectorVector_Params
{
	struct FVector                                     A;                                                        // (Parm)
	struct FVector                                     B;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Dot_VectorVector
struct UObject_Dot_VectorVector_Params
{
	struct FVector                                     A;                                                        // (Parm)
	struct FVector                                     B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.NotEqual_VectorVector
struct UObject_NotEqual_VectorVector_Params
{
	struct FVector                                     A;                                                        // (Parm)
	struct FVector                                     B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.EqualEqual_VectorVector
struct UObject_EqualEqual_VectorVector_Params
{
	struct FVector                                     A;                                                        // (Parm)
	struct FVector                                     B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.GreaterGreater_VectorRotator
struct UObject_GreaterGreater_VectorRotator_Params
{
	struct FVector                                     A;                                                        // (Parm)
	struct FRotator                                    B;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.LessLess_VectorRotator
struct UObject_LessLess_VectorRotator_Params
{
	struct FVector                                     A;                                                        // (Parm)
	struct FRotator                                    B;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Subtract_VectorVector
struct UObject_Subtract_VectorVector_Params
{
	struct FVector                                     A;                                                        // (Parm)
	struct FVector                                     B;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Add_VectorVector
struct UObject_Add_VectorVector_Params
{
	struct FVector                                     A;                                                        // (Parm)
	struct FVector                                     B;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Divide_VectorFloat
struct UObject_Divide_VectorFloat_Params
{
	struct FVector                                     A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Multiply_VectorVector
struct UObject_Multiply_VectorVector_Params
{
	struct FVector                                     A;                                                        // (Parm)
	struct FVector                                     B;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Multiply_FloatVector
struct UObject_Multiply_FloatVector_Params
{
	float                                              A;                                                        // (Parm)
	struct FVector                                     B;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Multiply_VectorFloat
struct UObject_Multiply_VectorFloat_Params
{
	struct FVector                                     A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Subtract_PreVector
struct UObject_Subtract_PreVector_Params
{
	struct FVector                                     A;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Round
struct UObject_Round_Params
{
	float                                              A;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Ceil
struct UObject_Ceil_Params
{
	float                                              A;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Smerp
struct UObject_Smerp_Params
{
	float                                              Alpha;                                                    // (Parm)
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Lerp
struct UObject_Lerp_Params
{
	float                                              Alpha;                                                    // (Parm)
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	bool                                               bClampRange;                                              // (OptionalParm, Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.FClamp
struct UObject_FClamp_Params
{
	float                                              V;                                                        // (Parm)
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.FMax
struct UObject_FMax_Params
{
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.FMin
struct UObject_FMin_Params
{
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.FRand
struct UObject_FRand_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Square
struct UObject_Square_Params
{
	float                                              A;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Sqrt
struct UObject_Sqrt_Params
{
	float                                              A;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Loge
struct UObject_Loge_Params
{
	float                                              A;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Exp
struct UObject_Exp_Params
{
	float                                              A;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Atan
struct UObject_Atan_Params
{
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Tan
struct UObject_Tan_Params
{
	float                                              A;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Acos
struct UObject_Acos_Params
{
	float                                              A;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Cos
struct UObject_Cos_Params
{
	float                                              A;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Asin
struct UObject_Asin_Params
{
	float                                              A;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Sin
struct UObject_Sin_Params
{
	float                                              A;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Abs
struct UObject_Abs_Params
{
	float                                              A;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.SubtractEqual_FloatFloat
struct UObject_SubtractEqual_FloatFloat_Params
{
	float                                              A;                                                        // (Parm, OutParm)
	float                                              B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.AddEqual_FloatFloat
struct UObject_AddEqual_FloatFloat_Params
{
	float                                              A;                                                        // (Parm, OutParm)
	float                                              B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.DivideEqual_FloatFloat
struct UObject_DivideEqual_FloatFloat_Params
{
	float                                              A;                                                        // (Parm, OutParm)
	float                                              B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.MultiplyEqual_FloatFloat
struct UObject_MultiplyEqual_FloatFloat_Params
{
	float                                              A;                                                        // (Parm, OutParm)
	float                                              B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.NotEqual_FloatFloat
struct UObject_NotEqual_FloatFloat_Params
{
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.ComplementEqual_FloatFloat
struct UObject_ComplementEqual_FloatFloat_Params
{
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.EqualEqual_FloatFloat
struct UObject_EqualEqual_FloatFloat_Params
{
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.GreaterEqual_FloatFloat
struct UObject_GreaterEqual_FloatFloat_Params
{
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.LessEqual_FloatFloat
struct UObject_LessEqual_FloatFloat_Params
{
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Greater_FloatFloat
struct UObject_Greater_FloatFloat_Params
{
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Less_FloatFloat
struct UObject_Less_FloatFloat_Params
{
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Subtract_FloatFloat
struct UObject_Subtract_FloatFloat_Params
{
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Add_FloatFloat
struct UObject_Add_FloatFloat_Params
{
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Percent_FloatFloat
struct UObject_Percent_FloatFloat_Params
{
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Divide_FloatFloat
struct UObject_Divide_FloatFloat_Params
{
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Multiply_FloatFloat
struct UObject_Multiply_FloatFloat_Params
{
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.MultiplyMultiply_FloatFloat
struct UObject_MultiplyMultiply_FloatFloat_Params
{
	float                                              A;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Subtract_PreFloat
struct UObject_Subtract_PreFloat_Params
{
	float                                              A;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Clamp
struct UObject_Clamp_Params
{
	int                                                V;                                                        // (Parm)
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Max
struct UObject_Max_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Min
struct UObject_Min_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.SRand
struct UObject_SRand_Params
{
	int                                                Seed;                                                     // (Parm)
};

// Function Core.Object.Rand
struct UObject_Rand_Params
{
	int                                                Max;                                                      // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.SubtractSubtract_Int
struct UObject_SubtractSubtract_Int_Params
{
	int                                                A;                                                        // (Parm, OutParm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.AddAdd_Int
struct UObject_AddAdd_Int_Params
{
	int                                                A;                                                        // (Parm, OutParm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.SubtractSubtract_PreInt
struct UObject_SubtractSubtract_PreInt_Params
{
	int                                                A;                                                        // (Parm, OutParm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.AddAdd_PreInt
struct UObject_AddAdd_PreInt_Params
{
	int                                                A;                                                        // (Parm, OutParm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.SubtractEqual_IntInt
struct UObject_SubtractEqual_IntInt_Params
{
	int                                                A;                                                        // (Parm, OutParm)
	int                                                B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.AddEqual_IntInt
struct UObject_AddEqual_IntInt_Params
{
	int                                                A;                                                        // (Parm, OutParm)
	int                                                B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.DivideEqual_IntFloat
struct UObject_DivideEqual_IntFloat_Params
{
	int                                                A;                                                        // (Parm, OutParm)
	float                                              B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.MultiplyEqual_IntFloat
struct UObject_MultiplyEqual_IntFloat_Params
{
	int                                                A;                                                        // (Parm, OutParm)
	float                                              B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Or_IntInt
struct UObject_Or_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Xor_IntInt
struct UObject_Xor_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.And_IntInt
struct UObject_And_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.NotEqual_IntInt
struct UObject_NotEqual_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.EqualEqual_IntInt
struct UObject_EqualEqual_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.GreaterEqual_IntInt
struct UObject_GreaterEqual_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.LessEqual_IntInt
struct UObject_LessEqual_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Greater_IntInt
struct UObject_Greater_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Less_IntInt
struct UObject_Less_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.GreaterGreaterGreater_IntInt
struct UObject_GreaterGreaterGreater_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.GreaterGreater_IntInt
struct UObject_GreaterGreater_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.LessLess_IntInt
struct UObject_LessLess_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Subtract_IntInt
struct UObject_Subtract_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Add_IntInt
struct UObject_Add_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Divide_IntInt
struct UObject_Divide_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Multiply_IntInt
struct UObject_Multiply_IntInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Subtract_PreInt
struct UObject_Subtract_PreInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Complement_PreInt
struct UObject_Complement_PreInt_Params
{
	int                                                A;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.SubtractSubtract_Byte
struct UObject_SubtractSubtract_Byte_Params
{
	unsigned char                                      A;                                                        // (Parm, OutParm)
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.AddAdd_Byte
struct UObject_AddAdd_Byte_Params
{
	unsigned char                                      A;                                                        // (Parm, OutParm)
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.SubtractSubtract_PreByte
struct UObject_SubtractSubtract_PreByte_Params
{
	unsigned char                                      A;                                                        // (Parm, OutParm)
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.AddAdd_PreByte
struct UObject_AddAdd_PreByte_Params
{
	unsigned char                                      A;                                                        // (Parm, OutParm)
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.SubtractEqual_ByteByte
struct UObject_SubtractEqual_ByteByte_Params
{
	unsigned char                                      A;                                                        // (Parm, OutParm)
	unsigned char                                      B;                                                        // (Parm)
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.AddEqual_ByteByte
struct UObject_AddEqual_ByteByte_Params
{
	unsigned char                                      A;                                                        // (Parm, OutParm)
	unsigned char                                      B;                                                        // (Parm)
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.DivideEqual_ByteByte
struct UObject_DivideEqual_ByteByte_Params
{
	unsigned char                                      A;                                                        // (Parm, OutParm)
	unsigned char                                      B;                                                        // (Parm)
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.MultiplyEqual_ByteByte
struct UObject_MultiplyEqual_ByteByte_Params
{
	unsigned char                                      A;                                                        // (Parm, OutParm)
	unsigned char                                      B;                                                        // (Parm)
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.OrOr_BoolBool
struct UObject_OrOr_BoolBool_Params
{
	bool                                               A;                                                        // (Parm)
	bool                                               B;                                                        // (Parm, SkipParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.XorXor_BoolBool
struct UObject_XorXor_BoolBool_Params
{
	bool                                               A;                                                        // (Parm)
	bool                                               B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.AndAnd_BoolBool
struct UObject_AndAnd_BoolBool_Params
{
	bool                                               A;                                                        // (Parm)
	bool                                               B;                                                        // (Parm, SkipParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.NotEqual_BoolBool
struct UObject_NotEqual_BoolBool_Params
{
	bool                                               A;                                                        // (Parm)
	bool                                               B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.EqualEqual_BoolBool
struct UObject_EqualEqual_BoolBool_Params
{
	bool                                               A;                                                        // (Parm)
	bool                                               B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.Not_PreBool
struct UObject_Not_PreBool_Params
{
	bool                                               A;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.BtrTimeToBtrDouble
struct UObject_BtrTimeToBtrDouble_Params
{
	struct FBtrTime                                    A;                                                        // (Parm, OutParm)
	struct FBtrDouble                                  B;                                                        // (Parm, OutParm)
};

// Function Core.Object.BtrDoubleLessEqual
struct UObject_BtrDoubleLessEqual_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm, OutParm)
	struct FBtrDouble                                  B;                                                        // (Parm, OutParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.BtrDoubleToBtrTime
struct UObject_BtrDoubleToBtrTime_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm, OutParm)
	struct FBtrTime                                    B;                                                        // (Parm, OutParm)
};

// Function Core.Object.GetLocalTimeToBtrTime
struct UObject_GetLocalTimeToBtrTime_Params
{
	struct FBtrTime                                    A;                                                        // (Parm, OutParm)
};

// Function Core.Object.GetLocalTimeToBtrDouble
struct UObject_GetLocalTimeToBtrDouble_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm, OutParm)
};

// Function Core.Object.BtrDoublePlus
struct UObject_BtrDoublePlus_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	struct FBtrDouble                                  B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.BtrDoubleMinus
struct UObject_BtrDoubleMinus_Params
{
	struct FBtrDouble                                  A;                                                        // (Parm)
	struct FBtrDouble                                  B;                                                        // (Parm)
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.EmptyBtrTime
struct UObject_EmptyBtrTime_Params
{
	struct FBtrTime                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.EmptyBtrDouble
struct UObject_EmptyBtrDouble_Params
{
	struct FBtrDouble                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.BtrTimeSubstract
struct UObject_BtrTimeSubstract_Params
{
	struct FBtrTime                                    leftT;                                                    // (Parm)
	struct FBtrTime                                    rightT;                                                   // (Parm)
	struct FBtrTime                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Object.BtrTimeToBtrDayTime
struct UObject_BtrTimeToBtrDayTime_Params
{
	struct FBtrTime                                    it;                                                       // (Parm)
	struct FBtrTime                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Core.Commandlet.Main
struct UCommandlet_Main_Params
{
	struct FString                                     Parms;                                                    // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
