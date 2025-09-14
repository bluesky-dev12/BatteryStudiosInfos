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

// Class GUI2K4.UT2K4GUIController
// 0x0000 (0x045C - 0x045C)
class UUT2K4GUIController : public UGUIController
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.UT2K4GUIController");
		return ptr;
	}


	void PurgeComponentClasses();
	class UClass* AddComponentClass(const struct FString& ClassName);
	struct FString STATIC_GetQuitPage();
	struct FString STATIC_GetSettingsPage();
	struct FString STATIC_GetModPage();
	struct FString STATIC_GetInstantActionPage();
	struct FString STATIC_GetMultiplayerPage();
	struct FString STATIC_GetServerBrowserPage();
	struct FString STATIC_GetSinglePlayerPage();
	void STATIC_Validate();
	bool OpenMenu(const struct FString& NewMenuName, const struct FString& Param1, const struct FString& Param2);
	bool SetFocusTo(class UFloatingWindow* Menu);
	void ReturnToMainMenu();
};


// Class GUI2K4.PopupPageBase
// 0x0050 (0x03C4 - 0x0374)
class UPopupPageBase : public UUT2K4GUIPage
{
public:
	unsigned long                                      bFadeTimeChangeAlpha : 1;                                 // 0x0374(0x0004)
	unsigned long                                      bFadeTimeChangeColor : 1;                                 // 0x0374(0x0004)
	unsigned long                                      bFadeTimeTranslate : 1;                                   // 0x0374(0x0004)
	unsigned long                                      bUseChangeAlpha : 1;                                      // 0x0374(0x0004)
	unsigned long                                      bUseTranslate : 1;                                        // 0x0374(0x0004)
	class UFloatingImage*                              i_FrameBG;                                                // 0x0378(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	unsigned long                                      bCallFadeIn : 1;                                          // 0x037C(0x0004)
	unsigned long                                      bFading : 1;                                              // 0x037C(0x0004)
	unsigned long                                      bClosing : 1;                                             // 0x037C(0x0004)
	float                                              FadeTime;                                                 // 0x0380(0x0004) (Edit)
	float                                              CurFadeTime;                                              // 0x0384(0x0004) (Edit)
	unsigned char                                      CurFade;                                                  // 0x0388(0x0001) (Edit)
	unsigned char                                      DesiredFade;                                              // 0x0389(0x0001) (Edit)
	unsigned char                                      StartFade;                                                // 0x038A(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x1];                                       // 0x038B(0x0001) MISSED OFFSET
	struct FFloatBox                                   CurAWinPos;                                               // 0x038C(0x0010)
	struct FFloatBox                                   DesiredAWinPos;                                           // 0x039C(0x0010)
	struct FFloatBox                                   slidePos;                                                 // 0x03AC(0x0010)
	struct FScriptDelegate                             __OnFadeEnd__Delegate;                                    // 0x03BC(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.PopupPageBase");
		return ptr;
	}


	void Default_FadedOut();
	void FadeOut(bool bTranslate, bool bChangeAlpha);
	void FadeIn(bool bTranslate, bool bChangeAlpha);
	bool InternalOnPreDraw(class UCanvas* C);
	void OnFadeEnd();
	bool FindPoupPageBaseInMenuStack(class UGUIPage* CurrentPage);
	void Opened(class UGUIComponent* Sender);
};


