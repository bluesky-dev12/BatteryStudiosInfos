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

// Class XInterface.PropertyManagerBase
// 0x0004 (0x0030 - 0x002C)
class UPropertyManagerBase : public UObject
{
public:
	unsigned char                                      UnknownData00[0x4];                                       // 0x002C(0x0004) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.PropertyManagerBase");
		return ptr;
	}

};


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
	unsigned char                                      SaveStyle;                                                // 0x0050(0x0001) (NoExport)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0051(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUI");
		return ptr;
	}


	class UMaterial* GetModLogo(const struct FString& ModDir);
	struct FString GetModValue(const struct FString& ModDir, const struct FString& ModKey);
	void GetModList(TArray<struct FString>* ModDirs, TArray<struct FString>* ModTitles);
	void Profile(const struct FString& ProfileName);
	struct FString STATIC_JoinArray(TArray<struct FString> StringArray, const struct FString& Delim, bool bIgnoreBlanks);
	bool STATIC_IsDigit(const struct FString& Test, bool bAllowDecimal);
};


// Class XInterface.GUIComponent
// 0x0268 (0x02BC - 0x0054)
class UGUIComponent : public UGUI
{
public:
	TArray<struct FTimerData>                          Timers;                                                   // 0x0054(0x000C) (Const, NeedCtorLink)
	class UGUIPage*                                    PageOwner;                                                // 0x0060(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	class UGUIComponent*                               MenuOwner;                                                // 0x0064(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	class UGUIComponent*                               FocusInstead;                                             // 0x0068(0x0004) (Edit, ExportObject, NeedCtorLink, NoExport, EditInline)
	TEnumAsByte<EeMenuState>                           MenuState;                                                // 0x006C(0x0001) (Edit, NoExport)
	TEnumAsByte<EeMenuState>                           LastMenuState;                                            // 0x006D(0x0001) (Edit, EditConst, NoExport)
	TEnumAsByte<EeDropState>                           DropState;                                                // 0x006E(0x0001) (Edit, NoExport)
	TEnumAsByte<EeFontScale>                           FontScale;                                                // 0x006F(0x0001) (Edit)
	class UCanvas*                                     CurrentCanvas;                                            // 0x0070(0x0004)
	struct FString                                     IniOption;                                                // 0x0074(0x000C) (Edit, NeedCtorLink)
	struct FString                                     IniDefault;                                               // 0x0080(0x000C) (Edit, NeedCtorLink)
	struct FString                                     StyleName;                                                // 0x008C(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Hint;                                                     // 0x0098(0x000C) (Edit, Localized, NeedCtorLink)
	class UGUILabel*                                   FriendlyLabel;                                            // 0x00A4(0x0004) (Edit, ExportObject, NeedCtorLink, NoExport, EditInline)
	float                                              WinTop;                                                   // 0x00A8(0x0004) (Edit)
	float                                              WinLeft;                                                  // 0x00AC(0x0004) (Edit)
	float                                              WinWidth;                                                 // 0x00B0(0x0004) (Edit)
	float                                              WinHeight;                                                // 0x00B4(0x0004) (Edit)
	unsigned long                                      bUseAWinPos : 1;                                          // 0x00B8(0x0004) (Edit)
	struct FFloatBox                                   AWinPos;                                                  // 0x00BC(0x0010) (Edit)
	struct FFloatBox                                   RWinPos;                                                  // 0x00CC(0x0010) (Edit)
	struct FFloatBox                                   AWinFrame;                                                // 0x00DC(0x0010) (Edit)
	float                                              RenderWeight;                                             // 0x00EC(0x0004) (Edit)
	int                                                MouseCursorIndex;                                         // 0x00F0(0x0004) (Edit)
	int                                                TabOrder;                                                 // 0x00F4(0x0004) (Edit)
	int                                                Tag;                                                      // 0x00F8(0x0004) (Edit)
	unsigned long                                      bDebugging : 1;                                           // 0x00FC(0x0004) (Edit)
	unsigned long                                      bTabStop : 1;                                             // 0x00FC(0x0004) (Edit)
	unsigned long                                      bFocusOnWatch : 1;                                        // 0x00FC(0x0004) (Edit)
	unsigned long                                      bBoundToParent : 1;                                       // 0x00FC(0x0004) (Edit)
	unsigned long                                      bScaleToParent : 1;                                       // 0x00FC(0x0004) (Edit)
	unsigned long                                      bHasFocus : 1;                                            // 0x00FC(0x0004) (Edit, NoExport)
	unsigned long                                      bVisible : 1;                                             // 0x00FC(0x0004) (Edit)
	unsigned long                                      bAcceptsInput : 1;                                        // 0x00FC(0x0004) (Edit)
	unsigned long                                      bCaptureTabs : 1;                                         // 0x00FC(0x0004) (Edit)
	unsigned long                                      bCaptureMouse : 1;                                        // 0x00FC(0x0004) (Edit)
	unsigned long                                      bNeverFocus : 1;                                          // 0x00FC(0x0004) (Edit)
	unsigned long                                      bRepeatClick : 1;                                         // 0x00FC(0x0004) (Edit)
	unsigned long                                      bRequireReleaseClick : 1;                                 // 0x00FC(0x0004) (Edit)
	unsigned long                                      bMouseOverSound : 1;                                      // 0x00FC(0x0004) (Edit)
	unsigned long                                      bDropSource : 1;                                          // 0x00FC(0x0004) (Edit)
	unsigned long                                      bDropTarget : 1;                                          // 0x00FC(0x0004) (Edit)
	unsigned long                                      bPendingFocus : 1;                                        // 0x00FC(0x0004) (Edit, NoExport)
	unsigned long                                      bInit : 1;                                                // 0x00FC(0x0004) (Edit)
	unsigned long                                      bNeverScale : 1;                                          // 0x00FC(0x0004) (Edit)
	unsigned long                                      bRequiresStyle : 1;                                       // 0x00FC(0x0004) (Const, NoExport)
	unsigned long                                      bPositioned : 1;                                          // 0x00FC(0x0004) (Edit, Const, EditConst, NoExport)
	unsigned long                                      bAnimating : 1;                                           // 0x00FC(0x0004) (Edit, EditConst, NoExport)
	unsigned long                                      bTravelling : 1;                                          // 0x00FC(0x0004) (Edit, Const, EditConst, NoExport)
	unsigned long                                      bSizing : 1;                                              // 0x00FC(0x0004) (Edit, Const, EditConst, NoExport)
	TArray<struct FVector>                             MotionFrame;                                              // 0x0100(0x000C) (Edit, Const, EditConst, NeedCtorLink, NoExport)
	TArray<struct FVector>                             SizeFrame;                                                // 0x010C(0x000C) (Edit, Const, EditConst, NeedCtorLink, NoExport)
	float                                              Bounds[0x4];                                              // 0x0118(0x0004) (Edit, Const, EditConst, NoExport)
	float                                              ClientBounds[0x4];                                        // 0x0128(0x0004) (Edit, Const, EditConst, NoExport)
	unsigned long                                      bTimerRepeat : 1;                                         // 0x0138(0x0004) (Edit)
	int                                                TimerIndex;                                               // 0x013C(0x0004) (Edit, Const, EditConst, NoExport)
	float                                              TimerCountdown;                                           // 0x0140(0x0004) (Edit)
	float                                              TimerInterval;                                            // 0x0144(0x0004) (Edit)
	float                                              MouseOffset[0x4];                                         // 0x0148(0x0004) (Const, NoExport)
	class UGUIContextMenu*                             ContextMenu;                                              // 0x0158(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, EditInline)
	class UGUIToolTip*                                 ToolTip;                                                  // 0x015C(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, EditInline)
	struct FColor                                      WhiteColor;                                               // 0x0160(0x0004) (Const, NoExport)
	class UGUIStyles*                                  Style;                                                    // 0x0164(0x0004) (Edit, ExportObject, NeedCtorLink, NoExport, EditInline)
	TEnumAsByte<EClickSound>                           OnClickSound;                                             // 0x0168(0x0001) (Edit)
	TEnumAsByte<EParentScaleType>                      BoundingType;                                             // 0x0169(0x0001) (Edit)
	TEnumAsByte<EParentScaleType>                      ScalingType;                                              // 0x016A(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x1];                                       // 0x016B(0x0001) MISSED OFFSET
	unsigned long                                      bStandardized : 1;                                        // 0x016C(0x0004) (Edit)
	float                                              StandardHeight;                                           // 0x0170(0x0004) (Edit)
	unsigned long                                      bFlicker : 1;                                             // 0x0174(0x0004)
	int                                                PreDrawCount;                                             // 0x0178(0x0004) (Const, EditConst, NoExport)
	int                                                DrawCount;                                                // 0x017C(0x0004) (Const, EditConst, NoExport)
	int                                                OnRenderCount;                                            // 0x0180(0x0004) (EditConst, NoExport)
	int                                                OnRenderedCount;                                          // 0x0184(0x0004) (EditConst, NoExport)
	int                                                OnPreDrawCount;                                           // 0x0188(0x0004) (EditConst, NoExport)
	int                                                OnDrawCount;                                              // 0x018C(0x0004) (EditConst, NoExport)
	unsigned long                                      bIsDisableHover : 1;                                      // 0x0190(0x0004)
	unsigned long                                      bAlwaysFocus : 1;                                         // 0x0190(0x0004)
	struct FScriptDelegate                             __OnArrival__Delegate;                                    // 0x0194(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnEndAnimation__Delegate;                               // 0x019C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnPreDraw__Delegate;                                    // 0x01A4(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnDraw__Delegate;                                       // 0x01AC(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnRender__Delegate;                                     // 0x01B4(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnRendered__Delegate;                                   // 0x01BC(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnActivate__Delegate;                                   // 0x01C4(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnDeActivate__Delegate;                                 // 0x01CC(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnWatch__Delegate;                                      // 0x01D4(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnHitTest__Delegate;                                    // 0x01DC(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnMessage__Delegate;                                    // 0x01E4(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnHide__Delegate;                                       // 0x01EC(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnShow__Delegate;                                       // 0x01F4(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnBeginTooltip__Delegate;                               // 0x01FC(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnEndTooltip__Delegate;                                 // 0x0204(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnInvalidate__Delegate;                                 // 0x020C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnHover__Delegate;                                      // 0x0214(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnClick__Delegate;                                      // 0x021C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnDblClick__Delegate;                                   // 0x0224(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnRightClick__Delegate;                                 // 0x022C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnMousePressed__Delegate;                               // 0x0234(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnMouseRelease__Delegate;                               // 0x023C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnTimer__Delegate;                                      // 0x0244(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnChange__Delegate;                                     // 0x024C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnKeyType__Delegate;                                    // 0x0254(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnKeyEvent__Delegate;                                   // 0x025C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnDesignModeKeyEvent__Delegate;                         // 0x0264(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnCapturedMouseMove__Delegate;                          // 0x026C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnLoadINI__Delegate;                                    // 0x0274(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnSaveINI__Delegate;                                    // 0x027C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnMultiSelect__Delegate;                                // 0x0284(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnBeginDrag__Delegate;                                  // 0x028C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnEndDrag__Delegate;                                    // 0x0294(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnDragDrop__Delegate;                                   // 0x029C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnDragEnter__Delegate;                                  // 0x02A4(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnDragLeave__Delegate;                                  // 0x02AC(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnDragOver__Delegate;                                   // 0x02B4(0x000C) (NeedCtorLink)

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
	void EndAnimation(class UGUIComponent* Animating, TEnumAsByte<EAnimationType> Type);
	void BeginAnimation(class UGUIComponent* Animating);
	class UGUIPage* OwnerPage();
	void DebugFocusPosition(class UGUIComponent* Who, bool Last);
	void DebugFocus(class UGUIComponent* Who, bool bLose);
	void SetTooltip(class UGUIToolTip* InTooltip);
	void SetToolTipText(const struct FString& NewToolTipText);
	void SetHint(const struct FString& NewHint);
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
	void DropStateChange(TEnumAsByte<EeDropState> NewState);
	bool IsMultiSelect();
	void MenuStateChange(TEnumAsByte<EeMenuState> NewState);
	struct FString STATIC_MakeColorCode(const struct FColor& NewColor);
	struct FString STATIC_StripColorCodes(const struct FString& InString);
	void SaveINI(const struct FString& Value);
	struct FString LoadINI();
	void free();
	void Closed(class UGUIComponent* Sender, bool bCancelled);
	void Opened(class UGUIComponent* Sender);
	void Timer();
	struct FString AdditionalDebugString();
	bool SpecialHit(bool bForce);
	struct FString GetMenuPath();
	bool IsInIncompleteLetter(const struct FString& strUserName);
	int IsCorrectUserName_THAILAND(const struct FString& strUserName);
	int IsCorrectUserName_China(const struct FString& strUserName);
	int IsCorrectUserName(const struct FString& strUserName);
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
	void AutoPositionOn(TArray<class UGUIComponent*> Components, class UGUIComponent* frame, float LeftPadPerc, float UpperPadPerc, float RightPadPerc, float LowerPadPerc, int NumberOfColumns, float ColumnPadding);
	void AutoPosition(TArray<class UGUIComponent*> Components, float LeftBound, float UpperBound, float RightBound, float LowerBound, float LeftPad, float UpperPad, float RightPad, float LowerPad, int NumberOfColumns, float ColumnPadding);
	void KillTimer(const struct FName& TimerFunc);
	void SetTimer(float Interval, bool bRepeat, const struct FName& TimerFunc);
	class APlayerController* PlayerOwner();
	void OnDragOver(class UGUIComponent* Sender);
	void OnDragLeave(class UGUIComponent* Sender);
	void OnDragEnter(class UGUIComponent* Sender);
	bool OnDragDrop(class UGUIComponent* Sender);
	void OnEndDrag(class UGUIComponent* Sender, bool bAccepted);
	bool OnBeginDrag(class UGUIComponent* Sender);
	bool OnMultiSelect(class UGUIComponent* Sender);
	struct FString OnSaveINI(class UGUIComponent* Sender);
	void OnLoadINI(class UGUIComponent* Sender, const struct FString& S);
	bool OnCapturedMouseMove(float deltaX, float deltaY);
	bool OnDesignModeKeyEvent(TEnumAsByte<EInputKey> key, TEnumAsByte<EInputAction> State);
	bool OnKeyEvent(float Delta, unsigned char* key, unsigned char* State);
	bool OnKeyType(const struct FString& Unicode, unsigned char* key);
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
	void OnMessage(const struct FString& Msg, float MsgLife);
	void OnHitTest(float MouseX, float MouseY);
	void OnWatch();
	void OnDeActivate();
	void OnActivate();
	void OnRendered(class UCanvas* Canvas);
	void OnRender(class UCanvas* Canvas);
	bool OnDraw(class UCanvas* Canvas);
	bool OnPreDraw(class UCanvas* Canvas);
	void OnEndAnimation(class UGUIComponent* Sender, TEnumAsByte<EAnimationType> Type);
	void OnArrival(class UGUIComponent* Sender, TEnumAsByte<EAnimationType> Type);
};


// Class XInterface.GUIMultiComponent
// 0x0044 (0x0300 - 0x02BC)
class UGUIMultiComponent : public UGUIComponent
{
public:
	TArray<class UGUIComponent*>                       Controls;                                                 // 0x02BC(0x000C) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding)
	class UGUIComponent*                               FocusedControl;                                           // 0x02C8(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	TArray<class UGUIComponent*>                       Components;                                               // 0x02CC(0x000C) (Edit, EditFixedSize, NeedCtorLink, NoExport)
	int                                                AnimationCount;                                           // 0x02D8(0x0004) (Edit, EditConst, NoExport)
	unsigned long                                      PropagateVisibility : 1;                                  // 0x02DC(0x0004) (Edit)
	unsigned long                                      bOldStyleMenus : 1;                                       // 0x02DC(0x0004) (Edit)
	unsigned long                                      bDrawFocusedLast : 1;                                     // 0x02DC(0x0004) (Edit)
	unsigned long                                      bAlwaysAutomate : 1;                                      // 0x02DC(0x0004) (Edit)
	struct FScriptDelegate                             __HandleContextMenuOpen__Delegate;                        // 0x02E0(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __HandleContextMenuClose__Delegate;                       // 0x02E8(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __NotifyContextSelect__Delegate;                          // 0x02F0(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnCreateComponent__Delegate;                            // 0x02F8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIMultiComponent");
		return ptr;
	}


	bool RecursiveActiveOwner(class UGUIComponent* checkComponent);
	void TraversalApplyAWinPos();
	class UGUIComponent* NewComponent(class UGUIComponent* newcompo, const struct FFloatBox& fbNewCompo, float RenderWeight, class UGUIMultiComponent* ParentComponent);
	void CheckDuplicateTabOrder();
	void CheckInvalidTabOrder();
	void DebugTabOrder();
	void CenterMouse();
	void LevelChanged();
	void EndAnimation(class UGUIComponent* Animating, TEnumAsByte<EAnimationType> Type);
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
	class UGUIComponent* AddComponent(const struct FString& ComponentClass, bool SkipRemap);
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


// Class XInterface.GUIStyles
// 0x01FC (0x0250 - 0x0054)
class UGUIStyles : public UGUI
{
public:
	struct FString                                     KeyName;                                                  // 0x0054(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     AlternateKeyName[0x2];                                    // 0x0060(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     FontNames[0xF];                                           // 0x0078(0x000C) (Edit, NeedCtorLink, NoExport)
	class UGUIFont*                                    Fonts[0xF];                                               // 0x012C(0x0004) (Edit, ExportObject, NeedCtorLink, NoExport, EditInline)
	int                                                FontSizes[0x5];                                           // 0x0168(0x0004) (Edit, NoExport)
	struct FColor                                      FontColors[0x5];                                          // 0x017C(0x0004) (Edit, NoExport)
	struct FColor                                      FontBKColors[0x5];                                        // 0x0190(0x0004) (Edit, NoExport)
	struct FColor                                      FontShadowColor[0x5];                                     // 0x01A4(0x0004) (Edit, NoExport)
	int                                                FontShadowOffset[0x5];                                    // 0x01B8(0x0004) (Edit, NoExport)
	struct FColor                                      ImgColors[0x5];                                           // 0x01CC(0x0004) (Edit, NoExport)
	TEnumAsByte<EMenuRenderStyle>                      RStyles[0x5];                                             // 0x01E0(0x0001) (Edit, NoExport)
	unsigned char                                      UnknownData00[0x3];                                       // 0x01E5(0x0003) MISSED OFFSET
	class UMaterial*                                   Images[0x5];                                              // 0x01E8(0x0004) (Edit, NoExport)
	TEnumAsByte<EeImgStyle>                            ImgStyle[0x5];                                            // 0x01FC(0x0001) (Edit, NoExport)
	unsigned char                                      UnknownData01[0x3];                                       // 0x0201(0x0003) MISSED OFFSET
	float                                              ImgWidths[0x5];                                           // 0x0204(0x0004) (Edit, NoExport)
	float                                              ImgHeights[0x5];                                          // 0x0218(0x0004) (Edit, NoExport)
	int                                                BorderOffsets[0x4];                                       // 0x022C(0x0004) (Edit, NoExport)
	unsigned long                                      bTemporary : 1;                                           // 0x023C(0x0004) (Edit, NoExport)
	struct FScriptDelegate                             __OnDraw__Delegate;                                       // 0x0240(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnDrawText__Delegate;                                   // 0x0248(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIStyles");
		return ptr;
	}


	void Initialize();
	void btrDrawTextStyles(class UCanvas* Canvas, TEnumAsByte<EeMenuState> MenuState, float Left, float Top, float width, float Height, TEnumAsByte<EeTextAlign> Align, const struct FString& Text, TEnumAsByte<EeFontScale> FontScale, int FontSize, float R, float G, float B, float A);
	void btrTextSizeStyles(class UCanvas* Canvas, TEnumAsByte<EeMenuState> MenuState, const struct FString& Text, TEnumAsByte<EeFontScale> FontScale, int FontSize, float* XL, float* YL);
	void STATIC_TextSize(class UCanvas* Canvas, TEnumAsByte<EeMenuState> MenuState, const struct FString& Text, TEnumAsByte<EeFontScale> FontScale, float* XL, float* YL);
	void STATIC_DrawText(class UCanvas* Canvas, TEnumAsByte<EeMenuState> MenuState, float Left, float Top, float width, float Height, TEnumAsByte<EeTextAlign> Align, const struct FString& Text, TEnumAsByte<EeFontScale> FontScale);
	void STATIC_Draw(class UCanvas* Canvas, TEnumAsByte<EeMenuState> MenuState, float Left, float Top, float width, float Height);
	bool OnDrawText(class UCanvas* Canvas, TEnumAsByte<EeMenuState> MenuState, float Left, float Top, float width, float Height, TEnumAsByte<EeTextAlign> Align, const struct FString& Text, TEnumAsByte<EeFontScale> FontScale);
	bool OnDraw(class UCanvas* Canvas, TEnumAsByte<EeMenuState> MenuState, float Left, float Top, float width, float Height);
};


// Class XInterface.GUIFont
// 0x0030 (0x0084 - 0x0054)
class UGUIFont : public UGUI
{
public:
	struct FString                                     KeyName;                                                  // 0x0054(0x000C) (Edit, NeedCtorLink)
	unsigned long                                      bFixedSize : 1;                                           // 0x0060(0x0004) (Edit)
	unsigned long                                      bScaled : 1;                                              // 0x0060(0x0004) (Edit)
	int                                                NormalXRes;                                               // 0x0064(0x0004) (Edit)
	int                                                FallBackRes;                                              // 0x0068(0x0004) (Edit)
	TArray<struct FString>                             FontArrayNames;                                           // 0x006C(0x000C) (Edit, NeedCtorLink)
	TArray<class UFont*>                               FontArrayFonts;                                           // 0x0078(0x000C) (Edit, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIFont");
		return ptr;
	}


	class UFont* LoadFont(int i);
	class UFont* STATIC_LoadFontStatic(int i);
	class UFont* GetFont(int XRes);
};


// Class XInterface.GUIController
// 0x03EC (0x045C - 0x0070)
class UGUIController : public UBaseGUIController
{
public:
	class UGUIPage*                                    SaveFadeOutPage;                                          // 0x0070(0x0004) (ExportObject, NeedCtorLink, EditInline)
	unsigned long                                      bSaveCancelled : 1;                                       // 0x0074(0x0004)
	class UBTTcpLink_Channel*                          TcpHandler;                                               // 0x0078(0x0004)
	int                                                FONT_NUM;                                                 // 0x007C(0x0004) (Const)
	int                                                STYLE_NUM;                                                // 0x0080(0x0004) (Const)
	int                                                CURSOR_NUM;                                               // 0x0084(0x0004) (Const)
	TArray<struct FProfileStruct>                      Profilers;                                                // 0x0088(0x000C) (NeedCtorLink)
	struct FFloatBox                                   MouseCursorBounds;                                        // 0x0094(0x0010) (Const)
	TArray<struct FVector>                             MouseCursorOffset;                                        // 0x00A4(0x000C) (NeedCtorLink, EditInline)
	TArray<class UGUIPage*>                            MenuStack;                                                // 0x00B0(0x000C) (ExportObject, NeedCtorLink, EditInline)
	TArray<class UGUIPage*>                            PersistentStack;                                          // 0x00BC(0x000C) (NeedCtorLink)
	TArray<class UGUIFont*>                            FontStack;                                                // 0x00C8(0x000C) (NeedCtorLink, EditInline)
	TArray<class UGUIStyles*>                          StyleStack;                                               // 0x00D4(0x000C) (NeedCtorLink)
	TArray<class UMaterial*>                           MouseCursors;                                             // 0x00E0(0x000C) (NeedCtorLink, EditInline)
	TArray<class UMaterial*>                           ImageList;                                                // 0x00EC(0x000C) (NeedCtorLink)
	TArray<struct FString>                             DefaultStyleNames;                                        // 0x00F8(0x000C) (NeedCtorLink)
	TArray<struct FString>                             StyleNames;                                               // 0x0104(0x000C) (NeedCtorLink)
	TArray<struct FAutoLoadMenu>                       AutoLoad;                                                 // 0x0110(0x000C) (NeedCtorLink)
	TArray<struct FRestoreMenuItem>                    RestoreMenus;                                             // 0x011C(0x000C) (NeedCtorLink)
	TArray<struct FDesignModeHint>                     DesignModeHints;                                          // 0x0128(0x000C) (NeedCtorLink)
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
	struct FString                                     MouseOverSound;                                           // 0x018C(0x000C) (NeedCtorLink)
	struct FString                                     ClickSound;                                               // 0x0198(0x000C) (NeedCtorLink)
	struct FString                                     EditSound;                                                // 0x01A4(0x000C) (NeedCtorLink)
	struct FString                                     UpSound;                                                  // 0x01B0(0x000C) (NeedCtorLink)
	struct FString                                     DownSound;                                                // 0x01BC(0x000C) (NeedCtorLink)
	struct FString                                     DragSound;                                                // 0x01C8(0x000C) (NeedCtorLink)
	struct FString                                     FadeSound;                                                // 0x01D4(0x000C) (NeedCtorLink)
	struct FString                                     ItemEquipSuccessSound;                                    // 0x01E0(0x000C) (NeedCtorLink)
	struct FString                                     ItemEquipFailSound;                                       // 0x01EC(0x000C) (NeedCtorLink)
	struct FString                                     ItemTakeoffSound;                                         // 0x01F8(0x000C) (NeedCtorLink)
	struct FString                                     ItemAddPartsSound;                                        // 0x0204(0x000C) (NeedCtorLink)
	struct FString                                     ItemRepairSound;                                          // 0x0210(0x000C) (NeedCtorLink)
	struct FString                                     ItemClickSound;                                           // 0x021C(0x000C) (NeedCtorLink)
	struct FString                                     ItemBuySound;                                             // 0x0228(0x000C) (NeedCtorLink)
	struct FString                                     ItemSellSound;                                            // 0x0234(0x000C) (NeedCtorLink)
	struct FString                                     TrophyWindowSound;                                        // 0x0240(0x000C) (NeedCtorLink)
	struct FString                                     TrophyReceiverUserSound;                                  // 0x024C(0x000C) (NeedCtorLink)
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
	struct FString                                     GameResolution;                                           // 0x0280(0x000C) (NeedCtorLink)
	struct FString                                     LastGameType;                                             // 0x028C(0x000C) (Transient, NeedCtorLink)
	struct FString                                     RequestDataMenu;                                          // 0x0298(0x000C) (NeedCtorLink)
	struct FString                                     ArrayPropertyMenu;                                        // 0x02A4(0x000C) (NeedCtorLink)
	struct FString                                     DynArrayPropertyMenu;                                     // 0x02B0(0x000C) (NeedCtorLink)
	struct FString                                     FilterMenu;                                               // 0x02BC(0x000C) (NeedCtorLink)
	struct FString                                     MapVotingMenu;                                            // 0x02C8(0x000C) (NeedCtorLink)
	struct FString                                     KickVotingMenu;                                           // 0x02D4(0x000C) (NeedCtorLink)
	struct FString                                     MatchSetupMenu;                                           // 0x02E0(0x000C) (NeedCtorLink)
	struct FString                                     EditFavoriteMenu;                                         // 0x02EC(0x000C) (NeedCtorLink)
	TArray<struct FString>                             MainMenuOptions;                                          // 0x02F8(0x000C) (NeedCtorLink)
	struct FString                                     DesignerMenu;                                             // 0x0304(0x000C) (NeedCtorLink)
	unsigned char                                      RepeatKey;                                                // 0x0310(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0311(0x0003) MISSED OFFSET
	unsigned long                                      bIgnoreNextRelease : 1;                                   // 0x0314(0x0004)
	unsigned long                                      ShiftPressed : 1;                                         // 0x0314(0x0004)
	unsigned long                                      AltPressed : 1;                                           // 0x0314(0x0004)
	unsigned long                                      CtrlPressed : 1;                                          // 0x0314(0x0004)
	unsigned long                                      bModulateStackedMenus : 1;                                // 0x0314(0x0004)
	unsigned long                                      bQuietMenu : 1;                                           // 0x0314(0x0004)
	unsigned long                                      bNoToolTips : 1;                                          // 0x0314(0x0004)
	unsigned long                                      bDesignModeToolTips : 1;                                  // 0x0314(0x0004)
	unsigned long                                      bAutoRefreshBrowser : 1;                                  // 0x0314(0x0004)
	unsigned long                                      bModAuthor : 1;                                           // 0x0314(0x0004)
	unsigned long                                      bExpertMode : 1;                                          // 0x0314(0x0004)
	unsigned long                                      bDesignMode : 1;                                          // 0x0314(0x0004)
	unsigned long                                      bInteractiveMode : 1;                                     // 0x0314(0x0004)
	unsigned long                                      bHighlightCurrent : 1;                                    // 0x0314(0x0004)
	unsigned long                                      bDrawFullPaths : 1;                                       // 0x0314(0x0004)
	unsigned long                                      MainNotWanted : 1;                                        // 0x0314(0x0004)
	unsigned long                                      bCurMenuInitialized : 1;                                  // 0x0314(0x0004)
	unsigned long                                      bForceMouseCheck : 1;                                     // 0x0314(0x0004)
	unsigned long                                      bIgnoreUntilPress : 1;                                    // 0x0314(0x0004)
	unsigned long                                      bSnapCursor : 1;                                          // 0x0314(0x0004)
	float                                              RenderDelta;                                              // 0x0318(0x0004)
	float                                              LastRenderTime;                                           // 0x031C(0x0004)
	unsigned long                                      bFixedMouseSize : 1;                                      // 0x0320(0x0004)
	unsigned char                                      KeyDown[0xFF];                                            // 0x0324(0x0001) (Const)
	unsigned char                                      UnknownData01[0x1];                                       // 0x0423(0x0001) MISSED OFFSET
	TArray<class UClass*>                              RegisteredClasses;                                        // 0x0424(0x000C) (NeedCtorLink)
	unsigned long                                      bECEEdition : 1;                                          // 0x0430(0x0004)
	int                                                iTempWeaponId;                                            // 0x0434(0x0004)
	TArray<class UGUIPage*>                            SavedPage;                                                // 0x0438(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnNeedRawKeyPress__Delegate;                            // 0x0444(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __AddBuddy__Delegate;                                     // 0x044C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __PressedCloseWndBtn__Delegate;                           // 0x0454(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIController");
		return ptr;
	}


	class UGUIQuestionPage* ShowQuestionDialog(const struct FString& Question, unsigned char Buttons, unsigned char defButton);
	bool KeyPressed(TEnumAsByte<EInputKey> iKey);
	bool SearchBinds(const struct FString& BindAliasMask, TArray<struct FString>* BindAliases);
	bool GetAssignedKeys(const struct FString& BindAlias, TArray<struct FString>* BindKeyNames, TArray<struct FString>* LocalizedBindKeyNames);
	bool GetCurrentBind(const struct FString& BindKeyName, struct FString* BindKeyValue);
	bool KeyNameFromIndex(unsigned char iKey, struct FString* KeyName, struct FString* LocalizedKeyName);
	bool SetKeyBind(const struct FString& BindKeyName, const struct FString& BindKeyValue);
	struct FString STATIC_GetQuitPage();
	struct FString STATIC_GetSettingsPage();
	struct FString STATIC_GetModPage();
	struct FString STATIC_GetInstantActionPage();
	struct FString STATIC_GetMultiplayerPage();
	struct FString STATIC_GetServerBrowserPage();
	struct FString STATIC_GetSinglePlayerPage();
	struct FString STATIC_GetMainMenuClass();
	void STATIC_Validate();
	void ConsolidateMenus();
	void PurgeComponentClasses();
	void PurgeObjectReferences();
	void VerifyStack();
	void CloseOverlays();
	void NotifyLevelChange();
	void SetRequiredGameResolution(const struct FString& GameRes);
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
	void PushMenu(int Index, class UGUIPage* NewMenu, const struct FString& Param1, const struct FString& Param2);
	void ReplaceMenu2(const struct FString& NewMenuName, bool bCancelled);
	void ReplaceMenu2_FadedOut();
	void CloseMenuPage(class UGUIPage* SelectPage, bool bCancelled);
	bool ReplaceMenu(const struct FString& NewMenuName, const struct FString& Param1, const struct FString& Param2, bool bCancelled);
	void AutoLoadMenus();
	bool OpenMenuByObject(class UGUIPage* NewMenu, const struct FString& Param1, const struct FString& Param2);
	bool OpenMenu(const struct FString& NewMenuName, const struct FString& Param1, const struct FString& Param2);
	class UGUIPage* CreateMenu(const struct FString& NewMenuName);
	class UGUIPage* GetLastMenu();
	void LogControlInfo(class UGUIComponent* Sender);
	void LogControllerInfo();
	void LogMenuStack();
	class UGUIPage* GetMenuByIndex(int Index);
	class UGUIPage* FindMenuByClass(class UClass* PageClass);
	class UGUIPage* FindPersistentMenuByClass(class UClass* PageClass);
	int FindPersistentMenuIndex(class UGUIPage* Menu);
	int FindMenuIndex(class UGUIPage* Menu);
	int FindMenuIndexByName(const struct FString& MenuClass);
	class UGUIPage* FindPersistentMenuByName(const struct FString& MenuClass);
	class UClass* AddComponentClass(const struct FString& ClassName);
	bool RegisterStyle(class UClass* StyleClass, bool bTemporary);
	void PrecachePlayerRecords();
	void InitializeController();
	class UGUIPage* TopPage();
	void GetTeamSymbolList(bool bNoSinglePlayer, TArray<struct FString>* SymbolNames);
	struct FString LoadDecoText(const struct FString& PackageName, const struct FString& DecoTextName);
	bool CheckForECE();
	bool AuthroizeFirewall();
	bool CheckFirewall();
	void LaunchURL(const struct FString& URL);
	void GetMapList(const struct FString& Prefix, class UGUIList* List, bool bDecoText);
	void GetWeaponList(TArray<class UClass*>* WeaponClass, TArray<struct FString>* WeaponDesc);
	void SaveOwnageList(TArray<struct FeOwnageMap> Maps);
	void GetOwnageList(TArray<int>* RLevel, TArray<struct FString>* MNames, TArray<struct FString>* MDesc, TArray<struct FString>* mURL);
	bool GetDEMHeader(const struct FString& DemoName, struct FString* MapName, struct FString* GameType, int* ScoreLimit, int* TimeLimit, int* ClientSide, struct FString* RecordedBy, struct FString* TimeStamp, struct FString* ReqPackages);
	void GetDEMList(TArray<struct FString>* DEMFiles);
	void Profile(const struct FString& ProfileName);
	void SetMoveControl(class UGUIComponent* C);
	void PlayInterfaceSound(TEnumAsByte<EClickSound> soundType);
	void GetOGGList(TArray<struct FString>* OGGFiles);
	void ResetKeyboard();
	void GetProfileList(const struct FString& Prefix, TArray<struct FString>* ProfileList);
	void ResetInput();
	void ResetDesigner();
	bool SetRenderDevice(const struct FString& NewRenderDevice);
	struct FString GetCurrentRes();
	class UGUIStyles* GetStyle(const struct FString& StyleName, TEnumAsByte<EeFontScale>* FontScale);
	class UGUIFont* GetMenuFont(const struct FString& FontName);
	void AddBuddy(const struct FString& NewBuddyName);
	bool OnNeedRawKeyPress(unsigned char NewKey);
	void PopPage();
	void PushPage();
};


