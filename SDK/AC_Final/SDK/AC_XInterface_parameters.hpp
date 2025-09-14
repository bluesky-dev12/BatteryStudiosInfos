#pragma once

// Artic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

#include "../SDK.hpp"

namespace Classes
{
//---------------------------------------------------------------------------
//Parameters
//---------------------------------------------------------------------------

// Function XInterface.GUI.GetModLogo
struct UGUI_GetModLogo_Params
{
	string                                             ModDir;                                                   // (Parm, NeedCtorLink)
	class UMaterial*                                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUI.GetModValue
struct UGUI_GetModValue_Params
{
	string                                             ModDir;                                                   // (Parm, NeedCtorLink)
	string                                             ModKey;                                                   // (Parm, NeedCtorLink)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUI.GetModList
struct UGUI_GetModList_Params
{
	string[]                                           ModDirs;                                                  // (Parm, OutParm, NeedCtorLink)
	string[]                                           ModTitles;                                                // (Parm, OutParm, NeedCtorLink)
};

// Function XInterface.GUI.Profile
struct UGUI_Profile_Params
{
	string                                             ProfileName;                                              // (Parm, NeedCtorLink)
};

// Function XInterface.GUI.JoinArray
struct UGUI_JoinArray_Params
{
	string[]                                           StringArray;                                              // (Parm, NeedCtorLink)
	string                                             Delim;                                                    // (OptionalParm, Parm, NeedCtorLink)
	bool                                               bIgnoreBlanks;                                            // (OptionalParm, Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUI.IsDigit
struct UGUI_IsDigit_Params
{
	string                                             test;                                                     // (Parm, NeedCtorLink)
	bool                                               bAllowDecimal;                                            // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.GetCurrentCanvas
struct UGUIComponent_GetCurrentCanvas_Params
{
	class UCanvas*                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.DebugTabOrder
struct UGUIComponent_DebugTabOrder_Params
{
};

// Function XInterface.GUIComponent.LevelChanged
struct UGUIComponent_LevelChanged_Params
{
};

// Function XInterface.GUIComponent.SetEnabled
struct UGUIComponent_SetEnabled_Params
{
	bool                                               Value;                                                    // (Parm)
};

// Function XInterface.GUIComponent.DisableMe
struct UGUIComponent_DisableMe_Params
{
};

// Function XInterface.GUIComponent.EnableMe
struct UGUIComponent_EnableMe_Params
{
};

// Function XInterface.GUIComponent.SetFlicker
struct UGUIComponent_SetFlicker_Params
{
	bool                                               Value;                                                    // (Parm)
};

// Function XInterface.GUIComponent.DisableComponent
struct UGUIComponent_DisableComponent_Params
{
	class UGUIComponent*                               Comp;                                                     // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.EnableComponent
struct UGUIComponent_EnableComponent_Params
{
	class UGUIComponent*                               Comp;                                                     // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.KillAnimation
struct UGUIComponent_KillAnimation_Params
{
};

// Function XInterface.GUIComponent.DAnimate
struct UGUIComponent_DAnimate_Params
{
	float                                              NewLeft;                                                  // (Parm)
	float                                              NewTop;                                                   // (Parm)
	float                                              NewWidth;                                                 // (Parm)
	float                                              NewHeight;                                                // (Parm)
	float                                              PositionTime;                                             // (OptionalParm, Parm)
	float                                              DimensionTime;                                            // (OptionalParm, Parm)
};

// Function XInterface.GUIComponent.Resize
struct UGUIComponent_Resize_Params
{
	float                                              NewWidth;                                                 // (Parm)
	float                                              NewHeight;                                                // (Parm)
	float                                              Time;                                                     // (OptionalParm, Parm)
};

// Function XInterface.GUIComponent.Animate
struct UGUIComponent_Animate_Params
{
	float                                              NewLeft;                                                  // (Parm)
	float                                              NewTop;                                                   // (Parm)
	float                                              Time;                                                     // (OptionalParm, Parm)
};

// Function XInterface.GUIComponent.EndAnimation
struct UGUIComponent_EndAnimation_Params
{
	class UGUIComponent*                               Animating;                                                // (ExportObject, Parm, NeedCtorLink, EditInline)
	EAnimationType                                     Type;                                                     // (Parm)
};

// Function XInterface.GUIComponent.BeginAnimation
struct UGUIComponent_BeginAnimation_Params
{
	class UGUIComponent*                               Animating;                                                // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.OwnerPage
struct UGUIComponent_OwnerPage_Params
{
	class UGUIPage*                                    ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.DebugFocusPosition
struct UGUIComponent_DebugFocusPosition_Params
{
	class UGUIComponent*                               Who;                                                      // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               Last;                                                     // (Parm)
};

// Function XInterface.GUIComponent.DebugFocus
struct UGUIComponent_DebugFocus_Params
{
	class UGUIComponent*                               Who;                                                      // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bLose;                                                    // (Parm)
};

// Function XInterface.GUIComponent.SetTooltip
struct UGUIComponent_SetTooltip_Params
{
	class UGUIToolTip*                                 InTooltip;                                                // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.SetToolTipText
struct UGUIComponent_SetToolTipText_Params
{
	string                                             NewToolTipText;                                           // (Parm, NeedCtorLink)
};

// Function XInterface.GUIComponent.SetHint
struct UGUIComponent_SetHint_Params
{
	string                                             NewHint;                                                  // (Parm, NeedCtorLink)
};

// Function XInterface.GUIComponent.SetFriendlyLabel
struct UGUIComponent_SetFriendlyLabel_Params
{
	class UGUILabel*                                   NewLabel;                                                 // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.SetFocusInstead
struct UGUIComponent_SetFocusInstead_Params
{
	class UGUIComponent*                               InFocusComp;                                              // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.Show
struct UGUIComponent_Show_Params
{
};

// Function XInterface.GUIComponent.Hide
struct UGUIComponent_Hide_Params
{
};

// Function XInterface.GUIComponent.CenterMouse
struct UGUIComponent_CenterMouse_Params
{
};

// Function XInterface.GUIComponent.SetVisibility
struct UGUIComponent_SetVisibility_Params
{
	bool                                               bIsVisible;                                               // (Parm, CoerceParm)
};

// Function XInterface.GUIComponent.FillOwner
struct UGUIComponent_FillOwner_Params
{
};

// Function XInterface.GUIComponent.PrevPage
struct UGUIComponent_PrevPage_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.NextPage
struct UGUIComponent_NextPage_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.PrevControl
struct UGUIComponent_PrevControl_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.NextControl
struct UGUIComponent_NextControl_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.FocusLast
struct UGUIComponent_FocusLast_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.FocusFirst
struct UGUIComponent_FocusFirst_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.LoseFocus
struct UGUIComponent_LoseFocus_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.SetFocus
struct UGUIComponent_SetFocus_Params
{
	class UGUIComponent*                               Who;                                                      // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.CanAcceptFocus
struct UGUIComponent_CanAcceptFocus_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.IsInClientBounds
struct UGUIComponent_IsInClientBounds_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.IsInBounds
struct UGUIComponent_IsInBounds_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.TraversalApplyAWinPos
struct UGUIComponent_TraversalApplyAWinPos_Params
{
};

// Function XInterface.GUIComponent.ApplyAWinPos
struct UGUIComponent_ApplyAWinPos_Params
{
};

// Function XInterface.GUIComponent.GetTopMenuOwner
struct UGUIComponent_GetTopMenuOwner_Params
{
	class UGUIComponent*                               ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.InitComponent
struct UGUIComponent_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.DropStateChange
struct UGUIComponent_DropStateChange_Params
{
	EeDropState                                        NewState;                                                 // (Parm)
};

// Function XInterface.GUIComponent.IsMultiSelect
struct UGUIComponent_IsMultiSelect_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.MenuStateChange
struct UGUIComponent_MenuStateChange_Params
{
	EeMenuState                                        NewState;                                                 // (Parm)
};

// Function XInterface.GUIComponent.MakeColorCode
struct UGUIComponent_MakeColorCode_Params
{
	struct FColor                                      NewColor;                                                 // (Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIComponent.StripColorCodes
struct UGUIComponent_StripColorCodes_Params
{
	string                                             InString;                                                 // (Parm, NeedCtorLink)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIComponent.SaveINI
struct UGUIComponent_SaveINI_Params
{
	string                                             Value;                                                    // (OptionalParm, Parm, NeedCtorLink)
};

// Function XInterface.GUIComponent.LoadINI
struct UGUIComponent_LoadINI_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIComponent.free
struct UGUIComponent_free_Params
{
};

// Function XInterface.GUIComponent.Closed
struct UGUIComponent_Closed_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bCancelled;                                               // (Parm)
};

// Function XInterface.GUIComponent.Opened
struct UGUIComponent_Opened_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.Timer
struct UGUIComponent_Timer_Params
{
};

// Function XInterface.GUIComponent.AdditionalDebugString
struct UGUIComponent_AdditionalDebugString_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIComponent.SpecialHit
struct UGUIComponent_SpecialHit_Params
{
	bool                                               bForce;                                                   // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.GetMenuPath
struct UGUIComponent_GetMenuPath_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIComponent.IsInIncompleteLetter
struct UGUIComponent_IsInIncompleteLetter_Params
{
	string                                             strUserName;                                              // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.IsCorrectUserName_THAILAND
struct UGUIComponent_IsCorrectUserName_THAILAND_Params
{
	string                                             strUserName;                                              // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.IsCorrectUserName_China
struct UGUIComponent_IsCorrectUserName_China_Params
{
	string                                             strUserName;                                              // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.IsCorrectUserName
struct UGUIComponent_IsCorrectUserName_Params
{
	string                                             strUserName;                                              // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.SetPosition
struct UGUIComponent_SetPosition_Params
{
	float                                              NewLeft;                                                  // (Parm)
	float                                              NewTop;                                                   // (Parm)
	float                                              NewWidth;                                                 // (Parm)
	float                                              NewHeight;                                                // (Parm)
	bool                                               bForceRelative;                                           // (OptionalParm, Parm)
};

// Function XInterface.GUIComponent.ResolutionChanged
struct UGUIComponent_ResolutionChanged_Params
{
	int                                                ResX;                                                     // (Parm)
	int                                                ResY;                                                     // (Parm)
};

// Function XInterface.GUIComponent.RelativeHeight
struct UGUIComponent_RelativeHeight_Params
{
	float                                              RealHeight;                                               // (OptionalParm, Parm, CoerceParm)
	bool                                               bForce;                                                   // (OptionalParm, Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.RelativeWidth
struct UGUIComponent_RelativeWidth_Params
{
	float                                              RealWidth;                                                // (OptionalParm, Parm, CoerceParm)
	bool                                               bForce;                                                   // (OptionalParm, Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.RelativeTop
struct UGUIComponent_RelativeTop_Params
{
	float                                              RealTop;                                                  // (OptionalParm, Parm, CoerceParm)
	bool                                               bForce;                                                   // (OptionalParm, Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.RelativeLeft
struct UGUIComponent_RelativeLeft_Params
{
	float                                              RealLeft;                                                 // (OptionalParm, Parm, CoerceParm)
	bool                                               bForce;                                                   // (OptionalParm, Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.ActualTop
struct UGUIComponent_ActualTop_Params
{
	float                                              val;                                                      // (OptionalParm, Parm, CoerceParm)
	bool                                               bForce;                                                   // (OptionalParm, Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.ActualLeft
struct UGUIComponent_ActualLeft_Params
{
	float                                              val;                                                      // (OptionalParm, Parm, CoerceParm)
	bool                                               bForce;                                                   // (OptionalParm, Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.ActualHeight
struct UGUIComponent_ActualHeight_Params
{
	float                                              val;                                                      // (OptionalParm, Parm, CoerceParm)
	bool                                               bForce;                                                   // (OptionalParm, Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.ActualWidth
struct UGUIComponent_ActualWidth_Params
{
	float                                              val;                                                      // (OptionalParm, Parm, CoerceParm)
	bool                                               bForce;                                                   // (OptionalParm, Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.UpdateBounds
struct UGUIComponent_UpdateBounds_Params
{
};

// Function XInterface.GUIComponent.UpdateOffset
struct UGUIComponent_UpdateOffset_Params
{
	float                                              PosX;                                                     // (Parm)
	float                                              PosY;                                                     // (Parm)
	float                                              PosW;                                                     // (Parm)
	float                                              PosH;                                                     // (Parm)
};

// Function XInterface.GUIComponent.AutoPositionOn
struct UGUIComponent_AutoPositionOn_Params
{
	class UGUIComponent*[]                             Components;                                               // (Parm, NeedCtorLink)
	class UGUIComponent*                               frame;                                                    // (ExportObject, Parm, NeedCtorLink, EditInline)
	float                                              LeftPadPerc;                                              // (Parm)
	float                                              UpperPadPerc;                                             // (Parm)
	float                                              RightPadPerc;                                             // (Parm)
	float                                              LowerPadPerc;                                             // (Parm)
	int                                                NumberOfColumns;                                          // (OptionalParm, Parm)
	float                                              ColumnPadding;                                            // (OptionalParm, Parm)
};

// Function XInterface.GUIComponent.AutoPosition
struct UGUIComponent_AutoPosition_Params
{
	class UGUIComponent*[]                             Components;                                               // (Parm, NeedCtorLink)
	float                                              LeftBound;                                                // (Parm)
	float                                              UpperBound;                                               // (Parm)
	float                                              RightBound;                                               // (Parm)
	float                                              LowerBound;                                               // (Parm)
	float                                              LeftPad;                                                  // (Parm)
	float                                              UpperPad;                                                 // (Parm)
	float                                              RightPad;                                                 // (Parm)
	float                                              LowerPad;                                                 // (Parm)
	int                                                NumberOfColumns;                                          // (OptionalParm, Parm)
	float                                              ColumnPadding;                                            // (OptionalParm, Parm)
};

// Function XInterface.GUIComponent.KillTimer
struct UGUIComponent_KillTimer_Params
{
	FName                                              TimerFunc;                                                // (OptionalParm, Parm)
};

// Function XInterface.GUIComponent.SetTimer
struct UGUIComponent_SetTimer_Params
{
	float                                              Interval;                                                 // (Parm)
	bool                                               bRepeat;                                                  // (OptionalParm, Parm)
	FName                                              TimerFunc;                                                // (OptionalParm, Parm)
};

// Function XInterface.GUIComponent.PlayerOwner
struct UGUIComponent_PlayerOwner_Params
{
	class APlayerController*                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.OnDragOver
struct UGUIComponent_OnDragOver_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.OnDragLeave
struct UGUIComponent_OnDragLeave_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.OnDragEnter
struct UGUIComponent_OnDragEnter_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.OnDragDrop
struct UGUIComponent_OnDragDrop_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.OnEndDrag
struct UGUIComponent_OnEndDrag_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bAccepted;                                                // (Parm)
};

// Function XInterface.GUIComponent.OnBeginDrag
struct UGUIComponent_OnBeginDrag_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.OnMultiSelect
struct UGUIComponent_OnMultiSelect_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.OnSaveINI
struct UGUIComponent_OnSaveINI_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIComponent.OnLoadINI
struct UGUIComponent_OnLoadINI_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	string                                             S;                                                        // (Parm, NeedCtorLink)
};

// Function XInterface.GUIComponent.OnCapturedMouseMove
struct UGUIComponent_OnCapturedMouseMove_Params
{
	float                                              deltaX;                                                   // (Parm)
	float                                              deltaY;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.OnDesignModeKeyEvent
struct UGUIComponent_OnDesignModeKeyEvent_Params
{
	EInputKey                                          key;                                                      // (Parm)
	EInputAction                                       State;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.OnKeyEvent
struct UGUIComponent_OnKeyEvent_Params
{
	byte                                               key;                                                      // (Parm, OutParm)
	byte                                               State;                                                    // (Parm, OutParm)
	float                                              Delta;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.OnKeyType
struct UGUIComponent_OnKeyType_Params
{
	byte                                               key;                                                      // (Parm, OutParm)
	string                                             Unicode;                                                  // (OptionalParm, Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.OnChange
struct UGUIComponent_OnChange_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.OnTimer
struct UGUIComponent_OnTimer_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.OnMouseRelease
struct UGUIComponent_OnMouseRelease_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.OnMousePressed
struct UGUIComponent_OnMousePressed_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bRepeat;                                                  // (Parm)
};

// Function XInterface.GUIComponent.OnRightClick
struct UGUIComponent_OnRightClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.OnDblClick
struct UGUIComponent_OnDblClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.OnClick
struct UGUIComponent_OnClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.OnHover
struct UGUIComponent_OnHover_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.OnInvalidate
struct UGUIComponent_OnInvalidate_Params
{
	class UGUIComponent*                               Who;                                                      // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.OnEndTooltip
struct UGUIComponent_OnEndTooltip_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.OnBeginTooltip
struct UGUIComponent_OnBeginTooltip_Params
{
	class UGUIToolTip*                                 ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComponent.OnShow
struct UGUIComponent_OnShow_Params
{
};

// Function XInterface.GUIComponent.OnHide
struct UGUIComponent_OnHide_Params
{
};

// Function XInterface.GUIComponent.OnMessage
struct UGUIComponent_OnMessage_Params
{
	string                                             Msg;                                                      // (Parm, CoerceParm, NeedCtorLink)
	float                                              MsgLife;                                                  // (Parm)
};

// Function XInterface.GUIComponent.OnHitTest
struct UGUIComponent_OnHitTest_Params
{
	float                                              MouseX;                                                   // (Parm)
	float                                              MouseY;                                                   // (Parm)
};

// Function XInterface.GUIComponent.OnWatch
struct UGUIComponent_OnWatch_Params
{
};

// Function XInterface.GUIComponent.OnDeActivate
struct UGUIComponent_OnDeActivate_Params
{
};

// Function XInterface.GUIComponent.OnActivate
struct UGUIComponent_OnActivate_Params
{
};

// Function XInterface.GUIComponent.OnRendered
struct UGUIComponent_OnRendered_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
};

// Function XInterface.GUIComponent.OnRender
struct UGUIComponent_OnRender_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
};

// Function XInterface.GUIComponent.OnDraw
struct UGUIComponent_OnDraw_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.OnPreDraw
struct UGUIComponent_OnPreDraw_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComponent.OnEndAnimation
struct UGUIComponent_OnEndAnimation_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	EAnimationType                                     Type;                                                     // (Parm)
};

// Function XInterface.GUIComponent.OnArrival
struct UGUIComponent_OnArrival_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	EAnimationType                                     Type;                                                     // (Parm)
};

// Function XInterface.GUIMultiComponent.GetTooltipPosFinal
struct UGUIMultiComponent_GetTooltipPosFinal_Params
{
	int                                                tooltipWidth;                                             // (Parm)
	int                                                tooltipHeight;                                            // (Parm)
	float                                              CursorUSize;                                              // (Parm)
	float                                              CursorVSize;                                              // (Parm)
	int                                                nOffsetX;                                                 // (OptionalParm, Parm)
	int                                                nOffsetY;                                                 // (OptionalParm, Parm)
	struct FFloatBox                                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIMultiComponent.RecursiveActiveOwner
struct UGUIMultiComponent_RecursiveActiveOwner_Params
{
	class UGUIComponent*                               checkComponent;                                           // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIMultiComponent.TraversalApplyAWinPos
struct UGUIMultiComponent_TraversalApplyAWinPos_Params
{
};

// Function XInterface.GUIMultiComponent.NewComponent
struct UGUIMultiComponent_NewComponent_Params
{
	class UGUIComponent*                               newcompo;                                                 // (ExportObject, Parm, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbNewCompo;                                               // (Parm)
	float                                              RenderWeight;                                             // (OptionalParm, Parm)
	class UGUIMultiComponent*                          ParentComponent;                                          // (ExportObject, OptionalParm, Parm, NeedCtorLink, EditInline)
	class UGUIComponent*                               ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIMultiComponent.CheckDuplicateTabOrder
struct UGUIMultiComponent_CheckDuplicateTabOrder_Params
{
};

// Function XInterface.GUIMultiComponent.CheckInvalidTabOrder
struct UGUIMultiComponent_CheckInvalidTabOrder_Params
{
};

// Function XInterface.GUIMultiComponent.DebugTabOrder
struct UGUIMultiComponent_DebugTabOrder_Params
{
};

// Function XInterface.GUIMultiComponent.CenterMouse
struct UGUIMultiComponent_CenterMouse_Params
{
};

// Function XInterface.GUIMultiComponent.LevelChanged
struct UGUIMultiComponent_LevelChanged_Params
{
};

// Function XInterface.GUIMultiComponent.EndAnimation
struct UGUIMultiComponent_EndAnimation_Params
{
	class UGUIComponent*                               Animating;                                                // (ExportObject, Parm, NeedCtorLink, EditInline)
	EAnimationType                                     Type;                                                     // (Parm)
};

// Function XInterface.GUIMultiComponent.BeginAnimation
struct UGUIMultiComponent_BeginAnimation_Params
{
	class UGUIComponent*                               Animating;                                                // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIMultiComponent.free
struct UGUIMultiComponent_free_Params
{
};

// Function XInterface.GUIMultiComponent.Closed
struct UGUIMultiComponent_Closed_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bCancelled;                                               // (Parm)
};

// Function XInterface.GUIMultiComponent.Opened
struct UGUIMultiComponent_Opened_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIMultiComponent.SetVisibility
struct UGUIMultiComponent_SetVisibility_Params
{
	bool                                               bIsVisible;                                               // (Parm)
};

// Function XInterface.GUIMultiComponent.DisableMe
struct UGUIMultiComponent_DisableMe_Params
{
};

// Function XInterface.GUIMultiComponent.EnableMe
struct UGUIMultiComponent_EnableMe_Params
{
};

// Function XInterface.GUIMultiComponent.PrevControl
struct UGUIMultiComponent_PrevControl_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIMultiComponent.NextControl
struct UGUIMultiComponent_NextControl_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIMultiComponent.FocusLast
struct UGUIMultiComponent_FocusLast_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIMultiComponent.FocusFirst
struct UGUIMultiComponent_FocusFirst_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIMultiComponent.CanAcceptFocus
struct UGUIMultiComponent_CanAcceptFocus_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIMultiComponent.LoseFocus
struct UGUIMultiComponent_LoseFocus_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIMultiComponent.SetFocus
struct UGUIMultiComponent_SetFocus_Params
{
	class UGUIComponent*                               Who;                                                      // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIMultiComponent.SetFocusInstead
struct UGUIMultiComponent_SetFocusInstead_Params
{
	class UGUIComponent*                               InFocusComp;                                              // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIMultiComponent.RemoveComponent
struct UGUIMultiComponent_RemoveComponent_Params
{
	class UGUIComponent*                               Comp;                                                     // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               SkipRemap;                                                // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIMultiComponent.AppendComponent
struct UGUIMultiComponent_AppendComponent_Params
{
	class UGUIComponent*                               NewComp;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               SkipRemap;                                                // (OptionalParm, Parm)
	class UGUIComponent*                               ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIMultiComponent.InsertComponent
struct UGUIMultiComponent_InsertComponent_Params
{
	class UGUIComponent*                               NewComp;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
	int                                                Index;                                                    // (Parm)
	bool                                               SkipRemap;                                                // (OptionalParm, Parm)
	class UGUIComponent*                               ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIMultiComponent.AddComponent
struct UGUIMultiComponent_AddComponent_Params
{
	string                                             ComponentClass;                                           // (Parm, NeedCtorLink)
	bool                                               SkipRemap;                                                // (OptionalParm, Parm)
	class UGUIComponent*                               ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIMultiComponent.InitComponent
struct UGUIMultiComponent_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIMultiComponent.InternalOnShow
struct UGUIMultiComponent_InternalOnShow_Params
{
};

// Function XInterface.GUIMultiComponent.FindComponentIndex
struct UGUIMultiComponent_FindComponentIndex_Params
{
	class UGUIComponent*                               Who;                                                      // (ExportObject, Parm, NeedCtorLink, EditInline)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIMultiComponent.RemapComponents
struct UGUIMultiComponent_RemapComponents_Params
{
};

// Function XInterface.GUIMultiComponent.InitializeControls
struct UGUIMultiComponent_InitializeControls_Params
{
};

// Function XInterface.GUIMultiComponent.OnCreateComponent
struct UGUIMultiComponent_OnCreateComponent_Params
{
	class UGUIComponent*                               NewComponent;                                             // (ExportObject, Parm, NeedCtorLink, EditInline)
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIMultiComponent.NotifyContextSelect
struct UGUIMultiComponent_NotifyContextSelect_Params
{
	class UGUIContextMenu*                             Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	int                                                ClickIndex;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIMultiComponent.HandleContextMenuClose
struct UGUIMultiComponent_HandleContextMenuClose_Params
{
	class UGUIContextMenu*                             Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIMultiComponent.HandleContextMenuOpen
struct UGUIMultiComponent_HandleContextMenuOpen_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	class UGUIContextMenu*                             Menu;                                                     // (ExportObject, Parm, NeedCtorLink, EditInline)
	class UGUIComponent*                               ContextMenuOwner;                                         // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIPage.LostFocus
struct UGUIPage_LostFocus_Params
{
	class UGUIPage*                                    NewMenu;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIPage.GetFocus
struct UGUIPage_GetFocus_Params
{
};

// Function XInterface.GUIPage.FadedOut
struct UGUIPage_FadedOut_Params
{
};

// Function XInterface.GUIPage.FadedIn
struct UGUIPage_FadedIn_Params
{
};

// Function XInterface.GUIPage.FadeOut
struct UGUIPage_FadeOut_Params
{
	bool                                               bTranslate;                                               // (OptionalParm, Parm)
	bool                                               bChangeAlpha;                                             // (OptionalParm, Parm)
};

// Function XInterface.GUIPage.FadeIn
struct UGUIPage_FadeIn_Params
{
	bool                                               bTranslate;                                               // (OptionalParm, Parm)
	bool                                               bChangeAlpha;                                             // (OptionalParm, Parm)
};

// Function XInterface.GUIPage.AllowOpen
struct UGUIPage_AllowOpen_Params
{
	string                                             MenuClass;                                                // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIPage.IsOpen
struct UGUIPage_IsOpen_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIPage.free
struct UGUIPage_free_Params
{
};

// Function XInterface.GUIPage.NotifyLevelChange
struct UGUIPage_NotifyLevelChange_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIPage.SetDataString
struct UGUIPage_SetDataString_Params
{
	string                                             str;                                                      // (Parm, NeedCtorLink)
};

// Function XInterface.GUIPage.GetDataString
struct UGUIPage_GetDataString_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIPage.HandleObject
struct UGUIPage_HandleObject_Params
{
	class UObject*                                     obj;                                                      // (Parm)
	class UObject*                                     OptionalObj_1;                                            // (OptionalParm, Parm)
	class UObject*                                     OptionalObj_2;                                            // (OptionalParm, Parm)
};

// Function XInterface.GUIPage.GetRestoreParams
struct UGUIPage_GetRestoreParams_Params
{
	string                                             Param1;                                                   // (Parm, OutParm, NeedCtorLink)
	string                                             Param2;                                                   // (Parm, OutParm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIPage.HandleParameters
struct UGUIPage_HandleParameters_Params
{
	string                                             Param1;                                                   // (Parm, NeedCtorLink)
	string                                             Param2;                                                   // (Parm, NeedCtorLink)
};

// Function XInterface.GUIPage.SetFocus
struct UGUIPage_SetFocus_Params
{
	class UGUIComponent*                               Who;                                                      // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIPage.ChangeHint
struct UGUIPage_ChangeHint_Params
{
	string                                             NewHint;                                                  // (Parm, NeedCtorLink)
};

// Function XInterface.GUIPage.CheckResolution
struct UGUIPage_CheckResolution_Params
{
	bool                                               Closing;                                                  // (Parm)
	class UGUIController*                              InController;                                             // (Parm)
};

// Function XInterface.GUIPage.InitComponent
struct UGUIPage_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIPage.Closed
struct UGUIPage_Closed_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bCancelled;                                               // (Parm)
};

// Function XInterface.GUIPage.OnCanClose
struct UGUIPage_OnCanClose_Params
{
	bool                                               bCancelled;                                               // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIPage.OnClose
struct UGUIPage_OnClose_Params
{
	bool                                               bCancelled;                                               // (OptionalParm, Parm)
};

// Function XInterface.GUIPage.OnReOpen
struct UGUIPage_OnReOpen_Params
{
};

// Function XInterface.GUIPage.OnOpen
struct UGUIPage_OnOpen_Params
{
};

// Function XInterface.GUIQuestionPage.RemoveButtons
struct UGUIQuestionPage_RemoveButtons_Params
{
};

// Function XInterface.GUIQuestionPage.Replace
struct UGUIQuestionPage_Replace_Params
{
	string                                             Src;                                                      // (Parm, NeedCtorLink)
	string                                             Tag;                                                      // (Parm, NeedCtorLink)
	string                                             Value;                                                    // (Parm, NeedCtorLink)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIQuestionPage.ButtonClick
struct UGUIQuestionPage_ButtonClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIQuestionPage.LayoutButtons
struct UGUIQuestionPage_LayoutButtons_Params
{
	byte                                               ActiveButton;                                             // (Parm)
};

// Function XInterface.GUIQuestionPage.AddButton
struct UGUIQuestionPage_AddButton_Params
{
	byte                                               idesc;                                                    // (Parm, CoerceParm)
	class UGUIButton*                                  ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIQuestionPage.SetupQuestion
struct UGUIQuestionPage_SetupQuestion_Params
{
	string                                             Question;                                                 // (Parm, NeedCtorLink)
	byte                                               bButtons;                                                 // (Parm, CoerceParm)
	byte                                               ActiveButton;                                             // (OptionalParm, Parm)
	bool                                               bClearFirst;                                              // (OptionalParm, Parm)
};

// Function XInterface.GUIQuestionPage.InternalOnPreDraw
struct UGUIQuestionPage_InternalOnPreDraw_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIQuestionPage.InitComponent
struct UGUIQuestionPage_InitComponent_Params
{
	class UGUIController*                              pMyController;                                            // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIQuestionPage.NewOnButtonClick
struct UGUIQuestionPage_NewOnButtonClick_Params
{
	byte                                               bButton;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIQuestionPage.OnButtonClick
struct UGUIQuestionPage_OnButtonClick_Params
{
	byte                                               bButton;                                                  // (Parm)
};

// Function XInterface.HudBase.GetCurGameTime
struct AHudBase_GetCurGameTime_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudBase.clearkilllog
struct AHudBase_clearkilllog_Params
{
};

// Function XInterface.HudBase.userzone
struct AHudBase_userzone_Params
{
	string                                             szPath;                                                   // (Parm, NeedCtorLink)
	string                                             szCommand;                                                // (Parm, NeedCtorLink)
};

// Function XInterface.HudBase.usermove
struct AHudBase_usermove_Params
{
	string                                             szPath;                                                   // (Parm, NeedCtorLink)
	string                                             szCommand;                                                // (OptionalParm, Parm, NeedCtorLink)
	int                                                nCombatNum;                                               // (OptionalParm, Parm)
};

// Function XInterface.HudBase.killlog
struct AHudBase_killlog_Params
{
	string                                             szPath;                                                   // (Parm, NeedCtorLink)
	string                                             szCommand;                                                // (OptionalParm, Parm, NeedCtorLink)
};

// Function XInterface.HudBase.WorldSpaceOverlays
struct AHudBase_WorldSpaceOverlays_Params
{
};

// Function XInterface.HudBase.PlayHUDSound
struct AHudBase_PlayHUDSound_Params
{
	class APlayerController*                           PC;                                                       // (Parm)
	EeHUDSOUND                                         soundType;                                                // (Parm)
};

// Function XInterface.HudBase.CalcNametagPos
struct AHudBase_CalcNametagPos_Params
{
	class APawn*                                       curPawn;                                                  // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudBase.CalcNametagPosNative
struct AHudBase_CalcNametagPosNative_Params
{
	class APawn*                                       curPawn;                                                  // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudBase.GetNametagColor
struct AHudBase_GetNametagColor_Params
{
	class APlayerReplicationInfo*                      Info;                                                     // (Parm)
	struct FColor                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudBase.RefreshKillerName
struct AHudBase_RefreshKillerName_Params
{
	string                                             mKillerName;                                              // (Parm, NeedCtorLink)
};

// Function XInterface.HudBase.DrawCustomNameTag
struct AHudBase_DrawCustomNameTag_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     vNameTagPos;                                              // (Parm)
	class AwPawn*                                      curPawn;                                                  // (Parm)
	string                                             strName;                                                  // (Parm, NeedCtorLink)
	float                                              fAdditionalX;                                             // (OptionalParm, Parm)
	float                                              fAdditionalY;                                             // (OptionalParm, Parm)
};

// Function XInterface.HudBase.DrawNameTag
struct AHudBase_DrawNameTag_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class AwPawn*                                      curPawn;                                                  // (Parm)
};

// Function XInterface.HudBase.DrawMissionIcon
struct AHudBase_DrawMissionIcon_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class AwPawn*                                      curPawn;                                                  // (Parm)
};

// Function XInterface.HudBase.DrawSpecialModeIcon
struct AHudBase_DrawSpecialModeIcon_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class AwPawn*                                      curPawn;                                                  // (Parm)
};

// Function XInterface.HudBase.UpdateNameTagInfo
struct AHudBase_UpdateNameTagInfo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class AwPawn*                                      curPawn;                                                  // (Parm)
	struct FVector                                     camLoc;                                                   // (Parm)
	struct FRotator                                    camRot;                                                   // (Parm)
};

// Function XInterface.HudBase.DrawNametagsScript
struct AHudBase_DrawNametagsScript_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               bSpectateMode;                                            // (Parm)
	bool                                               drawAlways;                                               // (OptionalParm, Parm)
};

// Function XInterface.HudBase.DrawNametags
struct AHudBase_DrawNametags_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               bSpectateMode;                                            // (Parm)
	bool                                               drawAlways;                                               // (OptionalParm, Parm)
};

// Function XInterface.HudBase.DrawNametagsNative
struct AHudBase_DrawNametagsNative_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               bSpectateMode;                                            // (Parm)
	bool                                               drawAlways;                                               // (OptionalParm, Parm)
};

// Function XInterface.HudBase.DrawHudSpectating
struct AHudBase_DrawHudSpectating_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.DrawGMHudSpectating
struct AHudBase_DrawGMHudSpectating_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.FindPRI
struct AHudBase_FindPRI_Params
{
	class APawn*                                       P;                                                        // (Parm)
	class APlayerReplicationInfo*                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudBase.GetBaseTeamColor
struct AHudBase_GetBaseTeamColor_Params
{
	int                                                viewerTeamIndex;                                          // (Parm)
	int                                                targetTeamIndex;                                          // (Parm)
	struct FColor                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudBase.GetBaseTeamName
struct AHudBase_GetBaseTeamName_Params
{
	int                                                TeamIndex;                                                // (Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.HudBase.DrawWarfareCrosshairExtNative
struct AHudBase_DrawWarfareCrosshairExtNative_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                Spread;                                                   // (Parm)
};

// Function XInterface.HudBase.CalculateCoordinateDigitEx
struct AHudBase_CalculateCoordinateDigitEx_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FDigitSet                                   W;                                                        // (Parm)
	struct FNumericWidget                              N;                                                        // (Parm)
	float                                              fWidth;                                                   // (Parm)
	float                                              fHeight;                                                  // (Parm)
	int                                                Index;                                                    // (Parm)
	struct FCalCoordsW                                 coordsW;                                                  // (Parm, OutParm)
};

// Function XInterface.HudBase.CalculateCoordinateDigit
struct AHudBase_CalculateCoordinateDigit_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FDigitSet                                   W;                                                        // (Parm)
	struct FNumericWidget                              N;                                                        // (Parm)
	float                                              fWidth;                                                   // (Parm)
	float                                              fHeight;                                                  // (Parm)
	int                                                Index;                                                    // (Parm)
	struct FCalCoordsW                                 coordsW;                                                  // (Parm, OutParm)
};

// Function XInterface.HudBase.CalculateCoordinateEx
struct AHudBase_CalculateCoordinateEx_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FSpriteWidget                               W;                                                        // (Parm)
	float                                              fWidth;                                                   // (Parm)
	float                                              fHeight;                                                  // (Parm)
	struct FCalCoordsW                                 coordsW;                                                  // (Parm, OutParm)
};

// Function XInterface.HudBase.CalculateCoordinate
struct AHudBase_CalculateCoordinate_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FSpriteWidget                               W;                                                        // (Parm)
	float                                              fWidth;                                                   // (Parm)
	float                                              fHeight;                                                  // (Parm)
	struct FCalCoordsW                                 coordsW;                                                  // (Parm, OutParm)
};

// Function XInterface.HudBase.DrawTileFromSpriteWidget2
struct AHudBase_DrawTileFromSpriteWidget2_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FSpriteWidget                               SW;                                                       // (Parm)
	float                                              W;                                                        // (Parm)
	float                                              H;                                                        // (Parm)
};

// Function XInterface.HudBase.DrawTileFromSpriteWidget
struct AHudBase_DrawTileFromSpriteWidget_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FSpriteWidget                               SW;                                                       // (Parm)
};

// Function XInterface.HudBase.ClipScreenCoords
struct AHudBase_ClipScreenCoords_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              X;                                                        // (Parm, OutParm)
	float                                              Y;                                                        // (Parm, OutParm)
	float                                              XL;                                                       // (OptionalParm, Parm)
	float                                              YL;                                                       // (OptionalParm, Parm)
};

// Function XInterface.HudBase.IsTargetInFrontOfPlayer2
struct AHudBase_IsTargetInFrontOfPlayer2_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     TargetPos;                                                // (Parm)
	struct FVector                                     ScreenPos;                                                // (Parm, OutParm)
	struct FVector                                     camLoc;                                                   // (Parm)
	struct FRotator                                    camRot;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudBase.IsTargetInFrontOfPlayer
struct AHudBase_IsTargetInFrontOfPlayer_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class AActor*                                      Target;                                                   // (Parm)
	struct FVector                                     ScreenPos;                                                // (Parm, OutParm)
	struct FVector                                     camLoc;                                                   // (Parm)
	struct FRotator                                    camRot;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudBase.DrawIntroSubtitles
struct AHudBase_DrawIntroSubtitles_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.DrawCinematicHUD
struct AHudBase_DrawCinematicHUD_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.DrawVehicleName
struct AHudBase_DrawVehicleName_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.DrawWeaponName
struct AHudBase_DrawWeaponName_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.LoadInstructionFont
struct AHudBase_LoadInstructionFont_Params
{
	class UFont*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudBase.SetInstructionKeyText
struct AHudBase_SetInstructionKeyText_Params
{
	string                                             Text;                                                     // (Parm, NeedCtorLink)
};

// Function XInterface.HudBase.SetInstructionText
struct AHudBase_SetInstructionText_Params
{
	string                                             Text;                                                     // (Parm, NeedCtorLink)
};

// Function XInterface.HudBase.DrawInstructionKeyText
struct AHudBase_DrawInstructionKeyText_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.DrawInstructionText
struct AHudBase_DrawInstructionText_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.DrawInstructionGfx
struct AHudBase_DrawInstructionGfx_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.SetCropping
struct AHudBase_SetCropping_Params
{
	bool                                               Active;                                                   // (Parm)
};

// Function XInterface.HudBase.DrawTargeting
struct AHudBase_DrawTargeting_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.SetTargeting
struct AHudBase_SetTargeting_Params
{
	bool                                               bShow;                                                    // (Parm)
	struct FVector                                     TargetLocation;                                           // (OptionalParm, Parm)
	float                                              Size;                                                     // (OptionalParm, Parm)
};

// Function XInterface.HudBase.Draw2DLocationDot
struct AHudBase_Draw2DLocationDot_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     loc;                                                      // (Parm)
	float                                              OffsetX;                                                  // (Parm)
	float                                              OffsetY;                                                  // (Parm)
	float                                              ScaleX;                                                   // (Parm)
	float                                              ScaleY;                                                   // (Parm)
};

// Function XInterface.HudBase.CreateKeyMenus
struct AHudBase_CreateKeyMenus_Params
{
};

// Function XInterface.HudBase.DisplayLocalMessages
struct AHudBase_DisplayLocalMessages_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.DrawMessageWithTexture
struct AHudBase_DrawMessageWithTexture_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                i;                                                        // (Parm)
	float                                              PosX;                                                     // (Parm)
	float                                              PosY;                                                     // (Parm)
	float                                              dx;                                                       // (Parm, OutParm)
	float                                              dy;                                                       // (Parm, OutParm)
};

// Function XInterface.HudBase.DrawMessage
struct AHudBase_DrawMessage_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                i;                                                        // (Parm)
	float                                              PosX;                                                     // (Parm)
	float                                              PosY;                                                     // (Parm)
	float                                              dx;                                                       // (Parm, OutParm)
	float                                              dy;                                                       // (Parm, OutParm)
};

// Function XInterface.HudBase.GetScreenCoords
struct AHudBase_GetScreenCoords_Params
{
	float                                              PosX;                                                     // (Parm)
	float                                              PosY;                                                     // (Parm)
	float                                              ScreenX;                                                  // (Parm, OutParm)
	float                                              ScreenY;                                                  // (Parm, OutParm)
	struct FHudLocalizedMessage                        Message;                                                  // (Parm, OutParm, NeedCtorLink)
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.LayoutMessage
struct AHudBase_LayoutMessage_Params
{
	struct FHudLocalizedMessage                        Message;                                                  // (Parm, OutParm, NeedCtorLink)
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.GetLocalStatsScreen
struct AHudBase_GetLocalStatsScreen_Params
{
};

// Function XInterface.HudBase.GetTeamColor
struct AHudBase_GetTeamColor_Params
{
	byte                                               TeamNum;                                                  // (Parm)
	struct FColor                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudBase.RemoveLocalizedMessage
struct AHudBase_RemoveLocalizedMessage_Params
{
	class UClass*                                      Message;                                                  // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
	string                                             CriticalString;                                           // (OptionalParm, Parm, NeedCtorLink)
};

// Function XInterface.HudBase.LocalizedMessage2
struct AHudBase_LocalizedMessage2_Params
{
	class UClass*                                      Message;                                                  // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	bool                                               bOption_Push;                                             // (OptionalParm, Parm)
	string                                             CriticalString;                                           // (OptionalParm, Parm, NeedCtorLink)
};

// Function XInterface.HudBase.LocalizedMessageEx
struct AHudBase_LocalizedMessageEx_Params
{
	class UClass*                                      Message;                                                  // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
	string                                             CriticalString;                                           // (OptionalParm, Parm, NeedCtorLink)
	int                                                iReserve;                                                 // (OptionalParm, Parm)
};

// Function XInterface.HudBase.LocalizedMessage
struct AHudBase_LocalizedMessage_Params
{
	class UClass*                                      Message;                                                  // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
	string                                             CriticalString;                                           // (OptionalParm, Parm, NeedCtorLink)
};

// Function XInterface.HudBase.Message
struct AHudBase_Message_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	string                                             Msg;                                                      // (Parm, CoerceParm, NeedCtorLink)
	FName                                              MsgType;                                                  // (Parm)
};

// Function XInterface.HudBase.ClearMessage
struct AHudBase_ClearMessage_Params
{
	struct FHudLocalizedMessage                        M;                                                        // (Parm, OutParm, NeedCtorLink)
};

// Function XInterface.HudBase.AddChildHudPart
struct AHudBase_AddChildHudPart_Params
{
	class AHudBase*                                    Child;                                                    // (Parm)
};

// Function XInterface.HudBase.DrawDigitSet
struct AHudBase_DrawDigitSet_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              X;                                                        // (Parm)
	float                                              Y;                                                        // (Parm)
	float                                              OffsetX;                                                  // (Parm)
	float                                              XL;                                                       // (Parm)
	float                                              YL;                                                       // (Parm)
	int                                                Value;                                                    // (Parm)
	struct FDigitSet                                   dSet;                                                     // (Parm)
	int                                                totalDigits;                                              // (Parm)
	string                                             paddingChar;                                              // (Parm, NeedCtorLink)
};

// Function XInterface.HudBase.DrawCSReviw
struct AHudBase_DrawCSReviw_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.DrawNumericWidget
struct AHudBase_DrawNumericWidget_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FNumericWidget                              W;                                                        // (Parm, OutParm)
	struct FDigitSet                                   D;                                                        // (Parm, OutParm)
};

// Function XInterface.HudBase.DrawSpriteWidget
struct AHudBase_DrawSpriteWidget_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FSpriteWidget                               W;                                                        // (Parm, OutParm)
};

// Function XInterface.HudBase.DrawHUD
struct AHudBase_DrawHUD_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.UpdateScreenRatios
struct AHudBase_UpdateScreenRatios_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.DrawAttacked
struct AHudBase_DrawAttacked_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.DrawHeadShotSphere
struct AHudBase_DrawHeadShotSphere_Params
{
};

// Function XInterface.HudBase.Tick
struct AHudBase_Tick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function XInterface.HudBase.PlayPainSound
struct AHudBase_PlayPainSound_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.DrawDamageIndicators
struct AHudBase_DrawDamageIndicators_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.DisplayHit
struct AHudBase_DisplayHit_Params
{
	struct FVector                                     HitDir;                                                   // (Parm)
	int                                                Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
};

// Function XInterface.HudBase.DrawMiniMap
struct AHudBase_DrawMiniMap_Params
{
	class AwHudPart_MinimapBase*                       Minimap;                                                  // (Parm)
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.SetCustomHUDColor
struct AHudBase_SetCustomHUDColor_Params
{
};

// Function XInterface.HudBase.CustomHUDColorAllowed
struct AHudBase_CustomHUDColorAllowed_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudBase.PostBeginPlay
struct AHudBase_PostBeginPlay_Params
{
};

// Function XInterface.HudBase.PrecacheFonts
struct AHudBase_PrecacheFonts_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.DrawHudPassD
struct AHudBase_DrawHudPassD_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.DrawHudPassC
struct AHudBase_DrawHudPassC_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.DrawHudPassB
struct AHudBase_DrawHudPassB_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.DrawHudPassA
struct AHudBase_DrawHudPassA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudBase.UpdateHUD
struct AHudBase_UpdateHUD_Params
{
};

// Function XInterface.HudBase.DoUpdateTime
struct AHudBase_DoUpdateTime_Params
{
};

// Function XInterface.wHudPart_KillMessage.Draw
struct AwHudPart_KillMessage_Draw_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_KillMessage.DrawOnlyImage
struct AwHudPart_KillMessage_DrawOnlyImage_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_KillMessage.DrawOnlyText
struct AwHudPart_KillMessage_DrawOnlyText_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_KillMessage.UpdateCache
struct AwHudPart_KillMessage_UpdateCache_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_KillMessage.End
struct AwHudPart_KillMessage_End_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_KillMessage.Begin
struct AwHudPart_KillMessage_Begin_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_KillMessage.DrawNative
struct AwHudPart_KillMessage_DrawNative_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_KillMessage.Update
struct AwHudPart_KillMessage_Update_Params
{
};

// Function XInterface.wHudPart_KillMessage.AddKillMessageItem
struct AwHudPart_KillMessage_AddKillMessageItem_Params
{
	struct FKillMessageItem                            Item;                                                     // (Parm, NeedCtorLink)
};

// Function XInterface.wHudPart_KillMessage.AddKillMessage
struct AwHudPart_KillMessage_AddKillMessage_Params
{
	class APlayerReplicationInfo*                      KillerPRI;                                                // (Parm)
	class APlayerReplicationInfo*                      victimPRI;                                                // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                Switch;                                                   // (Parm)
};

// Function XInterface.wHudPart_KillMessage.GetNameColor
struct AwHudPart_KillMessage_GetNameColor_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	struct FColor                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_KillMessage.MakeKillMessageItem
struct AwHudPart_KillMessage_MakeKillMessageItem_Params
{
	class APlayerReplicationInfo*                      KillerPRI;                                                // (Parm)
	class APlayerReplicationInfo*                      victimPRI;                                                // (Parm)
	string                                             KillerName;                                               // (Parm, NeedCtorLink)
	string                                             VictimName;                                               // (Parm, NeedCtorLink)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                Switch;                                                   // (Parm)
	bool                                               NoKillerName;                                             // (Parm)
	bool                                               NoVictimName;                                             // (Parm)
	class UMaterial*                                   overrideImage;                                            // (Parm)
	struct FKillMessageItem                            ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.wHudPart_KillMessage.Initialize
struct AwHudPart_KillMessage_Initialize_Params
{
	class AHudBase*                                    myOwner;                                                  // (Parm)
	class ALevelInfo*                                  myLevel;                                                  // (Parm)
};

// Function XInterface.wHudPart_KillMessage.Precache
struct AwHudPart_KillMessage_Precache_Params
{
};

// Function XInterface.GUIListBoxBase.SetFriendlyLabel
struct UGUIListBoxBase_SetFriendlyLabel_Params
{
	class UGUILabel*                                   NewLabel;                                                 // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIListBoxBase.SetScrollBarStyle
struct UGUIListBoxBase_SetScrollBarStyle_Params
{
	bool                                               changeScrollZoneStyle;                                    // (Parm)
	class UGUIStyles*                                  scrollZoneStyle;                                          // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               changeIncreaseButtonStyle;                                // (Parm)
	class UGUIStyles*                                  increaseButtonStyle;                                      // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               changeIncreaseButtonGraphic;                              // (Parm)
	class UMaterial*                                   increaseButtonGraphic;                                    // (Parm)
	bool                                               changeDecreaseButtonStyle;                                // (Parm)
	class UGUIStyles*                                  decreaseButtonStyle;                                      // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               changeDecreaseButtonGraphic;                              // (Parm)
	class UMaterial*                                   decreaseButtonGraphic;                                    // (Parm)
	bool                                               changeGripButtonStyle;                                    // (Parm)
	class UGUIStyles*                                  gripButtonStyle;                                          // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIListBoxBase.InternalOnCreateComponent
struct UGUIListBoxBase_InternalOnCreateComponent_Params
{
	class UGUIComponent*                               NewComp;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIListBoxBase.SetHint
struct UGUIListBoxBase_SetHint_Params
{
	string                                             NewHint;                                                  // (Parm, NeedCtorLink)
};

// Function XInterface.GUIListBoxBase.InitBaseList
struct UGUIListBoxBase_InitBaseList_Params
{
	class UGUIListBase*                                LocalList;                                                // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIListBoxBase.InitComponent
struct UGUIListBoxBase_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIListBox.MyClose
struct UGUIListBox_MyClose_Params
{
	class UGUIContextMenu*                             Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBox.MyOpen
struct UGUIListBox_MyOpen_Params
{
	class UGUIContextMenu*                             Menu;                                                     // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBox.ItemCount
struct UGUIListBox_ItemCount_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBox.InternalOnChange
struct UGUIListBox_InternalOnChange_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIListBox.InternalOnDblClick
struct UGUIListBox_InternalOnDblClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBox.InternalOnClick
struct UGUIListBox_InternalOnClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBox.InitComponent
struct UGUIListBox_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIListBox.InitBaseList
struct UGUIListBox_InitBaseList_Params
{
	class UGUIListBase*                                LocalList;                                                // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIScrollTextBox.AddText
struct UGUIScrollTextBox_AddText_Params
{
	string                                             NewText;                                                  // (Parm, NeedCtorLink)
};

// Function XInterface.GUIScrollTextBox.StripColors
struct UGUIScrollTextBox_StripColors_Params
{
	string                                             MyString;                                                 // (Parm, NeedCtorLink)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIScrollTextBox.IsNumber
struct UGUIScrollTextBox_IsNumber_Params
{
	string                                             Num;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIScrollTextBox.InternalOnAdjustTop
struct UGUIScrollTextBox_InternalOnAdjustTop_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIScrollTextBox.Stop
struct UGUIScrollTextBox_Stop_Params
{
};

// Function XInterface.GUIScrollTextBox.Restart
struct UGUIScrollTextBox_Restart_Params
{
};

// Function XInterface.GUIScrollTextBox.SetContent
struct UGUIScrollTextBox_SetContent_Params
{
	string                                             NewContent;                                               // (Parm, NeedCtorLink)
	string                                             sep;                                                      // (OptionalParm, Parm, NeedCtorLink)
};

// Function XInterface.GUIScrollTextBox.InitComponent
struct UGUIScrollTextBox_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIScrollTextBox.InitBaseList
struct UGUIScrollTextBox_InitBaseList_Params
{
	class UGUIListBase*                                LocalList;                                                // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIScrollTextBox.InternalOnCreateComponent
struct UGUIScrollTextBox_InternalOnCreateComponent_Params
{
	class UGUIComponent*                               NewComp;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIScrollTextBox.Created
struct UGUIScrollTextBox_Created_Params
{
};

// Function XInterface.GUIMultiColumnListBox.SetHeaderStyle
struct UGUIMultiColumnListBox_SetHeaderStyle_Params
{
	bool                                               changeStyle;                                              // (Parm)
	string                                             stylez;                                                   // (Parm, NeedCtorLink)
	bool                                               changeBarStyle;                                           // (Parm)
	string                                             barStylez;                                                // (Parm, NeedCtorLink)
};

// Function XInterface.GUIMultiColumnListBox.InternalOnColumnSized
struct UGUIMultiColumnListBox_InternalOnColumnSized_Params
{
	int                                                Column;                                                   // (Parm)
};

// Function XInterface.GUIMultiColumnListBox.InternalOnCreateComponent
struct UGUIMultiColumnListBox_InternalOnCreateComponent_Params
{
	class UGUIComponent*                               NewComp;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIMultiColumnListBox.InternalOnLoadINI
struct UGUIMultiColumnListBox_InternalOnLoadINI_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	string                                             S;                                                        // (Parm, NeedCtorLink)
};

// Function XInterface.GUIMultiColumnListBox.InitComponent
struct UGUIMultiColumnListBox_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIMultiColumnListBox.InitBaseList
struct UGUIMultiColumnListBox_InitBaseList_Params
{
	class UGUIListBase*                                LocalList;                                                // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIListBase.SetOutlineAlpha
struct UGUIListBase_SetOutlineAlpha_Params
{
	int                                                NewAlpha;                                                 // (Parm)
};

// Function XInterface.GUIListBase.IsMultiSelect
struct UGUIListBase_IsMultiSelect_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBase.InternalOnDragLeave
struct UGUIListBase_InternalOnDragLeave_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIListBase.InternalOnDragEnter
struct UGUIListBase_InternalOnDragEnter_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIListBase.InternalOnDragOver
struct UGUIListBase_InternalOnDragOver_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIListBase.InternalOnDragDrop
struct UGUIListBase_InternalOnDragDrop_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBase.InternalOnEndDrag
struct UGUIListBase_InternalOnEndDrag_Params
{
	class UGUIComponent*                               Accepting;                                                // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bAccepted;                                                // (Parm)
};

// Function XInterface.GUIListBase.InternalOnRightClick
struct UGUIListBase_InternalOnRightClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBase.CheckDragSelect
struct UGUIListBase_CheckDragSelect_Params
{
};

// Function XInterface.GUIListBase.InternalOnBeginDrag
struct UGUIListBase_InternalOnBeginDrag_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBase.InternalOnMouseRelease
struct UGUIListBase_InternalOnMouseRelease_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIListBase.InternalOnMousePressed
struct UGUIListBase_InternalOnMousePressed_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               IsRepeat;                                                 // (Parm)
};

// Function XInterface.GUIListBase.End
struct UGUIListBase_End_Params
{
};

// Function XInterface.GUIListBase.home
struct UGUIListBase_home_Params
{
};

// Function XInterface.GUIListBase.PgDn
struct UGUIListBase_PgDn_Params
{
};

// Function XInterface.GUIListBase.PgUp
struct UGUIListBase_PgUp_Params
{
};

// Function XInterface.GUIListBase.WheelDown
struct UGUIListBase_WheelDown_Params
{
};

// Function XInterface.GUIListBase.WheelUp
struct UGUIListBase_WheelUp_Params
{
};

// Function XInterface.GUIListBase.MoveLeft
struct UGUIListBase_MoveLeft_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBase.MoveRight
struct UGUIListBase_MoveRight_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBase.Down
struct UGUIListBase_Down_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBase.Up
struct UGUIListBase_Up_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBase.InternalOnKeyEvent
struct UGUIListBase_InternalOnKeyEvent_Params
{
	byte                                               key;                                                      // (Parm, OutParm)
	byte                                               KeyState;                                                 // (Parm, OutParm)
	float                                              Delta;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBase.GetPendingItems
struct UGUIListBase_GetPendingItems_Params
{
	bool                                               bGuarantee;                                               // (OptionalParm, Parm)
	string[]                                           ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIListBase.GetItemAtIndex
struct UGUIListBase_GetItemAtIndex_Params
{
	int                                                idx;                                                      // (Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIListBase.AdditionalDebugString
struct UGUIListBase_AdditionalDebugString_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIListBase.IsValidIndex
struct UGUIListBase_IsValidIndex_Params
{
	int                                                i;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBase.IsValid
struct UGUIListBase_IsValid_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBase.DisableLinkedObjects
struct UGUIListBase_DisableLinkedObjects_Params
{
};

// Function XInterface.GUIListBase.EnableLinkedObjects
struct UGUIListBase_EnableLinkedObjects_Params
{
};

// Function XInterface.GUIListBase.InitLinkObjects
struct UGUIListBase_InitLinkObjects_Params
{
	class UGUIComponent*[]                             NewObj;                                                   // (Parm, NeedCtorLink)
	bool                                               bNoCheck;                                                 // (OptionalParm, Parm)
};

// Function XInterface.GUIListBase.AddLinkObject
struct UGUIListBase_AddLinkObject_Params
{
	class UGUIComponent*                               NewObj;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bNoCheck;                                                 // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBase.SetTopItem
struct UGUIListBase_SetTopItem_Params
{
	int                                                Item;                                                     // (Parm)
};

// Function XInterface.GUIListBase.MakeVisible
struct UGUIListBase_MakeVisible_Params
{
	float                                              perc;                                                     // (Parm)
};

// Function XInterface.GUIListBase.Clear
struct UGUIListBase_Clear_Params
{
};

// Function XInterface.GUIListBase.ClearPendingElements
struct UGUIListBase_ClearPendingElements_Params
{
};

// Function XInterface.GUIListBase.IndexChanged
struct UGUIListBase_IndexChanged_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIListBase.SetIndex
struct UGUIListBase_SetIndex_Params
{
	int                                                NewIndex;                                                 // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBase.MultiCalculateIndex
struct UGUIListBase_MultiCalculateIndex_Params
{
	bool                                               bRequireValidIndex;                                       // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBase.CalculateIndex
struct UGUIListBase_CalculateIndex_Params
{
	bool                                               bRequireValidIndex;                                       // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBase.SilentSetIndex
struct UGUIListBase_SilentSetIndex_Params
{
	int                                                NewIndex;                                                 // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIListBase.Sort
struct UGUIListBase_Sort_Params
{
};

// Function XInterface.GUIListBase.UpdateScrollbarForcedPosition
struct UGUIListBase_UpdateScrollbarForcedPosition_Params
{
};

// Function XInterface.GUIListBase.InitComponent
struct UGUIListBase_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIListBase.CheckLinkedObjects
struct UGUIListBase_CheckLinkedObjects_Params
{
	class UGUIListBase*                                List;                                                     // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIListBase.OnTrack
struct UGUIListBase_OnTrack_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	int                                                LastIndex;                                                // (Parm)
};

// Function XInterface.GUIListBase.OnAdjustTop
struct UGUIListBase_OnAdjustTop_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIListBase.OnDrawItem
struct UGUIListBase_OnDrawItem_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	int                                                Item;                                                     // (Parm)
	float                                              X;                                                        // (Parm)
	float                                              Y;                                                        // (Parm)
	float                                              W;                                                        // (Parm)
	float                                              HT;                                                       // (Parm)
	bool                                               bSelected;                                                // (Parm)
	bool                                               bPending;                                                 // (Parm)
};

// Function XInterface.GUIListBase.OnScrollBy
struct UGUIListBase_OnScrollBy_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIVertList.PgDn
struct UGUIVertList_PgDn_Params
{
};

// Function XInterface.GUIVertList.PgUp
struct UGUIVertList_PgUp_Params
{
};

// Function XInterface.GUIVertList.End
struct UGUIVertList_End_Params
{
};

// Function XInterface.GUIVertList.home
struct UGUIVertList_home_Params
{
};

// Function XInterface.GUIVertList.Down
struct UGUIVertList_Down_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertList.Up
struct UGUIVertList_Up_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertList.WheelDown
struct UGUIVertList_WheelDown_Params
{
};

// Function XInterface.GUIVertList.WheelUp
struct UGUIVertList_WheelUp_Params
{
};

// Function XInterface.GUIVertList.InternalOnKeyType
struct UGUIVertList_InternalOnKeyType_Params
{
	byte                                               key;                                                      // (Parm, OutParm)
	string                                             Unicode;                                                  // (OptionalParm, Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertList.InternalOnClick
struct UGUIVertList_InternalOnClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertList.MultiCalculateIndex
struct UGUIVertList_MultiCalculateIndex_Params
{
	bool                                               bRequireValidIndex;                                       // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertList.CalculateIndex
struct UGUIVertList_CalculateIndex_Params
{
	bool                                               bRequireValidIndex;                                       // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertList.CenterMouse
struct UGUIVertList_CenterMouse_Params
{
};

// Function XInterface.GUIVertList.GetItemHeight
struct UGUIVertList_GetItemHeight_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIList.GetPendingElements
struct UGUIList_GetPendingElements_Params
{
	bool                                               bGuarantee;                                               // (OptionalParm, Parm)
	struct FGUIListElem[]                              ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIList.ClearPendingElements
struct UGUIList_ClearPendingElements_Params
{
};

// Function XInterface.GUIList.InternalOnDragDrop
struct UGUIList_InternalOnDragDrop_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIList.InternalOnEndDrag
struct UGUIList_InternalOnEndDrag_Params
{
	class UGUIComponent*                               Accepting;                                                // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bAccepted;                                                // (Parm)
};

// Function XInterface.GUIList.FindIndex
struct UGUIList_FindIndex_Params
{
	string                                             test;                                                     // (Parm, NeedCtorLink)
	bool                                               bExact;                                                   // (OptionalParm, Parm)
	bool                                               bExtra;                                                   // (OptionalParm, Parm)
	class UObject*                                     TestObject;                                               // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIList.FindItemObject
struct UGUIList_FindItemObject_Params
{
	class UObject*                                     obj;                                                      // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIList.FindExtra
struct UGUIList_FindExtra_Params
{
	string                                             Text;                                                     // (Parm, NeedCtorLink)
	bool                                               bExact;                                                   // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIList.Find
struct UGUIList_Find_Params
{
	string                                             Text;                                                     // (Parm, NeedCtorLink)
	bool                                               bExact;                                                   // (OptionalParm, Parm)
	bool                                               bExtra;                                                   // (OptionalParm, Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIList.RemoveExtra
struct UGUIList_RemoveExtra_Params
{
	string                                             str;                                                      // (Parm, NeedCtorLink)
};

// Function XInterface.GUIList.RemoveObject
struct UGUIList_RemoveObject_Params
{
	class UObject*                                     obj;                                                      // (Parm)
};

// Function XInterface.GUIList.RemoveItem
struct UGUIList_RemoveItem_Params
{
	string                                             Item;                                                     // (Parm, NeedCtorLink)
};

// Function XInterface.GUIList.SetExtraAtIndex
struct UGUIList_SetExtraAtIndex_Params
{
	int                                                i;                                                        // (Parm)
	string                                             NewExtra;                                                 // (Parm, NeedCtorLink)
};

// Function XInterface.GUIList.SetObjectAtIndex
struct UGUIList_SetObjectAtIndex_Params
{
	int                                                i;                                                        // (Parm)
	class UObject*                                     NewObject;                                                // (Parm)
};

// Function XInterface.GUIList.SetItemAtIndex
struct UGUIList_SetItemAtIndex_Params
{
	int                                                i;                                                        // (Parm)
	string                                             NewItem;                                                  // (Parm, NeedCtorLink)
};

// Function XInterface.GUIList.GetAtIndex
struct UGUIList_GetAtIndex_Params
{
	int                                                i;                                                        // (Parm)
	string                                             ItemStr;                                                  // (Parm, OutParm, NeedCtorLink)
	class UObject*                                     ExtraObj;                                                 // (Parm, OutParm)
	string                                             ExtraStr;                                                 // (Parm, OutParm, NeedCtorLink)
};

// Function XInterface.GUIList.GetExtraAtIndex
struct UGUIList_GetExtraAtIndex_Params
{
	int                                                i;                                                        // (Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIList.GetObjectAtIndex
struct UGUIList_GetObjectAtIndex_Params
{
	int                                                i;                                                        // (Parm)
	class UObject*                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIList.GetItemAtIndex
struct UGUIList_GetItemAtIndex_Params
{
	int                                                i;                                                        // (Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIList.IsSection
struct UGUIList_IsSection_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIList.GetExtra
struct UGUIList_GetExtra_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIList.GetObject
struct UGUIList_GetObject_Params
{
	class UObject*                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIList.Get
struct UGUIList_Get_Params
{
	bool                                               bGuarantee;                                               // (OptionalParm, Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIList.SelectedText
struct UGUIList_SelectedText_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIList.Clear
struct UGUIList_Clear_Params
{
};

// Function XInterface.GUIList.RemoveElement
struct UGUIList_RemoveElement_Params
{
	struct FGUIListElem                                elem;                                                     // (Parm, NeedCtorLink)
	int                                                Count;                                                    // (OptionalParm, Parm)
	bool                                               bNoSort;                                                  // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIList.RemoveSilent
struct UGUIList_RemoveSilent_Params
{
	int                                                i;                                                        // (Parm)
	int                                                Count;                                                    // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIList.Remove
struct UGUIList_Remove_Params
{
	int                                                i;                                                        // (Parm)
	int                                                Count;                                                    // (OptionalParm, Parm)
	bool                                               bNoSort;                                                  // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIList.LoadFrom
struct UGUIList_LoadFrom_Params
{
	class UGUIList*                                    Source;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bClearFirst;                                              // (OptionalParm, Parm)
};

// Function XInterface.GUIList.Swap
struct UGUIList_Swap_Params
{
	int                                                IndexA;                                                   // (Parm)
	int                                                IndexB;                                                   // (Parm)
};

// Function XInterface.GUIList.InsertElement
struct UGUIList_InsertElement_Params
{
	int                                                i;                                                        // (Parm)
	struct FGUIListElem                                NewElem;                                                  // (Parm, NeedCtorLink)
	bool                                               bNoSort;                                                  // (OptionalParm, Parm)
};

// Function XInterface.GUIList.Insert
struct UGUIList_Insert_Params
{
	int                                                i;                                                        // (Parm)
	string                                             NewItem;                                                  // (Parm, NeedCtorLink)
	class UObject*                                     obj;                                                      // (OptionalParm, Parm)
	string                                             str;                                                      // (OptionalParm, Parm, NeedCtorLink)
	bool                                               bNoSort;                                                  // (OptionalParm, Parm)
	bool                                               bSection;                                                 // (OptionalParm, Parm)
};

// Function XInterface.GUIList.Replace
struct UGUIList_Replace_Params
{
	int                                                i;                                                        // (Parm)
	string                                             NewItem;                                                  // (Parm, NeedCtorLink)
	class UObject*                                     obj;                                                      // (OptionalParm, Parm)
	string                                             str;                                                      // (OptionalParm, Parm, NeedCtorLink)
	bool                                               bNoSort;                                                  // (OptionalParm, Parm)
};

// Function XInterface.GUIList.AddElement
struct UGUIList_AddElement_Params
{
	struct FGUIListElem                                NewElem;                                                  // (Parm, NeedCtorLink)
};

// Function XInterface.GUIList.Add
struct UGUIList_Add_Params
{
	string                                             NewItem;                                                  // (Parm, NeedCtorLink)
	class UObject*                                     obj;                                                      // (OptionalParm, Parm)
	string                                             str;                                                      // (OptionalParm, Parm, NeedCtorLink)
	bool                                               bSection;                                                 // (OptionalParm, Parm)
};

// Function XInterface.GUIList.CompareItem
struct UGUIList_CompareItem_Params
{
	struct FGUIListElem                                ElemA;                                                    // (Parm, NeedCtorLink)
	struct FGUIListElem                                ElemB;                                                    // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIList.Sort
struct UGUIList_Sort_Params
{
};

// Function XInterface.GUIList.SortList
struct UGUIList_SortList_Params
{
};

// Function XInterface.GUIScrollText.IsValid
struct UGUIScrollText_IsValid_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIScrollText.EndScrolling
struct UGUIScrollText_EndScrolling_Params
{
};

// Function XInterface.GUIScrollText.InternalOnKeyEvent
struct UGUIScrollText_InternalOnKeyEvent_Params
{
	byte                                               key;                                                      // (Parm, OutParm)
	byte                                               State;                                                    // (Parm, OutParm)
	float                                              Delta;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIScrollText.InternalOnKeyType
struct UGUIScrollText_InternalOnKeyType_Params
{
	byte                                               key;                                                      // (Parm, OutParm)
	string                                             Unicode;                                                  // (OptionalParm, Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIScrollText.InternalOnClick
struct UGUIScrollText_InternalOnClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIScrollText.Timer
struct UGUIScrollText_Timer_Params
{
};

// Function XInterface.GUIScrollText.SkipChar
struct UGUIScrollText_SkipChar_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIScrollText.Restart
struct UGUIScrollText_Restart_Params
{
};

// Function XInterface.GUIScrollText.Stop
struct UGUIScrollText_Stop_Params
{
};

// Function XInterface.GUIScrollText.SetContent
struct UGUIScrollText_SetContent_Params
{
	string                                             NewContent;                                               // (Parm, NeedCtorLink)
	string                                             sep;                                                      // (OptionalParm, Parm, NeedCtorLink)
};

// Function XInterface.GUIScrollText.InitComponent
struct UGUIScrollText_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIScrollText.Dump
struct UGUIScrollText_Dump_Params
{
};

// Function XInterface.GUIScrollText.OnEndOfLine
struct UGUIScrollText_OnEndOfLine_Params
{
};

// Function XInterface.GUIScrollText.GetWordUnderCursor
struct UGUIScrollText_GetWordUnderCursor_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIMultiColumnListHeader.InitComponent
struct UGUIMultiColumnListHeader_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIVertImageList.InternalOnDragDrop
struct UGUIVertImageList_InternalOnDragDrop_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.InternalOnEndDrag
struct UGUIVertImageList_InternalOnEndDrag_Params
{
	class UGUIComponent*                               Accepting;                                                // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bAccepted;                                                // (Parm)
};

// Function XInterface.GUIVertImageList.FindItem
struct UGUIVertImageList_FindItem_Params
{
	int                                                Item;                                                     // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.FindImage
struct UGUIVertImageList_FindImage_Params
{
	class UMaterial*                                   Image;                                                    // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.RemoveItem
struct UGUIVertImageList_RemoveItem_Params
{
	int                                                Item;                                                     // (Parm)
};

// Function XInterface.GUIVertImageList.RemoveImage
struct UGUIVertImageList_RemoveImage_Params
{
	class UMaterial*                                   Image;                                                    // (Parm)
};

// Function XInterface.GUIVertImageList.SetItemAtIndex
struct UGUIVertImageList_SetItemAtIndex_Params
{
	int                                                i;                                                        // (Parm)
	int                                                NewItem;                                                  // (Parm)
};

// Function XInterface.GUIVertImageList.SetImageAtIndex
struct UGUIVertImageList_SetImageAtIndex_Params
{
	int                                                i;                                                        // (Parm)
	class UMaterial*                                   NewImage;                                                 // (Parm)
};

// Function XInterface.GUIVertImageList.GetPendingElements
struct UGUIVertImageList_GetPendingElements_Params
{
	bool                                               bGuarantee;                                               // (OptionalParm, Parm)
	struct FImageListElem[]                            ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIVertImageList.ClearPendingElements
struct UGUIVertImageList_ClearPendingElements_Params
{
};

// Function XInterface.GUIVertImageList.IsLocked
struct UGUIVertImageList_IsLocked_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.IndexLocked
struct UGUIVertImageList_IndexLocked_Params
{
	int                                                i;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.GetAtIndex
struct UGUIVertImageList_GetAtIndex_Params
{
	int                                                i;                                                        // (Parm)
	class UMaterial*                                   Image;                                                    // (Parm, OutParm)
	int                                                Item;                                                     // (Parm, OutParm)
	int                                                Locked;                                                   // (Parm, OutParm)
};

// Function XInterface.GUIVertImageList.GetItemIntAtIndex
struct UGUIVertImageList_GetItemIntAtIndex_Params
{
	int                                                i;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.GetItemAtIndex
struct UGUIVertImageList_GetItemAtIndex_Params
{
	int                                                i;                                                        // (Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIVertImageList.GetImageAtIndex
struct UGUIVertImageList_GetImageAtIndex_Params
{
	int                                                i;                                                        // (Parm)
	class UMaterial*                                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.GetItem
struct UGUIVertImageList_GetItem_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.Get
struct UGUIVertImageList_Get_Params
{
	bool                                               bGuarantee;                                               // (OptionalParm, Parm)
	class UMaterial*                                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.Clear
struct UGUIVertImageList_Clear_Params
{
};

// Function XInterface.GUIVertImageList.RemoveElement
struct UGUIVertImageList_RemoveElement_Params
{
	struct FImageListElem                              elem;                                                     // (Parm)
	int                                                Count;                                                    // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.RemoveSilent
struct UGUIVertImageList_RemoveSilent_Params
{
	int                                                i;                                                        // (Parm)
	int                                                Count;                                                    // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.Remove
struct UGUIVertImageList_Remove_Params
{
	int                                                i;                                                        // (Parm)
	int                                                Count;                                                    // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.LoadFrom
struct UGUIVertImageList_LoadFrom_Params
{
	class UGUIVertImageList*                           Source;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bClearFirst;                                              // (OptionalParm, Parm)
};

// Function XInterface.GUIVertImageList.Swap
struct UGUIVertImageList_Swap_Params
{
	int                                                IndexA;                                                   // (Parm)
	int                                                IndexB;                                                   // (Parm)
};

// Function XInterface.GUIVertImageList.InsertElement
struct UGUIVertImageList_InsertElement_Params
{
	int                                                i;                                                        // (Parm)
	struct FImageListElem                              NewElem;                                                  // (Parm)
	int                                                Locked;                                                   // (OptionalParm, Parm)
};

// Function XInterface.GUIVertImageList.Insert
struct UGUIVertImageList_Insert_Params
{
	int                                                i;                                                        // (Parm)
	class UMaterial*                                   NewImage;                                                 // (Parm)
	int                                                NewItem;                                                  // (OptionalParm, Parm)
	int                                                Locked;                                                   // (OptionalParm, Parm)
};

// Function XInterface.GUIVertImageList.Replace
struct UGUIVertImageList_Replace_Params
{
	int                                                i;                                                        // (Parm)
	class UMaterial*                                   NewImage;                                                 // (Parm)
	int                                                NewItem;                                                  // (OptionalParm, Parm)
	int                                                Locked;                                                   // (OptionalParm, Parm)
};

// Function XInterface.GUIVertImageList.AddImage
struct UGUIVertImageList_AddImage_Params
{
	struct FImageListElem                              NewElem;                                                  // (Parm)
	int                                                Locked;                                                   // (OptionalParm, Parm)
};

// Function XInterface.GUIVertImageList.Add
struct UGUIVertImageList_Add_Params
{
	class UMaterial*                                   Image;                                                    // (Parm)
	int                                                Item;                                                     // (OptionalParm, Parm)
	int                                                Locked;                                                   // (OptionalParm, Parm)
};

// Function XInterface.GUIVertImageList.SetTopItem
struct UGUIVertImageList_SetTopItem_Params
{
	int                                                Item;                                                     // (Parm)
};

// Function XInterface.GUIVertImageList.MakeVisible
struct UGUIVertImageList_MakeVisible_Params
{
	float                                              perc;                                                     // (Parm)
};

// Function XInterface.GUIVertImageList.PgDn
struct UGUIVertImageList_PgDn_Params
{
};

// Function XInterface.GUIVertImageList.PgUp
struct UGUIVertImageList_PgUp_Params
{
};

// Function XInterface.GUIVertImageList.End
struct UGUIVertImageList_End_Params
{
};

// Function XInterface.GUIVertImageList.home
struct UGUIVertImageList_home_Params
{
};

// Function XInterface.GUIVertImageList.MoveLeft
struct UGUIVertImageList_MoveLeft_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.MoveRight
struct UGUIVertImageList_MoveRight_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.Down
struct UGUIVertImageList_Down_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.Up
struct UGUIVertImageList_Up_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.SetIndex
struct UGUIVertImageList_SetIndex_Params
{
	int                                                NewIndex;                                                 // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.InternalOnClick
struct UGUIVertImageList_InternalOnClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.OnIsSelectibleIndex
struct UGUIVertImageList_OnIsSelectibleIndex_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	int                                                Index;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.OnItemDblClick
struct UGUIVertImageList_OnItemDblClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageList.CalculateIndex
struct UGUIVertImageList_CalculateIndex_Params
{
	bool                                               bRequireValidIndex;                                       // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIMultiColumnList.SetTopItem
struct UGUIMultiColumnList_SetTopItem_Params
{
	int                                                Item;                                                     // (Parm)
};

// Function XInterface.GUIMultiColumnList.Dump
struct UGUIMultiColumnList_Dump_Params
{
};

// Function XInterface.GUIMultiColumnList.Sort
struct UGUIMultiColumnList_Sort_Params
{
};

// Function XInterface.GUIMultiColumnList.GetCellLeftWidth
struct UGUIMultiColumnList_GetCellLeftWidth_Params
{
	int                                                Column;                                                   // (Parm)
	float                                              Left;                                                     // (Parm, OutParm)
	float                                              width;                                                    // (Parm, OutParm)
};

// Function XInterface.GUIMultiColumnList.InternalOnPreDraw
struct UGUIMultiColumnList_InternalOnPreDraw_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIMultiColumnList.InitializeColumns
struct UGUIMultiColumnList_InitializeColumns_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.GUIMultiColumnList.ResolutionChanged
struct UGUIMultiColumnList_ResolutionChanged_Params
{
	int                                                ResX;                                                     // (Parm)
	int                                                ResY;                                                     // (Parm)
};

// Function XInterface.GUIMultiColumnList.RemovedCurrent
struct UGUIMultiColumnList_RemovedCurrent_Params
{
};

// Function XInterface.GUIMultiColumnList.Clear
struct UGUIMultiColumnList_Clear_Params
{
};

// Function XInterface.GUIMultiColumnList.OnSortChanged
struct UGUIMultiColumnList_OnSortChanged_Params
{
};

// Function XInterface.GUIMultiColumnList.CurrentListId
struct UGUIMultiColumnList_CurrentListId_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIMultiColumnList.GetSortString
struct UGUIMultiColumnList_GetSortString_Params
{
	int                                                YourArrayIndex;                                           // (Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIMultiColumnList.AddedItem
struct UGUIMultiColumnList_AddedItem_Params
{
	int                                                YourArrayIndex;                                           // (OptionalParm, Parm)
};

// Function XInterface.GUIMultiColumnList.RemovedItem
struct UGUIMultiColumnList_RemovedItem_Params
{
	int                                                YourArrayIndex;                                           // (Parm)
};

// Function XInterface.GUIMultiColumnList.UpdatedItem
struct UGUIMultiColumnList_UpdatedItem_Params
{
	int                                                YourArrayIndex;                                           // (Parm)
};

// Function XInterface.GUIMultiColumnList.SortList
struct UGUIMultiColumnList_SortList_Params
{
};

// Function XInterface.GUIMultiColumnList.ChangeSortOrder
struct UGUIMultiColumnList_ChangeSortOrder_Params
{
};

// Function XInterface.GUIMultiColumnList.GetListIndex
struct UGUIMultiColumnList_GetListIndex_Params
{
	int                                                YourArrayIndex;                                           // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIMultiColumnList.OnColumnSized
struct UGUIMultiColumnList_OnColumnSized_Params
{
	int                                                Column;                                                   // (Parm)
};

// Function XInterface.GUIBorder.GetCaption
struct UGUIBorder_GetCaption_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIBorder.SetCaption
struct UGUIBorder_SetCaption_Params
{
	string                                             NewCaption;                                               // (Parm, NeedCtorLink)
};

// Function XInterface.GUITabControl.LevelChanged
struct UGUITabControl_LevelChanged_Params
{
};

// Function XInterface.GUITabControl.free
struct UGUITabControl_free_Params
{
};

// Function XInterface.GUITabControl.CenterMouse
struct UGUITabControl_CenterMouse_Params
{
};

// Function XInterface.GUITabControl.FocusLast
struct UGUITabControl_FocusLast_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabControl.FocusFirst
struct UGUITabControl_FocusFirst_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabControl.InternalOnActivate
struct UGUITabControl_InternalOnActivate_Params
{
};

// Function XInterface.GUITabControl.SetVisibility
struct UGUITabControl_SetVisibility_Params
{
	bool                                               bIsVisible;                                               // (Parm)
};

// Function XInterface.GUITabControl.BorrowPanel
struct UGUITabControl_BorrowPanel_Params
{
	string                                             Caption;                                                  // (Parm, NeedCtorLink)
	class UGUITabPanel*                                ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUITabControl.FindPanelClass
struct UGUITabControl_FindPanelClass_Params
{
	class UClass*                                      PanelClass;                                               // (Parm)
	class UGUITabPanel*                                ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUITabControl.TabIndex
struct UGUITabControl_TabIndex_Params
{
	string                                             tabname;                                                  // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabControl.PrevControl
struct UGUITabControl_PrevControl_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabControl.NextControl
struct UGUITabControl_NextControl_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabControl.PrevPage
struct UGUITabControl_PrevPage_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabControl.NextPage
struct UGUITabControl_NextPage_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabControl.InternalTabClick
struct UGUITabControl_InternalTabClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabControl.ActivateTabByPanel
struct UGUITabControl_ActivateTabByPanel_Params
{
	class UGUITabPanel*                                Panel;                                                    // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bFocusPanel;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabControl.ActivateTabByName
struct UGUITabControl_ActivateTabByName_Params
{
	string                                             tabname;                                                  // (Parm, NeedCtorLink)
	bool                                               bFocusPanel;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabControl.ActivateTab
struct UGUITabControl_ActivateTab_Params
{
	class UGUITabButton*                               Who;                                                      // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bFocusPanel;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabControl.MakeTabActive
struct UGUITabControl_MakeTabActive_Params
{
	class UGUITabButton*                               Who;                                                      // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUITabControl.LostActiveTab
struct UGUITabControl_LostActiveTab_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabControl.RemoveTab
struct UGUITabControl_RemoveTab_Params
{
	string                                             Caption;                                                  // (OptionalParm, Parm, NeedCtorLink)
	class UGUITabButton*                               Who;                                                      // (ExportObject, OptionalParm, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUITabControl.ReplaceTab
struct UGUITabControl_ReplaceTab_Params
{
	class UGUITabButton*                               Which;                                                    // (ExportObject, Parm, NeedCtorLink, EditInline)
	string                                             Caption;                                                  // (Parm, NeedCtorLink)
	string                                             PanelClass;                                               // (Parm, NeedCtorLink)
	class UGUITabPanel*                                ExistingPanel;                                            // (ExportObject, OptionalParm, Parm, NeedCtorLink, EditInline)
	string                                             InHint;                                                   // (OptionalParm, Parm, NeedCtorLink)
	bool                                               bForceActive;                                             // (OptionalParm, Parm)
	class UGUITabPanel*                                ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUITabControl.InsertTab
struct UGUITabControl_InsertTab_Params
{
	int                                                pos;                                                      // (Parm)
	string                                             Caption;                                                  // (Parm, NeedCtorLink)
	string                                             PanelClass;                                               // (Parm, NeedCtorLink)
	class UGUITabPanel*                                ExistingPanel;                                            // (ExportObject, OptionalParm, Parm, NeedCtorLink, EditInline)
	string                                             InHint;                                                   // (OptionalParm, Parm, NeedCtorLink)
	bool                                               bForceActive;                                             // (OptionalParm, Parm)
	class UGUITabPanel*                                ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUITabControl.AddTab
struct UGUITabControl_AddTab_Params
{
	string                                             InCaption;                                                // (Parm, NeedCtorLink)
	string                                             PanelClass;                                               // (Parm, NeedCtorLink)
	class UGUITabPanel*                                ExistingPanel;                                            // (ExportObject, OptionalParm, Parm, NeedCtorLink, EditInline)
	string                                             InHint;                                                   // (OptionalParm, Parm, NeedCtorLink)
	bool                                               bForceActive;                                             // (OptionalParm, Parm)
	class UGUITabPanel*                                ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUITabControl.AddTabItem
struct UGUITabControl_AddTabItem_Params
{
	struct FGUITabItem                                 Item;                                                     // (Parm, NeedCtorLink)
	class UGUITabPanel*                                ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUITabControl.InternalOnKeyEvent
struct UGUITabControl_InternalOnKeyEvent_Params
{
	byte                                               key;                                                      // (Parm, OutParm)
	byte                                               State;                                                    // (Parm, OutParm)
	float                                              Delta;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabControl.Closed
struct UGUITabControl_Closed_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bCancelled;                                               // (Parm)
};

// Function XInterface.GUITabControl.Opened
struct UGUITabControl_Opened_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUITabControl.InitComponent
struct UGUITabControl_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIButton.InternalOnKeyEvent
struct UGUIButton_InternalOnKeyEvent_Params
{
	byte                                               key;                                                      // (Parm, OutParm)
	byte                                               State;                                                    // (Parm, OutParm)
	float                                              Delta;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIButton.InitComponent
struct UGUIButton_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUITabButton.CanShowPanel
struct UGUITabButton_CanShowPanel_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabButton.ChangeActiveState
struct UGUITabButton_ChangeActiveState_Params
{
	bool                                               IsActive;                                                 // (Parm)
	bool                                               bFocusPanel;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabButton.SetFocus
struct UGUITabButton_SetFocus_Params
{
	class UGUIComponent*                               Who;                                                      // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIPanel.InitComponent
struct UGUIPanel_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIPanel.OnPostDraw
struct UGUIPanel_OnPostDraw_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabPanel.CheckIn
struct UGUITabPanel_CheckIn_Params
{
	struct FFloatBox                                   fb;                                                       // (Parm)
	int                                                X;                                                        // (Parm)
	int                                                Y;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabPanel.GetTooltipPos
struct UGUITabPanel_GetTooltipPos_Params
{
	int                                                tooltipWidth;                                             // (Parm)
	int                                                tooltipHeight;                                            // (Parm)
	int                                                nOffsetX;                                                 // (OptionalParm, Parm)
	int                                                nOffsetY;                                                 // (OptionalParm, Parm)
	struct FFloatBox                                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabPanel.CanShowPanel
struct UGUITabPanel_CanShowPanel_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUITabPanel.ShowPanel
struct UGUITabPanel_ShowPanel_Params
{
	bool                                               bShow;                                                    // (Parm)
};

// Function XInterface.GUITabPanel.free
struct UGUITabPanel_free_Params
{
};

// Function XInterface.GUITabPanel.OnDestroyPanel
struct UGUITabPanel_OnDestroyPanel_Params
{
	bool                                               bCancelled;                                               // (OptionalParm, Parm)
};

// Function XInterface.GUITabPanel.InitPanel
struct UGUITabPanel_InitPanel_Params
{
};

// Function XInterface.GUITabPanel.Refresh
struct UGUITabPanel_Refresh_Params
{
};

// Function XInterface.GUIGFXButton.InternalOnClick
struct UGUIGFXButton_InternalOnClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIGFXButton.SetChecked
struct UGUIGFXButton_SetChecked_Params
{
	bool                                               bNewChecked;                                              // (Parm)
};

// Function XInterface.GUIGFXButton.InitComponent
struct UGUIGFXButton_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIEditBox.IMEInputCancel
struct UGUIEditBox_IMEInputCancel_Params
{
};

// Function XInterface.GUIEditBox.InternalDeactivate
struct UGUIEditBox_InternalDeactivate_Params
{
};

// Function XInterface.GUIEditBox.InternalActivate
struct UGUIEditBox_InternalActivate_Params
{
};

// Function XInterface.GUIEditBox.TextChanged
struct UGUIEditBox_TextChanged_Params
{
};

// Function XInterface.GUIEditBox.GetText
struct UGUIEditBox_GetText_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIEditBox.ConvertIllegal
struct UGUIEditBox_ConvertIllegal_Params
{
	string                                             inputstr;                                                 // (Parm, NeedCtorLink)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIEditBox.InternalOnKeyEvent
struct UGUIEditBox_InternalOnKeyEvent_Params
{
	byte                                               key;                                                      // (Parm, OutParm)
	byte                                               State;                                                    // (Parm, OutParm)
	float                                              Delta;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIEditBox.InternalOnKeyType
struct UGUIEditBox_InternalOnKeyType_Params
{
	byte                                               key;                                                      // (Parm, OutParm)
	string                                             Unicode;                                                  // (OptionalParm, Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIEditBox.DeleteChar
struct UGUIEditBox_DeleteChar_Params
{
};

// Function XInterface.GUIEditBox.SetText
struct UGUIEditBox_SetText_Params
{
	string                                             NewText;                                                  // (Parm, NeedCtorLink)
};

// Function XInterface.GUIEditBox.InitComponent
struct UGUIEditBox_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIEditBox.OnIME_Notify
struct UGUIEditBox_OnIME_Notify_Params
{
	int                                                Type;                                                     // (Parm)
	int                                                LangID;                                                   // (Parm)
	string                                             strText;                                                  // (Parm, NeedCtorLink)
	int                                                nStartPos;                                                // (Parm)
	int                                                nSize;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIScrollBarBase.SetFriendlyLabel
struct UGUIScrollBarBase_SetFriendlyLabel_Params
{
	class UGUILabel*                                   NewLabel;                                                 // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIScrollBarBase.GripPreDraw
struct UGUIScrollBarBase_GripPreDraw_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIScrollBarBase.Refocus
struct UGUIScrollBarBase_Refocus_Params
{
	class UGUIComponent*                               Who;                                                      // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIScrollBarBase.AlignThumb
struct UGUIScrollBarBase_AlignThumb_Params
{
};

// Function XInterface.GUIScrollBarBase.WheelDown
struct UGUIScrollBarBase_WheelDown_Params
{
};

// Function XInterface.GUIScrollBarBase.WheelUp
struct UGUIScrollBarBase_WheelUp_Params
{
};

// Function XInterface.GUIScrollBarBase.IncreaseClick
struct UGUIScrollBarBase_IncreaseClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIScrollBarBase.DecreaseClick
struct UGUIScrollBarBase_DecreaseClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIScrollBarBase.MoveGripBy
struct UGUIScrollBarBase_MoveGripBy_Params
{
	int                                                items;                                                    // (Parm)
};

// Function XInterface.GUIScrollBarBase.UpdateGripPosition
struct UGUIScrollBarBase_UpdateGripPosition_Params
{
	float                                              NewPos;                                                   // (Parm)
};

// Function XInterface.GUIScrollBarBase.SetList
struct UGUIScrollBarBase_SetList_Params
{
	class UGUIListBase*                                List;                                                     // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIScrollBarBase.InitComponent
struct UGUIScrollBarBase_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIScrollBarBase.PositionChanged
struct UGUIScrollBarBase_PositionChanged_Params
{
	int                                                NewPos;                                                   // (Parm)
};

// Function XInterface.GUIScrollZoneBase.InternalOnClick
struct UGUIScrollZoneBase_InternalOnClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIScrollZoneBase.OnScrollZoneClick
struct UGUIScrollZoneBase_OnScrollZoneClick_Params
{
	float                                              Delta;                                                    // (Parm)
};

// Function XInterface.GUIComboBox.FocusLast
struct UGUIComboBox_FocusLast_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComboBox.FocusFirst
struct UGUIComboBox_FocusFirst_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComboBox.LoseFocus
struct UGUIComboBox_LoseFocus_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComboBox.SetFriendlyLabel
struct UGUIComboBox_SetFriendlyLabel_Params
{
	class UGUILabel*                                   NewLabel;                                                 // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComboBox.CenterMouse
struct UGUIComboBox_CenterMouse_Params
{
};

// Function XInterface.GUIComboBox.Clear
struct UGUIComboBox_Clear_Params
{
};

// Function XInterface.GUIComboBox.InternalOnMousePressed
struct UGUIComboBox_InternalOnMousePressed_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bRepeat;                                                  // (Parm)
};

// Function XInterface.GUIComboBox.ReadOnly
struct UGUIComboBox_ReadOnly_Params
{
	bool                                               B;                                                        // (Parm)
};

// Function XInterface.GUIComboBox.ItemCount
struct UGUIComboBox_ItemCount_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComboBox.FindIndex
struct UGUIComboBox_FindIndex_Params
{
	string                                             test;                                                     // (Parm, NeedCtorLink)
	bool                                               bExact;                                                   // (OptionalParm, Parm)
	bool                                               bExtra;                                                   // (OptionalParm, Parm)
	class UObject*                                     obj;                                                      // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComboBox.FindExtra
struct UGUIComboBox_FindExtra_Params
{
	string                                             Text;                                                     // (Parm, NeedCtorLink)
	bool                                               bExact;                                                   // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComboBox.Find
struct UGUIComboBox_Find_Params
{
	string                                             Text;                                                     // (Parm, NeedCtorLink)
	bool                                               bExact;                                                   // (OptionalParm, Parm)
	bool                                               bExtra;                                                   // (OptionalParm, Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIComboBox.GetItemObject
struct UGUIComboBox_GetItemObject_Params
{
	int                                                Index;                                                    // (Parm)
	class UObject*                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComboBox.GetItem
struct UGUIComboBox_GetItem_Params
{
	int                                                Index;                                                    // (Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIComboBox.RemoveItem
struct UGUIComboBox_RemoveItem_Params
{
	int                                                Item;                                                     // (Parm)
	int                                                Count;                                                    // (OptionalParm, Parm)
};

// Function XInterface.GUIComboBox.AddItem
struct UGUIComboBox_AddItem_Params
{
	string                                             Item;                                                     // (Parm, NeedCtorLink)
	class UObject*                                     Extra;                                                    // (OptionalParm, Parm)
	string                                             str;                                                      // (OptionalParm, Parm, NeedCtorLink)
};

// Function XInterface.GUIComboBox.GetIndex
struct UGUIComboBox_GetIndex_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComboBox.SetIndex
struct UGUIComboBox_SetIndex_Params
{
	int                                                i;                                                        // (Parm)
};

// Function XInterface.GUIComboBox.GetExtra
struct UGUIComboBox_GetExtra_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIComboBox.GetObject
struct UGUIComboBox_GetObject_Params
{
	class UObject*                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComboBox.GetText
struct UGUIComboBox_GetText_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIComboBox.Get
struct UGUIComboBox_Get_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIComboBox.SetExtra
struct UGUIComboBox_SetExtra_Params
{
	string                                             NewExtra;                                                 // (Parm, NeedCtorLink)
	bool                                               bListItemsOnly;                                           // (OptionalParm, Parm)
};

// Function XInterface.GUIComboBox.SetText
struct UGUIComboBox_SetText_Params
{
	string                                             NewText;                                                  // (Parm, NeedCtorLink)
	bool                                               bListItemsOnly;                                           // (OptionalParm, Parm)
};

// Function XInterface.GUIComboBox.TextChanged
struct UGUIComboBox_TextChanged_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComboBox.ItemChanged
struct UGUIComboBox_ItemChanged_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComboBox.ShowListBox
struct UGUIComboBox_ShowListBox_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComboBox.SetVisibility
struct UGUIComboBox_SetVisibility_Params
{
	bool                                               bIsVisible;                                               // (Parm)
};

// Function XInterface.GUIComboBox.HideListBox
struct UGUIComboBox_HideListBox_Params
{
};

// Function XInterface.GUIComboBox.InternalOnLoadINI
struct UGUIComboBox_InternalOnLoadINI_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	string                                             S;                                                        // (Parm, NeedCtorLink)
};

// Function XInterface.GUIComboBox.InternalOnSaveINI
struct UGUIComboBox_InternalOnSaveINI_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIComboBox.InternalListClick
struct UGUIComboBox_InternalListClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComboBox.InternalEditPressed
struct UGUIComboBox_InternalEditPressed_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bRepeat;                                                  // (Parm)
};

// Function XInterface.GUIComboBox.InternalOnInvalidate
struct UGUIComboBox_InternalOnInvalidate_Params
{
	class UGUIComponent*                               Who;                                                      // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComboBox.InternalListDeActivate
struct UGUIComboBox_InternalListDeActivate_Params
{
};

// Function XInterface.GUIComboBox.InternalOnKeyEvent
struct UGUIComboBox_InternalOnKeyEvent_Params
{
	byte                                               key;                                                      // (Parm, OutParm)
	byte                                               State;                                                    // (Parm, OutParm)
	float                                              Delta;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIComboBox.SetHint
struct UGUIComboBox_SetHint_Params
{
	string                                             NewHint;                                                  // (Parm, NeedCtorLink)
};

// Function XInterface.GUIComboBox.InitComponent
struct UGUIComboBox_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIComboBox.OnHideList
struct UGUIComboBox_OnHideList_Params
{
};

// Function XInterface.GUIComboBox.OnShowList
struct UGUIComboBox_OnShowList_Params
{
};

// Function XInterface.GUIMenuOption.SetFriendlyLabel
struct UGUIMenuOption_SetFriendlyLabel_Params
{
	class UGUILabel*                                   NewLabel;                                                 // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIMenuOption.CenterMouse
struct UGUIMenuOption_CenterMouse_Params
{
};

// Function XInterface.GUIMenuOption.InternalOnCreateComponent
struct UGUIMenuOption_InternalOnCreateComponent_Params
{
	class UGUIComponent*                               NewComp;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIMenuOption.InternalOnChange
struct UGUIMenuOption_InternalOnChange_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIMenuOption.MenuOptionClicked
struct UGUIMenuOption_MenuOptionClicked_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIMenuOption.SetCaption
struct UGUIMenuOption_SetCaption_Params
{
	string                                             NewCaption;                                               // (Parm, NeedCtorLink)
};

// Function XInterface.GUIMenuOption.SetHint
struct UGUIMenuOption_SetHint_Params
{
	string                                             NewHint;                                                  // (Parm, NeedCtorLink)
};

// Function XInterface.GUIMenuOption.SetReadOnly
struct UGUIMenuOption_SetReadOnly_Params
{
	bool                                               bValue;                                                   // (Parm)
};

// Function XInterface.GUIMenuOption.ResetComponent
struct UGUIMenuOption_ResetComponent_Params
{
};

// Function XInterface.GUIMenuOption.GetComponentValue
struct UGUIMenuOption_GetComponentValue_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIMenuOption.SetComponentValue
struct UGUIMenuOption_SetComponentValue_Params
{
	string                                             NewValue;                                                 // (Parm, CoerceParm, NeedCtorLink)
	bool                                               bNoChange;                                                // (OptionalParm, Parm)
};

// Function XInterface.GUIMenuOption.InitComponent
struct UGUIMenuOption_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIImage.AdditionalDebugString
struct UGUIImage_AdditionalDebugString_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUISectionBackground.SetPosition
struct UGUISectionBackground_SetPosition_Params
{
	float                                              NewLeft;                                                  // (Parm)
	float                                              NewTop;                                                   // (Parm)
	float                                              NewWidth;                                                 // (Parm)
	float                                              NewHeight;                                                // (Parm)
	bool                                               bRelative;                                                // (OptionalParm, Parm)
};

// Function XInterface.GUISectionBackground.ResolutionChanged
struct UGUISectionBackground_ResolutionChanged_Params
{
	int                                                ResX;                                                     // (Parm)
	int                                                ResY;                                                     // (Parm)
};

// Function XInterface.GUISectionBackground.InternalPreDraw
struct UGUISectionBackground_InternalPreDraw_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUISectionBackground.Reset
struct UGUISectionBackground_Reset_Params
{
};

// Function XInterface.GUISectionBackground.FindComponentIndex
struct UGUISectionBackground_FindComponentIndex_Params
{
	class UGUIComponent*                               Comp;                                                     // (ExportObject, Parm, NeedCtorLink, EditInline)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUISectionBackground.UnmanageComponent
struct UGUISectionBackground_UnmanageComponent_Params
{
	class UGUIComponent*                               Comp;                                                     // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUISectionBackground.ManageComponent
struct UGUISectionBackground_ManageComponent_Params
{
	class UGUIComponent*                               Component;                                                // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUISectionBackground.SetVisibility
struct UGUISectionBackground_SetVisibility_Params
{
	bool                                               bIsVisible;                                               // (Parm)
};

// Function XInterface.GUISectionBackground.InitComponent
struct UGUISectionBackground_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIContextMenu.ReplaceItem
struct UGUIContextMenu_ReplaceItem_Params
{
	int                                                Index;                                                    // (Parm)
	string                                             NewItem;                                                  // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIContextMenu.RemoveItemByIndex
struct UGUIContextMenu_RemoveItemByIndex_Params
{
	int                                                Index;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIContextMenu.RemoveItemByName
struct UGUIContextMenu_RemoveItemByName_Params
{
	string                                             ItemName;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIContextMenu.InsertItem
struct UGUIContextMenu_InsertItem_Params
{
	string                                             NewItem;                                                  // (Parm, NeedCtorLink)
	int                                                Index;                                                    // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIContextMenu.AddItem
struct UGUIContextMenu_AddItem_Params
{
	string                                             NewItem;                                                  // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIContextMenu.OnContextHitTest
struct UGUIContextMenu_OnContextHitTest_Params
{
	float                                              MouseX;                                                   // (Parm)
	float                                              MouseY;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIContextMenu.OnSelect
struct UGUIContextMenu_OnSelect_Params
{
	class UGUIContextMenu*                             Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	int                                                ClickIndex;                                               // (Parm)
};

// Function XInterface.GUIContextMenu.OnClose
struct UGUIContextMenu_OnClose_Params
{
	class UGUIContextMenu*                             Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIContextMenu.OnOpen
struct UGUIContextMenu_OnOpen_Params
{
	class UGUIContextMenu*                             Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIToolTip.SetTip
struct UGUIToolTip_SetTip_Params
{
	string                                             NewTip;                                                   // (Parm, CoerceParm, NeedCtorLink)
};

// Function XInterface.GUIToolTip.GetTopBelowCursor
struct UGUIToolTip_GetTopBelowCursor_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIToolTip.GetTopAboveCursor
struct UGUIToolTip_GetTopAboveCursor_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIToolTip.GetHeight
struct UGUIToolTip_GetHeight_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIToolTip.GetWidth
struct UGUIToolTip_GetWidth_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIToolTip.GetTop
struct UGUIToolTip_GetTop_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIToolTip.GetLeft
struct UGUIToolTip_GetLeft_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIToolTip.UpdatePosition
struct UGUIToolTip_UpdatePosition_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.GUIToolTip.HideToolTip
struct UGUIToolTip_HideToolTip_Params
{
};

// Function XInterface.GUIToolTip.ShowToolTip
struct UGUIToolTip_ShowToolTip_Params
{
};

// Function XInterface.GUIToolTip.Tick
struct UGUIToolTip_Tick_Params
{
	float                                              RealSeconds;                                              // (Parm)
};

// Function XInterface.GUIToolTip.InternalLeaveArea
struct UGUIToolTip_InternalLeaveArea_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIToolTip.LeaveArea
struct UGUIToolTip_LeaveArea_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIToolTip.InternalEnterArea
struct UGUIToolTip_InternalEnterArea_Params
{
	class UGUIToolTip*                                 ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIToolTip.EnterArea
struct UGUIToolTip_EnterArea_Params
{
	class UGUIToolTip*                                 ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIController.ShowQuestionDialog
struct UGUIController_ShowQuestionDialog_Params
{
	string                                             Question;                                                 // (Parm, NeedCtorLink)
	byte                                               Buttons;                                                  // (OptionalParm, Parm)
	byte                                               defButton;                                                // (OptionalParm, Parm)
	class UGUIQuestionPage*                            ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIController.KeyPressed
struct UGUIController_KeyPressed_Params
{
	EInputKey                                          iKey;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.SearchBinds
struct UGUIController_SearchBinds_Params
{
	string                                             BindAliasMask;                                            // (Parm, NeedCtorLink)
	string[]                                           BindAliases;                                              // (Parm, OutParm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.GetAssignedKeys
struct UGUIController_GetAssignedKeys_Params
{
	string                                             BindAlias;                                                // (Parm, NeedCtorLink)
	string[]                                           BindKeyNames;                                             // (Parm, OutParm, NeedCtorLink)
	string[]                                           LocalizedBindKeyNames;                                    // (Parm, OutParm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.GetCurrentBind
struct UGUIController_GetCurrentBind_Params
{
	string                                             BindKeyName;                                              // (Parm, NeedCtorLink)
	string                                             BindKeyValue;                                             // (Parm, OutParm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.KeyNameFromIndex
struct UGUIController_KeyNameFromIndex_Params
{
	byte                                               iKey;                                                     // (Parm)
	string                                             KeyName;                                                  // (Parm, OutParm, NeedCtorLink)
	string                                             LocalizedKeyName;                                         // (Parm, OutParm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.SetKeyBind
struct UGUIController_SetKeyBind_Params
{
	string                                             BindKeyName;                                              // (Parm, NeedCtorLink)
	string                                             BindKeyValue;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.GetQuitPage
struct UGUIController_GetQuitPage_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIController.GetSettingsPage
struct UGUIController_GetSettingsPage_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIController.GetModPage
struct UGUIController_GetModPage_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIController.GetInstantActionPage
struct UGUIController_GetInstantActionPage_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIController.GetMultiplayerPage
struct UGUIController_GetMultiplayerPage_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIController.GetServerBrowserPage
struct UGUIController_GetServerBrowserPage_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIController.GetSinglePlayerPage
struct UGUIController_GetSinglePlayerPage_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIController.GetMainMenuClass
struct UGUIController_GetMainMenuClass_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIController.Validate
struct UGUIController_Validate_Params
{
};

// Function XInterface.GUIController.ConsolidateMenus
struct UGUIController_ConsolidateMenus_Params
{
};

// Function XInterface.GUIController.PurgeComponentClasses
struct UGUIController_PurgeComponentClasses_Params
{
};

// Function XInterface.GUIController.PurgeObjectReferences
struct UGUIController_PurgeObjectReferences_Params
{
};

// Function XInterface.GUIController.VerifyStack
struct UGUIController_VerifyStack_Params
{
};

// Function XInterface.GUIController.CloseOverlays
struct UGUIController_CloseOverlays_Params
{
};

// Function XInterface.GUIController.NotifyLevelChange
struct UGUIController_NotifyLevelChange_Params
{
};

// Function XInterface.GUIController.SetRequiredGameResolution
struct UGUIController_SetRequiredGameResolution_Params
{
	string                                             GameRes;                                                  // (Parm, NeedCtorLink)
};

// Function XInterface.GUIController.NeedsMenuResolution
struct UGUIController_NeedsMenuResolution_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.CanShowHints
struct UGUIController_CanShowHints_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.HasMouseMoved
struct UGUIController_HasMouseMoved_Params
{
	float                                              ErrorMargin;                                              // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.MoveFocused
struct UGUIController_MoveFocused_Params
{
	class UGUIComponent*                               C;                                                        // (ExportObject, Parm, NeedCtorLink, EditInline)
	int                                                bmLeft;                                                   // (Parm)
	int                                                bmTop;                                                    // (Parm)
	int                                                bmWidth;                                                  // (Parm)
	int                                                bmHeight;                                                 // (Parm)
	float                                              ClipX;                                                    // (Parm)
	float                                              ClipY;                                                    // (Parm)
	float                                              val;                                                      // (Parm)
};

// Function XInterface.GUIController.ResetFocus
struct UGUIController_ResetFocus_Params
{
};

// Function XInterface.GUIController.ChangeFocus
struct UGUIController_ChangeFocus_Params
{
	class UGUIComponent*                               Who;                                                      // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIController.SetControllerStatus
struct UGUIController_SetControllerStatus_Params
{
	bool                                               On;                                                       // (Parm)
};

// Function XInterface.GUIController.PerformRestore
struct UGUIController_PerformRestore_Params
{
};

// Function XInterface.GUIController.SaveRestorePages
struct UGUIController_SaveRestorePages_Params
{
};

// Function XInterface.GUIController.Count
struct UGUIController_Count_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.CloseAll
struct UGUIController_CloseAll_Params
{
	bool                                               bCancel;                                                  // (Parm)
	bool                                               bForced;                                                  // (OptionalParm, Parm)
};

// Function XInterface.GUIController.ClickCloseWndBtn
struct UGUIController_ClickCloseWndBtn_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.PressedCloseWndBtn
struct UGUIController_PressedCloseWndBtn_Params
{
};

// Function XInterface.GUIController.CloseMenu
struct UGUIController_CloseMenu_Params
{
	bool                                               bCancelled;                                               // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.RemoveMenu
struct UGUIController_RemoveMenu_Params
{
	class UGUIPage*                                    Menu;                                                     // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bCancelled;                                               // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.RemoveMenuAt
struct UGUIController_RemoveMenuAt_Params
{
	int                                                Index;                                                    // (Parm)
	bool                                               bCancelled;                                               // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.PopMenu
struct UGUIController_PopMenu_Params
{
	int                                                Index;                                                    // (Parm)
	class UGUIPage*                                    CurMenu;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bCancelled;                                               // (OptionalParm, Parm)
};

// Function XInterface.GUIController.PushMenu
struct UGUIController_PushMenu_Params
{
	int                                                Index;                                                    // (Parm)
	class UGUIPage*                                    NewMenu;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
	string                                             Param1;                                                   // (OptionalParm, Parm, NeedCtorLink)
	string                                             Param2;                                                   // (OptionalParm, Parm, NeedCtorLink)
};

// Function XInterface.GUIController.ReplaceMenu2
struct UGUIController_ReplaceMenu2_Params
{
	string                                             NewMenuName;                                              // (Parm, NeedCtorLink)
	bool                                               bCancelled;                                               // (OptionalParm, Parm)
};

// Function XInterface.GUIController.ReplaceMenu2_FadedOut
struct UGUIController_ReplaceMenu2_FadedOut_Params
{
};

// Function XInterface.GUIController.CloseMenuPage
struct UGUIController_CloseMenuPage_Params
{
	class UGUIPage*                                    SelectPage;                                               // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bCancelled;                                               // (OptionalParm, Parm)
};

// Function XInterface.GUIController.ReplaceMenu
struct UGUIController_ReplaceMenu_Params
{
	string                                             NewMenuName;                                              // (Parm, NeedCtorLink)
	string                                             Param1;                                                   // (OptionalParm, Parm, NeedCtorLink)
	string                                             Param2;                                                   // (OptionalParm, Parm, NeedCtorLink)
	bool                                               bCancelled;                                               // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.AutoLoadMenus
struct UGUIController_AutoLoadMenus_Params
{
};

// Function XInterface.GUIController.OpenMenuByObject
struct UGUIController_OpenMenuByObject_Params
{
	class UGUIPage*                                    NewMenu;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
	string                                             Param1;                                                   // (OptionalParm, Parm, NeedCtorLink)
	string                                             Param2;                                                   // (OptionalParm, Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.OpenMenu
struct UGUIController_OpenMenu_Params
{
	string                                             NewMenuName;                                              // (Parm, NeedCtorLink)
	string                                             Param1;                                                   // (OptionalParm, Parm, NeedCtorLink)
	string                                             Param2;                                                   // (OptionalParm, Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.CreateMenu
struct UGUIController_CreateMenu_Params
{
	string                                             NewMenuName;                                              // (Parm, NeedCtorLink)
	class UGUIPage*                                    ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIController.GetLastMenu
struct UGUIController_GetLastMenu_Params
{
	class UGUIPage*                                    ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIController.LogControlInfo
struct UGUIController_LogControlInfo_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIController.LogControllerInfo
struct UGUIController_LogControllerInfo_Params
{
};

// Function XInterface.GUIController.LogMenuStack
struct UGUIController_LogMenuStack_Params
{
};

// Function XInterface.GUIController.GetMenuByIndex
struct UGUIController_GetMenuByIndex_Params
{
	int                                                Index;                                                    // (Parm)
	class UGUIPage*                                    ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIController.FindMenuByClass
struct UGUIController_FindMenuByClass_Params
{
	class UClass*                                      PageClass;                                                // (Parm)
	class UGUIPage*                                    ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIController.FindPersistentMenuByClass
struct UGUIController_FindPersistentMenuByClass_Params
{
	class UClass*                                      PageClass;                                                // (Parm)
	class UGUIPage*                                    ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIController.FindPersistentMenuIndex
struct UGUIController_FindPersistentMenuIndex_Params
{
	class UGUIPage*                                    Menu;                                                     // (ExportObject, Parm, NeedCtorLink, EditInline)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.FindMenuIndex
struct UGUIController_FindMenuIndex_Params
{
	class UGUIPage*                                    Menu;                                                     // (ExportObject, Parm, NeedCtorLink, EditInline)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.FindMenuIndexByName
struct UGUIController_FindMenuIndexByName_Params
{
	string                                             MenuClass;                                                // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.FindPersistentMenuByName
struct UGUIController_FindPersistentMenuByName_Params
{
	string                                             MenuClass;                                                // (Parm, NeedCtorLink)
	class UGUIPage*                                    ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIController.AddComponentClass
struct UGUIController_AddComponentClass_Params
{
	string                                             ClassName;                                                // (Parm, NeedCtorLink)
	class UClass*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.RegisterStyle
struct UGUIController_RegisterStyle_Params
{
	class UClass*                                      StyleClass;                                               // (Parm)
	bool                                               bTemporary;                                               // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.PrecachePlayerRecords
struct UGUIController_PrecachePlayerRecords_Params
{
};

// Function XInterface.GUIController.InitializeController
struct UGUIController_InitializeController_Params
{
};

// Function XInterface.GUIController.TopPage
struct UGUIController_TopPage_Params
{
	class UGUIPage*                                    ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIController.GetTeamSymbolList
struct UGUIController_GetTeamSymbolList_Params
{
	string[]                                           SymbolNames;                                              // (Parm, OutParm, NeedCtorLink)
	bool                                               bNoSinglePlayer;                                          // (OptionalParm, Parm)
};

// Function XInterface.GUIController.LoadDecoText
struct UGUIController_LoadDecoText_Params
{
	string                                             PackageName;                                              // (Parm, NeedCtorLink)
	string                                             DecoTextName;                                             // (Parm, NeedCtorLink)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIController.CheckForECE
struct UGUIController_CheckForECE_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.AuthroizeFirewall
struct UGUIController_AuthroizeFirewall_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.CheckFirewall
struct UGUIController_CheckFirewall_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.LaunchURL
struct UGUIController_LaunchURL_Params
{
	string                                             URL;                                                      // (Parm, NeedCtorLink)
};

// Function XInterface.GUIController.GetMapList
struct UGUIController_GetMapList_Params
{
	string                                             Prefix;                                                   // (Parm, NeedCtorLink)
	class UGUIList*                                    List;                                                     // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               bDecoText;                                                // (OptionalParm, Parm)
};

// Function XInterface.GUIController.GetWeaponList
struct UGUIController_GetWeaponList_Params
{
	class UClass*[]                                    WeaponClass;                                              // (Parm, OutParm, NeedCtorLink)
	string[]                                           WeaponDesc;                                               // (Parm, OutParm, NeedCtorLink)
};

// Function XInterface.GUIController.SaveOwnageList
struct UGUIController_SaveOwnageList_Params
{
	struct FeOwnageMap[]                               Maps;                                                     // (Parm, NeedCtorLink)
};

// Function XInterface.GUIController.GetOwnageList
struct UGUIController_GetOwnageList_Params
{
	int[]                                              RLevel;                                                   // (Parm, OutParm, NeedCtorLink)
	string[]                                           MNames;                                                   // (Parm, OutParm, NeedCtorLink)
	string[]                                           MDesc;                                                    // (Parm, OutParm, NeedCtorLink)
	string[]                                           mURL;                                                     // (Parm, OutParm, NeedCtorLink)
};

// Function XInterface.GUIController.GetDEMHeader
struct UGUIController_GetDEMHeader_Params
{
	string                                             DemoName;                                                 // (Parm, NeedCtorLink)
	string                                             MapName;                                                  // (Parm, OutParm, NeedCtorLink)
	string                                             GameType;                                                 // (Parm, OutParm, NeedCtorLink)
	int                                                ScoreLimit;                                               // (Parm, OutParm)
	int                                                TimeLimit;                                                // (Parm, OutParm)
	int                                                ClientSide;                                               // (Parm, OutParm)
	string                                             RecordedBy;                                               // (Parm, OutParm, NeedCtorLink)
	string                                             TimeStamp;                                                // (Parm, OutParm, NeedCtorLink)
	string                                             ReqPackages;                                              // (Parm, OutParm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.GetDEMList
struct UGUIController_GetDEMList_Params
{
	string[]                                           DEMFiles;                                                 // (Parm, OutParm, NeedCtorLink)
};

// Function XInterface.GUIController.Profile
struct UGUIController_Profile_Params
{
	string                                             ProfileName;                                              // (Parm, NeedCtorLink)
};

// Function XInterface.GUIController.SetMoveControl
struct UGUIController_SetMoveControl_Params
{
	class UGUIComponent*                               C;                                                        // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIController.PlayInterfaceSound
struct UGUIController_PlayInterfaceSound_Params
{
	EClickSound                                        soundType;                                                // (Parm)
};

// Function XInterface.GUIController.GetOGGList
struct UGUIController_GetOGGList_Params
{
	string[]                                           OGGFiles;                                                 // (Parm, OutParm, NeedCtorLink)
};

// Function XInterface.GUIController.ResetKeyboard
struct UGUIController_ResetKeyboard_Params
{
};

// Function XInterface.GUIController.GetProfileList
struct UGUIController_GetProfileList_Params
{
	string                                             Prefix;                                                   // (Parm, NeedCtorLink)
	string[]                                           ProfileList;                                              // (Parm, OutParm, NeedCtorLink)
};

// Function XInterface.GUIController.ResetInput
struct UGUIController_ResetInput_Params
{
};

// Function XInterface.GUIController.ResetDesigner
struct UGUIController_ResetDesigner_Params
{
};

// Function XInterface.GUIController.SetRenderDevice
struct UGUIController_SetRenderDevice_Params
{
	string                                             NewRenderDevice;                                          // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.GetCurrentRes
struct UGUIController_GetCurrentRes_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.GUIController.GetStyle
struct UGUIController_GetStyle_Params
{
	string                                             StyleName;                                                // (Parm, NeedCtorLink)
	EeFontScale                                        FontScale;                                                // (Parm, OutParm)
	class UGUIStyles*                                  ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIController.GetMenuFont
struct UGUIController_GetMenuFont_Params
{
	string                                             FontName;                                                 // (Parm, NeedCtorLink)
	class UGUIFont*                                    ReturnValue;                                              // (ExportObject, Parm, OutParm, ReturnParm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIController.AddBuddy
struct UGUIController_AddBuddy_Params
{
	string                                             NewBuddyName;                                             // (OptionalParm, Parm, NeedCtorLink)
};

// Function XInterface.GUIController.OnNeedRawKeyPress
struct UGUIController_OnNeedRawKeyPress_Params
{
	byte                                               NewKey;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIController.PopPage
struct UGUIController_PopPage_Params
{
};

// Function XInterface.GUIController.PushPage
struct UGUIController_PushPage_Params
{
};

// Function XInterface.GUIFont.LoadFont
struct UGUIFont_LoadFont_Params
{
	int                                                i;                                                        // (Parm)
	class UFont*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIFont.LoadFontStatic
struct UGUIFont_LoadFontStatic_Params
{
	int                                                i;                                                        // (Parm)
	class UFont*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIFont.GetFont
struct UGUIFont_GetFont_Params
{
	int                                                XRes;                                                     // (Parm)
	class UFont*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIStyles.Initialize
struct UGUIStyles_Initialize_Params
{
};

// Function XInterface.GUIStyles.btrDrawTextStyles
struct UGUIStyles_btrDrawTextStyles_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	EeMenuState                                        MenuState;                                                // (Parm)
	float                                              Left;                                                     // (Parm)
	float                                              Top;                                                      // (Parm)
	float                                              width;                                                    // (Parm)
	float                                              Height;                                                   // (Parm)
	EeTextAlign                                        Align;                                                    // (Parm)
	string                                             Text;                                                     // (Parm, NeedCtorLink)
	EeFontScale                                        FontScale;                                                // (Parm)
	int                                                FontSize;                                                 // (Parm)
	float                                              R;                                                        // (Parm)
	float                                              G;                                                        // (Parm)
	float                                              B;                                                        // (Parm)
	float                                              A;                                                        // (Parm)
};

// Function XInterface.GUIStyles.btrTextSizeStyles
struct UGUIStyles_btrTextSizeStyles_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	EeMenuState                                        MenuState;                                                // (Parm)
	string                                             Text;                                                     // (Parm, NeedCtorLink)
	float                                              XL;                                                       // (Parm, OutParm)
	float                                              YL;                                                       // (Parm, OutParm)
	EeFontScale                                        FontScale;                                                // (Parm)
	int                                                FontSize;                                                 // (Parm)
};

// Function XInterface.GUIStyles.TextSize
struct UGUIStyles_TextSize_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	EeMenuState                                        MenuState;                                                // (Parm)
	string                                             Text;                                                     // (Parm, NeedCtorLink)
	float                                              XL;                                                       // (Parm, OutParm)
	float                                              YL;                                                       // (Parm, OutParm)
	EeFontScale                                        FontScale;                                                // (Parm)
};

// Function XInterface.GUIStyles.DrawText
struct UGUIStyles_DrawText_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	EeMenuState                                        MenuState;                                                // (Parm)
	float                                              Left;                                                     // (Parm)
	float                                              Top;                                                      // (Parm)
	float                                              width;                                                    // (Parm)
	float                                              Height;                                                   // (Parm)
	EeTextAlign                                        Align;                                                    // (Parm)
	string                                             Text;                                                     // (Parm, NeedCtorLink)
	EeFontScale                                        FontScale;                                                // (Parm)
};

// Function XInterface.GUIStyles.Draw
struct UGUIStyles_Draw_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	EeMenuState                                        MenuState;                                                // (Parm)
	float                                              Left;                                                     // (Parm)
	float                                              Top;                                                      // (Parm)
	float                                              width;                                                    // (Parm)
	float                                              Height;                                                   // (Parm)
};

// Function XInterface.GUIStyles.OnDrawText
struct UGUIStyles_OnDrawText_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	EeMenuState                                        MenuState;                                                // (Parm)
	float                                              Left;                                                     // (Parm)
	float                                              Top;                                                      // (Parm)
	float                                              width;                                                    // (Parm)
	float                                              Height;                                                   // (Parm)
	EeTextAlign                                        Align;                                                    // (Parm)
	string                                             Text;                                                     // (Parm, NeedCtorLink)
	EeFontScale                                        FontScale;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIStyles.OnDraw
struct UGUIStyles_OnDraw_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	EeMenuState                                        MenuState;                                                // (Parm)
	float                                              Left;                                                     // (Parm)
	float                                              Top;                                                      // (Parm)
	float                                              width;                                                    // (Parm)
	float                                              Height;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.UT2MidGameFont.GetFont
struct UUT2MidGameFont_GetFont_Params
{
	int                                                XRes;                                                     // (Parm)
	class UFont*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.UT2MidGameFont.GetMidGameFont
struct UUT2MidGameFont_GetMidGameFont_Params
{
	int                                                XRes;                                                     // (Parm)
	class UFont*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertScrollBar.ZoneClick
struct UGUIVertScrollBar_ZoneClick_Params
{
	float                                              Delta;                                                    // (Parm)
};

// Function XInterface.GUIVertScrollBar.GripPreDraw
struct UGUIVertScrollBar_GripPreDraw_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertScrollBar.GripPressed
struct UGUIVertScrollBar_GripPressed_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               IsRepeat;                                                 // (Parm)
};

// Function XInterface.GUIVertScrollZone.InternalOnClick
struct UGUIVertScrollZone_InternalOnClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertScrollButton.InitComponent
struct UGUIVertScrollButton_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIVertGripButton.InitComponent
struct UGUIVertGripButton_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               MyComponent;                                              // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.STY_ListSelection.Initialize
struct USTY_ListSelection_Initialize_Params
{
};

// Function XInterface.ExtendedConsole.DebugTabOrder
struct UExtendedConsole_DebugTabOrder_Params
{
};

// Function XInterface.ExtendedConsole.DumpLoadingHints
struct UExtendedConsole_DumpLoadingHints_Params
{
	string                                             Param;                                                    // (Parm, NeedCtorLink)
};

// Function XInterface.ExtendedConsole.DLO
struct UExtendedConsole_DLO_Params
{
	string                                             ClassName;                                                // (Parm, NeedCtorLink)
	string                                             ClassType;                                                // (Parm, NeedCtorLink)
};

// Function XInterface.ExtendedConsole.VoiceChatAllowed
struct UExtendedConsole_VoiceChatAllowed_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.ExtendedConsole.DumpCacheRecords
struct UExtendedConsole_DumpCacheRecords_Params
{
	string                                             CacheType;                                                // (OptionalParm, Parm, NeedCtorLink)
};

// Function XInterface.ExtendedConsole.AddMessage
struct UExtendedConsole_AddMessage_Params
{
	string                                             Mesg;                                                     // (Parm, NeedCtorLink)
};

// Function XInterface.ExtendedConsole.DumpRecords
struct UExtendedConsole_DumpRecords_Params
{
	string                                             Type;                                                     // (Parm, NeedCtorLink)
};

// Function XInterface.ExtendedConsole.DumpPlayInfo
struct UExtendedConsole_DumpPlayInfo_Params
{
	string                                             Group;                                                    // (Parm, NeedCtorLink)
};

// Function XInterface.ExtendedConsole.MusicMenu
struct UExtendedConsole_MusicMenu_Params
{
};

// Function XInterface.ExtendedConsole.PlayWaitingGame
struct UExtendedConsole_PlayWaitingGame_Params
{
};

// Function XInterface.ExtendedConsole.TeamChatOnly
struct UExtendedConsole_TeamChatOnly_Params
{
};

// Function XInterface.ExtendedConsole.ServerInfo
struct UExtendedConsole_ServerInfo_Params
{
};

// Function XInterface.ExtendedConsole.IngameChat
struct UExtendedConsole_IngameChat_Params
{
};

// Function XInterface.ExtendedConsole.SpeechMenuToggle
struct UExtendedConsole_SpeechMenuToggle_Params
{
};

// Function XInterface.ExtendedConsole.SaveFavorites
struct UExtendedConsole_SaveFavorites_Params
{
};

// Function XInterface.ExtendedConsole.GetFavorites
struct UExtendedConsole_GetFavorites_Params
{
	struct FServerFavorite[]                           List;                                                     // (Parm, OutParm, NeedCtorLink)
};

// Function XInterface.ExtendedConsole.RemoveFavorite
struct UExtendedConsole_RemoveFavorite_Params
{
	string                                             IP;                                                       // (Parm, NeedCtorLink)
	int                                                Port;                                                     // (Parm)
	int                                                QueryPort;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.ExtendedConsole.AddFavorite
struct UExtendedConsole_AddFavorite_Params
{
	struct FServerFavorite                             NewFav;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.ExtendedConsole.InFavorites
struct UExtendedConsole_InFavorites_Params
{
	struct FServerFavorite                             Fav;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.ExtendedConsole.AddCurrentToFavorites
struct UExtendedConsole_AddCurrentToFavorites_Params
{
};

// Function XInterface.ExtendedConsole.OnExecAddFavorite
struct UExtendedConsole_OnExecAddFavorite_Params
{
	struct FServerFavorite                             Fav;                                                      // (Parm, NeedCtorLink)
};

// Function XInterface.ExtendedConsole.ConsoleToggle
struct UExtendedConsole_ConsoleToggle_Params
{
};

// Function XInterface.ExtendedConsole.ConsoleClose
struct UExtendedConsole_ConsoleClose_Params
{
};

// Function XInterface.ExtendedConsole.ConsoleOpen
struct UExtendedConsole_ConsoleOpen_Params
{
};

// Function XInterface.ExtendedConsole.NativeConsoleOpen
struct UExtendedConsole_NativeConsoleOpen_Params
{
};

// Function XInterface.ExtendedConsole.PlayConsoleSound
struct UExtendedConsole_PlayConsoleSound_Params
{
	class USound*                                      S;                                                        // (Parm)
};

// Function XInterface.ExtendedConsole.KeyEvent
struct UExtendedConsole_KeyEvent_Params
{
	EInputKey                                          key;                                                      // (Parm)
	EInputAction                                       Action;                                                   // (Parm)
	float                                              Delta;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.ExtendedConsole.GetNewPlaybackSpeed
struct UExtendedConsole_GetNewPlaybackSpeed_Params
{
	int                                                Dir;                                                      // (Parm)
};

// Function XInterface.ExtendedConsole.Message
struct UExtendedConsole_Message_Params
{
	string                                             Msg;                                                      // (Parm, CoerceParm, NeedCtorLink)
	float                                              MsgLife;                                                  // (Parm)
};

// Function XInterface.ExtendedConsole.OnChatMessage
struct UExtendedConsole_OnChatMessage_Params
{
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
};

// Function XInterface.ExtendedConsole.Chat
struct UExtendedConsole_Chat_Params
{
	string                                             Msg;                                                      // (Parm, CoerceParm, NeedCtorLink)
	float                                              MsgLife;                                                  // (Parm)
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
};

// Function XInterface.ExtendedConsole.PostRender
struct UExtendedConsole_PostRender_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
};

// Function XInterface.ExtendedConsole.cls
struct UExtendedConsole_cls_Params
{
};

// Function XInterface.ExtendedConsole.NotifyLevelChange
struct UExtendedConsole_NotifyLevelChange_Params
{
};

// Function XInterface.ExtendedConsole.ConnectFailure
struct UExtendedConsole_ConnectFailure_Params
{
	string                                             FailCode;                                                 // (Parm, NeedCtorLink)
	string                                             URL;                                                      // (Parm, NeedCtorLink)
};

// Function XInterface.ExtendedConsole.OnStatsConfigured
struct UExtendedConsole_OnStatsConfigured_Params
{
};

// Function XInterface.ExtendedConsole.OnStatsClosed
struct UExtendedConsole_OnStatsClosed_Params
{
	bool                                               bCancelled;                                               // (OptionalParm, Parm)
};

// Function XInterface.ExtendedConsole.OnChat
struct UExtendedConsole_OnChat_Params
{
	string                                             Msg;                                                      // (Parm, NeedCtorLink)
	int                                                TeamIndex;                                                // (Parm)
};

// Function XInterface.UT2MusicManager.NotifyLevelChange
struct UUT2MusicManager_NotifyLevelChange_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.UT2MusicManager.MusicChanged
struct UUT2MusicManager_MusicChanged_Params
{
};

// Function XInterface.UT2MusicManager.SetInitialMusic
struct UUT2MusicManager_SetInitialMusic_Params
{
	string                                             NewSong;                                                  // (Parm, NeedCtorLink)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.UT2MusicManager.SetMusic
struct UUT2MusicManager_SetMusic_Params
{
	string                                             NewSong;                                                  // (Parm, NeedCtorLink)
};

// Function XInterface.UT2MusicManager.InitComponent
struct UUT2MusicManager_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.HudCDeathmatch.IsPickupWeapon
struct AHudCDeathmatch_IsPickupWeapon_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.DisalbeWeaponSlot5Hud
struct AHudCDeathmatch_DisalbeWeaponSlot5Hud_Params
{
};

// Function XInterface.HudCDeathmatch.EnableWeaponSlot5Hud
struct AHudCDeathmatch_EnableWeaponSlot5Hud_Params
{
	int                                                nWeaponID;                                                // (Parm)
};

// Function XInterface.HudCDeathmatch.ChangeWeaponSlot5Hud
struct AHudCDeathmatch_ChangeWeaponSlot5Hud_Params
{
	class AwWeapon*                                    newWeapon;                                                // (Parm)
	bool                                               bAddSkill;                                                // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.DisalbeWeaponSlot6Hud
struct AHudCDeathmatch_DisalbeWeaponSlot6Hud_Params
{
};

// Function XInterface.HudCDeathmatch.ChangeWeaponSlot6Hud
struct AHudCDeathmatch_ChangeWeaponSlot6Hud_Params
{
	class AwWeapon*                                    newWeapon;                                                // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawAASNotice
struct AHudCDeathmatch_DrawAASNotice_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.GetNoticeFirst
struct AHudCDeathmatch_GetNoticeFirst_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.HudCDeathmatch.DrawSystemNotice
struct AHudCDeathmatch_DrawSystemNotice_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawGameNotice
struct AHudCDeathmatch_DrawGameNotice_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.AllDeleteGameNotice
struct AHudCDeathmatch_AllDeleteGameNotice_Params
{
};

// Function XInterface.HudCDeathmatch.PushAASNotice
struct AHudCDeathmatch_PushAASNotice_Params
{
	string                                             sNotice;                                                  // (Parm, NeedCtorLink)
	float                                              beginTime;                                                // (Parm)
	byte                                               byLevel;                                                  // (Parm)
};

// Function XInterface.HudCDeathmatch.PushGameNotice
struct AHudCDeathmatch_PushGameNotice_Params
{
	string                                             sNotice;                                                  // (Parm, NeedCtorLink)
};

// Function XInterface.HudCDeathmatch.RecGameNotice
struct AHudCDeathmatch_RecGameNotice_Params
{
	string                                             sNotice;                                                  // (Parm, NeedCtorLink)
};

// Function XInterface.HudCDeathmatch.RecAAS
struct AHudCDeathmatch_RecAAS_Params
{
	string                                             sNotice;                                                  // (Parm, NeedCtorLink)
	float                                              DrawTime;                                                 // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawWaringMark
struct AHudCDeathmatch_DrawWaringMark_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              fWidth;                                                   // (Parm)
	float                                              fHeight;                                                  // (Parm)
	float                                              fCurLifeTime;                                             // (Parm)
	float                                              fMaxLifeTime;                                             // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawScoreEffect
struct AHudCDeathmatch_DrawScoreEffect_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FSpriteWidget                               W;                                                        // (Parm)
	float                                              fWidth;                                                   // (Parm)
	float                                              fHeight;                                                  // (Parm)
	struct FCalCoordsW                                 calW;                                                     // (Parm)
	float                                              PosX;                                                     // (OptionalParm, Parm)
	float                                              PosY;                                                     // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.DrawKillMarkEffect
struct AHudCDeathmatch_DrawKillMarkEffect_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FSpriteWidget                               W;                                                        // (Parm)
	float                                              fWidth;                                                   // (Parm)
	float                                              fHeight;                                                  // (Parm)
	struct FCalCoordsW                                 calW;                                                     // (Parm)
	float                                              PosX;                                                     // (OptionalParm, Parm)
	float                                              PosY;                                                     // (OptionalParm, Parm)
	float                                              fScale;                                                   // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.DrawSpecialSkillMedal
struct AHudCDeathmatch_DrawSpecialSkillMedal_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                Index;                                                    // (Parm)
	int                                                width;                                                    // (Parm)
	int                                                Height;                                                   // (Parm)
	struct FCalCoordsW                                 calW;                                                     // (Parm)
	int                                                PosX;                                                     // (Parm)
	int                                                PosY;                                                     // (Parm)
	float                                              curScale;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.CallSpecialSkillMedelSound
struct AHudCDeathmatch_CallSpecialSkillMedelSound_Params
{
	int                                                Index;                                                    // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawAddScore
struct AHudCDeathmatch_DrawAddScore_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                i;                                                        // (Parm)
	float                                              ScorePosX;                                                // (Parm)
	float                                              ScorePosY;                                                // (Parm)
	int                                                MessageScoreEffect;                                       // (OptionalParm, Parm)
	float                                              CurrentScale;                                             // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.DrawMessageScore
struct AHudCDeathmatch_DrawMessageScore_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                i;                                                        // (Parm)
	float                                              PosX;                                                     // (Parm)
	float                                              PosY;                                                     // (Parm)
	float                                              dx;                                                       // (Parm, OutParm)
	float                                              dy;                                                       // (Parm, OutParm)
};

// Function XInterface.HudCDeathmatch.ResetKillMessageTexture
struct AHudCDeathmatch_ResetKillMessageTexture_Params
{
};

// Function XInterface.HudCDeathmatch.DrawMessageWithTexture
struct AHudCDeathmatch_DrawMessageWithTexture_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                i;                                                        // (Parm)
	float                                              PosX;                                                     // (Parm)
	float                                              PosY;                                                     // (Parm)
	float                                              dx;                                                       // (Parm, OutParm)
	float                                              dy;                                                       // (Parm, OutParm)
};

// Function XInterface.HudCDeathmatch.DrawMessage
struct AHudCDeathmatch_DrawMessage_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                i;                                                        // (Parm)
	float                                              PosX;                                                     // (Parm)
	float                                              PosY;                                                     // (Parm)
	float                                              dx;                                                       // (Parm, OutParm)
	float                                              dy;                                                       // (Parm, OutParm)
};

// Function XInterface.HudCDeathmatch.LocalizedMessage
struct AHudCDeathmatch_LocalizedMessage_Params
{
	class UClass*                                      Message;                                                  // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
	string                                             CriticalString;                                           // (OptionalParm, Parm, NeedCtorLink)
};

// Function XInterface.HudCDeathmatch.IsUAVOn
struct AHudCDeathmatch_IsUAVOn_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.IsUAVScanning
struct AHudCDeathmatch_IsUAVScanning_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.GetUAVScanLineTexturePos
struct AHudCDeathmatch_GetUAVScanLineTexturePos_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.GetUAVScanLineMinimapPos
struct AHudCDeathmatch_GetUAVScanLineMinimapPos_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.GetUAVScanProgress
struct AHudCDeathmatch_GetUAVScanProgress_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.StartUAVScan
struct AHudCDeathmatch_StartUAVScan_Params
{
};

// Function XInterface.HudCDeathmatch.IsPawnUnderScan
struct AHudCDeathmatch_IsPawnUnderScan_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.UpdateUAV
struct AHudCDeathmatch_UpdateUAV_Params
{
};

// Function XInterface.HudCDeathmatch.DrawUAV
struct AHudCDeathmatch_DrawUAV_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawDebugUAV
struct AHudCDeathmatch_DrawDebugUAV_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                X;                                                        // (Parm)
	int                                                Y;                                                        // (Parm, OutParm)
	int                                                dy;                                                       // (Parm)
};

// Function XInterface.HudCDeathmatch.CallItemBuy
struct AHudCDeathmatch_CallItemBuy_Params
{
	int                                                iKey;                                                     // (OptionalParm, Parm)
	int                                                iReservation1;                                            // (OptionalParm, Parm)
	int                                                iReservation2;                                            // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.TutorialEvent
struct AHudCDeathmatch_TutorialEvent_Params
{
	string                                             S;                                                        // (Parm, CoerceParm, NeedCtorLink)
	FName                                              Type;                                                     // (OptionalParm, Parm)
	FName                                              reserv;                                                   // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.CallRadioMessage
struct AHudCDeathmatch_CallRadioMessage_Params
{
	int                                                iKey;                                                     // (OptionalParm, Parm)
	int                                                iReservation1;                                            // (OptionalParm, Parm)
	int                                                iReservation2;                                            // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.CallEvent
struct AHudCDeathmatch_CallEvent_Params
{
	bool                                               InvenCheck;                                               // (OptionalParm, Parm)
	int                                                iReservation1;                                            // (OptionalParm, Parm)
	int                                                iReservation2;                                            // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.DrawChangeHostGuest
struct AHudCDeathmatch_DrawChangeHostGuest_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.OnEndChangedHost
struct AHudCDeathmatch_OnEndChangedHost_Params
{
};

// Function XInterface.HudCDeathmatch.EndDrawChangeHost
struct AHudCDeathmatch_EndDrawChangeHost_Params
{
};

// Function XInterface.HudCDeathmatch.BeginDrawChangeHost
struct AHudCDeathmatch_BeginDrawChangeHost_Params
{
};

// Function XInterface.HudCDeathmatch.GetTargetOrientation2
struct AHudCDeathmatch_GetTargetOrientation2_Params
{
	struct FVector                                     loc;                                                      // (Parm)
	struct FVector                                     camLoc;                                                   // (Parm)
	struct FRotator                                    camRot;                                                   // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.ExpandTargetOrientationToCanvas
struct AHudCDeathmatch_ExpandTargetOrientationToCanvas_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     Orientation;                                              // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.GetTargetOrientation
struct AHudCDeathmatch_GetTargetOrientation_Params
{
	class AActor*                                      Target;                                                   // (Parm)
	struct FVector                                     camLoc;                                                   // (Parm)
	struct FRotator                                    camRot;                                                   // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.DrawOutArrow
struct AHudCDeathmatch_DrawOutArrow_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              W;                                                        // (Parm)
	float                                              H;                                                        // (Parm)
	struct FVector                                     ScreenPos;                                                // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawObjectSprite
struct AHudCDeathmatch_DrawObjectSprite_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class UObject*                                     Tag;                                                      // (Parm)
	struct FSpriteWidget                               objectSprite;                                             // (Parm)
	struct FVector                                     objectLoc;                                                // (Parm)
	bool                                               drawMeter;                                                // (OptionalParm, Parm)
	float                                              rX;                                                       // (OptionalParm, Parm)
	float                                              rY;                                                       // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.DrawObjectSprite2
struct AHudCDeathmatch_DrawObjectSprite2_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class UObject*                                     Tag;                                                      // (Parm)
	struct FSpriteWidget                               objectSprite;                                             // (Parm)
	struct FVector                                     objectLoc;                                                // (Parm)
	string                                             ObjectName;                                               // (OptionalParm, Parm, NeedCtorLink)
	int                                                Alpha;                                                    // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.DrawObjectSprite3
struct AHudCDeathmatch_DrawObjectSprite3_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FSpriteWidget                               objectSprite;                                             // (Parm)
	struct FVector                                     objectLoc;                                                // (Parm)
	bool                                               bNoMeterDisplay;                                          // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.DrawCustomObjectSprite
struct AHudCDeathmatch_DrawCustomObjectSprite_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class AwPawn*                                      curPawn;                                                  // (Parm)
	struct FSpriteWidget                               objectSprite;                                             // (Parm)
	string                                             strName;                                                  // (Parm, NeedCtorLink)
	float                                              fAdditionalX;                                             // (OptionalParm, Parm)
	float                                              fAdditionalY;                                             // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.CalcScreenPos
struct AHudCDeathmatch_CalcScreenPos_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     objectLoc;                                                // (Parm)
	float                                              W;                                                        // (Parm)
	float                                              H;                                                        // (Parm)
	byte                                               clipped;                                                  // (Parm, OutParm)
	bool                                               ClipEclipse;                                              // (OptionalParm, Parm)
	float                                              rX;                                                       // (OptionalParm, Parm)
	float                                              rY;                                                       // (OptionalParm, Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.CallSkill
struct AHudCDeathmatch_CallSkill_Params
{
	int                                                iKey;                                                     // (OptionalParm, Parm)
	bool                                               bRequire;                                                 // (OptionalParm, Parm)
	bool                                               bSuccess;                                                 // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.DrawSelfKillMessage
struct AHudCDeathmatch_DrawSelfKillMessage_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.MakeSelfKillMessage
struct AHudCDeathmatch_MakeSelfKillMessage_Params
{
	string                                             KillerName;                                               // (Parm, NeedCtorLink)
	string                                             VictimName;                                               // (Parm, NeedCtorLink)
	class UClass*                                      Type;                                                     // (Parm)
	struct FSelfKillMessage                            ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.HudCDeathmatch.RefreshKillerMark
struct AHudCDeathmatch_RefreshKillerMark_Params
{
	string                                             mKillerName;                                              // (Parm, NeedCtorLink)
};

// Function XInterface.HudCDeathmatch.OnClientReceiveDeathMessage
struct AHudCDeathmatch_OnClientReceiveDeathMessage_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	int                                                Switch;                                                   // (Parm)
	class APlayerReplicationInfo*                      attackerPRI;                                              // (Parm)
	class APlayerReplicationInfo*                      victimPRI;                                                // (Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.OnClientReceiveFlyingDefenceBotDeathMessage
struct AHudCDeathmatch_OnClientReceiveFlyingDefenceBotDeathMessage_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	class APlayerReplicationInfo*                      attackerPRI;                                              // (Parm)
	class APlayerReplicationInfo*                      victimPRI;                                                // (Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.OnClientReceiveSentryGunDeathMessage
struct AHudCDeathmatch_OnClientReceiveSentryGunDeathMessage_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	class APlayerReplicationInfo*                      attackerPRI;                                              // (Parm)
	class APlayerReplicationInfo*                      victimPRI;                                                // (Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.OnClientReceiveHeliDeathMessage
struct AHudCDeathmatch_OnClientReceiveHeliDeathMessage_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	class APlayerReplicationInfo*                      attackerPRI;                                              // (Parm)
	class APlayerReplicationInfo*                      victimPRI;                                                // (Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.OnClientReceiveDeathMessage_AddToConsole
struct AHudCDeathmatch_OnClientReceiveDeathMessage_AddToConsole_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	class APlayerReplicationInfo*                      attackerPRI;                                              // (Parm)
	class APlayerReplicationInfo*                      victimPRI;                                                // (Parm)
	class AwDamageType*                                DamageType;                                               // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawDamageIndicator
struct AHudCDeathmatch_DrawDamageIndicator_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FDamageIndicationInfo                       Info;                                                     // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawDamageIndicators
struct AHudCDeathmatch_DrawDamageIndicators_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.IsHealthInDanger
struct AHudCDeathmatch_IsHealthInDanger_Params
{
	int                                                hpBefore;                                                 // (Parm)
	int                                                hpAfter;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.DrawHealthInDanger
struct AHudCDeathmatch_DrawHealthInDanger_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawFallInDanger
struct AHudCDeathmatch_DrawFallInDanger_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.StopNotifyFallInDanager
struct AHudCDeathmatch_StopNotifyFallInDanager_Params
{
};

// Function XInterface.HudCDeathmatch.NotifyFallInDanger
struct AHudCDeathmatch_NotifyFallInDanger_Params
{
};

// Function XInterface.HudCDeathmatch.StopNotifyHealthInDanager
struct AHudCDeathmatch_StopNotifyHealthInDanager_Params
{
};

// Function XInterface.HudCDeathmatch.NotifyHealthInDanger
struct AHudCDeathmatch_NotifyHealthInDanger_Params
{
};

// Function XInterface.HudCDeathmatch.ClearDamageIndicationInfos
struct AHudCDeathmatch_ClearDamageIndicationInfos_Params
{
};

// Function XInterface.HudCDeathmatch.AddDamageIndicationInfo
struct AHudCDeathmatch_AddDamageIndicationInfo_Params
{
	struct FVector                                     AttackerLocation;                                         // (Parm)
	int                                                Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
};

// Function XInterface.HudCDeathmatch.NotifyTakeHit
struct AHudCDeathmatch_NotifyTakeHit_Params
{
	struct FVector                                     AttackerLocation;                                         // (Parm)
	int                                                Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.DrawProgressStatus
struct AHudCDeathmatch_DrawProgressStatus_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              Progress;                                                 // (Parm)
};

// Function XInterface.HudCDeathmatch.LoadLevelActionFont
struct AHudCDeathmatch_LoadLevelActionFont_Params
{
	class UFont*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.DisplayPortrait
struct AHudCDeathmatch_DisplayPortrait_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawLevelAction
struct AHudCDeathmatch_DrawLevelAction_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.DrawVehicleChargeBar
struct AHudCDeathmatch_DrawVehicleChargeBar_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawChargeBar
struct AHudCDeathmatch_DrawChargeBar_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.ShowReloadingPulse
struct AHudCDeathmatch_ShowReloadingPulse_Params
{
	float                                              HOLD;                                                     // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawDamageDealNotification
struct AHudCDeathmatch_DrawDamageDealNotification_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.ResetByChangeSpectatingPawn
struct AHudCDeathmatch_ResetByChangeSpectatingPawn_Params
{
};

// Function XInterface.HudCDeathmatch.DrawWarfareCrosshair
struct AHudCDeathmatch_DrawWarfareCrosshair_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.SetMA
struct AHudCDeathmatch_SetMA_Params
{
	float                                              f;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawDetectedBombs
struct AHudCDeathmatch_DrawDetectedBombs_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawHudSpectating
struct AHudCDeathmatch_DrawHudSpectating_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawHudPassC
struct AHudCDeathmatch_DrawHudPassC_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.GetLevelImage
struct AHudCDeathmatch_GetLevelImage_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	class UMaterial*                                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.DisplayDebug
struct AHudCDeathmatch_DisplayDebug_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function XInterface.HudCDeathmatch.DrawDebugPosition
struct AHudCDeathmatch_DrawDebugPosition_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APawn*                                       P;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawHudPassA
struct AHudCDeathmatch_DrawHudPassA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawBackDisplayScreen
struct AHudCDeathmatch_DrawBackDisplayScreen_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawDebug
struct AHudCDeathmatch_DrawDebug_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                X;                                                        // (Parm)
	int                                                Y;                                                        // (Parm, OutParm)
	int                                                dy;                                                       // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawDebug_Network
struct AHudCDeathmatch_DrawDebug_Network_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                X;                                                        // (Parm)
	int                                                Y;                                                        // (Parm, OutParm)
	int                                                dy;                                                       // (Parm)
};

// Function XInterface.HudCDeathmatch.wclearNet
struct AHudCDeathmatch_wclearNet_Params
{
};

// Function XInterface.HudCDeathmatch.DrawDebug_DrawDebugUserWeaponStates
struct AHudCDeathmatch_DrawDebug_DrawDebugUserWeaponStates_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                X;                                                        // (Parm)
	int                                                Y;                                                        // (Parm, OutParm)
	int                                                dy;                                                       // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawDebug_Inventory
struct AHudCDeathmatch_DrawDebug_Inventory_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                X;                                                        // (Parm)
	int                                                Y;                                                        // (Parm, OutParm)
	int                                                dy;                                                       // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawDebugEmitters
struct AHudCDeathmatch_DrawDebugEmitters_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawDebugHelicopter
struct AHudCDeathmatch_DrawDebugHelicopter_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawDebugAirStrike
struct AHudCDeathmatch_DrawDebugAirStrike_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawSpecialPositions
struct AHudCDeathmatch_DrawSpecialPositions_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawTimer2
struct AHudCDeathmatch_DrawTimer2_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawTimer1
struct AHudCDeathmatch_DrawTimer1_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawAmmoLinear2
struct AHudCDeathmatch_DrawAmmoLinear2_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                Ammo;                                                     // (Parm)
	int                                                MaxAmmo;                                                  // (Parm)
	struct FAmmoSet                                    as;                                                       // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawAmmoLinear
struct AHudCDeathmatch_DrawAmmoLinear_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                Ammo;                                                     // (Parm)
	int                                                MaxAmmo;                                                  // (Parm)
	int                                                digitOffset;                                              // (Parm)
	struct FNumericWidget                              ammoWidget;                                               // (Parm)
	struct FDigitSet                                   AmmoSet;                                                  // (Parm, OutParm)
};

// Function XInterface.HudCDeathmatch.DrawAmmo100
struct AHudCDeathmatch_DrawAmmo100_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                Ammo;                                                     // (Parm)
	int                                                MaxAmmo;                                                  // (Parm)
	int                                                ammoPerLine;                                              // (Parm)
};

// Function XInterface.HudCDeathmatch.DecideAmmoNum
struct AHudCDeathmatch_DecideAmmoNum_Params
{
	int                                                Ammo;                                                     // (Parm)
	int                                                MaxAmmo;                                                  // (Parm)
	int                                                ammoDefault;                                              // (Parm, OutParm)
	int                                                ammoUsed;                                                 // (Parm, OutParm)
};

// Function XInterface.HudCDeathmatch.IsAmmoShortage
struct AHudCDeathmatch_IsAmmoShortage_Params
{
	int                                                Ammo;                                                     // (Parm)
	int                                                MaxAmmo;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.DrawAmmoFlameThrower2
struct AHudCDeathmatch_DrawAmmoFlameThrower2_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                curr;                                                     // (Parm)
	int                                                Max;                                                      // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawAmmoFlameThrower
struct AHudCDeathmatch_DrawAmmoFlameThrower_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                curr;                                                     // (Parm)
	int                                                Max;                                                      // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawAmmoDemo
struct AHudCDeathmatch_DrawAmmoDemo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawAmmo
struct AHudCDeathmatch_DrawAmmo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawGaugeOverHeat
struct AHudCDeathmatch_DrawGaugeOverHeat_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              iRatio;                                                   // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawWeaponImage
struct AHudCDeathmatch_DrawWeaponImage_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               bShowSpectating;                                          // (OptionalParm, Parm)
	string                                             sWeaponName;                                              // (OptionalParm, Parm, OutParm, NeedCtorLink)
};

// Function XInterface.HudCDeathmatch.DrawAmmoSeparator
struct AHudCDeathmatch_DrawAmmoSeparator_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.CheckUsingSkillList
struct AHudCDeathmatch_CheckUsingSkillList_Params
{
	class AwWeapon*                                    Wpn;                                                      // (Parm)
	int                                                iState;                                                   // (Parm, OutParm)
};

// Function XInterface.HudCDeathmatch.GetHUDTextures
struct AHudCDeathmatch_GetHUDTextures_Params
{
	int                                                ItemID;                                                   // (Parm)
	class UMaterial*                                   enableSkillIcon;                                          // (Parm, OutParm)
	class UMaterial*                                   disableSkillIcon;                                         // (Parm, OutParm)
};

// Function XInterface.HudCDeathmatch.GetSkillInfo
struct AHudCDeathmatch_GetSkillInfo_Params
{
	int                                                SkillID;                                                  // (Parm)
	int                                                weaponID;                                                 // (Parm)
	int                                                usedStrCode;                                              // (Parm, OutParm)
	int                                                skillSlotNum;                                             // (Parm, OutParm)
};

// Function XInterface.HudCDeathmatch.GetSkillIconByWeaponID
struct AHudCDeathmatch_GetSkillIconByWeaponID_Params
{
	int                                                nWeaponID;                                                // (Parm)
	bool                                               bEnable;                                                  // (Parm)
	class UMaterial*                                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.InsertUsingSkillList
struct AHudCDeathmatch_InsertUsingSkillList_Params
{
	int                                                SkillID;                                                  // (Parm)
	int                                                weaponID;                                                 // (Parm)
	int                                                SubSkillID;                                               // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.CheckPawnOwnerSkill
struct AHudCDeathmatch_CheckPawnOwnerSkill_Params
{
	int                                                skillC4;                                                  // (Parm, OutParm)
	int                                                skillAirStirke;                                           // (Parm, OutParm)
	int                                                skillRPG;                                                 // (Parm, OutParm)
};

// Function XInterface.HudCDeathmatch.HasItemInMyInventory
struct AHudCDeathmatch_HasItemInMyInventory_Params
{
	bool                                               bCheck;                                                   // (OptionalParm, Parm)
	int                                                ItemID1;                                                  // (OptionalParm, Parm)
	int                                                ItemID2;                                                  // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.InitSkillFlag
struct AHudCDeathmatch_InitSkillFlag_Params
{
};

// Function XInterface.HudCDeathmatch.DrawSkill
struct AHudCDeathmatch_DrawSkill_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawSlotEnable
struct AHudCDeathmatch_DrawSlotEnable_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              activeTime;                                               // (Parm)
	struct FSpriteWidget                               showSprite;                                               // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawSkill_Slot6
struct AHudCDeathmatch_DrawSkill_Slot6_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawSkill_Slot5
struct AHudCDeathmatch_DrawSkill_Slot5_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawHudPassA_Score
struct AHudCDeathmatch_DrawHudPassA_Score_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.NotifyDeath
struct AHudCDeathmatch_NotifyDeath_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.GetTeamDeathTextureScale
struct AHudCDeathmatch_GetTeamDeathTextureScale_Params
{
	struct FTeamDeathInfo                              Info;                                                     // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.GetTeamDeathTextureColor
struct AHudCDeathmatch_GetTeamDeathTextureColor_Params
{
	struct FTeamDeathInfo                              Info;                                                     // (Parm)
	struct FColor                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.DrawTeamDeathInfo
struct AHudCDeathmatch_DrawTeamDeathInfo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     ScreenPos;                                                // (Parm)
	struct FVector                                     camLoc;                                                   // (Parm)
	struct FRotator                                    camRot;                                                   // (Parm)
	struct FTeamDeathInfo                              Info;                                                     // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawAllTeamDeathInfo
struct AHudCDeathmatch_DrawAllTeamDeathInfo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.AddTeamDeathInfo
struct AHudCDeathmatch_AddTeamDeathInfo_Params
{
	class APawn*                                       P;                                                        // (Parm)
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	float                                              FadeTime;                                                 // (Parm)
	float                                              Duration;                                                 // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawPosture
struct AHudCDeathmatch_DrawPosture_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               bShowSpectating;                                          // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.DrawHpStamina
struct AHudCDeathmatch_DrawHpStamina_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               bShowSpectating;                                          // (OptionalParm, Parm)
};

// Function XInterface.HudCDeathmatch.SellectEffectBar
struct AHudCDeathmatch_SellectEffectBar_Params
{
};

// Function XInterface.HudCDeathmatch.CalculateHPBar
struct AHudCDeathmatch_CalculateHPBar_Params
{
	bool                                               bDamage;                                                  // (Parm)
	bool                                               bRecovery;                                                // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.DisplayVoiceGain
struct AHudCDeathmatch_DisplayVoiceGain_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.ZoomFadeOut
struct AHudCDeathmatch_ZoomFadeOut_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.FadeZoom
struct AHudCDeathmatch_FadeZoom_Params
{
};

// Function XInterface.HudCDeathmatch.DisplayEnemyName
struct AHudCDeathmatch_DisplayEnemyName_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawEnemyName
struct AHudCDeathmatch_DrawEnemyName_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawCrosshair
struct AHudCDeathmatch_DrawCrosshair_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawWarfareCrosshair_Image
struct AHudCDeathmatch_DrawWarfareCrosshair_Image_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class UMaterial*                                   mat;                                                      // (Parm)
};

// Function XInterface.HudCDeathmatch.UpdateCrossHairSpread
struct AHudCDeathmatch_UpdateCrossHairSpread_Params
{
};

// Function XInterface.HudCDeathmatch.DrawTurretCrossHair
struct AHudCDeathmatch_DrawTurretCrossHair_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawStaticCrossHair
struct AHudCDeathmatch_DrawStaticCrossHair_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawHUDAnimWidget
struct AHudCDeathmatch_DrawHUDAnimWidget_Params
{
	struct FSpriteWidget                               HUDPiece;                                                 // (Parm, OutParm)
	float                                              DefaultScale;                                             // (Parm)
	float                                              PickUPTime;                                               // (Parm)
	float                                              AnimTime;                                                 // (Parm)
	float                                              AnimScale;                                                // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawHUDAnimDigit
struct AHudCDeathmatch_DrawHUDAnimDigit_Params
{
	struct FNumericWidget                              HUDPiece;                                                 // (Parm, OutParm)
	float                                              DefaultScale;                                             // (Parm)
	float                                              PickUPTime;                                               // (Parm)
	float                                              AnimTime;                                                 // (Parm)
	struct FColor                                      DefaultColor;                                             // (Parm)
	struct FColor                                      colorHighlight;                                           // (Parm)
};

// Function XInterface.HudCDeathmatch.GetInfoString
struct AHudCDeathmatch_GetInfoString_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.HudCDeathmatch.ShowEnemyWhoKillMe
struct AHudCDeathmatch_ShowEnemyWhoKillMe_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawSpectatingHud
struct AHudCDeathmatch_DrawSpectatingHud_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawViewTargetInfo
struct AHudCDeathmatch_DrawViewTargetInfo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawResultScore
struct AHudCDeathmatch_DrawResultScore_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawResult
struct AHudCDeathmatch_DrawResult_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.SendQuestUpdate
struct AHudCDeathmatch_SendQuestUpdate_Params
{
};

// Function XInterface.HudCDeathmatch.IsInCinematic
struct AHudCDeathmatch_IsInCinematic_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.GetTeamColor
struct AHudCDeathmatch_GetTeamColor_Params
{
	byte                                               TeamNum;                                                  // (Parm)
	struct FColor                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.GetScoreTagLine
struct AHudCDeathmatch_GetScoreTagLine_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.HudCDeathmatch.GetScoreValue
struct AHudCDeathmatch_GetScoreValue_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.HudCDeathmatch.GetScoreText
struct AHudCDeathmatch_GetScoreText_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.HudCDeathmatch.CalculateScore
struct AHudCDeathmatch_CalculateScore_Params
{
};

// Function XInterface.HudCDeathmatch.CalculateAmmo
struct AHudCDeathmatch_CalculateAmmo_Params
{
};

// Function XInterface.HudCDeathmatch.CalculateEnergy
struct AHudCDeathmatch_CalculateEnergy_Params
{
};

// Function XInterface.HudCDeathmatch.CalculateShield
struct AHudCDeathmatch_CalculateShield_Params
{
};

// Function XInterface.HudCDeathmatch.CalculateHealth
struct AHudCDeathmatch_CalculateHealth_Params
{
};

// Function XInterface.HudCDeathmatch.UpdateRankAndSpread
struct AHudCDeathmatch_UpdateRankAndSpread_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawUDamage
struct AHudCDeathmatch_DrawUDamage_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawTimer
struct AHudCDeathmatch_DrawTimer_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawAdrenaline
struct AHudCDeathmatch_DrawAdrenaline_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawVehicleName
struct AHudCDeathmatch_DrawVehicleName_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.PlaySoundRecovery
struct AHudCDeathmatch_PlaySoundRecovery_Params
{
};

// Function XInterface.HudCDeathmatch.PlaySoundStop
struct AHudCDeathmatch_PlaySoundStop_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.updateScore
struct AHudCDeathmatch_updateScore_Params
{
};

// Function XInterface.HudCDeathmatch.UpdateHUD
struct AHudCDeathmatch_UpdateHUD_Params
{
};

// Function XInterface.HudCDeathmatch.DoUpdateTime
struct AHudCDeathmatch_DoUpdateTime_Params
{
};

// Function XInterface.HudCDeathmatch.UpdateDigitsMisc
struct AHudCDeathmatch_UpdateDigitsMisc_Params
{
};

// Function XInterface.HudCDeathmatch.UpdateDigitsHealth
struct AHudCDeathmatch_UpdateDigitsHealth_Params
{
};

// Function XInterface.HudCDeathmatch.UpdateSprint
struct AHudCDeathmatch_UpdateSprint_Params
{
};

// Function XInterface.HudCDeathmatch.UpdateTimer
struct AHudCDeathmatch_UpdateTimer_Params
{
	int                                                TimeMinutes;                                              // (Parm, OutParm)
	int                                                TimeSeconds;                                              // (Parm, OutParm)
};

// Function XInterface.HudCDeathmatch.SetDigitsTimer2
struct AHudCDeathmatch_SetDigitsTimer2_Params
{
	int                                                Min;                                                      // (Parm)
	int                                                sec;                                                      // (Parm)
};

// Function XInterface.HudCDeathmatch.SetDigitsTimer1
struct AHudCDeathmatch_SetDigitsTimer1_Params
{
	int                                                Min;                                                      // (Parm)
	int                                                sec;                                                      // (Parm)
};

// Function XInterface.HudCDeathmatch.SetDigitsScore
struct AHudCDeathmatch_SetDigitsScore_Params
{
	int                                                valueL;                                                   // (Parm)
	bool                                               highlightL;                                               // (Parm)
	int                                                valueR;                                                   // (Parm)
	bool                                               highlightR;                                               // (Parm)
	int                                                valueU;                                                   // (Parm)
	int                                                valueD;                                                   // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawAirStrikePosition
struct AHudCDeathmatch_DrawAirStrikePosition_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.DrawSuppliesPositions
struct AHudCDeathmatch_DrawSuppliesPositions_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.CacheSuppliesPositions
struct AHudCDeathmatch_CacheSuppliesPositions_Params
{
	class AActor*                                      act;                                                      // (Parm)
};

// Function XInterface.HudCDeathmatch.DeleteSuppliesPositions
struct AHudCDeathmatch_DeleteSuppliesPositions_Params
{
	class AActor*                                      act;                                                      // (Parm)
};

// Function XInterface.HudCDeathmatch.AllDeleteSuppliesPositions
struct AHudCDeathmatch_AllDeleteSuppliesPositions_Params
{
};

// Function XInterface.HudCDeathmatch.CacheSpecialPositions
struct AHudCDeathmatch_CacheSpecialPositions_Params
{
};

// Function XInterface.HudCDeathmatch.Tick
struct AHudCDeathmatch_Tick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function XInterface.HudCDeathmatch.CheckCountdown
struct AHudCDeathmatch_CheckCountdown_Params
{
	class AGameReplicationInfo*                        GRI;                                                      // (Parm)
};

// Function XInterface.HudCDeathmatch.SetCustomHUDColor
struct AHudCDeathmatch_SetCustomHUDColor_Params
{
};

// Function XInterface.HudCDeathmatch.SetCustomCrosshairColors
struct AHudCDeathmatch_SetCustomCrosshairColors_Params
{
};

// Function XInterface.HudCDeathmatch.SetCustomCrosshairs
struct AHudCDeathmatch_SetCustomCrosshairs_Params
{
};

// Function XInterface.HudCDeathmatch.CustomHUDColorAllowed
struct AHudCDeathmatch_CustomHUDColorAllowed_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.CustomCrosshairColorAllowed
struct AHudCDeathmatch_CustomCrosshairColorAllowed_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.CustomCrosshairsAllowed
struct AHudCDeathmatch_CustomCrosshairsAllowed_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.ResetHud
struct AHudCDeathmatch_ResetHud_Params
{
};

// Function XInterface.HudCDeathmatch.SetScoreBoardClass
struct AHudCDeathmatch_SetScoreBoardClass_Params
{
	class UClass*                                      ScoreboardClass;                                          // (Parm)
	class UClass*                                      ResultBoardClass;                                         // (Parm)
	class UClass*                                      ResultBoardBootyClass;                                    // (Parm)
};

// Function XInterface.HudCDeathmatch.InitHudPart_ItemBuy
struct AHudCDeathmatch_InitHudPart_ItemBuy_Params
{
};

// Function XInterface.HudCDeathmatch.InitHudPart_SelQuickSlot
struct AHudCDeathmatch_InitHudPart_SelQuickSlot_Params
{
};

// Function XInterface.HudCDeathmatch.PostBeginPlay
struct AHudCDeathmatch_PostBeginPlay_Params
{
};

// Function XInterface.HudCDeathmatch.UpdatePrecacheMaterials
struct AHudCDeathmatch_UpdatePrecacheMaterials_Params
{
};

// Function XInterface.HudCDeathmatch.ShowRadioMessage_Notify
struct AHudCDeathmatch_ShowRadioMessage_Notify_Params
{
};

// Function XInterface.HudCDeathmatch.ShowRadioMessage_Alarm
struct AHudCDeathmatch_ShowRadioMessage_Alarm_Params
{
};

// Function XInterface.HudCDeathmatch.ShowRadioMessage
struct AHudCDeathmatch_ShowRadioMessage_Params
{
};

// Function XInterface.HudCDeathmatch.UpdateMinimapMode
struct AHudCDeathmatch_UpdateMinimapMode_Params
{
};

// Function XInterface.HudCDeathmatch.ShowBigmap
struct AHudCDeathmatch_ShowBigmap_Params
{
};

// Function XInterface.HudCDeathmatch.DrawRouteCache
struct AHudCDeathmatch_DrawRouteCache_Params
{
	class AwAIBot*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCDeathmatch.RenderAIPaths
struct AHudCDeathmatch_RenderAIPaths_Params
{
};

// Function XInterface.HudCDeathmatch.CalcArrayColor
struct AHudCDeathmatch_CalcArrayColor_Params
{
	float                                              V;                                                        // (Parm)
	struct FColor[]                                    carray;                                                   // (Parm, NeedCtorLink)
	struct FColor                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCDeathmatch.RenderNavExtraCost
struct AHudCDeathmatch_RenderNavExtraCost_Params
{
};

// Function XInterface.HudCDeathmatch.RenderVisCount
struct AHudCDeathmatch_RenderVisCount_Params
{
};

// Function XInterface.HudCDeathmatch.RenderInfluence
struct AHudCDeathmatch_RenderInfluence_Params
{
};

// Function XInterface.HudCDeathmatch.RenderCoverAngle
struct AHudCDeathmatch_RenderCoverAngle_Params
{
};

// Function XInterface.HudCDeathmatch.RenderRadius
struct AHudCDeathmatch_RenderRadius_Params
{
};

// Function XInterface.HudCDeathmatch.RenderSDFrontLine
struct AHudCDeathmatch_RenderSDFrontLine_Params
{
	bool                                               Full;                                                     // (Parm)
};

// Function XInterface.HudCDeathmatch.rendai
struct AHudCDeathmatch_rendai_Params
{
	string                                             v1;                                                       // (Parm, NeedCtorLink)
	string                                             v2;                                                       // (Parm, NeedCtorLink)
};

// Function XInterface.HudCDeathmatch.WorldSpaceOverlays
struct AHudCDeathmatch_WorldSpaceOverlays_Params
{
};

// Function XInterface.HudCDeathmatch.ShrinkHUD
struct AHudCDeathmatch_ShrinkHUD_Params
{
};

// Function XInterface.HudCDeathmatch.GrowHUD
struct AHudCDeathmatch_GrowHUD_Params
{
};

// Function XInterface.HudCTeamDeathMatch.CustomHUDColorAllowed
struct AHudCTeamDeathMatch_CustomHUDColorAllowed_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.HudCTeamDeathMatch.UpdateHUD
struct AHudCTeamDeathMatch_UpdateHUD_Params
{
};

// Function XInterface.HudCTeamDeathMatch.updateScore
struct AHudCTeamDeathMatch_updateScore_Params
{
};

// Function XInterface.HudCTeamDeathMatch.UpdateTeamHud
struct AHudCTeamDeathMatch_UpdateTeamHud_Params
{
};

// Function XInterface.HudCTeamDeathMatch.DrawHudPassC
struct AHudCTeamDeathMatch_DrawHudPassC_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCTeamDeathMatch.TeamScoreOffset
struct AHudCTeamDeathMatch_TeamScoreOffset_Params
{
};

// Function XInterface.HudCTeamDeathMatch.ShowTeamScorePassC
struct AHudCTeamDeathMatch_ShowTeamScorePassC_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCTeamDeathMatch.ShowVersusIcon
struct AHudCTeamDeathMatch_ShowVersusIcon_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCTeamDeathMatch.ShowTeamScorePassA
struct AHudCTeamDeathMatch_ShowTeamScorePassA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCTeamDeathMatch.DrawHudPassA
struct AHudCTeamDeathMatch_DrawHudPassA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCTeamDeathMatch.DrawMyScore
struct AHudCTeamDeathMatch_DrawMyScore_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCTeamDeathMatch.DrawTeamOverlay
struct AHudCTeamDeathMatch_DrawTeamOverlay_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCTeamDeathMatch.UpdateRankAndSpread
struct AHudCTeamDeathMatch_UpdateRankAndSpread_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCTeamDeathMatch.drawLinkText
struct AHudCTeamDeathMatch_drawLinkText_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.HudCTeamDeathMatch.showLinks
struct AHudCTeamDeathMatch_showLinks_Params
{
};

// Function XInterface.HudCTeamDeathMatch.Tick
struct AHudCTeamDeathMatch_Tick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function XInterface.HudCTeamDeathMatch.DrawSpectatingHud
struct AHudCTeamDeathMatch_DrawSpectatingHud_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayBase.UpdateHelpKeyControll
struct AwHudPart_DisplayBase_UpdateHelpKeyControll_Params
{
};

// Function XInterface.wHudPart_DisplayBase.GetEllipsString
struct AwHudPart_DisplayBase_GetEllipsString_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	string                                             strText;                                                  // (Parm, NeedCtorLink)
	float                                              fLimitWidth;                                              // (Parm)
	float                                              FontSize;                                                 // (Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.wHudPart_DisplayBase.GetKeyTexture
struct AwHudPart_DisplayBase_GetKeyTexture_Params
{
	string                                             sKey;                                                     // (Parm, NeedCtorLink)
	struct FSpriteWidget                               W;                                                        // (Parm, OutParm)
	float                                              fWidth;                                                   // (OptionalParm, Parm, OutParm)
	float                                              OffsetX;                                                  // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_DisplayBase.Initialize
struct AwHudPart_DisplayBase_Initialize_Params
{
	class AHudBase*                                    myOwner;                                                  // (Parm)
	class ALevelInfo*                                  Level;                                                    // (Parm)
};

// Function XInterface.wHudPart_SelectQSlot.DrawItemImage
struct AwHudPart_SelectQSlot_DrawItemImage_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_SelectQSlot.CalcQuickSlotTimer
struct AwHudPart_SelectQSlot_CalcQuickSlotTimer_Params
{
	int                                                respawnLeftTime;                                          // (Parm, OutParm)
	int                                                startupLeftTime;                                          // (Parm, OutParm)
};

// Function XInterface.wHudPart_SelectQSlot.GetItemImage
struct AwHudPart_SelectQSlot_GetItemImage_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iItemID;                                                  // (Parm)
	struct FImage                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_SelectQSlot.QuickSlotContent_SetString
struct AwHudPart_SelectQSlot_QuickSlotContent_SetString_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iPosX;                                                    // (Parm)
	int                                                iPosY;                                                    // (Parm)
	int                                                iSlot;                                                    // (Parm)
	bool                                               bDefaultWeapon;                                           // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_SelectQSlot.DrawQuickSlotContent_List
struct AwHudPart_SelectQSlot_DrawQuickSlotContent_List_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iPosX;                                                    // (Parm)
	int                                                iPosY;                                                    // (Parm)
	int                                                iSlot;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_SelectQSlot.DrawQuickSlotContent_DefaultWeapon
struct AwHudPart_SelectQSlot_DrawQuickSlotContent_DefaultWeapon_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iPosX;                                                    // (Parm)
	int                                                iPosY;                                                    // (Parm)
};

// Function XInterface.wHudPart_SelectQSlot.DrawQuickSlotContent_Description
struct AwHudPart_SelectQSlot_DrawQuickSlotContent_Description_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iPosX;                                                    // (Parm)
	int                                                iPosY;                                                    // (Parm)
};

// Function XInterface.wHudPart_SelectQSlot.DrawSellectBar
struct AwHudPart_SelectQSlot_DrawSellectBar_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iPosX;                                                    // (Parm)
	int                                                iPosY;                                                    // (Parm)
	bool                                               bDefaultWeapon;                                           // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_SelectQSlot.DrawQuickSlotName
struct AwHudPart_SelectQSlot_DrawQuickSlotName_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iPosX;                                                    // (Parm)
	int                                                iPosY;                                                    // (Parm)
	int                                                iSlot;                                                    // (Parm)
	bool                                               bDefaultWeapon;                                           // (OptionalParm, Parm)
	bool                                               bHasItem;                                                 // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_SelectQSlot.DrawQuickSlot
struct AwHudPart_SelectQSlot_DrawQuickSlot_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_SelectQSlot.DrawSelectQSlot
struct AwHudPart_SelectQSlot_DrawSelectQSlot_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_SelectQSlot.DrawA
struct AwHudPart_SelectQSlot_DrawA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_SelectQSlot.UpdateHelpKeyControll
struct AwHudPart_SelectQSlot_UpdateHelpKeyControll_Params
{
};

// Function XInterface.wHudPart_SelectQSlot.CallEvent
struct AwHudPart_SelectQSlot_CallEvent_Params
{
	bool                                               ItemCheck;                                                // (OptionalParm, Parm)
	int                                                iReservation1;                                            // (OptionalParm, Parm)
	int                                                iReservation2;                                            // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_SelectQSlot.CallSelectQuickSlot
struct AwHudPart_SelectQSlot_CallSelectQuickSlot_Params
{
	int                                                iIndex;                                                   // (Parm)
};

// Function XInterface.wHudPart_SelectQSlot.ToggleQuickSlotWindow
struct AwHudPart_SelectQSlot_ToggleQuickSlotWindow_Params
{
};

// Function XInterface.wHudPart_SelectQSlot.EndQuickSlotWindow
struct AwHudPart_SelectQSlot_EndQuickSlotWindow_Params
{
};

// Function XInterface.wHudPart_SelectQSlot.BeginQuickSlotWindow
struct AwHudPart_SelectQSlot_BeginQuickSlotWindow_Params
{
};

// Function XInterface.wHudPart_SelectQSlot.Initialize
struct AwHudPart_SelectQSlot_Initialize_Params
{
	class AHudBase*                                    myOwner;                                                  // (Parm)
	class ALevelInfo*                                  _level;                                                   // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.DrawDefenceIcon
struct AwHudPart_MinimapBase_DrawDefenceIcon_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class AwPawn*                                      P;                                                        // (Parm)
	float                                              minimapX;                                                 // (Parm)
	float                                              minimapY;                                                 // (Parm)
	bool                                               bDefenceBoss;                                             // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Enemies_Defence
struct AwHudPart_MinimapBase_DrawMinimap_Enemies_Defence_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.Draw
struct AwHudPart_MinimapBase_Draw_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.OnPreDrawMyself
struct AwHudPart_MinimapBase_OnPreDrawMyself_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.DrawMinimap_SpecialPositions
struct AwHudPart_MinimapBase_DrawMinimap_SpecialPositions_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Mission
struct AwHudPart_MinimapBase_DrawMinimap_Mission_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.DrawMinimap_SentryGun
struct AwHudPart_MinimapBase_DrawMinimap_SentryGun_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Airstrike
struct AwHudPart_MinimapBase_DrawMinimap_Airstrike_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Helicopter
struct AwHudPart_MinimapBase_DrawMinimap_Helicopter_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Deads
struct AwHudPart_MinimapBase_DrawMinimap_Deads_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Enemies
struct AwHudPart_MinimapBase_DrawMinimap_Enemies_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.IsEnemyInRange
struct AwHudPart_MinimapBase_IsEnemyInRange_Params
{
	struct FVector                                     loc;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Allies
struct AwHudPart_MinimapBase_DrawMinimap_Allies_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.IsSameTeamByIndex
struct AwHudPart_MinimapBase_IsSameTeamByIndex_Params
{
	int                                                Team1;                                                    // (Parm)
	int                                                Team2;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_MinimapBase.IsSameTeamByPRI
struct AwHudPart_MinimapBase_IsSameTeamByPRI_Params
{
	class APlayerReplicationInfo*                      pri1;                                                     // (Parm)
	class APlayerReplicationInfo*                      pri2;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_MinimapBase.PushDeadOnMinimap
struct AwHudPart_MinimapBase_PushDeadOnMinimap_Params
{
	int                                                TeamIndex;                                                // (Parm)
	struct FVector                                     Location;                                                 // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.CalcMinimapRotation
struct AwHudPart_MinimapBase_CalcMinimapRotation_Params
{
	struct FRotator                                    Rotation;                                                 // (Parm)
	struct FRotator                                    outRotation;                                              // (Parm, OutParm)
};

// Function XInterface.wHudPart_MinimapBase.SetupMinimapSpriteWidgetForDrawing
struct AwHudPart_MinimapBase_SetupMinimapSpriteWidgetForDrawing_Params
{
	struct FSpriteWidget                               Sprite;                                                   // (Parm, OutParm)
	struct FRotator                                    Rotation;                                                 // (Parm)
	float                                              minimapX;                                                 // (Parm)
	float                                              minimapY;                                                 // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.ClampMinimapPosition
struct AwHudPart_MinimapBase_ClampMinimapPosition_Params
{
	float                                              X;                                                        // (Parm, OutParm)
	float                                              Y;                                                        // (Parm, OutParm)
	float                                              W;                                                        // (OptionalParm, Parm)
	float                                              H;                                                        // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_MinimapBase.IsWithinMinimapArea
struct AwHudPart_MinimapBase_IsWithinMinimapArea_Params
{
	float                                              X;                                                        // (Parm)
	float                                              Y;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_MinimapBase.CalculateTexturePositionFromMinimapPosition
struct AwHudPart_MinimapBase_CalculateTexturePositionFromMinimapPosition_Params
{
	float                                              minimapX;                                                 // (Parm)
	float                                              minimapY;                                                 // (Parm)
	int                                                TX;                                                       // (Parm, OutParm)
	int                                                ty;                                                       // (Parm, OutParm)
};

// Function XInterface.wHudPart_MinimapBase.CalculateMinimapPosition
struct AwHudPart_MinimapBase_CalculateMinimapPosition_Params
{
	struct FVector                                     centerLoc;                                                // (Parm)
	struct FRotator                                    centerRotation;                                           // (Parm)
	struct FVector                                     TargetLoc;                                                // (Parm)
	float                                              minimapX;                                                 // (Parm, OutParm)
	float                                              minimapY;                                                 // (Parm, OutParm)
};

// Function XInterface.wHudPart_MinimapBase.CalculateMinimapPositionPawnCentering
struct AwHudPart_MinimapBase_CalculateMinimapPositionPawnCentering_Params
{
	class APawn*                                       centerPawn;                                               // (Parm)
	struct FVector                                     TargetLoc;                                                // (Parm)
	float                                              minimapX;                                                 // (Parm, OutParm)
	float                                              minimapY;                                                 // (Parm, OutParm)
};

// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Myself
struct AwHudPart_MinimapBase_DrawMinimap_Myself_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.getSelfIconScale
struct AwHudPart_MinimapBase_getSelfIconScale_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Compass
struct AwHudPart_MinimapBase_DrawMinimap_Compass_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.DrawMinimap_Frame
struct AwHudPart_MinimapBase_DrawMinimap_Frame_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.DrawMinimap_BGMapUAV
struct AwHudPart_MinimapBase_DrawMinimap_BGMapUAV_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.SetupBGMapUAV
struct AwHudPart_MinimapBase_SetupBGMapUAV_Params
{
};

// Function XInterface.wHudPart_MinimapBase.DrawMinimap_BGMap
struct AwHudPart_MinimapBase_DrawMinimap_BGMap_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.MapMinimapTextureLocationToWorldLocation
struct AwHudPart_MinimapBase_MapMinimapTextureLocationToWorldLocation_Params
{
	int                                                TX;                                                       // (Parm)
	int                                                ty;                                                       // (Parm)
	struct FVector                                     Location;                                                 // (Parm, OutParm)
};

// Function XInterface.wHudPart_MinimapBase.MapWorldLocationToMinimapTextureLocation
struct AwHudPart_MinimapBase_MapWorldLocationToMinimapTextureLocation_Params
{
	struct FVector                                     Location;                                                 // (Parm)
	int                                                cX;                                                       // (Parm, OutParm)
	int                                                cY;                                                       // (Parm, OutParm)
};

// Function XInterface.wHudPart_MinimapBase.DrawMinimap_NorthPole
struct AwHudPart_MinimapBase_DrawMinimap_NorthPole_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.RemoveSpecialPositions
struct AwHudPart_MinimapBase_RemoveSpecialPositions_Params
{
	class AActor*                                      act;                                                      // (Parm)
};

// Function XInterface.wHudPart_MinimapBase.CacheSpecialPositions
struct AwHudPart_MinimapBase_CacheSpecialPositions_Params
{
};

// Function XInterface.wHudPart_MinimapBase.Timer
struct AwHudPart_MinimapBase_Timer_Params
{
};

// Function XInterface.wHudPart_MinimapBase.InitializeCoords
struct AwHudPart_MinimapBase_InitializeCoords_Params
{
};

// Function XInterface.wHudPart_MinimapBase.GetPivotCoords
struct AwHudPart_MinimapBase_GetPivotCoords_Params
{
	struct FVector                                     it1;                                                      // (Parm, OutParm)
	struct FVector                                     iw1;                                                      // (Parm, OutParm)
	struct FVector                                     it2;                                                      // (Parm, OutParm)
	struct FVector                                     iw2;                                                      // (Parm, OutParm)
};

// Function XInterface.wHudPart_MinimapBase.Initialize
struct AwHudPart_MinimapBase_Initialize_Params
{
	class AHudBase*                                    myOwner;                                                  // (Parm)
	class ALevelInfo*                                  myLevel;                                                  // (Parm)
};

// Function XInterface.xScoreBoard.GetEllipsString
struct AxScoreBoard_GetEllipsString_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	string                                             strText;                                                  // (Parm, NeedCtorLink)
	float                                              fLimitWidth;                                              // (Parm)
	float                                              FontSize;                                                 // (Parm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.xScoreBoard.CalculateCoordinateDigit
struct AxScoreBoard_CalculateCoordinateDigit_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FDigitSet                                   W;                                                        // (Parm)
	struct FNumericWidget                              N;                                                        // (Parm)
	float                                              fWidth;                                                   // (Parm)
	float                                              fHeight;                                                  // (Parm)
	int                                                Index;                                                    // (Parm)
	struct FCalCoordsW                                 coordsW;                                                  // (Parm, OutParm)
};

// Function XInterface.xScoreBoard.CalculateCoordinate
struct AxScoreBoard_CalculateCoordinate_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FSpriteWidget                               W;                                                        // (Parm)
	float                                              fWidth;                                                   // (Parm)
	float                                              fHeight;                                                  // (Parm)
	struct FCalCoordsW                                 coordsW;                                                  // (Parm, OutParm)
};

// Function XInterface.xScoreBoardTeamGame.UpdateScoreBoard
struct AxScoreBoardTeamGame_UpdateScoreBoard_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawMiniMap
struct AxScoreBoardTeamGame_DrawMiniMap_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawScoreboard
struct AxScoreBoardTeamGame_DrawScoreboard_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawGMTeamListSection
struct AxScoreBoardTeamGame_DrawGMTeamListSection_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                lpTeam;                                                   // (Parm)
	class APlayerReplicationInfo*                      currPRI;                                                  // (Parm)
	int                                                memberCount;                                              // (Parm)
	float                                              beginX;                                                   // (Parm)
	float                                              beginY;                                                   // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawGMUserBoard
struct AxScoreBoardTeamGame_DrawGMUserBoard_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawTeamListBG_Mission
struct AxScoreBoardTeamGame_DrawTeamListBG_Mission_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawTeamListBG_Tut
struct AxScoreBoardTeamGame_DrawTeamListBG_Tut_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawTeamListBG_FFA
struct AxScoreBoardTeamGame_DrawTeamListBG_FFA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawTeamBG
struct AxScoreBoardTeamGame_DrawTeamBG_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawMap
struct AxScoreBoardTeamGame_DrawMap_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawMapName
struct AxScoreBoardTeamGame_DrawMapName_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.MissonComment
struct AxScoreBoardTeamGame_MissonComment_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              X1;                                                       // (Parm)
	float                                              Y1;                                                       // (Parm)
	float                                              X2;                                                       // (Parm)
	float                                              Y2;                                                       // (Parm)
	string                                             MN;                                                       // (Parm, NeedCtorLink)
};

// Function XInterface.xScoreBoardTeamGame.GetStringGoalScore
struct AxScoreBoardTeamGame_GetStringGoalScore_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.xScoreBoardTeamGame.DrawMissonComment
struct AxScoreBoardTeamGame_DrawMissonComment_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.GetStringPlayMode
struct AxScoreBoardTeamGame_GetStringPlayMode_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.xScoreBoardTeamGame.SetMissionInfo
struct AxScoreBoardTeamGame_SetMissionInfo_Params
{
};

// Function XInterface.xScoreBoardTeamGame.DrawTeamScoreAndTimer
struct AxScoreBoardTeamGame_DrawTeamScoreAndTimer_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                _iPosX;                                                   // (Parm)
	int                                                _iPosY;                                                   // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawRankingInfo_Text
struct AxScoreBoardTeamGame_DrawRankingInfo_Text_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APlayerReplicationInfo*                      currPRI;                                                  // (Parm)
	float                                              _iPosX;                                                   // (Parm)
	float                                              _iPosY;                                                   // (Parm)
	struct FColor                                      FontColor;                                                // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawRankingInfo_Mark
struct AxScoreBoardTeamGame_DrawRankingInfo_Mark_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APlayerReplicationInfo*                      currPRI;                                                  // (Parm)
	float                                              _iPosX;                                                   // (Parm)
	float                                              _iPosY;                                                   // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawRankingInfo
struct AxScoreBoardTeamGame_DrawRankingInfo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APlayerReplicationInfo*                      currPRI;                                                  // (Parm)
	float                                              _iPosX;                                                   // (Parm)
	float                                              _iPosY;                                                   // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawFFAScore
struct AxScoreBoardTeamGame_DrawFFAScore_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              _iPosX;                                                   // (Parm)
	float                                              _iPosY;                                                   // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawGameInfo
struct AxScoreBoardTeamGame_DrawGameInfo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.RankingSorting
struct AxScoreBoardTeamGame_RankingSorting_Params
{
	class APlayerReplicationInfo*[]                    pris;                                                     // (Parm, OutParm, NeedCtorLink)
	int                                                iCurrent;                                                 // (Parm)
	int                                                iNext;                                                    // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawTeamListSection
struct AxScoreBoardTeamGame_DrawTeamListSection_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawPersonListSection_C
struct AxScoreBoardTeamGame_DrawPersonListSection_C_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                lpTeam;                                                   // (Parm)
	class APlayerReplicationInfo*                      currPRI;                                                  // (Parm)
	int                                                memberCount;                                              // (Parm)
	string                                             HostName;                                                 // (Parm, NeedCtorLink)
	float                                              beginY;                                                   // (Parm)
	float                                              markBeginY;                                               // (Parm)
	float                                              markPingY;                                                // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawTeamListSection_C
struct AxScoreBoardTeamGame_DrawTeamListSection_C_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                lpTeam;                                                   // (Parm)
	class APlayerReplicationInfo*                      currPRI;                                                  // (Parm)
	int                                                memberCount;                                              // (Parm)
	string                                             HostName;                                                 // (Parm, NeedCtorLink)
	float                                              beginY;                                                   // (Parm)
	float                                              markBeginY;                                               // (Parm)
	float                                              markPingY;                                                // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawTeamListSectionStripe
struct AxScoreBoardTeamGame_DrawTeamListSectionStripe_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              OffsetY;                                                  // (Parm)
	int                                                iTeamUserMax;                                             // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawTime
struct AxScoreBoardTeamGame_DrawTime_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawTextTeamScore
struct AxScoreBoardTeamGame_DrawTextTeamScore_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              _OffSetX;                                                 // (Parm)
	float                                              _OffSetY;                                                 // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawContentDescriptionTeam
struct AxScoreBoardTeamGame_DrawContentDescriptionTeam_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              _OffSetX;                                                 // (Parm)
	float                                              _OffSetY;                                                 // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawContentDescription
struct AxScoreBoardTeamGame_DrawContentDescription_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              _OffSetX;                                                 // (Parm)
	float                                              _OffSetY;                                                 // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawBGS
struct AxScoreBoardTeamGame_DrawBGS_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.SetAttackingTeam
struct AxScoreBoardTeamGame_SetAttackingTeam_Params
{
	int                                                Index;                                                    // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.DrawMinimap_GameMode
struct AxScoreBoardTeamGame_DrawMinimap_GameMode_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTeamGame.PostBeginPlay
struct AxScoreBoardTeamGame_PostBeginPlay_Params
{
};

// Function XInterface.xScoreBoardTeamGame.GetHudBaseOwner
struct AxScoreBoardTeamGame_GetHudBaseOwner_Params
{
	class AHudBase*                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.ScoreBoardDeathMatch.DrawNetInfo
struct AScoreBoardDeathMatch_DrawNetInfo_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	int                                                FontReduction;                                            // (Parm)
	int                                                HeaderOffsetY;                                            // (Parm)
	int                                                PlayerBoxSizeY;                                           // (Parm)
	int                                                BoxSpaceY;                                                // (Parm)
	int                                                BoxTextOffsetY;                                           // (Parm)
	int                                                OwnerOffset;                                              // (Parm)
	int                                                PlayerCount;                                              // (Parm)
	int                                                NetXPos;                                                  // (Parm)
};

// Function XInterface.ScoreBoardDeathMatch.DrawMatchID
struct AScoreBoardDeathMatch_DrawMatchID_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	int                                                FontReduction;                                            // (Parm)
};

// Function XInterface.ScoreBoardDeathMatch.UpdateScoreBoard
struct AScoreBoardDeathMatch_UpdateScoreBoard_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
};

// Function XInterface.ScoreBoardDeathMatch.ExtraMarking
struct AScoreBoardDeathMatch_ExtraMarking_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	int                                                PlayerCount;                                              // (Parm)
	int                                                OwnerOffset;                                              // (Parm)
	int                                                XPos;                                                     // (Parm)
	int                                                YPos;                                                     // (Parm)
	int                                                YOffset;                                                  // (Parm)
};

// Function XInterface.ScoreBoardDeathMatch.GetDefaultScoreInfoString
struct AScoreBoardDeathMatch_GetDefaultScoreInfoString_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.ScoreBoardDeathMatch.GetRestartString
struct AScoreBoardDeathMatch_GetRestartString_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.ScoreBoardDeathMatch.GetTitleString
struct AScoreBoardDeathMatch_GetTitleString_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.ScoreBoardDeathMatch.DrawTitle
struct AScoreBoardDeathMatch_DrawTitle_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              HeaderOffsetY;                                            // (Parm)
	float                                              PlayerAreaY;                                              // (Parm)
	float                                              PlayerBoxSizeY;                                           // (Parm)
};

// Function XInterface.ScoreBoardDeathMatch.UpdatePrecacheFonts
struct AScoreBoardDeathMatch_UpdatePrecacheFonts_Params
{
};

// Function XInterface.ScoreBoardDeathMatch.UpdatePrecacheMaterials
struct AScoreBoardDeathMatch_UpdatePrecacheMaterials_Params
{
};

// Function XInterface.wHudPart_Tutorial.DrawQuestComplete
struct AwHudPart_Tutorial_DrawQuestComplete_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Tutorial.DrawQuest
struct AwHudPart_Tutorial_DrawQuest_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Tutorial.DrawSpectatingHud
struct AwHudPart_Tutorial_DrawSpectatingHud_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Tutorial.DrawHudPassA
struct AwHudPart_Tutorial_DrawHudPassA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Tutorial.UpdateHelpKeyControll
struct AwHudPart_Tutorial_UpdateHelpKeyControll_Params
{
};

// Function XInterface.wHudPart_Tutorial.Initialize
struct AwHudPart_Tutorial_Initialize_Params
{
	class AHudBase*                                    myOwner;                                                  // (Parm)
	class ALevelInfo*                                  Level;                                                    // (Parm)
};

// Function XInterface.wHudPart_Tutorial.CallEvent
struct AwHudPart_Tutorial_CallEvent_Params
{
	bool                                               ItemCheck;                                                // (OptionalParm, Parm)
	int                                                iReservation1;                                            // (OptionalParm, Parm)
	int                                                iReservation2;                                            // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_Tutorial.PlaySoundQuestEnd
struct AwHudPart_Tutorial_PlaySoundQuestEnd_Params
{
};

// Function XInterface.wHudPart_Tutorial.PlaySoundQuest
struct AwHudPart_Tutorial_PlaySoundQuest_Params
{
};

// Function XInterface.wHudPart_Tutorial.OnNextQuest
struct AwHudPart_Tutorial_OnNextQuest_Params
{
};

// Function XInterface.wHudPart_Tutorial.OnBeginTutorial
struct AwHudPart_Tutorial_OnBeginTutorial_Params
{
};

// Function XInterface.wHudPart_Tutorial.OnCompleteQuest
struct AwHudPart_Tutorial_OnCompleteQuest_Params
{
};

// Function XInterface.wHudPart_Tutorial.OnBeginQuest
struct AwHudPart_Tutorial_OnBeginQuest_Params
{
};

// Function XInterface.wHudPart_Tutorial.OnEndMessage
struct AwHudPart_Tutorial_OnEndMessage_Params
{
};

// Function XInterface.wHudPart_Tutorial.OnBeginMessage
struct AwHudPart_Tutorial_OnBeginMessage_Params
{
};

// Function XInterface.wHudPart_Tutorial.OnPickUpHealthPack
struct AwHudPart_Tutorial_OnPickUpHealthPack_Params
{
};

// Function XInterface.wHudPart_Tutorial.OnKillAim
struct AwHudPart_Tutorial_OnKillAim_Params
{
};

// Function XInterface.wHudPart_Tutorial.OnRunSprint
struct AwHudPart_Tutorial_OnRunSprint_Params
{
	int                                                iSec;                                                     // (Parm)
};

// Function XInterface.wHudPart_Tutorial.OnKillGrenade
struct AwHudPart_Tutorial_OnKillGrenade_Params
{
};

// Function XInterface.wHudPart_Tutorial.OnMeleeAttack
struct AwHudPart_Tutorial_OnMeleeAttack_Params
{
};

// Function XInterface.wHudPart_Tutorial.OnKill3Enemy
struct AwHudPart_Tutorial_OnKill3Enemy_Params
{
};

// Function XInterface.wHudPart_Tutorial2.DrawBeginTutorial
struct AwHudPart_Tutorial2_DrawBeginTutorial_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Tutorial2.DrawQuestComplete
struct AwHudPart_Tutorial2_DrawQuestComplete_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Tutorial2.DrawQuest
struct AwHudPart_Tutorial2_DrawQuest_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Tutorial2.DrawNoticeExit
struct AwHudPart_Tutorial2_DrawNoticeExit_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Tutorial2.DrawBattleAIBot
struct AwHudPart_Tutorial2_DrawBattleAIBot_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Tutorial2.GetValueScaleUp
struct AwHudPart_Tutorial2_GetValueScaleUp_Params
{
	float                                              fStartScale;                                              // (Parm)
	float                                              fDestScale;                                               // (Parm)
	float                                              fDrawTime;                                                // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_Tutorial2.GetValueScaleDown
struct AwHudPart_Tutorial2_GetValueScaleDown_Params
{
	float                                              fStartScale;                                              // (Parm)
	float                                              fDestScale;                                               // (Parm)
	float                                              fDrawTime;                                                // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_Tutorial2.DrawGiftItemT
struct AwHudPart_Tutorial2_DrawGiftItemT_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Tutorial2.DrawGiftItem
struct AwHudPart_Tutorial2_DrawGiftItem_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Tutorial2.DrawSpectatingHud
struct AwHudPart_Tutorial2_DrawSpectatingHud_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Tutorial2.DrawHudPassA
struct AwHudPart_Tutorial2_DrawHudPassA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Tutorial2.DrawTestGrade
struct AwHudPart_Tutorial2_DrawTestGrade_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Tutorial2.CalcBotBattleGrade
struct AwHudPart_Tutorial2_CalcBotBattleGrade_Params
{
};

// Function XInterface.wHudPart_Tutorial2.CalcGrenadeGrade
struct AwHudPart_Tutorial2_CalcGrenadeGrade_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_Tutorial2.CalcShootingGrade
struct AwHudPart_Tutorial2_CalcShootingGrade_Params
{
};

// Function XInterface.wHudPart_Tutorial2.CalcAdvancedMovementGrade
struct AwHudPart_Tutorial2_CalcAdvancedMovementGrade_Params
{
};

// Function XInterface.wHudPart_Tutorial2.CalcBasicMovementGrade
struct AwHudPart_Tutorial2_CalcBasicMovementGrade_Params
{
};

// Function XInterface.wHudPart_Tutorial2.Trigger
struct AwHudPart_Tutorial2_Trigger_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
};

// Function XInterface.wHudPart_Tutorial2.CallEvent
struct AwHudPart_Tutorial2_CallEvent_Params
{
	bool                                               ItemCheck;                                                // (OptionalParm, Parm)
	int                                                iReservation1;                                            // (OptionalParm, Parm)
	int                                                iReservation2;                                            // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_Tutorial2.Movelength
struct AwHudPart_Tutorial2_Movelength_Params
{
	struct FVector                                     vLocation;                                                // (Parm)
};

// Function XInterface.wHudPart_Tutorial2.EnableShootTarget
struct AwHudPart_Tutorial2_EnableShootTarget_Params
{
	FName                                              eventTag;                                                 // (Parm)
};

// Function XInterface.wHudPart_Tutorial2.GotoTutorial
struct AwHudPart_Tutorial2_GotoTutorial_Params
{
	int                                                iQuestID;                                                 // (Parm)
};

// Function XInterface.wHudPart_Tutorial2.CheckStartTutorial
struct AwHudPart_Tutorial2_CheckStartTutorial_Params
{
};

// Function XInterface.wHudPart_Tutorial2.BeginDrawItem
struct AwHudPart_Tutorial2_BeginDrawItem_Params
{
};

// Function XInterface.wHudPart_Tutorial2.OnBeginTutorial
struct AwHudPart_Tutorial2_OnBeginTutorial_Params
{
};

// Function XInterface.wHudPart_Tutorial2.ResetProgress
struct AwHudPart_Tutorial2_ResetProgress_Params
{
};

// Function XInterface.wHudPart_Tutorial2.Initialize
struct AwHudPart_Tutorial2_Initialize_Params
{
	class AHudBase*                                    myOwner;                                                  // (Parm)
	class ALevelInfo*                                  Level;                                                    // (Parm)
};

// Function XInterface.wHudPart_Tutorial2.EnableTriggerEvent
struct AwHudPart_Tutorial2_EnableTriggerEvent_Params
{
	FName                                              EventName;                                                // (Parm)
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
	class AMover*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_Tutorial2.DisableTriggerEvent
struct AwHudPart_Tutorial2_DisableTriggerEvent_Params
{
	FName                                              EventName;                                                // (Parm)
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
	class AMover*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_Tutorial2.TutorialEvent
struct AwHudPart_Tutorial2_TutorialEvent_Params
{
	string                                             S;                                                        // (Parm, CoerceParm, NeedCtorLink)
	FName                                              Type;                                                     // (OptionalParm, Parm)
	FName                                              reserv;                                                   // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_Tutorial2.OnTutorialResult
struct AwHudPart_Tutorial2_OnTutorialResult_Params
{
	int                                                iTutorialID;                                              // (Parm)
	int                                                iCurrent;                                                 // (Parm)
	bool                                               bCompleted;                                               // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_Tutorial2.OnQuest
struct AwHudPart_Tutorial2_OnQuest_Params
{
};

// Function XInterface.xScoreBoardTutorial.DrawTeamListSection_C
struct AxScoreBoardTutorial_DrawTeamListSection_C_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                lpCount;                                                  // (Parm)
	class APlayerReplicationInfo*                      currPRI;                                                  // (Parm)
	int                                                lpQuestNumber;                                            // (Parm)
	string                                             HostName;                                                 // (Parm, NeedCtorLink)
	float                                              beginY;                                                   // (Parm)
	float                                              markBeginY;                                               // (Parm)
	float                                              markPingY;                                                // (Parm)
};

// Function XInterface.xScoreBoardTutorial.DrawTeamListSection
struct AxScoreBoardTutorial_DrawTeamListSection_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTutorial.DrawContentDescription
struct AxScoreBoardTutorial_DrawContentDescription_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              _OffSetX;                                                 // (Parm)
	float                                              _OffSetY;                                                 // (Parm)
};

// Function XInterface.xScoreBoardTutorial.DrawTeamBG
struct AxScoreBoardTutorial_DrawTeamBG_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTutorial.DrawMiniMap
struct AxScoreBoardTutorial_DrawMiniMap_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTutorial.DrawScoreboard
struct AxScoreBoardTutorial_DrawScoreboard_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.xScoreBoardTutorial.OnTutorialResult
struct AxScoreBoardTutorial_OnTutorialResult_Params
{
	int                                                iTutorialID;                                              // (Parm)
	int                                                iCurrent;                                                 // (Parm)
	bool                                               bCompleted;                                               // (OptionalParm, Parm)
};

// Function XInterface.xScoreBoardTutorial.PushTutorialList
struct AxScoreBoardTutorial_PushTutorialList_Params
{
};

// Function XInterface.xScoreBoardTutorial.PostBeginPlay
struct AxScoreBoardTutorial_PostBeginPlay_Params
{
};

// Function XInterface.wHudPart_SelectQSlotCN.DrawItemImage
struct AwHudPart_SelectQSlotCN_DrawItemImage_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_SelectQSlotCN.GetItemImage
struct AwHudPart_SelectQSlotCN_GetItemImage_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iItemID;                                                  // (Parm)
	struct FImage                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_SelectQSlotCN.QuickSlotContent_SetString
struct AwHudPart_SelectQSlotCN_QuickSlotContent_SetString_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iPosX;                                                    // (Parm)
	int                                                iPosY;                                                    // (Parm)
	int                                                iSlot;                                                    // (Parm)
	bool                                               bDefaultWeapon;                                           // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_SelectQSlotCN.DrawQuickSlotContent_List
struct AwHudPart_SelectQSlotCN_DrawQuickSlotContent_List_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iPosX;                                                    // (Parm)
	int                                                iPosY;                                                    // (Parm)
	int                                                iSlot;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_SelectQSlotCN.DrawQuickSlotContent_DefaultWeapon
struct AwHudPart_SelectQSlotCN_DrawQuickSlotContent_DefaultWeapon_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iPosX;                                                    // (Parm)
	int                                                iPosY;                                                    // (Parm)
};

// Function XInterface.wHudPart_SelectQSlotCN.DrawQuickSlotContent_Description
struct AwHudPart_SelectQSlotCN_DrawQuickSlotContent_Description_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iPosX;                                                    // (Parm)
	int                                                iPosY;                                                    // (Parm)
};

// Function XInterface.wHudPart_SelectQSlotCN.DrawSellectBar
struct AwHudPart_SelectQSlotCN_DrawSellectBar_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iPosX;                                                    // (Parm)
	int                                                iPosY;                                                    // (Parm)
	bool                                               bDefaultWeapon;                                           // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_SelectQSlotCN.DrawQuickSlotName
struct AwHudPart_SelectQSlotCN_DrawQuickSlotName_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iPosX;                                                    // (Parm)
	int                                                iPosY;                                                    // (Parm)
	int                                                iSlot;                                                    // (Parm)
	bool                                               bDefaultWeapon;                                           // (OptionalParm, Parm)
	bool                                               bHasItem;                                                 // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_SelectQSlotCN.DrawQuickSlot
struct AwHudPart_SelectQSlotCN_DrawQuickSlot_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_SelectQSlotCN.DrawSelectQSlot
struct AwHudPart_SelectQSlotCN_DrawSelectQSlot_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_SelectQSlotCN.DrawA
struct AwHudPart_SelectQSlotCN_DrawA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_SelectQSlotCN.UpdateHelpKeyControll
struct AwHudPart_SelectQSlotCN_UpdateHelpKeyControll_Params
{
};

// Function XInterface.wHudPart_SelectQSlotCN.CallEvent
struct AwHudPart_SelectQSlotCN_CallEvent_Params
{
	bool                                               ItemCheck;                                                // (OptionalParm, Parm)
	int                                                iReservation1;                                            // (OptionalParm, Parm)
	int                                                iReservation2;                                            // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_SelectQSlotCN.CallSelectQuickSlot
struct AwHudPart_SelectQSlotCN_CallSelectQuickSlot_Params
{
	int                                                iIndex;                                                   // (Parm)
};

// Function XInterface.wHudPart_SelectQSlotCN.ToggleQuickSlotWindow
struct AwHudPart_SelectQSlotCN_ToggleQuickSlotWindow_Params
{
};

// Function XInterface.wHudPart_SelectQSlotCN.EndQuickSlotWindow
struct AwHudPart_SelectQSlotCN_EndQuickSlotWindow_Params
{
};

// Function XInterface.wHudPart_SelectQSlotCN.BeginQuickSlotWindow
struct AwHudPart_SelectQSlotCN_BeginQuickSlotWindow_Params
{
};

// Function XInterface.wHudPart_SelectQSlotCN.Initialize
struct AwHudPart_SelectQSlotCN_Initialize_Params
{
	class AHudBase*                                    myOwner;                                                  // (Parm)
	class ALevelInfo*                                  _level;                                                   // (Parm)
};

// Function XInterface.wHudPart_Bigmap.DrawMinimap_BGMapUAV
struct AwHudPart_Bigmap_DrawMinimap_BGMapUAV_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Bigmap.DrawMinimap_SpecialPositions
struct AwHudPart_Bigmap_DrawMinimap_SpecialPositions_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Bigmap.DrawMinimap_Airstrike
struct AwHudPart_Bigmap_DrawMinimap_Airstrike_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Bigmap.DrawMinimap_Helicopter
struct AwHudPart_Bigmap_DrawMinimap_Helicopter_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Bigmap.DrawMinimap_Deads
struct AwHudPart_Bigmap_DrawMinimap_Deads_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Bigmap.DrawMinimap_Enemies
struct AwHudPart_Bigmap_DrawMinimap_Enemies_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Bigmap.DrawMinimap_Allies
struct AwHudPart_Bigmap_DrawMinimap_Allies_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Bigmap.CalculateTexturePositionFromMinimapPosition
struct AwHudPart_Bigmap_CalculateTexturePositionFromMinimapPosition_Params
{
	float                                              minimapX;                                                 // (Parm)
	float                                              minimapY;                                                 // (Parm)
	int                                                TX;                                                       // (Parm, OutParm)
	int                                                ty;                                                       // (Parm, OutParm)
};

// Function XInterface.wHudPart_Bigmap.CalculateMinimapPosition
struct AwHudPart_Bigmap_CalculateMinimapPosition_Params
{
	struct FVector                                     centerLoc;                                                // (Parm)
	struct FRotator                                    centerRotation;                                           // (Parm)
	struct FVector                                     TargetLoc;                                                // (Parm)
	float                                              minimapX;                                                 // (Parm, OutParm)
	float                                              minimapY;                                                 // (Parm, OutParm)
};

// Function XInterface.wHudPart_Bigmap.SetupMinimapSpriteWidgetForDrawing
struct AwHudPart_Bigmap_SetupMinimapSpriteWidgetForDrawing_Params
{
	struct FSpriteWidget                               Sprite;                                                   // (Parm, OutParm)
	struct FRotator                                    Rotation;                                                 // (Parm)
	float                                              minimapX;                                                 // (Parm)
	float                                              minimapY;                                                 // (Parm)
};

// Function XInterface.wHudPart_Bigmap.DrawMinimap_Myself
struct AwHudPart_Bigmap_DrawMinimap_Myself_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Bigmap.SetupBGMapUAV
struct AwHudPart_Bigmap_SetupBGMapUAV_Params
{
};

// Function XInterface.wHudPart_Bigmap.DrawMinimap_BGMap
struct AwHudPart_Bigmap_DrawMinimap_BGMap_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Bigmap.Draw
struct AwHudPart_Bigmap_Draw_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_Bigmap.GetPivotCoords
struct AwHudPart_Bigmap_GetPivotCoords_Params
{
	struct FVector                                     it1;                                                      // (Parm, OutParm)
	struct FVector                                     iw1;                                                      // (Parm, OutParm)
	struct FVector                                     it2;                                                      // (Parm, OutParm)
	struct FVector                                     iw2;                                                      // (Parm, OutParm)
};

// Function XInterface.wHudPart_Bigmap.Initialize
struct AwHudPart_Bigmap_Initialize_Params
{
	class AHudBase*                                    myOwner;                                                  // (Parm)
	class ALevelInfo*                                  myLevel;                                                  // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawEventString
struct AwHudPart_DisplayEvent_DrawEventString_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              StartTime;                                                // (Parm)
	string                                             strHead;                                                  // (Parm, NeedCtorLink)
	struct FColor                                      headColor;                                                // (Parm)
	string                                             strDesc;                                                  // (Parm, NeedCtorLink)
	string                                             strKey;                                                   // (Parm, NeedCtorLink)
};

// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_NotReady
struct AwHudPart_DisplayEvent_DisplayEvent_Skill_NotReady_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                SkillID;                                                  // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMessage_SentryGun_Installing
struct AwHudPart_DisplayEvent_DrawMessage_SentryGun_Installing_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FSpriteWidget                               WMessage;                                                 // (Parm)
	float                                              ProgressPct;                                              // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMessageConnectionInstability
struct AwHudPart_DisplayEvent_DrawMessageConnectionInstability_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.ConnectionInstability
struct AwHudPart_DisplayEvent_ConnectionInstability_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.SetTimeConnectionInstability
struct AwHudPart_DisplayEvent_SetTimeConnectionInstability_Params
{
	bool                                               bSet;                                                     // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawAAS
struct AwHudPart_DisplayEvent_DrawAAS_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	string                                             sAASNotice;                                               // (Parm, NeedCtorLink)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMoveGameNotice
struct AwHudPart_DisplayEvent_DrawMoveGameNotice_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	string                                             sGameNotice;                                              // (Parm, NeedCtorLink)
	float                                              fLifeTime;                                                // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawGameNotice
struct AwHudPart_DisplayEvent_DrawGameNotice_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	string                                             sGameNotice;                                              // (Parm, NeedCtorLink)
};

// Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_FFA
struct AwHudPart_DisplayEvent_GetMessageGameMode_FFA_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_SBT
struct AwHudPart_DisplayEvent_GetMessageGameMode_SBT_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_SD
struct AwHudPart_DisplayEvent_GetMessageGameMode_SD_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_DOA
struct AwHudPart_DisplayEvent_GetMessageGameMode_DOA_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.wHudPart_DisplayEvent.SetMessageGameMode_DOM
struct AwHudPart_DisplayEvent_SetMessageGameMode_DOM_Params
{
	class UMaterial*                                   matA;                                                     // (Parm)
	class UMaterial*                                   matB;                                                     // (Parm)
	class UMaterial*                                   matC;                                                     // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_DOM
struct AwHudPart_DisplayEvent_GetMessageGameMode_DOM_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode_TD
struct AwHudPart_DisplayEvent_GetMessageGameMode_TD_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.wHudPart_DisplayEvent.GetMessageGameMode
struct AwHudPart_DisplayEvent_GetMessageGameMode_Params
{
	class UMaterial*                                   mat;                                                      // (OptionalParm, Parm, OutParm)
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_SetDrawGameMessage
struct AwHudPart_DisplayEvent_DisplayEvent_SetDrawGameMessage_Params
{
	bool                                               bMode;                                                    // (Parm)
	bool                                               bSystem;                                                  // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawGameMode
struct AwHudPart_DisplayEvent_DrawGameMode_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.SetBombObjectIndex
struct AwHudPart_DisplayEvent_SetBombObjectIndex_Params
{
	int                                                objectIndex;                                              // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_GameMode
struct AwHudPart_DisplayEvent_DisplayEvent_GameMode_Params
{
	string                                             Message;                                                  // (Parm, NeedCtorLink)
};

// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_BattleExplain
struct AwHudPart_DisplayEvent_DisplayEvent_BattleExplain_Params
{
};

// Function XInterface.wHudPart_DisplayEvent.DrawPlusPoint_Defence
struct AwHudPart_DisplayEvent_DrawPlusPoint_Defence_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iPoint;                                                   // (Parm)
	int                                                iPosX;                                                    // (Parm)
	int                                                iPosY;                                                    // (Parm)
	int                                                iEffectState;                                             // (OptionalParm, Parm)
	float                                              fScale;                                                   // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawPlusPoint
struct AwHudPart_DisplayEvent_DrawPlusPoint_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iPoint;                                                   // (Parm)
	int                                                iPosX;                                                    // (Parm)
	int                                                iPosY;                                                    // (Parm)
	int                                                iAlpha;                                                   // (Parm)
	int                                                iEffectState;                                             // (OptionalParm, Parm)
	float                                              fScale;                                                   // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_GainPoint
struct AwHudPart_DisplayEvent_DisplayEvent_GainPoint_Params
{
	int                                                iPoint;                                                   // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawSudenDeath
struct AwHudPart_DisplayEvent_DrawSudenDeath_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DisPlayEvent_SudenDeath
struct AwHudPart_DisplayEvent_DisPlayEvent_SudenDeath_Params
{
};

// Function XInterface.wHudPart_DisplayEvent.DrawHostChange
struct AwHudPart_DisplayEvent_DrawHostChange_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMessageRechargeAmmo
struct AwHudPart_DisplayEvent_DrawMessageRechargeAmmo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawWarningWeaponInfo
struct AwHudPart_DisplayEvent_DrawWarningWeaponInfo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.ResetState
struct AwHudPart_DisplayEvent_ResetState_Params
{
};

// Function XInterface.wHudPart_DisplayEvent.DrawVehicleInfo
struct AwHudPart_DisplayEvent_DrawVehicleInfo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawWeaponChange
struct AwHudPart_DisplayEvent_DrawWeaponChange_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawTileByMaterial
struct AwHudPart_DisplayEvent_DrawTileByMaterial_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class UMaterial*                                   mat;                                                      // (Parm)
	int                                                iAlpha;                                                   // (Parm)
	float                                              fUL;                                                      // (Parm)
	float                                              fVL;                                                      // (Parm)
	float                                              fScale;                                                   // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMessage_BeginMission
struct AwHudPart_DisplayEvent_DrawMessage_BeginMission_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iRound;                                                   // (Parm)
	bool                                               bChangeAttackTeam;                                        // (Parm)
	int                                                iAttackTeam;                                              // (Parm)
	int                                                iElapsedTime;                                             // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawResultScore_FFA
struct AwHudPart_DisplayEvent_DrawResultScore_FFA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawResultScore_FFA_Item
struct AwHudPart_DisplayEvent_DrawResultScore_FFA_Item_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               drawTop;                                                  // (Parm)
	class APlayerReplicationInfo*                      currPRI;                                                  // (Parm)
	class UwMatchUserInfo*                             User;                                                     // (Parm)
	int                                                lh;                                                       // (Parm)
	int                                                currLH;                                                   // (Parm)
	int                                                nextLH;                                                   // (Parm)
	class UMaterial*                                   medalMat;                                                 // (Parm)
	int                                                Rank;                                                     // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawResultScore_AlienMdoe
struct AwHudPart_DisplayEvent_DrawResultScore_AlienMdoe_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               bAlienTeamWin;                                            // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawResultScore
struct AwHudPart_DisplayEvent_DrawResultScore_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               Won;                                                      // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawTeamScoreUseImage
struct AwHudPart_DisplayEvent_DrawTeamScoreUseImage_Params
{
};

// Function XInterface.wHudPart_DisplayEvent.DrawSpectating
struct AwHudPart_DisplayEvent_DrawSpectating_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawA
struct AwHudPart_DisplayEvent_DrawA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawTimerBomb
struct AwHudPart_DisplayEvent_DrawTimerBomb_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                Min;                                                      // (Parm)
	int                                                sec;                                                      // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawRankingInfo_Text
struct AwHudPart_DisplayEvent_DrawRankingInfo_Text_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APlayerReplicationInfo*                      currPRI;                                                  // (Parm)
	float                                              _iPosX;                                                   // (Parm)
	float                                              _iPosY;                                                   // (Parm)
	struct FColor                                      FontColor;                                                // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawRankingInfo_Mark
struct AwHudPart_DisplayEvent_DrawRankingInfo_Mark_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APlayerReplicationInfo*                      currPRI;                                                  // (Parm)
	float                                              _iPosX;                                                   // (Parm)
	float                                              _iPosY;                                                   // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawRankingInfo
struct AwHudPart_DisplayEvent_DrawRankingInfo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APlayerReplicationInfo*                      currPRI;                                                  // (Parm)
	float                                              _iPosX;                                                   // (Parm)
	float                                              _iPosY;                                                   // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawDFRankingInfo
struct AwHudPart_DisplayEvent_DrawDFRankingInfo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	float                                              iPosX;                                                    // (Parm)
	float                                              iPosY;                                                    // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawDFScore
struct AwHudPart_DisplayEvent_DrawDFScore_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawFFAScore
struct AwHudPart_DisplayEvent_DrawFFAScore_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DFRankingSorting
struct AwHudPart_DisplayEvent_DFRankingSorting_Params
{
};

// Function XInterface.wHudPart_DisplayEvent.FFARankingSorting
struct AwHudPart_DisplayEvent_FFARankingSorting_Params
{
};

// Function XInterface.wHudPart_DisplayEvent.SortPRIArray
struct AwHudPart_DisplayEvent_SortPRIArray_Params
{
};

// Function XInterface.wHudPart_DisplayEvent.InOrder
struct AwHudPart_DisplayEvent_InOrder_Params
{
	class APlayerReplicationInfo*                      P1;                                                       // (Parm)
	class APlayerReplicationInfo*                      P2;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawAlienModeDigits
struct AwHudPart_DisplayEvent_DrawAlienModeDigits_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iValue;                                                   // (Parm)
	int                                                _iPosX;                                                   // (Parm)
	int                                                _iPosY;                                                   // (Parm)
	struct FCalCoordsW                                 calW;                                                     // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawAlienModeScore
struct AwHudPart_DisplayEvent_DrawAlienModeScore_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMainScoreTeam
struct AwHudPart_DisplayEvent_DrawMainScoreTeam_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iScoreAF;                                                 // (Parm)
	int                                                iScoreRSA;                                                // (Parm)
	int                                                _iPosX;                                                   // (Parm)
	int                                                _iPosY;                                                   // (Parm)
	struct FCalCoordsW                                 calW;                                                     // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawRemaingTime
struct AwHudPart_DisplayEvent_DrawRemaingTime_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                _iPosX;                                                   // (Parm)
	int                                                _iPosY;                                                   // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMainScore
struct AwHudPart_DisplayEvent_DrawMainScore_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMainTimer
struct AwHudPart_DisplayEvent_DrawMainTimer_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawRoundResult
struct AwHudPart_DisplayEvent_DrawRoundResult_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                ScoringTeam;                                              // (Parm)
	int                                                iMyTeam;                                                  // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DisplayRoundResult
struct AwHudPart_DisplayEvent_DisplayRoundResult_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                ScoringTeam;                                              // (Parm)
	int                                                iMyTeam;                                                  // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DisplayMessaage_Round
struct AwHudPart_DisplayEvent_DisplayMessaage_Round_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iAttackTeam;                                              // (Parm)
	int                                                iAlpha;                                                   // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DisplayMessage_Mission
struct AwHudPart_DisplayEvent_DisplayMessage_Mission_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iAttackTeam;                                              // (Parm)
	int                                                iAlpha;                                                   // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DisplayMessage_Mission_Intrusion
struct AwHudPart_DisplayEvent_DisplayMessage_Mission_Intrusion_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iAttackTeam;                                              // (Parm)
	int                                                iRound;                                                   // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawCountDown
struct AwHudPart_DisplayEvent_DrawCountDown_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iCount;                                                   // (Parm, CoerceParm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMessage_Waiting
struct AwHudPart_DisplayEvent_DrawMessage_Waiting_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMessage_WaitingCountGM
struct AwHudPart_DisplayEvent_DrawMessage_WaitingCountGM_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMessage_StartDefence
struct AwHudPart_DisplayEvent_DrawMessage_StartDefence_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMessage_Start
struct AwHudPart_DisplayEvent_DrawMessage_Start_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMessage_Go
struct AwHudPart_DisplayEvent_DrawMessage_Go_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawEffect
struct AwHudPart_DisplayEvent_DrawEffect_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              StartTime;                                                // (Parm)
	int                                                iAlpha;                                                   // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMessageHeadShotAndMultiKill
struct AwHudPart_DisplayEvent_DrawMessageHeadShotAndMultiKill_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	string                                             sMessage;                                                 // (Parm, NeedCtorLink)
	bool                                               bAddPosY;                                                 // (Parm)
	float                                              fFontSize;                                                // (Parm)
	struct FColor                                      _colorShadow;                                             // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMessageDomi_Capture
struct AwHudPart_DisplayEvent_DrawMessageDomi_Capture_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FDigitSet                                   WDigit;                                                   // (Parm)
	struct FNumericWidget                              WRegion;                                                  // (Parm)
	struct FSpriteWidget                               WMessage;                                                 // (Parm)
	bool                                               CaptureDoing;                                             // (Parm)
	float                                              ProgressPct;                                              // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMessageSD_BombDoingAndDone
struct AwHudPart_DisplayEvent_DrawMessageSD_BombDoingAndDone_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FSpriteWidget                               WMessage;                                                 // (Parm)
	bool                                               SDDoing;                                                  // (Parm)
	float                                              ProgressPct;                                              // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawMessageSD_BombEnable
struct AwHudPart_DisplayEvent_DrawMessageSD_BombEnable_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FSpriteWidget                               WKey;                                                     // (Parm)
	struct FSpriteWidget                               WMessage;                                                 // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawInvincibleGauge
struct AwHudPart_DisplayEvent_DrawInvincibleGauge_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawGauge2
struct AwHudPart_DisplayEvent_DrawGauge2_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              fProgressPct;                                             // (Parm)
	float                                              PosX;                                                     // (Parm)
	float                                              PosY;                                                     // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Respawn
struct AwHudPart_DisplayEvent_DisplayEvent_Respawn_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawGauge
struct AwHudPart_DisplayEvent_DrawGauge_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              fProgressPct;                                             // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawHelpBG
struct AwHudPart_DisplayEvent_DrawHelpBG_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                OffsetX;                                                  // (OptionalParm, Parm)
	int                                                OffsetY;                                                  // (OptionalParm, Parm)
	int                                                iWidth;                                                   // (OptionalParm, Parm)
	int                                                iHeight;                                                  // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_DisplayEvent.Draw_Item_Skill
struct AwHudPart_DisplayEvent_Draw_Item_Skill_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APlayerReplicationInfo*                      curPRI;                                                   // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.Draw_Item_Supply
struct AwHudPart_DisplayEvent_Draw_Item_Supply_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APlayerReplicationInfo*                      curPRI;                                                   // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawEvent_Item
struct AwHudPart_DisplayEvent_DrawEvent_Item_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_UsingSkill
struct AwHudPart_DisplayEvent_DisplayEvent_Skill_UsingSkill_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_UAV
struct AwHudPart_DisplayEvent_DisplayEvent_Skill_UAV_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_AirStirke
struct AwHudPart_DisplayEvent_DisplayEvent_Skill_AirStirke_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_State
struct AwHudPart_DisplayEvent_DisplayEvent_Skill_State_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FSpriteWidget                               WMessage;                                                 // (Parm)
	struct FSpriteWidget                               skillIcon;                                                // (OptionalParm, Parm)
	bool                                               bDrawing;                                                 // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_DisplayEvent.CallSkill
struct AwHudPart_DisplayEvent_CallSkill_Params
{
	int                                                iKey;                                                     // (OptionalParm, Parm)
	bool                                               bRequire;                                                 // (OptionalParm, Parm)
	bool                                               iSucess;                                                  // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_SentryGun
struct AwHudPart_DisplayEvent_DisplayEvent_Skill_SentryGun_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_Skill_Helicopter
struct AwHudPart_DisplayEvent_DisplayEvent_Skill_Helicopter_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DrawEvent_Item_HealthPack
struct AwHudPart_DisplayEvent_DrawEvent_Item_HealthPack_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                AddHp;                                                    // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_DisplayEvent.SetSkillState
struct AwHudPart_DisplayEvent_SetSkillState_Params
{
	int                                                skillC4;                                                  // (Parm)
	int                                                skillAirStirke;                                           // (Parm)
	int                                                SkillRPG7;                                                // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DisPlayEvent_Waiting
struct AwHudPart_DisplayEvent_DisPlayEvent_Waiting_Params
{
	string                                             Message;                                                  // (Parm, NeedCtorLink)
};

// Function XInterface.wHudPart_DisplayEvent.UpdateHelpKeyControll
struct AwHudPart_DisplayEvent_UpdateHelpKeyControll_Params
{
};

// Function XInterface.wHudPart_DisplayEvent.UpdateHUD
struct AwHudPart_DisplayEvent_UpdateHUD_Params
{
};

// Function XInterface.wHudPart_DisplayEvent.PlaySound_Event
struct AwHudPart_DisplayEvent_PlaySound_Event_Params
{
};

// Function XInterface.wHudPart_DisplayEvent.DisplayEvent_CountDown
struct AwHudPart_DisplayEvent_DisplayEvent_CountDown_Params
{
	int                                                iCount;                                                   // (Parm)
};

// Function XInterface.wHudPart_DisplayEvent.DisPlayEvent_EndWaitingForStart
struct AwHudPart_DisplayEvent_DisPlayEvent_EndWaitingForStart_Params
{
};

// Function XInterface.wHudPart_DisplayEvent.DisPlayEvent_BeginWaitingForStart
struct AwHudPart_DisplayEvent_DisPlayEvent_BeginWaitingForStart_Params
{
};

// Function XInterface.wHudPart_DisplayEvent.CallEvent
struct AwHudPart_DisplayEvent_CallEvent_Params
{
	bool                                               ItemCheck;                                                // (OptionalParm, Parm)
	int                                                iReservation1;                                            // (OptionalParm, Parm)
	int                                                iReservation2;                                            // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_DisplayEvent.Initialize
struct AwHudPart_DisplayEvent_Initialize_Params
{
	class AHudBase*                                    myOwner;                                                  // (Parm)
	class ALevelInfo*                                  Level;                                                    // (Parm)
};

// Function XInterface.wHudPart_DisplayMain.DrawSurvivedUsers
struct AwHudPart_DisplayMain_DrawSurvivedUsers_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayMain.DrawTextChattingHelp
struct AwHudPart_DisplayMain_DrawTextChattingHelp_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayMain.DrawHas2Skill
struct AwHudPart_DisplayMain_DrawHas2Skill_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayMain.DrawHas3Skill
struct AwHudPart_DisplayMain_DrawHas3Skill_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayMain.DrawHasSkill
struct AwHudPart_DisplayMain_DrawHasSkill_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayMain.CheckOwnerSkill
struct AwHudPart_DisplayMain_CheckOwnerSkill_Params
{
};

// Function XInterface.wHudPart_DisplayMain.DrawBlinkActiveKey
struct AwHudPart_DisplayMain_DrawBlinkActiveKey_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayMain.DrawHelpKeyControll_Bomb
struct AwHudPart_DisplayMain_DrawHelpKeyControll_Bomb_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayMain.DrawHelpKeyControll
struct AwHudPart_DisplayMain_DrawHelpKeyControll_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayMain.DrawSpectating
struct AwHudPart_DisplayMain_DrawSpectating_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayMain.DrawA
struct AwHudPart_DisplayMain_DrawA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayMain.SendHostPointInGame
struct AwHudPart_DisplayMain_SendHostPointInGame_Params
{
};

// Function XInterface.wHudPart_DisplayMain.UpdateHelpKeyControll
struct AwHudPart_DisplayMain_UpdateHelpKeyControll_Params
{
};

// Function XInterface.wHudPart_DisplayMain.UpdateHelpKey_Slot
struct AwHudPart_DisplayMain_UpdateHelpKey_Slot_Params
{
	byte                                               iIndex;                                                   // (Parm)
	bool                                               bEnable;                                                  // (Parm)
};

// Function XInterface.wHudPart_DisplayMain.DisplayEvent_ActiveSkill
struct AwHudPart_DisplayMain_DisplayEvent_ActiveSkill_Params
{
};

// Function XInterface.wHudPart_DisplayMain.CallEvent
struct AwHudPart_DisplayMain_CallEvent_Params
{
	bool                                               ItemCheck;                                                // (OptionalParm, Parm)
	int                                                iReservation1;                                            // (OptionalParm, Parm)
	int                                                iReservation2;                                            // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_RadioMessage.DrawRadioMessage
struct AwHudPart_RadioMessage_DrawRadioMessage_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iMessage;                                                 // (Parm)
	int                                                iHeight;                                                  // (Parm)
	string                                             sMessage;                                                 // (Parm, NeedCtorLink)
};

// Function XInterface.wHudPart_RadioMessage.GetRadioType
struct AwHudPart_RadioMessage_GetRadioType_Params
{
	ERMType                                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_RadioMessage.SetRadioType
struct AwHudPart_RadioMessage_SetRadioType_Params
{
	ERMType                                            _ERMType;                                                 // (Parm)
};

// Function XInterface.wHudPart_RadioMessage.DrawA
struct AwHudPart_RadioMessage_DrawA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_RadioMessage.ResetRadioMessage
struct AwHudPart_RadioMessage_ResetRadioMessage_Params
{
};

// Function XInterface.wHudPart_RadioMessage.CallRadioMessage
struct AwHudPart_RadioMessage_CallRadioMessage_Params
{
	int                                                iKey;                                                     // (OptionalParm, Parm)
	int                                                iReservation1;                                            // (OptionalParm, Parm)
	int                                                iReservation2;                                            // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_RadioMessage.UpdateHelpKeyControll
struct AwHudPart_RadioMessage_UpdateHelpKeyControll_Params
{
};

// Function XInterface.wHudPart_RadioMessage.Initialize
struct AwHudPart_RadioMessage_Initialize_Params
{
	class AHudBase*                                    myOwner;                                                  // (Parm)
	class ALevelInfo*                                  Level;                                                    // (Parm)
};

// Function XInterface.wHudPart_DisplayQuest.PushMessage
struct AwHudPart_DisplayQuest_PushMessage_Params
{
	string                                             MissionDesc;                                              // (Parm, NeedCtorLink)
	int                                                cur;                                                      // (Parm)
	int                                                Max;                                                      // (Parm)
};

// Function XInterface.wHudPart_DisplayQuest.ReceivedAccomplishMission100Percent
struct AwHudPart_DisplayQuest_ReceivedAccomplishMission100Percent_Params
{
	string                                             MissionDesc;                                              // (Parm, NeedCtorLink)
	int                                                cur;                                                      // (Parm)
	int                                                Max;                                                      // (Parm)
};

// Function XInterface.wHudPart_DisplayQuest.ReceivedAccomplishMission75Percent
struct AwHudPart_DisplayQuest_ReceivedAccomplishMission75Percent_Params
{
	string                                             MissionDesc;                                              // (Parm, NeedCtorLink)
	int                                                cur;                                                      // (Parm)
	int                                                Max;                                                      // (Parm)
};

// Function XInterface.wHudPart_DisplayQuest.ReceivedAccomplishMission50Percent
struct AwHudPart_DisplayQuest_ReceivedAccomplishMission50Percent_Params
{
	string                                             MissionDesc;                                              // (Parm, NeedCtorLink)
	int                                                cur;                                                      // (Parm)
	int                                                Max;                                                      // (Parm)
};

// Function XInterface.wHudPart_DisplayQuest.ReceivedAccomplishMission25Percent
struct AwHudPart_DisplayQuest_ReceivedAccomplishMission25Percent_Params
{
	string                                             MissionDesc;                                              // (Parm, NeedCtorLink)
	int                                                cur;                                                      // (Parm)
	int                                                Max;                                                      // (Parm)
};

// Function XInterface.wHudPart_DisplayQuest.HasMessage
struct AwHudPart_DisplayQuest_HasMessage_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_DisplayQuest.DrawGauge
struct AwHudPart_DisplayQuest_DrawGauge_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              fProgressPct;                                             // (Parm)
	float                                              PosX;                                                     // (Parm)
	float                                              PosY;                                                     // (Parm)
};

// Function XInterface.wHudPart_DisplayQuest.DrawSpectating
struct AwHudPart_DisplayQuest_DrawSpectating_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayQuest.DrawProgress
struct AwHudPart_DisplayQuest_DrawProgress_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayQuest.DrawHudPassA
struct AwHudPart_DisplayQuest_DrawHudPassA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_DisplayQuest.Initialize
struct AwHudPart_DisplayQuest_Initialize_Params
{
	class AHudBase*                                    myOwner;                                                  // (Parm)
	class ALevelInfo*                                  Level;                                                    // (Parm)
};

// Function XInterface.wHudPart_Minimap.DrawMinimap_Airstrike
struct AwHudPart_Minimap_DrawMinimap_Airstrike_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_ItemBuy.Timer
struct AwHudPart_ItemBuy_Timer_Params
{
};

// Function XInterface.wHudPart_ItemBuy.CallItemBuy
struct AwHudPart_ItemBuy_CallItemBuy_Params
{
	int                                                iKey;                                                     // (OptionalParm, Parm)
	int                                                iReservation1;                                            // (OptionalParm, Parm)
	int                                                iReservation2;                                            // (OptionalParm, Parm)
};

// Function XInterface.wHudPart_ItemBuy.SortItemList
struct AwHudPart_ItemBuy_SortItemList_Params
{
};

// Function XInterface.wHudPart_ItemBuy.InOrder
struct AwHudPart_ItemBuy_InOrder_Params
{
	struct FstItemInfo                                 P1;                                                       // (Parm)
	struct FstItemInfo                                 P2;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.wHudPart_ItemBuy.SetItemList
struct AwHudPart_ItemBuy_SetItemList_Params
{
};

// Function XInterface.wHudPart_ItemBuy.DrawItemList
struct AwHudPart_ItemBuy_DrawItemList_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                iPosX;                                                    // (Parm)
	int                                                iPosY;                                                    // (Parm)
	int                                                Index;                                                    // (Parm)
};

// Function XInterface.wHudPart_ItemBuy.DrawItemWindow
struct AwHudPart_ItemBuy_DrawItemWindow_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_ItemBuy.DrawHudPassA
struct AwHudPart_ItemBuy_DrawHudPassA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wHudPart_ItemBuy.Initialize
struct AwHudPart_ItemBuy_Initialize_Params
{
	class AHudBase*                                    myOwner;                                                  // (Parm)
	class ALevelInfo*                                  _level;                                                   // (Parm)
};

// Function XInterface.wScoreboardPart_Minimap.CalculateMinimapSize
struct AwScoreboardPart_Minimap_CalculateMinimapSize_Params
{
	float                                              fWidth;                                                   // (Parm, OutParm)
	float                                              fHeight;                                                  // (Parm, OutParm)
};

// Function XInterface.wScoreboardPart_Minimap.CalculateWorldPostionToMinimapPosition
struct AwScoreboardPart_Minimap_CalculateWorldPostionToMinimapPosition_Params
{
	struct FVector                                     Location;                                                 // (Parm)
	float                                              mx;                                                       // (Parm, OutParm)
	float                                              my;                                                       // (Parm, OutParm)
};

// Function XInterface.wScoreboardPart_Minimap.CalculateTexturePositionFromMinimapPosition
struct AwScoreboardPart_Minimap_CalculateTexturePositionFromMinimapPosition_Params
{
	float                                              minimapX;                                                 // (Parm)
	float                                              minimapY;                                                 // (Parm)
	int                                                TX;                                                       // (Parm, OutParm)
	int                                                ty;                                                       // (Parm, OutParm)
};

// Function XInterface.wScoreboardPart_Minimap.CalculateMinimapPosition
struct AwScoreboardPart_Minimap_CalculateMinimapPosition_Params
{
	struct FVector                                     centerLoc;                                                // (Parm)
	struct FRotator                                    centerRotation;                                           // (Parm)
	struct FVector                                     TargetLoc;                                                // (Parm)
	float                                              minimapX;                                                 // (Parm, OutParm)
	float                                              minimapY;                                                 // (Parm, OutParm)
};

// Function XInterface.wScoreboardPart_Minimap.SetupMinimapSpriteWidgetForDrawing
struct AwScoreboardPart_Minimap_SetupMinimapSpriteWidgetForDrawing_Params
{
	struct FSpriteWidget                               Sprite;                                                   // (Parm, OutParm)
	struct FRotator                                    Rotation;                                                 // (Parm)
	float                                              minimapX;                                                 // (Parm)
	float                                              minimapY;                                                 // (Parm)
};

// Function XInterface.wScoreboardPart_Minimap.CalcMinimapRotation
struct AwScoreboardPart_Minimap_CalcMinimapRotation_Params
{
	struct FRotator                                    Rotation;                                                 // (Parm)
	struct FRotator                                    outRotation;                                              // (Parm, OutParm)
};

// Function XInterface.wScoreboardPart_Minimap.DrawMinimap_Airstrike
struct AwScoreboardPart_Minimap_DrawMinimap_Airstrike_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wScoreboardPart_Minimap.DrawMinimap_Myself
struct AwScoreboardPart_Minimap_DrawMinimap_Myself_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wScoreboardPart_Minimap.SetupBGMapUAV
struct AwScoreboardPart_Minimap_SetupBGMapUAV_Params
{
};

// Function XInterface.wScoreboardPart_Minimap.DrawMinimap_BGMap
struct AwScoreboardPart_Minimap_DrawMinimap_BGMap_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wScoreboardPart_Minimap.DrawMinimap_CombatSituation
struct AwScoreboardPart_Minimap_DrawMinimap_CombatSituation_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wScoreboardPart_Minimap.Draw
struct AwScoreboardPart_Minimap_Draw_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function XInterface.wScoreboardPart_Minimap.Initialize
struct AwScoreboardPart_Minimap_Initialize_Params
{
	class AHudBase*                                    myOwner;                                                  // (Parm)
	class ALevelInfo*                                  myLevel;                                                  // (Parm)
};

// Function XInterface.BTHUDColorPoolHK.DefaultShadow
struct UBTHUDColorPoolHK_DefaultShadow_Params
{
	struct FColor                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.BTHUDColorPoolHK.DefaultWhite
struct UBTHUDColorPoolHK_DefaultWhite_Params
{
	struct FColor                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.ScoreBoardTeamDeathMatch.DrawTeam
struct AScoreBoardTeamDeathMatch_DrawTeam_Params
{
	int                                                TeamNum;                                                  // (Parm)
	int                                                PlayerCount;                                              // (Parm)
	int                                                OwnerOffset;                                              // (Parm)
	class UCanvas*                                     Canvas;                                                   // (Parm)
	int                                                FontReduction;                                            // (Parm)
	int                                                BoxSpaceY;                                                // (Parm)
	int                                                PlayerBoxSizeY;                                           // (Parm)
	int                                                HeaderOffsetY;                                            // (Parm)
};

// Function XInterface.ScoreBoardTeamDeathMatch.UpdateScoreBoard
struct AScoreBoardTeamDeathMatch_UpdateScoreBoard_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
};

// Function XInterface.ScoreBoardTeamDeathMatch.UpdatePrecacheMaterials
struct AScoreBoardTeamDeathMatch_UpdatePrecacheMaterials_Params
{
};

// Function XInterface.wHudPart_SelectQSlot_AlienMode.CalcQuickSlotTimer
struct AwHudPart_SelectQSlot_AlienMode_CalcQuickSlotTimer_Params
{
	int                                                respawnLeftTime;                                          // (Parm, OutParm)
	int                                                startupLeftTime;                                          // (Parm, OutParm)
};

// Function XInterface.GUIComboButton.InitComponent
struct UGUIComboButton_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIVertImageListBox.Clear
struct UGUIVertImageListBox_Clear_Params
{
};

// Function XInterface.GUIVertImageListBox.MyClose
struct UGUIVertImageListBox_MyClose_Params
{
	class UGUIContextMenu*                             Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageListBox.MyOpen
struct UGUIVertImageListBox_MyOpen_Params
{
	class UGUIContextMenu*                             Menu;                                                     // (ExportObject, Parm, NeedCtorLink, EditInline)
	class UGUIComponent*                               ContextMenuOwner;                                         // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageListBox.AddImage
struct UGUIVertImageListBox_AddImage_Params
{
	class UMaterial*                                   Image;                                                    // (Parm)
	int                                                Item;                                                     // (OptionalParm, Parm)
};

// Function XInterface.GUIVertImageListBox.ItemCount
struct UGUIVertImageListBox_ItemCount_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageListBox.InternalOnChange
struct UGUIVertImageListBox_InternalOnChange_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIVertImageListBox.InternalOnClick
struct UGUIVertImageListBox_InternalOnClick_Params
{
	class UGUIComponent*                               Sender;                                                   // (ExportObject, Parm, NeedCtorLink, EditInline)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XInterface.GUIVertImageListBox.InitComponent
struct UGUIVertImageListBox_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.GUIVertImageListBox.InitBaseList
struct UGUIVertImageListBox_InitBaseList_Params
{
	class UGUIListBase*                                LocalList;                                                // (ExportObject, Parm, NeedCtorLink, EditInline)
};

// Function XInterface.moEditBox.MaskText
struct UmoEditBox_MaskText_Params
{
	bool                                               B;                                                        // (Parm)
};

// Function XInterface.moEditBox.FloatOnly
struct UmoEditBox_FloatOnly_Params
{
	bool                                               B;                                                        // (Parm)
};

// Function XInterface.moEditBox.IntOnly
struct UmoEditBox_IntOnly_Params
{
	bool                                               B;                                                        // (Parm)
};

// Function XInterface.moEditBox.SetReadOnly
struct UmoEditBox_SetReadOnly_Params
{
	bool                                               B;                                                        // (Parm)
};

// Function XInterface.moEditBox.ReadOnly
struct UmoEditBox_ReadOnly_Params
{
	bool                                               B;                                                        // (Parm)
};

// Function XInterface.moEditBox.SetText
struct UmoEditBox_SetText_Params
{
	string                                             NewText;                                                  // (Parm, NeedCtorLink)
};

// Function XInterface.moEditBox.GetText
struct UmoEditBox_GetText_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.moEditBox.GetComponentValue
struct UmoEditBox_GetComponentValue_Params
{
	string                                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function XInterface.moEditBox.SetComponentValue
struct UmoEditBox_SetComponentValue_Params
{
	string                                             NewValue;                                                 // (Parm, CoerceParm, NeedCtorLink)
	bool                                               bNoChange;                                                // (OptionalParm, Parm)
};

// Function XInterface.moEditBox.InitComponent
struct UmoEditBox_InitComponent_Params
{
	class UGUIController*                              MyController;                                             // (Parm)
	class UGUIComponent*                               myOwner;                                                  // (ExportObject, Parm, NeedCtorLink, EditInline)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
