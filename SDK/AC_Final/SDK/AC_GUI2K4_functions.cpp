// Artic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

#include "../SDK.hpp"

namespace Classes
{
//---------------------------------------------------------------------------
//Functions
//---------------------------------------------------------------------------

// Function GUI2K4.UT2K4GUIController.PurgeComponentClasses
// (Defined, Public)

void UUT2K4GUIController::PurgeComponentClasses()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4GUIController.PurgeComponentClasses");

	UUT2K4GUIController_PurgeComponentClasses_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.UT2K4GUIController.AddComponentClass
// (Defined, Public)
// Parameters:
// string                         ClassName                      (Parm, NeedCtorLink)
// class UClass*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class UClass* UUT2K4GUIController::AddComponentClass(const string& ClassName)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4GUIController.AddComponentClass");

	UUT2K4GUIController_AddComponentClass_Params params;
	params.ClassName = ClassName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.UT2K4GUIController.GetQuitPage
// (Defined, Simulated, Static, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UUT2K4GUIController::STATIC_GetQuitPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4GUIController.GetQuitPage");

	UUT2K4GUIController_GetQuitPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.UT2K4GUIController.GetSettingsPage
// (Defined, Simulated, Static, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UUT2K4GUIController::STATIC_GetSettingsPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4GUIController.GetSettingsPage");

	UUT2K4GUIController_GetSettingsPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.UT2K4GUIController.GetModPage
// (Defined, Simulated, Static, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UUT2K4GUIController::STATIC_GetModPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4GUIController.GetModPage");

	UUT2K4GUIController_GetModPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.UT2K4GUIController.GetInstantActionPage
// (Defined, Simulated, Static, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UUT2K4GUIController::STATIC_GetInstantActionPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4GUIController.GetInstantActionPage");

	UUT2K4GUIController_GetInstantActionPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.UT2K4GUIController.GetMultiplayerPage
// (Defined, Simulated, Static, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UUT2K4GUIController::STATIC_GetMultiplayerPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4GUIController.GetMultiplayerPage");

	UUT2K4GUIController_GetMultiplayerPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.UT2K4GUIController.GetServerBrowserPage
// (Defined, Simulated, Static, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UUT2K4GUIController::STATIC_GetServerBrowserPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4GUIController.GetServerBrowserPage");

	UUT2K4GUIController_GetServerBrowserPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.UT2K4GUIController.GetSinglePlayerPage
// (Defined, Simulated, Static, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UUT2K4GUIController::STATIC_GetSinglePlayerPage()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4GUIController.GetSinglePlayerPage");

	UUT2K4GUIController_GetSinglePlayerPage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.UT2K4GUIController.Validate
// (Defined, Simulated, Event, Static, Public)

void UUT2K4GUIController::STATIC_Validate()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4GUIController.Validate");

	UUT2K4GUIController_Validate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.UT2K4GUIController.OpenMenu
// (Defined, Event, Public)
// Parameters:
// string                         NewMenuName                    (Parm, NeedCtorLink)
// string                         Param1                         (OptionalParm, Parm, NeedCtorLink)
// string                         Param2                         (OptionalParm, Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UUT2K4GUIController::OpenMenu(const string& NewMenuName, const string& Param1, const string& Param2)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4GUIController.OpenMenu");

	UUT2K4GUIController_OpenMenu_Params params;
	params.NewMenuName = NewMenuName;
	params.Param1 = Param1;
	params.Param2 = Param2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.UT2K4GUIController.SetFocusTo
// (Defined, Public)
// Parameters:
// class UFloatingWindow*         Menu                           (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UUT2K4GUIController::SetFocusTo(class UFloatingWindow* Menu)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4GUIController.SetFocusTo");

	UUT2K4GUIController_SetFocusTo_Params params;
	params.Menu = Menu;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.UT2K4GUIController.ReturnToMainMenu
// (Defined, Public)

void UUT2K4GUIController::ReturnToMainMenu()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4GUIController.ReturnToMainMenu");