// Class XInterface.GUIButton
// 0x0038 (0x02F4 - 0x02BC)
class UGUIButton : public UGUIComponent
{
public:
	TEnumAsByte<EeTextAlign>                           CaptionAlign;                                             // 0x02BC(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x02BD(0x0003) MISSED OFFSET
	class UGUIStyles*                                  CaptionEffectStyle;                                       // 0x02C0(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, EditInline)
	struct FString                                     CaptionEffectStyleName;                                   // 0x02C4(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Caption;                                                  // 0x02D0(0x000C) (Edit, Localized, NeedCtorLink)
	struct FPaddingPercent                             AutoSizePadding;                                          // 0x02DC(0x0008) (Edit)
	struct FString                                     SizingCaption;                                            // 0x02E4(0x000C) (Edit, NeedCtorLink)
	unsigned long                                      bAutoSize : 1;                                            // 0x02F0(0x0004) (Edit)
	unsigned long                                      bAutoShrink : 1;                                          // 0x02F0(0x0004) (Edit)
	unsigned long                                      bWrapCaption : 1;                                         // 0x02F0(0x0004) (Edit)
	unsigned long                                      bUseCaptionHeight : 1;                                    // 0x02F0(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIButton");
		return ptr;
	}


	bool InternalOnKeyEvent(float Delta, unsigned char* key, unsigned char* State);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class XInterface.StateButton
// 0x0018 (0x030C - 0x02F4)
class UStateButton : public UGUIButton
{
public:
	unsigned char                                      UnknownData00[0x18];                                      // 0x02F4(0x0018) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.StateButton");
		return ptr;
	}

};


// Class XInterface.GUIToolTip
// 0x0078 (0x0334 - 0x02BC)
class UGUIToolTip : public UGUIComponent
{
public:
	unsigned long                                      bResetPosition : 1;                                       // 0x02BC(0x0004) (Edit)
	unsigned long                                      bTrackMouse : 1;                                          // 0x02BC(0x0004) (Edit)
	unsigned long                                      bMultiLine : 1;                                           // 0x02BC(0x0004) (Edit)
	unsigned long                                      bTrackInput : 1;                                          // 0x02BC(0x0004) (Edit)
	struct FString                                     Text;                                                     // 0x02C0(0x000C) (Edit, Const, NeedCtorLink)
	TArray<struct FString>                             Lines;                                                    // 0x02CC(0x000C) (Edit, Const, NeedCtorLink)
	float                                              StartTime;                                                // 0x02D8(0x0004) (Edit, NoExport)
	float                                              CurrentTime;                                              // 0x02DC(0x0004) (Edit, NoExport)
	float                                              MaxWidth;                                                 // 0x02E0(0x0004) (Edit, Config, GlobalConfig)
	float                                              InitialDelay;                                             // 0x02E4(0x0004) (Edit, Config, GlobalConfig)
	float                                              ExpirationSeconds;                                        // 0x02E8(0x0004) (Edit, Config, GlobalConfig)
	struct FScriptDelegate                             __EnterArea__Delegate;                                    // 0x02EC(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __LeaveArea__Delegate;                                    // 0x02F4(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __Tick__Delegate;                                         // 0x02FC(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __ShowToolTip__Delegate;                                  // 0x0304(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __HideToolTip__Delegate;                                  // 0x030C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __GetLeft__Delegate;                                      // 0x0314(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __GetTop__Delegate;                                       // 0x031C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __GetWidth__Delegate;                                     // 0x0324(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __GetHeight__Delegate;                                    // 0x032C(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIToolTip");
		return ptr;
	}


	void SetTip(const struct FString& NewTip);
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


// Class XInterface.GUIContextMenu
// 0x0048 (0x0304 - 0x02BC)
class UGUIContextMenu : public UGUIComponent
{
public:
	TArray<struct FString>                             ContextItems;                                             // 0x02BC(0x000C) (Localized, NeedCtorLink)
	int                                                ItemIndex;                                                // 0x02C8(0x0004)
	struct FString                                     SelectionStyleName;                                       // 0x02CC(0x000C) (NeedCtorLink)
	class UGUIStyles*                                  SelectionStyle;                                           // 0x02D8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                ItemHeight;                                               // 0x02DC(0x0004)
	unsigned long                                      bAutoItemHeight : 1;                                      // 0x02E0(0x0004)
	struct FScriptDelegate                             __OnOpen__Delegate;                                       // 0x02E4(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnClose__Delegate;                                      // 0x02EC(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnSelect__Delegate;                                     // 0x02F4(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnContextHitTest__Delegate;                             // 0x02FC(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIContextMenu");
		return ptr;
	}


	bool ReplaceItem(int Index, const struct FString& NewItem);
	bool RemoveItemByIndex(int Index);
	bool RemoveItemByName(const struct FString& ItemName);
	int InsertItem(const struct FString& NewItem, int Index);
	int AddItem(const struct FString& NewItem);
	bool OnContextHitTest(float MouseX, float MouseY);
	void OnSelect(class UGUIContextMenu* Sender, int ClickIndex);
	bool OnClose(class UGUIContextMenu* Sender);
	bool OnOpen(class UGUIContextMenu* Sender);
};


// Class XInterface.GUIProgressBar
// 0x0058 (0x0314 - 0x02BC)
class UGUIProgressBar : public UGUIComponent
{
public:
	unsigned char                                      UnknownData00[0x58];                                      // 0x02BC(0x0058) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIProgressBar");
		return ptr;
	}

};


// Class XInterface.CoolImage
// 0x0030 (0x02EC - 0x02BC)
class UCoolImage : public UGUIComponent
{
public:
	unsigned char                                      UnknownData00[0x30];                                      // 0x02BC(0x0030) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.CoolImage");
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
	TEnumAsByte<EeImgStyle>                            ImageStyle;                                               // 0x02C8(0x0001) (Edit)
	TEnumAsByte<EMenuRenderStyle>                      ImageRenderStyle;                                         // 0x02C9(0x0001) (Edit)
	TEnumAsByte<EeImgAlign>                            ImageAlign;                                               // 0x02CA(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x1];                                       // 0x02CB(0x0001) MISSED OFFSET
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


	struct FString AdditionalDebugString();
};


// Class XInterface.GUISectionBackground
// 0x0078 (0x0374 - 0x02FC)
class UGUISectionBackground : public UGUIImage
{
public:
	class UGUIStyles*                                  CaptionStyle;                                             // 0x02FC(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	struct FString                                     CaptionStyleName;                                         // 0x0300(0x000C) (Edit, NeedCtorLink)
	int                                                AltCaptionOffset[0x4];                                    // 0x030C(0x0004) (Edit)
	TEnumAsByte<EeTextAlign>                           AltCaptionAlign;                                          // 0x031C(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x031D(0x0003) MISSED OFFSET
	unsigned long                                      bAltCaption : 1;                                          // 0x0320(0x0004) (Edit)
	unsigned long                                      bRemapStack : 1;                                          // 0x0320(0x0004) (Edit)
	unsigned long                                      bFillClient : 1;                                          // 0x0320(0x0004) (Edit)
	TArray<class UGUIComponent*>                       AlignStack;                                               // 0x0324(0x000C) (Edit, NeedCtorLink, NoExport, EditInline, DataBinding)
	class UMaterial*                                   HeaderTop;                                                // 0x0330(0x0004) (Edit)
	class UMaterial*                                   HeaderBar;                                                // 0x0334(0x0004) (Edit)
	class UMaterial*                                   HeaderBase;                                               // 0x0338(0x0004) (Edit)
	struct FString                                     Caption;                                                  // 0x033C(0x000C) (Edit, Localized, NeedCtorLink)
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


// Class XInterface.GUISlider
// 0x0050 (0x030C - 0x02BC)
class UGUISlider : public UGUIComponent
{
public:
	unsigned char                                      UnknownData00[0x50];                                      // 0x02BC(0x0050) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUISlider");
		return ptr;
	}

};


// Class XInterface.GUIPanel
// 0x0010 (0x0310 - 0x0300)
class UGUIPanel : public UGUIMultiComponent
{
public:
	class UMaterial*                                   Background;                                               // 0x0300(0x0004) (Edit)
	unsigned long                                      SetControlsBoundToParent : 1;                             // 0x0304(0x0004)
	unsigned long                                      SetControlsScaleToParent : 1;                             // 0x0304(0x0004)
	struct FScriptDelegate                             __OnPostDraw__Delegate;                                   // 0x0308(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIPanel");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool OnPostDraw(class UCanvas* Canvas);
};


// Class XInterface.GUISplitter
// 0x003C (0x034C - 0x0310)
class UGUISplitter : public UGUIPanel
{
public:
	unsigned char                                      UnknownData00[0x3C];                                      // 0x0310(0x003C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUISplitter");
		return ptr;
	}

};


// Class XInterface.GUIMenuOption
// 0x004C (0x034C - 0x0300)
class UGUIMenuOption : public UGUIMultiComponent
{
public:
	unsigned long                                      bIgnoreChange : 1;                                        // 0x0300(0x0004) (Edit, EditConst)
	unsigned long                                      bValueReadOnly : 1;                                       // 0x0300(0x0004) (Edit)
	unsigned long                                      bAutoSizeCaption : 1;                                     // 0x0300(0x0004) (Edit)
	unsigned long                                      bHeightFromComponent : 1;                                 // 0x0300(0x0004) (Edit)
	unsigned long                                      bFlipped : 1;                                             // 0x0300(0x0004) (Edit)
	unsigned long                                      bSquare : 1;                                              // 0x0300(0x0004) (Edit)
	unsigned long                                      bVerticalLayout : 1;                                      // 0x0300(0x0004) (Edit)
	TEnumAsByte<EeTextAlign>                           LabelJustification;                                       // 0x0304(0x0001) (Edit)
	TEnumAsByte<EeTextAlign>                           ComponentJustification;                                   // 0x0305(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x2];                                       // 0x0306(0x0002) MISSED OFFSET
	float                                              CaptionWidth;                                             // 0x0308(0x0004) (Edit)
	float                                              ComponentWidth;                                           // 0x030C(0x0004) (Edit)
	struct FString                                     Caption;                                                  // 0x0310(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     ComponentClassName;                                       // 0x031C(0x000C) (Edit, NeedCtorLink)
	struct FString                                     LabelFont;                                                // 0x0328(0x000C) (Edit, NeedCtorLink)
	struct FString                                     LabelStyleName;                                           // 0x0334(0x000C) (Edit, NeedCtorLink)
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
	void SetCaption(const struct FString& NewCaption);
	void SetHint(const struct FString& NewHint);
	void SetReadOnly(bool bValue);
	void ResetComponent();
	struct FString GetComponentValue();
	void SetComponentValue(const struct FString& NewValue, bool bNoChange);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class XInterface.GUIComboBox
// 0x0040 (0x0340 - 0x0300)
class UGUIComboBox : public UGUIMultiComponent
{
public:
	unsigned long                                      bReadOnly : 1;                                            // 0x0300(0x0004) (Edit)
	unsigned long                                      bValueReadOnly : 1;                                       // 0x0300(0x0004) (Edit)
	unsigned long                                      bIgnoreChangeWhenTyping : 1;                              // 0x0300(0x0004) (Edit)
	unsigned long                                      bShowListOnFocus : 1;                                     // 0x0300(0x0004) (Edit)
	int                                                MaxVisibleItems;                                          // 0x0304(0x0004) (Edit)
	int                                                Index;                                                    // 0x0308(0x0004) (Edit, EditConst)
	struct FString                                     TextStr;                                                  // 0x030C(0x000C) (Edit, EditConst, NeedCtorLink)
	class UGUIList*                                    List;                                                     // 0x0318(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, EditInline)
	class UGUIEditBox*                                 Edit;                                                     // 0x031C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIScrollButtonBase*                        MyShowListBtn;                                            // 0x0320(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIListBox*                                 MyListBox;                                                // 0x0324(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UMaterial*                                   GraphicOnShow;                                            // 0x0328(0x0004)
	class UMaterial*                                   GraphicOnHide;                                            // 0x032C(0x0004)
	struct FScriptDelegate                             __OnShowList__Delegate;                                   // 0x0330(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnHideList__Delegate;                                   // 0x0338(0x000C) (NeedCtorLink)

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
	int FindIndex(const struct FString& Test, bool bExact, bool bExtra, class UObject* obj);
	int FindExtra(const struct FString& Text, bool bExact);
	struct FString Find(const struct FString& Text, bool bExact, bool bExtra);
	class UObject* GetItemObject(int Index);
	struct FString GetItem(int Index);
	void RemoveItem(int Item, int Count);
	void AddItem(const struct FString& Item, class UObject* Extra, const struct FString& str);
	int GetIndex();
	void SetIndex(int i);
	struct FString GetExtra();
	class UObject* GetObject();
	struct FString GetText();
	struct FString Get();
	void SetExtra(const struct FString& NewExtra, bool bListItemsOnly);
	void SetText(const struct FString& NewText, bool bListItemsOnly);
	void TextChanged(class UGUIComponent* Sender);
	void ItemChanged(class UGUIComponent* Sender);
	bool ShowListBox(class UGUIComponent* Sender);
	void SetVisibility(bool bIsVisible);
	void HideListBox();
	void InternalOnLoadINI(class UGUIComponent* Sender, const struct FString& S);
	struct FString InternalOnSaveINI(class UGUIComponent* Sender);
	bool InternalListClick(class UGUIComponent* Sender);
	void InternalEditPressed(class UGUIComponent* Sender, bool bRepeat);
	void InternalOnInvalidate(class UGUIComponent* Who);
	void InternalListDeActivate();
	bool InternalOnKeyEvent(float Delta, unsigned char* key, unsigned char* State);
	void SetHint(const struct FString& NewHint);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void OnHideList();
	void OnShowList();
};


// Class XInterface.GUIGFXButton
// 0x0010 (0x0304 - 0x02F4)
class UGUIGFXButton : public UGUIButton
{
public:
	int                                                ImageIndex;                                               // 0x02F4(0x0004) (Edit)
	class UMaterial*                                   Graphic;                                                  // 0x02F8(0x0004) (Edit)
	TEnumAsByte<EeIconPosition>                        Position;                                                 // 0x02FC(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x02FD(0x0003) MISSED OFFSET
	unsigned long                                      bCheckBox : 1;                                            // 0x0300(0x0004) (Edit)
	unsigned long                                      bClientBound : 1;                                         // 0x0300(0x0004) (Edit)
	unsigned long                                      bChecked : 1;                                             // 0x0300(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIGFXButton");
		return ptr;
	}


	bool InternalOnClick(class UGUIComponent* Sender);
	void SetChecked(bool bNewChecked);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
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


// Class XInterface.GUIScrollZoneBase
// 0x0008 (0x02C4 - 0x02BC)
class UGUIScrollZoneBase : public UGUIComponent
{
public:
	struct FScriptDelegate                             __OnScrollZoneClick__Delegate;                            // 0x02BC(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIScrollZoneBase");
		return ptr;
	}


	bool InternalOnClick(class UGUIComponent* Sender);
	void OnScrollZoneClick(float Delta);
};


// Class XInterface.GUIScrollButtonBase
// 0x0004 (0x0308 - 0x0304)
class UGUIScrollButtonBase : public UGUIGFXButton
{
public:
	unsigned long                                      bIncreaseButton : 1;                                      // 0x0304(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIScrollButtonBase");
		return ptr;
	}

};


// Class XInterface.GUIScrollBarBase
// 0x0058 (0x0358 - 0x0300)
class UGUIScrollBarBase : public UGUIMultiComponent
{
public:
	TEnumAsByte<EOrientation>                          Orientation;                                              // 0x0300(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0301(0x0003) MISSED OFFSET
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
	unsigned long                                      bScrollStyle : 1;                                         // 0x032C(0x0004)
	class UGUIScrollZoneBase*                          MyScrollZone;                                             // 0x0330(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIScrollButtonBase*                        MyIncreaseButton;                                         // 0x0334(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIScrollButtonBase*                        MyDecreaseButton;                                         // 0x0338(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIGripButtonBase*                          MyGripButton;                                             // 0x033C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FScriptDelegate                             __PositionChanged__Delegate;                              // 0x0340(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __MoveGripBy__Delegate;                                   // 0x0348(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __AlignThumb__Delegate;                                   // 0x0350(0x000C) (NeedCtorLink)

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


// Class XInterface.GUIFloatEdit
// 0x0028 (0x0328 - 0x0300)
class UGUIFloatEdit : public UGUIMultiComponent
{
public:
	unsigned char                                      UnknownData00[0x28];                                      // 0x0300(0x0028) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIFloatEdit");
		return ptr;
	}

};


// Class XInterface.GUINumericEdit
// 0x0028 (0x0328 - 0x0300)
class UGUINumericEdit : public UGUIMultiComponent
{
public:
	unsigned char                                      UnknownData00[0x28];                                      // 0x0300(0x0028) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUINumericEdit");
		return ptr;
	}

};


// Class XInterface.GUIEditBox
// 0x0074 (0x0368 - 0x02F4)
class UGUIEditBox : public UGUIButton
{
public:
	int                                                MaxTextStrNum;                                            // 0x02F4(0x0004)
	struct FString                                     IMEText;                                                  // 0x02F8(0x000C) (NeedCtorLink)
	int                                                IMESelPosStart;                                           // 0x0304(0x0004)
	int                                                IMESelPosEnd;                                             // 0x0308(0x0004)
	int                                                IMECompSize;                                              // 0x030C(0x0004)
	struct FString                                     TextStr;                                                  // 0x0310(0x000C) (Edit, NeedCtorLink)
	struct FString                                     AllowedCharSet;                                           // 0x031C(0x000C) (Edit, NeedCtorLink)
	unsigned long                                      bMaskText : 1;                                            // 0x0328(0x0004) (Edit)
	unsigned long                                      bIntOnly : 1;                                             // 0x0328(0x0004) (Edit)
	unsigned long                                      bFloatOnly : 1;                                           // 0x0328(0x0004) (Edit)
	unsigned long                                      bIncludeSign : 1;                                         // 0x0328(0x0004) (Edit)
	unsigned long                                      bConvertSpaces : 1;                                       // 0x0328(0x0004) (Edit)
	int                                                MaxWidth;                                                 // 0x032C(0x0004) (Edit)
	TEnumAsByte<EeTextCase>                            TextCase;                                                 // 0x0330(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0331(0x0003) MISSED OFFSET
	int                                                BorderOffsets[0x4];                                       // 0x0334(0x0004) (Edit)
	unsigned long                                      bReadOnly : 1;                                            // 0x0344(0x0004) (Edit)
	unsigned long                                      bAlwaysNotify : 1;                                        // 0x0344(0x0004) (Edit)
	int                                                CaretPos;                                                 // 0x0348(0x0004)
	int                                                FirstVis;                                                 // 0x034C(0x0004)
	int                                                LastSizeX;                                                // 0x0350(0x0004)
	int                                                LastCaret;                                                // 0x0354(0x0004)
	int                                                LastLength;                                               // 0x0358(0x0004)
	unsigned long                                      bAllSelected : 1;                                         // 0x035C(0x0004)
	unsigned char                                      LastKey;                                                  // 0x0360(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x0361(0x0003) MISSED OFFSET
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
	struct FString GetText();
	struct FString ConvertIllegal(const struct FString& inputstr);
	bool InternalOnKeyEvent(float Delta, unsigned char* key, unsigned char* State);
	bool InternalOnKeyType(const struct FString& Unicode, unsigned char* key);
	void DeleteChar();
	void SetText(const struct FString& NewText);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool OnIME_Notify(int Type, int LangID, const struct FString& strText, int nStartPos, int nSize);
};


// Class XInterface.GUISpinnerButton
// 0x0010 (0x0304 - 0x02F4)
class UGUISpinnerButton : public UGUIButton
{
public:
	unsigned char                                      UnknownData00[0x10];                                      // 0x02F4(0x0010) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUISpinnerButton");
		return ptr;
	}

};


// Class XInterface.GUICheckBoxButton
// 0x002C (0x0330 - 0x0304)
class UGUICheckBoxButton : public UGUIGFXButton
{
public:
	unsigned char                                      UnknownData00[0x2C];                                      // 0x0304(0x002C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUICheckBoxButton");
		return ptr;
	}

};