// Class GUI2K4.FloatingWindow
// 0x0040 (0x0404 - 0x03C4)
class UFloatingWindow : public UPopupPageBase
{
public:
	class UGUIHeader*                                  t_WindowTitle;                                            // 0x03C4(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIButton*                                  b_ExitButton;                                             // 0x03C8(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline)
	struct FString                                     WindowName;                                               // 0x03CC(0x000C) (Edit, Localized, NeedCtorLink)
	float                                              MinPageWidth;                                             // 0x03D8(0x0004) (Edit)
	float                                              MinPageHeight;                                            // 0x03DC(0x0004) (Edit)
	float                                              MaxPageHeight;                                            // 0x03E0(0x0004) (Edit)
	float                                              MaxPageWidth;                                             // 0x03E4(0x0004) (Edit)
	unsigned long                                      bResizeWidthAllowed : 1;                                  // 0x03E8(0x0004) (Edit, EditConst)
	unsigned long                                      bResizeHeightAllowed : 1;                                 // 0x03E8(0x0004) (Edit, EditConst)
	unsigned long                                      bResizing : 1;                                            // 0x03E8(0x0004) (Edit, EditConst)
	unsigned long                                      bMoveAllowed : 1;                                         // 0x03E8(0x0004) (Edit, EditConst)
	unsigned long                                      bMoving : 1;                                              // 0x03E8(0x0004) (Edit, EditConst)
	unsigned long                                      TSizing : 1;                                              // 0x03E8(0x0004) (Edit, EditConst)
	unsigned long                                      RSizing : 1;                                              // 0x03E8(0x0004) (Edit, EditConst)
	unsigned long                                      LSizing : 1;                                              // 0x03E8(0x0004) (Edit, EditConst)
	unsigned long                                      BtSizing : 1;                                             // 0x03E8(0x0004) (Edit, EditConst)
	unsigned long                                      TLSizing : 1;                                             // 0x03E8(0x0004) (Edit, EditConst)
	unsigned long                                      TRSizing : 1;                                             // 0x03E8(0x0004) (Edit, EditConst)
	unsigned long                                      BRSizing : 1;                                             // 0x03E8(0x0004) (Edit, EditConst)
	unsigned long                                      BLSizing : 1;                                             // 0x03E8(0x0004) (Edit, EditConst)
	float                                              DefaultLeft;                                              // 0x03EC(0x0004) (Edit)
	float                                              DefaultTop;                                               // 0x03F0(0x0004) (Edit)
	float                                              DefaultWidth;                                             // 0x03F4(0x0004) (Edit)
	float                                              DefaultHeight;                                            // 0x03F8(0x0004) (Edit)
	int                                                HeaderMouseCursorIndex;                                   // 0x03FC(0x0004) (Edit)
	unsigned long                                      bSetControlsBoundToParent : 1;                            // 0x0400(0x0004)
	unsigned long                                      bSetControlsScaleToParent : 1;                            // 0x0400(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.FloatingWindow");
		return ptr;
	}


	void SetMouseCursorIndex(int NewIndex);
	bool XButtonClicked(class UGUIComponent* Sender);
	bool HoveringBottomLeft();
	bool HoveringTopLeft();
	bool HoveringBottomBorder();
	bool HoveringTopBorder();
	bool HoveringRightBorder();
	bool HoveringLeftBorder();
	bool ResizeAllowed();
	void ResizedHeight();
	void ResizedWidth();
	void ResizedBoth();
	void ResolutionChanged(int ResX, int ResY);
	void FloatingRendered(class UCanvas* C);
	bool FloatingPreDraw(class UCanvas* C);
	void SetPanelPosition(class UCanvas* C);
	bool FloatingHover(class UGUIComponent* Sender);
	void SaveCurrentPosition();
	void FloatingMouseRelease(class UGUIComponent* Sender);
	void FloatingMousePressed(class UGUIComponent* Sender, bool bRepeat);
	void SetFocus(class UGUIComponent* Who);
	void InternalOnCreateComponent(class UGUIComponent* NewComp, class UGUIComponent* Sender);
	void SetDefaultPosition();
	void CheckBounds();
	bool SystemMenuPreDraw(class UCanvas* Canvas);
	void AddSystemMenu();
	bool AlignFrame(class UCanvas* C);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUI2K4.fntUT2k4Menu
// 0x0000 (0x0084 - 0x0084)
class UfntUT2k4Menu : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.fntUT2k4Menu");
		return ptr;
	}

};


// Class GUI2K4.fntUT2k4Default
// 0x0000 (0x0084 - 0x0084)
class UfntUT2k4Default : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.fntUT2k4Default");
		return ptr;
	}

};