	UUT2K4GUIController_ReturnToMainMenu_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.PopupPageBase.Default_FadedOut
// (Defined, Public)

void UPopupPageBase::Default_FadedOut()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.PopupPageBase.Default_FadedOut");

	UPopupPageBase_Default_FadedOut_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.PopupPageBase.FadeOut
// (Defined, Public)
// Parameters:
// bool                           bTranslate                     (OptionalParm, Parm)
// bool                           bChangeAlpha                   (OptionalParm, Parm)

void UPopupPageBase::FadeOut(bool bTranslate, bool bChangeAlpha)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.PopupPageBase.FadeOut");

	UPopupPageBase_FadeOut_Params params;
	params.bTranslate = bTranslate;
	params.bChangeAlpha = bChangeAlpha;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.PopupPageBase.FadeIn
// (Defined, Public)
// Parameters:
// bool                           bTranslate                     (OptionalParm, Parm)
// bool                           bChangeAlpha                   (OptionalParm, Parm)

void UPopupPageBase::FadeIn(bool bTranslate, bool bChangeAlpha)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.PopupPageBase.FadeIn");

	UPopupPageBase_FadeIn_Params params;
	params.bTranslate = bTranslate;
	params.bChangeAlpha = bChangeAlpha;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.PopupPageBase.InternalOnPreDraw
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UPopupPageBase::InternalOnPreDraw(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.PopupPageBase.InternalOnPreDraw");

	UPopupPageBase_InternalOnPreDraw_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.PopupPageBase.OnFadeEnd
// (Public, Delegate)

void UPopupPageBase::OnFadeEnd()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.PopupPageBase.OnFadeEnd");

	UPopupPageBase_OnFadeEnd_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.PopupPageBase.FindPoupPageBaseInMenuStack
// (Defined, Public)
// Parameters:
// class UGUIPage*                CurrentPage                    (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UPopupPageBase::FindPoupPageBaseInMenuStack(class UGUIPage* CurrentPage)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.PopupPageBase.FindPoupPageBaseInMenuStack");

	UPopupPageBase_FindPoupPageBaseInMenuStack_Params params;
	params.CurrentPage = CurrentPage;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.PopupPageBase.Opened
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UPopupPageBase::Opened(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.PopupPageBase.Opened");

	UPopupPageBase_Opened_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.FloatingWindow.SetMouseCursorIndex
// (Defined, Public)
// Parameters:
// int                            NewIndex                       (Parm)

void UFloatingWindow::SetMouseCursorIndex(int NewIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.SetMouseCursorIndex");

	UFloatingWindow_SetMouseCursorIndex_Params params;
	params.NewIndex = NewIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.FloatingWindow.XButtonClicked
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UFloatingWindow::XButtonClicked(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.XButtonClicked");

	UFloatingWindow_XButtonClicked_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.FloatingWindow.HoveringBottomLeft
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UFloatingWindow::HoveringBottomLeft()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.HoveringBottomLeft");

	UFloatingWindow_HoveringBottomLeft_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.FloatingWindow.HoveringTopLeft
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UFloatingWindow::HoveringTopLeft()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.HoveringTopLeft");

	UFloatingWindow_HoveringTopLeft_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.FloatingWindow.HoveringBottomBorder
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UFloatingWindow::HoveringBottomBorder()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.HoveringBottomBorder");

	UFloatingWindow_HoveringBottomBorder_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.FloatingWindow.HoveringTopBorder
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UFloatingWindow::HoveringTopBorder()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.HoveringTopBorder");

	UFloatingWindow_HoveringTopBorder_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.FloatingWindow.HoveringRightBorder
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UFloatingWindow::HoveringRightBorder()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.HoveringRightBorder");

	UFloatingWindow_HoveringRightBorder_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.FloatingWindow.HoveringLeftBorder
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UFloatingWindow::HoveringLeftBorder()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.HoveringLeftBorder");

	UFloatingWindow_HoveringLeftBorder_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.FloatingWindow.ResizeAllowed
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UFloatingWindow::ResizeAllowed()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.ResizeAllowed");

	UFloatingWindow_ResizeAllowed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.FloatingWindow.ResizedHeight
// (Public)

void UFloatingWindow::ResizedHeight()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.ResizedHeight");

	UFloatingWindow_ResizedHeight_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.FloatingWindow.ResizedWidth
// (Public)

void UFloatingWindow::ResizedWidth()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.ResizedWidth");

	UFloatingWindow_ResizedWidth_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.FloatingWindow.ResizedBoth
// (Public)

void UFloatingWindow::ResizedBoth()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.ResizedBoth");

	UFloatingWindow_ResizedBoth_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.FloatingWindow.ResolutionChanged
// (Defined, Event, Public)
// Parameters:
// int                            ResX                           (Parm)
// int                            ResY                           (Parm)

void UFloatingWindow::ResolutionChanged(int ResX, int ResY)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.ResolutionChanged");

	UFloatingWindow_ResolutionChanged_Params params;
	params.ResX = ResX;
	params.ResY = ResY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.FloatingWindow.FloatingRendered
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void UFloatingWindow::FloatingRendered(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.FloatingRendered");

	UFloatingWindow_FloatingRendered_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.FloatingWindow.FloatingPreDraw
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UFloatingWindow::FloatingPreDraw(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.FloatingPreDraw");

	UFloatingWindow_FloatingPreDraw_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.FloatingWindow.SetPanelPosition
// (Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void UFloatingWindow::SetPanelPosition(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.SetPanelPosition");

	UFloatingWindow_SetPanelPosition_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.FloatingWindow.FloatingHover
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UFloatingWindow::FloatingHover(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.FloatingHover");

	UFloatingWindow_FloatingHover_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.FloatingWindow.SaveCurrentPosition
// (Defined, Public)

void UFloatingWindow::SaveCurrentPosition()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.SaveCurrentPosition");

	UFloatingWindow_SaveCurrentPosition_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.FloatingWindow.FloatingMouseRelease
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UFloatingWindow::FloatingMouseRelease(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.FloatingMouseRelease");

	UFloatingWindow_FloatingMouseRelease_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.FloatingWindow.FloatingMousePressed
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bRepeat                        (Parm)

void UFloatingWindow::FloatingMousePressed(class UGUIComponent* Sender, bool bRepeat)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.FloatingMousePressed");

	UFloatingWindow_FloatingMousePressed_Params params;
	params.Sender = Sender;
	params.bRepeat = bRepeat;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.FloatingWindow.SetFocus
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Who                            (ExportObject, Parm, NeedCtorLink, EditInline)

void UFloatingWindow::SetFocus(class UGUIComponent* Who)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.SetFocus");

	UFloatingWindow_SetFocus_Params params;
	params.Who = Who;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.FloatingWindow.InternalOnCreateComponent
// (Defined, Public)
// Parameters:
// class UGUIComponent*           NewComp                        (ExportObject, Parm, NeedCtorLink, EditInline)
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UFloatingWindow::InternalOnCreateComponent(class UGUIComponent* NewComp, class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.InternalOnCreateComponent");

	UFloatingWindow_InternalOnCreateComponent_Params params;
	params.NewComp = NewComp;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.FloatingWindow.SetDefaultPosition
// (Defined, Public)

void UFloatingWindow::SetDefaultPosition()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.SetDefaultPosition");

	UFloatingWindow_SetDefaultPosition_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.FloatingWindow.CheckBounds
// (Defined, Public)

void UFloatingWindow::CheckBounds()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.CheckBounds");

	UFloatingWindow_CheckBounds_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.FloatingWindow.SystemMenuPreDraw
// (Defined, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UFloatingWindow::SystemMenuPreDraw(class UCanvas* Canvas)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.SystemMenuPreDraw");

	UFloatingWindow_SystemMenuPreDraw_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.FloatingWindow.AddSystemMenu
// (Defined, Public)

void UFloatingWindow::AddSystemMenu()
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.AddSystemMenu");

	UFloatingWindow_AddSystemMenu_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.FloatingWindow.AlignFrame
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UFloatingWindow::AlignFrame(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.AlignFrame");

	UFloatingWindow_AlignFrame_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.FloatingWindow.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UFloatingWindow::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.FloatingWindow.InitComponent");

	UFloatingWindow_InitComponent_Params params;
	params.MyController = MyController;
	params.myOwner = myOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.fntUT2k4MidGame.GetFont
// (Defined, Event, Public)
// Parameters:
// int                            XRes                           (Parm)
// class UFont*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UFont* UfntUT2k4MidGame::GetFont(int XRes)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.fntUT2k4MidGame.GetFont");

	UfntUT2k4MidGame_GetFont_Params params;
	params.XRes = XRes;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.fntUT2k4MidGame.GetMidGameFont
// (Defined, Static, Public)
// Parameters:
// int                            XRes                           (Parm)
// class UFont*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UFont* UfntUT2k4MidGame::STATIC_GetMidGameFont(int XRes)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.fntUT2k4MidGame.GetMidGameFont");

	UfntUT2k4MidGame_GetMidGameFont_Params params;
	params.XRes = XRes;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function GUI2K4.UT2K4InGameChat.InternalOnCreateComponent
// (Defined, Public)
// Parameters:
// class UGUIComponent*           NewComp                        (ExportObject, Parm, NeedCtorLink, EditInline)
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UUT2K4InGameChat::InternalOnCreateComponent(class UGUIComponent* NewComp, class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4InGameChat.InternalOnCreateComponent");

	UUT2K4InGameChat_InternalOnCreateComponent_Params params;
	params.NewComp = NewComp;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.UT2K4InGameChat.InternalOnKeyEvent
// (Defined, Public)
// Parameters:
// byte                           key                            (Parm, OutParm)
// byte                           State                          (Parm, OutParm)
// float                          Delta                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UUT2K4InGameChat::InternalOnKeyEvent(float Delta, byte* key, byte* State)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4InGameChat.InternalOnKeyEvent");

	UUT2K4InGameChat_InternalOnKeyEvent_Params params;
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


// Function GUI2K4.UT2K4InGameChat.HandleChat
// (Defined, Public)
// Parameters:
// string                         Msg                            (Parm, NeedCtorLink)
// int                            TeamIndex                      (Parm)

void UUT2K4InGameChat::HandleChat(const string& Msg, int TeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4InGameChat.HandleChat");

	UUT2K4InGameChat_HandleChat_Params params;
	params.Msg = Msg;
	params.TeamIndex = TeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.UT2K4InGameChat.Closed
// (Defined, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)
// bool                           bCancelled                     (Parm)

void UUT2K4InGameChat::Closed(class UGUIComponent* Sender, bool bCancelled)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4InGameChat.Closed");

	UUT2K4InGameChat_Closed_Params params;
	params.Sender = Sender;
	params.bCancelled = bCancelled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.UT2K4InGameChat.Opened
// (Defined, Event, Public)
// Parameters:
// class UGUIComponent*           Sender                         (ExportObject, Parm, NeedCtorLink, EditInline)

void UUT2K4InGameChat::Opened(class UGUIComponent* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4InGameChat.Opened");

	UUT2K4InGameChat_Opened_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function GUI2K4.UT2K4InGameChat.InitComponent
// (Defined, Public)
// Parameters:
// class UGUIController*          MyController                   (Parm)
// class UGUIComponent*           myOwner                        (ExportObject, Parm, NeedCtorLink, EditInline)

void UUT2K4InGameChat::InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function GUI2K4.UT2K4InGameChat.InitComponent");

	UUT2K4InGameChat_InitComponent_Params params;
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