// Class XInterface.GUITabPanel
// 0x0020 (0x0330 - 0x0310)
class UGUITabPanel : public UGUIPanel
{
public:
	struct FString                                     PanelCaption;                                             // 0x0310(0x000C) (Edit, Localized, NeedCtorLink)
	unsigned long                                      bFillHeight : 1;                                          // 0x031C(0x0004) (Edit)
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


// Class XInterface.GUITabButton
// 0x0008 (0x02FC - 0x02F4)
class UGUITabButton : public UGUIButton
{
public:
	unsigned long                                      bForceFlash : 1;                                          // 0x02F4(0x0004)
	unsigned long                                      bActive : 1;                                              // 0x02F4(0x0004)
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


// Class XInterface.GUITabControl
// 0x004C (0x034C - 0x0300)
class UGUITabControl : public UGUIMultiComponent
{
public:
	unsigned long                                      bFillSpace : 1;                                           // 0x0300(0x0004) (Edit)
	unsigned long                                      bDockPanels : 1;                                          // 0x0300(0x0004) (Edit)
	unsigned long                                      bDrawTabAbove : 1;                                        // 0x0300(0x0004) (Edit)
	unsigned long                                      bFillBackground : 1;                                      // 0x0300(0x0004) (Edit)
	struct FColor                                      FillColor;                                                // 0x0304(0x0004) (Edit)
	float                                              FadeInTime;                                               // 0x0308(0x0004) (Edit)
	float                                              TabHeight;                                                // 0x030C(0x0004) (Edit)
	struct FString                                     BackgroundStyleName;                                      // 0x0310(0x000C) (Edit, NeedCtorLink)
	class UMaterial*                                   BackgroundImage;                                          // 0x031C(0x0004) (Edit)
	TArray<class UGUITabButton*>                       TabStack;                                                 // 0x0320(0x000C) (Edit, EditConst, NeedCtorLink, NoExport)
	class UGUITabButton*                               ActiveTab;                                                // 0x032C(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	class UGUITabButton*                               PendingTab;                                               // 0x0330(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	class UGUIStyles*                                  BackgroundStyle;                                          // 0x0334(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	class UGUIBorder*                                  MyFooter;                                                 // 0x0338(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	unsigned long                                      bForceManualTabButtonStyle : 1;                           // 0x033C(0x0004) (Edit)
	struct FString                                     ManualTabButtonStyleName;                                 // 0x0340(0x000C) (Edit, NeedCtorLink)

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
	class UGUITabPanel* BorrowPanel(const struct FString& Caption);
	class UGUITabPanel* FindPanelClass(class UClass* PanelClass);
	int TabIndex(const struct FString& tabname);
	bool PrevControl(class UGUIComponent* Sender);
	bool NextControl(class UGUIComponent* Sender);
	bool PrevPage();
	bool NextPage();
	bool InternalTabClick(class UGUIComponent* Sender);
	bool ActivateTabByPanel(class UGUITabPanel* Panel, bool bFocusPanel);
	bool ActivateTabByName(const struct FString& tabname, bool bFocusPanel);
	bool ActivateTab(class UGUITabButton* Who, bool bFocusPanel);
	void MakeTabActive(class UGUITabButton* Who);
	bool LostActiveTab();
	void RemoveTab(const struct FString& Caption, class UGUITabButton* Who);
	class UGUITabPanel* ReplaceTab(class UGUITabButton* Which, const struct FString& Caption, const struct FString& PanelClass, class UGUITabPanel* ExistingPanel, const struct FString& InHint, bool bForceActive);
	class UGUITabPanel* InsertTab(int pos, const struct FString& Caption, const struct FString& PanelClass, class UGUITabPanel* ExistingPanel, const struct FString& InHint, bool bForceActive);
	class UGUITabPanel* AddTab(const struct FString& InCaption, const struct FString& PanelClass, class UGUITabPanel* ExistingPanel, const struct FString& InHint, bool bForceActive);
	class UGUITabPanel* AddTabItem(const struct FGUITabItem& Item);
	bool InternalOnKeyEvent(float Delta, unsigned char* key, unsigned char* State);
	void Closed(class UGUIComponent* Sender, bool bCancelled);
	void Opened(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class XInterface.GUIBorder
// 0x0014 (0x0314 - 0x0300)
class UGUIBorder : public UGUIMultiComponent
{
public:
	struct FString                                     Caption;                                                  // 0x0300(0x000C) (Edit, Localized, NeedCtorLink)
	TEnumAsByte<EeTextAlign>                           Justification;                                            // 0x030C(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x030D(0x0003) MISSED OFFSET
	int                                                TextIndent;                                               // 0x0310(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIBorder");
		return ptr;
	}


	struct FString GetCaption();
	void SetCaption(const struct FString& NewCaption);
};


// Class XInterface.GUITitleBar
// 0x0010 (0x0324 - 0x0314)
class UGUITitleBar : public UGUIBorder
{
public:
	class UGUITabControl*                              DockedTabs;                                               // 0x0314(0x0004) (ExportObject, NeedCtorLink, EditInline)
	TEnumAsByte<EePageAlign>                           DockAlign;                                                // 0x0318(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0319(0x0003) MISSED OFFSET
	unsigned long                                      bUseTextHeight : 1;                                       // 0x031C(0x0004) (Edit)
	unsigned long                                      bDockTop : 1;                                             // 0x031C(0x0004) (Edit)
	class UMaterial*                                   Effect;                                                   // 0x0320(0x0004) (Const)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUITitleBar");
		return ptr;
	}

};


// Class XInterface.GUILabel
// 0x0050 (0x030C - 0x02BC)
class UGUILabel : public UGUIComponent
{
public:
	struct FString                                     Caption;                                                  // 0x02BC(0x000C) (Edit, Localized, NeedCtorLink)
	TEnumAsByte<EeTextAlign>                           TextAlign;                                                // 0x02C8(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x02C9(0x0003) MISSED OFFSET
	struct FColor                                      TextColor;                                                // 0x02CC(0x0004) (Edit)
	struct FColor                                      FocusedTextColor;                                         // 0x02D0(0x0004) (Edit)
	TEnumAsByte<EMenuRenderStyle>                      TextStyle;                                                // 0x02D4(0x0001) (Edit)
	unsigned char                                      UnknownData01[0x3];                                       // 0x02D5(0x0003) MISSED OFFSET
	struct FString                                     TextFont;                                                 // 0x02D8(0x000C) (Edit, NeedCtorLink)
	unsigned long                                      bTransparent : 1;                                         // 0x02E4(0x0004) (Edit)
	unsigned long                                      bMultiLine : 1;                                           // 0x02E4(0x0004) (Edit)
	TEnumAsByte<EeTextAlign>                           VertAlign;                                                // 0x02E8(0x0001) (Edit)
	unsigned char                                      UnknownData02[0x3];                                       // 0x02E9(0x0003) MISSED OFFSET
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


// Class XInterface.GUIPage
// 0x0064 (0x0364 - 0x0300)
class UGUIPage : public UGUIMultiComponent
{
public:
	unsigned long                                      bRenderWorld : 1;                                         // 0x0300(0x0004) (Edit)
	unsigned long                                      bPauseIfPossible : 1;                                     // 0x0300(0x0004) (Edit)
	unsigned long                                      bCheckResolution : 1;                                     // 0x0300(0x0004) (Edit)
	unsigned long                                      bCaptureInput : 1;                                        // 0x0300(0x0004) (Edit)
	unsigned long                                      bRequire640x480 : 1;                                      // 0x0300(0x0004) (Edit)
	unsigned long                                      bPersistent : 1;                                          // 0x0300(0x0004) (Edit)
	unsigned long                                      bDisconnectOnOpen : 1;                                    // 0x0300(0x0004) (Edit)
	unsigned long                                      bAllowedAsLast : 1;                                       // 0x0300(0x0004) (Edit)
	unsigned long                                      bRestorable : 1;                                          // 0x0300(0x0004) (Edit)
	unsigned long                                      bUseMyInactiveFadeColor : 1;                              // 0x0300(0x0004) (Edit)
	class UGUIPage*                                    ParentPage;                                               // 0x0304(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, NoExport, EditInline)
	class UMaterial*                                   Background;                                               // 0x0308(0x0004) (Edit)
	struct FColor                                      BackgroundColor;                                          // 0x030C(0x0004) (Edit)
	struct FColor                                      InactiveFadeColor;                                        // 0x0310(0x0004) (Edit)
	struct FColor                                      ActiveFadeColor;                                          // 0x0314(0x0004) (Edit)
	class USound*                                      OpenSound;                                                // 0x0318(0x0004) (Edit)
	class USound*                                      CloseSound;                                               // 0x031C(0x0004) (Edit)
	TEnumAsByte<EMenuRenderStyle>                      BackgroundRStyle;                                         // 0x0320(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0321(0x0003) MISSED OFFSET
	struct FScriptDelegate                             __OnOpen__Delegate;                                       // 0x0324(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnReOpen__Delegate;                                     // 0x032C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnClose__Delegate;                                      // 0x0334(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnCanClose__Delegate;                                   // 0x033C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __FadedIn__Delegate;                                      // 0x0344(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __FadedOut__Delegate;                                     // 0x034C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __GetFocus__Delegate;                                     // 0x0354(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __LostFocus__Delegate;                                    // 0x035C(0x000C) (NeedCtorLink)

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
	bool AllowOpen(const struct FString& MenuClass);
	bool IsOpen();
	void free();
	bool NotifyLevelChange();
	void SetDataString(const struct FString& str);
	struct FString GetDataString();
	void HandleObject(class UObject* obj, class UObject* OptionalObj_1, class UObject* OptionalObj_2);
	bool GetRestoreParams(struct FString* Param1, struct FString* Param2);
	void HandleParameters(const struct FString& Param1, const struct FString& Param2);
	void SetFocus(class UGUIComponent* Who);
	void ChangeHint(const struct FString& NewHint);
	void CheckResolution(bool Closing, class UGUIController* InController);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void Closed(class UGUIComponent* Sender, bool bCancelled);
	bool OnCanClose(bool bCancelled);
	void OnClose(bool bCancelled);
	void OnReOpen();
	void OnOpen();
};


// Class XInterface.BTTcpHandler_DS_Script
// 0x0010 (0x0044 - 0x0034)
class UBTTcpHandler_DS_Script : public UBTTcpHandler_DS_Script_Interface
{
public:
	unsigned char                                      UnknownData00[0x10];                                      // 0x0034(0x0010) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.BTTcpHandler_DS_Script");
		return ptr;
	}

};


// Class XInterface.GUIListBase
// 0x00C8 (0x0384 - 0x02BC)
class UGUIListBase : public UGUIComponent
{
public:
	unsigned long                                      bSorted : 1;                                              // 0x02BC(0x0004) (Edit)
	unsigned long                                      bHotTrack : 1;                                            // 0x02BC(0x0004) (Edit)
	unsigned long                                      bHotTrackSound : 1;                                       // 0x02BC(0x0004) (Edit)
	unsigned long                                      bHotTrackStrictMode : 1;                                  // 0x02BC(0x0004) (Edit)
	unsigned long                                      bHotTrackOnInactive : 1;                                  // 0x02BC(0x0004) (Edit)
	unsigned long                                      bDrawSelectionBorder : 1;                                 // 0x02BC(0x0004) (Edit)
	unsigned long                                      bVisibleWhenEmpty : 1;                                    // 0x02BC(0x0004) (Edit)
	unsigned long                                      bNotify : 1;                                              // 0x02BC(0x0004) (Edit)
	unsigned long                                      bInitializeList : 1;                                      // 0x02BC(0x0004) (Edit)
	unsigned long                                      bMultiSelect : 1;                                         // 0x02BC(0x0004) (Edit)
	unsigned long                                      bAllowEmptyItems : 1;                                     // 0x02BC(0x0004) (Edit)
	class UGUIScrollBarBase*                           MyScrollBar;                                              // 0x02C0(0x0004) (Edit, ExportObject, NeedCtorLink, NoExport, EditInline)
	unsigned long                                      bAlwaysShowScrollbar : 1;                                 // 0x02C4(0x0004) (Edit)
	unsigned long                                      bForceScrollBarPosition : 1;                              // 0x02C4(0x0004) (Edit)
	float                                              ForcedScrollbarWinLeft;                                   // 0x02C8(0x0004) (Edit)
	float                                              ForcedScrollbarWinTop;                                    // 0x02CC(0x0004) (Edit)
	float                                              ForcedScrollbarWinWidth;                                  // 0x02D0(0x0004) (Edit)
	float                                              ForcedScrollbarWinHeight;                                 // 0x02D4(0x0004) (Edit)
	struct FString                                     SelectedStyleName;                                        // 0x02D8(0x000C) (Edit, NeedCtorLink)
	struct FString                                     SectionStyleName;                                         // 0x02E4(0x000C) (Edit, NeedCtorLink)
	struct FString                                     OutlineStyleName;                                         // 0x02F0(0x000C) (Edit, NeedCtorLink)
	class UGUIStyles*                                  SelectedStyle;                                            // 0x02FC(0x0004) (Edit, ExportObject, NeedCtorLink, NoExport, EditInline)
	class UGUIStyles*                                  SectionStyle;                                             // 0x0300(0x0004) (Edit, ExportObject, NeedCtorLink, NoExport, EditInline)
	class UGUIStyles*                                  OutlineStyle;                                             // 0x0304(0x0004) (Edit, ExportObject, NeedCtorLink, NoExport, EditInline)
	TEnumAsByte<EeTextAlign>                           SectionJustification;                                     // 0x0308(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0309(0x0003) MISSED OFFSET
	class UMaterial*                                   SelectedImage;                                            // 0x030C(0x0004) (Edit)
	struct FColor                                      SelectedBKColor;                                          // 0x0310(0x0004) (Edit)
	int                                                Top;                                                      // 0x0314(0x0004) (Edit, EditConst, NoExport)
	int                                                Index;                                                    // 0x0318(0x0004) (Edit, EditConst, NoExport)
	int                                                ItemsPerPage;                                             // 0x031C(0x0004) (Edit, Const, EditConst, NoExport)
	float                                              ItemHeight;                                               // 0x0320(0x0004) (Edit, EditConst, NoExport)
	float                                              ItemWidth;                                                // 0x0324(0x0004) (Edit, EditConst, NoExport)
	int                                                ItemCount;                                                // 0x0328(0x0004) (Edit, EditConst, NoExport)
	TArray<int>                                        SelectedItems;                                            // 0x032C(0x000C) (Edit, EditConst, NeedCtorLink, NoExport)
	int                                                LastSelected;                                             // 0x0338(0x0004) (Edit, EditConst, NoExport)
	int                                                LastPressX;                                               // 0x033C(0x0004) (Edit, EditConst, NoExport)
	int                                                LastPressY;                                               // 0x0340(0x0004) (Edit, EditConst, NoExport)
	int                                                DropIndex;                                                // 0x0344(0x0004) (Edit, EditConst, NoExport)
	int                                                MightRemove;                                              // 0x0348(0x0004) (Edit, EditConst, NoExport)
	TArray<class UGUIComponent*>                       LinkedObjects;                                            // 0x034C(0x000C) (Edit, EditFixedSize, NeedCtorLink, NoExport)
	unsigned long                                      bMousePress : 1;                                          // 0x0358(0x0004)
	unsigned long                                      bMouseRelease : 1;                                        // 0x0358(0x0004)
	struct FScriptDelegate                             __OnScrollBy__Delegate;                                   // 0x035C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnDrawItem__Delegate;                                   // 0x0364(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnAdjustTop__Delegate;                                  // 0x036C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnTrack__Delegate;                                      // 0x0374(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __CheckLinkedObjects__Delegate;                           // 0x037C(0x000C) (NeedCtorLink)

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
	bool InternalOnKeyEvent(float Delta, unsigned char* key, unsigned char* KeyState);
	TArray<struct FString> GetPendingItems(bool bGuarantee);
	struct FString GetItemAtIndex(int idx);
	struct FString AdditionalDebugString();
	bool IsValidIndex(int i);
	bool IsValid();
	void DisableLinkedObjects();
	void EnableLinkedObjects();
	void InitLinkObjects(TArray<class UGUIComponent*> NewObj, bool bNoCheck);
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
	unsigned long                                      CallDrawItemForPlaceHoldingItems : 1;                     // 0x0384(0x0004)
	struct FScriptDelegate                             __GetItemHeight__Delegate;                                // 0x0388(0x000C) (NeedCtorLink)

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
	bool InternalOnKeyType(const struct FString& Unicode, unsigned char* key);
	bool InternalOnClick(class UGUIComponent* Sender);
	int MultiCalculateIndex(bool bRequireValidIndex);
	int CalculateIndex(bool bRequireValidIndex);
	void CenterMouse();
	float GetItemHeight(class UCanvas* C);
};


// Class XInterface.GUIMultiColumnList
// 0x006C (0x03FC - 0x0390)
class UGUIMultiColumnList : public UGUIVertList
{
public:
	TArray<struct FString>                             ColumnHeadings;                                           // 0x0390(0x000C) (Edit, Localized, NeedCtorLink)
	TArray<float>                                      InitColumnPerc;                                           // 0x039C(0x000C) (Edit, NeedCtorLink)
	TArray<struct FString>                             ColumnHeadingHints;                                       // 0x03A8(0x000C) (Edit, Localized, NeedCtorLink)
	TArray<struct FMultiColumnSortData>                SortData;                                                 // 0x03B4(0x000C) (Const, NeedCtorLink)
	TArray<int>                                        InvSortData;                                              // 0x03C0(0x000C) (Const, NeedCtorLink)
	TArray<float>                                      ColumnWidths;                                             // 0x03CC(0x000C) (Edit, Const, EditConst, NeedCtorLink)
	float                                              CellSpacing;                                              // 0x03D8(0x0004) (Edit)
	int                                                SortColumn;                                               // 0x03DC(0x0004) (Edit)
	unsigned long                                      NeedsSorting : 1;                                         // 0x03E0(0x0004) (Edit)
	unsigned long                                      SortDescending : 1;                                       // 0x03E0(0x0004) (Edit)
	unsigned long                                      ExpandLastColumn : 1;                                     // 0x03E0(0x0004) (Edit)
	int                                                NoVisibleRows;                                            // 0x03E4(0x0004) (Edit)
	int                                                NoVisibleCols;                                            // 0x03E8(0x0004) (Edit)
	struct FScriptDelegate                             __OnColumnSized__Delegate;                                // 0x03EC(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __GetSortString__Delegate;                                // 0x03F4(0x000C) (NeedCtorLink)

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
	struct FString GetSortString(int YourArrayIndex);
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


// Class XInterface.GUIVertImageList
// 0x004C (0x03DC - 0x0390)
class UGUIVertImageList : public UGUIVertList
{
public:
	TEnumAsByte<EeCellStyle>                           CellStyle;                                                // 0x0390(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0391(0x0003) MISSED OFFSET
	float                                              ImageScale;                                               // 0x0394(0x0004) (Edit)
	int                                                NoVisibleRows;                                            // 0x0398(0x0004) (Edit)
	int                                                NoVisibleCols;                                            // 0x039C(0x0004) (Edit)
	int                                                HorzBorder;                                               // 0x03A0(0x0004) (Edit)
	int                                                VertBorder;                                               // 0x03A4(0x0004) (Edit)
	TArray<struct FImageListElem>                      Elements;                                                 // 0x03A8(0x000C) (Edit, EditFixedSize, EditConst, NeedCtorLink)
	TArray<struct FImageListElem>                      SelectedElements;                                         // 0x03B4(0x000C) (Edit, EditFixedSize, EditConst, NeedCtorLink)
	class UMaterial*                                   LockedMat;                                                // 0x03C0(0x0004) (Edit)
	unsigned long                                      CallDrawItemForPlaceHoldingItemsInFixedCountCellStyle : 1;// 0x03C4(0x0004)
	float                                              LastValidClickTime;                                       // 0x03C8(0x0004)
	struct FScriptDelegate                             __OnItemDblClick__Delegate;                               // 0x03CC(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnIsSelectibleIndex__Delegate;                          // 0x03D4(0x000C) (NeedCtorLink)

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
	TArray<struct FImageListElem> GetPendingElements(bool bGuarantee);
	void ClearPendingElements();
	bool IsLocked();
	bool IndexLocked(int i);
	void GetAtIndex(int i, class UMaterial** Image, int* Item, int* Locked);
	int GetItemIntAtIndex(int i);
	struct FString GetItemAtIndex(int i);
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


// Class XInterface.GUICircularList
// 0x000C (0x0390 - 0x0384)
class UGUICircularList : public UGUIListBase
{
public:
	unsigned char                                      UnknownData00[0xC];                                       // 0x0384(0x000C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUICircularList");
		return ptr;
	}

};


// Class XInterface.GUICircularImageList
// 0x000C (0x039C - 0x0390)
class UGUICircularImageList : public UGUICircularList
{
public:
	unsigned char                                      UnknownData00[0xC];                                       // 0x0390(0x000C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUICircularImageList");
		return ptr;
	}

};


// Class XInterface.GUIList
// 0x0030 (0x03C0 - 0x0390)
class UGUIList : public UGUIVertList
{
public:
	TEnumAsByte<EeTextAlign>                           TextAlign;                                                // 0x0390(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0391(0x0003) MISSED OFFSET
	TArray<struct FGUIListElem>                        Elements;                                                 // 0x0394(0x000C) (Edit, EditFixedSize, EditConst, NeedCtorLink)
	TArray<struct FGUIListElem>                        SelectedElements;                                         // 0x03A0(0x000C) (Edit, EditFixedSize, EditConst, NeedCtorLink)
	struct FColor                                      OfficialColor;                                            // 0x03AC(0x0004) (Edit)
	struct FColor                                      Official2004Color;                                        // 0x03B0(0x0004) (Edit)
	struct FColor                                      BonusPackColor;                                           // 0x03B4(0x0004) (Edit)
	struct FScriptDelegate                             __CompareItem__Delegate;                                  // 0x03B8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIList");
		return ptr;
	}


	TArray<struct FGUIListElem> GetPendingElements(bool bGuarantee);
	void ClearPendingElements();
	bool InternalOnDragDrop(class UGUIComponent* Sender);
	void InternalOnEndDrag(class UGUIComponent* Accepting, bool bAccepted);
	int FindIndex(const struct FString& Test, bool bExact, bool bExtra, class UObject* TestObject);
	int FindItemObject(class UObject* obj);
	int FindExtra(const struct FString& Text, bool bExact);
	struct FString Find(const struct FString& Text, bool bExact, bool bExtra);
	void RemoveExtra(const struct FString& str);
	void RemoveObject(class UObject* obj);
	void RemoveItem(const struct FString& Item);
	void SetExtraAtIndex(int i, const struct FString& NewExtra);
	void SetObjectAtIndex(int i, class UObject* NewObject);
	void SetItemAtIndex(int i, const struct FString& NewItem);
	void GetAtIndex(int i, struct FString* ItemStr, class UObject** ExtraObj, struct FString* ExtraStr);
	struct FString GetExtraAtIndex(int i);
	class UObject* GetObjectAtIndex(int i);
	struct FString GetItemAtIndex(int i);
	bool IsSection();
	struct FString GetExtra();
	class UObject* GetObject();
	struct FString Get(bool bGuarantee);
	struct FString SelectedText();
	void Clear();
	int RemoveElement(const struct FGUIListElem& elem, int Count, bool bNoSort);
	int RemoveSilent(int i, int Count);
	int Remove(int i, int Count, bool bNoSort);
	void LoadFrom(class UGUIList* Source, bool bClearFirst);
	void Swap(int IndexA, int IndexB);
	void InsertElement(int i, const struct FGUIListElem& NewElem, bool bNoSort);
	void Insert(int i, const struct FString& NewItem, class UObject* obj, const struct FString& str, bool bNoSort, bool bSection);
	void Replace(int i, const struct FString& NewItem, class UObject* obj, const struct FString& str, bool bNoSort);
	void AddElement(const struct FGUIListElem& NewElem);
	void Add(const struct FString& NewItem, class UObject* obj, const struct FString& str, bool bSection);
	int CompareItem(const struct FGUIListElem& ElemA, const struct FGUIListElem& ElemB);
	void Sort();
	void SortList();
};


// Class XInterface.MultiSelectList
// 0x000C (0x03CC - 0x03C0)
class UMultiSelectList : public UGUIList
{
public:
	unsigned char                                      UnknownData00[0xC];                                       // 0x03C0(0x000C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.MultiSelectList");
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
	unsigned long                                      UseManualHeight : 1;                                      // 0x02C8(0x0004) (Edit)
	float                                              ManualHeight;                                             // 0x02CC(0x0004) (Edit)
	class UGUIStyles*                                  BarStyle;                                                 // 0x02D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     BarStyleName;                                             // 0x02D4(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIMultiColumnListHeader");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class XInterface.GUICharacterList
// 0x0020 (0x03B0 - 0x0390)
class UGUICharacterList : public UGUICircularList
{
public:
	unsigned char                                      UnknownData00[0x20];                                      // 0x0390(0x0020) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUICharacterList");
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


// Class XInterface.GUITreeList
// 0x0034 (0x03C4 - 0x0390)
class UGUITreeList : public UGUIVertList
{
public:
	unsigned char                                      UnknownData00[0x34];                                      // 0x0390(0x0034) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUITreeList");
		return ptr;
	}

};


// Class XInterface.GUIMultiOptionList
// 0x002C (0x03BC - 0x0390)
class UGUIMultiOptionList : public UGUIVertList
{
public:
	unsigned char                                      UnknownData00[0x2C];                                      // 0x0390(0x002C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIMultiOptionList");
		return ptr;
	}

};


// Class XInterface.GUIScrollText
// 0x006C (0x042C - 0x03C0)
class UGUIScrollText : public UGUIList
{
public:
	int                                                MaxHistory;                                               // 0x03C0(0x0004) (Edit, EditConst)
	struct FString                                     NewText;                                                  // 0x03C4(0x000C) (Edit, EditConst, NeedCtorLink)
	struct FString                                     ClickedString;                                            // 0x03D0(0x000C) (Edit, EditConst, NeedCtorLink)
	struct FString                                     Content;                                                  // 0x03DC(0x000C) (Edit, EditConst, NeedCtorLink)
	struct FString                                     Separator;                                                // 0x03E8(0x000C) (Edit, EditConst, NeedCtorLink)
	int                                                VisibleLines;                                             // 0x03F4(0x0004) (Edit, EditConst)
	int                                                VisibleChars;                                             // 0x03F8(0x0004) (Edit, EditConst)
	float                                              oldWidth;                                                 // 0x03FC(0x0004) (Edit, EditConst)
	TEnumAsByte<EeScrollState>                         ScrollState;                                              // 0x0400(0x0001) (Edit, EditConst)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0401(0x0003) MISSED OFFSET
	unsigned long                                      bNewContent : 1;                                          // 0x0404(0x0004) (Edit, EditConst)
	unsigned long                                      bStopped : 1;                                             // 0x0404(0x0004) (Edit, EditConst)
	unsigned long                                      bReceivedNewContent : 1;                                  // 0x0404(0x0004) (Const, EditConst)
	unsigned long                                      bRepeat : 1;                                              // 0x0404(0x0004) (Edit)
	unsigned long                                      bNoTeletype : 1;                                          // 0x0404(0x0004) (Edit)
	unsigned long                                      bClickText : 1;                                           // 0x0404(0x0004) (Edit)
	float                                              InitialDelay;                                             // 0x0408(0x0004) (Edit)
	float                                              CharDelay;                                                // 0x040C(0x0004) (Edit)
	float                                              EOLDelay;                                                 // 0x0410(0x0004) (Edit)
	float                                              RepeatDelay;                                              // 0x0414(0x0004) (Edit)
	TArray<struct FString>                             StringElements;                                           // 0x0418(0x000C) (Edit, EditFixedSize, EditConst, NeedCtorLink)
	struct FScriptDelegate                             __OnEndOfLine__Delegate;                                  // 0x0424(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIScrollText");
		return ptr;
	}


	bool IsValid();
	void EndScrolling();
	bool InternalOnKeyEvent(float Delta, unsigned char* key, unsigned char* State);
	bool InternalOnKeyType(const struct FString& Unicode, unsigned char* key);
	bool InternalOnClick(class UGUIComponent* Sender);
	void Timer();
	bool SkipChar();
	void Restart();
	void Stop();
	void SetContent(const struct FString& NewContent, const struct FString& sep);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void Dump();
	void OnEndOfLine();
	struct FString GetWordUnderCursor();
};


// Class XInterface.GUIListBoxBase
// 0x003C (0x033C - 0x0300)
class UGUIListBoxBase : public UGUIMultiComponent
{
public:
	struct FString                                     SelectedStyleName;                                        // 0x0300(0x000C) (Edit, NeedCtorLink)
	struct FString                                     SectionStyleName;                                         // 0x030C(0x000C) (Edit, NeedCtorLink)
	struct FString                                     OutlineStyleName;                                         // 0x0318(0x000C) (Edit, NeedCtorLink)
	struct FString                                     DefaultListClass;                                         // 0x0324(0x000C) (Edit, NeedCtorLink)
	class UGUIScrollBarBase*                           MyScrollBar;                                              // 0x0330(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIListBase*                                MyList;                                                   // 0x0334(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, EditInline)
	unsigned long                                      bVisibleWhenEmpty : 1;                                    // 0x0338(0x0004) (Edit)
	unsigned long                                      bSorted : 1;                                              // 0x0338(0x0004) (Edit)
	unsigned long                                      bInitializeList : 1;                                      // 0x0338(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIListBoxBase");
		return ptr;
	}


	void SetFriendlyLabel(class UGUILabel* NewLabel);
	void SetScrollBarStyle(bool changeScrollZoneStyle, class UGUIStyles* scrollZoneStyle, bool changeIncreaseButtonStyle, class UGUIStyles* increaseButtonStyle, bool changeIncreaseButtonGraphic, class UMaterial* increaseButtonGraphic, bool changeDecreaseButtonStyle, class UGUIStyles* decreaseButtonStyle, bool changeDecreaseButtonGraphic, class UMaterial* decreaseButtonGraphic, bool changeGripButtonStyle, class UGUIStyles* gripButtonStyle);
	void InternalOnCreateComponent(class UGUIComponent* NewComp, class UGUIComponent* Sender);
	void SetHint(const struct FString& NewHint);
	void InitBaseList(class UGUIListBase* LocalList);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class XInterface.GUITreeListBox
// 0x0004 (0x0340 - 0x033C)
class UGUITreeListBox : public UGUIListBoxBase
{
public:
	unsigned char                                      UnknownData00[0x4];                                       // 0x033C(0x0004) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUITreeListBox");
		return ptr;
	}

};


// Class XInterface.GUIMultiColumnListBox
// 0x002C (0x0368 - 0x033C)
class UGUIMultiColumnListBox : public UGUIListBoxBase
{
public:
	class UGUIMultiColumnListHeader*                   Header;                                                   // 0x033C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	unsigned long                                      bDisplayHeader : 1;                                       // 0x0340(0x0004) (Edit)
	class UGUIMultiColumnList*                         List;                                                     // 0x0344(0x0004) (Edit, ExportObject, EditConst, NeedCtorLink, EditInline)
	TArray<float>                                      HeaderColumnPerc;                                         // 0x0348(0x000C) (Edit, NeedCtorLink)
	TArray<struct FString>                             ColumnHeadings;                                           // 0x0354(0x000C) (Edit, Localized, NeedCtorLink)
	int                                                OffsetBetweenHeaderAndList;                               // 0x0360(0x0004) (Edit)
	unsigned long                                      bFullHeightStyle : 1;                                     // 0x0364(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIMultiColumnListBox");
		return ptr;
	}


	void SetHeaderStyle(bool changeStyle, const struct FString& stylez, bool changeBarStyle, const struct FString& barStylez);
	void InternalOnColumnSized(int Column);
	void InternalOnCreateComponent(class UGUIComponent* NewComp, class UGUIComponent* Sender);
	void InternalOnLoadINI(class UGUIComponent* Sender, const struct FString& S);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitBaseList(class UGUIListBase* LocalList);
};


// Class XInterface.GUIScrollTextBox
// 0x0040 (0x037C - 0x033C)
class UGUIScrollTextBox : public UGUIListBoxBase
{
public:
	class UGUIScrollText*                              MyScrollText;                                             // 0x033C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	unsigned long                                      bRepeat : 1;                                              // 0x0340(0x0004) (Edit)
	unsigned long                                      bNoTeletype : 1;                                          // 0x0340(0x0004) (Edit)
	unsigned long                                      bStripColors : 1;                                         // 0x0340(0x0004) (Edit)
	float                                              InitialDelay;                                             // 0x0344(0x0004) (Edit)
	float                                              CharDelay;                                                // 0x0348(0x0004) (Edit)
	float                                              EOLDelay;                                                 // 0x034C(0x0004) (Edit)
	float                                              RepeatDelay;                                              // 0x0350(0x0004) (Edit)
	TEnumAsByte<EeTextAlign>                           TextAlign;                                                // 0x0354(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0355(0x0003) MISSED OFFSET
	struct FString                                     Separator;                                                // 0x0358(0x000C) (Edit, NeedCtorLink)
	struct FString                                     ESC;                                                      // 0x0364(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Comma;                                                    // 0x0370(0x000C) (Edit, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIScrollTextBox");
		return ptr;
	}


	void AddText(const struct FString& NewText);
	struct FString StripColors(const struct FString& MyString);
	bool IsNumber(const struct FString& Num);
	void InternalOnAdjustTop(class UGUIComponent* Sender);
	void Stop();
	void Restart();
	void SetContent(const struct FString& NewContent, const struct FString& sep);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitBaseList(class UGUIListBase* LocalList);
	void InternalOnCreateComponent(class UGUIComponent* NewComp, class UGUIComponent* Sender);
	void Created();
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