// Class GUI2K4.fntUT2k4Large
// 0x0000 (0x0084 - 0x0084)
class UfntUT2k4Large : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.fntUT2k4Large");
		return ptr;
	}

};


// Class GUI2K4.fntUT2k4Header
// 0x0000 (0x0084 - 0x0084)
class UfntUT2k4Header : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.fntUT2k4Header");
		return ptr;
	}

};


// Class GUI2K4.fntUT2k4Small
// 0x0000 (0x0084 - 0x0084)
class UfntUT2k4Small : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.fntUT2k4Small");
		return ptr;
	}

};


// Class GUI2K4.fntUT2k4MidGame
// 0x001C (0x00A0 - 0x0084)
class UfntUT2k4MidGame : public UGUIFont
{
public:
	int                                                FontScreenWidth[0x7];                                     // 0x0084(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.fntUT2k4MidGame");
		return ptr;
	}


	class UFont* GetFont(int XRes);
	class UFont* STATIC_GetMidGameFont(int XRes);
};


// Class GUI2K4.fntUT2k4SmallHeader
// 0x0000 (0x0084 - 0x0084)
class UfntUT2k4SmallHeader : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.fntUT2k4SmallHeader");
		return ptr;
	}

};


// Class GUI2K4.fntUT2k4ServerList
// 0x0000 (0x0084 - 0x0084)
class UfntUT2k4ServerList : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.fntUT2k4ServerList");
		return ptr;
	}

};


// Class GUI2K4.fntUT2k4IRC
// 0x0000 (0x0084 - 0x0084)
class UfntUT2k4IRC : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.fntUT2k4IRC");
		return ptr;
	}

};


// Class GUI2K4.fntUT2k4MainMenu
// 0x0000 (0x0084 - 0x0084)
class UfntUT2k4MainMenu : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.fntUT2k4MainMenu");
		return ptr;
	}

};


// Class GUI2K4.fntUT2K4Medium
// 0x0000 (0x0084 - 0x0084)
class UfntUT2K4Medium : public UGUIFont
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.fntUT2K4Medium");
		return ptr;
	}

};


// Class GUI2K4.GUI2Styles
// 0x0000 (0x0250 - 0x0250)
class UGUI2Styles : public UGUIStyles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.GUI2Styles");
		return ptr;
	}

};


// Class GUI2K4.STY2RoundButton
// 0x0000 (0x0250 - 0x0250)
class USTY2RoundButton : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2RoundButton");
		return ptr;
	}

};


// Class GUI2K4.STY2RoundScaledButton
// 0x0000 (0x0250 - 0x0250)
class USTY2RoundScaledButton : public USTY2RoundButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2RoundScaledButton");
		return ptr;
	}

};


// Class GUI2K4.STY2SquareButton
// 0x0000 (0x0250 - 0x0250)
class USTY2SquareButton : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2SquareButton");
		return ptr;
	}

};


// Class GUI2K4.STY2ListBox
// 0x0000 (0x0250 - 0x0250)
class USTY2ListBox : public USTY2SquareButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2ListBox");
		return ptr;
	}

};


// Class GUI2K4.STY2ScrollZone
// 0x0000 (0x0250 - 0x0250)
class USTY2ScrollZone : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2ScrollZone");
		return ptr;
	}

};


// Class GUI2K4.STY2TextButton
// 0x0000 (0x0250 - 0x0250)
class USTY2TextButton : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2TextButton");
		return ptr;
	}

};


// Class GUI2K4.STY2Page
// 0x0000 (0x0250 - 0x0250)
class USTY2Page : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2Page");
		return ptr;
	}

};


// Class GUI2K4.STY2Footer
// 0x0000 (0x0250 - 0x0250)
class USTY2Footer : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2Footer");
		return ptr;
	}

};


// Class GUI2K4.STY2Header
// 0x0000 (0x0250 - 0x0250)
class USTY2Header : public USTY2Footer
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2Header");
		return ptr;
	}

};


