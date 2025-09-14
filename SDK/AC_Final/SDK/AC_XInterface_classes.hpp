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

// Class XInterface.GUI
// 0x0028 (0x0054 - 0x002C)
class UGUI : public UObject
{
public:
	class UGUIController*                              Controller;                                               // 0x002C(0x0004) (NoExport)
	struct FPlane                                      SaveModulation;                                           // 0x0030(0x0010) (NoExport)
	float                                              SaveX;                                                    // 0x0040(0x0004) (NoExport)
	float                                              SaveY;                                                    // 0x0044(0x0004) (NoExport)
	struct FColor                                      SaveColor;                                                // 0x0048(0x0004) (NoExport)
	class UFont*                                       SaveFont;                                                 // 0x004C(0x0004) (NoExport)
	byte                                               SaveStyle;                                                // 0x0050(0x0001) (NoExport)
	byte                                               Padding00[0x3];                                           // 0x0051(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUI");
		return ptr;
	}


	class UMaterial* GetModLogo(const string& ModDir);
	string GetModValue(const string& ModDir, const string& ModKey);
	void GetModList(string[]* ModDirs, string[]* ModTitles);
	void Profile(const string& ProfileName);
	string STATIC_JoinArray(string[] StringArray, const string& Delim, bool bIgnoreBlanks);
	bool STATIC_IsDigit(const string& test, bool bAllowDecimal);
};


// Class XInterface.GUIComponent
// 0x0268 (0x02BC - 0x0054)
class UGUIComponent : public UGUI
{
public:
	struct FTimerData[]                                Timers;                                                   // 0x0054(0x000C) (Const, NeedCtorLink)
	class UGUIPage*                                    PageOwner;                                                // 0x0060(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	class UGUIComponent*                               MenuOwner;                                                // 0x0064(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	class UGUIComponent*                               FocusInstead;                                             // 0x0068(0x0004) (Edit, ExportObject, NeedCtorLink, NoExport, EditInline)
	EeMenuState                                        MenuState;                                                // 0x006C(0x0001) (Edit, NoExport)
	EeMenuState                                        LastMenuState;                                            // 0x006D(0x0001) (Edit, EditConst, NoExport)
	EeDropState                                        DropState;                                                // 0x006E(0x0001) (Edit, NoExport)
	EeFontScale                                        FontScale;                                                // 0x006F(0x0001) (Edit)
	class UCanvas*                                     CurrentCanvas;                                            // 0x0070(0x0004)
	string                                             IniOption;                                                // 0x0074(0x000C) (Edit, NeedCtorLink)
	string                                             IniDefault;                                               // 0x0080(0x000C) (Edit, NeedCtorLink)
	string                                             StyleName;                                                // 0x008C(0x000C) (Edit, NeedCtorLink)
	string                                             Hint;                                                     // 0x0098(0x000C) (Edit, Localized, NeedCtorLink)
	class UGUILabel*                                   FriendlyLabel;                                            // 0x00A4(0x0004) (Edit, ExportObject, NeedCtorLink, NoExport, EditInline)
	float                                              WinTop;                                                   // 0x00A8(0x0004) (Edit)
	float                                              WinLeft;                                                  // 0x00AC(0x0004) (Edit)
	float                                              WinWidth;                                                 // 0x00B0(0x0004) (Edit)
	float                                              WinHeight;                                                // 0x00B4(0x0004) (Edit)
	bool                                               bUseAWinPos;                                              // 0x00B8(0x0004) (Edit)
	struct FFloatBox                                   AWinPos;                                                  // 0x00BC(0x0010) (Edit)
	struct FFloatBox                                   RWinPos;                                                  // 0x00CC(0x0010) (Edit)
	struct FFloatBox                                   AWinFrame;                                                // 0x00DC(0x0010) (Edit)
	float                                              RenderWeight;                                             // 0x00EC(0x0004) (Edit)
	int                                                MouseCursorIndex;                                         // 0x00F0(0x0004) (Edit)
	int                                                TabOrder;                                                 // 0x00F4(0x0004) (Edit)
	int                                                Tag;                                                      // 0x00F8(0x0004) (Edit)
	bool                                               bTravelling;                                              // 0x00FC(0x0004) (Edit, Const, EditConst, NoExport)
	bool                                               bSizing;                                                  // 0x00FC(0x0004) (Edit, Const, EditConst, NoExport)
	bool                                               bCaptureMouse;                                            // 0x00FC(0x0004) (Edit)
	bool                                               bCaptureTabs;                                             // 0x00FC(0x0004) (Edit)
	bool                                               bNeverFocus;                                              // 0x00FC(0x0004) (Edit)
	bool                                               bRepeatClick;                                             // 0x00FC(0x0004) (Edit)
	bool                                               bRequireReleaseClick;                                     // 0x00FC(0x0004) (Edit)
	bool                                               bMouseOverSound;                                          // 0x00FC(0x0004) (Edit)
	bool                                               bDropSource;                                              // 0x00FC(0x0004) (Edit)
	bool                                               bDropTarget;                                              // 0x00FC(0x0004) (Edit)
	bool                                               bPendingFocus;                                            // 0x00FC(0x0004) (Edit, NoExport)
	bool                                               bInit;                                                    // 0x00FC(0x0004) (Edit)
	bool                                               bNeverScale;                                              // 0x00FC(0x0004) (Edit)
	bool                                               bRequiresStyle;                                           // 0x00FC(0x0004) (Const, NoExport)
	bool                                               bPositioned;                                              // 0x00FC(0x0004) (Edit, Const, EditConst, NoExport)
	bool                                               bAnimating;                                               // 0x00FC(0x0004) (Edit, EditConst, NoExport)
	bool                                               bDebugging;                                               // 0x00FC(0x0004) (Edit)
	bool                                               bTabStop;                                                 // 0x00FC(0x0004) (Edit)
	bool                                               bFocusOnWatch;                                            // 0x00FC(0x0004) (Edit)
	bool                                               bBoundToParent;                                           // 0x00FC(0x0004) (Edit)
	bool                                               bScaleToParent;                                           // 0x00FC(0x0004) (Edit)
	bool                                               bHasFocus;                                                // 0x00FC(0x0004) (Edit, NoExport)
	bool                                               bVisible;                                                 // 0x00FC(0x0004) (Edit)
	bool                                               bAcceptsInput;                                            // 0x00FC(0x0004) (Edit)
	struct FVector[]                                   MotionFrame;                                              // 0x0100(0x000C) (Edit, Const, EditConst, NeedCtorLink, NoExport)
	struct FVector[]                                   SizeFrame;                                                // 0x010C(0x000C) (Edit, Const, EditConst, NeedCtorLink, NoExport)
	float                                              Bounds[0x4];                                              // 0x0118(0x0004) (Edit, Const, EditConst, NoExport)
	float                                              ClientBounds[0x4];                                        // 0x0128(0x0004) (Edit, Const, EditConst, NoExport)
	bool                                               bTimerRepeat;                                             // 0x0138(0x0004) (Edit)
	int                                                TimerIndex;                                               // 0x013C(0x0004) (Edit, Const, EditConst, NoExport)
	float                                              TimerCountdown;                                           // 0x0140(0x0004) (Edit)
	float                                              TimerInterval;                                            // 0x0144(0x0004) (Edit)
	float                                              MouseOffset[0x4];                                         // 0x0148(0x0004) (Const, NoExport)
	class UGUIContextMenu*                             ContextMenu;                                              // 0x0158(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, EditInline)
	class UGUIToolTip*                                 ToolTip;                                                  // 0x015C(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, EditInline)
	struct FColor                                      WhiteColor;                                               // 0x0160(0x0004) (Const, NoExport)
	class UGUIStyles*                                  Style;                                                    // 0x0164(0x0004) (Edit, ExportObject, NeedCtorLink, NoExport, EditInline)
	EClickSound                                        OnClickSound;                                             // 0x0168(0x0001) (Edit)
	EParentScaleType                                   BoundingType;                                             // 0x0169(0x0001) (Edit)
	EParentScaleType                                   ScalingType;                                              // 0x016A(0x0001) (Edit)
	byte                                               Padding00[0x1];                                           // 0x016B(0x0001) MISSED OFFSET
	bool                                               bStandardized;                                            // 0x016C(0x0004) (Edit)
	float                                              StandardHeight;                                           // 0x0170(0x0004) (Edit)
	bool                                               bFlicker;                                                 // 0x0174(0x0004)
	int                                                PreDrawCount;                                             // 0x0178(0x0004) (Const, EditConst, NoExport)
	int                                                DrawCount;                                                // 0x017C(0x0004) (Const, EditConst, NoExport)
	int                                                OnRenderCount;                                            // 0x0180(0x0004) (EditConst, NoExport)
	int                                                OnRenderedCount;                                          // 0x0184(0x0004) (EditConst, NoExport)
	int                                                OnPreDrawCount;                                           // 0x0188(0x0004) (EditConst, NoExport)
	int                                                OnDrawCount;                                              // 0x018C(0x0004) (EditConst, NoExport)
	bool                                               bIsDisableHover;                                          // 0x0190(0x0004)
	bool                                               bAlwaysFocus;                                             // 0x0190(0x0004)
	struct FScriptDelegate                             __OnArrival__Delegate;                                    // 0x0194(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnEndAnimation__Delegate;                               // 0x019C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnPreDraw__Delegate;                                    // 0x01A4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnDraw__Delegate;                                       // 0x01AC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnRender__Delegate;                                     // 0x01B4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnRendered__Delegate;                                   // 0x01BC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnActivate__Delegate;                                   // 0x01C4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnDeActivate__Delegate;                                 // 0x01CC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnWatch__Delegate;                                      // 0x01D4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnHitTest__Delegate;                                    // 0x01DC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnMessage__Delegate;                                    // 0x01E4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnHide__Delegate;                                       // 0x01EC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnShow__Delegate;                                       // 0x01F4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnBeginTooltip__Delegate;                               // 0x01FC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnEndTooltip__Delegate;                                 // 0x0204(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnInvalidate__Delegate;                                 // 0x020C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnHover__Delegate;                                      // 0x0214(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnClick__Delegate;                                      // 0x021C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnDblClick__Delegate;                                   // 0x0224(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnRightClick__Delegate;                                 // 0x022C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnMousePressed__Delegate;                               // 0x0234(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnMouseRelease__Delegate;                               // 0x023C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnTimer__Delegate;                                      // 0x0244(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnChange__Delegate;                                     // 0x024C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnKeyType__Delegate;                                    // 0x0254(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnKeyEvent__Delegate;                                   // 0x025C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnDesignModeKeyEvent__Delegate;                         // 0x0264(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnCapturedMouseMove__Delegate;                          // 0x026C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnLoadINI__Delegate;                                    // 0x0274(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnSaveINI__Delegate;                                    // 0x027C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnMultiSelect__Delegate;                                // 0x0284(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnBeginDrag__Delegate;                                  // 0x028C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnEndDrag__Delegate;                                    // 0x0294(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnDragDrop__Delegate;                                   // 0x029C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnDragEnter__Delegate;                                  // 0x02A4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnDragLeave__Delegate;                                  // 0x02AC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnDragOver__Delegate;                                   // 0x02B4(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIComponent");
		return ptr;
	}


	class UCanvas* GetCurrentCanvas();
	void DebugTabOrder();
	void LevelChanged();
	void SetEnabled(bool Value);
	void DisableMe();
	void EnableMe();
	void SetFlicker(bool Value);
	void DisableComponent(class UGUIComponent* Comp);
	void EnableComponent(class UGUIComponent* Comp);
	void KillAnimation();
	void DAnimate(float NewLeft, float NewTop, float NewWidth, float NewHeight, float PositionTime, float DimensionTime);
	void Resize(float NewWidth, float NewHeight, float Time);
	void Animate(float NewLeft, float NewTop, float Time);
	void EndAnimation(class UGUIComponent* Animating, EAnimationType Type);
	void BeginAnimation(class UGUIComponent* Animating);
	class UGUIPage* OwnerPage();
	void DebugFocusPosition(class UGUIComponent* Who, bool Last);
	void DebugFocus(class UGUIComponent* Who, bool bLose);
	void SetTooltip(class UGUIToolTip* InTooltip);
	void SetToolTipText(const string& NewToolTipText);
	void SetHint(const string& NewHint);
	void SetFriendlyLabel(class UGUILabel* NewLabel);
	void SetFocusInstead(class UGUIComponent* InFocusComp);
	void Show();
	void Hide();
	void CenterMouse();
	void SetVisibility(bool bIsVisible);
	void FillOwner();
	bool PrevPage();
	bool NextPage();
	bool PrevControl(class UGUIComponent* Sender);
	bool NextControl(class UGUIComponent* Sender);
	bool FocusLast(class UGUIComponent* Sender);
	bool FocusFirst(class UGUIComponent* Sender);
	void LoseFocus(class UGUIComponent* Sender);
	void SetFocus(class UGUIComponent* Who);
	bool CanAcceptFocus();
	bool IsInClientBounds();
	bool IsInBounds();
	void TraversalApplyAWinPos();
	void ApplyAWinPos();
	class UGUIComponent* GetTopMenuOwner();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void DropStateChange(EeDropState NewState);
	bool IsMultiSelect();
	void MenuStateChange(EeMenuState NewState);
	string STATIC_MakeColorCode(const struct FColor& NewColor);
	string STATIC_StripColorCodes(const string& InString);
	void SaveINI(const string& Value);
	string LoadINI();
	void free();
	void Closed(class UGUIComponent* Sender, bool bCancelled);
	void Opened(class UGUIComponent* Sender);
	void Timer();
	string AdditionalDebugString();
	bool SpecialHit(bool bForce);
	string GetMenuPath();
	bool IsInIncompleteLetter(const string& strUserName);
	int IsCorrectUserName_THAILAND(const string& strUserName);
	int IsCorrectUserName_China(const string& strUserName);
	int IsCorrectUserName(const string& strUserName);
	void SetPosition(float NewLeft, float NewTop, float NewWidth, float NewHeight, bool bForceRelative);
	void ResolutionChanged(int ResX, int ResY);
	float RelativeHeight(float RealHeight, bool bForce);
	float RelativeWidth(float RealWidth, bool bForce);
	float RelativeTop(float RealTop, bool bForce);
	float RelativeLeft(float RealLeft, bool bForce);
	float ActualTop(float val, bool bForce);
	float ActualLeft(float val, bool bForce);
	float ActualHeight(float val, bool bForce);
	float ActualWidth(float val, bool bForce);
	void UpdateBounds();
	void UpdateOffset(float PosX, float PosY, float PosW, float PosH);
	void AutoPositionOn(class UGUIComponent*[] Components, class UGUIComponent* frame, float LeftPadPerc, float UpperPadPerc, float RightPadPerc, float LowerPadPerc, int NumberOfColumns, float ColumnPadding);
	void AutoPosition(class UGUIComponent*[] Components, float LeftBound, float UpperBound, float RightBound, float LowerBound, float LeftPad, float UpperPad, float RightPad, float LowerPad, int NumberOfColumns, float ColumnPadding);
	void KillTimer(const FName& TimerFunc);
	void SetTimer(float Interval, bool bRepeat, const FName& TimerFunc);
	class APlayerController* PlayerOwner();
	void OnDragOver(class UGUIComponent* Sender);
	void OnDragLeave(class UGUIComponent* Sender);
	void OnDragEnter(class UGUIComponent* Sender);
	bool OnDragDrop(class UGUIComponent* Sender);
	void OnEndDrag(class UGUIComponent* Sender, bool bAccepted);
	bool OnBeginDrag(class UGUIComponent* Sender);
	bool OnMultiSelect(class UGUIComponent* Sender);
	string OnSaveINI(class UGUIComponent* Sender);
	void OnLoadINI(class UGUIComponent* Sender, const string& S);
	bool OnCapturedMouseMove(float deltaX, float deltaY);
	bool OnDesignModeKeyEvent(EInputKey key, EInputAction State);
	bool OnKeyEvent(float Delta, byte* key, byte* State);
	bool OnKeyType(const string& Unicode, byte* key);
	void OnChange(class UGUIComponent* Sender);
	void OnTimer(class UGUIComponent* Sender);
	void OnMouseRelease(class UGUIComponent* Sender);
	void OnMousePressed(class UGUIComponent* Sender, bool bRepeat);
	bool OnRightClick(class UGUIComponent* Sender);
	bool OnDblClick(class UGUIComponent* Sender);
	bool OnClick(class UGUIComponent* Sender);
	bool OnHover(class UGUIComponent* Sender);
	void OnInvalidate(class UGUIComponent* Who);
	bool OnEndTooltip();
	class UGUIToolTip* OnBeginTooltip();
	void OnShow();
	void OnHide();
	void OnMessage(const string& Msg, float MsgLife);
	void OnHitTest(float MouseX, float MouseY);
	void OnWatch();
	void OnDeActivate();
	void OnActivate();
	void OnRendered(class UCanvas* Canvas);
	void OnRender(class UCanvas* Canvas);
	bool OnDraw(class UCanvas* Canvas);
	bool OnPreDraw(class UCanvas* Canvas);
	void OnEndAnimation(class UGUIComponent* Sender, EAnimationType Type);
	void OnArrival(class UGUIComponent* Sender, EAnimationType Type);
};


// Class XInterface.GUIMultiComponent
// 0x0044 (0x0300 - 0x02BC)
class UGUIMultiComponent : public UGUIComponent
{
public:
	class UGUIComponent*[]                             Controls;                                                 // 0x02BC(0x000C) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding)
	class UGUIComponent*                               FocusedControl;                                           // 0x02C8(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	class UGUIComponent*[]                             Components;                                               // 0x02CC(0x000C) (Edit, EditFixedSize, NeedCtorLink, NoExport)
	int                                                AnimationCount;                                           // 0x02D8(0x0004) (Edit, EditConst, NoExport)
	bool                                               PropagateVisibility;                                      // 0x02DC(0x0004) (Edit)
	bool                                               bOldStyleMenus;                                           // 0x02DC(0x0004) (Edit)
	bool                                               bDrawFocusedLast;                                         // 0x02DC(0x0004) (Edit)
	bool                                               bAlwaysAutomate;                                          // 0x02DC(0x0004) (Edit)
	struct FScriptDelegate                             __HandleContextMenuOpen__Delegate;                        // 0x02E0(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __HandleContextMenuClose__Delegate;                       // 0x02E8(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __NotifyContextSelect__Delegate;                          // 0x02F0(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnCreateComponent__Delegate;                            // 0x02F8(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIMultiComponent");
		return ptr;
	}


	struct FFloatBox GetTooltipPosFinal(int tooltipWidth, int tooltipHeight, float CursorUSize, float CursorVSize, int nOffsetX, int nOffsetY);
	bool RecursiveActiveOwner(class UGUIComponent* checkComponent);
	void TraversalApplyAWinPos();
	class UGUIComponent* NewComponent(class UGUIComponent* newcompo, const struct FFloatBox& fbNewCompo, float RenderWeight, class UGUIMultiComponent* ParentComponent);
	void CheckDuplicateTabOrder();
	void CheckInvalidTabOrder();
	void DebugTabOrder();
	void CenterMouse();
	void LevelChanged();
	void EndAnimation(class UGUIComponent* Animating, EAnimationType Type);
	void BeginAnimation(class UGUIComponent* Animating);
	void free();
	void Closed(class UGUIComponent* Sender, bool bCancelled);
	void Opened(class UGUIComponent* Sender);
	void SetVisibility(bool bIsVisible);
	void DisableMe();
	void EnableMe();
	bool PrevControl(class UGUIComponent* Sender);
	bool NextControl(class UGUIComponent* Sender);
	bool FocusLast(class UGUIComponent* Sender);
	bool FocusFirst(class UGUIComponent* Sender);
	bool CanAcceptFocus();
	void LoseFocus(class UGUIComponent* Sender);
	void SetFocus(class UGUIComponent* Who);
	void SetFocusInstead(class UGUIComponent* InFocusComp);
	bool RemoveComponent(class UGUIComponent* Comp, bool SkipRemap);
	class UGUIComponent* AppendComponent(class UGUIComponent* NewComp, bool SkipRemap);
	class UGUIComponent* InsertComponent(class UGUIComponent* NewComp, int Index, bool SkipRemap);
	class UGUIComponent* AddComponent(const string& ComponentClass, bool SkipRemap);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InternalOnShow();
	int FindComponentIndex(class UGUIComponent* Who);
	void RemapComponents();
	void InitializeControls();
	void OnCreateComponent(class UGUIComponent* NewComponent, class UGUIComponent* Sender);
	bool NotifyContextSelect(class UGUIContextMenu* Sender, int ClickIndex);
	bool HandleContextMenuClose(class UGUIContextMenu* Sender);
	bool HandleContextMenuOpen(class UGUIComponent* Sender, class UGUIContextMenu* Menu, class UGUIComponent* ContextMenuOwner);
};


// Class XInterface.GUIPage
// 0x0064 (0x0364 - 0x0300)
class UGUIPage : public UGUIMultiComponent
{
public:
	bool                                               bRestorable;                                              // 0x0300(0x0004) (Edit)
	bool                                               bUseMyInactiveFadeColor;                                  // 0x0300(0x0004) (Edit)
	bool                                               bRenderWorld;                                             // 0x0300(0x0004) (Edit)
	bool                                               bPauseIfPossible;                                         // 0x0300(0x0004) (Edit)
	bool                                               bCheckResolution;                                         // 0x0300(0x0004) (Edit)
	bool                                               bCaptureInput;                                            // 0x0300(0x0004) (Edit)
	bool                                               bRequire640x480;                                          // 0x0300(0x0004) (Edit)
	bool                                               bPersistent;                                              // 0x0300(0x0004) (Edit)
	bool                                               bDisconnectOnOpen;                                        // 0x0300(0x0004) (Edit)
	bool                                               bAllowedAsLast;                                           // 0x0300(0x0004) (Edit)
	class UGUIPage*                                    ParentPage;                                               // 0x0304(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	class UMaterial*                                   Background;                                               // 0x0308(0x0004) (Edit)
	struct FColor                                      BackgroundColor;                                          // 0x030C(0x0004) (Edit)
	struct FColor                                      InactiveFadeColor;                                        // 0x0310(0x0004) (Edit)
	struct FColor                                      ActiveFadeColor;                                          // 0x0314(0x0004) (Edit)
	class USound*                                      OpenSound;                                                // 0x0318(0x0004) (Edit)
	class USound*                                      CloseSound;                                               // 0x031C(0x0004) (Edit)
	EMenuRenderStyle                                   BackgroundRStyle;                                         // 0x0320(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x0321(0x0003) MISSED OFFSET
	struct FScriptDelegate                             __OnOpen__Delegate;                                       // 0x0324(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnReOpen__Delegate;                                     // 0x032C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnClose__Delegate;                                      // 0x0334(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnCanClose__Delegate;                                   // 0x033C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __FadedIn__Delegate;                                      // 0x0344(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __FadedOut__Delegate;                                     // 0x034C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __GetFocus__Delegate;                                     // 0x0354(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __LostFocus__Delegate;                                    // 0x035C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIPage");
		return ptr;
	}


	void LostFocus(class UGUIPage* NewMenu);
	void GetFocus();
	void FadedOut();
	void FadedIn();
	void FadeOut(bool bTranslate, bool bChangeAlpha);
	void FadeIn(bool bTranslate, bool bChangeAlpha);
	bool AllowOpen(const string& MenuClass);
	bool IsOpen();
	void free();
	bool NotifyLevelChange();
	void SetDataString(const string& str);
	string GetDataString();
	void HandleObject(class UObject* obj, class UObject* OptionalObj_1, class UObject* OptionalObj_2);
	bool GetRestoreParams(string* Param1, string* Param2);
	void HandleParameters(const string& Param1, const string& Param2);
	void SetFocus(class UGUIComponent* Who);
	void ChangeHint(const string& NewHint);
	void CheckResolution(bool Closing, class UGUIController* InController);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void Closed(class UGUIComponent* Sender, bool bCancelled);
	bool OnCanClose(bool bCancelled);
	void OnClose(bool bCancelled);
	void OnReOpen();
	void OnOpen();
};


// Class XInterface.GUIQuestionPage
// 0x0038 (0x039C - 0x0364)
class UGUIQuestionPage : public UGUIPage
{
public:
	class UGUILabel*                                   lMessage;                                                 // 0x0364(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UMaterial*                                   MessageIcon;                                              // 0x0368(0x0004)
	string[]                                           ButtonNames;                                              // 0x036C(0x000C) (Localized, NeedCtorLink)
	class UGUIButton*[]                                Buttons;                                                  // 0x0378(0x000C) (NeedCtorLink)
	class UGUIButton*                                  DefaultButton;                                            // 0x0384(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UGUIButton*                                  CancelButton;                                             // 0x0388(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FScriptDelegate                             __OnButtonClick__Delegate;                                // 0x038C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __NewOnButtonClick__Delegate;                             // 0x0394(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIQuestionPage");
		return ptr;
	}


	void RemoveButtons();
	string Replace(const string& Src, const string& Tag, const string& Value);
	bool ButtonClick(class UGUIComponent* Sender);
	void LayoutButtons(byte ActiveButton);
	class UGUIButton* AddButton(byte idesc);
	void SetupQuestion(const string& Question, byte bButtons, byte ActiveButton, bool bClearFirst);
	bool InternalOnPreDraw(class UCanvas* C);
	void InitComponent(class UGUIController* pMyController, class UGUIComponent* myOwner);
	bool NewOnButtonClick(byte bButton);
	void OnButtonClick(byte bButton);
};


// Class XInterface.HudBase
// 0x05F0 (0x0CB8 - 0x06C8)
class AHudBase : public AHUD
{
public:
	int                                                SpecPlayerLevel;                                          // 0x06C8(0x0004)
	int                                                SpecPlayerLevelMarkID;                                    // 0x06CC(0x0004)
	string                                             strSpectating;                                            // 0x06D0(0x000C) (Localized, NeedCtorLink)
	string                                             strSpectateHelp;                                          // 0x06DC(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbSpectateLevel;                                          // 0x06E8(0x0010)
	struct FFloatBox                                   fbSpectateUser;                                           // 0x06F8(0x0010)
	struct FFloatBox                                   fbSpectateHelp;                                           // 0x0708(0x0010)
	struct FFloatBox                                   fbSpectatingBack;                                         // 0x0718(0x0010)
	float                                              NametagFactorZ;                                           // 0x0728(0x0004) (Edit)
	float                                              NametagExtraZ;                                            // 0x072C(0x0004) (Edit)
	int                                                NametagFontSize;                                          // 0x0730(0x0004) (Edit)
	float                                              NametagRadius;                                            // 0x0734(0x0004) (Edit)
	int                                                NametagShadowX;                                           // 0x0738(0x0004) (Edit)
	int                                                NametagShadowY;                                           // 0x073C(0x0004) (Edit)
	struct FColor                                      NametagShadowColor;                                       // 0x0740(0x0004) (Edit)
	string                                             NameTagInvulnerablePost;                                  // 0x0744(0x000C) (Localized, NeedCtorLink)
	float                                              NameTagVisUpdateTime;                                     // 0x0750(0x0004)
	struct FSpriteWidget                               IconDefendBombHolder;                                     // 0x0754(0x0040) (Edit)
	struct FSpriteWidget                               IconInvulnerable;                                         // 0x0794(0x0040) (Edit)
	int                                                TeamIndex;                                                // 0x07D4(0x0004) (Edit, Transient)
	ERenderStyle                                       PassStyle;                                                // 0x07D8(0x0001) (Edit, Transient)
	byte                                               Padding00[0x3];                                           // 0x07D9(0x0003) MISSED OFFSET
	class AHudBase*[]                                  ChildHudParts;                                            // 0x07DC(0x000C) (NeedCtorLink)
	struct FHudLocalizedMessage                        LocalMessages[0x8];                                       // 0x07E8(0x0050) (Edit, Transient, NeedCtorLink)
	class UClass*                                      VoteMenuClass;                                            // 0x0A68(0x0004) (Edit)
	class UMaterial*                                   TargetMaterial;                                           // 0x0A6C(0x0004)
	bool                                               bShowTargeting;                                           // 0x0A70(0x0004) (Transient)
	struct FVector                                     TargetingLocation;                                        // 0x0A74(0x000C) (Transient)
	float                                              TargetingSize;                                            // 0x0A80(0x0004) (Transient)
	string                                             InstructionText;                                          // 0x0A84(0x000C) (Edit, NeedCtorLink)
	string                                             InstructionKeyText;                                       // 0x0A90(0x000C) (Edit, NeedCtorLink)
	float                                              InstructTextBorderX;                                      // 0x0A9C(0x0004) (Edit)
	float                                              InstructTextBorderY;                                      // 0x0AA0(0x0004) (Edit)
	float                                              InstrDelta;                                               // 0x0AA4(0x0004) (Edit)
	float                                              InstrRate;                                                // 0x0AA8(0x0004) (Edit)
	string                                             InstructionFontName;                                      // 0x0AAC(0x000C) (Edit, NeedCtorLink)
	class UFont*                                       InstructionFontFont;                                      // 0x0AB8(0x0004) (Edit)
	bool                                               bUsingCustomHUDColor;                                     // 0x0ABC(0x0004)
	bool                                               DoCropping;                                               // 0x0ABC(0x0004) (Edit)
	bool                                               bIsCinematic;                                             // 0x0ABC(0x0004)
	byte                                               FontsPrecached;                                           // 0x0AC0(0x0001)
	byte                                               Padding01[0x3];                                           // 0x0AC1(0x0003) MISSED OFFSET
	bool                                               bHideWeaponName;                                          // 0x0AC4(0x0004)
	float                                              CroppingAmount;                                           // 0x0AC8(0x0004) (Edit)
	class UMaterial*                                   CroppingMaterial;                                         // 0x0ACC(0x0004) (Edit)
	string                                             LastWeaponName;                                           // 0x0AD0(0x000C) (NeedCtorLink)
	float                                              WeaponDrawTimer;                                          // 0x0ADC(0x0004)
	struct FColor                                      WeaponDrawColor;                                          // 0x0AE0(0x0004)
	string                                             Text;                                                     // 0x0AE4(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             LevelActionLoading;                                       // 0x0AF0(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             LevelActionPaused;                                        // 0x0AFC(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             LevelActionFontName;                                      // 0x0B08(0x000C) (Edit, NeedCtorLink)
	string                                             WonMatchPrefix;                                           // 0x0B14(0x000C) (Localized, NeedCtorLink)
	string                                             WonMatchPostFix;                                          // 0x0B20(0x000C) (Localized, NeedCtorLink)
	string                                             WaitingToSpawn;                                           // 0x0B2C(0x000C) (Localized, NeedCtorLink)
	string                                             AtMenus;                                                  // 0x0B38(0x000C) (Localized, NeedCtorLink)
	string                                             YouveWonTheMatch;                                         // 0x0B44(0x000C) (Localized, NeedCtorLink)
	string                                             YouveLostTheMatch;                                        // 0x0B50(0x000C) (Localized, NeedCtorLink)
	string                                             NowViewing;                                               // 0x0B5C(0x000C) (Localized, NeedCtorLink)
	string                                             ScoreText;                                                // 0x0B68(0x000C) (Localized, NeedCtorLink)
	string                                             InitialViewingString;                                     // 0x0B74(0x000C) (Localized, NeedCtorLink)
	class UMaterial*                                   LocationDot;                                              // 0x0B80(0x0004)
	class UMaterial*                                   DefaultCrosshair;                                         // 0x0B84(0x0004)
	class UMaterial*                                   TargetCrosshair;                                          // 0x0B88(0x0004)
	struct FColor                                      DamageFlash[0x4];                                         // 0x0B8C(0x0004)
	float                                              DamageTime[0x4];                                          // 0x0B9C(0x0004)
	byte                                               Emphasized[0x4];                                          // 0x0BAC(0x0001) (Edit)
	int                                                DamageGot;                                                // 0x0BB0(0x0004)
	float                                              fPainSoundLastPlayed;                                     // 0x0BB4(0x0004)
	float                                              fStartTime;                                               // 0x0BB8(0x0004)
	struct FSpriteWidget                               WAttackedBG;                                              // 0x0BBC(0x0040)
	bool                                               bAttacked;                                                // 0x0BFC(0x0004)
	struct FSpriteWidget[]                             Crosshairs;                                               // 0x0C00(0x000C) (Edit, NeedCtorLink)
	struct FColor                                      CustomHUDColor;                                           // 0x0C0C(0x0004)
	bool                                               bUseCustomWeaponCrosshairs;                               // 0x0C10(0x0004)
	float                                              ScreenRatioX;                                             // 0x0C14(0x0004)
	float                                              ScreenRatioY;                                             // 0x0C18(0x0004)
	float                                              ScreenRatioXEx;                                           // 0x0C1C(0x0004)
	float                                              ScreenRatioYEx;                                           // 0x0C20(0x0004)
	float                                              _rX;                                                      // 0x0C24(0x0004)
	float                                              _rY;                                                      // 0x0C28(0x0004)
	float                                              _reX;                                                     // 0x0C2C(0x0004)
	float                                              _reY;                                                     // 0x0C30(0x0004)
	bool                                               IsDrawModeMessage;                                        // 0x0C34(0x0004)
	bool                                               IsDrawSystemMessage;                                      // 0x0C34(0x0004)
	string[]                                           BaseTeamName;                                             // 0x0C38(0x000C) (NeedCtorLink)
	struct FColor                                      BaseTeamColorAlly;                                        // 0x0C44(0x0004) (Edit)
	struct FColor[]                                    BaseTeamColor;                                            // 0x0C48(0x000C) (Edit, NeedCtorLink)
	struct FColor                                      FriendlyColor;                                            // 0x0C54(0x0004) (Edit)
	struct FColor                                      MyselfColor;                                              // 0x0C58(0x0004) (Edit)
	int                                                TimeMinutes;                                              // 0x0C5C(0x0004)
	int                                                TimeSeconds;                                              // 0x0C60(0x0004)
	bool                                               AlreadyGotMessage17_PlayerCantStart;                      // 0x0C64(0x0004)
	string                                             KillerName;                                               // 0x0C68(0x000C) (NeedCtorLink)
	float                                              KillerMarkTimeToRemove;                                   // 0x0C74(0x0004)
	struct FSpriteWidget                               KillerSprite;                                             // 0x0C78(0x0040) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.HudBase");
		return ptr;
	}


	int GetCurGameTime();
	void clearkilllog();
	void userzone(const string& szPath, const string& szCommand);
	void usermove(const string& szPath, const string& szCommand, int nCombatNum);
	void killlog(const string& szPath, const string& szCommand);
	void WorldSpaceOverlays();
	void STATIC_PlayHUDSound(class APlayerController* PC, EeHUDSOUND soundType);
	struct FVector CalcNametagPos(class APawn* curPawn);
	struct FVector CalcNametagPosNative(class APawn* curPawn);
	struct FColor GetNametagColor(class APlayerReplicationInfo* Info);
	void RefreshKillerName(const string& mKillerName);
	void DrawCustomNameTag(class UCanvas* C, const struct FVector& vNameTagPos, class AwPawn* curPawn, const string& strName, float fAdditionalX, float fAdditionalY);
	void DrawNameTag(class UCanvas* C, class AwPawn* curPawn);
	void DrawMissionIcon(class UCanvas* C, class AwPawn* curPawn);
	void DrawSpecialModeIcon(class UCanvas* C, class AwPawn* curPawn);
	void UpdateNameTagInfo(class UCanvas* C, class AwPawn* curPawn, const struct FVector& camLoc, const struct FRotator& camRot);
	void DrawNametagsScript(class UCanvas* C, bool bSpectateMode, bool drawAlways);
	void DrawNametags(class UCanvas* C, bool bSpectateMode, bool drawAlways);
	void DrawNametagsNative(class UCanvas* C, bool bSpectateMode, bool drawAlways);
	void DrawHudSpectating(class UCanvas* C);
	void DrawGMHudSpectating(class UCanvas* C);
	class APlayerReplicationInfo* FindPRI(class APawn* P);
	struct FColor GetBaseTeamColor(int viewerTeamIndex, int targetTeamIndex);
	string GetBaseTeamName(int TeamIndex);
	void DrawWarfareCrosshairExtNative(class UCanvas* C, int Spread);
	void CalculateCoordinateDigitEx(class UCanvas* C, const struct FDigitSet& W, const struct FNumericWidget& N, float fWidth, float fHeight, int Index, struct FCalCoordsW* coordsW);
	void CalculateCoordinateDigit(class UCanvas* C, const struct FDigitSet& W, const struct FNumericWidget& N, float fWidth, float fHeight, int Index, struct FCalCoordsW* coordsW);
	void CalculateCoordinateEx(class UCanvas* C, const struct FSpriteWidget& W, float fWidth, float fHeight, struct FCalCoordsW* coordsW);
	void CalculateCoordinate(class UCanvas* C, const struct FSpriteWidget& W, float fWidth, float fHeight, struct FCalCoordsW* coordsW);
	void DrawTileFromSpriteWidget2(class UCanvas* C, const struct FSpriteWidget& SW, float W, float H);
	void DrawTileFromSpriteWidget(class UCanvas* C, const struct FSpriteWidget& SW);
	void STATIC_ClipScreenCoords(class UCanvas* C, float XL, float YL, float* X, float* Y);
	bool STATIC_IsTargetInFrontOfPlayer2(class UCanvas* C, const struct FVector& TargetPos, const struct FVector& camLoc, const struct FRotator& camRot, struct FVector* ScreenPos);
	bool STATIC_IsTargetInFrontOfPlayer(class UCanvas* C, class AActor* Target, const struct FVector& camLoc, const struct FRotator& camRot, struct FVector* ScreenPos);
	void DrawIntroSubtitles(class UCanvas* C);
	void DrawCinematicHUD(class UCanvas* C);
	void DrawVehicleName(class UCanvas* C);
	void DrawWeaponName(class UCanvas* C);
	class UFont* LoadInstructionFont();
	void SetInstructionKeyText(const string& Text);
	void SetInstructionText(const string& Text);
	void DrawInstructionKeyText(class UCanvas* C);
	void DrawInstructionText(class UCanvas* C);
	void DrawInstructionGfx(class UCanvas* C);
	void SetCropping(bool Active);
	void DrawTargeting(class UCanvas* C);
	void SetTargeting(bool bShow, const struct FVector& TargetLocation, float Size);
	void Draw2DLocationDot(class UCanvas* C, const struct FVector& loc, float OffsetX, float OffsetY, float ScaleX, float ScaleY);
	void CreateKeyMenus();
	void DisplayLocalMessages(class UCanvas* C);
	void DrawMessageWithTexture(class UCanvas* C, int i, float PosX, float PosY, float* dx, float* dy);
	void DrawMessage(class UCanvas* C, int i, float PosX, float PosY, float* dx, float* dy);
	void GetScreenCoords(float PosX, float PosY, class UCanvas* C, float* ScreenX, float* ScreenY, struct FHudLocalizedMessage* Message);
	void LayoutMessage(class UCanvas* C, struct FHudLocalizedMessage* Message);
	void GetLocalStatsScreen();
	struct FColor STATIC_GetTeamColor(byte TeamNum);
	void RemoveLocalizedMessage(class UClass* Message, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject, const string& CriticalString);
	void LocalizedMessage2(class UClass* Message, int Switch, bool bOption_Push, const string& CriticalString);
	void LocalizedMessageEx(class UClass* Message, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject, const string& CriticalString, int iReserve);
	void LocalizedMessage(class UClass* Message, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject, const string& CriticalString);
	void Message(class APlayerReplicationInfo* PRI, const string& Msg, const FName& MsgType);
	void ClearMessage(struct FHudLocalizedMessage* M);
	void AddChildHudPart(class AHudBase* Child);
	void DrawDigitSet(class UCanvas* C, float X, float Y, float OffsetX, float XL, float YL, int Value, const struct FDigitSet& dSet, int totalDigits, const string& paddingChar);
	void DrawCSReviw(class UCanvas* C);
	void DrawNumericWidget(class UCanvas* C, struct FNumericWidget* W, struct FDigitSet* D);
	void DrawSpriteWidget(class UCanvas* C, struct FSpriteWidget* W);
	void DrawHUD(class UCanvas* C);
	void UpdateScreenRatios(class UCanvas* C);
	void DrawAttacked(class UCanvas* C);
	void DrawHeadShotSphere();
	void Tick(float DeltaTime);
	void PlayPainSound(class UCanvas* C);
	void DrawDamageIndicators(class UCanvas* C);
	void DisplayHit(const struct FVector& HitDir, int Damage, class UClass* DamageType);
	void DrawMiniMap(class AwHudPart_MinimapBase* Minimap, class UCanvas* C);
	void SetCustomHUDColor();
	bool CustomHUDColorAllowed();
	void PostBeginPlay();
	void PrecacheFonts(class UCanvas* C);
	void DrawHudPassD(class UCanvas* C);
	void DrawHudPassC(class UCanvas* C);
	void DrawHudPassB(class UCanvas* C);
	void DrawHudPassA(class UCanvas* C);
	void UpdateHUD();
	void DoUpdateTime();
};


// Class XInterface.wHudPart_KillMessage
// 0x059C (0x1254 - 0x0CB8)
class AwHudPart_KillMessage : public AHudBase
{
public:
	class AHudBase*                                    HudOwner;                                                 // 0x0CB8(0x0004)
	class ALevelInfo*                                  LevelOwner;                                               // 0x0CBC(0x0004)
	struct FKillMessageItem[]                          KillMessages;                                             // 0x0CC0(0x000C) (NeedCtorLink)
	class UMaterial*                                   RelatedBG;                                                // 0x0CCC(0x0004) (Edit)
	struct FSpriteWidget                               SpriteWeaponAirStrike;                                    // 0x0CD0(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponAR;                                           // 0x0D10(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponFlameThrower;                                 // 0x0D50(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponGR;                                           // 0x0D90(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponHeadshot;                                     // 0x0DD0(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponMG;                                           // 0x0E10(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponPistol;                                       // 0x0E50(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponRPG;                                          // 0x0E90(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponSMG;                                          // 0x0ED0(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponSR;                                           // 0x0F10(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponMelee;                                        // 0x0F50(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponHelicopter;                                   // 0x0F90(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponUnknown;                                      // 0x0FD0(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponHelicopterKill;                               // 0x1010(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponFell;                                         // 0x1050(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponStepOn;                                       // 0x1090(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponAlienHands;                                   // 0x10D0(0x0040) (Edit)
	int                                                CacheClipX;                                               // 0x1110(0x0004)
	int                                                CacheClipY;                                               // 0x1114(0x0004)
	float                                              MessageDuration;                                          // 0x1118(0x0004)
	int                                                MaxMessages;                                              // 0x111C(0x0004)
	int                                                FontSize;                                                 // 0x1120(0x0004)
	float                                              KillMessageWordSpacing;                                   // 0x1124(0x0004)
	float                                              KillMessageLineSpacing;                                   // 0x1128(0x0004)
	float                                              MarginXFromRight;                                         // 0x112C(0x0004)
	float                                              MarginYFromTop;                                           // 0x1130(0x0004)
	int                                                ShadowX;                                                  // 0x1134(0x0004)
	int                                                ShadowY;                                                  // 0x1138(0x0004)
	struct FColor                                      ShadowColor;                                              // 0x113C(0x0004)
	struct FIntBoxWH                                   Icon_KillSuccession[0xF];                                 // 0x1140(0x0010)
	struct FIntBoxWH                                   Icon_HeadShot;                                            // 0x1230(0x0010)
	struct FIntBoxWH                                   Icon_AimShot;                                             // 0x1240(0x0010)
	class UMaterial*                                   Icon_OptionalKillInfo;                                    // 0x1250(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_KillMessage");
		return ptr;
	}


	void Draw(class UCanvas* C);
	void DrawOnlyImage(class UCanvas* C);
	void DrawOnlyText(class UCanvas* C);
	void UpdateCache(class UCanvas* C);
	void End(class UCanvas* C);
	void Begin(class UCanvas* C);
	void DrawNative(class UCanvas* C);
	void Update();
	void AddKillMessageItem(const struct FKillMessageItem& Item);
	void AddKillMessage(class APlayerReplicationInfo* KillerPRI, class APlayerReplicationInfo* victimPRI, class UClass* DamageType, int Switch);
	struct FColor GetNameColor(class APlayerReplicationInfo* PRI);
	struct FKillMessageItem MakeKillMessageItem(class APlayerReplicationInfo* KillerPRI, class APlayerReplicationInfo* victimPRI, const string& KillerName, const string& VictimName, class UClass* DamageType, int Switch, bool NoKillerName, bool NoVictimName, class UMaterial* overrideImage);
	void Initialize(class AHudBase* myOwner, class ALevelInfo* myLevel);
	void Precache();
};


// Class XInterface.wHudPart_KillMessage_Defence
// 0x02E0 (0x1534 - 0x1254)
class AwHudPart_KillMessage_Defence : public AwHudPart_KillMessage
{
public:
	byte                                               Padding00[0x2E0];                                         // 0x1254(0x02E0) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_KillMessage_Defence");
		return ptr;
	}

};


// Class XInterface.GUIListBoxBase
// 0x003C (0x033C - 0x0300)
class UGUIListBoxBase : public UGUIMultiComponent
{
public:
	string                                             SelectedStyleName;                                        // 0x0300(0x000C) (Edit, NeedCtorLink)
	string                                             SectionStyleName;                                         // 0x030C(0x000C) (Edit, NeedCtorLink)
	string                                             OutlineStyleName;                                         // 0x0318(0x000C) (Edit, NeedCtorLink)
	string                                             DefaultListClass;                                         // 0x0324(0x000C) (Edit, NeedCtorLink)
	class UGUIScrollBarBase*                           MyScrollBar;                                              // 0x0330(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIListBase*                                MyList;                                                   // 0x0334(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, EditInline)
	bool                                               bVisibleWhenEmpty;                                        // 0x0338(0x0004) (Edit)
	bool                                               bSorted;                                                  // 0x0338(0x0004) (Edit)
	bool                                               bInitializeList;                                          // 0x0338(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIListBoxBase");
		return ptr;
	}


	void SetFriendlyLabel(class UGUILabel* NewLabel);
	void SetScrollBarStyle(bool changeScrollZoneStyle, class UGUIStyles* scrollZoneStyle, bool changeIncreaseButtonStyle, class UGUIStyles* increaseButtonStyle, bool changeIncreaseButtonGraphic, class UMaterial* increaseButtonGraphic, bool changeDecreaseButtonStyle, class UGUIStyles* decreaseButtonStyle, bool changeDecreaseButtonGraphic, class UMaterial* decreaseButtonGraphic, bool changeGripButtonStyle, class UGUIStyles* gripButtonStyle);
	void InternalOnCreateComponent(class UGUIComponent* NewComp, class UGUIComponent* Sender);
	void SetHint(const string& NewHint);
	void InitBaseList(class UGUIListBase* LocalList);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class XInterface.GUIListBox
// 0x0004 (0x0340 - 0x033C)
class UGUIListBox : public UGUIListBoxBase
{
public:
	class UGUIList*                                    List;                                                     // 0x033C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIListBox");
		return ptr;
	}


	bool MyClose(class UGUIContextMenu* Sender);
	bool MyOpen(class UGUIContextMenu* Menu);
	int ItemCount();
	void InternalOnChange(class UGUIComponent* Sender);
	bool InternalOnDblClick(class UGUIComponent* Sender);
	bool InternalOnClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitBaseList(class UGUIListBase* LocalList);
};


// Class XInterface.GUIScrollTextBox
// 0x0040 (0x037C - 0x033C)
class UGUIScrollTextBox : public UGUIListBoxBase
{
public:
	class UGUIScrollText*                              MyScrollText;                                             // 0x033C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bRepeat;                                                  // 0x0340(0x0004) (Edit)
	bool                                               bNoTeletype;                                              // 0x0340(0x0004) (Edit)
	bool                                               bStripColors;                                             // 0x0340(0x0004) (Edit)
	float                                              InitialDelay;                                             // 0x0344(0x0004) (Edit)
	float                                              CharDelay;                                                // 0x0348(0x0004) (Edit)
	float                                              EOLDelay;                                                 // 0x034C(0x0004) (Edit)
	float                                              RepeatDelay;                                              // 0x0350(0x0004) (Edit)
	EeTextAlign                                        TextAlign;                                                // 0x0354(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x0355(0x0003) MISSED OFFSET
	string                                             Separator;                                                // 0x0358(0x000C) (Edit, NeedCtorLink)
	string                                             ESC;                                                      // 0x0364(0x000C) (Edit, NeedCtorLink)
	string                                             Comma;                                                    // 0x0370(0x000C) (Edit, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIScrollTextBox");
		return ptr;
	}


	void AddText(const string& NewText);
	string StripColors(const string& MyString);
	bool IsNumber(const string& Num);
	void InternalOnAdjustTop(class UGUIComponent* Sender);
	void Stop();
	void Restart();
	void SetContent(const string& NewContent, const string& sep);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitBaseList(class UGUIListBase* LocalList);
	void InternalOnCreateComponent(class UGUIComponent* NewComp, class UGUIComponent* Sender);
	void Created();
};


// Class XInterface.GUIMultiColumnListBox
// 0x002C (0x0368 - 0x033C)
class UGUIMultiColumnListBox : public UGUIListBoxBase
{
public:
	class UGUIMultiColumnListHeader*                   Header;                                                   // 0x033C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	bool                                               bDisplayHeader;                                           // 0x0340(0x0004) (Edit)
	class UGUIMultiColumnList*                         List;                                                     // 0x0344(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, EditInline)
	float[]                                            HeaderColumnPerc;                                         // 0x0348(0x000C) (Edit, NeedCtorLink)
	string[]                                           ColumnHeadings;                                           // 0x0354(0x000C) (Edit, Localized, NeedCtorLink)
	int                                                OffsetBetweenHeaderAndList;                               // 0x0360(0x0004) (Edit)
	bool                                               bFullHeightStyle;                                         // 0x0364(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIMultiColumnListBox");
		return ptr;
	}


	void SetHeaderStyle(bool changeStyle, const string& stylez, bool changeBarStyle, const string& barStylez);
	void InternalOnColumnSized(int Column);
	void InternalOnCreateComponent(class UGUIComponent* NewComp, class UGUIComponent* Sender);
	void InternalOnLoadINI(class UGUIComponent* Sender, const string& S);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitBaseList(class UGUIListBase* LocalList);
};


// Class XInterface.GUITreeListBox
// 0x0004 (0x0340 - 0x033C)
class UGUITreeListBox : public UGUIListBoxBase
{
public:
	byte                                               Padding00[0x4];                                           // 0x033C(0x0004) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUITreeListBox");
		return ptr;
	}

};


// Class XInterface.GUIListBase
// 0x00C8 (0x0384 - 0x02BC)
class UGUIListBase : public UGUIComponent
{
public:
	bool                                               bAllowEmptyItems;                                         // 0x02BC(0x0004) (Edit)
	bool                                               bInitializeList;                                          // 0x02BC(0x0004) (Edit)
	bool                                               bMultiSelect;                                             // 0x02BC(0x0004) (Edit)
	bool                                               bSorted;                                                  // 0x02BC(0x0004) (Edit)
	bool                                               bHotTrack;                                                // 0x02BC(0x0004) (Edit)
	bool                                               bHotTrackSound;                                           // 0x02BC(0x0004) (Edit)
	bool                                               bHotTrackStrictMode;                                      // 0x02BC(0x0004) (Edit)
	bool                                               bHotTrackOnInactive;                                      // 0x02BC(0x0004) (Edit)
	bool                                               bDrawSelectionBorder;                                     // 0x02BC(0x0004) (Edit)
	bool                                               bVisibleWhenEmpty;                                        // 0x02BC(0x0004) (Edit)
	bool                                               bNotify;                                                  // 0x02BC(0x0004) (Edit)
	class UGUIScrollBarBase*                           MyScrollBar;                                              // 0x02C0(0x0004) (Edit, ExportObject, NeedCtorLink, NoExport, EditInline)
	bool                                               bAlwaysShowScrollbar;                                     // 0x02C4(0x0004) (Edit)
	bool                                               bForceScrollBarPosition;                                  // 0x02C4(0x0004) (Edit)
	float                                              ForcedScrollbarWinLeft;                                   // 0x02C8(0x0004) (Edit)
	float                                              ForcedScrollbarWinTop;                                    // 0x02CC(0x0004) (Edit)
	float                                              ForcedScrollbarWinWidth;                                  // 0x02D0(0x0004) (Edit)
	float                                              ForcedScrollbarWinHeight;                                 // 0x02D4(0x0004) (Edit)
	string                                             SelectedStyleName;                                        // 0x02D8(0x000C) (Edit, NeedCtorLink)
	string                                             SectionStyleName;                                         // 0x02E4(0x000C) (Edit, NeedCtorLink)
	string                                             OutlineStyleName;                                         // 0x02F0(0x000C) (Edit, NeedCtorLink)
	class UGUIStyles*                                  SelectedStyle;                                            // 0x02FC(0x0004) (Edit, ExportObject, NeedCtorLink, NoExport, EditInline)
	class UGUIStyles*                                  SectionStyle;                                             // 0x0300(0x0004) (Edit, ExportObject, NeedCtorLink, NoExport, EditInline)
	class UGUIStyles*                                  OutlineStyle;                                             // 0x0304(0x0004) (Edit, ExportObject, NeedCtorLink, NoExport, EditInline)
	EeTextAlign                                        SectionJustification;                                     // 0x0308(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x0309(0x0003) MISSED OFFSET
	class UMaterial*                                   SelectedImage;                                            // 0x030C(0x0004) (Edit)
	struct FColor                                      SelectedBKColor;                                          // 0x0310(0x0004) (Edit)
	int                                                Top;                                                      // 0x0314(0x0004) (Edit, EditConst, NoExport)
	int                                                Index;                                                    // 0x0318(0x0004) (Edit, EditConst, NoExport)
	int                                                ItemsPerPage;                                             // 0x031C(0x0004) (Edit, Const, EditConst, NoExport)
	float                                              ItemHeight;                                               // 0x0320(0x0004) (Edit, EditConst, NoExport)
	float                                              ItemWidth;                                                // 0x0324(0x0004) (Edit, EditConst, NoExport)
	int                                                ItemCount;                                                // 0x0328(0x0004) (Edit, EditConst, NoExport)
	int[]                                              SelectedItems;                                            // 0x032C(0x000C) (Edit, EditConst, NeedCtorLink, NoExport)
	int                                                LastSelected;                                             // 0x0338(0x0004) (Edit, EditConst, NoExport)
	int                                                LastPressX;                                               // 0x033C(0x0004) (Edit, EditConst, NoExport)
	int                                                LastPressY;                                               // 0x0340(0x0004) (Edit, EditConst, NoExport)
	int                                                DropIndex;                                                // 0x0344(0x0004) (Edit, EditConst, NoExport)
	int                                                MightRemove;                                              // 0x0348(0x0004) (Edit, EditConst, NoExport)
	class UGUIComponent*[]                             LinkedObjects;                                            // 0x034C(0x000C) (Edit, EditFixedSize, NeedCtorLink, NoExport)
	bool                                               bMousePress;                                              // 0x0358(0x0004)
	bool                                               bMouseRelease;                                            // 0x0358(0x0004)
	struct FScriptDelegate                             __OnScrollBy__Delegate;                                   // 0x035C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnDrawItem__Delegate;                                   // 0x0364(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnAdjustTop__Delegate;                                  // 0x036C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnTrack__Delegate;                                      // 0x0374(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __CheckLinkedObjects__Delegate;                           // 0x037C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIListBase");
		return ptr;
	}


	void SetOutlineAlpha(int NewAlpha);
	bool IsMultiSelect();
	void InternalOnDragLeave(class UGUIComponent* Sender);
	void InternalOnDragEnter(class UGUIComponent* Sender);
	void InternalOnDragOver(class UGUIComponent* Sender);
	bool InternalOnDragDrop(class UGUIComponent* Sender);
	void InternalOnEndDrag(class UGUIComponent* Accepting, bool bAccepted);
	bool InternalOnRightClick(class UGUIComponent* Sender);
	void CheckDragSelect();
	bool InternalOnBeginDrag(class UGUIComponent* Sender);
	void InternalOnMouseRelease(class UGUIComponent* Sender);
	void InternalOnMousePressed(class UGUIComponent* Sender, bool IsRepeat);
	void End();
	void home();
	void PgDn();
	void PgUp();
	void WheelDown();
	void WheelUp();
	bool MoveLeft();
	bool MoveRight();
	bool Down();
	bool Up();
	bool InternalOnKeyEvent(float Delta, byte* key, byte* KeyState);
	string[] GetPendingItems(bool bGuarantee);
	string GetItemAtIndex(int idx);
	string AdditionalDebugString();
	bool IsValidIndex(int i);
	bool IsValid();
	void DisableLinkedObjects();
	void EnableLinkedObjects();
	void InitLinkObjects(class UGUIComponent*[] NewObj, bool bNoCheck);
	int AddLinkObject(class UGUIComponent* NewObj, bool bNoCheck);
	void SetTopItem(int Item);
	void MakeVisible(float perc);
	void Clear();
	void ClearPendingElements();
	void IndexChanged(class UGUIComponent* Sender);
	int SetIndex(int NewIndex);
	int MultiCalculateIndex(bool bRequireValidIndex);
	int CalculateIndex(bool bRequireValidIndex);
	int SilentSetIndex(int NewIndex);
	void Sort();
	void UpdateScrollbarForcedPosition();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void CheckLinkedObjects(class UGUIListBase* List);
	void OnTrack(class UGUIComponent* Sender, int LastIndex);
	void OnAdjustTop(class UGUIComponent* Sender);
	void OnDrawItem(class UCanvas* Canvas, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending);
	void OnScrollBy(class UGUIComponent* Sender);
};


// Class XInterface.GUIVertList
// 0x000C (0x0390 - 0x0384)
class UGUIVertList : public UGUIListBase
{
public:
	bool                                               CallDrawItemForPlaceHoldingItems;                         // 0x0384(0x0004)
	struct FScriptDelegate                             __GetItemHeight__Delegate;                                // 0x0388(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIVertList");
		return ptr;
	}


	void PgDn();
	void PgUp();
	void End();
	void home();
	bool Down();
	bool Up();
	void WheelDown();
	void WheelUp();
	bool InternalOnKeyType(const string& Unicode, byte* key);
	bool InternalOnClick(class UGUIComponent* Sender);
	int MultiCalculateIndex(bool bRequireValidIndex);
	int CalculateIndex(bool bRequireValidIndex);
	void CenterMouse();
	float GetItemHeight(class UCanvas* C);
};


// Class XInterface.GUIList
// 0x0030 (0x03C0 - 0x0390)
class UGUIList : public UGUIVertList
{
public:
	EeTextAlign                                        TextAlign;                                                // 0x0390(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x0391(0x0003) MISSED OFFSET
	struct FGUIListElem[]                              Elements;                                                 // 0x0394(0x000C) (Edit, EditFixedSize, EditConst, NeedCtorLink)
	struct FGUIListElem[]                              SelectedElements;                                         // 0x03A0(0x000C) (Edit, EditFixedSize, EditConst, NeedCtorLink)
	struct FColor                                      OfficialColor;                                            // 0x03AC(0x0004) (Edit)
	struct FColor                                      Official2004Color;                                        // 0x03B0(0x0004) (Edit)
	struct FColor                                      BonusPackColor;                                           // 0x03B4(0x0004) (Edit)
	struct FScriptDelegate                             __CompareItem__Delegate;                                  // 0x03B8(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIList");
		return ptr;
	}


	struct FGUIListElem[] GetPendingElements(bool bGuarantee);
	void ClearPendingElements();
	bool InternalOnDragDrop(class UGUIComponent* Sender);
	void InternalOnEndDrag(class UGUIComponent* Accepting, bool bAccepted);
	int FindIndex(const string& test, bool bExact, bool bExtra, class UObject* TestObject);
	int FindItemObject(class UObject* obj);
	int FindExtra(const string& Text, bool bExact);
	string Find(const string& Text, bool bExact, bool bExtra);
	void RemoveExtra(const string& str);
	void RemoveObject(class UObject* obj);
	void RemoveItem(const string& Item);
	void SetExtraAtIndex(int i, const string& NewExtra);
	void SetObjectAtIndex(int i, class UObject* NewObject);
	void SetItemAtIndex(int i, const string& NewItem);
	void GetAtIndex(int i, string* ItemStr, class UObject** ExtraObj, string* ExtraStr);
	string GetExtraAtIndex(int i);
	class UObject* GetObjectAtIndex(int i);
	string GetItemAtIndex(int i);
	bool IsSection();
	string GetExtra();
	class UObject* GetObject();
	string Get(bool bGuarantee);
	string SelectedText();
	void Clear();
	int RemoveElement(const struct FGUIListElem& elem, int Count, bool bNoSort);
	int RemoveSilent(int i, int Count);
	int Remove(int i, int Count, bool bNoSort);
	void LoadFrom(class UGUIList* Source, bool bClearFirst);
	void Swap(int IndexA, int IndexB);
	void InsertElement(int i, const struct FGUIListElem& NewElem, bool bNoSort);
	void Insert(int i, const string& NewItem, class UObject* obj, const string& str, bool bNoSort, bool bSection);
	void Replace(int i, const string& NewItem, class UObject* obj, const string& str, bool bNoSort);
	void AddElement(const struct FGUIListElem& NewElem);
	void Add(const string& NewItem, class UObject* obj, const string& str, bool bSection);
	int CompareItem(const struct FGUIListElem& ElemA, const struct FGUIListElem& ElemB);
	void Sort();
	void SortList();
};


// Class XInterface.GUIScrollText
// 0x006C (0x042C - 0x03C0)
class UGUIScrollText : public UGUIList
{
public:
	int                                                MaxHistory;                                               // 0x03C0(0x0004) (Edit, EditConst)
	string                                             NewText;                                                  // 0x03C4(0x000C) (Edit, EditConst, NeedCtorLink)
	string                                             ClickedString;                                            // 0x03D0(0x000C) (Edit, EditConst, NeedCtorLink)
	string                                             Content;                                                  // 0x03DC(0x000C) (Edit, EditConst, NeedCtorLink)
	string                                             Separator;                                                // 0x03E8(0x000C) (Edit, EditConst, NeedCtorLink)
	int                                                VisibleLines;                                             // 0x03F4(0x0004) (Edit, EditConst)
	int                                                VisibleChars;                                             // 0x03F8(0x0004) (Edit, EditConst)
	float                                              oldWidth;                                                 // 0x03FC(0x0004) (Edit, EditConst)
	EeScrollState                                      ScrollState;                                              // 0x0400(0x0001) (Edit, EditConst)
	byte                                               Padding00[0x3];                                           // 0x0401(0x0003) MISSED OFFSET
	bool                                               bNewContent;                                              // 0x0404(0x0004) (Edit, EditConst)
	bool                                               bStopped;                                                 // 0x0404(0x0004) (Edit, EditConst)
	bool                                               bReceivedNewContent;                                      // 0x0404(0x0004) (Const, EditConst)
	bool                                               bRepeat;                                                  // 0x0404(0x0004) (Edit)
	bool                                               bNoTeletype;                                              // 0x0404(0x0004) (Edit)
	bool                                               bClickText;                                               // 0x0404(0x0004) (Edit)
	float                                              InitialDelay;                                             // 0x0408(0x0004) (Edit)
	float                                              CharDelay;                                                // 0x040C(0x0004) (Edit)
	float                                              EOLDelay;                                                 // 0x0410(0x0004) (Edit)
	float                                              RepeatDelay;                                              // 0x0414(0x0004) (Edit)
	string[]                                           StringElements;                                           // 0x0418(0x000C) (Edit, EditFixedSize, EditConst, NeedCtorLink)
	struct FScriptDelegate                             __OnEndOfLine__Delegate;                                  // 0x0424(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIScrollText");
		return ptr;
	}


	bool IsValid();
	void EndScrolling();
	bool InternalOnKeyEvent(float Delta, byte* key, byte* State);
	bool InternalOnKeyType(const string& Unicode, byte* key);
	bool InternalOnClick(class UGUIComponent* Sender);
	void Timer();
	bool SkipChar();
	void Restart();
	void Stop();
	void SetContent(const string& NewContent, const string& sep);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void Dump();
	void OnEndOfLine();
	string GetWordUnderCursor();
};


// Class XInterface.GUIMultiOptionList
// 0x002C (0x03BC - 0x0390)
class UGUIMultiOptionList : public UGUIVertList
{
public:
	byte                                               Padding00[0x2C];                                          // 0x0390(0x002C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIMultiOptionList");
		return ptr;
	}

};


// Class XInterface.GUITreeList
// 0x0034 (0x03C4 - 0x0390)
class UGUITreeList : public UGUIVertList
{
public:
	byte                                               Padding00[0x34];                                          // 0x0390(0x0034) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUITreeList");
		return ptr;
	}

};


// Class XInterface.GUIHorzList
// 0x0000 (0x0384 - 0x0384)
class UGUIHorzList : public UGUIListBase
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIHorzList");
		return ptr;
	}

};


// Class XInterface.GUICircularList
// 0x000C (0x0390 - 0x0384)
class UGUICircularList : public UGUIListBase
{
public:
	byte                                               Padding00[0xC];                                           // 0x0384(0x000C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUICircularList");
		return ptr;
	}

};


// Class XInterface.GUICharacterList
// 0x0020 (0x03B0 - 0x0390)
class UGUICharacterList : public UGUICircularList
{
public:
	byte                                               Padding00[0x20];                                          // 0x0390(0x0020) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUICharacterList");
		return ptr;
	}

};


// Class XInterface.GUIMultiColumnListHeader
// 0x0024 (0x02E0 - 0x02BC)
class UGUIMultiColumnListHeader : public UGUIComponent
{
public:
	class UGUIMultiColumnList*                         MyList;                                                   // 0x02BC(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline)
	int                                                SizingCol;                                                // 0x02C0(0x0004) (Edit, Const, EditConst)
	int                                                ClickingCol;                                              // 0x02C4(0x0004) (Edit, Const, EditConst)
	bool                                               UseManualHeight;                                          // 0x02C8(0x0004) (Edit)
	float                                              ManualHeight;                                             // 0x02CC(0x0004) (Edit)
	class UGUIStyles*                                  BarStyle;                                                 // 0x02D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             BarStyleName;                                             // 0x02D4(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIMultiColumnListHeader");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class XInterface.MultiSelectList
// 0x000C (0x03CC - 0x03C0)
class UMultiSelectList : public UGUIList
{
public:
	byte                                               Padding00[0xC];                                           // 0x03C0(0x000C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.MultiSelectList");
		return ptr;
	}

};


// Class XInterface.GUICircularImageList
// 0x000C (0x039C - 0x0390)
class UGUICircularImageList : public UGUICircularList
{
public:
	byte                                               Padding00[0xC];                                           // 0x0390(0x000C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUICircularImageList");
		return ptr;
	}

};


// Class XInterface.GUIVertImageList
// 0x004C (0x03DC - 0x0390)
class UGUIVertImageList : public UGUIVertList
{
public:
	EeCellStyle                                        CellStyle;                                                // 0x0390(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x0391(0x0003) MISSED OFFSET
	float                                              ImageScale;                                               // 0x0394(0x0004) (Edit)
	int                                                NoVisibleRows;                                            // 0x0398(0x0004) (Edit)
	int                                                NoVisibleCols;                                            // 0x039C(0x0004) (Edit)
	int                                                HorzBorder;                                               // 0x03A0(0x0004) (Edit)
	int                                                VertBorder;                                               // 0x03A4(0x0004) (Edit)
	struct FImageListElem[]                            Elements;                                                 // 0x03A8(0x000C) (Edit, EditFixedSize, EditConst, NeedCtorLink)
	struct FImageListElem[]                            SelectedElements;                                         // 0x03B4(0x000C) (Edit, EditFixedSize, EditConst, NeedCtorLink)
	class UMaterial*                                   LockedMat;                                                // 0x03C0(0x0004) (Edit)
	bool                                               CallDrawItemForPlaceHoldingItemsInFixedCountCellStyle;    // 0x03C4(0x0004)
	float                                              LastValidClickTime;                                       // 0x03C8(0x0004)
	struct FScriptDelegate                             __OnItemDblClick__Delegate;                               // 0x03CC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnIsSelectibleIndex__Delegate;                          // 0x03D4(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIVertImageList");
		return ptr;
	}


	bool InternalOnDragDrop(class UGUIComponent* Sender);
	void InternalOnEndDrag(class UGUIComponent* Accepting, bool bAccepted);
	int FindItem(int Item);
	int FindImage(class UMaterial* Image);
	void RemoveItem(int Item);
	void RemoveImage(class UMaterial* Image);
	void SetItemAtIndex(int i, int NewItem);
	void SetImageAtIndex(int i, class UMaterial* NewImage);
	struct FImageListElem[] GetPendingElements(bool bGuarantee);
	void ClearPendingElements();
	bool IsLocked();
	bool IndexLocked(int i);
	void GetAtIndex(int i, class UMaterial** Image, int* Item, int* Locked);
	int GetItemIntAtIndex(int i);
	string GetItemAtIndex(int i);
	class UMaterial* GetImageAtIndex(int i);
	int GetItem();
	class UMaterial* Get(bool bGuarantee);
	void Clear();
	int RemoveElement(const struct FImageListElem& elem, int Count);
	int RemoveSilent(int i, int Count);
	int Remove(int i, int Count);
	void LoadFrom(class UGUIVertImageList* Source, bool bClearFirst);
	void Swap(int IndexA, int IndexB);
	void InsertElement(int i, const struct FImageListElem& NewElem, int Locked);
	void Insert(int i, class UMaterial* NewImage, int NewItem, int Locked);
	void Replace(int i, class UMaterial* NewImage, int NewItem, int Locked);
	void AddImage(const struct FImageListElem& NewElem, int Locked);
	void Add(class UMaterial* Image, int Item, int Locked);
	void SetTopItem(int Item);
	void MakeVisible(float perc);
	void PgDn();
	void PgUp();
	void End();
	void home();
	bool MoveLeft();
	bool MoveRight();
	bool Down();
	bool Up();
	int SetIndex(int NewIndex);
	bool InternalOnClick(class UGUIComponent* Sender);
	bool OnIsSelectibleIndex(class UGUIComponent* Sender, int Index);
	bool OnItemDblClick(class UGUIComponent* Sender);
	int CalculateIndex(bool bRequireValidIndex);
};


// Class XInterface.GUIMultiColumnList
// 0x006C (0x03FC - 0x0390)
class UGUIMultiColumnList : public UGUIVertList
{
public:
	string[]                                           ColumnHeadings;                                           // 0x0390(0x000C) (Edit, Localized, NeedCtorLink)
	float[]                                            InitColumnPerc;                                           // 0x039C(0x000C) (Edit, NeedCtorLink)
	string[]                                           ColumnHeadingHints;                                       // 0x03A8(0x000C) (Edit, Localized, NeedCtorLink)
	struct FMultiColumnSortData[]                      SortData;                                                 // 0x03B4(0x000C) (Const, NeedCtorLink)
	int[]                                              InvSortData;                                              // 0x03C0(0x000C) (Const, NeedCtorLink)
	float[]                                            ColumnWidths;                                             // 0x03CC(0x000C) (Edit, Const, EditConst, NeedCtorLink)
	float                                              CellSpacing;                                              // 0x03D8(0x0004) (Edit)
	int                                                SortColumn;                                               // 0x03DC(0x0004) (Edit)
	bool                                               NeedsSorting;                                             // 0x03E0(0x0004) (Edit)
	bool                                               SortDescending;                                           // 0x03E0(0x0004) (Edit)
	bool                                               ExpandLastColumn;                                         // 0x03E0(0x0004) (Edit)
	int                                                NoVisibleRows;                                            // 0x03E4(0x0004) (Edit)
	int                                                NoVisibleCols;                                            // 0x03E8(0x0004) (Edit)
	struct FScriptDelegate                             __OnColumnSized__Delegate;                                // 0x03EC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __GetSortString__Delegate;                                // 0x03F4(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIMultiColumnList");
		return ptr;
	}


	void SetTopItem(int Item);
	void Dump();
	void Sort();
	void GetCellLeftWidth(int Column, float* Left, float* width);
	bool InternalOnPreDraw(class UCanvas* C);
	void InitializeColumns(class UCanvas* C);
	void ResolutionChanged(int ResX, int ResY);
	void RemovedCurrent();
	void Clear();
	void OnSortChanged();
	int CurrentListId();
	string GetSortString(int YourArrayIndex);
	void AddedItem(int YourArrayIndex);
	void RemovedItem(int YourArrayIndex);
	void UpdatedItem(int YourArrayIndex);
	void SortList();
	void ChangeSortOrder();
	int GetListIndex(int YourArrayIndex);
	void OnColumnSized(int Column);
};


// Class XInterface.GUIMultiColumnListDerived
// 0x0000 (0x03FC - 0x03FC)
class UGUIMultiColumnListDerived : public UGUIMultiColumnList
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIMultiColumnListDerived");
		return ptr;
	}

};


// Class XInterface.BTTcpHandler_DS_Script
// 0x0010 (0x0044 - 0x0034)
class UBTTcpHandler_DS_Script : public UBTTcpHandler_DS_Script_Interface
{
public:
	byte                                               Padding00[0x10];                                          // 0x0034(0x0010) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.BTTcpHandler_DS_Script");
		return ptr;
	}

};


// Class XInterface.GUILabel
// 0x0050 (0x030C - 0x02BC)
class UGUILabel : public UGUIComponent
{
public:
	string                                             Caption;                                                  // 0x02BC(0x000C) (Edit, Localized, NeedCtorLink)
	EeTextAlign                                        TextAlign;                                                // 0x02C8(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x02C9(0x0003) MISSED OFFSET
	struct FColor                                      TextColor;                                                // 0x02CC(0x0004) (Edit)
	struct FColor                                      FocusedTextColor;                                         // 0x02D0(0x0004) (Edit)
	EMenuRenderStyle                                   TextStyle;                                                // 0x02D4(0x0001) (Edit)
	byte                                               Padding01[0x3];                                           // 0x02D5(0x0003) MISSED OFFSET
	string                                             TextFont;                                                 // 0x02D8(0x000C) (Edit, NeedCtorLink)
	bool                                               bTransparent;                                             // 0x02E4(0x0004) (Edit)
	bool                                               bMultiLine;                                               // 0x02E4(0x0004) (Edit)
	EeTextAlign                                        VertAlign;                                                // 0x02E8(0x0001) (Edit)
	byte                                               Padding02[0x3];                                           // 0x02E9(0x0003) MISSED OFFSET
	struct FColor                                      BackColor;                                                // 0x02EC(0x0004) (Edit)
	struct FColor                                      ShadowColor;                                              // 0x02F0(0x0004) (Edit)
	float                                              ShadowOffsetX;                                            // 0x02F4(0x0004) (Edit)
	float                                              ShadowOffsetY;                                            // 0x02F8(0x0004) (Edit)
	struct FColor                                      HilightColor;                                             // 0x02FC(0x0004) (Edit)
	float                                              HilightOffsetX;                                           // 0x0300(0x0004) (Edit)
	float                                              HilightOffsetY;                                           // 0x0304(0x0004) (Edit)
	int                                                FontSize;                                                 // 0x0308(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUILabel");
		return ptr;
	}

};


// Class XInterface.GUIBorder
// 0x0014 (0x0314 - 0x0300)
class UGUIBorder : public UGUIMultiComponent
{
public:
	string                                             Caption;                                                  // 0x0300(0x000C) (Edit, Localized, NeedCtorLink)
	EeTextAlign                                        Justification;                                            // 0x030C(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x030D(0x0003) MISSED OFFSET
	int                                                TextIndent;                                               // 0x0310(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIBorder");
		return ptr;
	}


	string GetCaption();
	void SetCaption(const string& NewCaption);
};


// Class XInterface.GUITitleBar
// 0x0010 (0x0324 - 0x0314)
class UGUITitleBar : public UGUIBorder
{
public:
	class UGUITabControl*                              DockedTabs;                                               // 0x0314(0x0004) (ExportObject, NeedCtorLink, EditInline)
	EePageAlign                                        DockAlign;                                                // 0x0318(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x0319(0x0003) MISSED OFFSET
	bool                                               bUseTextHeight;                                           // 0x031C(0x0004) (Edit)
	bool                                               bDockTop;                                                 // 0x031C(0x0004) (Edit)
	class UMaterial*                                   Effect;                                                   // 0x0320(0x0004) (Const)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUITitleBar");
		return ptr;
	}

};


// Class XInterface.GUITabControl
// 0x004C (0x034C - 0x0300)
class UGUITabControl : public UGUIMultiComponent
{
public:
	bool                                               bFillSpace;                                               // 0x0300(0x0004) (Edit)
	bool                                               bDockPanels;                                              // 0x0300(0x0004) (Edit)
	bool                                               bDrawTabAbove;                                            // 0x0300(0x0004) (Edit)
	bool                                               bFillBackground;                                          // 0x0300(0x0004) (Edit)
	struct FColor                                      FillColor;                                                // 0x0304(0x0004) (Edit)
	float                                              FadeInTime;                                               // 0x0308(0x0004) (Edit)
	float                                              TabHeight;                                                // 0x030C(0x0004) (Edit)
	string                                             BackgroundStyleName;                                      // 0x0310(0x000C) (Edit, NeedCtorLink)
	class UMaterial*                                   BackgroundImage;                                          // 0x031C(0x0004) (Edit)
	class UGUITabButton*[]                             TabStack;                                                 // 0x0320(0x000C) (Edit, EditConst, NeedCtorLink, NoExport)
	class UGUITabButton*                               ActiveTab;                                                // 0x032C(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	class UGUITabButton*                               PendingTab;                                               // 0x0330(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	class UGUIStyles*                                  BackgroundStyle;                                          // 0x0334(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	class UGUIBorder*                                  MyFooter;                                                 // 0x0338(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	bool                                               bForceManualTabButtonStyle;                               // 0x033C(0x0004) (Edit)
	string                                             ManualTabButtonStyleName;                                 // 0x0340(0x000C) (Edit, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUITabControl");
		return ptr;
	}


	void LevelChanged();
	void free();
	void CenterMouse();
	bool FocusLast(class UGUIComponent* Sender);
	bool FocusFirst(class UGUIComponent* Sender);
	void InternalOnActivate();
	void SetVisibility(bool bIsVisible);
	class UGUITabPanel* BorrowPanel(const string& Caption);
	class UGUITabPanel* FindPanelClass(class UClass* PanelClass);
	int TabIndex(const string& tabname);
	bool PrevControl(class UGUIComponent* Sender);
	bool NextControl(class UGUIComponent* Sender);
	bool PrevPage();
	bool NextPage();
	bool InternalTabClick(class UGUIComponent* Sender);
	bool ActivateTabByPanel(class UGUITabPanel* Panel, bool bFocusPanel);
	bool ActivateTabByName(const string& tabname, bool bFocusPanel);
	bool ActivateTab(class UGUITabButton* Who, bool bFocusPanel);
	void MakeTabActive(class UGUITabButton* Who);
	bool LostActiveTab();
	void RemoveTab(const string& Caption, class UGUITabButton* Who);
	class UGUITabPanel* ReplaceTab(class UGUITabButton* Which, const string& Caption, const string& PanelClass, class UGUITabPanel* ExistingPanel, const string& InHint, bool bForceActive);
	class UGUITabPanel* InsertTab(int pos, const string& Caption, const string& PanelClass, class UGUITabPanel* ExistingPanel, const string& InHint, bool bForceActive);
	class UGUITabPanel* AddTab(const string& InCaption, const string& PanelClass, class UGUITabPanel* ExistingPanel, const string& InHint, bool bForceActive);
	class UGUITabPanel* AddTabItem(const struct FGUITabItem& Item);
	bool InternalOnKeyEvent(float Delta, byte* key, byte* State);
	void Closed(class UGUIComponent* Sender, bool bCancelled);
	void Opened(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class XInterface.GUIButton
// 0x0038 (0x02F4 - 0x02BC)
class UGUIButton : public UGUIComponent
{
public:
	EeTextAlign                                        CaptionAlign;                                             // 0x02BC(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x02BD(0x0003) MISSED OFFSET
	class UGUIStyles*                                  CaptionEffectStyle;                                       // 0x02C0(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, EditInline)
	string                                             CaptionEffectStyleName;                                   // 0x02C4(0x000C) (Edit, NeedCtorLink)
	string                                             Caption;                                                  // 0x02D0(0x000C) (Edit, Localized, NeedCtorLink)
	struct FPaddingPercent                             AutoSizePadding;                                          // 0x02DC(0x0008) (Edit)
	string                                             SizingCaption;                                            // 0x02E4(0x000C) (Edit, NeedCtorLink)
	bool                                               bAutoSize;                                                // 0x02F0(0x0004) (Edit)
	bool                                               bAutoShrink;                                              // 0x02F0(0x0004) (Edit)
	bool                                               bWrapCaption;                                             // 0x02F0(0x0004) (Edit)
	bool                                               bUseCaptionHeight;                                        // 0x02F0(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIButton");
		return ptr;
	}


	bool InternalOnKeyEvent(float Delta, byte* key, byte* State);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class XInterface.GUITabButton
// 0x0008 (0x02FC - 0x02F4)
class UGUITabButton : public UGUIButton
{
public:
	bool                                               bForceFlash;                                              // 0x02F4(0x0004)
	bool                                               bActive;                                                  // 0x02F4(0x0004)
	class UGUITabPanel*                                MyPanel;                                                  // 0x02F8(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUITabButton");
		return ptr;
	}


	bool CanShowPanel();
	bool ChangeActiveState(bool IsActive, bool bFocusPanel);
	void SetFocus(class UGUIComponent* Who);
};


// Class XInterface.GUIPanel
// 0x0010 (0x0310 - 0x0300)
class UGUIPanel : public UGUIMultiComponent
{
public:
	class UMaterial*                                   Background;                                               // 0x0300(0x0004) (Edit)
	bool                                               SetControlsBoundToParent;                                 // 0x0304(0x0004)
	bool                                               SetControlsScaleToParent;                                 // 0x0304(0x0004)
	struct FScriptDelegate                             __OnPostDraw__Delegate;                                   // 0x0308(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIPanel");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool OnPostDraw(class UCanvas* Canvas);
};


// Class XInterface.GUITabPanel
// 0x0020 (0x0330 - 0x0310)
class UGUITabPanel : public UGUIPanel
{
public:
	string                                             PanelCaption;                                             // 0x0310(0x000C) (Edit, Localized, NeedCtorLink)
	bool                                               bFillHeight;                                              // 0x031C(0x0004) (Edit)
	float                                              FadeInTime;                                               // 0x0320(0x0004) (Edit)
	class UGUITabButton*                               MyButton;                                                 // 0x0324(0x0004) (ExportObject, NeedCtorLink, NoExport, EditInline)
	float                                              CursorUSize;                                              // 0x0328(0x0004)
	float                                              CursorVSize;                                              // 0x032C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUITabPanel");
		return ptr;
	}


	bool CheckIn(const struct FFloatBox& fb, int X, int Y);
	struct FFloatBox GetTooltipPos(int tooltipWidth, int tooltipHeight, int nOffsetX, int nOffsetY);
	bool CanShowPanel();
	void ShowPanel(bool bShow);
	void free();
	void OnDestroyPanel(bool bCancelled);
	void InitPanel();
	void Refresh();
};


// Class XInterface.GUIGFXButton
// 0x0010 (0x0304 - 0x02F4)
class UGUIGFXButton : public UGUIButton
{
public:
	int                                                ImageIndex;                                               // 0x02F4(0x0004) (Edit)
	class UMaterial*                                   Graphic;                                                  // 0x02F8(0x0004) (Edit)
	EeIconPosition                                     Position;                                                 // 0x02FC(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x02FD(0x0003) MISSED OFFSET
	bool                                               bCheckBox;                                                // 0x0300(0x0004) (Edit)
	bool                                               bClientBound;                                             // 0x0300(0x0004) (Edit)
	bool                                               bChecked;                                                 // 0x0300(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIGFXButton");
		return ptr;
	}


	bool InternalOnClick(class UGUIComponent* Sender);
	void SetChecked(bool bNewChecked);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class XInterface.GUICheckBoxButton
// 0x002C (0x0330 - 0x0304)
class UGUICheckBoxButton : public UGUIGFXButton
{
public:
	byte                                               Padding00[0x2C];                                          // 0x0304(0x002C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUICheckBoxButton");
		return ptr;
	}

};


// Class XInterface.GUISpinnerButton
// 0x0010 (0x0304 - 0x02F4)
class UGUISpinnerButton : public UGUIButton
{
public:
	byte                                               Padding00[0x10];                                          // 0x02F4(0x0010) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUISpinnerButton");
		return ptr;
	}

};


// Class XInterface.GUIEditBox
// 0x0074 (0x0368 - 0x02F4)
class UGUIEditBox : public UGUIButton
{
public:
	int                                                MaxTextStrNum;                                            // 0x02F4(0x0004)
	string                                             IMEText;                                                  // 0x02F8(0x000C) (NeedCtorLink)
	int                                                IMESelPosStart;                                           // 0x0304(0x0004)
	int                                                IMESelPosEnd;                                             // 0x0308(0x0004)
	int                                                IMECompSize;                                              // 0x030C(0x0004)
	string                                             TextStr;                                                  // 0x0310(0x000C) (Edit, NeedCtorLink)
	string                                             AllowedCharSet;                                           // 0x031C(0x000C) (Edit, NeedCtorLink)
	bool                                               bMaskText;                                                // 0x0328(0x0004) (Edit)
	bool                                               bIntOnly;                                                 // 0x0328(0x0004) (Edit)
	bool                                               bFloatOnly;                                               // 0x0328(0x0004) (Edit)
	bool                                               bIncludeSign;                                             // 0x0328(0x0004) (Edit)
	bool                                               bConvertSpaces;                                           // 0x0328(0x0004) (Edit)
	int                                                MaxWidth;                                                 // 0x032C(0x0004) (Edit)
	EeTextCase                                         TextCase;                                                 // 0x0330(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x0331(0x0003) MISSED OFFSET
	int                                                BorderOffsets[0x4];                                       // 0x0334(0x0004) (Edit)
	bool                                               bReadOnly;                                                // 0x0344(0x0004) (Edit)
	bool                                               bAlwaysNotify;                                            // 0x0344(0x0004) (Edit)
	int                                                CaretPos;                                                 // 0x0348(0x0004)
	int                                                FirstVis;                                                 // 0x034C(0x0004)
	int                                                LastSizeX;                                                // 0x0350(0x0004)
	int                                                LastCaret;                                                // 0x0354(0x0004)
	int                                                LastLength;                                               // 0x0358(0x0004)
	bool                                               bAllSelected;                                             // 0x035C(0x0004)
	byte                                               LastKey;                                                  // 0x0360(0x0001)
	byte                                               Padding01[0x3];                                           // 0x0361(0x0003) MISSED OFFSET
	float                                              DelayTime;                                                // 0x0364(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIEditBox");
		return ptr;
	}


	void IMEInputCancel();
	void InternalDeactivate();
	void InternalActivate();
	void TextChanged();
	string GetText();
	string ConvertIllegal(const string& inputstr);
	bool InternalOnKeyEvent(float Delta, byte* key, byte* State);
	bool InternalOnKeyType(const string& Unicode, byte* key);
	void DeleteChar();
	void SetText(const string& NewText);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool OnIME_Notify(int Type, int LangID, const string& strText, int nStartPos, int nSize);
};


// Class XInterface.GUINumericEdit
// 0x0028 (0x0328 - 0x0300)
class UGUINumericEdit : public UGUIMultiComponent
{
public:
	byte                                               Padding00[0x28];                                          // 0x0300(0x0028) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUINumericEdit");
		return ptr;
	}

};


// Class XInterface.GUIFloatEdit
// 0x0028 (0x0328 - 0x0300)
class UGUIFloatEdit : public UGUIMultiComponent
{
public:
	byte                                               Padding00[0x28];                                          // 0x0300(0x0028) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIFloatEdit");
		return ptr;
	}

};


// Class XInterface.GUIScrollBarBase
// 0x0058 (0x0358 - 0x0300)
class UGUIScrollBarBase : public UGUIMultiComponent
{
public:
	EOrientation                                       Orientation;                                              // 0x0300(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x0301(0x0003) MISSED OFFSET
	int                                                Step;                                                     // 0x0304(0x0004) (Edit)
	float                                              GripPos;                                                  // 0x0308(0x0004)
	float                                              GripSize;                                                 // 0x030C(0x0004)
	float                                              GrabOffset;                                               // 0x0310(0x0004)
	int                                                MinGripPixels;                                            // 0x0314(0x0004) (Edit)
	class UGUIListBase*                                MyList;                                                   // 0x0318(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                BigStep;                                                  // 0x031C(0x0004) (Edit)
	int                                                ItemCount;                                                // 0x0320(0x0004) (Edit)
	int                                                ItemsPerPage;                                             // 0x0324(0x0004) (Edit)
	int                                                CurPos;                                                   // 0x0328(0x0004)
	bool                                               bScrollStyle;                                             // 0x032C(0x0004)
	class UGUIScrollZoneBase*                          MyScrollZone;                                             // 0x0330(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIScrollButtonBase*                        MyIncreaseButton;                                         // 0x0334(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIScrollButtonBase*                        MyDecreaseButton;                                         // 0x0338(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIGripButtonBase*                          MyGripButton;                                             // 0x033C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FScriptDelegate                             __PositionChanged__Delegate;                              // 0x0340(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __MoveGripBy__Delegate;                                   // 0x0348(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __AlignThumb__Delegate;                                   // 0x0350(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIScrollBarBase");
		return ptr;
	}


	void SetFriendlyLabel(class UGUILabel* NewLabel);
	bool GripPreDraw(class UGUIComponent* Sender);
	void Refocus(class UGUIComponent* Who);
	void AlignThumb();
	void WheelDown();
	void WheelUp();
	bool IncreaseClick(class UGUIComponent* Sender);
	bool DecreaseClick(class UGUIComponent* Sender);
	void MoveGripBy(int items);
	void UpdateGripPosition(float NewPos);
	void SetList(class UGUIListBase* List);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void PositionChanged(int NewPos);
};


// Class XInterface.GUIScrollButtonBase
// 0x0004 (0x0308 - 0x0304)
class UGUIScrollButtonBase : public UGUIGFXButton
{
public:
	bool                                               bIncreaseButton;                                          // 0x0304(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIScrollButtonBase");
		return ptr;
	}

};


// Class XInterface.GUIScrollZoneBase
// 0x0008 (0x02C4 - 0x02BC)
class UGUIScrollZoneBase : public UGUIComponent
{
public:
	struct FScriptDelegate                             __OnScrollZoneClick__Delegate;                            // 0x02BC(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIScrollZoneBase");
		return ptr;
	}


	bool InternalOnClick(class UGUIComponent* Sender);
	void OnScrollZoneClick(float Delta);
};


// Class XInterface.GUIGripButtonBase
// 0x0000 (0x0304 - 0x0304)
class UGUIGripButtonBase : public UGUIGFXButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIGripButtonBase");
		return ptr;
	}

};


// Class XInterface.GUIComboBox
// 0x0040 (0x0340 - 0x0300)
class UGUIComboBox : public UGUIMultiComponent
{
public:
	bool                                               bReadOnly;                                                // 0x0300(0x0004) (Edit)
	bool                                               bValueReadOnly;                                           // 0x0300(0x0004) (Edit)
	bool                                               bIgnoreChangeWhenTyping;                                  // 0x0300(0x0004) (Edit)
	bool                                               bShowListOnFocus;                                         // 0x0300(0x0004) (Edit)
	int                                                MaxVisibleItems;                                          // 0x0304(0x0004) (Edit)
	int                                                Index;                                                    // 0x0308(0x0004) (Edit, EditConst)
	string                                             TextStr;                                                  // 0x030C(0x000C) (Edit, EditConst, NeedCtorLink)
	class UGUIList*                                    List;                                                     // 0x0318(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, EditInline)
	class UGUIEditBox*                                 Edit;                                                     // 0x031C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIScrollButtonBase*                        MyShowListBtn;                                            // 0x0320(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIListBox*                                 MyListBox;                                                // 0x0324(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UMaterial*                                   GraphicOnShow;                                            // 0x0328(0x0004)
	class UMaterial*                                   GraphicOnHide;                                            // 0x032C(0x0004)
	struct FScriptDelegate                             __OnShowList__Delegate;                                   // 0x0330(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnHideList__Delegate;                                   // 0x0338(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIComboBox");
		return ptr;
	}


	bool FocusLast(class UGUIComponent* Sender);
	bool FocusFirst(class UGUIComponent* Sender);
	void LoseFocus(class UGUIComponent* Sender);
	void SetFriendlyLabel(class UGUILabel* NewLabel);
	void CenterMouse();
	void Clear();
	void InternalOnMousePressed(class UGUIComponent* Sender, bool bRepeat);
	void ReadOnly(bool B);
	int ItemCount();
	int FindIndex(const string& test, bool bExact, bool bExtra, class UObject* obj);
	int FindExtra(const string& Text, bool bExact);
	string Find(const string& Text, bool bExact, bool bExtra);
	class UObject* GetItemObject(int Index);
	string GetItem(int Index);
	void RemoveItem(int Item, int Count);
	void AddItem(const string& Item, class UObject* Extra, const string& str);
	int GetIndex();
	void SetIndex(int i);
	string GetExtra();
	class UObject* GetObject();
	string GetText();
	string Get();
	void SetExtra(const string& NewExtra, bool bListItemsOnly);
	void SetText(const string& NewText, bool bListItemsOnly);
	void TextChanged(class UGUIComponent* Sender);
	void ItemChanged(class UGUIComponent* Sender);
	bool ShowListBox(class UGUIComponent* Sender);
	void SetVisibility(bool bIsVisible);
	void HideListBox();
	void InternalOnLoadINI(class UGUIComponent* Sender, const string& S);
	string InternalOnSaveINI(class UGUIComponent* Sender);
	bool InternalListClick(class UGUIComponent* Sender);
	void InternalEditPressed(class UGUIComponent* Sender, bool bRepeat);
	void InternalOnInvalidate(class UGUIComponent* Who);
	void InternalListDeActivate();
	bool InternalOnKeyEvent(float Delta, byte* key, byte* State);
	void SetHint(const string& NewHint);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void OnHideList();
	void OnShowList();
};


// Class XInterface.GUIMenuOption
// 0x004C (0x034C - 0x0300)
class UGUIMenuOption : public UGUIMultiComponent
{
public:
	bool                                               bIgnoreChange;                                            // 0x0300(0x0004) (Edit, EditConst)
	bool                                               bValueReadOnly;                                           // 0x0300(0x0004) (Edit)
	bool                                               bAutoSizeCaption;                                         // 0x0300(0x0004) (Edit)
	bool                                               bHeightFromComponent;                                     // 0x0300(0x0004) (Edit)
	bool                                               bFlipped;                                                 // 0x0300(0x0004) (Edit)
	bool                                               bSquare;                                                  // 0x0300(0x0004) (Edit)
	bool                                               bVerticalLayout;                                          // 0x0300(0x0004) (Edit)
	EeTextAlign                                        LabelJustification;                                       // 0x0304(0x0001) (Edit)
	EeTextAlign                                        ComponentJustification;                                   // 0x0305(0x0001) (Edit)
	byte                                               Padding00[0x2];                                           // 0x0306(0x0002) MISSED OFFSET
	float                                              CaptionWidth;                                             // 0x0308(0x0004) (Edit)
	float                                              ComponentWidth;                                           // 0x030C(0x0004) (Edit)
	string                                             Caption;                                                  // 0x0310(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             ComponentClassName;                                       // 0x031C(0x000C) (Edit, NeedCtorLink)
	string                                             LabelFont;                                                // 0x0328(0x000C) (Edit, NeedCtorLink)
	string                                             LabelStyleName;                                           // 0x0334(0x000C) (Edit, NeedCtorLink)
	struct FColor                                      LabelColor;                                               // 0x0340(0x0004) (Edit)
	class UGUILabel*                                   MyLabel;                                                  // 0x0344(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	class UGUIComponent*                               MyComponent;                                              // 0x0348(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIMenuOption");
		return ptr;
	}


	void SetFriendlyLabel(class UGUILabel* NewLabel);
	void CenterMouse();
	void InternalOnCreateComponent(class UGUIComponent* NewComp, class UGUIComponent* Sender);
	void InternalOnChange(class UGUIComponent* Sender);
	bool MenuOptionClicked(class UGUIComponent* Sender);
	void SetCaption(const string& NewCaption);
	void SetHint(const string& NewHint);
	void SetReadOnly(bool bValue);
	void ResetComponent();
	string GetComponentValue();
	void SetComponentValue(const string& NewValue, bool bNoChange);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class XInterface.GUISplitter
// 0x003C (0x034C - 0x0310)
class UGUISplitter : public UGUIPanel
{
public:
	byte                                               Padding00[0x3C];                                          // 0x0310(0x003C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUISplitter");
		return ptr;
	}

};


// Class XInterface.GUISlider
// 0x0050 (0x030C - 0x02BC)
class UGUISlider : public UGUIComponent
{
public:
	byte                                               Padding00[0x50];                                          // 0x02BC(0x0050) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUISlider");
		return ptr;
	}

};


// Class XInterface.GUIImage
// 0x0040 (0x02FC - 0x02BC)
class UGUIImage : public UGUIComponent
{
public:
	class UMaterial*                                   Image;                                                    // 0x02BC(0x0004) (Edit)
	class UMaterial*                                   DropShadow;                                               // 0x02C0(0x0004) (Edit)
	struct FColor                                      ImageColor;                                               // 0x02C4(0x0004) (Edit)
	EeImgStyle                                         ImageStyle;                                               // 0x02C8(0x0001) (Edit)
	EMenuRenderStyle                                   ImageRenderStyle;                                         // 0x02C9(0x0001) (Edit)
	EeImgAlign                                         ImageAlign;                                               // 0x02CA(0x0001) (Edit)
	byte                                               Padding00[0x1];                                           // 0x02CB(0x0001) MISSED OFFSET
	int                                                X1;                                                       // 0x02CC(0x0004) (Edit)
	int                                                Y1;                                                       // 0x02D0(0x0004) (Edit)
	int                                                X2;                                                       // 0x02D4(0x0004) (Edit)
	int                                                Y2;                                                       // 0x02D8(0x0004) (Edit)
	int                                                DropShadowX;                                              // 0x02DC(0x0004) (Edit)
	int                                                DropShadowY;                                              // 0x02E0(0x0004) (Edit)
	float                                              BorderOffsets[0x4];                                       // 0x02E4(0x0004) (Edit)
	float                                              X3;                                                       // 0x02F4(0x0004) (Edit)
	float                                              y3;                                                       // 0x02F8(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIImage");
		return ptr;
	}


	string AdditionalDebugString();
};


// Class XInterface.GUISectionBackground
// 0x0078 (0x0374 - 0x02FC)
class UGUISectionBackground : public UGUIImage
{
public:
	class UGUIStyles*                                  CaptionStyle;                                             // 0x02FC(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	string                                             CaptionStyleName;                                         // 0x0300(0x000C) (Edit, NeedCtorLink)
	int                                                AltCaptionOffset[0x4];                                    // 0x030C(0x0004) (Edit)
	EeTextAlign                                        AltCaptionAlign;                                          // 0x031C(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x031D(0x0003) MISSED OFFSET
	bool                                               bAltCaption;                                              // 0x0320(0x0004) (Edit)
	bool                                               bRemapStack;                                              // 0x0320(0x0004) (Edit)
	bool                                               bFillClient;                                              // 0x0320(0x0004) (Edit)
	class UGUIComponent*[]                             AlignStack;                                               // 0x0324(0x000C) (Edit, NeedCtorLink, NoExport, EditInline, DataBinding)
	class UMaterial*                                   HeaderTop;                                                // 0x0330(0x0004) (Edit)
	class UMaterial*                                   HeaderBar;                                                // 0x0334(0x0004) (Edit)
	class UMaterial*                                   HeaderBase;                                               // 0x0338(0x0004) (Edit)
	string                                             Caption;                                                  // 0x033C(0x000C) (Edit, Localized, NeedCtorLink)
	float                                              ColPadding;                                               // 0x0348(0x0004) (Edit)
	float                                              LeftPadding;                                              // 0x034C(0x0004) (Edit)
	float                                              RightPadding;                                             // 0x0350(0x0004) (Edit)
	float                                              TopPadding;                                               // 0x0354(0x0004) (Edit)
	float                                              BottomPadding;                                            // 0x0358(0x0004) (Edit)
	float                                              ImageOffset[0x4];                                         // 0x035C(0x0004) (Edit)
	int                                                NumColumns;                                               // 0x036C(0x0004) (Edit)
	int                                                MaxPerColumn;                                             // 0x0370(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUISectionBackground");
		return ptr;
	}


	void SetPosition(float NewLeft, float NewTop, float NewWidth, float NewHeight, bool bRelative);
	void ResolutionChanged(int ResX, int ResY);
	bool InternalPreDraw(class UCanvas* C);
	void Reset();
	int FindComponentIndex(class UGUIComponent* Comp);
	bool UnmanageComponent(class UGUIComponent* Comp);
	bool ManageComponent(class UGUIComponent* Component);
	void SetVisibility(bool bIsVisible);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class XInterface.CoolImage
// 0x0030 (0x02EC - 0x02BC)
class UCoolImage : public UGUIComponent
{
public:
	byte                                               Padding00[0x30];                                          // 0x02BC(0x0030) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.CoolImage");
		return ptr;
	}

};


// Class XInterface.GUIProgressBar
// 0x0058 (0x0314 - 0x02BC)
class UGUIProgressBar : public UGUIComponent
{
public:
	byte                                               Padding00[0x58];                                          // 0x02BC(0x0058) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIProgressBar");
		return ptr;
	}

};


// Class XInterface.GUIContextMenu
// 0x0048 (0x0304 - 0x02BC)
class UGUIContextMenu : public UGUIComponent
{
public:
	string[]                                           ContextItems;                                             // 0x02BC(0x000C) (Localized, NeedCtorLink)
	int                                                ItemIndex;                                                // 0x02C8(0x0004)
	string                                             SelectionStyleName;                                       // 0x02CC(0x000C) (NeedCtorLink)
	class UGUIStyles*                                  SelectionStyle;                                           // 0x02D8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                ItemHeight;                                               // 0x02DC(0x0004)
	bool                                               bAutoItemHeight;                                          // 0x02E0(0x0004)
	struct FScriptDelegate                             __OnOpen__Delegate;                                       // 0x02E4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnClose__Delegate;                                      // 0x02EC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnSelect__Delegate;                                     // 0x02F4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnContextHitTest__Delegate;                             // 0x02FC(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIContextMenu");
		return ptr;
	}


	bool ReplaceItem(int Index, const string& NewItem);
	bool RemoveItemByIndex(int Index);
	bool RemoveItemByName(const string& ItemName);
	int InsertItem(const string& NewItem, int Index);
	int AddItem(const string& NewItem);
	bool OnContextHitTest(float MouseX, float MouseY);
	void OnSelect(class UGUIContextMenu* Sender, int ClickIndex);
	bool OnClose(class UGUIContextMenu* Sender);
	bool OnOpen(class UGUIContextMenu* Sender);
};


// Class XInterface.GUIToolTip
// 0x0078 (0x0334 - 0x02BC)
class UGUIToolTip : public UGUIComponent
{
public:
	bool                                               bResetPosition;                                           // 0x02BC(0x0004) (Edit)
	bool                                               bTrackMouse;                                              // 0x02BC(0x0004) (Edit)
	bool                                               bMultiLine;                                               // 0x02BC(0x0004) (Edit)
	bool                                               bTrackInput;                                              // 0x02BC(0x0004) (Edit)
	string                                             Text;                                                     // 0x02C0(0x000C) (Edit, Const, NeedCtorLink)
	string[]                                           Lines;                                                    // 0x02CC(0x000C) (Edit, Const, NeedCtorLink)
	float                                              StartTime;                                                // 0x02D8(0x0004) (Edit, NoExport)
	float                                              CurrentTime;                                              // 0x02DC(0x0004) (Edit, NoExport)
	float                                              MaxWidth;                                                 // 0x02E0(0x0004) (Edit, Config, GlobalConfig)
	float                                              InitialDelay;                                             // 0x02E4(0x0004) (Edit, Config, GlobalConfig)
	float                                              ExpirationSeconds;                                        // 0x02E8(0x0004) (Edit, Config, GlobalConfig)
	struct FScriptDelegate                             __EnterArea__Delegate;                                    // 0x02EC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __LeaveArea__Delegate;                                    // 0x02F4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __Tick__Delegate;                                         // 0x02FC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __ShowToolTip__Delegate;                                  // 0x0304(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __HideToolTip__Delegate;                                  // 0x030C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __GetLeft__Delegate;                                      // 0x0314(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __GetTop__Delegate;                                       // 0x031C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __GetWidth__Delegate;                                     // 0x0324(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __GetHeight__Delegate;                                    // 0x032C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIToolTip");
		return ptr;
	}


	void SetTip(const string& NewTip);
	float GetTopBelowCursor(class UCanvas* C);
	float GetTopAboveCursor(class UCanvas* C);
	float GetHeight(class UCanvas* C);
	float GetWidth(class UCanvas* C);
	float GetTop(class UCanvas* C);
	float GetLeft(class UCanvas* C);
	void UpdatePosition(class UCanvas* C);
	void HideToolTip();
	void ShowToolTip();
	void Tick(float RealSeconds);
	bool InternalLeaveArea();
	bool LeaveArea();
	class UGUIToolTip* InternalEnterArea();
	class UGUIToolTip* EnterArea();
};


// Class XInterface.StateButton
// 0x0018 (0x030C - 0x02F4)
class UStateButton : public UGUIButton
{
public:
	byte                                               Padding00[0x18];                                          // 0x02F4(0x0018) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.StateButton");
		return ptr;
	}

};


// Class XInterface.GUIController
// 0x03EC (0x045C - 0x0070)
class UGUIController : public UBaseGUIController
{
public:
	class UGUIPage*                                    SaveFadeOutPage;                                          // 0x0070(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bSaveCancelled;                                           // 0x0074(0x0004)
	class UBTTcpLink_Channel*                          TcpHandler;                                               // 0x0078(0x0004)
	int                                                FONT_NUM;                                                 // 0x007C(0x0004) (Const)
	int                                                STYLE_NUM;                                                // 0x0080(0x0004) (Const)
	int                                                CURSOR_NUM;                                               // 0x0084(0x0004) (Const)
	struct FProfileStruct[]                            Profilers;                                                // 0x0088(0x000C) (NeedCtorLink)
	struct FFloatBox                                   MouseCursorBounds;                                        // 0x0094(0x0010) (Const)
	struct FVector[]                                   MouseCursorOffset;                                        // 0x00A4(0x000C) (NeedCtorLink, EditInline)
	class UGUIPage*[]                                  MenuStack;                                                // 0x00B0(0x000C) (ExportObject, NeedCtorLink, EditInline)
	class UGUIPage*[]                                  PersistentStack;                                          // 0x00BC(0x000C) (NeedCtorLink)
	class UGUIFont*[]                                  FontStack;                                                // 0x00C8(0x000C) (NeedCtorLink, EditInline)
	class UGUIStyles*[]                                StyleStack;                                               // 0x00D4(0x000C) (NeedCtorLink)
	class UMaterial*[]                                 MouseCursors;                                             // 0x00E0(0x000C) (NeedCtorLink, EditInline)
	class UMaterial*[]                                 ImageList;                                                // 0x00EC(0x000C) (NeedCtorLink)
	string[]                                           DefaultStyleNames;                                        // 0x00F8(0x000C) (NeedCtorLink)
	string[]                                           StyleNames;                                               // 0x0104(0x000C) (NeedCtorLink)
	struct FAutoLoadMenu[]                             AutoLoad;                                                 // 0x0110(0x000C) (NeedCtorLink)
	struct FRestoreMenuItem[]                          RestoreMenus;                                             // 0x011C(0x000C) (NeedCtorLink)
	struct FDesignModeHint[]                           DesignModeHints;                                          // 0x0128(0x000C) (NeedCtorLink)
	float                                              MenuMouseSens;                                            // 0x0134(0x0004)
	float                                              MouseX;                                                   // 0x0138(0x0004)
	float                                              MouseY;                                                   // 0x013C(0x0004)
	float                                              LastMouseX;                                               // 0x0140(0x0004)
	float                                              LastMouseY;                                               // 0x0144(0x0004)
	float                                              DblClickWindow;                                           // 0x0148(0x0004)
	float                                              LastClickTime;                                            // 0x014C(0x0004)
	float                                              ButtonRepeatDelay;                                        // 0x0150(0x0004)
	float                                              RepeatDelta;                                              // 0x0154(0x0004)
	float                                              RepeatTime;                                               // 0x0158(0x0004)
	float                                              CursorFade;                                               // 0x015C(0x0004)
	float                                              FastCursorFade;                                           // 0x0160(0x0004)
	int                                                MaxSimultaneousPings;                                     // 0x0164(0x0004)
	int                                                FastCursorStep;                                           // 0x0168(0x0004)
	int                                                ResX;                                                     // 0x016C(0x0004) (Const)
	int                                                ResY;                                                     // 0x0170(0x0004) (Const)
	int                                                LastClickX;                                               // 0x0174(0x0004)
	int                                                LastClickY;                                               // 0x0178(0x0004)
	int                                                CursorStep;                                               // 0x017C(0x0004)
	struct FPointer                                    Designer;                                                 // 0x0180(0x0004) (Const, Transient)
	struct FPointer                                    PawnDesigner;                                             // 0x0184(0x0004) (Const, Transient)
	struct FPointer                                    WeaponDesigner;                                           // 0x0188(0x0004) (Const, Transient)
	string                                             MouseOverSound;                                           // 0x018C(0x000C) (NeedCtorLink)
	string                                             ClickSound;                                               // 0x0198(0x000C) (NeedCtorLink)
	string                                             EditSound;                                                // 0x01A4(0x000C) (NeedCtorLink)
	string                                             UpSound;                                                  // 0x01B0(0x000C) (NeedCtorLink)
	string                                             DownSound;                                                // 0x01BC(0x000C) (NeedCtorLink)
	string                                             DragSound;                                                // 0x01C8(0x000C) (NeedCtorLink)
	string                                             FadeSound;                                                // 0x01D4(0x000C) (NeedCtorLink)
	string                                             ItemEquipSuccessSound;                                    // 0x01E0(0x000C) (NeedCtorLink)
	string                                             ItemEquipFailSound;                                       // 0x01EC(0x000C) (NeedCtorLink)
	string                                             ItemTakeoffSound;                                         // 0x01F8(0x000C) (NeedCtorLink)
	string                                             ItemAddPartsSound;                                        // 0x0204(0x000C) (NeedCtorLink)
	string                                             ItemRepairSound;                                          // 0x0210(0x000C) (NeedCtorLink)
	string                                             ItemClickSound;                                           // 0x021C(0x000C) (NeedCtorLink)
	string                                             ItemBuySound;                                             // 0x0228(0x000C) (NeedCtorLink)
	string                                             ItemSellSound;                                            // 0x0234(0x000C) (NeedCtorLink)
	string                                             TrophyWindowSound;                                        // 0x0240(0x000C) (NeedCtorLink)
	string                                             TrophyReceiverUserSound;                                  // 0x024C(0x000C) (NeedCtorLink)
	class UGUIPage*                                    ActivePage;                                               // 0x0258(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UGUIComponent*                               FocusedControl;                                           // 0x025C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UGUIComponent*                               ActiveControl;                                            // 0x0260(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UGUIComponent*                               SkipControl;                                              // 0x0264(0x0004) (ExportObject, NeedCtorLink, EditInline, Deprecated)
	class UGUIComponent*                               MoveControl;                                              // 0x0268(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UGUIComponent*                               DropSource;                                               // 0x026C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UGUIComponent*                               DropTarget;                                               // 0x0270(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UGUIContextMenu*                             ContextMenu;                                              // 0x0274(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UGUIToolTip*                                 MouseOver;                                                // 0x0278(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UMaterial*                                   WhiteBorder;                                              // 0x027C(0x0004)
	string                                             GameResolution;                                           // 0x0280(0x000C) (NeedCtorLink)
	string                                             LastGameType;                                             // 0x028C(0x000C) (Transient, NeedCtorLink)
	string                                             RequestDataMenu;                                          // 0x0298(0x000C) (NeedCtorLink)
	string                                             ArrayPropertyMenu;                                        // 0x02A4(0x000C) (NeedCtorLink)
	string                                             DynArrayPropertyMenu;                                     // 0x02B0(0x000C) (NeedCtorLink)
	string                                             FilterMenu;                                               // 0x02BC(0x000C) (NeedCtorLink)
	string                                             MapVotingMenu;                                            // 0x02C8(0x000C) (NeedCtorLink)
	string                                             KickVotingMenu;                                           // 0x02D4(0x000C) (NeedCtorLink)
	string                                             MatchSetupMenu;                                           // 0x02E0(0x000C) (NeedCtorLink)
	string                                             EditFavoriteMenu;                                         // 0x02EC(0x000C) (NeedCtorLink)
	string[]                                           MainMenuOptions;                                          // 0x02F8(0x000C) (NeedCtorLink)
	string                                             DesignerMenu;                                             // 0x0304(0x000C) (NeedCtorLink)
	byte                                               RepeatKey;                                                // 0x0310(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0311(0x0003) MISSED OFFSET
	bool                                               bIgnoreUntilPress;                                        // 0x0314(0x0004)
	bool                                               bSnapCursor;                                              // 0x0314(0x0004)
	bool                                               bCurMenuInitialized;                                      // 0x0314(0x0004)
	bool                                               bExpertMode;                                              // 0x0314(0x0004)
	bool                                               bAutoRefreshBrowser;                                      // 0x0314(0x0004)
	bool                                               bModAuthor;                                               // 0x0314(0x0004)
	bool                                               bDesignMode;                                              // 0x0314(0x0004)
	bool                                               bInteractiveMode;                                         // 0x0314(0x0004)
	bool                                               bHighlightCurrent;                                        // 0x0314(0x0004)
	bool                                               bDrawFullPaths;                                           // 0x0314(0x0004)
	bool                                               MainNotWanted;                                            // 0x0314(0x0004)
	bool                                               bForceMouseCheck;                                         // 0x0314(0x0004)
	bool                                               bIgnoreNextRelease;                                       // 0x0314(0x0004)
	bool                                               ShiftPressed;                                             // 0x0314(0x0004)
	bool                                               AltPressed;                                               // 0x0314(0x0004)
	bool                                               CtrlPressed;                                              // 0x0314(0x0004)
	bool                                               bModulateStackedMenus;                                    // 0x0314(0x0004)
	bool                                               bQuietMenu;                                               // 0x0314(0x0004)
	bool                                               bNoToolTips;                                              // 0x0314(0x0004)
	bool                                               bDesignModeToolTips;                                      // 0x0314(0x0004)
	float                                              RenderDelta;                                              // 0x0318(0x0004)
	float                                              LastRenderTime;                                           // 0x031C(0x0004)
	bool                                               bFixedMouseSize;                                          // 0x0320(0x0004)
	byte                                               KeyDown[0xFF];                                            // 0x0324(0x0001) (Const)
	byte                                               Padding01[0x1];                                           // 0x0423(0x0001) MISSED OFFSET
	class UClass*[]                                    RegisteredClasses;                                        // 0x0424(0x000C) (NeedCtorLink)
	bool                                               bECEEdition;                                              // 0x0430(0x0004)
	int                                                iTempWeaponId;                                            // 0x0434(0x0004)
	class UGUIPage*[]                                  SavedPage;                                                // 0x0438(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnNeedRawKeyPress__Delegate;                            // 0x0444(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __AddBuddy__Delegate;                                     // 0x044C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __PressedCloseWndBtn__Delegate;                           // 0x0454(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIController");
		return ptr;
	}


	class UGUIQuestionPage* ShowQuestionDialog(const string& Question, byte Buttons, byte defButton);
	bool KeyPressed(EInputKey iKey);
	bool SearchBinds(const string& BindAliasMask, string[]* BindAliases);
	bool GetAssignedKeys(const string& BindAlias, string[]* BindKeyNames, string[]* LocalizedBindKeyNames);
	bool GetCurrentBind(const string& BindKeyName, string* BindKeyValue);
	bool KeyNameFromIndex(byte iKey, string* KeyName, string* LocalizedKeyName);
	bool SetKeyBind(const string& BindKeyName, const string& BindKeyValue);
	string STATIC_GetQuitPage();
	string STATIC_GetSettingsPage();
	string STATIC_GetModPage();
	string STATIC_GetInstantActionPage();
	string STATIC_GetMultiplayerPage();
	string STATIC_GetServerBrowserPage();
	string STATIC_GetSinglePlayerPage();
	string STATIC_GetMainMenuClass();
	void STATIC_Validate();
	void ConsolidateMenus();
	void PurgeComponentClasses();
	void PurgeObjectReferences();
	void VerifyStack();
	void CloseOverlays();
	void NotifyLevelChange();
	void SetRequiredGameResolution(const string& GameRes);
	bool NeedsMenuResolution();
	bool CanShowHints();
	bool HasMouseMoved(float ErrorMargin);
	void MoveFocused(class UGUIComponent* C, int bmLeft, int bmTop, int bmWidth, int bmHeight, float ClipX, float ClipY, float val);
	void ResetFocus();
	void ChangeFocus(class UGUIComponent* Who);
	void SetControllerStatus(bool On);
	void PerformRestore();
	void SaveRestorePages();
	int Count();
	void CloseAll(bool bCancel, bool bForced);
	bool ClickCloseWndBtn();
	void PressedCloseWndBtn();
	bool CloseMenu(bool bCancelled);
	bool RemoveMenu(class UGUIPage* Menu, bool bCancelled);
	bool RemoveMenuAt(int Index, bool bCancelled);
	void PopMenu(int Index, class UGUIPage* CurMenu, bool bCancelled);
	void PushMenu(int Index, class UGUIPage* NewMenu, const string& Param1, const string& Param2);
	void ReplaceMenu2(const string& NewMenuName, bool bCancelled);
	void ReplaceMenu2_FadedOut();
	void CloseMenuPage(class UGUIPage* SelectPage, bool bCancelled);
	bool ReplaceMenu(const string& NewMenuName, const string& Param1, const string& Param2, bool bCancelled);
	void AutoLoadMenus();
	bool OpenMenuByObject(class UGUIPage* NewMenu, const string& Param1, const string& Param2);
	bool OpenMenu(const string& NewMenuName, const string& Param1, const string& Param2);
	class UGUIPage* CreateMenu(const string& NewMenuName);
	class UGUIPage* GetLastMenu();
	void LogControlInfo(class UGUIComponent* Sender);
	void LogControllerInfo();
	void LogMenuStack();
	class UGUIPage* GetMenuByIndex(int Index);
	class UGUIPage* FindMenuByClass(class UClass* PageClass);
	class UGUIPage* FindPersistentMenuByClass(class UClass* PageClass);
	int FindPersistentMenuIndex(class UGUIPage* Menu);
	int FindMenuIndex(class UGUIPage* Menu);
	int FindMenuIndexByName(const string& MenuClass);
	class UGUIPage* FindPersistentMenuByName(const string& MenuClass);
	class UClass* AddComponentClass(const string& ClassName);
	bool RegisterStyle(class UClass* StyleClass, bool bTemporary);
	void PrecachePlayerRecords();
	void InitializeController();
	class UGUIPage* TopPage();
	void GetTeamSymbolList(bool bNoSinglePlayer, string[]* SymbolNames);
	string LoadDecoText(const string& PackageName, const string& DecoTextName);
	bool CheckForECE();
	bool AuthroizeFirewall();
	bool CheckFirewall();
	void LaunchURL(const string& URL);
	void GetMapList(const string& Prefix, class UGUIList* List, bool bDecoText);
	void GetWeaponList(class UClass*[]* WeaponClass, string[]* WeaponDesc);
	void SaveOwnageList(struct FeOwnageMap[] Maps);
	void GetOwnageList(int[]* RLevel, string[]* MNames, string[]* MDesc, string[]* mURL);
	bool GetDEMHeader(const string& DemoName, string* MapName, string* GameType, int* ScoreLimit, int* TimeLimit, int* ClientSide, string* RecordedBy, string* TimeStamp, string* ReqPackages);
	void GetDEMList(string[]* DEMFiles);
	void Profile(const string& ProfileName);
	void SetMoveControl(class UGUIComponent* C);
	void PlayInterfaceSound(EClickSound soundType);
	void GetOGGList(string[]* OGGFiles);
	void ResetKeyboard();
	void GetProfileList(const string& Prefix, string[]* ProfileList);
	void ResetInput();
	void ResetDesigner();
	bool SetRenderDevice(const string& NewRenderDevice);
	string GetCurrentRes();
	class UGUIStyles* GetStyle(const string& StyleName, EeFontScale* FontScale);
	class UGUIFont* GetMenuFont(const string& FontName);
	void AddBuddy(const string& NewBuddyName);
	bool OnNeedRawKeyPress(byte NewKey);
	void PopPage();
	void PushPage();
};


// Class XInterface.GUIFont
// 0x0030 (0x0084 - 0x0054)
class UGUIFont : public UGUI
{
public:
	string                                             KeyName;                                                  // 0x0054(0x000C) (Edit, NeedCtorLink)
	bool                                               bFixedSize;                                               // 0x0060(0x0004) (Edit)
	bool                                               bScaled;                                                  // 0x0060(0x0004) (Edit)
	int                                                NormalXRes;                                               // 0x0064(0x0004) (Edit)
	int                                                FallBackRes;                                              // 0x0068(0x0004) (Edit)
	string[]                                           FontArrayNames;                                           // 0x006C(0x000C) (Edit, NeedCtorLink)
	class UFont*[]                                     FontArrayFonts;                                           // 0x0078(0x000C) (Edit, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIFont");
		return ptr;
	}


	class UFont* LoadFont(int i);
	class UFont* STATIC_LoadFontStatic(int i);
	class UFont* GetFont(int XRes);
};


// Class XInterface.GUIStyles
// 0x01FC (0x0250 - 0x0054)
class UGUIStyles : public UGUI
{
public:
	string                                             KeyName;                                                  // 0x0054(0x000C) (Edit, Const, NeedCtorLink)
	string                                             AlternateKeyName[0x2];                                    // 0x0060(0x000C) (Edit, Const, NeedCtorLink)
	string                                             FontNames[0xF];                                           // 0x0078(0x000C) (Edit, NeedCtorLink, NoExport)
	class UGUIFont*                                    Fonts[0xF];                                               // 0x012C(0x0004) (Edit, ExportObject, NeedCtorLink, NoExport, EditInline)
	int                                                FontSizes[0x5];                                           // 0x0168(0x0004) (Edit, NoExport)
	struct FColor                                      FontColors[0x5];                                          // 0x017C(0x0004) (Edit, NoExport)
	struct FColor                                      FontBKColors[0x5];                                        // 0x0190(0x0004) (Edit, NoExport)
	struct FColor                                      FontShadowColor[0x5];                                     // 0x01A4(0x0004) (Edit, NoExport)
	int                                                FontShadowOffset[0x5];                                    // 0x01B8(0x0004) (Edit, NoExport)
	struct FColor                                      ImgColors[0x5];                                           // 0x01CC(0x0004) (Edit, NoExport)
	EMenuRenderStyle                                   RStyles[0x5];                                             // 0x01E0(0x0001) (Edit, NoExport)
	byte                                               Padding00[0x3];                                           // 0x01E5(0x0003) MISSED OFFSET
	class UMaterial*                                   Images[0x5];                                              // 0x01E8(0x0004) (Edit, NoExport)
	EeImgStyle                                         ImgStyle[0x5];                                            // 0x01FC(0x0001) (Edit, NoExport)
	byte                                               Padding01[0x3];                                           // 0x0201(0x0003) MISSED OFFSET
	float                                              ImgWidths[0x5];                                           // 0x0204(0x0004) (Edit, NoExport)
	float                                              ImgHeights[0x5];                                          // 0x0218(0x0004) (Edit, NoExport)
	int                                                BorderOffsets[0x4];                                       // 0x022C(0x0004) (Edit, NoExport)
	bool                                               bTemporary;                                               // 0x023C(0x0004) (Edit, NoExport)
	struct FScriptDelegate                             __OnDraw__Delegate;                                       // 0x0240(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnDrawText__Delegate;                                   // 0x0248(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIStyles");
		return ptr;
	}


	void Initialize();
	void btrDrawTextStyles(class UCanvas* Canvas, EeMenuState MenuState, float Left, float Top, float width, float Height, EeTextAlign Align, const string& Text, EeFontScale FontScale, int FontSize, float R, float G, float B, float A);
	void btrTextSizeStyles(class UCanvas* Canvas, EeMenuState MenuState, const string& Text, EeFontScale FontScale, int FontSize, float* XL, float* YL);
	void STATIC_TextSize(class UCanvas* Canvas, EeMenuState MenuState, const string& Text, EeFontScale FontScale, float* XL, float* YL);
	void STATIC_DrawText(class UCanvas* Canvas, EeMenuState MenuState, float Left, float Top, float width, float Height, EeTextAlign Align, const string& Text, EeFontScale FontScale);
	void STATIC_Draw(class UCanvas* Canvas, EeMenuState MenuState, float Left, float Top, float width, float Height);
	bool OnDrawText(class UCanvas* Canvas, EeMenuState MenuState, float Left, float Top, float width, float Height, EeTextAlign Align, const string& Text, EeFontScale FontScale);
	bool OnDraw(class UCanvas* Canvas, EeMenuState MenuState, float Left, float Top, float width, float Height);
};


// Class XInterface.PropertyManagerBase
// 0x0004 (0x0030 - 0x002C)
class UPropertyManagerBase : public UObject
{
public:
	byte                                               Padding00[0x4];                                           // 0x002C(0x0004) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.PropertyManagerBase");
		return ptr;
	}

};


// Class XInterface.UT2MenuFont
// 0x0000 (0x0084 - 0x0084)
class UUT2MenuFont : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.UT2MenuFont");
		return ptr;
	}

};


// Class XInterface.UT2DefaultFont
// 0x0000 (0x0084 - 0x0084)
class UUT2DefaultFont : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.UT2DefaultFont");
		return ptr;
	}

};


// Class XInterface.UT2LargeFont
// 0x0000 (0x0084 - 0x0084)
class UUT2LargeFont : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.UT2LargeFont");
		return ptr;
	}

};


// Class XInterface.UT2HeaderFont
// 0x0000 (0x0084 - 0x0084)
class UUT2HeaderFont : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.UT2HeaderFont");
		return ptr;
	}

};


// Class XInterface.UT2SmallFont
// 0x0000 (0x0084 - 0x0084)
class UUT2SmallFont : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.UT2SmallFont");
		return ptr;
	}

};


// Class XInterface.UT2MidGameFont
// 0x001C (0x00A0 - 0x0084)
class UUT2MidGameFont : public UGUIFont
{
public:
	int                                                FontScreenWidth[0x7];                                     // 0x0084(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.UT2MidGameFont");
		return ptr;
	}


	class UFont* GetFont(int XRes);
	class UFont* STATIC_GetMidGameFont(int XRes);
};


// Class XInterface.UT2SmallHeaderFont
// 0x0000 (0x0084 - 0x0084)
class UUT2SmallHeaderFont : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.UT2SmallHeaderFont");
		return ptr;
	}

};


// Class XInterface.UT2ServerListFont
// 0x0000 (0x0084 - 0x0084)
class UUT2ServerListFont : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.UT2ServerListFont");
		return ptr;
	}

};


// Class XInterface.UT2IRCFont
// 0x0000 (0x0084 - 0x0084)
class UUT2IRCFont : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.UT2IRCFont");
		return ptr;
	}

};


// Class XInterface.UT2K4GUIPage
// 0x0010 (0x0374 - 0x0364)
class UUT2K4GUIPage : public UGUIPage
{
public:
	class USound*                                      PopInSound;                                               // 0x0364(0x0004)
	class USound*                                      SlideInSound;                                             // 0x0368(0x0004)
	class USound*                                      FadeInSound;                                              // 0x036C(0x0004)
	class USound*                                      BeepSound;                                                // 0x0370(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.UT2K4GUIPage");
		return ptr;
	}

};


// Class XInterface.FloatingImage
// 0x0000 (0x02FC - 0x02FC)
class UFloatingImage : public UGUIImage
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.FloatingImage");
		return ptr;
	}

};


// Class XInterface.GUIHeader
// 0x0000 (0x0324 - 0x0324)
class UGUIHeader : public UGUITitleBar
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIHeader");
		return ptr;
	}

};


// Class XInterface.GUIVertScrollBar
// 0x0000 (0x0358 - 0x0358)
class UGUIVertScrollBar : public UGUIScrollBarBase
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIVertScrollBar");
		return ptr;
	}


	void ZoneClick(float Delta);
	bool GripPreDraw(class UGUIComponent* Sender);
	void GripPressed(class UGUIComponent* Sender, bool IsRepeat);
};


// Class XInterface.GUIVertScrollZone
// 0x0000 (0x02C4 - 0x02C4)
class UGUIVertScrollZone : public UGUIScrollZoneBase
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIVertScrollZone");
		return ptr;
	}


	bool InternalOnClick(class UGUIComponent* Sender);
};


// Class XInterface.GUIVertScrollButton
// 0x0000 (0x0308 - 0x0308)
class UGUIVertScrollButton : public UGUIScrollButtonBase
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIVertScrollButton");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class XInterface.GUIVertGripButton
// 0x0000 (0x0304 - 0x0304)
class UGUIVertGripButton : public UGUIGripButtonBase
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIVertGripButton");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* MyComponent);
};


// Class XInterface.STY_ListSelection
// 0x0000 (0x0250 - 0x0250)
class USTY_ListSelection : public UGUIStyles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.STY_ListSelection");
		return ptr;
	}


	void Initialize();
};


// Class XInterface.ExtendedConsole
// 0x0538 (0x0994 - 0x045C)
class UExtendedConsole : public UConsole
{
public:
	int                                                MaxScrollbackSize;                                        // 0x045C(0x0004)
	string[]                                           Scrollback;                                               // 0x0460(0x000C) (NeedCtorLink)
	int                                                SBHead;                                                   // 0x046C(0x0004)
	int                                                SBPos;                                                    // 0x0470(0x0004)
	bool                                               bCtrl;                                                    // 0x0474(0x0004)
	bool                                               bAlt;                                                     // 0x0474(0x0004)
	bool                                               bShift;                                                   // 0x0474(0x0004)
	bool                                               bConsoleHotKey;                                           // 0x0474(0x0004)
	float                                              ConsoleSoundVol;                                          // 0x0478(0x0004)
	string                                             AddedCurrentHead;                                         // 0x047C(0x000C) (Localized, NeedCtorLink)
	string                                             AddedCurrentTail;                                         // 0x0488(0x000C) (Localized, NeedCtorLink)
	string                                             ServerFullMsg;                                            // 0x0494(0x000C) (Localized, NeedCtorLink)
	float                                              SMLineSpace;                                              // 0x04A0(0x0004)
	ESpeechMenuState                                   SMState;                                                  // 0x04A4(0x0001)
	byte                                               Padding00[0x3];                                           // 0x04A5(0x0003) MISSED OFFSET
	FName                                              SMType;                                                   // 0x04A8(0x0004)
	int                                                SMIndex;                                                  // 0x04AC(0x0004)
	string                                             SMCallsign;                                               // 0x04B0(0x000C) (NeedCtorLink)
	int                                                SMOffset;                                                 // 0x04BC(0x0004)
	string                                             SMNameArray[0x30];                                        // 0x04C0(0x000C) (NeedCtorLink)
	int                                                SMIndexArray[0x30];                                       // 0x0700(0x0004)
	int                                                SMArraySize;                                              // 0x07C0(0x0004)
	float                                              SMOriginX;                                                // 0x07C4(0x0004)
	float                                              SMOriginY;                                                // 0x07C8(0x0004)
	float                                              SMMargin;                                                 // 0x07CC(0x0004)
	float                                              SMTab;                                                    // 0x07D0(0x0004)
	string                                             SMStateName[0xA];                                         // 0x07D4(0x000C) (Localized, NeedCtorLink)
	string                                             SMChannelOptions[0x3];                                    // 0x084C(0x000C) (Localized, NeedCtorLink)
	class AVoiceChatRoom*[]                            VoiceChannels;                                            // 0x0870(0x000C) (NeedCtorLink)
	string                                             SMAllString;                                              // 0x087C(0x000C) (Localized, NeedCtorLink)
	string                                             SMMoreString;                                             // 0x0888(0x000C) (Localized, NeedCtorLink)
	class USound*                                      SMOpenSound;                                              // 0x0894(0x0004)
	class USound*                                      SMAcceptSound;                                            // 0x0898(0x0004)
	class USound*                                      SMDenySound;                                              // 0x089C(0x0004)
	EInputKey                                          LetterKeys[0xA];                                          // 0x08A0(0x0001)
	EInputKey                                          NumberKeys[0xA];                                          // 0x08AA(0x0001)
	bool                                               bSpeechMenuUseLetters;                                    // 0x08B4(0x0004)
	bool                                               bSpeechMenuUseMouseWheel;                                 // 0x08B4(0x0004)
	bool                                               bSpeechMenuLocked;                                        // 0x08B4(0x0004)
	int                                                HighlightRow;                                             // 0x08B8(0x0004)
	struct FServerFavorite[]                           Favorites;                                                // 0x08BC(0x000C) (Edit, NeedCtorLink)
	struct FStoredPassword[]                           SavedPasswords;                                           // 0x08C8(0x000C) (NeedCtorLink)
	string                                             PasswordPromptMenu;                                       // 0x08D4(0x000C) (NeedCtorLink)
	string                                             LastConnectedServer;                                      // 0x08E0(0x000C) (NeedCtorLink)
	string                                             LastURL;                                                  // 0x08EC(0x000C) (NeedCtorLink)
	struct FChatStruct[]                               ChatMessages;                                             // 0x08F8(0x000C) (NeedCtorLink)
	string                                             ChatMenuClass;                                            // 0x0904(0x000C) (NeedCtorLink)
	class UGUIPage*                                    ChatMenu;                                                 // 0x0910(0x0004) (ExportObject, Transient, NeedCtorLink, EditInline)
	bool                                               bTeamChatOnly;                                            // 0x0914(0x0004)
	class UUT2MusicManager*                            MusicManager;                                             // 0x0918(0x0004) (ExportObject, Transient, NeedCtorLink, EditInline)
	string                                             StatsPromptMenuClass;                                     // 0x091C(0x000C) (NeedCtorLink)
	string                                             MusicManagerClassName;                                    // 0x0928(0x000C) (NeedCtorLink)
	string                                             WaitingGameClassName;                                     // 0x0934(0x000C) (NeedCtorLink)
	string                                             NeedPasswordMenuClass;                                    // 0x0940(0x000C) (NeedCtorLink)
	string                                             ServerInfoMenu;                                           // 0x094C(0x000C) (NeedCtorLink)
	float                                              FadeClock;                                                // 0x0958(0x0004)
	float                                              FadeTime;                                                 // 0x095C(0x0004)
	float[]                                            DemoPlaybackSpeeds;                                       // 0x0960(0x000C) (NeedCtorLink)
	string                                             PlaybackText;                                             // 0x096C(0x000C) (NeedCtorLink)
	bool                                               bDemoJogKeys;                                             // 0x0978(0x0004)
	struct FScriptDelegate                             __OnChat__Delegate;                                       // 0x097C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnChatMessage__Delegate;                                // 0x0984(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnExecAddFavorite__Delegate;                            // 0x098C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.ExtendedConsole");
		return ptr;
	}


	void DebugTabOrder();
	void DumpLoadingHints(const string& Param);
	void DLO(const string& ClassName, const string& ClassType);
	bool VoiceChatAllowed();
	void DumpCacheRecords(const string& CacheType);
	void AddMessage(const string& Mesg);
	void DumpRecords(const string& Type);
	void DumpPlayInfo(const string& Group);
	void MusicMenu();
	void PlayWaitingGame();
	void TeamChatOnly();
	void ServerInfo();
	void IngameChat();
	void SpeechMenuToggle();
	void STATIC_SaveFavorites();
	void STATIC_GetFavorites(struct FServerFavorite[]* List);
	bool STATIC_RemoveFavorite(const string& IP, int Port, int QueryPort);
	bool STATIC_AddFavorite(const struct FServerFavorite& NewFav);
	bool STATIC_InFavorites(const struct FServerFavorite& Fav);
	void AddCurrentToFavorites();
	void OnExecAddFavorite(const struct FServerFavorite& Fav);
	void ConsoleToggle();
	void ConsoleClose();
	void ConsoleOpen();
	void NativeConsoleOpen();
	void PlayConsoleSound(class USound* S);
	bool KeyEvent(EInputKey key, EInputAction Action, float Delta);
	void GetNewPlaybackSpeed(int Dir);
	void Message(const string& Msg, float MsgLife);
	void OnChatMessage(const string& Msg);
	void Chat(const string& Msg, float MsgLife, class APlayerReplicationInfo* PRI);
	void PostRender(class UCanvas* Canvas);
	void cls();
	void NotifyLevelChange();
	void ConnectFailure(const string& FailCode, const string& URL);
	void OnStatsConfigured();
	void OnStatsClosed(bool bCancelled);
	void OnChat(const string& Msg, int TeamIndex);
};


// Class XInterface.UT2MusicManager
// 0x001C (0x0380 - 0x0364)
class UUT2MusicManager : public UGUIPage
{
public:
	struct FPlayListStruct                             Playlist;                                                 // 0x0364(0x001C) (Config, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.UT2MusicManager");
		return ptr;
	}


	bool NotifyLevelChange();
	void MusicChanged();
	string SetInitialMusic(const string& NewSong);
	void SetMusic(const string& NewSong);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class XInterface.HudCDeathmatch
// 0x36CC (0x4384 - 0x0CB8)
class AHudCDeathmatch : public AHudBase
{
public:
	float                                              UAVLastBeginScanLevelSeconds;                             // 0x0CB8(0x0004)
	float                                              UAVOneScanTime;                                           // 0x0CBC(0x0004)
	float                                              UAVOneScanTimeExtra;                                      // 0x0CC0(0x0004)
	float                                              UAVOneScanMin;                                            // 0x0CC4(0x0004)
	float                                              UAVOneScanMax;                                            // 0x0CC8(0x0004)
	class AwHudPart_MinimapBase*                       UAVMinimapBase;                                           // 0x0CCC(0x0004)
	int                                                UAVScanOffset;                                            // 0x0CD0(0x0004)
	float                                              UAVIconPosXAlly;                                          // 0x0CD4(0x0004)
	float                                              UAVIconPosYAlly;                                          // 0x0CD8(0x0004)
	float                                              UAVIconPosXEnemy;                                         // 0x0CDC(0x0004)
	float                                              UAVIconPosYEnemy;                                         // 0x0CE0(0x0004)
	float                                              UAVIconWidth;                                             // 0x0CE4(0x0004)
	float                                              UAVIconHeight;                                            // 0x0CE8(0x0004)
	float                                              UAVIconTextPosXAlly;                                      // 0x0CEC(0x0004)
	float                                              UAVIconTextPosYAlly;                                      // 0x0CF0(0x0004)
	float                                              UAVIconTextPosXEnemy;                                     // 0x0CF4(0x0004)
	float                                              UAVIconTextPosYEnemy;                                     // 0x0CF8(0x0004)
	float                                              UAVIconTextOffsetX;                                       // 0x0CFC(0x0004)
	float                                              UAVIconTextXL;                                            // 0x0D00(0x0004)
	float                                              UAVIconTextYL;                                            // 0x0D04(0x0004)
	struct FColor                                      UAVIconColor;                                             // 0x0D08(0x0004)
	float                                              AFStringLeftTopX;                                         // 0x0D0C(0x0004)
	float                                              AFStringLeftTopY;                                         // 0x0D10(0x0004)
	float                                              AFStringRightBottomX;                                     // 0x0D14(0x0004)
	float                                              AFStringRightBottomY;                                     // 0x0D18(0x0004)
	float                                              AFSurvivedUserCountLeftTopX;                              // 0x0D1C(0x0004)
	float                                              AFSurvivedUserCountLeftTopY;                              // 0x0D20(0x0004)
	float                                              AFSurvivedUserCountRightBottomX;                          // 0x0D24(0x0004)
	float                                              AFSurvivedUserCountRightBottomY;                          // 0x0D28(0x0004)
	float                                              RSAStringLeftTopX;                                        // 0x0D2C(0x0004)
	float                                              RSAStringLeftTopY;                                        // 0x0D30(0x0004)
	float                                              RSAStringRightBottomX;                                    // 0x0D34(0x0004)
	float                                              RSAStringRightBottomY;                                    // 0x0D38(0x0004)
	float                                              RSASurvivedUserCountLeftTopX;                             // 0x0D3C(0x0004)
	float                                              RSASurvivedUserCountLeftTopY;                             // 0x0D40(0x0004)
	float                                              RSASurvivedUserCountRightBottomX;                         // 0x0D44(0x0004)
	float                                              RSASurvivedUserCountRightBottomY;                         // 0x0D48(0x0004)
	struct FDigitSet                                   WDigitsSmall;                                             // 0x0D4C(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsMid;                                               // 0x0E00(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsTime;                                              // 0x0EB4(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsTimeRedAlert;                                      // 0x0F68(0x00B4) (Edit)
	struct FSpriteWidget                               ScoreBgLine;                                              // 0x101C(0x0040) (Edit)
	struct FSpriteWidget                               ScoreBg;                                                  // 0x105C(0x0040) (Edit)
	struct FSpriteWidget                               ScoreBGMine;                                              // 0x109C(0x0040) (Edit)
	struct FSpriteWidget                               ScoreBGMyLine;                                            // 0x10DC(0x0040) (Edit)
	struct FSpriteWidget                               DetectedBomb;                                             // 0x111C(0x0040)
	float                                              DetectedBombDrawDistance;                                 // 0x115C(0x0004)
	struct FNumericWidget                              DigitsScoreL;                                             // 0x1160(0x0030) (Edit)
	struct FNumericWidget                              DigitsScoreR;                                             // 0x1190(0x0030) (Edit)
	struct FNumericWidget                              DigitsScoreU;                                             // 0x11C0(0x0030) (Edit)
	struct FNumericWidget                              DigitsScoreD;                                             // 0x11F0(0x0030) (Edit)
	bool                                               OverdrawDigitsScoreL;                                     // 0x1220(0x0004)
	bool                                               OverdrawDigitsScoreR;                                     // 0x1220(0x0004)
	class UTexRotator*                                 outArrow;                                                 // 0x1224(0x0004)
	float                                              OutArrowSize;                                             // 0x1228(0x0004) (Config)
	bool                                               bRendNavExtra;                                            // 0x122C(0x0004)
	float                                              fRendNavExtraFactor;                                      // 0x1230(0x0004)
	bool                                               bRendVisCount;                                            // 0x1234(0x0004)
	float                                              fRendVisCountFactor;                                      // 0x1238(0x0004)
	float                                              fRendViscountBoxSize;                                     // 0x123C(0x0004)
	bool                                               bRendInfluence;                                           // 0x1240(0x0004)
	float                                              fInfluenceBoxSize;                                        // 0x1244(0x0004)
	bool                                               bRendCoverAngle;                                          // 0x1248(0x0004)
	float                                              fRendCoverAngleSize;                                      // 0x124C(0x0004)
	bool                                               bRendSDFrontLine;                                         // 0x1250(0x0004)
	float                                              fSDFrontLineSize;                                         // 0x1254(0x0004)
	bool                                               bRendSDFrontLineFull;                                     // 0x1258(0x0004)
	bool                                               bRendRadius;                                              // 0x1258(0x0004)
	struct FColor[]                                    RainbowColors;                                            // 0x125C(0x000C) (NeedCtorLink)
	struct FColor[]                                    DangerColors;                                             // 0x1268(0x000C) (NeedCtorLink)
	struct FColor[]                                    RedBlueColors;                                            // 0x1274(0x000C) (NeedCtorLink)
	struct FColor                                      color_Shadow;                                             // 0x1280(0x0004)
	bool                                               bShowTimer1;                                              // 0x1284(0x0004) (Edit)
	bool                                               bShowTimer1WithDigitRedAlert;                             // 0x1284(0x0004) (Edit)
	struct FSpriteWidget                               WTimerBG;                                                 // 0x1288(0x0040) (Edit)
	struct FSpriteWidget                               SpriteTimerHalf;                                          // 0x12C8(0x0040) (Edit)
	struct FSpriteWidget                               SpriteTimerHalf_RedAlert;                                 // 0x1308(0x0040) (Edit)
	struct FNumericWidget                              DigitsTimerMin;                                           // 0x1348(0x0030) (Edit)
	struct FNumericWidget                              DigitsTimerSec;                                           // 0x1378(0x0030) (Edit)
	bool                                               bShowTimer2NotScoreD;                                     // 0x13A8(0x0004) (Edit)
	bool                                               bShowTimer2WithDigitRedAlert;                             // 0x13A8(0x0004) (Edit)
	struct FSpriteWidget                               SpriteTimerHalf2;                                         // 0x13AC(0x0040) (Edit)
	struct FSpriteWidget                               SpriteTimerHalf2_RedAlert;                                // 0x13EC(0x0040) (Edit)
	struct FNumericWidget                              DigitsTimerMin2;                                          // 0x142C(0x0030) (Edit)
	struct FNumericWidget                              DigitsTimerSec2;                                          // 0x145C(0x0030) (Edit)
	float                                              NetLastTimeSeconds;                                       // 0x148C(0x0004)
	float                                              NetElapsedTime;                                           // 0x1490(0x0004)
	float                                              NetInterval;                                              // 0x1494(0x0004)
	int                                                NetRecvMax;                                               // 0x1498(0x0004)
	int                                                NetRecv;                                                  // 0x149C(0x0004)
	int                                                NetSendMax;                                               // 0x14A0(0x0004)
	int                                                NetSend;                                                  // 0x14A4(0x0004)
	int                                                NetTotal;                                                 // 0x14A8(0x0004)
	struct FSpriteWidget                               AmmoIcon;                                                 // 0x14AC(0x0040) (Edit)
	struct FNumericWidget                              AdrenalineCount;                                          // 0x14EC(0x0030) (Edit)
	struct FNumericWidget                              mySpread;                                                 // 0x151C(0x0030) (Edit)
	struct FNumericWidget                              myRank;                                                   // 0x154C(0x0030) (Edit)
	struct FNumericWidget                              MyScore;                                                  // 0x157C(0x0030) (Edit)
	struct FNumericWidget                              TimerHours;                                               // 0x15AC(0x0030) (Edit)
	struct FNumericWidget                              TimerMinutes;                                             // 0x15DC(0x0030) (Edit)
	struct FNumericWidget                              TimerSeconds;                                             // 0x160C(0x0030) (Edit)
	struct FSpriteWidget                               TimerDigitSpacer[0x2];                                    // 0x163C(0x0040) (Edit)
	struct FSpriteWidget                               TimerIcon;                                                // 0x16BC(0x0040) (Edit)
	struct FSpriteWidget                               TimerBackground;                                          // 0x16FC(0x0040) (Edit)
	struct FSpriteWidget                               TimerBackgroundDisc;                                      // 0x173C(0x0040) (Edit)
	class UFont*                                       LevelActionFontFont;                                      // 0x177C(0x0004) (Edit)
	struct FColor                                      LevelActionFontColor;                                     // 0x1780(0x0004) (Edit)
	float                                              LevelActionPositionX;                                     // 0x1784(0x0004) (Edit)
	float                                              LevelActionPositionY;                                     // 0x1788(0x0004) (Edit)
	struct FNumericWidget                              DigitsHealth;                                             // 0x178C(0x0030) (Edit)
	struct FNumericWidget                              DigitsVehicleHealth;                                      // 0x17BC(0x0030) (Edit)
	struct FNumericWidget                              DigitsTotalAmmo;                                          // 0x17EC(0x0030) (Edit)
	struct FNumericWidget                              DigitsMagazineAmmo;                                       // 0x181C(0x0030) (Edit)
	struct FNumericWidget                              DigitsMagazineAmmoShortage;                               // 0x184C(0x0030) (Edit)
	struct FNumericWidget                              DigitsShield;                                             // 0x187C(0x0030) (Edit)
	struct FNumericWidget                              DigitsSprint;                                             // 0x18AC(0x0030) (Edit)
	bool                                               bPrevMatchOver;                                           // 0x18DC(0x0004)
	struct FSpriteWidget                               HpStaminaBackground;                                      // 0x18E0(0x0040) (Edit)
	struct FSpriteWidget                               HpBarBackground;                                          // 0x1920(0x0040) (Edit)
	struct FSpriteWidget                               HpBar;                                                    // 0x1960(0x0040) (Edit)
	struct FSpriteWidget                               DamageBar;                                                // 0x19A0(0x0040) (Edit)
	struct FSpriteWidget                               RecoveryBar;                                              // 0x19E0(0x0040) (Edit)
	struct FSpriteWidget                               StaminaBarBackground;                                     // 0x1A20(0x0040) (Edit)
	struct FSpriteWidget                               StaminaBar;                                               // 0x1A60(0x0040) (Edit)
	struct FSpriteWidget                               StaminaBarWarn;                                           // 0x1AA0(0x0040) (Edit)
	struct FSpriteWidget                               HPIcon;                                                   // 0x1AE0(0x0040) (Edit)
	struct FSpriteWidget                               HpGauBlink;                                               // 0x1B20(0x0040) (Edit)
	float                                              fHPDelayTime;                                             // 0x1B60(0x0004) (Edit)
	float                                              fHPDisplayRatio;                                          // 0x1B64(0x0004) (Edit)
	float                                              fAddValue;                                                // 0x1B68(0x0004)
	float                                              fLastHealth;                                              // 0x1B6C(0x0004)
	float                                              fBeginDamageTime;                                         // 0x1B70(0x0004)
	bool                                               bBeginDamage;                                             // 0x1B74(0x0004)
	bool                                               bBeginRecovery;                                           // 0x1B74(0x0004)
	float                                              fCurrentDamageBar;                                        // 0x1B78(0x0004)
	float                                              fCurrentHPBar;                                            // 0x1B7C(0x0004)
	float                                              fCurrentRecoveryBar;                                      // 0x1B80(0x0004)
	bool                                               bPlayRecoverySounding;                                    // 0x1B84(0x0004)
	float                                              fStartPlayRecoverySound;                                  // 0x1B88(0x0004)
	struct FDigitSet                                   WDigitsHP;                                                // 0x1B8C(0x00B4)
	struct FNumericWidget                              HPCount;                                                  // 0x1C40(0x0030)
	struct FSpriteWidget                               SPIcon;                                                   // 0x1C70(0x0040)
	struct FSpriteWidget                               PostureStand;                                             // 0x1CB0(0x0040) (Edit)
	struct FSpriteWidget                               PostureCrouch;                                            // 0x1CF0(0x0040) (Edit)
	struct FSpriteWidget                               PostureDown;                                              // 0x1D30(0x0040) (Edit)
	struct FSpriteWidget                               PostureRun;                                               // 0x1D70(0x0040) (Edit)
	struct FSpriteWidget                               HelpWorldMap;                                             // 0x1DB0(0x0040) (Edit)
	struct FSpriteWidget                               HelpMiliAtt;                                              // 0x1DF0(0x0040) (Edit)
	struct FSpriteWidget                               HelpAim;                                                  // 0x1E30(0x0040) (Edit)
	class UMaterial*                                   matCurrentWeapon;                                         // 0x1E70(0x0004)
	int                                                iDrawingWeaponID;                                         // 0x1E74(0x0004)
	struct FDigitSet                                   AmmoSet100;                                               // 0x1E78(0x00B4) (Edit)
	struct FNumericWidget                              Ammo100;                                                  // 0x1F2C(0x0030) (Edit)
	int                                                Ammo100_LineOffset;                                       // 0x1F5C(0x0004) (Edit)
	int                                                Ammo100_DigitOffset;                                      // 0x1F60(0x0004) (Edit)
	struct FAmmoSet                                    AmmoSet50;                                                // 0x1F64(0x0058) (Edit)
	struct FAmmoSet                                    AmmoSetSniper;                                            // 0x1FBC(0x0058) (Edit)
	struct FAmmoSet                                    AmmoSetShotgun;                                           // 0x2014(0x0058) (Edit)
	struct FAmmoSet                                    AmmoSetRPG;                                               // 0x206C(0x0058) (Edit)
	struct FAmmoSet                                    AmmoSetATR;                                               // 0x20C4(0x0058) (Edit)
	struct FFloatBox                                   fbSpectateClanMark;                                       // 0x211C(0x0010)
	struct FFloatBox                                   fbSpectateUserName;                                       // 0x212C(0x0010)
	string                                             SpecPlayerClan;                                           // 0x213C(0x000C) (NeedCtorLink)
	struct FImage                                      ImgPlayerClanMark[0x3];                                   // 0x2148(0x0020)
	class UMaterial*                                   matDefaultClanMark;                                       // 0x21A8(0x0004)
	struct FSpriteWidget                               AmmoFlameThrowerCan;                                      // 0x21AC(0x0040) (Edit)
	struct FSpriteWidget                               AmmoFlameThrowerBar;                                      // 0x21EC(0x0040) (Edit)
	struct FSpriteWidget                               AmmoSeparator;                                            // 0x222C(0x0040) (Edit)
	float                                              AmmoSeparatorBeginX;                                      // 0x226C(0x0004) (Edit)
	float                                              AmmoSeparatorBeginY;                                      // 0x2270(0x0004) (Edit)
	float                                              AmmoSeparatorWidth;                                       // 0x2274(0x0004) (Edit)
	float                                              AmmoSeparatorHeight;                                      // 0x2278(0x0004) (Edit)
	struct FSpriteWidget                               GaugeOverHeat;                                            // 0x227C(0x0040) (Edit)
	struct FTeamDeathInfo[]                            TeamDeathInfos;                                           // 0x22BC(0x000C) (Edit, NeedCtorLink)
	struct FSpriteWidget                               TeamDeathSprite;                                          // 0x22C8(0x0040) (Edit)
	float                                              TeamDeath_HeightOffset;                                   // 0x2308(0x0004) (Edit)
	float                                              TeamDeath_MinScale;                                       // 0x230C(0x0004) (Edit)
	float                                              TeamDeath_MaxScale;                                       // 0x2310(0x0004) (Edit)
	float                                              TeamDeath_MinDist;                                        // 0x2314(0x0004) (Edit)
	float                                              TeamDeath_MaxDist;                                        // 0x2318(0x0004) (Edit)
	struct FSpriteWidget                               WBGKillMessage;                                           // 0x231C(0x0040)
	class UMaterial*                                   DamageIndicationMaterial;                                 // 0x235C(0x0004)
	int                                                MaxDamageIndicationCount;                                 // 0x2360(0x0004)
	float                                              DamageIndicationDuration;                                 // 0x2364(0x0004)
	struct FDamageIndicationInfo[]                     DamageIndicationInfos;                                    // 0x2368(0x000C) (Edit, NeedCtorLink)
	float                                              DamageIndicationMaterial_UOffset;                         // 0x2374(0x0004)
	float                                              DamageIndicationMaterial_VOffset;                         // 0x2378(0x0004)
	bool                                               ShowHealthInDanager;                                      // 0x237C(0x0004)
	int                                                ShowHealthInDanagerSoundID;                               // 0x2380(0x0004)
	float                                              ShowHealthInDanager_BeginTime;                            // 0x2384(0x0004)
	float                                              ShowHealthInDanager_EndTime;                              // 0x2388(0x0004)
	float                                              ShowHealthInDanager_Duration;                             // 0x238C(0x0004)
	class UMaterial*                                   ShowHealthInDanager_Material;                             // 0x2390(0x0004)
	float                                              ShowHealthInDanger_BlinkInterval;                         // 0x2394(0x0004)
	float                                              ShowHealthInDanger_BlinkMaxAlpha;                         // 0x2398(0x0004)
	float                                              ShowHealthInDanger_BlinkMinAlpha;                         // 0x239C(0x0004)
	bool                                               bShowFallInDanger;                                        // 0x23A0(0x0004)
	float                                              ShowFallDamage_Duration;                                  // 0x23A4(0x0004)
	float                                              ShowFallInDanager_BeginTime;                              // 0x23A8(0x0004)
	float                                              ShowFallInDanager_EndTime;                                // 0x23AC(0x0004)
	float                                              ShowFallDamage_BlinkInterval;                             // 0x23B0(0x0004)
	string                                             KillMessageHelicopterName;                                // 0x23B4(0x000C) (Localized, NeedCtorLink)
	struct FSelfKillMessage                            LastSelfKillMessage;                                      // 0x23C0(0x0030) (NeedCtorLink)
	string                                             SelfKillMessage_Killed;                                   // 0x23F0(0x000C) (Localized, NeedCtorLink)
	string                                             SelfKillMessage_KilledBy;                                 // 0x23FC(0x000C) (Localized, NeedCtorLink)
	string                                             SuicideMessage;                                           // 0x2408(0x000C) (Localized, NeedCtorLink)
	struct FColor                                      SelfKillColor;                                            // 0x2414(0x0004)
	struct FColor                                      SelfKilledByColor;                                        // 0x2418(0x0004)
	struct FSpriteWidget                               Crosshair_Left;                                           // 0x241C(0x0040) (Edit)
	struct FSpriteWidget                               Crosshair_Right;                                          // 0x245C(0x0040) (Edit)
	struct FSpriteWidget                               Crosshair_Up;                                             // 0x249C(0x0040) (Edit)
	struct FSpriteWidget                               Crosshair_Down;                                           // 0x24DC(0x0040) (Edit)
	struct FSpriteWidget                               Crosshair_MG;                                             // 0x251C(0x0040) (Edit)
	struct FSpriteWidget                               Crosshair_DamageDealt;                                    // 0x255C(0x0040) (Edit)
	float                                              CrossHair_DamageDealtDrawTime;                            // 0x259C(0x0004)
	float                                              CrossHair_DamageDealtBeginFadeTime;                       // 0x25A0(0x0004)
	float                                              CrossHair_ServerSideLastDamageDealtTime;                  // 0x25A4(0x0004)
	float                                              CrossHair_ClientSideLastDamageDealtTime;                  // 0x25A8(0x0004)
	struct FSpriteWidget                               ProgressStatusBG;                                         // 0x25AC(0x0040) (Edit)
	struct FSpriteWidget                               ProgressStatusBar;                                        // 0x25EC(0x0040) (Edit)
	struct FSpriteWidget                               SkillSlot5;                                               // 0x262C(0x0040) (Edit)
	struct FSpriteWidget                               SkillSlot6;                                               // 0x266C(0x0040) (Edit)
	struct FSpriteWidget                               SkillSlot5Name;                                           // 0x26AC(0x0040) (Edit)
	struct FSpriteWidget                               SkillSlot5Count;                                          // 0x26EC(0x0040) (Edit)
	struct FSpriteWidget                               SkillSlot5Enable;                                         // 0x272C(0x0040) (Edit)
	struct FSpriteWidget                               SkillSlot6Enable;                                         // 0x276C(0x0040) (Edit)
	class UMaterial*                                   matEmptySkillSlot;                                        // 0x27AC(0x0004) (Edit)
	class UMaterial*                                   matEmptySkillSlot6;                                       // 0x27B0(0x0004) (Edit)
	class UMaterial*                                   matSkillSupplyItem[0x5];                                  // 0x27B4(0x0004) (Edit)
	class UMaterial*                                   matSkillBlink;                                            // 0x27C8(0x0004) (Edit)
	float                                              fBlinkDelayTime;                                          // 0x27CC(0x0004) (Edit)
	float                                              fBlinkLastTime;                                           // 0x27D0(0x0004) (Edit)
	bool                                               bBlinkState;                                              // 0x27D4(0x0004)
	bool                                               bSkill_C4;                                                // 0x27D4(0x0004)
	bool                                               bSkill_Incen;                                             // 0x27D4(0x0004)
	bool                                               bSkill_HellFire;                                          // 0x27D4(0x0004)
	bool                                               bSkill_RPG7;                                              // 0x27D4(0x0004)
	bool                                               bSkill_M2B;                                               // 0x27D4(0x0004)
	bool                                               bSkill_ATR;                                               // 0x27D4(0x0004)
	bool                                               bEnableSlot5;                                             // 0x27D4(0x0004)
	float                                              Slot6EnableTime;                                          // 0x27D8(0x0004)
	struct FSpriteWidget[]                             SkillNum;                                                 // 0x27DC(0x000C) (Edit, NeedCtorLink)
	int                                                HasSkillC4;                                               // 0x27E8(0x0004)
	int                                                HasSkillAirStirke;                                        // 0x27EC(0x0004)
	int                                                HasSkillRPG;                                              // 0x27F0(0x0004)
	int                                                HasSkillIncen;                                            // 0x27F4(0x0004)
	int                                                HasSkillHellFire;                                         // 0x27F8(0x0004)
	struct FSkillProperty                              ActiveUsingSkill;                                         // 0x27FC(0x0024)
	float                                              VisibleDistance;                                          // 0x2820(0x0004)
	struct FSpriteWidget                               PlaceMark;                                                // 0x2824(0x0040)
	struct FSpriteWidget                               PlaceMarkAmmoBox;                                         // 0x2864(0x0040)
	string                                             lsPlaceM2B;                                               // 0x28A4(0x000C) (Localized, NeedCtorLink)
	string                                             lsPlaceMG3;                                               // 0x28B0(0x000C) (Localized, NeedCtorLink)
	string                                             lsPlaceRPG7;                                              // 0x28BC(0x000C) (Localized, NeedCtorLink)
	string                                             lsPlaceATR;                                               // 0x28C8(0x000C) (Localized, NeedCtorLink)
	string                                             lsPlaceHealthPack;                                        // 0x28D4(0x000C) (Localized, NeedCtorLink)
	string                                             lsPlaceHeliPack;                                          // 0x28E0(0x000C) (Localized, NeedCtorLink)
	string                                             lsPlaceArtilleryPack;                                     // 0x28EC(0x000C) (Localized, NeedCtorLink)
	string                                             lsPlaceUAVPack;                                           // 0x28F8(0x000C) (Localized, NeedCtorLink)
	string                                             lsPlaceSentry;                                            // 0x2904(0x000C) (Localized, NeedCtorLink)
	string                                             lsPlaceMedalPack;                                         // 0x2910(0x000C) (Localized, NeedCtorLink)
	string                                             lsPlaceRandomBonusPack;                                   // 0x291C(0x000C) (Localized, NeedCtorLink)
	string                                             lsMessageNotice;                                          // 0x2928(0x000C) (Localized, NeedCtorLink)
	string                                             lsPlaceAmmoSupply;                                        // 0x2934(0x000C) (Localized, NeedCtorLink)
	class UClass*[]                                    SpecialPositions_Class;                                   // 0x2940(0x000C) (NeedCtorLink)
	struct FSpriteWidget[]                             SpecialPositions_Sprite;                                  // 0x294C(0x000C) (NeedCtorLink)
	int[]                                              SpecialPositions_OffsetZ;                                 // 0x2958(0x000C) (NeedCtorLink)
	struct FVector[]                                   CachedSpecialPositions;                                   // 0x2964(0x000C) (NeedCtorLink)
	class AActor*[]                                    CachedSpecialPositionActors;                              // 0x2970(0x000C) (NeedCtorLink)
	struct FSpriteWidget[]                             CachedSpecialPositionSprites;                             // 0x297C(0x000C) (NeedCtorLink)
	int[]                                              SuppliesPositions_OffsetZ;                                // 0x2988(0x000C) (NeedCtorLink)
	struct FVector[]                                   CachedSuppliesPositions;                                  // 0x2994(0x000C) (NeedCtorLink)
	class AActor*[]                                    CachedSuppliesPositionActors;                             // 0x29A0(0x000C) (NeedCtorLink)
	bool                                               bCachedSpecialPostions;                                   // 0x29AC(0x0004)
	FName[]                                            SpriteTag;                                                // 0x29B0(0x000C) (NeedCtorLink)
	struct FPlane[]                                    SpriteLastColorModulates;                                 // 0x29BC(0x000C) (NeedCtorLink)
	float[]                                            SpriteLastTime;                                           // 0x29C8(0x000C) (NeedCtorLink)
	struct FPlane                                      ObjectSpriteEdgeColorModulate;                            // 0x29D4(0x0010)
	struct FNumericWidget                              UDamageTime;                                              // 0x29E4(0x0030) (Edit)
	struct FSpriteWidget                               UDamageIcon;                                              // 0x2A14(0x0040) (Edit)
	struct FSpriteWidget                               AdrenalineIcon;                                           // 0x2A54(0x0040) (Edit)
	struct FSpriteWidget                               AdrenalineBackground;                                     // 0x2A94(0x0040) (Edit)
	struct FSpriteWidget                               AdrenalineBackgroundDisc;                                 // 0x2AD4(0x0040) (Edit)
	struct FSpriteWidget                               AdrenalineAlert;                                          // 0x2B14(0x0040) (Edit)
	struct FSpriteWidget                               MyScoreIcon;                                              // 0x2B54(0x0040) (Edit)
	struct FSpriteWidget                               MyScoreBackground;                                        // 0x2B94(0x0040) (Edit)
	struct FSpriteWidget                               HudHealthALERT;                                           // 0x2BD4(0x0040) (Edit)
	struct FSpriteWidget                               HudVehicleHealthALERT;                                    // 0x2C14(0x0040) (Edit)
	struct FSpriteWidget                               HudAmmoALERT;                                             // 0x2C54(0x0040) (Edit)
	struct FSpriteWidget                               HudBorderShield;                                          // 0x2C94(0x0040) (Edit)
	struct FSpriteWidget                               HudBorderHealth;                                          // 0x2CD4(0x0040) (Edit)
	struct FSpriteWidget                               HudBorderVehicleHealth;                                   // 0x2D14(0x0040) (Edit)
	struct FSpriteWidget                               HudBorderAmmo;                                            // 0x2D54(0x0040) (Edit)
	struct FSpriteWidget                               HudBorderShieldIcon;                                      // 0x2D94(0x0040) (Edit)
	struct FSpriteWidget                               HudBorderHealthIcon;                                      // 0x2DD4(0x0040) (Edit)
	struct FSpriteWidget                               HudBorderVehicleHealthIcon;                               // 0x2E14(0x0040) (Edit)
	class UClass*                                      BaseWeapons[0x9];                                         // 0x2E54(0x0004) (Edit)
	struct FSpriteWidget                               BarWeaponIcon[0x9];                                       // 0x2E78(0x0040) (Edit)
	struct FSpriteWidget                               BarAmmoIcon[0x9];                                         // 0x30B8(0x0040) (Edit)
	struct FSpriteWidget                               BarBorder[0x9];                                           // 0x32F8(0x0040) (Edit)
	struct FSpriteWidget                               BarBorderAmmoIndicator[0x9];                              // 0x3538(0x0040) (Edit)
	float                                              BarBorderScaledPosition[0x9];                             // 0x3778(0x0004)
	struct FWeaponState                                BarWeaponStates[0x9];                                     // 0x379C(0x0008)
	struct FSpriteWidget                               RechargeBar;                                              // 0x37E4(0x0040) (Edit)
	bool                                               bDrawTimer;                                               // 0x3824(0x0004)
	bool                                               TeamLinked;                                               // 0x3824(0x0004)
	bool                                               bShowMissingWeaponInfo;                                   // 0x3824(0x0004)
	int                                                CurHealth;                                                // 0x3828(0x0004)
	int                                                LastHealth;                                               // 0x382C(0x0004)
	int                                                CurVehicleHealth;                                         // 0x3830(0x0004)
	int                                                LastVehicleHealth;                                        // 0x3834(0x0004)
	int                                                CurShield;                                                // 0x3838(0x0004)
	int                                                LastShield;                                               // 0x383C(0x0004)
	int                                                MaxShield;                                                // 0x3840(0x0004)
	int                                                CurEnergy;                                                // 0x3844(0x0004)
	int                                                MaxEnergy;                                                // 0x3848(0x0004)
	int                                                LastEnergy;                                               // 0x384C(0x0004)
	float                                              LastDamagedHealth;                                        // 0x3850(0x0004)
	float                                              LastDamagedVehicleHealth;                                 // 0x3854(0x0004)
	float                                              ZoomToggleTime;                                           // 0x3858(0x0004)
	float                                              FadeTime;                                                 // 0x385C(0x0004)
	float                                              MaxAmmoPrimary;                                           // 0x3860(0x0004) (Edit)
	float                                              CurAmmoPrimary;                                           // 0x3864(0x0004) (Edit)
	float                                              LastAdrenalineTime;                                       // 0x3868(0x0004) (Edit)
	int                                                CurScore;                                                 // 0x386C(0x0004) (Transient)
	int                                                CurRank;                                                  // 0x3870(0x0004) (Transient)
	int                                                ScoreDiff;                                                // 0x3874(0x0004) (Transient)
	int                                                OldRemainingTime;                                         // 0x3878(0x0004)
	FName                                              CountDownName[0xA];                                       // 0x387C(0x0004)
	FName                                              LongCountName[0xA];                                       // 0x38A4(0x0004)
	int                                                BarWeaponIconAnim[0x9];                                   // 0x38CC(0x0004) (Edit)
	struct FColor                                      HudColorRed;                                              // 0x38F0(0x0004) (Edit)
	struct FColor                                      HudColorBlue;                                             // 0x38F4(0x0004) (Edit)
	struct FColor                                      HudColorBlack;                                            // 0x38F8(0x0004) (Edit)
	struct FColor                                      HudColorHighLight;                                        // 0x38FC(0x0004) (Edit)
	struct FColor                                      HudColorNormal;                                           // 0x3900(0x0004) (Edit)
	struct FColor                                      HudColorTeam[0x2];                                        // 0x3904(0x0004) (Edit)
	struct FColor                                      CustomHUDHighlightColor;                                  // 0x390C(0x0004)
	class APlayerReplicationInfo*                      NamedPlayer;                                              // 0x3910(0x0004)
	float                                              NameTime;                                                 // 0x3914(0x0004)
	class UMaterial*                                   Portrait;                                                 // 0x3918(0x0004)
	float                                              PortraitTime;                                             // 0x391C(0x0004)
	float                                              PortraitX;                                                // 0x3920(0x0004)
	class ASceneManager*[]                             MySceneManagers;                                          // 0x3924(0x000C) (NeedCtorLink)
	float                                              VehicleDrawTimer;                                         // 0x3930(0x0004)
	class APawn*                                       OldPawn;                                                  // 0x3934(0x0004)
	string                                             VehicleName;                                              // 0x3938(0x000C) (NeedCtorLink)
	float                                              fPrevLevelSeconds;                                        // 0x3944(0x0004)
	int                                                iSpread_Curr;                                             // 0x3948(0x0004)
	float                                              fSpread_Constant;                                         // 0x394C(0x0004)
	float                                              ch_up_x;                                                  // 0x3950(0x0004)
	float                                              ch_up_y;                                                  // 0x3954(0x0004)
	float                                              ch_down_x;                                                // 0x3958(0x0004)
	float                                              ch_down_y;                                                // 0x395C(0x0004)
	float                                              ch_left_x;                                                // 0x3960(0x0004)
	float                                              ch_left_y;                                                // 0x3964(0x0004)
	float                                              ch_right_x;                                               // 0x3968(0x0004)
	float                                              ch_right_y;                                               // 0x396C(0x0004)
	float                                              ch_up_width;                                              // 0x3970(0x0004)
	float                                              ch_up_height;                                             // 0x3974(0x0004)
	float                                              ch_down_width;                                            // 0x3978(0x0004)
	float                                              ch_down_height;                                           // 0x397C(0x0004)
	float                                              ch_left_width;                                            // 0x3980(0x0004)
	float                                              ch_left_height;                                           // 0x3984(0x0004)
	float                                              ch_right_width;                                           // 0x3988(0x0004)
	float                                              ch_right_height;                                          // 0x398C(0x0004)
	bool                                               bIsFatigueSoundPlaying;                                   // 0x3990(0x0004)
	float                                              fFSoundStartTime;                                         // 0x3994(0x0004)
	int                                                PrevSprintVal;                                            // 0x3998(0x0004)
	bool                                               bShoudPlayFSound;                                         // 0x399C(0x0004)
	class UClass*                                      HudPart_KillMessage_Class;                                // 0x39A0(0x0004)
	class AwHudPart_KillMessage*                       HudPart_KillMessage;                                      // 0x39A4(0x0004)
	class AwHudPart_Minimap*                           HudPart_Minimap;                                          // 0x39A8(0x0004)
	class AwHudPart_Bigmap*                            HudPart_Bigmap;                                           // 0x39AC(0x0004)
	bool                                               bShowBigmap;                                              // 0x39B0(0x0004)
	class AwHudPart_DisplayMain*                       HudPart_DisplayMain;                                      // 0x39B4(0x0004)
	class AwHudPart_DisplayEvent*                      HudPart_DisplayEvent;                                     // 0x39B8(0x0004)
	class AwHudPart_SelectQSlot*                       HudPart_SelQuickSlot;                                     // 0x39BC(0x0004)
	class AwHudPart_RadioMessage*                      HudPart_RadioMessage;                                     // 0x39C0(0x0004)
	byte                                               byShowRadioMessage;                                       // 0x39C4(0x0001)
	byte                                               Padding00[0x3];                                           // 0x39C5(0x0003) MISSED OFFSET
	class AwHudPart_DisplayQuest*                      HudPart_DisplayQuest;                                     // 0x39C8(0x0004)
	class AwHudPart_Tutorial*                          HudPart_Tutorial;                                         // 0x39CC(0x0004)
	class AwHudPart_Tutorial2*                         HudPart_Tutorial2;                                        // 0x39D0(0x0004)
	class AwHudPart_ItemBuy*                           HudPart_ItemBuy;                                          // 0x39D4(0x0004)
	byte                                               byShowItemBuy;                                            // 0x39D8(0x0001)
	byte                                               Padding01[0x3];                                           // 0x39D9(0x0003) MISSED OFFSET
	class APawn*                                       OldPawnOwner;                                             // 0x39DC(0x0004) (Edit)
	class UwMapInfo*                                   mapInfo;                                                  // 0x39E0(0x0004)
	bool                                               DrawChangeHost;                                           // 0x39E4(0x0004)
	float                                              DrawChangeHostBeginTime;                                  // 0x39E8(0x0004)
	float                                              DrawChangeHostDuration;                                   // 0x39EC(0x0004)
	string                                             MessageChangingHost;                                      // 0x39F0(0x000C) (Localized, NeedCtorLink)
	string                                             MessageChangingHostPre;                                   // 0x39FC(0x000C) (Localized, NeedCtorLink)
	string                                             MessageChangingHostPost;                                  // 0x3A08(0x000C) (Localized, NeedCtorLink)
	float                                              MessageScoreLastTime;                                     // 0x3A14(0x0004)
	float                                              MessageScoreAccelStep;                                    // 0x3A18(0x0004)
	int                                                MessageScoreEffect;                                       // 0x3A1C(0x0004)
	int                                                MessageScoreAlpha;                                        // 0x3A20(0x0004)
	float                                              ShowTime_NameTag_EnemyWhoKillMe;                          // 0x3A24(0x0004)
	class APawn*                                       ViewTarget;                                               // 0x3A28(0x0004)
	struct FVector                                     AttackerLoc;                                              // 0x3A2C(0x000C)
	bool                                               bClientOnBeginWaitingForStart;                            // 0x3A38(0x0004)
	bool                                               bClientOnEndWaitingForStart;                              // 0x3A38(0x0004)
	struct FSpriteWidget                               WKill;                                                    // 0x3A3C(0x0040) (Edit)
	struct FSpriteWidget                               WKillAim;                                                 // 0x3A7C(0x0040) (Edit)
	struct FSpriteWidget                               WAssist;                                                  // 0x3ABC(0x0040) (Edit)
	struct FSpriteWidget                               WHelikill;                                                // 0x3AFC(0x0040) (Edit)
	struct FSpriteWidget                               WArtillerykill;                                           // 0x3B3C(0x0040) (Edit)
	struct FSpriteWidget                               WSentryGunkill;                                           // 0x3B7C(0x0040) (Edit)
	struct FSpriteWidget                               WCapture;                                                 // 0x3BBC(0x0040) (Edit)
	struct FSpriteWidget                               WBombSetted;                                              // 0x3BFC(0x0040) (Edit)
	struct FSpriteWidget                               WBombDiffused;                                            // 0x3C3C(0x0040) (Edit)
	struct FSpriteWidget                               WFragGrenadeKill;                                         // 0x3C7C(0x0040) (Edit)
	struct FSpriteWidget                               WMeleeKill;                                               // 0x3CBC(0x0040) (Edit)
	struct FSpriteWidget                               WStepOnKill;                                              // 0x3CFC(0x0040) (Edit)
	struct FSpriteWidget                               WSpecialETCKill;                                          // 0x3D3C(0x0040) (Edit)
	struct FSpriteWidget                               WKillSuccession[0xF];                                     // 0x3D7C(0x0040) (Edit)
	struct FSpriteWidget                               WHeadshot;                                                // 0x413C(0x0040) (Edit)
	struct FSpriteWidget                               WHeadshotAim;                                             // 0x417C(0x0040) (Edit)
	struct FSpriteWidget                               WWallShotKill;                                            // 0x41BC(0x0040) (Edit)
	struct FSpriteWidget                               WKillBlood;                                               // 0x41FC(0x0040) (Edit)
	struct FSpriteWidget                               WKillBlood_Teen;                                          // 0x423C(0x0040) (Edit)
	struct FSpriteWidget                               WWarningMark;                                             // 0x427C(0x0040) (Edit)
	float                                              fWarningDelta;                                            // 0x42BC(0x0004) (Edit)
	struct FSpriteWidget                               WAirStrikeMark;                                           // 0x42C0(0x0040) (Edit)
	struct FSpriteWidget                               m_swSentryGunInstallingMessage;                           // 0x4300(0x0040) (Edit)
	string                                             SndHeartBeatDanagerSound;                                 // 0x4340(0x000C) (NeedCtorLink)
	string                                             SndHeartBeatEmergencySound;                               // 0x434C(0x000C) (NeedCtorLink)
	string                                             SndFallDanagerSound;                                      // 0x4358(0x000C) (NeedCtorLink)
	class UClass*                                      MinimapClass;                                             // 0x4364(0x0004) (Edit)
	float                                              fNoticeOffset;                                            // 0x4368(0x0004)
	struct FGameNotice[]                               aGameNotice;                                              // 0x436C(0x000C) (NeedCtorLink)
	struct FGameNotice[]                               aAASNotice;                                               // 0x4378(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.HudCDeathmatch");
		return ptr;
	}


	bool IsPickupWeapon();
	void DisalbeWeaponSlot5Hud();
	void EnableWeaponSlot5Hud(int nWeaponID);
	void ChangeWeaponSlot5Hud(class AwWeapon* newWeapon, bool bAddSkill);
	void DisalbeWeaponSlot6Hud();
	void ChangeWeaponSlot6Hud(class AwWeapon* newWeapon);
	void DrawAASNotice(class UCanvas* C);
	string GetNoticeFirst();
	void DrawSystemNotice(class UCanvas* C);
	void DrawGameNotice(class UCanvas* C);
	void AllDeleteGameNotice();
	void PushAASNotice(const string& sNotice, float beginTime, byte byLevel);
	void PushGameNotice(const string& sNotice);
	void RecGameNotice(const string& sNotice);
	void RecAAS(const string& sNotice, float DrawTime);
	void DrawWaringMark(class UCanvas* C, float fWidth, float fHeight, float fCurLifeTime, float fMaxLifeTime);
	void DrawScoreEffect(class UCanvas* C, const struct FSpriteWidget& W, float fWidth, float fHeight, const struct FCalCoordsW& calW, float PosX, float PosY);
	bool DrawKillMarkEffect(class UCanvas* C, const struct FSpriteWidget& W, float fWidth, float fHeight, const struct FCalCoordsW& calW, float PosX, float PosY, float fScale);
	bool DrawSpecialSkillMedal(class UCanvas* C, int Index, int width, int Height, const struct FCalCoordsW& calW, int PosX, int PosY, float curScale);
	void CallSpecialSkillMedelSound(int Index);
	void DrawAddScore(class UCanvas* C, int i, float ScorePosX, float ScorePosY, int MessageScoreEffect, float CurrentScale);
	void DrawMessageScore(class UCanvas* C, int i, float PosX, float PosY, float* dx, float* dy);
	void ResetKillMessageTexture();
	void DrawMessageWithTexture(class UCanvas* C, int i, float PosX, float PosY, float* dx, float* dy);
	void DrawMessage(class UCanvas* C, int i, float PosX, float PosY, float* dx, float* dy);
	void LocalizedMessage(class UClass* Message, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject, const string& CriticalString);
	bool IsUAVOn();
	bool IsUAVScanning();
	float GetUAVScanLineTexturePos();
	float GetUAVScanLineMinimapPos();
	float GetUAVScanProgress();
	void StartUAVScan();
	bool IsPawnUnderScan(class APawn* P);
	void UpdateUAV();
	void DrawUAV(class UCanvas* C);
	void DrawDebugUAV(class UCanvas* C, int X, int dy, int* Y);
	void CallItemBuy(int iKey, int iReservation1, int iReservation2);
	void TutorialEvent(const string& S, const FName& Type, const FName& reserv);
	void CallRadioMessage(int iKey, int iReservation1, int iReservation2);
	void CallEvent(bool InvenCheck, int iReservation1, int iReservation2);
	void DrawChangeHostGuest(class UCanvas* C);
	void OnEndChangedHost();
	void EndDrawChangeHost();
	void BeginDrawChangeHost();
	struct FVector STATIC_GetTargetOrientation2(const struct FVector& loc, const struct FVector& camLoc, const struct FRotator& camRot);
	struct FVector STATIC_ExpandTargetOrientationToCanvas(class UCanvas* C, const struct FVector& Orientation);
	struct FVector STATIC_GetTargetOrientation(class AActor* Target, const struct FVector& camLoc, const struct FRotator& camRot);
	void DrawOutArrow(class UCanvas* C, float W, float H, const struct FVector& ScreenPos);
	void DrawObjectSprite(class UCanvas* C, class UObject* Tag, const struct FSpriteWidget& objectSprite, const struct FVector& objectLoc, bool drawMeter, float rX, float rY);
	void DrawObjectSprite2(class UCanvas* C, class UObject* Tag, const struct FSpriteWidget& objectSprite, const struct FVector& objectLoc, const string& ObjectName, int Alpha);
	void DrawObjectSprite3(class UCanvas* C, const struct FSpriteWidget& objectSprite, const struct FVector& objectLoc, bool bNoMeterDisplay);
	void DrawCustomObjectSprite(class UCanvas* C, class AwPawn* curPawn, const struct FSpriteWidget& objectSprite, const string& strName, float fAdditionalX, float fAdditionalY);
	struct FVector CalcScreenPos(class UCanvas* C, const struct FVector& objectLoc, float W, float H, bool ClipEclipse, float rX, float rY, byte* clipped);
	void CallSkill(int iKey, bool bRequire, bool bSuccess);
	void DrawSelfKillMessage(class UCanvas* C);
	struct FSelfKillMessage MakeSelfKillMessage(const string& KillerName, const string& VictimName, class UClass* Type);
	void RefreshKillerMark(const string& mKillerName);
	void OnClientReceiveDeathMessage(class APlayerController* P, int Switch, class APlayerReplicationInfo* attackerPRI, class APlayerReplicationInfo* victimPRI, class UObject* OptionalObject);
	void OnClientReceiveFlyingDefenceBotDeathMessage(class APlayerController* P, class APlayerReplicationInfo* attackerPRI, class APlayerReplicationInfo* victimPRI, class UObject* OptionalObject);
	void OnClientReceiveSentryGunDeathMessage(class APlayerController* P, class APlayerReplicationInfo* attackerPRI, class APlayerReplicationInfo* victimPRI, class UObject* OptionalObject);
	void OnClientReceiveHeliDeathMessage(class APlayerController* P, class APlayerReplicationInfo* attackerPRI, class APlayerReplicationInfo* victimPRI, class UObject* OptionalObject);
	void OnClientReceiveDeathMessage_AddToConsole(class APlayerController* P, class APlayerReplicationInfo* attackerPRI, class APlayerReplicationInfo* victimPRI, class AwDamageType* DamageType);
	void DrawDamageIndicator(class UCanvas* C, const struct FDamageIndicationInfo& Info);
	void DrawDamageIndicators(class UCanvas* C);
	bool IsHealthInDanger(int hpBefore, int hpAfter);
	void DrawHealthInDanger(class UCanvas* C);
	void DrawFallInDanger(class UCanvas* C);
	void StopNotifyFallInDanager();
	void NotifyFallInDanger();
	void StopNotifyHealthInDanager();
	void NotifyHealthInDanger();
	void ClearDamageIndicationInfos();
	void AddDamageIndicationInfo(const struct FVector& AttackerLocation, int Damage, class UClass* DamageType);
	void NotifyTakeHit(const struct FVector& AttackerLocation, int Damage, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart);
	void DrawProgressStatus(class UCanvas* C, float Progress);
	class UFont* LoadLevelActionFont();
	void DisplayPortrait(class APlayerReplicationInfo* PRI);
	bool DrawLevelAction(class UCanvas* C);
	void DrawVehicleChargeBar(class UCanvas* C);
	void DrawChargeBar(class UCanvas* C);
	void ShowReloadingPulse(float HOLD);
	void DrawDamageDealNotification(class UCanvas* C);
	void ResetByChangeSpectatingPawn();
	void DrawWarfareCrosshair(class UCanvas* C);
	void SetMA(float f);
	void DrawDetectedBombs(class UCanvas* C);
	void DrawHudSpectating(class UCanvas* C);
	void DrawHudPassC(class UCanvas* C);
	class UMaterial* GetLevelImage(class APlayerReplicationInfo* PRI);
	void DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos);
	void DrawDebugPosition(class UCanvas* C, class APawn* P);
	void DrawHudPassA(class UCanvas* C);
	void DrawBackDisplayScreen(class UCanvas* C);
	void DrawDebug(class UCanvas* C, int X, int dy, int* Y);
	void DrawDebug_Network(class UCanvas* C, int X, int dy, int* Y);
	void wclearNet();
	void DrawDebug_DrawDebugUserWeaponStates(class UCanvas* C, int X, int dy, int* Y);
	void DrawDebug_Inventory(class UCanvas* C, int X, int dy, int* Y);
	void DrawDebugEmitters(class UCanvas* C);
	void DrawDebugHelicopter(class UCanvas* C);
	void DrawDebugAirStrike(class UCanvas* C);
	void DrawSpecialPositions(class UCanvas* C);
	void DrawTimer2(class UCanvas* C);
	void DrawTimer1(class UCanvas* C);
	void DrawAmmoLinear2(class UCanvas* C, int Ammo, int MaxAmmo, const struct FAmmoSet& as);
	void DrawAmmoLinear(class UCanvas* C, int Ammo, int MaxAmmo, int digitOffset, const struct FNumericWidget& ammoWidget, struct FDigitSet* AmmoSet);
	void DrawAmmo100(class UCanvas* C, int Ammo, int MaxAmmo, int ammoPerLine);
	void DecideAmmoNum(int Ammo, int MaxAmmo, int* ammoDefault, int* ammoUsed);
	bool IsAmmoShortage(int Ammo, int MaxAmmo);
	void DrawAmmoFlameThrower2(class UCanvas* C, int curr, int Max);
	void DrawAmmoFlameThrower(class UCanvas* C, int curr, int Max);
	void DrawAmmoDemo(class UCanvas* C);
	void DrawAmmo(class UCanvas* C);
	void DrawGaugeOverHeat(class UCanvas* C, float iRatio);
	void DrawWeaponImage(class UCanvas* C, bool bShowSpectating, string* sWeaponName);
	void DrawAmmoSeparator(class UCanvas* C);
	void CheckUsingSkillList(class AwWeapon* Wpn, int* iState);
	void GetHUDTextures(int ItemID, class UMaterial** enableSkillIcon, class UMaterial** disableSkillIcon);
	void GetSkillInfo(int SkillID, int weaponID, int* usedStrCode, int* skillSlotNum);
	class UMaterial* GetSkillIconByWeaponID(int nWeaponID, bool bEnable);
	void InsertUsingSkillList(int SkillID, int weaponID, int SubSkillID);
	void CheckPawnOwnerSkill(int* skillC4, int* skillAirStirke, int* skillRPG);
	bool HasItemInMyInventory(bool bCheck, int ItemID1, int ItemID2);
	void InitSkillFlag();
	void DrawSkill(class UCanvas* C);
	void DrawSlotEnable(class UCanvas* C, float activeTime, const struct FSpriteWidget& showSprite);
	void DrawSkill_Slot6(class UCanvas* C);
	void DrawSkill_Slot5(class UCanvas* C);
	void DrawHudPassA_Score(class UCanvas* C);
	void NotifyDeath(class APawn* P);
	float GetTeamDeathTextureScale(const struct FTeamDeathInfo& Info);
	struct FColor GetTeamDeathTextureColor(const struct FTeamDeathInfo& Info);
	void DrawTeamDeathInfo(class UCanvas* C, const struct FVector& ScreenPos, const struct FVector& camLoc, const struct FRotator& camRot, const struct FTeamDeathInfo& Info);
	void DrawAllTeamDeathInfo(class UCanvas* C);
	void AddTeamDeathInfo(class APawn* P, class APlayerReplicationInfo* PRI, float FadeTime, float Duration);
	void DrawPosture(class UCanvas* C, bool bShowSpectating);
	void DrawHpStamina(class UCanvas* C, bool bShowSpectating);
	void SellectEffectBar();
	float CalculateHPBar(bool bDamage, bool bRecovery);
	void DisplayVoiceGain(class UCanvas* C);
	void ZoomFadeOut(class UCanvas* C);
	void FadeZoom();
	void DisplayEnemyName(class UCanvas* C, class APlayerReplicationInfo* PRI);
	void DrawEnemyName(class UCanvas* C);
	void DrawCrosshair(class UCanvas* C);
	void DrawWarfareCrosshair_Image(class UCanvas* C, class UMaterial* mat);
	void UpdateCrossHairSpread();
	void DrawTurretCrossHair(class UCanvas* C);
	void DrawStaticCrossHair(class UCanvas* C);
	void DrawHUDAnimWidget(float DefaultScale, float PickUPTime, float AnimTime, float AnimScale, struct FSpriteWidget* HUDPiece);
	void DrawHUDAnimDigit(float DefaultScale, float PickUPTime, float AnimTime, const struct FColor& DefaultColor, const struct FColor& colorHighlight, struct FNumericWidget* HUDPiece);
	string GetInfoString();
	void ShowEnemyWhoKillMe(class UCanvas* C);
	void DrawSpectatingHud(class UCanvas* C);
	void DrawViewTargetInfo(class UCanvas* C);
	void DrawResultScore(class UCanvas* C);
	bool DrawResult(class UCanvas* C);
	void SendQuestUpdate();
	bool IsInCinematic();
	struct FColor STATIC_GetTeamColor(byte TeamNum);
	string GetScoreTagLine();
	string GetScoreValue(class APlayerReplicationInfo* PRI);
	string GetScoreText();
	void CalculateScore();
	void CalculateAmmo();
	void CalculateEnergy();
	void CalculateShield();
	void CalculateHealth();
	void UpdateRankAndSpread(class UCanvas* C);
	void DrawUDamage(class UCanvas* C);
	void DrawTimer(class UCanvas* C);
	void DrawAdrenaline(class UCanvas* C);
	void DrawVehicleName(class UCanvas* C);
	void PlaySoundRecovery();
	void PlaySoundStop(class UCanvas* C);
	void updateScore();
	void UpdateHUD();
	void DoUpdateTime();
	void UpdateDigitsMisc();
	void UpdateDigitsHealth();
	void UpdateSprint();
	void UpdateTimer(int* TimeMinutes, int* TimeSeconds);
	void SetDigitsTimer2(int Min, int sec);
	void SetDigitsTimer1(int Min, int sec);
	void SetDigitsScore(int valueL, bool highlightL, int valueR, bool highlightR, int valueU, int valueD);
	void DrawAirStrikePosition(class UCanvas* C);
	void DrawSuppliesPositions(class UCanvas* C);
	void CacheSuppliesPositions(class AActor* act);
	void DeleteSuppliesPositions(class AActor* act);
	void AllDeleteSuppliesPositions();
	void CacheSpecialPositions();
	void Tick(float DeltaTime);
	void CheckCountdown(class AGameReplicationInfo* GRI);
	void SetCustomHUDColor();
	void SetCustomCrosshairColors();
	void SetCustomCrosshairs();
	bool CustomHUDColorAllowed();
	bool CustomCrosshairColorAllowed();
	bool CustomCrosshairsAllowed();
	void ResetHud();
	void SetScoreBoardClass(class UClass* ScoreboardClass, class UClass* ResultBoardClass, class UClass* ResultBoardBootyClass);
	void InitHudPart_ItemBuy();
	void InitHudPart_SelQuickSlot();
	void PostBeginPlay();
	void UpdatePrecacheMaterials();
	void ShowRadioMessage_Notify();
	void ShowRadioMessage_Alarm();
	void ShowRadioMessage();
	void UpdateMinimapMode();
	void ShowBigmap();
	void DrawRouteCache(class AwAIBot* C);
	void RenderAIPaths();
	struct FColor CalcArrayColor(float V, struct FColor[] carray);
	void RenderNavExtraCost();
	void RenderVisCount();
	void RenderInfluence();
	void RenderCoverAngle();
	void RenderRadius();
	void RenderSDFrontLine(bool Full);
	void rendai(const string& v1, const string& v2);
	void WorldSpaceOverlays();
	void ShrinkHUD();
	void GrowHUD();
};


// Class XInterface.BTHUDResourcePoolHK
// 0x0500 (0x052C - 0x002C)
class UBTHUDResourcePoolHK : public UObject
{
public:
	struct FImage                                      keyb_Z;                                                   // 0x002C(0x0020)
	struct FImage                                      keyb_1;                                                   // 0x004C(0x0020)
	struct FImage                                      keyb_2;                                                   // 0x006C(0x0020)
	struct FImage                                      keyb_3;                                                   // 0x008C(0x0020)
	struct FImage                                      keyb_4;                                                   // 0x00AC(0x0020)
	struct FImage                                      keyb_5;                                                   // 0x00CC(0x0020)
	struct FImage                                      keyb_T;                                                   // 0x00EC(0x0020)
	struct FImage                                      keyb_E;                                                   // 0x010C(0x0020)
	struct FImage                                      keyb_B;                                                   // 0x012C(0x0020)
	struct FImage                                      keyb_Q;                                                   // 0x014C(0x0020)
	struct FImage                                      img_login_test;                                           // 0x016C(0x0020)
	struct FImage                                      hud_back_1;                                               // 0x018C(0x0020)
	struct FImage                                      hud_back_2;                                               // 0x01AC(0x0020)
	struct FImage                                      hud_back_3;                                               // 0x01CC(0x0020)
	struct FImage                                      hud_back_4;                                               // 0x01EC(0x0020)
	struct FImage                                      hud_back_4_1;                                             // 0x020C(0x0020)
	struct FImage                                      hud_back_5;                                               // 0x022C(0x0020)
	struct FImage                                      hud_chat_but;                                             // 0x024C(0x0020)
	struct FImage                                      img_HUD_back_1;                                           // 0x026C(0x0020)
	struct FImage                                      img_HUD_back_2;                                           // 0x028C(0x0020)
	struct FImage                                      InGameChatCursor;                                         // 0x02AC(0x0020)
	struct FImage                                      Key_Bg;                                                   // 0x02CC(0x0020)
	struct FImage                                      butt_n;                                                   // 0x02EC(0x0020)
	struct FImage                                      butt_quick3;                                              // 0x030C(0x0020)
	struct FImage                                      butt_On1;                                                 // 0x032C(0x0020)
	struct FImage                                      butt_On2;                                                 // 0x034C(0x0020)
	struct FImage                                      butt_Keyboard;                                            // 0x036C(0x0020)
	struct FImage                                      img_TextSelect;                                           // 0x038C(0x0020)
	struct FImage                                      img_TextBack;                                             // 0x03AC(0x0020)
	struct FImage                                      newButt_n;                                                // 0x03CC(0x0020)
	struct FImage                                      Weapon_Type_n;                                            // 0x03EC(0x0020)
	struct FImage                                      Weapon_Sel_Line;                                          // 0x040C(0x0020)
	struct FImage                                      Slot_Bg;                                                  // 0x042C(0x0020)
	struct FImage                                      MainWeapon_Bg;                                            // 0x044C(0x0020)
	struct FImage                                      SubWeapon_Bg;                                             // 0x046C(0x0020)
	struct FImage                                      MeleeWeapon_Bg;                                           // 0x048C(0x0020)
	struct FImage                                      SpWeapon_Bg;                                              // 0x04AC(0x0020)
	struct FImage                                      ActiveSkill_Bg;                                           // 0x04CC(0x0020)
	struct FImage                                      PassiveSkill_Bg;                                          // 0x04EC(0x0020)
	struct FImage                                      WaitRoom_Defence_Reward2;                                 // 0x050C(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.BTHUDResourcePoolHK");
		return ptr;
	}

};


// Class XInterface.HudCTeamDeathMatch
// 0x02CC (0x4650 - 0x4384)
class AHudCTeamDeathMatch : public AHudCDeathmatch
{
public:
	struct FNumericWidget                              ScoreTeam[0x2];                                           // 0x4384(0x0030) (Edit)
	struct FNumericWidget                              totalLinks;                                               // 0x43E4(0x0030) (Edit)
	struct FSpriteWidget                               VersusSymbol;                                             // 0x4414(0x0040) (Edit)
	struct FSpriteWidget                               TeamScoreBackGround[0x2];                                 // 0x4454(0x0040) (Edit)
	struct FSpriteWidget                               TeamScoreBackGroundDisc[0x2];                             // 0x44D4(0x0040) (Edit)
	struct FSpriteWidget                               LinkIcon;                                                 // 0x4554(0x0040) (Edit)
	struct FSpriteWidget                               TeamSymbols[0x2];                                         // 0x4594(0x0040) (Edit)
	int                                                Links;                                                    // 0x4614(0x0004) (Edit)
	struct FColor                                      CarrierTextColor1;                                        // 0x4618(0x0004) (Edit)
	struct FColor                                      CarrierTextColor2;                                        // 0x461C(0x0004) (Edit)
	struct FColor                                      CarrierTextColor3;                                        // 0x4620(0x0004) (Edit)
	string                                             CarriersName;                                             // 0x4624(0x000C) (Edit, NeedCtorLink)
	string                                             CarriersLocation;                                         // 0x4630(0x000C) (Edit, NeedCtorLink)
	float                                              CNPosX;                                                   // 0x463C(0x0004) (Edit)
	float                                              CNPosY;                                                   // 0x4640(0x0004) (Edit)
	string                                             LinkEstablishedMessage;                                   // 0x4644(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.HudCTeamDeathMatch");
		return ptr;
	}


	bool CustomHUDColorAllowed();
	void UpdateHUD();
	void updateScore();
	void UpdateTeamHud();
	void DrawHudPassC(class UCanvas* C);
	void TeamScoreOffset();
	void ShowTeamScorePassC(class UCanvas* C);
	void ShowVersusIcon(class UCanvas* C);
	void ShowTeamScorePassA(class UCanvas* C);
	void DrawHudPassA(class UCanvas* C);
	void DrawMyScore(class UCanvas* C);
	void DrawTeamOverlay(class UCanvas* C);
	void UpdateRankAndSpread(class UCanvas* C);
	void drawLinkText(class UCanvas* C);
	void showLinks();
	void Tick(float DeltaTime);
	void DrawSpectatingHud(class UCanvas* C);
};


// Class XInterface.wHudPart_DisplayBase
// 0x18E0 (0x2598 - 0x0CB8)
class AwHudPart_DisplayBase : public AHudBase
{
public:
	class AHudBase*                                    HudOwner;                                                 // 0x0CB8(0x0004)
	class UwMapInfo*                                   mapInfo;                                                  // 0x0CBC(0x0004)
	float                                              MaxAlpha;                                                 // 0x0CC0(0x0004)
	float                                              MinAlpha;                                                 // 0x0CC4(0x0004)
	string                                             lsScore;                                                  // 0x0CC8(0x000C) (Localized, NeedCtorLink)
	string                                             lsRanking;                                                // 0x0CD4(0x000C) (Localized, NeedCtorLink)
	struct FColor                                      color_Default;                                            // 0x0CE0(0x0004)
	struct FColor                                      color_Orange;                                             // 0x0CE4(0x0004)
	struct FColor                                      color_Shadow;                                             // 0x0CE8(0x0004)
	struct FSpriteWidget                               WKeyButtonBGSmall;                                        // 0x0CEC(0x0040) (Edit)
	struct FSpriteWidget                               WKeyButtonBGSmallBlink;                                   // 0x0D2C(0x0040) (Edit)
	struct FSpriteWidget                               WKeyButtonBG;                                             // 0x0D6C(0x0040) (Edit)
	struct FSpriteWidget                               WKeyButtonBGBlink;                                        // 0x0DAC(0x0040) (Edit)
	struct FSpriteWidget                               WKeyButtonBGBig;                                          // 0x0DEC(0x0040) (Edit)
	struct FSpriteWidget                               WKeyButtonBGBigBlink;                                     // 0x0E2C(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonNumber[0xA];                                 // 0x0E6C(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonAlphaBet[0x1A];                              // 0x10EC(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonSpecial[0x25];                               // 0x176C(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonFunction[0xD];                               // 0x20AC(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonNone;                                        // 0x23EC(0x0040) (Edit)
	struct FSpriteWidget                               WKeyButtonBigF[0x2];                                      // 0x242C(0x0040) (Edit)
	struct FSpriteWidget                               WRespawnBG;                                               // 0x24AC(0x0040) (Edit)
	struct FSpriteWidget                               WRespawnGauge;                                            // 0x24EC(0x0040) (Edit)
	string[]                                           keys;                                                     // 0x252C(0x000C) (NeedCtorLink)
	string[]                                           LocalizedKeys;                                            // 0x2538(0x000C) (NeedCtorLink)
	string                                             sKeyBtnHeli;                                              // 0x2544(0x000C) (NeedCtorLink)
	string                                             sKeyBtnAirStrike;                                         // 0x2550(0x000C) (NeedCtorLink)
	string                                             sKeyBtnUAV;                                               // 0x255C(0x000C) (NeedCtorLink)
	string                                             sKeyBtnSentryGun;                                         // 0x2568(0x000C) (NeedCtorLink)
	string                                             skeyUseKey;                                               // 0x2574(0x000C) (NeedCtorLink)
	string                                             skeyWeaponReload;                                         // 0x2580(0x000C) (NeedCtorLink)
	string                                             skeyBtnC4;                                                // 0x258C(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_DisplayBase");
		return ptr;
	}


	void UpdateHelpKeyControll();
	string GetEllipsString(class UCanvas* C, const string& strText, float fLimitWidth, float FontSize);
	bool GetKeyTexture(const string& sKey, float OffsetX, struct FSpriteWidget* W, float* fWidth);
	void Initialize(class AHudBase* myOwner, class ALevelInfo* Level);
};


// Class XInterface.wHudPart_SelectQSlot
// 0x07F0 (0x2D88 - 0x2598)
class AwHudPart_SelectQSlot : public AwHudPart_DisplayBase
{
public:
	string                                             strChangeQS[0x6];                                         // 0x2598(0x000C) (Localized, NeedCtorLink)
	string                                             strChangeQSInPlayerWalking;                               // 0x25E0(0x000C) (Localized, NeedCtorLink)
	string                                             strCloseQSTime;                                           // 0x25EC(0x000C) (Localized, NeedCtorLink)
	string                                             strCloseQSDistance;                                       // 0x25F8(0x000C) (Localized, NeedCtorLink)
	string                                             strQSContent[0xB];                                        // 0x2604(0x000C) (Localized, NeedCtorLink)
	string                                             CapBaseWeaponSet;                                         // 0x2688(0x000C) (Localized, NeedCtorLink)
	string                                             srtQSNothing;                                             // 0x2694(0x000C) (Localized, NeedCtorLink)
	int                                                QuickSlotWindowShowTime;                                  // 0x26A0(0x0004)
	int                                                QuickSlotWindowStartTime;                                 // 0x26A4(0x0004)
	string                                             strWeaponChange[0x2];                                     // 0x26A8(0x000C) (Localized, NeedCtorLink)
	string                                             strQSButtonZ;                                             // 0x26C0(0x000C) (Localized, NeedCtorLink)
	string                                             strToggleQS[0x2];                                         // 0x26CC(0x000C) (Localized, NeedCtorLink)
	string                                             strUsing;                                                 // 0x26E4(0x000C) (Localized, NeedCtorLink)
	struct FColor                                      colorLeftTime;                                            // 0x26F0(0x0004)
	struct FColor                                      colorQS;                                                  // 0x26F4(0x0004)
	struct FColor                                      colorQSSelect;                                            // 0x26F8(0x0004)
	struct FColor                                      colorQSContent;                                           // 0x26FC(0x0004)
	struct FFloatBox                                   fbQSBack;                                                 // 0x2700(0x0010)
	struct FFloatBox                                   fbQSButton[0x5];                                          // 0x2710(0x0010)
	struct FFloatBox                                   fbQSButtonZ;                                              // 0x2760(0x0010)
	struct FFloatBox                                   fbQSButtonOpen;                                           // 0x2770(0x0010)
	struct FFloatBox                                   fbQSContentName[0x5];                                     // 0x2780(0x0010)
	struct FFloatBox                                   fbQSContent[0x5];                                         // 0x27D0(0x0010)
	struct FFloatBox                                   fbQSBack_Content;                                         // 0x2820(0x0010)
	struct FFloatBox                                   fbQS_Content_Text;                                        // 0x2830(0x0010)
	struct FFloatBox                                   fbQS_Content_Text_Default;                                // 0x2840(0x0010)
	struct FFloatBox                                   fbQSBack_ItemContent[0x5];                                // 0x2850(0x0010)
	struct FFloatBox                                   fbQSBack_ItemImage;                                       // 0x28A0(0x0010)
	class ALevelInfo*                                  Level;                                                    // 0x28B0(0x0004)
	float                                              LevelStartTime;                                           // 0x28B4(0x0004)
	bool                                               bPrevIsStateWaitingForStart;                              // 0x28B8(0x0004)
	bool                                               bCurrentIsStateWaitingForStart;                           // 0x28B8(0x0004)
	bool                                               bTimeLimitOff;                                            // 0x28B8(0x0004)
	bool                                               bStartChangeQS;                                           // 0x28B8(0x0004)
	bool                                               bPrevIsStatePlayerWalking;                                // 0x28B8(0x0004)
	bool                                               bCurrentIsStatePlayerWalking;                             // 0x28B8(0x0004)
	bool                                               bPrevIsStateDead;                                         // 0x28B8(0x0004)
	bool                                               bCurrentIsStateDead;                                      // 0x28B8(0x0004)
	bool                                               bPrevIsStateRoundEnded;                                   // 0x28B8(0x0004)
	bool                                               bCurrentIsStateRoundEnded;                                // 0x28B8(0x0004)
	bool                                               bCurrentIsStateSpectate;                                  // 0x28B8(0x0004)
	int                                                PrevSelectedQSlotIndex;                                   // 0x28BC(0x0004)
	int                                                ContentOffSetX[0x6];                                      // 0x28C0(0x0004)
	int                                                ContentOffSetY[0x9];                                      // 0x28D8(0x0004)
	string                                             strQS[0x7];                                               // 0x28FC(0x000C) (NeedCtorLink)
	int                                                iFontSize0;                                               // 0x2950(0x0004)
	int                                                iFontSize1;                                               // 0x2954(0x0004)
	int                                                iFontSize2;                                               // 0x2958(0x0004)
	int                                                iFontSize3;                                               // 0x295C(0x0004)
	struct FSpriteWidget                               HelpKeyButtonQSlot;                                       // 0x2960(0x0040) (Edit)
	float                                              WidthButtonQSlot;                                         // 0x29A0(0x0004)
	bool                                               bUpdate;                                                  // 0x29A4(0x0004)
	struct FFloatBox                                   fbQSBack_SlotName[0x4];                                   // 0x29A8(0x0010)
	struct FsQuickSlot[]                               QuickSlotList;                                            // 0x29E8(0x000C) (NeedCtorLink)
	bool                                               bLoadDefaultItemResource;                                 // 0x29F4(0x0004)
	bool                                               bLoadSlotItemResource;                                    // 0x29F4(0x0004)
	struct FImage                                      mDefaultItemImage[0x4];                                   // 0x29F8(0x0020)
	struct FImage                                      mQuickSlotItemImage[0x14];                                // 0x2A78(0x0020)
	struct FFloatBox                                   fWeaponUV[0x9];                                           // 0x2CF8(0x0010)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_SelectQSlot");
		return ptr;
	}


	void DrawItemImage(class UCanvas* C);
	void CalcQuickSlotTimer(int* respawnLeftTime, int* startupLeftTime);
	struct FImage GetItemImage(class UCanvas* C, int iItemID);
	void QuickSlotContent_SetString(class UCanvas* C, int iPosX, int iPosY, int iSlot, bool bDefaultWeapon);
	bool DrawQuickSlotContent_List(class UCanvas* C, int iPosX, int iPosY, int iSlot);
	void DrawQuickSlotContent_DefaultWeapon(class UCanvas* C, int iPosX, int iPosY);
	void DrawQuickSlotContent_Description(class UCanvas* C, int iPosX, int iPosY);
	void DrawSellectBar(class UCanvas* C, int iPosX, int iPosY, bool bDefaultWeapon);
	void DrawQuickSlotName(class UCanvas* C, int iPosX, int iPosY, int iSlot, bool bDefaultWeapon, bool bHasItem);
	void DrawQuickSlot(class UCanvas* C);
	void DrawSelectQSlot(class UCanvas* C);
	void DrawA(class UCanvas* C);
	void UpdateHelpKeyControll();
	void CallEvent(bool ItemCheck, int iReservation1, int iReservation2);
	void CallSelectQuickSlot(int iIndex);
	void ToggleQuickSlotWindow();
	void EndQuickSlotWindow();
	void BeginQuickSlotWindow();
	void Initialize(class AHudBase* myOwner, class ALevelInfo* _level);
};


// Class XInterface.wHudPart_MinimapBase
// 0x0674 (0x132C - 0x0CB8)
class AwHudPart_MinimapBase : public AHudBase
{
public:
	class AHudBase*                                    HudOwner;                                                 // 0x0CB8(0x0004)
	class ALevelInfo*                                  Level;                                                    // 0x0CBC(0x0004)
	struct FSpriteWidget                               MinimapBG;                                                // 0x0CC0(0x0040) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FSpriteWidget                               MinimapBGMap;                                             // 0x0D00(0x0040) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FSpriteWidget                               MinimapCompass;                                           // 0x0D40(0x0040) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FSpriteWidget                               MinimapFlatTop;                                           // 0x0D80(0x0040) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FSpriteWidget                               MinimapFlatBottom;                                        // 0x0DC0(0x0040) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FSpriteWidget                               MinimapMyself;                                            // 0x0E00(0x0040) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UMaterial*                                   MinimapMatMyself;                                         // 0x0E40(0x0004)
	class UMaterial*                                   MinimapMatAlly;                                           // 0x0E44(0x0004)
	class UMaterial*                                   MinimapMatAttackingAlly;                                  // 0x0E48(0x0004)
	class UMaterial*                                   MinimapFCMatAlly;                                         // 0x0E4C(0x0004)
	class UMaterial*                                   MinimapFCMatAttackingAlly;                                // 0x0E50(0x0004)
	class UMaterial*                                   MinimapMatRadioMessage;                                   // 0x0E54(0x0004)
	struct FSpriteWidget                               MinimapDeadAlly;                                          // 0x0E58(0x0040) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FSpriteWidget[]                             MinimapAttackingEnemies;                                  // 0x0E98(0x000C) (Edit, NeedCtorLink)
	struct FSpriteWidget[]                             MinimapDeadEnemies;                                       // 0x0EA4(0x000C) (Edit, NeedCtorLink)
	struct FMinimapDeadInfo[]                          MinimapDeadInfos;                                         // 0x0EB0(0x000C) (Edit, NeedCtorLink)
	struct FSpriteWidget                               MinimapAlien;                                             // 0x0EBC(0x0040)
	struct FSpriteWidget                               MinimapStrikeAlly;                                        // 0x0EFC(0x0040) (Edit)
	struct FSpriteWidget                               MinimapStrikeEnem;                                        // 0x0F3C(0x0040) (Edit)
	struct FSpriteWidget                               MinimapAirStrikeRect;                                     // 0x0F7C(0x0040) (Edit)
	struct FSpriteWidget                               MinimapAirStrikeAllyRect;                                 // 0x0FBC(0x0040) (Edit)
	struct FSpriteWidget                               MinimapAirStrikeEnemRect;                                 // 0x0FFC(0x0040) (Edit)
	int                                                MinimapCompassVisibleWidth;                               // 0x103C(0x0004) (Edit)
	int                                                MinimapCompassNorthPoint;                                 // 0x1040(0x0004) (Edit)
	int                                                MinimapCompassWidth;                                      // 0x1044(0x0004) (Edit)
	int                                                MinimapCenterX;                                           // 0x1048(0x0004) (Edit)
	int                                                MinimapCenterY;                                           // 0x104C(0x0004) (Edit)
	int                                                MinimapSize;                                              // 0x1050(0x0004) (Edit)
	int                                                MinimapCoverSize;                                         // 0x1054(0x0004) (Edit)
	float                                              MinimapScale;                                             // 0x1058(0x0004) (Edit)
	int                                                MinimapDrawBuffer;                                        // 0x105C(0x0004) (Edit)
	float                                              MinimapAllyFireNotificationDuration;                      // 0x1060(0x0004) (Edit)
	float                                              MinimapEnemyDrawDuration_Pre;                             // 0x1064(0x0004) (Edit)
	float                                              MinimapEnemyDrawDuration_Post;                            // 0x1068(0x0004) (Edit)
	float                                              DeadDrawDuration;                                         // 0x106C(0x0004) (Edit)
	float                                              MinimapAllyRadioMessageDuration;                          // 0x1070(0x0004) (Edit)
	float                                              fBlinkTimeLen;                                            // 0x1074(0x0004) (Edit)
	float                                              fBlinkTerm;                                               // 0x1078(0x0004) (Edit)
	struct FSpriteWidget                               MinimapIconAlly;                                          // 0x107C(0x0040)
	struct FSpriteWidget                               MinimapIconEnemy;                                         // 0x10BC(0x0040)
	struct FSpriteWidget                               MinimapIconEnemyBoss[0x3];                                // 0x10FC(0x0040)
	struct FSpriteWidget                               MinimapIconEnemyBossBlend[0x3];                           // 0x11BC(0x0040)
	int                                                MinimapIconEnemyID[0x3];                                  // 0x127C(0x0004)
	class UClass*[]                                    SpecialPositions_Class;                                   // 0x1288(0x000C) (NeedCtorLink)
	class UMaterial*[]                                 SpecialPositions_Image;                                   // 0x1294(0x000C) (NeedCtorLink)
	float                                              UpdateTime_SpecialPositions;                              // 0x12A0(0x0004)
	struct FCachedSpecialPosInfo[]                     CachedSpecialPositions;                                   // 0x12A4(0x000C) (NeedCtorLink)
	struct FColor                                      BaseColor;                                                // 0x12B0(0x0004)
	float                                              IconSizeF;                                                // 0x12B4(0x0004)
	bool                                               DrawFrame;                                                // 0x12B8(0x0004)
	bool                                               DrawCompass;                                              // 0x12B8(0x0004)
	bool                                               DrawNorthPole;                                            // 0x12B8(0x0004)
	class UVariableTexPanner*                          UAVBG_Base;                                               // 0x12BC(0x0004)
	class UTexRotator*                                 UAVBG;                                                    // 0x12C0(0x0004)
	struct FVector                                     t1;                                                       // 0x12C4(0x000C)
	struct FVector                                     t2;                                                       // 0x12D0(0x000C)
	struct FVector                                     w1;                                                       // 0x12DC(0x000C)
	struct FVector                                     w2;                                                       // 0x12E8(0x000C)
	struct FVector                                     tPerW;                                                    // 0x12F4(0x000C)
	bool                                               IsDrawSpecialPositions;                                   // 0x1300(0x0004)
	bool                                               IsClampDistance_SpecialPositions;                         // 0x1300(0x0004)
	float                                              ClampDistance;                                            // 0x1304(0x0004)
	float                                              ClampDistance_SpecialPositions;                           // 0x1308(0x0004)
	struct FVector                                     tempVect;                                                 // 0x130C(0x000C)
	struct FRotator                                    tempRot;                                                  // 0x1318(0x000C)
	struct FScriptDelegate                             __OnPreDrawMyself__Delegate;                              // 0x1324(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_MinimapBase");
		return ptr;
	}


	void DrawDefenceIcon(class UCanvas* C, class AwPawn* P, float minimapX, float minimapY, bool bDefenceBoss);
	void DrawMinimap_Enemies_Defence(class UCanvas* C);
	void Draw(class UCanvas* C);
	void OnPreDrawMyself(class UCanvas* C);
	void DrawMinimap_SpecialPositions(class UCanvas* C);
	void DrawMinimap_Mission(class UCanvas* C);
	void DrawMinimap_SentryGun(class UCanvas* C);
	void DrawMinimap_Airstrike(class UCanvas* C);
	void DrawMinimap_Helicopter(class UCanvas* C);
	void DrawMinimap_Deads(class UCanvas* C);
	void DrawMinimap_Enemies(class UCanvas* C);
	bool IsEnemyInRange(const struct FVector& loc);
	void DrawMinimap_Allies(class UCanvas* C);
	bool IsSameTeamByIndex(int Team1, int Team2);
	bool IsSameTeamByPRI(class APlayerReplicationInfo* pri1, class APlayerReplicationInfo* pri2);
	void PushDeadOnMinimap(int TeamIndex, const struct FVector& Location);
	void CalcMinimapRotation(const struct FRotator& Rotation, struct FRotator* outRotation);
	void SetupMinimapSpriteWidgetForDrawing(const struct FRotator& Rotation, float minimapX, float minimapY, struct FSpriteWidget* Sprite);
	void ClampMinimapPosition(float W, float H, float* X, float* Y);
	bool IsWithinMinimapArea(float X, float Y);
	void CalculateTexturePositionFromMinimapPosition(float minimapX, float minimapY, int* TX, int* ty);
	void CalculateMinimapPosition(const struct FVector& centerLoc, const struct FRotator& centerRotation, const struct FVector& TargetLoc, float* minimapX, float* minimapY);
	void CalculateMinimapPositionPawnCentering(class APawn* centerPawn, const struct FVector& TargetLoc, float* minimapX, float* minimapY);
	void DrawMinimap_Myself(class UCanvas* C);
	float getSelfIconScale();
	void DrawMinimap_Compass(class UCanvas* C);
	void DrawMinimap_Frame(class UCanvas* C);
	void DrawMinimap_BGMapUAV(class UCanvas* C);
	void SetupBGMapUAV();
	void DrawMinimap_BGMap(class UCanvas* C);
	void MapMinimapTextureLocationToWorldLocation(int TX, int ty, struct FVector* Location);
	void MapWorldLocationToMinimapTextureLocation(const struct FVector& Location, int* cX, int* cY);
	void DrawMinimap_NorthPole(class UCanvas* C);
	void RemoveSpecialPositions(class AActor* act);
	void CacheSpecialPositions();
	void Timer();
	void InitializeCoords();
	void GetPivotCoords(struct FVector* it1, struct FVector* iw1, struct FVector* it2, struct FVector* iw2);
	void Initialize(class AHudBase* myOwner, class ALevelInfo* myLevel);
};


// Class XInterface.xScoreBoard
// 0x0114 (0x0550 - 0x043C)
class AxScoreBoard : public AScoreBoard
{
public:
	float                                              fContentBeginY;                                           // 0x043C(0x0004)
	float                                              fContentEndY;                                             // 0x0440(0x0004)
	float                                              fClanX1;                                                  // 0x0444(0x0004)
	float                                              fClanX2;                                                  // 0x0448(0x0004)
	float                                              fRankX1;                                                  // 0x044C(0x0004)
	float                                              fRankX2;                                                  // 0x0450(0x0004)
	float                                              fNickNameX1;                                              // 0x0454(0x0004)
	float                                              fNickNameX2;                                              // 0x0458(0x0004)
	float                                              fScoreX1;                                                 // 0x045C(0x0004)
	float                                              fScoreX2;                                                 // 0x0460(0x0004)
	float                                              fKillX1;                                                  // 0x0464(0x0004)
	float                                              fKillX2;                                                  // 0x0468(0x0004)
	float                                              fDeathX1;                                                 // 0x046C(0x0004)
	float                                              fDeathX2;                                                 // 0x0470(0x0004)
	float                                              fAssistX1;                                                // 0x0474(0x0004)
	float                                              fAssistX2;                                                // 0x0478(0x0004)
	float                                              fPingX1;                                                  // 0x047C(0x0004)
	float                                              fPingX2;                                                  // 0x0480(0x0004)
	float                                              fTeamScoreX1;                                             // 0x0484(0x0004)
	float                                              fTeamScoreX2;                                             // 0x0488(0x0004)
	float                                              ContentFontSize;                                          // 0x048C(0x0004)
	struct FColor                                      ContentFontColor;                                         // 0x0490(0x0004)
	string                                             Clan;                                                     // 0x0494(0x000C) (Localized, NeedCtorLink)
	string                                             Rank;                                                     // 0x04A0(0x000C) (Localized, NeedCtorLink)
	string                                             NickName;                                                 // 0x04AC(0x000C) (Localized, NeedCtorLink)
	string                                             Score;                                                    // 0x04B8(0x000C) (Localized, NeedCtorLink)
	string                                             Kill;                                                     // 0x04C4(0x000C) (Localized, NeedCtorLink)
	string                                             Death;                                                    // 0x04D0(0x000C) (Localized, NeedCtorLink)
	string                                             Assist;                                                   // 0x04DC(0x000C) (Localized, NeedCtorLink)
	string                                             Ping;                                                     // 0x04E8(0x000C) (Localized, NeedCtorLink)
	string                                             bonus;                                                    // 0x04F4(0x000C) (Localized, NeedCtorLink)
	string                                             Exp;                                                      // 0x0500(0x000C) (Localized, NeedCtorLink)
	string                                             Point;                                                    // 0x050C(0x000C) (Localized, NeedCtorLink)
	string                                             TeamScore;                                                // 0x0518(0x000C) (Localized, NeedCtorLink)
	string                                             OK;                                                       // 0x0524(0x000C) (Localized, NeedCtorLink)
	string                                             Ranking;                                                  // 0x0530(0x000C) (Localized, NeedCtorLink)
	string                                             Score_1;                                                  // 0x053C(0x000C) (Localized, NeedCtorLink)
	float                                              ScreenRatioXEx;                                           // 0x0548(0x0004)
	float                                              ScreenRatioYEx;                                           // 0x054C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.xScoreBoard");
		return ptr;
	}


	string GetEllipsString(class UCanvas* C, const string& strText, float fLimitWidth, float FontSize);
	void CalculateCoordinateDigit(class UCanvas* C, const struct FDigitSet& W, const struct FNumericWidget& N, float fWidth, float fHeight, int Index, struct FCalCoordsW* coordsW);
	void CalculateCoordinate(class UCanvas* C, const struct FSpriteWidget& W, float fWidth, float fHeight, struct FCalCoordsW* coordsW);
};


// Class XInterface.xScoreBoardTeamGame
// 0x0EB8 (0x1408 - 0x0550)
class AxScoreBoardTeamGame : public AxScoreBoard
{
public:
	struct FSpriteWidget                               SpBG;                                                     // 0x0550(0x0040) (Edit)
	struct FSpriteWidget                               Sp2TeamNameSection;                                       // 0x0590(0x0040) (Edit)
	struct FSpriteWidget                               Sp3TeamNameSection;                                       // 0x05D0(0x0040) (Edit)
	struct FSpriteWidget                               SpTeamNameEmphasis;                                       // 0x0610(0x0040) (Edit)
	struct FSpriteWidget                               SpTeamList;                                               // 0x0650(0x0040) (Edit)
	struct FSpriteWidget                               SpSelectLine;                                             // 0x0690(0x0040) (Edit)
	struct FSpriteWidget                               MapImage;                                                 // 0x06D0(0x0040) (Edit)
	struct FSpriteWidget                               wGM_Playlist_BG;                                          // 0x0710(0x0040) (Edit)
	struct FSpriteWidget                               wGM_Players_HP;                                           // 0x0750(0x0040) (Edit)
	struct FSpriteWidget                               wGM_TeamMark_AF;                                          // 0x0790(0x0040) (Edit)
	struct FSpriteWidget                               wGM_TeamMark_RSA;                                         // 0x07D0(0x0040) (Edit)
	struct FSpriteWidget                               wGM_ViewTarget;                                           // 0x0810(0x0040) (Edit)
	bool                                               IndicateDeads;                                            // 0x0850(0x0004)
	struct FColor                                      DefaultFontColor;                                         // 0x0854(0x0004)
	struct FColor                                      DeadFontColor;                                            // 0x0858(0x0004)
	struct FColor                                      DefaultFontShadowColor;                                   // 0x085C(0x0004)
	struct FColor                                      FriendlyColor;                                            // 0x0860(0x0004)
	struct FColor                                      MyselfColor;                                              // 0x0864(0x0004)
	float                                              BGBeginX;                                                 // 0x0868(0x0004)
	float                                              BGBeginY;                                                 // 0x086C(0x0004)
	float                                              BGWidth;                                                  // 0x0870(0x0004)
	float                                              BGHeight;                                                 // 0x0874(0x0004)
	float                                              TeamListBeginX;                                           // 0x0878(0x0004)
	float                                              TeamListBeginY;                                           // 0x087C(0x0004)
	float                                              TeamListOffsetY;                                          // 0x0880(0x0004)
	float                                              TeamListWidth;                                            // 0x0884(0x0004)
	float                                              TeamListHeight;                                           // 0x0888(0x0004)
	float                                              TeamListTeamNameBeginX;                                   // 0x088C(0x0004)
	float                                              TeamListTeamNameBeginY;                                   // 0x0890(0x0004)
	float                                              TeamListTeamNameWidth;                                    // 0x0894(0x0004)
	float                                              TeamListTeamNameHeight;                                   // 0x0898(0x0004)
	float                                              TeamListTeamNameFontSize;                                 // 0x089C(0x0004)
	float                                              TeamListMemberNicknameBeginX;                             // 0x08A0(0x0004)
	float                                              TeamListMemberNicknameWidth;                              // 0x08A4(0x0004)
	float                                              TeamListMemberScoreBeginX;                                // 0x08A8(0x0004)
	float                                              TeamListMemberScoreWidth;                                 // 0x08AC(0x0004)
	float                                              TeamListMemberKillBeginX;                                 // 0x08B0(0x0004)
	float                                              TeamListMemberKillWidth;                                  // 0x08B4(0x0004)
	float                                              TeamListMemberAssistBeginX;                               // 0x08B8(0x0004)
	float                                              TeamListMemberAssistWidth;                                // 0x08BC(0x0004)
	float                                              TeamListMemberDeathBeginX;                                // 0x08C0(0x0004)
	float                                              TeamListMemberDeathWidth;                                 // 0x08C4(0x0004)
	float                                              TeamListMemberPingBeginX;                                 // 0x08C8(0x0004)
	float                                              TeamListMemberPingWidth;                                  // 0x08CC(0x0004)
	float                                              TeamListMemberBeginY;                                     // 0x08D0(0x0004)
	float                                              TeamListMemberHeight;                                     // 0x08D4(0x0004)
	float                                              TeamListMemberHeightOffset;                               // 0x08D8(0x0004)
	float                                              TeamListMemberFontSize;                                   // 0x08DC(0x0004)
	float                                              TeamNameEmphasisBeginX;                                   // 0x08E0(0x0004)
	float                                              TeamNameEmphasisBeginY;                                   // 0x08E4(0x0004)
	float                                              TeamNameEmphasisOffsetY;                                  // 0x08E8(0x0004)
	float                                              TeamNameEmphasisWidth;                                    // 0x08EC(0x0004)
	float                                              TeamNameEmphasisHeight;                                   // 0x08F0(0x0004)
	float                                              TeamNameSectionBeginX;                                    // 0x08F4(0x0004)
	float                                              TeamNameSectionBeginY;                                    // 0x08F8(0x0004)
	float                                              TeamNameSectionEndY;                                      // 0x08FC(0x0004)
	float                                              TeamNameSectionTeam2OffsetX;                              // 0x0900(0x0004)
	float                                              TeamNameSectionTeam2Width;                                // 0x0904(0x0004)
	float                                              TeamNameSectionTeam2Height;                               // 0x0908(0x0004)
	float                                              TeamNameSectionTeam3OffsetX;                              // 0x090C(0x0004)
	float                                              TeamNameSectionTeam3Width;                                // 0x0910(0x0004)
	float                                              TeamNameSectionTeam3Height;                               // 0x0914(0x0004)
	float                                              TeamNameFontSize;                                         // 0x0918(0x0004)
	float                                              TeamScoreSectionBeginY;                                   // 0x091C(0x0004)
	float                                              TeamScoreSectionEndY;                                     // 0x0920(0x0004)
	float                                              TeamScoreFontSize;                                        // 0x0924(0x0004)
	float                                              GameClassBeginX;                                          // 0x0928(0x0004)
	float                                              GameClassBeginY;                                          // 0x092C(0x0004)
	float                                              GameClassEndX;                                            // 0x0930(0x0004)
	float                                              GameClassEndY;                                            // 0x0934(0x0004)
	float                                              GameClassFontSize;                                        // 0x0938(0x0004)
	string                                             GameDescriptionText;                                      // 0x093C(0x000C) (NeedCtorLink)
	float                                              GameDescriptionBeginX;                                    // 0x0948(0x0004)
	float                                              GameDescriptionBeginY;                                    // 0x094C(0x0004)
	float                                              GameDescriptionEndX;                                      // 0x0950(0x0004)
	float                                              GameDescriptionEndY;                                      // 0x0954(0x0004)
	float                                              GameDescriptionFontSize;                                  // 0x0958(0x0004)
	float                                              MapNameBeginX;                                            // 0x095C(0x0004)
	float                                              MapNameBeginY;                                            // 0x0960(0x0004)
	float                                              MapNameEndX;                                              // 0x0964(0x0004)
	float                                              MapNameEndY;                                              // 0x0968(0x0004)
	float                                              MapNameFontSize;                                          // 0x096C(0x0004)
	struct FColor                                      MapNameFontColor;                                         // 0x0970(0x0004)
	float                                              MapImageBeginX;                                           // 0x0974(0x0004)
	float                                              MapImageBeginY;                                           // 0x0978(0x0004)
	float                                              MapImageEndX;                                             // 0x097C(0x0004)
	float                                              MapImageEndY;                                             // 0x0980(0x0004)
	float                                              TimeX1;                                                   // 0x0984(0x0004)
	float                                              TimeY1;                                                   // 0x0988(0x0004)
	float                                              TimeX2;                                                   // 0x098C(0x0004)
	float                                              TimeY2;                                                   // 0x0990(0x0004)
	struct FColor                                      TimeColor;                                                // 0x0994(0x0004)
	float                                              TimeFontSize;                                             // 0x0998(0x0004)
	float                                              fMapNameX1;                                               // 0x099C(0x0004)
	float                                              fMapNameX2;                                               // 0x09A0(0x0004)
	float                                              fMapNameY1;                                               // 0x09A4(0x0004)
	float                                              fMapNameY2;                                               // 0x09A8(0x0004)
	float                                              fMapNameFontsize;                                         // 0x09AC(0x0004)
	class UwMapInfo*                                   mapInfo;                                                  // 0x09B0(0x0004)
	string                                             MissionNameTD;                                            // 0x09B4(0x000C) (Localized, NeedCtorLink)
	string                                             MissionNameSD;                                            // 0x09C0(0x000C) (Localized, NeedCtorLink)
	string                                             MissionNameDOMI;                                          // 0x09CC(0x000C) (Localized, NeedCtorLink)
	string                                             MissionNameSBT;                                           // 0x09D8(0x000C) (Localized, NeedCtorLink)
	string                                             MissionNameDM;                                            // 0x09E4(0x000C) (Localized, NeedCtorLink)
	string                                             MissionNameFM;                                            // 0x09F0(0x000C) (Localized, NeedCtorLink)
	string                                             MissionNameTM;                                            // 0x09FC(0x000C) (Localized, NeedCtorLink)
	string                                             MissionNameDF;                                            // 0x0A08(0x000C) (Localized, NeedCtorLink)
	string                                             MissionNameDOA;                                           // 0x0A14(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentTD1;                                        // 0x0A20(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentTD2;                                        // 0x0A2C(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentSDA1;                                       // 0x0A38(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentSDA2;                                       // 0x0A44(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentSDD1;                                       // 0x0A50(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentSDD2;                                       // 0x0A5C(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentDOMI1;                                      // 0x0A68(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentDOMI2;                                      // 0x0A74(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentSBT1;                                       // 0x0A80(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentSBT2;                                       // 0x0A8C(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentDM1;                                        // 0x0A98(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentDM2;                                        // 0x0AA4(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentFM1;                                        // 0x0AB0(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentFM2;                                        // 0x0ABC(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentTM1;                                        // 0x0AC8(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentTM2;                                        // 0x0AD4(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentDF1;                                        // 0x0AE0(0x000C) (Localized, NeedCtorLink)
	string                                             MissionCommentDOA;                                        // 0x0AEC(0x000C) (Localized, NeedCtorLink)
	string                                             StrLoading;                                               // 0x0AF8(0x000C) (Localized, NeedCtorLink)
	string                                             WeaponLimitKnifeOnly;                                     // 0x0B04(0x000C) (Localized, NeedCtorLink)
	string                                             WeaponLimitPistolOnly;                                    // 0x0B10(0x000C) (Localized, NeedCtorLink)
	string                                             WeaponLimitGrenadeOnly;                                   // 0x0B1C(0x000C) (Localized, NeedCtorLink)
	string                                             WeaponLimitRPGOnly;                                       // 0x0B28(0x000C) (Localized, NeedCtorLink)
	string                                             WeaponLimitSROnly;                                        // 0x0B34(0x000C) (Localized, NeedCtorLink)
	string                                             WeaponLimitSRBan;                                         // 0x0B40(0x000C) (Localized, NeedCtorLink)
	string                                             MapName;                                                  // 0x0B4C(0x000C) (NeedCtorLink)
	string                                             MissionInfo;                                              // 0x0B58(0x000C) (NeedCtorLink)
	struct FSpriteWidget                               WSBIBG1;                                                  // 0x0B64(0x0040) (Edit)
	struct FSpriteWidget                               WSBIBG2;                                                  // 0x0BA4(0x0040) (Edit)
	struct FSpriteWidget                               WSBBG2;                                                   // 0x0BE4(0x0040) (Edit)
	struct FSpriteWidget                               WSBBG3;                                                   // 0x0C24(0x0040) (Edit)
	struct FSpriteWidget                               WSBBGPanel;                                               // 0x0C64(0x0040) (Edit)
	struct FSpriteWidget                               WSBOutLine;                                               // 0x0CA4(0x0040) (Edit)
	struct FSpriteWidget                               WTeamAF;                                                  // 0x0CE4(0x0040) (Edit)
	struct FSpriteWidget                               WTeamRSA;                                                 // 0x0D24(0x0040) (Edit)
	struct FSpriteWidget                               WDivid;                                                   // 0x0D64(0x0040) (Edit)
	struct FSpriteWidget                               WContentBG;                                               // 0x0DA4(0x0040) (Edit)
	struct FSpriteWidget                               WListDivedBar;                                            // 0x0DE4(0x0040) (Edit)
	struct FSpriteWidget                               WBarSellectOver;                                          // 0x0E24(0x0040) (Edit)
	struct FSpriteWidget                               WBarSellectClick;                                         // 0x0E64(0x0040) (Edit)
	struct FSpriteWidget                               WTxtScorBord;                                             // 0x0EA4(0x0040) (Edit)
	struct FSpriteWidget                               WTxtMap;                                                  // 0x0EE4(0x0040) (Edit)
	struct FSpriteWidget[]                             WStripeBar;                                               // 0x0F24(0x000C) (Edit, NeedCtorLink)
	struct FSpriteWidget                               WIconMaster;                                              // 0x0F30(0x0040) (Edit)
	struct FSpriteWidget                               WIconDeath;                                               // 0x0F70(0x0040) (Edit)
	struct FSpriteWidget                               WPingBack;                                                // 0x0FB0(0x0040)
	struct FSpriteWidget                               WPing;                                                    // 0x0FF0(0x0040)
	struct FSpriteWidget[]                             WTxtGameType;                                             // 0x1030(0x000C) (Edit, NeedCtorLink)
	struct FDigitSet                                   WDigitsNumberMid;                                         // 0x103C(0x00B4) (Edit)
	struct FSpriteWidget                               WTimeBG;                                                  // 0x10F0(0x0040) (Edit)
	struct FSpriteWidget                               WTeamScoreBG;                                             // 0x1130(0x0040) (Edit)
	struct FSpriteWidget                               WTeamScoreAF;                                             // 0x1170(0x0040) (Edit)
	struct FSpriteWidget                               WTeamScoreRSA;                                            // 0x11B0(0x0040) (Edit)
	struct FSpriteWidget                               WFFABG;                                                   // 0x11F0(0x0040) (Edit)
	struct FSpriteWidget                               WFFAScoreBG;                                              // 0x1230(0x0040) (Edit)
	struct FSpriteWidget                               WFFAScoreOverLayer;                                       // 0x1270(0x0040) (Edit)
	int                                                AttackingTeam;                                            // 0x12B0(0x0004)
	int                                                Ranking_Self;                                             // 0x12B4(0x0004)
	class APlayerReplicationInfo*                      PRI_1st;                                                  // 0x12B8(0x0004)
	class APlayerReplicationInfo*                      PRI_2nd;                                                  // 0x12BC(0x0004)
	class APlayerReplicationInfo*                      PRI_Self;                                                 // 0x12C0(0x0004)
	struct FSpriteWidget                               WDFBG;                                                    // 0x12C4(0x0040) (Edit)
	struct FNumericWidget[]                            DigitsAFScore;                                            // 0x1304(0x000C) (Edit, NeedCtorLink)
	struct FNumericWidget[]                            DigitsRSAScore;                                           // 0x1310(0x000C) (Edit, NeedCtorLink)
	struct FNumericWidget[]                            DigitsGoalScore;                                          // 0x131C(0x000C) (Edit, NeedCtorLink)
	struct FNumericWidget[]                            DigitsFFAGoalScore;                                       // 0x1328(0x000C) (Edit, NeedCtorLink)
	struct FNumericWidget[]                            DigitsTime;                                               // 0x1334(0x000C) (Edit, NeedCtorLink)
	struct FSpriteWidget                               WCompareSign;                                             // 0x1340(0x0040) (Edit)
	class AwScoreboardPart_Minimap*                    PartMinimap;                                              // 0x1380(0x0004)
	struct FSpriteWidget                               ScoreBoardTitleBG;                                        // 0x1384(0x0040) (Edit)
	struct FSpriteWidget                               WDEFTITLE;                                                // 0x13C4(0x0040) (Edit)
	class UClass*                                      PartMinimapClass;                                         // 0x1404(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.xScoreBoardTeamGame");
		return ptr;
	}


	void UpdateScoreBoard(class UCanvas* Canvas);
	void DrawMiniMap(class UCanvas* C);
	void DrawScoreboard(class UCanvas* C);
	void DrawGMTeamListSection(class UCanvas* C, int lpTeam, class APlayerReplicationInfo* currPRI, int memberCount, float beginX, float beginY);
	void DrawGMUserBoard(class UCanvas* C);
	void DrawTeamListBG_Mission(class UCanvas* C);
	void DrawTeamListBG_Tut(class UCanvas* C);
	void DrawTeamListBG_FFA(class UCanvas* C);
	void DrawTeamBG(class UCanvas* C);
	void DrawMap(class UCanvas* C);
	void DrawMapName(class UCanvas* C);
	void MissonComment(class UCanvas* C, float X1, float Y1, float X2, float Y2, const string& MN);
	string GetStringGoalScore();
	void DrawMissonComment(class UCanvas* C);
	string GetStringPlayMode();
	void SetMissionInfo();
	void DrawTeamScoreAndTimer(class UCanvas* C, int _iPosX, int _iPosY);
	void DrawRankingInfo_Text(class UCanvas* C, class APlayerReplicationInfo* currPRI, float _iPosX, float _iPosY, const struct FColor& FontColor);
	void DrawRankingInfo_Mark(class UCanvas* C, class APlayerReplicationInfo* currPRI, float _iPosX, float _iPosY);
	void DrawRankingInfo(class UCanvas* C, class APlayerReplicationInfo* currPRI, float _iPosX, float _iPosY);
	void DrawFFAScore(class UCanvas* C, float _iPosX, float _iPosY);
	void DrawGameInfo(class UCanvas* C);
	void RankingSorting(int iCurrent, int iNext, class APlayerReplicationInfo*[]* pris);
	void DrawTeamListSection(class UCanvas* C);
	void DrawPersonListSection_C(class UCanvas* C, int lpTeam, class APlayerReplicationInfo* currPRI, int memberCount, const string& HostName, float beginY, float markBeginY, float markPingY);
	void DrawTeamListSection_C(class UCanvas* C, int lpTeam, class APlayerReplicationInfo* currPRI, int memberCount, const string& HostName, float beginY, float markBeginY, float markPingY);
	void DrawTeamListSectionStripe(class UCanvas* C, float OffsetY, int iTeamUserMax);
	void DrawTime(class UCanvas* C);
	void DrawTextTeamScore(class UCanvas* C, float _OffSetX, float _OffSetY);
	void DrawContentDescriptionTeam(class UCanvas* C, float _OffSetX, float _OffSetY);
	void DrawContentDescription(class UCanvas* C, float _OffSetX, float _OffSetY);
	void DrawBGS(class UCanvas* C);
	void SetAttackingTeam(int Index);
	void DrawMinimap_GameMode(class UCanvas* C);
	void PostBeginPlay();
	class AHudBase* GetHudBaseOwner();
};


// Class XInterface.ScoreBoardDeathMatch
// 0x0214 (0x0650 - 0x043C)
class AScoreBoardDeathMatch : public AScoreBoard
{
public:
	string                                             RankText;                                                 // 0x043C(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             PlayerText;                                               // 0x0448(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             PointsText;                                               // 0x0454(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             TimeText;                                                 // 0x0460(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             PingText;                                                 // 0x046C(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             PLText;                                                   // 0x0478(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             DeathsText;                                               // 0x0484(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             AdminText;                                                // 0x0490(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             NetText;                                                  // 0x049C(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             FooterText;                                               // 0x04A8(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             MatchIDText;                                              // 0x04B4(0x000C) (Localized, NeedCtorLink)
	string                                             OutText;                                                  // 0x04C0(0x000C) (Localized, NeedCtorLink)
	string                                             OutFireText;                                              // 0x04CC(0x000C) (Localized, NeedCtorLink)
	string                                             ReadyText;                                                // 0x04D8(0x000C) (Localized, NeedCtorLink)
	string                                             NotReadyText;                                             // 0x04E4(0x000C) (Localized, NeedCtorLink)
	string                                             SkillLevel[0x8];                                          // 0x04F0(0x000C) (Localized, NeedCtorLink)
	class APlayerReplicationInfo*                      PRIArray[0x20];                                           // 0x0550(0x0004)
	float                                              FPHTime;                                                  // 0x05D0(0x0004)
	string                                             MaxLives;                                                 // 0x05D4(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             FragLimit;                                                // 0x05E0(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             FPH;                                                      // 0x05EC(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             GameType;                                                 // 0x05F8(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             MapName;                                                  // 0x0604(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             Restart;                                                  // 0x0610(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             Continue;                                                 // 0x061C(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             Ended;                                                    // 0x0628(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             TimeLimit;                                                // 0x0634(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             Spacer;                                                   // 0x0640(0x000C) (Edit, Localized, NeedCtorLink)
	class UMaterial*                                   BoxMaterial;                                              // 0x064C(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.ScoreBoardDeathMatch");
		return ptr;
	}


	void DrawNetInfo(class UCanvas* Canvas, int FontReduction, int HeaderOffsetY, int PlayerBoxSizeY, int BoxSpaceY, int BoxTextOffsetY, int OwnerOffset, int PlayerCount, int NetXPos);
	void DrawMatchID(class UCanvas* Canvas, int FontReduction);
	void UpdateScoreBoard(class UCanvas* Canvas);
	void ExtraMarking(class UCanvas* Canvas, int PlayerCount, int OwnerOffset, int XPos, int YPos, int YOffset);
	string GetDefaultScoreInfoString();
	string GetRestartString();
	string GetTitleString();
	void DrawTitle(class UCanvas* Canvas, float HeaderOffsetY, float PlayerAreaY, float PlayerBoxSizeY);
	void UpdatePrecacheFonts();
	void UpdatePrecacheMaterials();
};


// Class XInterface.wHudPart_Tutorial
// 0x03D8 (0x2970 - 0x2598)
class AwHudPart_Tutorial : public AwHudPart_DisplayBase
{
public:
	string                                             lsQKill3Enemy;                                            // 0x2598(0x000C) (Localized, NeedCtorLink)
	string                                             lsQKillAim;                                               // 0x25A4(0x000C) (Localized, NeedCtorLink)
	string                                             lsQSprint;                                                // 0x25B0(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMeleeAttack;                                           // 0x25BC(0x000C) (Localized, NeedCtorLink)
	string                                             lsQKillWithGrenade;                                       // 0x25C8(0x000C) (Localized, NeedCtorLink)
	string                                             lsQComplete;                                              // 0x25D4(0x000C) (Localized, NeedCtorLink)
	string                                             lsNext;                                                   // 0x25E0(0x000C) (Localized, NeedCtorLink)
	string                                             lsQStartTutorial;                                         // 0x25EC(0x000C) (Localized, NeedCtorLink)
	string                                             lsCStartTutorial;                                         // 0x25F8(0x000C) (Localized, NeedCtorLink)
	string                                             lsQQuitTutorial;                                          // 0x2604(0x000C) (Localized, NeedCtorLink)
	string                                             lsCQuitTutorial;                                          // 0x2610(0x000C) (Localized, NeedCtorLink)
	string                                             lsCKill3Enemy;                                            // 0x261C(0x000C) (Localized, NeedCtorLink)
	string                                             lsCKillAim;                                               // 0x2628(0x000C) (Localized, NeedCtorLink)
	string                                             lsCSprint;                                                // 0x2634(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMeleeAttack;                                           // 0x2640(0x000C) (Localized, NeedCtorLink)
	string                                             lsCKillWithGrenade;                                       // 0x264C(0x000C) (Localized, NeedCtorLink)
	string                                             SoundQuest;                                               // 0x2658(0x000C) (NeedCtorLink)
	class USound*                                      SoundQuestEnd;                                            // 0x2664(0x0004)
	int                                                iGoal;                                                    // 0x2668(0x0004)
	int                                                iCurrent;                                                 // 0x266C(0x0004)
	int                                                iProgress;                                                // 0x2670(0x0004)
	string                                             SQuest;                                                   // 0x2674(0x000C) (NeedCtorLink)
	string                                             sComment;                                                 // 0x2680(0x000C) (NeedCtorLink)
	string                                             sComment2;                                                // 0x268C(0x000C) (NeedCtorLink)
	bool                                               bDrawMessage;                                             // 0x2698(0x0004)
	bool                                               bDrawMessage_QuestComplete;                               // 0x2698(0x0004)
	bool                                               bDrawKey;                                                 // 0x2698(0x0004)
	bool                                               bDrawBGKey;                                               // 0x2698(0x0004)
	bool                                               bDrawProgress;                                            // 0x2698(0x0004)
	bool                                               bOnEndMessage;                                            // 0x2698(0x0004)
	float                                              fBeginMessageTime;                                        // 0x269C(0x0004)
	float                                              fMessageDrawTime;                                         // 0x26A0(0x0004)
	float                                              fFadeOutTime;                                             // 0x26A4(0x0004)
	float                                              fKeyWidth;                                                // 0x26A8(0x0004)
	float                                              fKeyHight;                                                // 0x26AC(0x0004)
	struct FSpriteWidget                               WQuestBG1;                                                // 0x26B0(0x0040) (Edit)
	struct FSpriteWidget                               WQuestBG2;                                                // 0x26F0(0x0040) (Edit)
	struct FSpriteWidget                               WQuestBGKey;                                              // 0x2730(0x0040) (Edit)
	struct FSpriteWidget                               WQuestBGKeyShift;                                         // 0x2770(0x0040) (Edit)
	struct FSpriteWidget                               WQuestBGKeyE;                                             // 0x27B0(0x0040) (Edit)
	struct FSpriteWidget                               WQuestKey;                                                // 0x27F0(0x0040) (Edit)
	struct FSpriteWidget                               WQuestKeyShift;                                           // 0x2830(0x0040) (Edit)
	struct FSpriteWidget                               WQuestKeyMouse;                                           // 0x2870(0x0040) (Edit)
	struct FSpriteWidget                               WQuestKeyLeftMouse;                                       // 0x28B0(0x0040) (Edit)
	struct FSpriteWidget                               WQuestKeyRightMouse;                                      // 0x28F0(0x0040) (Edit)
	struct FSpriteWidget                               WQuestKeyE;                                               // 0x2930(0x0040) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_Tutorial");
		return ptr;
	}


	void DrawQuestComplete(class UCanvas* C);
	void DrawQuest(class UCanvas* C);
	void DrawSpectatingHud(class UCanvas* C);
	void DrawHudPassA(class UCanvas* C);
	void UpdateHelpKeyControll();
	void Initialize(class AHudBase* myOwner, class ALevelInfo* Level);
	void CallEvent(bool ItemCheck, int iReservation1, int iReservation2);
	void PlaySoundQuestEnd();
	void PlaySoundQuest();
	void OnNextQuest();
	void OnBeginTutorial();
	void OnCompleteQuest();
	void OnBeginQuest();
	void OnEndMessage();
	void OnBeginMessage();
	void OnPickUpHealthPack();
	void OnKillAim();
	void OnRunSprint(int iSec);
	void OnKillGrenade();
	void OnMeleeAttack();
	void OnKill3Enemy();
};


// Class XInterface.wHudPart_Tutorial2
// 0x0658 (0x2FC8 - 0x2970)
class AwHudPart_Tutorial2 : public AwHudPart_Tutorial
{
public:
	string                                             lsStartComment;                                           // 0x2970(0x000C) (Localized, NeedCtorLink)
	string                                             lsStartComment2;                                          // 0x297C(0x000C) (Localized, NeedCtorLink)
	string                                             lsQOnFocus;                                               // 0x2988(0x000C) (Localized, NeedCtorLink)
	string                                             lsCOnFocus;                                               // 0x2994(0x000C) (Localized, NeedCtorLink)
	string                                             lsQOnFocusEnd;                                            // 0x29A0(0x000C) (Localized, NeedCtorLink)
	string                                             lsCOnFocusEnd;                                            // 0x29AC(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveControlA;                                          // 0x29B8(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveControlA;                                          // 0x29C4(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveControlD;                                          // 0x29D0(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveControlD;                                          // 0x29DC(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveControlW;                                          // 0x29E8(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveControlW;                                          // 0x29F4(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveControlS;                                          // 0x2A00(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveControlS;                                          // 0x2A0C(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveControlQ;                                          // 0x2A18(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveControlQ;                                          // 0x2A24(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveTrainingField;                                     // 0x2A30(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveTrainingField;                                     // 0x2A3C(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveComplete;                                          // 0x2A48(0x000C) (Localized, NeedCtorLink)
	string                                             lsCNext01;                                                // 0x2A54(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveWalking;                                           // 0x2A60(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveWalking;                                           // 0x2A6C(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveWalkingEnd;                                        // 0x2A78(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveWalkingEnd;                                        // 0x2A84(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveDucking;                                           // 0x2A90(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveDucking;                                           // 0x2A9C(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveDuckingEnd;                                        // 0x2AA8(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveDuckingEnd;                                        // 0x2AB4(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveProne;                                             // 0x2AC0(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveProne;                                             // 0x2ACC(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveProneEnd;                                          // 0x2AD8(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveProneEnd;                                          // 0x2AE4(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveJump;                                              // 0x2AF0(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveJump;                                              // 0x2AFC(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveJumpEnd;                                           // 0x2B08(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveJumpEnd;                                           // 0x2B14(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveLadder;                                            // 0x2B20(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveLadder;                                            // 0x2B2C(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveLadderEnd;                                         // 0x2B38(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveLadderEnd;                                         // 0x2B44(0x000C) (Localized, NeedCtorLink)
	string                                             lsQJumpDown;                                              // 0x2B50(0x000C) (Localized, NeedCtorLink)
	string                                             lsCJumpDown;                                              // 0x2B5C(0x000C) (Localized, NeedCtorLink)
	string                                             lsQJumpDownEnd;                                           // 0x2B68(0x000C) (Localized, NeedCtorLink)
	string                                             lsCJumpDownEnd;                                           // 0x2B74(0x000C) (Localized, NeedCtorLink)
	string                                             lsQRecoveryHealth;                                        // 0x2B80(0x000C) (Localized, NeedCtorLink)
	string                                             lsCRecoveryHealth;                                        // 0x2B8C(0x000C) (Localized, NeedCtorLink)
	string                                             lsQRecoveryHealthEnd;                                     // 0x2B98(0x000C) (Localized, NeedCtorLink)
	string                                             lsCRecoveryHealthEnd;                                     // 0x2BA4(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveSprint;                                            // 0x2BB0(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveSprint;                                            // 0x2BBC(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveSprintEnd;                                         // 0x2BC8(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveSprintEnd;                                         // 0x2BD4(0x000C) (Localized, NeedCtorLink)
	string                                             lsQDoFire;                                                // 0x2BE0(0x000C) (Localized, NeedCtorLink)
	string                                             lsCDoFire;                                                // 0x2BEC(0x000C) (Localized, NeedCtorLink)
	string                                             lsQDoFireEnd;                                             // 0x2BF8(0x000C) (Localized, NeedCtorLink)
	string                                             lsCDoFireEnd;                                             // 0x2C04(0x000C) (Localized, NeedCtorLink)
	string                                             lsQDoFireAim;                                             // 0x2C10(0x000C) (Localized, NeedCtorLink)
	string                                             lsCDoFireAim;                                             // 0x2C1C(0x000C) (Localized, NeedCtorLink)
	string                                             lsQDoFireAimEnd;                                          // 0x2C28(0x000C) (Localized, NeedCtorLink)
	string                                             lsCDoFireAimEnd;                                          // 0x2C34(0x000C) (Localized, NeedCtorLink)
	string                                             lsQDoFireMelee;                                           // 0x2C40(0x000C) (Localized, NeedCtorLink)
	string                                             lsCDoFireMelee;                                           // 0x2C4C(0x000C) (Localized, NeedCtorLink)
	string                                             lsQDoFireMeleeEnd;                                        // 0x2C58(0x000C) (Localized, NeedCtorLink)
	string                                             lsCDoFireMeleeEnd;                                        // 0x2C64(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveTrainingField2;                                    // 0x2C70(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveTrainingField2;                                    // 0x2C7C(0x000C) (Localized, NeedCtorLink)
	string                                             lsQPickUpRocketLauncher;                                  // 0x2C88(0x000C) (Localized, NeedCtorLink)
	string                                             lsCPickUpRocketLauncher;                                  // 0x2C94(0x000C) (Localized, NeedCtorLink)
	string                                             lsQDoFireRocketLauncher;                                  // 0x2CA0(0x000C) (Localized, NeedCtorLink)
	string                                             lsCDoFireRocketLauncher;                                  // 0x2CAC(0x000C) (Localized, NeedCtorLink)
	string                                             lsQDoFireRocketLauncherEnd;                               // 0x2CB8(0x000C) (Localized, NeedCtorLink)
	string                                             lsCDoFireRocketLauncherEnd;                               // 0x2CC4(0x000C) (Localized, NeedCtorLink)
	string                                             lsQMoveTrainingField3;                                    // 0x2CD0(0x000C) (Localized, NeedCtorLink)
	string                                             lsCMoveTrainingField3;                                    // 0x2CDC(0x000C) (Localized, NeedCtorLink)
	string                                             lsQDoThrowingWeapon;                                      // 0x2CE8(0x000C) (Localized, NeedCtorLink)
	string                                             lsCDoThrowingWeapon;                                      // 0x2CF4(0x000C) (Localized, NeedCtorLink)
	string                                             lsQDoThrowingWeaponEnd;                                   // 0x2D00(0x000C) (Localized, NeedCtorLink)
	string                                             lsCDoThrowingWeaponEnd;                                   // 0x2D0C(0x000C) (Localized, NeedCtorLink)
	string                                             lsQBattleAIBot;                                           // 0x2D18(0x000C) (Localized, NeedCtorLink)
	string                                             lsCBattleAIBot;                                           // 0x2D24(0x000C) (Localized, NeedCtorLink)
	string                                             lsQBattleAIBotEnd;                                        // 0x2D30(0x000C) (Localized, NeedCtorLink)
	string                                             lsCBattleAIBotEnd;                                        // 0x2D3C(0x000C) (Localized, NeedCtorLink)
	string                                             lsAIBotTime;                                              // 0x2D48(0x000C) (Localized, NeedCtorLink)
	string                                             lsAIBotKillCount;                                         // 0x2D54(0x000C) (Localized, NeedCtorLink)
	string                                             lsGiftPoint;                                              // 0x2D60(0x000C) (Localized, NeedCtorLink)
	struct FVector                                     vOldLocation;                                             // 0x2D6C(0x000C)
	float                                              fMoveLength;                                              // 0x2D78(0x0004)
	int                                                iTriggerID;                                               // 0x2D7C(0x0004)
	bool                                               IsFadeOut;                                                // 0x2D80(0x0004)
	bool                                               bDrawBeginTutorial;                                       // 0x2D80(0x0004)
	bool                                               bAIBotScore;                                              // 0x2D80(0x0004)
	float                                              fAIBotBeginTime;                                          // 0x2D84(0x0004)
	float                                              fAIBotEndTime;                                            // 0x2D88(0x0004)
	int                                                iTutorialID;                                              // 0x2D8C(0x0004)
	int                                                iOldTutorialID;                                           // 0x2D90(0x0004)
	int                                                iStartTutorialID;                                         // 0x2D94(0x0004)
	int                                                aQuestID[0x11];                                           // 0x2D98(0x0004)
	int                                                iCurrentQuestID;                                          // 0x2DDC(0x0004)
	int                                                iStartQuestID;                                            // 0x2DE0(0x0004)
	int                                                iGiftItemID;                                              // 0x2DE4(0x0004)
	bool                                               bDrawItem;                                                // 0x2DE8(0x0004)
	bool                                               bNoUpdate;                                                // 0x2DE8(0x0004)
	float                                              fTotalDrawTime;                                           // 0x2DEC(0x0004)
	float                                              fDrawItemTime;                                            // 0x2DF0(0x0004)
	float                                              fDrawEffectTime;                                          // 0x2DF4(0x0004)
	float                                              fDrawEffectTime1;                                         // 0x2DF8(0x0004)
	float                                              fDrawEffectTime2;                                         // 0x2DFC(0x0004)
	float                                              fDrawEffectTime3;                                         // 0x2E00(0x0004)
	float                                              fFadeOutTime;                                             // 0x2E04(0x0004)
	float                                              fBeginDrawItem;                                           // 0x2E08(0x0004)
	float                                              fEndOfLife;                                               // 0x2E0C(0x0004)
	float                                              callLastTime;                                             // 0x2E10(0x0004)
	float                                              callAccelStep;                                            // 0x2E14(0x0004)
	int                                                iDrawEffectState;                                         // 0x2E18(0x0004)
	struct FSpriteWidget                               WGiftItemPopBG;                                           // 0x2E1C(0x0040)
	struct FSpriteWidget                               WGiftItemPopBG2;                                          // 0x2E5C(0x0040)
	struct FSpriteWidget                               WGiftItemBG;                                              // 0x2E9C(0x0040)
	struct FSpriteWidget                               WGiftItem;                                                // 0x2EDC(0x0040)
	string                                             lsGiftItem;                                               // 0x2F1C(0x000C) (Localized, NeedCtorLink)
	string                                             strGiftItemBG;                                            // 0x2F28(0x000C) (NeedCtorLink)
	string                                             strRes_Icon;                                              // 0x2F34(0x000C) (NeedCtorLink)
	struct FSpriteWidget                               WNoticeExitBG;                                            // 0x2F40(0x0040)
	string                                             lsNoticeExit;                                             // 0x2F80(0x000C) (Localized, NeedCtorLink)
	byte                                               Grade_BasicMovement;                                      // 0x2F8C(0x0001)
	byte                                               Grade_AdvancedMovement;                                   // 0x2F8D(0x0001)
	byte                                               Grade_Shooting;                                           // 0x2F8E(0x0001)
	byte                                               Grade_Grenade;                                            // 0x2F8F(0x0001)
	byte                                               Grade_Battle;                                             // 0x2F90(0x0001)
	byte                                               Padding00[0x3];                                           // 0x2F91(0x0003) MISSED OFFSET
	float                                              ResultGrade;                                              // 0x2F94(0x0004)
	float                                              fElapsedTime_BasicMovement;                               // 0x2F98(0x0004)
	float                                              fElapsedTime_AdvancedMovement;                            // 0x2F9C(0x0004)
	float                                              fElapsedTime_Shooting;                                    // 0x2FA0(0x0004)
	float                                              fElapsedTime_Grenade;                                     // 0x2FA4(0x0004)
	float                                              fElapsedTime_Battle;                                      // 0x2FA8(0x0004)
	float                                              fCheckStartTime_Basic;                                    // 0x2FAC(0x0004)
	float                                              fCheckStartTime_Advanced;                                 // 0x2FB0(0x0004)
	float                                              fCheckStartTime_Shooting;                                 // 0x2FB4(0x0004)
	float                                              fCheckStartTime_Grenade;                                  // 0x2FB8(0x0004)
	float                                              fCheckStartTime_Battle;                                   // 0x2FBC(0x0004)
	struct FScriptDelegate                             __OnTutorialResult__Delegate;                             // 0x2FC0(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_Tutorial2");
		return ptr;
	}


	void DrawBeginTutorial(class UCanvas* C);
	void DrawQuestComplete(class UCanvas* C);
	void DrawQuest(class UCanvas* C);
	void DrawNoticeExit(class UCanvas* C);
	void DrawBattleAIBot(class UCanvas* C);
	float GetValueScaleUp(float fStartScale, float fDestScale, float fDrawTime);
	float GetValueScaleDown(float fStartScale, float fDestScale, float fDrawTime);
	void DrawGiftItemT(class UCanvas* C);
	void DrawGiftItem(class UCanvas* C);
	void DrawSpectatingHud(class UCanvas* C);
	void DrawHudPassA(class UCanvas* C);
	void DrawTestGrade(class UCanvas* C);
	void CalcBotBattleGrade();
	int CalcGrenadeGrade();
	void CalcShootingGrade();
	void CalcAdvancedMovementGrade();
	void CalcBasicMovementGrade();
	void Trigger(class AActor* Other, class APawn* EventInstigator);
	void CallEvent(bool ItemCheck, int iReservation1, int iReservation2);
	void Movelength(const struct FVector& vLocation);
	void EnableShootTarget(const FName& eventTag);
	void GotoTutorial(int iQuestID);
	void CheckStartTutorial();
	void BeginDrawItem();
	void OnBeginTutorial();
	void ResetProgress();
	void Initialize(class AHudBase* myOwner, class ALevelInfo* Level);
	class AMover* EnableTriggerEvent(const FName& EventName, class AActor* Other, class APawn* EventInstigator);
	class AMover* DisableTriggerEvent(const FName& EventName, class AActor* Other, class APawn* EventInstigator);
	void TutorialEvent(const string& S, const FName& Type, const FName& reserv);
	void OnTutorialResult(int iTutorialID, int iCurrent, bool bCompleted);
	void OnQuest();
};


// Class XInterface.xScoreBoardTutorial
// 0x0130 (0x1538 - 0x1408)
class AxScoreBoardTutorial : public AxScoreBoardTeamGame
{
public:
	string                                             TutorialNumber;                                           // 0x1408(0x000C) (Localized, NeedCtorLink)
	string                                             TutorialContents;                                         // 0x1414(0x000C) (Localized, NeedCtorLink)
	string                                             TutorialResult[0x3];                                      // 0x1420(0x000C) (Localized, NeedCtorLink)
	string                                             TutorialList[0x11];                                       // 0x1444(0x000C) (Localized, NeedCtorLink)
	float                                              fNumberX1;                                                // 0x1510(0x0004)
	float                                              fNumberX2;                                                // 0x1514(0x0004)
	float                                              fContentX1;                                               // 0x1518(0x0004)
	float                                              fContentX2;                                               // 0x151C(0x0004)
	float                                              fResultX1;                                                // 0x1520(0x0004)
	float                                              fResultX2;                                                // 0x1524(0x0004)
	struct FstTutorialContent[]                        aTutorialContents;                                        // 0x1528(0x000C) (NeedCtorLink)
	int                                                iCurrentTutorialID;                                       // 0x1534(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.xScoreBoardTutorial");
		return ptr;
	}


	void DrawTeamListSection_C(class UCanvas* C, int lpCount, class APlayerReplicationInfo* currPRI, int lpQuestNumber, const string& HostName, float beginY, float markBeginY, float markPingY);
	void DrawTeamListSection(class UCanvas* C);
	void DrawContentDescription(class UCanvas* C, float _OffSetX, float _OffSetY);
	void DrawTeamBG(class UCanvas* C);
	void DrawMiniMap(class UCanvas* C);
	void DrawScoreboard(class UCanvas* C);
	void OnTutorialResult(int iTutorialID, int iCurrent, bool bCompleted);
	void PushTutorialList();
	void PostBeginPlay();
};


// Class XInterface.wHudPart_SelectQSlotCN
// 0x006C (0x2DF4 - 0x2D88)
class AwHudPart_SelectQSlotCN : public AwHudPart_SelectQSlot
{
public:
	string                                             strQSItemName[0x9];                                       // 0x2D88(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_SelectQSlotCN");
		return ptr;
	}


	void DrawItemImage(class UCanvas* C);
	struct FImage GetItemImage(class UCanvas* C, int iItemID);
	void QuickSlotContent_SetString(class UCanvas* C, int iPosX, int iPosY, int iSlot, bool bDefaultWeapon);
	bool DrawQuickSlotContent_List(class UCanvas* C, int iPosX, int iPosY, int iSlot);
	void DrawQuickSlotContent_DefaultWeapon(class UCanvas* C, int iPosX, int iPosY);
	void DrawQuickSlotContent_Description(class UCanvas* C, int iPosX, int iPosY);
	void DrawSellectBar(class UCanvas* C, int iPosX, int iPosY, bool bDefaultWeapon);
	void DrawQuickSlotName(class UCanvas* C, int iPosX, int iPosY, int iSlot, bool bDefaultWeapon, bool bHasItem);
	void DrawQuickSlot(class UCanvas* C);
	void DrawSelectQSlot(class UCanvas* C);
	void DrawA(class UCanvas* C);
	void UpdateHelpKeyControll();
	void CallEvent(bool ItemCheck, int iReservation1, int iReservation2);
	void CallSelectQuickSlot(int iIndex);
	void ToggleQuickSlotWindow();
	void EndQuickSlotWindow();
	void BeginQuickSlotWindow();
	void Initialize(class AHudBase* myOwner, class ALevelInfo* _level);
};


// Class XInterface.wHudPart_Bigmap
// 0x0028 (0x1354 - 0x132C)
class AwHudPart_Bigmap : public AwHudPart_MinimapBase
{
public:
	class UWinFrameChanger*                            FrameChanger;                                             // 0x132C(0x0004) (Edit, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UWinBox*                                     MinimapBGPos;                                             // 0x1330(0x0004) (Edit, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   MinimapCropCoords;                                        // 0x1334(0x0010)
	struct FFloatBoxWH                                 P;                                                        // 0x1344(0x0010)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_Bigmap");
		return ptr;
	}


	void DrawMinimap_BGMapUAV(class UCanvas* C);
	void DrawMinimap_SpecialPositions(class UCanvas* C);
	void DrawMinimap_Airstrike(class UCanvas* C);
	void DrawMinimap_Helicopter(class UCanvas* C);
	void DrawMinimap_Deads(class UCanvas* C);
	void DrawMinimap_Enemies(class UCanvas* C);
	void DrawMinimap_Allies(class UCanvas* C);
	void CalculateTexturePositionFromMinimapPosition(float minimapX, float minimapY, int* TX, int* ty);
	void CalculateMinimapPosition(const struct FVector& centerLoc, const struct FRotator& centerRotation, const struct FVector& TargetLoc, float* minimapX, float* minimapY);
	void SetupMinimapSpriteWidgetForDrawing(const struct FRotator& Rotation, float minimapX, float minimapY, struct FSpriteWidget* Sprite);
	void DrawMinimap_Myself(class UCanvas* C);
	void SetupBGMapUAV();
	void DrawMinimap_BGMap(class UCanvas* C);
	void Draw(class UCanvas* C);
	void GetPivotCoords(struct FVector* it1, struct FVector* iw1, struct FVector* it2, struct FVector* iw2);
	void Initialize(class AHudBase* myOwner, class ALevelInfo* myLevel);
};


// Class XInterface.wHudPart_DisplayEvent
// 0x2C20 (0x51B8 - 0x2598)
class AwHudPart_DisplayEvent : public AwHudPart_DisplayBase
{
public:
	struct FSpriteWidget                               wHealthPack;                                              // 0x2598(0x0040) (Edit)
	struct FSpriteWidget                               WHealthPackPlus;                                          // 0x25D8(0x0040) (Edit)
	struct FDigitSet                                   WDigitsHP;                                                // 0x2618(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsNumberBroadBig;                                    // 0x26CC(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsNumberBig;                                         // 0x2780(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsNumberMid;                                         // 0x2834(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsNumberMid_Base;                                    // 0x28E8(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsNumberSml;                                         // 0x299C(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsDFRoundNumber;                                     // 0x2A50(0x00B4) (Edit)
	struct FNumericWidget                              DigitsNumberFirst;                                        // 0x2B04(0x0030) (Edit)
	struct FNumericWidget                              DigitsNumberSecond;                                       // 0x2B34(0x0030) (Edit)
	struct FNumericWidget                              DigitsNumberThird;                                        // 0x2B64(0x0030) (Edit)
	struct FNumericWidget                              DigitsNumberFourth;                                       // 0x2B94(0x0030) (Edit)
	struct FNumericWidget                              DigitsNumberFifth;                                        // 0x2BC4(0x0030) (Edit)
	struct FNumericWidget                              DigitsNumberPlus;                                         // 0x2BF4(0x0030) (Edit)
	int                                                FontSizeNormal;                                           // 0x2C24(0x0004) (Edit)
	int                                                FontSizeKey;                                              // 0x2C28(0x0004) (Edit)
	int                                                FontSizeRespawn;                                          // 0x2C2C(0x0004) (Edit)
	struct FSpriteWidget                               SkillIconEvent;                                           // 0x2C30(0x0040) (Edit)
	struct FSpriteWidget                               WHelpBG;                                                  // 0x2C70(0x0040) (Edit)
	struct FSpriteWidget                               wSkill;                                                   // 0x2CB0(0x0040) (Edit)
	struct FSpriteWidget                               wHelicopter;                                              // 0x2CF0(0x0040) (Edit)
	struct FSpriteWidget                               WAirStirke;                                               // 0x2D30(0x0040) (Edit)
	struct FSpriteWidget                               WUAV;                                                     // 0x2D70(0x0040) (Edit)
	struct FSpriteWidget                               WC4;                                                      // 0x2DB0(0x0040) (Edit)
	struct FSpriteWidget                               WRPG7;                                                    // 0x2DF0(0x0040) (Edit)
	struct FSpriteWidget                               SkillHelicopterOn;                                        // 0x2E30(0x0040) (Edit)
	struct FSpriteWidget                               SkillAirstrikeOn;                                         // 0x2E70(0x0040) (Edit)
	struct FSpriteWidget                               SkillUAVOn;                                               // 0x2EB0(0x0040) (Edit)
	struct FSpriteWidget                               SkillSentryGunOn;                                         // 0x2EF0(0x0040) (Edit)
	struct FSpriteWidget                               WAirStirkeFocus;                                          // 0x2F30(0x0040) (Edit)
	struct FSpriteWidget                               WAirStirkeSellect;                                        // 0x2F70(0x0040) (Edit)
	ESKILL_ARRAY                                       ECallSkillState;                                          // 0x2FB0(0x0001)
	byte                                               Padding00[0x3];                                           // 0x2FB1(0x0003) MISSED OFFSET
	bool                                               bResultSkillRequire;                                      // 0x2FB4(0x0004)
	float                                              fLastCallTime;                                            // 0x2FB8(0x0004)
	float                                              fC4ActiveTime;                                            // 0x2FBC(0x0004)
	bool                                               bC4Active;                                                // 0x2FC0(0x0004)
	float                                              fBeginDrawTime_RPG7;                                      // 0x2FC4(0x0004)
	bool                                               bRPG7Active;                                              // 0x2FC8(0x0004)
	float                                              fBeginRespawnPosY;                                        // 0x2FCC(0x0004)
	float                                              fEndRespawnPosY;                                          // 0x2FD0(0x0004)
	float                                              fDrawTime;                                                // 0x2FD4(0x0004) (Edit)
	float                                              fDrawTimeSkill;                                           // 0x2FD8(0x0004) (Edit)
	float                                              fDrawTimeEffect;                                          // 0x2FDC(0x0004) (Edit)
	float                                              fFadeOutEffect;                                           // 0x2FE0(0x0004) (Edit)
	float                                              fFadeOutTime;                                             // 0x2FE4(0x0004) (Edit)
	float                                              fDrawTimeHealth;                                          // 0x2FE8(0x0004) (Edit)
	float                                              fFadeOutTimeHealth;                                       // 0x2FEC(0x0004) (Edit)
	float                                              fDistMove;                                                // 0x2FF0(0x0004) (Edit)
	struct FSpriteWidget                               WGameMessageWaiting;                                      // 0x2FF4(0x0040) (Edit)
	struct FSpriteWidget                               WGameWaitSpot;                                            // 0x3034(0x0040) (Edit)
	string                                             sWaitingMessage;                                          // 0x3074(0x000C) (NeedCtorLink)
	float                                              fReceiveTime_StartupMessage;                              // 0x3080(0x0004)
	bool                                               IsStartupMessage;                                         // 0x3084(0x0004)
	struct FSpriteWidget                               WConnectionInstability;                                   // 0x3088(0x0040) (Edit)
	struct FSpriteWidget                               WBGStart;                                                 // 0x30C8(0x0040) (Edit)
	struct FSpriteWidget                               WBGStartDF;                                               // 0x3108(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeTD;                                              // 0x3148(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeSD;                                              // 0x3188(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeDOA;                                             // 0x31C8(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeDOMI;                                            // 0x3208(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeSB;                                              // 0x3248(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeDM;                                              // 0x3288(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeFM;                                              // 0x32C8(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeTM;                                              // 0x3308(0x0040) (Edit)
	struct FSpriteWidget                               WGameChangeAttack;                                        // 0x3348(0x0040) (Edit)
	struct FSpriteWidget                               WGameChangePosition;                                      // 0x3388(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeAlienMode;                                       // 0x33C8(0x0040) (Edit)
	struct FSpriteWidget                               WGo;                                                      // 0x3408(0x0040) (Edit)
	struct FSpriteWidget                               WGoBG;                                                    // 0x3448(0x0040) (Edit)
	struct FSpriteWidget                               WGoEffect;                                                // 0x3488(0x0040) (Edit)
	struct FSpriteWidget                               WGoText;                                                  // 0x34C8(0x0040) (Edit)
	float                                              MessageLastTime;                                          // 0x3508(0x0004)
	float                                              MessageAccelStep;                                         // 0x350C(0x0004)
	int                                                MessageEffect;                                            // 0x3510(0x0004)
	int                                                MessageAlpha;                                             // 0x3514(0x0004)
	string                                             strQuestNoUpdate;                                         // 0x3518(0x000C) (Localized, NeedCtorLink)
	string                                             BeginMessageTD;                                           // 0x3524(0x000C) (Localized, NeedCtorLink)
	string                                             BeginMessageSDA1;                                         // 0x3530(0x000C) (Localized, NeedCtorLink)
	string                                             BeginMessageSDA2;                                         // 0x353C(0x000C) (Localized, NeedCtorLink)
	string                                             BeginMessageSDD1;                                         // 0x3548(0x000C) (Localized, NeedCtorLink)
	string                                             BeginMessageSDD2;                                         // 0x3554(0x000C) (Localized, NeedCtorLink)
	string                                             BeginMessageAlienMode;                                    // 0x3560(0x000C) (Localized, NeedCtorLink)
	string                                             BeginMessageDOMI;                                         // 0x356C(0x000C) (Localized, NeedCtorLink)
	string                                             BeginMessageSB;                                           // 0x3578(0x000C) (Localized, NeedCtorLink)
	string                                             BeginMessageDM;                                           // 0x3584(0x000C) (Localized, NeedCtorLink)
	string                                             BeginMessageFM;                                           // 0x3590(0x000C) (Localized, NeedCtorLink)
	string                                             BeginMessageTM;                                           // 0x359C(0x000C) (Localized, NeedCtorLink)
	string                                             BeginMessageDF;                                           // 0x35A8(0x000C) (Localized, NeedCtorLink)
	string                                             LsReload;                                                 // 0x35B4(0x000C) (Localized, NeedCtorLink)
	string                                             LsWarningAmmo;                                            // 0x35C0(0x000C) (Localized, NeedCtorLink)
	string                                             LsRechargingAmmo;                                         // 0x35CC(0x000C) (Localized, NeedCtorLink)
	string                                             LsBattleExplain;                                          // 0x35D8(0x000C) (Localized, NeedCtorLink)
	string                                             LsConnectionInstability;                                  // 0x35E4(0x000C) (Localized, NeedCtorLink)
	string                                             lsIsInvincible;                                           // 0x35F0(0x000C) (Localized, NeedCtorLink)
	string                                             lsIsInvincibleBeginner;                                   // 0x35FC(0x000C) (Localized, NeedCtorLink)
	string                                             safeZoneRandomRespawn;                                    // 0x3608(0x000C) (Localized, NeedCtorLink)
	string                                             RespawnText;                                              // 0x3614(0x000C) (Localized, NeedCtorLink)
	string                                             MessageChangingHostPre;                                   // 0x3620(0x000C) (Localized, NeedCtorLink)
	string                                             MessageChangingHost;                                      // 0x362C(0x000C) (Localized, NeedCtorLink)
	string                                             MessageChangingHostPlzWait;                               // 0x3638(0x000C) (Localized, NeedCtorLink)
	EeDrawMessageState                                 DMState;                                                  // 0x3644(0x0001)
	byte                                               Padding01[0x3];                                           // 0x3645(0x0003) MISSED OFFSET
	float                                              fMessageDrawTime;                                         // 0x3648(0x0004)
	float                                              fBeginMessageTime;                                        // 0x364C(0x0004)
	float                                              fBeginMessageTime_Go;                                     // 0x3650(0x0004)
	float                                              fMessageDrawTime_Go;                                      // 0x3654(0x0004)
	float                                              fFadeOutTime_Go;                                          // 0x3658(0x0004)
	bool                                               bMessageDraw;                                             // 0x365C(0x0004)
	int                                                iRound_Instrusion;                                        // 0x3660(0x0004)
	float                                              fStartTimeDrawA;                                          // 0x3664(0x0004)
	float                                              fBeginMessageTime_Instrusion;                             // 0x3668(0x0004)
	bool                                               bMessageDraw_Intrusion;                                   // 0x366C(0x0004)
	bool                                               bIsDraw_Intrusion;                                        // 0x366C(0x0004)
	float                                              TimeConnectionInstability[0x2];                           // 0x3670(0x0004)
	bool                                               bConnectionInstability;                                   // 0x3678(0x0004)
	bool                                               bDrawConnectionInstability;                               // 0x3678(0x0004)
	struct FSpriteWidget                               WRoundResultBG;                                           // 0x367C(0x0040) (Edit)
	struct FSpriteWidget                               WRoundWin;                                                // 0x36BC(0x0040) (Edit)
	struct FSpriteWidget                               WRoundLose;                                               // 0x36FC(0x0040) (Edit)
	struct FSpriteWidget                               WTextAF;                                                  // 0x373C(0x0040) (Edit)
	struct FSpriteWidget                               WTextRSA;                                                 // 0x377C(0x0040) (Edit)
	struct FSpriteWidget                               WCompareSign;                                             // 0x37BC(0x0040) (Edit)
	struct FSpriteWidget                               WCompareSignMid;                                          // 0x37FC(0x0040) (Edit)
	struct FNumericWidget                              DigitsRoundWinAF;                                         // 0x383C(0x0030) (Edit)
	struct FNumericWidget                              DigitsRoundWinRSA;                                        // 0x386C(0x0030) (Edit)
	struct FSpriteWidget                               WTeamMarkAF;                                              // 0x389C(0x0040) (Edit)
	struct FSpriteWidget                               WTeamMarkRSA;                                             // 0x38DC(0x0040) (Edit)
	struct FSpriteWidget                               WResultTeamMarkAF;                                        // 0x391C(0x0040) (Edit)
	struct FSpriteWidget                               WResultTeamMarkRSA;                                       // 0x395C(0x0040) (Edit)
	struct FSpriteWidget                               WTeamMarkHumanTeam;                                       // 0x399C(0x0040) (Edit)
	struct FSpriteWidget                               WTeamMarkAlienTeam;                                       // 0x39DC(0x0040) (Edit)
	struct FSpriteWidget                               WTeamBigMarkHumanTeam;                                    // 0x3A1C(0x0040) (Edit)
	struct FSpriteWidget                               WTeamBigMarkAlienTeam;                                    // 0x3A5C(0x0040) (Edit)
	struct FSpriteWidget                               WResultMarkHumanTeam;                                     // 0x3A9C(0x0040) (Edit)
	struct FSpriteWidget                               WResultMarkAlienTeam;                                     // 0x3ADC(0x0040) (Edit)
	struct FSpriteWidget                               WWinTextAF;                                               // 0x3B1C(0x0040) (Edit)
	struct FSpriteWidget                               WLoseTextAF;                                              // 0x3B5C(0x0040) (Edit)
	struct FSpriteWidget                               WWinTextRSA;                                              // 0x3B9C(0x0040) (Edit)
	struct FSpriteWidget                               WLoseTextRSA;                                             // 0x3BDC(0x0040) (Edit)
	struct FSpriteWidget                               WRoundResultNewBG;                                        // 0x3C1C(0x0040) (Edit)
	struct FSpriteWidget                               WRoundResultGradationBG;                                  // 0x3C5C(0x0040) (Edit)
	struct FSpriteWidget                               WWinTextHumanTeam;                                        // 0x3C9C(0x0040) (Edit)
	struct FSpriteWidget                               WLoseTextHumanTeam;                                       // 0x3CDC(0x0040) (Edit)
	struct FSpriteWidget                               WWinTextAlienTeam;                                        // 0x3D1C(0x0040) (Edit)
	struct FSpriteWidget                               WLoseTextAlienTeam;                                       // 0x3D5C(0x0040) (Edit)
	struct FDigitSet                                   WDigitsNumResultWin;                                      // 0x3D9C(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsNumResultLose;                                     // 0x3E50(0x00B4) (Edit)
	struct FNumericWidget[]                            DigitsAFWinScore;                                         // 0x3F04(0x000C) (Edit, NeedCtorLink)
	struct FNumericWidget[]                            DigitsRSAWinScore;                                        // 0x3F10(0x000C) (Edit, NeedCtorLink)
	struct FNumericWidget[]                            DigitsAFLoseScore;                                        // 0x3F1C(0x000C) (Edit, NeedCtorLink)
	struct FNumericWidget[]                            DigitsRSALoseScore;                                       // 0x3F28(0x000C) (Edit, NeedCtorLink)
	struct FSpriteWidget                               wDefenceBotIcon[0xF];                                     // 0x3F34(0x0040)
	int[]                                              wDefenceGradeList;                                        // 0x42F4(0x000C) (NeedCtorLink)
	struct FSpriteWidget                               WScoreBG;                                                 // 0x4300(0x0040) (Edit)
	struct FSpriteWidget                               WGoalScoreBG;                                             // 0x4340(0x0040) (Edit)
	struct FSpriteWidget                               WTimeBG;                                                  // 0x4380(0x0040) (Edit)
	struct FNumericWidget[]                            DigitsAFScore;                                            // 0x43C0(0x000C) (Edit, NeedCtorLink)
	struct FNumericWidget[]                            DigitsRSAScore;                                           // 0x43CC(0x000C) (Edit, NeedCtorLink)
	struct FNumericWidget[]                            DigitsGoalScore;                                          // 0x43D8(0x000C) (Edit, NeedCtorLink)
	struct FNumericWidget[]                            DigitsTime;                                               // 0x43E4(0x000C) (Edit, NeedCtorLink)
	struct FNumericWidget[]                            DigitsFFAGoalScore;                                       // 0x43F0(0x000C) (Edit, NeedCtorLink)
	struct FSpriteWidget                               WHudBG2;                                                  // 0x43FC(0x0040) (Edit)
	struct FSpriteWidget                               WHudBGR;                                                  // 0x443C(0x0040) (Edit)
	struct FSpriteWidget                               WTeamScoreBG;                                             // 0x447C(0x0040) (Edit)
	struct FSpriteWidget                               WNowRSATeamisWin;                                         // 0x44BC(0x0040)
	struct FSpriteWidget                               WNowAFTeamisWin;                                          // 0x44FC(0x0040)
	struct FSpriteWidget                               WNowRSATeamisLose;                                        // 0x453C(0x0040)
	struct FSpriteWidget                               WNowAFTeamisLose;                                         // 0x457C(0x0040)
	struct FSpriteWidget                               WResultTxtAF[0x2];                                        // 0x45BC(0x0040) (Edit)
	struct FSpriteWidget                               WResultTxtRSA[0x2];                                       // 0x463C(0x0040) (Edit)
	struct FSpriteWidget                               WFFABG;                                                   // 0x46BC(0x0040) (Edit)
	struct FSpriteWidget                               WFFAScoreBG;                                              // 0x46FC(0x0040) (Edit)
	struct FSpriteWidget                               WFFAScoreOverLayer;                                       // 0x473C(0x0040) (Edit)
	int                                                Ranking_Self;                                             // 0x477C(0x0004)
	class APlayerReplicationInfo*[]                    arrRankingInfo;                                           // 0x4780(0x000C) (NeedCtorLink)
	class APlayerReplicationInfo*                      PRI_1st;                                                  // 0x478C(0x0004)
	class APlayerReplicationInfo*                      PRI_2nd;                                                  // 0x4790(0x0004)
	class APlayerReplicationInfo*                      PRI_Self;                                                 // 0x4794(0x0004)
	float                                              fSortingLastTime;                                         // 0x4798(0x0004)
	struct FSpriteWidget                               DFRankingBG;                                              // 0x479C(0x0040)
	struct FSpriteWidget                               DFUserHP;                                                 // 0x47DC(0x0040)
	struct FSpriteWidget                               WTimerBombBG;                                             // 0x481C(0x0040) (Edit)
	class UMaterial*                                   matBack1;                                                 // 0x485C(0x0004)
	class UMaterial*                                   matLine;                                                  // 0x4860(0x0004)
	class UMaterial*                                   tempMat;                                                  // 0x4864(0x0004)
	class UMaterial*                                   matOn;                                                    // 0x4868(0x0004)
	class UMaterial*[]                                 Medals;                                                   // 0x486C(0x000C) (NeedCtorLink)
	string                                             RankPostfix;                                              // 0x4878(0x000C) (Localized, NeedCtorLink)
	struct FSpriteWidget                               WAlienModeScoreBG;                                        // 0x4884(0x0040)
	int                                                HasSkillC4;                                               // 0x48C4(0x0004)
	int                                                HasSkillAirStirke;                                        // 0x48C8(0x0004)
	int                                                HasSkillRPG7;                                             // 0x48CC(0x0004)
	int                                                Displaying_State[0x14];                                   // 0x48D0(0x0004)
	float                                              fBeginDrawTime_Skill;                                     // 0x4920(0x0004)
	bool                                               bDrawSkillC4;                                             // 0x4924(0x0004)
	bool                                               bDrawSkillRPG7;                                           // 0x4924(0x0004)
	bool                                               bDrawSkillHelicopter;                                     // 0x4924(0x0004)
	bool                                               bDrawSkillAirStrike;                                      // 0x4924(0x0004)
	bool                                               bDrawSkillUAV;                                            // 0x4924(0x0004)
	bool                                               bDrawSkillRPG;                                            // 0x4924(0x0004)
	bool                                               bDrawSkillSentryGun;                                      // 0x4924(0x0004)
	float                                              fBeginDrawTime_Item;                                      // 0x4928(0x0004)
	float                                              fBeginDrawTime_SudenDeath;                                // 0x492C(0x0004)
	struct FSpriteWidget                               W3Kill;                                                   // 0x4930(0x0040) (Edit)
	struct FSpriteWidget                               W5Kill;                                                   // 0x4970(0x0040) (Edit)
	struct FSpriteWidget                               W7Kill;                                                   // 0x49B0(0x0040) (Edit)
	struct FSpriteWidget                               W10Kill;                                                  // 0x49F0(0x0040) (Edit)
	struct FSpriteWidget                               W15Kill;                                                  // 0x4A30(0x0040) (Edit)
	struct FSpriteWidget                               WHeadshot;                                                // 0x4A70(0x0040) (Edit)
	struct FSpriteWidget                               WKillTextBg;                                              // 0x4AB0(0x0040) (Edit)
	struct FSpriteWidget                               WHudBack3;                                                // 0x4AF0(0x0040) (Edit)
	struct FSpriteWidget                               WTxtHostChange;                                           // 0x4B30(0x0040) (Edit)
	struct FSpriteWidget                               WTxtSudenDeath;                                           // 0x4B70(0x0040) (Edit)
	struct FSpriteWidget                               wTxtSubSudenDeath;                                        // 0x4BB0(0x0040)
	string                                             lsSudenDeathMessage[0x3];                                 // 0x4BF0(0x000C) (Localized, NeedCtorLink)
	float                                              fBeginDrawTime_BattleExplain;                             // 0x4C14(0x0004)
	struct FSpriteWidget                               WBattleExplain1;                                          // 0x4C18(0x0040) (Edit)
	struct FSpriteWidget                               WBattleExplain2;                                          // 0x4C58(0x0040) (Edit)
	int                                                AttackTeamIndex;                                          // 0x4C98(0x0004) (Edit)
	int                                                CurrentRound;                                             // 0x4C9C(0x0004) (Edit)
	float                                              fBeginDrawTime_GameMode;                                  // 0x4CA0(0x0004)
	string                                             sMessageGameMode;                                         // 0x4CA4(0x000C) (NeedCtorLink)
	class UMaterial*                                   mGameMode[0x3];                                           // 0x4CB0(0x0004)
	struct FSpriteWidget                               WGameMode;                                                // 0x4CBC(0x0040) (Edit)
	int                                                iGameObjectIndex;                                         // 0x4CFC(0x0004)
	bool                                               bChangeMessgeGameMode;                                    // 0x4D00(0x0004)
	struct FSpriteWidget[]                             DomObjectCaptureEnemy;                                    // 0x4D04(0x000C) (Edit, NeedCtorLink)
	struct FSpriteWidget[]                             DomObjectCaptureAlly;                                     // 0x4D10(0x000C) (Edit, NeedCtorLink)
	struct FSpriteWidget[]                             DomObjectCaptureNon;                                      // 0x4D1C(0x000C) (Edit, NeedCtorLink)
	string                                             SoundRequireHeliCopter;                                   // 0x4D28(0x000C) (NeedCtorLink)
	string                                             SoundRequireAtillery;                                     // 0x4D34(0x000C) (NeedCtorLink)
	string                                             SoundRequireUAV;                                          // 0x4D40(0x000C) (NeedCtorLink)
	string                                             SoundRequireSentryGun;                                    // 0x4D4C(0x000C) (NeedCtorLink)
	string                                             SoundNotReady;                                            // 0x4D58(0x000C) (NeedCtorLink)
	string                                             MessageWin;                                               // 0x4D64(0x000C) (Localized, NeedCtorLink)
	string                                             MessageLose;                                              // 0x4D70(0x000C) (Localized, NeedCtorLink)
	bool                                               bUpdate;                                                  // 0x4D7C(0x0004)
	struct FSpriteWidget                               HelpKeyButtonReload;                                      // 0x4D80(0x0040) (Edit)
	float                                              WidthReload;                                              // 0x4DC0(0x0004)
	bool                                               bDisplayEvent_HealthPack;                                 // 0x4DC4(0x0004)
	bool                                               bDisplayEvent_CountDown;                                  // 0x4DC4(0x0004)
	int                                                iCountNumber;                                             // 0x4DC8(0x0004)
	float                                              fBeginTimeCounDown;                                       // 0x4DCC(0x0004)
	bool                                               bDisplayEvent_Invincible;                                 // 0x4DD0(0x0004)
	struct FSpriteWidget                               wBackSeparationTop;                                       // 0x4DD4(0x0040) (Edit)
	struct FSpriteWidget                               wBackSeparationBottom;                                    // 0x4E14(0x0040) (Edit)
	struct FSpriteWidget                               WTeamImageAF[0x4];                                        // 0x4E54(0x0040) (Edit)
	struct FSpriteWidget                               WTeamImageRSA[0x4];                                       // 0x4F54(0x0040) (Edit)
	struct FSpriteWidget                               WScoreTeamMarkAF;                                         // 0x5054(0x0040) (Edit)
	struct FSpriteWidget                               WScoreTeamMarkRSA;                                        // 0x5094(0x0040) (Edit)
	string                                             strNotReadySkill[0x4];                                    // 0x50D4(0x000C) (Localized, NeedCtorLink)
	string                                             strNotReadySkillDesc;                                     // 0x5104(0x000C) (Localized, NeedCtorLink)
	string                                             strReadySkill;                                            // 0x5110(0x000C) (Localized, NeedCtorLink)
	string                                             strReadySkillDesc;                                        // 0x511C(0x000C) (Localized, NeedCtorLink)
	string                                             strReadySupplyItem;                                       // 0x5128(0x000C) (Localized, NeedCtorLink)
	string                                             strReadySupplyItemDesc;                                   // 0x5134(0x000C) (Localized, NeedCtorLink)
	string                                             strHelicopter;                                            // 0x5140(0x000C) (Localized, NeedCtorLink)
	string                                             strSentryGun;                                             // 0x514C(0x000C) (Localized, NeedCtorLink)
	string                                             strAirStrike;                                             // 0x5158(0x000C) (Localized, NeedCtorLink)
	string                                             strUAV;                                                   // 0x5164(0x000C) (Localized, NeedCtorLink)
	string                                             strHelicopterFailed;                                      // 0x5170(0x000C) (Localized, NeedCtorLink)
	string                                             strSentryGunFailed;                                       // 0x517C(0x000C) (Localized, NeedCtorLink)
	string                                             strAirStrikeFailed;                                       // 0x5188(0x000C) (Localized, NeedCtorLink)
	string                                             strHelicopterFailedDesc;                                  // 0x5194(0x000C) (Localized, NeedCtorLink)
	string                                             strSentryGunFailedDesc;                                   // 0x51A0(0x000C) (Localized, NeedCtorLink)
	string                                             strAirStrikeFailedDesc;                                   // 0x51AC(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_DisplayEvent");
		return ptr;
	}


	void DrawEventString(class UCanvas* C, float StartTime, const string& strHead, const struct FColor& headColor, const string& strDesc, const string& strKey);
	void DisplayEvent_Skill_NotReady(class UCanvas* C, int SkillID);
	void DrawMessage_SentryGun_Installing(class UCanvas* C, const struct FSpriteWidget& WMessage, float ProgressPct);
	void DrawMessageConnectionInstability(class UCanvas* C);
	void ConnectionInstability(class UCanvas* C);
	void SetTimeConnectionInstability(bool bSet);
	void DrawAAS(class UCanvas* C, const string& sAASNotice);
	void DrawMoveGameNotice(class UCanvas* C, const string& sGameNotice, float fLifeTime);
	void DrawGameNotice(class UCanvas* C, const string& sGameNotice);
	string GetMessageGameMode_FFA();
	string GetMessageGameMode_SBT();
	string GetMessageGameMode_SD();
	string GetMessageGameMode_DOA();
	void SetMessageGameMode_DOM(class UMaterial* matA, class UMaterial* matB, class UMaterial* matC);
	string GetMessageGameMode_DOM();
	string GetMessageGameMode_TD();
	string GetMessageGameMode(class UMaterial** mat);
	void DisplayEvent_SetDrawGameMessage(bool bMode, bool bSystem);
	void DrawGameMode(class UCanvas* C);
	void SetBombObjectIndex(int objectIndex);
	void DisplayEvent_GameMode(const string& Message);
	void DisplayEvent_BattleExplain();
	void DrawPlusPoint_Defence(class UCanvas* C, int iPoint, int iPosX, int iPosY, int iEffectState, float fScale);
	void DrawPlusPoint(class UCanvas* C, int iPoint, int iPosX, int iPosY, int iAlpha, int iEffectState, float fScale);
	void DisplayEvent_GainPoint(int iPoint);
	void DrawSudenDeath(class UCanvas* C);
	void DisPlayEvent_SudenDeath();
	void DrawHostChange(class UCanvas* C);
	bool DrawMessageRechargeAmmo(class UCanvas* C);
	void DrawWarningWeaponInfo(class UCanvas* C);
	void ResetState();
	void DrawVehicleInfo(class UCanvas* C);
	void DrawWeaponChange(class UCanvas* C);
	void DrawTileByMaterial(class UCanvas* C, class UMaterial* mat, int iAlpha, float fUL, float fVL, float fScale);
	void DrawMessage_BeginMission(class UCanvas* C, int iRound, bool bChangeAttackTeam, int iAttackTeam, int iElapsedTime);
	void DrawResultScore_FFA(class UCanvas* C);
	void DrawResultScore_FFA_Item(class UCanvas* C, bool drawTop, class APlayerReplicationInfo* currPRI, class UwMatchUserInfo* User, int lh, int currLH, int nextLH, class UMaterial* medalMat, int Rank);
	void DrawResultScore_AlienMdoe(class UCanvas* C, bool bAlienTeamWin);
	void DrawResultScore(class UCanvas* C, bool Won);
	void DrawTeamScoreUseImage();
	void DrawSpectating(class UCanvas* C);
	void DrawA(class UCanvas* C);
	void DrawTimerBomb(class UCanvas* C, int Min, int sec);
	void DrawRankingInfo_Text(class UCanvas* C, class APlayerReplicationInfo* currPRI, float _iPosX, float _iPosY, const struct FColor& FontColor);
	void DrawRankingInfo_Mark(class UCanvas* C, class APlayerReplicationInfo* currPRI, float _iPosX, float _iPosY);
	void DrawRankingInfo(class UCanvas* C, class APlayerReplicationInfo* currPRI, float _iPosX, float _iPosY);
	void DrawDFRankingInfo(class UCanvas* C, class APlayerReplicationInfo* PRI, float iPosX, float iPosY);
	void DrawDFScore(class UCanvas* C);
	void DrawFFAScore(class UCanvas* C);
	void DFRankingSorting();
	void FFARankingSorting();
	void SortPRIArray();
	bool InOrder(class APlayerReplicationInfo* P1, class APlayerReplicationInfo* P2);
	void DrawAlienModeDigits(class UCanvas* C, int iValue, int _iPosX, int _iPosY, const struct FCalCoordsW& calW);
	void DrawAlienModeScore(class UCanvas* C);
	void DrawMainScoreTeam(class UCanvas* C, int iScoreAF, int iScoreRSA, int _iPosX, int _iPosY, const struct FCalCoordsW& calW);
	void DrawRemaingTime(class UCanvas* C, int _iPosX, int _iPosY);
	void DrawMainScore(class UCanvas* C);
	void DrawMainTimer(class UCanvas* C);
	void DrawRoundResult(class UCanvas* C, int ScoringTeam, int iMyTeam);
	void DisplayRoundResult(class UCanvas* C, int ScoringTeam, int iMyTeam);
	void DisplayMessaage_Round(class UCanvas* C, int iAttackTeam, int iAlpha);
	void DisplayMessage_Mission(class UCanvas* C, int iAttackTeam, int iAlpha);
	void DisplayMessage_Mission_Intrusion(class UCanvas* C, int iAttackTeam, int iRound);
	void DrawCountDown(class UCanvas* C, int iCount);
	void DrawMessage_Waiting(class UCanvas* C);
	void DrawMessage_WaitingCountGM(class UCanvas* C);
	void DrawMessage_StartDefence(class UCanvas* C);
	void DrawMessage_Start(class UCanvas* C);
	void DrawMessage_Go(class UCanvas* C);
	void DrawEffect(class UCanvas* C, float StartTime, int iAlpha);
	void DrawMessageHeadShotAndMultiKill(class UCanvas* C, const string& sMessage, bool bAddPosY, float fFontSize, const struct FColor& _colorShadow);
	void DrawMessageDomi_Capture(class UCanvas* C, const struct FDigitSet& WDigit, const struct FNumericWidget& WRegion, const struct FSpriteWidget& WMessage, bool CaptureDoing, float ProgressPct);
	void DrawMessageSD_BombDoingAndDone(class UCanvas* C, const struct FSpriteWidget& WMessage, bool SDDoing, float ProgressPct);
	void DrawMessageSD_BombEnable(class UCanvas* C, const struct FSpriteWidget& WKey, const struct FSpriteWidget& WMessage);
	void DrawInvincibleGauge(class UCanvas* C);
	void DrawGauge2(class UCanvas* C, float fProgressPct, float PosX, float PosY);
	void DisplayEvent_Respawn(class UCanvas* C);
	void DrawGauge(class UCanvas* C, float fProgressPct);
	void DrawHelpBG(class UCanvas* C, int OffsetX, int OffsetY, int iWidth, int iHeight);
	void Draw_Item_Skill(class UCanvas* C, class APlayerReplicationInfo* curPRI);
	void Draw_Item_Supply(class UCanvas* C, class APlayerReplicationInfo* curPRI);
	void DrawEvent_Item(class UCanvas* C);
	void DisplayEvent_Skill_UsingSkill(class UCanvas* C);
	void DisplayEvent_Skill_UAV(class UCanvas* C);
	void DisplayEvent_Skill_AirStirke(class UCanvas* C);
	void DisplayEvent_Skill_State(class UCanvas* C, const struct FSpriteWidget& WMessage, const struct FSpriteWidget& skillIcon, bool bDrawing);
	void CallSkill(int iKey, bool bRequire, bool iSucess);
	void DisplayEvent_Skill_SentryGun(class UCanvas* C);
	void DisplayEvent_Skill_Helicopter(class UCanvas* C);
	void DrawEvent_Item_HealthPack(class UCanvas* C, int AddHp);
	void SetSkillState(int skillC4, int skillAirStirke, int SkillRPG7);
	void DisPlayEvent_Waiting(const string& Message);
	void UpdateHelpKeyControll();
	void UpdateHUD();
	void PlaySound_Event();
	void DisplayEvent_CountDown(int iCount);
	void DisPlayEvent_EndWaitingForStart();
	void DisPlayEvent_BeginWaitingForStart();
	void CallEvent(bool ItemCheck, int iReservation1, int iReservation2);
	void Initialize(class AHudBase* myOwner, class ALevelInfo* Level);
};


// Class XInterface.wHudPart_DisplayMain
// 0x0600 (0x2B98 - 0x2598)
class AwHudPart_DisplayMain : public AwHudPart_DisplayBase
{
public:
	struct FSpriteWidget                               HelpKeyButtonBackground;                                  // 0x2598(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonRun;                                         // 0x25D8(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonWorldMap;                                    // 0x2618(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonAim;                                         // 0x2658(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonMiliAttack;                                  // 0x2698(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonSkill[0x2];                                  // 0x26D8(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonUAV;                                         // 0x2758(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonBomb;                                        // 0x2798(0x0040) (Edit)
	float                                              WidthBomb;                                                // 0x27D8(0x0004)
	struct FSpriteWidget                               WSkill2[0x6];                                             // 0x27DC(0x0040) (Edit)
	struct FSpriteWidget                               WSkill3[0x5];                                             // 0x295C(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonBattleHelp;                                  // 0x2A9C(0x0040)
	struct FSpriteWidget                               WBattleHelp;                                              // 0x2ADC(0x0040)
	int                                                HasSkills;                                                // 0x2B1C(0x0004)
	bool                                               DrawSkills;                                               // 0x2B20(0x0004)
	bool                                               CheckDead;                                                // 0x2B20(0x0004)
	float                                              CheckDeadTime;                                            // 0x2B24(0x0004)
	float                                              StartDrawTime;                                            // 0x2B28(0x0004)
	float                                              QuitDrawTime;                                             // 0x2B2C(0x0004)
	float                                              fFadeOutTime;                                             // 0x2B30(0x0004)
	float                                              fDrawTime;                                                // 0x2B34(0x0004)
	float                                              RespawnTime;                                              // 0x2B38(0x0004)
	int                                                HasSkillNum;                                              // 0x2B3C(0x0004)
	float                                              WidthSprint;                                              // 0x2B40(0x0004)
	float                                              WidthWorldMap;                                            // 0x2B44(0x0004)
	float                                              WidthAim;                                                 // 0x2B48(0x0004)
	float                                              WidthMelee;                                               // 0x2B4C(0x0004)
	float                                              WidthSkill[0x3];                                          // 0x2B50(0x0004)
	int                                                iCountSlot3;                                              // 0x2B5C(0x0004)
	int                                                iCountSlot4;                                              // 0x2B60(0x0004)
	bool                                               bUpdate;                                                  // 0x2B64(0x0004)
	string                                             lsChattingHelp;                                           // 0x2B68(0x000C) (Localized, NeedCtorLink)
	string                                             lsSurvivedString;                                         // 0x2B74(0x000C) (Localized, NeedCtorLink)
	string                                             lsTeamAF;                                                 // 0x2B80(0x000C) (Localized, NeedCtorLink)
	string                                             lsTeamRSA;                                                // 0x2B8C(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_DisplayMain");
		return ptr;
	}


	void DrawSurvivedUsers(class UCanvas* C);
	void DrawTextChattingHelp(class UCanvas* C);
	void DrawHas2Skill(class UCanvas* C);
	void DrawHas3Skill(class UCanvas* C);
	void DrawHasSkill(class UCanvas* C);
	void CheckOwnerSkill();
	void DrawBlinkActiveKey(class UCanvas* C);
	void DrawHelpKeyControll_Bomb(class UCanvas* C);
	void DrawHelpKeyControll(class UCanvas* C);
	void DrawSpectating(class UCanvas* C);
	void DrawA(class UCanvas* C);
	void SendHostPointInGame();
	void UpdateHelpKeyControll();
	void UpdateHelpKey_Slot(byte iIndex, bool bEnable);
	void DisplayEvent_ActiveSkill();
	void CallEvent(bool ItemCheck, int iReservation1, int iReservation2);
};


// Class XInterface.wHudPart_RadioMessage
// 0x02BC (0x2854 - 0x2598)
class AwHudPart_RadioMessage : public AwHudPart_DisplayBase
{
public:
	ERMType                                            eRadioType;                                               // 0x2598(0x0001)
	byte                                               Padding00[0x3];                                           // 0x2599(0x0003) MISSED OFFSET
	struct FSpriteWidget                               WKeyBtnRadionMessage;                                     // 0x259C(0x0040)
	struct FSpriteWidget                               WHudBack1;                                                // 0x25DC(0x0040)
	struct FSpriteWidget                               WHudBack2;                                                // 0x261C(0x0040)
	string                                             sKeyActive[0xA];                                          // 0x265C(0x000C) (NeedCtorLink)
	string                                             lsRadioMessage;                                           // 0x26D4(0x000C) (Localized, NeedCtorLink)
	string                                             lsRadioMessageType[0x4];                                  // 0x26E0(0x000C) (Localized, NeedCtorLink)
	string                                             lsCommond[0xA];                                           // 0x2710(0x000C) (Localized, NeedCtorLink)
	string                                             lsStatement[0x8];                                         // 0x2788(0x000C) (Localized, NeedCtorLink)
	string                                             lsRespon[0x9];                                            // 0x27E8(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_RadioMessage");
		return ptr;
	}


	void DrawRadioMessage(class UCanvas* C, int iMessage, int iHeight, const string& sMessage);
	ERMType GetRadioType();
	void SetRadioType(ERMType _ERMType);
	void DrawA(class UCanvas* C);
	void ResetRadioMessage();
	void CallRadioMessage(int iKey, int iReservation1, int iReservation2);
	void UpdateHelpKeyControll();
	void Initialize(class AHudBase* myOwner, class ALevelInfo* Level);
};


// Class XInterface.wHudPart_DisplayQuest
// 0x00B8 (0x2650 - 0x2598)
class AwHudPart_DisplayQuest : public AwHudPart_DisplayBase
{
public:
	struct FSQuest[]                                   aMessageList;                                             // 0x2598(0x000C) (NeedCtorLink)
	struct FSpriteWidget                               WSBBG3;                                                   // 0x25A4(0x0040) (Edit)
	struct FSpriteWidget                               WMarkExclamation;                                         // 0x25E4(0x0040) (Edit)
	float                                              fLifeTime;                                                // 0x2624(0x0004)
	float                                              fFontSize;                                                // 0x2628(0x0004)
	string                                             temp1;                                                    // 0x262C(0x000C) (Localized, NeedCtorLink)
	string                                             Temp2;                                                    // 0x2638(0x000C) (Localized, NeedCtorLink)
	float                                              LTPosX;                                                   // 0x2644(0x0004)
	float                                              LTPosY;                                                   // 0x2648(0x0004)
	class UwMatchMaker*                                kMM;                                                      // 0x264C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_DisplayQuest");
		return ptr;
	}


	void PushMessage(const string& MissionDesc, int cur, int Max);
	void ReceivedAccomplishMission100Percent(const string& MissionDesc, int cur, int Max);
	void ReceivedAccomplishMission75Percent(const string& MissionDesc, int cur, int Max);
	void ReceivedAccomplishMission50Percent(const string& MissionDesc, int cur, int Max);
	void ReceivedAccomplishMission25Percent(const string& MissionDesc, int cur, int Max);
	bool HasMessage();
	void DrawGauge(class UCanvas* C, float fProgressPct, float PosX, float PosY);
	void DrawSpectating(class UCanvas* C);
	void DrawProgress(class UCanvas* C);
	void DrawHudPassA(class UCanvas* C);
	void Initialize(class AHudBase* myOwner, class ALevelInfo* Level);
};


// Class XInterface.wHudPart_Minimap
// 0x0004 (0x1330 - 0x132C)
class AwHudPart_Minimap : public AwHudPart_MinimapBase
{
public:
	float                                              fFadeEffectTime;                                          // 0x132C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_Minimap");
		return ptr;
	}


	void DrawMinimap_Airstrike(class UCanvas* C);
};


// Class XInterface.wHudPart_ItemBuy
// 0x052C (0x2AC4 - 0x2598)
class AwHudPart_ItemBuy : public AwHudPart_DisplayBase
{
public:
	string                                             lsItemList;                                               // 0x2598(0x000C) (Localized, NeedCtorLink)
	string                                             lsItemComment;                                            // 0x25A4(0x000C) (Localized, NeedCtorLink)
	struct FSpriteWidget                               WWindowBG;                                                // 0x25B0(0x0040)
	struct FSpriteWidget                               WItemBG[0x3];                                             // 0x25F0(0x0040)
	struct FSpriteWidget                               WItemList[0x6];                                           // 0x26B0(0x0040)
	string                                             strItemName[0x6];                                         // 0x2830(0x000C) (NeedCtorLink)
	struct FSpriteWidget                               WShowKeyButton;                                           // 0x2878(0x0040)
	struct FSpriteWidget                               WKeyButton[0x6];                                          // 0x28B8(0x0040)
	struct FSpriteWidget                               WItemBlackBG;                                             // 0x2A38(0x0040)
	bool                                               bEnableItemBuy;                                           // 0x2A78(0x0004)
	struct FstItemInfo                                 arItemList[0x6];                                          // 0x2A7C(0x000C)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_ItemBuy");
		return ptr;
	}


	void Timer();
	void CallItemBuy(int iKey, int iReservation1, int iReservation2);
	void SortItemList();
	bool InOrder(const struct FstItemInfo& P1, const struct FstItemInfo& P2);
	void SetItemList();
	void DrawItemList(class UCanvas* C, int iPosX, int iPosY, int Index);
	void DrawItemWindow(class UCanvas* C);
	void DrawHudPassA(class UCanvas* C);
	void Initialize(class AHudBase* myOwner, class ALevelInfo* _level);
};


// Class XInterface.wScoreboardPart_Minimap
// 0x0028 (0x1354 - 0x132C)
class AwScoreboardPart_Minimap : public AwHudPart_MinimapBase
{
public:
	class UWinFrameChanger*                            FrameChanger;                                             // 0x132C(0x0004) (Edit, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UWinBox*                                     MinimapBGPos;                                             // 0x1330(0x0004) (Edit, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   MinimapCropCoords;                                        // 0x1334(0x0010)
	struct FFloatBoxWH                                 P;                                                        // 0x1344(0x0010)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wScoreboardPart_Minimap");
		return ptr;
	}


	void CalculateMinimapSize(float* fWidth, float* fHeight);
	void CalculateWorldPostionToMinimapPosition(const struct FVector& Location, float* mx, float* my);
	void CalculateTexturePositionFromMinimapPosition(float minimapX, float minimapY, int* TX, int* ty);
	void CalculateMinimapPosition(const struct FVector& centerLoc, const struct FRotator& centerRotation, const struct FVector& TargetLoc, float* minimapX, float* minimapY);
	void SetupMinimapSpriteWidgetForDrawing(const struct FRotator& Rotation, float minimapX, float minimapY, struct FSpriteWidget* Sprite);
	void CalcMinimapRotation(const struct FRotator& Rotation, struct FRotator* outRotation);
	void DrawMinimap_Airstrike(class UCanvas* C);
	void DrawMinimap_Myself(class UCanvas* C);
	void SetupBGMapUAV();
	void DrawMinimap_BGMap(class UCanvas* C);
	void DrawMinimap_CombatSituation(class UCanvas* C);
	void Draw(class UCanvas* C);
	void Initialize(class AHudBase* myOwner, class ALevelInfo* myLevel);
};


// Class XInterface.BTHUDColorPoolHK
// 0x0000 (0x002C - 0x002C)
class UBTHUDColorPoolHK : public UObject
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.BTHUDColorPoolHK");
		return ptr;
	}


	struct FColor STATIC_DefaultShadow();
	struct FColor STATIC_DefaultWhite();
};


// Class XInterface.ScoreBoardTeamDeathMatch
// 0x001C (0x066C - 0x0650)
class AScoreBoardTeamDeathMatch : public AScoreBoardDeathMatch
{
public:
	class UMaterial*                                   TeamBoxMaterial[0x2];                                     // 0x0650(0x0004)
	class UMaterial*                                   ScoreBack;                                                // 0x0658(0x0004)
	class UMaterial*                                   FlagIcon;                                                 // 0x065C(0x0004)
	class UMaterial*                                   ScoreboardU;                                              // 0x0660(0x0004)
	struct FColor                                      TeamColors[0x2];                                          // 0x0664(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.ScoreBoardTeamDeathMatch");
		return ptr;
	}


	void DrawTeam(int TeamNum, int PlayerCount, int OwnerOffset, class UCanvas* Canvas, int FontReduction, int BoxSpaceY, int PlayerBoxSizeY, int HeaderOffsetY);
	void UpdateScoreBoard(class UCanvas* Canvas);
	void UpdatePrecacheMaterials();
};


// Class XInterface.wHudPart_SelectQSlot_AlienMode
// 0x0000 (0x2DF4 - 0x2DF4)
class AwHudPart_SelectQSlot_AlienMode : public AwHudPart_SelectQSlotCN
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_SelectQSlot_AlienMode");
		return ptr;
	}


	void CalcQuickSlotTimer(int* respawnLeftTime, int* startupLeftTime);
};


// Class XInterface.GUIComboButton
// 0x0000 (0x0308 - 0x0308)
class UGUIComboButton : public UGUIVertScrollButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIComboButton");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class XInterface.GUIVertImageListBox
// 0x001C (0x0358 - 0x033C)
class UGUIVertImageListBox : public UGUIListBoxBase
{
public:
	class UGUIVertImageList*                           List;                                                     // 0x033C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	EeCellStyle                                        CellStyle;                                                // 0x0340(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x0341(0x0003) MISSED OFFSET
	float                                              ImageScale;                                               // 0x0344(0x0004) (Edit)
	int                                                NoVisibleRows;                                            // 0x0348(0x0004) (Edit)
	int                                                NoVisibleCols;                                            // 0x034C(0x0004) (Edit)
	int                                                HorzBorder;                                               // 0x0350(0x0004) (Edit)
	int                                                VertBorder;                                               // 0x0354(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIVertImageListBox");
		return ptr;
	}


	void Clear();
	bool MyClose(class UGUIContextMenu* Sender);
	bool MyOpen(class UGUIContextMenu* Menu, class UGUIComponent* ContextMenuOwner);
	void AddImage(class UMaterial* Image, int Item);
	int ItemCount();
	void InternalOnChange(class UGUIComponent* Sender);
	bool InternalOnClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitBaseList(class UGUIListBase* LocalList);
};


// Class XInterface.moEditBox
// 0x0008 (0x0354 - 0x034C)
class UmoEditBox : public UGUIMenuOption
{
public:
	bool                                               bMaskText;                                                // 0x034C(0x0004) (Edit)
	bool                                               bReadOnly;                                                // 0x034C(0x0004) (Edit)
	class UGUIEditBox*                                 MyEditBox;                                                // 0x0350(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.moEditBox");
		return ptr;
	}


	void MaskText(bool B);
	void FloatOnly(bool B);
	void IntOnly(bool B);
	void SetReadOnly(bool B);
	void ReadOnly(bool B);
	void SetText(const string& NewText);
	string GetText();
	string GetComponentValue();
	void SetComponentValue(const string& NewValue, bool bNoChange);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