// Class XInterface.HudBase
// 0x05F0 (0x0CB4 - 0x06C4)
class AHudBase : public AHUD
{
public:
	int                                                SpecPlayerLevel;                                          // 0x06C4(0x0004)
	int                                                SpecPlayerLevelMarkID;                                    // 0x06C8(0x0004)
	struct FString                                     strSpectating;                                            // 0x06CC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strSpectateHelp;                                          // 0x06D8(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbSpectateLevel;                                          // 0x06E4(0x0010)
	struct FFloatBox                                   fbSpectateUser;                                           // 0x06F4(0x0010)
	struct FFloatBox                                   fbSpectateHelp;                                           // 0x0704(0x0010)
	struct FFloatBox                                   fbSpectatingBack;                                         // 0x0714(0x0010)
	float                                              NametagFactorZ;                                           // 0x0724(0x0004) (Edit)
	float                                              NametagExtraZ;                                            // 0x0728(0x0004) (Edit)
	int                                                NametagFontSize;                                          // 0x072C(0x0004) (Edit)
	float                                              NametagRadius;                                            // 0x0730(0x0004) (Edit)
	int                                                NametagShadowX;                                           // 0x0734(0x0004) (Edit)
	int                                                NametagShadowY;                                           // 0x0738(0x0004) (Edit)
	struct FColor                                      NametagShadowColor;                                       // 0x073C(0x0004) (Edit)
	struct FString                                     NameTagInvulnerablePost;                                  // 0x0740(0x000C) (Localized, NeedCtorLink)
	float                                              NameTagVisUpdateTime;                                     // 0x074C(0x0004)
	struct FSpriteWidget                               IconDefendBombHolder;                                     // 0x0750(0x0040) (Edit)
	struct FSpriteWidget                               IconInvulnerable;                                         // 0x0790(0x0040) (Edit)
	int                                                TeamIndex;                                                // 0x07D0(0x0004) (Edit, Transient)
	TEnumAsByte<ERenderStyle>                          PassStyle;                                                // 0x07D4(0x0001) (Edit, Transient)
	unsigned char                                      UnknownData00[0x3];                                       // 0x07D5(0x0003) MISSED OFFSET
	TArray<class AHudBase*>                            ChildHudParts;                                            // 0x07D8(0x000C) (NeedCtorLink)
	struct FHudLocalizedMessage                        LocalMessages[0x8];                                       // 0x07E4(0x0050) (Edit, Transient, NeedCtorLink)
	class UClass*                                      VoteMenuClass;                                            // 0x0A64(0x0004) (Edit)
	class UMaterial*                                   TargetMaterial;                                           // 0x0A68(0x0004)
	unsigned long                                      bShowTargeting : 1;                                       // 0x0A6C(0x0004) (Transient)
	struct FVector                                     TargetingLocation;                                        // 0x0A70(0x000C) (Transient)
	float                                              TargetingSize;                                            // 0x0A7C(0x0004) (Transient)
	struct FString                                     InstructionText;                                          // 0x0A80(0x000C) (Edit, NeedCtorLink)
	struct FString                                     InstructionKeyText;                                       // 0x0A8C(0x000C) (Edit, NeedCtorLink)
	float                                              InstructTextBorderX;                                      // 0x0A98(0x0004) (Edit)
	float                                              InstructTextBorderY;                                      // 0x0A9C(0x0004) (Edit)
	float                                              InstrDelta;                                               // 0x0AA0(0x0004) (Edit)
	float                                              InstrRate;                                                // 0x0AA4(0x0004) (Edit)
	struct FString                                     InstructionFontName;                                      // 0x0AA8(0x000C) (Edit, NeedCtorLink)
	class UFont*                                       InstructionFontFont;                                      // 0x0AB4(0x0004) (Edit)
	unsigned long                                      bUsingCustomHUDColor : 1;                                 // 0x0AB8(0x0004)
	unsigned long                                      DoCropping : 1;                                           // 0x0AB8(0x0004) (Edit)
	unsigned long                                      bIsCinematic : 1;                                         // 0x0AB8(0x0004)
	unsigned char                                      FontsPrecached;                                           // 0x0ABC(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x0ABD(0x0003) MISSED OFFSET
	unsigned long                                      bHideWeaponName : 1;                                      // 0x0AC0(0x0004)
	float                                              CroppingAmount;                                           // 0x0AC4(0x0004) (Edit)
	class UMaterial*                                   CroppingMaterial;                                         // 0x0AC8(0x0004) (Edit)
	struct FString                                     LastWeaponName;                                           // 0x0ACC(0x000C) (NeedCtorLink)
	float                                              WeaponDrawTimer;                                          // 0x0AD8(0x0004)
	struct FColor                                      WeaponDrawColor;                                          // 0x0ADC(0x0004)
	struct FString                                     Text;                                                     // 0x0AE0(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     LevelActionLoading;                                       // 0x0AEC(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     LevelActionPaused;                                        // 0x0AF8(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     LevelActionFontName;                                      // 0x0B04(0x000C) (Edit, NeedCtorLink)
	struct FString                                     WonMatchPrefix;                                           // 0x0B10(0x000C) (Localized, NeedCtorLink)
	struct FString                                     WonMatchPostFix;                                          // 0x0B1C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     WaitingToSpawn;                                           // 0x0B28(0x000C) (Localized, NeedCtorLink)
	struct FString                                     AtMenus;                                                  // 0x0B34(0x000C) (Localized, NeedCtorLink)
	struct FString                                     YouveWonTheMatch;                                         // 0x0B40(0x000C) (Localized, NeedCtorLink)
	struct FString                                     YouveLostTheMatch;                                        // 0x0B4C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     NowViewing;                                               // 0x0B58(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ScoreText;                                                // 0x0B64(0x000C) (Localized, NeedCtorLink)
	struct FString                                     InitialViewingString;                                     // 0x0B70(0x000C) (Localized, NeedCtorLink)
	class UMaterial*                                   LocationDot;                                              // 0x0B7C(0x0004)
	class UMaterial*                                   DefaultCrosshair;                                         // 0x0B80(0x0004)
	class UMaterial*                                   TargetCrosshair;                                          // 0x0B84(0x0004)
	struct FColor                                      DamageFlash[0x4];                                         // 0x0B88(0x0004)
	float                                              DamageTime[0x4];                                          // 0x0B98(0x0004)
	unsigned char                                      Emphasized[0x4];                                          // 0x0BA8(0x0001) (Edit)
	int                                                DamageGot;                                                // 0x0BAC(0x0004)
	float                                              fPainSoundLastPlayed;                                     // 0x0BB0(0x0004)
	float                                              fStartTime;                                               // 0x0BB4(0x0004)
	struct FSpriteWidget                               WAttackedBG;                                              // 0x0BB8(0x0040)
	unsigned long                                      bAttacked : 1;                                            // 0x0BF8(0x0004)
	TArray<struct FSpriteWidget>                       Crosshairs;                                               // 0x0BFC(0x000C) (Edit, NeedCtorLink)
	struct FColor                                      CustomHUDColor;                                           // 0x0C08(0x0004)
	unsigned long                                      bUseCustomWeaponCrosshairs : 1;                           // 0x0C0C(0x0004)
	float                                              ScreenRatioX;                                             // 0x0C10(0x0004)
	float                                              ScreenRatioY;                                             // 0x0C14(0x0004)
	float                                              ScreenRatioXEx;                                           // 0x0C18(0x0004)
	float                                              ScreenRatioYEx;                                           // 0x0C1C(0x0004)
	float                                              _rX;                                                      // 0x0C20(0x0004)
	float                                              _rY;                                                      // 0x0C24(0x0004)
	float                                              _reX;                                                     // 0x0C28(0x0004)
	float                                              _reY;                                                     // 0x0C2C(0x0004)
	unsigned long                                      IsDrawModeMessage : 1;                                    // 0x0C30(0x0004)
	unsigned long                                      IsDrawSystemMessage : 1;                                  // 0x0C30(0x0004)
	TArray<struct FString>                             BaseTeamName;                                             // 0x0C34(0x000C) (NeedCtorLink)
	struct FColor                                      BaseTeamColorAlly;                                        // 0x0C40(0x0004) (Edit)
	TArray<struct FColor>                              BaseTeamColor;                                            // 0x0C44(0x000C) (Edit, NeedCtorLink)
	struct FColor                                      FriendlyColor;                                            // 0x0C50(0x0004) (Edit)
	struct FColor                                      MyselfColor;                                              // 0x0C54(0x0004) (Edit)
	int                                                TimeMinutes;                                              // 0x0C58(0x0004)
	int                                                TimeSeconds;                                              // 0x0C5C(0x0004)
	unsigned long                                      AlreadyGotMessage17_PlayerCantStart : 1;                  // 0x0C60(0x0004)
	struct FString                                     KillerName;                                               // 0x0C64(0x000C) (NeedCtorLink)
	float                                              KillerMarkTimeToRemove;                                   // 0x0C70(0x0004)
	struct FSpriteWidget                               KillerSprite;                                             // 0x0C74(0x0040) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.HudBase");
		return ptr;
	}


	int GetCurGameTime();
	void clearkilllog();
	void userzone(const struct FString& szPath, const struct FString& szCommand);
	void usermove(const struct FString& szPath, const struct FString& szCommand, int nCombatNum);
	void killlog(const struct FString& szPath, const struct FString& szCommand);
	void WorldSpaceOverlays();
	void STATIC_PlayHUDSound(class APlayerController* PC, TEnumAsByte<EeHUDSOUND> soundType);
	struct FVector CalcNametagPos(class APawn* curPawn);
	struct FVector CalcNametagPosNative(class APawn* curPawn);
	struct FColor GetNametagColor(class APlayerReplicationInfo* Info);
	void RefreshKillerName(const struct FString& mKillerName);
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
	struct FString GetBaseTeamName(int TeamIndex);
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
	void SetInstructionKeyText(const struct FString& Text);
	void SetInstructionText(const struct FString& Text);
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
	struct FColor STATIC_GetTeamColor(unsigned char TeamNum);
	void LocalizedMessage2(class UClass* Message, int Switch, bool bOption_Push, const struct FString& CriticalString);
	void LocalizedMessageEx(class UClass* Message, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject, const struct FString& CriticalString, int iReserve);
	void LocalizedMessage(class UClass* Message, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject, const struct FString& CriticalString);
	void Message(class APlayerReplicationInfo* PRI, const struct FString& Msg, const struct FName& MsgType);
	void ClearMessage(struct FHudLocalizedMessage* M);
	void AddChildHudPart(class AHudBase* Child);
	void DrawDigitSet(class UCanvas* C, float X, float Y, float OffsetX, float XL, float YL, int Value, const struct FDigitSet& dSet, int totalDigits, const struct FString& paddingChar);
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
// 0x059C (0x1250 - 0x0CB4)
class AwHudPart_KillMessage : public AHudBase
{
public:
	class AHudBase*                                    HudOwner;                                                 // 0x0CB4(0x0004)
	class ALevelInfo*                                  LevelOwner;                                               // 0x0CB8(0x0004)
	TArray<struct FKillMessageItem>                    KillMessages;                                             // 0x0CBC(0x000C) (NeedCtorLink)
	class UMaterial*                                   RelatedBG;                                                // 0x0CC8(0x0004) (Edit)
	struct FSpriteWidget                               SpriteWeaponAirStrike;                                    // 0x0CCC(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponAR;                                           // 0x0D0C(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponFlameThrower;                                 // 0x0D4C(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponGR;                                           // 0x0D8C(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponHeadshot;                                     // 0x0DCC(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponMG;                                           // 0x0E0C(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponPistol;                                       // 0x0E4C(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponRPG;                                          // 0x0E8C(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponSMG;                                          // 0x0ECC(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponSR;                                           // 0x0F0C(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponMelee;                                        // 0x0F4C(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponHelicopter;                                   // 0x0F8C(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponUnknown;                                      // 0x0FCC(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponHelicopterKill;                               // 0x100C(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponFell;                                         // 0x104C(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponStepOn;                                       // 0x108C(0x0040) (Edit)
	struct FSpriteWidget                               SpriteWeaponAlienHands;                                   // 0x10CC(0x0040) (Edit)
	int                                                CacheClipX;                                               // 0x110C(0x0004)
	int                                                CacheClipY;                                               // 0x1110(0x0004)
	float                                              MessageDuration;                                          // 0x1114(0x0004)
	int                                                MaxMessages;                                              // 0x1118(0x0004)
	int                                                FontSize;                                                 // 0x111C(0x0004)
	float                                              KillMessageWordSpacing;                                   // 0x1120(0x0004)
	float                                              KillMessageLineSpacing;                                   // 0x1124(0x0004)
	float                                              MarginXFromRight;                                         // 0x1128(0x0004)
	float                                              MarginYFromTop;                                           // 0x112C(0x0004)
	int                                                ShadowX;                                                  // 0x1130(0x0004)
	int                                                ShadowY;                                                  // 0x1134(0x0004)
	struct FColor                                      ShadowColor;                                              // 0x1138(0x0004)
	struct FIntBoxWH                                   Icon_KillSuccession[0xF];                                 // 0x113C(0x0010)
	struct FIntBoxWH                                   Icon_HeadShot;                                            // 0x122C(0x0010)
	struct FIntBoxWH                                   Icon_AimShot;                                             // 0x123C(0x0010)
	class UMaterial*                                   Icon_OptionalKillInfo;                                    // 0x124C(0x0004)

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
	struct FKillMessageItem MakeKillMessageItem(class APlayerReplicationInfo* KillerPRI, class APlayerReplicationInfo* victimPRI, const struct FString& KillerName, const struct FString& VictimName, class UClass* DamageType, int Switch, bool NoKillerName, bool NoVictimName, class UMaterial* overrideImage);
	void Initialize(class AHudBase* myOwner, class ALevelInfo* myLevel);
	void Precache();
};


// Class XInterface.wHudPart_KillMessage_Defence
// 0x02E0 (0x1530 - 0x1250)
class AwHudPart_KillMessage_Defence : public AwHudPart_KillMessage
{
public:
	unsigned char                                      UnknownData00[0x2E0];                                     // 0x1250(0x02E0) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_KillMessage_Defence");
		return ptr;
	}

};


// Class XInterface.GUIQuestionPage
// 0x0038 (0x039C - 0x0364)
class UGUIQuestionPage : public UGUIPage
{
public:
	class UGUILabel*                                   lMessage;                                                 // 0x0364(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UMaterial*                                   MessageIcon;                                              // 0x0368(0x0004)
	TArray<struct FString>                             ButtonNames;                                              // 0x036C(0x000C) (Localized, NeedCtorLink)
	TArray<class UGUIButton*>                          Buttons;                                                  // 0x0378(0x000C) (NeedCtorLink)
	class UGUIButton*                                  DefaultButton;                                            // 0x0384(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UGUIButton*                                  CancelButton;                                             // 0x0388(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FScriptDelegate                             __OnButtonClick__Delegate;                                // 0x038C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __NewOnButtonClick__Delegate;                             // 0x0394(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.GUIQuestionPage");
		return ptr;
	}


	void RemoveButtons();
	struct FString Replace(const struct FString& Src, const struct FString& Tag, const struct FString& Value);
	bool ButtonClick(class UGUIComponent* Sender);
	void LayoutButtons(unsigned char ActiveButton);
	class UGUIButton* AddButton(unsigned char idesc);
	void SetupQuestion(const struct FString& Question, unsigned char bButtons, unsigned char ActiveButton, bool bClearFirst);
	bool InternalOnPreDraw(class UCanvas* C);
	void InitComponent(class UGUIController* pMyController, class UGUIComponent* myOwner);
	bool NewOnButtonClick(unsigned char bButton);
	void OnButtonClick(unsigned char bButton);
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
	TArray<struct FString>                             Scrollback;                                               // 0x0460(0x000C) (NeedCtorLink)
	int                                                SBHead;                                                   // 0x046C(0x0004)
	int                                                SBPos;                                                    // 0x0470(0x0004)
	unsigned long                                      bCtrl : 1;                                                // 0x0474(0x0004)
	unsigned long                                      bAlt : 1;                                                 // 0x0474(0x0004)
	unsigned long                                      bShift : 1;                                               // 0x0474(0x0004)
	unsigned long                                      bConsoleHotKey : 1;                                       // 0x0474(0x0004)
	float                                              ConsoleSoundVol;                                          // 0x0478(0x0004)
	struct FString                                     AddedCurrentHead;                                         // 0x047C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     AddedCurrentTail;                                         // 0x0488(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ServerFullMsg;                                            // 0x0494(0x000C) (Localized, NeedCtorLink)
	float                                              SMLineSpace;                                              // 0x04A0(0x0004)
	TEnumAsByte<ESpeechMenuState>                      SMState;                                                  // 0x04A4(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x04A5(0x0003) MISSED OFFSET
	struct FName                                       SMType;                                                   // 0x04A8(0x0004)
	int                                                SMIndex;                                                  // 0x04AC(0x0004)
	struct FString                                     SMCallsign;                                               // 0x04B0(0x000C) (NeedCtorLink)
	int                                                SMOffset;                                                 // 0x04BC(0x0004)
	struct FString                                     SMNameArray[0x30];                                        // 0x04C0(0x000C) (NeedCtorLink)
	int                                                SMIndexArray[0x30];                                       // 0x0700(0x0004)
	int                                                SMArraySize;                                              // 0x07C0(0x0004)
	float                                              SMOriginX;                                                // 0x07C4(0x0004)
	float                                              SMOriginY;                                                // 0x07C8(0x0004)
	float                                              SMMargin;                                                 // 0x07CC(0x0004)
	float                                              SMTab;                                                    // 0x07D0(0x0004)
	struct FString                                     SMStateName[0xA];                                         // 0x07D4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     SMChannelOptions[0x3];                                    // 0x084C(0x000C) (Localized, NeedCtorLink)
	TArray<class AVoiceChatRoom*>                      VoiceChannels;                                            // 0x0870(0x000C) (NeedCtorLink)
	struct FString                                     SMAllString;                                              // 0x087C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     SMMoreString;                                             // 0x0888(0x000C) (Localized, NeedCtorLink)
	class USound*                                      SMOpenSound;                                              // 0x0894(0x0004)
	class USound*                                      SMAcceptSound;                                            // 0x0898(0x0004)
	class USound*                                      SMDenySound;                                              // 0x089C(0x0004)
	TEnumAsByte<EInputKey>                             LetterKeys[0xA];                                          // 0x08A0(0x0001)
	TEnumAsByte<EInputKey>                             NumberKeys[0xA];                                          // 0x08AA(0x0001)
	unsigned long                                      bSpeechMenuUseLetters : 1;                                // 0x08B4(0x0004)
	unsigned long                                      bSpeechMenuUseMouseWheel : 1;                             // 0x08B4(0x0004)
	unsigned long                                      bSpeechMenuLocked : 1;                                    // 0x08B4(0x0004)
	int                                                HighlightRow;                                             // 0x08B8(0x0004)
	TArray<struct FServerFavorite>                     Favorites;                                                // 0x08BC(0x000C) (Edit, NeedCtorLink)
	TArray<struct FStoredPassword>                     SavedPasswords;                                           // 0x08C8(0x000C) (NeedCtorLink)
	struct FString                                     PasswordPromptMenu;                                       // 0x08D4(0x000C) (NeedCtorLink)
	struct FString                                     LastConnectedServer;                                      // 0x08E0(0x000C) (NeedCtorLink)
	struct FString                                     LastURL;                                                  // 0x08EC(0x000C) (NeedCtorLink)
	TArray<struct FChatStruct>                         ChatMessages;                                             // 0x08F8(0x000C) (NeedCtorLink)
	struct FString                                     ChatMenuClass;                                            // 0x0904(0x000C) (NeedCtorLink)
	class UGUIPage*                                    ChatMenu;                                                 // 0x0910(0x0004) (ExportObject, Transient, NeedCtorLink, EditInline)
	unsigned long                                      bTeamChatOnly : 1;                                        // 0x0914(0x0004)
	class UUT2MusicManager*                            MusicManager;                                             // 0x0918(0x0004) (ExportObject, Transient, NeedCtorLink, EditInline)
	struct FString                                     StatsPromptMenuClass;                                     // 0x091C(0x000C) (NeedCtorLink)
	struct FString                                     MusicManagerClassName;                                    // 0x0928(0x000C) (NeedCtorLink)
	struct FString                                     WaitingGameClassName;                                     // 0x0934(0x000C) (NeedCtorLink)
	struct FString                                     NeedPasswordMenuClass;                                    // 0x0940(0x000C) (NeedCtorLink)
	struct FString                                     ServerInfoMenu;                                           // 0x094C(0x000C) (NeedCtorLink)
	float                                              FadeClock;                                                // 0x0958(0x0004)
	float                                              FadeTime;                                                 // 0x095C(0x0004)
	TArray<float>                                      DemoPlaybackSpeeds;                                       // 0x0960(0x000C) (NeedCtorLink)
	struct FString                                     PlaybackText;                                             // 0x096C(0x000C) (NeedCtorLink)
	unsigned long                                      bDemoJogKeys : 1;                                         // 0x0978(0x0004)
	struct FScriptDelegate                             __OnChat__Delegate;                                       // 0x097C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnChatMessage__Delegate;                                // 0x0984(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnExecAddFavorite__Delegate;                            // 0x098C(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.ExtendedConsole");
		return ptr;
	}


	void DebugTabOrder();
	void DumpLoadingHints(const struct FString& Param);
	void DLO(const struct FString& ClassName, const struct FString& ClassType);
	bool VoiceChatAllowed();
	void DumpCacheRecords(const struct FString& CacheType);
	void AddMessage(const struct FString& Mesg);
	void DumpRecords(const struct FString& Type);
	void DumpPlayInfo(const struct FString& Group);
	void MusicMenu();
	void PlayWaitingGame();
	void TeamChatOnly();
	void ServerInfo();
	void IngameChat();
	void SpeechMenuToggle();
	void STATIC_SaveFavorites();
	void STATIC_GetFavorites(TArray<struct FServerFavorite>* List);
	bool STATIC_RemoveFavorite(const struct FString& IP, int Port, int QueryPort);
	bool STATIC_AddFavorite(const struct FServerFavorite& NewFav);
	bool STATIC_InFavorites(const struct FServerFavorite& Fav);
	void AddCurrentToFavorites();
	void OnExecAddFavorite(const struct FServerFavorite& Fav);
	void ConsoleToggle();
	void ConsoleClose();
	void ConsoleOpen();
	void NativeConsoleOpen();
	void PlayConsoleSound(class USound* S);
	bool KeyEvent(TEnumAsByte<EInputKey> key, TEnumAsByte<EInputAction> Action, float Delta);
	void GetNewPlaybackSpeed(int Dir);
	void Message(const struct FString& Msg, float MsgLife);
	void OnChatMessage(const struct FString& Msg);
	void Chat(const struct FString& Msg, float MsgLife, class APlayerReplicationInfo* PRI);
	void PostRender(class UCanvas* Canvas);
	void cls();
	void NotifyLevelChange();
	void ConnectFailure(const struct FString& FailCode, const struct FString& URL);
	void OnStatsConfigured();
	void OnStatsClosed(bool bCancelled);
	void OnChat(const struct FString& Msg, int TeamIndex);
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
	struct FString SetInitialMusic(const struct FString& NewSong);
	void SetMusic(const struct FString& NewSong);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class XInterface.HudCDeathmatch
