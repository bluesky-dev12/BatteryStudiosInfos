// Arctic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

#include "../SDK.hpp"

namespace Classes
{
//---------------------------------------------------------------------------
//Functions
//---------------------------------------------------------------------------

// Function XInterface.GUI.GetModLogo
// (Native, Public)
// Parameters:
// struct FString                 ModDir                         (Parm, NeedCtorLink)
// class UMaterial*               ReturnValue                    (Parm, OutParm, ReturnParm)

class UMaterial* UGUI::GetModLogo(const struct FString& ModDir)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUI.GetModLogo");

	UGUI_GetModLogo_Params params;
	params.ModDir = ModDir;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUI.GetModValue
// (Native, Public)
// Parameters:
// struct FString                 ModDir                         (Parm, NeedCtorLink)
// struct FString                 ModKey                         (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUI::GetModValue(const struct FString& ModDir, const struct FString& ModKey)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUI.GetModValue");

	UGUI_GetModValue_Params params;
	params.ModDir = ModDir;
	params.ModKey = ModKey;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUI.GetModList
// (Native, Public)
// Parameters:
// TArray<struct FString>         ModDirs                        (Parm, OutParm, NeedCtorLink)
// TArray<struct FString>         ModTitles                      (Parm, OutParm, NeedCtorLink)

void UGUI::GetModList(TArray<struct FString>* ModDirs, TArray<struct FString>* ModTitles)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUI.GetModList");

	UGUI_GetModList_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ModDirs != nullptr)
		*ModDirs = params.ModDirs;
	if (ModTitles != nullptr)
		*ModTitles = params.ModTitles;
}


// Function XInterface.GUI.Profile
// (Native, Public)
// Parameters:
// struct FString                 ProfileName                    (Parm, NeedCtorLink)

void UGUI::Profile(const struct FString& ProfileName)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUI.Profile");

	UGUI_Profile_Params params;
	params.ProfileName = ProfileName;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUI.JoinArray
// (Final, Defined, Static, Public)
// Parameters:
// TArray<struct FString>         StringArray                    (Parm, NeedCtorLink)
// struct FString                 Delim                          (OptionalParm, Parm, NeedCtorLink)
// bool                           bIgnoreBlanks                  (OptionalParm, Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUI::STATIC_JoinArray(TArray<struct FString> StringArray, const struct FString& Delim, bool bIgnoreBlanks)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUI.JoinArray");

	UGUI_JoinArray_Params params;
	params.StringArray = StringArray;
	params.Delim = Delim;
	params.bIgnoreBlanks = bIgnoreBlanks;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUI.IsDigit
// (Defined, Static, Public)
// Parameters:
// struct FString                 Test                           (Parm, NeedCtorLink)
// bool                           bAllowDecimal                  (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUI::STATIC_IsDigit(const struct FString& Test, bool bAllowDecimal)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUI.IsDigit");

	UGUI_IsDigit_Params params;
	params.Test = Test;
	params.bAllowDecimal = bAllowDecimal;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.GetCurrentCanvas
// (Defined, Public)
// Parameters:
// class UCanvas*                 ReturnValue                    (Parm, OutParm, ReturnParm)

class UCanvas* UGUIComponent::GetCurrentCanvas()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.GetCurrentCanvas");

	UGUIComponent_GetCurrentCanvas_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.DebugTabOrder
// (Public)

void UGUIComponent::DebugTabOrder()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.DebugTabOrder");

	UGUIComponent_DebugTabOrder_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.LevelChanged
// (Defined, Public)

void UGUIComponent::LevelChanged()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.LevelChanged");

	UGUIComponent_LevelChanged_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.SetEnabled
// (Defined, Public)
// Parameters:
// bool                           Value                          (Parm)

void UGUIComponent::SetEnabled(bool Value)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.SetEnabled");

	UGUIComponent_SetEnabled_Params params;
	params.Value = Value;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.DisableMe
// (Defined, Public)

void UGUIComponent::DisableMe()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.DisableMe");

	UGUIComponent_DisableMe_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.EnableMe
// (Defined, Public)

void UGUIComponent::EnableMe()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.EnableMe");

	UGUIComponent_EnableMe_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.SetFlicker
// (Defined, Public)
// Parameters:
// bool                           Value                          (Parm)

void UGUIComponent::SetFlicker(bool Value)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.SetFlicker");

	UGUIComponent_SetFlicker_Params params;
	params.Value = Value;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.DisableComponent
// (Final, Defined, Public)
// Parameters:
// class UGUIComponent*           Comp                           (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::DisableComponent(class UGUIComponent* Comp)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.DisableComponent");

	UGUIComponent_DisableComponent_Params params;
	params.Comp = Comp;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.EnableComponent
// (Final, Defined, Public)
// Parameters:
// class UGUIComponent*           Comp                           (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::EnableComponent(class UGUIComponent* Comp)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.EnableComponent");

	UGUIComponent_EnableComponent_Params params;
	params.Comp = Comp;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.KillAnimation
// (Defined, Public)

void UGUIComponent::KillAnimation()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.KillAnimation");

	UGUIComponent_KillAnimation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.DAnimate
// (Defined, Public)
// Parameters:
// float                          NewLeft                        (Parm)
// float                          NewTop                         (Parm)
// float                          NewWidth                       (Parm)
// float                          NewHeight                      (Parm)
// float                          PositionTime                   (OptionalParm, Parm)
// float                          DimensionTime                  (OptionalParm, Parm)

void UGUIComponent::DAnimate(float NewLeft, float NewTop, float NewWidth, float NewHeight, float PositionTime, float DimensionTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.DAnimate");

	UGUIComponent_DAnimate_Params params;
	params.NewLeft = NewLeft;
	params.NewTop = NewTop;
	params.NewWidth = NewWidth;
	params.NewHeight = NewHeight;
	params.PositionTime = PositionTime;
	params.DimensionTime = DimensionTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.Resize
// (Defined, Public)
// Parameters:
// float                          NewWidth                       (Parm)
// float                          NewHeight                      (Parm)
// float                          Time                           (OptionalParm, Parm)

void UGUIComponent::Resize(float NewWidth, float NewHeight, float Time)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.Resize");

	UGUIComponent_Resize_Params params;
	params.NewWidth = NewWidth;
	params.NewHeight = NewHeight;
	params.Time = Time;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.Animate
// (Defined, Public)
// Parameters:
// float                          NewLeft                        (Parm)
// float                          NewTop                         (Parm)
// float                          Time                           (OptionalParm, Parm)

void UGUIComponent::Animate(float NewLeft, float NewTop, float Time)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.Animate");

	UGUIComponent_Animate_Params params;
	params.NewLeft = NewLeft;
	params.NewTop = NewTop;
	params.Time = Time;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.EndAnimation
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Animating                      (ExportObject, Parm, NeedCtorLink, EditInline)
// TEnumAsByte<EAnimationType>    Type                           (Parm)

void UGUIComponent::EndAnimation(class UGUIComponent* Animating, TEnumAsByte<EAnimationType> Type)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.EndAnimation");

	UGUIComponent_EndAnimation_Params params;
	params.Animating = Animating;
	params.Type = Type;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.BeginAnimation
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Animating                      (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::BeginAnimation(class UGUIComponent* Animating)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.BeginAnimation");

	UGUIComponent_BeginAnimation_Params params;
	params.Animating = Animating;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OwnerPage
// (Defined, Event, Public)
// Parameters:
// class UGUIPage*                ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIPage* UGUIComponent::OwnerPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OwnerPage");

	UGUIComponent_OwnerPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.DebugFocusPosition
// (Final, Defined, Public)
// Parameters:
// class UGUIComponent*           Who                            (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           Last                           (Parm)

void UGUIComponent::DebugFocusPosition(class UGUIComponent* Who, bool Last)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.DebugFocusPosition");

	UGUIComponent_DebugFocusPosition_Params params;
	params.Who = Who;
	params.Last = Last;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.DebugFocus
// (Final, Defined, Public)
// Parameters:
// class UGUIComponent*           Who                            (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bLose                          (Parm)

void UGUIComponent::DebugFocus(class UGUIComponent* Who, bool bLose)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.DebugFocus");

	UGUIComponent_DebugFocus_Params params;
	params.Who = Who;
	params.bLose = bLose;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.SetTooltip
// (Defined, Public)
// Parameters:
// class UGUIToolTip*             InTooltip                      (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::SetTooltip(class UGUIToolTip* InTooltip)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.SetTooltip");

	UGUIComponent_SetTooltip_Params params;
	params.InTooltip = InTooltip;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.SetToolTipText
// (Defined, Public)
// Parameters:
// struct FString                 NewToolTipText                 (Parm, NeedCtorLink)

void UGUIComponent::SetToolTipText(const struct FString& NewToolTipText)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.SetToolTipText");

	UGUIComponent_SetToolTipText_Params params;
	params.NewToolTipText = NewToolTipText;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.SetHint
// (Defined, Public)
// Parameters:
// struct FString                 NewHint                        (Parm, NeedCtorLink)

void UGUIComponent::SetHint(const struct FString& NewHint)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.SetHint");

	UGUIComponent_SetHint_Params params;
	params.NewHint = NewHint;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.SetFriendlyLabel
// (Defined, Public)
// Parameters:
// class UGUILabel*               NewLabel                       (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::SetFriendlyLabel(class UGUILabel* NewLabel)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.SetFriendlyLabel");

	UGUIComponent_SetFriendlyLabel_Params params;
	params.NewLabel = NewLabel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.SetFocusInstead
// (Defined, Public)
// Parameters:
// class UGUIComponent*           InFocusComp                    (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::SetFocusInstead(class UGUIComponent* InFocusComp)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.SetFocusInstead");

	UGUIComponent_SetFocusInstead_Params params;
	params.InFocusComp = InFocusComp;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.Show
// (Defined, Event, Public)

void UGUIComponent::Show()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.Show");

	UGUIComponent_Show_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.Hide
// (Defined, Event, Public)

void UGUIComponent::Hide()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.Hide");

	UGUIComponent_Hide_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.CenterMouse
// (Defined, Public)

void UGUIComponent::CenterMouse()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.CenterMouse");

	UGUIComponent_CenterMouse_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.SetVisibility
// (Defined, Event, Public)
// Parameters:
// bool                           bIsVisible                     (Parm, CoerceParm)

void UGUIComponent::SetVisibility(bool bIsVisible)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.SetVisibility");

	UGUIComponent_SetVisibility_Params params;
	params.bIsVisible = bIsVisible;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.FillOwner
// (Defined, Public)

void UGUIComponent::FillOwner()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.FillOwner");

	UGUIComponent_FillOwner_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.PrevPage
// (Defined, Event, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::PrevPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.PrevPage");

	UGUIComponent_PrevPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.NextPage
// (Defined, Event, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::NextPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.NextPage");

	UGUIComponent_NextPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.PrevControl
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::PrevControl(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.PrevControl");

	UGUIComponent_PrevControl_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.NextControl
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::NextControl(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.NextControl");

	UGUIComponent_NextControl_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.FocusLast
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::FocusLast(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.FocusLast");

	UGUIComponent_FocusLast_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.FocusFirst
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::FocusFirst(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.FocusFirst");

	UGUIComponent_FocusFirst_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.LoseFocus
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::LoseFocus(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.LoseFocus");

	UGUIComponent_LoseFocus_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.SetFocus
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Who                            (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::SetFocus(class UGUIComponent* Who)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.SetFocus");

	UGUIComponent_SetFocus_Params params;
	params.Who = Who;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.CanAcceptFocus
// (Defined, Event, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::CanAcceptFocus()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.CanAcceptFocus");

	UGUIComponent_CanAcceptFocus_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.IsInClientBounds
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::IsInClientBounds()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.IsInClientBounds");

	UGUIComponent_IsInClientBounds_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.IsInBounds
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::IsInBounds()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.IsInBounds");

	UGUIComponent_IsInBounds_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.TraversalApplyAWinPos
// (Defined, Public)

void UGUIComponent::TraversalApplyAWinPos()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.TraversalApplyAWinPos");

	UGUIComponent_TraversalApplyAWinPos_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.ApplyAWinPos
// (Defined, Public)

void UGUIComponent::ApplyAWinPos()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.ApplyAWinPos");

	UGUIComponent_ApplyAWinPos_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.GetTopMenuOwner
// (Defined, Public)
// Parameters:
// class UGUIComponent*           ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIComponent* UGUIComponent::GetTopMenuOwner()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.GetTopMenuOwner");

	UGUIComponent_GetTopMenuOwner_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.InitComponent
// (Defined, Event, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.InitComponent");

	UGUIComponent_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.DropStateChange
// (Defined, Event, Public)
// Parameters:
// TEnumAsByte<EeDropState>       NewState                       (Parm)

void UGUIComponent::DropStateChange(TEnumAsByte<EeDropState> NewState)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.DropStateChange");

	UGUIComponent_DropStateChange_Params params;
	params.NewState = NewState;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.IsMultiSelect
// (Defined, Event, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::IsMultiSelect()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.IsMultiSelect");

	UGUIComponent_IsMultiSelect_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.MenuStateChange
// (Defined, Event, Public)
// Parameters:
// TEnumAsByte<EeMenuState>       NewState                       (Parm)

void UGUIComponent::MenuStateChange(TEnumAsByte<EeMenuState> NewState)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.MenuStateChange");

	UGUIComponent_MenuStateChange_Params params;
	params.NewState = NewState;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.MakeColorCode
// (Defined, Static, Public)
// Parameters:
// struct FColor                  NewColor                       (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIComponent::STATIC_MakeColorCode(const struct FColor& NewColor)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.MakeColorCode");

	UGUIComponent_MakeColorCode_Params params;
	params.NewColor = NewColor;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.StripColorCodes
// (Defined, Static, Public)
// Parameters:
// struct FString                 InString                       (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIComponent::STATIC_StripColorCodes(const struct FString& InString)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.StripColorCodes");

	UGUIComponent_StripColorCodes_Params params;
	params.InString = InString;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.SaveINI
// (Defined, Public)
// Parameters:
// struct FString                 Value                          (OptionalParm, Parm, NeedCtorLink)

void UGUIComponent::SaveINI(const struct FString& Value)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.SaveINI");

	UGUIComponent_SaveINI_Params params;
	params.Value = Value;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.LoadINI
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIComponent::LoadINI()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.LoadINI");

	UGUIComponent_LoadINI_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.free
// (Defined, Event, Public)

void UGUIComponent::free()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.free");

	UGUIComponent_free_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.Closed
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bCancelled                     (Parm)

void UGUIComponent::Closed(class UGUIComponent* Sender, bool bCancelled)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.Closed");

	UGUIComponent_Closed_Params params;
	params.Sender = Sender;
	params.bCancelled = bCancelled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.Opened
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::Opened(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.Opened");

	UGUIComponent_Opened_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.Timer
// (Defined, Event, Public)

void UGUIComponent::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.Timer");

	UGUIComponent_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.AdditionalDebugString
// (Defined, Event, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIComponent::AdditionalDebugString()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.AdditionalDebugString");

	UGUIComponent_AdditionalDebugString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.SpecialHit
// (Final, Native, Public)
// Parameters:
// bool                           bForce                         (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::SpecialHit(bool bForce)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.SpecialHit");

	UGUIComponent_SpecialHit_Params params;
	params.bForce = bForce;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.GetMenuPath
// (Final, Native, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIComponent::GetMenuPath()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.GetMenuPath");

	UGUIComponent_GetMenuPath_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.IsInIncompleteLetter
// (Final, Native, Public)
// Parameters:
// struct FString                 strUserName                    (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::IsInIncompleteLetter(const struct FString& strUserName)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.IsInIncompleteLetter");

	UGUIComponent_IsInIncompleteLetter_Params params;
	params.strUserName = strUserName;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.IsCorrectUserName_THAILAND
// (Final, Native, Public)
// Parameters:
// struct FString                 strUserName                    (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIComponent::IsCorrectUserName_THAILAND(const struct FString& strUserName)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.IsCorrectUserName_THAILAND");

	UGUIComponent_IsCorrectUserName_THAILAND_Params params;
	params.strUserName = strUserName;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.IsCorrectUserName_China
// (Final, Native, Public)
// Parameters:
// struct FString                 strUserName                    (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIComponent::IsCorrectUserName_China(const struct FString& strUserName)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.IsCorrectUserName_China");

	UGUIComponent_IsCorrectUserName_China_Params params;
	params.strUserName = strUserName;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.IsCorrectUserName
// (Final, Native, Public)
// Parameters:
// struct FString                 strUserName                    (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIComponent::IsCorrectUserName(const struct FString& strUserName)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.IsCorrectUserName");

	UGUIComponent_IsCorrectUserName_Params params;
	params.strUserName = strUserName;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.SetPosition
// (Defined, Public)
// Parameters:
// float                          NewLeft                        (Parm)
// float                          NewTop                         (Parm)
// float                          NewWidth                       (Parm)
// float                          NewHeight                      (Parm)
// bool                           bForceRelative                 (OptionalParm, Parm)

void UGUIComponent::SetPosition(float NewLeft, float NewTop, float NewWidth, float NewHeight, bool bForceRelative)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.SetPosition");

	UGUIComponent_SetPosition_Params params;
	params.NewLeft = NewLeft;
	params.NewTop = NewTop;
	params.NewWidth = NewWidth;
	params.NewHeight = NewHeight;
	params.bForceRelative = bForceRelative;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.ResolutionChanged
// (Event, Public)
// Parameters:
// int                            ResX                           (Parm)
// int                            ResY                           (Parm)

void UGUIComponent::ResolutionChanged(int ResX, int ResY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.ResolutionChanged");

	UGUIComponent_ResolutionChanged_Params params;
	params.ResX = ResX;
	params.ResY = ResY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.RelativeHeight
// (Final, Native, Public)
// Parameters:
// float                          RealHeight                     (OptionalParm, Parm, CoerceParm)
// bool                           bForce                         (OptionalParm, Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGUIComponent::RelativeHeight(float RealHeight, bool bForce)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.RelativeHeight");

	UGUIComponent_RelativeHeight_Params params;
	params.RealHeight = RealHeight;
	params.bForce = bForce;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.RelativeWidth
// (Final, Native, Public)
// Parameters:
// float                          RealWidth                      (OptionalParm, Parm, CoerceParm)
// bool                           bForce                         (OptionalParm, Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGUIComponent::RelativeWidth(float RealWidth, bool bForce)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.RelativeWidth");

	UGUIComponent_RelativeWidth_Params params;
	params.RealWidth = RealWidth;
	params.bForce = bForce;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.RelativeTop
// (Final, Native, Public)
// Parameters:
// float                          RealTop                        (OptionalParm, Parm, CoerceParm)
// bool                           bForce                         (OptionalParm, Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGUIComponent::RelativeTop(float RealTop, bool bForce)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.RelativeTop");

	UGUIComponent_RelativeTop_Params params;
	params.RealTop = RealTop;
	params.bForce = bForce;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.RelativeLeft
// (Final, Native, Public)
// Parameters:
// float                          RealLeft                       (OptionalParm, Parm, CoerceParm)
// bool                           bForce                         (OptionalParm, Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGUIComponent::RelativeLeft(float RealLeft, bool bForce)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.RelativeLeft");

	UGUIComponent_RelativeLeft_Params params;
	params.RealLeft = RealLeft;
	params.bForce = bForce;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.ActualTop
// (Final, Native, Public)
// Parameters:
// float                          val                            (OptionalParm, Parm, CoerceParm)
// bool                           bForce                         (OptionalParm, Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGUIComponent::ActualTop(float val, bool bForce)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.ActualTop");

	UGUIComponent_ActualTop_Params params;
	params.val = val;
	params.bForce = bForce;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.ActualLeft
// (Final, Native, Public)
// Parameters:
// float                          val                            (OptionalParm, Parm, CoerceParm)
// bool                           bForce                         (OptionalParm, Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGUIComponent::ActualLeft(float val, bool bForce)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.ActualLeft");

	UGUIComponent_ActualLeft_Params params;
	params.val = val;
	params.bForce = bForce;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.ActualHeight
// (Final, Native, Public)
// Parameters:
// float                          val                            (OptionalParm, Parm, CoerceParm)
// bool                           bForce                         (OptionalParm, Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGUIComponent::ActualHeight(float val, bool bForce)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.ActualHeight");

	UGUIComponent_ActualHeight_Params params;
	params.val = val;
	params.bForce = bForce;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.ActualWidth
// (Final, Native, Public)
// Parameters:
// float                          val                            (OptionalParm, Parm, CoerceParm)
// bool                           bForce                         (OptionalParm, Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGUIComponent::ActualWidth(float val, bool bForce)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.ActualWidth");

	UGUIComponent_ActualWidth_Params params;
	params.val = val;
	params.bForce = bForce;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.UpdateBounds
// (Final, Native, Public)

void UGUIComponent::UpdateBounds()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.UpdateBounds");

	UGUIComponent_UpdateBounds_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.UpdateOffset
// (Final, Native, Public)
// Parameters:
// float                          PosX                           (Parm)
// float                          PosY                           (Parm)
// float                          PosW                           (Parm)
// float                          PosH                           (Parm)

void UGUIComponent::UpdateOffset(float PosX, float PosY, float PosW, float PosH)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.UpdateOffset");

	UGUIComponent_UpdateOffset_Params params;
	params.PosX = PosX;
	params.PosY = PosY;
	params.PosW = PosW;
	params.PosH = PosH;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.AutoPositionOn
// (Final, Native, Public)
// Parameters:
// TArray<class UGUIComponent*>   Components                     (Parm, NeedCtorLink)
// class UGUIComponent*           frame                          (ExportObject, Parm, NeedCtorLink, EditInline)
// float                          LeftPadPerc                    (Parm)
// float                          UpperPadPerc                   (Parm)
// float                          RightPadPerc                   (Parm)
// float                          LowerPadPerc                   (Parm)
// int                            NumberOfColumns                (OptionalParm, Parm)
// float                          ColumnPadding                  (OptionalParm, Parm)

void UGUIComponent::AutoPositionOn(TArray<class UGUIComponent*> Components, class UGUIComponent* frame, float LeftPadPerc, float UpperPadPerc, float RightPadPerc, float LowerPadPerc, int NumberOfColumns, float ColumnPadding)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.AutoPositionOn");

	UGUIComponent_AutoPositionOn_Params params;
	params.Components = Components;
	params.frame = frame;
	params.LeftPadPerc = LeftPadPerc;
	params.UpperPadPerc = UpperPadPerc;
	params.RightPadPerc = RightPadPerc;
	params.LowerPadPerc = LowerPadPerc;
	params.NumberOfColumns = NumberOfColumns;
	params.ColumnPadding = ColumnPadding;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.AutoPosition
// (Final, Native, Public)
// Parameters:
// TArray<class UGUIComponent*>   Components                     (Parm, NeedCtorLink)
// float                          LeftBound                      (Parm)
// float                          UpperBound                     (Parm)
// float                          RightBound                     (Parm)
// float                          LowerBound                     (Parm)
// float                          LeftPad                        (Parm)
// float                          UpperPad                       (Parm)
// float                          RightPad                       (Parm)
// float                          LowerPad                       (Parm)
// int                            NumberOfColumns                (OptionalParm, Parm)
// float                          ColumnPadding                  (OptionalParm, Parm)

void UGUIComponent::AutoPosition(TArray<class UGUIComponent*> Components, float LeftBound, float UpperBound, float RightBound, float LowerBound, float LeftPad, float UpperPad, float RightPad, float LowerPad, int NumberOfColumns, float ColumnPadding)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.AutoPosition");

	UGUIComponent_AutoPosition_Params params;
	params.Components = Components;
	params.LeftBound = LeftBound;
	params.UpperBound = UpperBound;
	params.RightBound = RightBound;
	params.LowerBound = LowerBound;
	params.LeftPad = LeftPad;
	params.UpperPad = UpperPad;
	params.RightPad = RightPad;
	params.LowerPad = LowerPad;
	params.NumberOfColumns = NumberOfColumns;
	params.ColumnPadding = ColumnPadding;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.KillTimer
// (Final, Native, Public)
// Parameters:
// struct FName                   TimerFunc                      (OptionalParm, Parm)

void UGUIComponent::KillTimer(const struct FName& TimerFunc)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.KillTimer");

	UGUIComponent_KillTimer_Params params;
	params.TimerFunc = TimerFunc;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.SetTimer
// (Final, Native, Public)
// Parameters:
// float                          Interval                       (Parm)
// bool                           bRepeat                        (OptionalParm, Parm)
// struct FName                   TimerFunc                      (OptionalParm, Parm)

void UGUIComponent::SetTimer(float Interval, bool bRepeat, const struct FName& TimerFunc)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.SetTimer");

	UGUIComponent_SetTimer_Params params;
	params.Interval = Interval;
	params.bRepeat = bRepeat;
	params.TimerFunc = TimerFunc;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.PlayerOwner
// (Final, Native, Public)
// Parameters:
// class APlayerController*       ReturnValue                    (Parm, OutParm, ReturnParm)

class APlayerController* UGUIComponent::PlayerOwner()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.PlayerOwner");

	UGUIComponent_PlayerOwner_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnDragOver
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::OnDragOver(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnDragOver");

	UGUIComponent_OnDragOver_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnDragLeave
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::OnDragLeave(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnDragLeave");

	UGUIComponent_OnDragLeave_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnDragEnter
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::OnDragEnter(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnDragEnter");

	UGUIComponent_OnDragEnter_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnDragDrop
// (Defined, Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::OnDragDrop(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnDragDrop");

	UGUIComponent_OnDragDrop_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnEndDrag
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bAccepted                      (Parm)

void UGUIComponent::OnEndDrag(class UGUIComponent* Sender, bool bAccepted)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnEndDrag");

	UGUIComponent_OnEndDrag_Params params;
	params.Sender = Sender;
	params.bAccepted = bAccepted;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnBeginDrag
// (Defined, Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::OnBeginDrag(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnBeginDrag");

	UGUIComponent_OnBeginDrag_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnMultiSelect
// (Defined, Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::OnMultiSelect(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnMultiSelect");

	UGUIComponent_OnMultiSelect_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnSaveINI
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIComponent::OnSaveINI(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnSaveINI");

	UGUIComponent_OnSaveINI_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnLoadINI
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// struct FString                 S                              (Parm, NeedCtorLink)

void UGUIComponent::OnLoadINI(class UGUIComponent* Sender, const struct FString& S)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnLoadINI");

	UGUIComponent_OnLoadINI_Params params;
	params.Sender = Sender;
	params.S = S;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnCapturedMouseMove
// (Defined, Public, Delegate)
// Parameters:
// float                          deltaX                         (Parm)
// float                          deltaY                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::OnCapturedMouseMove(float deltaX, float deltaY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnCapturedMouseMove");

	UGUIComponent_OnCapturedMouseMove_Params params;
	params.deltaX = deltaX;
	params.deltaY = deltaY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnDesignModeKeyEvent
// (Defined, Public, Delegate)
// Parameters:
// TEnumAsByte<EInputKey>         key                            (Parm)
// TEnumAsByte<EInputAction>      State                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::OnDesignModeKeyEvent(TEnumAsByte<EInputKey> key, TEnumAsByte<EInputAction> State)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnDesignModeKeyEvent");

	UGUIComponent_OnDesignModeKeyEvent_Params params;
	params.key = key;
	params.State = State;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnKeyEvent
// (Defined, Public, Delegate)
// Parameters:
// unsigned char                  key                            (Parm, OutParm)
// unsigned char                  State                          (Parm, OutParm)
// float                          Delta                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::OnKeyEvent(float Delta, unsigned char* key, unsigned char* State)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnKeyEvent");

	UGUIComponent_OnKeyEvent_Params params;
	params.Delta = Delta;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (key != nullptr)
		*key = params.key;
	if (State != nullptr)
		*State = params.State;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnKeyType
// (Defined, Public, Delegate)
// Parameters:
// unsigned char                  key                            (Parm, OutParm)
// struct FString                 Unicode                        (OptionalParm, Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::OnKeyType(const struct FString& Unicode, unsigned char* key)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnKeyType");

	UGUIComponent_OnKeyType_Params params;
	params.Unicode = Unicode;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (key != nullptr)
		*key = params.key;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnChange
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::OnChange(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnChange");

	UGUIComponent_OnChange_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnTimer
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::OnTimer(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnTimer");

	UGUIComponent_OnTimer_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnMouseRelease
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::OnMouseRelease(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnMouseRelease");

	UGUIComponent_OnMouseRelease_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnMousePressed
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bRepeat                        (Parm)

void UGUIComponent::OnMousePressed(class UGUIComponent* Sender, bool bRepeat)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnMousePressed");

	UGUIComponent_OnMousePressed_Params params;
	params.Sender = Sender;
	params.bRepeat = bRepeat;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnRightClick
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::OnRightClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnRightClick");

	UGUIComponent_OnRightClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnDblClick
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::OnDblClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnDblClick");

	UGUIComponent_OnDblClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnClick
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::OnClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnClick");

	UGUIComponent_OnClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnHover
// (Defined, Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::OnHover(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnHover");

	UGUIComponent_OnHover_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnInvalidate
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Who                            (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComponent::OnInvalidate(class UGUIComponent* Who)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnInvalidate");

	UGUIComponent_OnInvalidate_Params params;
	params.Who = Who;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnEndTooltip
// (Defined, Public, Delegate)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::OnEndTooltip()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnEndTooltip");

	UGUIComponent_OnEndTooltip_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnBeginTooltip
// (Defined, Public, Delegate)
// Parameters:
// class UGUIToolTip*             ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIToolTip* UGUIComponent::OnBeginTooltip()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnBeginTooltip");

	UGUIComponent_OnBeginTooltip_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnShow
// (Public, Delegate)

void UGUIComponent::OnShow()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnShow");

	UGUIComponent_OnShow_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnHide
// (Public, Delegate)

void UGUIComponent::OnHide()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnHide");

	UGUIComponent_OnHide_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnMessage
// (Public, Delegate)
// Parameters:
// struct FString                 Msg                            (Parm, CoerceParm, NeedCtorLink)
// float                          MsgLife                        (Parm)

void UGUIComponent::OnMessage(const struct FString& Msg, float MsgLife)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnMessage");

	UGUIComponent_OnMessage_Params params;
	params.Msg = Msg;
	params.MsgLife = MsgLife;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnHitTest
// (Public, Delegate)
// Parameters:
// float                          MouseX                         (Parm)
// float                          MouseY                         (Parm)

void UGUIComponent::OnHitTest(float MouseX, float MouseY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnHitTest");

	UGUIComponent_OnHitTest_Params params;
	params.MouseX = MouseX;
	params.MouseY = MouseY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnWatch
// (Public, Delegate)

void UGUIComponent::OnWatch()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnWatch");

	UGUIComponent_OnWatch_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnDeActivate
// (Public, Delegate)

void UGUIComponent::OnDeActivate()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnDeActivate");

	UGUIComponent_OnDeActivate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnActivate
// (Public, Delegate)

void UGUIComponent::OnActivate()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnActivate");

	UGUIComponent_OnActivate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnRendered
// (Defined, Public, Delegate)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)

void UGUIComponent::OnRendered(class UCanvas* Canvas)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnRendered");

	UGUIComponent_OnRendered_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnRender
// (Defined, Public, Delegate)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)

void UGUIComponent::OnRender(class UCanvas* Canvas)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnRender");

	UGUIComponent_OnRender_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnDraw
// (Defined, Public, Delegate)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::OnDraw(class UCanvas* Canvas)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnDraw");

	UGUIComponent_OnDraw_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnPreDraw
// (Defined, Public, Delegate)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComponent::OnPreDraw(class UCanvas* Canvas)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnPreDraw");

	UGUIComponent_OnPreDraw_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComponent.OnEndAnimation
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// TEnumAsByte<EAnimationType>    Type                           (Parm)

void UGUIComponent::OnEndAnimation(class UGUIComponent* Sender, TEnumAsByte<EAnimationType> Type)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnEndAnimation");

	UGUIComponent_OnEndAnimation_Params params;
	params.Sender = Sender;
	params.Type = Type;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComponent.OnArrival
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// TEnumAsByte<EAnimationType>    Type                           (Parm)

void UGUIComponent::OnArrival(class UGUIComponent* Sender, TEnumAsByte<EAnimationType> Type)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComponent.OnArrival");

	UGUIComponent_OnArrival_Params params;
	params.Sender = Sender;
	params.Type = Type;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.RecursiveActiveOwner
// (Defined, Public)
// Parameters:
// class UGUIComponent*           checkComponent                 (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIMultiComponent::RecursiveActiveOwner(class UGUIComponent* checkComponent)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.RecursiveActiveOwner");

	UGUIMultiComponent_RecursiveActiveOwner_Params params;
	params.checkComponent = checkComponent;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiComponent.TraversalApplyAWinPos
// (Defined, Public)

void UGUIMultiComponent::TraversalApplyAWinPos()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.TraversalApplyAWinPos");

	UGUIMultiComponent_TraversalApplyAWinPos_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.NewComponent
// (Defined, Public)
// Parameters:
// class UGUIComponent*           newcompo                       (ExportObject, Parm, NeedCtorLink, EditInline)
// struct FFloatBox               fbNewCompo                     (Parm)
// float                          RenderWeight                   (OptionalParm, Parm)
// class UGUIMultiComponent*      ParentComponent                (ExportObject, OptionalParm, Parm, NeedCtorLink, EditInline)
// class UGUIComponent*           ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIComponent* UGUIMultiComponent::NewComponent(class UGUIComponent* newcompo, const struct FFloatBox& fbNewCompo, float RenderWeight, class UGUIMultiComponent* ParentComponent)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.NewComponent");

	UGUIMultiComponent_NewComponent_Params params;
	params.newcompo = newcompo;
	params.fbNewCompo = fbNewCompo;
	params.RenderWeight = RenderWeight;
	params.ParentComponent = ParentComponent;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiComponent.CheckDuplicateTabOrder
// (Defined, Public)

void UGUIMultiComponent::CheckDuplicateTabOrder()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.CheckDuplicateTabOrder");

	UGUIMultiComponent_CheckDuplicateTabOrder_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.CheckInvalidTabOrder
// (Defined, Public)

void UGUIMultiComponent::CheckInvalidTabOrder()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.CheckInvalidTabOrder");

	UGUIMultiComponent_CheckInvalidTabOrder_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.DebugTabOrder
// (Defined, Public)

void UGUIMultiComponent::DebugTabOrder()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.DebugTabOrder");

	UGUIMultiComponent_DebugTabOrder_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.CenterMouse
// (Defined, Public)

void UGUIMultiComponent::CenterMouse()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.CenterMouse");

	UGUIMultiComponent_CenterMouse_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.LevelChanged
// (Defined, Public)

void UGUIMultiComponent::LevelChanged()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.LevelChanged");

	UGUIMultiComponent_LevelChanged_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.EndAnimation
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Animating                      (ExportObject, Parm, NeedCtorLink, EditInline)
// TEnumAsByte<EAnimationType>    Type                           (Parm)

void UGUIMultiComponent::EndAnimation(class UGUIComponent* Animating, TEnumAsByte<EAnimationType> Type)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.EndAnimation");

	UGUIMultiComponent_EndAnimation_Params params;
	params.Animating = Animating;
	params.Type = Type;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.BeginAnimation
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Animating                      (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIMultiComponent::BeginAnimation(class UGUIComponent* Animating)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.BeginAnimation");

	UGUIMultiComponent_BeginAnimation_Params params;
	params.Animating = Animating;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.free
// (Defined, Event, Public)

void UGUIMultiComponent::free()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.free");

	UGUIMultiComponent_free_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.Closed
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bCancelled                     (Parm)

void UGUIMultiComponent::Closed(class UGUIComponent* Sender, bool bCancelled)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.Closed");

	UGUIMultiComponent_Closed_Params params;
	params.Sender = Sender;
	params.bCancelled = bCancelled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.Opened
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIMultiComponent::Opened(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.Opened");

	UGUIMultiComponent_Opened_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.SetVisibility
// (Defined, Event, Public)
// Parameters:
// bool                           bIsVisible                     (Parm)

void UGUIMultiComponent::SetVisibility(bool bIsVisible)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.SetVisibility");

	UGUIMultiComponent_SetVisibility_Params params;
	params.bIsVisible = bIsVisible;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.DisableMe
// (Defined, Singular, Public)

void UGUIMultiComponent::DisableMe()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.DisableMe");

	UGUIMultiComponent_DisableMe_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.EnableMe
// (Defined, Singular, Public)

void UGUIMultiComponent::EnableMe()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.EnableMe");

	UGUIMultiComponent_EnableMe_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.PrevControl
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIMultiComponent::PrevControl(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.PrevControl");

	UGUIMultiComponent_PrevControl_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiComponent.NextControl
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIMultiComponent::NextControl(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.NextControl");

	UGUIMultiComponent_NextControl_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiComponent.FocusLast
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIMultiComponent::FocusLast(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.FocusLast");

	UGUIMultiComponent_FocusLast_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiComponent.FocusFirst
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIMultiComponent::FocusFirst(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.FocusFirst");

	UGUIMultiComponent_FocusFirst_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiComponent.CanAcceptFocus
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIMultiComponent::CanAcceptFocus()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.CanAcceptFocus");

	UGUIMultiComponent_CanAcceptFocus_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiComponent.LoseFocus
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIMultiComponent::LoseFocus(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.LoseFocus");

	UGUIMultiComponent_LoseFocus_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.SetFocus
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Who                            (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIMultiComponent::SetFocus(class UGUIComponent* Who)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.SetFocus");

	UGUIMultiComponent_SetFocus_Params params;
	params.Who = Who;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.SetFocusInstead
// (Defined, Public)
// Parameters:
// class UGUIComponent*           InFocusComp                    (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIMultiComponent::SetFocusInstead(class UGUIComponent* InFocusComp)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.SetFocusInstead");

	UGUIMultiComponent_SetFocusInstead_Params params;
	params.InFocusComp = InFocusComp;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.RemoveComponent
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Comp                           (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           SkipRemap                      (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIMultiComponent::RemoveComponent(class UGUIComponent* Comp, bool SkipRemap)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.RemoveComponent");

	UGUIMultiComponent_RemoveComponent_Params params;
	params.Comp = Comp;
	params.SkipRemap = SkipRemap;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiComponent.AppendComponent
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           NewComp                        (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           SkipRemap                      (OptionalParm, Parm)
// class UGUIComponent*           ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIComponent* UGUIMultiComponent::AppendComponent(class UGUIComponent* NewComp, bool SkipRemap)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.AppendComponent");

	UGUIMultiComponent_AppendComponent_Params params;
	params.NewComp = NewComp;
	params.SkipRemap = SkipRemap;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiComponent.InsertComponent
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           NewComp                        (ExportObject, Parm, NeedCtorLink, EditInline)
// int                            Index                          (Parm)
// bool                           SkipRemap                      (OptionalParm, Parm)
// class UGUIComponent*           ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIComponent* UGUIMultiComponent::InsertComponent(class UGUIComponent* NewComp, int Index, bool SkipRemap)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.InsertComponent");

	UGUIMultiComponent_InsertComponent_Params params;
	params.NewComp = NewComp;
	params.Index = Index;
	params.SkipRemap = SkipRemap;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiComponent.AddComponent
// (Defined, Event, Public)
// Parameters:
// struct FString                 ComponentClass                 (Parm, NeedCtorLink)
// bool                           SkipRemap                      (OptionalParm, Parm)
// class UGUIComponent*           ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIComponent* UGUIMultiComponent::AddComponent(const struct FString& ComponentClass, bool SkipRemap)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.AddComponent");

	UGUIMultiComponent_AddComponent_Params params;
	params.ComponentClass = ComponentClass;
	params.SkipRemap = SkipRemap;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiComponent.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIMultiComponent::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.InitComponent");

	UGUIMultiComponent_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.InternalOnShow
// (Public)

void UGUIMultiComponent::InternalOnShow()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.InternalOnShow");

	UGUIMultiComponent_InternalOnShow_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.FindComponentIndex
// (Final, Native, Public)
// Parameters:
// class UGUIComponent*           Who                            (ExportObject, Parm, NeedCtorLink, EditInline)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIMultiComponent::FindComponentIndex(class UGUIComponent* Who)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.FindComponentIndex");

	UGUIMultiComponent_FindComponentIndex_Params params;
	params.Who = Who;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiComponent.RemapComponents
// (Final, Native, Public)

void UGUIMultiComponent::RemapComponents()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.RemapComponents");

	UGUIMultiComponent_RemapComponents_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.InitializeControls
// (Final, Native, Public)

void UGUIMultiComponent::InitializeControls()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.InitializeControls");

	UGUIMultiComponent_InitializeControls_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.OnCreateComponent
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           NewComponent                   (ExportObject, Parm, NeedCtorLink, EditInline)
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIMultiComponent::OnCreateComponent(class UGUIComponent* NewComponent, class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.OnCreateComponent");

	UGUIMultiComponent_OnCreateComponent_Params params;
	params.NewComponent = NewComponent;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiComponent.NotifyContextSelect
// (Defined, Public, Delegate)
// Parameters:
// class UGUIContextMenu*         Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// int                            ClickIndex                     (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIMultiComponent::NotifyContextSelect(class UGUIContextMenu* Sender, int ClickIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.NotifyContextSelect");

	UGUIMultiComponent_NotifyContextSelect_Params params;
	params.Sender = Sender;
	params.ClickIndex = ClickIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiComponent.HandleContextMenuClose
// (Defined, Public, Delegate)
// Parameters:
// class UGUIContextMenu*         Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIMultiComponent::HandleContextMenuClose(class UGUIContextMenu* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.HandleContextMenuClose");

	UGUIMultiComponent_HandleContextMenuClose_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiComponent.HandleContextMenuOpen
// (Defined, Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// class UGUIContextMenu*         Menu                           (ExportObject, Parm, NeedCtorLink, EditInline)
// class UGUIComponent*           ContextMenuOwner               (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIMultiComponent::HandleContextMenuOpen(class UGUIComponent* Sender, class UGUIContextMenu* Menu, class UGUIComponent* ContextMenuOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiComponent.HandleContextMenuOpen");

	UGUIMultiComponent_HandleContextMenuOpen_Params params;
	params.Sender = Sender;
	params.Menu = Menu;
	params.ContextMenuOwner = ContextMenuOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIStyles.Initialize
// (Defined, Event, Public)

void UGUIStyles::Initialize()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIStyles.Initialize");

	UGUIStyles_Initialize_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIStyles.btrDrawTextStyles
// (Native, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// TEnumAsByte<EeMenuState>       MenuState                      (Parm)
// float                          Left                           (Parm)
// float                          Top                            (Parm)
// float                          width                          (Parm)
// float                          Height                         (Parm)
// TEnumAsByte<EeTextAlign>       Align                          (Parm)
// struct FString                 Text                           (Parm, NeedCtorLink)
// TEnumAsByte<EeFontScale>       FontScale                      (Parm)
// int                            FontSize                       (Parm)
// float                          R                              (Parm)
// float                          G                              (Parm)
// float                          B                              (Parm)
// float                          A                              (Parm)

void UGUIStyles::btrDrawTextStyles(class UCanvas* Canvas, TEnumAsByte<EeMenuState> MenuState, float Left, float Top, float width, float Height, TEnumAsByte<EeTextAlign> Align, const struct FString& Text, TEnumAsByte<EeFontScale> FontScale, int FontSize, float R, float G, float B, float A)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIStyles.btrDrawTextStyles");

	UGUIStyles_btrDrawTextStyles_Params params;
	params.Canvas = Canvas;
	params.MenuState = MenuState;
	params.Left = Left;
	params.Top = Top;
	params.width = width;
	params.Height = Height;
	params.Align = Align;
	params.Text = Text;
	params.FontScale = FontScale;
	params.FontSize = FontSize;
	params.R = R;
	params.G = G;
	params.B = B;
	params.A = A;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIStyles.btrTextSizeStyles
// (Native, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// TEnumAsByte<EeMenuState>       MenuState                      (Parm)
// struct FString                 Text                           (Parm, NeedCtorLink)
// float                          XL                             (Parm, OutParm)
// float                          YL                             (Parm, OutParm)
// TEnumAsByte<EeFontScale>       FontScale                      (Parm)
// int                            FontSize                       (Parm)

void UGUIStyles::btrTextSizeStyles(class UCanvas* Canvas, TEnumAsByte<EeMenuState> MenuState, const struct FString& Text, TEnumAsByte<EeFontScale> FontScale, int FontSize, float* XL, float* YL)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIStyles.btrTextSizeStyles");

	UGUIStyles_btrTextSizeStyles_Params params;
	params.Canvas = Canvas;
	params.MenuState = MenuState;
	params.Text = Text;
	params.FontScale = FontScale;
	params.FontSize = FontSize;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (XL != nullptr)
		*XL = params.XL;
	if (YL != nullptr)
		*YL = params.YL;
}


// Function XInterface.GUIStyles.TextSize
// (Final, Native, Static, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// TEnumAsByte<EeMenuState>       MenuState                      (Parm)
// struct FString                 Text                           (Parm, NeedCtorLink)
// float                          XL                             (Parm, OutParm)
// float                          YL                             (Parm, OutParm)
// TEnumAsByte<EeFontScale>       FontScale                      (Parm)

void UGUIStyles::STATIC_TextSize(class UCanvas* Canvas, TEnumAsByte<EeMenuState> MenuState, const struct FString& Text, TEnumAsByte<EeFontScale> FontScale, float* XL, float* YL)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIStyles.TextSize");

	UGUIStyles_TextSize_Params params;
	params.Canvas = Canvas;
	params.MenuState = MenuState;
	params.Text = Text;
	params.FontScale = FontScale;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (XL != nullptr)
		*XL = params.XL;
	if (YL != nullptr)
		*YL = params.YL;
}


// Function XInterface.GUIStyles.DrawText
// (Final, Native, Static, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// TEnumAsByte<EeMenuState>       MenuState                      (Parm)
// float                          Left                           (Parm)
// float                          Top                            (Parm)
// float                          width                          (Parm)
// float                          Height                         (Parm)
// TEnumAsByte<EeTextAlign>       Align                          (Parm)
// struct FString                 Text                           (Parm, NeedCtorLink)
// TEnumAsByte<EeFontScale>       FontScale                      (Parm)

void UGUIStyles::STATIC_DrawText(class UCanvas* Canvas, TEnumAsByte<EeMenuState> MenuState, float Left, float Top, float width, float Height, TEnumAsByte<EeTextAlign> Align, const struct FString& Text, TEnumAsByte<EeFontScale> FontScale)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIStyles.DrawText");

	UGUIStyles_DrawText_Params params;
	params.Canvas = Canvas;
	params.MenuState = MenuState;
	params.Left = Left;
	params.Top = Top;
	params.width = width;
	params.Height = Height;
	params.Align = Align;
	params.Text = Text;
	params.FontScale = FontScale;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIStyles.Draw
// (Final, Native, Static, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// TEnumAsByte<EeMenuState>       MenuState                      (Parm)
// float                          Left                           (Parm)
// float                          Top                            (Parm)
// float                          width                          (Parm)
// float                          Height                         (Parm)

void UGUIStyles::STATIC_Draw(class UCanvas* Canvas, TEnumAsByte<EeMenuState> MenuState, float Left, float Top, float width, float Height)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIStyles.Draw");

	UGUIStyles_Draw_Params params;
	params.Canvas = Canvas;
	params.MenuState = MenuState;
	params.Left = Left;
	params.Top = Top;
	params.width = width;
	params.Height = Height;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIStyles.OnDrawText
// (Public, Delegate)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// TEnumAsByte<EeMenuState>       MenuState                      (Parm)
// float                          Left                           (Parm)
// float                          Top                            (Parm)
// float                          width                          (Parm)
// float                          Height                         (Parm)
// TEnumAsByte<EeTextAlign>       Align                          (Parm)
// struct FString                 Text                           (Parm, NeedCtorLink)
// TEnumAsByte<EeFontScale>       FontScale                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIStyles::OnDrawText(class UCanvas* Canvas, TEnumAsByte<EeMenuState> MenuState, float Left, float Top, float width, float Height, TEnumAsByte<EeTextAlign> Align, const struct FString& Text, TEnumAsByte<EeFontScale> FontScale)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIStyles.OnDrawText");

	UGUIStyles_OnDrawText_Params params;
	params.Canvas = Canvas;
	params.MenuState = MenuState;
	params.Left = Left;
	params.Top = Top;
	params.width = width;
	params.Height = Height;
	params.Align = Align;
	params.Text = Text;
	params.FontScale = FontScale;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIStyles.OnDraw
// (Public, Delegate)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// TEnumAsByte<EeMenuState>       MenuState                      (Parm)
// float                          Left                           (Parm)
// float                          Top                            (Parm)
// float                          width                          (Parm)
// float                          Height                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIStyles::OnDraw(class UCanvas* Canvas, TEnumAsByte<EeMenuState> MenuState, float Left, float Top, float width, float Height)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIStyles.OnDraw");

	UGUIStyles_OnDraw_Params params;
	params.Canvas = Canvas;
	params.MenuState = MenuState;
	params.Left = Left;
	params.Top = Top;
	params.width = width;
	params.Height = Height;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIFont.LoadFont
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// class UFont*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UFont* UGUIFont::LoadFont(int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIFont.LoadFont");

	UGUIFont_LoadFont_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIFont.LoadFontStatic
// (Defined, Static, Public)
// Parameters:
// int                            i                              (Parm)
// class UFont*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UFont* UGUIFont::STATIC_LoadFontStatic(int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIFont.LoadFontStatic");

	UGUIFont_LoadFontStatic_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIFont.GetFont
// (Native, Event, Public)
// Parameters:
// int                            XRes                           (Parm)
// class UFont*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UFont* UGUIFont::GetFont(int XRes)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIFont.GetFont");

	UGUIFont_GetFont_Params params;
	params.XRes = XRes;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.ShowQuestionDialog
// (Defined, Public)
// Parameters:
// struct FString                 Question                       (Parm, NeedCtorLink)
// unsigned char                  Buttons                        (OptionalParm, Parm)
// unsigned char                  defButton                      (OptionalParm, Parm)
// class UGUIQuestionPage*        ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIQuestionPage* UGUIController::ShowQuestionDialog(const struct FString& Question, unsigned char Buttons, unsigned char defButton)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.ShowQuestionDialog");

	UGUIController_ShowQuestionDialog_Params params;
	params.Question = Question;
	params.Buttons = Buttons;
	params.defButton = defButton;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.KeyPressed
// (Final, Defined, Public)
// Parameters:
// TEnumAsByte<EInputKey>         iKey                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::KeyPressed(TEnumAsByte<EInputKey> iKey)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.KeyPressed");

	UGUIController_KeyPressed_Params params;
	params.iKey = iKey;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.SearchBinds
// (Final, Defined, Public)
// Parameters:
// struct FString                 BindAliasMask                  (Parm, NeedCtorLink)
// TArray<struct FString>         BindAliases                    (Parm, OutParm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::SearchBinds(const struct FString& BindAliasMask, TArray<struct FString>* BindAliases)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.SearchBinds");

	UGUIController_SearchBinds_Params params;
	params.BindAliasMask = BindAliasMask;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (BindAliases != nullptr)
		*BindAliases = params.BindAliases;

	return params.ReturnValue;
}


// Function XInterface.GUIController.GetAssignedKeys
// (Final, Defined, Public)
// Parameters:
// struct FString                 BindAlias                      (Parm, NeedCtorLink)
// TArray<struct FString>         BindKeyNames                   (Parm, OutParm, NeedCtorLink)
// TArray<struct FString>         LocalizedBindKeyNames          (Parm, OutParm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::GetAssignedKeys(const struct FString& BindAlias, TArray<struct FString>* BindKeyNames, TArray<struct FString>* LocalizedBindKeyNames)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetAssignedKeys");

	UGUIController_GetAssignedKeys_Params params;
	params.BindAlias = BindAlias;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (BindKeyNames != nullptr)
		*BindKeyNames = params.BindKeyNames;
	if (LocalizedBindKeyNames != nullptr)
		*LocalizedBindKeyNames = params.LocalizedBindKeyNames;

	return params.ReturnValue;
}


// Function XInterface.GUIController.GetCurrentBind
// (Final, Defined, Public)
// Parameters:
// struct FString                 BindKeyName                    (Parm, NeedCtorLink)
// struct FString                 BindKeyValue                   (Parm, OutParm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::GetCurrentBind(const struct FString& BindKeyName, struct FString* BindKeyValue)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetCurrentBind");

	UGUIController_GetCurrentBind_Params params;
	params.BindKeyName = BindKeyName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (BindKeyValue != nullptr)
		*BindKeyValue = params.BindKeyValue;

	return params.ReturnValue;
}


// Function XInterface.GUIController.KeyNameFromIndex
// (Final, Defined, Public)
// Parameters:
// unsigned char                  iKey                           (Parm)
// struct FString                 KeyName                        (Parm, OutParm, NeedCtorLink)
// struct FString                 LocalizedKeyName               (Parm, OutParm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::KeyNameFromIndex(unsigned char iKey, struct FString* KeyName, struct FString* LocalizedKeyName)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.KeyNameFromIndex");

	UGUIController_KeyNameFromIndex_Params params;
	params.iKey = iKey;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (KeyName != nullptr)
		*KeyName = params.KeyName;
	if (LocalizedKeyName != nullptr)
		*LocalizedKeyName = params.LocalizedKeyName;

	return params.ReturnValue;
}


// Function XInterface.GUIController.SetKeyBind
// (Final, Defined, Public)
// Parameters:
// struct FString                 BindKeyName                    (Parm, NeedCtorLink)
// struct FString                 BindKeyValue                   (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::SetKeyBind(const struct FString& BindKeyName, const struct FString& BindKeyValue)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.SetKeyBind");

	UGUIController_SetKeyBind_Params params;
	params.BindKeyName = BindKeyName;
	params.BindKeyValue = BindKeyValue;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.GetQuitPage
// (Static, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIController::STATIC_GetQuitPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetQuitPage");

	UGUIController_GetQuitPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.GetSettingsPage
// (Static, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIController::STATIC_GetSettingsPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetSettingsPage");

	UGUIController_GetSettingsPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.GetModPage
// (Static, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIController::STATIC_GetModPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetModPage");

	UGUIController_GetModPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.GetInstantActionPage
// (Static, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIController::STATIC_GetInstantActionPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetInstantActionPage");

	UGUIController_GetInstantActionPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.GetMultiplayerPage
// (Static, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIController::STATIC_GetMultiplayerPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetMultiplayerPage");

	UGUIController_GetMultiplayerPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.GetServerBrowserPage
// (Static, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIController::STATIC_GetServerBrowserPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetServerBrowserPage");

	UGUIController_GetServerBrowserPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.GetSinglePlayerPage
// (Static, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIController::STATIC_GetSinglePlayerPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetSinglePlayerPage");

	UGUIController_GetSinglePlayerPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.GetMainMenuClass
// (Final, Native, Static, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIController::STATIC_GetMainMenuClass()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetMainMenuClass");

	UGUIController_GetMainMenuClass_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.Validate
// (Event, Static, Public)

void UGUIController::STATIC_Validate()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.Validate");

	UGUIController_Validate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.ConsolidateMenus
// (Defined, Public)

void UGUIController::ConsolidateMenus()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.ConsolidateMenus");

	UGUIController_ConsolidateMenus_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.PurgeComponentClasses
// (Public)

void UGUIController::PurgeComponentClasses()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.PurgeComponentClasses");

	UGUIController_PurgeComponentClasses_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.PurgeObjectReferences
// (Defined, Public)

void UGUIController::PurgeObjectReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.PurgeObjectReferences");

	UGUIController_PurgeObjectReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.VerifyStack
// (Defined, Public)

void UGUIController::VerifyStack()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.VerifyStack");

	UGUIController_VerifyStack_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.CloseOverlays
// (Defined, Public)

void UGUIController::CloseOverlays()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.CloseOverlays");

	UGUIController_CloseOverlays_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.NotifyLevelChange
// (Defined, Event, Public)

void UGUIController::NotifyLevelChange()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.NotifyLevelChange");

	UGUIController_NotifyLevelChange_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.SetRequiredGameResolution
// (Defined, Event, Public)
// Parameters:
// struct FString                 GameRes                        (Parm, NeedCtorLink)

void UGUIController::SetRequiredGameResolution(const struct FString& GameRes)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.SetRequiredGameResolution");

	UGUIController_SetRequiredGameResolution_Params params;
	params.GameRes = GameRes;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.NeedsMenuResolution
// (Defined, Event, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::NeedsMenuResolution()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.NeedsMenuResolution");

	UGUIController_NeedsMenuResolution_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.CanShowHints
// (Defined, Event, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::CanShowHints()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.CanShowHints");

	UGUIController_CanShowHints_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.HasMouseMoved
// (Defined, Public)
// Parameters:
// float                          ErrorMargin                    (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::HasMouseMoved(float ErrorMargin)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.HasMouseMoved");

	UGUIController_HasMouseMoved_Params params;
	params.ErrorMargin = ErrorMargin;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.MoveFocused
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           C                              (ExportObject, Parm, NeedCtorLink, EditInline)
// int                            bmLeft                         (Parm)
// int                            bmTop                          (Parm)
// int                            bmWidth                        (Parm)
// int                            bmHeight                       (Parm)
// float                          ClipX                          (Parm)
// float                          ClipY                          (Parm)
// float                          val                            (Parm)

void UGUIController::MoveFocused(class UGUIComponent* C, int bmLeft, int bmTop, int bmWidth, int bmHeight, float ClipX, float ClipY, float val)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.MoveFocused");

	UGUIController_MoveFocused_Params params;
	params.C = C;
	params.bmLeft = bmLeft;
	params.bmTop = bmTop;
	params.bmWidth = bmWidth;
	params.bmHeight = bmHeight;
	params.ClipX = ClipX;
	params.ClipY = ClipY;
	params.val = val;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.ResetFocus
// (Defined, Public)

void UGUIController::ResetFocus()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.ResetFocus");

	UGUIController_ResetFocus_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.ChangeFocus
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Who                            (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIController::ChangeFocus(class UGUIComponent* Who)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.ChangeFocus");

	UGUIController_ChangeFocus_Params params;
	params.Who = Who;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.SetControllerStatus
// (Defined, Public)
// Parameters:
// bool                           On                             (Parm)

void UGUIController::SetControllerStatus(bool On)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.SetControllerStatus");

	UGUIController_SetControllerStatus_Params params;
	params.On = On;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.PerformRestore
// (Defined, Public)

void UGUIController::PerformRestore()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.PerformRestore");

	UGUIController_PerformRestore_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.SaveRestorePages
// (Defined, Public)

void UGUIController::SaveRestorePages()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.SaveRestorePages");

	UGUIController_SaveRestorePages_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.Count
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIController::Count()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.Count");

	UGUIController_Count_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.CloseAll
// (Defined, Event, Public)
// Parameters:
// bool                           bCancel                        (Parm)
// bool                           bForced                        (OptionalParm, Parm)

void UGUIController::CloseAll(bool bCancel, bool bForced)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.CloseAll");

	UGUIController_CloseAll_Params params;
	params.bCancel = bCancel;
	params.bForced = bForced;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.ClickCloseWndBtn
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::ClickCloseWndBtn()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.ClickCloseWndBtn");

	UGUIController_ClickCloseWndBtn_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.PressedCloseWndBtn
// (Public, Delegate)

void UGUIController::PressedCloseWndBtn()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.PressedCloseWndBtn");

	UGUIController_PressedCloseWndBtn_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.CloseMenu
// (Defined, Event, Public)
// Parameters:
// bool                           bCancelled                     (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::CloseMenu(bool bCancelled)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.CloseMenu");

	UGUIController_CloseMenu_Params params;
	params.bCancelled = bCancelled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.RemoveMenu
// (Defined, Event, Public)
// Parameters:
// class UGUIPage*                Menu                           (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bCancelled                     (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::RemoveMenu(class UGUIPage* Menu, bool bCancelled)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.RemoveMenu");

	UGUIController_RemoveMenu_Params params;
	params.Menu = Menu;
	params.bCancelled = bCancelled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.RemoveMenuAt
// (Defined, Public)
// Parameters:
// int                            Index                          (Parm)
// bool                           bCancelled                     (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::RemoveMenuAt(int Index, bool bCancelled)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.RemoveMenuAt");

	UGUIController_RemoveMenuAt_Params params;
	params.Index = Index;
	params.bCancelled = bCancelled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.PopMenu
// (Defined, Event, Protected)
// Parameters:
// int                            Index                          (Parm)
// class UGUIPage*                CurMenu                        (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bCancelled                     (OptionalParm, Parm)

void UGUIController::PopMenu(int Index, class UGUIPage* CurMenu, bool bCancelled)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.PopMenu");

	UGUIController_PopMenu_Params params;
	params.Index = Index;
	params.CurMenu = CurMenu;
	params.bCancelled = bCancelled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.PushMenu
// (Defined, Event, Protected)
// Parameters:
// int                            Index                          (Parm)
// class UGUIPage*                NewMenu                        (ExportObject, Parm, NeedCtorLink, EditInline)
// struct FString                 Param1                         (OptionalParm, Parm, NeedCtorLink)
// struct FString                 Param2                         (OptionalParm, Parm, NeedCtorLink)

void UGUIController::PushMenu(int Index, class UGUIPage* NewMenu, const struct FString& Param1, const struct FString& Param2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.PushMenu");

	UGUIController_PushMenu_Params params;
	params.Index = Index;
	params.NewMenu = NewMenu;
	params.Param1 = Param1;
	params.Param2 = Param2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.ReplaceMenu2
// (Defined, Public)
// Parameters:
// struct FString                 NewMenuName                    (Parm, NeedCtorLink)
// bool                           bCancelled                     (OptionalParm, Parm)

void UGUIController::ReplaceMenu2(const struct FString& NewMenuName, bool bCancelled)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.ReplaceMenu2");

	UGUIController_ReplaceMenu2_Params params;
	params.NewMenuName = NewMenuName;
	params.bCancelled = bCancelled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.ReplaceMenu2_FadedOut
// (Defined, Public)

void UGUIController::ReplaceMenu2_FadedOut()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.ReplaceMenu2_FadedOut");

	UGUIController_ReplaceMenu2_FadedOut_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.CloseMenuPage
// (Defined, Public)
// Parameters:
// class UGUIPage*                SelectPage                     (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bCancelled                     (OptionalParm, Parm)

void UGUIController::CloseMenuPage(class UGUIPage* SelectPage, bool bCancelled)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.CloseMenuPage");

	UGUIController_CloseMenuPage_Params params;
	params.SelectPage = SelectPage;
	params.bCancelled = bCancelled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.ReplaceMenu
// (Defined, Event, Public)
// Parameters:
// struct FString                 NewMenuName                    (Parm, NeedCtorLink)
// struct FString                 Param1                         (OptionalParm, Parm, NeedCtorLink)
// struct FString                 Param2                         (OptionalParm, Parm, NeedCtorLink)
// bool                           bCancelled                     (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::ReplaceMenu(const struct FString& NewMenuName, const struct FString& Param1, const struct FString& Param2, bool bCancelled)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.ReplaceMenu");

	UGUIController_ReplaceMenu_Params params;
	params.NewMenuName = NewMenuName;
	params.Param1 = Param1;
	params.Param2 = Param2;
	params.bCancelled = bCancelled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.AutoLoadMenus
// (Defined, Event, Public)

void UGUIController::AutoLoadMenus()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.AutoLoadMenus");

	UGUIController_AutoLoadMenus_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.OpenMenuByObject
// (Defined, Public)
// Parameters:
// class UGUIPage*                NewMenu                        (ExportObject, Parm, NeedCtorLink, EditInline)
// struct FString                 Param1                         (OptionalParm, Parm, NeedCtorLink)
// struct FString                 Param2                         (OptionalParm, Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::OpenMenuByObject(class UGUIPage* NewMenu, const struct FString& Param1, const struct FString& Param2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.OpenMenuByObject");

	UGUIController_OpenMenuByObject_Params params;
	params.NewMenu = NewMenu;
	params.Param1 = Param1;
	params.Param2 = Param2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.OpenMenu
// (Defined, Event, Public)
// Parameters:
// struct FString                 NewMenuName                    (Parm, NeedCtorLink)
// struct FString                 Param1                         (OptionalParm, Parm, NeedCtorLink)
// struct FString                 Param2                         (OptionalParm, Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::OpenMenu(const struct FString& NewMenuName, const struct FString& Param1, const struct FString& Param2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.OpenMenu");

	UGUIController_OpenMenu_Params params;
	params.NewMenuName = NewMenuName;
	params.Param1 = Param1;
	params.Param2 = Param2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.CreateMenu
// (Defined, Event, Public)
// Parameters:
// struct FString                 NewMenuName                    (Parm, NeedCtorLink)
// class UGUIPage*                ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIPage* UGUIController::CreateMenu(const struct FString& NewMenuName)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.CreateMenu");

	UGUIController_CreateMenu_Params params;
	params.NewMenuName = NewMenuName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.GetLastMenu
// (Defined, Public)
// Parameters:
// class UGUIPage*                ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIPage* UGUIController::GetLastMenu()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetLastMenu");

	UGUIController_GetLastMenu_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.LogControlInfo
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIController::LogControlInfo(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.LogControlInfo");

	UGUIController_LogControlInfo_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.LogControllerInfo
// (Defined, Public)

void UGUIController::LogControllerInfo()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.LogControllerInfo");

	UGUIController_LogControllerInfo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.LogMenuStack
// (Defined, Public)

void UGUIController::LogMenuStack()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.LogMenuStack");

	UGUIController_LogMenuStack_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.GetMenuByIndex
// (Defined, Public)
// Parameters:
// int                            Index                          (Parm)
// class UGUIPage*                ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIPage* UGUIController::GetMenuByIndex(int Index)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetMenuByIndex");

	UGUIController_GetMenuByIndex_Params params;
	params.Index = Index;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.FindMenuByClass
// (Defined, Public)
// Parameters:
// class UClass*                  PageClass                      (Parm)
// class UGUIPage*                ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIPage* UGUIController::FindMenuByClass(class UClass* PageClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.FindMenuByClass");

	UGUIController_FindMenuByClass_Params params;
	params.PageClass = PageClass;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.FindPersistentMenuByClass
// (Defined, Public)
// Parameters:
// class UClass*                  PageClass                      (Parm)
// class UGUIPage*                ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIPage* UGUIController::FindPersistentMenuByClass(class UClass* PageClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.FindPersistentMenuByClass");

	UGUIController_FindPersistentMenuByClass_Params params;
	params.PageClass = PageClass;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.FindPersistentMenuIndex
// (Defined, Event, Public)
// Parameters:
// class UGUIPage*                Menu                           (ExportObject, Parm, NeedCtorLink, EditInline)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIController::FindPersistentMenuIndex(class UGUIPage* Menu)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.FindPersistentMenuIndex");

	UGUIController_FindPersistentMenuIndex_Params params;
	params.Menu = Menu;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.FindMenuIndex
// (Defined, Event, Public)
// Parameters:
// class UGUIPage*                Menu                           (ExportObject, Parm, NeedCtorLink, EditInline)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIController::FindMenuIndex(class UGUIPage* Menu)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.FindMenuIndex");

	UGUIController_FindMenuIndex_Params params;
	params.Menu = Menu;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.FindMenuIndexByName
// (Defined, Event, Public)
// Parameters:
// struct FString                 MenuClass                      (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIController::FindMenuIndexByName(const struct FString& MenuClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.FindMenuIndexByName");

	UGUIController_FindMenuIndexByName_Params params;
	params.MenuClass = MenuClass;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.FindPersistentMenuByName
// (Defined, Event, Public)
// Parameters:
// struct FString                 MenuClass                      (Parm, NeedCtorLink)
// class UGUIPage*                ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIPage* UGUIController::FindPersistentMenuByName(const struct FString& MenuClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.FindPersistentMenuByName");

	UGUIController_FindPersistentMenuByName_Params params;
	params.MenuClass = MenuClass;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.AddComponentClass
// (Defined, Event, Public)
// Parameters:
// struct FString                 ClassName                      (Parm, NeedCtorLink)
// class UClass*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class UClass* UGUIController::AddComponentClass(const struct FString& ClassName)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.AddComponentClass");

	UGUIController_AddComponentClass_Params params;
	params.ClassName = ClassName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.RegisterStyle
// (Defined, Public)
// Parameters:
// class UClass*                  StyleClass                     (Parm)
// bool                           bTemporary                     (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::RegisterStyle(class UClass* StyleClass, bool bTemporary)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.RegisterStyle");

	UGUIController_RegisterStyle_Params params;
	params.StyleClass = StyleClass;
	params.bTemporary = bTemporary;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.PrecachePlayerRecords
// (Defined, Public)

void UGUIController::PrecachePlayerRecords()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.PrecachePlayerRecords");

	UGUIController_PrecachePlayerRecords_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.InitializeController
// (Defined, Event, Public)

void UGUIController::InitializeController()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.InitializeController");

	UGUIController_InitializeController_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.TopPage
// (Defined, Public)
// Parameters:
// class UGUIPage*                ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIPage* UGUIController::TopPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.TopPage");

	UGUIController_TopPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.GetTeamSymbolList
// (Final, Defined, Public)
// Parameters:
// TArray<struct FString>         SymbolNames                    (Parm, OutParm, NeedCtorLink)
// bool                           bNoSinglePlayer                (OptionalParm, Parm)

void UGUIController::GetTeamSymbolList(bool bNoSinglePlayer, TArray<struct FString>* SymbolNames)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetTeamSymbolList");

	UGUIController_GetTeamSymbolList_Params params;
	params.bNoSinglePlayer = bNoSinglePlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (SymbolNames != nullptr)
		*SymbolNames = params.SymbolNames;
}


// Function XInterface.GUIController.LoadDecoText
// (Defined, Public)
// Parameters:
// struct FString                 PackageName                    (Parm, NeedCtorLink)
// struct FString                 DecoTextName                   (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIController::LoadDecoText(const struct FString& PackageName, const struct FString& DecoTextName)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.LoadDecoText");

	UGUIController_LoadDecoText_Params params;
	params.PackageName = PackageName;
	params.DecoTextName = DecoTextName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.CheckForECE
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::CheckForECE()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.CheckForECE");

	UGUIController_CheckForECE_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.AuthroizeFirewall
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::AuthroizeFirewall()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.AuthroizeFirewall");

	UGUIController_AuthroizeFirewall_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.CheckFirewall
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::CheckFirewall()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.CheckFirewall");

	UGUIController_CheckFirewall_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.LaunchURL
// (Native, Public)
// Parameters:
// struct FString                 URL                            (Parm, NeedCtorLink)

void UGUIController::LaunchURL(const struct FString& URL)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.LaunchURL");

	UGUIController_LaunchURL_Params params;
	params.URL = URL;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.GetMapList
// (Final, Native, Public)
// Parameters:
// struct FString                 Prefix                         (Parm, NeedCtorLink)
// class UGUIList*                List                           (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bDecoText                      (OptionalParm, Parm)

void UGUIController::GetMapList(const struct FString& Prefix, class UGUIList* List, bool bDecoText)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetMapList");

	UGUIController_GetMapList_Params params;
	params.Prefix = Prefix;
	params.List = List;
	params.bDecoText = bDecoText;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.GetWeaponList
// (Final, Native, Public)
// Parameters:
// TArray<class UClass*>          WeaponClass                    (Parm, OutParm, NeedCtorLink)
// TArray<struct FString>         WeaponDesc                     (Parm, OutParm, NeedCtorLink)

void UGUIController::GetWeaponList(TArray<class UClass*>* WeaponClass, TArray<struct FString>* WeaponDesc)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetWeaponList");

	UGUIController_GetWeaponList_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (WeaponClass != nullptr)
		*WeaponClass = params.WeaponClass;
	if (WeaponDesc != nullptr)
		*WeaponDesc = params.WeaponDesc;
}


// Function XInterface.GUIController.SaveOwnageList
// (Native, Public)
// Parameters:
// TArray<struct FeOwnageMap>     Maps                           (Parm, NeedCtorLink)

void UGUIController::SaveOwnageList(TArray<struct FeOwnageMap> Maps)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.SaveOwnageList");

	UGUIController_SaveOwnageList_Params params;
	params.Maps = Maps;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.GetOwnageList
// (Native, Public)
// Parameters:
// TArray<int>                    RLevel                         (Parm, OutParm, NeedCtorLink)
// TArray<struct FString>         MNames                         (Parm, OutParm, NeedCtorLink)
// TArray<struct FString>         MDesc                          (Parm, OutParm, NeedCtorLink)
// TArray<struct FString>         mURL                           (Parm, OutParm, NeedCtorLink)

void UGUIController::GetOwnageList(TArray<int>* RLevel, TArray<struct FString>* MNames, TArray<struct FString>* MDesc, TArray<struct FString>* mURL)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetOwnageList");

	UGUIController_GetOwnageList_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (RLevel != nullptr)
		*RLevel = params.RLevel;
	if (MNames != nullptr)
		*MNames = params.MNames;
	if (MDesc != nullptr)
		*MDesc = params.MDesc;
	if (mURL != nullptr)
		*mURL = params.mURL;
}


// Function XInterface.GUIController.GetDEMHeader
// (Native, Public)
// Parameters:
// struct FString                 DemoName                       (Parm, NeedCtorLink)
// struct FString                 MapName                        (Parm, OutParm, NeedCtorLink)
// struct FString                 GameType                       (Parm, OutParm, NeedCtorLink)
// int                            ScoreLimit                     (Parm, OutParm)
// int                            TimeLimit                      (Parm, OutParm)
// int                            ClientSide                     (Parm, OutParm)
// struct FString                 RecordedBy                     (Parm, OutParm, NeedCtorLink)
// struct FString                 TimeStamp                      (Parm, OutParm, NeedCtorLink)
// struct FString                 ReqPackages                    (Parm, OutParm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::GetDEMHeader(const struct FString& DemoName, struct FString* MapName, struct FString* GameType, int* ScoreLimit, int* TimeLimit, int* ClientSide, struct FString* RecordedBy, struct FString* TimeStamp, struct FString* ReqPackages)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetDEMHeader");

	UGUIController_GetDEMHeader_Params params;
	params.DemoName = DemoName;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (MapName != nullptr)
		*MapName = params.MapName;
	if (GameType != nullptr)
		*GameType = params.GameType;
	if (ScoreLimit != nullptr)
		*ScoreLimit = params.ScoreLimit;
	if (TimeLimit != nullptr)
		*TimeLimit = params.TimeLimit;
	if (ClientSide != nullptr)
		*ClientSide = params.ClientSide;
	if (RecordedBy != nullptr)
		*RecordedBy = params.RecordedBy;
	if (TimeStamp != nullptr)
		*TimeStamp = params.TimeStamp;
	if (ReqPackages != nullptr)
		*ReqPackages = params.ReqPackages;

	return params.ReturnValue;
}


// Function XInterface.GUIController.GetDEMList
// (Native, Public)
// Parameters:
// TArray<struct FString>         DEMFiles                       (Parm, OutParm, NeedCtorLink)

void UGUIController::GetDEMList(TArray<struct FString>* DEMFiles)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetDEMList");

	UGUIController_GetDEMList_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (DEMFiles != nullptr)
		*DEMFiles = params.DEMFiles;
}


// Function XInterface.GUIController.Profile
// (Native, Public)
// Parameters:
// struct FString                 ProfileName                    (Parm, NeedCtorLink)

void UGUIController::Profile(const struct FString& ProfileName)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.Profile");

	UGUIController_Profile_Params params;
	params.ProfileName = ProfileName;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.SetMoveControl
// (Final, Native, Public)
// Parameters:
// class UGUIComponent*           C                              (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIController::SetMoveControl(class UGUIComponent* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.SetMoveControl");

	UGUIController_SetMoveControl_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.PlayInterfaceSound
// (Final, Native, Public)
// Parameters:
// TEnumAsByte<EClickSound>       soundType                      (Parm)

void UGUIController::PlayInterfaceSound(TEnumAsByte<EClickSound> soundType)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.PlayInterfaceSound");

	UGUIController_PlayInterfaceSound_Params params;
	params.soundType = soundType;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.GetOGGList
// (Final, Native, Public)
// Parameters:
// TArray<struct FString>         OGGFiles                       (Parm, OutParm, NeedCtorLink)

void UGUIController::GetOGGList(TArray<struct FString>* OGGFiles)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetOGGList");

	UGUIController_GetOGGList_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (OGGFiles != nullptr)
		*OGGFiles = params.OGGFiles;
}


// Function XInterface.GUIController.ResetKeyboard
// (Final, Native, Public)

void UGUIController::ResetKeyboard()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.ResetKeyboard");

	UGUIController_ResetKeyboard_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.GetProfileList
// (Final, Native, Public)
// Parameters:
// struct FString                 Prefix                         (Parm, NeedCtorLink)
// TArray<struct FString>         ProfileList                    (Parm, OutParm, NeedCtorLink)

void UGUIController::GetProfileList(const struct FString& Prefix, TArray<struct FString>* ProfileList)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetProfileList");

	UGUIController_GetProfileList_Params params;
	params.Prefix = Prefix;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ProfileList != nullptr)
		*ProfileList = params.ProfileList;
}


// Function XInterface.GUIController.ResetInput
// (Final, Native, Public)

void UGUIController::ResetInput()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.ResetInput");

	UGUIController_ResetInput_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.ResetDesigner
// (Final, Native, Private)

void UGUIController::ResetDesigner()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.ResetDesigner");

	UGUIController_ResetDesigner_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.SetRenderDevice
// (Final, Native, Public)
// Parameters:
// struct FString                 NewRenderDevice                (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::SetRenderDevice(const struct FString& NewRenderDevice)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.SetRenderDevice");

	UGUIController_SetRenderDevice_Params params;
	params.NewRenderDevice = NewRenderDevice;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.GetCurrentRes
// (Final, Native, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIController::GetCurrentRes()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetCurrentRes");

	UGUIController_GetCurrentRes_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.GetStyle
// (Native, Event, Public)
// Parameters:
// struct FString                 StyleName                      (Parm, NeedCtorLink)
// TEnumAsByte<EeFontScale>       FontScale                      (Parm, OutParm)
// class UGUIStyles*              ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIStyles* UGUIController::GetStyle(const struct FString& StyleName, TEnumAsByte<EeFontScale>* FontScale)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetStyle");

	UGUIController_GetStyle_Params params;
	params.StyleName = StyleName;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (FontScale != nullptr)
		*FontScale = params.FontScale;

	return params.ReturnValue;
}


// Function XInterface.GUIController.GetMenuFont
// (Native, Event, Public)
// Parameters:
// struct FString                 FontName                       (Parm, NeedCtorLink)
// class UGUIFont*                ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIFont* UGUIController::GetMenuFont(const struct FString& FontName)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.GetMenuFont");

	UGUIController_GetMenuFont_Params params;
	params.FontName = FontName;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.AddBuddy
// (Public, Delegate)
// Parameters:
// struct FString                 NewBuddyName                   (OptionalParm, Parm, NeedCtorLink)

void UGUIController::AddBuddy(const struct FString& NewBuddyName)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.AddBuddy");

	UGUIController_AddBuddy_Params params;
	params.NewBuddyName = NewBuddyName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.OnNeedRawKeyPress
// (Public, Delegate)
// Parameters:
// unsigned char                  NewKey                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIController::OnNeedRawKeyPress(unsigned char NewKey)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.OnNeedRawKeyPress");

	UGUIController_OnNeedRawKeyPress_Params params;
	params.NewKey = NewKey;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIController.PopPage
// (Defined, Public)

void UGUIController::PopPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.PopPage");

	UGUIController_PopPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIController.PushPage
// (Defined, Public)

void UGUIController::PushPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIController.PushPage");

	UGUIController_PushPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIButton.InternalOnKeyEvent
// (Defined, Public)
// Parameters:
// unsigned char                  key                            (Parm, OutParm)
// unsigned char                  State                          (Parm, OutParm)
// float                          Delta                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIButton::InternalOnKeyEvent(float Delta, unsigned char* key, unsigned char* State)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIButton.InternalOnKeyEvent");

	UGUIButton_InternalOnKeyEvent_Params params;
	params.Delta = Delta;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (key != nullptr)
		*key = params.key;
	if (State != nullptr)
		*State = params.State;

	return params.ReturnValue;
}


// Function XInterface.GUIButton.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIButton::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIButton.InitComponent");

	UGUIButton_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIToolTip.SetTip
// (Final, Native, Public)
// Parameters:
// struct FString                 NewTip                         (Parm, CoerceParm, NeedCtorLink)

void UGUIToolTip::SetTip(const struct FString& NewTip)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIToolTip.SetTip");

	UGUIToolTip_SetTip_Params params;
	params.NewTip = NewTip;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIToolTip.GetTopBelowCursor
// (Defined, Singular, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGUIToolTip::GetTopBelowCursor(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIToolTip.GetTopBelowCursor");

	UGUIToolTip_GetTopBelowCursor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIToolTip.GetTopAboveCursor
// (Defined, Singular, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGUIToolTip::GetTopAboveCursor(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIToolTip.GetTopAboveCursor");

	UGUIToolTip_GetTopAboveCursor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIToolTip.GetHeight
// (Defined, Public, Delegate)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGUIToolTip::GetHeight(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIToolTip.GetHeight");

	UGUIToolTip_GetHeight_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIToolTip.GetWidth
// (Defined, Public, Delegate)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGUIToolTip::GetWidth(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIToolTip.GetWidth");

	UGUIToolTip_GetWidth_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIToolTip.GetTop
// (Defined, Public, Delegate)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGUIToolTip::GetTop(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIToolTip.GetTop");

	UGUIToolTip_GetTop_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIToolTip.GetLeft
// (Defined, Public, Delegate)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGUIToolTip::GetLeft(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIToolTip.GetLeft");

	UGUIToolTip_GetLeft_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIToolTip.UpdatePosition
// (Defined, Event, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void UGUIToolTip::UpdatePosition(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIToolTip.UpdatePosition");

	UGUIToolTip_UpdatePosition_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIToolTip.HideToolTip
// (Defined, Public, Delegate)

void UGUIToolTip::HideToolTip()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIToolTip.HideToolTip");

	UGUIToolTip_HideToolTip_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIToolTip.ShowToolTip
// (Defined, Public, Delegate)

void UGUIToolTip::ShowToolTip()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIToolTip.ShowToolTip");

	UGUIToolTip_ShowToolTip_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIToolTip.Tick
// (Defined, Public, Delegate)
// Parameters:
// float                          RealSeconds                    (Parm)

void UGUIToolTip::Tick(float RealSeconds)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIToolTip.Tick");

	UGUIToolTip_Tick_Params params;
	params.RealSeconds = RealSeconds;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIToolTip.InternalLeaveArea
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIToolTip::InternalLeaveArea()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIToolTip.InternalLeaveArea");

	UGUIToolTip_InternalLeaveArea_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIToolTip.LeaveArea
// (Defined, Public, Delegate)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIToolTip::LeaveArea()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIToolTip.LeaveArea");

	UGUIToolTip_LeaveArea_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIToolTip.InternalEnterArea
// (Defined, Public)
// Parameters:
// class UGUIToolTip*             ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIToolTip* UGUIToolTip::InternalEnterArea()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIToolTip.InternalEnterArea");

	UGUIToolTip_InternalEnterArea_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIToolTip.EnterArea
// (Defined, Public, Delegate)
// Parameters:
// class UGUIToolTip*             ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIToolTip* UGUIToolTip::EnterArea()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIToolTip.EnterArea");

	UGUIToolTip_EnterArea_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIContextMenu.ReplaceItem
// (Defined, Public)
// Parameters:
// int                            Index                          (Parm)
// struct FString                 NewItem                        (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIContextMenu::ReplaceItem(int Index, const struct FString& NewItem)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIContextMenu.ReplaceItem");

	UGUIContextMenu_ReplaceItem_Params params;
	params.Index = Index;
	params.NewItem = NewItem;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIContextMenu.RemoveItemByIndex
// (Defined, Public)
// Parameters:
// int                            Index                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIContextMenu::RemoveItemByIndex(int Index)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIContextMenu.RemoveItemByIndex");

	UGUIContextMenu_RemoveItemByIndex_Params params;
	params.Index = Index;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIContextMenu.RemoveItemByName
// (Defined, Public)
// Parameters:
// struct FString                 ItemName                       (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIContextMenu::RemoveItemByName(const struct FString& ItemName)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIContextMenu.RemoveItemByName");

	UGUIContextMenu_RemoveItemByName_Params params;
	params.ItemName = ItemName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIContextMenu.InsertItem
// (Defined, Public)
// Parameters:
// struct FString                 NewItem                        (Parm, NeedCtorLink)
// int                            Index                          (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIContextMenu::InsertItem(const struct FString& NewItem, int Index)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIContextMenu.InsertItem");

	UGUIContextMenu_InsertItem_Params params;
	params.NewItem = NewItem;
	params.Index = Index;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIContextMenu.AddItem
// (Defined, Public)
// Parameters:
// struct FString                 NewItem                        (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIContextMenu::AddItem(const struct FString& NewItem)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIContextMenu.AddItem");

	UGUIContextMenu_AddItem_Params params;
	params.NewItem = NewItem;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIContextMenu.OnContextHitTest
// (Public, Delegate)
// Parameters:
// float                          MouseX                         (Parm)
// float                          MouseY                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIContextMenu::OnContextHitTest(float MouseX, float MouseY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIContextMenu.OnContextHitTest");

	UGUIContextMenu_OnContextHitTest_Params params;
	params.MouseX = MouseX;
	params.MouseY = MouseY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIContextMenu.OnSelect
// (Public, Delegate)
// Parameters:
// class UGUIContextMenu*         Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// int                            ClickIndex                     (Parm)

void UGUIContextMenu::OnSelect(class UGUIContextMenu* Sender, int ClickIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIContextMenu.OnSelect");

	UGUIContextMenu_OnSelect_Params params;
	params.Sender = Sender;
	params.ClickIndex = ClickIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIContextMenu.OnClose
// (Public, Delegate)
// Parameters:
// class UGUIContextMenu*         Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIContextMenu::OnClose(class UGUIContextMenu* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIContextMenu.OnClose");

	UGUIContextMenu_OnClose_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIContextMenu.OnOpen
// (Public, Delegate)
// Parameters:
// class UGUIContextMenu*         Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIContextMenu::OnOpen(class UGUIContextMenu* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIContextMenu.OnOpen");

	UGUIContextMenu_OnOpen_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIImage.AdditionalDebugString
// (Defined, Event, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIImage::AdditionalDebugString()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIImage.AdditionalDebugString");

	UGUIImage_AdditionalDebugString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUISectionBackground.SetPosition
// (Defined, Public)
// Parameters:
// float                          NewLeft                        (Parm)
// float                          NewTop                         (Parm)
// float                          NewWidth                       (Parm)
// float                          NewHeight                      (Parm)
// bool                           bRelative                      (OptionalParm, Parm)

void UGUISectionBackground::SetPosition(float NewLeft, float NewTop, float NewWidth, float NewHeight, bool bRelative)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUISectionBackground.SetPosition");

	UGUISectionBackground_SetPosition_Params params;
	params.NewLeft = NewLeft;
	params.NewTop = NewTop;
	params.NewWidth = NewWidth;
	params.NewHeight = NewHeight;
	params.bRelative = bRelative;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUISectionBackground.ResolutionChanged
// (Defined, Event, Public)
// Parameters:
// int                            ResX                           (Parm)
// int                            ResY                           (Parm)

void UGUISectionBackground::ResolutionChanged(int ResX, int ResY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUISectionBackground.ResolutionChanged");

	UGUISectionBackground_ResolutionChanged_Params params;
	params.ResX = ResX;
	params.ResY = ResY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUISectionBackground.InternalPreDraw
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUISectionBackground::InternalPreDraw(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUISectionBackground.InternalPreDraw");

	UGUISectionBackground_InternalPreDraw_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUISectionBackground.Reset
// (Defined, Public)

void UGUISectionBackground::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUISectionBackground.Reset");

	UGUISectionBackground_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUISectionBackground.FindComponentIndex
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Comp                           (ExportObject, Parm, NeedCtorLink, EditInline)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUISectionBackground::FindComponentIndex(class UGUIComponent* Comp)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUISectionBackground.FindComponentIndex");

	UGUISectionBackground_FindComponentIndex_Params params;
	params.Comp = Comp;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUISectionBackground.UnmanageComponent
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Comp                           (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUISectionBackground::UnmanageComponent(class UGUIComponent* Comp)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUISectionBackground.UnmanageComponent");

	UGUISectionBackground_UnmanageComponent_Params params;
	params.Comp = Comp;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUISectionBackground.ManageComponent
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Component                      (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUISectionBackground::ManageComponent(class UGUIComponent* Component)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUISectionBackground.ManageComponent");

	UGUISectionBackground_ManageComponent_Params params;
	params.Component = Component;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUISectionBackground.SetVisibility
// (Defined, Event, Public)
// Parameters:
// bool                           bIsVisible                     (Parm)

void UGUISectionBackground::SetVisibility(bool bIsVisible)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUISectionBackground.SetVisibility");

	UGUISectionBackground_SetVisibility_Params params;
	params.bIsVisible = bIsVisible;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUISectionBackground.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUISectionBackground::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUISectionBackground.InitComponent");

	UGUISectionBackground_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPanel.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIPanel::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPanel.InitComponent");

	UGUIPanel_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPanel.OnPostDraw
// (Public, Delegate)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIPanel::OnPostDraw(class UCanvas* Canvas)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPanel.OnPostDraw");

	UGUIPanel_OnPostDraw_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMenuOption.SetFriendlyLabel
// (Defined, Public)
// Parameters:
// class UGUILabel*               NewLabel                       (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIMenuOption::SetFriendlyLabel(class UGUILabel* NewLabel)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMenuOption.SetFriendlyLabel");

	UGUIMenuOption_SetFriendlyLabel_Params params;
	params.NewLabel = NewLabel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMenuOption.CenterMouse
// (Defined, Public)

void UGUIMenuOption::CenterMouse()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMenuOption.CenterMouse");

	UGUIMenuOption_CenterMouse_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMenuOption.InternalOnCreateComponent
// (Public)
// Parameters:
// class UGUIComponent*           NewComp                        (ExportObject, Parm, NeedCtorLink, EditInline)
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIMenuOption::InternalOnCreateComponent(class UGUIComponent* NewComp, class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMenuOption.InternalOnCreateComponent");

	UGUIMenuOption_InternalOnCreateComponent_Params params;
	params.NewComp = NewComp;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMenuOption.InternalOnChange
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIMenuOption::InternalOnChange(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMenuOption.InternalOnChange");

	UGUIMenuOption_InternalOnChange_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMenuOption.MenuOptionClicked
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIMenuOption::MenuOptionClicked(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMenuOption.MenuOptionClicked");

	UGUIMenuOption_MenuOptionClicked_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMenuOption.SetCaption
// (Defined, Public)
// Parameters:
// struct FString                 NewCaption                     (Parm, NeedCtorLink)

void UGUIMenuOption::SetCaption(const struct FString& NewCaption)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMenuOption.SetCaption");

	UGUIMenuOption_SetCaption_Params params;
	params.NewCaption = NewCaption;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMenuOption.SetHint
// (Defined, Public)
// Parameters:
// struct FString                 NewHint                        (Parm, NeedCtorLink)

void UGUIMenuOption::SetHint(const struct FString& NewHint)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMenuOption.SetHint");

	UGUIMenuOption_SetHint_Params params;
	params.NewHint = NewHint;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMenuOption.SetReadOnly
// (Defined, Public)
// Parameters:
// bool                           bValue                         (Parm)

void UGUIMenuOption::SetReadOnly(bool bValue)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMenuOption.SetReadOnly");

	UGUIMenuOption_SetReadOnly_Params params;
	params.bValue = bValue;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMenuOption.ResetComponent
// (Defined, Public)

void UGUIMenuOption::ResetComponent()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMenuOption.ResetComponent");

	UGUIMenuOption_ResetComponent_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMenuOption.GetComponentValue
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIMenuOption::GetComponentValue()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMenuOption.GetComponentValue");

	UGUIMenuOption_GetComponentValue_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMenuOption.SetComponentValue
// (Public)
// Parameters:
// struct FString                 NewValue                       (Parm, CoerceParm, NeedCtorLink)
// bool                           bNoChange                      (OptionalParm, Parm)

void UGUIMenuOption::SetComponentValue(const struct FString& NewValue, bool bNoChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMenuOption.SetComponentValue");

	UGUIMenuOption_SetComponentValue_Params params;
	params.NewValue = NewValue;
	params.bNoChange = bNoChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMenuOption.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIMenuOption::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMenuOption.InitComponent");

	UGUIMenuOption_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.FocusLast
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComboBox::FocusLast(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.FocusLast");

	UGUIComboBox_FocusLast_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.FocusFirst
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComboBox::FocusFirst(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.FocusFirst");

	UGUIComboBox_FocusFirst_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.LoseFocus
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComboBox::LoseFocus(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.LoseFocus");

	UGUIComboBox_LoseFocus_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.SetFriendlyLabel
// (Defined, Public)
// Parameters:
// class UGUILabel*               NewLabel                       (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComboBox::SetFriendlyLabel(class UGUILabel* NewLabel)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.SetFriendlyLabel");

	UGUIComboBox_SetFriendlyLabel_Params params;
	params.NewLabel = NewLabel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.CenterMouse
// (Defined, Public)

void UGUIComboBox::CenterMouse()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.CenterMouse");

	UGUIComboBox_CenterMouse_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.Clear
// (Defined, Public)

void UGUIComboBox::Clear()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.Clear");

	UGUIComboBox_Clear_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.InternalOnMousePressed
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bRepeat                        (Parm)

void UGUIComboBox::InternalOnMousePressed(class UGUIComponent* Sender, bool bRepeat)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.InternalOnMousePressed");

	UGUIComboBox_InternalOnMousePressed_Params params;
	params.Sender = Sender;
	params.bRepeat = bRepeat;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.ReadOnly
// (Defined, Public)
// Parameters:
// bool                           B                              (Parm)

void UGUIComboBox::ReadOnly(bool B)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.ReadOnly");

	UGUIComboBox_ReadOnly_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.ItemCount
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIComboBox::ItemCount()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.ItemCount");

	UGUIComboBox_ItemCount_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.FindIndex
// (Defined, Public)
// Parameters:
// struct FString                 Test                           (Parm, NeedCtorLink)
// bool                           bExact                         (OptionalParm, Parm)
// bool                           bExtra                         (OptionalParm, Parm)
// class UObject*                 obj                            (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIComboBox::FindIndex(const struct FString& Test, bool bExact, bool bExtra, class UObject* obj)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.FindIndex");

	UGUIComboBox_FindIndex_Params params;
	params.Test = Test;
	params.bExact = bExact;
	params.bExtra = bExtra;
	params.obj = obj;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.FindExtra
// (Defined, Public)
// Parameters:
// struct FString                 Text                           (Parm, NeedCtorLink)
// bool                           bExact                         (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIComboBox::FindExtra(const struct FString& Text, bool bExact)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.FindExtra");

	UGUIComboBox_FindExtra_Params params;
	params.Text = Text;
	params.bExact = bExact;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.Find
// (Defined, Public)
// Parameters:
// struct FString                 Text                           (Parm, NeedCtorLink)
// bool                           bExact                         (OptionalParm, Parm)
// bool                           bExtra                         (OptionalParm, Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIComboBox::Find(const struct FString& Text, bool bExact, bool bExtra)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.Find");

	UGUIComboBox_Find_Params params;
	params.Text = Text;
	params.bExact = bExact;
	params.bExtra = bExtra;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.GetItemObject
// (Defined, Public)
// Parameters:
// int                            Index                          (Parm)
// class UObject*                 ReturnValue                    (Parm, OutParm, ReturnParm)

class UObject* UGUIComboBox::GetItemObject(int Index)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.GetItemObject");

	UGUIComboBox_GetItemObject_Params params;
	params.Index = Index;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.GetItem
// (Defined, Public)
// Parameters:
// int                            Index                          (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIComboBox::GetItem(int Index)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.GetItem");

	UGUIComboBox_GetItem_Params params;
	params.Index = Index;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.RemoveItem
// (Defined, Public)
// Parameters:
// int                            Item                           (Parm)
// int                            Count                          (OptionalParm, Parm)

void UGUIComboBox::RemoveItem(int Item, int Count)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.RemoveItem");

	UGUIComboBox_RemoveItem_Params params;
	params.Item = Item;
	params.Count = Count;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.AddItem
// (Defined, Public)
// Parameters:
// struct FString                 Item                           (Parm, NeedCtorLink)
// class UObject*                 Extra                          (OptionalParm, Parm)
// struct FString                 str                            (OptionalParm, Parm, NeedCtorLink)

void UGUIComboBox::AddItem(const struct FString& Item, class UObject* Extra, const struct FString& str)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.AddItem");

	UGUIComboBox_AddItem_Params params;
	params.Item = Item;
	params.Extra = Extra;
	params.str = str;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.GetIndex
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIComboBox::GetIndex()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.GetIndex");

	UGUIComboBox_GetIndex_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.SetIndex
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)

void UGUIComboBox::SetIndex(int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.SetIndex");

	UGUIComboBox_SetIndex_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.GetExtra
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIComboBox::GetExtra()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.GetExtra");

	UGUIComboBox_GetExtra_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.GetObject
// (Defined, Public)
// Parameters:
// class UObject*                 ReturnValue                    (Parm, OutParm, ReturnParm)

class UObject* UGUIComboBox::GetObject()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.GetObject");

	UGUIComboBox_GetObject_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.GetText
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIComboBox::GetText()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.GetText");

	UGUIComboBox_GetText_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.Get
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIComboBox::Get()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.Get");

	UGUIComboBox_Get_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.SetExtra
// (Defined, Public)
// Parameters:
// struct FString                 NewExtra                       (Parm, NeedCtorLink)
// bool                           bListItemsOnly                 (OptionalParm, Parm)

void UGUIComboBox::SetExtra(const struct FString& NewExtra, bool bListItemsOnly)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.SetExtra");

	UGUIComboBox_SetExtra_Params params;
	params.NewExtra = NewExtra;
	params.bListItemsOnly = bListItemsOnly;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.SetText
// (Defined, Public)
// Parameters:
// struct FString                 NewText                        (Parm, NeedCtorLink)
// bool                           bListItemsOnly                 (OptionalParm, Parm)

void UGUIComboBox::SetText(const struct FString& NewText, bool bListItemsOnly)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.SetText");

	UGUIComboBox_SetText_Params params;
	params.NewText = NewText;
	params.bListItemsOnly = bListItemsOnly;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.TextChanged
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComboBox::TextChanged(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.TextChanged");

	UGUIComboBox_TextChanged_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.ItemChanged
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComboBox::ItemChanged(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.ItemChanged");

	UGUIComboBox_ItemChanged_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.ShowListBox
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComboBox::ShowListBox(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.ShowListBox");

	UGUIComboBox_ShowListBox_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.SetVisibility
// (Defined, Event, Public)
// Parameters:
// bool                           bIsVisible                     (Parm)

void UGUIComboBox::SetVisibility(bool bIsVisible)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.SetVisibility");

	UGUIComboBox_SetVisibility_Params params;
	params.bIsVisible = bIsVisible;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.HideListBox
// (Defined, Public)

void UGUIComboBox::HideListBox()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.HideListBox");

	UGUIComboBox_HideListBox_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.InternalOnLoadINI
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// struct FString                 S                              (Parm, NeedCtorLink)

void UGUIComboBox::InternalOnLoadINI(class UGUIComponent* Sender, const struct FString& S)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.InternalOnLoadINI");

	UGUIComboBox_InternalOnLoadINI_Params params;
	params.Sender = Sender;
	params.S = S;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.InternalOnSaveINI
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIComboBox::InternalOnSaveINI(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.InternalOnSaveINI");

	UGUIComboBox_InternalOnSaveINI_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.InternalListClick
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComboBox::InternalListClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.InternalListClick");

	UGUIComboBox_InternalListClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.InternalEditPressed
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bRepeat                        (Parm)

void UGUIComboBox::InternalEditPressed(class UGUIComponent* Sender, bool bRepeat)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.InternalEditPressed");

	UGUIComboBox_InternalEditPressed_Params params;
	params.Sender = Sender;
	params.bRepeat = bRepeat;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.InternalOnInvalidate
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Who                            (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComboBox::InternalOnInvalidate(class UGUIComponent* Who)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.InternalOnInvalidate");

	UGUIComboBox_InternalOnInvalidate_Params params;
	params.Who = Who;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.InternalListDeActivate
// (Defined, Public)

void UGUIComboBox::InternalListDeActivate()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.InternalListDeActivate");

	UGUIComboBox_InternalListDeActivate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.InternalOnKeyEvent
// (Defined, Public)
// Parameters:
// unsigned char                  key                            (Parm, OutParm)
// unsigned char                  State                          (Parm, OutParm)
// float                          Delta                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIComboBox::InternalOnKeyEvent(float Delta, unsigned char* key, unsigned char* State)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.InternalOnKeyEvent");

	UGUIComboBox_InternalOnKeyEvent_Params params;
	params.Delta = Delta;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (key != nullptr)
		*key = params.key;
	if (State != nullptr)
		*State = params.State;

	return params.ReturnValue;
}


// Function XInterface.GUIComboBox.SetHint
// (Defined, Public)
// Parameters:
// struct FString                 NewHint                        (Parm, NeedCtorLink)

void UGUIComboBox::SetHint(const struct FString& NewHint)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.SetHint");

	UGUIComboBox_SetHint_Params params;
	params.NewHint = NewHint;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComboBox::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.InitComponent");

	UGUIComboBox_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.OnHideList
// (Public, Delegate)

void UGUIComboBox::OnHideList()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.OnHideList");

	UGUIComboBox_OnHideList_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIComboBox.OnShowList
// (Public, Delegate)

void UGUIComboBox::OnShowList()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboBox.OnShowList");

	UGUIComboBox_OnShowList_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIGFXButton.InternalOnClick
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIGFXButton::InternalOnClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIGFXButton.InternalOnClick");

	UGUIGFXButton_InternalOnClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIGFXButton.SetChecked
// (Defined, Public)
// Parameters:
// bool                           bNewChecked                    (Parm)

void UGUIGFXButton::SetChecked(bool bNewChecked)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIGFXButton.SetChecked");

	UGUIGFXButton_SetChecked_Params params;
	params.bNewChecked = bNewChecked;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIGFXButton.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIGFXButton::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIGFXButton.InitComponent");

	UGUIGFXButton_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollZoneBase.InternalOnClick
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIScrollZoneBase::InternalOnClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollZoneBase.InternalOnClick");

	UGUIScrollZoneBase_InternalOnClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIScrollZoneBase.OnScrollZoneClick
// (Public, Delegate)
// Parameters:
// float                          Delta                          (Parm)

void UGUIScrollZoneBase::OnScrollZoneClick(float Delta)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollZoneBase.OnScrollZoneClick");

	UGUIScrollZoneBase_OnScrollZoneClick_Params params;
	params.Delta = Delta;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollBarBase.SetFriendlyLabel
// (Defined, Public)
// Parameters:
// class UGUILabel*               NewLabel                       (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIScrollBarBase::SetFriendlyLabel(class UGUILabel* NewLabel)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollBarBase.SetFriendlyLabel");

	UGUIScrollBarBase_SetFriendlyLabel_Params params;
	params.NewLabel = NewLabel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollBarBase.GripPreDraw
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIScrollBarBase::GripPreDraw(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollBarBase.GripPreDraw");

	UGUIScrollBarBase_GripPreDraw_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIScrollBarBase.Refocus
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Who                            (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIScrollBarBase::Refocus(class UGUIComponent* Who)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollBarBase.Refocus");

	UGUIScrollBarBase_Refocus_Params params;
	params.Who = Who;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollBarBase.AlignThumb
// (Defined, Public, Delegate)

void UGUIScrollBarBase::AlignThumb()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollBarBase.AlignThumb");

	UGUIScrollBarBase_AlignThumb_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollBarBase.WheelDown
// (Defined, Public)

void UGUIScrollBarBase::WheelDown()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollBarBase.WheelDown");

	UGUIScrollBarBase_WheelDown_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollBarBase.WheelUp
// (Defined, Public)

void UGUIScrollBarBase::WheelUp()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollBarBase.WheelUp");

	UGUIScrollBarBase_WheelUp_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollBarBase.IncreaseClick
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIScrollBarBase::IncreaseClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollBarBase.IncreaseClick");

	UGUIScrollBarBase_IncreaseClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIScrollBarBase.DecreaseClick
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIScrollBarBase::DecreaseClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollBarBase.DecreaseClick");

	UGUIScrollBarBase_DecreaseClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIScrollBarBase.MoveGripBy
// (Defined, Public, Delegate)
// Parameters:
// int                            items                          (Parm)

void UGUIScrollBarBase::MoveGripBy(int items)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollBarBase.MoveGripBy");

	UGUIScrollBarBase_MoveGripBy_Params params;
	params.items = items;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollBarBase.UpdateGripPosition
// (Defined, Public)
// Parameters:
// float                          NewPos                         (Parm)

void UGUIScrollBarBase::UpdateGripPosition(float NewPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollBarBase.UpdateGripPosition");

	UGUIScrollBarBase_UpdateGripPosition_Params params;
	params.NewPos = NewPos;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollBarBase.SetList
// (Defined, Public)
// Parameters:
// class UGUIListBase*            List                           (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIScrollBarBase::SetList(class UGUIListBase* List)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollBarBase.SetList");

	UGUIScrollBarBase_SetList_Params params;
	params.List = List;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollBarBase.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIScrollBarBase::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollBarBase.InitComponent");

	UGUIScrollBarBase_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollBarBase.PositionChanged
// (Public, Delegate)
// Parameters:
// int                            NewPos                         (Parm)

void UGUIScrollBarBase::PositionChanged(int NewPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollBarBase.PositionChanged");

	UGUIScrollBarBase_PositionChanged_Params params;
	params.NewPos = NewPos;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIEditBox.IMEInputCancel
// (Defined, Public)

void UGUIEditBox::IMEInputCancel()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIEditBox.IMEInputCancel");

	UGUIEditBox_IMEInputCancel_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIEditBox.InternalDeactivate
// (Defined, Public)

void UGUIEditBox::InternalDeactivate()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIEditBox.InternalDeactivate");

	UGUIEditBox_InternalDeactivate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIEditBox.InternalActivate
// (Defined, Public)

void UGUIEditBox::InternalActivate()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIEditBox.InternalActivate");

	UGUIEditBox_InternalActivate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIEditBox.TextChanged
// (Defined, Public)

void UGUIEditBox::TextChanged()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIEditBox.TextChanged");

	UGUIEditBox_TextChanged_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIEditBox.GetText
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIEditBox::GetText()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIEditBox.GetText");

	UGUIEditBox_GetText_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIEditBox.ConvertIllegal
// (Defined, Public)
// Parameters:
// struct FString                 inputstr                       (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIEditBox::ConvertIllegal(const struct FString& inputstr)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIEditBox.ConvertIllegal");

	UGUIEditBox_ConvertIllegal_Params params;
	params.inputstr = inputstr;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIEditBox.InternalOnKeyEvent
// (Defined, Public)
// Parameters:
// unsigned char                  key                            (Parm, OutParm)
// unsigned char                  State                          (Parm, OutParm)
// float                          Delta                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIEditBox::InternalOnKeyEvent(float Delta, unsigned char* key, unsigned char* State)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIEditBox.InternalOnKeyEvent");

	UGUIEditBox_InternalOnKeyEvent_Params params;
	params.Delta = Delta;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (key != nullptr)
		*key = params.key;
	if (State != nullptr)
		*State = params.State;

	return params.ReturnValue;
}


// Function XInterface.GUIEditBox.InternalOnKeyType
// (Defined, Public)
// Parameters:
// unsigned char                  key                            (Parm, OutParm)
// struct FString                 Unicode                        (OptionalParm, Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIEditBox::InternalOnKeyType(const struct FString& Unicode, unsigned char* key)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIEditBox.InternalOnKeyType");

	UGUIEditBox_InternalOnKeyType_Params params;
	params.Unicode = Unicode;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (key != nullptr)
		*key = params.key;

	return params.ReturnValue;
}


// Function XInterface.GUIEditBox.DeleteChar
// (Defined, Public)

void UGUIEditBox::DeleteChar()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIEditBox.DeleteChar");

	UGUIEditBox_DeleteChar_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIEditBox.SetText
// (Defined, Event, Public)
// Parameters:
// struct FString                 NewText                        (Parm, NeedCtorLink)

void UGUIEditBox::SetText(const struct FString& NewText)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIEditBox.SetText");

	UGUIEditBox_SetText_Params params;
	params.NewText = NewText;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIEditBox.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIEditBox::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIEditBox.InitComponent");

	UGUIEditBox_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIEditBox.OnIME_Notify
// (Native, Public)
// Parameters:
// int                            Type                           (Parm)
// int                            LangID                         (Parm)
// struct FString                 strText                        (Parm, NeedCtorLink)
// int                            nStartPos                      (Parm)
// int                            nSize                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIEditBox::OnIME_Notify(int Type, int LangID, const struct FString& strText, int nStartPos, int nSize)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIEditBox.OnIME_Notify");

	UGUIEditBox_OnIME_Notify_Params params;
	params.Type = Type;
	params.LangID = LangID;
	params.strText = strText;
	params.nStartPos = nStartPos;
	params.nSize = nSize;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabPanel.CheckIn
// (Defined, Public)
// Parameters:
// struct FFloatBox               fb                             (Parm)
// int                            X                              (Parm)
// int                            Y                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUITabPanel::CheckIn(const struct FFloatBox& fb, int X, int Y)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabPanel.CheckIn");

	UGUITabPanel_CheckIn_Params params;
	params.fb = fb;
	params.X = X;
	params.Y = Y;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabPanel.GetTooltipPos
// (Defined, Public)
// Parameters:
// int                            tooltipWidth                   (Parm)
// int                            tooltipHeight                  (Parm)
// int                            nOffsetX                       (OptionalParm, Parm)
// int                            nOffsetY                       (OptionalParm, Parm)
// struct FFloatBox               ReturnValue                    (Parm, OutParm, ReturnParm)

struct FFloatBox UGUITabPanel::GetTooltipPos(int tooltipWidth, int tooltipHeight, int nOffsetX, int nOffsetY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabPanel.GetTooltipPos");

	UGUITabPanel_GetTooltipPos_Params params;
	params.tooltipWidth = tooltipWidth;
	params.tooltipHeight = tooltipHeight;
	params.nOffsetX = nOffsetX;
	params.nOffsetY = nOffsetY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabPanel.CanShowPanel
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUITabPanel::CanShowPanel()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabPanel.CanShowPanel");

	UGUITabPanel_CanShowPanel_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabPanel.ShowPanel
// (Defined, Public)
// Parameters:
// bool                           bShow                          (Parm)

void UGUITabPanel::ShowPanel(bool bShow)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabPanel.ShowPanel");

	UGUITabPanel_ShowPanel_Params params;
	params.bShow = bShow;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUITabPanel.free
// (Defined, Event, Public)

void UGUITabPanel::free()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabPanel.free");

	UGUITabPanel_free_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUITabPanel.OnDestroyPanel
// (Defined, Public)
// Parameters:
// bool                           bCancelled                     (OptionalParm, Parm)

void UGUITabPanel::OnDestroyPanel(bool bCancelled)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabPanel.OnDestroyPanel");

	UGUITabPanel_OnDestroyPanel_Params params;
	params.bCancelled = bCancelled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUITabPanel.InitPanel
// (Public)

void UGUITabPanel::InitPanel()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabPanel.InitPanel");

	UGUITabPanel_InitPanel_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUITabPanel.Refresh
// (Public)

void UGUITabPanel::Refresh()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabPanel.Refresh");

	UGUITabPanel_Refresh_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUITabButton.CanShowPanel
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUITabButton::CanShowPanel()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabButton.CanShowPanel");

	UGUITabButton_CanShowPanel_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabButton.ChangeActiveState
// (Defined, Public)
// Parameters:
// bool                           IsActive                       (Parm)
// bool                           bFocusPanel                    (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUITabButton::ChangeActiveState(bool IsActive, bool bFocusPanel)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabButton.ChangeActiveState");

	UGUITabButton_ChangeActiveState_Params params;
	params.IsActive = IsActive;
	params.bFocusPanel = bFocusPanel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabButton.SetFocus
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Who                            (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUITabButton::SetFocus(class UGUIComponent* Who)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabButton.SetFocus");

	UGUITabButton_SetFocus_Params params;
	params.Who = Who;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUITabControl.LevelChanged
// (Defined, Public)

void UGUITabControl::LevelChanged()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.LevelChanged");

	UGUITabControl_LevelChanged_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUITabControl.free
// (Defined, Event, Public)

void UGUITabControl::free()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.free");

	UGUITabControl_free_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUITabControl.CenterMouse
// (Defined, Public)

void UGUITabControl::CenterMouse()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.CenterMouse");

	UGUITabControl_CenterMouse_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUITabControl.FocusLast
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUITabControl::FocusLast(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.FocusLast");

	UGUITabControl_FocusLast_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.FocusFirst
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUITabControl::FocusFirst(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.FocusFirst");

	UGUITabControl_FocusFirst_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.InternalOnActivate
// (Defined, Public)

void UGUITabControl::InternalOnActivate()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.InternalOnActivate");

	UGUITabControl_InternalOnActivate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUITabControl.SetVisibility
// (Defined, Public)
// Parameters:
// bool                           bIsVisible                     (Parm)

void UGUITabControl::SetVisibility(bool bIsVisible)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.SetVisibility");

	UGUITabControl_SetVisibility_Params params;
	params.bIsVisible = bIsVisible;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUITabControl.BorrowPanel
// (Defined, Public)
// Parameters:
// struct FString                 Caption                        (Parm, NeedCtorLink)
// class UGUITabPanel*            ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUITabPanel* UGUITabControl::BorrowPanel(const struct FString& Caption)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.BorrowPanel");

	UGUITabControl_BorrowPanel_Params params;
	params.Caption = Caption;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.FindPanelClass
// (Defined, Public)
// Parameters:
// class UClass*                  PanelClass                     (Parm)
// class UGUITabPanel*            ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUITabPanel* UGUITabControl::FindPanelClass(class UClass* PanelClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.FindPanelClass");

	UGUITabControl_FindPanelClass_Params params;
	params.PanelClass = PanelClass;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.TabIndex
// (Defined, Public)
// Parameters:
// struct FString                 tabname                        (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUITabControl::TabIndex(const struct FString& tabname)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.TabIndex");

	UGUITabControl_TabIndex_Params params;
	params.tabname = tabname;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.PrevControl
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUITabControl::PrevControl(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.PrevControl");

	UGUITabControl_PrevControl_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.NextControl
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUITabControl::NextControl(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.NextControl");

	UGUITabControl_NextControl_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.PrevPage
// (Defined, Event, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUITabControl::PrevPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.PrevPage");

	UGUITabControl_PrevPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.NextPage
// (Defined, Event, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUITabControl::NextPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.NextPage");

	UGUITabControl_NextPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.InternalTabClick
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUITabControl::InternalTabClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.InternalTabClick");

	UGUITabControl_InternalTabClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.ActivateTabByPanel
// (Defined, Public)
// Parameters:
// class UGUITabPanel*            Panel                          (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bFocusPanel                    (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUITabControl::ActivateTabByPanel(class UGUITabPanel* Panel, bool bFocusPanel)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.ActivateTabByPanel");

	UGUITabControl_ActivateTabByPanel_Params params;
	params.Panel = Panel;
	params.bFocusPanel = bFocusPanel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.ActivateTabByName
// (Defined, Public)
// Parameters:
// struct FString                 tabname                        (Parm, NeedCtorLink)
// bool                           bFocusPanel                    (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUITabControl::ActivateTabByName(const struct FString& tabname, bool bFocusPanel)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.ActivateTabByName");

	UGUITabControl_ActivateTabByName_Params params;
	params.tabname = tabname;
	params.bFocusPanel = bFocusPanel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.ActivateTab
// (Defined, Public)
// Parameters:
// class UGUITabButton*           Who                            (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bFocusPanel                    (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUITabControl::ActivateTab(class UGUITabButton* Who, bool bFocusPanel)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.ActivateTab");

	UGUITabControl_ActivateTab_Params params;
	params.Who = Who;
	params.bFocusPanel = bFocusPanel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.MakeTabActive
// (Defined, Event, Public)
// Parameters:
// class UGUITabButton*           Who                            (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUITabControl::MakeTabActive(class UGUITabButton* Who)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.MakeTabActive");

	UGUITabControl_MakeTabActive_Params params;
	params.Who = Who;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUITabControl.LostActiveTab
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUITabControl::LostActiveTab()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.LostActiveTab");

	UGUITabControl_LostActiveTab_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.RemoveTab
// (Defined, Public)
// Parameters:
// struct FString                 Caption                        (OptionalParm, Parm, NeedCtorLink)
// class UGUITabButton*           Who                            (ExportObject, OptionalParm, Parm, NeedCtorLink, EditInline)

void UGUITabControl::RemoveTab(const struct FString& Caption, class UGUITabButton* Who)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.RemoveTab");

	UGUITabControl_RemoveTab_Params params;
	params.Caption = Caption;
	params.Who = Who;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUITabControl.ReplaceTab
// (Defined, Public)
// Parameters:
// class UGUITabButton*           Which                          (ExportObject, Parm, NeedCtorLink, EditInline)
// struct FString                 Caption                        (Parm, NeedCtorLink)
// struct FString                 PanelClass                     (Parm, NeedCtorLink)
// class UGUITabPanel*            ExistingPanel                  (ExportObject, OptionalParm, Parm, NeedCtorLink, EditInline)
// struct FString                 InHint                         (OptionalParm, Parm, NeedCtorLink)
// bool                           bForceActive                   (OptionalParm, Parm)
// class UGUITabPanel*            ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUITabPanel* UGUITabControl::ReplaceTab(class UGUITabButton* Which, const struct FString& Caption, const struct FString& PanelClass, class UGUITabPanel* ExistingPanel, const struct FString& InHint, bool bForceActive)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.ReplaceTab");

	UGUITabControl_ReplaceTab_Params params;
	params.Which = Which;
	params.Caption = Caption;
	params.PanelClass = PanelClass;
	params.ExistingPanel = ExistingPanel;
	params.InHint = InHint;
	params.bForceActive = bForceActive;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.InsertTab
// (Defined, Public)
// Parameters:
// int                            pos                            (Parm)
// struct FString                 Caption                        (Parm, NeedCtorLink)
// struct FString                 PanelClass                     (Parm, NeedCtorLink)
// class UGUITabPanel*            ExistingPanel                  (ExportObject, OptionalParm, Parm, NeedCtorLink, EditInline)
// struct FString                 InHint                         (OptionalParm, Parm, NeedCtorLink)
// bool                           bForceActive                   (OptionalParm, Parm)
// class UGUITabPanel*            ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUITabPanel* UGUITabControl::InsertTab(int pos, const struct FString& Caption, const struct FString& PanelClass, class UGUITabPanel* ExistingPanel, const struct FString& InHint, bool bForceActive)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.InsertTab");

	UGUITabControl_InsertTab_Params params;
	params.pos = pos;
	params.Caption = Caption;
	params.PanelClass = PanelClass;
	params.ExistingPanel = ExistingPanel;
	params.InHint = InHint;
	params.bForceActive = bForceActive;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.AddTab
// (Defined, Public)
// Parameters:
// struct FString                 InCaption                      (Parm, NeedCtorLink)
// struct FString                 PanelClass                     (Parm, NeedCtorLink)
// class UGUITabPanel*            ExistingPanel                  (ExportObject, OptionalParm, Parm, NeedCtorLink, EditInline)
// struct FString                 InHint                         (OptionalParm, Parm, NeedCtorLink)
// bool                           bForceActive                   (OptionalParm, Parm)
// class UGUITabPanel*            ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUITabPanel* UGUITabControl::AddTab(const struct FString& InCaption, const struct FString& PanelClass, class UGUITabPanel* ExistingPanel, const struct FString& InHint, bool bForceActive)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.AddTab");

	UGUITabControl_AddTab_Params params;
	params.InCaption = InCaption;
	params.PanelClass = PanelClass;
	params.ExistingPanel = ExistingPanel;
	params.InHint = InHint;
	params.bForceActive = bForceActive;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.AddTabItem
// (Defined, Public)
// Parameters:
// struct FGUITabItem             Item                           (Parm, NeedCtorLink)
// class UGUITabPanel*            ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUITabPanel* UGUITabControl::AddTabItem(const struct FGUITabItem& Item)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.AddTabItem");

	UGUITabControl_AddTabItem_Params params;
	params.Item = Item;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.InternalOnKeyEvent
// (Defined, Public)
// Parameters:
// unsigned char                  key                            (Parm, OutParm)
// unsigned char                  State                          (Parm, OutParm)
// float                          Delta                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUITabControl::InternalOnKeyEvent(float Delta, unsigned char* key, unsigned char* State)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.InternalOnKeyEvent");

	UGUITabControl_InternalOnKeyEvent_Params params;
	params.Delta = Delta;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (key != nullptr)
		*key = params.key;
	if (State != nullptr)
		*State = params.State;

	return params.ReturnValue;
}


// Function XInterface.GUITabControl.Closed
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bCancelled                     (Parm)

void UGUITabControl::Closed(class UGUIComponent* Sender, bool bCancelled)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.Closed");

	UGUITabControl_Closed_Params params;
	params.Sender = Sender;
	params.bCancelled = bCancelled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUITabControl.Opened
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUITabControl::Opened(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.Opened");

	UGUITabControl_Opened_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUITabControl.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUITabControl::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUITabControl.InitComponent");

	UGUITabControl_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIBorder.GetCaption
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIBorder::GetCaption()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIBorder.GetCaption");

	UGUIBorder_GetCaption_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIBorder.SetCaption
// (Defined, Public)
// Parameters:
// struct FString                 NewCaption                     (Parm, NeedCtorLink)

void UGUIBorder::SetCaption(const struct FString& NewCaption)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIBorder.SetCaption");

	UGUIBorder_SetCaption_Params params;
	params.NewCaption = NewCaption;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.LostFocus
// (Public, Delegate)
// Parameters:
// class UGUIPage*                NewMenu                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIPage::LostFocus(class UGUIPage* NewMenu)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.LostFocus");

	UGUIPage_LostFocus_Params params;
	params.NewMenu = NewMenu;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.GetFocus
// (Public, Delegate)

void UGUIPage::GetFocus()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.GetFocus");

	UGUIPage_GetFocus_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.FadedOut
// (Public, Delegate)

void UGUIPage::FadedOut()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.FadedOut");

	UGUIPage_FadedOut_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.FadedIn
// (Public, Delegate)

void UGUIPage::FadedIn()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.FadedIn");

	UGUIPage_FadedIn_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.FadeOut
// (Defined, Public)
// Parameters:
// bool                           bTranslate                     (OptionalParm, Parm)
// bool                           bChangeAlpha                   (OptionalParm, Parm)

void UGUIPage::FadeOut(bool bTranslate, bool bChangeAlpha)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.FadeOut");

	UGUIPage_FadeOut_Params params;
	params.bTranslate = bTranslate;
	params.bChangeAlpha = bChangeAlpha;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.FadeIn
// (Defined, Public)
// Parameters:
// bool                           bTranslate                     (OptionalParm, Parm)
// bool                           bChangeAlpha                   (OptionalParm, Parm)

void UGUIPage::FadeIn(bool bTranslate, bool bChangeAlpha)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.FadeIn");

	UGUIPage_FadeIn_Params params;
	params.bTranslate = bTranslate;
	params.bChangeAlpha = bChangeAlpha;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.AllowOpen
// (Defined, Public)
// Parameters:
// struct FString                 MenuClass                      (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIPage::AllowOpen(const struct FString& MenuClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.AllowOpen");

	UGUIPage_AllowOpen_Params params;
	params.MenuClass = MenuClass;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIPage.IsOpen
// (Final, Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIPage::IsOpen()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.IsOpen");

	UGUIPage_IsOpen_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIPage.free
// (Defined, Event, Public)

void UGUIPage::free()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.free");

	UGUIPage_free_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.NotifyLevelChange
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIPage::NotifyLevelChange()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.NotifyLevelChange");

	UGUIPage_NotifyLevelChange_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIPage.SetDataString
// (Public)
// Parameters:
// struct FString                 str                            (Parm, NeedCtorLink)

void UGUIPage::SetDataString(const struct FString& str)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.SetDataString");

	UGUIPage_SetDataString_Params params;
	params.str = str;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.GetDataString
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIPage::GetDataString()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.GetDataString");

	UGUIPage_GetDataString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIPage.HandleObject
// (Public)
// Parameters:
// class UObject*                 obj                            (Parm)
// class UObject*                 OptionalObj_1                  (OptionalParm, Parm)
// class UObject*                 OptionalObj_2                  (OptionalParm, Parm)

void UGUIPage::HandleObject(class UObject* obj, class UObject* OptionalObj_1, class UObject* OptionalObj_2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.HandleObject");

	UGUIPage_HandleObject_Params params;
	params.obj = obj;
	params.OptionalObj_1 = OptionalObj_1;
	params.OptionalObj_2 = OptionalObj_2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.GetRestoreParams
// (Public)
// Parameters:
// struct FString                 Param1                         (Parm, OutParm, NeedCtorLink)
// struct FString                 Param2                         (Parm, OutParm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIPage::GetRestoreParams(struct FString* Param1, struct FString* Param2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.GetRestoreParams");

	UGUIPage_GetRestoreParams_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Param1 != nullptr)
		*Param1 = params.Param1;
	if (Param2 != nullptr)
		*Param2 = params.Param2;

	return params.ReturnValue;
}


// Function XInterface.GUIPage.HandleParameters
// (Event, Public)
// Parameters:
// struct FString                 Param1                         (Parm, NeedCtorLink)
// struct FString                 Param2                         (Parm, NeedCtorLink)

void UGUIPage::HandleParameters(const struct FString& Param1, const struct FString& Param2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.HandleParameters");

	UGUIPage_HandleParameters_Params params;
	params.Param1 = Param1;
	params.Param2 = Param2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.SetFocus
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Who                            (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIPage::SetFocus(class UGUIComponent* Who)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.SetFocus");

	UGUIPage_SetFocus_Params params;
	params.Who = Who;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.ChangeHint
// (Defined, Event, Public)
// Parameters:
// struct FString                 NewHint                        (Parm, NeedCtorLink)

void UGUIPage::ChangeHint(const struct FString& NewHint)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.ChangeHint");

	UGUIPage_ChangeHint_Params params;
	params.NewHint = NewHint;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.CheckResolution
// (Defined, Public)
// Parameters:
// bool                           Closing                        (Parm)
// class UGUIController*          InController                   (Parm)

void UGUIPage::CheckResolution(bool Closing, class UGUIController* InController)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.CheckResolution");

	UGUIPage_CheckResolution_Params params;
	params.Closing = Closing;
	params.InController = InController;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIPage::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.InitComponent");

	UGUIPage_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.Closed
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bCancelled                     (Parm)

void UGUIPage::Closed(class UGUIComponent* Sender, bool bCancelled)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.Closed");

	UGUIPage_Closed_Params params;
	params.Sender = Sender;
	params.bCancelled = bCancelled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.OnCanClose
// (Defined, Public, Delegate)
// Parameters:
// bool                           bCancelled                     (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIPage::OnCanClose(bool bCancelled)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.OnCanClose");

	UGUIPage_OnCanClose_Params params;
	params.bCancelled = bCancelled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIPage.OnClose
// (Public, Delegate)
// Parameters:
// bool                           bCancelled                     (OptionalParm, Parm)

void UGUIPage::OnClose(bool bCancelled)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.OnClose");

	UGUIPage_OnClose_Params params;
	params.bCancelled = bCancelled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.OnReOpen
// (Public, Delegate)

void UGUIPage::OnReOpen()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.OnReOpen");

	UGUIPage_OnReOpen_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIPage.OnOpen
// (Defined, Public, Delegate)

void UGUIPage::OnOpen()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIPage.OnOpen");

	UGUIPage_OnOpen_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.SetOutlineAlpha
// (Defined, Public)
// Parameters:
// int                            NewAlpha                       (Parm)

void UGUIListBase::SetOutlineAlpha(int NewAlpha)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.SetOutlineAlpha");

	UGUIListBase_SetOutlineAlpha_Params params;
	params.NewAlpha = NewAlpha;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.IsMultiSelect
// (Defined, Event, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIListBase::IsMultiSelect()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.IsMultiSelect");

	UGUIListBase_IsMultiSelect_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.InternalOnDragLeave
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBase::InternalOnDragLeave(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.InternalOnDragLeave");

	UGUIListBase_InternalOnDragLeave_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.InternalOnDragEnter
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBase::InternalOnDragEnter(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.InternalOnDragEnter");

	UGUIListBase_InternalOnDragEnter_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.InternalOnDragOver
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBase::InternalOnDragOver(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.InternalOnDragOver");

	UGUIListBase_InternalOnDragOver_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.InternalOnDragDrop
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIListBase::InternalOnDragDrop(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.InternalOnDragDrop");

	UGUIListBase_InternalOnDragDrop_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.InternalOnEndDrag
// (Public)
// Parameters:
// class UGUIComponent*           Accepting                      (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bAccepted                      (Parm)

void UGUIListBase::InternalOnEndDrag(class UGUIComponent* Accepting, bool bAccepted)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.InternalOnEndDrag");

	UGUIListBase_InternalOnEndDrag_Params params;
	params.Accepting = Accepting;
	params.bAccepted = bAccepted;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.InternalOnRightClick
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIListBase::InternalOnRightClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.InternalOnRightClick");

	UGUIListBase_InternalOnRightClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.CheckDragSelect
// (Defined, Public)

void UGUIListBase::CheckDragSelect()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.CheckDragSelect");

	UGUIListBase_CheckDragSelect_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.InternalOnBeginDrag
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIListBase::InternalOnBeginDrag(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.InternalOnBeginDrag");

	UGUIListBase_InternalOnBeginDrag_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.InternalOnMouseRelease
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBase::InternalOnMouseRelease(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.InternalOnMouseRelease");

	UGUIListBase_InternalOnMouseRelease_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.InternalOnMousePressed
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           IsRepeat                       (Parm)

void UGUIListBase::InternalOnMousePressed(class UGUIComponent* Sender, bool IsRepeat)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.InternalOnMousePressed");

	UGUIListBase_InternalOnMousePressed_Params params;
	params.Sender = Sender;
	params.IsRepeat = IsRepeat;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.End
// (Public)

void UGUIListBase::End()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.End");

	UGUIListBase_End_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.home
// (Public)

void UGUIListBase::home()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.home");

	UGUIListBase_home_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.PgDn
// (Public)

void UGUIListBase::PgDn()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.PgDn");

	UGUIListBase_PgDn_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.PgUp
// (Public)

void UGUIListBase::PgUp()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.PgUp");

	UGUIListBase_PgUp_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.WheelDown
// (Public)

void UGUIListBase::WheelDown()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.WheelDown");

	UGUIListBase_WheelDown_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.WheelUp
// (Public)

void UGUIListBase::WheelUp()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.WheelUp");

	UGUIListBase_WheelUp_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.MoveLeft
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIListBase::MoveLeft()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.MoveLeft");

	UGUIListBase_MoveLeft_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.MoveRight
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIListBase::MoveRight()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.MoveRight");

	UGUIListBase_MoveRight_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.Down
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIListBase::Down()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.Down");

	UGUIListBase_Down_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.Up
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIListBase::Up()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.Up");

	UGUIListBase_Up_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.InternalOnKeyEvent
// (Defined, Public)
// Parameters:
// unsigned char                  key                            (Parm, OutParm)
// unsigned char                  KeyState                       (Parm, OutParm)
// float                          Delta                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIListBase::InternalOnKeyEvent(float Delta, unsigned char* key, unsigned char* KeyState)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.InternalOnKeyEvent");

	UGUIListBase_InternalOnKeyEvent_Params params;
	params.Delta = Delta;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (key != nullptr)
		*key = params.key;
	if (KeyState != nullptr)
		*KeyState = params.KeyState;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.GetPendingItems
// (Defined, Public)
// Parameters:
// bool                           bGuarantee                     (OptionalParm, Parm)
// TArray<struct FString>         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

TArray<struct FString> UGUIListBase::GetPendingItems(bool bGuarantee)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.GetPendingItems");

	UGUIListBase_GetPendingItems_Params params;
	params.bGuarantee = bGuarantee;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.GetItemAtIndex
// (Defined, Public)
// Parameters:
// int                            idx                            (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIListBase::GetItemAtIndex(int idx)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.GetItemAtIndex");

	UGUIListBase_GetItemAtIndex_Params params;
	params.idx = idx;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.AdditionalDebugString
// (Defined, Event, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIListBase::AdditionalDebugString()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.AdditionalDebugString");

	UGUIListBase_AdditionalDebugString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.IsValidIndex
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIListBase::IsValidIndex(int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.IsValidIndex");

	UGUIListBase_IsValidIndex_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.IsValid
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIListBase::IsValid()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.IsValid");

	UGUIListBase_IsValid_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.DisableLinkedObjects
// (Defined, Public)

void UGUIListBase::DisableLinkedObjects()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.DisableLinkedObjects");

	UGUIListBase_DisableLinkedObjects_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.EnableLinkedObjects
// (Defined, Public)

void UGUIListBase::EnableLinkedObjects()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.EnableLinkedObjects");

	UGUIListBase_EnableLinkedObjects_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.InitLinkObjects
// (Defined, Public)
// Parameters:
// TArray<class UGUIComponent*>   NewObj                         (Parm, NeedCtorLink)
// bool                           bNoCheck                       (OptionalParm, Parm)

void UGUIListBase::InitLinkObjects(TArray<class UGUIComponent*> NewObj, bool bNoCheck)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.InitLinkObjects");

	UGUIListBase_InitLinkObjects_Params params;
	params.NewObj = NewObj;
	params.bNoCheck = bNoCheck;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.AddLinkObject
// (Defined, Public)
// Parameters:
// class UGUIComponent*           NewObj                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bNoCheck                       (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIListBase::AddLinkObject(class UGUIComponent* NewObj, bool bNoCheck)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.AddLinkObject");

	UGUIListBase_AddLinkObject_Params params;
	params.NewObj = NewObj;
	params.bNoCheck = bNoCheck;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.SetTopItem
// (Defined, Public)
// Parameters:
// int                            Item                           (Parm)

void UGUIListBase::SetTopItem(int Item)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.SetTopItem");

	UGUIListBase_SetTopItem_Params params;
	params.Item = Item;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.MakeVisible
// (Defined, Public)
// Parameters:
// float                          perc                           (Parm)

void UGUIListBase::MakeVisible(float perc)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.MakeVisible");

	UGUIListBase_MakeVisible_Params params;
	params.perc = perc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.Clear
// (Defined, Public)

void UGUIListBase::Clear()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.Clear");

	UGUIListBase_Clear_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.ClearPendingElements
// (Defined, Public)

void UGUIListBase::ClearPendingElements()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.ClearPendingElements");

	UGUIListBase_ClearPendingElements_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.IndexChanged
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBase::IndexChanged(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.IndexChanged");

	UGUIListBase_IndexChanged_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.SetIndex
// (Defined, Public)
// Parameters:
// int                            NewIndex                       (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIListBase::SetIndex(int NewIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.SetIndex");

	UGUIListBase_SetIndex_Params params;
	params.NewIndex = NewIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.MultiCalculateIndex
// (Defined, Event, Public)
// Parameters:
// bool                           bRequireValidIndex             (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIListBase::MultiCalculateIndex(bool bRequireValidIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.MultiCalculateIndex");

	UGUIListBase_MultiCalculateIndex_Params params;
	params.bRequireValidIndex = bRequireValidIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.CalculateIndex
// (Defined, Event, Public)
// Parameters:
// bool                           bRequireValidIndex             (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIListBase::CalculateIndex(bool bRequireValidIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.CalculateIndex");

	UGUIListBase_CalculateIndex_Params params;
	params.bRequireValidIndex = bRequireValidIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.SilentSetIndex
// (Defined, Public)
// Parameters:
// int                            NewIndex                       (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIListBase::SilentSetIndex(int NewIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.SilentSetIndex");

	UGUIListBase_SilentSetIndex_Params params;
	params.NewIndex = NewIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBase.Sort
// (Public)

void UGUIListBase::Sort()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.Sort");

	UGUIListBase_Sort_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.UpdateScrollbarForcedPosition
// (Defined, Event, Public)

void UGUIListBase::UpdateScrollbarForcedPosition()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.UpdateScrollbarForcedPosition");

	UGUIListBase_UpdateScrollbarForcedPosition_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBase::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.InitComponent");

	UGUIListBase_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.CheckLinkedObjects
// (Defined, Public, Delegate)
// Parameters:
// class UGUIListBase*            List                           (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBase::CheckLinkedObjects(class UGUIListBase* List)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.CheckLinkedObjects");

	UGUIListBase_CheckLinkedObjects_Params params;
	params.List = List;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.OnTrack
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// int                            LastIndex                      (Parm)

void UGUIListBase::OnTrack(class UGUIComponent* Sender, int LastIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.OnTrack");

	UGUIListBase_OnTrack_Params params;
	params.Sender = Sender;
	params.LastIndex = LastIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.OnAdjustTop
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBase::OnAdjustTop(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.OnAdjustTop");

	UGUIListBase_OnAdjustTop_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.OnDrawItem
// (Public, Delegate)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// int                            Item                           (Parm)
// float                          X                              (Parm)
// float                          Y                              (Parm)
// float                          W                              (Parm)
// float                          HT                             (Parm)
// bool                           bSelected                      (Parm)
// bool                           bPending                       (Parm)

void UGUIListBase::OnDrawItem(class UCanvas* Canvas, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.OnDrawItem");

	UGUIListBase_OnDrawItem_Params params;
	params.Canvas = Canvas;
	params.Item = Item;
	params.X = X;
	params.Y = Y;
	params.W = W;
	params.HT = HT;
	params.bSelected = bSelected;
	params.bPending = bPending;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBase.OnScrollBy
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBase::OnScrollBy(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBase.OnScrollBy");

	UGUIListBase_OnScrollBy_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertList.PgDn
// (Defined, Public)

void UGUIVertList::PgDn()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertList.PgDn");

	UGUIVertList_PgDn_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertList.PgUp
// (Defined, Public)

void UGUIVertList::PgUp()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertList.PgUp");

	UGUIVertList_PgUp_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertList.End
// (Defined, Public)

void UGUIVertList::End()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertList.End");

	UGUIVertList_End_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertList.home
// (Defined, Public)

void UGUIVertList::home()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertList.home");

	UGUIVertList_home_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertList.Down
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertList::Down()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertList.Down");

	UGUIVertList_Down_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertList.Up
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertList::Up()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertList.Up");

	UGUIVertList_Up_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertList.WheelDown
// (Defined, Public)

void UGUIVertList::WheelDown()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertList.WheelDown");

	UGUIVertList_WheelDown_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertList.WheelUp
// (Defined, Public)

void UGUIVertList::WheelUp()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertList.WheelUp");

	UGUIVertList_WheelUp_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertList.InternalOnKeyType
// (Defined, Public)
// Parameters:
// unsigned char                  key                            (Parm, OutParm)
// struct FString                 Unicode                        (OptionalParm, Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertList::InternalOnKeyType(const struct FString& Unicode, unsigned char* key)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertList.InternalOnKeyType");

	UGUIVertList_InternalOnKeyType_Params params;
	params.Unicode = Unicode;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (key != nullptr)
		*key = params.key;

	return params.ReturnValue;
}


// Function XInterface.GUIVertList.InternalOnClick
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertList::InternalOnClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertList.InternalOnClick");

	UGUIVertList_InternalOnClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertList.MultiCalculateIndex
// (Defined, Event, Public)
// Parameters:
// bool                           bRequireValidIndex             (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIVertList::MultiCalculateIndex(bool bRequireValidIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertList.MultiCalculateIndex");

	UGUIVertList_MultiCalculateIndex_Params params;
	params.bRequireValidIndex = bRequireValidIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertList.CalculateIndex
// (Defined, Event, Public)
// Parameters:
// bool                           bRequireValidIndex             (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIVertList::CalculateIndex(bool bRequireValidIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertList.CalculateIndex");

	UGUIVertList_CalculateIndex_Params params;
	params.bRequireValidIndex = bRequireValidIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertList.CenterMouse
// (Defined, Public)

void UGUIVertList::CenterMouse()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertList.CenterMouse");

	UGUIVertList_CenterMouse_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertList.GetItemHeight
// (Public, Delegate)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGUIVertList::GetItemHeight(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertList.GetItemHeight");

	UGUIVertList_GetItemHeight_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiColumnList.SetTopItem
// (Defined, Public)
// Parameters:
// int                            Item                           (Parm)

void UGUIMultiColumnList::SetTopItem(int Item)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.SetTopItem");

	UGUIMultiColumnList_SetTopItem_Params params;
	params.Item = Item;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnList.Dump
// (Defined, Public)

void UGUIMultiColumnList::Dump()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.Dump");

	UGUIMultiColumnList_Dump_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnList.Sort
// (Defined, Public)

void UGUIMultiColumnList::Sort()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.Sort");

	UGUIMultiColumnList_Sort_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnList.GetCellLeftWidth
// (Defined, Public)
// Parameters:
// int                            Column                         (Parm)
// float                          Left                           (Parm, OutParm)
// float                          width                          (Parm, OutParm)

void UGUIMultiColumnList::GetCellLeftWidth(int Column, float* Left, float* width)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.GetCellLeftWidth");

	UGUIMultiColumnList_GetCellLeftWidth_Params params;
	params.Column = Column;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Left != nullptr)
		*Left = params.Left;
	if (width != nullptr)
		*width = params.width;
}


// Function XInterface.GUIMultiColumnList.InternalOnPreDraw
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIMultiColumnList::InternalOnPreDraw(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.InternalOnPreDraw");

	UGUIMultiColumnList_InternalOnPreDraw_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiColumnList.InitializeColumns
// (Defined, Event, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void UGUIMultiColumnList::InitializeColumns(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.InitializeColumns");

	UGUIMultiColumnList_InitializeColumns_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnList.ResolutionChanged
// (Defined, Public)
// Parameters:
// int                            ResX                           (Parm)
// int                            ResY                           (Parm)

void UGUIMultiColumnList::ResolutionChanged(int ResX, int ResY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.ResolutionChanged");

	UGUIMultiColumnList_ResolutionChanged_Params params;
	params.ResX = ResX;
	params.ResY = ResY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnList.RemovedCurrent
// (Defined, Public)

void UGUIMultiColumnList::RemovedCurrent()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.RemovedCurrent");

	UGUIMultiColumnList_RemovedCurrent_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnList.Clear
// (Defined, Public)

void UGUIMultiColumnList::Clear()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.Clear");

	UGUIMultiColumnList_Clear_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnList.OnSortChanged
// (Defined, Event, Public)

void UGUIMultiColumnList::OnSortChanged()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.OnSortChanged");

	UGUIMultiColumnList_OnSortChanged_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnList.CurrentListId
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIMultiColumnList::CurrentListId()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.CurrentListId");

	UGUIMultiColumnList_CurrentListId_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiColumnList.GetSortString
// (Public, Delegate)
// Parameters:
// int                            YourArrayIndex                 (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIMultiColumnList::GetSortString(int YourArrayIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.GetSortString");

	UGUIMultiColumnList_GetSortString_Params params;
	params.YourArrayIndex = YourArrayIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiColumnList.AddedItem
// (Final, Native, Public)
// Parameters:
// int                            YourArrayIndex                 (OptionalParm, Parm)

void UGUIMultiColumnList::AddedItem(int YourArrayIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.AddedItem");

	UGUIMultiColumnList_AddedItem_Params params;
	params.YourArrayIndex = YourArrayIndex;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnList.RemovedItem
// (Final, Native, Public)
// Parameters:
// int                            YourArrayIndex                 (Parm)

void UGUIMultiColumnList::RemovedItem(int YourArrayIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.RemovedItem");

	UGUIMultiColumnList_RemovedItem_Params params;
	params.YourArrayIndex = YourArrayIndex;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnList.UpdatedItem
// (Final, Native, Public)
// Parameters:
// int                            YourArrayIndex                 (Parm)

void UGUIMultiColumnList::UpdatedItem(int YourArrayIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.UpdatedItem");

	UGUIMultiColumnList_UpdatedItem_Params params;
	params.YourArrayIndex = YourArrayIndex;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnList.SortList
// (Final, Native, Public)

void UGUIMultiColumnList::SortList()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.SortList");

	UGUIMultiColumnList_SortList_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnList.ChangeSortOrder
// (Final, Native, Public)

void UGUIMultiColumnList::ChangeSortOrder()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.ChangeSortOrder");

	UGUIMultiColumnList_ChangeSortOrder_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnList.GetListIndex
// (Final, Native, Public)
// Parameters:
// int                            YourArrayIndex                 (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIMultiColumnList::GetListIndex(int YourArrayIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.GetListIndex");

	UGUIMultiColumnList_GetListIndex_Params params;
	params.YourArrayIndex = YourArrayIndex;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIMultiColumnList.OnColumnSized
// (Public, Delegate)
// Parameters:
// int                            Column                         (Parm)

void UGUIMultiColumnList::OnColumnSized(int Column)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnList.OnColumnSized");

	UGUIMultiColumnList_OnColumnSized_Params params;
	params.Column = Column;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.InternalOnDragDrop
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertImageList::InternalOnDragDrop(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.InternalOnDragDrop");

	UGUIVertImageList_InternalOnDragDrop_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.InternalOnEndDrag
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Accepting                      (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bAccepted                      (Parm)

void UGUIVertImageList::InternalOnEndDrag(class UGUIComponent* Accepting, bool bAccepted)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.InternalOnEndDrag");

	UGUIVertImageList_InternalOnEndDrag_Params params;
	params.Accepting = Accepting;
	params.bAccepted = bAccepted;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.FindItem
// (Defined, Public)
// Parameters:
// int                            Item                           (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIVertImageList::FindItem(int Item)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.FindItem");

	UGUIVertImageList_FindItem_Params params;
	params.Item = Item;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.FindImage
// (Defined, Public)
// Parameters:
// class UMaterial*               Image                          (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIVertImageList::FindImage(class UMaterial* Image)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.FindImage");

	UGUIVertImageList_FindImage_Params params;
	params.Image = Image;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.RemoveItem
// (Defined, Public)
// Parameters:
// int                            Item                           (Parm)

void UGUIVertImageList::RemoveItem(int Item)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.RemoveItem");

	UGUIVertImageList_RemoveItem_Params params;
	params.Item = Item;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.RemoveImage
// (Defined, Public)
// Parameters:
// class UMaterial*               Image                          (Parm)

void UGUIVertImageList::RemoveImage(class UMaterial* Image)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.RemoveImage");

	UGUIVertImageList_RemoveImage_Params params;
	params.Image = Image;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.SetItemAtIndex
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// int                            NewItem                        (Parm)

void UGUIVertImageList::SetItemAtIndex(int i, int NewItem)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.SetItemAtIndex");

	UGUIVertImageList_SetItemAtIndex_Params params;
	params.i = i;
	params.NewItem = NewItem;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.SetImageAtIndex
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// class UMaterial*               NewImage                       (Parm)

void UGUIVertImageList::SetImageAtIndex(int i, class UMaterial* NewImage)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.SetImageAtIndex");

	UGUIVertImageList_SetImageAtIndex_Params params;
	params.i = i;
	params.NewImage = NewImage;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.GetPendingElements
// (Defined, Public)
// Parameters:
// bool                           bGuarantee                     (OptionalParm, Parm)
// TArray<struct FImageListElem>  ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

TArray<struct FImageListElem> UGUIVertImageList::GetPendingElements(bool bGuarantee)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.GetPendingElements");

	UGUIVertImageList_GetPendingElements_Params params;
	params.bGuarantee = bGuarantee;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.ClearPendingElements
// (Defined, Public)

void UGUIVertImageList::ClearPendingElements()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.ClearPendingElements");

	UGUIVertImageList_ClearPendingElements_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.IsLocked
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertImageList::IsLocked()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.IsLocked");

	UGUIVertImageList_IsLocked_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.IndexLocked
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertImageList::IndexLocked(int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.IndexLocked");

	UGUIVertImageList_IndexLocked_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.GetAtIndex
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// class UMaterial*               Image                          (Parm, OutParm)
// int                            Item                           (Parm, OutParm)
// int                            Locked                         (Parm, OutParm)

void UGUIVertImageList::GetAtIndex(int i, class UMaterial** Image, int* Item, int* Locked)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.GetAtIndex");

	UGUIVertImageList_GetAtIndex_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Image != nullptr)
		*Image = params.Image;
	if (Item != nullptr)
		*Item = params.Item;
	if (Locked != nullptr)
		*Locked = params.Locked;
}


// Function XInterface.GUIVertImageList.GetItemIntAtIndex
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIVertImageList::GetItemIntAtIndex(int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.GetItemIntAtIndex");

	UGUIVertImageList_GetItemIntAtIndex_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.GetItemAtIndex
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIVertImageList::GetItemAtIndex(int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.GetItemAtIndex");

	UGUIVertImageList_GetItemAtIndex_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.GetImageAtIndex
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// class UMaterial*               ReturnValue                    (Parm, OutParm, ReturnParm)

class UMaterial* UGUIVertImageList::GetImageAtIndex(int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.GetImageAtIndex");

	UGUIVertImageList_GetImageAtIndex_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.GetItem
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIVertImageList::GetItem()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.GetItem");

	UGUIVertImageList_GetItem_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.Get
// (Defined, Public)
// Parameters:
// bool                           bGuarantee                     (OptionalParm, Parm)
// class UMaterial*               ReturnValue                    (Parm, OutParm, ReturnParm)

class UMaterial* UGUIVertImageList::Get(bool bGuarantee)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.Get");

	UGUIVertImageList_Get_Params params;
	params.bGuarantee = bGuarantee;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.Clear
// (Defined, Public)

void UGUIVertImageList::Clear()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.Clear");

	UGUIVertImageList_Clear_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.RemoveElement
// (Defined, Public)
// Parameters:
// struct FImageListElem          elem                           (Parm)
// int                            Count                          (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIVertImageList::RemoveElement(const struct FImageListElem& elem, int Count)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.RemoveElement");

	UGUIVertImageList_RemoveElement_Params params;
	params.elem = elem;
	params.Count = Count;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.RemoveSilent
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// int                            Count                          (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIVertImageList::RemoveSilent(int i, int Count)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.RemoveSilent");

	UGUIVertImageList_RemoveSilent_Params params;
	params.i = i;
	params.Count = Count;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.Remove
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// int                            Count                          (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIVertImageList::Remove(int i, int Count)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.Remove");

	UGUIVertImageList_Remove_Params params;
	params.i = i;
	params.Count = Count;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.LoadFrom
// (Defined, Public)
// Parameters:
// class UGUIVertImageList*       Source                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bClearFirst                    (OptionalParm, Parm)

void UGUIVertImageList::LoadFrom(class UGUIVertImageList* Source, bool bClearFirst)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.LoadFrom");

	UGUIVertImageList_LoadFrom_Params params;
	params.Source = Source;
	params.bClearFirst = bClearFirst;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.Swap
// (Defined, Event, Public)
// Parameters:
// int                            IndexA                         (Parm)
// int                            IndexB                         (Parm)

void UGUIVertImageList::Swap(int IndexA, int IndexB)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.Swap");

	UGUIVertImageList_Swap_Params params;
	params.IndexA = IndexA;
	params.IndexB = IndexB;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.InsertElement
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// struct FImageListElem          NewElem                        (Parm)
// int                            Locked                         (OptionalParm, Parm)

void UGUIVertImageList::InsertElement(int i, const struct FImageListElem& NewElem, int Locked)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.InsertElement");

	UGUIVertImageList_InsertElement_Params params;
	params.i = i;
	params.NewElem = NewElem;
	params.Locked = Locked;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.Insert
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// class UMaterial*               NewImage                       (Parm)
// int                            NewItem                        (OptionalParm, Parm)
// int                            Locked                         (OptionalParm, Parm)

void UGUIVertImageList::Insert(int i, class UMaterial* NewImage, int NewItem, int Locked)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.Insert");

	UGUIVertImageList_Insert_Params params;
	params.i = i;
	params.NewImage = NewImage;
	params.NewItem = NewItem;
	params.Locked = Locked;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.Replace
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// class UMaterial*               NewImage                       (Parm)
// int                            NewItem                        (OptionalParm, Parm)
// int                            Locked                         (OptionalParm, Parm)

void UGUIVertImageList::Replace(int i, class UMaterial* NewImage, int NewItem, int Locked)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.Replace");

	UGUIVertImageList_Replace_Params params;
	params.i = i;
	params.NewImage = NewImage;
	params.NewItem = NewItem;
	params.Locked = Locked;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.AddImage
// (Defined, Public)
// Parameters:
// struct FImageListElem          NewElem                        (Parm)
// int                            Locked                         (OptionalParm, Parm)

void UGUIVertImageList::AddImage(const struct FImageListElem& NewElem, int Locked)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.AddImage");

	UGUIVertImageList_AddImage_Params params;
	params.NewElem = NewElem;
	params.Locked = Locked;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.Add
// (Defined, Public)
// Parameters:
// class UMaterial*               Image                          (Parm)
// int                            Item                           (OptionalParm, Parm)
// int                            Locked                         (OptionalParm, Parm)

void UGUIVertImageList::Add(class UMaterial* Image, int Item, int Locked)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.Add");

	UGUIVertImageList_Add_Params params;
	params.Image = Image;
	params.Item = Item;
	params.Locked = Locked;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.SetTopItem
// (Defined, Public)
// Parameters:
// int                            Item                           (Parm)

void UGUIVertImageList::SetTopItem(int Item)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.SetTopItem");

	UGUIVertImageList_SetTopItem_Params params;
	params.Item = Item;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.MakeVisible
// (Defined, Public)
// Parameters:
// float                          perc                           (Parm)

void UGUIVertImageList::MakeVisible(float perc)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.MakeVisible");

	UGUIVertImageList_MakeVisible_Params params;
	params.perc = perc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.PgDn
// (Defined, Public)

void UGUIVertImageList::PgDn()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.PgDn");

	UGUIVertImageList_PgDn_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.PgUp
// (Defined, Public)

void UGUIVertImageList::PgUp()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.PgUp");

	UGUIVertImageList_PgUp_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.End
// (Defined, Public)

void UGUIVertImageList::End()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.End");

	UGUIVertImageList_End_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.home
// (Defined, Public)

void UGUIVertImageList::home()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.home");

	UGUIVertImageList_home_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageList.MoveLeft
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertImageList::MoveLeft()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.MoveLeft");

	UGUIVertImageList_MoveLeft_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.MoveRight
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertImageList::MoveRight()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.MoveRight");

	UGUIVertImageList_MoveRight_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.Down
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertImageList::Down()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.Down");

	UGUIVertImageList_Down_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.Up
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertImageList::Up()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.Up");

	UGUIVertImageList_Up_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.SetIndex
// (Defined, Public)
// Parameters:
// int                            NewIndex                       (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIVertImageList::SetIndex(int NewIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.SetIndex");

	UGUIVertImageList_SetIndex_Params params;
	params.NewIndex = NewIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.InternalOnClick
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertImageList::InternalOnClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.InternalOnClick");

	UGUIVertImageList_InternalOnClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.OnIsSelectibleIndex
// (Defined, Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// int                            Index                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertImageList::OnIsSelectibleIndex(class UGUIComponent* Sender, int Index)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.OnIsSelectibleIndex");

	UGUIVertImageList_OnIsSelectibleIndex_Params params;
	params.Sender = Sender;
	params.Index = Index;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.OnItemDblClick
// (Public, Delegate)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertImageList::OnItemDblClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.OnItemDblClick");

	UGUIVertImageList_OnItemDblClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageList.CalculateIndex
// (Defined, Event, Public)
// Parameters:
// bool                           bRequireValidIndex             (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIVertImageList::CalculateIndex(bool bRequireValidIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageList.CalculateIndex");

	UGUIVertImageList_CalculateIndex_Params params;
	params.bRequireValidIndex = bRequireValidIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.GetPendingElements
// (Defined, Public)
// Parameters:
// bool                           bGuarantee                     (OptionalParm, Parm)
// TArray<struct FGUIListElem>    ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

TArray<struct FGUIListElem> UGUIList::GetPendingElements(bool bGuarantee)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.GetPendingElements");

	UGUIList_GetPendingElements_Params params;
	params.bGuarantee = bGuarantee;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.ClearPendingElements
// (Defined, Public)

void UGUIList::ClearPendingElements()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.ClearPendingElements");

	UGUIList_ClearPendingElements_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.InternalOnDragDrop
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIList::InternalOnDragDrop(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.InternalOnDragDrop");

	UGUIList_InternalOnDragDrop_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.InternalOnEndDrag
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Accepting                      (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bAccepted                      (Parm)

void UGUIList::InternalOnEndDrag(class UGUIComponent* Accepting, bool bAccepted)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.InternalOnEndDrag");

	UGUIList_InternalOnEndDrag_Params params;
	params.Accepting = Accepting;
	params.bAccepted = bAccepted;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.FindIndex
// (Defined, Public)
// Parameters:
// struct FString                 Test                           (Parm, NeedCtorLink)
// bool                           bExact                         (OptionalParm, Parm)
// bool                           bExtra                         (OptionalParm, Parm)
// class UObject*                 TestObject                     (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIList::FindIndex(const struct FString& Test, bool bExact, bool bExtra, class UObject* TestObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.FindIndex");

	UGUIList_FindIndex_Params params;
	params.Test = Test;
	params.bExact = bExact;
	params.bExtra = bExtra;
	params.TestObject = TestObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.FindItemObject
// (Defined, Public)
// Parameters:
// class UObject*                 obj                            (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIList::FindItemObject(class UObject* obj)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.FindItemObject");

	UGUIList_FindItemObject_Params params;
	params.obj = obj;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.FindExtra
// (Defined, Public)
// Parameters:
// struct FString                 Text                           (Parm, NeedCtorLink)
// bool                           bExact                         (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIList::FindExtra(const struct FString& Text, bool bExact)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.FindExtra");

	UGUIList_FindExtra_Params params;
	params.Text = Text;
	params.bExact = bExact;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.Find
// (Defined, Public)
// Parameters:
// struct FString                 Text                           (Parm, NeedCtorLink)
// bool                           bExact                         (OptionalParm, Parm)
// bool                           bExtra                         (OptionalParm, Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIList::Find(const struct FString& Text, bool bExact, bool bExtra)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.Find");

	UGUIList_Find_Params params;
	params.Text = Text;
	params.bExact = bExact;
	params.bExtra = bExtra;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.RemoveExtra
// (Defined, Public)
// Parameters:
// struct FString                 str                            (Parm, NeedCtorLink)

void UGUIList::RemoveExtra(const struct FString& str)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.RemoveExtra");

	UGUIList_RemoveExtra_Params params;
	params.str = str;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.RemoveObject
// (Defined, Public)
// Parameters:
// class UObject*                 obj                            (Parm)

void UGUIList::RemoveObject(class UObject* obj)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.RemoveObject");

	UGUIList_RemoveObject_Params params;
	params.obj = obj;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.RemoveItem
// (Defined, Public)
// Parameters:
// struct FString                 Item                           (Parm, NeedCtorLink)

void UGUIList::RemoveItem(const struct FString& Item)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.RemoveItem");

	UGUIList_RemoveItem_Params params;
	params.Item = Item;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.SetExtraAtIndex
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// struct FString                 NewExtra                       (Parm, NeedCtorLink)

void UGUIList::SetExtraAtIndex(int i, const struct FString& NewExtra)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.SetExtraAtIndex");

	UGUIList_SetExtraAtIndex_Params params;
	params.i = i;
	params.NewExtra = NewExtra;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.SetObjectAtIndex
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// class UObject*                 NewObject                      (Parm)

void UGUIList::SetObjectAtIndex(int i, class UObject* NewObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.SetObjectAtIndex");

	UGUIList_SetObjectAtIndex_Params params;
	params.i = i;
	params.NewObject = NewObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.SetItemAtIndex
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// struct FString                 NewItem                        (Parm, NeedCtorLink)

void UGUIList::SetItemAtIndex(int i, const struct FString& NewItem)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.SetItemAtIndex");

	UGUIList_SetItemAtIndex_Params params;
	params.i = i;
	params.NewItem = NewItem;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.GetAtIndex
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// struct FString                 ItemStr                        (Parm, OutParm, NeedCtorLink)
// class UObject*                 ExtraObj                       (Parm, OutParm)
// struct FString                 ExtraStr                       (Parm, OutParm, NeedCtorLink)

void UGUIList::GetAtIndex(int i, struct FString* ItemStr, class UObject** ExtraObj, struct FString* ExtraStr)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.GetAtIndex");

	UGUIList_GetAtIndex_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ItemStr != nullptr)
		*ItemStr = params.ItemStr;
	if (ExtraObj != nullptr)
		*ExtraObj = params.ExtraObj;
	if (ExtraStr != nullptr)
		*ExtraStr = params.ExtraStr;
}


// Function XInterface.GUIList.GetExtraAtIndex
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIList::GetExtraAtIndex(int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.GetExtraAtIndex");

	UGUIList_GetExtraAtIndex_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.GetObjectAtIndex
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// class UObject*                 ReturnValue                    (Parm, OutParm, ReturnParm)

class UObject* UGUIList::GetObjectAtIndex(int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.GetObjectAtIndex");

	UGUIList_GetObjectAtIndex_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.GetItemAtIndex
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIList::GetItemAtIndex(int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.GetItemAtIndex");

	UGUIList_GetItemAtIndex_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.IsSection
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIList::IsSection()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.IsSection");

	UGUIList_IsSection_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.GetExtra
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIList::GetExtra()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.GetExtra");

	UGUIList_GetExtra_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.GetObject
// (Defined, Public)
// Parameters:
// class UObject*                 ReturnValue                    (Parm, OutParm, ReturnParm)

class UObject* UGUIList::GetObject()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.GetObject");

	UGUIList_GetObject_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.Get
// (Defined, Public)
// Parameters:
// bool                           bGuarantee                     (OptionalParm, Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIList::Get(bool bGuarantee)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.Get");

	UGUIList_Get_Params params;
	params.bGuarantee = bGuarantee;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.SelectedText
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIList::SelectedText()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.SelectedText");

	UGUIList_SelectedText_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.Clear
// (Defined, Public)

void UGUIList::Clear()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.Clear");

	UGUIList_Clear_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.RemoveElement
// (Defined, Public)
// Parameters:
// struct FGUIListElem            elem                           (Parm, NeedCtorLink)
// int                            Count                          (OptionalParm, Parm)
// bool                           bNoSort                        (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIList::RemoveElement(const struct FGUIListElem& elem, int Count, bool bNoSort)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.RemoveElement");

	UGUIList_RemoveElement_Params params;
	params.elem = elem;
	params.Count = Count;
	params.bNoSort = bNoSort;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.RemoveSilent
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// int                            Count                          (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIList::RemoveSilent(int i, int Count)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.RemoveSilent");

	UGUIList_RemoveSilent_Params params;
	params.i = i;
	params.Count = Count;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.Remove
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// int                            Count                          (OptionalParm, Parm)
// bool                           bNoSort                        (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIList::Remove(int i, int Count, bool bNoSort)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.Remove");

	UGUIList_Remove_Params params;
	params.i = i;
	params.Count = Count;
	params.bNoSort = bNoSort;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.LoadFrom
// (Defined, Public)
// Parameters:
// class UGUIList*                Source                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bClearFirst                    (OptionalParm, Parm)

void UGUIList::LoadFrom(class UGUIList* Source, bool bClearFirst)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.LoadFrom");

	UGUIList_LoadFrom_Params params;
	params.Source = Source;
	params.bClearFirst = bClearFirst;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.Swap
// (Defined, Event, Public)
// Parameters:
// int                            IndexA                         (Parm)
// int                            IndexB                         (Parm)

void UGUIList::Swap(int IndexA, int IndexB)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.Swap");

	UGUIList_Swap_Params params;
	params.IndexA = IndexA;
	params.IndexB = IndexB;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.InsertElement
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// struct FGUIListElem            NewElem                        (Parm, NeedCtorLink)
// bool                           bNoSort                        (OptionalParm, Parm)

void UGUIList::InsertElement(int i, const struct FGUIListElem& NewElem, bool bNoSort)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.InsertElement");

	UGUIList_InsertElement_Params params;
	params.i = i;
	params.NewElem = NewElem;
	params.bNoSort = bNoSort;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.Insert
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// struct FString                 NewItem                        (Parm, NeedCtorLink)
// class UObject*                 obj                            (OptionalParm, Parm)
// struct FString                 str                            (OptionalParm, Parm, NeedCtorLink)
// bool                           bNoSort                        (OptionalParm, Parm)
// bool                           bSection                       (OptionalParm, Parm)

void UGUIList::Insert(int i, const struct FString& NewItem, class UObject* obj, const struct FString& str, bool bNoSort, bool bSection)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.Insert");

	UGUIList_Insert_Params params;
	params.i = i;
	params.NewItem = NewItem;
	params.obj = obj;
	params.str = str;
	params.bNoSort = bNoSort;
	params.bSection = bSection;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.Replace
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// struct FString                 NewItem                        (Parm, NeedCtorLink)
// class UObject*                 obj                            (OptionalParm, Parm)
// struct FString                 str                            (OptionalParm, Parm, NeedCtorLink)
// bool                           bNoSort                        (OptionalParm, Parm)

void UGUIList::Replace(int i, const struct FString& NewItem, class UObject* obj, const struct FString& str, bool bNoSort)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.Replace");

	UGUIList_Replace_Params params;
	params.i = i;
	params.NewItem = NewItem;
	params.obj = obj;
	params.str = str;
	params.bNoSort = bNoSort;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.AddElement
// (Defined, Public)
// Parameters:
// struct FGUIListElem            NewElem                        (Parm, NeedCtorLink)

void UGUIList::AddElement(const struct FGUIListElem& NewElem)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.AddElement");

	UGUIList_AddElement_Params params;
	params.NewElem = NewElem;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.Add
// (Defined, Public)
// Parameters:
// struct FString                 NewItem                        (Parm, NeedCtorLink)
// class UObject*                 obj                            (OptionalParm, Parm)
// struct FString                 str                            (OptionalParm, Parm, NeedCtorLink)
// bool                           bSection                       (OptionalParm, Parm)

void UGUIList::Add(const struct FString& NewItem, class UObject* obj, const struct FString& str, bool bSection)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.Add");

	UGUIList_Add_Params params;
	params.NewItem = NewItem;
	params.obj = obj;
	params.str = str;
	params.bSection = bSection;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.CompareItem
// (Defined, Public, Delegate)
// Parameters:
// struct FGUIListElem            ElemA                          (Parm, NeedCtorLink)
// struct FGUIListElem            ElemB                          (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIList::CompareItem(const struct FGUIListElem& ElemA, const struct FGUIListElem& ElemB)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.CompareItem");

	UGUIList_CompareItem_Params params;
	params.ElemA = ElemA;
	params.ElemB = ElemB;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIList.Sort
// (Defined, Public)

void UGUIList::Sort()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.Sort");

	UGUIList_Sort_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIList.SortList
// (Final, Native, Public)

void UGUIList::SortList()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIList.SortList");

	UGUIList_SortList_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnListHeader.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIMultiColumnListHeader::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnListHeader.InitComponent");

	UGUIMultiColumnListHeader_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollText.IsValid
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIScrollText::IsValid()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollText.IsValid");

	UGUIScrollText_IsValid_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIScrollText.EndScrolling
// (Defined, Public)

void UGUIScrollText::EndScrolling()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollText.EndScrolling");

	UGUIScrollText_EndScrolling_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollText.InternalOnKeyEvent
// (Defined, Public)
// Parameters:
// unsigned char                  key                            (Parm, OutParm)
// unsigned char                  State                          (Parm, OutParm)
// float                          Delta                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIScrollText::InternalOnKeyEvent(float Delta, unsigned char* key, unsigned char* State)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollText.InternalOnKeyEvent");

	UGUIScrollText_InternalOnKeyEvent_Params params;
	params.Delta = Delta;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (key != nullptr)
		*key = params.key;
	if (State != nullptr)
		*State = params.State;

	return params.ReturnValue;
}


// Function XInterface.GUIScrollText.InternalOnKeyType
// (Defined, Public)
// Parameters:
// unsigned char                  key                            (Parm, OutParm)
// struct FString                 Unicode                        (OptionalParm, Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIScrollText::InternalOnKeyType(const struct FString& Unicode, unsigned char* key)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollText.InternalOnKeyType");

	UGUIScrollText_InternalOnKeyType_Params params;
	params.Unicode = Unicode;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (key != nullptr)
		*key = params.key;

	return params.ReturnValue;
}


// Function XInterface.GUIScrollText.InternalOnClick
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIScrollText::InternalOnClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollText.InternalOnClick");

	UGUIScrollText_InternalOnClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIScrollText.Timer
// (Defined, Event, Public)

void UGUIScrollText::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollText.Timer");

	UGUIScrollText_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollText.SkipChar
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIScrollText::SkipChar()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollText.SkipChar");

	UGUIScrollText_SkipChar_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIScrollText.Restart
// (Defined, Public)

void UGUIScrollText::Restart()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollText.Restart");

	UGUIScrollText_Restart_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollText.Stop
// (Defined, Public)

void UGUIScrollText::Stop()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollText.Stop");

	UGUIScrollText_Stop_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollText.SetContent
// (Defined, Public)
// Parameters:
// struct FString                 NewContent                     (Parm, NeedCtorLink)
// struct FString                 sep                            (OptionalParm, Parm, NeedCtorLink)

void UGUIScrollText::SetContent(const struct FString& NewContent, const struct FString& sep)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollText.SetContent");

	UGUIScrollText_SetContent_Params params;
	params.NewContent = NewContent;
	params.sep = sep;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollText.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIScrollText::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollText.InitComponent");

	UGUIScrollText_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollText.Dump
// (Defined, Public)

void UGUIScrollText::Dump()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollText.Dump");

	UGUIScrollText_Dump_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollText.OnEndOfLine
// (Public, Delegate)

void UGUIScrollText::OnEndOfLine()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollText.OnEndOfLine");

	UGUIScrollText_OnEndOfLine_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollText.GetWordUnderCursor
// (Final, Native, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIScrollText::GetWordUnderCursor()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollText.GetWordUnderCursor");

	UGUIScrollText_GetWordUnderCursor_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBoxBase.SetFriendlyLabel
// (Defined, Public)
// Parameters:
// class UGUILabel*               NewLabel                       (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBoxBase::SetFriendlyLabel(class UGUILabel* NewLabel)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBoxBase.SetFriendlyLabel");

	UGUIListBoxBase_SetFriendlyLabel_Params params;
	params.NewLabel = NewLabel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBoxBase.SetScrollBarStyle
// (Defined, Public)
// Parameters:
// bool                           changeScrollZoneStyle          (Parm)
// class UGUIStyles*              scrollZoneStyle                (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           changeIncreaseButtonStyle      (Parm)
// class UGUIStyles*              increaseButtonStyle            (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           changeIncreaseButtonGraphic    (Parm)
// class UMaterial*               increaseButtonGraphic          (Parm)
// bool                           changeDecreaseButtonStyle      (Parm)
// class UGUIStyles*              decreaseButtonStyle            (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           changeDecreaseButtonGraphic    (Parm)
// class UMaterial*               decreaseButtonGraphic          (Parm)
// bool                           changeGripButtonStyle          (Parm)
// class UGUIStyles*              gripButtonStyle                (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBoxBase::SetScrollBarStyle(bool changeScrollZoneStyle, class UGUIStyles* scrollZoneStyle, bool changeIncreaseButtonStyle, class UGUIStyles* increaseButtonStyle, bool changeIncreaseButtonGraphic, class UMaterial* increaseButtonGraphic, bool changeDecreaseButtonStyle, class UGUIStyles* decreaseButtonStyle, bool changeDecreaseButtonGraphic, class UMaterial* decreaseButtonGraphic, bool changeGripButtonStyle, class UGUIStyles* gripButtonStyle)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBoxBase.SetScrollBarStyle");

	UGUIListBoxBase_SetScrollBarStyle_Params params;
	params.changeScrollZoneStyle = changeScrollZoneStyle;
	params.scrollZoneStyle = scrollZoneStyle;
	params.changeIncreaseButtonStyle = changeIncreaseButtonStyle;
	params.increaseButtonStyle = increaseButtonStyle;
	params.changeIncreaseButtonGraphic = changeIncreaseButtonGraphic;
	params.increaseButtonGraphic = increaseButtonGraphic;
	params.changeDecreaseButtonStyle = changeDecreaseButtonStyle;
	params.decreaseButtonStyle = decreaseButtonStyle;
	params.changeDecreaseButtonGraphic = changeDecreaseButtonGraphic;
	params.decreaseButtonGraphic = decreaseButtonGraphic;
	params.changeGripButtonStyle = changeGripButtonStyle;
	params.gripButtonStyle = gripButtonStyle;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBoxBase.InternalOnCreateComponent
// (Defined, Public)
// Parameters:
// class UGUIComponent*           NewComp                        (ExportObject, Parm, NeedCtorLink, EditInline)
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBoxBase::InternalOnCreateComponent(class UGUIComponent* NewComp, class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBoxBase.InternalOnCreateComponent");

	UGUIListBoxBase_InternalOnCreateComponent_Params params;
	params.NewComp = NewComp;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBoxBase.SetHint
// (Defined, Public)
// Parameters:
// struct FString                 NewHint                        (Parm, NeedCtorLink)

void UGUIListBoxBase::SetHint(const struct FString& NewHint)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBoxBase.SetHint");

	UGUIListBoxBase_SetHint_Params params;
	params.NewHint = NewHint;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBoxBase.InitBaseList
// (Defined, Public)
// Parameters:
// class UGUIListBase*            LocalList                      (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBoxBase::InitBaseList(class UGUIListBase* LocalList)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBoxBase.InitBaseList");

	UGUIListBoxBase_InitBaseList_Params params;
	params.LocalList = LocalList;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBoxBase.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBoxBase::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBoxBase.InitComponent");

	UGUIListBoxBase_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnListBox.SetHeaderStyle
// (Defined, Public)
// Parameters:
// bool                           changeStyle                    (Parm)
// struct FString                 stylez                         (Parm, NeedCtorLink)
// bool                           changeBarStyle                 (Parm)
// struct FString                 barStylez                      (Parm, NeedCtorLink)

void UGUIMultiColumnListBox::SetHeaderStyle(bool changeStyle, const struct FString& stylez, bool changeBarStyle, const struct FString& barStylez)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnListBox.SetHeaderStyle");

	UGUIMultiColumnListBox_SetHeaderStyle_Params params;
	params.changeStyle = changeStyle;
	params.stylez = stylez;
	params.changeBarStyle = changeBarStyle;
	params.barStylez = barStylez;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnListBox.InternalOnColumnSized
// (Defined, Public)
// Parameters:
// int                            Column                         (Parm)

void UGUIMultiColumnListBox::InternalOnColumnSized(int Column)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnListBox.InternalOnColumnSized");

	UGUIMultiColumnListBox_InternalOnColumnSized_Params params;
	params.Column = Column;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnListBox.InternalOnCreateComponent
// (Defined, Public)
// Parameters:
// class UGUIComponent*           NewComp                        (ExportObject, Parm, NeedCtorLink, EditInline)
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIMultiColumnListBox::InternalOnCreateComponent(class UGUIComponent* NewComp, class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnListBox.InternalOnCreateComponent");

	UGUIMultiColumnListBox_InternalOnCreateComponent_Params params;
	params.NewComp = NewComp;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnListBox.InternalOnLoadINI
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// struct FString                 S                              (Parm, NeedCtorLink)

void UGUIMultiColumnListBox::InternalOnLoadINI(class UGUIComponent* Sender, const struct FString& S)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnListBox.InternalOnLoadINI");

	UGUIMultiColumnListBox_InternalOnLoadINI_Params params;
	params.Sender = Sender;
	params.S = S;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnListBox.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIMultiColumnListBox::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnListBox.InitComponent");

	UGUIMultiColumnListBox_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIMultiColumnListBox.InitBaseList
// (Defined, Public)
// Parameters:
// class UGUIListBase*            LocalList                      (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIMultiColumnListBox::InitBaseList(class UGUIListBase* LocalList)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIMultiColumnListBox.InitBaseList");

	UGUIMultiColumnListBox_InitBaseList_Params params;
	params.LocalList = LocalList;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollTextBox.AddText
// (Defined, Public)
// Parameters:
// struct FString                 NewText                        (Parm, NeedCtorLink)

void UGUIScrollTextBox::AddText(const struct FString& NewText)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollTextBox.AddText");

	UGUIScrollTextBox_AddText_Params params;
	params.NewText = NewText;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollTextBox.StripColors
// (Defined, Public)
// Parameters:
// struct FString                 MyString                       (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIScrollTextBox::StripColors(const struct FString& MyString)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollTextBox.StripColors");

	UGUIScrollTextBox_StripColors_Params params;
	params.MyString = MyString;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIScrollTextBox.IsNumber
// (Defined, Public)
// Parameters:
// struct FString                 Num                            (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIScrollTextBox::IsNumber(const struct FString& Num)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollTextBox.IsNumber");

	UGUIScrollTextBox_IsNumber_Params params;
	params.Num = Num;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIScrollTextBox.InternalOnAdjustTop
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIScrollTextBox::InternalOnAdjustTop(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollTextBox.InternalOnAdjustTop");

	UGUIScrollTextBox_InternalOnAdjustTop_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollTextBox.Stop
// (Defined, Public)

void UGUIScrollTextBox::Stop()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollTextBox.Stop");

	UGUIScrollTextBox_Stop_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollTextBox.Restart
// (Defined, Public)

void UGUIScrollTextBox::Restart()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollTextBox.Restart");

	UGUIScrollTextBox_Restart_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollTextBox.SetContent
// (Defined, Public)
// Parameters:
// struct FString                 NewContent                     (Parm, NeedCtorLink)
// struct FString                 sep                            (OptionalParm, Parm, NeedCtorLink)

void UGUIScrollTextBox::SetContent(const struct FString& NewContent, const struct FString& sep)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollTextBox.SetContent");

	UGUIScrollTextBox_SetContent_Params params;
	params.NewContent = NewContent;
	params.sep = sep;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollTextBox.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIScrollTextBox::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollTextBox.InitComponent");

	UGUIScrollTextBox_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollTextBox.InitBaseList
// (Defined, Public)
// Parameters:
// class UGUIListBase*            LocalList                      (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIScrollTextBox::InitBaseList(class UGUIListBase* LocalList)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollTextBox.InitBaseList");

	UGUIScrollTextBox_InitBaseList_Params params;
	params.LocalList = LocalList;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollTextBox.InternalOnCreateComponent
// (Defined, Public)
// Parameters:
// class UGUIComponent*           NewComp                        (ExportObject, Parm, NeedCtorLink, EditInline)
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIScrollTextBox::InternalOnCreateComponent(class UGUIComponent* NewComp, class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollTextBox.InternalOnCreateComponent");

	UGUIScrollTextBox_InternalOnCreateComponent_Params params;
	params.NewComp = NewComp;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIScrollTextBox.Created
// (Defined, Event, Public)

void UGUIScrollTextBox::Created()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIScrollTextBox.Created");

	UGUIScrollTextBox_Created_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBox.MyClose
// (Defined, Public)
// Parameters:
// class UGUIContextMenu*         Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIListBox::MyClose(class UGUIContextMenu* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBox.MyClose");

	UGUIListBox_MyClose_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBox.MyOpen
// (Defined, Public)
// Parameters:
// class UGUIContextMenu*         Menu                           (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIListBox::MyOpen(class UGUIContextMenu* Menu)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBox.MyOpen");

	UGUIListBox_MyOpen_Params params;
	params.Menu = Menu;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBox.ItemCount
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIListBox::ItemCount()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBox.ItemCount");

	UGUIListBox_ItemCount_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBox.InternalOnChange
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBox::InternalOnChange(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBox.InternalOnChange");

	UGUIListBox_InternalOnChange_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBox.InternalOnDblClick
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIListBox::InternalOnDblClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBox.InternalOnDblClick");

	UGUIListBox_InternalOnDblClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBox.InternalOnClick
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIListBox::InternalOnClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBox.InternalOnClick");

	UGUIListBox_InternalOnClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIListBox.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBox::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBox.InitComponent");

	UGUIListBox_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIListBox.InitBaseList
// (Defined, Public)
// Parameters:
// class UGUIListBase*            LocalList                      (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIListBox::InitBaseList(class UGUIListBase* LocalList)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIListBox.InitBaseList");

	UGUIListBox_InitBaseList_Params params;
	params.LocalList = LocalList;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.GetCurGameTime
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AHudBase::GetCurGameTime()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.GetCurGameTime");

	AHudBase_GetCurGameTime_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudBase.clearkilllog
// (Defined, Exec, Public)

void AHudBase::clearkilllog()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.clearkilllog");

	AHudBase_clearkilllog_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.userzone
// (Defined, Exec, Public)
// Parameters:
// struct FString                 szPath                         (Parm, NeedCtorLink)
// struct FString                 szCommand                      (Parm, NeedCtorLink)

void AHudBase::userzone(const struct FString& szPath, const struct FString& szCommand)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.userzone");

	AHudBase_userzone_Params params;
	params.szPath = szPath;
	params.szCommand = szCommand;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.usermove
// (Defined, Exec, Public)
// Parameters:
// struct FString                 szPath                         (Parm, NeedCtorLink)
// struct FString                 szCommand                      (OptionalParm, Parm, NeedCtorLink)
// int                            nCombatNum                     (OptionalParm, Parm)

void AHudBase::usermove(const struct FString& szPath, const struct FString& szCommand, int nCombatNum)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.usermove");

	AHudBase_usermove_Params params;
	params.szPath = szPath;
	params.szCommand = szCommand;
	params.nCombatNum = nCombatNum;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.killlog
// (Defined, Exec, Public)
// Parameters:
// struct FString                 szPath                         (Parm, NeedCtorLink)
// struct FString                 szCommand                      (OptionalParm, Parm, NeedCtorLink)

void AHudBase::killlog(const struct FString& szPath, const struct FString& szCommand)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.killlog");

	AHudBase_killlog_Params params;
	params.szPath = szPath;
	params.szCommand = szCommand;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.WorldSpaceOverlays
// (Defined, Simulated, Event, Public)

void AHudBase::WorldSpaceOverlays()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.WorldSpaceOverlays");

	AHudBase_WorldSpaceOverlays_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.PlayHUDSound
// (Defined, Static, Public)
// Parameters:
// class APlayerController*       PC                             (Parm)
// TEnumAsByte<EeHUDSOUND>        soundType                      (Parm)

void AHudBase::STATIC_PlayHUDSound(class APlayerController* PC, TEnumAsByte<EeHUDSOUND> soundType)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.PlayHUDSound");

	AHudBase_PlayHUDSound_Params params;
	params.PC = PC;
	params.soundType = soundType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.CalcNametagPos
// (Defined, Public)
// Parameters:
// class APawn*                   curPawn                        (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AHudBase::CalcNametagPos(class APawn* curPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.CalcNametagPos");

	AHudBase_CalcNametagPos_Params params;
	params.curPawn = curPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudBase.CalcNametagPosNative
// (Native, Public)
// Parameters:
// class APawn*                   curPawn                        (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AHudBase::CalcNametagPosNative(class APawn* curPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.CalcNametagPosNative");

	AHudBase_CalcNametagPosNative_Params params;
	params.curPawn = curPawn;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudBase.GetNametagColor
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Info                           (Parm)
// struct FColor                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FColor AHudBase::GetNametagColor(class APlayerReplicationInfo* Info)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.GetNametagColor");

	AHudBase_GetNametagColor_Params params;
	params.Info = Info;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudBase.RefreshKillerName
// (Defined, Public)
// Parameters:
// struct FString                 mKillerName                    (Parm, NeedCtorLink)

void AHudBase::RefreshKillerName(const struct FString& mKillerName)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.RefreshKillerName");

	AHudBase_RefreshKillerName_Params params;
	params.mKillerName = mKillerName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawNameTag
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class AwPawn*                  curPawn                        (Parm)

void AHudBase::DrawNameTag(class UCanvas* C, class AwPawn* curPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawNameTag");

	AHudBase_DrawNameTag_Params params;
	params.C = C;
	params.curPawn = curPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawMissionIcon
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class AwPawn*                  curPawn                        (Parm)

void AHudBase::DrawMissionIcon(class UCanvas* C, class AwPawn* curPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawMissionIcon");

	AHudBase_DrawMissionIcon_Params params;
	params.C = C;
	params.curPawn = curPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawSpecialModeIcon
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class AwPawn*                  curPawn                        (Parm)

void AHudBase::DrawSpecialModeIcon(class UCanvas* C, class AwPawn* curPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawSpecialModeIcon");

	AHudBase_DrawSpecialModeIcon_Params params;
	params.C = C;
	params.curPawn = curPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.UpdateNameTagInfo
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class AwPawn*                  curPawn                        (Parm)
// struct FVector                 camLoc                         (Parm)
// struct FRotator                camRot                         (Parm)

void AHudBase::UpdateNameTagInfo(class UCanvas* C, class AwPawn* curPawn, const struct FVector& camLoc, const struct FRotator& camRot)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.UpdateNameTagInfo");

	AHudBase_UpdateNameTagInfo_Params params;
	params.C = C;
	params.curPawn = curPawn;
	params.camLoc = camLoc;
	params.camRot = camRot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawNametagsScript
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           bSpectateMode                  (Parm)
// bool                           drawAlways                     (OptionalParm, Parm)

void AHudBase::DrawNametagsScript(class UCanvas* C, bool bSpectateMode, bool drawAlways)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawNametagsScript");

	AHudBase_DrawNametagsScript_Params params;
	params.C = C;
	params.bSpectateMode = bSpectateMode;
	params.drawAlways = drawAlways;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawNametags
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           bSpectateMode                  (Parm)
// bool                           drawAlways                     (OptionalParm, Parm)

void AHudBase::DrawNametags(class UCanvas* C, bool bSpectateMode, bool drawAlways)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawNametags");

	AHudBase_DrawNametags_Params params;
	params.C = C;
	params.bSpectateMode = bSpectateMode;
	params.drawAlways = drawAlways;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawNametagsNative
// (Native, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           bSpectateMode                  (Parm)
// bool                           drawAlways                     (OptionalParm, Parm)

void AHudBase::DrawNametagsNative(class UCanvas* C, bool bSpectateMode, bool drawAlways)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawNametagsNative");

	AHudBase_DrawNametagsNative_Params params;
	params.C = C;
	params.bSpectateMode = bSpectateMode;
	params.drawAlways = drawAlways;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawHudSpectating
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawHudSpectating(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawHudSpectating");

	AHudBase_DrawHudSpectating_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawGMHudSpectating
// (Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawGMHudSpectating(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawGMHudSpectating");

	AHudBase_DrawGMHudSpectating_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.FindPRI
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// class APlayerReplicationInfo*  ReturnValue                    (Parm, OutParm, ReturnParm)

class APlayerReplicationInfo* AHudBase::FindPRI(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.FindPRI");

	AHudBase_FindPRI_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudBase.GetBaseTeamColor
// (Defined, Public)
// Parameters:
// int                            viewerTeamIndex                (Parm)
// int                            targetTeamIndex                (Parm)
// struct FColor                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FColor AHudBase::GetBaseTeamColor(int viewerTeamIndex, int targetTeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.GetBaseTeamColor");

	AHudBase_GetBaseTeamColor_Params params;
	params.viewerTeamIndex = viewerTeamIndex;
	params.targetTeamIndex = targetTeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudBase.GetBaseTeamName
// (Defined, Public)
// Parameters:
// int                            TeamIndex                      (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AHudBase::GetBaseTeamName(int TeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.GetBaseTeamName");

	AHudBase_GetBaseTeamName_Params params;
	params.TeamIndex = TeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudBase.DrawWarfareCrosshairExtNative
// (Native, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            Spread                         (Parm)

void AHudBase::DrawWarfareCrosshairExtNative(class UCanvas* C, int Spread)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawWarfareCrosshairExtNative");

	AHudBase_DrawWarfareCrosshairExtNative_Params params;
	params.C = C;
	params.Spread = Spread;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.CalculateCoordinateDigitEx
// (Native, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FDigitSet               W                              (Parm)
// struct FNumericWidget          N                              (Parm)
// float                          fWidth                         (Parm)
// float                          fHeight                        (Parm)
// int                            Index                          (Parm)
// struct FCalCoordsW             coordsW                        (Parm, OutParm)

void AHudBase::CalculateCoordinateDigitEx(class UCanvas* C, const struct FDigitSet& W, const struct FNumericWidget& N, float fWidth, float fHeight, int Index, struct FCalCoordsW* coordsW)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.CalculateCoordinateDigitEx");

	AHudBase_CalculateCoordinateDigitEx_Params params;
	params.C = C;
	params.W = W;
	params.N = N;
	params.fWidth = fWidth;
	params.fHeight = fHeight;
	params.Index = Index;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (coordsW != nullptr)
		*coordsW = params.coordsW;
}


// Function XInterface.HudBase.CalculateCoordinateDigit
// (Native, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FDigitSet               W                              (Parm)
// struct FNumericWidget          N                              (Parm)
// float                          fWidth                         (Parm)
// float                          fHeight                        (Parm)
// int                            Index                          (Parm)
// struct FCalCoordsW             coordsW                        (Parm, OutParm)

void AHudBase::CalculateCoordinateDigit(class UCanvas* C, const struct FDigitSet& W, const struct FNumericWidget& N, float fWidth, float fHeight, int Index, struct FCalCoordsW* coordsW)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.CalculateCoordinateDigit");

	AHudBase_CalculateCoordinateDigit_Params params;
	params.C = C;
	params.W = W;
	params.N = N;
	params.fWidth = fWidth;
	params.fHeight = fHeight;
	params.Index = Index;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (coordsW != nullptr)
		*coordsW = params.coordsW;
}


// Function XInterface.HudBase.CalculateCoordinateEx
// (Native, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FSpriteWidget           W                              (Parm)
// float                          fWidth                         (Parm)
// float                          fHeight                        (Parm)
// struct FCalCoordsW             coordsW                        (Parm, OutParm)

void AHudBase::CalculateCoordinateEx(class UCanvas* C, const struct FSpriteWidget& W, float fWidth, float fHeight, struct FCalCoordsW* coordsW)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.CalculateCoordinateEx");

	AHudBase_CalculateCoordinateEx_Params params;
	params.C = C;
	params.W = W;
	params.fWidth = fWidth;
	params.fHeight = fHeight;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (coordsW != nullptr)
		*coordsW = params.coordsW;
}


// Function XInterface.HudBase.CalculateCoordinate
// (Native, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FSpriteWidget           W                              (Parm)
// float                          fWidth                         (Parm)
// float                          fHeight                        (Parm)
// struct FCalCoordsW             coordsW                        (Parm, OutParm)

void AHudBase::CalculateCoordinate(class UCanvas* C, const struct FSpriteWidget& W, float fWidth, float fHeight, struct FCalCoordsW* coordsW)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.CalculateCoordinate");

	AHudBase_CalculateCoordinate_Params params;
	params.C = C;
	params.W = W;
	params.fWidth = fWidth;
	params.fHeight = fHeight;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (coordsW != nullptr)
		*coordsW = params.coordsW;
}


// Function XInterface.HudBase.DrawTileFromSpriteWidget2
// (Native, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FSpriteWidget           SW                             (Parm)
// float                          W                              (Parm)
// float                          H                              (Parm)

void AHudBase::DrawTileFromSpriteWidget2(class UCanvas* C, const struct FSpriteWidget& SW, float W, float H)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawTileFromSpriteWidget2");

	AHudBase_DrawTileFromSpriteWidget2_Params params;
	params.C = C;
	params.SW = SW;
	params.W = W;
	params.H = H;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawTileFromSpriteWidget
// (Native, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FSpriteWidget           SW                             (Parm)

void AHudBase::DrawTileFromSpriteWidget(class UCanvas* C, const struct FSpriteWidget& SW)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawTileFromSpriteWidget");

	AHudBase_DrawTileFromSpriteWidget_Params params;
	params.C = C;
	params.SW = SW;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.ClipScreenCoords
// (Defined, Static, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          X                              (Parm, OutParm)
// float                          Y                              (Parm, OutParm)
// float                          XL                             (OptionalParm, Parm)
// float                          YL                             (OptionalParm, Parm)

void AHudBase::STATIC_ClipScreenCoords(class UCanvas* C, float XL, float YL, float* X, float* Y)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.ClipScreenCoords");

	AHudBase_ClipScreenCoords_Params params;
	params.C = C;
	params.XL = XL;
	params.YL = YL;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (X != nullptr)
		*X = params.X;
	if (Y != nullptr)
		*Y = params.Y;
}


// Function XInterface.HudBase.IsTargetInFrontOfPlayer2
// (Defined, Static, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 TargetPos                      (Parm)
// struct FVector                 ScreenPos                      (Parm, OutParm)
// struct FVector                 camLoc                         (Parm)
// struct FRotator                camRot                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudBase::STATIC_IsTargetInFrontOfPlayer2(class UCanvas* C, const struct FVector& TargetPos, const struct FVector& camLoc, const struct FRotator& camRot, struct FVector* ScreenPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.IsTargetInFrontOfPlayer2");

	AHudBase_IsTargetInFrontOfPlayer2_Params params;
	params.C = C;
	params.TargetPos = TargetPos;
	params.camLoc = camLoc;
	params.camRot = camRot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ScreenPos != nullptr)
		*ScreenPos = params.ScreenPos;

	return params.ReturnValue;
}


// Function XInterface.HudBase.IsTargetInFrontOfPlayer
// (Defined, Static, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class AActor*                  Target                         (Parm)
// struct FVector                 ScreenPos                      (Parm, OutParm)
// struct FVector                 camLoc                         (Parm)
// struct FRotator                camRot                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudBase::STATIC_IsTargetInFrontOfPlayer(class UCanvas* C, class AActor* Target, const struct FVector& camLoc, const struct FRotator& camRot, struct FVector* ScreenPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.IsTargetInFrontOfPlayer");

	AHudBase_IsTargetInFrontOfPlayer_Params params;
	params.C = C;
	params.Target = Target;
	params.camLoc = camLoc;
	params.camRot = camRot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ScreenPos != nullptr)
		*ScreenPos = params.ScreenPos;

	return params.ReturnValue;
}


// Function XInterface.HudBase.DrawIntroSubtitles
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawIntroSubtitles(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawIntroSubtitles");

	AHudBase_DrawIntroSubtitles_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawCinematicHUD
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawCinematicHUD(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawCinematicHUD");

	AHudBase_DrawCinematicHUD_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawVehicleName
// (Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawVehicleName(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawVehicleName");

	AHudBase_DrawVehicleName_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawWeaponName
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawWeaponName(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawWeaponName");

	AHudBase_DrawWeaponName_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.LoadInstructionFont
// (Defined, Simulated, Public)
// Parameters:
// class UFont*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UFont* AHudBase::LoadInstructionFont()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.LoadInstructionFont");

	AHudBase_LoadInstructionFont_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudBase.SetInstructionKeyText
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 Text                           (Parm, NeedCtorLink)

void AHudBase::SetInstructionKeyText(const struct FString& Text)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.SetInstructionKeyText");

	AHudBase_SetInstructionKeyText_Params params;
	params.Text = Text;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.SetInstructionText
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 Text                           (Parm, NeedCtorLink)

void AHudBase::SetInstructionText(const struct FString& Text)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.SetInstructionText");

	AHudBase_SetInstructionText_Params params;
	params.Text = Text;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawInstructionKeyText
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawInstructionKeyText(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawInstructionKeyText");

	AHudBase_DrawInstructionKeyText_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawInstructionText
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawInstructionText(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawInstructionText");

	AHudBase_DrawInstructionText_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawInstructionGfx
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawInstructionGfx(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawInstructionGfx");

	AHudBase_DrawInstructionGfx_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.SetCropping
// (Defined, Simulated, Public)
// Parameters:
// bool                           Active                         (Parm)

void AHudBase::SetCropping(bool Active)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.SetCropping");

	AHudBase_SetCropping_Params params;
	params.Active = Active;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawTargeting
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawTargeting(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawTargeting");

	AHudBase_DrawTargeting_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.SetTargeting
// (Defined, Simulated, Public)
// Parameters:
// bool                           bShow                          (Parm)
// struct FVector                 TargetLocation                 (OptionalParm, Parm)
// float                          Size                           (OptionalParm, Parm)

void AHudBase::SetTargeting(bool bShow, const struct FVector& TargetLocation, float Size)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.SetTargeting");

	AHudBase_SetTargeting_Params params;
	params.bShow = bShow;
	params.TargetLocation = TargetLocation;
	params.Size = Size;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.Draw2DLocationDot
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 loc                            (Parm)
// float                          OffsetX                        (Parm)
// float                          OffsetY                        (Parm)
// float                          ScaleX                         (Parm)
// float                          ScaleY                         (Parm)

void AHudBase::Draw2DLocationDot(class UCanvas* C, const struct FVector& loc, float OffsetX, float OffsetY, float ScaleX, float ScaleY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.Draw2DLocationDot");

	AHudBase_Draw2DLocationDot_Params params;
	params.C = C;
	params.loc = loc;
	params.OffsetX = OffsetX;
	params.OffsetY = OffsetY;
	params.ScaleX = ScaleX;
	params.ScaleY = ScaleY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.CreateKeyMenus
// (Defined, Simulated, Public)

void AHudBase::CreateKeyMenus()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.CreateKeyMenus");

	AHudBase_CreateKeyMenus_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DisplayLocalMessages
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DisplayLocalMessages(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DisplayLocalMessages");

	AHudBase_DisplayLocalMessages_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawMessageWithTexture
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            i                              (Parm)
// float                          PosX                           (Parm)
// float                          PosY                           (Parm)
// float                          dx                             (Parm, OutParm)
// float                          dy                             (Parm, OutParm)

void AHudBase::DrawMessageWithTexture(class UCanvas* C, int i, float PosX, float PosY, float* dx, float* dy)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawMessageWithTexture");

	AHudBase_DrawMessageWithTexture_Params params;
	params.C = C;
	params.i = i;
	params.PosX = PosX;
	params.PosY = PosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (dx != nullptr)
		*dx = params.dx;
	if (dy != nullptr)
		*dy = params.dy;
}


// Function XInterface.HudBase.DrawMessage
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            i                              (Parm)
// float                          PosX                           (Parm)
// float                          PosY                           (Parm)
// float                          dx                             (Parm, OutParm)
// float                          dy                             (Parm, OutParm)

void AHudBase::DrawMessage(class UCanvas* C, int i, float PosX, float PosY, float* dx, float* dy)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawMessage");

	AHudBase_DrawMessage_Params params;
	params.C = C;
	params.i = i;
	params.PosX = PosX;
	params.PosY = PosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (dx != nullptr)
		*dx = params.dx;
	if (dy != nullptr)
		*dy = params.dy;
}


// Function XInterface.HudBase.GetScreenCoords
// (Defined, Simulated, Public)
// Parameters:
// float                          PosX                           (Parm)
// float                          PosY                           (Parm)
// float                          ScreenX                        (Parm, OutParm)
// float                          ScreenY                        (Parm, OutParm)
// struct FHudLocalizedMessage    Message                        (Parm, OutParm, NeedCtorLink)
// class UCanvas*                 C                              (Parm)

void AHudBase::GetScreenCoords(float PosX, float PosY, class UCanvas* C, float* ScreenX, float* ScreenY, struct FHudLocalizedMessage* Message)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.GetScreenCoords");

	AHudBase_GetScreenCoords_Params params;
	params.PosX = PosX;
	params.PosY = PosY;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ScreenX != nullptr)
		*ScreenX = params.ScreenX;
	if (ScreenY != nullptr)
		*ScreenY = params.ScreenY;
	if (Message != nullptr)
		*Message = params.Message;
}


// Function XInterface.HudBase.LayoutMessage
// (Defined, Simulated, Public)
// Parameters:
// struct FHudLocalizedMessage    Message                        (Parm, OutParm, NeedCtorLink)
// class UCanvas*                 C                              (Parm)

void AHudBase::LayoutMessage(class UCanvas* C, struct FHudLocalizedMessage* Message)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.LayoutMessage");

	AHudBase_LayoutMessage_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Message != nullptr)
		*Message = params.Message;
}


// Function XInterface.HudBase.GetLocalStatsScreen
// (Defined, Public)

void AHudBase::GetLocalStatsScreen()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.GetLocalStatsScreen");

	AHudBase_GetLocalStatsScreen_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.GetTeamColor
// (Defined, Static, Public)
// Parameters:
// unsigned char                  TeamNum                        (Parm)
// struct FColor                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FColor AHudBase::STATIC_GetTeamColor(unsigned char TeamNum)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.GetTeamColor");

	AHudBase_GetTeamColor_Params params;
	params.TeamNum = TeamNum;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudBase.LocalizedMessage2
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  Message                        (Parm)
// int                            Switch                         (OptionalParm, Parm)
// bool                           bOption_Push                   (OptionalParm, Parm)
// struct FString                 CriticalString                 (OptionalParm, Parm, NeedCtorLink)

void AHudBase::LocalizedMessage2(class UClass* Message, int Switch, bool bOption_Push, const struct FString& CriticalString)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.LocalizedMessage2");

	AHudBase_LocalizedMessage2_Params params;
	params.Message = Message;
	params.Switch = Switch;
	params.bOption_Push = bOption_Push;
	params.CriticalString = CriticalString;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.LocalizedMessageEx
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  Message                        (Parm)
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)
// struct FString                 CriticalString                 (OptionalParm, Parm, NeedCtorLink)
// int                            iReserve                       (OptionalParm, Parm)

void AHudBase::LocalizedMessageEx(class UClass* Message, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject, const struct FString& CriticalString, int iReserve)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.LocalizedMessageEx");

	AHudBase_LocalizedMessageEx_Params params;
	params.Message = Message;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;
	params.CriticalString = CriticalString;
	params.iReserve = iReserve;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.LocalizedMessage
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  Message                        (Parm)
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)
// struct FString                 CriticalString                 (OptionalParm, Parm, NeedCtorLink)

void AHudBase::LocalizedMessage(class UClass* Message, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject, const struct FString& CriticalString)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.LocalizedMessage");

	AHudBase_LocalizedMessage_Params params;
	params.Message = Message;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;
	params.CriticalString = CriticalString;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.Message
// (Defined, Simulated, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)
// struct FString                 Msg                            (Parm, CoerceParm, NeedCtorLink)
// struct FName                   MsgType                        (Parm)

void AHudBase::Message(class APlayerReplicationInfo* PRI, const struct FString& Msg, const struct FName& MsgType)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.Message");

	AHudBase_Message_Params params;
	params.PRI = PRI;
	params.Msg = Msg;
	params.MsgType = MsgType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.ClearMessage
// (Defined, Simulated, Public)
// Parameters:
// struct FHudLocalizedMessage    M                              (Parm, OutParm, NeedCtorLink)

void AHudBase::ClearMessage(struct FHudLocalizedMessage* M)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.ClearMessage");

	AHudBase_ClearMessage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (M != nullptr)
		*M = params.M;
}


// Function XInterface.HudBase.AddChildHudPart
// (Defined, Simulated, Public)
// Parameters:
// class AHudBase*                Child                          (Parm)

void AHudBase::AddChildHudPart(class AHudBase* Child)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.AddChildHudPart");

	AHudBase_AddChildHudPart_Params params;
	params.Child = Child;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawDigitSet
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          X                              (Parm)
// float                          Y                              (Parm)
// float                          OffsetX                        (Parm)
// float                          XL                             (Parm)
// float                          YL                             (Parm)
// int                            Value                          (Parm)
// struct FDigitSet               dSet                           (Parm)
// int                            totalDigits                    (Parm)
// struct FString                 paddingChar                    (Parm, NeedCtorLink)

void AHudBase::DrawDigitSet(class UCanvas* C, float X, float Y, float OffsetX, float XL, float YL, int Value, const struct FDigitSet& dSet, int totalDigits, const struct FString& paddingChar)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawDigitSet");

	AHudBase_DrawDigitSet_Params params;
	params.C = C;
	params.X = X;
	params.Y = Y;
	params.OffsetX = OffsetX;
	params.XL = XL;
	params.YL = YL;
	params.Value = Value;
	params.dSet = dSet;
	params.totalDigits = totalDigits;
	params.paddingChar = paddingChar;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawCSReviw
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawCSReviw(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawCSReviw");

	AHudBase_DrawCSReviw_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawNumericWidget
// (Simulated, Native, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FNumericWidget          W                              (Parm, OutParm)
// struct FDigitSet               D                              (Parm, OutParm)

void AHudBase::DrawNumericWidget(class UCanvas* C, struct FNumericWidget* W, struct FDigitSet* D)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawNumericWidget");

	AHudBase_DrawNumericWidget_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (W != nullptr)
		*W = params.W;
	if (D != nullptr)
		*D = params.D;
}


// Function XInterface.HudBase.DrawSpriteWidget
// (Simulated, Native, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FSpriteWidget           W                              (Parm, OutParm)

void AHudBase::DrawSpriteWidget(class UCanvas* C, struct FSpriteWidget* W)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawSpriteWidget");

	AHudBase_DrawSpriteWidget_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (W != nullptr)
		*W = params.W;
}


// Function XInterface.HudBase.DrawHUD
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawHUD(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawHUD");

	AHudBase_DrawHUD_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.UpdateScreenRatios
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::UpdateScreenRatios(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.UpdateScreenRatios");

	AHudBase_UpdateScreenRatios_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawAttacked
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawAttacked(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawAttacked");

	AHudBase_DrawAttacked_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawHeadShotSphere
// (Defined, Simulated, Public)

void AHudBase::DrawHeadShotSphere()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawHeadShotSphere");

	AHudBase_DrawHeadShotSphere_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.Tick
// (Defined, Simulated, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AHudBase::Tick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.Tick");

	AHudBase_Tick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.PlayPainSound
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::PlayPainSound(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.PlayPainSound");

	AHudBase_PlayPainSound_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawDamageIndicators
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawDamageIndicators(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawDamageIndicators");

	AHudBase_DrawDamageIndicators_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DisplayHit
// (Defined, Public)
// Parameters:
// struct FVector                 HitDir                         (Parm)
// int                            Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)

void AHudBase::DisplayHit(const struct FVector& HitDir, int Damage, class UClass* DamageType)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DisplayHit");

	AHudBase_DisplayHit_Params params;
	params.HitDir = HitDir;
	params.Damage = Damage;
	params.DamageType = DamageType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawMiniMap
// (Public)
// Parameters:
// class AwHudPart_MinimapBase*   Minimap                        (Parm)
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawMiniMap(class AwHudPart_MinimapBase* Minimap, class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawMiniMap");

	AHudBase_DrawMiniMap_Params params;
	params.Minimap = Minimap;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.SetCustomHUDColor
// (Public)

void AHudBase::SetCustomHUDColor()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.SetCustomHUDColor");

	AHudBase_SetCustomHUDColor_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.CustomHUDColorAllowed
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudBase::CustomHUDColorAllowed()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.CustomHUDColorAllowed");

	AHudBase_CustomHUDColorAllowed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudBase.PostBeginPlay
// (Defined, Public)

void AHudBase::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.PostBeginPlay");

	AHudBase_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.PrecacheFonts
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::PrecacheFonts(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.PrecacheFonts");

	AHudBase_PrecacheFonts_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawHudPassD
// (Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawHudPassD(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawHudPassD");

	AHudBase_DrawHudPassD_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawHudPassC
// (Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawHudPassC(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawHudPassC");

	AHudBase_DrawHudPassC_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawHudPassB
// (Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawHudPassB(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawHudPassB");

	AHudBase_DrawHudPassB_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DrawHudPassA
// (Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudBase::DrawHudPassA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DrawHudPassA");

	AHudBase_DrawHudPassA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.UpdateHUD
// (Simulated, Public)

void AHudBase::UpdateHUD()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.UpdateHUD");

	AHudBase_UpdateHUD_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudBase.DoUpdateTime
// (Public)

void AHudBase::DoUpdateTime()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudBase.DoUpdateTime");

	AHudBase_DoUpdateTime_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_KillMessage.Draw
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_KillMessage::Draw(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_KillMessage.Draw");

	AwHudPart_KillMessage_Draw_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_KillMessage.DrawOnlyImage
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_KillMessage::DrawOnlyImage(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_KillMessage.DrawOnlyImage");

	AwHudPart_KillMessage_DrawOnlyImage_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_KillMessage.DrawOnlyText
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_KillMessage::DrawOnlyText(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_KillMessage.DrawOnlyText");

	AwHudPart_KillMessage_DrawOnlyText_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_KillMessage.UpdateCache
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_KillMessage::UpdateCache(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_KillMessage.UpdateCache");

	AwHudPart_KillMessage_UpdateCache_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_KillMessage.End
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_KillMessage::End(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_KillMessage.End");

	AwHudPart_KillMessage_End_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_KillMessage.Begin
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_KillMessage::Begin(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_KillMessage.Begin");

	AwHudPart_KillMessage_Begin_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_KillMessage.DrawNative
// (Native, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_KillMessage::DrawNative(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_KillMessage.DrawNative");

	AwHudPart_KillMessage_DrawNative_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_KillMessage.Update
// (Defined, Public)

void AwHudPart_KillMessage::Update()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_KillMessage.Update");

	AwHudPart_KillMessage_Update_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_KillMessage.AddKillMessageItem
// (Defined, Public)
// Parameters:
// struct FKillMessageItem        Item                           (Parm, NeedCtorLink)

void AwHudPart_KillMessage::AddKillMessageItem(const struct FKillMessageItem& Item)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_KillMessage.AddKillMessageItem");

	AwHudPart_KillMessage_AddKillMessageItem_Params params;
	params.Item = Item;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_KillMessage.AddKillMessage
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  KillerPRI                      (Parm)
// class APlayerReplicationInfo*  victimPRI                      (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            Switch                         (Parm)

void AwHudPart_KillMessage::AddKillMessage(class APlayerReplicationInfo* KillerPRI, class APlayerReplicationInfo* victimPRI, class UClass* DamageType, int Switch)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_KillMessage.AddKillMessage");

	AwHudPart_KillMessage_AddKillMessage_Params params;
	params.KillerPRI = KillerPRI;
	params.victimPRI = victimPRI;
	params.DamageType = DamageType;
	params.Switch = Switch;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_KillMessage.GetNameColor
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)
// struct FColor                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FColor AwHudPart_KillMessage::GetNameColor(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_KillMessage.GetNameColor");

	AwHudPart_KillMessage_GetNameColor_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_KillMessage.MakeKillMessageItem
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  KillerPRI                      (Parm)
// class APlayerReplicationInfo*  victimPRI                      (Parm)
// struct FString                 KillerName                     (Parm, NeedCtorLink)
// struct FString                 VictimName                     (Parm, NeedCtorLink)
// class UClass*                  DamageType                     (Parm)
// int                            Switch                         (Parm)
// bool                           NoKillerName                   (Parm)
// bool                           NoVictimName                   (Parm)
// class UMaterial*               overrideImage                  (Parm)
// struct FKillMessageItem        ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FKillMessageItem AwHudPart_KillMessage::MakeKillMessageItem(class APlayerReplicationInfo* KillerPRI, class APlayerReplicationInfo* victimPRI, const struct FString& KillerName, const struct FString& VictimName, class UClass* DamageType, int Switch, bool NoKillerName, bool NoVictimName, class UMaterial* overrideImage)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_KillMessage.MakeKillMessageItem");

	AwHudPart_KillMessage_MakeKillMessageItem_Params params;
	params.KillerPRI = KillerPRI;
	params.victimPRI = victimPRI;
	params.KillerName = KillerName;
	params.VictimName = VictimName;
	params.DamageType = DamageType;
	params.Switch = Switch;
	params.NoKillerName = NoKillerName;
	params.NoVictimName = NoVictimName;
	params.overrideImage = overrideImage;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_KillMessage.Initialize
// (Defined, Public)
// Parameters:
// class AHudBase*                myOwner                        (Parm)
// class ALevelInfo*              myLevel                        (Parm)

void AwHudPart_KillMessage::Initialize(class AHudBase* myOwner, class ALevelInfo* myLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_KillMessage.Initialize");

	AwHudPart_KillMessage_Initialize_Params params;
	params.myOwner = myOwner;
	params.myLevel = myLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_KillMessage.Precache
// (Defined, Public)

void AwHudPart_KillMessage::Precache()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_KillMessage.Precache");

	AwHudPart_KillMessage_Precache_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIQuestionPage.RemoveButtons
// (Defined, Public)

void UGUIQuestionPage::RemoveButtons()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIQuestionPage.RemoveButtons");

	UGUIQuestionPage_RemoveButtons_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIQuestionPage.Replace
// (Defined, Public)
// Parameters:
// struct FString                 Src                            (Parm, NeedCtorLink)
// struct FString                 Tag                            (Parm, NeedCtorLink)
// struct FString                 Value                          (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UGUIQuestionPage::Replace(const struct FString& Src, const struct FString& Tag, const struct FString& Value)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIQuestionPage.Replace");

	UGUIQuestionPage_Replace_Params params;
	params.Src = Src;
	params.Tag = Tag;
	params.Value = Value;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIQuestionPage.ButtonClick
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIQuestionPage::ButtonClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIQuestionPage.ButtonClick");

	UGUIQuestionPage_ButtonClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIQuestionPage.LayoutButtons
// (Defined, Public)
// Parameters:
// unsigned char                  ActiveButton                   (Parm)

void UGUIQuestionPage::LayoutButtons(unsigned char ActiveButton)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIQuestionPage.LayoutButtons");

	UGUIQuestionPage_LayoutButtons_Params params;
	params.ActiveButton = ActiveButton;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIQuestionPage.AddButton
// (Defined, Public)
// Parameters:
// unsigned char                  idesc                          (Parm, CoerceParm)
// class UGUIButton*              ReturnValue                    (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)

class UGUIButton* UGUIQuestionPage::AddButton(unsigned char idesc)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIQuestionPage.AddButton");

	UGUIQuestionPage_AddButton_Params params;
	params.idesc = idesc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIQuestionPage.SetupQuestion
// (Defined, Public)
// Parameters:
// struct FString                 Question                       (Parm, NeedCtorLink)
// unsigned char                  bButtons                       (Parm, CoerceParm)
// unsigned char                  ActiveButton                   (OptionalParm, Parm)
// bool                           bClearFirst                    (OptionalParm, Parm)

void UGUIQuestionPage::SetupQuestion(const struct FString& Question, unsigned char bButtons, unsigned char ActiveButton, bool bClearFirst)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIQuestionPage.SetupQuestion");

	UGUIQuestionPage_SetupQuestion_Params params;
	params.Question = Question;
	params.bButtons = bButtons;
	params.ActiveButton = ActiveButton;
	params.bClearFirst = bClearFirst;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIQuestionPage.InternalOnPreDraw
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIQuestionPage::InternalOnPreDraw(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIQuestionPage.InternalOnPreDraw");

	UGUIQuestionPage_InternalOnPreDraw_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIQuestionPage.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          pMyController                  (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIQuestionPage::InitComponent(class UGUIController* pMyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIQuestionPage.InitComponent");

	UGUIQuestionPage_InitComponent_Params params;
	params.pMyController = pMyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIQuestionPage.NewOnButtonClick
// (Defined, Public, Delegate)
// Parameters:
// unsigned char                  bButton                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIQuestionPage::NewOnButtonClick(unsigned char bButton)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIQuestionPage.NewOnButtonClick");

	UGUIQuestionPage_NewOnButtonClick_Params params;
	params.bButton = bButton;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIQuestionPage.OnButtonClick
// (Public, Delegate)
// Parameters:
// unsigned char                  bButton                        (Parm)

void UGUIQuestionPage::OnButtonClick(unsigned char bButton)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIQuestionPage.OnButtonClick");

	UGUIQuestionPage_OnButtonClick_Params params;
	params.bButton = bButton;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.UT2MidGameFont.GetFont
// (Defined, Event, Public)
// Parameters:
// int                            XRes                           (Parm)
// class UFont*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UFont* UUT2MidGameFont::GetFont(int XRes)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.UT2MidGameFont.GetFont");

	UUT2MidGameFont_GetFont_Params params;
	params.XRes = XRes;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.UT2MidGameFont.GetMidGameFont
// (Defined, Static, Public)
// Parameters:
// int                            XRes                           (Parm)
// class UFont*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UFont* UUT2MidGameFont::STATIC_GetMidGameFont(int XRes)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.UT2MidGameFont.GetMidGameFont");

	UUT2MidGameFont_GetMidGameFont_Params params;
	params.XRes = XRes;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertScrollBar.ZoneClick
// (Defined, Public)
// Parameters:
// float                          Delta                          (Parm)

void UGUIVertScrollBar::ZoneClick(float Delta)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertScrollBar.ZoneClick");

	UGUIVertScrollBar_ZoneClick_Params params;
	params.Delta = Delta;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertScrollBar.GripPreDraw
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertScrollBar::GripPreDraw(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertScrollBar.GripPreDraw");

	UGUIVertScrollBar_GripPreDraw_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertScrollBar.GripPressed
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           IsRepeat                       (Parm)

void UGUIVertScrollBar::GripPressed(class UGUIComponent* Sender, bool IsRepeat)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertScrollBar.GripPressed");

	UGUIVertScrollBar_GripPressed_Params params;
	params.Sender = Sender;
	params.IsRepeat = IsRepeat;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertScrollZone.InternalOnClick
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertScrollZone::InternalOnClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertScrollZone.InternalOnClick");

	UGUIVertScrollZone_InternalOnClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertScrollButton.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIVertScrollButton::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertScrollButton.InitComponent");

	UGUIVertScrollButton_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertGripButton.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           MyComponent                    (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIVertGripButton::InitComponent(class UGUIController* MyController, class UGUIComponent* MyComponent)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertGripButton.InitComponent");

	UGUIVertGripButton_InitComponent_Params params;
	params.MyController = MyController;
	params.MyComponent = MyComponent;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.STY_ListSelection.Initialize
// (Defined, Event, Public)

void USTY_ListSelection::Initialize()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.STY_ListSelection.Initialize");

	USTY_ListSelection_Initialize_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.DebugTabOrder
// (Defined, Exec, Public)

void UExtendedConsole::DebugTabOrder()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.DebugTabOrder");

	UExtendedConsole_DebugTabOrder_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.DumpLoadingHints
// (Defined, Exec, Public)
// Parameters:
// struct FString                 Param                          (Parm, NeedCtorLink)

void UExtendedConsole::DumpLoadingHints(const struct FString& Param)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.DumpLoadingHints");

	UExtendedConsole_DumpLoadingHints_Params params;
	params.Param = Param;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.DLO
// (Defined, Exec, Public)
// Parameters:
// struct FString                 ClassName                      (Parm, NeedCtorLink)
// struct FString                 ClassType                      (Parm, NeedCtorLink)

void UExtendedConsole::DLO(const struct FString& ClassName, const struct FString& ClassType)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.DLO");

	UExtendedConsole_DLO_Params params;
	params.ClassName = ClassName;
	params.ClassType = ClassType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.VoiceChatAllowed
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UExtendedConsole::VoiceChatAllowed()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.VoiceChatAllowed");

	UExtendedConsole_VoiceChatAllowed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.ExtendedConsole.DumpCacheRecords
// (Final, Defined, Public)
// Parameters:
// struct FString                 CacheType                      (OptionalParm, Parm, NeedCtorLink)

void UExtendedConsole::DumpCacheRecords(const struct FString& CacheType)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.DumpCacheRecords");

	UExtendedConsole_DumpCacheRecords_Params params;
	params.CacheType = CacheType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.AddMessage
// (Final, Defined, Private)
// Parameters:
// struct FString                 Mesg                           (Parm, NeedCtorLink)

void UExtendedConsole::AddMessage(const struct FString& Mesg)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.AddMessage");

	UExtendedConsole_AddMessage_Params params;
	params.Mesg = Mesg;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.DumpRecords
// (Defined, Exec, Public)
// Parameters:
// struct FString                 Type                           (Parm, NeedCtorLink)

void UExtendedConsole::DumpRecords(const struct FString& Type)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.DumpRecords");

	UExtendedConsole_DumpRecords_Params params;
	params.Type = Type;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.DumpPlayInfo
// (Defined, Exec, Public)
// Parameters:
// struct FString                 Group                          (Parm, NeedCtorLink)

void UExtendedConsole::DumpPlayInfo(const struct FString& Group)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.DumpPlayInfo");

	UExtendedConsole_DumpPlayInfo_Params params;
	params.Group = Group;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.MusicMenu
// (Defined, Exec, Public)

void UExtendedConsole::MusicMenu()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.MusicMenu");

	UExtendedConsole_MusicMenu_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.PlayWaitingGame
// (Defined, Exec, Public)

void UExtendedConsole::PlayWaitingGame()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.PlayWaitingGame");

	UExtendedConsole_PlayWaitingGame_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.TeamChatOnly
// (Defined, Exec, Public)

void UExtendedConsole::TeamChatOnly()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.TeamChatOnly");

	UExtendedConsole_TeamChatOnly_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.ServerInfo
// (Defined, Exec, Public)

void UExtendedConsole::ServerInfo()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.ServerInfo");

	UExtendedConsole_ServerInfo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.IngameChat
// (Defined, Exec, Public)

void UExtendedConsole::IngameChat()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.IngameChat");

	UExtendedConsole_IngameChat_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.SpeechMenuToggle
// (Defined, Exec, Public)

void UExtendedConsole::SpeechMenuToggle()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.SpeechMenuToggle");

	UExtendedConsole_SpeechMenuToggle_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.SaveFavorites
// (Defined, Static, Public)

void UExtendedConsole::STATIC_SaveFavorites()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.SaveFavorites");

	UExtendedConsole_SaveFavorites_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.GetFavorites
// (Defined, Static, Public)
// Parameters:
// TArray<struct FServerFavorite> List                           (Parm, OutParm, NeedCtorLink)

void UExtendedConsole::STATIC_GetFavorites(TArray<struct FServerFavorite>* List)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.GetFavorites");

	UExtendedConsole_GetFavorites_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (List != nullptr)
		*List = params.List;
}


// Function XInterface.ExtendedConsole.RemoveFavorite
// (Defined, Static, Public)
// Parameters:
// struct FString                 IP                             (Parm, NeedCtorLink)
// int                            Port                           (Parm)
// int                            QueryPort                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UExtendedConsole::STATIC_RemoveFavorite(const struct FString& IP, int Port, int QueryPort)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.RemoveFavorite");

	UExtendedConsole_RemoveFavorite_Params params;
	params.IP = IP;
	params.Port = Port;
	params.QueryPort = QueryPort;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.ExtendedConsole.AddFavorite
// (Defined, Static, Public)
// Parameters:
// struct FServerFavorite         NewFav                         (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UExtendedConsole::STATIC_AddFavorite(const struct FServerFavorite& NewFav)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.AddFavorite");

	UExtendedConsole_AddFavorite_Params params;
	params.NewFav = NewFav;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.ExtendedConsole.InFavorites
// (Defined, Static, Public)
// Parameters:
// struct FServerFavorite         Fav                            (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UExtendedConsole::STATIC_InFavorites(const struct FServerFavorite& Fav)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.InFavorites");

	UExtendedConsole_InFavorites_Params params;
	params.Fav = Fav;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.ExtendedConsole.AddCurrentToFavorites
// (Defined, Exec, Public)

void UExtendedConsole::AddCurrentToFavorites()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.AddCurrentToFavorites");

	UExtendedConsole_AddCurrentToFavorites_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.OnExecAddFavorite
// (Public, Delegate)
// Parameters:
// struct FServerFavorite         Fav                            (Parm, NeedCtorLink)

void UExtendedConsole::OnExecAddFavorite(const struct FServerFavorite& Fav)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.OnExecAddFavorite");

	UExtendedConsole_OnExecAddFavorite_Params params;
	params.Fav = Fav;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.ConsoleToggle
// (Defined, Exec, Public)

void UExtendedConsole::ConsoleToggle()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.ConsoleToggle");

	UExtendedConsole_ConsoleToggle_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.ConsoleClose
// (Defined, Exec, Public)

void UExtendedConsole::ConsoleClose()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.ConsoleClose");

	UExtendedConsole_ConsoleClose_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.ConsoleOpen
// (Defined, Exec, Public)

void UExtendedConsole::ConsoleOpen()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.ConsoleOpen");

	UExtendedConsole_ConsoleOpen_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.NativeConsoleOpen
// (Defined, Event, Public)

void UExtendedConsole::NativeConsoleOpen()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.NativeConsoleOpen");

	UExtendedConsole_NativeConsoleOpen_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.PlayConsoleSound
// (Defined, Public)
// Parameters:
// class USound*                  S                              (Parm)

void UExtendedConsole::PlayConsoleSound(class USound* S)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.PlayConsoleSound");

	UExtendedConsole_PlayConsoleSound_Params params;
	params.S = S;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.KeyEvent
// (Defined, Event, Public)
// Parameters:
// TEnumAsByte<EInputKey>         key                            (Parm)
// TEnumAsByte<EInputAction>      Action                         (Parm)
// float                          Delta                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UExtendedConsole::KeyEvent(TEnumAsByte<EInputKey> key, TEnumAsByte<EInputAction> Action, float Delta)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.KeyEvent");

	UExtendedConsole_KeyEvent_Params params;
	params.key = key;
	params.Action = Action;
	params.Delta = Delta;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.ExtendedConsole.GetNewPlaybackSpeed
// (Defined, Public)
// Parameters:
// int                            Dir                            (Parm)

void UExtendedConsole::GetNewPlaybackSpeed(int Dir)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.GetNewPlaybackSpeed");

	UExtendedConsole_GetNewPlaybackSpeed_Params params;
	params.Dir = Dir;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.Message
// (Defined, Event, Public)
// Parameters:
// struct FString                 Msg                            (Parm, CoerceParm, NeedCtorLink)
// float                          MsgLife                        (Parm)

void UExtendedConsole::Message(const struct FString& Msg, float MsgLife)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.Message");

	UExtendedConsole_Message_Params params;
	params.Msg = Msg;
	params.MsgLife = MsgLife;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.OnChatMessage
// (Public, Delegate)
// Parameters:
// struct FString                 Msg                            (Parm, NeedCtorLink)

void UExtendedConsole::OnChatMessage(const struct FString& Msg)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.OnChatMessage");

	UExtendedConsole_OnChatMessage_Params params;
	params.Msg = Msg;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.Chat
// (Defined, Public)
// Parameters:
// struct FString                 Msg                            (Parm, CoerceParm, NeedCtorLink)
// float                          MsgLife                        (Parm)
// class APlayerReplicationInfo*  PRI                            (Parm)

void UExtendedConsole::Chat(const struct FString& Msg, float MsgLife, class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.Chat");

	UExtendedConsole_Chat_Params params;
	params.Msg = Msg;
	params.MsgLife = MsgLife;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.PostRender
// (Defined, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)

void UExtendedConsole::PostRender(class UCanvas* Canvas)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.PostRender");

	UExtendedConsole_PostRender_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.cls
// (Defined, Exec, Public)

void UExtendedConsole::cls()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.cls");

	UExtendedConsole_cls_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.NotifyLevelChange
// (Defined, Event, Public)

void UExtendedConsole::NotifyLevelChange()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.NotifyLevelChange");

	UExtendedConsole_NotifyLevelChange_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.ConnectFailure
// (Defined, Event, Public)
// Parameters:
// struct FString                 FailCode                       (Parm, NeedCtorLink)
// struct FString                 URL                            (Parm, NeedCtorLink)

void UExtendedConsole::ConnectFailure(const struct FString& FailCode, const struct FString& URL)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.ConnectFailure");

	UExtendedConsole_ConnectFailure_Params params;
	params.FailCode = FailCode;
	params.URL = URL;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.OnStatsConfigured
// (Defined, Public)

void UExtendedConsole::OnStatsConfigured()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.OnStatsConfigured");

	UExtendedConsole_OnStatsConfigured_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.OnStatsClosed
// (Defined, Public)
// Parameters:
// bool                           bCancelled                     (OptionalParm, Parm)

void UExtendedConsole::OnStatsClosed(bool bCancelled)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.OnStatsClosed");

	UExtendedConsole_OnStatsClosed_Params params;
	params.bCancelled = bCancelled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ExtendedConsole.OnChat
// (Public, Delegate)
// Parameters:
// struct FString                 Msg                            (Parm, NeedCtorLink)
// int                            TeamIndex                      (Parm)

void UExtendedConsole::OnChat(const struct FString& Msg, int TeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ExtendedConsole.OnChat");

	UExtendedConsole_OnChat_Params params;
	params.Msg = Msg;
	params.TeamIndex = TeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.UT2MusicManager.NotifyLevelChange
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UUT2MusicManager::NotifyLevelChange()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.UT2MusicManager.NotifyLevelChange");

	UUT2MusicManager_NotifyLevelChange_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.UT2MusicManager.MusicChanged
// (Defined, Public)

void UUT2MusicManager::MusicChanged()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.UT2MusicManager.MusicChanged");

	UUT2MusicManager_MusicChanged_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.UT2MusicManager.SetInitialMusic
// (Defined, Public)
// Parameters:
// struct FString                 NewSong                        (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UUT2MusicManager::SetInitialMusic(const struct FString& NewSong)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.UT2MusicManager.SetInitialMusic");

	UUT2MusicManager_SetInitialMusic_Params params;
	params.NewSong = NewSong;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.UT2MusicManager.SetMusic
// (Defined, Public)
// Parameters:
// struct FString                 NewSong                        (Parm, NeedCtorLink)

void UUT2MusicManager::SetMusic(const struct FString& NewSong)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.UT2MusicManager.SetMusic");

	UUT2MusicManager_SetMusic_Params params;
	params.NewSong = NewSong;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.UT2MusicManager.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UUT2MusicManager::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.UT2MusicManager.InitComponent");

	UUT2MusicManager_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.IsPickupWeapon
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudCDeathmatch::IsPickupWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.IsPickupWeapon");

	AHudCDeathmatch_IsPickupWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.DisalbeWeaponSlot5Hud
// (Defined, Public)

void AHudCDeathmatch::DisalbeWeaponSlot5Hud()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DisalbeWeaponSlot5Hud");

	AHudCDeathmatch_DisalbeWeaponSlot5Hud_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.EnableWeaponSlot5Hud
// (Defined, Public)
// Parameters:
// int                            nWeaponID                      (Parm)

void AHudCDeathmatch::EnableWeaponSlot5Hud(int nWeaponID)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.EnableWeaponSlot5Hud");

	AHudCDeathmatch_EnableWeaponSlot5Hud_Params params;
	params.nWeaponID = nWeaponID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.ChangeWeaponSlot5Hud
// (Defined, Public)
// Parameters:
// class AwWeapon*                newWeapon                      (Parm)
// bool                           bAddSkill                      (OptionalParm, Parm)

void AHudCDeathmatch::ChangeWeaponSlot5Hud(class AwWeapon* newWeapon, bool bAddSkill)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.ChangeWeaponSlot5Hud");

	AHudCDeathmatch_ChangeWeaponSlot5Hud_Params params;
	params.newWeapon = newWeapon;
	params.bAddSkill = bAddSkill;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DisalbeWeaponSlot6Hud
// (Defined, Public)

void AHudCDeathmatch::DisalbeWeaponSlot6Hud()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DisalbeWeaponSlot6Hud");

	AHudCDeathmatch_DisalbeWeaponSlot6Hud_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.ChangeWeaponSlot6Hud
// (Defined, Public)
// Parameters:
// class AwWeapon*                newWeapon                      (Parm)

void AHudCDeathmatch::ChangeWeaponSlot6Hud(class AwWeapon* newWeapon)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.ChangeWeaponSlot6Hud");

	AHudCDeathmatch_ChangeWeaponSlot6Hud_Params params;
	params.newWeapon = newWeapon;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawAASNotice
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawAASNotice(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawAASNotice");

	AHudCDeathmatch_DrawAASNotice_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.GetNoticeFirst
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AHudCDeathmatch::GetNoticeFirst()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetNoticeFirst");

	AHudCDeathmatch_GetNoticeFirst_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.DrawSystemNotice
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawSystemNotice(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawSystemNotice");

	AHudCDeathmatch_DrawSystemNotice_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawGameNotice
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawGameNotice(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawGameNotice");

	AHudCDeathmatch_DrawGameNotice_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.AllDeleteGameNotice
// (Defined, Simulated, Public)

void AHudCDeathmatch::AllDeleteGameNotice()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.AllDeleteGameNotice");

	AHudCDeathmatch_AllDeleteGameNotice_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.PushAASNotice
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 sNotice                        (Parm, NeedCtorLink)
// float                          beginTime                      (Parm)
// unsigned char                  byLevel                        (Parm)

void AHudCDeathmatch::PushAASNotice(const struct FString& sNotice, float beginTime, unsigned char byLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.PushAASNotice");

	AHudCDeathmatch_PushAASNotice_Params params;
	params.sNotice = sNotice;
	params.beginTime = beginTime;
	params.byLevel = byLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.PushGameNotice
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 sNotice                        (Parm, NeedCtorLink)

void AHudCDeathmatch::PushGameNotice(const struct FString& sNotice)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.PushGameNotice");

	AHudCDeathmatch_PushGameNotice_Params params;
	params.sNotice = sNotice;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.RecGameNotice
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 sNotice                        (Parm, NeedCtorLink)

void AHudCDeathmatch::RecGameNotice(const struct FString& sNotice)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.RecGameNotice");

	AHudCDeathmatch_RecGameNotice_Params params;
	params.sNotice = sNotice;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.RecAAS
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 sNotice                        (Parm, NeedCtorLink)
// float                          DrawTime                       (Parm)

void AHudCDeathmatch::RecAAS(const struct FString& sNotice, float DrawTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.RecAAS");

	AHudCDeathmatch_RecAAS_Params params;
	params.sNotice = sNotice;
	params.DrawTime = DrawTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawWaringMark
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          fWidth                         (Parm)
// float                          fHeight                        (Parm)
// float                          fCurLifeTime                   (Parm)
// float                          fMaxLifeTime                   (Parm)

void AHudCDeathmatch::DrawWaringMark(class UCanvas* C, float fWidth, float fHeight, float fCurLifeTime, float fMaxLifeTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawWaringMark");

	AHudCDeathmatch_DrawWaringMark_Params params;
	params.C = C;
	params.fWidth = fWidth;
	params.fHeight = fHeight;
	params.fCurLifeTime = fCurLifeTime;
	params.fMaxLifeTime = fMaxLifeTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawScoreEffect
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FSpriteWidget           W                              (Parm)
// float                          fWidth                         (Parm)
// float                          fHeight                        (Parm)
// struct FCalCoordsW             calW                           (Parm)
// float                          PosX                           (OptionalParm, Parm)
// float                          PosY                           (OptionalParm, Parm)

void AHudCDeathmatch::DrawScoreEffect(class UCanvas* C, const struct FSpriteWidget& W, float fWidth, float fHeight, const struct FCalCoordsW& calW, float PosX, float PosY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawScoreEffect");

	AHudCDeathmatch_DrawScoreEffect_Params params;
	params.C = C;
	params.W = W;
	params.fWidth = fWidth;
	params.fHeight = fHeight;
	params.calW = calW;
	params.PosX = PosX;
	params.PosY = PosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawKillMarkEffect
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FSpriteWidget           W                              (Parm)
// float                          fWidth                         (Parm)
// float                          fHeight                        (Parm)
// struct FCalCoordsW             calW                           (Parm)
// float                          PosX                           (OptionalParm, Parm)
// float                          PosY                           (OptionalParm, Parm)
// float                          fScale                         (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudCDeathmatch::DrawKillMarkEffect(class UCanvas* C, const struct FSpriteWidget& W, float fWidth, float fHeight, const struct FCalCoordsW& calW, float PosX, float PosY, float fScale)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawKillMarkEffect");

	AHudCDeathmatch_DrawKillMarkEffect_Params params;
	params.C = C;
	params.W = W;
	params.fWidth = fWidth;
	params.fHeight = fHeight;
	params.calW = calW;
	params.PosX = PosX;
	params.PosY = PosY;
	params.fScale = fScale;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.DrawSpecialSkillMedal
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            Index                          (Parm)
// int                            width                          (Parm)
// int                            Height                         (Parm)
// struct FCalCoordsW             calW                           (Parm)
// int                            PosX                           (Parm)
// int                            PosY                           (Parm)
// float                          curScale                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudCDeathmatch::DrawSpecialSkillMedal(class UCanvas* C, int Index, int width, int Height, const struct FCalCoordsW& calW, int PosX, int PosY, float curScale)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawSpecialSkillMedal");

	AHudCDeathmatch_DrawSpecialSkillMedal_Params params;
	params.C = C;
	params.Index = Index;
	params.width = width;
	params.Height = Height;
	params.calW = calW;
	params.PosX = PosX;
	params.PosY = PosY;
	params.curScale = curScale;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.CallSpecialSkillMedelSound
// (Defined, Public)
// Parameters:
// int                            Index                          (Parm)

void AHudCDeathmatch::CallSpecialSkillMedelSound(int Index)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CallSpecialSkillMedelSound");

	AHudCDeathmatch_CallSpecialSkillMedelSound_Params params;
	params.Index = Index;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawAddScore
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            i                              (Parm)
// float                          ScorePosX                      (Parm)
// float                          ScorePosY                      (Parm)
// int                            MessageScoreEffect             (OptionalParm, Parm)
// float                          CurrentScale                   (OptionalParm, Parm)

void AHudCDeathmatch::DrawAddScore(class UCanvas* C, int i, float ScorePosX, float ScorePosY, int MessageScoreEffect, float CurrentScale)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawAddScore");

	AHudCDeathmatch_DrawAddScore_Params params;
	params.C = C;
	params.i = i;
	params.ScorePosX = ScorePosX;
	params.ScorePosY = ScorePosY;
	params.MessageScoreEffect = MessageScoreEffect;
	params.CurrentScale = CurrentScale;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawMessageScore
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            i                              (Parm)
// float                          PosX                           (Parm)
// float                          PosY                           (Parm)
// float                          dx                             (Parm, OutParm)
// float                          dy                             (Parm, OutParm)

void AHudCDeathmatch::DrawMessageScore(class UCanvas* C, int i, float PosX, float PosY, float* dx, float* dy)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawMessageScore");

	AHudCDeathmatch_DrawMessageScore_Params params;
	params.C = C;
	params.i = i;
	params.PosX = PosX;
	params.PosY = PosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (dx != nullptr)
		*dx = params.dx;
	if (dy != nullptr)
		*dy = params.dy;
}


// Function XInterface.HudCDeathmatch.ResetKillMessageTexture
// (Defined, Simulated, Public)

void AHudCDeathmatch::ResetKillMessageTexture()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.ResetKillMessageTexture");

	AHudCDeathmatch_ResetKillMessageTexture_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawMessageWithTexture
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            i                              (Parm)
// float                          PosX                           (Parm)
// float                          PosY                           (Parm)
// float                          dx                             (Parm, OutParm)
// float                          dy                             (Parm, OutParm)

void AHudCDeathmatch::DrawMessageWithTexture(class UCanvas* C, int i, float PosX, float PosY, float* dx, float* dy)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawMessageWithTexture");

	AHudCDeathmatch_DrawMessageWithTexture_Params params;
	params.C = C;
	params.i = i;
	params.PosX = PosX;
	params.PosY = PosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (dx != nullptr)
		*dx = params.dx;
	if (dy != nullptr)
		*dy = params.dy;
}


// Function XInterface.HudCDeathmatch.DrawMessage
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            i                              (Parm)
// float                          PosX                           (Parm)
// float                          PosY                           (Parm)
// float                          dx                             (Parm, OutParm)
// float                          dy                             (Parm, OutParm)

void AHudCDeathmatch::DrawMessage(class UCanvas* C, int i, float PosX, float PosY, float* dx, float* dy)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawMessage");

	AHudCDeathmatch_DrawMessage_Params params;
	params.C = C;
	params.i = i;
	params.PosX = PosX;
	params.PosY = PosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (dx != nullptr)
		*dx = params.dx;
	if (dy != nullptr)
		*dy = params.dy;
}


// Function XInterface.HudCDeathmatch.LocalizedMessage
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  Message                        (Parm)
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)
// struct FString                 CriticalString                 (OptionalParm, Parm, NeedCtorLink)

void AHudCDeathmatch::LocalizedMessage(class UClass* Message, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject, const struct FString& CriticalString)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.LocalizedMessage");

	AHudCDeathmatch_LocalizedMessage_Params params;
	params.Message = Message;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;
	params.CriticalString = CriticalString;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.IsUAVOn
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudCDeathmatch::IsUAVOn()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.IsUAVOn");

	AHudCDeathmatch_IsUAVOn_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.IsUAVScanning
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudCDeathmatch::IsUAVScanning()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.IsUAVScanning");

	AHudCDeathmatch_IsUAVScanning_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.GetUAVScanLineTexturePos
// (Defined, Simulated, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AHudCDeathmatch::GetUAVScanLineTexturePos()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetUAVScanLineTexturePos");

	AHudCDeathmatch_GetUAVScanLineTexturePos_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.GetUAVScanLineMinimapPos
// (Defined, Simulated, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AHudCDeathmatch::GetUAVScanLineMinimapPos()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetUAVScanLineMinimapPos");

	AHudCDeathmatch_GetUAVScanLineMinimapPos_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.GetUAVScanProgress
// (Defined, Simulated, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AHudCDeathmatch::GetUAVScanProgress()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetUAVScanProgress");

	AHudCDeathmatch_GetUAVScanProgress_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.StartUAVScan
// (Defined, Public)

void AHudCDeathmatch::StartUAVScan()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.StartUAVScan");

	AHudCDeathmatch_StartUAVScan_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.IsPawnUnderScan
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudCDeathmatch::IsPawnUnderScan(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.IsPawnUnderScan");

	AHudCDeathmatch_IsPawnUnderScan_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.UpdateUAV
// (Defined, Simulated, Public)

void AHudCDeathmatch::UpdateUAV()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.UpdateUAV");

	AHudCDeathmatch_UpdateUAV_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawUAV
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawUAV(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawUAV");

	AHudCDeathmatch_DrawUAV_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawDebugUAV
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            X                              (Parm)
// int                            Y                              (Parm, OutParm)
// int                            dy                             (Parm)

void AHudCDeathmatch::DrawDebugUAV(class UCanvas* C, int X, int dy, int* Y)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawDebugUAV");

	AHudCDeathmatch_DrawDebugUAV_Params params;
	params.C = C;
	params.X = X;
	params.dy = dy;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Y != nullptr)
		*Y = params.Y;
}


// Function XInterface.HudCDeathmatch.CallItemBuy
// (Defined, Public)
// Parameters:
// int                            iKey                           (OptionalParm, Parm)
// int                            iReservation1                  (OptionalParm, Parm)
// int                            iReservation2                  (OptionalParm, Parm)

void AHudCDeathmatch::CallItemBuy(int iKey, int iReservation1, int iReservation2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CallItemBuy");

	AHudCDeathmatch_CallItemBuy_Params params;
	params.iKey = iKey;
	params.iReservation1 = iReservation1;
	params.iReservation2 = iReservation2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.TutorialEvent
// (Defined, Public)
// Parameters:
// struct FString                 S                              (Parm, CoerceParm, NeedCtorLink)
// struct FName                   Type                           (OptionalParm, Parm)
// struct FName                   reserv                         (OptionalParm, Parm)

void AHudCDeathmatch::TutorialEvent(const struct FString& S, const struct FName& Type, const struct FName& reserv)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.TutorialEvent");

	AHudCDeathmatch_TutorialEvent_Params params;
	params.S = S;
	params.Type = Type;
	params.reserv = reserv;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.CallRadioMessage
// (Defined, Public)
// Parameters:
// int                            iKey                           (OptionalParm, Parm)
// int                            iReservation1                  (OptionalParm, Parm)
// int                            iReservation2                  (OptionalParm, Parm)

void AHudCDeathmatch::CallRadioMessage(int iKey, int iReservation1, int iReservation2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CallRadioMessage");

	AHudCDeathmatch_CallRadioMessage_Params params;
	params.iKey = iKey;
	params.iReservation1 = iReservation1;
	params.iReservation2 = iReservation2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.CallEvent
// (Defined, Public)
// Parameters:
// bool                           InvenCheck                     (OptionalParm, Parm)
// int                            iReservation1                  (OptionalParm, Parm)
// int                            iReservation2                  (OptionalParm, Parm)

void AHudCDeathmatch::CallEvent(bool InvenCheck, int iReservation1, int iReservation2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CallEvent");

	AHudCDeathmatch_CallEvent_Params params;
	params.InvenCheck = InvenCheck;
	params.iReservation1 = iReservation1;
	params.iReservation2 = iReservation2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawChangeHostGuest
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawChangeHostGuest(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawChangeHostGuest");

	AHudCDeathmatch_DrawChangeHostGuest_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.OnEndChangedHost
// (Defined, Public)

void AHudCDeathmatch::OnEndChangedHost()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.OnEndChangedHost");

	AHudCDeathmatch_OnEndChangedHost_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.EndDrawChangeHost
// (Defined, Public)

void AHudCDeathmatch::EndDrawChangeHost()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.EndDrawChangeHost");

	AHudCDeathmatch_EndDrawChangeHost_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.BeginDrawChangeHost
// (Defined, Public)

void AHudCDeathmatch::BeginDrawChangeHost()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.BeginDrawChangeHost");

	AHudCDeathmatch_BeginDrawChangeHost_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.GetTargetOrientation2
// (Defined, Static, Public)
// Parameters:
// struct FVector                 loc                            (Parm)
// struct FVector                 camLoc                         (Parm)
// struct FRotator                camRot                         (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AHudCDeathmatch::STATIC_GetTargetOrientation2(const struct FVector& loc, const struct FVector& camLoc, const struct FRotator& camRot)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetTargetOrientation2");

	AHudCDeathmatch_GetTargetOrientation2_Params params;
	params.loc = loc;
	params.camLoc = camLoc;
	params.camRot = camRot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.ExpandTargetOrientationToCanvas
// (Final, Defined, Static, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 Orientation                    (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AHudCDeathmatch::STATIC_ExpandTargetOrientationToCanvas(class UCanvas* C, const struct FVector& Orientation)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.ExpandTargetOrientationToCanvas");

	AHudCDeathmatch_ExpandTargetOrientationToCanvas_Params params;
	params.C = C;
	params.Orientation = Orientation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.GetTargetOrientation
// (Final, Defined, Static, Public)
// Parameters:
// class AActor*                  Target                         (Parm)
// struct FVector                 camLoc                         (Parm)
// struct FRotator                camRot                         (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AHudCDeathmatch::STATIC_GetTargetOrientation(class AActor* Target, const struct FVector& camLoc, const struct FRotator& camRot)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetTargetOrientation");

	AHudCDeathmatch_GetTargetOrientation_Params params;
	params.Target = Target;
	params.camLoc = camLoc;
	params.camRot = camRot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.DrawOutArrow
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          W                              (Parm)
// float                          H                              (Parm)
// struct FVector                 ScreenPos                      (Parm)

void AHudCDeathmatch::DrawOutArrow(class UCanvas* C, float W, float H, const struct FVector& ScreenPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawOutArrow");

	AHudCDeathmatch_DrawOutArrow_Params params;
	params.C = C;
	params.W = W;
	params.H = H;
	params.ScreenPos = ScreenPos;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawObjectSprite
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class UObject*                 Tag                            (Parm)
// struct FSpriteWidget           objectSprite                   (Parm)
// struct FVector                 objectLoc                      (Parm)
// bool                           drawMeter                      (OptionalParm, Parm)
// float                          rX                             (OptionalParm, Parm)
// float                          rY                             (OptionalParm, Parm)

void AHudCDeathmatch::DrawObjectSprite(class UCanvas* C, class UObject* Tag, const struct FSpriteWidget& objectSprite, const struct FVector& objectLoc, bool drawMeter, float rX, float rY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawObjectSprite");

	AHudCDeathmatch_DrawObjectSprite_Params params;
	params.C = C;
	params.Tag = Tag;
	params.objectSprite = objectSprite;
	params.objectLoc = objectLoc;
	params.drawMeter = drawMeter;
	params.rX = rX;
	params.rY = rY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawObjectSprite2
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class UObject*                 Tag                            (Parm)
// struct FSpriteWidget           objectSprite                   (Parm)
// struct FVector                 objectLoc                      (Parm)
// struct FString                 ObjectName                     (OptionalParm, Parm, NeedCtorLink)
// int                            Alpha                          (OptionalParm, Parm)

void AHudCDeathmatch::DrawObjectSprite2(class UCanvas* C, class UObject* Tag, const struct FSpriteWidget& objectSprite, const struct FVector& objectLoc, const struct FString& ObjectName, int Alpha)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawObjectSprite2");

	AHudCDeathmatch_DrawObjectSprite2_Params params;
	params.C = C;
	params.Tag = Tag;
	params.objectSprite = objectSprite;
	params.objectLoc = objectLoc;
	params.ObjectName = ObjectName;
	params.Alpha = Alpha;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawObjectSprite3
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FSpriteWidget           objectSprite                   (Parm)
// struct FVector                 objectLoc                      (Parm)
// bool                           bNoMeterDisplay                (OptionalParm, Parm)

void AHudCDeathmatch::DrawObjectSprite3(class UCanvas* C, const struct FSpriteWidget& objectSprite, const struct FVector& objectLoc, bool bNoMeterDisplay)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawObjectSprite3");

	AHudCDeathmatch_DrawObjectSprite3_Params params;
	params.C = C;
	params.objectSprite = objectSprite;
	params.objectLoc = objectLoc;
	params.bNoMeterDisplay = bNoMeterDisplay;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.CalcScreenPos
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 objectLoc                      (Parm)
// float                          W                              (Parm)
// float                          H                              (Parm)
// unsigned char                  clipped                        (Parm, OutParm)
// bool                           ClipEclipse                    (OptionalParm, Parm)
// float                          rX                             (OptionalParm, Parm)
// float                          rY                             (OptionalParm, Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AHudCDeathmatch::CalcScreenPos(class UCanvas* C, const struct FVector& objectLoc, float W, float H, bool ClipEclipse, float rX, float rY, unsigned char* clipped)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CalcScreenPos");

	AHudCDeathmatch_CalcScreenPos_Params params;
	params.C = C;
	params.objectLoc = objectLoc;
	params.W = W;
	params.H = H;
	params.ClipEclipse = ClipEclipse;
	params.rX = rX;
	params.rY = rY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (clipped != nullptr)
		*clipped = params.clipped;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.CallSkill
// (Defined, Public)
// Parameters:
// int                            iKey                           (OptionalParm, Parm)
// bool                           bRequire                       (OptionalParm, Parm)
// bool                           bSuccess                       (OptionalParm, Parm)

void AHudCDeathmatch::CallSkill(int iKey, bool bRequire, bool bSuccess)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CallSkill");

	AHudCDeathmatch_CallSkill_Params params;
	params.iKey = iKey;
	params.bRequire = bRequire;
	params.bSuccess = bSuccess;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawSelfKillMessage
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawSelfKillMessage(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawSelfKillMessage");

	AHudCDeathmatch_DrawSelfKillMessage_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.MakeSelfKillMessage
// (Defined, Public)
// Parameters:
// struct FString                 KillerName                     (Parm, NeedCtorLink)
// struct FString                 VictimName                     (Parm, NeedCtorLink)
// class UClass*                  Type                           (Parm)
// struct FSelfKillMessage        ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FSelfKillMessage AHudCDeathmatch::MakeSelfKillMessage(const struct FString& KillerName, const struct FString& VictimName, class UClass* Type)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.MakeSelfKillMessage");

	AHudCDeathmatch_MakeSelfKillMessage_Params params;
	params.KillerName = KillerName;
	params.VictimName = VictimName;
	params.Type = Type;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.RefreshKillerMark
// (Defined, Public)
// Parameters:
// struct FString                 mKillerName                    (Parm, NeedCtorLink)

void AHudCDeathmatch::RefreshKillerMark(const struct FString& mKillerName)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.RefreshKillerMark");

	AHudCDeathmatch_RefreshKillerMark_Params params;
	params.mKillerName = mKillerName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.OnClientReceiveDeathMessage
// (Defined, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// int                            Switch                         (Parm)
// class APlayerReplicationInfo*  attackerPRI                    (Parm)
// class APlayerReplicationInfo*  victimPRI                      (Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)

void AHudCDeathmatch::OnClientReceiveDeathMessage(class APlayerController* P, int Switch, class APlayerReplicationInfo* attackerPRI, class APlayerReplicationInfo* victimPRI, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.OnClientReceiveDeathMessage");

	AHudCDeathmatch_OnClientReceiveDeathMessage_Params params;
	params.P = P;
	params.Switch = Switch;
	params.attackerPRI = attackerPRI;
	params.victimPRI = victimPRI;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.OnClientReceiveFlyingDefenceBotDeathMessage
// (Defined, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// class APlayerReplicationInfo*  attackerPRI                    (Parm)
// class APlayerReplicationInfo*  victimPRI                      (Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)

void AHudCDeathmatch::OnClientReceiveFlyingDefenceBotDeathMessage(class APlayerController* P, class APlayerReplicationInfo* attackerPRI, class APlayerReplicationInfo* victimPRI, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.OnClientReceiveFlyingDefenceBotDeathMessage");

	AHudCDeathmatch_OnClientReceiveFlyingDefenceBotDeathMessage_Params params;
	params.P = P;
	params.attackerPRI = attackerPRI;
	params.victimPRI = victimPRI;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.OnClientReceiveHeliDeathMessage
// (Defined, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// class APlayerReplicationInfo*  attackerPRI                    (Parm)
// class APlayerReplicationInfo*  victimPRI                      (Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)

void AHudCDeathmatch::OnClientReceiveHeliDeathMessage(class APlayerController* P, class APlayerReplicationInfo* attackerPRI, class APlayerReplicationInfo* victimPRI, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.OnClientReceiveHeliDeathMessage");

	AHudCDeathmatch_OnClientReceiveHeliDeathMessage_Params params;
	params.P = P;
	params.attackerPRI = attackerPRI;
	params.victimPRI = victimPRI;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.OnClientReceiveDeathMessage_AddToConsole
// (Defined, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// class APlayerReplicationInfo*  attackerPRI                    (Parm)
// class APlayerReplicationInfo*  victimPRI                      (Parm)
// class AwDamageType*            DamageType                     (Parm)

void AHudCDeathmatch::OnClientReceiveDeathMessage_AddToConsole(class APlayerController* P, class APlayerReplicationInfo* attackerPRI, class APlayerReplicationInfo* victimPRI, class AwDamageType* DamageType)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.OnClientReceiveDeathMessage_AddToConsole");

	AHudCDeathmatch_OnClientReceiveDeathMessage_AddToConsole_Params params;
	params.P = P;
	params.attackerPRI = attackerPRI;
	params.victimPRI = victimPRI;
	params.DamageType = DamageType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawDamageIndicator
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FDamageIndicationInfo   Info                           (Parm)

void AHudCDeathmatch::DrawDamageIndicator(class UCanvas* C, const struct FDamageIndicationInfo& Info)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawDamageIndicator");

	AHudCDeathmatch_DrawDamageIndicator_Params params;
	params.C = C;
	params.Info = Info;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawDamageIndicators
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawDamageIndicators(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawDamageIndicators");

	AHudCDeathmatch_DrawDamageIndicators_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.IsHealthInDanger
// (Defined, Public)
// Parameters:
// int                            hpBefore                       (Parm)
// int                            hpAfter                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudCDeathmatch::IsHealthInDanger(int hpBefore, int hpAfter)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.IsHealthInDanger");

	AHudCDeathmatch_IsHealthInDanger_Params params;
	params.hpBefore = hpBefore;
	params.hpAfter = hpAfter;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.DrawHealthInDanger
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawHealthInDanger(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawHealthInDanger");

	AHudCDeathmatch_DrawHealthInDanger_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawFallInDanger
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawFallInDanger(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawFallInDanger");

	AHudCDeathmatch_DrawFallInDanger_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.StopNotifyFallInDanager
// (Defined, Public)

void AHudCDeathmatch::StopNotifyFallInDanager()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.StopNotifyFallInDanager");

	AHudCDeathmatch_StopNotifyFallInDanager_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.NotifyFallInDanger
// (Defined, Public)

void AHudCDeathmatch::NotifyFallInDanger()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.NotifyFallInDanger");

	AHudCDeathmatch_NotifyFallInDanger_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.StopNotifyHealthInDanager
// (Defined, Public)

void AHudCDeathmatch::StopNotifyHealthInDanager()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.StopNotifyHealthInDanager");

	AHudCDeathmatch_StopNotifyHealthInDanager_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.NotifyHealthInDanger
// (Defined, Public)

void AHudCDeathmatch::NotifyHealthInDanger()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.NotifyHealthInDanger");

	AHudCDeathmatch_NotifyHealthInDanger_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.ClearDamageIndicationInfos
// (Defined, Public)

void AHudCDeathmatch::ClearDamageIndicationInfos()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.ClearDamageIndicationInfos");

	AHudCDeathmatch_ClearDamageIndicationInfos_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.AddDamageIndicationInfo
// (Defined, Public)
// Parameters:
// struct FVector                 AttackerLocation               (Parm)
// int                            Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)

void AHudCDeathmatch::AddDamageIndicationInfo(const struct FVector& AttackerLocation, int Damage, class UClass* DamageType)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.AddDamageIndicationInfo");

	AHudCDeathmatch_AddDamageIndicationInfo_Params params;
	params.AttackerLocation = AttackerLocation;
	params.Damage = Damage;
	params.DamageType = DamageType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.NotifyTakeHit
// (Defined, Public)
// Parameters:
// struct FVector                 AttackerLocation               (Parm)
// int                            Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)
// struct FVector                 Momentum                       (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AHudCDeathmatch::NotifyTakeHit(const struct FVector& AttackerLocation, int Damage, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.NotifyTakeHit");

	AHudCDeathmatch_NotifyTakeHit_Params params;
	params.AttackerLocation = AttackerLocation;
	params.Damage = Damage;
	params.DamageType = DamageType;
	params.Momentum = Momentum;
	params.CollisionPart = CollisionPart;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawProgressStatus
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          Progress                       (Parm)

void AHudCDeathmatch::DrawProgressStatus(class UCanvas* C, float Progress)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawProgressStatus");

	AHudCDeathmatch_DrawProgressStatus_Params params;
	params.C = C;
	params.Progress = Progress;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.LoadLevelActionFont
// (Defined, Simulated, Public)
// Parameters:
// class UFont*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UFont* AHudCDeathmatch::LoadLevelActionFont()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.LoadLevelActionFont");

	AHudCDeathmatch_LoadLevelActionFont_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.DisplayPortrait
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)

void AHudCDeathmatch::DisplayPortrait(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DisplayPortrait");

	AHudCDeathmatch_DisplayPortrait_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawLevelAction
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudCDeathmatch::DrawLevelAction(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawLevelAction");

	AHudCDeathmatch_DrawLevelAction_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.DrawVehicleChargeBar
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawVehicleChargeBar(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawVehicleChargeBar");

	AHudCDeathmatch_DrawVehicleChargeBar_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawChargeBar
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawChargeBar(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawChargeBar");

	AHudCDeathmatch_DrawChargeBar_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.ShowReloadingPulse
// (Defined, Simulated, Public)
// Parameters:
// float                          HOLD                           (Parm)

void AHudCDeathmatch::ShowReloadingPulse(float HOLD)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.ShowReloadingPulse");

	AHudCDeathmatch_ShowReloadingPulse_Params params;
	params.HOLD = HOLD;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawDamageDealNotification
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawDamageDealNotification(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawDamageDealNotification");

	AHudCDeathmatch_DrawDamageDealNotification_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.ResetByChangeSpectatingPawn
// (Defined, Public)

void AHudCDeathmatch::ResetByChangeSpectatingPawn()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.ResetByChangeSpectatingPawn");

	AHudCDeathmatch_ResetByChangeSpectatingPawn_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawWarfareCrosshair
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawWarfareCrosshair(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawWarfareCrosshair");

	AHudCDeathmatch_DrawWarfareCrosshair_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.SetMA
// (Defined, Exec, Public)
// Parameters:
// float                          f                              (Parm)

void AHudCDeathmatch::SetMA(float f)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.SetMA");

	AHudCDeathmatch_SetMA_Params params;
	params.f = f;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawDetectedBombs
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawDetectedBombs(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawDetectedBombs");

	AHudCDeathmatch_DrawDetectedBombs_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawHudSpectating
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawHudSpectating(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawHudSpectating");

	AHudCDeathmatch_DrawHudSpectating_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawHudPassC
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawHudPassC(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawHudPassC");

	AHudCDeathmatch_DrawHudPassC_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.GetLevelImage
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)
// class UMaterial*               ReturnValue                    (Parm, OutParm, ReturnParm)

class UMaterial* AHudCDeathmatch::GetLevelImage(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetLevelImage");

	AHudCDeathmatch_GetLevelImage_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.DisplayDebug
// (Defined, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void AHudCDeathmatch::DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DisplayDebug");

	AHudCDeathmatch_DisplayDebug_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function XInterface.HudCDeathmatch.DrawDebugPosition
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APawn*                   P                              (Parm)

void AHudCDeathmatch::DrawDebugPosition(class UCanvas* C, class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawDebugPosition");

	AHudCDeathmatch_DrawDebugPosition_Params params;
	params.C = C;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawHudPassA
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawHudPassA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawHudPassA");

	AHudCDeathmatch_DrawHudPassA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawBackDisplayScreen
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawBackDisplayScreen(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawBackDisplayScreen");

	AHudCDeathmatch_DrawBackDisplayScreen_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawDebug
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            X                              (Parm)
// int                            Y                              (Parm, OutParm)
// int                            dy                             (Parm)

void AHudCDeathmatch::DrawDebug(class UCanvas* C, int X, int dy, int* Y)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawDebug");

	AHudCDeathmatch_DrawDebug_Params params;
	params.C = C;
	params.X = X;
	params.dy = dy;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Y != nullptr)
		*Y = params.Y;
}


// Function XInterface.HudCDeathmatch.DrawDebug_Network
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            X                              (Parm)
// int                            Y                              (Parm, OutParm)
// int                            dy                             (Parm)

void AHudCDeathmatch::DrawDebug_Network(class UCanvas* C, int X, int dy, int* Y)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawDebug_Network");

	AHudCDeathmatch_DrawDebug_Network_Params params;
	params.C = C;
	params.X = X;
	params.dy = dy;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Y != nullptr)
		*Y = params.Y;
}


// Function XInterface.HudCDeathmatch.wclearNet
// (Defined, Exec, Public)

void AHudCDeathmatch::wclearNet()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.wclearNet");

	AHudCDeathmatch_wclearNet_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawDebug_DrawDebugUserWeaponStates
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            X                              (Parm)
// int                            Y                              (Parm, OutParm)
// int                            dy                             (Parm)

void AHudCDeathmatch::DrawDebug_DrawDebugUserWeaponStates(class UCanvas* C, int X, int dy, int* Y)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawDebug_DrawDebugUserWeaponStates");

	AHudCDeathmatch_DrawDebug_DrawDebugUserWeaponStates_Params params;
	params.C = C;
	params.X = X;
	params.dy = dy;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Y != nullptr)
		*Y = params.Y;
}


// Function XInterface.HudCDeathmatch.DrawDebug_Inventory
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            X                              (Parm)
// int                            Y                              (Parm, OutParm)
// int                            dy                             (Parm)

void AHudCDeathmatch::DrawDebug_Inventory(class UCanvas* C, int X, int dy, int* Y)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawDebug_Inventory");

	AHudCDeathmatch_DrawDebug_Inventory_Params params;
	params.C = C;
	params.X = X;
	params.dy = dy;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Y != nullptr)
		*Y = params.Y;
}


// Function XInterface.HudCDeathmatch.DrawDebugEmitters
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawDebugEmitters(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawDebugEmitters");

	AHudCDeathmatch_DrawDebugEmitters_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawDebugHelicopter
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawDebugHelicopter(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawDebugHelicopter");

	AHudCDeathmatch_DrawDebugHelicopter_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawDebugAirStrike
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawDebugAirStrike(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawDebugAirStrike");

	AHudCDeathmatch_DrawDebugAirStrike_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawSpecialPositions
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawSpecialPositions(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawSpecialPositions");

	AHudCDeathmatch_DrawSpecialPositions_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawTimer2
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawTimer2(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawTimer2");

	AHudCDeathmatch_DrawTimer2_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawTimer1
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawTimer1(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawTimer1");

	AHudCDeathmatch_DrawTimer1_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawAmmoLinear2
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            Ammo                           (Parm)
// int                            MaxAmmo                        (Parm)
// struct FAmmoSet                as                             (Parm)

void AHudCDeathmatch::DrawAmmoLinear2(class UCanvas* C, int Ammo, int MaxAmmo, const struct FAmmoSet& as)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawAmmoLinear2");

	AHudCDeathmatch_DrawAmmoLinear2_Params params;
	params.C = C;
	params.Ammo = Ammo;
	params.MaxAmmo = MaxAmmo;
	params.as = as;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawAmmoLinear
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            Ammo                           (Parm)
// int                            MaxAmmo                        (Parm)
// int                            digitOffset                    (Parm)
// struct FNumericWidget          ammoWidget                     (Parm)
// struct FDigitSet               AmmoSet                        (Parm, OutParm)

void AHudCDeathmatch::DrawAmmoLinear(class UCanvas* C, int Ammo, int MaxAmmo, int digitOffset, const struct FNumericWidget& ammoWidget, struct FDigitSet* AmmoSet)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawAmmoLinear");

	AHudCDeathmatch_DrawAmmoLinear_Params params;
	params.C = C;
	params.Ammo = Ammo;
	params.MaxAmmo = MaxAmmo;
	params.digitOffset = digitOffset;
	params.ammoWidget = ammoWidget;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (AmmoSet != nullptr)
		*AmmoSet = params.AmmoSet;
}


// Function XInterface.HudCDeathmatch.DrawAmmo100
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            Ammo                           (Parm)
// int                            MaxAmmo                        (Parm)
// int                            ammoPerLine                    (Parm)

void AHudCDeathmatch::DrawAmmo100(class UCanvas* C, int Ammo, int MaxAmmo, int ammoPerLine)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawAmmo100");

	AHudCDeathmatch_DrawAmmo100_Params params;
	params.C = C;
	params.Ammo = Ammo;
	params.MaxAmmo = MaxAmmo;
	params.ammoPerLine = ammoPerLine;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DecideAmmoNum
// (Defined, Public)
// Parameters:
// int                            Ammo                           (Parm)
// int                            MaxAmmo                        (Parm)
// int                            ammoDefault                    (Parm, OutParm)
// int                            ammoUsed                       (Parm, OutParm)

void AHudCDeathmatch::DecideAmmoNum(int Ammo, int MaxAmmo, int* ammoDefault, int* ammoUsed)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DecideAmmoNum");

	AHudCDeathmatch_DecideAmmoNum_Params params;
	params.Ammo = Ammo;
	params.MaxAmmo = MaxAmmo;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ammoDefault != nullptr)
		*ammoDefault = params.ammoDefault;
	if (ammoUsed != nullptr)
		*ammoUsed = params.ammoUsed;
}


// Function XInterface.HudCDeathmatch.IsAmmoShortage
// (Defined, Public)
// Parameters:
// int                            Ammo                           (Parm)
// int                            MaxAmmo                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudCDeathmatch::IsAmmoShortage(int Ammo, int MaxAmmo)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.IsAmmoShortage");

	AHudCDeathmatch_IsAmmoShortage_Params params;
	params.Ammo = Ammo;
	params.MaxAmmo = MaxAmmo;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.DrawAmmoFlameThrower2
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            curr                           (Parm)
// int                            Max                            (Parm)

void AHudCDeathmatch::DrawAmmoFlameThrower2(class UCanvas* C, int curr, int Max)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawAmmoFlameThrower2");

	AHudCDeathmatch_DrawAmmoFlameThrower2_Params params;
	params.C = C;
	params.curr = curr;
	params.Max = Max;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawAmmoFlameThrower
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            curr                           (Parm)
// int                            Max                            (Parm)

void AHudCDeathmatch::DrawAmmoFlameThrower(class UCanvas* C, int curr, int Max)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawAmmoFlameThrower");

	AHudCDeathmatch_DrawAmmoFlameThrower_Params params;
	params.C = C;
	params.curr = curr;
	params.Max = Max;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawAmmoDemo
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawAmmoDemo(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawAmmoDemo");

	AHudCDeathmatch_DrawAmmoDemo_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawAmmo
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawAmmo(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawAmmo");

	AHudCDeathmatch_DrawAmmo_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawGaugeOverHeat
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          iRatio                         (Parm)

void AHudCDeathmatch::DrawGaugeOverHeat(class UCanvas* C, float iRatio)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawGaugeOverHeat");

	AHudCDeathmatch_DrawGaugeOverHeat_Params params;
	params.C = C;
	params.iRatio = iRatio;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawWeaponImage
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           bShowSpectating                (OptionalParm, Parm)
// struct FString                 sWeaponName                    (OptionalParm, Parm, OutParm, NeedCtorLink)

void AHudCDeathmatch::DrawWeaponImage(class UCanvas* C, bool bShowSpectating, struct FString* sWeaponName)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawWeaponImage");

	AHudCDeathmatch_DrawWeaponImage_Params params;
	params.C = C;
	params.bShowSpectating = bShowSpectating;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (sWeaponName != nullptr)
		*sWeaponName = params.sWeaponName;
}


// Function XInterface.HudCDeathmatch.DrawAmmoSeparator
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawAmmoSeparator(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawAmmoSeparator");

	AHudCDeathmatch_DrawAmmoSeparator_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.CheckUsingSkillList
// (Defined, Public)
// Parameters:
// class AwWeapon*                Wpn                            (Parm)
// int                            iState                         (Parm, OutParm)

void AHudCDeathmatch::CheckUsingSkillList(class AwWeapon* Wpn, int* iState)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CheckUsingSkillList");

	AHudCDeathmatch_CheckUsingSkillList_Params params;
	params.Wpn = Wpn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (iState != nullptr)
		*iState = params.iState;
}


// Function XInterface.HudCDeathmatch.GetHUDTextures
// (Defined, Public)
// Parameters:
// int                            ItemID                         (Parm)
// class UMaterial*               enableSkillIcon                (Parm, OutParm)
// class UMaterial*               disableSkillIcon               (Parm, OutParm)

void AHudCDeathmatch::GetHUDTextures(int ItemID, class UMaterial** enableSkillIcon, class UMaterial** disableSkillIcon)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetHUDTextures");

	AHudCDeathmatch_GetHUDTextures_Params params;
	params.ItemID = ItemID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (enableSkillIcon != nullptr)
		*enableSkillIcon = params.enableSkillIcon;
	if (disableSkillIcon != nullptr)
		*disableSkillIcon = params.disableSkillIcon;
}


// Function XInterface.HudCDeathmatch.GetSkillInfo
// (Defined, Public)
// Parameters:
// int                            SkillID                        (Parm)
// int                            weaponID                       (Parm)
// int                            usedStrCode                    (Parm, OutParm)
// int                            skillSlotNum                   (Parm, OutParm)

void AHudCDeathmatch::GetSkillInfo(int SkillID, int weaponID, int* usedStrCode, int* skillSlotNum)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetSkillInfo");

	AHudCDeathmatch_GetSkillInfo_Params params;
	params.SkillID = SkillID;
	params.weaponID = weaponID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (usedStrCode != nullptr)
		*usedStrCode = params.usedStrCode;
	if (skillSlotNum != nullptr)
		*skillSlotNum = params.skillSlotNum;
}


// Function XInterface.HudCDeathmatch.GetSkillIconByWeaponID
// (Defined, Public)
// Parameters:
// int                            nWeaponID                      (Parm)
// bool                           bEnable                        (Parm)
// class UMaterial*               ReturnValue                    (Parm, OutParm, ReturnParm)

class UMaterial* AHudCDeathmatch::GetSkillIconByWeaponID(int nWeaponID, bool bEnable)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetSkillIconByWeaponID");

	AHudCDeathmatch_GetSkillIconByWeaponID_Params params;
	params.nWeaponID = nWeaponID;
	params.bEnable = bEnable;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.InsertUsingSkillList
// (Defined, Simulated, Public)
// Parameters:
// int                            SkillID                        (Parm)
// int                            weaponID                       (Parm)
// int                            SubSkillID                     (OptionalParm, Parm)

void AHudCDeathmatch::InsertUsingSkillList(int SkillID, int weaponID, int SubSkillID)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.InsertUsingSkillList");

	AHudCDeathmatch_InsertUsingSkillList_Params params;
	params.SkillID = SkillID;
	params.weaponID = weaponID;
	params.SubSkillID = SubSkillID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.CheckPawnOwnerSkill
// (Defined, Public)
// Parameters:
// int                            skillC4                        (Parm, OutParm)
// int                            skillAirStirke                 (Parm, OutParm)
// int                            skillRPG                       (Parm, OutParm)

void AHudCDeathmatch::CheckPawnOwnerSkill(int* skillC4, int* skillAirStirke, int* skillRPG)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CheckPawnOwnerSkill");

	AHudCDeathmatch_CheckPawnOwnerSkill_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (skillC4 != nullptr)
		*skillC4 = params.skillC4;
	if (skillAirStirke != nullptr)
		*skillAirStirke = params.skillAirStirke;
	if (skillRPG != nullptr)
		*skillRPG = params.skillRPG;
}


// Function XInterface.HudCDeathmatch.HasItemInMyInventory
// (Defined, Public)
// Parameters:
// bool                           bCheck                         (OptionalParm, Parm)
// int                            ItemID1                        (OptionalParm, Parm)
// int                            ItemID2                        (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudCDeathmatch::HasItemInMyInventory(bool bCheck, int ItemID1, int ItemID2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.HasItemInMyInventory");

	AHudCDeathmatch_HasItemInMyInventory_Params params;
	params.bCheck = bCheck;
	params.ItemID1 = ItemID1;
	params.ItemID2 = ItemID2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.InitSkillFlag
// (Defined, Public)

void AHudCDeathmatch::InitSkillFlag()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.InitSkillFlag");

	AHudCDeathmatch_InitSkillFlag_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawSkill
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawSkill(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawSkill");

	AHudCDeathmatch_DrawSkill_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawSlotEnable
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          activeTime                     (Parm)
// struct FSpriteWidget           showSprite                     (Parm)

void AHudCDeathmatch::DrawSlotEnable(class UCanvas* C, float activeTime, const struct FSpriteWidget& showSprite)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawSlotEnable");

	AHudCDeathmatch_DrawSlotEnable_Params params;
	params.C = C;
	params.activeTime = activeTime;
	params.showSprite = showSprite;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawSkill_Slot6
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawSkill_Slot6(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawSkill_Slot6");

	AHudCDeathmatch_DrawSkill_Slot6_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawSkill_Slot5
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawSkill_Slot5(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawSkill_Slot5");

	AHudCDeathmatch_DrawSkill_Slot5_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawHudPassA_Score
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawHudPassA_Score(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawHudPassA_Score");

	AHudCDeathmatch_DrawHudPassA_Score_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.NotifyDeath
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AHudCDeathmatch::NotifyDeath(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.NotifyDeath");

	AHudCDeathmatch_NotifyDeath_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.GetTeamDeathTextureScale
// (Defined, Public)
// Parameters:
// struct FTeamDeathInfo          Info                           (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AHudCDeathmatch::GetTeamDeathTextureScale(const struct FTeamDeathInfo& Info)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetTeamDeathTextureScale");

	AHudCDeathmatch_GetTeamDeathTextureScale_Params params;
	params.Info = Info;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.GetTeamDeathTextureColor
// (Defined, Public)
// Parameters:
// struct FTeamDeathInfo          Info                           (Parm)
// struct FColor                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FColor AHudCDeathmatch::GetTeamDeathTextureColor(const struct FTeamDeathInfo& Info)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetTeamDeathTextureColor");

	AHudCDeathmatch_GetTeamDeathTextureColor_Params params;
	params.Info = Info;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.DrawTeamDeathInfo
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 ScreenPos                      (Parm)
// struct FVector                 camLoc                         (Parm)
// struct FRotator                camRot                         (Parm)
// struct FTeamDeathInfo          Info                           (Parm)

void AHudCDeathmatch::DrawTeamDeathInfo(class UCanvas* C, const struct FVector& ScreenPos, const struct FVector& camLoc, const struct FRotator& camRot, const struct FTeamDeathInfo& Info)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawTeamDeathInfo");

	AHudCDeathmatch_DrawTeamDeathInfo_Params params;
	params.C = C;
	params.ScreenPos = ScreenPos;
	params.camLoc = camLoc;
	params.camRot = camRot;
	params.Info = Info;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawAllTeamDeathInfo
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawAllTeamDeathInfo(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawAllTeamDeathInfo");

	AHudCDeathmatch_DrawAllTeamDeathInfo_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.AddTeamDeathInfo
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// class APlayerReplicationInfo*  PRI                            (Parm)
// float                          FadeTime                       (Parm)
// float                          Duration                       (Parm)

void AHudCDeathmatch::AddTeamDeathInfo(class APawn* P, class APlayerReplicationInfo* PRI, float FadeTime, float Duration)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.AddTeamDeathInfo");

	AHudCDeathmatch_AddTeamDeathInfo_Params params;
	params.P = P;
	params.PRI = PRI;
	params.FadeTime = FadeTime;
	params.Duration = Duration;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawPosture
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           bShowSpectating                (OptionalParm, Parm)

void AHudCDeathmatch::DrawPosture(class UCanvas* C, bool bShowSpectating)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawPosture");

	AHudCDeathmatch_DrawPosture_Params params;
	params.C = C;
	params.bShowSpectating = bShowSpectating;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawHpStamina
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           bShowSpectating                (OptionalParm, Parm)

void AHudCDeathmatch::DrawHpStamina(class UCanvas* C, bool bShowSpectating)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawHpStamina");

	AHudCDeathmatch_DrawHpStamina_Params params;
	params.C = C;
	params.bShowSpectating = bShowSpectating;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.SellectEffectBar
// (Defined, Public)

void AHudCDeathmatch::SellectEffectBar()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.SellectEffectBar");

	AHudCDeathmatch_SellectEffectBar_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.CalculateHPBar
// (Defined, Public)
// Parameters:
// bool                           bDamage                        (Parm)
// bool                           bRecovery                      (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AHudCDeathmatch::CalculateHPBar(bool bDamage, bool bRecovery)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CalculateHPBar");

	AHudCDeathmatch_CalculateHPBar_Params params;
	params.bDamage = bDamage;
	params.bRecovery = bRecovery;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.DisplayVoiceGain
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DisplayVoiceGain(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DisplayVoiceGain");

	AHudCDeathmatch_DisplayVoiceGain_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.ZoomFadeOut
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::ZoomFadeOut(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.ZoomFadeOut");

	AHudCDeathmatch_ZoomFadeOut_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.FadeZoom
// (Defined, Public)

void AHudCDeathmatch::FadeZoom()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.FadeZoom");

	AHudCDeathmatch_FadeZoom_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DisplayEnemyName
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APlayerReplicationInfo*  PRI                            (Parm)

void AHudCDeathmatch::DisplayEnemyName(class UCanvas* C, class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DisplayEnemyName");

	AHudCDeathmatch_DisplayEnemyName_Params params;
	params.C = C;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawEnemyName
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawEnemyName(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawEnemyName");

	AHudCDeathmatch_DrawEnemyName_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawCrosshair
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawCrosshair(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawCrosshair");

	AHudCDeathmatch_DrawCrosshair_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawWarfareCrosshair_Image
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class UMaterial*               mat                            (Parm)

void AHudCDeathmatch::DrawWarfareCrosshair_Image(class UCanvas* C, class UMaterial* mat)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawWarfareCrosshair_Image");

	AHudCDeathmatch_DrawWarfareCrosshair_Image_Params params;
	params.C = C;
	params.mat = mat;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.UpdateCrossHairSpread
// (Defined, Public)

void AHudCDeathmatch::UpdateCrossHairSpread()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.UpdateCrossHairSpread");

	AHudCDeathmatch_UpdateCrossHairSpread_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawTurretCrossHair
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawTurretCrossHair(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawTurretCrossHair");

	AHudCDeathmatch_DrawTurretCrossHair_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawStaticCrossHair
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawStaticCrossHair(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawStaticCrossHair");

	AHudCDeathmatch_DrawStaticCrossHair_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawHUDAnimWidget
// (Defined, Simulated, Public)
// Parameters:
// struct FSpriteWidget           HUDPiece                       (Parm, OutParm)
// float                          DefaultScale                   (Parm)
// float                          PickUPTime                     (Parm)
// float                          AnimTime                       (Parm)
// float                          AnimScale                      (Parm)

void AHudCDeathmatch::DrawHUDAnimWidget(float DefaultScale, float PickUPTime, float AnimTime, float AnimScale, struct FSpriteWidget* HUDPiece)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawHUDAnimWidget");

	AHudCDeathmatch_DrawHUDAnimWidget_Params params;
	params.DefaultScale = DefaultScale;
	params.PickUPTime = PickUPTime;
	params.AnimTime = AnimTime;
	params.AnimScale = AnimScale;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (HUDPiece != nullptr)
		*HUDPiece = params.HUDPiece;
}


// Function XInterface.HudCDeathmatch.DrawHUDAnimDigit
// (Defined, Simulated, Public)
// Parameters:
// struct FNumericWidget          HUDPiece                       (Parm, OutParm)
// float                          DefaultScale                   (Parm)
// float                          PickUPTime                     (Parm)
// float                          AnimTime                       (Parm)
// struct FColor                  DefaultColor                   (Parm)
// struct FColor                  colorHighlight                 (Parm)

void AHudCDeathmatch::DrawHUDAnimDigit(float DefaultScale, float PickUPTime, float AnimTime, const struct FColor& DefaultColor, const struct FColor& colorHighlight, struct FNumericWidget* HUDPiece)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawHUDAnimDigit");

	AHudCDeathmatch_DrawHUDAnimDigit_Params params;
	params.DefaultScale = DefaultScale;
	params.PickUPTime = PickUPTime;
	params.AnimTime = AnimTime;
	params.DefaultColor = DefaultColor;
	params.colorHighlight = colorHighlight;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (HUDPiece != nullptr)
		*HUDPiece = params.HUDPiece;
}


// Function XInterface.HudCDeathmatch.GetInfoString
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AHudCDeathmatch::GetInfoString()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetInfoString");

	AHudCDeathmatch_GetInfoString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.ShowEnemyWhoKillMe
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::ShowEnemyWhoKillMe(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.ShowEnemyWhoKillMe");

	AHudCDeathmatch_ShowEnemyWhoKillMe_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawSpectatingHud
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawSpectatingHud(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawSpectatingHud");

	AHudCDeathmatch_DrawSpectatingHud_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawViewTargetInfo
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawViewTargetInfo(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawViewTargetInfo");

	AHudCDeathmatch_DrawViewTargetInfo_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawResultScore
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawResultScore(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawResultScore");

	AHudCDeathmatch_DrawResultScore_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawResult
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudCDeathmatch::DrawResult(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawResult");

	AHudCDeathmatch_DrawResult_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.SendQuestUpdate
// (Defined, Public)

void AHudCDeathmatch::SendQuestUpdate()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.SendQuestUpdate");

	AHudCDeathmatch_SendQuestUpdate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.IsInCinematic
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudCDeathmatch::IsInCinematic()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.IsInCinematic");

	AHudCDeathmatch_IsInCinematic_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.GetTeamColor
// (Defined, Static, Public)
// Parameters:
// unsigned char                  TeamNum                        (Parm)
// struct FColor                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FColor AHudCDeathmatch::STATIC_GetTeamColor(unsigned char TeamNum)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetTeamColor");

	AHudCDeathmatch_GetTeamColor_Params params;
	params.TeamNum = TeamNum;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.GetScoreTagLine
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AHudCDeathmatch::GetScoreTagLine()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetScoreTagLine");

	AHudCDeathmatch_GetScoreTagLine_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.GetScoreValue
// (Defined, Simulated, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AHudCDeathmatch::GetScoreValue(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetScoreValue");

	AHudCDeathmatch_GetScoreValue_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.GetScoreText
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AHudCDeathmatch::GetScoreText()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GetScoreText");

	AHudCDeathmatch_GetScoreText_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.CalculateScore
// (Defined, Simulated, Public)

void AHudCDeathmatch::CalculateScore()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CalculateScore");

	AHudCDeathmatch_CalculateScore_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.CalculateAmmo
// (Defined, Simulated, Public)

void AHudCDeathmatch::CalculateAmmo()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CalculateAmmo");

	AHudCDeathmatch_CalculateAmmo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.CalculateEnergy
// (Defined, Simulated, Public)

void AHudCDeathmatch::CalculateEnergy()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CalculateEnergy");

	AHudCDeathmatch_CalculateEnergy_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.CalculateShield
// (Defined, Simulated, Public)

void AHudCDeathmatch::CalculateShield()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CalculateShield");

	AHudCDeathmatch_CalculateShield_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.CalculateHealth
// (Defined, Simulated, Public)

void AHudCDeathmatch::CalculateHealth()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CalculateHealth");

	AHudCDeathmatch_CalculateHealth_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.UpdateRankAndSpread
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::UpdateRankAndSpread(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.UpdateRankAndSpread");

	AHudCDeathmatch_UpdateRankAndSpread_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawUDamage
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawUDamage(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawUDamage");

	AHudCDeathmatch_DrawUDamage_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawTimer
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawTimer(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawTimer");

	AHudCDeathmatch_DrawTimer_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawAdrenaline
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawAdrenaline(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawAdrenaline");

	AHudCDeathmatch_DrawAdrenaline_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawVehicleName
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawVehicleName(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawVehicleName");

	AHudCDeathmatch_DrawVehicleName_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.PlaySoundRecovery
// (Defined, Public)

void AHudCDeathmatch::PlaySoundRecovery()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.PlaySoundRecovery");

	AHudCDeathmatch_PlaySoundRecovery_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.PlaySoundStop
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::PlaySoundStop(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.PlaySoundStop");

	AHudCDeathmatch_PlaySoundStop_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.updateScore
// (Public)

void AHudCDeathmatch::updateScore()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.updateScore");

	AHudCDeathmatch_updateScore_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.UpdateHUD
// (Defined, Simulated, Public)

void AHudCDeathmatch::UpdateHUD()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.UpdateHUD");

	AHudCDeathmatch_UpdateHUD_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DoUpdateTime
// (Defined, Public)

void AHudCDeathmatch::DoUpdateTime()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DoUpdateTime");

	AHudCDeathmatch_DoUpdateTime_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.UpdateDigitsMisc
// (Defined, Public)

void AHudCDeathmatch::UpdateDigitsMisc()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.UpdateDigitsMisc");

	AHudCDeathmatch_UpdateDigitsMisc_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.UpdateDigitsHealth
// (Defined, Public)

void AHudCDeathmatch::UpdateDigitsHealth()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.UpdateDigitsHealth");

	AHudCDeathmatch_UpdateDigitsHealth_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.UpdateSprint
// (Defined, Public)

void AHudCDeathmatch::UpdateSprint()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.UpdateSprint");

	AHudCDeathmatch_UpdateSprint_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.UpdateTimer
// (Defined, Public)
// Parameters:
// int                            TimeMinutes                    (Parm, OutParm)
// int                            TimeSeconds                    (Parm, OutParm)

void AHudCDeathmatch::UpdateTimer(int* TimeMinutes, int* TimeSeconds)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.UpdateTimer");

	AHudCDeathmatch_UpdateTimer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (TimeMinutes != nullptr)
		*TimeMinutes = params.TimeMinutes;
	if (TimeSeconds != nullptr)
		*TimeSeconds = params.TimeSeconds;
}


// Function XInterface.HudCDeathmatch.SetDigitsTimer2
// (Defined, Public)
// Parameters:
// int                            Min                            (Parm)
// int                            sec                            (Parm)

void AHudCDeathmatch::SetDigitsTimer2(int Min, int sec)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.SetDigitsTimer2");

	AHudCDeathmatch_SetDigitsTimer2_Params params;
	params.Min = Min;
	params.sec = sec;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.SetDigitsTimer1
// (Defined, Public)
// Parameters:
// int                            Min                            (Parm)
// int                            sec                            (Parm)

void AHudCDeathmatch::SetDigitsTimer1(int Min, int sec)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.SetDigitsTimer1");

	AHudCDeathmatch_SetDigitsTimer1_Params params;
	params.Min = Min;
	params.sec = sec;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.SetDigitsScore
// (Defined, Public)
// Parameters:
// int                            valueL                         (Parm)
// bool                           highlightL                     (Parm)
// int                            valueR                         (Parm)
// bool                           highlightR                     (Parm)
// int                            valueU                         (Parm)
// int                            valueD                         (Parm)

void AHudCDeathmatch::SetDigitsScore(int valueL, bool highlightL, int valueR, bool highlightR, int valueU, int valueD)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.SetDigitsScore");

	AHudCDeathmatch_SetDigitsScore_Params params;
	params.valueL = valueL;
	params.highlightL = highlightL;
	params.valueR = valueR;
	params.highlightR = highlightR;
	params.valueU = valueU;
	params.valueD = valueD;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawAirStrikePosition
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawAirStrikePosition(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawAirStrikePosition");

	AHudCDeathmatch_DrawAirStrikePosition_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawSuppliesPositions
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCDeathmatch::DrawSuppliesPositions(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawSuppliesPositions");

	AHudCDeathmatch_DrawSuppliesPositions_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.CacheSuppliesPositions
// (Defined, Simulated, Public)
// Parameters:
// class AActor*                  act                            (Parm)

void AHudCDeathmatch::CacheSuppliesPositions(class AActor* act)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CacheSuppliesPositions");

	AHudCDeathmatch_CacheSuppliesPositions_Params params;
	params.act = act;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DeleteSuppliesPositions
// (Defined, Simulated, Public)
// Parameters:
// class AActor*                  act                            (Parm)

void AHudCDeathmatch::DeleteSuppliesPositions(class AActor* act)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DeleteSuppliesPositions");

	AHudCDeathmatch_DeleteSuppliesPositions_Params params;
	params.act = act;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.AllDeleteSuppliesPositions
// (Defined, Public)

void AHudCDeathmatch::AllDeleteSuppliesPositions()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.AllDeleteSuppliesPositions");

	AHudCDeathmatch_AllDeleteSuppliesPositions_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.CacheSpecialPositions
// (Defined, Public)

void AHudCDeathmatch::CacheSpecialPositions()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CacheSpecialPositions");

	AHudCDeathmatch_CacheSpecialPositions_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.Tick
// (Defined, Simulated, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AHudCDeathmatch::Tick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.Tick");

	AHudCDeathmatch_Tick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.CheckCountdown
// (Defined, Public)
// Parameters:
// class AGameReplicationInfo*    GRI                            (Parm)

void AHudCDeathmatch::CheckCountdown(class AGameReplicationInfo* GRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CheckCountdown");

	AHudCDeathmatch_CheckCountdown_Params params;
	params.GRI = GRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.SetCustomHUDColor
// (Defined, Public)

void AHudCDeathmatch::SetCustomHUDColor()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.SetCustomHUDColor");

	AHudCDeathmatch_SetCustomHUDColor_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.SetCustomCrosshairColors
// (Defined, Public)

void AHudCDeathmatch::SetCustomCrosshairColors()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.SetCustomCrosshairColors");

	AHudCDeathmatch_SetCustomCrosshairColors_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.SetCustomCrosshairs
// (Defined, Public)

void AHudCDeathmatch::SetCustomCrosshairs()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.SetCustomCrosshairs");

	AHudCDeathmatch_SetCustomCrosshairs_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.CustomHUDColorAllowed
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudCDeathmatch::CustomHUDColorAllowed()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CustomHUDColorAllowed");

	AHudCDeathmatch_CustomHUDColorAllowed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.CustomCrosshairColorAllowed
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudCDeathmatch::CustomCrosshairColorAllowed()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CustomCrosshairColorAllowed");

	AHudCDeathmatch_CustomCrosshairColorAllowed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.CustomCrosshairsAllowed
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudCDeathmatch::CustomCrosshairsAllowed()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CustomCrosshairsAllowed");

	AHudCDeathmatch_CustomCrosshairsAllowed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.ResetHud
// (Defined, Public)

void AHudCDeathmatch::ResetHud()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.ResetHud");

	AHudCDeathmatch_ResetHud_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.SetScoreBoardClass
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  ScoreboardClass                (Parm)
// class UClass*                  ResultBoardClass               (Parm)
// class UClass*                  ResultBoardBootyClass          (Parm)

void AHudCDeathmatch::SetScoreBoardClass(class UClass* ScoreboardClass, class UClass* ResultBoardClass, class UClass* ResultBoardBootyClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.SetScoreBoardClass");

	AHudCDeathmatch_SetScoreBoardClass_Params params;
	params.ScoreboardClass = ScoreboardClass;
	params.ResultBoardClass = ResultBoardClass;
	params.ResultBoardBootyClass = ResultBoardBootyClass;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.InitHudPart_ItemBuy
// (Defined, Public)

void AHudCDeathmatch::InitHudPart_ItemBuy()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.InitHudPart_ItemBuy");

	AHudCDeathmatch_InitHudPart_ItemBuy_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.InitHudPart_SelQuickSlot
// (Defined, Public)

void AHudCDeathmatch::InitHudPart_SelQuickSlot()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.InitHudPart_SelQuickSlot");

	AHudCDeathmatch_InitHudPart_SelQuickSlot_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.PostBeginPlay
// (Defined, Public)

void AHudCDeathmatch::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.PostBeginPlay");

	AHudCDeathmatch_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.UpdatePrecacheMaterials
// (Defined, Simulated, Public)

void AHudCDeathmatch::UpdatePrecacheMaterials()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.UpdatePrecacheMaterials");

	AHudCDeathmatch_UpdatePrecacheMaterials_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.ShowRadioMessage_Notify
// (Defined, Exec, Public)

void AHudCDeathmatch::ShowRadioMessage_Notify()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.ShowRadioMessage_Notify");

	AHudCDeathmatch_ShowRadioMessage_Notify_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.ShowRadioMessage_Alarm
// (Defined, Exec, Public)

void AHudCDeathmatch::ShowRadioMessage_Alarm()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.ShowRadioMessage_Alarm");

	AHudCDeathmatch_ShowRadioMessage_Alarm_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.ShowRadioMessage
// (Defined, Exec, Public)

void AHudCDeathmatch::ShowRadioMessage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.ShowRadioMessage");

	AHudCDeathmatch_ShowRadioMessage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.UpdateMinimapMode
// (Defined, Public)

void AHudCDeathmatch::UpdateMinimapMode()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.UpdateMinimapMode");

	AHudCDeathmatch_UpdateMinimapMode_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.ShowBigmap
// (Defined, Exec, Public)

void AHudCDeathmatch::ShowBigmap()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.ShowBigmap");

	AHudCDeathmatch_ShowBigmap_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.DrawRouteCache
// (Defined, Simulated, Public)
// Parameters:
// class AwAIBot*                 C                              (Parm)

void AHudCDeathmatch::DrawRouteCache(class AwAIBot* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.DrawRouteCache");

	AHudCDeathmatch_DrawRouteCache_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.RenderAIPaths
// (Defined, Public)

void AHudCDeathmatch::RenderAIPaths()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.RenderAIPaths");

	AHudCDeathmatch_RenderAIPaths_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.CalcArrayColor
// (Defined, Public)
// Parameters:
// float                          V                              (Parm)
// TArray<struct FColor>          carray                         (Parm, NeedCtorLink)
// struct FColor                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FColor AHudCDeathmatch::CalcArrayColor(float V, TArray<struct FColor> carray)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.CalcArrayColor");

	AHudCDeathmatch_CalcArrayColor_Params params;
	params.V = V;
	params.carray = carray;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCDeathmatch.RenderNavExtraCost
// (Defined, Public)

void AHudCDeathmatch::RenderNavExtraCost()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.RenderNavExtraCost");

	AHudCDeathmatch_RenderNavExtraCost_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.RenderVisCount
// (Defined, Public)

void AHudCDeathmatch::RenderVisCount()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.RenderVisCount");

	AHudCDeathmatch_RenderVisCount_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.RenderInfluence
// (Defined, Public)

void AHudCDeathmatch::RenderInfluence()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.RenderInfluence");

	AHudCDeathmatch_RenderInfluence_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.RenderCoverAngle
// (Defined, Public)

void AHudCDeathmatch::RenderCoverAngle()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.RenderCoverAngle");

	AHudCDeathmatch_RenderCoverAngle_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.RenderRadius
// (Defined, Public)

void AHudCDeathmatch::RenderRadius()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.RenderRadius");

	AHudCDeathmatch_RenderRadius_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.RenderSDFrontLine
// (Defined, Public)
// Parameters:
// bool                           Full                           (Parm)

void AHudCDeathmatch::RenderSDFrontLine(bool Full)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.RenderSDFrontLine");

	AHudCDeathmatch_RenderSDFrontLine_Params params;
	params.Full = Full;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.rendai
// (Defined, Exec, Public)
// Parameters:
// struct FString                 v1                             (Parm, NeedCtorLink)
// struct FString                 v2                             (Parm, NeedCtorLink)

void AHudCDeathmatch::rendai(const struct FString& v1, const struct FString& v2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.rendai");

	AHudCDeathmatch_rendai_Params params;
	params.v1 = v1;
	params.v2 = v2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.WorldSpaceOverlays
// (Defined, Simulated, Event, Public)

void AHudCDeathmatch::WorldSpaceOverlays()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.WorldSpaceOverlays");

	AHudCDeathmatch_WorldSpaceOverlays_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.ShrinkHUD
// (Defined, Exec, Public)

void AHudCDeathmatch::ShrinkHUD()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.ShrinkHUD");

	AHudCDeathmatch_ShrinkHUD_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCDeathmatch.GrowHUD
// (Defined, Exec, Public)

void AHudCDeathmatch::GrowHUD()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCDeathmatch.GrowHUD");

	AHudCDeathmatch_GrowHUD_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCTeamDeathMatch.CustomHUDColorAllowed
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHudCTeamDeathMatch::CustomHUDColorAllowed()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.CustomHUDColorAllowed");

	AHudCTeamDeathMatch_CustomHUDColorAllowed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.HudCTeamDeathMatch.UpdateHUD
// (Defined, Simulated, Public)

void AHudCTeamDeathMatch::UpdateHUD()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.UpdateHUD");

	AHudCTeamDeathMatch_UpdateHUD_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCTeamDeathMatch.updateScore
// (Defined, Public)

void AHudCTeamDeathMatch::updateScore()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.updateScore");

	AHudCTeamDeathMatch_updateScore_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCTeamDeathMatch.UpdateTeamHud
// (Defined, Simulated, Public)

void AHudCTeamDeathMatch::UpdateTeamHud()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.UpdateTeamHud");

	AHudCTeamDeathMatch_UpdateTeamHud_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCTeamDeathMatch.DrawHudPassC
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCTeamDeathMatch::DrawHudPassC(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.DrawHudPassC");

	AHudCTeamDeathMatch_DrawHudPassC_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCTeamDeathMatch.TeamScoreOffset
// (Simulated, Public)

void AHudCTeamDeathMatch::TeamScoreOffset()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.TeamScoreOffset");

	AHudCTeamDeathMatch_TeamScoreOffset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCTeamDeathMatch.ShowTeamScorePassC
// (Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCTeamDeathMatch::ShowTeamScorePassC(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.ShowTeamScorePassC");

	AHudCTeamDeathMatch_ShowTeamScorePassC_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCTeamDeathMatch.ShowVersusIcon
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCTeamDeathMatch::ShowVersusIcon(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.ShowVersusIcon");

	AHudCTeamDeathMatch_ShowVersusIcon_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCTeamDeathMatch.ShowTeamScorePassA
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCTeamDeathMatch::ShowTeamScorePassA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.ShowTeamScorePassA");

	AHudCTeamDeathMatch_ShowTeamScorePassA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCTeamDeathMatch.DrawHudPassA
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCTeamDeathMatch::DrawHudPassA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.DrawHudPassA");

	AHudCTeamDeathMatch_DrawHudPassA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCTeamDeathMatch.DrawMyScore
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCTeamDeathMatch::DrawMyScore(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.DrawMyScore");

	AHudCTeamDeathMatch_DrawMyScore_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCTeamDeathMatch.DrawTeamOverlay
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCTeamDeathMatch::DrawTeamOverlay(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.DrawTeamOverlay");

	AHudCTeamDeathMatch_DrawTeamOverlay_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCTeamDeathMatch.UpdateRankAndSpread
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCTeamDeathMatch::UpdateRankAndSpread(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.UpdateRankAndSpread");

	AHudCTeamDeathMatch_UpdateRankAndSpread_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCTeamDeathMatch.drawLinkText
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCTeamDeathMatch::drawLinkText(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.drawLinkText");

	AHudCTeamDeathMatch_drawLinkText_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCTeamDeathMatch.showLinks
// (Defined, Simulated, Public)

void AHudCTeamDeathMatch::showLinks()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.showLinks");

	AHudCTeamDeathMatch_showLinks_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCTeamDeathMatch.Tick
// (Defined, Simulated, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AHudCTeamDeathMatch::Tick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.Tick");

	AHudCTeamDeathMatch_Tick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.HudCTeamDeathMatch.DrawSpectatingHud
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AHudCTeamDeathMatch::DrawSpectatingHud(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.HudCTeamDeathMatch.DrawSpectatingHud");

	AHudCTeamDeathMatch_DrawSpectatingHud_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayBase.UpdateHelpKeyControll
// (Defined, Public)

void AwHudPart_DisplayBase::UpdateHelpKeyControll()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayBase.UpdateHelpKeyControll");

	AwHudPart_DisplayBase_UpdateHelpKeyControll_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayBase.GetEllipsString
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FString                 strText                        (Parm, NeedCtorLink)
// float                          fLimitWidth                    (Parm)
// float                          FontSize                       (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwHudPart_DisplayBase::GetEllipsString(class UCanvas* C, const struct FString& strText, float fLimitWidth, float FontSize)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayBase.GetEllipsString");

	AwHudPart_DisplayBase_GetEllipsString_Params params;
	params.C = C;
	params.strText = strText;
	params.fLimitWidth = fLimitWidth;
	params.FontSize = FontSize;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_DisplayBase.GetKeyTexture
// (Defined, Public)
// Parameters:
// struct FString                 sKey                           (Parm, NeedCtorLink)
// struct FSpriteWidget           W                              (Parm, OutParm)
// float                          fWidth                         (OptionalParm, Parm, OutParm)
// float                          OffsetX                        (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHudPart_DisplayBase::GetKeyTexture(const struct FString& sKey, float OffsetX, struct FSpriteWidget* W, float* fWidth)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayBase.GetKeyTexture");

	AwHudPart_DisplayBase_GetKeyTexture_Params params;
	params.sKey = sKey;
	params.OffsetX = OffsetX;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (W != nullptr)
		*W = params.W;
	if (fWidth != nullptr)
		*fWidth = params.fWidth;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_DisplayBase.Initialize
// (Defined, Public)
// Parameters:
// class AHudBase*                myOwner                        (Parm)
// class ALevelInfo*              Level                          (Parm)

void AwHudPart_DisplayBase::Initialize(class AHudBase* myOwner, class ALevelInfo* Level)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayBase.Initialize");

	AwHudPart_DisplayBase_Initialize_Params params;
	params.myOwner = myOwner;
	params.Level = Level;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot.DrawItemImage
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_SelectQSlot::DrawItemImage(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.DrawItemImage");

	AwHudPart_SelectQSlot_DrawItemImage_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot.CalcQuickSlotTimer
// (Defined, Public)
// Parameters:
// int                            respawnLeftTime                (Parm, OutParm)
// int                            startupLeftTime                (Parm, OutParm)

void AwHudPart_SelectQSlot::CalcQuickSlotTimer(int* respawnLeftTime, int* startupLeftTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.CalcQuickSlotTimer");

	AwHudPart_SelectQSlot_CalcQuickSlotTimer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (respawnLeftTime != nullptr)
		*respawnLeftTime = params.respawnLeftTime;
	if (startupLeftTime != nullptr)
		*startupLeftTime = params.startupLeftTime;
}


// Function XInterface.wHudPart_SelectQSlot.GetItemImage
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iItemID                        (Parm)
// struct FImage                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FImage AwHudPart_SelectQSlot::GetItemImage(class UCanvas* C, int iItemID)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.GetItemImage");

	AwHudPart_SelectQSlot_GetItemImage_Params params;
	params.C = C;
	params.iItemID = iItemID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_SelectQSlot.QuickSlotContent_SetString
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iPosX                          (Parm)
// int                            iPosY                          (Parm)
// int                            iSlot                          (Parm)
// bool                           bDefaultWeapon                 (OptionalParm, Parm)

void AwHudPart_SelectQSlot::QuickSlotContent_SetString(class UCanvas* C, int iPosX, int iPosY, int iSlot, bool bDefaultWeapon)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.QuickSlotContent_SetString");

	AwHudPart_SelectQSlot_QuickSlotContent_SetString_Params params;
	params.C = C;
	params.iPosX = iPosX;
	params.iPosY = iPosY;
	params.iSlot = iSlot;
	params.bDefaultWeapon = bDefaultWeapon;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot.DrawQuickSlotContent_List
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iPosX                          (Parm)
// int                            iPosY                          (Parm)
// int                            iSlot                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHudPart_SelectQSlot::DrawQuickSlotContent_List(class UCanvas* C, int iPosX, int iPosY, int iSlot)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.DrawQuickSlotContent_List");

	AwHudPart_SelectQSlot_DrawQuickSlotContent_List_Params params;
	params.C = C;
	params.iPosX = iPosX;
	params.iPosY = iPosY;
	params.iSlot = iSlot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_SelectQSlot.DrawQuickSlotContent_DefaultWeapon
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iPosX                          (Parm)
// int                            iPosY                          (Parm)

void AwHudPart_SelectQSlot::DrawQuickSlotContent_DefaultWeapon(class UCanvas* C, int iPosX, int iPosY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.DrawQuickSlotContent_DefaultWeapon");

	AwHudPart_SelectQSlot_DrawQuickSlotContent_DefaultWeapon_Params params;
	params.C = C;
	params.iPosX = iPosX;
	params.iPosY = iPosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot.DrawQuickSlotContent_Description
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iPosX                          (Parm)
// int                            iPosY                          (Parm)

void AwHudPart_SelectQSlot::DrawQuickSlotContent_Description(class UCanvas* C, int iPosX, int iPosY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.DrawQuickSlotContent_Description");

	AwHudPart_SelectQSlot_DrawQuickSlotContent_Description_Params params;
	params.C = C;
	params.iPosX = iPosX;
	params.iPosY = iPosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot.DrawSellectBar
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iPosX                          (Parm)
// int                            iPosY                          (Parm)
// bool                           bDefaultWeapon                 (OptionalParm, Parm)

void AwHudPart_SelectQSlot::DrawSellectBar(class UCanvas* C, int iPosX, int iPosY, bool bDefaultWeapon)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.DrawSellectBar");

	AwHudPart_SelectQSlot_DrawSellectBar_Params params;
	params.C = C;
	params.iPosX = iPosX;
	params.iPosY = iPosY;
	params.bDefaultWeapon = bDefaultWeapon;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot.DrawQuickSlotName
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iPosX                          (Parm)
// int                            iPosY                          (Parm)
// int                            iSlot                          (Parm)
// bool                           bDefaultWeapon                 (OptionalParm, Parm)
// bool                           bHasItem                       (OptionalParm, Parm)

void AwHudPart_SelectQSlot::DrawQuickSlotName(class UCanvas* C, int iPosX, int iPosY, int iSlot, bool bDefaultWeapon, bool bHasItem)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.DrawQuickSlotName");

	AwHudPart_SelectQSlot_DrawQuickSlotName_Params params;
	params.C = C;
	params.iPosX = iPosX;
	params.iPosY = iPosY;
	params.iSlot = iSlot;
	params.bDefaultWeapon = bDefaultWeapon;
	params.bHasItem = bHasItem;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot.DrawQuickSlot
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_SelectQSlot::DrawQuickSlot(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.DrawQuickSlot");

	AwHudPart_SelectQSlot_DrawQuickSlot_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot.DrawSelectQSlot
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_SelectQSlot::DrawSelectQSlot(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.DrawSelectQSlot");

	AwHudPart_SelectQSlot_DrawSelectQSlot_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot.DrawA
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_SelectQSlot::DrawA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.DrawA");

	AwHudPart_SelectQSlot_DrawA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot.UpdateHelpKeyControll
// (Defined, Public)

void AwHudPart_SelectQSlot::UpdateHelpKeyControll()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.UpdateHelpKeyControll");

	AwHudPart_SelectQSlot_UpdateHelpKeyControll_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot.CallEvent
// (Defined, Public)
// Parameters:
// bool                           ItemCheck                      (OptionalParm, Parm)
// int                            iReservation1                  (OptionalParm, Parm)
// int                            iReservation2                  (OptionalParm, Parm)

void AwHudPart_SelectQSlot::CallEvent(bool ItemCheck, int iReservation1, int iReservation2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.CallEvent");

	AwHudPart_SelectQSlot_CallEvent_Params params;
	params.ItemCheck = ItemCheck;
	params.iReservation1 = iReservation1;
	params.iReservation2 = iReservation2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot.CallSelectQuickSlot
// (Defined, Public)
// Parameters:
// int                            iIndex                         (Parm)

void AwHudPart_SelectQSlot::CallSelectQuickSlot(int iIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.CallSelectQuickSlot");

	AwHudPart_SelectQSlot_CallSelectQuickSlot_Params params;
	params.iIndex = iIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot.ToggleQuickSlotWindow
// (Defined, Public)

void AwHudPart_SelectQSlot::ToggleQuickSlotWindow()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.ToggleQuickSlotWindow");

	AwHudPart_SelectQSlot_ToggleQuickSlotWindow_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot.EndQuickSlotWindow
// (Defined, Public)

void AwHudPart_SelectQSlot::EndQuickSlotWindow()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.EndQuickSlotWindow");

	AwHudPart_SelectQSlot_EndQuickSlotWindow_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot.BeginQuickSlotWindow
// (Defined, Public)

void AwHudPart_SelectQSlot::BeginQuickSlotWindow()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.BeginQuickSlotWindow");

	AwHudPart_SelectQSlot_BeginQuickSlotWindow_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot.Initialize
// (Defined, Public)
// Parameters:
// class AHudBase*                myOwner                        (Parm)
// class ALevelInfo*              _level                         (Parm)

void AwHudPart_SelectQSlot::Initialize(class AHudBase* myOwner, class ALevelInfo* _level)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot.Initialize");

	AwHudPart_SelectQSlot_Initialize_Params params;
	params.myOwner = myOwner;
	params._level = _level;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.DrawDefenceIcon
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class AwPawn*                  P                              (Parm)
// float                          minimapX                       (Parm)
// float                          minimapY                       (Parm)
// bool                           bDefenceBoss                   (Parm)

void AwHudPart_MinimapBase::DrawDefenceIcon(class UCanvas* C, class AwPawn* P, float minimapX, float minimapY, bool bDefenceBoss)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.DrawDefenceIcon");

	AwHudPart_MinimapBase_DrawDefenceIcon_Params params;
	params.C = C;
	params.P = P;
	params.minimapX = minimapX;
	params.minimapY = minimapY;
	params.bDefenceBoss = bDefenceBoss;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Enemies_Defence
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapBase::DrawMinimap_Enemies_Defence(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.DrawMinimap_Enemies_Defence");

	AwHudPart_MinimapBase_DrawMinimap_Enemies_Defence_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.Draw
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapBase::Draw(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.Draw");

	AwHudPart_MinimapBase_Draw_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.OnPreDrawMyself
// (Public, Delegate)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapBase::OnPreDrawMyself(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.OnPreDrawMyself");

	AwHudPart_MinimapBase_OnPreDrawMyself_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.DrawMinimap_SpecialPositions
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapBase::DrawMinimap_SpecialPositions(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.DrawMinimap_SpecialPositions");

	AwHudPart_MinimapBase_DrawMinimap_SpecialPositions_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Mission
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapBase::DrawMinimap_Mission(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.DrawMinimap_Mission");

	AwHudPart_MinimapBase_DrawMinimap_Mission_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Airstrike
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapBase::DrawMinimap_Airstrike(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.DrawMinimap_Airstrike");

	AwHudPart_MinimapBase_DrawMinimap_Airstrike_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Helicopter
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapBase::DrawMinimap_Helicopter(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.DrawMinimap_Helicopter");

	AwHudPart_MinimapBase_DrawMinimap_Helicopter_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Deads
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapBase::DrawMinimap_Deads(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.DrawMinimap_Deads");

	AwHudPart_MinimapBase_DrawMinimap_Deads_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Enemies
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapBase::DrawMinimap_Enemies(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.DrawMinimap_Enemies");

	AwHudPart_MinimapBase_DrawMinimap_Enemies_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.IsEnemyInRange
// (Defined, Public)
// Parameters:
// struct FVector                 loc                            (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHudPart_MinimapBase::IsEnemyInRange(const struct FVector& loc)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.IsEnemyInRange");

	AwHudPart_MinimapBase_IsEnemyInRange_Params params;
	params.loc = loc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Allies
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapBase::DrawMinimap_Allies(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.DrawMinimap_Allies");

	AwHudPart_MinimapBase_DrawMinimap_Allies_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.IsSameTeamByIndex
// (Defined, Public)
// Parameters:
// int                            Team1                          (Parm)
// int                            Team2                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHudPart_MinimapBase::IsSameTeamByIndex(int Team1, int Team2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.IsSameTeamByIndex");

	AwHudPart_MinimapBase_IsSameTeamByIndex_Params params;
	params.Team1 = Team1;
	params.Team2 = Team2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_MinimapBase.IsSameTeamByPRI
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  pri1                           (Parm)
// class APlayerReplicationInfo*  pri2                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHudPart_MinimapBase::IsSameTeamByPRI(class APlayerReplicationInfo* pri1, class APlayerReplicationInfo* pri2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.IsSameTeamByPRI");

	AwHudPart_MinimapBase_IsSameTeamByPRI_Params params;
	params.pri1 = pri1;
	params.pri2 = pri2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_MinimapBase.PushDeadOnMinimap
// (Defined, Public)
// Parameters:
// int                            TeamIndex                      (Parm)
// struct FVector                 Location                       (Parm)

void AwHudPart_MinimapBase::PushDeadOnMinimap(int TeamIndex, const struct FVector& Location)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.PushDeadOnMinimap");

	AwHudPart_MinimapBase_PushDeadOnMinimap_Params params;
	params.TeamIndex = TeamIndex;
	params.Location = Location;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.CalcMinimapRotation
// (Defined, Public)
// Parameters:
// struct FRotator                Rotation                       (Parm)
// struct FRotator                outRotation                    (Parm, OutParm)

void AwHudPart_MinimapBase::CalcMinimapRotation(const struct FRotator& Rotation, struct FRotator* outRotation)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.CalcMinimapRotation");

	AwHudPart_MinimapBase_CalcMinimapRotation_Params params;
	params.Rotation = Rotation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (outRotation != nullptr)
		*outRotation = params.outRotation;
}


// Function XInterface.wHudPart_MinimapBase.SetupMinimapSpriteWidgetForDrawing
// (Defined, Public)
// Parameters:
// struct FSpriteWidget           Sprite                         (Parm, OutParm)
// struct FRotator                Rotation                       (Parm)
// float                          minimapX                       (Parm)
// float                          minimapY                       (Parm)

void AwHudPart_MinimapBase::SetupMinimapSpriteWidgetForDrawing(const struct FRotator& Rotation, float minimapX, float minimapY, struct FSpriteWidget* Sprite)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.SetupMinimapSpriteWidgetForDrawing");

	AwHudPart_MinimapBase_SetupMinimapSpriteWidgetForDrawing_Params params;
	params.Rotation = Rotation;
	params.minimapX = minimapX;
	params.minimapY = minimapY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Sprite != nullptr)
		*Sprite = params.Sprite;
}


// Function XInterface.wHudPart_MinimapBase.ClampMinimapPosition
// (Defined, Public)
// Parameters:
// float                          X                              (Parm, OutParm)
// float                          Y                              (Parm, OutParm)
// float                          W                              (OptionalParm, Parm)
// float                          H                              (OptionalParm, Parm)

void AwHudPart_MinimapBase::ClampMinimapPosition(float W, float H, float* X, float* Y)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.ClampMinimapPosition");

	AwHudPart_MinimapBase_ClampMinimapPosition_Params params;
	params.W = W;
	params.H = H;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (X != nullptr)
		*X = params.X;
	if (Y != nullptr)
		*Y = params.Y;
}


// Function XInterface.wHudPart_MinimapBase.IsWithinMinimapArea
// (Defined, Public)
// Parameters:
// float                          X                              (Parm)
// float                          Y                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHudPart_MinimapBase::IsWithinMinimapArea(float X, float Y)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.IsWithinMinimapArea");

	AwHudPart_MinimapBase_IsWithinMinimapArea_Params params;
	params.X = X;
	params.Y = Y;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_MinimapBase.CalculateTexturePositionFromMinimapPosition
// (Defined, Public)
// Parameters:
// float                          minimapX                       (Parm)
// float                          minimapY                       (Parm)
// int                            TX                             (Parm, OutParm)
// int                            ty                             (Parm, OutParm)

void AwHudPart_MinimapBase::CalculateTexturePositionFromMinimapPosition(float minimapX, float minimapY, int* TX, int* ty)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.CalculateTexturePositionFromMinimapPosition");

	AwHudPart_MinimapBase_CalculateTexturePositionFromMinimapPosition_Params params;
	params.minimapX = minimapX;
	params.minimapY = minimapY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (TX != nullptr)
		*TX = params.TX;
	if (ty != nullptr)
		*ty = params.ty;
}


// Function XInterface.wHudPart_MinimapBase.CalculateMinimapPosition
// (Defined, Public)
// Parameters:
// struct FVector                 centerLoc                      (Parm)
// struct FRotator                centerRotation                 (Parm)
// struct FVector                 TargetLoc                      (Parm)
// float                          minimapX                       (Parm, OutParm)
// float                          minimapY                       (Parm, OutParm)

void AwHudPart_MinimapBase::CalculateMinimapPosition(const struct FVector& centerLoc, const struct FRotator& centerRotation, const struct FVector& TargetLoc, float* minimapX, float* minimapY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.CalculateMinimapPosition");

	AwHudPart_MinimapBase_CalculateMinimapPosition_Params params;
	params.centerLoc = centerLoc;
	params.centerRotation = centerRotation;
	params.TargetLoc = TargetLoc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (minimapX != nullptr)
		*minimapX = params.minimapX;
	if (minimapY != nullptr)
		*minimapY = params.minimapY;
}


// Function XInterface.wHudPart_MinimapBase.CalculateMinimapPositionPawnCentering
// (Defined, Public)
// Parameters:
// class APawn*                   centerPawn                     (Parm)
// struct FVector                 TargetLoc                      (Parm)
// float                          minimapX                       (Parm, OutParm)
// float                          minimapY                       (Parm, OutParm)

void AwHudPart_MinimapBase::CalculateMinimapPositionPawnCentering(class APawn* centerPawn, const struct FVector& TargetLoc, float* minimapX, float* minimapY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.CalculateMinimapPositionPawnCentering");

	AwHudPart_MinimapBase_CalculateMinimapPositionPawnCentering_Params params;
	params.centerPawn = centerPawn;
	params.TargetLoc = TargetLoc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (minimapX != nullptr)
		*minimapX = params.minimapX;
	if (minimapY != nullptr)
		*minimapY = params.minimapY;
}


// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Myself
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapBase::DrawMinimap_Myself(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.DrawMinimap_Myself");

	AwHudPart_MinimapBase_DrawMinimap_Myself_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.getSelfIconScale
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwHudPart_MinimapBase::getSelfIconScale()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.getSelfIconScale");

	AwHudPart_MinimapBase_getSelfIconScale_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Compass
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapBase::DrawMinimap_Compass(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.DrawMinimap_Compass");

	AwHudPart_MinimapBase_DrawMinimap_Compass_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Frame
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapBase::DrawMinimap_Frame(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.DrawMinimap_Frame");

	AwHudPart_MinimapBase_DrawMinimap_Frame_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.DrawMinimap_BGMapUAV
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapBase::DrawMinimap_BGMapUAV(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.DrawMinimap_BGMapUAV");

	AwHudPart_MinimapBase_DrawMinimap_BGMapUAV_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.SetupBGMapUAV
// (Defined, Public)

void AwHudPart_MinimapBase::SetupBGMapUAV()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.SetupBGMapUAV");

	AwHudPart_MinimapBase_SetupBGMapUAV_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.DrawMinimap_BGMap
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapBase::DrawMinimap_BGMap(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.DrawMinimap_BGMap");

	AwHudPart_MinimapBase_DrawMinimap_BGMap_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.MapMinimapTextureLocationToWorldLocation
// (Defined, Public)
// Parameters:
// int                            TX                             (Parm)
// int                            ty                             (Parm)
// struct FVector                 Location                       (Parm, OutParm)

void AwHudPart_MinimapBase::MapMinimapTextureLocationToWorldLocation(int TX, int ty, struct FVector* Location)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.MapMinimapTextureLocationToWorldLocation");

	AwHudPart_MinimapBase_MapMinimapTextureLocationToWorldLocation_Params params;
	params.TX = TX;
	params.ty = ty;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Location != nullptr)
		*Location = params.Location;
}


// Function XInterface.wHudPart_MinimapBase.MapWorldLocationToMinimapTextureLocation
// (Defined, Public)
// Parameters:
// struct FVector                 Location                       (Parm)
// int                            cX                             (Parm, OutParm)
// int                            cY                             (Parm, OutParm)

void AwHudPart_MinimapBase::MapWorldLocationToMinimapTextureLocation(const struct FVector& Location, int* cX, int* cY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.MapWorldLocationToMinimapTextureLocation");

	AwHudPart_MinimapBase_MapWorldLocationToMinimapTextureLocation_Params params;
	params.Location = Location;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (cX != nullptr)
		*cX = params.cX;
	if (cY != nullptr)
		*cY = params.cY;
}


// Function XInterface.wHudPart_MinimapBase.DrawMinimap_NorthPole
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapBase::DrawMinimap_NorthPole(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.DrawMinimap_NorthPole");

	AwHudPart_MinimapBase_DrawMinimap_NorthPole_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.RemoveSpecialPositions
// (Defined, Public)
// Parameters:
// class AActor*                  act                            (Parm)

void AwHudPart_MinimapBase::RemoveSpecialPositions(class AActor* act)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.RemoveSpecialPositions");

	AwHudPart_MinimapBase_RemoveSpecialPositions_Params params;
	params.act = act;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.CacheSpecialPositions
// (Defined, Public)

void AwHudPart_MinimapBase::CacheSpecialPositions()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.CacheSpecialPositions");

	AwHudPart_MinimapBase_CacheSpecialPositions_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.Timer
// (Defined, Public)

void AwHudPart_MinimapBase::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.Timer");

	AwHudPart_MinimapBase_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.InitializeCoords
// (Defined, Public)

void AwHudPart_MinimapBase::InitializeCoords()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.InitializeCoords");

	AwHudPart_MinimapBase_InitializeCoords_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_MinimapBase.GetPivotCoords
// (Defined, Public)
// Parameters:
// struct FVector                 it1                            (Parm, OutParm)
// struct FVector                 iw1                            (Parm, OutParm)
// struct FVector                 it2                            (Parm, OutParm)
// struct FVector                 iw2                            (Parm, OutParm)

void AwHudPart_MinimapBase::GetPivotCoords(struct FVector* it1, struct FVector* iw1, struct FVector* it2, struct FVector* iw2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.GetPivotCoords");

	AwHudPart_MinimapBase_GetPivotCoords_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (it1 != nullptr)
		*it1 = params.it1;
	if (iw1 != nullptr)
		*iw1 = params.iw1;
	if (it2 != nullptr)
		*it2 = params.it2;
	if (iw2 != nullptr)
		*iw2 = params.iw2;
}


// Function XInterface.wHudPart_MinimapBase.Initialize
// (Defined, Public)
// Parameters:
// class AHudBase*                myOwner                        (Parm)
// class ALevelInfo*              myLevel                        (Parm)

void AwHudPart_MinimapBase::Initialize(class AHudBase* myOwner, class ALevelInfo* myLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_MinimapBase.Initialize");

	AwHudPart_MinimapBase_Initialize_Params params;
	params.myOwner = myOwner;
	params.myLevel = myLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoard.GetEllipsString
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FString                 strText                        (Parm, NeedCtorLink)
// float                          fLimitWidth                    (Parm)
// float                          FontSize                       (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AxScoreBoard::GetEllipsString(class UCanvas* C, const struct FString& strText, float fLimitWidth, float FontSize)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoard.GetEllipsString");

	AxScoreBoard_GetEllipsString_Params params;
	params.C = C;
	params.strText = strText;
	params.fLimitWidth = fLimitWidth;
	params.FontSize = FontSize;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.xScoreBoard.CalculateCoordinateDigit
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FDigitSet               W                              (Parm)
// struct FNumericWidget          N                              (Parm)
// float                          fWidth                         (Parm)
// float                          fHeight                        (Parm)
// int                            Index                          (Parm)
// struct FCalCoordsW             coordsW                        (Parm, OutParm)

void AxScoreBoard::CalculateCoordinateDigit(class UCanvas* C, const struct FDigitSet& W, const struct FNumericWidget& N, float fWidth, float fHeight, int Index, struct FCalCoordsW* coordsW)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoard.CalculateCoordinateDigit");

	AxScoreBoard_CalculateCoordinateDigit_Params params;
	params.C = C;
	params.W = W;
	params.N = N;
	params.fWidth = fWidth;
	params.fHeight = fHeight;
	params.Index = Index;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (coordsW != nullptr)
		*coordsW = params.coordsW;
}


// Function XInterface.xScoreBoard.CalculateCoordinate
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FSpriteWidget           W                              (Parm)
// float                          fWidth                         (Parm)
// float                          fHeight                        (Parm)
// struct FCalCoordsW             coordsW                        (Parm, OutParm)

void AxScoreBoard::CalculateCoordinate(class UCanvas* C, const struct FSpriteWidget& W, float fWidth, float fHeight, struct FCalCoordsW* coordsW)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoard.CalculateCoordinate");

	AxScoreBoard_CalculateCoordinate_Params params;
	params.C = C;
	params.W = W;
	params.fWidth = fWidth;
	params.fHeight = fHeight;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (coordsW != nullptr)
		*coordsW = params.coordsW;
}


// Function XInterface.xScoreBoardTeamGame.UpdateScoreBoard
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)

void AxScoreBoardTeamGame::UpdateScoreBoard(class UCanvas* Canvas)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.UpdateScoreBoard");

	AxScoreBoardTeamGame_UpdateScoreBoard_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawMiniMap
// (Defined, Simulated, Event, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGame::DrawMiniMap(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawMiniMap");

	AxScoreBoardTeamGame_DrawMiniMap_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawScoreboard
// (Defined, Simulated, Event, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGame::DrawScoreboard(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawScoreboard");

	AxScoreBoardTeamGame_DrawScoreboard_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawGMTeamListSection
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            lpTeam                         (Parm)
// class APlayerReplicationInfo*  currPRI                        (Parm)
// int                            memberCount                    (Parm)
// float                          beginX                         (Parm)
// float                          beginY                         (Parm)

void AxScoreBoardTeamGame::DrawGMTeamListSection(class UCanvas* C, int lpTeam, class APlayerReplicationInfo* currPRI, int memberCount, float beginX, float beginY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawGMTeamListSection");

	AxScoreBoardTeamGame_DrawGMTeamListSection_Params params;
	params.C = C;
	params.lpTeam = lpTeam;
	params.currPRI = currPRI;
	params.memberCount = memberCount;
	params.beginX = beginX;
	params.beginY = beginY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawGMUserBoard
// (Defined, Simulated, Event, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGame::DrawGMUserBoard(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawGMUserBoard");

	AxScoreBoardTeamGame_DrawGMUserBoard_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawTeamListBG_Mission
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGame::DrawTeamListBG_Mission(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawTeamListBG_Mission");

	AxScoreBoardTeamGame_DrawTeamListBG_Mission_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawTeamListBG_Tut
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGame::DrawTeamListBG_Tut(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawTeamListBG_Tut");

	AxScoreBoardTeamGame_DrawTeamListBG_Tut_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawTeamListBG_FFA
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGame::DrawTeamListBG_FFA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawTeamListBG_FFA");

	AxScoreBoardTeamGame_DrawTeamListBG_FFA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawTeamBG
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGame::DrawTeamBG(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawTeamBG");

	AxScoreBoardTeamGame_DrawTeamBG_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawMap
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGame::DrawMap(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawMap");

	AxScoreBoardTeamGame_DrawMap_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawMapName
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGame::DrawMapName(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawMapName");

	AxScoreBoardTeamGame_DrawMapName_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.MissonComment
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          X1                             (Parm)
// float                          Y1                             (Parm)
// float                          X2                             (Parm)
// float                          Y2                             (Parm)
// struct FString                 MN                             (Parm, NeedCtorLink)

void AxScoreBoardTeamGame::MissonComment(class UCanvas* C, float X1, float Y1, float X2, float Y2, const struct FString& MN)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.MissonComment");

	AxScoreBoardTeamGame_MissonComment_Params params;
	params.C = C;
	params.X1 = X1;
	params.Y1 = Y1;
	params.X2 = X2;
	params.Y2 = Y2;
	params.MN = MN;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.GetStringGoalScore
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AxScoreBoardTeamGame::GetStringGoalScore()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.GetStringGoalScore");

	AxScoreBoardTeamGame_GetStringGoalScore_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.xScoreBoardTeamGame.DrawMissonComment
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGame::DrawMissonComment(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawMissonComment");

	AxScoreBoardTeamGame_DrawMissonComment_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.GetStringPlayMode
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AxScoreBoardTeamGame::GetStringPlayMode()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.GetStringPlayMode");

	AxScoreBoardTeamGame_GetStringPlayMode_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.xScoreBoardTeamGame.SetMissionInfo
// (Defined, Public)

void AxScoreBoardTeamGame::SetMissionInfo()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.SetMissionInfo");

	AxScoreBoardTeamGame_SetMissionInfo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawTeamScoreAndTimer
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            _iPosX                         (Parm)
// int                            _iPosY                         (Parm)

void AxScoreBoardTeamGame::DrawTeamScoreAndTimer(class UCanvas* C, int _iPosX, int _iPosY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawTeamScoreAndTimer");

	AxScoreBoardTeamGame_DrawTeamScoreAndTimer_Params params;
	params.C = C;
	params._iPosX = _iPosX;
	params._iPosY = _iPosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawRankingInfo_Text
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APlayerReplicationInfo*  currPRI                        (Parm)
// float                          _iPosX                         (Parm)
// float                          _iPosY                         (Parm)
// struct FColor                  FontColor                      (Parm)

void AxScoreBoardTeamGame::DrawRankingInfo_Text(class UCanvas* C, class APlayerReplicationInfo* currPRI, float _iPosX, float _iPosY, const struct FColor& FontColor)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawRankingInfo_Text");

	AxScoreBoardTeamGame_DrawRankingInfo_Text_Params params;
	params.C = C;
	params.currPRI = currPRI;
	params._iPosX = _iPosX;
	params._iPosY = _iPosY;
	params.FontColor = FontColor;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawRankingInfo_Mark
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APlayerReplicationInfo*  currPRI                        (Parm)
// float                          _iPosX                         (Parm)
// float                          _iPosY                         (Parm)

void AxScoreBoardTeamGame::DrawRankingInfo_Mark(class UCanvas* C, class APlayerReplicationInfo* currPRI, float _iPosX, float _iPosY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawRankingInfo_Mark");

	AxScoreBoardTeamGame_DrawRankingInfo_Mark_Params params;
	params.C = C;
	params.currPRI = currPRI;
	params._iPosX = _iPosX;
	params._iPosY = _iPosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawRankingInfo
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APlayerReplicationInfo*  currPRI                        (Parm)
// float                          _iPosX                         (Parm)
// float                          _iPosY                         (Parm)

void AxScoreBoardTeamGame::DrawRankingInfo(class UCanvas* C, class APlayerReplicationInfo* currPRI, float _iPosX, float _iPosY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawRankingInfo");

	AxScoreBoardTeamGame_DrawRankingInfo_Params params;
	params.C = C;
	params.currPRI = currPRI;
	params._iPosX = _iPosX;
	params._iPosY = _iPosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawFFAScore
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          _iPosX                         (Parm)
// float                          _iPosY                         (Parm)

void AxScoreBoardTeamGame::DrawFFAScore(class UCanvas* C, float _iPosX, float _iPosY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawFFAScore");

	AxScoreBoardTeamGame_DrawFFAScore_Params params;
	params.C = C;
	params._iPosX = _iPosX;
	params._iPosY = _iPosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawGameInfo
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGame::DrawGameInfo(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawGameInfo");

	AxScoreBoardTeamGame_DrawGameInfo_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.RankingSorting
// (Defined, Public)
// Parameters:
// TArray<class APlayerReplicationInfo*> pris                           (Parm, OutParm, NeedCtorLink)
// int                            iCurrent                       (Parm)
// int                            iNext                          (Parm)

void AxScoreBoardTeamGame::RankingSorting(int iCurrent, int iNext, TArray<class APlayerReplicationInfo*>* pris)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.RankingSorting");

	AxScoreBoardTeamGame_RankingSorting_Params params;
	params.iCurrent = iCurrent;
	params.iNext = iNext;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (pris != nullptr)
		*pris = params.pris;
}


// Function XInterface.xScoreBoardTeamGame.DrawTeamListSection
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGame::DrawTeamListSection(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawTeamListSection");

	AxScoreBoardTeamGame_DrawTeamListSection_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawPersonListSection_C
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            lpTeam                         (Parm)
// class APlayerReplicationInfo*  currPRI                        (Parm)
// int                            memberCount                    (Parm)
// struct FString                 HostName                       (Parm, NeedCtorLink)
// float                          beginY                         (Parm)
// float                          markBeginY                     (Parm)
// float                          markPingY                      (Parm)

void AxScoreBoardTeamGame::DrawPersonListSection_C(class UCanvas* C, int lpTeam, class APlayerReplicationInfo* currPRI, int memberCount, const struct FString& HostName, float beginY, float markBeginY, float markPingY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawPersonListSection_C");

	AxScoreBoardTeamGame_DrawPersonListSection_C_Params params;
	params.C = C;
	params.lpTeam = lpTeam;
	params.currPRI = currPRI;
	params.memberCount = memberCount;
	params.HostName = HostName;
	params.beginY = beginY;
	params.markBeginY = markBeginY;
	params.markPingY = markPingY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawTeamListSection_C
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            lpTeam                         (Parm)
// class APlayerReplicationInfo*  currPRI                        (Parm)
// int                            memberCount                    (Parm)
// struct FString                 HostName                       (Parm, NeedCtorLink)
// float                          beginY                         (Parm)
// float                          markBeginY                     (Parm)
// float                          markPingY                      (Parm)

void AxScoreBoardTeamGame::DrawTeamListSection_C(class UCanvas* C, int lpTeam, class APlayerReplicationInfo* currPRI, int memberCount, const struct FString& HostName, float beginY, float markBeginY, float markPingY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawTeamListSection_C");

	AxScoreBoardTeamGame_DrawTeamListSection_C_Params params;
	params.C = C;
	params.lpTeam = lpTeam;
	params.currPRI = currPRI;
	params.memberCount = memberCount;
	params.HostName = HostName;
	params.beginY = beginY;
	params.markBeginY = markBeginY;
	params.markPingY = markPingY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawTeamListSectionStripe
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          OffsetY                        (Parm)
// int                            iTeamUserMax                   (Parm)

void AxScoreBoardTeamGame::DrawTeamListSectionStripe(class UCanvas* C, float OffsetY, int iTeamUserMax)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawTeamListSectionStripe");

	AxScoreBoardTeamGame_DrawTeamListSectionStripe_Params params;
	params.C = C;
	params.OffsetY = OffsetY;
	params.iTeamUserMax = iTeamUserMax;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawTime
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGame::DrawTime(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawTime");

	AxScoreBoardTeamGame_DrawTime_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawTextTeamScore
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          _OffSetX                       (Parm)
// float                          _OffSetY                       (Parm)

void AxScoreBoardTeamGame::DrawTextTeamScore(class UCanvas* C, float _OffSetX, float _OffSetY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawTextTeamScore");

	AxScoreBoardTeamGame_DrawTextTeamScore_Params params;
	params.C = C;
	params._OffSetX = _OffSetX;
	params._OffSetY = _OffSetY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawContentDescriptionTeam
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          _OffSetX                       (Parm)
// float                          _OffSetY                       (Parm)

void AxScoreBoardTeamGame::DrawContentDescriptionTeam(class UCanvas* C, float _OffSetX, float _OffSetY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawContentDescriptionTeam");

	AxScoreBoardTeamGame_DrawContentDescriptionTeam_Params params;
	params.C = C;
	params._OffSetX = _OffSetX;
	params._OffSetY = _OffSetY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawContentDescription
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          _OffSetX                       (Parm)
// float                          _OffSetY                       (Parm)

void AxScoreBoardTeamGame::DrawContentDescription(class UCanvas* C, float _OffSetX, float _OffSetY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawContentDescription");

	AxScoreBoardTeamGame_DrawContentDescription_Params params;
	params.C = C;
	params._OffSetX = _OffSetX;
	params._OffSetY = _OffSetY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawBGS
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGame::DrawBGS(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawBGS");

	AxScoreBoardTeamGame_DrawBGS_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.SetAttackingTeam
// (Defined, Public)
// Parameters:
// int                            Index                          (Parm)

void AxScoreBoardTeamGame::SetAttackingTeam(int Index)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.SetAttackingTeam");

	AxScoreBoardTeamGame_SetAttackingTeam_Params params;
	params.Index = Index;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.DrawMinimap_GameMode
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGame::DrawMinimap_GameMode(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.DrawMinimap_GameMode");

	AxScoreBoardTeamGame_DrawMinimap_GameMode_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.PostBeginPlay
// (Defined, Public)

void AxScoreBoardTeamGame::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.PostBeginPlay");

	AxScoreBoardTeamGame_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGame.GetHudBaseOwner
// (Defined, Public)
// Parameters:
// class AHudBase*                ReturnValue                    (Parm, OutParm, ReturnParm)

class AHudBase* AxScoreBoardTeamGame::GetHudBaseOwner()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGame.GetHudBaseOwner");

	AxScoreBoardTeamGame_GetHudBaseOwner_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.ScoreBoardDeathMatch.DrawNetInfo
// (Defined, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// int                            FontReduction                  (Parm)
// int                            HeaderOffsetY                  (Parm)
// int                            PlayerBoxSizeY                 (Parm)
// int                            BoxSpaceY                      (Parm)
// int                            BoxTextOffsetY                 (Parm)
// int                            OwnerOffset                    (Parm)
// int                            PlayerCount                    (Parm)
// int                            NetXPos                        (Parm)

void AScoreBoardDeathMatch::DrawNetInfo(class UCanvas* Canvas, int FontReduction, int HeaderOffsetY, int PlayerBoxSizeY, int BoxSpaceY, int BoxTextOffsetY, int OwnerOffset, int PlayerCount, int NetXPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ScoreBoardDeathMatch.DrawNetInfo");

	AScoreBoardDeathMatch_DrawNetInfo_Params params;
	params.Canvas = Canvas;
	params.FontReduction = FontReduction;
	params.HeaderOffsetY = HeaderOffsetY;
	params.PlayerBoxSizeY = PlayerBoxSizeY;
	params.BoxSpaceY = BoxSpaceY;
	params.BoxTextOffsetY = BoxTextOffsetY;
	params.OwnerOffset = OwnerOffset;
	params.PlayerCount = PlayerCount;
	params.NetXPos = NetXPos;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ScoreBoardDeathMatch.DrawMatchID
// (Defined, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// int                            FontReduction                  (Parm)

void AScoreBoardDeathMatch::DrawMatchID(class UCanvas* Canvas, int FontReduction)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ScoreBoardDeathMatch.DrawMatchID");

	AScoreBoardDeathMatch_DrawMatchID_Params params;
	params.Canvas = Canvas;
	params.FontReduction = FontReduction;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ScoreBoardDeathMatch.UpdateScoreBoard
// (Defined, Simulated, Event, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)

void AScoreBoardDeathMatch::UpdateScoreBoard(class UCanvas* Canvas)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ScoreBoardDeathMatch.UpdateScoreBoard");

	AScoreBoardDeathMatch_UpdateScoreBoard_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ScoreBoardDeathMatch.ExtraMarking
// (Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// int                            PlayerCount                    (Parm)
// int                            OwnerOffset                    (Parm)
// int                            XPos                           (Parm)
// int                            YPos                           (Parm)
// int                            YOffset                        (Parm)

void AScoreBoardDeathMatch::ExtraMarking(class UCanvas* Canvas, int PlayerCount, int OwnerOffset, int XPos, int YPos, int YOffset)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ScoreBoardDeathMatch.ExtraMarking");

	AScoreBoardDeathMatch_ExtraMarking_Params params;
	params.Canvas = Canvas;
	params.PlayerCount = PlayerCount;
	params.OwnerOffset = OwnerOffset;
	params.XPos = XPos;
	params.YPos = YPos;
	params.YOffset = YOffset;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ScoreBoardDeathMatch.GetDefaultScoreInfoString
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AScoreBoardDeathMatch::GetDefaultScoreInfoString()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ScoreBoardDeathMatch.GetDefaultScoreInfoString");

	AScoreBoardDeathMatch_GetDefaultScoreInfoString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.ScoreBoardDeathMatch.GetRestartString
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AScoreBoardDeathMatch::GetRestartString()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ScoreBoardDeathMatch.GetRestartString");

	AScoreBoardDeathMatch_GetRestartString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.ScoreBoardDeathMatch.GetTitleString
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AScoreBoardDeathMatch::GetTitleString()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ScoreBoardDeathMatch.GetTitleString");

	AScoreBoardDeathMatch_GetTitleString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.ScoreBoardDeathMatch.DrawTitle
// (Defined, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          HeaderOffsetY                  (Parm)
// float                          PlayerAreaY                    (Parm)
// float                          PlayerBoxSizeY                 (Parm)

void AScoreBoardDeathMatch::DrawTitle(class UCanvas* Canvas, float HeaderOffsetY, float PlayerAreaY, float PlayerBoxSizeY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ScoreBoardDeathMatch.DrawTitle");

	AScoreBoardDeathMatch_DrawTitle_Params params;
	params.Canvas = Canvas;
	params.HeaderOffsetY = HeaderOffsetY;
	params.PlayerAreaY = PlayerAreaY;
	params.PlayerBoxSizeY = PlayerBoxSizeY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ScoreBoardDeathMatch.UpdatePrecacheFonts
// (Public)

void AScoreBoardDeathMatch::UpdatePrecacheFonts()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ScoreBoardDeathMatch.UpdatePrecacheFonts");

	AScoreBoardDeathMatch_UpdatePrecacheFonts_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ScoreBoardDeathMatch.UpdatePrecacheMaterials
// (Defined, Simulated, Public)

void AScoreBoardDeathMatch::UpdatePrecacheMaterials()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ScoreBoardDeathMatch.UpdatePrecacheMaterials");

	AScoreBoardDeathMatch_UpdatePrecacheMaterials_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.DrawQuestComplete
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Tutorial::DrawQuestComplete(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.DrawQuestComplete");

	AwHudPart_Tutorial_DrawQuestComplete_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.DrawQuest
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Tutorial::DrawQuest(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.DrawQuest");

	AwHudPart_Tutorial_DrawQuest_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.DrawSpectatingHud
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Tutorial::DrawSpectatingHud(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.DrawSpectatingHud");

	AwHudPart_Tutorial_DrawSpectatingHud_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.DrawHudPassA
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Tutorial::DrawHudPassA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.DrawHudPassA");

	AwHudPart_Tutorial_DrawHudPassA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.UpdateHelpKeyControll
// (Defined, Public)

void AwHudPart_Tutorial::UpdateHelpKeyControll()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.UpdateHelpKeyControll");

	AwHudPart_Tutorial_UpdateHelpKeyControll_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.Initialize
// (Defined, Public)
// Parameters:
// class AHudBase*                myOwner                        (Parm)
// class ALevelInfo*              Level                          (Parm)

void AwHudPart_Tutorial::Initialize(class AHudBase* myOwner, class ALevelInfo* Level)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.Initialize");

	AwHudPart_Tutorial_Initialize_Params params;
	params.myOwner = myOwner;
	params.Level = Level;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.CallEvent
// (Defined, Public)
// Parameters:
// bool                           ItemCheck                      (OptionalParm, Parm)
// int                            iReservation1                  (OptionalParm, Parm)
// int                            iReservation2                  (OptionalParm, Parm)

void AwHudPart_Tutorial::CallEvent(bool ItemCheck, int iReservation1, int iReservation2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.CallEvent");

	AwHudPart_Tutorial_CallEvent_Params params;
	params.ItemCheck = ItemCheck;
	params.iReservation1 = iReservation1;
	params.iReservation2 = iReservation2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.PlaySoundQuestEnd
// (Defined, Public)

void AwHudPart_Tutorial::PlaySoundQuestEnd()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.PlaySoundQuestEnd");

	AwHudPart_Tutorial_PlaySoundQuestEnd_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.PlaySoundQuest
// (Defined, Public)

void AwHudPart_Tutorial::PlaySoundQuest()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.PlaySoundQuest");

	AwHudPart_Tutorial_PlaySoundQuest_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.OnNextQuest
// (Defined, Public)

void AwHudPart_Tutorial::OnNextQuest()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.OnNextQuest");

	AwHudPart_Tutorial_OnNextQuest_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.OnBeginTutorial
// (Defined, Public)

void AwHudPart_Tutorial::OnBeginTutorial()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.OnBeginTutorial");

	AwHudPart_Tutorial_OnBeginTutorial_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.OnCompleteQuest
// (Defined, Public)

void AwHudPart_Tutorial::OnCompleteQuest()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.OnCompleteQuest");

	AwHudPart_Tutorial_OnCompleteQuest_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.OnBeginQuest
// (Defined, Public)

void AwHudPart_Tutorial::OnBeginQuest()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.OnBeginQuest");

	AwHudPart_Tutorial_OnBeginQuest_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.OnEndMessage
// (Defined, Public)

void AwHudPart_Tutorial::OnEndMessage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.OnEndMessage");

	AwHudPart_Tutorial_OnEndMessage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.OnBeginMessage
// (Defined, Public)

void AwHudPart_Tutorial::OnBeginMessage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.OnBeginMessage");

	AwHudPart_Tutorial_OnBeginMessage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.OnPickUpHealthPack
// (Defined, Public)

void AwHudPart_Tutorial::OnPickUpHealthPack()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.OnPickUpHealthPack");

	AwHudPart_Tutorial_OnPickUpHealthPack_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.OnKillAim
// (Defined, Public)

void AwHudPart_Tutorial::OnKillAim()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.OnKillAim");

	AwHudPart_Tutorial_OnKillAim_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.OnRunSprint
// (Defined, Public)
// Parameters:
// int                            iSec                           (Parm)

void AwHudPart_Tutorial::OnRunSprint(int iSec)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.OnRunSprint");

	AwHudPart_Tutorial_OnRunSprint_Params params;
	params.iSec = iSec;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.OnKillGrenade
// (Defined, Public)

void AwHudPart_Tutorial::OnKillGrenade()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.OnKillGrenade");

	AwHudPart_Tutorial_OnKillGrenade_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.OnMeleeAttack
// (Defined, Public)

void AwHudPart_Tutorial::OnMeleeAttack()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.OnMeleeAttack");

	AwHudPart_Tutorial_OnMeleeAttack_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial.OnKill3Enemy
// (Defined, Public)

void AwHudPart_Tutorial::OnKill3Enemy()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial.OnKill3Enemy");

	AwHudPart_Tutorial_OnKill3Enemy_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.DrawBeginTutorial
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Tutorial2::DrawBeginTutorial(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.DrawBeginTutorial");

	AwHudPart_Tutorial2_DrawBeginTutorial_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.DrawQuestComplete
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Tutorial2::DrawQuestComplete(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.DrawQuestComplete");

	AwHudPart_Tutorial2_DrawQuestComplete_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.DrawQuest
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Tutorial2::DrawQuest(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.DrawQuest");

	AwHudPart_Tutorial2_DrawQuest_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.DrawNoticeExit
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Tutorial2::DrawNoticeExit(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.DrawNoticeExit");

	AwHudPart_Tutorial2_DrawNoticeExit_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.DrawBattleAIBot
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Tutorial2::DrawBattleAIBot(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.DrawBattleAIBot");

	AwHudPart_Tutorial2_DrawBattleAIBot_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.GetValueScaleUp
// (Defined, Public)
// Parameters:
// float                          fStartScale                    (Parm)
// float                          fDestScale                     (Parm)
// float                          fDrawTime                      (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwHudPart_Tutorial2::GetValueScaleUp(float fStartScale, float fDestScale, float fDrawTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.GetValueScaleUp");

	AwHudPart_Tutorial2_GetValueScaleUp_Params params;
	params.fStartScale = fStartScale;
	params.fDestScale = fDestScale;
	params.fDrawTime = fDrawTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_Tutorial2.GetValueScaleDown
// (Defined, Public)
// Parameters:
// float                          fStartScale                    (Parm)
// float                          fDestScale                     (Parm)
// float                          fDrawTime                      (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwHudPart_Tutorial2::GetValueScaleDown(float fStartScale, float fDestScale, float fDrawTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.GetValueScaleDown");

	AwHudPart_Tutorial2_GetValueScaleDown_Params params;
	params.fStartScale = fStartScale;
	params.fDestScale = fDestScale;
	params.fDrawTime = fDrawTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_Tutorial2.DrawGiftItemT
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Tutorial2::DrawGiftItemT(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.DrawGiftItemT");

	AwHudPart_Tutorial2_DrawGiftItemT_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.DrawGiftItem
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Tutorial2::DrawGiftItem(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.DrawGiftItem");

	AwHudPart_Tutorial2_DrawGiftItem_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.DrawSpectatingHud
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Tutorial2::DrawSpectatingHud(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.DrawSpectatingHud");

	AwHudPart_Tutorial2_DrawSpectatingHud_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.DrawHudPassA
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Tutorial2::DrawHudPassA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.DrawHudPassA");

	AwHudPart_Tutorial2_DrawHudPassA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.DrawTestGrade
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Tutorial2::DrawTestGrade(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.DrawTestGrade");

	AwHudPart_Tutorial2_DrawTestGrade_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.CalcBotBattleGrade
// (Defined, Public)

void AwHudPart_Tutorial2::CalcBotBattleGrade()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.CalcBotBattleGrade");

	AwHudPart_Tutorial2_CalcBotBattleGrade_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.CalcGrenadeGrade
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwHudPart_Tutorial2::CalcGrenadeGrade()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.CalcGrenadeGrade");

	AwHudPart_Tutorial2_CalcGrenadeGrade_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_Tutorial2.CalcShootingGrade
// (Defined, Public)

void AwHudPart_Tutorial2::CalcShootingGrade()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.CalcShootingGrade");

	AwHudPart_Tutorial2_CalcShootingGrade_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.CalcAdvancedMovementGrade
// (Defined, Public)

void AwHudPart_Tutorial2::CalcAdvancedMovementGrade()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.CalcAdvancedMovementGrade");

	AwHudPart_Tutorial2_CalcAdvancedMovementGrade_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.CalcBasicMovementGrade
// (Defined, Public)

void AwHudPart_Tutorial2::CalcBasicMovementGrade()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.CalcBasicMovementGrade");

	AwHudPart_Tutorial2_CalcBasicMovementGrade_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.Trigger
// (Defined, Event, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// class APawn*                   EventInstigator                (Parm)

void AwHudPart_Tutorial2::Trigger(class AActor* Other, class APawn* EventInstigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.Trigger");

	AwHudPart_Tutorial2_Trigger_Params params;
	params.Other = Other;
	params.EventInstigator = EventInstigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.CallEvent
// (Defined, Public)
// Parameters:
// bool                           ItemCheck                      (OptionalParm, Parm)
// int                            iReservation1                  (OptionalParm, Parm)
// int                            iReservation2                  (OptionalParm, Parm)

void AwHudPart_Tutorial2::CallEvent(bool ItemCheck, int iReservation1, int iReservation2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.CallEvent");

	AwHudPart_Tutorial2_CallEvent_Params params;
	params.ItemCheck = ItemCheck;
	params.iReservation1 = iReservation1;
	params.iReservation2 = iReservation2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.Movelength
// (Defined, Public)
// Parameters:
// struct FVector                 vLocation                      (Parm)

void AwHudPart_Tutorial2::Movelength(const struct FVector& vLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.Movelength");

	AwHudPart_Tutorial2_Movelength_Params params;
	params.vLocation = vLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.EnableShootTarget
// (Defined, Public)
// Parameters:
// struct FName                   eventTag                       (Parm)

void AwHudPart_Tutorial2::EnableShootTarget(const struct FName& eventTag)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.EnableShootTarget");

	AwHudPart_Tutorial2_EnableShootTarget_Params params;
	params.eventTag = eventTag;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.GotoTutorial
// (Defined, Public)
// Parameters:
// int                            iQuestID                       (Parm)

void AwHudPart_Tutorial2::GotoTutorial(int iQuestID)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.GotoTutorial");

	AwHudPart_Tutorial2_GotoTutorial_Params params;
	params.iQuestID = iQuestID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.CheckStartTutorial
// (Defined, Public)

void AwHudPart_Tutorial2::CheckStartTutorial()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.CheckStartTutorial");

	AwHudPart_Tutorial2_CheckStartTutorial_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.BeginDrawItem
// (Defined, Public)

void AwHudPart_Tutorial2::BeginDrawItem()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.BeginDrawItem");

	AwHudPart_Tutorial2_BeginDrawItem_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.OnBeginTutorial
// (Defined, Public)

void AwHudPart_Tutorial2::OnBeginTutorial()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.OnBeginTutorial");

	AwHudPart_Tutorial2_OnBeginTutorial_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.ResetProgress
// (Defined, Public)

void AwHudPart_Tutorial2::ResetProgress()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.ResetProgress");

	AwHudPart_Tutorial2_ResetProgress_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.Initialize
// (Defined, Public)
// Parameters:
// class AHudBase*                myOwner                        (Parm)
// class ALevelInfo*              Level                          (Parm)

void AwHudPart_Tutorial2::Initialize(class AHudBase* myOwner, class ALevelInfo* Level)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.Initialize");

	AwHudPart_Tutorial2_Initialize_Params params;
	params.myOwner = myOwner;
	params.Level = Level;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.EnableTriggerEvent
// (Defined, Public)
// Parameters:
// struct FName                   EventName                      (Parm)
// class AActor*                  Other                          (Parm)
// class APawn*                   EventInstigator                (Parm)
// class AMover*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AMover* AwHudPart_Tutorial2::EnableTriggerEvent(const struct FName& EventName, class AActor* Other, class APawn* EventInstigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.EnableTriggerEvent");

	AwHudPart_Tutorial2_EnableTriggerEvent_Params params;
	params.EventName = EventName;
	params.Other = Other;
	params.EventInstigator = EventInstigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_Tutorial2.DisableTriggerEvent
// (Defined, Public)
// Parameters:
// struct FName                   EventName                      (Parm)
// class AActor*                  Other                          (Parm)
// class APawn*                   EventInstigator                (Parm)
// class AMover*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AMover* AwHudPart_Tutorial2::DisableTriggerEvent(const struct FName& EventName, class AActor* Other, class APawn* EventInstigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.DisableTriggerEvent");

	AwHudPart_Tutorial2_DisableTriggerEvent_Params params;
	params.EventName = EventName;
	params.Other = Other;
	params.EventInstigator = EventInstigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_Tutorial2.TutorialEvent
// (Defined, Public)
// Parameters:
// struct FString                 S                              (Parm, CoerceParm, NeedCtorLink)
// struct FName                   Type                           (OptionalParm, Parm)
// struct FName                   reserv                         (OptionalParm, Parm)

void AwHudPart_Tutorial2::TutorialEvent(const struct FString& S, const struct FName& Type, const struct FName& reserv)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.TutorialEvent");

	AwHudPart_Tutorial2_TutorialEvent_Params params;
	params.S = S;
	params.Type = Type;
	params.reserv = reserv;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.OnTutorialResult
// (Public, Delegate)
// Parameters:
// int                            iTutorialID                    (Parm)
// int                            iCurrent                       (Parm)
// bool                           bCompleted                     (OptionalParm, Parm)

void AwHudPart_Tutorial2::OnTutorialResult(int iTutorialID, int iCurrent, bool bCompleted)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.OnTutorialResult");

	AwHudPart_Tutorial2_OnTutorialResult_Params params;
	params.iTutorialID = iTutorialID;
	params.iCurrent = iCurrent;
	params.bCompleted = bCompleted;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Tutorial2.OnQuest
// (Defined, Public)

void AwHudPart_Tutorial2::OnQuest()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Tutorial2.OnQuest");

	AwHudPart_Tutorial2_OnQuest_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTutorial.DrawTeamListSection_C
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            lpCount                        (Parm)
// class APlayerReplicationInfo*  currPRI                        (Parm)
// int                            lpQuestNumber                  (Parm)
// struct FString                 HostName                       (Parm, NeedCtorLink)
// float                          beginY                         (Parm)
// float                          markBeginY                     (Parm)
// float                          markPingY                      (Parm)

void AxScoreBoardTutorial::DrawTeamListSection_C(class UCanvas* C, int lpCount, class APlayerReplicationInfo* currPRI, int lpQuestNumber, const struct FString& HostName, float beginY, float markBeginY, float markPingY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTutorial.DrawTeamListSection_C");

	AxScoreBoardTutorial_DrawTeamListSection_C_Params params;
	params.C = C;
	params.lpCount = lpCount;
	params.currPRI = currPRI;
	params.lpQuestNumber = lpQuestNumber;
	params.HostName = HostName;
	params.beginY = beginY;
	params.markBeginY = markBeginY;
	params.markPingY = markPingY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTutorial.DrawTeamListSection
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTutorial::DrawTeamListSection(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTutorial.DrawTeamListSection");

	AxScoreBoardTutorial_DrawTeamListSection_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTutorial.DrawContentDescription
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          _OffSetX                       (Parm)
// float                          _OffSetY                       (Parm)

void AxScoreBoardTutorial::DrawContentDescription(class UCanvas* C, float _OffSetX, float _OffSetY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTutorial.DrawContentDescription");

	AxScoreBoardTutorial_DrawContentDescription_Params params;
	params.C = C;
	params._OffSetX = _OffSetX;
	params._OffSetY = _OffSetY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTutorial.DrawTeamBG
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTutorial::DrawTeamBG(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTutorial.DrawTeamBG");

	AxScoreBoardTutorial_DrawTeamBG_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTutorial.DrawMiniMap
// (Defined, Simulated, Event, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTutorial::DrawMiniMap(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTutorial.DrawMiniMap");

	AxScoreBoardTutorial_DrawMiniMap_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTutorial.DrawScoreboard
// (Defined, Simulated, Event, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTutorial::DrawScoreboard(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTutorial.DrawScoreboard");

	AxScoreBoardTutorial_DrawScoreboard_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTutorial.OnTutorialResult
// (Defined, Public)
// Parameters:
// int                            iTutorialID                    (Parm)
// int                            iCurrent                       (Parm)
// bool                           bCompleted                     (OptionalParm, Parm)

void AxScoreBoardTutorial::OnTutorialResult(int iTutorialID, int iCurrent, bool bCompleted)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTutorial.OnTutorialResult");

	AxScoreBoardTutorial_OnTutorialResult_Params params;
	params.iTutorialID = iTutorialID;
	params.iCurrent = iCurrent;
	params.bCompleted = bCompleted;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTutorial.PushTutorialList
// (Defined, Public)

void AxScoreBoardTutorial::PushTutorialList()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTutorial.PushTutorialList");

	AxScoreBoardTutorial_PushTutorialList_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTutorial.PostBeginPlay
// (Defined, Public)

void AxScoreBoardTutorial::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTutorial.PostBeginPlay");

	AxScoreBoardTutorial_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlotCN.DrawItemImage
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_SelectQSlotCN::DrawItemImage(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.DrawItemImage");

	AwHudPart_SelectQSlotCN_DrawItemImage_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlotCN.GetItemImage
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iItemID                        (Parm)
// struct FImage                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FImage AwHudPart_SelectQSlotCN::GetItemImage(class UCanvas* C, int iItemID)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.GetItemImage");

	AwHudPart_SelectQSlotCN_GetItemImage_Params params;
	params.C = C;
	params.iItemID = iItemID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_SelectQSlotCN.QuickSlotContent_SetString
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iPosX                          (Parm)
// int                            iPosY                          (Parm)
// int                            iSlot                          (Parm)
// bool                           bDefaultWeapon                 (OptionalParm, Parm)

void AwHudPart_SelectQSlotCN::QuickSlotContent_SetString(class UCanvas* C, int iPosX, int iPosY, int iSlot, bool bDefaultWeapon)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.QuickSlotContent_SetString");

	AwHudPart_SelectQSlotCN_QuickSlotContent_SetString_Params params;
	params.C = C;
	params.iPosX = iPosX;
	params.iPosY = iPosY;
	params.iSlot = iSlot;
	params.bDefaultWeapon = bDefaultWeapon;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlotCN.DrawQuickSlotContent_List
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iPosX                          (Parm)
// int                            iPosY                          (Parm)
// int                            iSlot                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHudPart_SelectQSlotCN::DrawQuickSlotContent_List(class UCanvas* C, int iPosX, int iPosY, int iSlot)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.DrawQuickSlotContent_List");

	AwHudPart_SelectQSlotCN_DrawQuickSlotContent_List_Params params;
	params.C = C;
	params.iPosX = iPosX;
	params.iPosY = iPosY;
	params.iSlot = iSlot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_SelectQSlotCN.DrawQuickSlotContent_DefaultWeapon
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iPosX                          (Parm)
// int                            iPosY                          (Parm)

void AwHudPart_SelectQSlotCN::DrawQuickSlotContent_DefaultWeapon(class UCanvas* C, int iPosX, int iPosY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.DrawQuickSlotContent_DefaultWeapon");

	AwHudPart_SelectQSlotCN_DrawQuickSlotContent_DefaultWeapon_Params params;
	params.C = C;
	params.iPosX = iPosX;
	params.iPosY = iPosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlotCN.DrawQuickSlotContent_Description
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iPosX                          (Parm)
// int                            iPosY                          (Parm)

void AwHudPart_SelectQSlotCN::DrawQuickSlotContent_Description(class UCanvas* C, int iPosX, int iPosY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.DrawQuickSlotContent_Description");

	AwHudPart_SelectQSlotCN_DrawQuickSlotContent_Description_Params params;
	params.C = C;
	params.iPosX = iPosX;
	params.iPosY = iPosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlotCN.DrawSellectBar
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iPosX                          (Parm)
// int                            iPosY                          (Parm)
// bool                           bDefaultWeapon                 (OptionalParm, Parm)

void AwHudPart_SelectQSlotCN::DrawSellectBar(class UCanvas* C, int iPosX, int iPosY, bool bDefaultWeapon)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.DrawSellectBar");

	AwHudPart_SelectQSlotCN_DrawSellectBar_Params params;
	params.C = C;
	params.iPosX = iPosX;
	params.iPosY = iPosY;
	params.bDefaultWeapon = bDefaultWeapon;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlotCN.DrawQuickSlotName
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iPosX                          (Parm)
// int                            iPosY                          (Parm)
// int                            iSlot                          (Parm)
// bool                           bDefaultWeapon                 (OptionalParm, Parm)
// bool                           bHasItem                       (OptionalParm, Parm)

void AwHudPart_SelectQSlotCN::DrawQuickSlotName(class UCanvas* C, int iPosX, int iPosY, int iSlot, bool bDefaultWeapon, bool bHasItem)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.DrawQuickSlotName");

	AwHudPart_SelectQSlotCN_DrawQuickSlotName_Params params;
	params.C = C;
	params.iPosX = iPosX;
	params.iPosY = iPosY;
	params.iSlot = iSlot;
	params.bDefaultWeapon = bDefaultWeapon;
	params.bHasItem = bHasItem;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlotCN.DrawQuickSlot
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_SelectQSlotCN::DrawQuickSlot(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.DrawQuickSlot");

	AwHudPart_SelectQSlotCN_DrawQuickSlot_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlotCN.DrawSelectQSlot
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_SelectQSlotCN::DrawSelectQSlot(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.DrawSelectQSlot");

	AwHudPart_SelectQSlotCN_DrawSelectQSlot_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlotCN.DrawA
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_SelectQSlotCN::DrawA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.DrawA");

	AwHudPart_SelectQSlotCN_DrawA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlotCN.UpdateHelpKeyControll
// (Defined, Public)

void AwHudPart_SelectQSlotCN::UpdateHelpKeyControll()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.UpdateHelpKeyControll");

	AwHudPart_SelectQSlotCN_UpdateHelpKeyControll_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlotCN.CallEvent
// (Defined, Public)
// Parameters:
// bool                           ItemCheck                      (OptionalParm, Parm)
// int                            iReservation1                  (OptionalParm, Parm)
// int                            iReservation2                  (OptionalParm, Parm)

void AwHudPart_SelectQSlotCN::CallEvent(bool ItemCheck, int iReservation1, int iReservation2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.CallEvent");

	AwHudPart_SelectQSlotCN_CallEvent_Params params;
	params.ItemCheck = ItemCheck;
	params.iReservation1 = iReservation1;
	params.iReservation2 = iReservation2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlotCN.CallSelectQuickSlot
// (Defined, Public)
// Parameters:
// int                            iIndex                         (Parm)

void AwHudPart_SelectQSlotCN::CallSelectQuickSlot(int iIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.CallSelectQuickSlot");

	AwHudPart_SelectQSlotCN_CallSelectQuickSlot_Params params;
	params.iIndex = iIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlotCN.ToggleQuickSlotWindow
// (Defined, Public)

void AwHudPart_SelectQSlotCN::ToggleQuickSlotWindow()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.ToggleQuickSlotWindow");

	AwHudPart_SelectQSlotCN_ToggleQuickSlotWindow_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlotCN.EndQuickSlotWindow
// (Defined, Public)

void AwHudPart_SelectQSlotCN::EndQuickSlotWindow()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.EndQuickSlotWindow");

	AwHudPart_SelectQSlotCN_EndQuickSlotWindow_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlotCN.BeginQuickSlotWindow
// (Defined, Public)

void AwHudPart_SelectQSlotCN::BeginQuickSlotWindow()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.BeginQuickSlotWindow");

	AwHudPart_SelectQSlotCN_BeginQuickSlotWindow_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlotCN.Initialize
// (Defined, Public)
// Parameters:
// class AHudBase*                myOwner                        (Parm)
// class ALevelInfo*              _level                         (Parm)

void AwHudPart_SelectQSlotCN::Initialize(class AHudBase* myOwner, class ALevelInfo* _level)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlotCN.Initialize");

	AwHudPart_SelectQSlotCN_Initialize_Params params;
	params.myOwner = myOwner;
	params._level = _level;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Bigmap.DrawMinimap_BGMapUAV
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Bigmap::DrawMinimap_BGMapUAV(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Bigmap.DrawMinimap_BGMapUAV");

	AwHudPart_Bigmap_DrawMinimap_BGMapUAV_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Bigmap.DrawMinimap_SpecialPositions
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Bigmap::DrawMinimap_SpecialPositions(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Bigmap.DrawMinimap_SpecialPositions");

	AwHudPart_Bigmap_DrawMinimap_SpecialPositions_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Bigmap.DrawMinimap_Airstrike
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Bigmap::DrawMinimap_Airstrike(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Bigmap.DrawMinimap_Airstrike");

	AwHudPart_Bigmap_DrawMinimap_Airstrike_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Bigmap.DrawMinimap_Helicopter
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Bigmap::DrawMinimap_Helicopter(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Bigmap.DrawMinimap_Helicopter");

	AwHudPart_Bigmap_DrawMinimap_Helicopter_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Bigmap.DrawMinimap_Deads
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Bigmap::DrawMinimap_Deads(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Bigmap.DrawMinimap_Deads");

	AwHudPart_Bigmap_DrawMinimap_Deads_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Bigmap.DrawMinimap_Enemies
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Bigmap::DrawMinimap_Enemies(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Bigmap.DrawMinimap_Enemies");

	AwHudPart_Bigmap_DrawMinimap_Enemies_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Bigmap.DrawMinimap_Allies
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Bigmap::DrawMinimap_Allies(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Bigmap.DrawMinimap_Allies");

	AwHudPart_Bigmap_DrawMinimap_Allies_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Bigmap.CalculateTexturePositionFromMinimapPosition
// (Defined, Public)
// Parameters:
// float                          minimapX                       (Parm)
// float                          minimapY                       (Parm)
// int                            TX                             (Parm, OutParm)
// int                            ty                             (Parm, OutParm)

void AwHudPart_Bigmap::CalculateTexturePositionFromMinimapPosition(float minimapX, float minimapY, int* TX, int* ty)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Bigmap.CalculateTexturePositionFromMinimapPosition");

	AwHudPart_Bigmap_CalculateTexturePositionFromMinimapPosition_Params params;
	params.minimapX = minimapX;
	params.minimapY = minimapY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (TX != nullptr)
		*TX = params.TX;
	if (ty != nullptr)
		*ty = params.ty;
}


// Function XInterface.wHudPart_Bigmap.CalculateMinimapPosition
// (Defined, Public)
// Parameters:
// struct FVector                 centerLoc                      (Parm)
// struct FRotator                centerRotation                 (Parm)
// struct FVector                 TargetLoc                      (Parm)
// float                          minimapX                       (Parm, OutParm)
// float                          minimapY                       (Parm, OutParm)

void AwHudPart_Bigmap::CalculateMinimapPosition(const struct FVector& centerLoc, const struct FRotator& centerRotation, const struct FVector& TargetLoc, float* minimapX, float* minimapY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Bigmap.CalculateMinimapPosition");

	AwHudPart_Bigmap_CalculateMinimapPosition_Params params;
	params.centerLoc = centerLoc;
	params.centerRotation = centerRotation;
	params.TargetLoc = TargetLoc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (minimapX != nullptr)
		*minimapX = params.minimapX;
	if (minimapY != nullptr)
		*minimapY = params.minimapY;
}


// Function XInterface.wHudPart_Bigmap.SetupMinimapSpriteWidgetForDrawing
// (Defined, Public)
// Parameters:
// struct FSpriteWidget           Sprite                         (Parm, OutParm)
// struct FRotator                Rotation                       (Parm)
// float                          minimapX                       (Parm)
// float                          minimapY                       (Parm)

void AwHudPart_Bigmap::SetupMinimapSpriteWidgetForDrawing(const struct FRotator& Rotation, float minimapX, float minimapY, struct FSpriteWidget* Sprite)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Bigmap.SetupMinimapSpriteWidgetForDrawing");

	AwHudPart_Bigmap_SetupMinimapSpriteWidgetForDrawing_Params params;
	params.Rotation = Rotation;
	params.minimapX = minimapX;
	params.minimapY = minimapY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Sprite != nullptr)
		*Sprite = params.Sprite;
}


// Function XInterface.wHudPart_Bigmap.DrawMinimap_Myself
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Bigmap::DrawMinimap_Myself(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Bigmap.DrawMinimap_Myself");

	AwHudPart_Bigmap_DrawMinimap_Myself_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Bigmap.SetupBGMapUAV
// (Defined, Public)

void AwHudPart_Bigmap::SetupBGMapUAV()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Bigmap.SetupBGMapUAV");

	AwHudPart_Bigmap_SetupBGMapUAV_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Bigmap.DrawMinimap_BGMap
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Bigmap::DrawMinimap_BGMap(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Bigmap.DrawMinimap_BGMap");

	AwHudPart_Bigmap_DrawMinimap_BGMap_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Bigmap.Draw
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Bigmap::Draw(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Bigmap.Draw");

	AwHudPart_Bigmap_Draw_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Bigmap.GetPivotCoords
// (Defined, Public)
// Parameters:
// struct FVector                 it1                            (Parm, OutParm)
// struct FVector                 iw1                            (Parm, OutParm)
// struct FVector                 it2                            (Parm, OutParm)
// struct FVector                 iw2                            (Parm, OutParm)

void AwHudPart_Bigmap::GetPivotCoords(struct FVector* it1, struct FVector* iw1, struct FVector* it2, struct FVector* iw2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Bigmap.GetPivotCoords");

	AwHudPart_Bigmap_GetPivotCoords_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (it1 != nullptr)
		*it1 = params.it1;
	if (iw1 != nullptr)
		*iw1 = params.iw1;
	if (it2 != nullptr)
		*it2 = params.it2;
	if (iw2 != nullptr)
		*iw2 = params.iw2;
}


// Function XInterface.wHudPart_Bigmap.Initialize
// (Defined, Public)
// Parameters:
// class AHudBase*                myOwner                        (Parm)
// class ALevelInfo*              myLevel                        (Parm)

void AwHudPart_Bigmap::Initialize(class AHudBase* myOwner, class ALevelInfo* myLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Bigmap.Initialize");

	AwHudPart_Bigmap_Initialize_Params params;
	params.myOwner = myOwner;
	params.myLevel = myLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawEventString
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          StartTime                      (Parm)
// struct FString                 strHead                        (Parm, NeedCtorLink)
// struct FColor                  headColor                      (Parm)
// struct FString                 strDesc                        (Parm, NeedCtorLink)
// struct FString                 strKey                         (Parm, NeedCtorLink)

void AwHudPart_DisplayEvent::DrawEventString(class UCanvas* C, float StartTime, const struct FString& strHead, const struct FColor& headColor, const struct FString& strDesc, const struct FString& strKey)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawEventString");

	AwHudPart_DisplayEvent_DrawEventString_Params params;
	params.C = C;
	params.StartTime = StartTime;
	params.strHead = strHead;
	params.headColor = headColor;
	params.strDesc = strDesc;
	params.strKey = strKey;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_NotReady
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            SkillID                        (Parm)

void AwHudPart_DisplayEvent::DisplayEvent_Skill_NotReady(class UCanvas* C, int SkillID)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_NotReady");

	AwHudPart_DisplayEvent_DisplayEvent_Skill_NotReady_Params params;
	params.C = C;
	params.SkillID = SkillID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMessage_SentryGun_Installing
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FSpriteWidget           WMessage                       (Parm)
// float                          ProgressPct                    (Parm)

void AwHudPart_DisplayEvent::DrawMessage_SentryGun_Installing(class UCanvas* C, const struct FSpriteWidget& WMessage, float ProgressPct)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMessage_SentryGun_Installing");

	AwHudPart_DisplayEvent_DrawMessage_SentryGun_Installing_Params params;
	params.C = C;
	params.WMessage = WMessage;
	params.ProgressPct = ProgressPct;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMessageConnectionInstability
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawMessageConnectionInstability(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMessageConnectionInstability");

	AwHudPart_DisplayEvent_DrawMessageConnectionInstability_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.ConnectionInstability
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::ConnectionInstability(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.ConnectionInstability");

	AwHudPart_DisplayEvent_ConnectionInstability_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.SetTimeConnectionInstability
// (Defined, Public)
// Parameters:
// bool                           bSet                           (Parm)

void AwHudPart_DisplayEvent::SetTimeConnectionInstability(bool bSet)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.SetTimeConnectionInstability");

	AwHudPart_DisplayEvent_SetTimeConnectionInstability_Params params;
	params.bSet = bSet;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawAAS
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FString                 sAASNotice                     (Parm, NeedCtorLink)

void AwHudPart_DisplayEvent::DrawAAS(class UCanvas* C, const struct FString& sAASNotice)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawAAS");

	AwHudPart_DisplayEvent_DrawAAS_Params params;
	params.C = C;
	params.sAASNotice = sAASNotice;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMoveGameNotice
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FString                 sGameNotice                    (Parm, NeedCtorLink)
// float                          fLifeTime                      (Parm)

void AwHudPart_DisplayEvent::DrawMoveGameNotice(class UCanvas* C, const struct FString& sGameNotice, float fLifeTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMoveGameNotice");

	AwHudPart_DisplayEvent_DrawMoveGameNotice_Params params;
	params.C = C;
	params.sGameNotice = sGameNotice;
	params.fLifeTime = fLifeTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawGameNotice
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FString                 sGameNotice                    (Parm, NeedCtorLink)

void AwHudPart_DisplayEvent::DrawGameNotice(class UCanvas* C, const struct FString& sGameNotice)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawGameNotice");

	AwHudPart_DisplayEvent_DrawGameNotice_Params params;
	params.C = C;
	params.sGameNotice = sGameNotice;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_FFA
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwHudPart_DisplayEvent::GetMessageGameMode_FFA()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_FFA");

	AwHudPart_DisplayEvent_GetMessageGameMode_FFA_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_SBT
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwHudPart_DisplayEvent::GetMessageGameMode_SBT()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_SBT");

	AwHudPart_DisplayEvent_GetMessageGameMode_SBT_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_SD
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwHudPart_DisplayEvent::GetMessageGameMode_SD()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_SD");

	AwHudPart_DisplayEvent_GetMessageGameMode_SD_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_DOA
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwHudPart_DisplayEvent::GetMessageGameMode_DOA()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_DOA");

	AwHudPart_DisplayEvent_GetMessageGameMode_DOA_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_DisplayEvent.SetMessageGameMode_DOM
// (Defined, Public)
// Parameters:
// class UMaterial*               matA                           (Parm)
// class UMaterial*               matB                           (Parm)
// class UMaterial*               matC                           (Parm)

void AwHudPart_DisplayEvent::SetMessageGameMode_DOM(class UMaterial* matA, class UMaterial* matB, class UMaterial* matC)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.SetMessageGameMode_DOM");

	AwHudPart_DisplayEvent_SetMessageGameMode_DOM_Params params;
	params.matA = matA;
	params.matB = matB;
	params.matC = matC;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_DOM
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwHudPart_DisplayEvent::GetMessageGameMode_DOM()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_DOM");

	AwHudPart_DisplayEvent_GetMessageGameMode_DOM_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_TD
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwHudPart_DisplayEvent::GetMessageGameMode_TD()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_TD");

	AwHudPart_DisplayEvent_GetMessageGameMode_TD_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode
// (Defined, Public)
// Parameters:
// class UMaterial*               mat                            (OptionalParm, Parm, OutParm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwHudPart_DisplayEvent::GetMessageGameMode(class UMaterial** mat)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode");

	AwHudPart_DisplayEvent_GetMessageGameMode_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (mat != nullptr)
		*mat = params.mat;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_SetDrawGameMessage
// (Defined, Public)
// Parameters:
// bool                           bMode                          (Parm)
// bool                           bSystem                        (Parm)

void AwHudPart_DisplayEvent::DisplayEvent_SetDrawGameMessage(bool bMode, bool bSystem)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisplayEvent_SetDrawGameMessage");

	AwHudPart_DisplayEvent_DisplayEvent_SetDrawGameMessage_Params params;
	params.bMode = bMode;
	params.bSystem = bSystem;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawGameMode
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawGameMode(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawGameMode");

	AwHudPart_DisplayEvent_DrawGameMode_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.SetBombObjectIndex
// (Defined, Public)
// Parameters:
// int                            objectIndex                    (Parm)

void AwHudPart_DisplayEvent::SetBombObjectIndex(int objectIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.SetBombObjectIndex");

	AwHudPart_DisplayEvent_SetBombObjectIndex_Params params;
	params.objectIndex = objectIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_GameMode
// (Defined, Public)
// Parameters:
// struct FString                 Message                        (Parm, NeedCtorLink)

void AwHudPart_DisplayEvent::DisplayEvent_GameMode(const struct FString& Message)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisplayEvent_GameMode");

	AwHudPart_DisplayEvent_DisplayEvent_GameMode_Params params;
	params.Message = Message;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_BattleExplain
// (Defined, Public)

void AwHudPart_DisplayEvent::DisplayEvent_BattleExplain()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisplayEvent_BattleExplain");

	AwHudPart_DisplayEvent_DisplayEvent_BattleExplain_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawPlusPoint_Defence
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iPoint                         (Parm)
// int                            iPosX                          (Parm)
// int                            iPosY                          (Parm)
// int                            iEffectState                   (OptionalParm, Parm)
// float                          fScale                         (OptionalParm, Parm)

void AwHudPart_DisplayEvent::DrawPlusPoint_Defence(class UCanvas* C, int iPoint, int iPosX, int iPosY, int iEffectState, float fScale)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawPlusPoint_Defence");

	AwHudPart_DisplayEvent_DrawPlusPoint_Defence_Params params;
	params.C = C;
	params.iPoint = iPoint;
	params.iPosX = iPosX;
	params.iPosY = iPosY;
	params.iEffectState = iEffectState;
	params.fScale = fScale;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawPlusPoint
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iPoint                         (Parm)
// int                            iPosX                          (Parm)
// int                            iPosY                          (Parm)
// int                            iAlpha                         (Parm)
// int                            iEffectState                   (OptionalParm, Parm)
// float                          fScale                         (OptionalParm, Parm)

void AwHudPart_DisplayEvent::DrawPlusPoint(class UCanvas* C, int iPoint, int iPosX, int iPosY, int iAlpha, int iEffectState, float fScale)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawPlusPoint");

	AwHudPart_DisplayEvent_DrawPlusPoint_Params params;
	params.C = C;
	params.iPoint = iPoint;
	params.iPosX = iPosX;
	params.iPosY = iPosY;
	params.iAlpha = iAlpha;
	params.iEffectState = iEffectState;
	params.fScale = fScale;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_GainPoint
// (Defined, Public)
// Parameters:
// int                            iPoint                         (Parm)

void AwHudPart_DisplayEvent::DisplayEvent_GainPoint(int iPoint)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisplayEvent_GainPoint");

	AwHudPart_DisplayEvent_DisplayEvent_GainPoint_Params params;
	params.iPoint = iPoint;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawSudenDeath
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawSudenDeath(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawSudenDeath");

	AwHudPart_DisplayEvent_DrawSudenDeath_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisPlayEvent_SudenDeath
// (Defined, Public)

void AwHudPart_DisplayEvent::DisPlayEvent_SudenDeath()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisPlayEvent_SudenDeath");

	AwHudPart_DisplayEvent_DisPlayEvent_SudenDeath_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawHostChange
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawHostChange(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawHostChange");

	AwHudPart_DisplayEvent_DrawHostChange_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMessageRechargeAmmo
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHudPart_DisplayEvent::DrawMessageRechargeAmmo(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMessageRechargeAmmo");

	AwHudPart_DisplayEvent_DrawMessageRechargeAmmo_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_DisplayEvent.DrawWarningWeaponInfo
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawWarningWeaponInfo(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawWarningWeaponInfo");

	AwHudPart_DisplayEvent_DrawWarningWeaponInfo_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.ResetState
// (Defined, Public)

void AwHudPart_DisplayEvent::ResetState()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.ResetState");

	AwHudPart_DisplayEvent_ResetState_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawVehicleInfo
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawVehicleInfo(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawVehicleInfo");

	AwHudPart_DisplayEvent_DrawVehicleInfo_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawWeaponChange
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawWeaponChange(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawWeaponChange");

	AwHudPart_DisplayEvent_DrawWeaponChange_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawTileByMaterial
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class UMaterial*               mat                            (Parm)
// int                            iAlpha                         (Parm)
// float                          fUL                            (Parm)
// float                          fVL                            (Parm)
// float                          fScale                         (OptionalParm, Parm)

void AwHudPart_DisplayEvent::DrawTileByMaterial(class UCanvas* C, class UMaterial* mat, int iAlpha, float fUL, float fVL, float fScale)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawTileByMaterial");

	AwHudPart_DisplayEvent_DrawTileByMaterial_Params params;
	params.C = C;
	params.mat = mat;
	params.iAlpha = iAlpha;
	params.fUL = fUL;
	params.fVL = fVL;
	params.fScale = fScale;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMessage_BeginMission
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iRound                         (Parm)
// bool                           bChangeAttackTeam              (Parm)
// int                            iAttackTeam                    (Parm)
// int                            iElapsedTime                   (Parm)

void AwHudPart_DisplayEvent::DrawMessage_BeginMission(class UCanvas* C, int iRound, bool bChangeAttackTeam, int iAttackTeam, int iElapsedTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMessage_BeginMission");

	AwHudPart_DisplayEvent_DrawMessage_BeginMission_Params params;
	params.C = C;
	params.iRound = iRound;
	params.bChangeAttackTeam = bChangeAttackTeam;
	params.iAttackTeam = iAttackTeam;
	params.iElapsedTime = iElapsedTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawResultScore_FFA
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawResultScore_FFA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawResultScore_FFA");

	AwHudPart_DisplayEvent_DrawResultScore_FFA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawResultScore_FFA_Item
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           drawTop                        (Parm)
// class APlayerReplicationInfo*  currPRI                        (Parm)
// class UwMatchUserInfo*         User                           (Parm)
// int                            lh                             (Parm)
// int                            currLH                         (Parm)
// int                            nextLH                         (Parm)
// class UMaterial*               medalMat                       (Parm)
// int                            Rank                           (Parm)

void AwHudPart_DisplayEvent::DrawResultScore_FFA_Item(class UCanvas* C, bool drawTop, class APlayerReplicationInfo* currPRI, class UwMatchUserInfo* User, int lh, int currLH, int nextLH, class UMaterial* medalMat, int Rank)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawResultScore_FFA_Item");

	AwHudPart_DisplayEvent_DrawResultScore_FFA_Item_Params params;
	params.C = C;
	params.drawTop = drawTop;
	params.currPRI = currPRI;
	params.User = User;
	params.lh = lh;
	params.currLH = currLH;
	params.nextLH = nextLH;
	params.medalMat = medalMat;
	params.Rank = Rank;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawResultScore_AlienMdoe
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           bAlienTeamWin                  (Parm)

void AwHudPart_DisplayEvent::DrawResultScore_AlienMdoe(class UCanvas* C, bool bAlienTeamWin)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawResultScore_AlienMdoe");

	AwHudPart_DisplayEvent_DrawResultScore_AlienMdoe_Params params;
	params.C = C;
	params.bAlienTeamWin = bAlienTeamWin;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawResultScore
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           Won                            (Parm)

void AwHudPart_DisplayEvent::DrawResultScore(class UCanvas* C, bool Won)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawResultScore");

	AwHudPart_DisplayEvent_DrawResultScore_Params params;
	params.C = C;
	params.Won = Won;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawTeamScoreUseImage
// (Defined, Public)

void AwHudPart_DisplayEvent::DrawTeamScoreUseImage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawTeamScoreUseImage");

	AwHudPart_DisplayEvent_DrawTeamScoreUseImage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawSpectating
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawSpectating(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawSpectating");

	AwHudPart_DisplayEvent_DrawSpectating_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawA
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawA");

	AwHudPart_DisplayEvent_DrawA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawTimerBomb
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            Min                            (Parm)
// int                            sec                            (Parm)

void AwHudPart_DisplayEvent::DrawTimerBomb(class UCanvas* C, int Min, int sec)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawTimerBomb");

	AwHudPart_DisplayEvent_DrawTimerBomb_Params params;
	params.C = C;
	params.Min = Min;
	params.sec = sec;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawRankingInfo_Text
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APlayerReplicationInfo*  currPRI                        (Parm)
// float                          _iPosX                         (Parm)
// float                          _iPosY                         (Parm)
// struct FColor                  FontColor                      (Parm)

void AwHudPart_DisplayEvent::DrawRankingInfo_Text(class UCanvas* C, class APlayerReplicationInfo* currPRI, float _iPosX, float _iPosY, const struct FColor& FontColor)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawRankingInfo_Text");

	AwHudPart_DisplayEvent_DrawRankingInfo_Text_Params params;
	params.C = C;
	params.currPRI = currPRI;
	params._iPosX = _iPosX;
	params._iPosY = _iPosY;
	params.FontColor = FontColor;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawRankingInfo_Mark
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APlayerReplicationInfo*  currPRI                        (Parm)
// float                          _iPosX                         (Parm)
// float                          _iPosY                         (Parm)

void AwHudPart_DisplayEvent::DrawRankingInfo_Mark(class UCanvas* C, class APlayerReplicationInfo* currPRI, float _iPosX, float _iPosY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawRankingInfo_Mark");

	AwHudPart_DisplayEvent_DrawRankingInfo_Mark_Params params;
	params.C = C;
	params.currPRI = currPRI;
	params._iPosX = _iPosX;
	params._iPosY = _iPosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawRankingInfo
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APlayerReplicationInfo*  currPRI                        (Parm)
// float                          _iPosX                         (Parm)
// float                          _iPosY                         (Parm)

void AwHudPart_DisplayEvent::DrawRankingInfo(class UCanvas* C, class APlayerReplicationInfo* currPRI, float _iPosX, float _iPosY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawRankingInfo");

	AwHudPart_DisplayEvent_DrawRankingInfo_Params params;
	params.C = C;
	params.currPRI = currPRI;
	params._iPosX = _iPosX;
	params._iPosY = _iPosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawDFRankingInfo
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APlayerReplicationInfo*  PRI                            (Parm)
// float                          iPosX                          (Parm)
// float                          iPosY                          (Parm)

void AwHudPart_DisplayEvent::DrawDFRankingInfo(class UCanvas* C, class APlayerReplicationInfo* PRI, float iPosX, float iPosY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawDFRankingInfo");

	AwHudPart_DisplayEvent_DrawDFRankingInfo_Params params;
	params.C = C;
	params.PRI = PRI;
	params.iPosX = iPosX;
	params.iPosY = iPosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawDFScore
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawDFScore(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawDFScore");

	AwHudPart_DisplayEvent_DrawDFScore_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawFFAScore
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawFFAScore(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawFFAScore");

	AwHudPart_DisplayEvent_DrawFFAScore_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DFRankingSorting
// (Defined, Public)

void AwHudPart_DisplayEvent::DFRankingSorting()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DFRankingSorting");

	AwHudPart_DisplayEvent_DFRankingSorting_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.FFARankingSorting
// (Defined, Public)

void AwHudPart_DisplayEvent::FFARankingSorting()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.FFARankingSorting");

	AwHudPart_DisplayEvent_FFARankingSorting_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.SortPRIArray
// (Defined, Simulated, Public)

void AwHudPart_DisplayEvent::SortPRIArray()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.SortPRIArray");

	AwHudPart_DisplayEvent_SortPRIArray_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.InOrder
// (Defined, Simulated, Public)
// Parameters:
// class APlayerReplicationInfo*  P1                             (Parm)
// class APlayerReplicationInfo*  P2                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHudPart_DisplayEvent::InOrder(class APlayerReplicationInfo* P1, class APlayerReplicationInfo* P2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.InOrder");

	AwHudPart_DisplayEvent_InOrder_Params params;
	params.P1 = P1;
	params.P2 = P2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_DisplayEvent.DrawAlienModeDigits
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iValue                         (Parm)
// int                            _iPosX                         (Parm)
// int                            _iPosY                         (Parm)
// struct FCalCoordsW             calW                           (Parm)

void AwHudPart_DisplayEvent::DrawAlienModeDigits(class UCanvas* C, int iValue, int _iPosX, int _iPosY, const struct FCalCoordsW& calW)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawAlienModeDigits");

	AwHudPart_DisplayEvent_DrawAlienModeDigits_Params params;
	params.C = C;
	params.iValue = iValue;
	params._iPosX = _iPosX;
	params._iPosY = _iPosY;
	params.calW = calW;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawAlienModeScore
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawAlienModeScore(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawAlienModeScore");

	AwHudPart_DisplayEvent_DrawAlienModeScore_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMainScoreTeam
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iScoreAF                       (Parm)
// int                            iScoreRSA                      (Parm)
// int                            _iPosX                         (Parm)
// int                            _iPosY                         (Parm)
// struct FCalCoordsW             calW                           (Parm)

void AwHudPart_DisplayEvent::DrawMainScoreTeam(class UCanvas* C, int iScoreAF, int iScoreRSA, int _iPosX, int _iPosY, const struct FCalCoordsW& calW)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMainScoreTeam");

	AwHudPart_DisplayEvent_DrawMainScoreTeam_Params params;
	params.C = C;
	params.iScoreAF = iScoreAF;
	params.iScoreRSA = iScoreRSA;
	params._iPosX = _iPosX;
	params._iPosY = _iPosY;
	params.calW = calW;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawRemaingTime
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            _iPosX                         (Parm)
// int                            _iPosY                         (Parm)

void AwHudPart_DisplayEvent::DrawRemaingTime(class UCanvas* C, int _iPosX, int _iPosY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawRemaingTime");

	AwHudPart_DisplayEvent_DrawRemaingTime_Params params;
	params.C = C;
	params._iPosX = _iPosX;
	params._iPosY = _iPosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMainScore
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawMainScore(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMainScore");

	AwHudPart_DisplayEvent_DrawMainScore_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMainTimer
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawMainTimer(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMainTimer");

	AwHudPart_DisplayEvent_DrawMainTimer_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawRoundResult
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            ScoringTeam                    (Parm)

void AwHudPart_DisplayEvent::DrawRoundResult(class UCanvas* C, int ScoringTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawRoundResult");

	AwHudPart_DisplayEvent_DrawRoundResult_Params params;
	params.C = C;
	params.ScoringTeam = ScoringTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisplayRoundResult
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            ScoringTeam                    (Parm)

void AwHudPart_DisplayEvent::DisplayRoundResult(class UCanvas* C, int ScoringTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisplayRoundResult");

	AwHudPart_DisplayEvent_DisplayRoundResult_Params params;
	params.C = C;
	params.ScoringTeam = ScoringTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisplayMessaage_Round
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iAttackTeam                    (Parm)
// int                            iAlpha                         (Parm)

void AwHudPart_DisplayEvent::DisplayMessaage_Round(class UCanvas* C, int iAttackTeam, int iAlpha)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisplayMessaage_Round");

	AwHudPart_DisplayEvent_DisplayMessaage_Round_Params params;
	params.C = C;
	params.iAttackTeam = iAttackTeam;
	params.iAlpha = iAlpha;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisplayMessage_Mission
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iAttackTeam                    (Parm)
// int                            iAlpha                         (Parm)

void AwHudPart_DisplayEvent::DisplayMessage_Mission(class UCanvas* C, int iAttackTeam, int iAlpha)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisplayMessage_Mission");

	AwHudPart_DisplayEvent_DisplayMessage_Mission_Params params;
	params.C = C;
	params.iAttackTeam = iAttackTeam;
	params.iAlpha = iAlpha;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisplayMessage_Mission_Intrusion
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iAttackTeam                    (Parm)
// int                            iRound                         (Parm)

void AwHudPart_DisplayEvent::DisplayMessage_Mission_Intrusion(class UCanvas* C, int iAttackTeam, int iRound)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisplayMessage_Mission_Intrusion");

	AwHudPart_DisplayEvent_DisplayMessage_Mission_Intrusion_Params params;
	params.C = C;
	params.iAttackTeam = iAttackTeam;
	params.iRound = iRound;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawCountDown
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iCount                         (Parm, CoerceParm)

void AwHudPart_DisplayEvent::DrawCountDown(class UCanvas* C, int iCount)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawCountDown");

	AwHudPart_DisplayEvent_DrawCountDown_Params params;
	params.C = C;
	params.iCount = iCount;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMessage_Waiting
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawMessage_Waiting(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMessage_Waiting");

	AwHudPart_DisplayEvent_DrawMessage_Waiting_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMessage_WaitingCountGM
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawMessage_WaitingCountGM(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMessage_WaitingCountGM");

	AwHudPart_DisplayEvent_DrawMessage_WaitingCountGM_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMessage_StartDefence
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawMessage_StartDefence(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMessage_StartDefence");

	AwHudPart_DisplayEvent_DrawMessage_StartDefence_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMessage_Start
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawMessage_Start(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMessage_Start");

	AwHudPart_DisplayEvent_DrawMessage_Start_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMessage_Go
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawMessage_Go(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMessage_Go");

	AwHudPart_DisplayEvent_DrawMessage_Go_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawEffect
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          StartTime                      (Parm)
// int                            iAlpha                         (Parm)

void AwHudPart_DisplayEvent::DrawEffect(class UCanvas* C, float StartTime, int iAlpha)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawEffect");

	AwHudPart_DisplayEvent_DrawEffect_Params params;
	params.C = C;
	params.StartTime = StartTime;
	params.iAlpha = iAlpha;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMessageHeadShotAndMultiKill
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FString                 sMessage                       (Parm, NeedCtorLink)
// bool                           bAddPosY                       (Parm)
// float                          fFontSize                      (Parm)
// struct FColor                  _colorShadow                   (Parm)

void AwHudPart_DisplayEvent::DrawMessageHeadShotAndMultiKill(class UCanvas* C, const struct FString& sMessage, bool bAddPosY, float fFontSize, const struct FColor& _colorShadow)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMessageHeadShotAndMultiKill");

	AwHudPart_DisplayEvent_DrawMessageHeadShotAndMultiKill_Params params;
	params.C = C;
	params.sMessage = sMessage;
	params.bAddPosY = bAddPosY;
	params.fFontSize = fFontSize;
	params._colorShadow = _colorShadow;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMessageDomi_Capture
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FDigitSet               WDigit                         (Parm)
// struct FNumericWidget          WRegion                        (Parm)
// struct FSpriteWidget           WMessage                       (Parm)
// bool                           CaptureDoing                   (Parm)
// float                          ProgressPct                    (OptionalParm, Parm)

void AwHudPart_DisplayEvent::DrawMessageDomi_Capture(class UCanvas* C, const struct FDigitSet& WDigit, const struct FNumericWidget& WRegion, const struct FSpriteWidget& WMessage, bool CaptureDoing, float ProgressPct)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMessageDomi_Capture");

	AwHudPart_DisplayEvent_DrawMessageDomi_Capture_Params params;
	params.C = C;
	params.WDigit = WDigit;
	params.WRegion = WRegion;
	params.WMessage = WMessage;
	params.CaptureDoing = CaptureDoing;
	params.ProgressPct = ProgressPct;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMessageSD_BombDoingAndDone
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FSpriteWidget           WMessage                       (Parm)
// bool                           SDDoing                        (Parm)
// float                          ProgressPct                    (OptionalParm, Parm)

void AwHudPart_DisplayEvent::DrawMessageSD_BombDoingAndDone(class UCanvas* C, const struct FSpriteWidget& WMessage, bool SDDoing, float ProgressPct)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMessageSD_BombDoingAndDone");

	AwHudPart_DisplayEvent_DrawMessageSD_BombDoingAndDone_Params params;
	params.C = C;
	params.WMessage = WMessage;
	params.SDDoing = SDDoing;
	params.ProgressPct = ProgressPct;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawMessageSD_BombEnable
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FSpriteWidget           WKey                           (Parm)
// struct FSpriteWidget           WMessage                       (Parm)

void AwHudPart_DisplayEvent::DrawMessageSD_BombEnable(class UCanvas* C, const struct FSpriteWidget& WKey, const struct FSpriteWidget& WMessage)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawMessageSD_BombEnable");

	AwHudPart_DisplayEvent_DrawMessageSD_BombEnable_Params params;
	params.C = C;
	params.WKey = WKey;
	params.WMessage = WMessage;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawInvincibleGauge
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawInvincibleGauge(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawInvincibleGauge");

	AwHudPart_DisplayEvent_DrawInvincibleGauge_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawGauge2
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          fProgressPct                   (Parm)
// float                          PosX                           (Parm)
// float                          PosY                           (Parm)

void AwHudPart_DisplayEvent::DrawGauge2(class UCanvas* C, float fProgressPct, float PosX, float PosY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawGauge2");

	AwHudPart_DisplayEvent_DrawGauge2_Params params;
	params.C = C;
	params.fProgressPct = fProgressPct;
	params.PosX = PosX;
	params.PosY = PosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Respawn
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DisplayEvent_Respawn(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Respawn");

	AwHudPart_DisplayEvent_DisplayEvent_Respawn_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawGauge
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          fProgressPct                   (Parm)

void AwHudPart_DisplayEvent::DrawGauge(class UCanvas* C, float fProgressPct)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawGauge");

	AwHudPart_DisplayEvent_DrawGauge_Params params;
	params.C = C;
	params.fProgressPct = fProgressPct;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawHelpBG
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            OffsetX                        (OptionalParm, Parm)
// int                            OffsetY                        (OptionalParm, Parm)
// int                            iWidth                         (OptionalParm, Parm)
// int                            iHeight                        (OptionalParm, Parm)

void AwHudPart_DisplayEvent::DrawHelpBG(class UCanvas* C, int OffsetX, int OffsetY, int iWidth, int iHeight)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawHelpBG");

	AwHudPart_DisplayEvent_DrawHelpBG_Params params;
	params.C = C;
	params.OffsetX = OffsetX;
	params.OffsetY = OffsetY;
	params.iWidth = iWidth;
	params.iHeight = iHeight;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.Draw_Item_Skill
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APlayerReplicationInfo*  curPRI                         (Parm)

void AwHudPart_DisplayEvent::Draw_Item_Skill(class UCanvas* C, class APlayerReplicationInfo* curPRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.Draw_Item_Skill");

	AwHudPart_DisplayEvent_Draw_Item_Skill_Params params;
	params.C = C;
	params.curPRI = curPRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.Draw_Item_Supply
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APlayerReplicationInfo*  curPRI                         (Parm)

void AwHudPart_DisplayEvent::Draw_Item_Supply(class UCanvas* C, class APlayerReplicationInfo* curPRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.Draw_Item_Supply");

	AwHudPart_DisplayEvent_Draw_Item_Supply_Params params;
	params.C = C;
	params.curPRI = curPRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawEvent_Item
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DrawEvent_Item(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawEvent_Item");

	AwHudPart_DisplayEvent_DrawEvent_Item_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_UsingSkill
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DisplayEvent_Skill_UsingSkill(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_UsingSkill");

	AwHudPart_DisplayEvent_DisplayEvent_Skill_UsingSkill_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_UAV
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DisplayEvent_Skill_UAV(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_UAV");

	AwHudPart_DisplayEvent_DisplayEvent_Skill_UAV_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_AirStirke
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DisplayEvent_Skill_AirStirke(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_AirStirke");

	AwHudPart_DisplayEvent_DisplayEvent_Skill_AirStirke_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_State
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FSpriteWidget           WMessage                       (Parm)
// struct FSpriteWidget           skillIcon                      (OptionalParm, Parm)
// bool                           bDrawing                       (OptionalParm, Parm)

void AwHudPart_DisplayEvent::DisplayEvent_Skill_State(class UCanvas* C, const struct FSpriteWidget& WMessage, const struct FSpriteWidget& skillIcon, bool bDrawing)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_State");

	AwHudPart_DisplayEvent_DisplayEvent_Skill_State_Params params;
	params.C = C;
	params.WMessage = WMessage;
	params.skillIcon = skillIcon;
	params.bDrawing = bDrawing;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.CallSkill
// (Defined, Public)
// Parameters:
// int                            iKey                           (OptionalParm, Parm)
// bool                           bRequire                       (OptionalParm, Parm)
// bool                           iSucess                        (OptionalParm, Parm)

void AwHudPart_DisplayEvent::CallSkill(int iKey, bool bRequire, bool iSucess)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.CallSkill");

	AwHudPart_DisplayEvent_CallSkill_Params params;
	params.iKey = iKey;
	params.bRequire = bRequire;
	params.iSucess = iSucess;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_Helicopter
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayEvent::DisplayEvent_Skill_Helicopter(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_Helicopter");

	AwHudPart_DisplayEvent_DisplayEvent_Skill_Helicopter_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DrawEvent_Item_HealthPack
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            AddHp                          (OptionalParm, Parm)

void AwHudPart_DisplayEvent::DrawEvent_Item_HealthPack(class UCanvas* C, int AddHp)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DrawEvent_Item_HealthPack");

	AwHudPart_DisplayEvent_DrawEvent_Item_HealthPack_Params params;
	params.C = C;
	params.AddHp = AddHp;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.SetSkillState
// (Defined, Public)
// Parameters:
// int                            skillC4                        (Parm)
// int                            skillAirStirke                 (Parm)
// int                            SkillRPG7                      (Parm)

void AwHudPart_DisplayEvent::SetSkillState(int skillC4, int skillAirStirke, int SkillRPG7)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.SetSkillState");

	AwHudPart_DisplayEvent_SetSkillState_Params params;
	params.skillC4 = skillC4;
	params.skillAirStirke = skillAirStirke;
	params.SkillRPG7 = SkillRPG7;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisPlayEvent_Waiting
// (Defined, Public)
// Parameters:
// struct FString                 Message                        (Parm, NeedCtorLink)

void AwHudPart_DisplayEvent::DisPlayEvent_Waiting(const struct FString& Message)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisPlayEvent_Waiting");

	AwHudPart_DisplayEvent_DisPlayEvent_Waiting_Params params;
	params.Message = Message;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.UpdateHelpKeyControll
// (Defined, Public)

void AwHudPart_DisplayEvent::UpdateHelpKeyControll()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.UpdateHelpKeyControll");

	AwHudPart_DisplayEvent_UpdateHelpKeyControll_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.UpdateHUD
// (Defined, Public)

void AwHudPart_DisplayEvent::UpdateHUD()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.UpdateHUD");

	AwHudPart_DisplayEvent_UpdateHUD_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.PlaySound_Event
// (Defined, Public)

void AwHudPart_DisplayEvent::PlaySound_Event()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.PlaySound_Event");

	AwHudPart_DisplayEvent_PlaySound_Event_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_CountDown
// (Defined, Public)
// Parameters:
// int                            iCount                         (Parm)

void AwHudPart_DisplayEvent::DisplayEvent_CountDown(int iCount)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisplayEvent_CountDown");

	AwHudPart_DisplayEvent_DisplayEvent_CountDown_Params params;
	params.iCount = iCount;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisPlayEvent_EndWaitingForStart
// (Defined, Public)

void AwHudPart_DisplayEvent::DisPlayEvent_EndWaitingForStart()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisPlayEvent_EndWaitingForStart");

	AwHudPart_DisplayEvent_DisPlayEvent_EndWaitingForStart_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.DisPlayEvent_BeginWaitingForStart
// (Defined, Public)

void AwHudPart_DisplayEvent::DisPlayEvent_BeginWaitingForStart()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.DisPlayEvent_BeginWaitingForStart");

	AwHudPart_DisplayEvent_DisPlayEvent_BeginWaitingForStart_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.CallEvent
// (Defined, Public)
// Parameters:
// bool                           ItemCheck                      (OptionalParm, Parm)
// int                            iReservation1                  (OptionalParm, Parm)
// int                            iReservation2                  (OptionalParm, Parm)

void AwHudPart_DisplayEvent::CallEvent(bool ItemCheck, int iReservation1, int iReservation2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.CallEvent");

	AwHudPart_DisplayEvent_CallEvent_Params params;
	params.ItemCheck = ItemCheck;
	params.iReservation1 = iReservation1;
	params.iReservation2 = iReservation2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayEvent.Initialize
// (Defined, Public)
// Parameters:
// class AHudBase*                myOwner                        (Parm)
// class ALevelInfo*              Level                          (Parm)

void AwHudPart_DisplayEvent::Initialize(class AHudBase* myOwner, class ALevelInfo* Level)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayEvent.Initialize");

	AwHudPart_DisplayEvent_Initialize_Params params;
	params.myOwner = myOwner;
	params.Level = Level;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayMain.DrawSurvivedUsers
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayMain::DrawSurvivedUsers(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayMain.DrawSurvivedUsers");

	AwHudPart_DisplayMain_DrawSurvivedUsers_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayMain.DrawTextChattingHelp
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayMain::DrawTextChattingHelp(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayMain.DrawTextChattingHelp");

	AwHudPart_DisplayMain_DrawTextChattingHelp_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayMain.DrawHas2Skill
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayMain::DrawHas2Skill(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayMain.DrawHas2Skill");

	AwHudPart_DisplayMain_DrawHas2Skill_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayMain.DrawHas3Skill
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayMain::DrawHas3Skill(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayMain.DrawHas3Skill");

	AwHudPart_DisplayMain_DrawHas3Skill_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayMain.DrawHasSkill
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayMain::DrawHasSkill(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayMain.DrawHasSkill");

	AwHudPart_DisplayMain_DrawHasSkill_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayMain.CheckOwnerSkill
// (Defined, Public)

void AwHudPart_DisplayMain::CheckOwnerSkill()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayMain.CheckOwnerSkill");

	AwHudPart_DisplayMain_CheckOwnerSkill_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayMain.DrawBlinkActiveKey
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayMain::DrawBlinkActiveKey(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayMain.DrawBlinkActiveKey");

	AwHudPart_DisplayMain_DrawBlinkActiveKey_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayMain.DrawHelpKeyControll_Bomb
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayMain::DrawHelpKeyControll_Bomb(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayMain.DrawHelpKeyControll_Bomb");

	AwHudPart_DisplayMain_DrawHelpKeyControll_Bomb_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayMain.DrawHelpKeyControll
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayMain::DrawHelpKeyControll(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayMain.DrawHelpKeyControll");

	AwHudPart_DisplayMain_DrawHelpKeyControll_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayMain.DrawSpectating
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayMain::DrawSpectating(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayMain.DrawSpectating");

	AwHudPart_DisplayMain_DrawSpectating_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayMain.DrawA
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayMain::DrawA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayMain.DrawA");

	AwHudPart_DisplayMain_DrawA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayMain.SendHostPointInGame
// (Defined, Public)

void AwHudPart_DisplayMain::SendHostPointInGame()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayMain.SendHostPointInGame");

	AwHudPart_DisplayMain_SendHostPointInGame_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayMain.UpdateHelpKeyControll
// (Defined, Public)

void AwHudPart_DisplayMain::UpdateHelpKeyControll()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayMain.UpdateHelpKeyControll");

	AwHudPart_DisplayMain_UpdateHelpKeyControll_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayMain.UpdateHelpKey_Slot
// (Defined, Public)
// Parameters:
// unsigned char                  iIndex                         (Parm)
// bool                           bEnable                        (Parm)

void AwHudPart_DisplayMain::UpdateHelpKey_Slot(unsigned char iIndex, bool bEnable)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayMain.UpdateHelpKey_Slot");

	AwHudPart_DisplayMain_UpdateHelpKey_Slot_Params params;
	params.iIndex = iIndex;
	params.bEnable = bEnable;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayMain.DisplayEvent_ActiveSkill
// (Defined, Public)

void AwHudPart_DisplayMain::DisplayEvent_ActiveSkill()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayMain.DisplayEvent_ActiveSkill");

	AwHudPart_DisplayMain_DisplayEvent_ActiveSkill_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayMain.CallEvent
// (Defined, Public)
// Parameters:
// bool                           ItemCheck                      (OptionalParm, Parm)
// int                            iReservation1                  (OptionalParm, Parm)
// int                            iReservation2                  (OptionalParm, Parm)

void AwHudPart_DisplayMain::CallEvent(bool ItemCheck, int iReservation1, int iReservation2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayMain.CallEvent");

	AwHudPart_DisplayMain_CallEvent_Params params;
	params.ItemCheck = ItemCheck;
	params.iReservation1 = iReservation1;
	params.iReservation2 = iReservation2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_RadioMessage.DrawRadioMessage
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iMessage                       (Parm)
// int                            iHeight                        (Parm)
// struct FString                 sMessage                       (Parm, NeedCtorLink)

void AwHudPart_RadioMessage::DrawRadioMessage(class UCanvas* C, int iMessage, int iHeight, const struct FString& sMessage)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_RadioMessage.DrawRadioMessage");

	AwHudPart_RadioMessage_DrawRadioMessage_Params params;
	params.C = C;
	params.iMessage = iMessage;
	params.iHeight = iHeight;
	params.sMessage = sMessage;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_RadioMessage.GetRadioType
// (Defined, Public)
// Parameters:
// TEnumAsByte<ERMType>           ReturnValue                    (Parm, OutParm, ReturnParm)

TEnumAsByte<ERMType> AwHudPart_RadioMessage::GetRadioType()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_RadioMessage.GetRadioType");

	AwHudPart_RadioMessage_GetRadioType_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_RadioMessage.SetRadioType
// (Defined, Public)
// Parameters:
// TEnumAsByte<ERMType>           _ERMType                       (Parm)

void AwHudPart_RadioMessage::SetRadioType(TEnumAsByte<ERMType> _ERMType)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_RadioMessage.SetRadioType");

	AwHudPart_RadioMessage_SetRadioType_Params params;
	params._ERMType = _ERMType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_RadioMessage.DrawA
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_RadioMessage::DrawA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_RadioMessage.DrawA");

	AwHudPart_RadioMessage_DrawA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_RadioMessage.ResetRadioMessage
// (Defined, Public)

void AwHudPart_RadioMessage::ResetRadioMessage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_RadioMessage.ResetRadioMessage");

	AwHudPart_RadioMessage_ResetRadioMessage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_RadioMessage.CallRadioMessage
// (Defined, Public)
// Parameters:
// int                            iKey                           (OptionalParm, Parm)
// int                            iReservation1                  (OptionalParm, Parm)
// int                            iReservation2                  (OptionalParm, Parm)

void AwHudPart_RadioMessage::CallRadioMessage(int iKey, int iReservation1, int iReservation2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_RadioMessage.CallRadioMessage");

	AwHudPart_RadioMessage_CallRadioMessage_Params params;
	params.iKey = iKey;
	params.iReservation1 = iReservation1;
	params.iReservation2 = iReservation2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_RadioMessage.UpdateHelpKeyControll
// (Defined, Public)

void AwHudPart_RadioMessage::UpdateHelpKeyControll()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_RadioMessage.UpdateHelpKeyControll");

	AwHudPart_RadioMessage_UpdateHelpKeyControll_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_RadioMessage.Initialize
// (Defined, Public)
// Parameters:
// class AHudBase*                myOwner                        (Parm)
// class ALevelInfo*              Level                          (Parm)

void AwHudPart_RadioMessage::Initialize(class AHudBase* myOwner, class ALevelInfo* Level)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_RadioMessage.Initialize");

	AwHudPart_RadioMessage_Initialize_Params params;
	params.myOwner = myOwner;
	params.Level = Level;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayQuest.PushMessage
// (Defined, Public)
// Parameters:
// struct FString                 MissionDesc                    (Parm, NeedCtorLink)
// int                            cur                            (Parm)
// int                            Max                            (Parm)

void AwHudPart_DisplayQuest::PushMessage(const struct FString& MissionDesc, int cur, int Max)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayQuest.PushMessage");

	AwHudPart_DisplayQuest_PushMessage_Params params;
	params.MissionDesc = MissionDesc;
	params.cur = cur;
	params.Max = Max;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayQuest.ReceivedAccomplishMission100Percent
// (Defined, Public)
// Parameters:
// struct FString                 MissionDesc                    (Parm, NeedCtorLink)
// int                            cur                            (Parm)
// int                            Max                            (Parm)

void AwHudPart_DisplayQuest::ReceivedAccomplishMission100Percent(const struct FString& MissionDesc, int cur, int Max)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayQuest.ReceivedAccomplishMission100Percent");

	AwHudPart_DisplayQuest_ReceivedAccomplishMission100Percent_Params params;
	params.MissionDesc = MissionDesc;
	params.cur = cur;
	params.Max = Max;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayQuest.ReceivedAccomplishMission75Percent
// (Defined, Public)
// Parameters:
// struct FString                 MissionDesc                    (Parm, NeedCtorLink)
// int                            cur                            (Parm)
// int                            Max                            (Parm)

void AwHudPart_DisplayQuest::ReceivedAccomplishMission75Percent(const struct FString& MissionDesc, int cur, int Max)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayQuest.ReceivedAccomplishMission75Percent");

	AwHudPart_DisplayQuest_ReceivedAccomplishMission75Percent_Params params;
	params.MissionDesc = MissionDesc;
	params.cur = cur;
	params.Max = Max;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayQuest.ReceivedAccomplishMission50Percent
// (Defined, Public)
// Parameters:
// struct FString                 MissionDesc                    (Parm, NeedCtorLink)
// int                            cur                            (Parm)
// int                            Max                            (Parm)

void AwHudPart_DisplayQuest::ReceivedAccomplishMission50Percent(const struct FString& MissionDesc, int cur, int Max)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayQuest.ReceivedAccomplishMission50Percent");

	AwHudPart_DisplayQuest_ReceivedAccomplishMission50Percent_Params params;
	params.MissionDesc = MissionDesc;
	params.cur = cur;
	params.Max = Max;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayQuest.ReceivedAccomplishMission25Percent
// (Defined, Public)
// Parameters:
// struct FString                 MissionDesc                    (Parm, NeedCtorLink)
// int                            cur                            (Parm)
// int                            Max                            (Parm)

void AwHudPart_DisplayQuest::ReceivedAccomplishMission25Percent(const struct FString& MissionDesc, int cur, int Max)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayQuest.ReceivedAccomplishMission25Percent");

	AwHudPart_DisplayQuest_ReceivedAccomplishMission25Percent_Params params;
	params.MissionDesc = MissionDesc;
	params.cur = cur;
	params.Max = Max;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayQuest.HasMessage
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHudPart_DisplayQuest::HasMessage()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayQuest.HasMessage");

	AwHudPart_DisplayQuest_HasMessage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_DisplayQuest.DrawGauge
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          fProgressPct                   (Parm)
// float                          PosX                           (Parm)
// float                          PosY                           (Parm)

void AwHudPart_DisplayQuest::DrawGauge(class UCanvas* C, float fProgressPct, float PosX, float PosY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayQuest.DrawGauge");

	AwHudPart_DisplayQuest_DrawGauge_Params params;
	params.C = C;
	params.fProgressPct = fProgressPct;
	params.PosX = PosX;
	params.PosY = PosY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayQuest.DrawSpectating
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayQuest::DrawSpectating(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayQuest.DrawSpectating");

	AwHudPart_DisplayQuest_DrawSpectating_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayQuest.DrawProgress
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayQuest::DrawProgress(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayQuest.DrawProgress");

	AwHudPart_DisplayQuest_DrawProgress_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayQuest.DrawHudPassA
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_DisplayQuest::DrawHudPassA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayQuest.DrawHudPassA");

	AwHudPart_DisplayQuest_DrawHudPassA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_DisplayQuest.Initialize
// (Defined, Public)
// Parameters:
// class AHudBase*                myOwner                        (Parm)
// class ALevelInfo*              Level                          (Parm)

void AwHudPart_DisplayQuest::Initialize(class AHudBase* myOwner, class ALevelInfo* Level)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_DisplayQuest.Initialize");

	AwHudPart_DisplayQuest_Initialize_Params params;
	params.myOwner = myOwner;
	params.Level = Level;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_Minimap.DrawMinimap_Airstrike
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_Minimap::DrawMinimap_Airstrike(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_Minimap.DrawMinimap_Airstrike");

	AwHudPart_Minimap_DrawMinimap_Airstrike_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_ItemBuy.Timer
// (Defined, Public)

void AwHudPart_ItemBuy::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_ItemBuy.Timer");

	AwHudPart_ItemBuy_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_ItemBuy.CallItemBuy
// (Defined, Public)
// Parameters:
// int                            iKey                           (OptionalParm, Parm)
// int                            iReservation1                  (OptionalParm, Parm)
// int                            iReservation2                  (OptionalParm, Parm)

void AwHudPart_ItemBuy::CallItemBuy(int iKey, int iReservation1, int iReservation2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_ItemBuy.CallItemBuy");

	AwHudPart_ItemBuy_CallItemBuy_Params params;
	params.iKey = iKey;
	params.iReservation1 = iReservation1;
	params.iReservation2 = iReservation2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_ItemBuy.SortItemList
// (Defined, Simulated, Public)

void AwHudPart_ItemBuy::SortItemList()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_ItemBuy.SortItemList");

	AwHudPart_ItemBuy_SortItemList_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_ItemBuy.InOrder
// (Defined, Simulated, Public)
// Parameters:
// struct FstItemInfo             P1                             (Parm)
// struct FstItemInfo             P2                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHudPart_ItemBuy::InOrder(const struct FstItemInfo& P1, const struct FstItemInfo& P2)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_ItemBuy.InOrder");

	AwHudPart_ItemBuy_InOrder_Params params;
	params.P1 = P1;
	params.P2 = P2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.wHudPart_ItemBuy.SetItemList
// (Defined, Simulated, Public)

void AwHudPart_ItemBuy::SetItemList()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_ItemBuy.SetItemList");

	AwHudPart_ItemBuy_SetItemList_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_ItemBuy.DrawItemList
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            iPosX                          (Parm)
// int                            iPosY                          (Parm)
// int                            Index                          (Parm)

void AwHudPart_ItemBuy::DrawItemList(class UCanvas* C, int iPosX, int iPosY, int Index)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_ItemBuy.DrawItemList");

	AwHudPart_ItemBuy_DrawItemList_Params params;
	params.C = C;
	params.iPosX = iPosX;
	params.iPosY = iPosY;
	params.Index = Index;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_ItemBuy.DrawItemWindow
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_ItemBuy::DrawItemWindow(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_ItemBuy.DrawItemWindow");

	AwHudPart_ItemBuy_DrawItemWindow_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_ItemBuy.DrawHudPassA
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_ItemBuy::DrawHudPassA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_ItemBuy.DrawHudPassA");

	AwHudPart_ItemBuy_DrawHudPassA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_ItemBuy.Initialize
// (Defined, Public)
// Parameters:
// class AHudBase*                myOwner                        (Parm)
// class ALevelInfo*              _level                         (Parm)

void AwHudPart_ItemBuy::Initialize(class AHudBase* myOwner, class ALevelInfo* _level)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_ItemBuy.Initialize");

	AwHudPart_ItemBuy_Initialize_Params params;
	params.myOwner = myOwner;
	params._level = _level;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wScoreboardPart_Minimap.CalculateMinimapSize
// (Defined, Public)
// Parameters:
// float                          fWidth                         (Parm, OutParm)
// float                          fHeight                        (Parm, OutParm)

void AwScoreboardPart_Minimap::CalculateMinimapSize(float* fWidth, float* fHeight)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wScoreboardPart_Minimap.CalculateMinimapSize");

	AwScoreboardPart_Minimap_CalculateMinimapSize_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (fWidth != nullptr)
		*fWidth = params.fWidth;
	if (fHeight != nullptr)
		*fHeight = params.fHeight;
}


// Function XInterface.wScoreboardPart_Minimap.CalculateWorldPostionToMinimapPosition
// (Defined, Public)
// Parameters:
// struct FVector                 Location                       (Parm)
// float                          mx                             (Parm, OutParm)
// float                          my                             (Parm, OutParm)

void AwScoreboardPart_Minimap::CalculateWorldPostionToMinimapPosition(const struct FVector& Location, float* mx, float* my)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wScoreboardPart_Minimap.CalculateWorldPostionToMinimapPosition");

	AwScoreboardPart_Minimap_CalculateWorldPostionToMinimapPosition_Params params;
	params.Location = Location;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (mx != nullptr)
		*mx = params.mx;
	if (my != nullptr)
		*my = params.my;
}


// Function XInterface.wScoreboardPart_Minimap.CalculateTexturePositionFromMinimapPosition
// (Defined, Public)
// Parameters:
// float                          minimapX                       (Parm)
// float                          minimapY                       (Parm)
// int                            TX                             (Parm, OutParm)
// int                            ty                             (Parm, OutParm)

void AwScoreboardPart_Minimap::CalculateTexturePositionFromMinimapPosition(float minimapX, float minimapY, int* TX, int* ty)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wScoreboardPart_Minimap.CalculateTexturePositionFromMinimapPosition");

	AwScoreboardPart_Minimap_CalculateTexturePositionFromMinimapPosition_Params params;
	params.minimapX = minimapX;
	params.minimapY = minimapY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (TX != nullptr)
		*TX = params.TX;
	if (ty != nullptr)
		*ty = params.ty;
}


// Function XInterface.wScoreboardPart_Minimap.CalculateMinimapPosition
// (Defined, Public)
// Parameters:
// struct FVector                 centerLoc                      (Parm)
// struct FRotator                centerRotation                 (Parm)
// struct FVector                 TargetLoc                      (Parm)
// float                          minimapX                       (Parm, OutParm)
// float                          minimapY                       (Parm, OutParm)

void AwScoreboardPart_Minimap::CalculateMinimapPosition(const struct FVector& centerLoc, const struct FRotator& centerRotation, const struct FVector& TargetLoc, float* minimapX, float* minimapY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wScoreboardPart_Minimap.CalculateMinimapPosition");

	AwScoreboardPart_Minimap_CalculateMinimapPosition_Params params;
	params.centerLoc = centerLoc;
	params.centerRotation = centerRotation;
	params.TargetLoc = TargetLoc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (minimapX != nullptr)
		*minimapX = params.minimapX;
	if (minimapY != nullptr)
		*minimapY = params.minimapY;
}


// Function XInterface.wScoreboardPart_Minimap.SetupMinimapSpriteWidgetForDrawing
// (Defined, Public)
// Parameters:
// struct FSpriteWidget           Sprite                         (Parm, OutParm)
// struct FRotator                Rotation                       (Parm)
// float                          minimapX                       (Parm)
// float                          minimapY                       (Parm)

void AwScoreboardPart_Minimap::SetupMinimapSpriteWidgetForDrawing(const struct FRotator& Rotation, float minimapX, float minimapY, struct FSpriteWidget* Sprite)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wScoreboardPart_Minimap.SetupMinimapSpriteWidgetForDrawing");

	AwScoreboardPart_Minimap_SetupMinimapSpriteWidgetForDrawing_Params params;
	params.Rotation = Rotation;
	params.minimapX = minimapX;
	params.minimapY = minimapY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Sprite != nullptr)
		*Sprite = params.Sprite;
}


// Function XInterface.wScoreboardPart_Minimap.CalcMinimapRotation
// (Defined, Public)
// Parameters:
// struct FRotator                Rotation                       (Parm)
// struct FRotator                outRotation                    (Parm, OutParm)

void AwScoreboardPart_Minimap::CalcMinimapRotation(const struct FRotator& Rotation, struct FRotator* outRotation)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wScoreboardPart_Minimap.CalcMinimapRotation");

	AwScoreboardPart_Minimap_CalcMinimapRotation_Params params;
	params.Rotation = Rotation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (outRotation != nullptr)
		*outRotation = params.outRotation;
}


// Function XInterface.wScoreboardPart_Minimap.DrawMinimap_Airstrike
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwScoreboardPart_Minimap::DrawMinimap_Airstrike(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wScoreboardPart_Minimap.DrawMinimap_Airstrike");

	AwScoreboardPart_Minimap_DrawMinimap_Airstrike_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wScoreboardPart_Minimap.DrawMinimap_Myself
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwScoreboardPart_Minimap::DrawMinimap_Myself(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wScoreboardPart_Minimap.DrawMinimap_Myself");

	AwScoreboardPart_Minimap_DrawMinimap_Myself_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wScoreboardPart_Minimap.SetupBGMapUAV
// (Defined, Public)

void AwScoreboardPart_Minimap::SetupBGMapUAV()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wScoreboardPart_Minimap.SetupBGMapUAV");

	AwScoreboardPart_Minimap_SetupBGMapUAV_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wScoreboardPart_Minimap.DrawMinimap_BGMap
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwScoreboardPart_Minimap::DrawMinimap_BGMap(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wScoreboardPart_Minimap.DrawMinimap_BGMap");

	AwScoreboardPart_Minimap_DrawMinimap_BGMap_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wScoreboardPart_Minimap.DrawMinimap_CombatSituation
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwScoreboardPart_Minimap::DrawMinimap_CombatSituation(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wScoreboardPart_Minimap.DrawMinimap_CombatSituation");

	AwScoreboardPart_Minimap_DrawMinimap_CombatSituation_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wScoreboardPart_Minimap.Draw
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwScoreboardPart_Minimap::Draw(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wScoreboardPart_Minimap.Draw");

	AwScoreboardPart_Minimap_Draw_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wScoreboardPart_Minimap.Initialize
// (Defined, Public)
// Parameters:
// class AHudBase*                myOwner                        (Parm)
// class ALevelInfo*              myLevel                        (Parm)

void AwScoreboardPart_Minimap::Initialize(class AHudBase* myOwner, class ALevelInfo* myLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wScoreboardPart_Minimap.Initialize");

	AwScoreboardPart_Minimap_Initialize_Params params;
	params.myOwner = myOwner;
	params.myLevel = myLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.BTHUDColorPoolHK.DefaultShadow
// (Defined, Static, Public)
// Parameters:
// struct FColor                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FColor UBTHUDColorPoolHK::STATIC_DefaultShadow()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.BTHUDColorPoolHK.DefaultShadow");

	UBTHUDColorPoolHK_DefaultShadow_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.BTHUDColorPoolHK.DefaultWhite
// (Defined, Static, Public)
// Parameters:
// struct FColor                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FColor UBTHUDColorPoolHK::STATIC_DefaultWhite()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.BTHUDColorPoolHK.DefaultWhite");

	UBTHUDColorPoolHK_DefaultWhite_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.ScoreBoardTeamDeathMatch.DrawTeam
// (Defined, Public)
// Parameters:
// int                            TeamNum                        (Parm)
// int                            PlayerCount                    (Parm)
// int                            OwnerOffset                    (Parm)
// class UCanvas*                 Canvas                         (Parm)
// int                            FontReduction                  (Parm)
// int                            BoxSpaceY                      (Parm)
// int                            PlayerBoxSizeY                 (Parm)
// int                            HeaderOffsetY                  (Parm)

void AScoreBoardTeamDeathMatch::DrawTeam(int TeamNum, int PlayerCount, int OwnerOffset, class UCanvas* Canvas, int FontReduction, int BoxSpaceY, int PlayerBoxSizeY, int HeaderOffsetY)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ScoreBoardTeamDeathMatch.DrawTeam");

	AScoreBoardTeamDeathMatch_DrawTeam_Params params;
	params.TeamNum = TeamNum;
	params.PlayerCount = PlayerCount;
	params.OwnerOffset = OwnerOffset;
	params.Canvas = Canvas;
	params.FontReduction = FontReduction;
	params.BoxSpaceY = BoxSpaceY;
	params.PlayerBoxSizeY = PlayerBoxSizeY;
	params.HeaderOffsetY = HeaderOffsetY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ScoreBoardTeamDeathMatch.UpdateScoreBoard
// (Defined, Simulated, Event, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)

void AScoreBoardTeamDeathMatch::UpdateScoreBoard(class UCanvas* Canvas)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ScoreBoardTeamDeathMatch.UpdateScoreBoard");

	AScoreBoardTeamDeathMatch_UpdateScoreBoard_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.ScoreBoardTeamDeathMatch.UpdatePrecacheMaterials
// (Defined, Simulated, Public)

void AScoreBoardTeamDeathMatch::UpdatePrecacheMaterials()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.ScoreBoardTeamDeathMatch.UpdatePrecacheMaterials");

	AScoreBoardTeamDeathMatch_UpdatePrecacheMaterials_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.wHudPart_SelectQSlot_AlienMode.CalcQuickSlotTimer
// (Defined, Public)
// Parameters:
// int                            respawnLeftTime                (Parm, OutParm)
// int                            startupLeftTime                (Parm, OutParm)

void AwHudPart_SelectQSlot_AlienMode::CalcQuickSlotTimer(int* respawnLeftTime, int* startupLeftTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.wHudPart_SelectQSlot_AlienMode.CalcQuickSlotTimer");

	AwHudPart_SelectQSlot_AlienMode_CalcQuickSlotTimer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (respawnLeftTime != nullptr)
		*respawnLeftTime = params.respawnLeftTime;
	if (startupLeftTime != nullptr)
		*startupLeftTime = params.startupLeftTime;
}


// Function XInterface.GUIComboButton.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIComboButton::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIComboButton.InitComponent");

	UGUIComboButton_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageListBox.Clear
// (Defined, Public)

void UGUIVertImageListBox::Clear()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageListBox.Clear");

	UGUIVertImageListBox_Clear_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageListBox.MyClose
// (Defined, Public)
// Parameters:
// class UGUIContextMenu*         Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertImageListBox::MyClose(class UGUIContextMenu* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageListBox.MyClose");

	UGUIVertImageListBox_MyClose_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageListBox.MyOpen
// (Defined, Public)
// Parameters:
// class UGUIContextMenu*         Menu                           (ExportObject, Parm, NeedCtorLink, EditInline)
// class UGUIComponent*           ContextMenuOwner               (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertImageListBox::MyOpen(class UGUIContextMenu* Menu, class UGUIComponent* ContextMenuOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageListBox.MyOpen");

	UGUIVertImageListBox_MyOpen_Params params;
	params.Menu = Menu;
	params.ContextMenuOwner = ContextMenuOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageListBox.AddImage
// (Defined, Public)
// Parameters:
// class UMaterial*               Image                          (Parm)
// int                            Item                           (OptionalParm, Parm)

void UGUIVertImageListBox::AddImage(class UMaterial* Image, int Item)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageListBox.AddImage");

	UGUIVertImageListBox_AddImage_Params params;
	params.Image = Image;
	params.Item = Item;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageListBox.ItemCount
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UGUIVertImageListBox::ItemCount()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageListBox.ItemCount");

	UGUIVertImageListBox_ItemCount_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageListBox.InternalOnChange
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIVertImageListBox::InternalOnChange(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageListBox.InternalOnChange");

	UGUIVertImageListBox_InternalOnChange_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageListBox.InternalOnClick
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGUIVertImageListBox::InternalOnClick(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageListBox.InternalOnClick");

	UGUIVertImageListBox_InternalOnClick_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.GUIVertImageListBox.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIVertImageListBox::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageListBox.InitComponent");

	UGUIVertImageListBox_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.GUIVertImageListBox.InitBaseList
// (Defined, Public)
// Parameters:
// class UGUIListBase*            LocalList                      (ExportObject, Parm, NeedCtorLink, EditInline)

void UGUIVertImageListBox::InitBaseList(class UGUIListBase* LocalList)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.GUIVertImageListBox.InitBaseList");

	UGUIVertImageListBox_InitBaseList_Params params;
	params.LocalList = LocalList;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGameResult.DrawScoreboard
// (Defined, Simulated, Event, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGameResult::DrawScoreboard(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGameResult.DrawScoreboard");

	AxScoreBoardTeamGameResult_DrawScoreboard_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGameResult.DrawMyInfo
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGameResult::DrawMyInfo(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGameResult.DrawMyInfo");

	AxScoreBoardTeamGameResult_DrawMyInfo_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGameResult.DrawTeamMember
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGameResult::DrawTeamMember(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGameResult.DrawTeamMember");

	AxScoreBoardTeamGameResult_DrawTeamMember_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGameResult.DrawTeam
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGameResult::DrawTeam(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGameResult.DrawTeam");

	AxScoreBoardTeamGameResult_DrawTeam_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGameResult.GetWinTeamIndex
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AxScoreBoardTeamGameResult::GetWinTeamIndex()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGameResult.GetWinTeamIndex");

	AxScoreBoardTeamGameResult_GetWinTeamIndex_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.xScoreBoardTeamGameResult.DrawContentDescription
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGameResult::DrawContentDescription(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGameResult.DrawContentDescription");

	AxScoreBoardTeamGameResult_DrawContentDescription_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGameResult.DrawBGs_O
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGameResult::DrawBGs_O(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGameResult.DrawBGs_O");

	AxScoreBoardTeamGameResult_DrawBGs_O_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGameResult.DrawTeamListSectionStripe
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGameResult::DrawTeamListSectionStripe(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGameResult.DrawTeamListSectionStripe");

	AxScoreBoardTeamGameResult_DrawTeamListSectionStripe_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGameResult.DrawTeamScore
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGameResult::DrawTeamScore(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGameResult.DrawTeamScore");

	AxScoreBoardTeamGameResult_DrawTeamScore_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGameResult.DrawBGS
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGameResult::DrawBGS(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGameResult.DrawBGS");

	AxScoreBoardTeamGameResult_DrawBGS_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGameResult.DrawBonusItem
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardTeamGameResult::DrawBonusItem(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGameResult.DrawBonusItem");

	AxScoreBoardTeamGameResult_DrawBonusItem_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardTeamGameResult.GetHudBaseOwner
// (Defined, Public)
// Parameters:
// class AHudBase*                ReturnValue                    (Parm, OutParm, ReturnParm)

class AHudBase* AxScoreBoardTeamGameResult::GetHudBaseOwner()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardTeamGameResult.GetHudBaseOwner");

	AxScoreBoardTeamGameResult_GetHudBaseOwner_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.xScoreBoardGameResult_Booty.DrawScoreboard
// (Defined, Simulated, Event, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardGameResult_Booty::DrawScoreboard(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardGameResult_Booty.DrawScoreboard");

	AxScoreBoardGameResult_Booty_DrawScoreboard_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardGameResult_Booty.DrawTeamMember
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardGameResult_Booty::DrawTeamMember(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardGameResult_Booty.DrawTeamMember");

	AxScoreBoardGameResult_Booty_DrawTeamMember_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardGameResult_Booty.DrawBootyInfo
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardGameResult_Booty::DrawBootyInfo(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardGameResult_Booty.DrawBootyInfo");

	AxScoreBoardGameResult_Booty_DrawBootyInfo_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardGameResult_Booty.DrawBGS
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AxScoreBoardGameResult_Booty::DrawBGS(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardGameResult_Booty.DrawBGS");

	AxScoreBoardGameResult_Booty_DrawBGS_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.xScoreBoardGameResult_Booty.GetHudBaseOwner
// (Defined, Public)
// Parameters:
// class AHudBase*                ReturnValue                    (Parm, OutParm, ReturnParm)

class AHudBase* AxScoreBoardGameResult_Booty::GetHudBaseOwner()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.xScoreBoardGameResult_Booty.GetHudBaseOwner");

	AxScoreBoardGameResult_Booty_GetHudBaseOwner_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.moEditBox.MaskText
// (Defined, Public)
// Parameters:
// bool                           B                              (Parm)

void UmoEditBox::MaskText(bool B)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.moEditBox.MaskText");

	UmoEditBox_MaskText_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.moEditBox.FloatOnly
// (Defined, Public)
// Parameters:
// bool                           B                              (Parm)

void UmoEditBox::FloatOnly(bool B)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.moEditBox.FloatOnly");

	UmoEditBox_FloatOnly_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.moEditBox.IntOnly
// (Defined, Public)
// Parameters:
// bool                           B                              (Parm)

void UmoEditBox::IntOnly(bool B)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.moEditBox.IntOnly");

	UmoEditBox_IntOnly_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.moEditBox.SetReadOnly
// (Defined, Public)
// Parameters:
// bool                           B                              (Parm)

void UmoEditBox::SetReadOnly(bool B)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.moEditBox.SetReadOnly");

	UmoEditBox_SetReadOnly_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.moEditBox.ReadOnly
// (Defined, Public)
// Parameters:
// bool                           B                              (Parm)

void UmoEditBox::ReadOnly(bool B)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.moEditBox.ReadOnly");

	UmoEditBox_ReadOnly_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.moEditBox.SetText
// (Defined, Public)
// Parameters:
// struct FString                 NewText                        (Parm, NeedCtorLink)

void UmoEditBox::SetText(const struct FString& NewText)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.moEditBox.SetText");

	UmoEditBox_SetText_Params params;
	params.NewText = NewText;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.moEditBox.GetText
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UmoEditBox::GetText()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.moEditBox.GetText");

	UmoEditBox_GetText_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.moEditBox.GetComponentValue
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UmoEditBox::GetComponentValue()
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.moEditBox.GetComponentValue");

	UmoEditBox_GetComponentValue_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XInterface.moEditBox.SetComponentValue
// (Defined, Public)
// Parameters:
// struct FString                 NewValue                       (Parm, CoerceParm, NeedCtorLink)
// bool                           bNoChange                      (OptionalParm, Parm)

void UmoEditBox::SetComponentValue(const struct FString& NewValue, bool bNoChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.moEditBox.SetComponentValue");

	UmoEditBox_SetComponentValue_Params params;
	params.NewValue = NewValue;
	params.bNoChange = bNoChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function XInterface.moEditBox.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UmoEditBox::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function XInterface.moEditBox.InitComponent");

	UmoEditBox_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