// Class GUI2K4.STY2TabButton
// 0x0000 (0x0250 - 0x0250)
class USTY2TabButton : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2TabButton");
		return ptr;
	}

};


// Class GUI2K4.STY2CharButton
// 0x0000 (0x0250 - 0x0250)
class USTY2CharButton : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2CharButton");
		return ptr;
	}

};


// Class GUI2K4.STY2ArrowLeft
// 0x0000 (0x0250 - 0x0250)
class USTY2ArrowLeft : public USTY2RoundButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2ArrowLeft");
		return ptr;
	}

};


// Class GUI2K4.STY2ArrowRight
// 0x0000 (0x0250 - 0x0250)
class USTY2ArrowRight : public USTY2RoundButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2ArrowRight");
		return ptr;
	}

};


// Class GUI2K4.STY2ServerBrowserGrid
// 0x0000 (0x0250 - 0x0250)
class USTY2ServerBrowserGrid : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2ServerBrowserGrid");
		return ptr;
	}

};


// Class GUI2K4.STY2NoBackground
// 0x0000 (0x0250 - 0x0250)
class USTY2NoBackground : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2NoBackground");
		return ptr;
	}

};


// Class GUI2K4.STY2ServerBrowserGridHeader
// 0x0000 (0x0250 - 0x0250)
class USTY2ServerBrowserGridHeader : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2ServerBrowserGridHeader");
		return ptr;
	}

};


// Class GUI2K4.STY2SliderCaption
// 0x0000 (0x0250 - 0x0250)
class USTY2SliderCaption : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2SliderCaption");
		return ptr;
	}

};


// Class GUI2K4.STY2LadderButton
// 0x0000 (0x0250 - 0x0250)
class USTY2LadderButton : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2LadderButton");
		return ptr;
	}

};


// Class GUI2K4.STY2LadderButtonHi
// 0x0000 (0x0250 - 0x0250)
class USTY2LadderButtonHi : public USTY2LadderButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2LadderButtonHi");
		return ptr;
	}

};


// Class GUI2K4.STY2LadderButtonActive
// 0x0000 (0x0250 - 0x0250)
class USTY2LadderButtonActive : public USTY2LadderButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2LadderButtonActive");
		return ptr;
	}

};


// Class GUI2K4.STY2BindBox
// 0x0000 (0x0250 - 0x0250)
class USTY2BindBox : public USTY2NoBackground
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2BindBox");
		return ptr;
	}

};


// Class GUI2K4.STY2SquareBar
// 0x0000 (0x0250 - 0x0250)
class USTY2SquareBar : public USTY2RoundButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2SquareBar");
		return ptr;
	}

};


// Class GUI2K4.STY2SquareMenuButton
// 0x0000 (0x0250 - 0x0250)
class USTY2SquareMenuButton : public USTY2SquareButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2SquareMenuButton");
		return ptr;
	}

};


// Class GUI2K4.STY2MidGameButton
// 0x0000 (0x0250 - 0x0250)
class USTY2MidGameButton : public USTY2SquareMenuButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2MidGameButton");
		return ptr;
	}

};


// Class GUI2K4.STY2TextLabel
// 0x0000 (0x0250 - 0x0250)
class USTY2TextLabel : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2TextLabel");
		return ptr;
	}

};


// Class GUI2K4.STY2ComboListBox
// 0x0000 (0x0250 - 0x0250)
class USTY2ComboListBox : public USTY2ListBox
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2ComboListBox");
		return ptr;
	}

};


// Class GUI2K4.STY2IRCText
// 0x0000 (0x0250 - 0x0250)
class USTY2IRCText : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2IRCText");
		return ptr;
	}

};


// Class GUI2K4.STY2IRCEntry
// 0x0000 (0x0250 - 0x0250)
class USTY2IRCEntry : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2IRCEntry");
		return ptr;
	}

};


