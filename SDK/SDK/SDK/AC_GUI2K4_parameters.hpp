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

// Function GUI2K4.UT2K4GUIController.PurgeComponentClasses
struct UUT2K4GUIController_PurgeComponentClasses_Params
{
};

// Function GUI2K4.UT2K4GUIController.AddComponentClass
struct UUT2K4GUIController_AddComponentClass_Params
{
	struct FString                                     ClassName;                                                // (Parm, NeedCtorLink)
	class UClass*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.UT2K4GUIController.GetQuitPage
struct UUT2K4GUIController_GetQuitPage_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function GUI2K4.UT2K4GUIController.GetSettingsPage
struct UUT2K4GUIController_GetSettingsPage_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function GUI2K4.UT2K4GUIController.GetModPage
struct UUT2K4GUIController_GetModPage_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function GUI2K4.UT2K4GUIController.GetInstantActionPage
struct UUT2K4GUIController_GetInstantActionPage_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function GUI2K4.UT2K4GUIController.GetMultiplayerPage
struct UUT2K4GUIController_GetMultiplayerPage_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function GUI2K4.UT2K4GUIController.GetServerBrowserPage
struct UUT2K4GUIController_GetServerBrowserPage_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function GUI2K4.UT2K4GUIController.GetSinglePlayerPage
struct UUT2K4GUIController_GetSinglePlayerPage_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function GUI2K4.UT2K4GUIController.Validate
struct UUT2K4GUIController_Validate_Params
{
};

// Function GUI2K4.UT2K4GUIController.OpenMenu
struct UUT2K4GUIController_OpenMenu_Params
{
	struct FString                                     NewMenuName;                                              // (Parm, NeedCtorLink)
	struct FString                                     Param1;                                                   // (OptionalParm, Parm, NeedCtorLink)
	struct FString                                     Param2;                                                   // (OptionalParm, Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.UT2K4GUIController.SetFocusTo
struct UUT2K4GUIController_SetFocusTo_Params
{
	class UFloatingWindow*                             Menu;                                                     // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.UT2K4GUIController.ReturnToMainMenu
struct UUT2K4GUIController_ReturnToMainMenu_Params
{
};

// Function GUI2K4.PopupPageBase.Default_FadedOut
struct UPopupPageBase_Default_FadedOut_Params
{
};

// Function GUI2K4.PopupPageBase.FadeOut
struct UPopupPageBase_FadeOut_Params
{
	bool                                               bTranslate;                                               // (OptionalParm, Parm)
	bool                                               bChangeAlpha;                                             // (OptionalParm, Parm)
};

// Function GUI2K4.PopupPageBase.FadeIn
struct UPopupPageBase_FadeIn_Params
{
	bool                                               bTranslate;                                               // (OptionalParm, Parm)
	bool                                               bChangeAlpha;                                             // (OptionalParm, Parm)
};

// Function GUI2K4.PopupPageBase.InternalOnPreDraw
struct UPopupPageBase_InternalOnPreDraw_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.PopupPageBase.OnFadeEnd
struct UPopupPageBase_OnFadeEnd_Params
{
};

// Function GUI2K4.PopupPageBase.FindPoupPageBaseInMenuStack
struct UPopupPageBase_FindPoupPageBaseInMenuStack_Params
{
	class UGUIPage*                                    CurrentPage;                                              // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.PopupPageBase.Opened
struct UPopupPageBase_Opened_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function GUI2K4.FloatingWindow.SetMouseCursorIndex
struct UFloatingWindow_SetMouseCursorIndex_Params
{
	int                                                NewIndex;                                                 // (Parm)
};

// Function GUI2K4.FloatingWindow.XButtonClicked
struct UFloatingWindow_XButtonClicked_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.FloatingWindow.HoveringBottomLeft
struct UFloatingWindow_HoveringBottomLeft_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.FloatingWindow.HoveringTopLeft
struct UFloatingWindow_HoveringTopLeft_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.FloatingWindow.HoveringBottomBorder
struct UFloatingWindow_HoveringBottomBorder_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.FloatingWindow.HoveringTopBorder
struct UFloatingWindow_HoveringTopBorder_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.FloatingWindow.HoveringRightBorder
struct UFloatingWindow_HoveringRightBorder_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.FloatingWindow.HoveringLeftBorder
struct UFloatingWindow_HoveringLeftBorder_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.FloatingWindow.ResizeAllowed
struct UFloatingWindow_ResizeAllowed_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.FloatingWindow.ResizedHeight
struct UFloatingWindow_ResizedHeight_Params
{
};

// Function GUI2K4.FloatingWindow.ResizedWidth
struct UFloatingWindow_ResizedWidth_Params
{
};

// Function GUI2K4.FloatingWindow.ResizedBoth
struct UFloatingWindow_ResizedBoth_Params
{
};

// Function GUI2K4.FloatingWindow.ResolutionChanged
struct UFloatingWindow_ResolutionChanged_Params
{
	int                                                ResX;                                                     // (Parm)
	int                                                ResY;                                                     // (Parm)
};

// Function GUI2K4.FloatingWindow.FloatingRendered
struct UFloatingWindow_FloatingRendered_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function GUI2K4.FloatingWindow.FloatingPreDraw
struct UFloatingWindow_FloatingPreDraw_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.FloatingWindow.SetPanelPosition
struct UFloatingWindow_SetPanelPosition_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function GUI2K4.FloatingWindow.FloatingHover
struct UFloatingWindow_FloatingHover_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.FloatingWindow.SaveCurrentPosition
struct UFloatingWindow_SaveCurrentPosition_Params
{
};

// Function GUI2K4.FloatingWindow.FloatingMouseRelease
struct UFloatingWindow_FloatingMouseRelease_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function GUI2K4.FloatingWindow.FloatingMousePressed
struct UFloatingWindow_FloatingMousePressed_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bRepeat;                                                  // (Parm)
};

// Function GUI2K4.FloatingWindow.SetFocus
struct UFloatingWindow_SetFocus_Params
{
	class UGUIComponent*                               Who;                                                      // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function GUI2K4.FloatingWindow.InternalOnCreateComponent
struct UFloatingWindow_InternalOnCreateComponent_Params
{
	class UGUIComponent*                               NewComp;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function GUI2K4.FloatingWindow.SetDefaultPosition
struct UFloatingWindow_SetDefaultPosition_Params
{
};

// Function GUI2K4.FloatingWindow.CheckBounds
struct UFloatingWindow_CheckBounds_Params
{
};

// Function GUI2K4.FloatingWindow.SystemMenuPreDraw
struct UFloatingWindow_SystemMenuPreDraw_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.FloatingWindow.AddSystemMenu
struct UFloatingWindow_AddSystemMenu_Params
{
};

// Function GUI2K4.FloatingWindow.AlignFrame
struct UFloatingWindow_AlignFrame_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.FloatingWindow.InitComponent
struct UFloatingWindow_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function GUI2K4.fntUT2k4MidGame.GetFont
struct UfntUT2k4MidGame_GetFont_Params
{
	int                                                XRes;                                                     // (Parm)
	class UFont*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.fntUT2k4MidGame.GetMidGameFont
struct UfntUT2k4MidGame_GetMidGameFont_Params
{
	int                                                XRes;                                                     // (Parm)
	class UFont*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.UT2K4InGameChat.InternalOnCreateComponent
struct UUT2K4InGameChat_InternalOnCreateComponent_Params
{
	class UGUIComponent*                               NewComp;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function GUI2K4.UT2K4InGameChat.InternalOnKeyEvent
struct UUT2K4InGameChat_InternalOnKeyEvent_Params
{
	unsigned char                                      key;                                                      // (Parm, OutParm)
	unsigned char                                      State;                                                    // (Parm, OutParm)
	float                                              Delta;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function GUI2K4.UT2K4InGameChat.HandleChat
struct UUT2K4InGameChat_HandleChat_Params
{
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
	int                                                TeamIndex;                                                // (Parm)
};

// Function GUI2K4.UT2K4InGameChat.Closed
struct UUT2K4InGameChat_Closed_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bCancelled;                                               // (Parm)
};

// Function GUI2K4.UT2K4InGameChat.Opened
struct UUT2K4InGameChat_Opened_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function GUI2K4.UT2K4InGameChat.InitComponent
struct UUT2K4InGameChat_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