// 0x36C0 (0x4374 - 0x0CB4)
class AHudCDeathmatch : public AHudBase
{
public:
	float                                              UAVLastBeginScanLevelSeconds;                             // 0x0CB4(0x0004)
	float                                              UAVOneScanTime;                                           // 0x0CB8(0x0004)
	float                                              UAVOneScanTimeExtra;                                      // 0x0CBC(0x0004)
	float                                              UAVOneScanMin;                                            // 0x0CC0(0x0004)
	float                                              UAVOneScanMax;                                            // 0x0CC4(0x0004)
	class AwHudPart_MinimapBase*                       UAVMinimapBase;                                           // 0x0CC8(0x0004)
	int                                                UAVScanOffset;                                            // 0x0CCC(0x0004)
	float                                              UAVIconPosXAlly;                                          // 0x0CD0(0x0004)
	float                                              UAVIconPosYAlly;                                          // 0x0CD4(0x0004)
	float                                              UAVIconPosXEnemy;                                         // 0x0CD8(0x0004)
	float                                              UAVIconPosYEnemy;                                         // 0x0CDC(0x0004)
	float                                              UAVIconWidth;                                             // 0x0CE0(0x0004)
	float                                              UAVIconHeight;                                            // 0x0CE4(0x0004)
	float                                              UAVIconTextPosXAlly;                                      // 0x0CE8(0x0004)
	float                                              UAVIconTextPosYAlly;                                      // 0x0CEC(0x0004)
	float                                              UAVIconTextPosXEnemy;                                     // 0x0CF0(0x0004)
	float                                              UAVIconTextPosYEnemy;                                     // 0x0CF4(0x0004)
	float                                              UAVIconTextOffsetX;                                       // 0x0CF8(0x0004)
	float                                              UAVIconTextXL;                                            // 0x0CFC(0x0004)
	float                                              UAVIconTextYL;                                            // 0x0D00(0x0004)
	struct FColor                                      UAVIconColor;                                             // 0x0D04(0x0004)
	float                                              AFStringLeftTopX;                                         // 0x0D08(0x0004)
	float                                              AFStringLeftTopY;                                         // 0x0D0C(0x0004)
	float                                              AFStringRightBottomX;                                     // 0x0D10(0x0004)
	float                                              AFStringRightBottomY;                                     // 0x0D14(0x0004)
	float                                              AFSurvivedUserCountLeftTopX;                              // 0x0D18(0x0004)
	float                                              AFSurvivedUserCountLeftTopY;                              // 0x0D1C(0x0004)
	float                                              AFSurvivedUserCountRightBottomX;                          // 0x0D20(0x0004)
	float                                              AFSurvivedUserCountRightBottomY;                          // 0x0D24(0x0004)
	float                                              RSAStringLeftTopX;                                        // 0x0D28(0x0004)
	float                                              RSAStringLeftTopY;                                        // 0x0D2C(0x0004)
	float                                              RSAStringRightBottomX;                                    // 0x0D30(0x0004)
	float                                              RSAStringRightBottomY;                                    // 0x0D34(0x0004)
	float                                              RSASurvivedUserCountLeftTopX;                             // 0x0D38(0x0004)
	float                                              RSASurvivedUserCountLeftTopY;                             // 0x0D3C(0x0004)
	float                                              RSASurvivedUserCountRightBottomX;                         // 0x0D40(0x0004)
	float                                              RSASurvivedUserCountRightBottomY;                         // 0x0D44(0x0004)
	struct FDigitSet                                   WDigitsSmall;                                             // 0x0D48(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsMid;                                               // 0x0DFC(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsTime;                                              // 0x0EB0(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsTimeRedAlert;                                      // 0x0F64(0x00B4) (Edit)
	struct FSpriteWidget                               ScoreBgLine;                                              // 0x1018(0x0040) (Edit)
	struct FSpriteWidget                               ScoreBg;                                                  // 0x1058(0x0040) (Edit)
	struct FSpriteWidget                               ScoreBGMine;                                              // 0x1098(0x0040) (Edit)
	struct FSpriteWidget                               ScoreBGMyLine;                                            // 0x10D8(0x0040) (Edit)
	struct FSpriteWidget                               DetectedBomb;                                             // 0x1118(0x0040)
	float                                              DetectedBombDrawDistance;                                 // 0x1158(0x0004)
	struct FNumericWidget                              DigitsScoreL;                                             // 0x115C(0x0030) (Edit)
	struct FNumericWidget                              DigitsScoreR;                                             // 0x118C(0x0030) (Edit)
	struct FNumericWidget                              DigitsScoreU;                                             // 0x11BC(0x0030) (Edit)
	struct FNumericWidget                              DigitsScoreD;                                             // 0x11EC(0x0030) (Edit)
	unsigned long                                      OverdrawDigitsScoreL : 1;                                 // 0x121C(0x0004)
	unsigned long                                      OverdrawDigitsScoreR : 1;                                 // 0x121C(0x0004)
	class UTexRotator*                                 outArrow;                                                 // 0x1220(0x0004)
	float                                              OutArrowSize;                                             // 0x1224(0x0004) (Config)
	unsigned long                                      bRendNavExtra : 1;                                        // 0x1228(0x0004)
	float                                              fRendNavExtraFactor;                                      // 0x122C(0x0004)
	unsigned long                                      bRendVisCount : 1;                                        // 0x1230(0x0004)
	float                                              fRendVisCountFactor;                                      // 0x1234(0x0004)
	float                                              fRendViscountBoxSize;                                     // 0x1238(0x0004)
	unsigned long                                      bRendInfluence : 1;                                       // 0x123C(0x0004)
	float                                              fInfluenceBoxSize;                                        // 0x1240(0x0004)
	unsigned long                                      bRendCoverAngle : 1;                                      // 0x1244(0x0004)
	float                                              fRendCoverAngleSize;                                      // 0x1248(0x0004)
	unsigned long                                      bRendSDFrontLine : 1;                                     // 0x124C(0x0004)
	float                                              fSDFrontLineSize;                                         // 0x1250(0x0004)
	unsigned long                                      bRendSDFrontLineFull : 1;                                 // 0x1254(0x0004)
	unsigned long                                      bRendRadius : 1;                                          // 0x1254(0x0004)
	TArray<struct FColor>                              RainbowColors;                                            // 0x1258(0x000C) (NeedCtorLink)
	TArray<struct FColor>                              DangerColors;                                             // 0x1264(0x000C) (NeedCtorLink)
	TArray<struct FColor>                              RedBlueColors;                                            // 0x1270(0x000C) (NeedCtorLink)
	struct FColor                                      color_Shadow;                                             // 0x127C(0x0004)
	unsigned long                                      bShowTimer1 : 1;                                          // 0x1280(0x0004) (Edit)
	unsigned long                                      bShowTimer1WithDigitRedAlert : 1;                         // 0x1280(0x0004) (Edit)
	struct FSpriteWidget                               WTimerBG;                                                 // 0x1284(0x0040) (Edit)
	struct FSpriteWidget                               SpriteTimerHalf;                                          // 0x12C4(0x0040) (Edit)
	struct FSpriteWidget                               SpriteTimerHalf_RedAlert;                                 // 0x1304(0x0040) (Edit)
	struct FNumericWidget                              DigitsTimerMin;                                           // 0x1344(0x0030) (Edit)
	struct FNumericWidget                              DigitsTimerSec;                                           // 0x1374(0x0030) (Edit)
	unsigned long                                      bShowTimer2NotScoreD : 1;                                 // 0x13A4(0x0004) (Edit)
	unsigned long                                      bShowTimer2WithDigitRedAlert : 1;                         // 0x13A4(0x0004) (Edit)
	struct FSpriteWidget                               SpriteTimerHalf2;                                         // 0x13A8(0x0040) (Edit)
	struct FSpriteWidget                               SpriteTimerHalf2_RedAlert;                                // 0x13E8(0x0040) (Edit)
	struct FNumericWidget                              DigitsTimerMin2;                                          // 0x1428(0x0030) (Edit)
	struct FNumericWidget                              DigitsTimerSec2;                                          // 0x1458(0x0030) (Edit)
	float                                              NetLastTimeSeconds;                                       // 0x1488(0x0004)
	float                                              NetElapsedTime;                                           // 0x148C(0x0004)
	float                                              NetInterval;                                              // 0x1490(0x0004)
	int                                                NetRecvMax;                                               // 0x1494(0x0004)
	int                                                NetRecv;                                                  // 0x1498(0x0004)
	int                                                NetSendMax;                                               // 0x149C(0x0004)
	int                                                NetSend;                                                  // 0x14A0(0x0004)
	int                                                NetTotal;                                                 // 0x14A4(0x0004)
	struct FSpriteWidget                               AmmoIcon;                                                 // 0x14A8(0x0040) (Edit)
	struct FNumericWidget                              AdrenalineCount;                                          // 0x14E8(0x0030) (Edit)
	struct FNumericWidget                              mySpread;                                                 // 0x1518(0x0030) (Edit)
	struct FNumericWidget                              myRank;                                                   // 0x1548(0x0030) (Edit)
	struct FNumericWidget                              MyScore;                                                  // 0x1578(0x0030) (Edit)
	struct FNumericWidget                              TimerHours;                                               // 0x15A8(0x0030) (Edit)
	struct FNumericWidget                              TimerMinutes;                                             // 0x15D8(0x0030) (Edit)
	struct FNumericWidget                              TimerSeconds;                                             // 0x1608(0x0030) (Edit)
	struct FSpriteWidget                               TimerDigitSpacer[0x2];                                    // 0x1638(0x0040) (Edit)
	struct FSpriteWidget                               TimerIcon;                                                // 0x16B8(0x0040) (Edit)
	struct FSpriteWidget                               TimerBackground;                                          // 0x16F8(0x0040) (Edit)
	struct FSpriteWidget                               TimerBackgroundDisc;                                      // 0x1738(0x0040) (Edit)
	class UFont*                                       LevelActionFontFont;                                      // 0x1778(0x0004) (Edit)
	struct FColor                                      LevelActionFontColor;                                     // 0x177C(0x0004) (Edit)
	float                                              LevelActionPositionX;                                     // 0x1780(0x0004) (Edit)
	float                                              LevelActionPositionY;                                     // 0x1784(0x0004) (Edit)
	struct FNumericWidget                              DigitsHealth;                                             // 0x1788(0x0030) (Edit)
	struct FNumericWidget                              DigitsVehicleHealth;                                      // 0x17B8(0x0030) (Edit)
	struct FNumericWidget                              DigitsTotalAmmo;                                          // 0x17E8(0x0030) (Edit)
	struct FNumericWidget                              DigitsMagazineAmmo;                                       // 0x1818(0x0030) (Edit)
	struct FNumericWidget                              DigitsMagazineAmmoShortage;                               // 0x1848(0x0030) (Edit)
	struct FNumericWidget                              DigitsShield;                                             // 0x1878(0x0030) (Edit)
	struct FNumericWidget                              DigitsSprint;                                             // 0x18A8(0x0030) (Edit)
	unsigned long                                      bPrevMatchOver : 1;                                       // 0x18D8(0x0004)
	struct FSpriteWidget                               HpStaminaBackground;                                      // 0x18DC(0x0040) (Edit)
	struct FSpriteWidget                               HpBarBackground;                                          // 0x191C(0x0040) (Edit)
	struct FSpriteWidget                               HpBar;                                                    // 0x195C(0x0040) (Edit)
	struct FSpriteWidget                               DamageBar;                                                // 0x199C(0x0040) (Edit)
	struct FSpriteWidget                               RecoveryBar;                                              // 0x19DC(0x0040) (Edit)
	struct FSpriteWidget                               StaminaBarBackground;                                     // 0x1A1C(0x0040) (Edit)
	struct FSpriteWidget                               StaminaBar;                                               // 0x1A5C(0x0040) (Edit)
	struct FSpriteWidget                               StaminaBarWarn;                                           // 0x1A9C(0x0040) (Edit)
	struct FSpriteWidget                               HPIcon;                                                   // 0x1ADC(0x0040) (Edit)
	struct FSpriteWidget                               HpGauBlink;                                               // 0x1B1C(0x0040) (Edit)
	float                                              fHPDelayTime;                                             // 0x1B5C(0x0004) (Edit)
	float                                              fHPDisplayRatio;                                          // 0x1B60(0x0004) (Edit)
	float                                              fAddValue;                                                // 0x1B64(0x0004)
	float                                              fLastHealth;                                              // 0x1B68(0x0004)
	float                                              fBeginDamageTime;                                         // 0x1B6C(0x0004)
	unsigned long                                      bBeginDamage : 1;                                         // 0x1B70(0x0004)
	unsigned long                                      bBeginRecovery : 1;                                       // 0x1B70(0x0004)
	float                                              fCurrentDamageBar;                                        // 0x1B74(0x0004)
	float                                              fCurrentHPBar;                                            // 0x1B78(0x0004)
	float                                              fCurrentRecoveryBar;                                      // 0x1B7C(0x0004)
	unsigned long                                      bPlayRecoverySounding : 1;                                // 0x1B80(0x0004)
	float                                              fStartPlayRecoverySound;                                  // 0x1B84(0x0004)
	struct FDigitSet                                   WDigitsHP;                                                // 0x1B88(0x00B4)
	struct FNumericWidget                              HPCount;                                                  // 0x1C3C(0x0030)
	struct FSpriteWidget                               SPIcon;                                                   // 0x1C6C(0x0040)
	struct FSpriteWidget                               PostureStand;                                             // 0x1CAC(0x0040) (Edit)
	struct FSpriteWidget                               PostureCrouch;                                            // 0x1CEC(0x0040) (Edit)
	struct FSpriteWidget                               PostureDown;                                              // 0x1D2C(0x0040) (Edit)
	struct FSpriteWidget                               PostureRun;                                               // 0x1D6C(0x0040) (Edit)
	struct FSpriteWidget                               HelpWorldMap;                                             // 0x1DAC(0x0040) (Edit)
	struct FSpriteWidget                               HelpMiliAtt;                                              // 0x1DEC(0x0040) (Edit)
	struct FSpriteWidget                               HelpAim;                                                  // 0x1E2C(0x0040) (Edit)
	class UMaterial*                                   matCurrentWeapon;                                         // 0x1E6C(0x0004)
	int                                                iDrawingWeaponID;                                         // 0x1E70(0x0004)
	struct FDigitSet                                   AmmoSet100;                                               // 0x1E74(0x00B4) (Edit)
	struct FNumericWidget                              Ammo100;                                                  // 0x1F28(0x0030) (Edit)
	int                                                Ammo100_LineOffset;                                       // 0x1F58(0x0004) (Edit)
	int                                                Ammo100_DigitOffset;                                      // 0x1F5C(0x0004) (Edit)
	struct FAmmoSet                                    AmmoSet50;                                                // 0x1F60(0x0058) (Edit)
	struct FAmmoSet                                    AmmoSetSniper;                                            // 0x1FB8(0x0058) (Edit)
	struct FAmmoSet                                    AmmoSetShotgun;                                           // 0x2010(0x0058) (Edit)
	struct FAmmoSet                                    AmmoSetRPG;                                               // 0x2068(0x0058) (Edit)
	struct FAmmoSet                                    AmmoSetATR;                                               // 0x20C0(0x0058) (Edit)
	struct FFloatBox                                   fbSpectateClanMark;                                       // 0x2118(0x0010)
	struct FFloatBox                                   fbSpectateUserName;                                       // 0x2128(0x0010)
	struct FString                                     SpecPlayerClan;                                           // 0x2138(0x000C) (NeedCtorLink)
	struct FImage                                      ImgPlayerClanMark[0x3];                                   // 0x2144(0x0020)
	class UMaterial*                                   matDefaultClanMark;                                       // 0x21A4(0x0004)
	struct FSpriteWidget                               AmmoFlameThrowerCan;                                      // 0x21A8(0x0040) (Edit)
	struct FSpriteWidget                               AmmoFlameThrowerBar;                                      // 0x21E8(0x0040) (Edit)
	struct FSpriteWidget                               AmmoSeparator;                                            // 0x2228(0x0040) (Edit)
	float                                              AmmoSeparatorBeginX;                                      // 0x2268(0x0004) (Edit)
	float                                              AmmoSeparatorBeginY;                                      // 0x226C(0x0004) (Edit)
	float                                              AmmoSeparatorWidth;                                       // 0x2270(0x0004) (Edit)
	float                                              AmmoSeparatorHeight;                                      // 0x2274(0x0004) (Edit)
	struct FSpriteWidget                               GaugeOverHeat;                                            // 0x2278(0x0040) (Edit)
	TArray<struct FTeamDeathInfo>                      TeamDeathInfos;                                           // 0x22B8(0x000C) (Edit, NeedCtorLink)
	struct FSpriteWidget                               TeamDeathSprite;                                          // 0x22C4(0x0040) (Edit)
	float                                              TeamDeath_HeightOffset;                                   // 0x2304(0x0004) (Edit)
	float                                              TeamDeath_MinScale;                                       // 0x2308(0x0004) (Edit)
	float                                              TeamDeath_MaxScale;                                       // 0x230C(0x0004) (Edit)
	float                                              TeamDeath_MinDist;                                        // 0x2310(0x0004) (Edit)
	float                                              TeamDeath_MaxDist;                                        // 0x2314(0x0004) (Edit)
	struct FSpriteWidget                               WBGKillMessage;                                           // 0x2318(0x0040)
	class UMaterial*                                   DamageIndicationMaterial;                                 // 0x2358(0x0004)
	int                                                MaxDamageIndicationCount;                                 // 0x235C(0x0004)
	float                                              DamageIndicationDuration;                                 // 0x2360(0x0004)
	TArray<struct FDamageIndicationInfo>               DamageIndicationInfos;                                    // 0x2364(0x000C) (Edit, NeedCtorLink)
	float                                              DamageIndicationMaterial_UOffset;                         // 0x2370(0x0004)
	float                                              DamageIndicationMaterial_VOffset;                         // 0x2374(0x0004)
	unsigned long                                      ShowHealthInDanager : 1;                                  // 0x2378(0x0004)
	int                                                ShowHealthInDanagerSoundID;                               // 0x237C(0x0004)
	float                                              ShowHealthInDanager_BeginTime;                            // 0x2380(0x0004)
	float                                              ShowHealthInDanager_EndTime;                              // 0x2384(0x0004)
	float                                              ShowHealthInDanager_Duration;                             // 0x2388(0x0004)
	class UMaterial*                                   ShowHealthInDanager_Material;                             // 0x238C(0x0004)
	float                                              ShowHealthInDanger_BlinkInterval;                         // 0x2390(0x0004)
	float                                              ShowHealthInDanger_BlinkMaxAlpha;                         // 0x2394(0x0004)
	float                                              ShowHealthInDanger_BlinkMinAlpha;                         // 0x2398(0x0004)
	unsigned long                                      bShowFallInDanger : 1;                                    // 0x239C(0x0004)
	float                                              ShowFallDamage_Duration;                                  // 0x23A0(0x0004)
	float                                              ShowFallInDanager_BeginTime;                              // 0x23A4(0x0004)
	float                                              ShowFallInDanager_EndTime;                                // 0x23A8(0x0004)
	float                                              ShowFallDamage_BlinkInterval;                             // 0x23AC(0x0004)
	struct FString                                     KillMessageHelicopterName;                                // 0x23B0(0x000C) (Localized, NeedCtorLink)
	struct FSelfKillMessage                            LastSelfKillMessage;                                      // 0x23BC(0x0030) (NeedCtorLink)
	struct FString                                     SelfKillMessage_Killed;                                   // 0x23EC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     SelfKillMessage_KilledBy;                                 // 0x23F8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     SuicideMessage;                                           // 0x2404(0x000C) (Localized, NeedCtorLink)
	struct FColor                                      SelfKillColor;                                            // 0x2410(0x0004)
	struct FColor                                      SelfKilledByColor;                                        // 0x2414(0x0004)
	struct FSpriteWidget                               Crosshair_Left;                                           // 0x2418(0x0040) (Edit)
	struct FSpriteWidget                               Crosshair_Right;                                          // 0x2458(0x0040) (Edit)
	struct FSpriteWidget                               Crosshair_Up;                                             // 0x2498(0x0040) (Edit)
	struct FSpriteWidget                               Crosshair_Down;                                           // 0x24D8(0x0040) (Edit)
	struct FSpriteWidget                               Crosshair_MG;                                             // 0x2518(0x0040) (Edit)
	struct FSpriteWidget                               Crosshair_DamageDealt;                                    // 0x2558(0x0040) (Edit)
	float                                              CrossHair_DamageDealtDrawTime;                            // 0x2598(0x0004)
	float                                              CrossHair_DamageDealtBeginFadeTime;                       // 0x259C(0x0004)
	float                                              CrossHair_ServerSideLastDamageDealtTime;                  // 0x25A0(0x0004)
	float                                              CrossHair_ClientSideLastDamageDealtTime;                  // 0x25A4(0x0004)
	struct FSpriteWidget                               ProgressStatusBG;                                         // 0x25A8(0x0040) (Edit)
	struct FSpriteWidget                               ProgressStatusBar;                                        // 0x25E8(0x0040) (Edit)
	struct FSpriteWidget                               SkillSlot5;                                               // 0x2628(0x0040) (Edit)
	struct FSpriteWidget                               SkillSlot6;                                               // 0x2668(0x0040) (Edit)
	struct FSpriteWidget                               SkillSlot5Name;                                           // 0x26A8(0x0040) (Edit)
	struct FSpriteWidget                               SkillSlot5Count;                                          // 0x26E8(0x0040) (Edit)
	struct FSpriteWidget                               SkillSlot5Enable;                                         // 0x2728(0x0040) (Edit)
	struct FSpriteWidget                               SkillSlot6Enable;                                         // 0x2768(0x0040) (Edit)
	class UMaterial*                                   matEmptySkillSlot;                                        // 0x27A8(0x0004) (Edit)
	class UMaterial*                                   matEmptySkillSlot6;                                       // 0x27AC(0x0004) (Edit)
	class UMaterial*                                   matSkillSupplyItem[0x5];                                  // 0x27B0(0x0004) (Edit)
	class UMaterial*                                   matSkillBlink;                                            // 0x27C4(0x0004) (Edit)
	float                                              fBlinkDelayTime;                                          // 0x27C8(0x0004) (Edit)
	float                                              fBlinkLastTime;                                           // 0x27CC(0x0004) (Edit)
	unsigned long                                      bBlinkState : 1;                                          // 0x27D0(0x0004)
	unsigned long                                      bSkill_C4 : 1;                                            // 0x27D0(0x0004)
	unsigned long                                      bSkill_Incen : 1;                                         // 0x27D0(0x0004)
	unsigned long                                      bSkill_HellFire : 1;                                      // 0x27D0(0x0004)
	unsigned long                                      bSkill_RPG7 : 1;                                          // 0x27D0(0x0004)
	unsigned long                                      bSkill_M2B : 1;                                           // 0x27D0(0x0004)
	unsigned long                                      bSkill_ATR : 1;                                           // 0x27D0(0x0004)
	unsigned long                                      bEnableSlot5 : 1;                                         // 0x27D0(0x0004)
	float                                              Slot6EnableTime;                                          // 0x27D4(0x0004)
	TArray<struct FSpriteWidget>                       SkillNum;                                                 // 0x27D8(0x000C) (Edit, NeedCtorLink)
	int                                                HasSkillC4;                                               // 0x27E4(0x0004)
	int                                                HasSkillAirStirke;                                        // 0x27E8(0x0004)
	int                                                HasSkillRPG;                                              // 0x27EC(0x0004)
	int                                                HasSkillIncen;                                            // 0x27F0(0x0004)
	int                                                HasSkillHellFire;                                         // 0x27F4(0x0004)
	struct FSkillProperty                              ActiveUsingSkill;                                         // 0x27F8(0x0024)
	float                                              VisibleDistance;                                          // 0x281C(0x0004)
	struct FSpriteWidget                               PlaceMark;                                                // 0x2820(0x0040)
	struct FSpriteWidget                               PlaceMarkAmmoBox;                                         // 0x2860(0x0040)
	struct FString                                     lsPlaceM2B;                                               // 0x28A0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsPlaceMG3;                                               // 0x28AC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsPlaceRPG7;                                              // 0x28B8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsPlaceATR;                                               // 0x28C4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsPlaceHealthPack;                                        // 0x28D0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsPlaceHeliPack;                                          // 0x28DC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsPlaceArtilleryPack;                                     // 0x28E8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsPlaceUAVPack;                                           // 0x28F4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsPlaceMedalPack;                                         // 0x2900(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsPlaceRandomBonusPack;                                   // 0x290C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsMessageNotice;                                          // 0x2918(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsPlaceAmmoSupply;                                        // 0x2924(0x000C) (Localized, NeedCtorLink)
	TArray<class UClass*>                              SpecialPositions_Class;                                   // 0x2930(0x000C) (NeedCtorLink)
	TArray<struct FSpriteWidget>                       SpecialPositions_Sprite;                                  // 0x293C(0x000C) (NeedCtorLink)
	TArray<int>                                        SpecialPositions_OffsetZ;                                 // 0x2948(0x000C) (NeedCtorLink)
	TArray<struct FVector>                             CachedSpecialPositions;                                   // 0x2954(0x000C) (NeedCtorLink)
	TArray<class AActor*>                              CachedSpecialPositionActors;                              // 0x2960(0x000C) (NeedCtorLink)
	TArray<struct FSpriteWidget>                       CachedSpecialPositionSprites;                             // 0x296C(0x000C) (NeedCtorLink)
	TArray<int>                                        SuppliesPositions_OffsetZ;                                // 0x2978(0x000C) (NeedCtorLink)
	TArray<struct FVector>                             CachedSuppliesPositions;                                  // 0x2984(0x000C) (NeedCtorLink)
	TArray<class AActor*>                              CachedSuppliesPositionActors;                             // 0x2990(0x000C) (NeedCtorLink)
	unsigned long                                      bCachedSpecialPostions : 1;                               // 0x299C(0x0004)
	TArray<struct FName>                               SpriteTag;                                                // 0x29A0(0x000C) (NeedCtorLink)
	TArray<struct FPlane>                              SpriteLastColorModulates;                                 // 0x29AC(0x000C) (NeedCtorLink)
	TArray<float>                                      SpriteLastTime;                                           // 0x29B8(0x000C) (NeedCtorLink)
	struct FPlane                                      ObjectSpriteEdgeColorModulate;                            // 0x29C4(0x0010)
	struct FNumericWidget                              UDamageTime;                                              // 0x29D4(0x0030) (Edit)
	struct FSpriteWidget                               UDamageIcon;                                              // 0x2A04(0x0040) (Edit)
	struct FSpriteWidget                               AdrenalineIcon;                                           // 0x2A44(0x0040) (Edit)
	struct FSpriteWidget                               AdrenalineBackground;                                     // 0x2A84(0x0040) (Edit)
	struct FSpriteWidget                               AdrenalineBackgroundDisc;                                 // 0x2AC4(0x0040) (Edit)
	struct FSpriteWidget                               AdrenalineAlert;                                          // 0x2B04(0x0040) (Edit)
	struct FSpriteWidget                               MyScoreIcon;                                              // 0x2B44(0x0040) (Edit)
	struct FSpriteWidget                               MyScoreBackground;                                        // 0x2B84(0x0040) (Edit)
	struct FSpriteWidget                               HudHealthALERT;                                           // 0x2BC4(0x0040) (Edit)
	struct FSpriteWidget                               HudVehicleHealthALERT;                                    // 0x2C04(0x0040) (Edit)
	struct FSpriteWidget                               HudAmmoALERT;                                             // 0x2C44(0x0040) (Edit)
	struct FSpriteWidget                               HudBorderShield;                                          // 0x2C84(0x0040) (Edit)
	struct FSpriteWidget                               HudBorderHealth;                                          // 0x2CC4(0x0040) (Edit)
	struct FSpriteWidget                               HudBorderVehicleHealth;                                   // 0x2D04(0x0040) (Edit)
	struct FSpriteWidget                               HudBorderAmmo;                                            // 0x2D44(0x0040) (Edit)
	struct FSpriteWidget                               HudBorderShieldIcon;                                      // 0x2D84(0x0040) (Edit)
	struct FSpriteWidget                               HudBorderHealthIcon;                                      // 0x2DC4(0x0040) (Edit)
	struct FSpriteWidget                               HudBorderVehicleHealthIcon;                               // 0x2E04(0x0040) (Edit)
	class UClass*                                      BaseWeapons[0x9];                                         // 0x2E44(0x0004) (Edit)
	struct FSpriteWidget                               BarWeaponIcon[0x9];                                       // 0x2E68(0x0040) (Edit)
	struct FSpriteWidget                               BarAmmoIcon[0x9];                                         // 0x30A8(0x0040) (Edit)
	struct FSpriteWidget                               BarBorder[0x9];                                           // 0x32E8(0x0040) (Edit)
	struct FSpriteWidget                               BarBorderAmmoIndicator[0x9];                              // 0x3528(0x0040) (Edit)
	float                                              BarBorderScaledPosition[0x9];                             // 0x3768(0x0004)
	struct FWeaponState                                BarWeaponStates[0x9];                                     // 0x378C(0x0008)
	struct FSpriteWidget                               RechargeBar;                                              // 0x37D4(0x0040) (Edit)
	unsigned long                                      bDrawTimer : 1;                                           // 0x3814(0x0004)
	unsigned long                                      TeamLinked : 1;                                           // 0x3814(0x0004)
	unsigned long                                      bShowMissingWeaponInfo : 1;                               // 0x3814(0x0004)
	int                                                CurHealth;                                                // 0x3818(0x0004)
	int                                                LastHealth;                                               // 0x381C(0x0004)
	int                                                CurVehicleHealth;                                         // 0x3820(0x0004)
	int                                                LastVehicleHealth;                                        // 0x3824(0x0004)
	int                                                CurShield;                                                // 0x3828(0x0004)
	int                                                LastShield;                                               // 0x382C(0x0004)
	int                                                MaxShield;                                                // 0x3830(0x0004)
	int                                                CurEnergy;                                                // 0x3834(0x0004)
	int                                                MaxEnergy;                                                // 0x3838(0x0004)
	int                                                LastEnergy;                                               // 0x383C(0x0004)
	float                                              LastDamagedHealth;                                        // 0x3840(0x0004)
	float                                              LastDamagedVehicleHealth;                                 // 0x3844(0x0004)
	float                                              ZoomToggleTime;                                           // 0x3848(0x0004)
	float                                              FadeTime;                                                 // 0x384C(0x0004)
	float                                              MaxAmmoPrimary;                                           // 0x3850(0x0004) (Edit)
	float                                              CurAmmoPrimary;                                           // 0x3854(0x0004) (Edit)
	float                                              LastAdrenalineTime;                                       // 0x3858(0x0004) (Edit)
	int                                                CurScore;                                                 // 0x385C(0x0004) (Transient)
	int                                                CurRank;                                                  // 0x3860(0x0004) (Transient)
	int                                                ScoreDiff;                                                // 0x3864(0x0004) (Transient)
	int                                                OldRemainingTime;                                         // 0x3868(0x0004)
	struct FName                                       CountDownName[0xA];                                       // 0x386C(0x0004)
	struct FName                                       LongCountName[0xA];                                       // 0x3894(0x0004)
	int                                                BarWeaponIconAnim[0x9];                                   // 0x38BC(0x0004) (Edit)
	struct FColor                                      HudColorRed;                                              // 0x38E0(0x0004) (Edit)
	struct FColor                                      HudColorBlue;                                             // 0x38E4(0x0004) (Edit)
	struct FColor                                      HudColorBlack;                                            // 0x38E8(0x0004) (Edit)
	struct FColor                                      HudColorHighLight;                                        // 0x38EC(0x0004) (Edit)
	struct FColor                                      HudColorNormal;                                           // 0x38F0(0x0004) (Edit)
	struct FColor                                      HudColorTeam[0x2];                                        // 0x38F4(0x0004) (Edit)
	struct FColor                                      CustomHUDHighlightColor;                                  // 0x38FC(0x0004)
	class APlayerReplicationInfo*                      NamedPlayer;                                              // 0x3900(0x0004)
	float                                              NameTime;                                                 // 0x3904(0x0004)
	class UMaterial*                                   Portrait;                                                 // 0x3908(0x0004)
	float                                              PortraitTime;                                             // 0x390C(0x0004)
	float                                              PortraitX;                                                // 0x3910(0x0004)
	TArray<class ASceneManager*>                       MySceneManagers;                                          // 0x3914(0x000C) (NeedCtorLink)
	float                                              VehicleDrawTimer;                                         // 0x3920(0x0004)
	class APawn*                                       OldPawn;                                                  // 0x3924(0x0004)
	struct FString                                     VehicleName;                                              // 0x3928(0x000C) (NeedCtorLink)
	float                                              fPrevLevelSeconds;                                        // 0x3934(0x0004)
	int                                                iSpread_Curr;                                             // 0x3938(0x0004)
	float                                              fSpread_Constant;                                         // 0x393C(0x0004)
	float                                              ch_up_x;                                                  // 0x3940(0x0004)
	float                                              ch_up_y;                                                  // 0x3944(0x0004)
	float                                              ch_down_x;                                                // 0x3948(0x0004)
	float                                              ch_down_y;                                                // 0x394C(0x0004)
	float                                              ch_left_x;                                                // 0x3950(0x0004)
	float                                              ch_left_y;                                                // 0x3954(0x0004)
	float                                              ch_right_x;                                               // 0x3958(0x0004)
	float                                              ch_right_y;                                               // 0x395C(0x0004)
	float                                              ch_up_width;                                              // 0x3960(0x0004)
	float                                              ch_up_height;                                             // 0x3964(0x0004)
	float                                              ch_down_width;                                            // 0x3968(0x0004)
	float                                              ch_down_height;                                           // 0x396C(0x0004)
	float                                              ch_left_width;                                            // 0x3970(0x0004)
	float                                              ch_left_height;                                           // 0x3974(0x0004)
	float                                              ch_right_width;                                           // 0x3978(0x0004)
	float                                              ch_right_height;                                          // 0x397C(0x0004)
	unsigned long                                      bIsFatigueSoundPlaying : 1;                               // 0x3980(0x0004)
	float                                              fFSoundStartTime;                                         // 0x3984(0x0004)
	int                                                PrevSprintVal;                                            // 0x3988(0x0004)
	unsigned long                                      bShoudPlayFSound : 1;                                     // 0x398C(0x0004)
	class UClass*                                      HudPart_KillMessage_Class;                                // 0x3990(0x0004)
	class AwHudPart_KillMessage*                       HudPart_KillMessage;                                      // 0x3994(0x0004)
	class AwHudPart_Minimap*                           HudPart_Minimap;                                          // 0x3998(0x0004)
	class AwHudPart_Bigmap*                            HudPart_Bigmap;                                           // 0x399C(0x0004)
	unsigned long                                      bShowBigmap : 1;                                          // 0x39A0(0x0004)
	class AwHudPart_DisplayMain*                       HudPart_DisplayMain;                                      // 0x39A4(0x0004)
	class AwHudPart_DisplayEvent*                      HudPart_DisplayEvent;                                     // 0x39A8(0x0004)
	class AwHudPart_SelectQSlot*                       HudPart_SelQuickSlot;                                     // 0x39AC(0x0004)
	class AwHudPart_RadioMessage*                      HudPart_RadioMessage;                                     // 0x39B0(0x0004)
	unsigned char                                      byShowRadioMessage;                                       // 0x39B4(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x39B5(0x0003) MISSED OFFSET
	class AwHudPart_DisplayQuest*                      HudPart_DisplayQuest;                                     // 0x39B8(0x0004)
	class AwHudPart_Tutorial*                          HudPart_Tutorial;                                         // 0x39BC(0x0004)
	class AwHudPart_Tutorial2*                         HudPart_Tutorial2;                                        // 0x39C0(0x0004)
	class AwHudPart_ItemBuy*                           HudPart_ItemBuy;                                          // 0x39C4(0x0004)
	unsigned char                                      byShowItemBuy;                                            // 0x39C8(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x39C9(0x0003) MISSED OFFSET
	class APawn*                                       OldPawnOwner;                                             // 0x39CC(0x0004) (Edit)
	class UwMapInfo*                                   mapInfo;                                                  // 0x39D0(0x0004)
	unsigned long                                      DrawChangeHost : 1;                                       // 0x39D4(0x0004)
	float                                              DrawChangeHostBeginTime;                                  // 0x39D8(0x0004)
	float                                              DrawChangeHostDuration;                                   // 0x39DC(0x0004)
	struct FString                                     MessageChangingHost;                                      // 0x39E0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MessageChangingHostPre;                                   // 0x39EC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MessageChangingHostPost;                                  // 0x39F8(0x000C) (Localized, NeedCtorLink)
	float                                              MessageScoreLastTime;                                     // 0x3A04(0x0004)
	float                                              MessageScoreAccelStep;                                    // 0x3A08(0x0004)
	int                                                MessageScoreEffect;                                       // 0x3A0C(0x0004)
	int                                                MessageScoreAlpha;                                        // 0x3A10(0x0004)
	float                                              ShowTime_NameTag_EnemyWhoKillMe;                          // 0x3A14(0x0004)
	class APawn*                                       ViewTarget;                                               // 0x3A18(0x0004)
	struct FVector                                     AttackerLoc;                                              // 0x3A1C(0x000C)
	unsigned long                                      bClientOnBeginWaitingForStart : 1;                        // 0x3A28(0x0004)
	unsigned long                                      bClientOnEndWaitingForStart : 1;                          // 0x3A28(0x0004)
	struct FSpriteWidget                               WKill;                                                    // 0x3A2C(0x0040) (Edit)
	struct FSpriteWidget                               WKillAim;                                                 // 0x3A6C(0x0040) (Edit)
	struct FSpriteWidget                               WAssist;                                                  // 0x3AAC(0x0040) (Edit)
	struct FSpriteWidget                               WHelikill;                                                // 0x3AEC(0x0040) (Edit)
	struct FSpriteWidget                               WArtillerykill;                                           // 0x3B2C(0x0040) (Edit)
	struct FSpriteWidget                               WSentryGunkill;                                           // 0x3B6C(0x0040) (Edit)
	struct FSpriteWidget                               WCapture;                                                 // 0x3BAC(0x0040) (Edit)
	struct FSpriteWidget                               WBombSetted;                                              // 0x3BEC(0x0040) (Edit)
	struct FSpriteWidget                               WBombDiffused;                                            // 0x3C2C(0x0040) (Edit)
	struct FSpriteWidget                               WFragGrenadeKill;                                         // 0x3C6C(0x0040) (Edit)
	struct FSpriteWidget                               WMeleeKill;                                               // 0x3CAC(0x0040) (Edit)
	struct FSpriteWidget                               WStepOnKill;                                              // 0x3CEC(0x0040) (Edit)
	struct FSpriteWidget                               WSpecialETCKill;                                          // 0x3D2C(0x0040) (Edit)
	struct FSpriteWidget                               WKillSuccession[0xF];                                     // 0x3D6C(0x0040) (Edit)
	struct FSpriteWidget                               WHeadshot;                                                // 0x412C(0x0040) (Edit)
	struct FSpriteWidget                               WHeadshotAim;                                             // 0x416C(0x0040) (Edit)
	struct FSpriteWidget                               WWallShotKill;                                            // 0x41AC(0x0040) (Edit)
	struct FSpriteWidget                               WKillBlood;                                               // 0x41EC(0x0040) (Edit)
	struct FSpriteWidget                               WKillBlood_Teen;                                          // 0x422C(0x0040) (Edit)
	struct FSpriteWidget                               WWarningMark;                                             // 0x426C(0x0040) (Edit)
	float                                              fWarningDelta;                                            // 0x42AC(0x0004) (Edit)
	struct FSpriteWidget                               WAirStrikeMark;                                           // 0x42B0(0x0040) (Edit)
	struct FSpriteWidget                               m_swSentryGunInstallingMessage;                           // 0x42F0(0x0040) (Edit)
	struct FString                                     SndHeartBeatDanagerSound;                                 // 0x4330(0x000C) (NeedCtorLink)
	struct FString                                     SndHeartBeatEmergencySound;                               // 0x433C(0x000C) (NeedCtorLink)
	struct FString                                     SndFallDanagerSound;                                      // 0x4348(0x000C) (NeedCtorLink)
	class UClass*                                      MinimapClass;                                             // 0x4354(0x0004) (Edit)
	float                                              fNoticeOffset;                                            // 0x4358(0x0004)
	TArray<struct FGameNotice>                         aGameNotice;                                              // 0x435C(0x000C) (NeedCtorLink)
	TArray<struct FGameNotice>                         aAASNotice;                                               // 0x4368(0x000C) (NeedCtorLink)

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
	struct FString GetNoticeFirst();
	void DrawSystemNotice(class UCanvas* C);
	void DrawGameNotice(class UCanvas* C);
	void AllDeleteGameNotice();
	void PushAASNotice(const struct FString& sNotice, float beginTime, unsigned char byLevel);
	void PushGameNotice(const struct FString& sNotice);
	void RecGameNotice(const struct FString& sNotice);
	void RecAAS(const struct FString& sNotice, float DrawTime);
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
	void LocalizedMessage(class UClass* Message, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject, const struct FString& CriticalString);
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
	void TutorialEvent(const struct FString& S, const struct FName& Type, const struct FName& reserv);
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
	void DrawObjectSprite2(class UCanvas* C, class UObject* Tag, const struct FSpriteWidget& objectSprite, const struct FVector& objectLoc, const struct FString& ObjectName, int Alpha);
	void DrawObjectSprite3(class UCanvas* C, const struct FSpriteWidget& objectSprite, const struct FVector& objectLoc, bool bNoMeterDisplay);
	struct FVector CalcScreenPos(class UCanvas* C, const struct FVector& objectLoc, float W, float H, bool ClipEclipse, float rX, float rY, unsigned char* clipped);
	void CallSkill(int iKey, bool bRequire, bool bSuccess);
	void DrawSelfKillMessage(class UCanvas* C);
	struct FSelfKillMessage MakeSelfKillMessage(const struct FString& KillerName, const struct FString& VictimName, class UClass* Type);
	void RefreshKillerMark(const struct FString& mKillerName);
	void OnClientReceiveDeathMessage(class APlayerController* P, int Switch, class APlayerReplicationInfo* attackerPRI, class APlayerReplicationInfo* victimPRI, class UObject* OptionalObject);
	void OnClientReceiveFlyingDefenceBotDeathMessage(class APlayerController* P, class APlayerReplicationInfo* attackerPRI, class APlayerReplicationInfo* victimPRI, class UObject* OptionalObject);
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
	void DrawWeaponImage(class UCanvas* C, bool bShowSpectating, struct FString* sWeaponName);
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
	struct FString GetInfoString();
	void ShowEnemyWhoKillMe(class UCanvas* C);
	void DrawSpectatingHud(class UCanvas* C);
	void DrawViewTargetInfo(class UCanvas* C);
	void DrawResultScore(class UCanvas* C);
	bool DrawResult(class UCanvas* C);
	void SendQuestUpdate();
	bool IsInCinematic();
	struct FColor STATIC_GetTeamColor(unsigned char TeamNum);
	struct FString GetScoreTagLine();
	struct FString GetScoreValue(class APlayerReplicationInfo* PRI);
	struct FString GetScoreText();
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
	struct FColor CalcArrayColor(float V, TArray<struct FColor> carray);
	void RenderNavExtraCost();
	void RenderVisCount();
	void RenderInfluence();
	void RenderCoverAngle();
	void RenderRadius();
	void RenderSDFrontLine(bool Full);
	void rendai(const struct FString& v1, const struct FString& v2);
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
// 0x02CC (0x4640 - 0x4374)
class AHudCTeamDeathMatch : public AHudCDeathmatch
{
public:
	struct FNumericWidget                              ScoreTeam[0x2];                                           // 0x4374(0x0030) (Edit)
	struct FNumericWidget                              totalLinks;                                               // 0x43D4(0x0030) (Edit)
	struct FSpriteWidget                               VersusSymbol;                                             // 0x4404(0x0040) (Edit)
	struct FSpriteWidget                               TeamScoreBackGround[0x2];                                 // 0x4444(0x0040) (Edit)
	struct FSpriteWidget                               TeamScoreBackGroundDisc[0x2];                             // 0x44C4(0x0040) (Edit)
	struct FSpriteWidget                               LinkIcon;                                                 // 0x4544(0x0040) (Edit)
	struct FSpriteWidget                               TeamSymbols[0x2];                                         // 0x4584(0x0040) (Edit)
	int                                                Links;                                                    // 0x4604(0x0004) (Edit)
	struct FColor                                      CarrierTextColor1;                                        // 0x4608(0x0004) (Edit)
	struct FColor                                      CarrierTextColor2;                                        // 0x460C(0x0004) (Edit)
	struct FColor                                      CarrierTextColor3;                                        // 0x4610(0x0004) (Edit)
	struct FString                                     CarriersName;                                             // 0x4614(0x000C) (Edit, NeedCtorLink)
	struct FString                                     CarriersLocation;                                         // 0x4620(0x000C) (Edit, NeedCtorLink)
	float                                              CNPosX;                                                   // 0x462C(0x0004) (Edit)
	float                                              CNPosY;                                                   // 0x4630(0x0004) (Edit)
	struct FString                                     LinkEstablishedMessage;                                   // 0x4634(0x000C) (Localized, NeedCtorLink)

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
// 0x18D4 (0x2588 - 0x0CB4)
class AwHudPart_DisplayBase : public AHudBase
{
public:
	class AHudBase*                                    HudOwner;                                                 // 0x0CB4(0x0004)
	class UwMapInfo*                                   mapInfo;                                                  // 0x0CB8(0x0004)
	float                                              MaxAlpha;                                                 // 0x0CBC(0x0004)
	float                                              MinAlpha;                                                 // 0x0CC0(0x0004)
	struct FString                                     lsScore;                                                  // 0x0CC4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsRanking;                                                // 0x0CD0(0x000C) (Localized, NeedCtorLink)
	struct FColor                                      color_Default;                                            // 0x0CDC(0x0004)
	struct FColor                                      color_Orange;                                             // 0x0CE0(0x0004)
	struct FColor                                      color_Shadow;                                             // 0x0CE4(0x0004)
	struct FSpriteWidget                               WKeyButtonBGSmall;                                        // 0x0CE8(0x0040) (Edit)
	struct FSpriteWidget                               WKeyButtonBGSmallBlink;                                   // 0x0D28(0x0040) (Edit)
	struct FSpriteWidget                               WKeyButtonBG;                                             // 0x0D68(0x0040) (Edit)
	struct FSpriteWidget                               WKeyButtonBGBlink;                                        // 0x0DA8(0x0040) (Edit)
	struct FSpriteWidget                               WKeyButtonBGBig;                                          // 0x0DE8(0x0040) (Edit)
	struct FSpriteWidget                               WKeyButtonBGBigBlink;                                     // 0x0E28(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonNumber[0xA];                                 // 0x0E68(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonAlphaBet[0x1A];                              // 0x10E8(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonSpecial[0x25];                               // 0x1768(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonFunction[0xD];                               // 0x20A8(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonNone;                                        // 0x23E8(0x0040) (Edit)
	struct FSpriteWidget                               WKeyButtonBigF[0x2];                                      // 0x2428(0x0040) (Edit)
	struct FSpriteWidget                               WRespawnBG;                                               // 0x24A8(0x0040) (Edit)
	struct FSpriteWidget                               WRespawnGauge;                                            // 0x24E8(0x0040) (Edit)
	TArray<struct FString>                             keys;                                                     // 0x2528(0x000C) (NeedCtorLink)
	TArray<struct FString>                             LocalizedKeys;                                            // 0x2534(0x000C) (NeedCtorLink)
	struct FString                                     sKeyBtnHeli;                                              // 0x2540(0x000C) (NeedCtorLink)
	struct FString                                     sKeyBtnAirStrike;                                         // 0x254C(0x000C) (NeedCtorLink)
	struct FString                                     sKeyBtnUAV;                                               // 0x2558(0x000C) (NeedCtorLink)
	struct FString                                     skeyUseKey;                                               // 0x2564(0x000C) (NeedCtorLink)
	struct FString                                     skeyWeaponReload;                                         // 0x2570(0x000C) (NeedCtorLink)
	struct FString                                     skeyBtnC4;                                                // 0x257C(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_DisplayBase");
		return ptr;
	}