// Class GUI2K4.STY2BrowserButton
// 0x0000 (0x0250 - 0x0250)
class USTY2BrowserButton : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2BrowserButton");
		return ptr;
	}

};


// Class GUI2K4.STY2ContextMenu
// 0x0000 (0x0250 - 0x0250)
class USTY2ContextMenu : public USTY2ListBox
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2ContextMenu");
		return ptr;
	}

};


// Class GUI2K4.STY2ServerListContextMenu
// 0x0000 (0x0250 - 0x0250)
class USTY2ServerListContextMenu : public USTY2ContextMenu
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2ServerListContextMenu");
		return ptr;
	}

};


// Class GUI2K4.STY2ListSelection
// 0x0000 (0x0250 - 0x0250)
class USTY2ListSelection : public USTY_ListSelection
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2ListSelection");
		return ptr;
	}

};


// Class GUI2K4.STY2TabBackground
// 0x0000 (0x0250 - 0x0250)
class USTY2TabBackground : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2TabBackground");
		return ptr;
	}

};


// Class GUI2K4.STY2BrowserListSel
// 0x0000 (0x0250 - 0x0250)
class USTY2BrowserListSel : public USTY2ListSelection
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2BrowserListSel");
		return ptr;
	}

};


// Class GUI2K4.STY2EditBox
// 0x0000 (0x0250 - 0x0250)
class USTY2EditBox : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2EditBox");
		return ptr;
	}

};


// Class GUI2K4.STY2CheckBox
// 0x0000 (0x0250 - 0x0250)
class USTY2CheckBox : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2CheckBox");
		return ptr;
	}

};


// Class GUI2K4.STY2CheckBoxCheck
// 0x0000 (0x0250 - 0x0250)
class USTY2CheckBoxCheck : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2CheckBoxCheck");
		return ptr;
	}

};


// Class GUI2K4.STY2SliderKnob
// 0x0000 (0x0250 - 0x0250)
class USTY2SliderKnob : public USTY2RoundButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2SliderKnob");
		return ptr;
	}

};


// Class GUI2K4.STY2BottomTabButton
// 0x0000 (0x0250 - 0x0250)
class USTY2BottomTabButton : public USTY2TabButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2BottomTabButton");
		return ptr;
	}

};


// Class GUI2K4.STY2ListSectionHeader
// 0x0000 (0x0250 - 0x0250)
class USTY2ListSectionHeader : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2ListSectionHeader");
		return ptr;
	}

};


// Class GUI2K4.STY2ItemOutline
// 0x0000 (0x0250 - 0x0250)
class USTY2ItemOutline : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2ItemOutline");
		return ptr;
	}

};


// Class GUI2K4.STY2ListHighlight
// 0x0000 (0x0250 - 0x0250)
class USTY2ListHighlight : public USTY2ListSelection
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2ListHighlight");
		return ptr;
	}

};


// Class GUI2K4.STY2MouseOverLabel
// 0x0000 (0x0250 - 0x0250)
class USTY2MouseOverLabel : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2MouseOverLabel");
		return ptr;
	}

};


// Class GUI2K4.STY2SliderBar
// 0x0000 (0x0250 - 0x0250)
class USTY2SliderBar : public USTY2SquareButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2SliderBar");
		return ptr;
	}

};


// Class GUI2K4.STY2DarkTextLabel
// 0x0000 (0x0250 - 0x0250)
class USTY2DarkTextLabel : public USTY2TextLabel
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2DarkTextLabel");
		return ptr;
	}

};


// Class GUI2K4.STY2TextButtonEffect
// 0x0000 (0x0250 - 0x0250)
class USTY2TextButtonEffect : public USTY2TextButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2TextButtonEffect");
		return ptr;
	}

};


// Class GUI2K4.STY2ArrowRightDbl
// 0x0000 (0x0250 - 0x0250)
class USTY2ArrowRightDbl : public USTY2RoundButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2ArrowRightDbl");
		return ptr;
	}

};