	void UpdateHelpKeyControll();
	struct FString GetEllipsString(class UCanvas* C, const struct FString& strText, float fLimitWidth, float FontSize);
	bool GetKeyTexture(const struct FString& sKey, float OffsetX, struct FSpriteWidget* W, float* fWidth);
	void Initialize(class AHudBase* myOwner, class ALevelInfo* Level);
};


// Class XInterface.wHudPart_SelectQSlot
// 0x07F0 (0x2D78 - 0x2588)
class AwHudPart_SelectQSlot : public AwHudPart_DisplayBase
{
public:
	struct FString                                     strChangeQS[0x6];                                         // 0x2588(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strChangeQSInPlayerWalking;                               // 0x25D0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strCloseQSTime;                                           // 0x25DC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strCloseQSDistance;                                       // 0x25E8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strQSContent[0xB];                                        // 0x25F4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     CapBaseWeaponSet;                                         // 0x2678(0x000C) (Localized, NeedCtorLink)
	struct FString                                     srtQSNothing;                                             // 0x2684(0x000C) (Localized, NeedCtorLink)
	int                                                QuickSlotWindowShowTime;                                  // 0x2690(0x0004)
	int                                                QuickSlotWindowStartTime;                                 // 0x2694(0x0004)
	struct FString                                     strWeaponChange[0x2];                                     // 0x2698(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strQSButtonZ;                                             // 0x26B0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strToggleQS[0x2];                                         // 0x26BC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strUsing;                                                 // 0x26D4(0x000C) (Localized, NeedCtorLink)
	struct FColor                                      colorLeftTime;                                            // 0x26E0(0x0004)
	struct FColor                                      colorQS;                                                  // 0x26E4(0x0004)
	struct FColor                                      colorQSSelect;                                            // 0x26E8(0x0004)
	struct FColor                                      colorQSContent;                                           // 0x26EC(0x0004)
	struct FFloatBox                                   fbQSBack;                                                 // 0x26F0(0x0010)
	struct FFloatBox                                   fbQSButton[0x5];                                          // 0x2700(0x0010)
	struct FFloatBox                                   fbQSButtonZ;                                              // 0x2750(0x0010)
	struct FFloatBox                                   fbQSButtonOpen;                                           // 0x2760(0x0010)
	struct FFloatBox                                   fbQSContentName[0x5];                                     // 0x2770(0x0010)
	struct FFloatBox                                   fbQSContent[0x5];                                         // 0x27C0(0x0010)
	struct FFloatBox                                   fbQSBack_Content;                                         // 0x2810(0x0010)
	struct FFloatBox                                   fbQS_Content_Text;                                        // 0x2820(0x0010)
	struct FFloatBox                                   fbQS_Content_Text_Default;                                // 0x2830(0x0010)
	struct FFloatBox                                   fbQSBack_ItemContent[0x5];                                // 0x2840(0x0010)
	struct FFloatBox                                   fbQSBack_ItemImage;                                       // 0x2890(0x0010)
	class ALevelInfo*                                  Level;                                                    // 0x28A0(0x0004)
	float                                              LevelStartTime;                                           // 0x28A4(0x0004)
	unsigned long                                      bStartChangeQS : 1;                                       // 0x28A8(0x0004)
	unsigned long                                      bPrevIsStatePlayerWalking : 1;                            // 0x28A8(0x0004)
	unsigned long                                      bCurrentIsStatePlayerWalking : 1;                         // 0x28A8(0x0004)
	unsigned long                                      bPrevIsStateDead : 1;                                     // 0x28A8(0x0004)
	unsigned long                                      bCurrentIsStateDead : 1;                                  // 0x28A8(0x0004)
	unsigned long                                      bPrevIsStateRoundEnded : 1;                               // 0x28A8(0x0004)
	unsigned long                                      bCurrentIsStateRoundEnded : 1;                            // 0x28A8(0x0004)
	unsigned long                                      bCurrentIsStateSpectate : 1;                              // 0x28A8(0x0004)
	unsigned long                                      bPrevIsStateWaitingForStart : 1;                          // 0x28A8(0x0004)
	unsigned long                                      bCurrentIsStateWaitingForStart : 1;                       // 0x28A8(0x0004)
	unsigned long                                      bTimeLimitOff : 1;                                        // 0x28A8(0x0004)
	int                                                PrevSelectedQSlotIndex;                                   // 0x28AC(0x0004)
	int                                                ContentOffSetX[0x6];                                      // 0x28B0(0x0004)
	int                                                ContentOffSetY[0x9];                                      // 0x28C8(0x0004)
	struct FString                                     strQS[0x7];                                               // 0x28EC(0x000C) (NeedCtorLink)
	int                                                iFontSize0;                                               // 0x2940(0x0004)
	int                                                iFontSize1;                                               // 0x2944(0x0004)
	int                                                iFontSize2;                                               // 0x2948(0x0004)
	int                                                iFontSize3;                                               // 0x294C(0x0004)
	struct FSpriteWidget                               HelpKeyButtonQSlot;                                       // 0x2950(0x0040) (Edit)
	float                                              WidthButtonQSlot;                                         // 0x2990(0x0004)
	unsigned long                                      bUpdate : 1;                                              // 0x2994(0x0004)
	struct FFloatBox                                   fbQSBack_SlotName[0x4];                                   // 0x2998(0x0010)
	TArray<struct FsQuickSlot>                         QuickSlotList;                                            // 0x29D8(0x000C) (NeedCtorLink)
	unsigned long                                      bLoadDefaultItemResource : 1;                             // 0x29E4(0x0004)
	unsigned long                                      bLoadSlotItemResource : 1;                                // 0x29E4(0x0004)
	struct FImage                                      mDefaultItemImage[0x4];                                   // 0x29E8(0x0020)
	struct FImage                                      mQuickSlotItemImage[0x14];                                // 0x2A68(0x0020)
	struct FFloatBox                                   fWeaponUV[0x9];                                           // 0x2CE8(0x0010)

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
// 0x0674 (0x1328 - 0x0CB4)
class AwHudPart_MinimapBase : public AHudBase
{
public:
	class AHudBase*                                    HudOwner;                                                 // 0x0CB4(0x0004)
	class ALevelInfo*                                  Level;                                                    // 0x0CB8(0x0004)
	struct FSpriteWidget                               MinimapBG;                                                // 0x0CBC(0x0040) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FSpriteWidget                               MinimapBGMap;                                             // 0x0CFC(0x0040) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FSpriteWidget                               MinimapCompass;                                           // 0x0D3C(0x0040) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FSpriteWidget                               MinimapFlatTop;                                           // 0x0D7C(0x0040) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FSpriteWidget                               MinimapFlatBottom;                                        // 0x0DBC(0x0040) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FSpriteWidget                               MinimapMyself;                                            // 0x0DFC(0x0040) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UMaterial*                                   MinimapMatMyself;                                         // 0x0E3C(0x0004)
	class UMaterial*                                   MinimapMatAlly;                                           // 0x0E40(0x0004)
	class UMaterial*                                   MinimapMatAttackingAlly;                                  // 0x0E44(0x0004)
	class UMaterial*                                   MinimapFCMatAlly;                                         // 0x0E48(0x0004)
	class UMaterial*                                   MinimapFCMatAttackingAlly;                                // 0x0E4C(0x0004)
	class UMaterial*                                   MinimapMatRadioMessage;                                   // 0x0E50(0x0004)
	struct FSpriteWidget                               MinimapDeadAlly;                                          // 0x0E54(0x0040) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	TArray<struct FSpriteWidget>                       MinimapAttackingEnemies;                                  // 0x0E94(0x000C) (Edit, NeedCtorLink)
	TArray<struct FSpriteWidget>                       MinimapDeadEnemies;                                       // 0x0EA0(0x000C) (Edit, NeedCtorLink)
	TArray<struct FMinimapDeadInfo>                    MinimapDeadInfos;                                         // 0x0EAC(0x000C) (Edit, NeedCtorLink)
	struct FSpriteWidget                               MinimapAlien;                                             // 0x0EB8(0x0040)
	struct FSpriteWidget                               MinimapStrikeAlly;                                        // 0x0EF8(0x0040) (Edit)
	struct FSpriteWidget                               MinimapStrikeEnem;                                        // 0x0F38(0x0040) (Edit)
	struct FSpriteWidget                               MinimapAirStrikeRect;                                     // 0x0F78(0x0040) (Edit)
	struct FSpriteWidget                               MinimapAirStrikeAllyRect;                                 // 0x0FB8(0x0040) (Edit)
	struct FSpriteWidget                               MinimapAirStrikeEnemRect;                                 // 0x0FF8(0x0040) (Edit)
	int                                                MinimapCompassVisibleWidth;                               // 0x1038(0x0004) (Edit)
	int                                                MinimapCompassNorthPoint;                                 // 0x103C(0x0004) (Edit)
	int                                                MinimapCompassWidth;                                      // 0x1040(0x0004) (Edit)
	int                                                MinimapCenterX;                                           // 0x1044(0x0004) (Edit)
	int                                                MinimapCenterY;                                           // 0x1048(0x0004) (Edit)
	int                                                MinimapSize;                                              // 0x104C(0x0004) (Edit)
	int                                                MinimapCoverSize;                                         // 0x1050(0x0004) (Edit)
	float                                              MinimapScale;                                             // 0x1054(0x0004) (Edit)
	int                                                MinimapDrawBuffer;                                        // 0x1058(0x0004) (Edit)
	float                                              MinimapAllyFireNotificationDuration;                      // 0x105C(0x0004) (Edit)
	float                                              MinimapEnemyDrawDuration_Pre;                             // 0x1060(0x0004) (Edit)
	float                                              MinimapEnemyDrawDuration_Post;                            // 0x1064(0x0004) (Edit)
	float                                              DeadDrawDuration;                                         // 0x1068(0x0004) (Edit)
	float                                              MinimapAllyRadioMessageDuration;                          // 0x106C(0x0004) (Edit)
	float                                              fBlinkTimeLen;                                            // 0x1070(0x0004) (Edit)
	float                                              fBlinkTerm;                                               // 0x1074(0x0004) (Edit)
	struct FSpriteWidget                               MinimapIconAlly;                                          // 0x1078(0x0040)
	struct FSpriteWidget                               MinimapIconEnemy;                                         // 0x10B8(0x0040)
	struct FSpriteWidget                               MinimapIconEnemyBoss[0x3];                                // 0x10F8(0x0040)
	struct FSpriteWidget                               MinimapIconEnemyBossBlend[0x3];                           // 0x11B8(0x0040)
	int                                                MinimapIconEnemyID[0x3];                                  // 0x1278(0x0004)
	TArray<class UClass*>                              SpecialPositions_Class;                                   // 0x1284(0x000C) (NeedCtorLink)
	TArray<class UMaterial*>                           SpecialPositions_Image;                                   // 0x1290(0x000C) (NeedCtorLink)
	float                                              UpdateTime_SpecialPositions;                              // 0x129C(0x0004)
	TArray<struct FCachedSpecialPosInfo>               CachedSpecialPositions;                                   // 0x12A0(0x000C) (NeedCtorLink)
	struct FColor                                      BaseColor;                                                // 0x12AC(0x0004)
	float                                              IconSizeF;                                                // 0x12B0(0x0004)
	unsigned long                                      DrawFrame : 1;                                            // 0x12B4(0x0004)
	unsigned long                                      DrawCompass : 1;                                          // 0x12B4(0x0004)
	unsigned long                                      DrawNorthPole : 1;                                        // 0x12B4(0x0004)
	class UVariableTexPanner*                          UAVBG_Base;                                               // 0x12B8(0x0004)
	class UTexRotator*                                 UAVBG;                                                    // 0x12BC(0x0004)
	struct FVector                                     t1;                                                       // 0x12C0(0x000C)
	struct FVector                                     t2;                                                       // 0x12CC(0x000C)
	struct FVector                                     w1;                                                       // 0x12D8(0x000C)
	struct FVector                                     w2;                                                       // 0x12E4(0x000C)
	struct FVector                                     tPerW;                                                    // 0x12F0(0x000C)
	unsigned long                                      IsDrawSpecialPositions : 1;                               // 0x12FC(0x0004)
	unsigned long                                      IsClampDistance_SpecialPositions : 1;                     // 0x12FC(0x0004)
	float                                              ClampDistance;                                            // 0x1300(0x0004)
	float                                              ClampDistance_SpecialPositions;                           // 0x1304(0x0004)
	struct FVector                                     tempVect;                                                 // 0x1308(0x000C)
	struct FRotator                                    tempRot;                                                  // 0x1314(0x000C)
	struct FScriptDelegate                             __OnPreDrawMyself__Delegate;                              // 0x1320(0x000C) (NeedCtorLink)

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
	struct FString                                     Clan;                                                     // 0x0494(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Rank;                                                     // 0x04A0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     NickName;                                                 // 0x04AC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Score;                                                    // 0x04B8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Kill;                                                     // 0x04C4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Death;                                                    // 0x04D0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Assist;                                                   // 0x04DC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Ping;                                                     // 0x04E8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     bonus;                                                    // 0x04F4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Exp;                                                      // 0x0500(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Point;                                                    // 0x050C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     TeamScore;                                                // 0x0518(0x000C) (Localized, NeedCtorLink)
	struct FString                                     OK;                                                       // 0x0524(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Ranking;                                                  // 0x0530(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Score_1;                                                  // 0x053C(0x000C) (Localized, NeedCtorLink)
	float                                              ScreenRatioXEx;                                           // 0x0548(0x0004)
	float                                              ScreenRatioYEx;                                           // 0x054C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.xScoreBoard");
		return ptr;
	}


	struct FString GetEllipsString(class UCanvas* C, const struct FString& strText, float fLimitWidth, float FontSize);
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
	unsigned long                                      IndicateDeads : 1;                                        // 0x0850(0x0004)
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
	struct FString                                     GameDescriptionText;                                      // 0x093C(0x000C) (NeedCtorLink)
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
	struct FString                                     MissionNameTD;                                            // 0x09B4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionNameSD;                                            // 0x09C0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionNameDOMI;                                          // 0x09CC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionNameSBT;                                           // 0x09D8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionNameDM;                                            // 0x09E4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionNameFM;                                            // 0x09F0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionNameTM;                                            // 0x09FC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionNameDF;                                            // 0x0A08(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionNameDOA;                                           // 0x0A14(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentTD1;                                        // 0x0A20(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentTD2;                                        // 0x0A2C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentSDA1;                                       // 0x0A38(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentSDA2;                                       // 0x0A44(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentSDD1;                                       // 0x0A50(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentSDD2;                                       // 0x0A5C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentDOMI1;                                      // 0x0A68(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentDOMI2;                                      // 0x0A74(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentSBT1;                                       // 0x0A80(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentSBT2;                                       // 0x0A8C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentDM1;                                        // 0x0A98(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentDM2;                                        // 0x0AA4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentFM1;                                        // 0x0AB0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentFM2;                                        // 0x0ABC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentTM1;                                        // 0x0AC8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentTM2;                                        // 0x0AD4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentDF1;                                        // 0x0AE0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MissionCommentDOA;                                        // 0x0AEC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     StrLoading;                                               // 0x0AF8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     WeaponLimitKnifeOnly;                                     // 0x0B04(0x000C) (Localized, NeedCtorLink)
	struct FString                                     WeaponLimitPistolOnly;                                    // 0x0B10(0x000C) (Localized, NeedCtorLink)
	struct FString                                     WeaponLimitGrenadeOnly;                                   // 0x0B1C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     WeaponLimitRPGOnly;                                       // 0x0B28(0x000C) (Localized, NeedCtorLink)
	struct FString                                     WeaponLimitSROnly;                                        // 0x0B34(0x000C) (Localized, NeedCtorLink)
	struct FString                                     WeaponLimitSRBan;                                         // 0x0B40(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MapName;                                                  // 0x0B4C(0x000C) (NeedCtorLink)
	struct FString                                     MissionInfo;                                              // 0x0B58(0x000C) (NeedCtorLink)
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
	TArray<struct FSpriteWidget>                       WStripeBar;                                               // 0x0F24(0x000C) (Edit, NeedCtorLink)
	struct FSpriteWidget                               WIconMaster;                                              // 0x0F30(0x0040) (Edit)
	struct FSpriteWidget                               WIconDeath;                                               // 0x0F70(0x0040) (Edit)
	struct FSpriteWidget                               WPingBack;                                                // 0x0FB0(0x0040)
	struct FSpriteWidget                               WPing;                                                    // 0x0FF0(0x0040)
	TArray<struct FSpriteWidget>                       WTxtGameType;                                             // 0x1030(0x000C) (Edit, NeedCtorLink)
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
	TArray<struct FNumericWidget>                      DigitsAFScore;                                            // 0x1304(0x000C) (Edit, NeedCtorLink)
	TArray<struct FNumericWidget>                      DigitsRSAScore;                                           // 0x1310(0x000C) (Edit, NeedCtorLink)
	TArray<struct FNumericWidget>                      DigitsGoalScore;                                          // 0x131C(0x000C) (Edit, NeedCtorLink)
	TArray<struct FNumericWidget>                      DigitsFFAGoalScore;                                       // 0x1328(0x000C) (Edit, NeedCtorLink)
	TArray<struct FNumericWidget>                      DigitsTime;                                               // 0x1334(0x000C) (Edit, NeedCtorLink)
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
	void MissonComment(class UCanvas* C, float X1, float Y1, float X2, float Y2, const struct FString& MN);
	struct FString GetStringGoalScore();
	void DrawMissonComment(class UCanvas* C);
	struct FString GetStringPlayMode();
	void SetMissionInfo();
	void DrawTeamScoreAndTimer(class UCanvas* C, int _iPosX, int _iPosY);
	void DrawRankingInfo_Text(class UCanvas* C, class APlayerReplicationInfo* currPRI, float _iPosX, float _iPosY, const struct FColor& FontColor);
	void DrawRankingInfo_Mark(class UCanvas* C, class APlayerReplicationInfo* currPRI, float _iPosX, float _iPosY);
	void DrawRankingInfo(class UCanvas* C, class APlayerReplicationInfo* currPRI, float _iPosX, float _iPosY);
	void DrawFFAScore(class UCanvas* C, float _iPosX, float _iPosY);
	void DrawGameInfo(class UCanvas* C);
	void RankingSorting(int iCurrent, int iNext, TArray<class APlayerReplicationInfo*>* pris);
	void DrawTeamListSection(class UCanvas* C);
	void DrawPersonListSection_C(class UCanvas* C, int lpTeam, class APlayerReplicationInfo* currPRI, int memberCount, const struct FString& HostName, float beginY, float markBeginY, float markPingY);
	void DrawTeamListSection_C(class UCanvas* C, int lpTeam, class APlayerReplicationInfo* currPRI, int memberCount, const struct FString& HostName, float beginY, float markBeginY, float markPingY);
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
	struct FString                                     RankText;                                                 // 0x043C(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     PlayerText;                                               // 0x0448(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     PointsText;                                               // 0x0454(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     TimeText;                                                 // 0x0460(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     PingText;                                                 // 0x046C(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     PLText;                                                   // 0x0478(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     DeathsText;                                               // 0x0484(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     AdminText;                                                // 0x0490(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     NetText;                                                  // 0x049C(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     FooterText;                                               // 0x04A8(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     MatchIDText;                                              // 0x04B4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     OutText;                                                  // 0x04C0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     OutFireText;                                              // 0x04CC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ReadyText;                                                // 0x04D8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     NotReadyText;                                             // 0x04E4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     SkillLevel[0x8];                                          // 0x04F0(0x000C) (Localized, NeedCtorLink)
	class APlayerReplicationInfo*                      PRIArray[0x20];                                           // 0x0550(0x0004)
	float                                              FPHTime;                                                  // 0x05D0(0x0004)
	struct FString                                     MaxLives;                                                 // 0x05D4(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     FragLimit;                                                // 0x05E0(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     FPH;                                                      // 0x05EC(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     GameType;                                                 // 0x05F8(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     MapName;                                                  // 0x0604(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     Restart;                                                  // 0x0610(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     Continue;                                                 // 0x061C(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     Ended;                                                    // 0x0628(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     TimeLimit;                                                // 0x0634(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     Spacer;                                                   // 0x0640(0x000C) (Edit, Localized, NeedCtorLink)
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
	struct FString GetDefaultScoreInfoString();
	struct FString GetRestartString();
	struct FString GetTitleString();
	void DrawTitle(class UCanvas* Canvas, float HeaderOffsetY, float PlayerAreaY, float PlayerBoxSizeY);
	void UpdatePrecacheFonts();
	void UpdatePrecacheMaterials();
};


// Class XInterface.wHudPart_Tutorial
// 0x03D8 (0x2960 - 0x2588)
class AwHudPart_Tutorial : public AwHudPart_DisplayBase
{
public:
	struct FString                                     lsQKill3Enemy;                                            // 0x2588(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQKillAim;                                               // 0x2594(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQSprint;                                                // 0x25A0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMeleeAttack;                                           // 0x25AC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQKillWithGrenade;                                       // 0x25B8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQComplete;                                              // 0x25C4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsNext;                                                   // 0x25D0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQStartTutorial;                                         // 0x25DC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCStartTutorial;                                         // 0x25E8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQQuitTutorial;                                          // 0x25F4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCQuitTutorial;                                          // 0x2600(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCKill3Enemy;                                            // 0x260C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCKillAim;                                               // 0x2618(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCSprint;                                                // 0x2624(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMeleeAttack;                                           // 0x2630(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCKillWithGrenade;                                       // 0x263C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     SoundQuest;                                               // 0x2648(0x000C) (NeedCtorLink)
	class USound*                                      SoundQuestEnd;                                            // 0x2654(0x0004)
	int                                                iGoal;                                                    // 0x2658(0x0004)
	int                                                iCurrent;                                                 // 0x265C(0x0004)
	int                                                iProgress;                                                // 0x2660(0x0004)
	struct FString                                     SQuest;                                                   // 0x2664(0x000C) (NeedCtorLink)
	struct FString                                     sComment;                                                 // 0x2670(0x000C) (NeedCtorLink)
	struct FString                                     sComment2;                                                // 0x267C(0x000C) (NeedCtorLink)
	unsigned long                                      bDrawMessage : 1;                                         // 0x2688(0x0004)
	unsigned long                                      bDrawMessage_QuestComplete : 1;                           // 0x2688(0x0004)
	unsigned long                                      bDrawKey : 1;                                             // 0x2688(0x0004)
	unsigned long                                      bDrawBGKey : 1;                                           // 0x2688(0x0004)
	unsigned long                                      bDrawProgress : 1;                                        // 0x2688(0x0004)
	unsigned long                                      bOnEndMessage : 1;                                        // 0x2688(0x0004)
	float                                              fBeginMessageTime;                                        // 0x268C(0x0004)
	float                                              fMessageDrawTime;                                         // 0x2690(0x0004)
	float                                              fFadeOutTime;                                             // 0x2694(0x0004)
	float                                              fKeyWidth;                                                // 0x2698(0x0004)
	float                                              fKeyHight;                                                // 0x269C(0x0004)
	struct FSpriteWidget                               WQuestBG1;                                                // 0x26A0(0x0040) (Edit)
	struct FSpriteWidget                               WQuestBG2;                                                // 0x26E0(0x0040) (Edit)
	struct FSpriteWidget                               WQuestBGKey;                                              // 0x2720(0x0040) (Edit)
	struct FSpriteWidget                               WQuestBGKeyShift;                                         // 0x2760(0x0040) (Edit)
	struct FSpriteWidget                               WQuestBGKeyE;                                             // 0x27A0(0x0040) (Edit)
	struct FSpriteWidget                               WQuestKey;                                                // 0x27E0(0x0040) (Edit)
	struct FSpriteWidget                               WQuestKeyShift;                                           // 0x2820(0x0040) (Edit)
	struct FSpriteWidget                               WQuestKeyMouse;                                           // 0x2860(0x0040) (Edit)
	struct FSpriteWidget                               WQuestKeyLeftMouse;                                       // 0x28A0(0x0040) (Edit)
	struct FSpriteWidget                               WQuestKeyRightMouse;                                      // 0x28E0(0x0040) (Edit)
	struct FSpriteWidget                               WQuestKeyE;                                               // 0x2920(0x0040) (Edit)

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
// 0x0658 (0x2FB8 - 0x2960)
class AwHudPart_Tutorial2 : public AwHudPart_Tutorial
{
public:
	struct FString                                     lsStartComment;                                           // 0x2960(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsStartComment2;                                          // 0x296C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQOnFocus;                                               // 0x2978(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCOnFocus;                                               // 0x2984(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQOnFocusEnd;                                            // 0x2990(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCOnFocusEnd;                                            // 0x299C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveControlA;                                          // 0x29A8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveControlA;                                          // 0x29B4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveControlD;                                          // 0x29C0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveControlD;                                          // 0x29CC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveControlW;                                          // 0x29D8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveControlW;                                          // 0x29E4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveControlS;                                          // 0x29F0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveControlS;                                          // 0x29FC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveControlQ;                                          // 0x2A08(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveControlQ;                                          // 0x2A14(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveTrainingField;                                     // 0x2A20(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveTrainingField;                                     // 0x2A2C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveComplete;                                          // 0x2A38(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCNext01;                                                // 0x2A44(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveWalking;                                           // 0x2A50(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveWalking;                                           // 0x2A5C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveWalkingEnd;                                        // 0x2A68(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveWalkingEnd;                                        // 0x2A74(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveDucking;                                           // 0x2A80(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveDucking;                                           // 0x2A8C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveDuckingEnd;                                        // 0x2A98(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveDuckingEnd;                                        // 0x2AA4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveProne;                                             // 0x2AB0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveProne;                                             // 0x2ABC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveProneEnd;                                          // 0x2AC8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveProneEnd;                                          // 0x2AD4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveJump;                                              // 0x2AE0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveJump;                                              // 0x2AEC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveJumpEnd;                                           // 0x2AF8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveJumpEnd;                                           // 0x2B04(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveLadder;                                            // 0x2B10(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveLadder;                                            // 0x2B1C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveLadderEnd;                                         // 0x2B28(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveLadderEnd;                                         // 0x2B34(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQJumpDown;                                              // 0x2B40(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCJumpDown;                                              // 0x2B4C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQJumpDownEnd;                                           // 0x2B58(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCJumpDownEnd;                                           // 0x2B64(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQRecoveryHealth;                                        // 0x2B70(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCRecoveryHealth;                                        // 0x2B7C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQRecoveryHealthEnd;                                     // 0x2B88(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCRecoveryHealthEnd;                                     // 0x2B94(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveSprint;                                            // 0x2BA0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveSprint;                                            // 0x2BAC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveSprintEnd;                                         // 0x2BB8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveSprintEnd;                                         // 0x2BC4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQDoFire;                                                // 0x2BD0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCDoFire;                                                // 0x2BDC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQDoFireEnd;                                             // 0x2BE8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCDoFireEnd;                                             // 0x2BF4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQDoFireAim;                                             // 0x2C00(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCDoFireAim;                                             // 0x2C0C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQDoFireAimEnd;                                          // 0x2C18(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCDoFireAimEnd;                                          // 0x2C24(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQDoFireMelee;                                           // 0x2C30(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCDoFireMelee;                                           // 0x2C3C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQDoFireMeleeEnd;                                        // 0x2C48(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCDoFireMeleeEnd;                                        // 0x2C54(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveTrainingField2;                                    // 0x2C60(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveTrainingField2;                                    // 0x2C6C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQPickUpRocketLauncher;                                  // 0x2C78(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCPickUpRocketLauncher;                                  // 0x2C84(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQDoFireRocketLauncher;                                  // 0x2C90(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCDoFireRocketLauncher;                                  // 0x2C9C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQDoFireRocketLauncherEnd;                               // 0x2CA8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCDoFireRocketLauncherEnd;                               // 0x2CB4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQMoveTrainingField3;                                    // 0x2CC0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCMoveTrainingField3;                                    // 0x2CCC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQDoThrowingWeapon;                                      // 0x2CD8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCDoThrowingWeapon;                                      // 0x2CE4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQDoThrowingWeaponEnd;                                   // 0x2CF0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCDoThrowingWeaponEnd;                                   // 0x2CFC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQBattleAIBot;                                           // 0x2D08(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCBattleAIBot;                                           // 0x2D14(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsQBattleAIBotEnd;                                        // 0x2D20(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCBattleAIBotEnd;                                        // 0x2D2C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsAIBotTime;                                              // 0x2D38(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsAIBotKillCount;                                         // 0x2D44(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsGiftPoint;                                              // 0x2D50(0x000C) (Localized, NeedCtorLink)
	struct FVector                                     vOldLocation;                                             // 0x2D5C(0x000C)
	float                                              fMoveLength;                                              // 0x2D68(0x0004)
	int                                                iTriggerID;                                               // 0x2D6C(0x0004)
	unsigned long                                      IsFadeOut : 1;                                            // 0x2D70(0x0004)
	unsigned long                                      bDrawBeginTutorial : 1;                                   // 0x2D70(0x0004)
	unsigned long                                      bAIBotScore : 1;                                          // 0x2D70(0x0004)
	float                                              fAIBotBeginTime;                                          // 0x2D74(0x0004)
	float                                              fAIBotEndTime;                                            // 0x2D78(0x0004)
	int                                                iTutorialID;                                              // 0x2D7C(0x0004)
	int                                                iOldTutorialID;                                           // 0x2D80(0x0004)
	int                                                iStartTutorialID;                                         // 0x2D84(0x0004)
	int                                                aQuestID[0x11];                                           // 0x2D88(0x0004)
	int                                                iCurrentQuestID;                                          // 0x2DCC(0x0004)
	int                                                iStartQuestID;                                            // 0x2DD0(0x0004)
	int                                                iGiftItemID;                                              // 0x2DD4(0x0004)
	unsigned long                                      bDrawItem : 1;                                            // 0x2DD8(0x0004)
	unsigned long                                      bNoUpdate : 1;                                            // 0x2DD8(0x0004)
	float                                              fTotalDrawTime;                                           // 0x2DDC(0x0004)
	float                                              fDrawItemTime;                                            // 0x2DE0(0x0004)
	float                                              fDrawEffectTime;                                          // 0x2DE4(0x0004)
	float                                              fDrawEffectTime1;                                         // 0x2DE8(0x0004)
	float                                              fDrawEffectTime2;                                         // 0x2DEC(0x0004)
	float                                              fDrawEffectTime3;                                         // 0x2DF0(0x0004)
	float                                              fFadeOutTime;                                             // 0x2DF4(0x0004)
	float                                              fBeginDrawItem;                                           // 0x2DF8(0x0004)
	float                                              fEndOfLife;                                               // 0x2DFC(0x0004)
	float                                              callLastTime;                                             // 0x2E00(0x0004)
	float                                              callAccelStep;                                            // 0x2E04(0x0004)
	int                                                iDrawEffectState;                                         // 0x2E08(0x0004)
	struct FSpriteWidget                               WGiftItemPopBG;                                           // 0x2E0C(0x0040)
	struct FSpriteWidget                               WGiftItemPopBG2;                                          // 0x2E4C(0x0040)
	struct FSpriteWidget                               WGiftItemBG;                                              // 0x2E8C(0x0040)
	struct FSpriteWidget                               WGiftItem;                                                // 0x2ECC(0x0040)
	struct FString                                     lsGiftItem;                                               // 0x2F0C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strGiftItemBG;                                            // 0x2F18(0x000C) (NeedCtorLink)
	struct FString                                     strRes_Icon;                                              // 0x2F24(0x000C) (NeedCtorLink)
	struct FSpriteWidget                               WNoticeExitBG;                                            // 0x2F30(0x0040)
	struct FString                                     lsNoticeExit;                                             // 0x2F70(0x000C) (Localized, NeedCtorLink)
	unsigned char                                      Grade_BasicMovement;                                      // 0x2F7C(0x0001)
	unsigned char                                      Grade_AdvancedMovement;                                   // 0x2F7D(0x0001)
	unsigned char                                      Grade_Shooting;                                           // 0x2F7E(0x0001)
	unsigned char                                      Grade_Grenade;                                            // 0x2F7F(0x0001)
	unsigned char                                      Grade_Battle;                                             // 0x2F80(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x2F81(0x0003) MISSED OFFSET
	float                                              ResultGrade;                                              // 0x2F84(0x0004)
	float                                              fElapsedTime_BasicMovement;                               // 0x2F88(0x0004)
	float                                              fElapsedTime_AdvancedMovement;                            // 0x2F8C(0x0004)
	float                                              fElapsedTime_Shooting;                                    // 0x2F90(0x0004)
	float                                              fElapsedTime_Grenade;                                     // 0x2F94(0x0004)
	float                                              fElapsedTime_Battle;                                      // 0x2F98(0x0004)
	float                                              fCheckStartTime_Basic;                                    // 0x2F9C(0x0004)
	float                                              fCheckStartTime_Advanced;                                 // 0x2FA0(0x0004)
	float                                              fCheckStartTime_Shooting;                                 // 0x2FA4(0x0004)
	float                                              fCheckStartTime_Grenade;                                  // 0x2FA8(0x0004)
	float                                              fCheckStartTime_Battle;                                   // 0x2FAC(0x0004)
	struct FScriptDelegate                             __OnTutorialResult__Delegate;                             // 0x2FB0(0x000C) (NeedCtorLink)

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
	void EnableShootTarget(const struct FName& eventTag);
	void GotoTutorial(int iQuestID);
	void CheckStartTutorial();
	void BeginDrawItem();
	void OnBeginTutorial();
	void ResetProgress();
	void Initialize(class AHudBase* myOwner, class ALevelInfo* Level);
	class AMover* EnableTriggerEvent(const struct FName& EventName, class AActor* Other, class APawn* EventInstigator);
	class AMover* DisableTriggerEvent(const struct FName& EventName, class AActor* Other, class APawn* EventInstigator);
	void TutorialEvent(const struct FString& S, const struct FName& Type, const struct FName& reserv);
	void OnTutorialResult(int iTutorialID, int iCurrent, bool bCompleted);
	void OnQuest();
};


// Class XInterface.xScoreBoardTutorial
// 0x0130 (0x1538 - 0x1408)
class AxScoreBoardTutorial : public AxScoreBoardTeamGame
{
public:
	struct FString                                     TutorialNumber;                                           // 0x1408(0x000C) (Localized, NeedCtorLink)
	struct FString                                     TutorialContents;                                         // 0x1414(0x000C) (Localized, NeedCtorLink)
	struct FString                                     TutorialResult[0x3];                                      // 0x1420(0x000C) (Localized, NeedCtorLink)
	struct FString                                     TutorialList[0x11];                                       // 0x1444(0x000C) (Localized, NeedCtorLink)
	float                                              fNumberX1;                                                // 0x1510(0x0004)
	float                                              fNumberX2;                                                // 0x1514(0x0004)
	float                                              fContentX1;                                               // 0x1518(0x0004)
	float                                              fContentX2;                                               // 0x151C(0x0004)
	float                                              fResultX1;                                                // 0x1520(0x0004)
	float                                              fResultX2;                                                // 0x1524(0x0004)
	TArray<struct FstTutorialContent>                  aTutorialContents;                                        // 0x1528(0x000C) (NeedCtorLink)
	int                                                iCurrentTutorialID;                                       // 0x1534(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.xScoreBoardTutorial");
		return ptr;
	}


	void DrawTeamListSection_C(class UCanvas* C, int lpCount, class APlayerReplicationInfo* currPRI, int lpQuestNumber, const struct FString& HostName, float beginY, float markBeginY, float markPingY);
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
// 0x006C (0x2DE4 - 0x2D78)
class AwHudPart_SelectQSlotCN : public AwHudPart_SelectQSlot
{
public:
	struct FString                                     strQSItemName[0x9];                                       // 0x2D78(0x000C) (NeedCtorLink)

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
// 0x0028 (0x1350 - 0x1328)
class AwHudPart_Bigmap : public AwHudPart_MinimapBase
{
public:
	class UWinFrameChanger*                            FrameChanger;                                             // 0x1328(0x0004) (Edit, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UWinBox*                                     MinimapBGPos;                                             // 0x132C(0x0004) (Edit, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   MinimapCropCoords;                                        // 0x1330(0x0010)
	struct FFloatBoxWH                                 P;                                                        // 0x1340(0x0010)

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
// 0x2C20 (0x51A8 - 0x2588)
class AwHudPart_DisplayEvent : public AwHudPart_DisplayBase
{
public:
	struct FSpriteWidget                               wHealthPack;                                              // 0x2588(0x0040) (Edit)
	struct FSpriteWidget                               WHealthPackPlus;                                          // 0x25C8(0x0040) (Edit)
	struct FDigitSet                                   WDigitsHP;                                                // 0x2608(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsNumberBroadBig;                                    // 0x26BC(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsNumberBig;                                         // 0x2770(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsNumberMid;                                         // 0x2824(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsNumberMid_Base;                                    // 0x28D8(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsNumberSml;                                         // 0x298C(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsDFRoundNumber;                                     // 0x2A40(0x00B4) (Edit)
	struct FNumericWidget                              DigitsNumberFirst;                                        // 0x2AF4(0x0030) (Edit)
	struct FNumericWidget                              DigitsNumberSecond;                                       // 0x2B24(0x0030) (Edit)
	struct FNumericWidget                              DigitsNumberThird;                                        // 0x2B54(0x0030) (Edit)
	struct FNumericWidget                              DigitsNumberFourth;                                       // 0x2B84(0x0030) (Edit)
	struct FNumericWidget                              DigitsNumberFifth;                                        // 0x2BB4(0x0030) (Edit)
	struct FNumericWidget                              DigitsNumberPlus;                                         // 0x2BE4(0x0030) (Edit)
	int                                                FontSizeNormal;                                           // 0x2C14(0x0004) (Edit)
	int                                                FontSizeKey;                                              // 0x2C18(0x0004) (Edit)
	int                                                FontSizeRespawn;                                          // 0x2C1C(0x0004) (Edit)
	struct FSpriteWidget                               SkillIconEvent;                                           // 0x2C20(0x0040) (Edit)
	struct FSpriteWidget                               WHelpBG;                                                  // 0x2C60(0x0040) (Edit)
	struct FSpriteWidget                               wSkill;                                                   // 0x2CA0(0x0040) (Edit)
	struct FSpriteWidget                               wHelicopter;                                              // 0x2CE0(0x0040) (Edit)
	struct FSpriteWidget                               WAirStirke;                                               // 0x2D20(0x0040) (Edit)
	struct FSpriteWidget                               WUAV;                                                     // 0x2D60(0x0040) (Edit)
	struct FSpriteWidget                               WC4;                                                      // 0x2DA0(0x0040) (Edit)
	struct FSpriteWidget                               WRPG7;                                                    // 0x2DE0(0x0040) (Edit)
	struct FSpriteWidget                               SkillHelicopterOn;                                        // 0x2E20(0x0040) (Edit)
	struct FSpriteWidget                               SkillAirstrikeOn;                                         // 0x2E60(0x0040) (Edit)
	struct FSpriteWidget                               SkillUAVOn;                                               // 0x2EA0(0x0040) (Edit)
	struct FSpriteWidget                               SkillSentryGunOn;                                         // 0x2EE0(0x0040) (Edit)
	struct FSpriteWidget                               WAirStirkeFocus;                                          // 0x2F20(0x0040) (Edit)
	struct FSpriteWidget                               WAirStirkeSellect;                                        // 0x2F60(0x0040) (Edit)
	TEnumAsByte<ESKILL_ARRAY>                          ECallSkillState;                                          // 0x2FA0(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x2FA1(0x0003) MISSED OFFSET
	unsigned long                                      bResultSkillRequire : 1;                                  // 0x2FA4(0x0004)
	float                                              fLastCallTime;                                            // 0x2FA8(0x0004)
	float                                              fC4ActiveTime;                                            // 0x2FAC(0x0004)
	unsigned long                                      bC4Active : 1;                                            // 0x2FB0(0x0004)
	float                                              fBeginDrawTime_RPG7;                                      // 0x2FB4(0x0004)
	unsigned long                                      bRPG7Active : 1;                                          // 0x2FB8(0x0004)
	float                                              fBeginRespawnPosY;                                        // 0x2FBC(0x0004)
	float                                              fEndRespawnPosY;                                          // 0x2FC0(0x0004)
	float                                              fDrawTime;                                                // 0x2FC4(0x0004) (Edit)
	float                                              fDrawTimeSkill;                                           // 0x2FC8(0x0004) (Edit)
	float                                              fDrawTimeEffect;                                          // 0x2FCC(0x0004) (Edit)
	float                                              fFadeOutEffect;                                           // 0x2FD0(0x0004) (Edit)
	float                                              fFadeOutTime;                                             // 0x2FD4(0x0004) (Edit)
	float                                              fDrawTimeHealth;                                          // 0x2FD8(0x0004) (Edit)
	float                                              fFadeOutTimeHealth;                                       // 0x2FDC(0x0004) (Edit)
	float                                              fDistMove;                                                // 0x2FE0(0x0004) (Edit)
	struct FSpriteWidget                               WGameMessageWaiting;                                      // 0x2FE4(0x0040) (Edit)
	struct FSpriteWidget                               WGameWaitSpot;                                            // 0x3024(0x0040) (Edit)
	struct FString                                     sWaitingMessage;                                          // 0x3064(0x000C) (NeedCtorLink)
	float                                              fReceiveTime_StartupMessage;                              // 0x3070(0x0004)
	unsigned long                                      IsStartupMessage : 1;                                     // 0x3074(0x0004)
	struct FSpriteWidget                               WConnectionInstability;                                   // 0x3078(0x0040) (Edit)
	struct FSpriteWidget                               WBGStart;                                                 // 0x30B8(0x0040) (Edit)
	struct FSpriteWidget                               WBGStartDF;                                               // 0x30F8(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeTD;                                              // 0x3138(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeSD;                                              // 0x3178(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeDOA;                                             // 0x31B8(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeDOMI;                                            // 0x31F8(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeSB;                                              // 0x3238(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeDM;                                              // 0x3278(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeFM;                                              // 0x32B8(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeTM;                                              // 0x32F8(0x0040) (Edit)
	struct FSpriteWidget                               WGameChangeAttack;                                        // 0x3338(0x0040) (Edit)
	struct FSpriteWidget                               WGameChangePosition;                                      // 0x3378(0x0040) (Edit)
	struct FSpriteWidget                               WGameTypeAlienMode;                                       // 0x33B8(0x0040) (Edit)
	struct FSpriteWidget                               WGo;                                                      // 0x33F8(0x0040) (Edit)
	struct FSpriteWidget                               WGoBG;                                                    // 0x3438(0x0040) (Edit)
	struct FSpriteWidget                               WGoEffect;                                                // 0x3478(0x0040) (Edit)
	struct FSpriteWidget                               WGoText;                                                  // 0x34B8(0x0040) (Edit)
	float                                              MessageLastTime;                                          // 0x34F8(0x0004)
	float                                              MessageAccelStep;                                         // 0x34FC(0x0004)
	int                                                MessageEffect;                                            // 0x3500(0x0004)
	int                                                MessageAlpha;                                             // 0x3504(0x0004)
	struct FString                                     strQuestNoUpdate;                                         // 0x3508(0x000C) (Localized, NeedCtorLink)
	struct FString                                     BeginMessageTD;                                           // 0x3514(0x000C) (Localized, NeedCtorLink)
	struct FString                                     BeginMessageSDA1;                                         // 0x3520(0x000C) (Localized, NeedCtorLink)
	struct FString                                     BeginMessageSDA2;                                         // 0x352C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     BeginMessageSDD1;                                         // 0x3538(0x000C) (Localized, NeedCtorLink)
	struct FString                                     BeginMessageSDD2;                                         // 0x3544(0x000C) (Localized, NeedCtorLink)
	struct FString                                     BeginMessageAlienMode;                                    // 0x3550(0x000C) (Localized, NeedCtorLink)
	struct FString                                     BeginMessageDOMI;                                         // 0x355C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     BeginMessageSB;                                           // 0x3568(0x000C) (Localized, NeedCtorLink)
	struct FString                                     BeginMessageDM;                                           // 0x3574(0x000C) (Localized, NeedCtorLink)
	struct FString                                     BeginMessageFM;                                           // 0x3580(0x000C) (Localized, NeedCtorLink)
	struct FString                                     BeginMessageTM;                                           // 0x358C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     BeginMessageDF;                                           // 0x3598(0x000C) (Localized, NeedCtorLink)
	struct FString                                     LsReload;                                                 // 0x35A4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     LsWarningAmmo;                                            // 0x35B0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     LsRechargingAmmo;                                         // 0x35BC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     LsBattleExplain;                                          // 0x35C8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     LsConnectionInstability;                                  // 0x35D4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsIsInvincible;                                           // 0x35E0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsIsInvincibleBeginner;                                   // 0x35EC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     safeZoneRandomRespawn;                                    // 0x35F8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     RespawnText;                                              // 0x3604(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MessageChangingHostPre;                                   // 0x3610(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MessageChangingHost;                                      // 0x361C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MessageChangingHostPlzWait;                               // 0x3628(0x000C) (Localized, NeedCtorLink)
	TEnumAsByte<EeDrawMessageState>                    DMState;                                                  // 0x3634(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x3635(0x0003) MISSED OFFSET
	float                                              fMessageDrawTime;                                         // 0x3638(0x0004)
	float                                              fBeginMessageTime;                                        // 0x363C(0x0004)
	float                                              fBeginMessageTime_Go;                                     // 0x3640(0x0004)
	float                                              fMessageDrawTime_Go;                                      // 0x3644(0x0004)
	float                                              fFadeOutTime_Go;                                          // 0x3648(0x0004)
	unsigned long                                      bMessageDraw : 1;                                         // 0x364C(0x0004)
	int                                                iRound_Instrusion;                                        // 0x3650(0x0004)
	float                                              fStartTimeDrawA;                                          // 0x3654(0x0004)
	float                                              fBeginMessageTime_Instrusion;                             // 0x3658(0x0004)
	unsigned long                                      bMessageDraw_Intrusion : 1;                               // 0x365C(0x0004)
	unsigned long                                      bIsDraw_Intrusion : 1;                                    // 0x365C(0x0004)
	float                                              TimeConnectionInstability[0x2];                           // 0x3660(0x0004)
	unsigned long                                      bConnectionInstability : 1;                               // 0x3668(0x0004)
	unsigned long                                      bDrawConnectionInstability : 1;                           // 0x3668(0x0004)
	struct FSpriteWidget                               WRoundResultBG;                                           // 0x366C(0x0040) (Edit)
	struct FSpriteWidget                               WRoundWin;                                                // 0x36AC(0x0040) (Edit)
	struct FSpriteWidget                               WRoundLose;                                               // 0x36EC(0x0040) (Edit)
	struct FSpriteWidget                               WTextAF;                                                  // 0x372C(0x0040) (Edit)
	struct FSpriteWidget                               WTextRSA;                                                 // 0x376C(0x0040) (Edit)
	struct FSpriteWidget                               WCompareSign;                                             // 0x37AC(0x0040) (Edit)
	struct FSpriteWidget                               WCompareSignMid;                                          // 0x37EC(0x0040) (Edit)
	struct FNumericWidget                              DigitsRoundWinAF;                                         // 0x382C(0x0030) (Edit)
	struct FNumericWidget                              DigitsRoundWinRSA;                                        // 0x385C(0x0030) (Edit)
	struct FSpriteWidget                               WTeamMarkAF;                                              // 0x388C(0x0040) (Edit)
	struct FSpriteWidget                               WTeamMarkRSA;                                             // 0x38CC(0x0040) (Edit)
	struct FSpriteWidget                               WResultTeamMarkAF;                                        // 0x390C(0x0040) (Edit)
	struct FSpriteWidget                               WResultTeamMarkRSA;                                       // 0x394C(0x0040) (Edit)
	struct FSpriteWidget                               WTeamMarkHumanTeam;                                       // 0x398C(0x0040) (Edit)
	struct FSpriteWidget                               WTeamMarkAlienTeam;                                       // 0x39CC(0x0040) (Edit)
	struct FSpriteWidget                               WTeamBigMarkHumanTeam;                                    // 0x3A0C(0x0040) (Edit)
	struct FSpriteWidget                               WTeamBigMarkAlienTeam;                                    // 0x3A4C(0x0040) (Edit)
	struct FSpriteWidget                               WResultMarkHumanTeam;                                     // 0x3A8C(0x0040) (Edit)
	struct FSpriteWidget                               WResultMarkAlienTeam;                                     // 0x3ACC(0x0040) (Edit)
	struct FSpriteWidget                               WWinTextAF;                                               // 0x3B0C(0x0040) (Edit)
	struct FSpriteWidget                               WLoseTextAF;                                              // 0x3B4C(0x0040) (Edit)
	struct FSpriteWidget                               WWinTextRSA;                                              // 0x3B8C(0x0040) (Edit)
	struct FSpriteWidget                               WLoseTextRSA;                                             // 0x3BCC(0x0040) (Edit)
	struct FSpriteWidget                               WRoundResultNewBG;                                        // 0x3C0C(0x0040) (Edit)
	struct FSpriteWidget                               WRoundResultGradationBG;                                  // 0x3C4C(0x0040) (Edit)
	struct FSpriteWidget                               WWinTextHumanTeam;                                        // 0x3C8C(0x0040) (Edit)
	struct FSpriteWidget                               WLoseTextHumanTeam;                                       // 0x3CCC(0x0040) (Edit)
	struct FSpriteWidget                               WWinTextAlienTeam;                                        // 0x3D0C(0x0040) (Edit)
	struct FSpriteWidget                               WLoseTextAlienTeam;                                       // 0x3D4C(0x0040) (Edit)
	struct FDigitSet                                   WDigitsNumResultWin;                                      // 0x3D8C(0x00B4) (Edit)
	struct FDigitSet                                   WDigitsNumResultLose;                                     // 0x3E40(0x00B4) (Edit)
	TArray<struct FNumericWidget>                      DigitsAFWinScore;                                         // 0x3EF4(0x000C) (Edit, NeedCtorLink)
	TArray<struct FNumericWidget>                      DigitsRSAWinScore;                                        // 0x3F00(0x000C) (Edit, NeedCtorLink)
	TArray<struct FNumericWidget>                      DigitsAFLoseScore;                                        // 0x3F0C(0x000C) (Edit, NeedCtorLink)
	TArray<struct FNumericWidget>                      DigitsRSALoseScore;                                       // 0x3F18(0x000C) (Edit, NeedCtorLink)
	struct FSpriteWidget                               wDefenceBotIcon[0xF];                                     // 0x3F24(0x0040)
	TArray<int>                                        wDefenceGradeList;                                        // 0x42E4(0x000C) (NeedCtorLink)
	struct FSpriteWidget                               WScoreBG;                                                 // 0x42F0(0x0040) (Edit)
	struct FSpriteWidget                               WGoalScoreBG;                                             // 0x4330(0x0040) (Edit)
	struct FSpriteWidget                               WTimeBG;                                                  // 0x4370(0x0040) (Edit)
	TArray<struct FNumericWidget>                      DigitsAFScore;                                            // 0x43B0(0x000C) (Edit, NeedCtorLink)
	TArray<struct FNumericWidget>                      DigitsRSAScore;                                           // 0x43BC(0x000C) (Edit, NeedCtorLink)
	TArray<struct FNumericWidget>                      DigitsGoalScore;                                          // 0x43C8(0x000C) (Edit, NeedCtorLink)
	TArray<struct FNumericWidget>                      DigitsTime;                                               // 0x43D4(0x000C) (Edit, NeedCtorLink)
	TArray<struct FNumericWidget>                      DigitsFFAGoalScore;                                       // 0x43E0(0x000C) (Edit, NeedCtorLink)
	struct FSpriteWidget                               WHudBG2;                                                  // 0x43EC(0x0040) (Edit)
	struct FSpriteWidget                               WHudBGR;                                                  // 0x442C(0x0040) (Edit)
	struct FSpriteWidget                               WTeamScoreBG;                                             // 0x446C(0x0040) (Edit)
	struct FSpriteWidget                               WNowRSATeamisWin;                                         // 0x44AC(0x0040)
	struct FSpriteWidget                               WNowAFTeamisWin;                                          // 0x44EC(0x0040)
	struct FSpriteWidget                               WNowRSATeamisLose;                                        // 0x452C(0x0040)
	struct FSpriteWidget                               WNowAFTeamisLose;                                         // 0x456C(0x0040)
	struct FSpriteWidget                               WResultTxtAF[0x2];                                        // 0x45AC(0x0040) (Edit)
	struct FSpriteWidget                               WResultTxtRSA[0x2];                                       // 0x462C(0x0040) (Edit)
	struct FSpriteWidget                               WFFABG;                                                   // 0x46AC(0x0040) (Edit)
	struct FSpriteWidget                               WFFAScoreBG;                                              // 0x46EC(0x0040) (Edit)
	struct FSpriteWidget                               WFFAScoreOverLayer;                                       // 0x472C(0x0040) (Edit)
	int                                                Ranking_Self;                                             // 0x476C(0x0004)
	TArray<class APlayerReplicationInfo*>              arrRankingInfo;                                           // 0x4770(0x000C) (NeedCtorLink)
	class APlayerReplicationInfo*                      PRI_1st;                                                  // 0x477C(0x0004)
	class APlayerReplicationInfo*                      PRI_2nd;                                                  // 0x4780(0x0004)
	class APlayerReplicationInfo*                      PRI_Self;                                                 // 0x4784(0x0004)
	float                                              fSortingLastTime;                                         // 0x4788(0x0004)
	struct FSpriteWidget                               DFRankingBG;                                              // 0x478C(0x0040)
	struct FSpriteWidget                               DFUserHP;                                                 // 0x47CC(0x0040)
	struct FSpriteWidget                               WTimerBombBG;                                             // 0x480C(0x0040) (Edit)
	class UMaterial*                                   matBack1;                                                 // 0x484C(0x0004)
	class UMaterial*                                   matLine;                                                  // 0x4850(0x0004)
	class UMaterial*                                   tempMat;                                                  // 0x4854(0x0004)
	class UMaterial*                                   matOn;                                                    // 0x4858(0x0004)
	TArray<class UMaterial*>                           Medals;                                                   // 0x485C(0x000C) (NeedCtorLink)
	struct FString                                     RankPostfix;                                              // 0x4868(0x000C) (Localized, NeedCtorLink)
	struct FSpriteWidget                               WAlienModeScoreBG;                                        // 0x4874(0x0040)
	int                                                HasSkillC4;                                               // 0x48B4(0x0004)
	int                                                HasSkillAirStirke;                                        // 0x48B8(0x0004)
	int                                                HasSkillRPG7;                                             // 0x48BC(0x0004)
	int                                                Displaying_State[0x14];                                   // 0x48C0(0x0004)
	float                                              fBeginDrawTime_Skill;                                     // 0x4910(0x0004)
	unsigned long                                      bDrawSkillC4 : 1;                                         // 0x4914(0x0004)
	unsigned long                                      bDrawSkillRPG7 : 1;                                       // 0x4914(0x0004)
	unsigned long                                      bDrawSkillHelicopter : 1;                                 // 0x4914(0x0004)
	unsigned long                                      bDrawSkillAirStrike : 1;                                  // 0x4914(0x0004)
	unsigned long                                      bDrawSkillUAV : 1;                                        // 0x4914(0x0004)
	unsigned long                                      bDrawSkillRPG : 1;                                        // 0x4914(0x0004)
	float                                              fBeginDrawTime_Item;                                      // 0x4918(0x0004)
	float                                              fBeginDrawTime_SudenDeath;                                // 0x491C(0x0004)
	struct FSpriteWidget                               W3Kill;                                                   // 0x4920(0x0040) (Edit)
	struct FSpriteWidget                               W5Kill;                                                   // 0x4960(0x0040) (Edit)
	struct FSpriteWidget                               W7Kill;                                                   // 0x49A0(0x0040) (Edit)
	struct FSpriteWidget                               W10Kill;                                                  // 0x49E0(0x0040) (Edit)
	struct FSpriteWidget                               W15Kill;                                                  // 0x4A20(0x0040) (Edit)
	struct FSpriteWidget                               WHeadshot;                                                // 0x4A60(0x0040) (Edit)
	struct FSpriteWidget                               WKillTextBg;                                              // 0x4AA0(0x0040) (Edit)
	struct FSpriteWidget                               WHudBack3;                                                // 0x4AE0(0x0040) (Edit)
	struct FSpriteWidget                               WTxtHostChange;                                           // 0x4B20(0x0040) (Edit)
	struct FSpriteWidget                               WTxtSudenDeath;                                           // 0x4B60(0x0040) (Edit)
	struct FSpriteWidget                               wTxtSubSudenDeath;                                        // 0x4BA0(0x0040)
	struct FString                                     lsSudenDeathMessage[0x3];                                 // 0x4BE0(0x000C) (Localized, NeedCtorLink)
	float                                              fBeginDrawTime_BattleExplain;                             // 0x4C04(0x0004)
	struct FSpriteWidget                               WBattleExplain1;                                          // 0x4C08(0x0040) (Edit)
	struct FSpriteWidget                               WBattleExplain2;                                          // 0x4C48(0x0040) (Edit)
	int                                                AttackTeamIndex;                                          // 0x4C88(0x0004) (Edit)
	int                                                CurrentRound;                                             // 0x4C8C(0x0004) (Edit)
	float                                              fBeginDrawTime_GameMode;                                  // 0x4C90(0x0004)
	struct FString                                     sMessageGameMode;                                         // 0x4C94(0x000C) (NeedCtorLink)
	class UMaterial*                                   mGameMode[0x3];                                           // 0x4CA0(0x0004)
	struct FSpriteWidget                               WGameMode;                                                // 0x4CAC(0x0040) (Edit)
	int                                                iGameObjectIndex;                                         // 0x4CEC(0x0004)
	unsigned long                                      bChangeMessgeGameMode : 1;                                // 0x4CF0(0x0004)
	TArray<struct FSpriteWidget>                       DomObjectCaptureEnemy;                                    // 0x4CF4(0x000C) (Edit, NeedCtorLink)
	TArray<struct FSpriteWidget>                       DomObjectCaptureAlly;                                     // 0x4D00(0x000C) (Edit, NeedCtorLink)
	TArray<struct FSpriteWidget>                       DomObjectCaptureNon;                                      // 0x4D0C(0x000C) (Edit, NeedCtorLink)
	struct FString                                     SoundRequireHeliCopter;                                   // 0x4D18(0x000C) (NeedCtorLink)
	struct FString                                     SoundRequireAtillery;                                     // 0x4D24(0x000C) (NeedCtorLink)
	struct FString                                     SoundRequireUAV;                                          // 0x4D30(0x000C) (NeedCtorLink)
	struct FString                                     SoundRequireSentryGun;                                    // 0x4D3C(0x000C) (NeedCtorLink)
	struct FString                                     SoundNotReady;                                            // 0x4D48(0x000C) (NeedCtorLink)
	struct FString                                     MessageWin;                                               // 0x4D54(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MessageLose;                                              // 0x4D60(0x000C) (Localized, NeedCtorLink)
	unsigned long                                      bUpdate : 1;                                              // 0x4D6C(0x0004)
	struct FSpriteWidget                               HelpKeyButtonReload;                                      // 0x4D70(0x0040) (Edit)
	float                                              WidthReload;                                              // 0x4DB0(0x0004)
	unsigned long                                      bDisplayEvent_HealthPack : 1;                             // 0x4DB4(0x0004)
	unsigned long                                      bDisplayEvent_CountDown : 1;                              // 0x4DB4(0x0004)
	int                                                iCountNumber;                                             // 0x4DB8(0x0004)
	float                                              fBeginTimeCounDown;                                       // 0x4DBC(0x0004)
	unsigned long                                      bDisplayEvent_Invincible : 1;                             // 0x4DC0(0x0004)
	struct FSpriteWidget                               wBackSeparationTop;                                       // 0x4DC4(0x0040) (Edit)
	struct FSpriteWidget                               wBackSeparationBottom;                                    // 0x4E04(0x0040) (Edit)
	struct FSpriteWidget                               WTeamImageAF[0x4];                                        // 0x4E44(0x0040) (Edit)
	struct FSpriteWidget                               WTeamImageRSA[0x4];                                       // 0x4F44(0x0040) (Edit)
	struct FSpriteWidget                               WScoreTeamMarkAF;                                         // 0x5044(0x0040) (Edit)
	struct FSpriteWidget                               WScoreTeamMarkRSA;                                        // 0x5084(0x0040) (Edit)
	struct FString                                     strNotReadySkill[0x4];                                    // 0x50C4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strNotReadySkillDesc;                                     // 0x50F4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strReadySkill;                                            // 0x5100(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strReadySkillDesc;                                        // 0x510C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strReadySupplyItem;                                       // 0x5118(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strReadySupplyItemDesc;                                   // 0x5124(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strHelicopter;                                            // 0x5130(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strSentryGun;                                             // 0x513C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strAirStrike;                                             // 0x5148(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strUAV;                                                   // 0x5154(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strHelicopterFailed;                                      // 0x5160(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strSentryGunFailed;                                       // 0x516C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strAirStrikeFailed;                                       // 0x5178(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strHelicopterFailedDesc;                                  // 0x5184(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strSentryGunFailedDesc;                                   // 0x5190(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strAirStrikeFailedDesc;                                   // 0x519C(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_DisplayEvent");
		return ptr;
	}