// Class GUI2K4.STY2ArrowLeftDbl
// 0x0000 (0x0250 - 0x0250)
class USTY2ArrowLeftDbl : public USTY2RoundButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2ArrowLeftDbl");
		return ptr;
	}

};


// Class GUI2K4.STY2FooterButton
// 0x0000 (0x0250 - 0x0250)
class USTY2FooterButton : public USTY2TabButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2FooterButton");
		return ptr;
	}

};


// Class GUI2K4.STY2SectionHeaderText
// 0x0000 (0x0250 - 0x0250)
class USTY2SectionHeaderText : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2SectionHeaderText");
		return ptr;
	}

};


// Class GUI2K4.STY2ComboButton
// 0x0000 (0x0250 - 0x0250)
class USTY2ComboButton : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2ComboButton");
		return ptr;
	}

};


// Class GUI2K4.STY2VertUpButton
// 0x0000 (0x0250 - 0x0250)
class USTY2VertUpButton : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2VertUpButton");
		return ptr;
	}

};


// Class GUI2K4.STY2VertDownButton
// 0x0000 (0x0250 - 0x0250)
class USTY2VertDownButton : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2VertDownButton");
		return ptr;
	}

};


// Class GUI2K4.STY2VertGrip
// 0x0000 (0x0250 - 0x0250)
class USTY2VertGrip : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2VertGrip");
		return ptr;
	}

};


// Class GUI2K4.STY2Spinner
// 0x0000 (0x0250 - 0x0250)
class USTY2Spinner : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2Spinner");
		return ptr;
	}

};


// Class GUI2K4.STY2SectionHeaderTop
// 0x0000 (0x0250 - 0x0250)
class USTY2SectionHeaderTop : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2SectionHeaderTop");
		return ptr;
	}

};


// Class GUI2K4.STY2SectionHeaderBar
// 0x0000 (0x0250 - 0x0250)
class USTY2SectionHeaderBar : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2SectionHeaderBar");
		return ptr;
	}

};


// Class GUI2K4.STY2CloseButton
// 0x0000 (0x0250 - 0x0250)
class USTY2CloseButton : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2CloseButton");
		return ptr;
	}

};


// Class GUI2K4.STY2CoolScroll
// 0x0000 (0x0250 - 0x0250)
class USTY2CoolScroll : public UGUI2Styles
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2CoolScroll");
		return ptr;
	}

};


// Class GUI2K4.STY2AltComboButton
// 0x0000 (0x0250 - 0x0250)
class USTY2AltComboButton : public USTY2ComboButton
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.STY2AltComboButton");
		return ptr;
	}

};


// Class GUI2K4.UT2K4InGameChat
// 0x0028 (0x042C - 0x0404)
class UUT2K4InGameChat : public UFloatingWindow
{
public:
	class UGUISectionBackground*                       sb_Main;                                                  // 0x0404(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UmoEditBox*                                  eb_Send;                                                  // 0x0408(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIScrollTextBox*                           lb_Chat;                                                  // 0x040C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                OldCMC;                                                   // 0x0410(0x0004) (Edit)
	TArray<unsigned char>                              CloseKey;                                                 // 0x0414(0x000C) (Edit, NeedCtorLink, EditInline)
	struct FColor                                      TextColor[0x3];                                           // 0x0420(0x0004) (Edit, EditInline, DataBinding)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.UT2K4InGameChat");
		return ptr;
	}


	void InternalOnCreateComponent(class UGUIComponent* NewComp, class UGUIComponent* Sender);
	bool InternalOnKeyEvent(float Delta, unsigned char* key, unsigned char* State);
	void HandleChat(const struct FString& Msg, int TeamIndex);
	void Closed(class UGUIComponent* Sender, bool bCancelled);
	void Opened(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUI2K4.AltSectionBackground
// 0x0000 (0x0374 - 0x0374)
class UAltSectionBackground : public UGUISectionBackground
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUI2K4.AltSectionBackground");
		return ptr;
	}

};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