	void DrawEventString(class UCanvas* C, float StartTime, const struct FString& strHead, const struct FColor& headColor, const struct FString& strDesc, const struct FString& strKey);
	void DisplayEvent_Skill_NotReady(class UCanvas* C, int SkillID);
	void DrawMessage_SentryGun_Installing(class UCanvas* C, const struct FSpriteWidget& WMessage, float ProgressPct);
	void DrawMessageConnectionInstability(class UCanvas* C);
	void ConnectionInstability(class UCanvas* C);
	void SetTimeConnectionInstability(bool bSet);
	void DrawAAS(class UCanvas* C, const struct FString& sAASNotice);
	void DrawMoveGameNotice(class UCanvas* C, const struct FString& sGameNotice, float fLifeTime);
	void DrawGameNotice(class UCanvas* C, const struct FString& sGameNotice);
	struct FString GetMessageGameMode_FFA();
	struct FString GetMessageGameMode_SBT();
	struct FString GetMessageGameMode_SD();
	struct FString GetMessageGameMode_DOA();
	void SetMessageGameMode_DOM(class UMaterial* matA, class UMaterial* matB, class UMaterial* matC);
	struct FString GetMessageGameMode_DOM();
	struct FString GetMessageGameMode_TD();
	struct FString GetMessageGameMode(class UMaterial** mat);
	void DisplayEvent_SetDrawGameMessage(bool bMode, bool bSystem);
	void DrawGameMode(class UCanvas* C);
	void SetBombObjectIndex(int objectIndex);
	void DisplayEvent_GameMode(const struct FString& Message);
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
	void DrawRoundResult(class UCanvas* C, int ScoringTeam);
	void DisplayRoundResult(class UCanvas* C, int ScoringTeam);
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
	void DrawMessageHeadShotAndMultiKill(class UCanvas* C, const struct FString& sMessage, bool bAddPosY, float fFontSize, const struct FColor& _colorShadow);
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
	void DisplayEvent_Skill_Helicopter(class UCanvas* C);
	void DrawEvent_Item_HealthPack(class UCanvas* C, int AddHp);
	void SetSkillState(int skillC4, int skillAirStirke, int SkillRPG7);
	void DisPlayEvent_Waiting(const struct FString& Message);
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
// 0x0600 (0x2B88 - 0x2588)
class AwHudPart_DisplayMain : public AwHudPart_DisplayBase
{
public:
	struct FSpriteWidget                               HelpKeyButtonBackground;                                  // 0x2588(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonRun;                                         // 0x25C8(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonWorldMap;                                    // 0x2608(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonAim;                                         // 0x2648(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonMiliAttack;                                  // 0x2688(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonSkill[0x2];                                  // 0x26C8(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonUAV;                                         // 0x2748(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonBomb;                                        // 0x2788(0x0040) (Edit)
	float                                              WidthBomb;                                                // 0x27C8(0x0004)
	struct FSpriteWidget                               WSkill2[0x6];                                             // 0x27CC(0x0040) (Edit)
	struct FSpriteWidget                               WSkill3[0x5];                                             // 0x294C(0x0040) (Edit)
	struct FSpriteWidget                               HelpKeyButtonBattleHelp;                                  // 0x2A8C(0x0040)
	struct FSpriteWidget                               WBattleHelp;                                              // 0x2ACC(0x0040)
	int                                                HasSkills;                                                // 0x2B0C(0x0004)
	unsigned long                                      DrawSkills : 1;                                           // 0x2B10(0x0004)
	unsigned long                                      CheckDead : 1;                                            // 0x2B10(0x0004)
	float                                              CheckDeadTime;                                            // 0x2B14(0x0004)
	float                                              StartDrawTime;                                            // 0x2B18(0x0004)
	float                                              QuitDrawTime;                                             // 0x2B1C(0x0004)
	float                                              fFadeOutTime;                                             // 0x2B20(0x0004)
	float                                              fDrawTime;                                                // 0x2B24(0x0004)
	float                                              RespawnTime;                                              // 0x2B28(0x0004)
	int                                                HasSkillNum;                                              // 0x2B2C(0x0004)
	float                                              WidthSprint;                                              // 0x2B30(0x0004)
	float                                              WidthWorldMap;                                            // 0x2B34(0x0004)
	float                                              WidthAim;                                                 // 0x2B38(0x0004)
	float                                              WidthMelee;                                               // 0x2B3C(0x0004)
	float                                              WidthSkill[0x3];                                          // 0x2B40(0x0004)
	int                                                iCountSlot3;                                              // 0x2B4C(0x0004)
	int                                                iCountSlot4;                                              // 0x2B50(0x0004)
	unsigned long                                      bUpdate : 1;                                              // 0x2B54(0x0004)
	struct FString                                     lsChattingHelp;                                           // 0x2B58(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsSurvivedString;                                         // 0x2B64(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsTeamAF;                                                 // 0x2B70(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsTeamRSA;                                                // 0x2B7C(0x000C) (Localized, NeedCtorLink)

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
	void UpdateHelpKey_Slot(unsigned char iIndex, bool bEnable);
	void DisplayEvent_ActiveSkill();
	void CallEvent(bool ItemCheck, int iReservation1, int iReservation2);
};


// Class XInterface.wHudPart_RadioMessage
// 0x02BC (0x2844 - 0x2588)
class AwHudPart_RadioMessage : public AwHudPart_DisplayBase
{
public:
	TEnumAsByte<ERMType>                               eRadioType;                                               // 0x2588(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x2589(0x0003) MISSED OFFSET
	struct FSpriteWidget                               WKeyBtnRadionMessage;                                     // 0x258C(0x0040)
	struct FSpriteWidget                               WHudBack1;                                                // 0x25CC(0x0040)
	struct FSpriteWidget                               WHudBack2;                                                // 0x260C(0x0040)
	struct FString                                     sKeyActive[0xA];                                          // 0x264C(0x000C) (NeedCtorLink)
	struct FString                                     lsRadioMessage;                                           // 0x26C4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsRadioMessageType[0x4];                                  // 0x26D0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsCommond[0xA];                                           // 0x2700(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsStatement[0x8];                                         // 0x2778(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsRespon[0x9];                                            // 0x27D8(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_RadioMessage");
		return ptr;
	}


	void DrawRadioMessage(class UCanvas* C, int iMessage, int iHeight, const struct FString& sMessage);
	TEnumAsByte<ERMType> GetRadioType();
	void SetRadioType(TEnumAsByte<ERMType> _ERMType);
	void DrawA(class UCanvas* C);
	void ResetRadioMessage();
	void CallRadioMessage(int iKey, int iReservation1, int iReservation2);
	void UpdateHelpKeyControll();
	void Initialize(class AHudBase* myOwner, class ALevelInfo* Level);
};


// Class XInterface.wHudPart_DisplayQuest
// 0x00B8 (0x2640 - 0x2588)
class AwHudPart_DisplayQuest : public AwHudPart_DisplayBase
{
public:
	TArray<struct FSQuest>                             aMessageList;                                             // 0x2588(0x000C) (NeedCtorLink)
	struct FSpriteWidget                               WSBBG3;                                                   // 0x2594(0x0040) (Edit)
	struct FSpriteWidget                               WMarkExclamation;                                         // 0x25D4(0x0040) (Edit)
	float                                              fLifeTime;                                                // 0x2614(0x0004)
	float                                              fFontSize;                                                // 0x2618(0x0004)
	struct FString                                     temp1;                                                    // 0x261C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Temp2;                                                    // 0x2628(0x000C) (Localized, NeedCtorLink)
	float                                              LTPosX;                                                   // 0x2634(0x0004)
	float                                              LTPosY;                                                   // 0x2638(0x0004)
	class UwMatchMaker*                                kMM;                                                      // 0x263C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_DisplayQuest");
		return ptr;
	}


	void PushMessage(const struct FString& MissionDesc, int cur, int Max);
	void ReceivedAccomplishMission100Percent(const struct FString& MissionDesc, int cur, int Max);
	void ReceivedAccomplishMission75Percent(const struct FString& MissionDesc, int cur, int Max);
	void ReceivedAccomplishMission50Percent(const struct FString& MissionDesc, int cur, int Max);
	void ReceivedAccomplishMission25Percent(const struct FString& MissionDesc, int cur, int Max);
	bool HasMessage();
	void DrawGauge(class UCanvas* C, float fProgressPct, float PosX, float PosY);
	void DrawSpectating(class UCanvas* C);
	void DrawProgress(class UCanvas* C);
	void DrawHudPassA(class UCanvas* C);
	void Initialize(class AHudBase* myOwner, class ALevelInfo* Level);
};


// Class XInterface.wHudPart_Minimap
// 0x0004 (0x132C - 0x1328)
class AwHudPart_Minimap : public AwHudPart_MinimapBase
{
public:
	float                                              fFadeEffectTime;                                          // 0x1328(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.wHudPart_Minimap");
		return ptr;
	}


	void DrawMinimap_Airstrike(class UCanvas* C);
};


// Class XInterface.wHudPart_ItemBuy
// 0x052C (0x2AB4 - 0x2588)
class AwHudPart_ItemBuy : public AwHudPart_DisplayBase
{
public:
	struct FString                                     lsItemList;                                               // 0x2588(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsItemComment;                                            // 0x2594(0x000C) (Localized, NeedCtorLink)
	struct FSpriteWidget                               WWindowBG;                                                // 0x25A0(0x0040)
	struct FSpriteWidget                               WItemBG[0x3];                                             // 0x25E0(0x0040)
	struct FSpriteWidget                               WItemList[0x6];                                           // 0x26A0(0x0040)
	struct FString                                     strItemName[0x6];                                         // 0x2820(0x000C) (NeedCtorLink)
	struct FSpriteWidget                               WShowKeyButton;                                           // 0x2868(0x0040)
	struct FSpriteWidget                               WKeyButton[0x6];                                          // 0x28A8(0x0040)
	struct FSpriteWidget                               WItemBlackBG;                                             // 0x2A28(0x0040)
	unsigned long                                      bEnableItemBuy : 1;                                       // 0x2A68(0x0004)
	struct FstItemInfo                                 arItemList[0x6];                                          // 0x2A6C(0x000C)

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
// 0x0028 (0x1350 - 0x1328)
class AwScoreboardPart_Minimap : public AwHudPart_MinimapBase
{
public:
	class UWinFrameChanger*                            FrameChanger;                                             // 0x1328(0x0004) (Edit, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UWinBox*                                     MinimapBGPos;                                             // 0x132C(0x0004) (Edit, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   MinimapCropCoords;                                        // 0x1330(0x0010)
	struct FFloatBoxWH                                 P;                                                        // 0x1340(0x0010)

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
// 0x0000 (0x2DE4 - 0x2DE4)
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
	TEnumAsByte<EeCellStyle>                           CellStyle;                                                // 0x0340(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0341(0x0003) MISSED OFFSET
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


// Class XInterface.xScoreBoardTeamGameResult
// 0x0764 (0x0CB4 - 0x0550)
class AxScoreBoardTeamGameResult : public AxScoreBoard
{
public:
	struct FSpriteWidget                               SpBG;                                                     // 0x0550(0x0040) (Edit)
	struct FSpriteWidget                               SpTeam;                                                   // 0x0590(0x0040) (Edit)
	struct FSpriteWidget                               SpWin;                                                    // 0x05D0(0x0040) (Edit)
	struct FSpriteWidget                               SpSelection;                                              // 0x0610(0x0040) (Edit)
	struct FSpriteWidget                               SpSelectLine;                                             // 0x0650(0x0040) (Edit)
	struct FSpriteWidget                               SpTeamNameEmphasis;                                       // 0x0690(0x0040) (Edit)
	struct FSpriteWidget                               SpControlBG;                                              // 0x06D0(0x0040) (Edit)
	struct FSpriteWidget                               SpPlayerNameBG;                                           // 0x0710(0x0040) (Edit)
	struct FSpriteWidget                               WSBOutLine;                                               // 0x0750(0x0040) (Edit)
	struct FSpriteWidget                               WSBBG;                                                    // 0x0790(0x0040) (Edit)
	struct FSpriteWidget                               WSBBGInput;                                               // 0x07D0(0x0040) (Edit)
	struct FSpriteWidget                               WTxtResultBoard;                                          // 0x0810(0x0040) (Edit)
	struct FSpriteWidget                               WMarkAF;                                                  // 0x0850(0x0040) (Edit)
	struct FSpriteWidget                               WMarkRSA;                                                 // 0x0890(0x0040) (Edit)
	struct FSpriteWidget                               WResultMVP;                                               // 0x08D0(0x0040) (Edit)
	struct FSpriteWidget                               WGaugeBar1;                                               // 0x0910(0x0040) (Edit)
	struct FSpriteWidget                               WGaugeBar2;                                               // 0x0950(0x0040) (Edit)
	struct FSpriteWidget                               WBonusItemBG;                                             // 0x0990(0x0040) (Edit)
	struct FSpriteWidget                               WMyInfoBG;                                                // 0x09D0(0x0040) (Edit)
	TArray<struct FSpriteWidget>                       WCommBtn;                                                 // 0x0A10(0x000C) (Edit, NeedCtorLink)
	TArray<struct FSpriteWidget>                       WStripeBar;                                               // 0x0A1C(0x000C) (Edit, NeedCtorLink)
	struct FSpriteWidget                               WIconMaster;                                              // 0x0A28(0x0040) (Edit)
	struct FSpriteWidget                               WIconPCBang;                                              // 0x0A68(0x0040) (Edit)
	struct FSpriteWidget                               WIconMVP;                                                 // 0x0AA8(0x0040) (Edit)
	int                                                MAX_TEAM;                                                 // 0x0AE8(0x0004)
	class UMaterial*                                   BackImage;                                                // 0x0AEC(0x0004)
	int                                                BackImageWidth;                                           // 0x0AF0(0x0004)
	int                                                BackImageHeight;                                          // 0x0AF4(0x0004)
	float                                              BGBeginX;                                                 // 0x0AF8(0x0004)
	float                                              BGBeginY;                                                 // 0x0AFC(0x0004)
	float                                              BGWidth;                                                  // 0x0B00(0x0004)
	float                                              BGHeight;                                                 // 0x0B04(0x0004)
	float                                              ControlBeginX;                                            // 0x0B08(0x0004)
	float                                              ControlBeginY;                                            // 0x0B0C(0x0004)
	float                                              ControlWidth;                                             // 0x0B10(0x0004)
	float                                              ControlHeight;                                            // 0x0B14(0x0004)
	float                                              PlayerNameBeginX;                                         // 0x0B18(0x0004)
	float                                              PlayerNameBeginY;                                         // 0x0B1C(0x0004)
	float                                              PlayerNameWidth;                                          // 0x0B20(0x0004)
	float                                              PlayerNameHeight;                                         // 0x0B24(0x0004)
	float                                              PlayerNameFontSize;                                       // 0x0B28(0x0004)
	float                                              TeamBeginX;                                               // 0x0B2C(0x0004)
	float                                              TeamBeginY;                                               // 0x0B30(0x0004)
	float                                              TeamOffsetY;                                              // 0x0B34(0x0004)
	float                                              TeamWidth;                                                // 0x0B38(0x0004)
	float                                              TeamHeight;                                               // 0x0B3C(0x0004)
	float                                              TeamNameBeginX;                                           // 0x0B40(0x0004)
	float                                              TeamNameBeginY;                                           // 0x0B44(0x0004)
	float                                              TeamNameWidth;                                            // 0x0B48(0x0004)
	float                                              TeamNameHeight;                                           // 0x0B4C(0x0004)
	float                                              TeamNameFontSize;                                         // 0x0B50(0x0004)
	float                                              TeamWinnerBeginX;                                         // 0x0B54(0x0004)
	float                                              TeamWinnerBeginY;                                         // 0x0B58(0x0004)
	float                                              TeamWinnerWidth;                                          // 0x0B5C(0x0004)
	float                                              TeamWinnerHeight;                                         // 0x0B60(0x0004)
	float                                              TeamMemberClanBeginX;                                     // 0x0B64(0x0004)
	float                                              TeamMemberClanWidth;                                      // 0x0B68(0x0004)
	float                                              TeamMemberRankBeginX;                                     // 0x0B6C(0x0004)
	float                                              TeamMemberRankWidth;                                      // 0x0B70(0x0004)
	float                                              TeamMemberNicknameBeginX;                                 // 0x0B74(0x0004)
	float                                              TeamMemberNicknameWidth;                                  // 0x0B78(0x0004)
	float                                              TeamMemberItemBeginX;                                     // 0x0B7C(0x0004)
	float                                              TeamMemberItemWidth;                                      // 0x0B80(0x0004)
	float                                              TeamMemberClanNameBeginX;                                 // 0x0B84(0x0004)
	float                                              TeamMemberClanNameWidth;                                  // 0x0B88(0x0004)
	float                                              TeamMemberScoreBeginX;                                    // 0x0B8C(0x0004)
	float                                              TeamMemberScoreWidth;                                     // 0x0B90(0x0004)
	float                                              TeamMemberKillBeginX;                                     // 0x0B94(0x0004)
	float                                              TeamMemberKillWidth;                                      // 0x0B98(0x0004)
	float                                              TeamMemberAssistBeginX;                                   // 0x0B9C(0x0004)
	float                                              TeamMemberAssistWidth;                                    // 0x0BA0(0x0004)
	float                                              TeamMemberDeathBeginX;                                    // 0x0BA4(0x0004)
	float                                              TeamMemberDeathWidth;                                     // 0x0BA8(0x0004)
	float                                              TeamMemberBonusBeginX;                                    // 0x0BAC(0x0004)
	float                                              TeamMemberBonusWidth;                                     // 0x0BB0(0x0004)
	float                                              TeamMemberBonus_1_BeginX;                                 // 0x0BB4(0x0004)
	float                                              TeamMemberBonus_1_Width;                                  // 0x0BB8(0x0004)
	float                                              TeamMemberBonus_2_BeginX;                                 // 0x0BBC(0x0004)
	float                                              TeamMemberBonus_2_Width;                                  // 0x0BC0(0x0004)
	float                                              TeamMemberBonus_3_BeginX;                                 // 0x0BC4(0x0004)
	float                                              TeamMemberBonus_3_Width;                                  // 0x0BC8(0x0004)
	float                                              TeamMemberExpBeginX;                                      // 0x0BCC(0x0004)
	float                                              TeamMemberExpWidth;                                       // 0x0BD0(0x0004)
	float                                              TeamMemberPointBeginX;                                    // 0x0BD4(0x0004)
	float                                              TeamMemberPointWidth;                                     // 0x0BD8(0x0004)
	float                                              TeamMemberBeginY;                                         // 0x0BDC(0x0004)
	float                                              TeamMemberHeight;                                         // 0x0BE0(0x0004)
	float                                              TeamMemberHeightOffset;                                   // 0x0BE4(0x0004)
	float                                              TeamMemberFontSize;                                       // 0x0BE8(0x0004)
	float                                              TeamNameEmphasisBeginX;                                   // 0x0BEC(0x0004)
	float                                              TeamNameEmphasisBeginY;                                   // 0x0BF0(0x0004)
	float                                              TeamNameEmphasisWidth;                                    // 0x0BF4(0x0004)
	float                                              TeamNameEmphasisHeight;                                   // 0x0BF8(0x0004)
	struct FColor                                      DefaultFontColor;                                         // 0x0BFC(0x0004)
	float                                              fMvpNameTextX1;                                           // 0x0C00(0x0004)
	float                                              fMvpNameTextX2;                                           // 0x0C04(0x0004)
	float                                              fMvpNameTextY1;                                           // 0x0C08(0x0004)
	float                                              fMvpNameTextY2;                                           // 0x0C0C(0x0004)
	float                                              fTeamScoreAFY1;                                           // 0x0C10(0x0004)
	float                                              fTeamScoreAFY2;                                           // 0x0C14(0x0004)
	float                                              fTeamScoreRSAY1;                                          // 0x0C18(0x0004)
	float                                              fTeamScoreRSAY2;                                          // 0x0C1C(0x0004)
	float                                              fTeamScoreTxtX1;                                          // 0x0C20(0x0004)
	float                                              fTeamScoreTxtX2;                                          // 0x0C24(0x0004)
	float                                              fTeamScoreTxtAFY1;                                        // 0x0C28(0x0004)
	float                                              fTeamScoreTxtAFY2;                                        // 0x0C2C(0x0004)
	float                                              fTeamScoreTxtRSAY1;                                       // 0x0C30(0x0004)
	float                                              fTeamScoreTxtRSAY2;                                       // 0x0C34(0x0004)
	float                                              fBonusX1;                                                 // 0x0C38(0x0004)
	float                                              fBonusX2;                                                 // 0x0C3C(0x0004)
	float                                              fExpX1;                                                   // 0x0C40(0x0004)
	float                                              fExpX2;                                                   // 0x0C44(0x0004)
	float                                              fPointX1;                                                 // 0x0C48(0x0004)
	float                                              fPointX2;                                                 // 0x0C4C(0x0004)
	float                                              fClanTextX1;                                              // 0x0C50(0x0004)
	float                                              fClanTextX2;                                              // 0x0C54(0x0004)
	float                                              fTxtExpX1;                                                // 0x0C58(0x0004)
	float                                              fTxtExpX2;                                                // 0x0C5C(0x0004)
	float                                              fTxtExpY1;                                                // 0x0C60(0x0004)
	float                                              fTxtExpY2;                                                // 0x0C64(0x0004)
	float                                              fTxt2ExpX1;                                               // 0x0C68(0x0004)
	float                                              fTxt2ExpX2;                                               // 0x0C6C(0x0004)
	float                                              fTxt2ExpY1;                                               // 0x0C70(0x0004)
	float                                              fTxt2ExpY2;                                               // 0x0C74(0x0004)
	float                                              fTxtPointX1;                                              // 0x0C78(0x0004)
	float                                              fTxtPointX2;                                              // 0x0C7C(0x0004)
	float                                              fTxtPointY1;                                              // 0x0C80(0x0004)
	float                                              fTxtPointY2;                                              // 0x0C84(0x0004)
	float                                              fTxt2PointX1;                                             // 0x0C88(0x0004)
	float                                              fTxt2PointX2;                                             // 0x0C8C(0x0004)
	float                                              fTxt2PointY1;                                             // 0x0C90(0x0004)
	float                                              fTxt2PointY2;                                             // 0x0C94(0x0004)
	float                                              fMyInfoFontSize;                                          // 0x0C98(0x0004)
	float                                              fTxtOKX1;                                                 // 0x0C9C(0x0004)
	float                                              fTxtOKX2;                                                 // 0x0CA0(0x0004)
	float                                              fTxtOKY1;                                                 // 0x0CA4(0x0004)
	float                                              fTxtOKY2;                                                 // 0x0CA8(0x0004)
	float                                              fOKFontSize;                                              // 0x0CAC(0x0004)
	unsigned long                                      bResultBGMPlayed : 1;                                     // 0x0CB0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.xScoreBoardTeamGameResult");
		return ptr;
	}


	void DrawScoreboard(class UCanvas* C);
	void DrawMyInfo(class UCanvas* C);
	void DrawTeamMember(class UCanvas* C);
	void DrawTeam(class UCanvas* C);
	int GetWinTeamIndex();
	void DrawContentDescription(class UCanvas* C);
	void DrawBGs_O(class UCanvas* C);
	void DrawTeamListSectionStripe(class UCanvas* C);
	void DrawTeamScore(class UCanvas* C);
	void DrawBGS(class UCanvas* C);
	void DrawBonusItem(class UCanvas* C);
	class AHudBase* GetHudBaseOwner();
};


// Class XInterface.xScoreBoardGameResult_Booty
// 0x046C (0x09BC - 0x0550)
class AxScoreBoardGameResult_Booty : public AxScoreBoard
{
public:
	struct FSpriteWidget                               SpBG;                                                     // 0x0550(0x0040) (Edit)
	struct FSpriteWidget                               SpTeam;                                                   // 0x0590(0x0040) (Edit)
	struct FSpriteWidget                               SpWin;                                                    // 0x05D0(0x0040) (Edit)
	struct FSpriteWidget                               SpSelection;                                              // 0x0610(0x0040) (Edit)
	struct FSpriteWidget                               SpSelectLine;                                             // 0x0650(0x0040) (Edit)
	struct FSpriteWidget                               SpTeamNameEmphasis;                                       // 0x0690(0x0040) (Edit)
	struct FSpriteWidget                               SpControlBG;                                              // 0x06D0(0x0040) (Edit)
	struct FSpriteWidget                               SpPlayerNameBG;                                           // 0x0710(0x0040) (Edit)
	int                                                MAX_TEAM;                                                 // 0x0750(0x0004)
	class UMaterial*                                   BackImage;                                                // 0x0754(0x0004)
	int                                                BackImageWidth;                                           // 0x0758(0x0004)
	int                                                BackImageHeight;                                          // 0x075C(0x0004)
	class UMaterial*                                   LogoImage;                                                // 0x0760(0x0004)
	float                                              LogoImageX;                                               // 0x0764(0x0004)
	float                                              LogoImageY;                                               // 0x0768(0x0004)
	float                                              LogoImageWidth;                                           // 0x076C(0x0004)
	float                                              LogoImageHeight;                                          // 0x0770(0x0004)
	class UMaterial*                                   TrophyBGImage;                                            // 0x0774(0x0004)
	float                                              TrophyBGBeginX;                                           // 0x0778(0x0004)
	float                                              TrophyBGBeginY;                                           // 0x077C(0x0004)
	float                                              TrophyBGWidth;                                            // 0x0780(0x0004)
	float                                              TrophyBGHeight;                                           // 0x0784(0x0004)
	struct FSpriteWidget                               SpBootyGetTextImage;                                      // 0x0788(0x0040)
	float                                              SpBootyGetTextBeginX;                                     // 0x07C8(0x0004)
	float                                              SpBootyGetTextBeginY;                                     // 0x07CC(0x0004)
	struct FSpriteWidget                               SpWeaponBGImage;                                          // 0x07D0(0x0040)
	struct FSpriteWidget                               SpWeaponBGTileImage;                                      // 0x0810(0x0040)
	float                                              SpWeaponBGBeginX;                                         // 0x0850(0x0004)
	float                                              SpWeaponBGBeginY;                                         // 0x0854(0x0004)
	float                                              SpWeaponBGWidth;                                          // 0x0858(0x0004)
	float                                              SpWeaponBGHeight;                                         // 0x085C(0x0004)
	struct FSpriteWidget                               SpNickBGImage;                                            // 0x0860(0x0040)
	float                                              SpNickBGBeginX;                                           // 0x08A0(0x0004)
	float                                              SpNickBGBeginY;                                           // 0x08A4(0x0004)
	class UMaterial*                                   BootyWeaponImage;                                         // 0x08A8(0x0004)
	class UMaterial*                                   BootyPartsImage[0x2];                                     // 0x08AC(0x0004)
	float                                              BGBeginX;                                                 // 0x08B4(0x0004)
	float                                              BGBeginY;                                                 // 0x08B8(0x0004)
	float                                              BGWidth;                                                  // 0x08BC(0x0004)
	float                                              BGHeight;                                                 // 0x08C0(0x0004)
	float                                              ControlBeginX;                                            // 0x08C4(0x0004)
	float                                              ControlBeginY;                                            // 0x08C8(0x0004)
	float                                              ControlWidth;                                             // 0x08CC(0x0004)
	float                                              ControlHeight;                                            // 0x08D0(0x0004)
	float                                              TeamBeginX;                                               // 0x08D4(0x0004)
	float                                              TeamBeginY;                                               // 0x08D8(0x0004)
	float                                              TeamOffsetY;                                              // 0x08DC(0x0004)
	float                                              TeamWidth;                                                // 0x08E0(0x0004)
	float                                              TeamHeight;                                               // 0x08E4(0x0004)
	float                                              TeamNameBeginX;                                           // 0x08E8(0x0004)
	float                                              TeamNameBeginY;                                           // 0x08EC(0x0004)
	float                                              TeamNameWidth;                                            // 0x08F0(0x0004)
	float                                              TeamNameHeight;                                           // 0x08F4(0x0004)
	float                                              TeamNameFontSize;                                         // 0x08F8(0x0004)
	float                                              TeamWinnerBeginX;                                         // 0x08FC(0x0004)
	float                                              TeamWinnerBeginY;                                         // 0x0900(0x0004)
	float                                              TeamWinnerWidth;                                          // 0x0904(0x0004)
	float                                              TeamWinnerHeight;                                         // 0x0908(0x0004)
	float                                              TeamMemberNicknameBeginX;                                 // 0x090C(0x0004)
	float                                              TeamMemberNicknameWidth;                                  // 0x0910(0x0004)
	float                                              TeamMemberClanBeginX;                                     // 0x0914(0x0004)
	float                                              TeamMemberClanWidth;                                      // 0x0918(0x0004)
	float                                              TeamMemberScoreBeginX;                                    // 0x091C(0x0004)
	float                                              TeamMemberScoreWidth;                                     // 0x0920(0x0004)
	float                                              TeamMemberKillBeginX;                                     // 0x0924(0x0004)
	float                                              TeamMemberKillWidth;                                      // 0x0928(0x0004)
	float                                              TeamMemberAssistBeginX;                                   // 0x092C(0x0004)
	float                                              TeamMemberAssistWidth;                                    // 0x0930(0x0004)
	float                                              TeamMemberDeathBeginX;                                    // 0x0934(0x0004)
	float                                              TeamMemberDeathWidth;                                     // 0x0938(0x0004)
	float                                              TeamMemberExpBeginX;                                      // 0x093C(0x0004)
	float                                              TeamMemberExpWidth;                                       // 0x0940(0x0004)
	float                                              TeamMemberPointBeginX;                                    // 0x0944(0x0004)
	float                                              TeamMemberPointWidth;                                     // 0x0948(0x0004)
	float                                              TeamMemberBeginY;                                         // 0x094C(0x0004)
	float                                              TeamMemberHeight;                                         // 0x0950(0x0004)
	float                                              TeamMemberHeightOffset;                                   // 0x0954(0x0004)
	float                                              TeamMemberFontSize;                                       // 0x0958(0x0004)
	float                                              TeamNameEmphasisBeginX;                                   // 0x095C(0x0004)
	float                                              TeamNameEmphasisBeginY;                                   // 0x0960(0x0004)
	float                                              TeamNameEmphasisWidth;                                    // 0x0964(0x0004)
	float                                              TeamNameEmphasisHeight;                                   // 0x0968(0x0004)
	float                                              BootyWeaponBeginX;                                        // 0x096C(0x0004)
	float                                              BootyWeaponBeginY;                                        // 0x0970(0x0004)
	float                                              BootyWeaponWidth;                                         // 0x0974(0x0004)
	float                                              BootyWeaponHeight;                                        // 0x0978(0x0004)
	float                                              BootyGetUserNameBeginX;                                   // 0x097C(0x0004)
	float                                              BootyGetUserNameBeginY;                                   // 0x0980(0x0004)
	float                                              BootyGetUserNameWidth;                                    // 0x0984(0x0004)
	float                                              BootyGetUserNameHeight;                                   // 0x0988(0x0004)
	float                                              BootyItemNameBeginX;                                      // 0x098C(0x0004)
	float                                              BootyItemNameBeginY;                                      // 0x0990(0x0004)
	float                                              BootyDisplayFonsSize;                                     // 0x0994(0x0004)
	struct FString                                     strBootyGet;                                              // 0x0998(0x000C) (Localized, NeedCtorLink)
	int                                                BootyWeaponId;                                            // 0x09A4(0x0004)
	int                                                BootyPartsID;                                             // 0x09A8(0x0004)
	struct FColor                                      DefaultFontColor;                                         // 0x09AC(0x0004)
	float                                              BootyPartsBeginX;                                         // 0x09B0(0x0004)
	float                                              BootyPartsBeginY;                                         // 0x09B4(0x0004)
	float                                              BootyPartsGapY;                                           // 0x09B8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XInterface.xScoreBoardGameResult_Booty");
		return ptr;
	}


	void DrawScoreboard(class UCanvas* C);
	void DrawTeamMember(class UCanvas* C);
	void DrawBootyInfo(class UCanvas* C);
	void DrawBGS(class UCanvas* C);
	class AHudBase* GetHudBaseOwner();
};


// Class XInterface.moEditBox
// 0x0008 (0x0354 - 0x034C)
class UmoEditBox : public UGUIMenuOption
{
public:
	unsigned long                                      bMaskText : 1;                                            // 0x034C(0x0004) (Edit)
	unsigned long                                      bReadOnly : 1;                                            // 0x034C(0x0004) (Edit)
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
	void SetText(const struct FString& NewText);
	struct FString GetText();
	struct FString GetComponentValue();
	void SetComponentValue(const struct FString& NewValue, bool bNoChange);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
