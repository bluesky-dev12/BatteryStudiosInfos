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

// Class GUIWarfareControls.BTWindowHK
// 0x00BC (0x04C0 - 0x0404)
class UBTWindowHK : public UFloatingWindow
{
public:
	float                                              TimeOut;                                                  // 0x0404(0x0004)
	bool                                               bSetTimeOut;                                              // 0x0408(0x0004)
	class UBTOwnerDrawImageHK*                         BackgroundImage;                                          // 0x040C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         TopLine;                                                  // 0x0410(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         BottomLine;                                               // 0x0414(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         BottomLine2;                                              // 0x0418(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonOK;                                                 // 0x041C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonCancel;                                             // 0x0420(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbBackgroundImage;                                        // 0x0424(0x0010)
	struct FFloatBox                                   fbTopLine;                                                // 0x0434(0x0010)
	struct FFloatBox                                   fbBottomLine;                                             // 0x0444(0x0010)
	struct FFloatBox                                   fbButtonOK;                                               // 0x0454(0x0010)
	struct FFloatBox                                   fbButtonCancel;                                           // 0x0464(0x0010)
	bool                                               UseOpenSound;                                             // 0x0474(0x0004)
	bool                                               UseCloseSound;                                            // 0x0474(0x0004)
	bool                                               CloseWeb;                                                 // 0x0474(0x0004)
	string                                             strTitle;                                                 // 0x0478(0x000C) (Localized, NeedCtorLink)
	string                                             strOK;                                                    // 0x0484(0x000C) (Localized, NeedCtorLink)
	string                                             strCancel;                                                // 0x0490(0x000C) (Localized, NeedCtorLink)
	bool                                               bHandleEsc;                                               // 0x049C(0x0004)
	struct FScriptDelegate                             __OnOK__Delegate;                                         // 0x04A0(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnCancel__Delegate;                                     // 0x04A8(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnTimeTick__Delegate;                                   // 0x04B0(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnTimeOut__Delegate;                                    // 0x04B8(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowHK");
		return ptr;
	}


	void STATIC_CloseWindowAllByName(class UGUIController* Controller, class UClass* WindowName);
	bool TimeOutPreDraw(class UCanvas* C);
	void StopTimeOut(float SetTime);
	void StartTimeOut(float SetTime);
	void DefaultCloseWindow_OnTimeOut(class UGUIComponent* Sender);
	void OnTimeOut(class UGUIComponent* Sender);
	void OnTimeTick(float leftime);
	bool InternalOnKeyEvent(float Delta, byte* key, byte* State);
	class UBTOwnerDrawCaptionButtonHK* NewButtonComponent(const struct FFloatBox& fbNewCompo, float RenderWeight);
	class UBTOwnerDrawImageHK* NewLabelComponent(const struct FFloatBox& fbNewCompo, const struct FImage& bgImg, float RenderWeight);
	bool ButtonCancel_OnClick(class UGUIComponent* Sender);
	bool ButtonOK_OnClick(class UGUIComponent* Sender);
	void Closed(class UGUIComponent* Sender, bool bCancelled);
	void Opened(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetTitleCaption(const string& S);
	void SetContentOffset(int nOffsetX, int nOffsetY);
	void UpdateDefaultWindow();
	bool DefaultCloseWindow_OnOK(class UGUIComponent* Sender);
	bool OnCancel(class UGUIComponent* Sender);
	bool OnOK(class UGUIComponent* Sender);
};


// Class GUIWarfareControls.BTWindowAutoResizeHK
// 0x0114 (0x05D4 - 0x04C0)
class UBTWindowAutoResizeHK : public UBTWindowHK
{
public:
	struct FBtrDouble                                  ExtraData_btrdouble;                                      // 0x04C0(0x0008)
	string                                             ExtraData_string;                                         // 0x04C8(0x000C) (NeedCtorLink)
	int                                                ExtraData_int;                                            // 0x04D4(0x0004)
	int                                                ExtraData_int2;                                           // 0x04D8(0x0004)
	int                                                ExtraData_int3;                                           // 0x04DC(0x0004)
	bool                                               bStableText;                                              // 0x04E0(0x0004)
	string                                             Caption;                                                  // 0x04E4(0x000C) (NeedCtorLink)
	string                                             Warning;                                                  // 0x04F0(0x000C) (NeedCtorLink)
	int                                                FontSize;                                                 // 0x04FC(0x0004)
	int                                                LabelSpace;                                               // 0x0500(0x0004)
	int                                                LabelSpaceWarning;                                        // 0x0504(0x0004)
	int                                                LabelSpaceDivider;                                        // 0x0508(0x0004)
	int                                                LabelSpaceEdit;                                           // 0x050C(0x0004)
	int                                                LabelSpaceMultiLineEditMsg;                               // 0x0510(0x0004)
	int                                                VisibleLabelCount;                                        // 0x0514(0x0004)
	struct FFloatBox                                   fbLabelInfo;                                              // 0x0518(0x0010)
	struct FFloatBox                                   fbLabelWarning;                                           // 0x0528(0x0010)
	struct FFloatBox                                   fbLabelDivider;                                           // 0x0538(0x0010)
	struct FFloatBox                                   fbEditName;                                               // 0x0548(0x0010)
	struct FFloatBox                                   fbMultiLineEditMsg;                                       // 0x0558(0x0010)
	struct FFloatBox                                   fbMultiLineEditMsg2;                                      // 0x0568(0x0010)
	struct FFloatBox                                   fbButtonOK2;                                              // 0x0578(0x0010)
	struct FFloatBox                                   fbButtonCancel2;                                          // 0x0588(0x0010)
	class UBTOwnerDrawImageHK*                         LabelInfo[0xA];                                           // 0x0598(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTEditBoxHK*                                EditName;                                                 // 0x05C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       MultiLineEditMsg;                                         // 0x05C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       MultiLineEditMsg2;                                        // 0x05C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelWarning;                                             // 0x05CC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelDivider;                                             // 0x05D0(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowAutoResizeHK");
		return ptr;
	}


	void ResizeWidth(int W);
	bool STATIC_ShowWindow(class UGUIController* con, const string& Title, const string& Msg, const string& Warn, const string& btnOk, const string& btnCancel);
	void RemoveSizeY(int halfsize, int halfy);
	void InsertSizeY(int halfsize, int halfy);
	bool Internal_OnPreDraw(class UCanvas* C);
	void SetButtonCaption(const string& strOK, const string& strCancel);
	void SetData(const string& Title, const string& Caption, const string& Warning);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowDefineARHK
// 0x078C (0x0D60 - 0x05D4)
class UBTWindowDefineARHK : public UBTWindowAutoResizeHK
{
public:
	string                                             strClientDefaultTitle;                                    // 0x05D4(0x000C) (Localized, NeedCtorLink)
	string                                             strClientTitle[0x50];                                     // 0x05E0(0x000C) (Localized, NeedCtorLink)
	string                                             strClientDefine[0x50];                                    // 0x09A0(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowDefineARHK");
		return ptr;
	}


	void STATIC_CloseWindowAll(class UGUIController* Controller);
	bool STATIC_ShowInfo(class UGUIController* con, int Code, const string& arg0, const string& arg1, const string& arg2, const string& arg3);
	bool STATIC_SetContentText(class UGUIController* con, int Code, const string& arg0, const string& arg1, const string& arg2, const string& arg3);
	bool SetContentText_Instance(int Code, const string& arg0, const string& arg1, const string& arg2, const string& arg3);
};


// Class GUIWarfareControls.BTWindowInfoHK
// 0x0018 (0x04D8 - 0x04C0)
class UBTWindowInfoHK : public UBTWindowHK
{
public:
	bool                                               bChangeText;                                              // 0x04C0(0x0004)
	struct FFloatBox                                   fbLabelInfo;                                              // 0x04C4(0x0010)
	class UBTOwnerDrawImageHK*                         LabelInfo;                                                // 0x04D4(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowInfoHK");
		return ptr;
	}


	bool Internal_OnKeyEvent(float Delta, byte* key, byte* Action);
	bool Internal_OnPreDraw(class UCanvas* C);
	bool STATIC_ShowWindow(class UGUIController* con, const string& Title, const string& Msg, const string& btnOk);
	void SetData(const string& Title, int titlepadding, const string& Msg, const string& btnOk);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowDefineInfoHK
// 0x1C30 (0x2108 - 0x04D8)
class UBTWindowDefineInfoHK : public UBTWindowInfoHK
{
public:
	string                                             strClientDefaultTitle;                                    // 0x04D8(0x000C) (Localized, NeedCtorLink)
	string                                             strClientDefine[0x12C];                                   // 0x04E4(0x000C) (Localized, NeedCtorLink)
	string                                             strClientTitle[0x12C];                                    // 0x12F4(0x000C) (Localized, NeedCtorLink)
	int                                                DefineCode;                                               // 0x2104(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowDefineInfoHK");
		return ptr;
	}


	bool STATIC_ShowInfo(class UGUIController* con, int Code, const string& arg0, const string& arg1, const string& arg2);
	string STATIC_GetClientString(int Code);
	string STATIC_GetFormatString(int Code, const string& arg0, const string& arg1, const string& arg2, const string& arg3, const string& arg4, const string& arg5, const string& arg6, const string& arg7, const string& arg8);
	void SetContentText_Instance(int Code, const string& arg0, const string& arg1, const string& arg2, const string& arg3);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTEditBoxHK
// 0x0128 (0x0490 - 0x0368)
class UBTEditBoxHK : public UGUIEditBox
{
public:
	bool                                               bHudMode;                                                 // 0x0368(0x0004)
	bool                                               bLimitDrawSize;                                           // 0x0368(0x0004)
	float                                              LimitDrawWidth;                                           // 0x036C(0x0004)
	int                                                LimitDrawTextSize;                                        // 0x0370(0x0004)
	int                                                FontSize[0x5];                                            // 0x0374(0x0004)
	struct FColor                                      FontColor[0x5];                                           // 0x0388(0x0004)
	struct FColor                                      FontShadowColor[0x5];                                     // 0x039C(0x0004)
	struct FImage                                      bgImg;                                                    // 0x03B0(0x0020)
	int                                                ButtonID;                                                 // 0x03D0(0x0004)
	bool                                               bActiveCursor;                                            // 0x03D4(0x0004)
	class UCanvas*                                     saveC;                                                    // 0x03D8(0x0004)
	struct FColor                                      SelectionColor;                                           // 0x03DC(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FColor                                      CursorColor;                                              // 0x03E0(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FImage                                      selectionImg;                                             // 0x03E4(0x0020)
	struct FImage                                      cursorImg;                                                // 0x0404(0x0020)
	float[]                                            CacheTextWidth;                                           // 0x0424(0x000C) (NeedCtorLink)
	float                                              CacheTextHeight;                                          // 0x0430(0x0004)
	string                                             textStrVis;                                               // 0x0434(0x000C) (NeedCtorLink)
	string                                             BackupTextStr;                                            // 0x0440(0x000C) (NeedCtorLink)
	int                                                EndVis;                                                   // 0x044C(0x0004)
	bool                                               bClickAllSelect;                                          // 0x0450(0x0004)
	bool                                               bSelectionMode;                                           // 0x0450(0x0004)
	bool                                               bMouseFirstPress;                                         // 0x0450(0x0004)
	bool                                               bMousePressed;                                            // 0x0450(0x0004)
	bool                                               bCursorBlink;                                             // 0x0450(0x0004)
	float                                              BlinkTimer;                                               // 0x0454(0x0004)
	float                                              OldBlinkTimer;                                            // 0x0458(0x0004)
	bool                                               useCaps;                                                  // 0x045C(0x0004)
	struct UBTEditBoxHK_FSelectionArea                 SelArea;                                                  // 0x0460(0x0008)
	struct FScriptDelegate                             __OnChat__Delegate;                                       // 0x0468(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnInputTab__Delegate;                                   // 0x0470(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnInputSpace__Delegate;                                 // 0x0478(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnFunctionKey__Delegate;                                // 0x0480(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnMaxTextStrNum__Delegate;                              // 0x0488(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTEditBoxHK");
		return ptr;
	}


	void InternalDeactivate();
	void InternalActivate();
	bool InternalOnKeyEvent(float Delta, byte* key, byte* State);
	bool InternalOnKeyType(const string& Unicode, byte* key);
	bool CheckPastedTextCondition(const string& Text);
	bool CheckKeyInputCondition(const string& st);
	string ConvertIllegal(const string& inputstr);
	int CaretBinarySearch(int lCursor, int rCursor, float mx, int Parent);
	int MousePosToCaretPos(float mx, float my);
	void OnMousePressed(class UGUIComponent* Sender, bool bRepeat);
	void OnMouseRelease(class UGUIComponent* Sender);
	void Internal_OnChange(class UGUIComponent* Sender);
	void ResetCache();
	void CaculateVisibleText(bool bHoldFirst, int pos);
	void SetFontColorAll(const struct FColor& Col);
	void DrawIMEInfo(class UCanvas* C, float CursorWidth);
	bool OwnerDraw(class UCanvas* C);
	void Clear();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetTextSelect(const string& Text, bool bAllSelect);
	void SetText(const string& Text);
	void InputSelectionPos(int pos);
	void ResetSelectionPos(int pos);
	string GetSelectionText();
	void RemoveSelectionText();
	void SetFontSizeAll(int Size);
	void SetDefaultFontColor();
	void OnMaxTextStrNum(class UGUIComponent* Sender);
	bool OnFunctionKey(class UGUIComponent* Sender, byte FunctionKey, const string& Text);
	void OnInputSpace(class UGUIComponent* Sender, const string& Text);
	void OnInputTab(class UGUIComponent* Sender, const string& Text);
	bool OnChat(class UGUIComponent* Sender, const string& Text);
};


// Class GUIWarfareControls.BTUIColorPoolHK
// 0x0000 (0x002C - 0x002C)
class UBTUIColorPoolHK : public UObject
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTUIColorPoolHK");
		return ptr;
	}


	struct FColor STATIC_FriendlyUserNameDisable();
	struct FColor STATIC_FriendlyUserNameSelected();
	struct FColor STATIC_FriendlyUserNamePressed();
	struct FColor STATIC_FriendlyUserNameOn();
	struct FColor STATIC_FriendlyUserNameN();
	struct FColor STATIC_NewQuest_Reward();
	struct FColor STATIC_NewQuest_Content();
	struct FColor STATIC_NewQuest_Title();
	struct FColor STATIC_CompletedQuest_Reward();
	struct FColor STATIC_CompletedQuest_Content();
	struct FColor STATIC_CompletedQuest_Title();
	struct FColor STATIC_ListItem_Disable();
	struct FColor STATIC_ListItem_Select();
	struct FColor STATIC_ListItem_On();
	struct FColor STATIC_ListItem_Normal();
	struct FColor STATIC_ItemUIStatus_Minus();
	struct FColor STATIC_ItemUIStatus_Plus();
	struct FColor STATIC_ItemUIStatus_Normal();
	struct FColor STATIC_DefaultRed();
	struct FColor STATIC_DefaultGrayMoreWhite();
	struct FColor STATIC_DefaultGray();
	struct FColor STATIC_DefaultShadow();
	struct FColor STATIC_DefaultWhite();
	struct FColor STATIC_InverseLabelWarning();
	struct FColor STATIC_LabelWarning();
	struct FColor STATIC_Damage4();
	struct FColor STATIC_Damage3();
	struct FColor STATIC_Damage2();
	struct FColor STATIC_Damage1();
	struct FColor STATIC_Damage0();
	struct FColor STATIC_SmallPerc();
	struct FColor STATIC_Coupon();
	struct FColor STATIC_Point();
	struct FColor STATIC_Cash();
	struct FColor STATIC_QuestReward();
	struct FColor STATIC_ListTopButtonDisable();
	struct FColor STATIC_ListTopButtonPressed();
	struct FColor STATIC_ListTopButtonWatched();
	struct FColor STATIC_ListTopButtonOn();
	struct FColor STATIC_ListTopButtonN();
	struct FColor STATIC_SubTabButtonDisable();
	struct FColor STATIC_SubTabButtonPressed();
	struct FColor STATIC_SubTabButtonWatched();
	struct FColor STATIC_SubTabButtonOn();
	struct FColor STATIC_SubTabButtonN();
	struct FColor STATIC_TabButtonDisable_PaidItem();
	struct FColor STATIC_TabButtonPressed_PaidItem();
	struct FColor STATIC_TabButtonWatched_PaidItem();
	struct FColor STATIC_TabButtonOn_PaidItem();
	struct FColor STATIC_TabButtonN_PaidItem();
	struct FColor STATIC_TabButtonDisable();
	struct FColor STATIC_TabButtonPressed();
	struct FColor STATIC_TabButtonWatched();
	struct FColor STATIC_TabButtonOn();
	struct FColor STATIC_TabButtonN();
	struct FColor STATIC_ButtonPageListDisable();
	struct FColor STATIC_ButtonPageListPressed();
	struct FColor STATIC_ButtonPageListWatched();
	struct FColor STATIC_ButtonPageListOn();
	struct FColor STATIC_ButtonPageListN();
	struct FColor STATIC_RadioButtonSelect();
	struct FColor STATIC_RadioButtonDisable();
	struct FColor STATIC_RadioButtonPressed();
	struct FColor STATIC_RadioButtonWatched();
	struct FColor STATIC_RadioButtonOn();
	struct FColor STATIC_RadioButtonNBold();
	struct FColor STATIC_RadioButtonN();
	struct FColor STATIC_BigButtonPressedShadow();
	struct FColor STATIC_BigButtonOnShadow();
	struct FColor STATIC_BigButtonDisable();
	struct FColor STATIC_BigButtonPressed();
	struct FColor STATIC_BigButtonWatched();
	struct FColor STATIC_BigButtonOn();
	struct FColor STATIC_BigButtonN();
	struct FColor STATIC_ButtonPressedShadow();
	struct FColor STATIC_ButtonOnShadow();
	struct FColor STATIC_newButtonDisable();
	struct FColor STATIC_newButtonPressed();
	struct FColor STATIC_newButtonWatched();
	struct FColor STATIC_newButtonOn();
	struct FColor STATIC_newButtonN();
	struct FColor STATIC_ButtonDisable();
	struct FColor STATIC_ButtonPressed();
	struct FColor STATIC_ButtonWatched();
	struct FColor STATIC_ButtonOn();
	struct FColor STATIC_ButtonN();
	struct FColor STATIC_AASLevel7();
	struct FColor STATIC_AASLevel3();
	struct FColor STATIC_ChatTeam();
	struct FColor STATIC_ChatTeamGhost();
	struct FColor STATIC_ChatGhost();
	struct FColor STATIC_ChatBroadCastItem();
	struct FColor STATIC_ChatSystem();
	struct FColor STATIC_ChatClan();
	struct FColor STATIC_ChatWhisper();
	struct FColor STATIC_ChatSelf();
	struct FColor STATIC_ChatNormal();
	struct FColor STATIC_GradePCBang();
	struct FColor STATIC_GradeLegend();
	struct FColor STATIC_GradeRare();
	struct FColor STATIC_GradeHigh();
	struct FColor STATIC_GradeNormal();
	struct FColor STATIC_GradeCommon();
	struct FColor STATIC_GradeShop();
	struct FColor STATIC_GradeShop_DurabilityX();
	struct FColor STATIC_GradeBase();
	struct FColor STATIC_myName();
	struct FColor STATIC_ClanName();
};


// Class GUIWarfareControls.BTUIResourcePoolHK
// 0x74C8 (0x74F4 - 0x002C)
class UBTUIResourcePoolHK : public UObject
{
public:
	struct FColor                                      DefaultDrawColor;                                         // 0x002C(0x0004)
	struct FColor                                      DefaultShadowColor;                                       // 0x0030(0x0004)
	struct FImage                                      ex_clanmark;                                              // 0x0034(0x0020)
	struct FImage                                      cm_00;                                                    // 0x0054(0x0020)
	struct FImage                                      item_item_CF_blank_n;                                     // 0x0074(0x0020)
	struct FImage                                      img_panel_small;                                          // 0x0094(0x0020)
	struct FImage                                      img_panel_small_stretch;                                  // 0x00B4(0x0020)
	struct FImage                                      icon_knife;                                               // 0x00D4(0x0020)
	struct FImage                                      icon_pisgun;                                              // 0x00F4(0x0020)
	struct FImage                                      icon_snipr;                                               // 0x0114(0x0020)
	struct FImage                                      icon_roket;                                               // 0x0134(0x0020)
	struct FImage                                      icon_password;                                            // 0x0154(0x0020)
	struct FImage                                      icon_snipr_non;                                           // 0x0174(0x0020)
	struct FImage                                      help_page;                                                // 0x0194(0x0020)
	struct FImage                                      hud_back_3;                                               // 0x01B4(0x0020)
	struct FImage                                      img_HUD_back_1;                                           // 0x01D4(0x0020)
	struct FImage                                      img_slot_hlmt;                                            // 0x01F4(0x0020)
	struct FImage                                      img_slot_grnd;                                            // 0x0214(0x0020)
	struct FImage                                      img_slot_gogl;                                            // 0x0234(0x0020)
	struct FImage                                      img_slot_face;                                            // 0x0254(0x0020)
	struct FImage                                      img_slot_clth;                                            // 0x0274(0x0020)
	struct FImage                                      img_slot_class;                                           // 0x0294(0x0020)
	struct FImage                                      img_logo_CI;                                              // 0x02B4(0x0020)
	struct FImage                                      img_logo_BTRtga;                                          // 0x02D4(0x0020)
	struct FImage                                      img_15;                                                   // 0x02F4(0x0020)
	struct FImage                                      img_18;                                                   // 0x0314(0x0020)
	struct FImage                                      img_login_test;                                           // 0x0334(0x0020)
	struct FImage                                      slider_back;                                              // 0x0354(0x0020)
	struct FImage                                      slider_grip_n;                                            // 0x0374(0x0020)
	struct FImage                                      slider_grip_on;                                           // 0x0394(0x0020)
	struct FImage                                      img_result_indimat_ma;                                    // 0x03B4(0x0020)
	struct FImage                                      img_trophy;                                               // 0x03D4(0x0020)
	struct FImage                                      img_trophy_scale;                                         // 0x03F4(0x0020)
	struct FImage                                      img_promot;                                               // 0x0414(0x0020)
	struct FImage                                      img_HUD_back_3;                                           // 0x0434(0x0020)
	struct FImage                                      icon_LVup;                                                // 0x0454(0x0020)
	struct FImage                                      icon_MVP;                                                 // 0x0474(0x0020)
	struct FImage                                      img_bonus;                                                // 0x0494(0x0020)
	struct FImage                                      img_result_AF;                                            // 0x04B4(0x0020)
	struct FImage                                      img_result_RSA;                                           // 0x04D4(0x0020)
	struct FImage                                      img_win_1;                                                // 0x04F4(0x0020)
	struct FImage                                      img_lose_1;                                               // 0x0514(0x0020)
	struct FImage                                      img_win_2;                                                // 0x0534(0x0020)
	struct FImage                                      img_lose_2;                                               // 0x0554(0x0020)
	struct FImage                                      img_win_3;                                                // 0x0574(0x0020)
	struct FImage                                      img_lose_3;                                               // 0x0594(0x0020)
	struct FImage                                      img_result_AF_ma;                                         // 0x05B4(0x0020)
	struct FImage                                      img_result_RSA_ma;                                        // 0x05D4(0x0020)
	struct FImage                                      sgau_weap_back;                                           // 0x05F4(0x0020)
	struct FImage                                      sgau_weap_gauge;                                          // 0x0614(0x0020)
	struct FImage                                      sgau_weap_incre;                                          // 0x0634(0x0020)
	struct FImage                                      sgau_weap_decre;                                          // 0x0654(0x0020)
	struct FImage                                      img_chat;                                                 // 0x0674(0x0020)
	struct FImage                                      gau_exp_back;                                             // 0x0694(0x0020)
	struct FImage                                      gau_exp_gauge;                                            // 0x06B4(0x0020)
	struct FImage                                      sgau_ping_1;                                              // 0x06D4(0x0020)
	struct FImage                                      sgau_ping_2;                                              // 0x06F4(0x0020)
	struct FImage                                      sgau_ping_3;                                              // 0x0714(0x0020)
	struct FImage                                      sgau_ping_4;                                              // 0x0734(0x0020)
	struct FImage                                      sgau_ping_back;                                           // 0x0754(0x0020)
	struct FImage                                      img_pup_sau;                                              // 0x0774(0x0020)
	struct FImage                                      img_ptitl_back;                                           // 0x0794(0x0020)
	struct FImage                                      butt_left_n;                                              // 0x07B4(0x0020)
	struct FImage                                      butt_left_on;                                             // 0x07D4(0x0020)
	struct FImage                                      butt_left_cli;                                            // 0x07F4(0x0020)
	struct FImage                                      butt_left_dis;                                            // 0x0814(0x0020)
	struct FImage                                      butt_right_n;                                             // 0x0834(0x0020)
	struct FImage                                      butt_right_on;                                            // 0x0854(0x0020)
	struct FImage                                      butt_right_cli;                                           // 0x0874(0x0020)
	struct FImage                                      butt_right_dis;                                           // 0x0894(0x0020)
	struct FImage                                      empty;                                                    // 0x08B4(0x0020)
	struct FImage                                      img_ser_listop;                                           // 0x08D4(0x0020)
	struct FImage                                      img_ser_listop_STRETCHED_ALL;                             // 0x08F4(0x0020)
	struct FImage                                      radi_dis;                                                 // 0x0914(0x0020)
	struct FImage                                      radi_back;                                                // 0x0934(0x0020)
	struct FImage                                      radi_ok;                                                  // 0x0954(0x0020)
	struct FImage                                      chek_dis;                                                 // 0x0974(0x0020)
	struct FImage                                      chek_back;                                                // 0x0994(0x0020)
	struct FImage                                      chek_ok;                                                  // 0x09B4(0x0020)
	struct FImage                                      list_commu_n;                                             // 0x09D4(0x0020)
	struct FImage                                      tap_n;                                                    // 0x09F4(0x0020)
	struct FImage                                      tap_on;                                                   // 0x0A14(0x0020)
	struct FImage                                      tap_foc;                                                  // 0x0A34(0x0020)
	struct FImage                                      tap_cli;                                                  // 0x0A54(0x0020)
	struct FImage                                      tap_dis;                                                  // 0x0A74(0x0020)
	struct FImage                                      tap_n_tro;                                                // 0x0A94(0x0020)
	struct FImage                                      tap_on_tro;                                               // 0x0AB4(0x0020)
	struct FImage                                      tap_foc_tro;                                              // 0x0AD4(0x0020)
	struct FImage                                      tap_cli_tro;                                              // 0x0AF4(0x0020)
	struct FImage                                      tap_dis_tro;                                              // 0x0B14(0x0020)
	struct FImage                                      tap_n_default;                                            // 0x0B34(0x0020)
	struct FImage                                      tap_on_default;                                           // 0x0B54(0x0020)
	struct FImage                                      tap_cli_default;                                          // 0x0B74(0x0020)
	struct FImage                                      tap_dis_default;                                          // 0x0B94(0x0020)
	struct FImage                                      butt_big_n;                                               // 0x0BB4(0x0020)
	struct FImage                                      butt_big_on;                                              // 0x0BD4(0x0020)
	struct FImage                                      butt_big_cli;                                             // 0x0BF4(0x0020)
	struct FImage                                      butt_big_dis;                                             // 0x0C14(0x0020)
	struct FImage                                      list_item_n;                                              // 0x0C34(0x0020)
	struct FImage                                      list_item_new;                                            // 0x0C54(0x0020)
	struct FImage                                      list_item_on;                                             // 0x0C74(0x0020)
	struct FImage                                      img_item_info;                                            // 0x0C94(0x0020)
	struct FImage                                      list_item_non;                                            // 0x0CB4(0x0020)
	struct FImage                                      icon_rem_cmor;                                            // 0x0CD4(0x0020)
	struct FImage                                      icon_rem_cobr;                                            // 0x0CF4(0x0020)
	struct FImage                                      icon_rem_dotd;                                            // 0x0D14(0x0020)
	struct FImage                                      icon_rem_eotc;                                            // 0x0D34(0x0020)
	struct FImage                                      icon_rem_mrds;                                            // 0x0D54(0x0020)
	struct FImage                                      icon_rem_sco3;                                            // 0x0D74(0x0020)
	struct FImage                                      icon_rem_sco5;                                            // 0x0D94(0x0020)
	struct FImage                                      icon_rem_sco7;                                            // 0x0DB4(0x0020)
	struct FImage                                      icon_rem_siln;                                            // 0x0DD4(0x0020)
	struct FImage                                      icon_rem_skil;                                            // 0x0DF4(0x0020)
	struct FImage                                      icon_rem_barrel;                                          // 0x0E14(0x0020)
	struct FImage                                      icon_rem_gunstock;                                        // 0x0E34(0x0020)
	struct FImage                                      img_divid_line;                                           // 0x0E54(0x0020)
	struct FImage                                      img_divid_line_c;                                         // 0x0E74(0x0020)
	struct FImage                                      img_edge_line;                                            // 0x0E94(0x0020)
	struct FImage                                      img_AF_cha;                                               // 0x0EB4(0x0020)
	struct FImage                                      img_RSA_cha;                                              // 0x0ED4(0x0020)
	struct FImage                                      butt_m_n;                                                 // 0x0EF4(0x0020)
	struct FImage                                      butt_m_on;                                                // 0x0F14(0x0020)
	struct FImage                                      butt_m_cli;                                               // 0x0F34(0x0020)
	struct FImage                                      butt_m_dis;                                               // 0x0F54(0x0020)
	struct FImage                                      butt_n;                                                   // 0x0F74(0x0020)
	struct FImage                                      butt_on;                                                  // 0x0F94(0x0020)
	struct FImage                                      butt_cli;                                                 // 0x0FB4(0x0020)
	struct FImage                                      butt_dis;                                                 // 0x0FD4(0x0020)
	struct FImage                                      img_cash_non;                                             // 0x0FF4(0x0020)
	struct FImage                                      img_point_b;                                              // 0x1014(0x0020)
	struct FImage                                      img_point_non;                                            // 0x1034(0x0020)
	struct FImage                                      img_cash;                                                 // 0x1054(0x0020)
	struct FImage                                      img_point;                                                // 0x1074(0x0020)
	struct FImage                                      img_point_LC;                                             // 0x1094(0x0020)
	struct FImage                                      img_repair_non;                                           // 0x10B4(0x0020)
	struct FImage                                      img_class_non;                                            // 0x10D4(0x0020)
	struct FImage                                      panel_1;                                                  // 0x10F4(0x0020)
	struct FImage                                      panel_1_half_alpha;                                       // 0x1114(0x0020)
	struct FImage                                      panel_1_1;                                                // 0x1134(0x0020)
	struct FImage                                      panel_2;                                                  // 0x1154(0x0020)
	struct FImage                                      panel_3;                                                  // 0x1174(0x0020)
	struct FImage                                      panel_4;                                                  // 0x1194(0x0020)
	struct FImage                                      panel_5;                                                  // 0x11B4(0x0020)
	struct FImage                                      panel_6;                                                  // 0x11D4(0x0020)
	struct FImage                                      panel_7;                                                  // 0x11F4(0x0020)
	struct FImage                                      img_hold;                                                 // 0x1214(0x0020)
	struct FImage                                      img_new;                                                  // 0x1234(0x0020)
	struct FImage                                      img_popul;                                                // 0x1254(0x0020)
	struct FImage                                      img_recom;                                                // 0x1274(0x0020)
	struct FImage                                      list_lobby_on;                                            // 0x1294(0x0020)
	struct FImage                                      list_lobby_cli;                                           // 0x12B4(0x0020)
	struct FImage                                      list_lobby_n;                                             // 0x12D4(0x0020)
	struct FImage                                      butt_list_n;                                              // 0x12F4(0x0020)
	struct FImage                                      butt_list_on;                                             // 0x1314(0x0020)
	struct FImage                                      butt_list_cli;                                            // 0x1334(0x0020)
	struct FImage                                      butt_list_dis;                                            // 0x1354(0x0020)
	struct FImage                                      img_list_divid;                                           // 0x1374(0x0020)
	struct FImage                                      img_bak_aro;                                              // 0x1394(0x0020)
	struct FImage                                      img_fir_aro;                                              // 0x13B4(0x0020)
	struct FImage                                      img_nex_aro;                                              // 0x13D4(0x0020)
	struct FImage                                      img_back1;                                                // 0x13F4(0x0020)
	struct FImage                                      img_upper;                                                // 0x1414(0x0020)
	struct FImage                                      butt_af_n;                                                // 0x1434(0x0020)
	struct FImage                                      butt_af_on;                                               // 0x1454(0x0020)
	struct FImage                                      butt_af_cli;                                              // 0x1474(0x0020)
	struct FImage                                      butt_rsa_n;                                               // 0x1494(0x0020)
	struct FImage                                      butt_rsa_on;                                              // 0x14B4(0x0020)
	struct FImage                                      butt_rsa_cli;                                             // 0x14D4(0x0020)
	struct FImage                                      img_input_x;                                              // 0x14F4(0x0020)
	struct FImage                                      img_input_s;                                              // 0x1514(0x0020)
	struct FImage                                      icon_mstr;                                                // 0x1534(0x0020)
	struct FImage                                      img_top_default;                                          // 0x1554(0x0020)
	struct FImage                                      img_page_thema;                                           // 0x1574(0x0020)
	struct FImage                                      img_page_thema_trophy;                                    // 0x1594(0x0020)
	struct FImage                                      butt_quik_n;                                              // 0x15B4(0x0020)
	struct FImage                                      butt_quik_on;                                             // 0x15D4(0x0020)
	struct FImage                                      butt_quik_click;                                          // 0x15F4(0x0020)
	struct FImage                                      butt_quik_empty;                                          // 0x1614(0x0020)
	struct FImage                                      butt_quik_input;                                          // 0x1634(0x0020)
	struct FImage                                      butt_quik_chang;                                          // 0x1654(0x0020)
	struct FImage                                      gauge_loading;                                            // 0x1674(0x0020)
	struct FImage                                      gauge_loading_back;                                       // 0x1694(0x0020)
	struct FImage                                      radi_on;                                                  // 0x16B4(0x0020)
	struct FImage                                      img_promot_Scale;                                         // 0x16D4(0x0020)
	struct FImage                                      Item_Item_WP_ETC_RifleBox;                                // 0x16F4(0x0020)
	struct FImage                                      img_up1;                                                  // 0x1714(0x0020)
	struct FImage                                      img_up2;                                                  // 0x1734(0x0020)
	struct FImage                                      img_up3;                                                  // 0x1754(0x0020)
	struct FImage                                      img_down1;                                                // 0x1774(0x0020)
	struct FImage                                      img_down2;                                                // 0x1794(0x0020)
	struct FImage                                      img_staff_back;                                           // 0x17B4(0x0020)
	struct FImage                                      img_staff_text;                                           // 0x17D4(0x0020)
	struct FImage                                      img_3ditem_back_0;                                        // 0x17F4(0x0020)
	struct FImage                                      img_3ditem_back_0_WeaponBack;                             // 0x1814(0x0020)
	struct FImage                                      img_3ditem_back_0_TrophyBack;                             // 0x1834(0x0020)
	struct FImage                                      img_3ditem_back_0_EditBack;                               // 0x1854(0x0020)
	struct FImage                                      img_3ditem_back_1;                                        // 0x1874(0x0020)
	struct FImage                                      img_gauge_arow;                                           // 0x1894(0x0020)
	struct FImage                                      img_edge_icon;                                            // 0x18B4(0x0020)
	struct FImage                                      Lv_Mark[0x4C];                                            // 0x18D4(0x0020)
	struct FImage                                      ClanLevel[0x1F];                                          // 0x2254(0x0020)
	struct FImage                                      list_serv_n;                                              // 0x2634(0x0020)
	struct FImage                                      Item_Item_FT_point;                                       // 0x2654(0x0020)
	struct FImage                                      Item_Item_FT_epgain;                                      // 0x2674(0x0020)
	struct FImage                                      Item_Item_FT_ptgain;                                      // 0x2694(0x0020)
	struct FImage                                      Item_Item_FT_pt_bns;                                      // 0x26B4(0x0020)
	struct FImage                                      img_panel_1;                                              // 0x26D4(0x0020)
	struct FImage                                      img_panel_2;                                              // 0x26F4(0x0020)
	struct FImage                                      img_panel_3;                                              // 0x2714(0x0020)
	struct FImage                                      panel_inven_in;                                           // 0x2734(0x0020)
	struct FImage                                      panel_inven_out;                                          // 0x2754(0x0020)
	struct FImage                                      panel_store_in;                                           // 0x2774(0x0020)
	struct FImage                                      panel_store_out;                                          // 0x2794(0x0020)
	struct FImage                                      img_inven;                                                // 0x27B4(0x0020)
	struct FImage                                      list_item_inven_n;                                        // 0x27D4(0x0020)
	struct FImage                                      list_item_inven_on;                                       // 0x27F4(0x0020)
	struct FImage                                      list_item_inven_cli;                                      // 0x2814(0x0020)
	struct FImage                                      list_item_inven_foc;                                      // 0x2834(0x0020)
	struct FImage                                      list_item_store_n;                                        // 0x2854(0x0020)
	struct FImage                                      list_item_store_on;                                       // 0x2874(0x0020)
	struct FImage                                      list_item_store_cli;                                      // 0x2894(0x0020)
	struct FImage                                      list_item_store_foc;                                      // 0x28B4(0x0020)
	struct FImage                                      butt_inven_n;                                             // 0x28D4(0x0020)
	struct FImage                                      butt_inven_on;                                            // 0x28F4(0x0020)
	struct FImage                                      butt_inven_cli;                                           // 0x2914(0x0020)
	struct FImage                                      butt_inven_dis;                                           // 0x2934(0x0020)
	struct FImage                                      tap_n_inven;                                              // 0x2954(0x0020)
	struct FImage                                      tap_on_inven;                                             // 0x2974(0x0020)
	struct FImage                                      tap_cli_inven;                                            // 0x2994(0x0020)
	struct FImage                                      tap_dis_inven;                                            // 0x29B4(0x0020)
	struct FImage                                      tap_n_store;                                              // 0x29D4(0x0020)
	struct FImage                                      tap_on_store;                                             // 0x29F4(0x0020)
	struct FImage                                      tap_cli_store;                                            // 0x2A14(0x0020)
	struct FImage                                      tap_dis_store;                                            // 0x2A34(0x0020)
	struct FImage                                      icon_clan_free;                                           // 0x2A54(0x0020)
	struct FImage                                      img_make_clan;                                            // 0x2A74(0x0020)
	struct FImage                                      list_serv_cli;                                            // 0x2A94(0x0020)
	struct FImage                                      list_commu_on;                                            // 0x2AB4(0x0020)
	struct FImage                                      list_commu_cli;                                           // 0x2AD4(0x0020)
	struct FImage                                      icon_leader;                                              // 0x2AF4(0x0020)
	struct FImage                                      icon_cl_a1;                                               // 0x2B14(0x0020)
	struct FImage                                      icon_cl_a2;                                               // 0x2B34(0x0020)
	struct FImage                                      icon_cl_a3;                                               // 0x2B54(0x0020)
	struct FImage                                      icon_cl_a4;                                               // 0x2B74(0x0020)
	struct FImage                                      icon_cl_a5;                                               // 0x2B94(0x0020)
	struct FImage                                      img_cm_128_ds_sku_03;                                     // 0x2BB4(0x0020)
	struct FImage                                      img_cm_128_ds_sku_04;                                     // 0x2BD4(0x0020)
	struct FImage                                      img_cm_128_ds_sku_06;                                     // 0x2BF4(0x0020)
	struct FImage                                      img_cm_128_ds_sku_07;                                     // 0x2C14(0x0020)
	struct FImage                                      scrol_back;                                               // 0x2C34(0x0020)
	struct FImage                                      scrol_up_n;                                               // 0x2C54(0x0020)
	struct FImage                                      scrol_up_on;                                              // 0x2C74(0x0020)
	struct FImage                                      scrol_dn_n;                                               // 0x2C94(0x0020)
	struct FImage                                      scrol_dn_on;                                              // 0x2CB4(0x0020)
	struct FImage                                      scrol_grip_n;                                             // 0x2CD4(0x0020)
	struct FImage                                      scrol_grip_on;                                            // 0x2CF4(0x0020)
	struct FImage                                      gau_ser_back;                                             // 0x2D14(0x0020)
	struct FImage                                      gau_ser_gauge;                                            // 0x2D34(0x0020)
	struct FImage                                      icon_fixroom;                                             // 0x2D54(0x0020)
	struct FImage                                      icon_quest_day;                                           // 0x2D74(0x0020)
	struct FImage                                      icon_quest_tuto;                                          // 0x2D94(0x0020)
	struct FImage                                      icon_quest_pcroom;                                        // 0x2DB4(0x0020)
	struct FImage                                      icon_quest_pcroom2;                                       // 0x2DD4(0x0020)
	struct FImage                                      icon_quest_event;                                         // 0x2DF4(0x0020)
	struct FImage                                      img_point_help;                                           // 0x2E14(0x0020)
	struct FImage                                      img_exclamation;                                          // 0x2E34(0x0020)
	struct FImage                                      butt_rot_rt_n;                                            // 0x2E54(0x0020)
	struct FImage                                      butt_rot_rt_on;                                           // 0x2E74(0x0020)
	struct FImage                                      butt_rot_rt_cli;                                          // 0x2E94(0x0020)
	struct FImage                                      butt_rot_lt_n;                                            // 0x2EB4(0x0020)
	struct FImage                                      butt_rot_lt_on;                                           // 0x2ED4(0x0020)
	struct FImage                                      butt_rot_lt_cli;                                          // 0x2EF4(0x0020)
	struct FImage                                      butt_rot_af_n;                                            // 0x2F14(0x0020)
	struct FImage                                      butt_rot_af_on;                                           // 0x2F34(0x0020)
	struct FImage                                      butt_rot_af_cli;                                          // 0x2F54(0x0020)
	struct FImage                                      butt_rot_rsa_n;                                           // 0x2F74(0x0020)
	struct FImage                                      butt_rot_rsa_on;                                          // 0x2F94(0x0020)
	struct FImage                                      butt_rot_rsa_cli;                                         // 0x2FB4(0x0020)
	struct FImage                                      img_help_all0;                                            // 0x2FD4(0x0020)
	struct FImage                                      img_help_all1;                                            // 0x2FF4(0x0020)
	struct FImage                                      img_help_all2;                                            // 0x3014(0x0020)
	struct FImage                                      img_help_all3;                                            // 0x3034(0x0020)
	struct FImage                                      img_help_all4;                                            // 0x3054(0x0020)
	struct FImage                                      img_help_all5;                                            // 0x3074(0x0020)
	struct FImage                                      img_help_all6;                                            // 0x3094(0x0020)
	struct FImage                                      img_help_all7;                                            // 0x30B4(0x0020)
	struct FImage                                      img_help_all8;                                            // 0x30D4(0x0020)
	struct FImage                                      img_help_all9;                                            // 0x30F4(0x0020)
	struct FImage                                      img_help_all10;                                           // 0x3114(0x0020)
	struct FImage                                      icon_bns[0x7];                                            // 0x3134(0x0020)
	struct FImage                                      icon_bns_chnl;                                            // 0x3214(0x0020)
	struct FImage                                      help_top;                                                 // 0x3234(0x0020)
	struct FImage                                      help_btn_n;                                               // 0x3254(0x0020)
	struct FImage                                      help_btn_on;                                              // 0x3274(0x0020)
	struct FImage                                      help_btn_cli;                                             // 0x3294(0x0020)
	struct FImage                                      help_back_web;                                            // 0x32B4(0x0020)
	struct FImage                                      help_back;                                                // 0x32D4(0x0020)
	struct FImage                                      help_Title_Notice;                                        // 0x32F4(0x0020)
	struct FImage                                      help_Notice;                                              // 0x3314(0x0020)
	struct FImage                                      cf_on;                                                    // 0x3334(0x0020)
	struct FImage                                      cf_foc;                                                   // 0x3354(0x0020)
	struct FImage                                      cf_cli;                                                   // 0x3374(0x0020)
	struct FImage                                      icon_new;                                                 // 0x3394(0x0020)
	struct FImage                                      img_white;                                                // 0x33B4(0x0020)
	struct FImage                                      ex_clanmark_01;                                           // 0x33D4(0x0020)
	struct FImage                                      ex_clanmark_02;                                           // 0x33F4(0x0020)
	struct FImage                                      img_quest_top;                                            // 0x3414(0x0020)
	struct FImage                                      img_quest_back;                                           // 0x3434(0x0020)
	struct FImage                                      img_quest_bottom;                                         // 0x3454(0x0020)
	struct FImage                                      item_item_cash;                                           // 0x3474(0x0020)
	struct FImage                                      img_top_win_af;                                           // 0x3494(0x0020)
	struct FImage                                      img_top_win_rsa;                                          // 0x34B4(0x0020)
	struct FImage                                      img_top_lose_af;                                          // 0x34D4(0x0020)
	struct FImage                                      img_top_lose_rsa;                                         // 0x34F4(0x0020)
	struct FImage                                      icon_notify_click;                                        // 0x3514(0x0020)
	struct FImage                                      img_timeitempopup_info;                                   // 0x3534(0x0020)
	struct FImage                                      img_timeitempopup_renew;                                  // 0x3554(0x0020)
	struct FImage                                      butt_big_Bling;                                           // 0x3574(0x0020)
	struct FImage                                      img_serverchannel_bgdeco;                                 // 0x3594(0x0020)
	struct FImage                                      newlist_serv_n;                                           // 0x35B4(0x0020)
	struct FImage                                      newlist_serv_on;                                          // 0x35D4(0x0020)
	struct FImage                                      newlist_serv_cli;                                         // 0x35F4(0x0020)
	struct FImage                                      newlist_serv_block;                                       // 0x3614(0x0020)
	struct FImage                                      newlist_serv_Focus;                                       // 0x3634(0x0020)
	struct FImage                                      newlist_Channel_n;                                        // 0x3654(0x0020)
	struct FImage                                      newlist_Channel_on;                                       // 0x3674(0x0020)
	struct FImage                                      newlist_Channel_cli;                                      // 0x3694(0x0020)
	struct FImage                                      newlist_Channel_block;                                    // 0x36B4(0x0020)
	struct FImage                                      newlist_Channel_Focus;                                    // 0x36D4(0x0020)
	struct FImage                                      ServerSelPageBtn_n;                                       // 0x36F4(0x0020)
	struct FImage                                      ServerSelPageBtn_on;                                      // 0x3714(0x0020)
	struct FImage                                      ServerSelPageBtn_cli;                                     // 0x3734(0x0020)
	struct FImage                                      ServerSelPageBtn_block;                                   // 0x3754(0x0020)
	struct FImage                                      ServerGroup[0x5];                                         // 0x3774(0x0020)
	struct FImage                                      OptionBtn_n;                                              // 0x3814(0x0020)
	struct FImage                                      OptionBtn_on;                                             // 0x3834(0x0020)
	struct FImage                                      OptionBtn_cli;                                            // 0x3854(0x0020)
	struct FImage                                      OptionBtn_block;                                          // 0x3874(0x0020)
	struct FImage                                      OptionBtn_Focus;                                          // 0x3894(0x0020)
	struct FImage                                      ExitBtn_n;                                                // 0x38B4(0x0020)
	struct FImage                                      ExitBtn_on;                                               // 0x38D4(0x0020)
	struct FImage                                      ExitBtn_cli;                                              // 0x38F4(0x0020)
	struct FImage                                      ExitBtn_block;                                            // 0x3914(0x0020)
	struct FImage                                      ExitBtn_Focus;                                            // 0x3934(0x0020)
	struct FImage                                      ClanBtn_n;                                                // 0x3954(0x0020)
	struct FImage                                      ClanBtn_on;                                               // 0x3974(0x0020)
	struct FImage                                      ClanBtn_cli;                                              // 0x3994(0x0020)
	struct FImage                                      ClanBtn_block;                                            // 0x39B4(0x0020)
	struct FImage                                      ClanBtn_Focus;                                            // 0x39D4(0x0020)
	struct FImage                                      Mailbox_n;                                                // 0x39F4(0x0020)
	struct FImage                                      Mailbox_on;                                               // 0x3A14(0x0020)
	struct FImage                                      Mailbox_cli;                                              // 0x3A34(0x0020)
	struct FImage                                      Mailbox_block;                                            // 0x3A54(0x0020)
	struct FImage                                      Mailbox_Focus;                                            // 0x3A74(0x0020)
	struct FImage                                      Quest_n;                                                  // 0x3A94(0x0020)
	struct FImage                                      Quest_on;                                                 // 0x3AB4(0x0020)
	struct FImage                                      Quest_cli;                                                // 0x3AD4(0x0020)
	struct FImage                                      Quest_block;                                              // 0x3AF4(0x0020)
	struct FImage                                      Quest_Focus;                                              // 0x3B14(0x0020)
	struct FImage                                      Back_n;                                                   // 0x3B34(0x0020)
	struct FImage                                      Back_on;                                                  // 0x3B54(0x0020)
	struct FImage                                      Back_cli;                                                 // 0x3B74(0x0020)
	struct FImage                                      Back_block;                                               // 0x3B94(0x0020)
	struct FImage                                      Back_Focus;                                               // 0x3BB4(0x0020)
	struct FImage                                      ad_serverchannel;                                         // 0x3BD4(0x0020)
	struct FImage                                      Ad_ServerChannel2;                                        // 0x3BF4(0x0020)
	struct FImage                                      gau_servers_status_back;                                  // 0x3C14(0x0020)
	struct FImage                                      gau_servers_status_gauge;                                 // 0x3C34(0x0020)
	struct FImage                                      ChannelBg;                                                // 0x3C54(0x0020)
	struct FImage                                      ChannelBgBeginner;                                        // 0x3C74(0x0020)
	struct FImage                                      ChannelBgTraining;                                        // 0x3C94(0x0020)
	struct FImage                                      ChannelBgNormal;                                          // 0x3CB4(0x0020)
	struct FImage                                      ChannelBgExpert;                                          // 0x3CD4(0x0020)
	struct FImage                                      ChannelBgClan;                                            // 0x3CF4(0x0020)
	struct FImage                                      LobbyBG;                                                  // 0x3D14(0x0020)
	struct FImage                                      newlist_Lobby_n;                                          // 0x3D34(0x0020)
	struct FImage                                      newlist_Lobby_on;                                         // 0x3D54(0x0020)
	struct FImage                                      newlist_Lobby_cli;                                        // 0x3D74(0x0020)
	struct FImage                                      newlist_Lobby_block;                                      // 0x3D94(0x0020)
	struct FImage                                      newlist_Lobby_Focus;                                      // 0x3DB4(0x0020)
	struct FImage                                      ad_lobby;                                                 // 0x3DD4(0x0020)
	struct FImage                                      Msg_list_n;                                               // 0x3DF4(0x0020)
	struct FImage                                      Msg_list_on;                                              // 0x3E14(0x0020)
	struct FImage                                      Msg_list_cli;                                             // 0x3E34(0x0020)
	struct FImage                                      Msg_list_block;                                           // 0x3E54(0x0020)
	struct FImage                                      Msg_list_Focus;                                           // 0x3E74(0x0020)
	struct FImage                                      Lobby_Btn_Big_n;                                          // 0x3E94(0x0020)
	struct FImage                                      Lobby_Btn_Big_on;                                         // 0x3EB4(0x0020)
	struct FImage                                      Lobby_Btn_Big_cli;                                        // 0x3ED4(0x0020)
	struct FImage                                      Lobby_Btn_Big_block;                                      // 0x3EF4(0x0020)
	struct FImage                                      Lobby_Btn_mid_n;                                          // 0x3F14(0x0020)
	struct FImage                                      Lobby_Btn_mid_on;                                         // 0x3F34(0x0020)
	struct FImage                                      Lobby_Btn_mid_cli;                                        // 0x3F54(0x0020)
	struct FImage                                      Lobby_Btn_mid_block;                                      // 0x3F74(0x0020)
	struct FImage                                      Lobby_Enter_Btn_n;                                        // 0x3F94(0x0020)
	struct FImage                                      Lobby_Enter_Btn_on;                                       // 0x3FB4(0x0020)
	struct FImage                                      Lobby_Enter_Btn_cli;                                      // 0x3FD4(0x0020)
	struct FImage                                      Lobby_Enter_Btn_block;                                    // 0x3FF4(0x0020)
	struct FImage                                      Lobby_Quick_Enter_Btn_n;                                  // 0x4014(0x0020)
	struct FImage                                      Lobby_Quick_Enter_Btn_on;                                 // 0x4034(0x0020)
	struct FImage                                      Lobby_Quick_Enter_Btn_cli;                                // 0x4054(0x0020)
	struct FImage                                      Lobby_Quick_Enter_Btn_block;                              // 0x4074(0x0020)
	struct FImage                                      Lobby_Quick_Enter_Setting_Btn_n;                          // 0x4094(0x0020)
	struct FImage                                      Lobby_Quick_Enter_Setting_Btn_on;                         // 0x40B4(0x0020)
	struct FImage                                      Lobby_Quick_Enter_Setting_Btn_cli;                        // 0x40D4(0x0020)
	struct FImage                                      Lobby_Quick_Enter_Setting_Btn_block;                      // 0x40F4(0x0020)
	struct FImage                                      Cash_Btn_mid_n;                                           // 0x4114(0x0020)
	struct FImage                                      Lobby_Btn_small_n;                                        // 0x4134(0x0020)
	struct FImage                                      Lobby_Btn_small_on;                                       // 0x4154(0x0020)
	struct FImage                                      Lobby_Btn_small_cli;                                      // 0x4174(0x0020)
	struct FImage                                      Lobby_Btn_small_block;                                    // 0x4194(0x0020)
	struct FImage                                      Lobby_Chat_Input_Bg;                                      // 0x41B4(0x0020)
	struct FImage                                      Lobby_ChatBtn_small_n;                                    // 0x41D4(0x0020)
	struct FImage                                      Lobby_ChatBtn_small_on;                                   // 0x41F4(0x0020)
	struct FImage                                      Lobby_ChatBtn_small_cli;                                  // 0x4214(0x0020)
	struct FImage                                      Lobby_ChatBtn_small_block;                                // 0x4234(0x0020)
	struct FImage                                      Lobby_ChatBtnUp_small_n;                                  // 0x4254(0x0020)
	struct FImage                                      Lobby_ChatBtnUp_small_on;                                 // 0x4274(0x0020)
	struct FImage                                      Lobby_ChatBtnUp_small_cli;                                // 0x4294(0x0020)
	struct FImage                                      Lobby_ChatBtnUp_small_block;                              // 0x42B4(0x0020)
	struct FImage                                      Lobby_ChatBtnDn_small_n;                                  // 0x42D4(0x0020)
	struct FImage                                      Lobby_ChatBtnDn_small_on;                                 // 0x42F4(0x0020)
	struct FImage                                      Lobby_ChatBtnDn_small_cli;                                // 0x4314(0x0020)
	struct FImage                                      Lobby_ChatBtnDn_small_block;                              // 0x4334(0x0020)
	struct FImage                                      Lobby_MyInfo_Btn_n;                                       // 0x4354(0x0020)
	struct FImage                                      Lobby_MyInfo_Btn_on;                                      // 0x4374(0x0020)
	struct FImage                                      Lobby_MyInfo_Btn_cli;                                     // 0x4394(0x0020)
	struct FImage                                      Lobby_MyInfo_Btn_block;                                   // 0x43B4(0x0020)
	struct FImage                                      Lobby_MyInfo_Btn_Focus;                                   // 0x43D4(0x0020)
	struct FImage                                      TopMenuBtn_n;                                             // 0x43F4(0x0020)
	struct FImage                                      TopMenuBtn_on;                                            // 0x4414(0x0020)
	struct FImage                                      TopMenuBtn_cli;                                           // 0x4434(0x0020)
	struct FImage                                      TopMenuBtn_block;                                         // 0x4454(0x0020)
	struct FImage                                      TopMenuShop_Btn_n;                                        // 0x4474(0x0020)
	struct FImage                                      TopMenuShop_Btn_on;                                       // 0x4494(0x0020)
	struct FImage                                      TopMenuShop_Btn_cli;                                      // 0x44B4(0x0020)
	struct FImage                                      TopMenuShop_Btn_block;                                    // 0x44D4(0x0020)
	struct FImage                                      TopMenuInven_Btn_n;                                       // 0x44F4(0x0020)
	struct FImage                                      TopMenuInven_Btn_on;                                      // 0x4514(0x0020)
	struct FImage                                      TopMenuInven_Btn_cli;                                     // 0x4534(0x0020)
	struct FImage                                      TopMenuInven_Btn_block;                                   // 0x4554(0x0020)
	struct FImage                                      TopMenuLuckyShop_Btn_n;                                   // 0x4574(0x0020)
	struct FImage                                      TopMenuLuckyShop_Btn_on;                                  // 0x4594(0x0020)
	struct FImage                                      TopMenuLuckyShop_Btn_cli;                                 // 0x45B4(0x0020)
	struct FImage                                      TopMenuLuckyShop_Btn_block;                               // 0x45D4(0x0020)
	struct FImage                                      TopBgDeco;                                                // 0x45F4(0x0020)
	struct FImage                                      newimg_point_LC;                                          // 0x4614(0x0020)
	struct FImage                                      newimg_cash_LC;                                           // 0x4634(0x0020)
	struct FImage                                      newgau_exp_back;                                          // 0x4654(0x0020)
	struct FImage                                      newgau_exp_gauge;                                         // 0x4674(0x0020)
	struct FImage                                      Inven_bg;                                                 // 0x4694(0x0020)
	struct FImage                                      new_img_slot_MainGun;                                     // 0x46B4(0x0020)
	struct FImage                                      new_img_slot_Pistol;                                      // 0x46D4(0x0020)
	struct FImage                                      new_img_slot_Knife;                                       // 0x46F4(0x0020)
	struct FImage                                      new_img_slot_hlmt;                                        // 0x4714(0x0020)
	struct FImage                                      new_img_slot_grnd1;                                       // 0x4734(0x0020)
	struct FImage                                      new_img_slot_grnd2;                                       // 0x4754(0x0020)
	struct FImage                                      new_img_slot_gogl;                                        // 0x4774(0x0020)
	struct FImage                                      new_img_slot_face;                                        // 0x4794(0x0020)
	struct FImage                                      new_img_slot_clth_af;                                     // 0x47B4(0x0020)
	struct FImage                                      new_img_slot_clth_rsa;                                    // 0x47D4(0x0020)
	struct FImage                                      new_img_slot_class;                                       // 0x47F4(0x0020)
	struct FImage                                      new_img_slot_BackPack;                                    // 0x4814(0x0020)
	struct FImage                                      new_img_slot_Pouch;                                       // 0x4834(0x0020)
	struct FImage                                      new_img_slot_Camouflage;                                  // 0x4854(0x0020)
	struct FImage                                      CharItem_BG_AF;                                           // 0x4874(0x0020)
	struct FImage                                      CharItem_BG_RSA;                                          // 0x4894(0x0020)
	struct FImage                                      CharItem_Parts_Type_Deco;                                 // 0x48B4(0x0020)
	struct FImage                                      CharItem_Total_Type_Deco;                                 // 0x48D4(0x0020)
	struct FImage                                      Block_Weapon;                                             // 0x48F4(0x0020)
	struct FImage                                      Inven_QuiSlot_Btn_n[0x4];                                 // 0x4914(0x0020)
	struct FImage                                      Inven_QuiSlot_Btn_on[0x4];                                // 0x4994(0x0020)
	struct FImage                                      Inven_QuiSlot_Btn_cli[0x4];                               // 0x4A14(0x0020)
	struct FImage                                      Inven_QuiSlot_Btn_Disable[0x4];                           // 0x4A94(0x0020)
	struct FImage                                      Inven_QuiSlot_Btn_Focus[0x4];                             // 0x4B14(0x0020)
	struct FImage                                      Inven_tab_small_n;                                        // 0x4B94(0x0020)
	struct FImage                                      Inven_tab_small_on;                                       // 0x4BB4(0x0020)
	struct FImage                                      Inven_tab_small_cli;                                      // 0x4BD4(0x0020)
	struct FImage                                      Inven_tab_small_Disable;                                  // 0x4BF4(0x0020)
	struct FImage                                      Inven_tab_small_Focus;                                    // 0x4C14(0x0020)
	struct FImage                                      Inven_tab_Mid_n;                                          // 0x4C34(0x0020)
	struct FImage                                      Inven_tab_Mid_on;                                         // 0x4C54(0x0020)
	struct FImage                                      Inven_tab_Mid_cli;                                        // 0x4C74(0x0020)
	struct FImage                                      Inven_tab_Mid_Disable;                                    // 0x4C94(0x0020)
	struct FImage                                      Inven_tab_Mid_Focus;                                      // 0x4CB4(0x0020)
	struct FImage                                      Inven_tab_Big_n;                                          // 0x4CD4(0x0020)
	struct FImage                                      Inven_tab_Big_on;                                         // 0x4CF4(0x0020)
	struct FImage                                      Inven_tab_Big_cli;                                        // 0x4D14(0x0020)
	struct FImage                                      Inven_tab_Big_Disable;                                    // 0x4D34(0x0020)
	struct FImage                                      Inven_tab_Big_Focus;                                      // 0x4D54(0x0020)
	struct FImage                                      Inven_Chattab_Big_n;                                      // 0x4D74(0x0020)
	struct FImage                                      Inven_Chattab_Big_on;                                     // 0x4D94(0x0020)
	struct FImage                                      Inven_Chattab_Big_cli;                                    // 0x4DB4(0x0020)
	struct FImage                                      Inven_Chattab_Big_Disable;                                // 0x4DD4(0x0020)
	struct FImage                                      Inven_Chattab_Big_Focus;                                  // 0x4DF4(0x0020)
	struct FImage                                      Inven_Msntab_n;                                           // 0x4E14(0x0020)
	struct FImage                                      Inven_Msntab_on;                                          // 0x4E34(0x0020)
	struct FImage                                      Inven_Msntab_cli;                                         // 0x4E54(0x0020)
	struct FImage                                      Inven_Msntab_Disable;                                     // 0x4E74(0x0020)
	struct FImage                                      Inven_Msntab_Focus;                                       // 0x4E94(0x0020)
	struct FImage                                      Item_List_BG;                                             // 0x4EB4(0x0020)
	struct FImage                                      Item_List_n;                                              // 0x4ED4(0x0020)
	struct FImage                                      Item_List_on;                                             // 0x4EF4(0x0020)
	struct FImage                                      Item_List_cli;                                            // 0x4F14(0x0020)
	struct FImage                                      Item_List_Sel;                                            // 0x4F34(0x0020)
	struct FImage                                      Item_List_quick_sel;                                      // 0x4F54(0x0020)
	struct FImage                                      Inven_gauge_bg;                                           // 0x4F74(0x0020)
	struct FImage                                      Inven_Total_fix_btn_n;                                    // 0x4F94(0x0020)
	struct FImage                                      Inven_Total_fix_btn_on;                                   // 0x4FB4(0x0020)
	struct FImage                                      Inven_Total_fix_btn_cli;                                  // 0x4FD4(0x0020)
	struct FImage                                      Inven_Total_fix_btn_Disable;                              // 0x4FF4(0x0020)
	struct FImage                                      Inven_Total_fix_btn_Focus;                                // 0x5014(0x0020)
	struct FImage                                      Equip_QS_WP_BG;                                           // 0x5034(0x0020)
	struct FImage                                      Inven_sub_btn_n;                                          // 0x5054(0x0020)
	struct FImage                                      Inven_sub_btn_on;                                         // 0x5074(0x0020)
	struct FImage                                      Inven_sub_btn_cli;                                        // 0x5094(0x0020)
	struct FImage                                      Inven_sub_btn_Disable;                                    // 0x50B4(0x0020)
	struct FImage                                      Inven_sub_btn_Focus;                                      // 0x50D4(0x0020)
	struct FImage                                      Inven_ItemList_GreenBtn_n;                                // 0x50F4(0x0020)
	struct FImage                                      Inven_ItemList_GreenBtn_on;                               // 0x5114(0x0020)
	struct FImage                                      Inven_ItemList_GreenBtn_cli;                              // 0x5134(0x0020)
	struct FImage                                      Inven_ItemList_GreenBtn_Disable;                          // 0x5154(0x0020)
	struct FImage                                      Inven_ItemList_GreenBtn_Focus;                            // 0x5174(0x0020)
	struct FImage                                      Inven_ItemList_YellowBtn_n;                               // 0x5194(0x0020)
	struct FImage                                      Inven_ItemList_YellowBtn_on;                              // 0x51B4(0x0020)
	struct FImage                                      Inven_ItemList_YellowBtn_cli;                             // 0x51D4(0x0020)
	struct FImage                                      Inven_ItemList_YellowBtn_Disable;                         // 0x51F4(0x0020)
	struct FImage                                      Inven_ItemList_YellowBtn_Focus;                           // 0x5214(0x0020)
	struct FImage                                      Inven_Skill_Lock;                                         // 0x5234(0x0020)
	struct FImage                                      new_img_cash;                                             // 0x5254(0x0020)
	struct FImage                                      new_img_point;                                            // 0x5274(0x0020)
	struct FImage                                      new_img_coupon;                                           // 0x5294(0x0020)
	struct FImage                                      char_rot_Left_n;                                          // 0x52B4(0x0020)
	struct FImage                                      char_rot_Left_on;                                         // 0x52D4(0x0020)
	struct FImage                                      char_rot_Left_cli;                                        // 0x52F4(0x0020)
	struct FImage                                      char_rot_Left_Dis;                                        // 0x5314(0x0020)
	struct FImage                                      char_rot_Left_focus;                                      // 0x5334(0x0020)
	struct FImage                                      char_rot_Right_n;                                         // 0x5354(0x0020)
	struct FImage                                      char_rot_Right_on;                                        // 0x5374(0x0020)
	struct FImage                                      char_rot_Right_cli;                                       // 0x5394(0x0020)
	struct FImage                                      char_rot_Right_Dis;                                       // 0x53B4(0x0020)
	struct FImage                                      char_rot_Right_focus;                                     // 0x53D4(0x0020)
	struct FImage                                      MainWeapon_List_Bg;                                       // 0x53F4(0x0020)
	struct FImage                                      MainWeapon_List_n;                                        // 0x5414(0x0020)
	struct FImage                                      MainWeapon_List_on;                                       // 0x5434(0x0020)
	struct FImage                                      MainWeapon_List_cli;                                      // 0x5454(0x0020)
	struct FImage                                      MainWeapon_List_Dis;                                      // 0x5474(0x0020)
	struct FImage                                      MainWeapon_List_focus;                                    // 0x5494(0x0020)
	struct FImage                                      sgau_weap_gauge_y;                                        // 0x54B4(0x0020)
	struct FImage                                      sgau_weap_incre_g;                                        // 0x54D4(0x0020)
	struct FImage                                      sgau_weap_decre_r;                                        // 0x54F4(0x0020)
	struct FImage                                      new_Page_Thema;                                           // 0x5514(0x0020)
	struct FImage                                      Store_bg;                                                 // 0x5534(0x0020)
	struct FImage                                      Charge_Cash_Btn_n;                                        // 0x5554(0x0020)
	struct FImage                                      Charge_Cash_Btn_on;                                       // 0x5574(0x0020)
	struct FImage                                      Charge_Cash_Btn_cli;                                      // 0x5594(0x0020)
	struct FImage                                      Charge_Cash_Btn_focus;                                    // 0x55B4(0x0020)
	struct FImage                                      Charge_Cash_Btn_Dis;                                      // 0x55D4(0x0020)
	struct FImage                                      Billing_Btn_n;                                            // 0x55F4(0x0020)
	struct FImage                                      Quest_Info_BG;                                            // 0x5614(0x0020)
	struct FImage                                      Quest_Info_Puzzle;                                        // 0x5634(0x0020)
	struct FImage                                      Quest_PuzzlePiece_0;                                      // 0x5654(0x0020)
	struct FImage                                      Quest_PuzzlePiece_1;                                      // 0x5674(0x0020)
	struct FImage                                      Quest_PuzzlePiece_2;                                      // 0x5694(0x0020)
	struct FImage                                      Quest_PuzzlePiece_3;                                      // 0x56B4(0x0020)
	struct FImage                                      Quest_PuzzlePiece_4;                                      // 0x56D4(0x0020)
	struct FImage                                      Quest_PuzzlePiece_5;                                      // 0x56F4(0x0020)
	struct FImage                                      Quest_PuzzlePiece_6;                                      // 0x5714(0x0020)
	struct FImage                                      Quest_PuzzlePiece_7;                                      // 0x5734(0x0020)
	struct FImage                                      Reward_PuzzlePiece_1;                                     // 0x5754(0x0020)
	struct FImage                                      Reward_PuzzlePiece_2;                                     // 0x5774(0x0020)
	struct FImage                                      Reward_PuzzlePiece_3;                                     // 0x5794(0x0020)
	struct FImage                                      Reward_PuzzlePiece_4;                                     // 0x57B4(0x0020)
	struct FImage                                      Reward_PuzzlePiece_5;                                     // 0x57D4(0x0020)
	struct FImage                                      Reward_PuzzlePiece_6;                                     // 0x57F4(0x0020)
	struct FImage                                      Reward_PuzzlePiece_7;                                     // 0x5814(0x0020)
	struct FImage                                      Reward_PuzzlePiece_8;                                     // 0x5834(0x0020)
	struct FImage                                      Quest_AttendBg;                                           // 0x5854(0x0020)
	struct FImage                                      Quest_SpecialBg;                                          // 0x5874(0x0020)
	struct FImage                                      Quest_SpecialThema;                                       // 0x5894(0x0020)
	struct FImage                                      Quest_SpecialMiniemblelm;                                 // 0x58B4(0x0020)
	struct FImage                                      ReceiveRewardBtn_n;                                       // 0x58D4(0x0020)
	struct FImage                                      ReceiveRewardBtn_on;                                      // 0x58F4(0x0020)
	struct FImage                                      ReceiveRewardBtn_ci;                                      // 0x5914(0x0020)
	struct FImage                                      ReceiveRewardBtn_focus;                                   // 0x5934(0x0020)
	struct FImage                                      ReceiveRewardBtn_Dis;                                     // 0x5954(0x0020)
	struct FImage                                      ItemInfoToolTipBg;                                        // 0x5974(0x0020)
	struct FImage                                      ItemImageOn;                                              // 0x5994(0x0020)
	struct FImage                                      ItemImageComp;                                            // 0x59B4(0x0020)
	struct FImage                                      Quest_PC_B_Mark;                                          // 0x59D4(0x0020)
	struct FImage                                      Quest_Day_Mark;                                           // 0x59F4(0x0020)
	struct FImage                                      Quest_Event_Mark;                                         // 0x5A14(0x0020)
	struct FImage                                      Quest_PC_Y_Mark;                                          // 0x5A34(0x0020)
	struct FImage                                      Quest_Basic_Tr_Mark;                                      // 0x5A54(0x0020)
	struct FImage                                      Queest_Event_Mark;                                        // 0x5A74(0x0020)
	struct FImage                                      Queest_Puzzle_Mark;                                       // 0x5A94(0x0020)
	struct FImage                                      Queest_Attend_Mark;                                       // 0x5AB4(0x0020)
	struct FImage                                      Queest_Result_BG;                                         // 0x5AD4(0x0020)
	struct FImage                                      Quest_List_n;                                             // 0x5AF4(0x0020)
	struct FImage                                      Quest_List_On;                                            // 0x5B14(0x0020)
	struct FImage                                      Quest_List_ci;                                            // 0x5B34(0x0020)
	struct FImage                                      Quest_List_focus;                                         // 0x5B54(0x0020)
	struct FImage                                      Quest_List_Dis;                                           // 0x5B74(0x0020)
	struct FImage                                      RoomLoby_BG_Deco;                                         // 0x5B94(0x0020)
	struct FImage                                      Store_Item_Prop_Mark_Own;                                 // 0x5BB4(0x0020)
	struct FImage                                      Store_Item_Prop_Mark_Best;                                // 0x5BD4(0x0020)
	struct FImage                                      Store_Item_Prop_Mark_New;                                 // 0x5BF4(0x0020)
	struct FImage                                      Store_Item_Prop_Mark_Cool;                                // 0x5C14(0x0020)
	struct FImage                                      Store_Item_Prop_Mark_LuckyBest;                           // 0x5C34(0x0020)
	struct FImage                                      Store_Item_Prop_Mark_Discount;                            // 0x5C54(0x0020)
	struct FImage                                      WaitRoom_List_n;                                          // 0x5C74(0x0020)
	struct FImage                                      WaitRoom_List_On;                                         // 0x5C94(0x0020)
	struct FImage                                      WaitRoom_List_cli;                                        // 0x5CB4(0x0020)
	struct FImage                                      WaitRoom_List_Me;                                         // 0x5CD4(0x0020)
	struct FImage                                      WaitRoom_List_Focus;                                      // 0x5CF4(0x0020)
	struct FImage                                      WaitRoom_Team_AF_n;                                       // 0x5D14(0x0020)
	struct FImage                                      WaitRoom_Team_AF_On;                                      // 0x5D34(0x0020)
	struct FImage                                      WaitRoom_Team_AF_Cli;                                     // 0x5D54(0x0020)
	struct FImage                                      WaitRoom_Team_RSA_n;                                      // 0x5D74(0x0020)
	struct FImage                                      WaitRoom_Team_RSA_On;                                     // 0x5D94(0x0020)
	struct FImage                                      WaitRoom_Team_RSA_Cli;                                    // 0x5DB4(0x0020)
	struct FImage                                      WaitRoom_StartGame_n;                                     // 0x5DD4(0x0020)
	struct FImage                                      WaitRoom_StartGame_on;                                    // 0x5DF4(0x0020)
	struct FImage                                      WaitRoom_StartGame_cli;                                   // 0x5E14(0x0020)
	struct FImage                                      WaitRoom_RoomInfo_n;                                      // 0x5E34(0x0020)
	struct FImage                                      WaitRoom_RoomInfo_on;                                     // 0x5E54(0x0020)
	struct FImage                                      WaitRoom_RoomInfo_cli;                                    // 0x5E74(0x0020)
	struct FImage                                      WaitRoom_RoomInof_SubBG;                                  // 0x5E94(0x0020)
	struct FImage                                      ImageList_On;                                             // 0x5EB4(0x0020)
	struct FImage                                      GameResult_Win_AF_BG;                                     // 0x5ED4(0x0020)
	struct FImage                                      GameResult_Lose_AF_BG;                                    // 0x5EF4(0x0020)
	struct FImage                                      GameResult_Win_RSA_BG;                                    // 0x5F14(0x0020)
	struct FImage                                      GameResult_Lose_RSA_BG;                                   // 0x5F34(0x0020)
	struct FImage                                      GameResult_Win_AF_Mark;                                   // 0x5F54(0x0020)
	struct FImage                                      GameResult_Win_RSA_Mark;                                  // 0x5F74(0x0020)
	struct FImage                                      GameResult_MyInfo_BG;                                     // 0x5F94(0x0020)
	struct FImage                                      GameResult_AlienMode_Mark;                                // 0x5FB4(0x0020)
	struct FImage                                      GameResult_AlienMode_List_BG;                             // 0x5FD4(0x0020)
	struct FImage                                      GameResult_Deco_BG;                                       // 0x5FF4(0x0020)
	struct FImage                                      GameResult_Top_BG;                                        // 0x6014(0x0020)
	struct FImage                                      GameResult_Private_BG;                                    // 0x6034(0x0020)
	struct FImage                                      GameResult_Private_Mark;                                  // 0x6054(0x0020)
	struct FImage                                      GameResult_Close_Btn_n;                                   // 0x6074(0x0020)
	struct FImage                                      GameResult_Close_Btn_On;                                  // 0x6094(0x0020)
	struct FImage                                      GameResult_Close_Btn_Cli;                                 // 0x60B4(0x0020)
	struct FImage                                      GameResult_Close_Btn_Dis;                                 // 0x60D4(0x0020)
	struct FImage                                      Option_Panel_BG;                                          // 0x60F4(0x0020)
	struct FImage                                      Option_Init_Btn_n;                                        // 0x6114(0x0020)
	struct FImage                                      Option_Init_Btn_on;                                       // 0x6134(0x0020)
	struct FImage                                      Option_Init_Btn_cli;                                      // 0x6154(0x0020)
	struct FImage                                      Option_Init_Btn_block;                                    // 0x6174(0x0020)
	struct FImage                                      MakeRoom_Win_BG;                                          // 0x6194(0x0020)
	struct FImage                                      MakeRoom_Input_Text_BG;                                   // 0x61B4(0x0020)
	struct FImage                                      scrol_new_up_n;                                           // 0x61D4(0x0020)
	struct FImage                                      scrol_new_up_on;                                          // 0x61F4(0x0020)
	struct FImage                                      scrol_new_up_cli;                                         // 0x6214(0x0020)
	struct FImage                                      scrol_new_up_dis;                                         // 0x6234(0x0020)
	struct FImage                                      scrol_new_dn_n;                                           // 0x6254(0x0020)
	struct FImage                                      scrol_new_dn_on;                                          // 0x6274(0x0020)
	struct FImage                                      scrol_new_dn_cli;                                         // 0x6294(0x0020)
	struct FImage                                      scrol_new_dn_dis;                                         // 0x62B4(0x0020)
	struct FImage                                      scrol_new_grip_n;                                         // 0x62D4(0x0020)
	struct FImage                                      scrol_new_grip_on;                                        // 0x62F4(0x0020)
	struct FImage                                      scrol_new_grip_cli;                                       // 0x6314(0x0020)
	struct FImage                                      scrol_new_grip_dis;                                       // 0x6334(0x0020)
	struct FImage                                      Scrol_New_BG;                                             // 0x6354(0x0020)
	struct FImage                                      slider_new_back;                                          // 0x6374(0x0020)
	struct FImage                                      slider_new_grip_n;                                        // 0x6394(0x0020)
	struct FImage                                      slider_new_grip_on;                                       // 0x63B4(0x0020)
	struct FImage                                      slider_new_grip_cli;                                      // 0x63D4(0x0020)
	struct FImage                                      slider_new_grip_dis;                                      // 0x63F4(0x0020)
	struct FImage                                      Button_Graphic_Opt_all_1_n;                               // 0x6414(0x0020)
	struct FImage                                      Button_Graphic_Opt_all_1_on;                              // 0x6434(0x0020)
	struct FImage                                      Button_Graphic_Opt_all_1_cli;                             // 0x6454(0x0020)
	struct FImage                                      Button_Graphic_Opt_all_1_dis;                             // 0x6474(0x0020)
	struct FImage                                      Button_Graphic_Opt_all_2_n;                               // 0x6494(0x0020)
	struct FImage                                      Button_Graphic_Opt_all_2_on;                              // 0x64B4(0x0020)
	struct FImage                                      Button_Graphic_Opt_all_2_cli;                             // 0x64D4(0x0020)
	struct FImage                                      Button_Graphic_Opt_all_2_dis;                             // 0x64F4(0x0020)
	struct FImage                                      Button_Graphic_Opt_all_3_n;                               // 0x6514(0x0020)
	struct FImage                                      Button_Graphic_Opt_all_3_on;                              // 0x6534(0x0020)
	struct FImage                                      Button_Graphic_Opt_all_3_cli;                             // 0x6554(0x0020)
	struct FImage                                      Button_Graphic_Opt_all_3_dis;                             // 0x6574(0x0020)
	struct FImage                                      Button_Control_Opt_all_n;                                 // 0x6594(0x0020)
	struct FImage                                      Button_Control_Opt_all_on;                                // 0x65B4(0x0020)
	struct FImage                                      Button_Control_Opt_all_cli;                               // 0x65D4(0x0020)
	struct FImage                                      Button_Control_Opt_all_dis;                               // 0x65F4(0x0020)
	struct FImage                                      List_New_Opt_backnlist;                                   // 0x6614(0x0020)
	struct FImage                                      List_New_Opt_n;                                           // 0x6634(0x0020)
	struct FImage                                      List_New_Opt_on;                                          // 0x6654(0x0020)
	struct FImage                                      List_New_Opt_cli;                                         // 0x6674(0x0020)
	struct FImage                                      List_New_Opt_dis;                                         // 0x6694(0x0020)
	struct FImage                                      Combo_New_Butt_n;                                         // 0x66B4(0x0020)
	struct FImage                                      Combo_New_Butt_on;                                        // 0x66D4(0x0020)
	struct FImage                                      Combo_New_Butt_cli;                                       // 0x66F4(0x0020)
	struct FImage                                      Combo_New_Butt_dis;                                       // 0x6714(0x0020)
	struct FImage                                      Combo_New_Expand;                                         // 0x6734(0x0020)
	struct FImage                                      Combo_New_Expand_on;                                      // 0x6754(0x0020)
	struct FImage                                      Combo_New_Back;                                           // 0x6774(0x0020)
	struct FImage                                      Combo_New_Back_Blur;                                      // 0x6794(0x0020)
	struct FImage                                      ItemPopup_Bgdeco;                                         // 0x67B4(0x0020)
	struct FImage                                      ItemPopup_ItemInfo_back;                                  // 0x67D4(0x0020)
	struct FImage                                      ItemRemodel_bgdeco;                                       // 0x67F4(0x0020)
	struct FImage                                      ItemRemodel_Btn_Rollback_n;                               // 0x6814(0x0020)
	struct FImage                                      ItemRemodel_Btn_Rollback_cli;                             // 0x6834(0x0020)
	struct FImage                                      ItemRemodel_Btn_Rollback_on;                              // 0x6854(0x0020)
	struct FImage                                      ItemRemodel_Btn_Rollback_dis;                             // 0x6874(0x0020)
	struct FImage                                      ItemRemodel_List_BG_n;                                    // 0x6894(0x0020)
	struct FImage                                      ItemRemodel_List_BG_on;                                   // 0x68B4(0x0020)
	struct FImage                                      ItemRemodel_List_BG_cli;                                  // 0x68D4(0x0020)
	struct FImage                                      ItemRemodel_List_BG_Focus;                                // 0x68F4(0x0020)
	struct FImage                                      ItemRemodel_Buy_bgdeco;                                   // 0x6914(0x0020)
	struct FImage                                      QuickEnterRoom_Win_BG;                                    // 0x6934(0x0020)
	struct FImage                                      Icon_ServeMode[0x7];                                      // 0x6954(0x0020)
	struct FImage                                      img_Tilte;                                                // 0x6A34(0x0020)
	struct FImage                                      All_Map_Img;                                              // 0x6A54(0x0020)
	struct FImage                                      newMap_Icon;                                              // 0x6A74(0x0020)
	struct FImage                                      BillingPopup_Deco_Img;                                    // 0x6A94(0x0020)
	struct FImage                                      Expired_Deco_Img;                                         // 0x6AB4(0x0020)
	struct FImage                                      Coupon_Bg_Img;                                            // 0x6AD4(0x0020)
	struct FImage                                      Coupon_oversquare_Img;                                    // 0x6AF4(0x0020)
	struct FImage                                      GameResult_Defence_BG;                                    // 0x6B14(0x0020)
	struct FImage                                      GameResult_Defence_Mark;                                  // 0x6B34(0x0020)
	struct FImage                                      WaitRoom_Defence_Team;                                    // 0x6B54(0x0020)
	struct FImage                                      WaitRoom_Defence_Reward;                                  // 0x6B74(0x0020)
	struct FImage                                      Popup_Defence_Reward;                                     // 0x6B94(0x0020)
	struct FImage                                      WaitRoom_Defence_MinishopBG;                              // 0x6BB4(0x0020)
	struct FImage                                      ItemRewardBG;                                             // 0x6BD4(0x0020)
	struct FImage                                      Defence_Buy_Btn_n;                                        // 0x6BF4(0x0020)
	struct FImage                                      Defence_Buy_Btn_on;                                       // 0x6C14(0x0020)
	struct FImage                                      Defence_Buy_Btn_cli;                                      // 0x6C34(0x0020)
	struct FImage                                      Defence_Buy_Btn_focus;                                    // 0x6C54(0x0020)
	struct FImage                                      Defence_Buy_Btn_Dis;                                      // 0x6C74(0x0020)
	struct FImage                                      SkillTypeRibbon[0x4];                                     // 0x6C94(0x0020)
	struct FImage                                      LuckyShopBG_Img;                                          // 0x6D14(0x0020)
	struct FImage                                      LuckyShop_CapsuleStoreBG_Img;                             // 0x6D34(0x0020)
	struct FImage                                      LuckyShop_CapsuleInventoryBG_Img;                         // 0x6D54(0x0020)
	struct FImage                                      LuckyShop_BlackBoxBG_Img;                                 // 0x6D74(0x0020)
	struct FImage                                      CapsuleList_n;                                            // 0x6D94(0x0020)
	struct FImage                                      CapsuleList_on;                                           // 0x6DB4(0x0020)
	struct FImage                                      CapsuleList_click;                                        // 0x6DD4(0x0020)
	struct FImage                                      CapsuleList_diable;                                       // 0x6DF4(0x0020)
	struct FImage                                      CapsuleList_new;                                          // 0x6E14(0x0020)
	struct FImage                                      CapsuleList_Discount;                                     // 0x6E34(0x0020)
	struct FImage                                      LuckyShop_PageLeft_n;                                     // 0x6E54(0x0020)
	struct FImage                                      LuckyShop_PageLeft_on;                                    // 0x6E74(0x0020)
	struct FImage                                      LuckyShop_PageLeft_click;                                 // 0x6E94(0x0020)
	struct FImage                                      LuckyShop_PageLeft_diable;                                // 0x6EB4(0x0020)
	struct FImage                                      LuckyShop_PageRight_n;                                    // 0x6ED4(0x0020)
	struct FImage                                      LuckyShop_PageRight_on;                                   // 0x6EF4(0x0020)
	struct FImage                                      LuckyShop_PageRight_click;                                // 0x6F14(0x0020)
	struct FImage                                      LuckyShop_PageRight_diable;                               // 0x6F34(0x0020)
	struct FImage                                      LuckyShop_PageLeft_Big_n;                                 // 0x6F54(0x0020)
	struct FImage                                      LuckyShop_PageLeft_Big_on;                                // 0x6F74(0x0020)
	struct FImage                                      LuckyShop_PageLeft_Big_click;                             // 0x6F94(0x0020)
	struct FImage                                      LuckyShop_PageLeft_Big_diable;                            // 0x6FB4(0x0020)
	struct FImage                                      LuckyShop_PageRight_Big_n;                                // 0x6FD4(0x0020)
	struct FImage                                      LuckyShop_PageRight_Big_on;                               // 0x6FF4(0x0020)
	struct FImage                                      LuckyShop_PageRight_Big_click;                            // 0x7014(0x0020)
	struct FImage                                      LuckyShop_PageRight_Big_diable;                           // 0x7034(0x0020)
	struct FImage                                      LuckyShop_ItemInfoGauge_Back;                             // 0x7054(0x0020)
	struct FImage                                      LuckyShop_LeftArrow_n;                                    // 0x7074(0x0020)
	struct FImage                                      LuckyShop_LeftArrow_on;                                   // 0x7094(0x0020)
	struct FImage                                      LuckyShop_LeftArrow_click;                                // 0x70B4(0x0020)
	struct FImage                                      LuckyShop_LeftArrow_diable;                               // 0x70D4(0x0020)
	struct FImage                                      LuckyShop_RightArrow_n;                                   // 0x70F4(0x0020)
	struct FImage                                      LuckyShop_RightArrow_on;                                  // 0x7114(0x0020)
	struct FImage                                      LuckyShop_RightArrow_click;                               // 0x7134(0x0020)
	struct FImage                                      LuckyShop_RightArrow_diable;                              // 0x7154(0x0020)
	struct FImage                                      Img_BlackBoxKey;                                          // 0x7174(0x0020)
	struct FImage                                      Img_Item_RW_buycount;                                     // 0x7194(0x0020)
	struct FImage                                      Img_Item_RW_coupon;                                       // 0x71B4(0x0020)
	struct FImage                                      Img_RW_AlreadyGet;                                        // 0x71D4(0x0020)
	struct FImage                                      Img_Quest_Slot_Reward_MouseOver;                          // 0x71F4(0x0020)
	struct FImage                                      Img_BGDeco_Popup_MouseOver;                               // 0x7214(0x0020)
	struct FImage                                      Img_BGDeco_Capsule_Open;                                  // 0x7234(0x0020)
	struct FImage                                      Img_BGDeco_Capsule_Get;                                   // 0x7254(0x0020)
	struct FImage                                      Img_BGDeco_Capsule_Get_RemainBG;                          // 0x7274(0x0020)
	struct FImage                                      Img_BGDeco_Capsule_Reward;                                // 0x7294(0x0020)
	struct FImage                                      Img_BGDeco_Effect_BestItemGet;                            // 0x72B4(0x0020)
	struct FImage                                      ModifyBtn_n;                                              // 0x72D4(0x0020)
	struct FImage                                      ModifyBtn_on;                                             // 0x72F4(0x0020)
	struct FImage                                      ModifyBtn_cli;                                            // 0x7314(0x0020)
	struct FImage                                      ModifyBtn_Disable;                                        // 0x7334(0x0020)
	struct FImage                                      ModifyBtn_Focus;                                          // 0x7354(0x0020)
	struct FImage                                      Img_DisCountLine;                                         // 0x7374(0x0020)
	struct FImage                                      Img_BGDeco_MyInfoPopup;                                   // 0x7394(0x0020)
	struct FImage                                      gau_myinfopopup_exp_back;                                 // 0x73B4(0x0020)
	struct FImage                                      gau_myinfopopup_exp_gauge;                                // 0x73D4(0x0020)
	struct FImage                                      Img_QuickSlot_Open;                                       // 0x73F4(0x0020)
	struct FImage                                      Img_QuickSlot_DayCount;                                   // 0x7414(0x0020)
	struct FImage                                      Img_Locked_QuickSlot;                                     // 0x7434(0x0020)
	struct FImage                                      Img_Skill_Locked_Effect;                                  // 0x7454(0x0020)
	struct FImage                                      SkillSlot_Btn_n;                                          // 0x7474(0x0020)
	struct FImage                                      SkillSlot_Btn_on;                                         // 0x7494(0x0020)
	struct FImage                                      SkillSlot_Btn_click;                                      // 0x74B4(0x0020)
	struct FImage                                      SkillSlot_Btn_Dis;                                        // 0x74D4(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTUIResourcePoolHK");
		return ptr;
	}


	int STATIC_BounsIDToBounsIconIndex(int i);
};


// Class GUIWarfareControls.BTWindowSelectHK
// 0x0018 (0x04D8 - 0x04C0)
class UBTWindowSelectHK : public UBTWindowHK
{
public:
	bool                                               bChangeText;                                              // 0x04C0(0x0004)
	struct FFloatBox                                   fbLabelInfo;                                              // 0x04C4(0x0010)
	class UBTOwnerDrawImageHK*                         LabelInfo;                                                // 0x04D4(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowSelectHK");
		return ptr;
	}


	bool Internal_OnKeyEvent(float Delta, byte* key, byte* Action);
	bool Internal_OnPreDraw(class UCanvas* C);
	void STATIC_ShowWindow(class UGUIController* con, const string& Title, const string& Msg, const string& btnOk, const string& btnCancel);
	void SetData(const string& Title, int titlepadding, const string& Msg, const string& btnOk, const string& btnCancel);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowDefineSelectHK
// 0x04BC (0x0994 - 0x04D8)
class UBTWindowDefineSelectHK : public UBTWindowSelectHK
{
public:
	string                                             strClientDefaultTitle;                                    // 0x04D8(0x000C) (Localized, NeedCtorLink)
	string                                             strClientTitle[0x32];                                     // 0x04E4(0x000C) (Localized, NeedCtorLink)
	string                                             strClientDefine[0x32];                                    // 0x073C(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowDefineSelectHK");
		return ptr;
	}


	bool STATIC_ShowInfo(class UGUIController* con, int Code, const string& arg0, const string& arg1, const string& arg2);
};


// Class GUIWarfareControls.BTChatEditBoxHK
// 0x0000 (0x0490 - 0x0490)
class UBTChatEditBoxHK : public UBTEditBoxHK
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTChatEditBoxHK");
		return ptr;
	}


	bool CheckPastedTextCondition(const string& Text);
	bool CheckKeyInputCondition(const string& st);
};


// Class GUIWarfareControls.PageOnWindowManager
// 0x0080 (0x00AC - 0x002C)
class UPageOnWindowManager : public UObject
{
public:
	bool                                               bProcess;                                                 // 0x002C(0x0004)
	class UGUIController*                              Controller;                                               // 0x0030(0x0004)
	class UPageOnWindow*                               Pow[0x1E];                                                // 0x0034(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.PageOnWindowManager");
		return ptr;
	}


	class UBTWindowHK* Pop(EPage destpage);
	class UBTWindowHK* back(EPage destpage);
	class UBTWindowHK* Last(EPage destpage);
	bool RemoveWindowOnStack(EPage destpage, const FName& WindowName, bool bAll);
	class UBTWindowHK* FindWindowOnStack(EPage destpage, const FName& WindowName);
	int ListLen(EPage destpage);
	void Push(EPage destpage, class UBTWindowHK* N, bool bUseInsert, int insertPos, bool bUseInsertAtName, const FName& nobject);
	class UBTWindowHK* CreateAndPush(EPage destpage, const string& WindowName, bool bUseInsert, int insertPos, bool bUseInsertAtName, const FName& nobject);
	void CloseAndClear();
	void Init(class UGUIController* C);
	void StopProcess();
	void StartProcess();
	bool IsAvailable();
};


// Class GUIWarfareControls.BTOwnerDrawCaptionButtonHK
// 0x01DC (0x04D0 - 0x02F4)
class UBTOwnerDrawCaptionButtonHK : public UGUIButton
{
public:
	float                                              TimeOut;                                                  // 0x02F4(0x0004)
	bool                                               bSetTimeOut;                                              // 0x02F8(0x0004)
	int                                                CanvasStyle;                                              // 0x02FC(0x0004)
	float                                              CurrentTimeSecond;                                        // 0x0300(0x0004)
	float                                              LastTimeSecond;                                           // 0x0304(0x0004)
	int                                                CaptionTopPadding[0x6];                                   // 0x0308(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	bool                                               bActiveCursor;                                            // 0x0320(0x0004)
	bool                                               bSelect;                                                  // 0x0320(0x0004)
	bool                                               bSelectHighlight;                                         // 0x0320(0x0004)
	bool                                               bDisable;                                                 // 0x0320(0x0004)
	int                                                ButtonID;                                                 // 0x0324(0x0004)
	int                                                Extra;                                                    // 0x0328(0x0004)
	int                                                FontSize[0x6];                                            // 0x032C(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FColor                                      FontColor[0x6];                                           // 0x0344(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FColor                                      FontShadowColor[0x6];                                     // 0x035C(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                CaptionPadding[0x4];                                      // 0x0374(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	EDrawType                                          CaptionDrawType;                                          // 0x0384(0x0001) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	byte                                               Padding00[0x3];                                           // 0x0385(0x0003) MISSED OFFSET
	string                                             Caption;                                                  // 0x0388(0x000C) (NeedCtorLink)
	struct FImage                                      buttonImage[0x6];                                         // 0x0394(0x0020)
	struct FImage                                      BackgroundImage;                                          // 0x0454(0x0020)
	struct FImage                                      BlingImgBig;                                              // 0x0474(0x0020)
	class UBTRODecorateStringHK*                       btToolTip;                                                // 0x0494(0x0004)
	string                                             strToolTip;                                               // 0x0498(0x000C) (NeedCtorLink)
	bool                                               isShowToolTip;                                            // 0x04A4(0x0004)
	float                                              CursorUSize;                                              // 0x04A8(0x0004)
	float                                              CursorVSize;                                              // 0x04AC(0x0004)
	bool                                               isFlicker;                                                // 0x04B0(0x0004)
	struct FBtrDouble                                  dbUniqID;                                                 // 0x04B4(0x0008)
	bool                                               CaptionScroll;                                            // 0x04BC(0x0004)
	class UBTScrollString*                             scrollString;                                             // 0x04C0(0x0004)
	bool                                               bRenderFlickerNotify;                                     // 0x04C4(0x0004)
	struct FScriptDelegate                             __OnTimeOut__Delegate;                                    // 0x04C8(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTOwnerDrawCaptionButtonHK");
		return ptr;
	}


	void InternalDeactivate();
	void InternalActivate();
	void OnRendered(class UCanvas* C);
	void DrawToolTip(class UCanvas* C);
	struct FFloatBox GetTooltipPos(int tooltipWidth, int tooltipHeight, int nOffsetX, int nOffsetY);
	void SetFontDrawType(EDrawType dt);
	void SetFontSizeAll(int Size);
	void SetFontShadowColorAll(const struct FColor& Col);
	void SetAlphaValue(float A);
	void SetFontColorAll(const struct FColor& Col);
	void SetDefaultNonSelectFontColor();
	void SetDefaultListFontColor();
	void SetDefaultListTopButtonFontColor();
	void SetDefaultMTabButtonFontColor();
	void SetPaidItemTabButtonFontColor();
	void SetDefaultTabButtonFontColor();
	void SetDefaultRadioButtonFontColor();
	void SetDefaultPageListButtonColor();
	void SetDefaultBigButtonFontColor();
	void SetDefaultFontColor();
	void LeftPaddingPerc(float perc);
	void SetSkillBuyButtonImage();
	void SetLuckyShopRightArrowButtonImage();
	void SetLuckyShopLeftArrowButtonImage();
	void SetPageRightBigButtonImage();
	void SetPageLeftBigButtonImage();
	void SetPageRightButtonImage();
	void SetPageLeftButtonImage();
	void SetDefaultPaintingButtonImage();
	void SetDefaultListButtonImage();
	void SetDefaultOptionInitButtonImage();
	void SetDefaultRArrowButtonImage();
	void SetDefaultLArrowButtonImage();
	void SetDefaultRRotateRSAButtonImage();
	void SetDefaultLRotateAFButtonImage();
	void SetDefaultRRotateButtonImage();
	void SetDefaultLRotateButtonImage();
	void SetDefaultBigTabButtonImage();
	void SetPaidItemTabButtonImage();
	void SetDefaultTabButtonImageNotDis();
	void SetDefaultTabButtonImage();
	void SetDefaultSliderGripButtonImage();
	void SetNewSliderGripButtonImage();
	void SetDefaultMButtonImage();
	void SetDefaultBigButtonImage();
	void SetTabButtonFontColor();
	void SetModifybButtonImage();
	void SetSmallTabButtonImage();
	void SetMidTabButtonImage();
	void SetMsgTabButtonImage();
	void SetChatTabButtonImage();
	void SetBigTabButtonImage();
	void SetGameStartBtnImage();
	void SetDefaultQuickSlotButtonImage();
	void SetControlKeyBtnImage();
	void SetGraphicAdvanceBtnImage();
	void SetGraphicUpDownBtnImage();
	void SetQuestReceiveRewardImage();
	void SetWaitRoomInfoBtnImage();
	void SetDefaultButtonImage();
	void SetDefaultCheckBoxImage();
	void SetDefaultRadioImage();
	void StopTimeOut(float SetTime);
	void StartTimeOut(float SetTime);
	void OnTimeOut(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTOwnerDrawImageHK
// 0x00C0 (0x03BC - 0x02FC)
class UBTOwnerDrawImageHK : public UFloatingImage
{
public:
	int                                                CanvasStyle;                                              // 0x02FC(0x0004)
	int                                                LabelID;                                                  // 0x0300(0x0004)
	float                                              CurrentTimeSecond;                                        // 0x0304(0x0004)
	float                                              LastTimeSecond;                                           // 0x0308(0x0004)
	bool                                               bUseFontScaleValue;                                       // 0x030C(0x0004)
	float                                              FontScaleValue;                                           // 0x0310(0x0004)
	int                                                FontStyle[0x5];                                           // 0x0314(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                FontSize[0x5];                                            // 0x0328(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FColor                                      FontColor[0x5];                                           // 0x033C(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FColor                                      FontShadowColor[0x5];                                     // 0x0350(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                CaptionPadding[0x4];                                      // 0x0364(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	EDrawType                                          CaptionDrawType;                                          // 0x0374(0x0001) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	byte                                               Padding00[0x3];                                           // 0x0375(0x0003) MISSED OFFSET
	string                                             Caption;                                                  // 0x0378(0x000C) (NeedCtorLink)
	struct FImage                                      BackgroundImage;                                          // 0x0384(0x0020)
	bool                                               bDrawToolTips;                                            // 0x03A4(0x0004) (Edit)
	class UBTRODecorateStringHK*                       decoToolTips;                                             // 0x03A8(0x0004) (Edit)
	struct FBtrDouble                                  UniqueID;                                                 // 0x03AC(0x0008)
	int                                                UniqueSkillID;                                            // 0x03B4(0x0004)
	bool                                               bCullingText;                                             // 0x03B8(0x0004)
	bool                                               cullRight;                                                // 0x03B8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTOwnerDrawImageHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void SetFontDrawType(EDrawType dt);
	void SetFontShadowColorAll(const struct FColor& Col);
	void SetFontAndImageColorAll(const struct FColor& Col);
	void SetFontColorAll(const struct FColor& Col);
	void SetFontSizeAll(int Size);
	void SetDefaultFontColor();
	void SetToolTipsText(const string& t);
};


// Class GUIWarfareControls.BTMultiLineEditBoxHK
// 0x0118 (0x0480 - 0x0368)
class UBTMultiLineEditBoxHK : public UGUIEditBox
{
public:
	bool                                               bActiveCursor;                                            // 0x0368(0x0004)
	class UCanvas*                                     saveC;                                                    // 0x036C(0x0004)
	struct FColor                                      CursorColor;                                              // 0x0370(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FColor                                      SelectionColor;                                           // 0x0374(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FImage                                      bgImg;                                                    // 0x0378(0x0020)
	struct FImage                                      cursorImg;                                                // 0x0398(0x0020)
	struct FImage                                      selectionImg;                                             // 0x03B8(0x0020)
	int                                                FontSize[0x5];                                            // 0x03D8(0x0004)
	struct FColor                                      FontColor[0x5];                                           // 0x03EC(0x0004)
	struct FColor                                      FontShadowColor[0x5];                                     // 0x0400(0x0004)
	int                                                CaretLinePos;                                             // 0x0414(0x0004)
	int[]                                              sumLineTextCount;                                         // 0x0418(0x000C) (NeedCtorLink)
	int[]                                              sumLineW;                                                 // 0x0424(0x000C) (NeedCtorLink)
	int[]                                              sumLineHT;                                                // 0x0430(0x000C) (NeedCtorLink)
	string[]                                           textStrVis;                                               // 0x043C(0x000C) (NeedCtorLink)
	int[]                                              bEndofNewLineCharacter;                                   // 0x0448(0x000C) (NeedCtorLink)
	bool                                               bUndo;                                                    // 0x0454(0x0004)
	int                                                UndoCaretPos;                                             // 0x0458(0x0004)
	string                                             UndoTextStr;                                              // 0x045C(0x000C) (NeedCtorLink)
	int                                                VisibleLineCount;                                         // 0x0468(0x0004)
	bool                                               bSelectionMode;                                           // 0x046C(0x0004)
	bool                                               bMouseFirstPress;                                         // 0x046C(0x0004)
	bool                                               bMousePressed;                                            // 0x046C(0x0004)
	struct UBTMultiLineEditBoxHK_FSelectionArea        SelArea;                                                  // 0x0470(0x0008)
	struct FScriptDelegate                             __OnChat__Delegate;                                       // 0x0478(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTMultiLineEditBoxHK");
		return ptr;
	}


	void InternalDeactivate();
	void InternalActivate();
	bool InternalOnKeyEvent(float Delta, byte* key, byte* State);
	bool CheckKeyInputCondition(const string& st);
	bool InternalOnKeyType(const string& Unicode, byte* key);
	string ConvertIllegal(const string& inputstr);
	int CaretBinarySearch(int vlc, int lCursor, int rCursor, float mx);
	int MousePosToCaretPos(float mx, float my);
	void UpdateLineInfo();
	void OnMousePressed(class UGUIComponent* Sender, bool bRepeat);
	void OnMouseRelease(class UGUIComponent* Sender);
	void OnChange(class UGUIComponent* Sender);
	void CaculateVisibleText();
	void DrawIMEInfo(class UCanvas* C, float CursorWidth);
	bool OwnerDraw(class UCanvas* C);
	int CaretPosToLinePos(int pos);
	void Clear();
	void SetVisibleLineCount(int lc);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetText(const string& Text);
	void InputSelectionPos(int pos);
	void ResetSelectionPos(int pos);
	string GetSelectionText();
	void RemoveSelectionText();
	void ProcessUndo(bool bForceBack);
	void SaveUndo();
	void OnChat(const string& Text);
	void SetFontSizeAll(int Size);
	void SetSadowColor(byte _R, byte _G, byte _B, byte _A);
	void SetFontColor(byte _R, byte _G, byte _B, byte _A);
	void SetDefaultFontColor();
};


// Class GUIWarfareControls.PageOnWindow
// 0x0010 (0x003C - 0x002C)
class UPageOnWindow : public UObject
{
public:
	class UBTWindowHK*                                 Last;                                                     // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTWindowHK*[]                               WindowList;                                               // 0x0030(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.PageOnWindow");
		return ptr;
	}

};


// Class GUIWarfareControls.BTWindowErrorDefineHK
// 0x3858 (0x3D30 - 0x04D8)
class UBTWindowErrorDefineHK : public UBTWindowInfoHK
{
public:
	string                                             strErrorTitle[0x2];                                       // 0x04D8(0x000C) (Localized, NeedCtorLink)
	string                                             strErrorDefine[0x4B0];                                    // 0x04F0(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowErrorDefineHK");
		return ptr;
	}


	void STATIC_ShowErrorMsg(class UGUIController* con, const string& ErrorMsg, byte titleID);
	void STATIC_ShowError(class UGUIController* con, int ErrorCode, byte titleID);
	string STATIC_GetFormatString(int Code, const string& arg0, const string& arg1, const string& arg2);
	bool STATIC_ExceptionCondtion(int ErrorCode);
	void SetContentText_Instance(int Title, int Code, const string& arg0, const string& arg1, const string& arg2, const string& arg3);
};


// Class GUIWarfareControls.BTWindowWebBrowser
// 0x000C (0x04CC - 0x04C0)
class UBTWindowWebBrowser : public UBTWindowHK
{
public:
	string                                             strClose;                                                 // 0x04C0(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowWebBrowser");
		return ptr;
	}


	bool AllowOpen(const string& MenuClass);
	void OpenWeb(const string& openURL, int Left, int Top, int Right, int Bottom);
	void STATIC_OpenWebWindow(class UGUIController* Controller, const string& openURL, int Left, int Top, int Right, int Bottom, const string& Title);
	bool ButtonOK_OnClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTabPanelHK
// 0x0010 (0x0340 - 0x0330)
class UBTTabPanelHK : public UGUITabPanel
{
public:
	int                                                TabID;                                                    // 0x0330(0x0004)
	bool                                               bSelect;                                                  // 0x0334(0x0004)
	class UwGameManager*                               GameMgr;                                                  // 0x0338(0x0004)
	class UwMatchMaker*                                MM;                                                       // 0x033C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTabPanelHK");
		return ptr;
	}


	bool CheckIn(const struct FFloatBox& fb, int X, int Y);
	class UBTOwnerDrawImageScroll* NewScrollLabelComponent(const struct FFloatBox& fbNewCompo, const struct FImage& bgImg, float RenderWeight);
	class UBTOwnerDrawCaptionButtonHK* NewButtonComponent(const struct FFloatBox& fbNewCompo, float RenderWeight);
	class UBTOwnerDrawImageHK* NewLabelComponent(const struct FFloatBox& fbNewCompo, const struct FImage& bgImg, float RenderWeight);
	void TabGroups_OnSelect();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPChatHK
// 0x00F8 (0x0438 - 0x0340)
class UBTTPChatHK : public UBTTabPanelHK
{
public:
	class UCanvas*                                     saveC;                                                    // 0x0340(0x0004)
	float                                              StartAniTime;                                             // 0x0344(0x0004)
	float                                              StartAniTimeOffset;                                       // 0x0348(0x0004)
	float                                              SlideAniTime;                                             // 0x034C(0x0004)
	bool                                               bShowChatState;                                           // 0x0350(0x0004)
	bool                                               bShowAni;                                                 // 0x0350(0x0004)
	struct FFloatBox[]                                 fbButtonChatStateArray;                                   // 0x0354(0x000C) (NeedCtorLink)
	struct FFloatBox[]                                 fbSnapShotButtonChatStateArray;                           // 0x0360(0x000C) (NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*[]               ButtonChatStateArray;                                     // 0x036C(0x000C) (NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonChatState;                                          // 0x0378(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         BackgroundImage[0x2];                                     // 0x037C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UTabControlMocker*                           TabControl;                                               // 0x0384(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*[]               ButtonChat;                                               // 0x0388(0x000C) (NeedCtorLink)
	class UBTAutoScrollListHK*[]                       ASLChat;                                                  // 0x0394(0x000C) (NeedCtorLink)
	class UBTChatEditBoxHK*                            InputBox;                                                 // 0x03A0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strChatState[0x7];                                        // 0x03A4(0x000C) (Localized, NeedCtorLink)
	string                                             strAll;                                                   // 0x03F8(0x000C) (Localized, NeedCtorLink)
	string                                             strWhisper;                                               // 0x0404(0x000C) (Localized, NeedCtorLink)
	string                                             strClan;                                                  // 0x0410(0x000C) (Localized, NeedCtorLink)
	struct FColoredChatText[]                          ccText;                                                   // 0x041C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __ChangeTab_OnClick__Delegate;                            // 0x0428(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnChageChatMode__Delegate;                              // 0x0430(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPChatHK");
		return ptr;
	}


	void Internal_DeActivate();
	bool Internal_OnPostDraw(class UCanvas* C);
	bool Internal_OnPreDraw(class UCanvas* C);
	struct FFloatBox FloatBoxMultiply(float B, struct FFloatBox* A);
	struct FFloatBox FloatBoxSubstract(struct FFloatBox* A, struct FFloatBox* B);
	struct FFloatBox FloatBoxAdd(struct FFloatBox* A, struct FFloatBox* B);
	void ClearAll();
	void SetChatState(int ChatState);
	bool ButtonChatState_OnClick(class UGUIComponent* Sender);
	bool ButtonChatStateArray_OnClick(class UGUIComponent* Sender);
	bool ButttonChat_OnClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetEditText(const string& Chat);
	void AddChatHistory(int Panel, const string& Chat, const struct FColor& tcolor);
	void AddChatHistoryNoColor(int Panel, const string& Chat);
	void OnChageChatMode(int ChatMode);
	void ChangeTab_OnClick(int TabIndex);
};


// Class GUIWarfareControls.BTWindowStateHK
// 0x0018 (0x04D8 - 0x04C0)
class UBTWindowStateHK : public UBTWindowHK
{
public:
	bool                                               bChangeText;                                              // 0x04C0(0x0004)
	struct FFloatBox                                   fbBackgroundImage2;                                       // 0x04C4(0x0010)
	class UBTOwnerDrawImageHK*                         LabelInfo;                                                // 0x04D4(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowStateHK");
		return ptr;
	}


	bool Internal_OnKeyEvent(float Delta, byte* key, byte* Action);
	bool Internal_OnPreDraw(class UCanvas* C);
	void STATIC_ShowWindow(class UGUIController* con, const string& Msg);
	void UpdateRoomLobbyWindow();
	void UpdateDefaultWindow();
	void SetData(const string& Msg);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowDefineStateHK
// 0x00B4 (0x058C - 0x04D8)
class UBTWindowDefineStateHK : public UBTWindowStateHK
{
public:
	string                                             strClientDefine[0xF];                                     // 0x04D8(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowDefineStateHK");
		return ptr;
	}


	bool STATIC_ShowState(class UGUIController* con, int Code, const string& arg0, const string& arg1, const string& arg2);
	string STATIC_GetFormatString(int Code, const string& arg0, const string& arg1, const string& arg2);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowAutoStateHK
// 0x00B4 (0x058C - 0x04D8)
class UBTWindowAutoStateHK : public UBTWindowStateHK
{
public:
	string                                             strClientDefine[0xF];                                     // 0x04D8(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowAutoStateHK");
		return ptr;
	}


	bool STATIC_ShowState(class UGUIController* con, int Code, const string& arg0, const string& arg1, const string& arg2);
	string STATIC_GetFormatString(int Code, const string& arg0, const string& arg1, const string& arg2);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPTopMenuHK
// 0x00EC (0x041C - 0x0330)
class UBTTPTopMenuHK : public UGUITabPanel
{
public:
	class UBTOwnerDrawImageHK*                         LabelNewMail;                                             // 0x0330(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 Quest;                                                    // 0x0334(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 PostBox;                                                  // 0x0338(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 Shop;                                                     // 0x033C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 Inventory;                                                // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 Clan;                                                     // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 Option;                                                   // 0x0348(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 GoBack;                                                   // 0x034C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 Exit;                                                     // 0x0350(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 Lucky;                                                    // 0x0354(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         TopBgDeco;                                                // 0x0358(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strShop;                                                  // 0x035C(0x000C) (Localized, NeedCtorLink)
	string                                             strInven;                                                 // 0x0368(0x000C) (Localized, NeedCtorLink)
	string                                             strLucky;                                                 // 0x0374(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonList[0x9];                                          // 0x0380(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strToolTip[0x9];                                          // 0x03A4(0x000C) (Localized, NeedCtorLink)
	class UBTRODecorateStringHK*                       btToolTip;                                                // 0x0410(0x0004)
	struct FScriptDelegate                             __HeaderButton_OnClick__Delegate;                         // 0x0414(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPTopMenuHK");
		return ptr;
	}


	void InitButton(int ButtonID, const string& buttonName, const struct FImage& buttonImage0, const struct FImage& buttonImage1, const struct FImage& buttonImage2, const struct FImage& buttonImage3, const struct FImage& buttonImage4, class UBTOwnerDrawCaptionButtonHK** targetButton);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void RenderTooltip(class UCanvas* Canvas);
	void SetNewMailArrived(bool bNewMail);
	bool TopMenuButton_OnClick(class UGUIComponent* Sender);
	bool HeaderButton_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfareControls.BTExpiredItem
// 0x0014 (0x0040 - 0x002C)
class UBTExpiredItem : public UObject
{
public:
	byte                                               DisplayOrder;                                             // 0x002C(0x0001)
	byte                                               SlotPos;                                                  // 0x002D(0x0001)
	byte                                               Padding00[0x2];                                           // 0x002E(0x0002) MISSED OFFSET
	int                                                ItemTID;                                                  // 0x0030(0x0004)
	struct FBtrDouble                                  ItemUID;                                                  // 0x0034(0x0008)
	int                                                SkillUID;                                                 // 0x003C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTExpiredItem");
		return ptr;
	}

};


// Class GUIWarfareControls.BTTPItemListHK
// 0x007C (0x03AC - 0x0330)
class UBTTPItemListHK : public UGUITabPanel
{
public:
	class UBTItemImageListHK*                          ItemList;                                                 // 0x0330(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemCommonInfoHK*                         MyData;                                                   // 0x0334(0x0004)
	bool                                               bAuctionList;                                             // 0x0338(0x0004)
	string                                             strRRMsg[0x8];                                            // 0x033C(0x000C) (Localized, NeedCtorLink)
	int                                                savedRRIndex;                                             // 0x039C(0x0004)
	class UBTRODecorateStringHK*                       decoAuctionToolTips;                                      // 0x03A0(0x0004)
	int                                                OutLineHorzBorder;                                        // 0x03A4(0x0004)
	int                                                OutLineVertBorder;                                        // 0x03A8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPItemListHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetOutlineBorder(int horz, int vert);
	void UpdateServerTime(const struct FBtrDouble& D);
};


// Class GUIWarfareControls.BTWindowUserDetailInfoHK
// 0x00F8 (0x05B8 - 0x04C0)
class UBTWindowUserDetailInfoHK : public UBTWindowHK
{
public:
	class UBTOwnerDrawCaptionButtonHK*                 ButtonAF;                                                 // 0x04C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRSA;                                                // 0x04C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bLRMousePressed;                                          // 0x04C8(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonLR;                                                 // 0x04CC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bRRMousePressed;                                          // 0x04D0(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRR;                                                 // 0x04D4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         EdgeLine;                                                 // 0x04D8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         AFTeamBG;                                                 // 0x04DC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         RSATeamBG;                                                // 0x04E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bVisibleAFModel;                                          // 0x04E4(0x0004)
	string                                             strAF;                                                    // 0x04E8(0x000C) (Localized, NeedCtorLink)
	string                                             strRSA;                                                   // 0x04F4(0x000C) (Localized, NeedCtorLink)
	class ABTROModelNew*                               CharacterModel;                                           // 0x0500(0x0004)
	class UBTModelHK*                                  UIModel;                                                  // 0x0504(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbModel;                                                  // 0x0508(0x0010)
	struct FFloatBox                                   fbModelAF;                                                // 0x0518(0x0010)
	struct FFloatBox                                   fbModelRSA;                                               // 0x0528(0x0010)
	struct FFloatBox                                   fbModelLeft;                                              // 0x0538(0x0010)
	struct FFloatBox                                   fbModelRight;                                             // 0x0548(0x0010)
	string                                             CharName;                                                 // 0x0558(0x000C) (NeedCtorLink)
	string                                             ClanName;                                                 // 0x0564(0x000C) (NeedCtorLink)
	class UBTTPUserDetailInfo*                         UserDetailInfo;                                           // 0x0570(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbUserInfoButton;                                         // 0x0574(0x0010)
	struct FFloatBox                                   fbClanInfoButton;                                         // 0x0584(0x0010)
	string                                             strUserInfoButton;                                        // 0x0594(0x000C) (Localized, NeedCtorLink)
	string                                             strClanInfoButton;                                        // 0x05A0(0x000C) (Localized, NeedCtorLink)
	class UTabControlMocker*                           TabControl;                                               // 0x05AC(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPUserDetailInfoNew*                      UserDetailInfoNew;                                        // 0x05B0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPUserClanInfo*                           UserClanInfo;                                             // 0x05B4(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowUserDetailInfoHK");
		return ptr;
	}


	void Internal_OnOpen();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool OnUnableChangedTab(int TabIndex);
	void InitializeRightPanel();
	void InitializeLeftPanel();
	void SetModelData(int MainWeaponID, int MainWeaponPartID, int HelmetID, int AcceID, int BackPackID, int PouChID, int Camouflage, int AFBodyID, int RSABodyID);
	void SetData(const string& CharName, const string& ClanName, int MainWeaponID, int MainWeaponPartID, int SubWeaponID, int SubWeaponPartID, int AFBodyID, int RSABodyID, const struct FCharInfo& stCharInfo);
	void SetRankingInfo(int Ranking, int Win, int Lose, int DisCon);
	void SetClanInfo(const string& ClanName, int ClanPattern, int ClanBG, int ClanBL, int ClanLevel);
	void SetMyInfo(const string& CharName, const string& ClanName, int Level, int CurExp, int startExp, int maxExp, int LevelMarkID);
	void SetSelfIntro(const string& Intro);
	void ChangeVisibleModel(bool bAF);
	bool Internal_OnPreDraw(class UCanvas* C);
	bool ButtonRSA_OnClick(class UGUIComponent* Sender);
	bool ButtonAF_OnClick(class UGUIComponent* Sender);
	void ButtonRR_OnRelease(class UGUIComponent* Sender);
	void ButtonRR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	void ButtonLR_OnRelease(class UGUIComponent* Sender);
	void ButtonLR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
};


// Class GUIWarfareControls.BTTPUserDetailInfoNew
// 0x0388 (0x06C8 - 0x0340)
class UBTTPUserDetailInfoNew : public UBTTabPanelHK
{
public:
	string                                             CharName;                                                 // 0x0340(0x000C) (NeedCtorLink)
	string                                             ClanName;                                                 // 0x034C(0x000C) (NeedCtorLink)
	string                                             strLabel[0xB];                                            // 0x0358(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0xB];                                             // 0x03DC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0xB];                                               // 0x048C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strEdit[0xB];                                             // 0x04B8(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbEdit[0xB];                                              // 0x053C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawTextArrayHK*                     Edit[0xB];                                                // 0x05EC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLevelEdgeImg;                                           // 0x0618(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLevelImg;                                               // 0x0628(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbCashImg;                                                // 0x0638(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbPointImg;                                               // 0x0648(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LevelEdgeImg;                                             // 0x0658(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LevelImg;                                                 // 0x065C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         CashImg;                                                  // 0x0660(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         PointImg;                                                 // 0x0664(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbEquipWeapon[0x2];                                       // 0x0668(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTItemBoxButtonHK*                          EquipWeapon[0x2];                                         // 0x0688(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbExpBar;                                                 // 0x0690(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTExpBarHK*                                 expbar;                                                   // 0x06A0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strNoRankState;                                           // 0x06A4(0x000C) (Localized, NeedCtorLink)
	string                                             strHour;                                                  // 0x06B0(0x000C) (Localized, NeedCtorLink)
	string                                             strDay;                                                   // 0x06BC(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPUserDetailInfoNew");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetUserData(const string& CharName, int Exp, int Level, int LevelMarkID, int PreMonthlyRanking, int MonthlyRanking, int Win, int Lose, int Kill, int Death, int Assist, int KillCountByAimShooting, int HeadShot2, int TotPlayTime, int DisCon, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID);
};


// Class GUIWarfareControls.BTTPUserClanInfo
// 0x039C (0x06DC - 0x0340)
class UBTTPUserClanInfo : public UBTTabPanelHK
{
public:
	string                                             UserClanName;                                             // 0x0340(0x000C) (NeedCtorLink)
	string                                             strPersonalInfo;                                          // 0x034C(0x000C) (Localized, NeedCtorLink)
	string                                             strClanCommonInfo;                                        // 0x0358(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabelPersonalInfo;                                      // 0x0364(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelClanCommonInfo;                                    // 0x0374(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         PersonalInfo;                                             // 0x0384(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         ClanCommonInfo;                                           // 0x0388(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabel[0xB];                                            // 0x038C(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0xB];                                             // 0x0410(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0xB];                                               // 0x04C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strEdit[0xB];                                             // 0x04EC(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbEdit[0xB];                                              // 0x0570(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawTextArrayHK*                     Edit[0xB];                                                // 0x0620(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelClanMark;                                          // 0x064C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTLabelClanMarkHK*                          LabelClanMark;                                            // 0x065C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbExpBar;                                                 // 0x0660(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTExpBarHK*                                 expbar;                                                   // 0x0670(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbSelfIntroduction;                                       // 0x0674(0x0010)
	class UBTAutoScrollListHK*                         SelfIntroduction;                                         // 0x0684(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strDefaultSelfIntro;                                      // 0x0688(0x000C) (Localized, NeedCtorLink)
	string                                             strNoRankState;                                           // 0x0694(0x000C) (Localized, NeedCtorLink)
	string                                             strClanGrade[0x5];                                        // 0x06A0(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPUserClanInfo");
		return ptr;
	}


	void SetClanData(const string& ClanName, int ClanLevel, int CM_Pattern, int CM_BG, int CM_BL, int ClanExp, byte ClanGrade, int ClanActivity, int MonthlyConnectingCount, int UserClanWin, int UserClanLose, int UserClanDraw, int ClanWin, int ClanLose, int ClanDraw, int PreClanTotalRankCur, int ClanTotalRankCur, int PreClanMonthlyRankCur, int ClanMonthlyRankCur, int PreClanMonthlyConnectingRank, int ClanMonthlyConnectingRank, const string& ClanIntro);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.TabControlMocker
// 0x003C (0x02F8 - 0x02BC)
class UTabControlMocker : public UGUIComponent
{
public:
	class UGUIButton*[]                                Buttons;                                                  // 0x02BC(0x000C) (NeedCtorLink)
	class UGUIPanel*[]                                 Panels;                                                   // 0x02C8(0x000C) (NeedCtorLink)
	class UGUIButton*                                  VisiblePanelsButton;                                      // 0x02D4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UGUIPanel*                                   VisiblePanel;                                             // 0x02D8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                CurrentTabIndex;                                          // 0x02DC(0x0004)
	struct FScriptDelegate                             __OnVisiblePanelChanged__Delegate;                        // 0x02E0(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __UnableChangedTab__Delegate;                             // 0x02E8(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnChangedTab__Delegate;                                 // 0x02F0(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.TabControlMocker");
		return ptr;
	}


	bool TabButton_OnClick(class UGUIComponent* Sender);
	void OnChangedTab(int CurrentIndex, int PrevIndex);
	bool UnableChangedTab(int TabIndex);
	int GetCurrentTabIndex();
	int GetVisiblePanelIndex();
	class UGUIPanel* GetVisiblePanel();
	void SetVisiblePanel(int Index, bool bChange);
	void Clear();
	void BindTabButtonAndPanel(class UGUIButton* TabButton, class UGUITabPanel* Panel);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void OnVisiblePanelChanged(int Index);
};


// Class GUIWarfareControls.BTWindowInviteClanHK
// 0x00CC (0x058C - 0x04C0)
class UBTWindowInviteClanHK : public UBTWindowHK
{
public:
	string                                             strLabel[0x4];                                            // 0x04C0(0x000C) (Localized, NeedCtorLink)
	string                                             strModeTitle[0x2];                                        // 0x04F0(0x000C) (Localized, NeedCtorLink)
	string                                             strModeContent[0x2];                                      // 0x0508(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0x4];                                             // 0x0520(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0x4];                                               // 0x0560(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       ClanInviteMsg;                                            // 0x0570(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             SaveData;                                                 // 0x0574(0x000C) (NeedCtorLink)
	string                                             SaveInviterName;                                          // 0x0580(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowInviteClanHK");
		return ptr;
	}


	void Internal_OnOpen();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetClanJoin(const string& ClanName, const string& Inviter);
	void SetClanInvite(const string& UserName);
};


// Class GUIWarfareControls.BTWindowCreateClanHK
// 0x01F4 (0x06B4 - 0x04C0)
class UBTWindowCreateClanHK : public UBTWindowHK
{
public:
	string                                             strLabel[0xB];                                            // 0x04C0(0x000C) (Localized, NeedCtorLink)
	string                                             strQTRoomNumber;                                          // 0x0544(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0xB];                                             // 0x0550(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0xB];                                               // 0x0600(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbEdit[0x3];                                              // 0x062C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Edit[0x3];                                                // 0x065C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strButtonOverlapCheck;                                    // 0x0668(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonOverlapCheck;                                     // 0x0674(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonOverlapCheck;                                       // 0x0684(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTEditBoxHK*                                ClanName;                                                 // 0x0688(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       ClanIntroduction;                                         // 0x068C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTEditBoxHK*                                ClanKeyword;                                              // 0x0690(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ClanLocation;                                             // 0x0694(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbClanLocation;                                           // 0x0698(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTLabelLocationHK*                          sampleLocation;                                           // 0x06A8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bCheckDupName;                                            // 0x06AC(0x0004)
	bool                                               bCheckDupID;                                              // 0x06AC(0x0004)
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x06B0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowCreateClanHK");
		return ptr;
	}


	void Internal_OnOpen();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool ButtonOverlapCheck_OnClick(class UGUIComponent* Sender);
	bool CheckDup();
	void ClanName_OnChange(class UGUIComponent* Sender);
};


// Class GUIWarfareControls.BTComboBoxHK
// 0x008C (0x039C - 0x0310)
class UBTComboBoxHK : public UGUIPanel
{
public:
	EDrawType                                          FontDrawType;                                             // 0x0310(0x0001)
	EDrawType                                          ExtraDataFontDrawType;                                    // 0x0311(0x0001)
	byte                                               Padding00[0x2];                                           // 0x0312(0x0002) MISSED OFFSET
	int                                                FontSize[0x5];                                            // 0x0314(0x0004)
	struct FColor                                      FontColor[0x3];                                           // 0x0328(0x0004)
	struct FColor                                      FontShadowColor;                                          // 0x0334(0x0004)
	struct FColor                                      FontColorOfTitle;                                         // 0x0338(0x0004)
	int                                                FontPadding[0x4];                                         // 0x033C(0x0004)
	bool                                               bShowExtraData;                                           // 0x034C(0x0004)
	struct FImage                                      combSelectImg;                                            // 0x0350(0x0020)
	struct FImage                                      combBackImg;                                              // 0x0370(0x0020)
	class UBTOwnerDrawImageHK*                         Border;                                                   // 0x0390(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIComboBox*                                ComboBox;                                                 // 0x0394(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	bool                                               bHideBtn;                                                 // 0x0398(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTComboBoxHK");
		return ptr;
	}


	void InternalOnChange(class UGUIComponent* Sender);
	bool InternalDraw(class UCanvas* C);
	void ApplyAWinPos();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	float GetItemHeight(class UCanvas* C);
	void EnableMe();
	void DisableMe();
	void OnComboListDrawItem(class UCanvas* C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending);
	bool OnComboEditDraw(class UCanvas* C);
	void InitComboBox();
	void InitScrollBar();
	void SetFontSizeAll(int Size);
	void SetDefaultFontColor();
	string GetSelectExtra();
};


// Class GUIWarfareControls.BTWindowCreateClanNeedPointHK
// 0x0020 (0x04E0 - 0x04C0)
class UBTWindowCreateClanNeedPointHK : public UBTWindowHK
{
public:
	string                                             strLabel;                                                 // 0x04C0(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel;                                                  // 0x04CC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label;                                                    // 0x04DC(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowCreateClanNeedPointHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowFindClanHK
// 0x0304 (0x07C4 - 0x04C0)
class UBTWindowFindClanHK : public UBTWindowHK
{
public:
	bool                                               bReceiveLock;                                             // 0x04C0(0x0004)
	int                                                CurrentPage;                                              // 0x04C4(0x0004)
	int                                                MinPage;                                                  // 0x04C8(0x0004)
	int                                                MaxPage;                                                  // 0x04CC(0x0004)
	string                                             searchtext;                                               // 0x04D0(0x000C) (NeedCtorLink)
	int                                                SearchType;                                               // 0x04DC(0x0004)
	int                                                Status;                                                   // 0x04E0(0x0004)
	int                                                Region;                                                   // 0x04E4(0x0004)
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x04E8(0x0004)
	string                                             strCreateDate[0x2];                                       // 0x04EC(0x000C) (Localized, NeedCtorLink)
	string                                             strRound;                                                 // 0x0504(0x000C) (Localized, NeedCtorLink)
	string                                             strRank;                                                  // 0x0510(0x000C) (Localized, NeedCtorLink)
	string                                             strClanSearchType[0x4];                                   // 0x051C(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonCafe;                                            // 0x054C(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonInfo;                                            // 0x0558(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonCafe;                                             // 0x0564(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonInfo;                                             // 0x0574(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonCafe;                                               // 0x0584(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonInfo;                                               // 0x0588(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabel[0x3];                                            // 0x058C(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0x3];                                             // 0x05B0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0x3];                                               // 0x05E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbComboSearch;                                            // 0x05EC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTComboBoxHK*                               ComboSearch;                                              // 0x05FC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbEdit;                                                   // 0x0600(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Edit;                                                     // 0x0610(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTEditBoxHK*                                EditSearch;                                               // 0x0614(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strButtonSearch;                                          // 0x0618(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonSearch;                                           // 0x0624(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonSearch;                                             // 0x0634(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelTop[0x7];                                            // 0x0638(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTop[0x7];                                         // 0x0654(0x0010)
	string                                             strButtonTop[0x7];                                        // 0x06C4(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTop[0x7];                                           // 0x0718(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UButtonGroups*                               RadioGroup;                                               // 0x0734(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strRadioOption[0x2];                                      // 0x0738(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbRadioOption[0x2];                                       // 0x0750(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTCheckBoxHK*                               RadioOption[0x2];                                         // 0x0770(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ClanLocation;                                             // 0x0778(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbClanLocation;                                           // 0x077C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTLabelLocationHK*                          sampleLocation;                                           // 0x078C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         lbClanLocation;                                           // 0x0790(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fblbClanLocation;                                         // 0x0794(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strClanLocation;                                          // 0x07A4(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbACLClanList;                                            // 0x07B0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLClanHK*                                ACLClanList;                                              // 0x07C0(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowFindClanHK");
		return ptr;
	}


	void Internal_OnOpen();
	bool ButtonSearch_OnClick(class UGUIComponent* Sender);
	void ACLClanList_OnHitBottom(int Top, int Count, int itemperpage);
	void ACLClanList_OnHitTop(int Top, int Count, int itemperpage);
	void SetPageLimit(int minp, int maxp);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	string GetSelectClanName();
	void SetData(int TotalPage, int[] ClanMarkPattern, int[] ClanMarkBG, byte[] ClanMarkBL, string[] ClanName, string[] ClanMaster, int[] ClanMember, int[] ClanMemberMax, int[] ClanCreateDate, int[] ClanWin, int[] ClanLose, int[] ClanDraw, int[] ClanRank, byte[] ClanRecruit, int[] ClanLevel);
};


// Class GUIWarfareControls.BTWindowTodayResultHK
// 0x01D0 (0x0690 - 0x04C0)
class UBTWindowTodayResultHK : public UBTWindowHK
{
public:
	class UBTRODecorateStringHK*                       decoString;                                               // 0x04C0(0x0004)
	struct FFloatBox                                   fbLabel[0x2];                                             // 0x04C4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strLabel[0x2];                                            // 0x04E4(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         Label[0x2];                                               // 0x04FC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelLevelBG[0x4];                                      // 0x0504(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelLevelBG[0x4];                                        // 0x0544(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelLevelIConB[0x4];                                   // 0x0554(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelLevelIConB[0x4];                                     // 0x0594(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelLevelIConF[0x4];                                   // 0x05A4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelLevelIConF[0x4];                                     // 0x05E4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelLevel[0x3];                                        // 0x05F4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelLevel[0x3];                                          // 0x0624(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPItemList[0x3];                                        // 0x0630(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPItemListHK*                             TPItemList[0x3];                                          // 0x0660(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strExpBar;                                                // 0x066C(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbExpBar;                                                 // 0x0678(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTExpBarHK*                                 expbar;                                                   // 0x0688(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                iMaxLevel;                                                // 0x068C(0x0004) (Const)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowTodayResultHK");
		return ptr;
	}


	void AddItem(int pos, int ItemID, int PartID);
	void UpdateData();
	void TPItemList_ImageListBox_OnRendered_2(class UCanvas* C);
	void TPItemList_ImageListBox_OnRendered_1(class UCanvas* C);
	void TPItemList_ImageListBox_OnRendered_0(class UCanvas* C);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool Exit_OnClick(class UGUIComponent* Sender);
	bool ImageListBox_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfareControls.BTWindowClanMenuHK
// 0x00CC (0x058C - 0x04C0)
class UBTWindowClanMenuHK : public UBTWindowHK
{
public:
	string                                             strOK2;                                                   // 0x04C0(0x000C) (Localized, NeedCtorLink)
	string                                             strLabel;                                                 // 0x04CC(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelHelp[0x3];                                        // 0x04D8(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel;                                                  // 0x04FC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelHelp[0x3];                                         // 0x050C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label;                                                    // 0x053C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelHelp[0x3];                                           // 0x0540(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonCreateClan;                                       // 0x054C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonFindClan;                                         // 0x055C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strButtonCreateClan;                                      // 0x056C(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonFindClan;                                        // 0x0578(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonCreateClan;                                         // 0x0584(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonFindClan;                                           // 0x0588(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowClanMenuHK");
		return ptr;
	}


	bool OnOK(class UGUIComponent* Sender);
	void SetClanLookingFor(bool bLookFor);
	bool ButtonFindClan_OnClick(class UGUIComponent* Sender);
	bool ButtonCreateClan_OnClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTOwnerDrawSourceClipImageHK
// 0x0010 (0x03CC - 0x03BC)
class UBTOwnerDrawSourceClipImageHK : public UBTOwnerDrawImageHK
{
public:
	struct FFloatBox                                   ClipArea;                                                 // 0x03BC(0x0010)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTOwnerDrawSourceClipImageHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
};


// Class GUIWarfareControls.BTTPTeamMemberList
// 0x00F8 (0x0438 - 0x0340)
class UBTTPTeamMemberList : public UBTTabPanelHK
{
public:
	class UBTOwnerDrawImageHK*                         LabelTop[0x6];                                            // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTop[0x6];                                         // 0x0358(0x0010)
	string                                             strButtonTop[0x6];                                        // 0x03B8(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTop[0x6];                                           // 0x0400(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTACLTeamMemberListHK*                      ACLList;                                                  // 0x0418(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTCMTeamMemberListHK*                       CMList;                                                   // 0x041C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FScriptDelegate                             __OnPopup__Delegate;                                      // 0x0420(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnNonSelectPopup__Delegate;                             // 0x0428(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnPopupCheck__Delegate;                                 // 0x0430(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPTeamMemberList");
		return ptr;
	}


	int GetUserCount();
	void ContextMenu_OnSelected(int ContextMenuIndex);
	void OnPopupCheck(class UBTACLTeamMemberListHK* acl, class UBTCMTeamMemberListHK* cm);
	void OnNonSelectPopup(int ContextMenuIndex, class UBTACLTeamMemberListHK* acl);
	void OnPopup(int ContextMenuIndex, class UBTACLTeamMemberListHK* acl);
	bool ContextMenu_OnClose(class UGUIContextMenu* Sender);
	bool ContextMenu_OnOpen(class UGUIContextMenu* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool ButtonTop_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfareControls.BTAutoColumnListDataHK
// 0x0034 (0x0060 - 0x002C)
class UBTAutoColumnListDataHK : public UObject
{
public:
	bool                                               bCustomSpliter;                                           // 0x002C(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	bool                                               bSpliter;                                                 // 0x002C(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                SpliterIndex;                                             // 0x0030(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FACLData[]                                  DataPerColumn;                                            // 0x0034(0x000C) (Edit, NeedCtorLink)
	struct FImage                                      BackgroundImage;                                          // 0x0040(0x0020) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTAutoColumnListDataHK");
		return ptr;
	}


	void InitData(int Index);
	void Init(int ColumnCount);
};


// Class GUIWarfareControls.BTTPMessengerHK
// 0x011C (0x044C - 0x0330)
class UBTTPMessengerHK : public UGUITabPanel
{
public:
	class UBTOwnerDrawCaptionButtonHK*                 ButtonMainPCBang;                                         // 0x0330(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTStretchedImageHK*                         BackgroundImage;                                          // 0x0334(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTStretchedImageHK*                         ListBoundImage[0x3];                                      // 0x0338(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UTabControlMocker*                           TabControl;                                               // 0x0344(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*[]               ButtonMsg;                                                // 0x0348(0x000C) (NeedCtorLink)
	class UBTAutoColumnListHK*[]                       ACLMsg;                                                   // 0x0354(0x000C) (NeedCtorLink)
	class UBTContextMenuHK*[]                          CMMsg;                                                    // 0x0360(0x000C) (NeedCtorLink)
	class UwMatchMaker*                                MM;                                                       // 0x036C(0x0004)
	string                                             strConnected;                                             // 0x0370(0x000C) (Localized, NeedCtorLink)
	string                                             strFriend;                                                // 0x037C(0x000C) (Localized, NeedCtorLink)
	string                                             strClan;                                                  // 0x0388(0x000C) (Localized, NeedCtorLink)
	string                                             strDeny;                                                  // 0x0394(0x000C) (Localized, NeedCtorLink)
	string                                             strPCBang;                                                // 0x03A0(0x000C) (Localized, NeedCtorLink)
	string                                             strOffLine;                                               // 0x03AC(0x000C) (Localized, NeedCtorLink)
	string                                             strLogout;                                                // 0x03B8(0x000C) (Localized, NeedCtorLink)
	string                                             strMainPCBang[0x4];                                       // 0x03C4(0x000C) (Localized, NeedCtorLink)
	struct FScriptDelegate                             __OnPopupChannel__Delegate;                               // 0x03F4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnPopupFriend__Delegate;                                // 0x03FC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnPopupClan__Delegate;                                  // 0x0404(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnPopupPCBang__Delegate;                                // 0x040C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnPopupChannelCheck__Delegate;                          // 0x0414(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnPopupFriendCheck__Delegate;                           // 0x041C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnPopupClanCheck__Delegate;                             // 0x0424(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnPopupPCBangCheck__Delegate;                           // 0x042C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __ChannelUserList_OnHitBottom__Delegate;                  // 0x0434(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __ChannelUserList_OnHitTop__Delegate;                     // 0x043C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __ChannelUserList_OnAdjustWindow__Delegate;               // 0x0444(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPMessengerHK");
		return ptr;
	}


	void SetUserServerInfo(const string& szServername, const string& szServerShortName, const string& szServerIP, int serverPort, byte CurPos, byte CurState, int ChannelNum, const string& szChannelNickName, int GameRoomNum);
	void HideTabButton(EBTTPMessengerHK_E_TAB_MENU_TYPE eTabMenuType);
	void ShowTabButton(EBTTPMessengerHK_E_TAB_MENU_TYPE eTabMenuType);
	void UpdateTabButtonPosition();
	void Internal_OnVisiblePanelChanged(int Index);
	void UpdatePCBangInfo();
	bool ButtonMainPCBang_Playing_OnClick(class UGUIComponent* Sender);
	bool ButtonMainPCBang_Change_OnClick(class UGUIComponent* Sender);
	bool ButtonMainPCBang_Register_OnClick(class UGUIComponent* Sender);
	bool BTWindowDefineARHK_18_19_OnOK(class UGUIComponent* Sender);
	void AddAclMsgMenu(int Index);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void BTACLMessengerChannelHK_OnHitTop(int Top, int Count, int itemperpage);
	void BTACLMessengerChannelHK_OnHitBottom(int Top, int Count, int itemperpage);
	void BTACLMessengerChannelHK_OnAdjustWindow(int Top, int Count, int itemperpage);
	void ChannelUserList_OnAdjustWindow(int Top, int Count, int itemperpage);
	void ChannelUserList_OnHitTop(int Top, int Count, int itemperpage);
	void ChannelUserList_OnHitBottom(int Top, int Count, int itemperpage);
	void ContextMenu_OnSelected(int ContextMenuIndex);
	void OnPopupPCBangCheck(class UBTACLMessengerPCBangHK* acl, class UBTCMMessengerPCBangHK* cm);
	void OnPopupClanCheck(class UBTACLMessengerClanHK* acl, class UBTCMMessengerClanHK* cm);
	void OnPopupFriendCheck(class UBTACLMessengerFriendHK* acl, class UBTCMMessengerFriendHK* cm);
	void OnPopupChannelCheck(class UBTACLMessengerChannelHK* acl, class UBTCMMessengerChannelHK* cm);
	void OnPopupCheck(int Panel, class UBTAutoColumnListHK* acl);
	void OnPopupPCBang(int ContextMenuIndex, class UBTACLMessengerPCBangHK* acl);
	void OnPopupClan(int ContextMenuIndex, class UBTACLMessengerClanHK* acl);
	void OnPopupFriend(int ContextMenuIndex, class UBTACLMessengerFriendHK* acl);
	void OnPopupChannel(int ContextMenuIndex, class UBTACLMessengerChannelHK* acl);
	bool ContextMenu_OnClose(class UGUIContextMenu* Sender);
	bool ContextMenu_OnOpen(class UGUIContextMenu* Sender);
	void LoadPos(EBTTPMessengerHK_E_TAB_MENU_TYPE eTabMenuType);
	void SavePos(EBTTPMessengerHK_E_TAB_MENU_TYPE eTabMenuType);
	void RemoveAll(EBTTPMessengerHK_E_TAB_MENU_TYPE eTabMenuType);
	void RemoveChannelUser(int UID);
	bool IsFriendlyUser(const string& UserName, const string& ClanName, int ListIdx);
	void UpdateFriendlyUser(int ListIdx);
	int FindFriendFromUserName(const string& UserName);
	void AddPCBangUser(const string& UserName, int ClanMark, int ClanBG, int ClanBL, const string& ClanName, int Level, const string& ServerName, const string& ServerIP, int serverPort, int CurPos, int ChannelNum, const string& ChannelNickName, int RoomNum, int ClanGrade, int ClanWin, int ClanLose, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	void AddClanUser(const string& UserName, byte IsLogOn, int Level, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, int LevelMarkID, int TitleMarkID);
	void AddFriendUser(const string& UserName, byte IsLogOn, int ClanMark, int ClanBG, int ClanBL, const string& ClanName, int Level, int ClanGrade, byte IsLookForClan, int ClanLevel, int LevelMarkID);
	void ReplaceChannelUser(int Index, int ClanPattern, int ClanBG, int ClanBL, const string& ClanName, int Level, const string& UserName, int UID, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	class UBTAutoColumnListHK* GetMessengerType(byte CommunityType);
	void ReplaceClanName(byte CommunityType, const string& OldClanName, const string& NewClanname);
	void ReplaceClanLevel(byte CommunityType, const string& ClanName, int ClanLevel);
	void ReplaceMyClanName(byte CommunityType, const string& UserName, const string& NewClanname);
	void ReplaceUserNickName(byte CommunityType, const string& OldUserName, const string& NewUserName);
	bool AddChannelUser(int ClanPattern, int ClanBG, int ClanBL, const string& ClanName, int Level, const string& UserName, int UID, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	int FindChannelUser(int UID);
};


// Class GUIWarfareControls.BTContextMenuHK
// 0x00E0 (0x03E4 - 0x0304)
class UBTContextMenuHK : public UGUIContextMenu
{
public:
	bool                                               bCondition;                                               // 0x0304(0x0004)
	int                                                OpenMouseX;                                               // 0x0308(0x0004)
	int                                                OpenMouseY;                                               // 0x030C(0x0004)
	int                                                ItemWidth;                                                // 0x0310(0x0004)
	int                                                SelectedIndex;                                            // 0x0314(0x0004)
	int                                                FontSize[0x3];                                            // 0x0318(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FColor                                      FontColor[0x3];                                           // 0x0324(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FColor                                      FontShadowColor[0x3];                                     // 0x0330(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                CaptionPadding[0x4];                                      // 0x033C(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	EDrawType                                          CaptionDrawType;                                          // 0x034C(0x0001) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	byte                                               Padding00[0x3];                                           // 0x034D(0x0003) MISSED OFFSET
	EContextMenuState[]                                ContextItemsState;                                        // 0x0350(0x000C) (NeedCtorLink)
	struct FImage                                      buttonImage[0x3];                                         // 0x035C(0x0020)
	struct FImage                                      BackgroundImage;                                          // 0x03BC(0x0020)
	struct FScriptDelegate                             __OnSelected__Delegate;                                   // 0x03DC(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTContextMenuHK");
		return ptr;
	}


	bool RemoveItemByIndex(int Index);
	bool RemoveItemByName(const string& ItemName);
	int InsertItem(const string& NewItem, int Index);
	int AddItem(const string& NewItem);
	bool ChangeStateByName(const string& ItemName, EContextMenuState st);
	bool ChangeStateByIndex(int Index, EContextMenuState st);
	EContextMenuState GetItemState(int Index);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool OnDraw(class UCanvas* C);
	void OpenContextMenu(int MouseX, int MouseY);
	bool OnPreDraw(class UCanvas* C);
	void OnSelect(class UGUIContextMenu* Sender, int ClickIndex);
	void OnSelected(int SelectedIndex);
};


// Class GUIWarfareControls.BTCMMessengerOnOffline
// 0x0044 (0x0428 - 0x03E4)
class UBTCMMessengerOnOffline : public UBTContextMenuHK
{
public:
	int                                                nOnLine;                                                  // 0x03E4(0x0004)
	string                                             strOnOff[0x3];                                            // 0x03E8(0x000C) (Localized, NeedCtorLink)
	byte                                               nPopupSize[0x2];                                          // 0x040C(0x0001)
	byte                                               Padding00[0x2];                                           // 0x040E(0x0002) MISSED OFFSET
	string                                             strLineText[0x2];                                         // 0x0410(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTCMMessengerOnOffline");
		return ptr;
	}


	bool IsActiveMoveRoomState();
	bool IsActiveInviteState();
	void ChangeMoveRoomState(bool bActive);
	void ChangeInviteState(bool bActive);
	void ChangeWispherState(bool bActive);
	void SetLocation(const string& strChannelName, int GameRoomNum);
	void SetLogOnState(int nLogOnState);
	bool OnDraw(class UCanvas* C);
};


// Class GUIWarfareControls.BTAutoColumnListHK
// 0x0130 (0x0460 - 0x0330)
class UBTAutoColumnListHK : public UGUITabPanel
{
public:
	struct FSaveListPos                                slp;                                                      // 0x0330(0x0020)
	bool                                               bAlwaysActiveCursor;                                      // 0x0350(0x0004)
	bool                                               bActiveCursor;                                            // 0x0350(0x0004)
	class UBTStretchedImageHK*                         BackgroundImage;                                          // 0x0354(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIMultiColumnListBox*                      MultiColumnBox;                                           // 0x0358(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIMultiColumnList*                         MultiColumnList;                                          // 0x035C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTAutoColumnListHeaderHK*[]                 ACLHeaderList;                                            // 0x0360(0x000C) (NeedCtorLink)
	class UBTAutoColumnListDataHK*[]                   ACLRowList;                                               // 0x036C(0x000C) (NeedCtorLink)
	float                                              saveTime;                                                 // 0x0378(0x0004)
	bool                                               bSaveMode;                                                // 0x037C(0x0004)
	int                                                maxFontSize;                                              // 0x0380(0x0004)
	struct FColor                                      DefaultColor;                                             // 0x0384(0x0004)
	int                                                selectIndex;                                              // 0x0388(0x0004)
	int                                                SelectIndexX;                                             // 0x038C(0x0004)
	int                                                SelectIndexY;                                             // 0x0390(0x0004)
	int                                                LastSelectedIndex;                                        // 0x0394(0x0004)
	int                                                LastSelectedIndexHistory;                                 // 0x0398(0x0004)
	struct FImage                                      SelectImage;                                              // 0x039C(0x0020)
	struct FImage                                      LastSelectedImage;                                        // 0x03BC(0x0020)
	struct FImage                                      DefaultRowImage;                                          // 0x03DC(0x0020)
	struct FImage                                      ClickImage;                                               // 0x03FC(0x0020)
	struct FImage                                      MarkMe;                                                   // 0x041C(0x0020)
	bool                                               isFullRoom;                                               // 0x043C(0x0004)
	struct FScriptDelegate                             __SpliterDraw__Delegate;                                  // 0x0440(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnAdjustWindow__Delegate;                               // 0x0448(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnHitBottom__Delegate;                                  // 0x0450(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnHitTop__Delegate;                                     // 0x0458(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTAutoColumnListHK");
		return ptr;
	}


	void OnHitTop(int Top, int Count, int itemperpage);
	void OnHitBottom(int Top, int Count, int itemperpage);
	void OnAdjustWindow(int Top, int Count, int itemperpage);
	void MultiColumnList_OnAdjustTop(class UGUIComponent* Sender);
	void MultiColumnList_InternalDeactivate();
	void MultiColumnList_InternalActivate();
	void MultiColumnList_OnDrawItem(class UCanvas* C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending);
	void DrawDefaultRowImage(class UCanvas* C);
	bool BackgroundImage_OnDraw(class UCanvas* C);
	void SpliterDraw(class UCanvas* C, float X, float Y, float W, float HT, int SpliterIndex);
	float GetItemHeight(class UCanvas* C);
	bool MultiColumnList_OnPreDraw(class UCanvas* C);
	int FindLastPressedColumn();
	bool MultiColumnList_OnDblClick(class UGUIComponent* Sender);
	bool MultiColumnList_OnClick(class UGUIComponent* Sender);
	void NormalizeColumnPerc();
	void NormalizeMultiColumnPerc();
	int BinarySearchIndexBySelectLocation(int ColumnIndex, int valueIndex, int dataIndex);
	int ReverseBinarySearchIndexBySelectLocation(int ColumnIndex, int valueIndex, int dataIndex);
	void SortRoom();
	void SortBySelectLocation(int ColumnIndex, int valueIndex, bool bReverseSort);
	int BinarySearchIndex(int ColumnIndex, int dataIndex);
	int ReverseBinarySearchIndex(int ColumnIndex, int dataIndex);
	void SortColumn(int ColumnIndex, bool bReverseSort);
	int MultiCalculateIndex();
	int GetCurrentIndex();
	class UBTAutoColumnListDataHK* GetRowByIndex(int Index);
	void RemoveAll();
	void RemoveRowArray(int StartIndex, int endLength);
	void RemoveRow(int Index);
	void AddRow(class UBTAutoColumnListDataHK* Item, bool bSet, int Index);
	int AddColumn(class UBTAutoColumnListHeaderHK* Item);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void LoadPos();
	void SavePos();
	void InitScrollBar();
};


// Class GUIWarfareControls.BTACLMessengerCommon
// 0x0008 (0x0468 - 0x0460)
class UBTACLMessengerCommon : public UBTAutoColumnListHK
{
public:
	struct FScriptDelegate                             __deleClanName__Delegate;                                 // 0x0460(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLMessengerCommon");
		return ptr;
	}


	bool MultiColumnList_OnEndToolTip();
	class UGUIToolTip* MultiColumnList_OnBeginToolTip();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void DrawClanName(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, const string& szClanName, int row);
	void deleClanName(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, const string& szClanName, int row);
	string GetClanName(int row);
	void SetCurState(int row, int Value);
	void SetChannelNumber(int row, int Value);
	void SetGameRoomNumber(int row, int Value);
	void SetServerName(int row, const string& Value);
	void SetServerIP(int row, const string& Value);
	void SetServerPort(int row, int Value);
	void SetChannelName(int row, const string& Value);
	void SetCurLocationName(int row, const string& Value);
	void SetCurpos(int row, int Value);
};


// Class GUIWarfareControls.BTWindowRequestApprovalClanHK
// 0x02C4 (0x0784 - 0x04C0)
class UBTWindowRequestApprovalClanHK : public UBTWindowHK
{
public:
	string                                             strLabel[0xC];                                            // 0x04C0(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0xC];                                             // 0x0550(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0xC];                                               // 0x0610(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTLabelLevelHK*                             LabelLevel;                                               // 0x0640(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbEdit[0x8];                                              // 0x0644(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strEdit[0x8];                                             // 0x06C4(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawTextArrayHK*                     Edit[0x8];                                                // 0x0724(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strButtonSuspend;                                         // 0x0744(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonSuspend;                                          // 0x0750(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonSuspend;                                            // 0x0760(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       EditAddMsg;                                               // 0x0764(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                ReqJoinUserIdx;                                           // 0x0768(0x0004)
	string                                             CharName;                                                 // 0x076C(0x000C) (NeedCtorLink)
	string                                             InviteMsg;                                                // 0x0778(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowRequestApprovalClanHK");
		return ptr;
	}


	void Internal_OnOpen();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetCharInfo(const struct FCharInfo& stCharInfo);
	void SetData(int ReqJoinUserIdx, const string& CharName, const string& Message);
};


// Class GUIWarfareControls.BTWindowRequestClanHK
// 0x0340 (0x0800 - 0x04C0)
class UBTWindowRequestClanHK : public UBTWindowHK
{
public:
	string                                             strLabel[0xE];                                            // 0x04C0(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0xE];                                             // 0x0568(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0xE];                                               // 0x0648(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTLabelClanMarkHK*                          LabelClanMark;                                            // 0x0680(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbEdit[0x9];                                              // 0x0684(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strEdit[0x9];                                             // 0x0714(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawTextArrayHK*                     Edit[0x9];                                                // 0x0780(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strButtonSuspend;                                         // 0x07A4(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonSuspend;                                          // 0x07B0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonSuspend;                                            // 0x07C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       EditAddMsg;                                               // 0x07C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       EditClanIntroduction;                                     // 0x07C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                InviterUserIdx;                                           // 0x07CC(0x0004)
	string                                             InviterCharname;                                          // 0x07D0(0x000C) (NeedCtorLink)
	string                                             ClanName;                                                 // 0x07DC(0x000C) (NeedCtorLink)
	string                                             InviteMsg;                                                // 0x07E8(0x000C) (NeedCtorLink)
	string                                             strNoRankState;                                           // 0x07F4(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowRequestClanHK");
		return ptr;
	}


	void Internal_OnOpen();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetClanInfo(const struct FClanInfo& stClanInfo);
	void SetData(int InviterUserIdx, const string& InviterCharname, const string& ClanName, const string& InviteMsg);
};


// Class GUIWarfareControls.BTWindowClanInfoHK
// 0x0490 (0x0950 - 0x04C0)
class UBTWindowClanInfoHK : public UBTWindowHK
{
public:
	string                                             strRadioLocation[0xE];                                    // 0x04C0(0x000C) (Localized, NeedCtorLink)
	string                                             strLabel[0xF];                                            // 0x0568(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0xF];                                             // 0x061C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0xF];                                               // 0x070C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strEdit[0xF];                                             // 0x0748(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbEdit[0xF];                                              // 0x07FC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelClanMark;                                          // 0x08EC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawTextArrayHK*                     Edit[0xF];                                                // 0x08FC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTLabelClanMarkHK*                          LabelClanMark;                                            // 0x0938(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       ClanIntroduction;                                         // 0x093C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTAutoScrollListHK*                         ClanIntroduction2;                                        // 0x0940(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strNoRankState;                                           // 0x0944(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowClanInfoHK");
		return ptr;
	}


	void Internal_OnOpen();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetData(const struct FClanInfo& stClanInfo);
};


// Class GUIWarfareControls.BTWindowUserPersonalInfo
// 0x01F0 (0x06B0 - 0x04C0)
class UBTWindowUserPersonalInfo : public UBTWindowHK
{
public:
	string                                             strButtonTab[0x2];                                        // 0x04C0(0x000C) (Localized, NeedCtorLink)
	class UTabControlMocker*                           TabControl;                                               // 0x04D8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTab[0x2];                                         // 0x04DC(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTab[0x2];                                           // 0x04FC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPPanel;                                                // 0x0504(0x0010)
	class UBTTPOptionBaseHK*                           TPPanel[0x2];                                             // 0x0514(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                VisiblePanelIdx;                                          // 0x051C(0x0004)
	class UBTTPMyInfoBasicHK*                          TPBasic;                                                  // 0x0520(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPMyInfoStatHK*                           TPStat;                                                   // 0x0524(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         BackgroundPanel;                                          // 0x0528(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbBackgroundPanel;                                        // 0x052C(0x0010)
	class UBTTcpLink_Channel*                          kTcpChannel;                                              // 0x053C(0x0004)
	struct FClanInfo                                   kMyClanInfo;                                              // 0x0540(0x00B0) (NeedCtorLink)
	struct FCharInfo                                   kMyCharInfo;                                              // 0x05F0(0x00C0)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowUserPersonalInfo");
		return ptr;
	}


	void SetClanInfo(const struct FClanInfo& ClanInfo);
	void SetCharInfo(const struct FCharInfo& CharInfo);
	void setTcpChannel(class UBTTcpLink_Channel* TcpChannel);
	void UpdateRankingInfoCompleted();
	void UpdateRankingInfoList(byte RankingType, byte CommunityType, string[] CharName, int[] CharLevel, string[] ClanName, int[] ClanMarkPattern, int[] ClanMarkBG, int[] ClanMarkBL, int[] Ranking_Accum, int[] Ranking_Accum_Prev, int[] Ranking_Accum_Exp, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	void UpdateRankingCount(byte RankingType, byte CommunityType, int TotalCount);
	void UpdateCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	void UpdateFriendCharInfo(const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	void UpdateCharInfo();
	void UpdateRequestServer();
	void Internal_OnOpen();
	bool ButtonTab_OnClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTACLTeamMemberListHK
// 0x00A4 (0x0504 - 0x0460)
class UBTACLTeamMemberListHK : public UBTAutoColumnListHK
{
public:
	string                                             strStatus[0xA];                                           // 0x0460(0x000C) (Localized, NeedCtorLink)
	string                                             strMaster;                                                // 0x04D8(0x000C) (Localized, NeedCtorLink)
	struct FImage                                      LevelImg;                                                 // 0x04E4(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLTeamMemberListHK");
		return ptr;
	}


	int GetLevelMarkID(int row);
	struct FColor GetUserNameColor(int row);
	int GetClanPatternID(int row);
	int GetUserID(int Index);
	string GetClanName(int Index);
	string GetUserName(int Index);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void LC5_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC4_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC2_3_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC1_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	class UBTAutoColumnListDataHK* FindTeamMember(int UID);
	int PingToIndex(int msec);
	bool ChangePingInfo(int UID, int PingValue);
	bool ChangeLevelMarkID(const string& UserName, int LevelMarkID);
	bool ChangeTeamMemberStatus(int UID, int Status);
	bool IsAllReady();
	int GetReadyUserCount();
	string GetMaxSameClanName();
	int GetMaxSameClanUserCount();
	struct FStrInt_Struct GetMaxSameClanUserInfo();
	bool ChangeRoomOwnerInfo(int UID);
	bool RemoveTeamMemberByUID(int UID);
	bool ChangeTeamMember(int UID, int ClanMark, int ClanBG, int ClanBL, int Level, const string& NickName, const string& ClanName, int Status, int Host, int Ping, const string& UserIP, byte LookingFor, int ClanLevel, bool bMe);
	int FindTeamMemberIndex(int UID);
	void ReplaceClanLevel(const string& ClanName, int ClanLevel);
	void ReplaceClanName(const string& old_ClanName, const string& new_ClanName);
	bool ReplaceUserNickName(const string& Old_NickName, const string& New_NickName);
	void AddTeamMember(int UID, int ClanMark, int ClanBG, int ClanBL, int Level, const string& NickName, const string& ClanName, int Status, int Host, int Ping, const string& UserIP, byte LookingFor, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3, bool bMe);
	float GetItemHeight(class UCanvas* C);
};


// Class GUIWarfareControls.BTCMTeamMemberListHK
// 0x006C (0x0450 - 0x03E4)
class UBTCMTeamMemberListHK : public UBTContextMenuHK
{
public:
	string                                             strContextMenuName[0x9];                                  // 0x03E4(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTCMTeamMemberListHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindow
// 0x0004 (0x0408 - 0x0404)
class UBTWindow : public UFloatingWindow
{
public:
	bool                                               bHandleEsc;                                               // 0x0404(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindow");
		return ptr;
	}


	bool InternalOnKeyEvent(float Delta, byte* key, byte* State);
	void Closed(class UGUIComponent* Sender, bool bCancelled);
	void Opened(class UGUIComponent* Sender);
};


// Class GUIWarfareControls.BTWindowInviteFriendHK
// 0x007C (0x0484 - 0x0408)
class UBTWindowInviteFriendHK : public UBTWindow
{
public:
	class UBTOwnerDrawImageHK*                         BackgroundImage;                                          // 0x0408(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         TopLine;                                                  // 0x040C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         BottomLine;                                               // 0x0410(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonOK;                                                 // 0x0414(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonCancel;                                             // 0x0418(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelDivider;                                             // 0x041C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelInviteMsg;                                           // 0x0420(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelSendMsg;                                             // 0x0424(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelEditMsg;                                             // 0x0428(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTMultiLineEditBoxHK*                       MultiLineEditMsg;                                         // 0x042C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strTitle;                                                 // 0x0430(0x000C) (Localized, NeedCtorLink)
	string                                             strSendMsg;                                               // 0x043C(0x000C) (Localized, NeedCtorLink)
	string                                             strInviteMsg;                                             // 0x0448(0x000C) (Localized, NeedCtorLink)
	string                                             strOK;                                                    // 0x0454(0x000C) (Localized, NeedCtorLink)
	string                                             strCancel;                                                // 0x0460(0x000C) (Localized, NeedCtorLink)
	string                                             FriendName;                                               // 0x046C(0x000C) (NeedCtorLink)
	int                                                friendUID;                                                // 0x0478(0x0004)
	struct FScriptDelegate                             __OnOK__Delegate;                                         // 0x047C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowInviteFriendHK");
		return ptr;
	}


	bool ButtonOK_OnClick(class UGUIComponent* Sender);
	void InternalOnCreateComponent(class UGUIComponent* NewComp, class UGUIComponent* Sender);
	bool InternalOnKeyEvent(float Delta, byte* key, byte* State);
	void Closed(class UGUIComponent* Sender, bool bCancelled);
	void Opened(class UGUIComponent* Sender);
	void ApplyLocalizedStrings();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool OnOK(class UGUIComponent* Sender);
	void SetData(const string& UserName, int UID);
};


// Class GUIWarfareControls.BTACLMessengerBanHK
// 0x0020 (0x0480 - 0x0460)
class UBTACLMessengerBanHK : public UBTAutoColumnListHK
{
public:
	struct FImage                                      CommonSizeImg;                                            // 0x0460(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLMessengerBanHK");
		return ptr;
	}


	void RemoveBlockUser(const string& UserName);
	void AddBlockUser(const string& UserName);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	float GetItemHeight(class UCanvas* C);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	string GetUserName(int row);
	void InitScrollBar();
};


// Class GUIWarfareControls.BTCMMessengerBanHK
// 0x0018 (0x03FC - 0x03E4)
class UBTCMMessengerBanHK : public UBTContextMenuHK
{
public:
	string                                             strContextMenuName[0x2];                                  // 0x03E4(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTCMMessengerBanHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTACLMessengerPCBangHK
// 0x0020 (0x0488 - 0x0468)
class UBTACLMessengerPCBangHK : public UBTACLMessengerCommon
{
public:
	struct FImage                                      CommonSizeImg;                                            // 0x0468(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLMessengerPCBangHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	float GetItemHeight(class UCanvas* C);
	int GetLevelMarkID(int row);
	int GetClanNum(int row);
	struct FImage GetClanBL(int row);
	struct FImage GetClanBG(int row);
	struct FImage GetClanPattern(int row);
	int GetClanPatternID(int row);
	string GetClanName(int row);
	int GetChannelNum(int row);
	string GetServerName(int row);
	int GetServerPort(int row);
	int GetCurPosInt(int row);
	int GetCurPos(int row);
	string GetServerIP(int row);
	int GetRoomNumber(int row);
	string GetUserName(int row);
	int GetLevel(int row);
	void LC1_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
};


// Class GUIWarfareControls.BTCMMessengerPCBangHK
// 0x0054 (0x047C - 0x0428)
class UBTCMMessengerPCBangHK : public UBTCMMessengerOnOffline
{
public:
	string                                             strContextMenuName[0x7];                                  // 0x0428(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTCMMessengerPCBangHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTACLMessengerClanHK
// 0x0024 (0x048C - 0x0468)
class UBTACLMessengerClanHK : public UBTACLMessengerCommon
{
public:
	struct FImage                                      CommonSizeImg;                                            // 0x0468(0x0020)
	class UBTRODecorateStringHK*                       btToolTip;                                                // 0x0488(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLMessengerClanHK");
		return ptr;
	}


	class UGUIToolTip* MultiColumnList_OnBeginToolTip();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SortByConnectionStatus();
	float GetItemHeight(class UCanvas* C);
	int GetLogOnState(int row);
	int GetLevelMarkID(int row);
	string GetSelfIntro(int row);
	int GetRoomNumber(int row);
	int GetChannelNum(int row);
	int GetServerPort(int row);
	string GetServerIP(int row);
	string GetUserName(int row);
	int GetCurPosInt(int row);
	string GetCurPos(int row);
	int GetCurState(int row);
	int GetLevel(int row);
	void SetCurState(int row, int Value);
	void SetChannelNumber(int row, int Value);
	void SetGameRoomNumber(int row, int Value);
	void SetServerName(int row, const string& Value);
	void SetServerIP(int row, const string& Value);
	void SetServerPort(int row, int Value);
	void SetChannelName(int row, const string& Value);
	void SetCurLocationName(int row, const string& Value);
	void SetCurpos(int row, int Value);
	void Internal_OnRendered(class UCanvas* Canvas);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
};


// Class GUIWarfareControls.BTCMMessengerClanHK
// 0x003C (0x0464 - 0x0428)
class UBTCMMessengerClanHK : public UBTCMMessengerOnOffline
{
public:
	string                                             strContextMenuName[0x5];                                  // 0x0428(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTCMMessengerClanHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTACLMessengerFriendHK
// 0x0020 (0x0488 - 0x0468)
class UBTACLMessengerFriendHK : public UBTACLMessengerCommon
{
public:
	struct FImage                                      CommonSizeImg;                                            // 0x0468(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLMessengerFriendHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	float GetItemHeight(class UCanvas* C);
	void SortByConnectionStatus();
	int GetLogOnState(int row);
	int GetLevelMarkID(int row);
	int GetClanNum(int row);
	struct FImage GetClanBL(int row);
	struct FImage GetClanBG(int row);
	struct FImage GetClanPattern(int row);
	int GetClanPatternID(int row);
	string GetClanName(int row);
	int GetChannelNum(int row);
	string GetServerName(int row);
	int GetServerPort(int row);
	int GetCurPosInt(int row);
	int GetCurState(int row);
	int GetCurPos(int row);
	string GetServerIP(int row);
	int GetRoomNumber(int row);
	string GetUserName(int row);
	int GetLevel(int row);
	void SetCurState(int row, int Value);
	void SetChannelNumber(int row, int Value);
	void SetGameRoomNumber(int row, int Value);
	void SetServerName(int row, const string& Value);
	void SetServerIP(int row, const string& Value);
	void SetServerPort(int row, int Value);
	void SetChannelName(int row, const string& Value);
	void SetCurLocationName(int row, const string& Value);
	void SetCurpos(int row, int Value);
	void LC1_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
};


// Class GUIWarfareControls.BTCMMessengerFriendHK
// 0x0060 (0x0488 - 0x0428)
class UBTCMMessengerFriendHK : public UBTCMMessengerOnOffline
{
public:
	string                                             strContextMenuName[0x8];                                  // 0x0428(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTCMMessengerFriendHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTACLMessengerChannelHK
// 0x0020 (0x0488 - 0x0468)
class UBTACLMessengerChannelHK : public UBTACLMessengerCommon
{
public:
	struct FImage                                      CommonSizeImg;                                            // 0x0468(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLMessengerChannelHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	float GetItemHeight(class UCanvas* C);
	int GetLevelMarkID(int row);
	struct FColor GetUserNameColor(int row, int idx);
	bool IsFriendlyUser(int row);
	int GetClanPatternID(int row);
	string GetUserName(int row);
	int GetUserID(int row);
	int GetLevel(int row);
	string GetClanName(int row);
	int GetClanID(int row);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
};


// Class GUIWarfareControls.BTCMMessengerChannelHK
// 0x0060 (0x0444 - 0x03E4)
class UBTCMMessengerChannelHK : public UBTContextMenuHK
{
public:
	string                                             strContextMenuName[0x8];                                  // 0x03E4(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTCMMessengerChannelHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowRequestFriendHK
// 0x0040 (0x0500 - 0x04C0)
class UBTWindowRequestFriendHK : public UBTWindowHK
{
public:
	class UBTOwnerDrawImageHK*                         LabelDivider;                                             // 0x04C0(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelInviteMsg;                                           // 0x04C4(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelEditMsg;                                             // 0x04C8(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTMultiLineEditBoxHK*                       MultiLineEditMsg;                                         // 0x04CC(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strInviteMsg;                                             // 0x04D0(0x000C) (Localized, NeedCtorLink)
	string[]                                           friendNames;                                              // 0x04DC(0x000C) (NeedCtorLink)
	int[]                                              friendUIDs;                                               // 0x04E8(0x000C) (NeedCtorLink)
	string[]                                           friendRequestMsg;                                         // 0x04F4(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowRequestFriendHK");
		return ptr;
	}


	void Opened(class UGUIComponent* Sender);
	void ApplyLocalizedStrings();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool IsExistFrinedList();
	bool CheckExistFriendList(int UID);
	void GetTopFriendInfo(string* friName, int* friID);
	void DelData();
	void UpdateData();
	void AddData(const string& UserName, int UID, const string& Msg);
	void SetData(const string& UserName, int UID, const string& Msg);
};


// Class GUIWarfareControls.BTTPOptionBaseHK
// 0x03C8 (0x0708 - 0x0340)
class UBTTPOptionBaseHK : public UBTTabPanelHK
{
public:
	string                                             strRound;                                                 // 0x0340(0x000C) (Localized, NeedCtorLink)
	string                                             strRank;                                                  // 0x034C(0x000C) (Localized, NeedCtorLink)
	string                                             strWin;                                                   // 0x0358(0x000C) (Localized, NeedCtorLink)
	string                                             strLose;                                                  // 0x0364(0x000C) (Localized, NeedCtorLink)
	string                                             strKill;                                                  // 0x0370(0x000C) (Localized, NeedCtorLink)
	string                                             strAssist;                                                // 0x037C(0x000C) (Localized, NeedCtorLink)
	string                                             strDeath;                                                 // 0x0388(0x000C) (Localized, NeedCtorLink)
	string                                             strHeadShot;                                              // 0x0394(0x000C) (Localized, NeedCtorLink)
	string                                             strNewRank;                                               // 0x03A0(0x000C) (Localized, NeedCtorLink)
	string                                             strNew;                                                   // 0x03AC(0x000C) (Localized, NeedCtorLink)
	string                                             strHour;                                                  // 0x03B8(0x000C) (Localized, NeedCtorLink)
	string                                             strMin;                                                   // 0x03C4(0x000C) (Localized, NeedCtorLink)
	string                                             strPoint;                                                 // 0x03D0(0x000C) (Localized, NeedCtorLink)
	string                                             strCash;                                                  // 0x03DC(0x000C) (Localized, NeedCtorLink)
	string                                             strDay;                                                   // 0x03E8(0x000C) (Localized, NeedCtorLink)
	string                                             strDiscon;                                                // 0x03F4(0x000C) (Localized, NeedCtorLink)
	string                                             strToolTip[0x22];                                         // 0x0400(0x000C) (Localized, NeedCtorLink)
	bool                                               bPositionChanged;                                         // 0x0598(0x0004)
	class UBTOwnerDrawImageHK*                         BackPanel;                                                // 0x059C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                ItemWidth;                                                // 0x05A0(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                ItemHeight;                                               // 0x05A4(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                LabelWidth;                                               // 0x05A8(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbACLList;                                                // 0x05AC(0x0010)
	class UBTAutoImageListNew*                         ACLList;                                                  // 0x05BC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbVisibleComponent[0x11];                                 // 0x05C0(0x0010)
	struct FFloatBox[]                                 InternalPadding;                                          // 0x06D0(0x000C) (NeedCtorLink)
	class UBTOwnerDrawImageHK*[]                       Label;                                                    // 0x06DC(0x000C) (NeedCtorLink)
	class UGUIComponent*[]                             Content;                                                  // 0x06E8(0x000C) (NeedCtorLink)
	bool                                               bToolTipVisible;                                          // 0x06F4(0x0004)
	class UBTRODecorateStringHK*                       btToolTip;                                                // 0x06F8(0x0004)
	int                                                WatchedIndex;                                             // 0x06FC(0x0004)
	struct FScriptDelegate                             __Content_AWinPos_Changed__Delegate;                      // 0x0700(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPOptionBaseHK");
		return ptr;
	}


	void ACLList_PositionChanged(int NewPos);
	struct FFloatBox Content_AWinPos_Changed(int contentindex, int visiblecomponentindex, const struct FFloatBox& fb);
	void Internal_OnRendered(class UCanvas* Canvas);
	bool Internal_OnPreDraw(class UCanvas* C);
	bool Internal_OnClick(class UGUIComponent* Sender);
	bool OptionBase_OnKeyEvent(float Delta, byte* key, byte* Action);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void PostChangeScrollBarPos();
};


// Class GUIWarfareControls.BTTPOptionGraphicAdvanceHK
// 0x0230 (0x0938 - 0x0708)
class UBTTPOptionGraphicAdvanceHK : public UBTTPOptionBaseHK
{
public:
	bool                                               bSupportPS30;                                             // 0x0708(0x0004)
	bool                                               bSupportR32;                                              // 0x0708(0x0004)
	bool                                               bSupportMRT;                                              // 0x0708(0x0004)
	bool                                               bSupportHWShadowMap;                                      // 0x0708(0x0004)
	bool                                               bShowAAWarning;                                           // 0x0708(0x0004)
	string                                             strAntiAliasing[0x4];                                     // 0x070C(0x000C) (Localized, NeedCtorLink)
	string                                             strLow;                                                   // 0x073C(0x000C) (Localized, NeedCtorLink)
	string                                             strHigh;                                                  // 0x0748(0x000C) (Localized, NeedCtorLink)
	string                                             strLabel[0x10];                                           // 0x0754(0x000C) (Localized, NeedCtorLink)
	string                                             strAnisortropy;                                           // 0x0814(0x000C) (Localized, NeedCtorLink)
	struct FOptionGraphicAdvanceInfo                   InitInfo;                                                 // 0x0820(0x0028)
	struct FOptionGraphicAdvanceInfo                   CurrentInfo;                                              // 0x0848(0x0028)
	struct FOptionGraphicAdvanceInfo                   PredefineAdvanceSettings[0x5];                            // 0x0870(0x0028) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPOptionGraphicAdvanceHK");
		return ptr;
	}


	void InitializeContent();
	void OnHide_ComboBoxList();
	void OnShow_ComboBoxList();
	void Content17_OnSelect(bool bOn);
	void Content16_OnChangeValue(int changeValue);
	void Content15_OnChangeValue(int changeValue);
	void Content14_OnSelect(bool bOn);
	void Content12_OnSelect(bool bOn);
	void Content11_OnSelect(bool bOn);
	void Content10_OnSelect(bool bOn);
	void Content9_OnSelect(bool bOn);
	void Content7_OnSelect(bool bOn);
	void Content6_OnSelect(bool bOn);
	void Content8_OnSelect(bool bOn);
	void Content5_OnChangeValue(class UGUIComponent* Sender);
	void Content4_OnChangeValue(class UGUIComponent* Sender);
	bool Content3_OnChangeValue(class UGUIComponent* Sender);
	bool Content2_OnChangeValue(class UGUIComponent* Sender);
	bool Content1_OnChangeValue(class UGUIComponent* Sender);
	bool Content0_OnChangeValue(class UGUIComponent* Sender);
	void InitializeLabel();
	void LoadData();
	struct FOptionGraphicAdvanceInfo STATIC_GetDefaultTestAdvanceSettings(class APlayerController* PC);
	struct FOptionGraphicAdvanceInfo STATIC_GetPredefineAdvanceSettings(class APlayerController* PC, int Index);
	bool STATIC_SetAdvanceSettings(class APlayerController* PC, const struct FOptionGraphicAdvanceInfo& CurrentInfo, const struct FOptionGraphicAdvanceInfo& InitInfo, bool bIsOwner, bool bForceSettings);
	struct FOptionGraphicAdvanceInfo STATIC_GetAdvanceSettings(class APlayerController* PC);
	void SaveData();
	void ResetData();
	void InitData();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPMyInfoHK
// 0x0118 (0x0448 - 0x0330)
class UBTTPMyInfoHK : public UGUITabPanel
{
public:
	int                                                titleFontSize;                                            // 0x0330(0x0004)
	int                                                defaultFontSize;                                          // 0x0334(0x0004)
	class UBTROClanMarkHK*                             roClanMark;                                               // 0x0338(0x0004)
	struct FImage                                      LevelImg;                                                 // 0x033C(0x0020)
	string                                             myName;                                                   // 0x035C(0x000C) (NeedCtorLink)
	string                                             ClanName;                                                 // 0x0368(0x000C) (NeedCtorLink)
	int                                                Ranking;                                                  // 0x0374(0x0004)
	int                                                CurExp;                                                   // 0x0378(0x0004)
	int                                                maxExp;                                                   // 0x037C(0x0004)
	string                                             expPerc;                                                  // 0x0380(0x000C) (NeedCtorLink)
	int                                                Point;                                                    // 0x038C(0x0004)
	int                                                Cash;                                                     // 0x0390(0x0004)
	int                                                recordWin;                                                // 0x0394(0x0004)
	int                                                recordLose;                                               // 0x0398(0x0004)
	struct FColor                                      MenuColor;                                                // 0x039C(0x0004)
	struct FColor                                      DescColor;                                                // 0x03A0(0x0004)
	string                                             strClan;                                                  // 0x03A4(0x000C) (Localized, NeedCtorLink)
	string                                             strRanking[0x2];                                          // 0x03B0(0x000C) (Localized, NeedCtorLink)
	string                                             strExp;                                                   // 0x03C8(0x000C) (Localized, NeedCtorLink)
	string                                             strPoint;                                                 // 0x03D4(0x000C) (Localized, NeedCtorLink)
	string                                             strRecord;                                                // 0x03E0(0x000C) (Localized, NeedCtorLink)
	string                                             strWin;                                                   // 0x03EC(0x000C) (Localized, NeedCtorLink)
	string                                             strLose;                                                  // 0x03F8(0x000C) (Localized, NeedCtorLink)
	string                                             strWinLose;                                               // 0x0404(0x000C) (NeedCtorLink)
	struct FText                                       tPoint;                                                   // 0x0410(0x001C) (NeedCtorLink)
	struct FText[]                                     taRanking;                                                // 0x042C(0x000C) (NeedCtorLink)
	struct FText[]                                     taExpbar;                                                 // 0x0438(0x000C) (NeedCtorLink)
	class UBTROExpBarHK*                               roExpBar;                                                 // 0x0444(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPMyInfoHK");
		return ptr;
	}


	void OnRendered(class UCanvas* C);
	void SetMyInfoA(const string& CharName, int Level, int CurExp, int startExp, int maxExp, int LevelMarkID);
	void SetClanInfo(const string& ClanName, int ClanPattern, int ClanBG, int ClanBL, int ClanLevel);
	void SetRankingInfo(int Ranking, int Win, int Lose);
	void SetMoneyInfo(int P, int C);
	void SetMyInfo(const string& CharName, const string& ClanName, const struct FCharInfo& cInfo);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPMyInfoHKCN
// 0x0004 (0x044C - 0x0448)
class UBTTPMyInfoHKCN : public UBTTPMyInfoHK
{
public:
	class UBTROExpBarHKCN*                             expbar;                                                   // 0x0448(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPMyInfoHKCN");
		return ptr;
	}


	void OnRendered(class UCanvas* C);
	void SetMyInfoA(const string& CharName, int Level, int CurExp, int startExp, int maxExp, int LevelMarkID);
	void SetClanInfo(const string& ClanName, int ClanPattern, int ClanBG, int ClanBL, int ClanLevel);
	void SetRankingInfo(int Ranking, int Win, int Lose);
	void SetMoneyInfo(int P, int C);
	void SetMyInfo(const string& CharName, const string& ClanName, const struct FCharInfo& cInfo);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPRoomInfoHK
// 0x019C (0x04DC - 0x0340)
class UBTTPRoomInfoHK : public UBTTabPanelHK
{
public:
	string                                             MapName;                                                  // 0x0340(0x000C) (NeedCtorLink)
	int                                                Diffcult;                                                 // 0x034C(0x0004)
	int                                                ModeNum;                                                  // 0x0350(0x0004)
	int                                                WeaponLimit;                                              // 0x0354(0x0004)
	string                                             ModeName;                                                 // 0x0358(0x000C) (NeedCtorLink)
	bool                                               bHardCore;                                                // 0x0364(0x0004)
	string                                             HardCore;                                                 // 0x0368(0x000C) (NeedCtorLink)
	string                                             GameTime;                                                 // 0x0374(0x000C) (NeedCtorLink)
	string                                             TargetScore;                                              // 0x0380(0x000C) (NeedCtorLink)
	string                                             UserCount;                                                // 0x038C(0x000C) (NeedCtorLink)
	struct FImage                                      MapImage;                                                 // 0x0398(0x0020)
	struct FImage                                      ImageSupply[0x3];                                         // 0x03B8(0x0020)
	string                                             strButtonRoomInfo[0x2];                                   // 0x0418(0x000C) (Localized, NeedCtorLink)
	string                                             strHardCore;                                              // 0x0430(0x000C) (Localized, NeedCtorLink)
	string                                             strGameTime;                                              // 0x043C(0x000C) (Localized, NeedCtorLink)
	string                                             strTargetScore;                                           // 0x0448(0x000C) (Localized, NeedCtorLink)
	string                                             strUserCount;                                             // 0x0454(0x000C) (Localized, NeedCtorLink)
	string                                             strDifficult[0x6];                                        // 0x0460(0x000C) (Localized, NeedCtorLink)
	string                                             strWeaponLimit;                                           // 0x04A8(0x000C) (Localized, NeedCtorLink)
	string                                             strAlienModeLimit;                                        // 0x04B4(0x000C) (Localized, NeedCtorLink)
	string                                             strBotModeUserTeam[0x2];                                  // 0x04C0(0x000C) (NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRoomInfo;                                           // 0x04D8(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPRoomInfoHK");
		return ptr;
	}


	void Internal_OnRender(class UCanvas* C);
	void ChageRoomInfoButton(bool bOwner);
	void SetData(const string& sMapName, const string& sMapImageName, const string& sModeName, bool sbHardCore, const string& sGameTime, const string& sTargetScore, const string& sUserCount, int iModeNum, int iDiffcult, int WeaponLimit, int BotUserTeam);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPChatHKCN
// 0x0030 (0x0468 - 0x0438)
class UBTTPChatHKCN : public UBTTPChatHK
{
public:
	struct FFloatBox                                   fChatTab[0x3];                                            // 0x0438(0x0010)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPChatHKCN");
		return ptr;
	}


	bool Internal_OnPreDraw(class UCanvas* C);
	bool ButtonChatState_OnClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTLabelTutorialQuestInfoHK
// 0x00C0 (0x047C - 0x03BC)
class UBTLabelTutorialQuestInfoHK : public UBTOwnerDrawImageHK
{
public:
	float                                              StayTime;                                                 // 0x03BC(0x0004)
	int                                                Phase;                                                    // 0x03C0(0x0004)
	float                                              Alpha;                                                    // 0x03C4(0x0004)
	class UBTACLQuestHK*                               ACLQuest;                                                 // 0x03C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FText                                       txtQuestDesc;                                             // 0x03CC(0x001C) (NeedCtorLink)
	struct FText                                       txtQuestExtDesc;                                          // 0x03E8(0x001C) (NeedCtorLink)
	struct FText                                       txtReward;                                                // 0x0404(0x001C) (NeedCtorLink)
	struct FText                                       txtLastReward;                                            // 0x0420(0x001C) (NeedCtorLink)
	struct FImage                                      Exclamation;                                              // 0x043C(0x0020)
	struct FImage                                      HelpResource;                                             // 0x045C(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTLabelTutorialQuestInfoHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	bool Internal_OnClick(class UGUIComponent* Sender);
	void StartShow();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowRoomInfoHK
// 0x068C (0x0B4C - 0x04C0)
class UBTWindowRoomInfoHK : public UBTWindowHK
{
public:
	struct FUIRoomInfoStruct                           UIRoomInfo;                                               // 0x04C0(0x0050) (NeedCtorLink)
	struct FUIRoomInfoStruct                           UIRoomInfo_Default;                                       // 0x0510(0x0050) (NeedCtorLink)
	class UwMatchMaker*                                MatchMaker;                                               // 0x0560(0x0004) (Transient)
	struct FGameModeInfo[]                             GameModeInfos;                                            // 0x0564(0x000C) (NeedCtorLink)
	struct FFloatBox                                   fbSeparator;                                              // 0x0570(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Separator;                                                // 0x0580(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelCommonTop[0x9];                                    // 0x0584(0x0010)
	string                                             strLabelCommonTop[0x9];                                   // 0x0614(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         LabelCommonTop[0x9];                                      // 0x0680(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelCommonBottom[0x7];                                 // 0x06A4(0x0010)
	string                                             strLabelCommonBottom[0x7];                                // 0x0714(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         LabelCommonBottom[0x7];                                   // 0x0768(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelAdd[0x4];                                          // 0x0784(0x0010)
	class UBTOwnerDrawImageHK*                         LabelAdd[0x4];                                            // 0x07C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabelSwitchSide;                                       // 0x07D4(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelBombPossesion;                                    // 0x07E0(0x000C) (Localized, NeedCtorLink)
	string                                             strBombForEveryone;                                       // 0x07EC(0x000C) (Localized, NeedCtorLink)
	string                                             strBombForOne;                                            // 0x07F8(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelChangeAD;                                         // 0x0804(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelChangeRound;                                      // 0x0810(0x000C) (Localized, NeedCtorLink)
	string                                             strUserCount;                                             // 0x081C(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelBot_UserTeam[0x4];                                // 0x0828(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelBot_Difficult[0x6];                               // 0x0858(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelBot_AF[0x2];                                      // 0x08A0(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelBot_RSA[0x2];                                     // 0x08B8(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbEdit[0x2];                                              // 0x08D0(0x0010)
	struct FFloatBox                                   fbLabelEdit[0x2];                                         // 0x08F0(0x0010)
	class UBTOwnerDrawImageHK*                         LabelEdit[0x2];                                           // 0x0910(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTEditBoxHK*                                Edit[0x2];                                                // 0x0918(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTEditBoxHK*                                EditRoomName;                                             // 0x0920(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTEditBoxHK*                                EditPassword;                                             // 0x0924(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbCombo[0x7];                                             // 0x0928(0x0010)
	struct FFloatBox                                   fbComboAdd[0x4];                                          // 0x0998(0x0010)
	class UBTComboBoxHK*                               Combo[0x7];                                               // 0x09D8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboAdd[0x4];                                            // 0x09F4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxMapHK*                            ComboMap;                                                 // 0x0A04(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboGameMode;                                            // 0x0A08(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboGameTime;                                            // 0x0A0C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboWeaponRestriction;                                   // 0x0A10(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboUserCount;                                           // 0x0A14(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboTargetScore;                                         // 0x0A18(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboIsHardCore;                                          // 0x0A1C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboSwitchSide;                                          // 0x0A20(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboBombPossesion;                                       // 0x0A24(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboChangeAD;                                            // 0x0A28(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboChangeRound;                                         // 0x0A2C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboBot_UserTeam;                                        // 0x0A30(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboBot_Diffcult;                                        // 0x0A34(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboBot_AF;                                              // 0x0A38(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboBot_RSA;                                             // 0x0A3C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbRadio[0x7];                                             // 0x0A40(0x0010)
	class UBTRadioOnOffButtonHK*                       Radio[0x7];                                               // 0x0AB0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTRadioOnOffButtonHK*                       RadioTeamDamage;                                          // 0x0ACC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTRadioOnOffButtonHK*                       RadioFreeCamera;                                          // 0x0AD0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTRadioOnOffButtonHK*                       RadioTeamBalance;                                         // 0x0AD4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTRadioOnOffButtonHK*                       RadioKillCam;                                             // 0x0AD8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTRadioOnOffButtonHK*                       RadioJoinInPlaying;                                       // 0x0ADC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTRadioOnOffButtonHK*                       RadioVoiceChatting;                                       // 0x0AE0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTRadioOnOffButtonHK*                       RadioVote;                                                // 0x0AE4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         ImageMap;                                                 // 0x0AE8(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         ImageSupply[0x3];                                         // 0x0AEC(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         NewMapIcon;                                               // 0x0AF8(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTRadioOnOffButtonHK*                       ReSpawnRadioBtn;                                          // 0x0AFC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbReSpawnRadio;                                           // 0x0B00(0x0010)
	string                                             CaptionReSpawn;                                           // 0x0B10(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionRandom;                                            // 0x0B1C(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionFixed;                                             // 0x0B28(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         LabelReSpawn;                                             // 0x0B34(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fLabelReSpawn;                                            // 0x0B38(0x0010)
	bool                                               bEnableFillModeList;                                      // 0x0B48(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowRoomInfoHK");
		return ptr;
	}


	void FloatingRendered(class UCanvas* C);
	int GetBotModeUserTeam();
	int GetBotModeDifficulty();
	int GetRSABotCount();
	int GetAFBotCount();
	int IsPlayWithBots();
	int GetIsHardCore();
	string GetTargetScore();
	int GetWeaponRestrictionIndex();
	string GetGameTime();
	string GetUserCount();
	int GetMapIndex();
	string GetMap();
	int GetGameModeIndex();
	string GetGameModeClass();
	bool GetMultiBomb();
	void ComboBot_RSA_OnChange(class UGUIComponent* Sender);
	void ComboBot_AF_OnChange(class UGUIComponent* Sender);
	void ComboWeaponRest_OnChange(class UGUIComponent* Sender);
	void ComboBot_Diffcult_OnChange(class UGUIComponent* Sender);
	void ComboBot_UserTeam_OnChange(class UGUIComponent* Sender);
	void ComboBombPossesion_OnChange(class UGUIComponent* Sender);
	void ComboUserCount_OnChange(class UGUIComponent* Sender);
	void ChangeComboAdd();
	void ComboGameMode_OnChange(class UGUIComponent* Sender);
	void SetGameMode_DefaultSettings(int cur);
	void SetRespawnTypebyGameMode(int nMode);
	void ComboMap_OnChange(class UGUIComponent* Sender);
	void SetRadioRespawnType(int RespawnType);
	void ComboTargetScore_OnChange(class UGUIComponent* Sender);
	void ComboGameTime_OnChange(class UGUIComponent* Sender);
	void UpdateRespawnStatus();
	void FillData();
	void EndFillData();
	void BeginFillData();
	void FillIsHardCore();
	void SetWeaponRestriction(int Value);
	void FillWeaponRestriction();
	void FillUserCountRalRalRa(bool bInvisibleodd);
	void SetUserCount(int usercnt);
	void FillTargetScore();
	void FillGameTime();
	void FillDefaultGameTimeAndScore();
	void FillGameMode();
	void InitGameModeSetting();
	void FillMap();
	int GetMapIDFromComboIndex(int idx);
	int GetSelectedMapID();
	void InitializeRadioButton();
	void InitializeComboBox();
	void InitializeEditBox();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitializeRoomInfoStruct(class UwMatchMaker* MM);
};


// Class GUIWarfareControls.BTRadioOnOffButtonHK
// 0x0018 (0x0358 - 0x0340)
class UBTRadioOnOffButtonHK : public UBTTabPanelHK
{
public:
	class UButtonGroups*                               Group;                                                    // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTCheckBoxHK*                               ButtonOff;                                                // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTCheckBoxHK*                               ButtonOn;                                                 // 0x0348(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                OnOffSpaceRange;                                          // 0x034C(0x0004)
	struct FScriptDelegate                             __OnSelect__Delegate;                                     // 0x0350(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTRadioOnOffButtonHK");
		return ptr;
	}


	bool ButtonGroups_OnClick(class UGUIComponent* Sender);
	void OnSelect(bool bOn);
	bool getData();
	void SetData(bool bOn);
	void ApplyAWinPos();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.RenderObject
// 0x0014 (0x0040 - 0x002C)
class URenderObject : public UObject
{
public:
	struct FFloatBox                                   AWinPos;                                                  // 0x002C(0x0010)
	bool                                               bVisible;                                                 // 0x003C(0x0004)
	bool                                               bMouseOn;                                                 // 0x003C(0x0004)
	bool                                               bFocused;                                                 // 0x003C(0x0004)
	bool                                               bvisibleBtn;                                              // 0x003C(0x0004)
	bool                                               bMouseClick;                                              // 0x003C(0x0004)
	bool                                               bMouseRelease;                                            // 0x003C(0x0004)
	bool                                               bQuickSlot;                                               // 0x003C(0x0004)
	bool                                               bNeedUpdate;                                              // 0x003C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.RenderObject");
		return ptr;
	}


	bool Render(class UCanvas* C, float Delta);
	void Update(class UCanvas* C, float Delta);
	bool CheckIn(float X, float Y, float ClientRatioX, float ClientRatioY);
	void Init();
};


// Class GUIWarfareControls.BTRODecorateStringHK
// 0x0064 (0x00A4 - 0x0040)
class UBTRODecorateStringHK : public URenderObject
{
public:
	struct FText                                       OriginalString;                                           // 0x0040(0x001C) (NeedCtorLink)
	string[]                                           TargetString;                                             // 0x005C(0x000C) (NeedCtorLink)
	struct FImage                                      BackgroundImg;                                            // 0x0068(0x0020)
	int                                                InternalPadding[0x4];                                     // 0x0088(0x0004)
	float                                              TextHeight;                                               // 0x0098(0x0004)
	bool                                               bAutoWidth;                                               // 0x009C(0x0004)
	int                                                nAutoWidth;                                               // 0x00A0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTRODecorateStringHK");
		return ptr;
	}


	bool Render(class UCanvas* C, float Delta);
	void Update(class UCanvas* C, float Delta);
	void SetData(const string& str);
	void Init();
};


// Class GUIWarfareControls.BTScrollString
// 0x0024 (0x0050 - 0x002C)
class UBTScrollString : public UObject
{
public:
	class UBTScrollProcess*                            ScrollProcess;                                            // 0x002C(0x0004)
	bool                                               cullRight;                                                // 0x0030(0x0004)
	string                                             OriginalCaption;                                          // 0x0034(0x000C) (NeedCtorLink)
	struct FFloatBox                                   fbCull;                                                   // 0x0040(0x0010)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTScrollString");
		return ptr;
	}


	void CaptionLeftRight(class UCanvas* C, const string& Caption, const struct FFloatBox& originPos, float FontSize);
	void Internal_OnNextAnimationStart();
	void ProcessScroll(class UCanvas* C, const string& OriginString, const struct FFloatBox& originPos, bool bOn, float FontSize, float fDelta, string* outputString);
	void ProcessScrollPoint(class UCanvas* C, const string& OriginString, float X1, float Y1, float X2, float Y2, bool bOn, float FontSize, float fDelta, string* outputString);
	void InitValue();
};


// Class GUIWarfareControls.BTComboBoxButtonHK
// 0x00A0 (0x03A8 - 0x0308)
class UBTComboBoxButtonHK : public UGUIScrollButtonBase
{
public:
	struct FImage                                      buttonImage[0x5];                                         // 0x0308(0x0020) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTComboBoxButtonHK");
		return ptr;
	}


	bool OwnerDraw(class UCanvas* C);
};


// Class GUIWarfareControls.BTScrollZoneHK
// 0x0020 (0x02E4 - 0x02C4)
class UBTScrollZoneHK : public UGUIScrollZoneBase
{
public:
	struct FImage                                      zoneImage;                                                // 0x02C4(0x0020) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTScrollZoneHK");
		return ptr;
	}


	bool OwnerDraw(class UCanvas* C);
};


// Class GUIWarfareControls.BTScrollButtonHK
// 0x00C0 (0x03C8 - 0x0308)
class UBTScrollButtonHK : public UGUIScrollButtonBase
{
public:
	struct FImage                                      buttonImage[0x6];                                         // 0x0308(0x0020) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTScrollButtonHK");
		return ptr;
	}


	bool OwnerDraw(class UCanvas* C);
};


// Class GUIWarfareControls.BTGripButtonHK
// 0x00A0 (0x03A4 - 0x0304)
class UBTGripButtonHK : public UGUIGripButtonBase
{
public:
	struct FImage                                      buttonImage[0x5];                                         // 0x0304(0x0020) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTGripButtonHK");
		return ptr;
	}


	bool OwnerDraw(class UCanvas* C);
};


// Class GUIWarfareControls.BTROItemBoxHK
// 0x05CC (0x060C - 0x0040)
class UBTROItemBoxHK : public URenderObject
{
public:
	class UwMatchMaker*                                MM;                                                       // 0x0040(0x0004)
	class UwGameManager*                               GameMgr;                                                  // 0x0044(0x0004)
	bool                                               bUseCache;                                                // 0x0048(0x0004)
	int                                                RibbonState;                                              // 0x004C(0x0004)
	bool                                               bSelect;                                                  // 0x0050(0x0004)
	bool                                               bStartAni;                                                // 0x0050(0x0004)
	float                                              RollAniStep;                                              // 0x0054(0x0004)
	int                                                RollCount;                                                // 0x0058(0x0004)
	int                                                RollMaxCount;                                             // 0x005C(0x0004)
	float                                              RollStartX;                                               // 0x0060(0x0004)
	bool                                               bScaleAni;                                                // 0x0064(0x0004)
	float                                              ScaleAniStep;                                             // 0x0068(0x0004)
	float                                              ScaleStartX;                                              // 0x006C(0x0004)
	bool                                               bDragMode;                                                // 0x0070(0x0004)
	bool                                               bRedAuction;                                              // 0x0070(0x0004)
	bool                                               bRedState;                                                // 0x0070(0x0004)
	bool                                               bNoReasonRedState;                                        // 0x0070(0x0004)
	bool                                               bDisplayPart;                                             // 0x0070(0x0004)
	struct FText                                       PartName;                                                 // 0x0074(0x001C) (NeedCtorLink)
	string                                             PartSkillName;                                            // 0x0090(0x000C) (NeedCtorLink)
	struct FImage                                      PartImage;                                                // 0x009C(0x0020)
	struct FImage                                      PaintImage;                                               // 0x00BC(0x0020)
	class UwItemBoxHK*                                 ItemInfo;                                                 // 0x00DC(0x0004)
	class UwItemBoxInstanceHK*                         instanceInfo;                                             // 0x00E0(0x0004)
	string                                             strItemName;                                              // 0x00E4(0x000C) (NeedCtorLink)
	struct FText                                       ItemName;                                                 // 0x00F0(0x001C) (NeedCtorLink)
	struct FText                                       GradeName;                                                // 0x010C(0x001C) (NeedCtorLink)
	struct FText                                       UnderTextForm;                                            // 0x0128(0x001C) (NeedCtorLink)
	struct FText                                       UnderExtraTextForm;                                       // 0x0144(0x001C) (NeedCtorLink)
	struct FText                                       DisCountPriceTextForm;                                    // 0x0160(0x001C) (NeedCtorLink)
	struct FImage                                      DisCountStrikeImg;                                        // 0x017C(0x0020)
	struct FImage                                      ItemImage;                                                // 0x019C(0x0020)
	struct FImage                                      EquipLevelImage;                                          // 0x01BC(0x0020)
	class UBTROExpBarHK*                               ItemDurability;                                           // 0x01DC(0x0004)
	struct FImage                                      RepairIconImage;                                          // 0x01E0(0x0020)
	struct FImage                                      CashIconImage;                                            // 0x0200(0x0020)
	struct FImage                                      PointIconImage;                                           // 0x0220(0x0020)
	struct FImage                                      Img_Selected;                                             // 0x0240(0x0020)
	struct FImage                                      Img_MouseOn;                                              // 0x0260(0x0020)
	struct FImage                                      Img_Focus;                                                // 0x0280(0x0020)
	struct FImage                                      Img_Normal;                                               // 0x02A0(0x0020)
	bool                                               MouseOnWithNormal;                                        // 0x02C0(0x0004)
	bool                                               bDotSight;                                                // 0x02C0(0x0004)
	bool                                               bScope;                                                   // 0x02C0(0x0004)
	bool                                               bSilencer;                                                // 0x02C0(0x0004)
	bool                                               bSkill;                                                   // 0x02C0(0x0004)
	bool                                               bBarrel;                                                  // 0x02C0(0x0004)
	bool                                               bGunstock;                                                // 0x02C0(0x0004)
	struct FImage                                      dotImg;                                                   // 0x02C4(0x0020)
	struct FImage                                      scoImg;                                                   // 0x02E4(0x0020)
	struct FImage                                      silImg;                                                   // 0x0304(0x0020)
	struct FImage                                      skiImg;                                                   // 0x0324(0x0020)
	struct FImage                                      BarrelImg;                                                // 0x0344(0x0020)
	struct FImage                                      GunstockImg;                                              // 0x0364(0x0020)
	bool                                               bShowNotShopItem;                                         // 0x0384(0x0004)
	bool                                               bShowPCBangLevel;                                         // 0x0384(0x0004)
	bool                                               bShowLeftCount;                                           // 0x0384(0x0004)
	bool                                               bShowLeftSellDate;                                        // 0x0384(0x0004)
	bool                                               bShowCanRepair;                                           // 0x0384(0x0004)
	bool                                               bShowCanBuy;                                              // 0x0384(0x0004)
	bool                                               bBackgroundInfo;                                          // 0x0384(0x0004)
	bool                                               bShowDurability;                                          // 0x0384(0x0004)
	bool                                               bShowPrice;                                               // 0x0384(0x0004)
	bool                                               bShowDamage;                                              // 0x0384(0x0004)
	bool                                               bShowEquipLevel;                                          // 0x0384(0x0004)
	bool                                               bShowRestrictionLevel;                                    // 0x0384(0x0004)
	bool                                               bShowRestrictionPrice;                                    // 0x0384(0x0004)
	bool                                               bShowRestrictionDurability;                               // 0x0384(0x0004)
	class UBTItemCommonInfoHK*                         MyData;                                                   // 0x0388(0x0004)
	struct FColor                                      colCurrentUntilTime;                                      // 0x038C(0x0004)
	string                                             strCurrentUntilTime;                                      // 0x0390(0x000C) (NeedCtorLink)
	string                                             strLeftCount;                                             // 0x039C(0x000C) (Localized, NeedCtorLink)
	string                                             strCannotRepair;                                          // 0x03A8(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeBase;                                             // 0x03B4(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeShop;                                             // 0x03C0(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeCommon;                                           // 0x03CC(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeNormal;                                           // 0x03D8(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeHigh;                                             // 0x03E4(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeRare;                                             // 0x03F0(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeLegend;                                           // 0x03FC(0x000C) (Localized, NeedCtorLink)
	string                                             strGradePCBang;                                           // 0x0408(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeBaseS;                                            // 0x0414(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeShopS;                                            // 0x0420(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeCommonS;                                          // 0x042C(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeNormalS;                                          // 0x0438(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeHighS;                                            // 0x0444(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeRareS;                                            // 0x0450(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeLegendS;                                          // 0x045C(0x000C) (Localized, NeedCtorLink)
	string                                             strGradePCBangS;                                          // 0x0468(0x000C) (Localized, NeedCtorLink)
	string                                             strDurability;                                            // 0x0474(0x000C) (Localized, NeedCtorLink)
	string                                             strDamage;                                                // 0x0480(0x000C) (Localized, NeedCtorLink)
	string                                             strLeftTime[0x6];                                         // 0x048C(0x000C) (Localized, NeedCtorLink)
	string                                             strPoint;                                                 // 0x04D4(0x000C) (Localized, NeedCtorLink)
	string                                             strCash;                                                  // 0x04E0(0x000C) (Localized, NeedCtorLink)
	string                                             strOneDay;                                                // 0x04EC(0x000C) (Localized, NeedCtorLink)
	string                                             strCannotBuy;                                             // 0x04F8(0x000C) (Localized, NeedCtorLink)
	string                                             strDurabilityX;                                           // 0x0504(0x000C) (Localized, NeedCtorLink)
	string                                             strCannotExpired;                                         // 0x0510(0x000C) (Localized, NeedCtorLink)
	string                                             strOnlyPCoin;                                             // 0x051C(0x000C) (Localized, NeedCtorLink)
	string                                             strItemCount;                                             // 0x0528(0x000C) (Localized, NeedCtorLink)
	int                                                RRIndex;                                                  // 0x0534(0x0004)
	bool                                               bRegisterQuickSlot;                                       // 0x0538(0x0004)
	string                                             strRestrictionReason[0x8];                                // 0x053C(0x000C) (Localized, NeedCtorLink)
	string                                             strActiveSkillToolTip[0x5];                               // 0x059C(0x000C) (Localized, NeedCtorLink)
	bool                                               bShowModifyIcon;                                          // 0x05D8(0x0004)
	struct FFloatBox                                   offset;                                                   // 0x05DC(0x0010)
	struct FFloatBox                                   fbItemName;                                               // 0x05EC(0x0010)
	bool                                               CheckScrollItemName;                                      // 0x05FC(0x0004)
	class UBTScrollString*                             scrollString;                                             // 0x0600(0x0004)
	bool                                               isShowIcon;                                               // 0x0604(0x0004)
	EBTROItemBoxHK_EInvenState                         InvenState;                                               // 0x0608(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0609(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROItemBoxHK");
		return ptr;
	}


	bool CanGift();
	void CheckItemNameFloatBox(class UCanvas* C);
	void GetTimeStringOneStep(const struct FColor& DefaultColor, string* outputString, struct FColor* outputColor);
	void GetTimeString(string* outputString, struct FColor* outputColor);
	void GetExtraItemString(string* outputString, struct FColor* outputColor);
	void RenderSkillType(class UCanvas* C, const struct FFloatBox& fbItemImage);
	bool CheckInItemImage(int X, int Y);
	struct FFloatBox GetItemImageBox();
	string GetCoinAppendString(bool onlyPCoin);
	void SetGameManager(class UwGameManager* GM);
	void SetMatchMaker(class UwMatchMaker* wMM);
	void CheckRedAuction();
	bool Render(class UCanvas* C, float Delta);
	bool RenderModifyIcon(class UCanvas* C, int Sort, const struct FFloatBox& offset);
	void Update(class UCanvas* C, float Delta);
	bool IsEmpty();
	void UpdateTime(const struct FBtrDouble& D);
	string GradeToShortText(int Grade);
	string GradeToText(int Grade);
	struct FColor GradeToColor(int Grade, bool bDurabilityX);
	void Init();
	void ChangeState(EBTROItemBoxHK_EInvenState estate);
};


// Class GUIWarfareControls.BTAutoImageListHK
// 0x0054 (0x0384 - 0x0330)
class UBTAutoImageListHK : public UGUITabPanel
{
public:
	bool                                               bIgnoreMouseOnState;                                      // 0x0330(0x0004)
	bool                                               bIgnoreFocusedState;                                      // 0x0330(0x0004)
	class UBTOwnerDrawImageHK*                         BackgroundImage;                                          // 0x0334(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         BackgroundPattern;                                        // 0x0338(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                FixedItemWidth;                                           // 0x033C(0x0004)
	int                                                FixedItemHeight;                                          // 0x0340(0x0004)
	int                                                FixedSubBtnStartX;                                        // 0x0344(0x0004)
	int                                                FixedSubBtnStartY;                                        // 0x0348(0x0004)
	int                                                SelectItemIndex;                                          // 0x034C(0x0004)
	int                                                LastSelectedItemIndex;                                    // 0x0350(0x0004)
	int                                                VolatileSelectItemIndex;                                  // 0x0354(0x0004)
	class UGUIVertImageListBox*                        ImageListBox;                                             // 0x0358(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIVertImageList*                           ImageList;                                                // 0x035C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class URenderObject*[]                             DataList;                                                 // 0x0360(0x000C) (NeedCtorLink)
	bool                                               isHaveSubMenuBtn;                                         // 0x036C(0x0004)
	class UBTItemListMenuBtn*[]                        SubMenuBtn;                                               // 0x0370(0x000C) (NeedCtorLink)
	class UBTRODecorateStringHK*                       ItemToolTip;                                              // 0x037C(0x0004)
	bool                                               bShowSkillToolTip;                                        // 0x0380(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTAutoImageListHK");
		return ptr;
	}


	void AddSubMenuBtn(int ItemID, int enableType, bool disableBtn, const struct FBtrDouble& UniqueID, int UniqueSkillID);
	bool ImageListBox_OnItemDblClick(class UGUIComponent* Sender);
	void ImageListBox_OnChange(class UGUIComponent* Sender);
	void CheckSubMenuBtn(int ItemIndex, int extraIndex, int ClickIndex, bool disableBtn, bool bActive);
	void ImageListBox_OnDrawItem(class UCanvas* C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending);
	void ImageListBox_OnRendered(class UCanvas* C);
	bool ImageListBox_OnDraw(class UCanvas* C);
	bool ImageListBox_OnPreDraw(class UCanvas* C);
	void TraversalApplyAWinPos();
	void SetItemSize(int width, int Height);
	void SetItemCountPerPage(int row, int Col);
	void SetBorder(int horz, int vert);
	class URenderObject* GetLastSelectedItem();
	class URenderObject* GetSelectItem();
	void RemoveAll();
	void RemoveRenderObject(class URenderObject* ro);
	void ReplaceRenderObject(class URenderObject* ro, int AT);
	void AddRenderObject(class URenderObject* ro);
	float ImageListBox_GetItemHeight(class UCanvas* C);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitScrollBar();
};


// Class GUIWarfareControls.BTItemImageListHK
// 0x001C (0x03A0 - 0x0384)
class UBTItemImageListHK : public UBTAutoImageListHK
{
public:
	bool                                               bShopItem;                                                // 0x0384(0x0004)
	bool                                               bShowOnlyInventory;                                       // 0x0384(0x0004)
	class UBTROItemBoxHK*[]                            DataPool;                                                 // 0x0388(0x000C) (NeedCtorLink)
	bool                                               bSortAdd;                                                 // 0x0394(0x0004)
	struct FBtrDouble                                  Repair_UniqueItemID;                                      // 0x0398(0x0008)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTItemImageListHK");
		return ptr;
	}


	void ShowOnlyModeItem();
	void ShowPassive();
	void ShowLVMark();
	void ShowEtc();
	void ShowAllETC();
	void ShowCashItem();
	void ShowETCnPassive();
	void ShowShopItemAdHot();
	void ShowShopItemAdNew();
	void ShowShopItemAdBest();
	void ShowShopItemAll();
	void ShowWeaponNoBootyWithSkill();
	void ShowWeaponBootyWithSkill();
	void ShowWeaponWithSkill();
	void ShowActiveSkillOnlyOne(int SkillType);
	void ShowPassiveSkill();
	void ShowActiveSkill();
	void ShowSkillAll();
	void ShowDecoItem();
	void ShowEquipBackPackItem();
	void ShowEquipSpCharItem();
	void ShowEquipAccessoryItem();
	void ShowEquipFaceItem();
	void ShowEquipHeadItem();
	void ShowEquipItem();
	void ShowMeleeWeapon();
	void ShowHandThrowWeapon();
	void ShowSubWeapon();
	void ShowMainWeapon();
	void ShowWeaponAll();
	void ShowItemAll();
	void ShowAR();
	void ShowMG();
	void ShowShotgun();
	void ShowSR();
	void ShowSMG();
	void ShowWeaponNoBootyWithEquip();
	void ShowWeaponBootyWithEquip();
	void ShowWeaponWithEquip();
	void ShowItemOverOne(EItemType one, EItemType two);
	void ShowOnlyOne(EItemType one);
	void ShowEquipItemAll();
	void ShowAll(EItemType Max, EItemType Min);
	void ResetItem();
	void ClearItem();
	void ChangeShowItem(const struct FBtrDouble& prevUniqueID, const struct FBtrDouble& UniqueID);
	void RemoveShowItem(const struct FBtrDouble& UniqueID);
	void AddShowItem(const struct FBtrDouble& UniqueID);
	class UBTROItemBoxHK* FindPoolSkillItem(int UniqueSkillID);
	class UBTROItemBoxHK* FindPoolItem(const struct FBtrDouble& UniqueID);
	void RemoveItem(const struct FBtrDouble& UniqueID);
	void GetItemFromItemID(int ItemID, class UBTROItemBoxHK*[]* Arr);
	void SortByDisplayOrder();
	void AddItem(class UBTROItemBoxHK* ro);
};


// Class GUIWarfareControls.BTItemCommonInfoHK
// 0x0010 (0x003C - 0x002C)
class UBTItemCommonInfoHK : public UObject
{
public:
	int                                                myLevel;                                                  // 0x002C(0x0004)
	int                                                MyPoint;                                                  // 0x0030(0x0004)
	int                                                MyCash;                                                   // 0x0034(0x0004)
	int                                                MyCCoinCash;                                              // 0x0038(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTItemCommonInfoHK");
		return ptr;
	}

};


// Class GUIWarfareControls.BTOwnerDrawImageScroll
// 0x0014 (0x03D0 - 0x03BC)
class UBTOwnerDrawImageScroll : public UBTOwnerDrawImageHK
{
public:
	class UBTScrollProcess*                            ScrollProcess;                                            // 0x03BC(0x0004)
	bool                                               CaptionScroll;                                            // 0x03C0(0x0004)
	string                                             OriginalCaption;                                          // 0x03C4(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTOwnerDrawImageScroll");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void CaptionLeftRight(class UCanvas* C);
	void Internal_OnNextAnimationStart();
	void Left_Hold_Left();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.ButtonGroups
// 0x0014 (0x02D0 - 0x02BC)
class UButtonGroups : public UGUIComponent
{
public:
	bool                                               bTabControlMode;                                          // 0x02BC(0x0004)
	bool                                               bMultiSelect;                                             // 0x02BC(0x0004)
	int                                                selectIndex;                                              // 0x02C0(0x0004)
	class UBTOwnerDrawCaptionButtonHK*[]               ButtonList;                                               // 0x02C4(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.ButtonGroups");
		return ptr;
	}


	void SelectButton(int Index);
	int GetSelectButtonExtra();
	int GetSelectIndex();
	void RemoveButton(class UBTOwnerDrawCaptionButtonHK* btn);
	void SetFontSizeAll(int Size);
	void AddButton(class UBTOwnerDrawCaptionButtonHK* btn, int Extra);
	bool ButtonGroups_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfareControls.BTCheckBoxHK
// 0x0008 (0x04D8 - 0x04D0)
class UBTCheckBoxHK : public UBTOwnerDrawCaptionButtonHK
{
public:
	ECheckBoxStyle                                     cbStyle;                                                  // 0x04D0(0x0001)
	byte                                               Padding00[0x3];                                           // 0x04D1(0x0003) MISSED OFFSET
	int                                                PaddingSize;                                              // 0x04D4(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTCheckBoxHK");
		return ptr;
	}


	bool Internal_OnClick(class UGUIComponent* Sender);
	void OnRendered(class UCanvas* C);
};


// Class GUIWarfareControls.BTAutoColumnListHeaderHK
// 0x006C (0x0098 - 0x002C)
class UBTAutoColumnListHeaderHK : public UObject
{
public:
	int                                                ColumnIndex;                                              // 0x002C(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             ColumnName;                                               // 0x0030(0x000C) (Edit, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	float                                              ColumnPerc;                                               // 0x003C(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	EAutoColumnType                                    ColumnType;                                               // 0x0040(0x0001) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	byte                                               Padding00[0x3];                                           // 0x0041(0x0003) MISSED OFFSET
	struct FImage[]                                    ColumnImageList;                                          // 0x0044(0x000C) (NeedCtorLink)
	struct FImage                                      ColumnBackgroundImage;                                    // 0x0050(0x0020)
	struct FScriptDelegate                             __IntToImageIndex__Delegate;                              // 0x0070(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __FloatToImageIndex__Delegate;                            // 0x0078(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __IntToString__Delegate;                                  // 0x0080(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __FloatToString__Delegate;                                // 0x0088(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __CustomDraw__Delegate;                                   // 0x0090(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTAutoColumnListHeaderHK");
		return ptr;
	}


	void CustomDraw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	string FloatToString(float Input);
	string IntToString(int Input);
	int FloatToImageIndex(float Input);
	int IntToImageIndex(int Input);
	class UBTAutoColumnListHeaderHK* STATIC_MakeHeader(const string& CName, float cPerc, EAutoColumnType ct);
};


// Class GUIWarfareControls.BTStretchedImageHK
// 0x0000 (0x02FC - 0x02FC)
class UBTStretchedImageHK : public UFloatingImage
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTStretchedImageHK");
		return ptr;
	}

};


// Class GUIWarfareControls.BTAutoImageListNew
// 0x0000 (0x0384 - 0x0384)
class UBTAutoImageListNew : public UBTAutoImageListHK
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTAutoImageListNew");
		return ptr;
	}


	void InitScrollBar();
};


// Class GUIWarfareControls.BTTPOptionTextureQuality
// 0x0044 (0x0384 - 0x0340)
class UBTTPOptionTextureQuality : public UBTTabPanelHK
{
public:
	class UButtonGroups*                               TextureQualityGroup;                                      // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 TextureQualityButton[0x4];                                // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strTexQuality[0x4];                                       // 0x0354(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPOptionTextureQuality");
		return ptr;
	}


	bool EnableAllButton();
	bool DisableAllButton();
	void ChangeButtonImage();
	void ApplyAWinPos();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPOptionBGQuality
// 0x0034 (0x0374 - 0x0340)
class UBTTPOptionBGQuality : public UBTTabPanelHK
{
public:
	class UButtonGroups*                               BGQualityGroup;                                           // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 BGQualityButton[0x3];                                     // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strBGQuality[0x3];                                        // 0x0350(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPOptionBGQuality");
		return ptr;
	}


	bool EnableAllButton();
	bool DisableAllButton();
	void ApplyAWinPos();
	void ChangeButtonImage();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPOptionLOD
// 0x0044 (0x0384 - 0x0340)
class UBTTPOptionLOD : public UBTTabPanelHK
{
public:
	class UButtonGroups*                               LODGroup;                                                 // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 LODButton[0x4];                                           // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLOD[0x4];                                              // 0x0354(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPOptionLOD");
		return ptr;
	}


	bool EnableAllButton();
	bool DisableAllButton();
	void ChangeButtonImage();
	void ApplyAWinPos();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPOptionOnOffButton
// 0x0024 (0x0364 - 0x0340)
class UBTTPOptionOnOffButton : public UBTTabPanelHK
{
public:
	class UButtonGroups*                               BTGroup;                                                  // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 CaptionButton[0x2];                                       // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strOnOff[0x2];                                            // 0x034C(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPOptionOnOffButton");
		return ptr;
	}


	bool EnableAllButton();
	bool DisableAllButton();
	void ChangeButtonImage();
	void ApplyAWinPos();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPOptionRadioButtonHK
// 0x0008 (0x0348 - 0x0340)
class UBTTPOptionRadioButtonHK : public UBTTabPanelHK
{
public:
	float                                              perc;                                                     // 0x0340(0x0004)
	class UBTRadioOnOffButtonHK*                       ButtonRadio;                                              // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPOptionRadioButtonHK");
		return ptr;
	}


	void ApplyAWinPos();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTSliderHK
// 0x0064 (0x03A4 - 0x0340)
class UBTSliderHK : public UBTTabPanelHK
{
public:
	class UBTOwnerDrawCaptionButtonHK*                 ButtonLeft;                                               // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRight;                                              // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelSliderBack;                                          // 0x0348(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTSliderGripButtonHK*                       ButtonSliderGrip;                                         // 0x034C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	float                                              MinValue;                                                 // 0x0350(0x0004)
	float                                              MaxValue;                                                 // 0x0354(0x0004)
	float                                              ValuePerPixel;                                            // 0x0358(0x0004)
	int                                                startX;                                                   // 0x035C(0x0004)
	int                                                EndX;                                                     // 0x0360(0x0004)
	int                                                CMouseX;                                                  // 0x0364(0x0004)
	int                                                CMouseY;                                                  // 0x0368(0x0004)
	bool                                               bSmoothSlider;                                            // 0x036C(0x0004)
	bool                                               bActiveCursor;                                            // 0x036C(0x0004)
	bool                                               bGrip;                                                    // 0x036C(0x0004)
	bool                                               bCanGrip;                                                 // 0x036C(0x0004)
	int                                                StartMouseX;                                              // 0x0370(0x0004)
	int                                                StartMouseY;                                              // 0x0374(0x0004)
	int                                                ArrowButtonWidth;                                         // 0x0378(0x0004)
	int                                                GripButtonWidth;                                          // 0x037C(0x0004)
	int                                                CurrentX;                                                 // 0x0380(0x0004)
	int                                                SaveXPos;                                                 // 0x0384(0x0004)
	float                                              CurrentValue;                                             // 0x0388(0x0004)
	struct FScriptDelegate                             __SliderValueToString__Delegate;                          // 0x038C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnChangeValue__Delegate;                                // 0x0394(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __CanChangeValue__Delegate;                               // 0x039C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTSliderHK");
		return ptr;
	}


	void Internal_OnDeactivate();
	void Internal_OnActivate();
	void Internal_OnRendered(class UCanvas* C);
	bool CanChangeValue(int PrevValue, int changeValue);
	void OnChangeValue(int changeValue);
	void ApplyAWinPos();
	void SetCurrentValue(float Value);
	void SetData(int AButtonWidth, int GButtonWidth);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool ButtonRight_OnClick(class UGUIComponent* Sender);
	bool ButtonLeft_OnClick(class UGUIComponent* Sender);
	void ButtonSliderGrip_OnMouseRelease(class UGUIComponent* Sender);
	void ButtonSliderGrip_OnMousePressed(class UGUIComponent* Sender, bool bRepeat);
	void DecrementValue();
	void IncrementValue();
	string SliderValueToString(int Value);
};


// Class GUIWarfareControls.BTAutoScrollListHK
// 0x0080 (0x03B0 - 0x0330)
class UBTAutoScrollListHK : public UGUITabPanel
{
public:
	string[]                                           arrLeftStr;                                               // 0x0330(0x000C) (NeedCtorLink)
	bool                                               bAutoShowScrollBar;                                       // 0x033C(0x0004)
	bool                                               bFixScroll;                                               // 0x033C(0x0004)
	bool                                               bActiveCursor;                                            // 0x033C(0x0004)
	class UBTStretchedImageHK*                         BackgroundImage;                                          // 0x0340(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIMultiColumnListBox*                      MultiColumnBox;                                           // 0x0344(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUIMultiColumnList*                         MultiColumnList;                                          // 0x0348(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bMaxRowItem;                                              // 0x034C(0x0004)
	int                                                topIdx;                                                   // 0x0350(0x0004)
	int                                                curIdx;                                                   // 0x0354(0x0004)
	struct FText[]                                     ASLRowList;                                               // 0x0358(0x000C) (NeedCtorLink)
	int                                                maxFontSize;                                              // 0x0364(0x0004)
	struct FImage                                      SelectImage;                                              // 0x0368(0x0020)
	struct FImage                                      LastSelectedImage;                                        // 0x0388(0x0020)
	struct FScriptDelegate                             __CustomDraw__Delegate;                                   // 0x03A8(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTAutoScrollListHK");
		return ptr;
	}


	bool Internal_OnPostDraw(class UCanvas* C);
	void InternalDeactivate();
	void InternalActivate();
	void MultiColumnList_OnDrawItem(class UCanvas* C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending);
	void CustomDraw(class UCanvas* C, float X1, float Y1, float X2, float Y2, int ItemIndex);
	float GetItemHeight(class UCanvas* C);
	bool MultiColumnList_OnPreDraw(class UCanvas* C);
	bool MultiColumnList_OnDblClick(class UGUIComponent* Sender);
	bool MultiColumnList_OnClick(class UGUIComponent* Sender);
	int GetCurrentIndex();
	int ConvertRowToDataIndex(int Index);
	struct FText GetRowByIndex(int Index);
	bool PopRow();
	void Clear();
	void AddRowFinal(class UCanvas* saveC, const string& Text, const struct FColor& fntColor, const struct FColor& fntShadowColor);
	void AddRowColor(class UCanvas* C, const string& Text, const struct FColor& Front);
	void AddRow(class UCanvas* C, const string& Text);
	void AddLineRow(class UCanvas* C, const string& Text);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitScrollBar();
};


// Class GUIWarfareControls.BTComboBoxMapHK
// 0x0014 (0x03B0 - 0x039C)
class UBTComboBoxMapHK : public UBTComboBoxHK
{
public:
	class UBTROMapInfoHK*                              mapInfo;                                                  // 0x039C(0x0004)
	class UMaterial*                                   ImgSupply[0x3];                                           // 0x03A0(0x0004)
	int                                                LastSelectedItem;                                         // 0x03AC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTComboBoxMapHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTROClanMarkHK
// 0x00B4 (0x00F4 - 0x0040)
class UBTROClanMarkHK : public URenderObject
{
public:
	bool                                               bClanMarkSize128;                                         // 0x0040(0x0004)
	int                                                clanmarkid[0x3];                                          // 0x0044(0x0004)
	int                                                ClanLevel;                                                // 0x0050(0x0004)
	struct FImage                                      Background;                                               // 0x0054(0x0020)
	struct FImage                                      ClanMark[0x3];                                            // 0x0074(0x0020)
	struct FImage                                      ClanLevel_Img;                                            // 0x00D4(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROClanMarkHK");
		return ptr;
	}


	bool Render(class UCanvas* C, float Delta);
	void Update(class UCanvas* C, float Delta);
	void SetData(class UwGameManager* GameMgr, int ClanPattern, int ClanBG, int ClanBL, bool bSize128, int ClanLevel);
	void Init();
};


// Class GUIWarfareControls.BTROExpBarHK
// 0x00B0 (0x00F0 - 0x0040)
class UBTROExpBarHK : public URenderObject
{
public:
	bool                                               bDrawArrow;                                               // 0x0040(0x0004)
	bool                                               bRenderText;                                              // 0x0040(0x0004)
	struct FImage                                      back;                                                     // 0x0044(0x0020)
	struct FImage                                      Gauge;                                                    // 0x0064(0x0020)
	struct FImage                                      Arrow;                                                    // 0x0084(0x0020)
	int[]                                              DataArray;                                                // 0x00A4(0x000C) (NeedCtorLink)
	float                                              DataPerc;                                                 // 0x00B0(0x0004)
	struct FText                                       PercText;                                                 // 0x00B4(0x001C) (NeedCtorLink)
	float                                              PercTextPadding[0x4];                                     // 0x00D0(0x0004)
	float                                              GaugePadding[0x4];                                        // 0x00E0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROExpBarHK");
		return ptr;
	}


	bool RenderUsingCache(class UCanvas* C, float Delta, int Level);
	bool Render(class UCanvas* C, float Delta);
	void SetData(int A, int B, bool bUsePercColor, bool bUseSlashText);
	void SetGaugePadding(int Value);
	void Init();
};


// Class GUIWarfareControls.BTACLMessengerChannelHKCN
// 0x0000 (0x0488 - 0x0488)
class UBTACLMessengerChannelHKCN : public UBTACLMessengerChannelHK
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLMessengerChannelHKCN");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	float GetItemHeight(class UCanvas* C);
	int GetLevelMarkID(int row);
	struct FColor GetUserNameColor(int row, int idx);
	bool IsFriendlyUser(int row);
	int GetClanPatternID(int row);
	string GetUserName(int row);
	int GetUserID(int row);
	int GetLevel(int row);
	string GetClanName(int row);
	int GetClanID(int row);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
};


// Class GUIWarfareControls.BTACLMessengerFriendHKCN
// 0x0000 (0x0488 - 0x0488)
class UBTACLMessengerFriendHKCN : public UBTACLMessengerFriendHK
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLMessengerFriendHKCN");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	float GetItemHeight(class UCanvas* C);
	void SortByConnectionStatus();
	int GetLevelMarkID(int row);
	int GetClanNum(int row);
	struct FImage GetClanBL(int row);
	struct FImage GetClanBG(int row);
	struct FImage GetClanPattern(int row);
	int GetClanPatternID(int row);
	string GetClanName(int row);
	int GetChannelNum(int row);
	string GetServerName(int row);
	int GetServerPort(int row);
	int GetCurPosInt(int row);
	int GetCurPos(int row);
	string GetServerIP(int row);
	int GetRoomNumber(int row);
	string GetUserName(int row);
	int GetLevel(int row);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
};


// Class GUIWarfareControls.BTLabelClanMarkHK
// 0x0004 (0x03C0 - 0x03BC)
class UBTLabelClanMarkHK : public UBTOwnerDrawImageHK
{
public:
	class UBTROClanMarkHK*                             ro;                                                       // 0x03BC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTLabelClanMarkHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void SetData(int ClanPattern, int ClanBG, int ClanBL, bool bSize128, int ClanLevel);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTOwnerDrawTextArrayHK
// 0x0028 (0x03E4 - 0x03BC)
class UBTOwnerDrawTextArrayHK : public UBTOwnerDrawImageHK
{
public:
	string                                             strUpArrow;                                               // 0x03BC(0x000C) (Localized, NeedCtorLink)
	string                                             strDownArrow;                                             // 0x03C8(0x000C) (Localized, NeedCtorLink)
	struct FText[]                                     tarray;                                                   // 0x03D4(0x000C) (NeedCtorLink)
	ETextArrayDrawType                                 tArrayDrawType;                                           // 0x03E0(0x0001)
	byte                                               Padding00[0x3];                                           // 0x03E1(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTOwnerDrawTextArrayHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void SetRankData(const string& t0, int t1);
	void SetData(const string& t0, const string& t1);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTLabelLocationHK
// 0x04B4 (0x0898 - 0x03E4)
class UBTLabelLocationHK : public UBTOwnerDrawTextArrayHK
{
public:
	string                                             strRadioLocation[0x64];                                   // 0x03E4(0x000C) (Localized, NeedCtorLink)
	byte                                               LocationCount;                                            // 0x0894(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0895(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTLabelLocationHK");
		return ptr;
	}


	byte GetLocationCount();
	void CalcLocationCount();
	void SetLocationID(int id);
};


// Class GUIWarfareControls.BTLabelLevelHK
// 0x0004 (0x03C0 - 0x03BC)
class UBTLabelLevelHK : public UBTOwnerDrawImageHK
{
public:
	class UBTROLevelHK*                                ro;                                                       // 0x03BC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTLabelLevelHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void SetData(int Level, int LevelMarkID);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPUserDetailInfo
// 0x043C (0x077C - 0x0340)
class UBTTPUserDetailInfo : public UBTTabPanelHK
{
public:
	string                                             strLabel[0xE];                                            // 0x0340(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0xE];                                             // 0x03E8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0xE];                                               // 0x04C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strEdit[0xE];                                             // 0x0500(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbEdit[0xE];                                              // 0x05A8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawTextArrayHK*                     Edit[0xE];                                                // 0x0688(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLevelImg;                                               // 0x06C0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelClanMark;                                          // 0x06D0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LevelImg;                                                 // 0x06E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTLabelClanMarkHK*                          LabelClanMark;                                            // 0x06E4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbSelfIntroduction;                                       // 0x06E8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTAutoScrollListHK*                         SelfIntroduction;                                         // 0x06F8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbEquipWeapon[0x2];                                       // 0x06FC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTItemBoxButtonHK*                          EquipWeapon[0x2];                                         // 0x071C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbExpBar;                                                 // 0x0724(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTExpBarHK*                                 expbar;                                                   // 0x0734(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strOnLine;                                                // 0x0738(0x000C) (Localized, NeedCtorLink)
	string                                             strOffLine;                                               // 0x0744(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         strCharInfo;                                              // 0x0750(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbCharInfo;                                               // 0x0754(0x0010)
	string                                             strDefaultSelfIntro;                                      // 0x0764(0x000C) (Localized, NeedCtorLink)
	string                                             strNoRankState;                                           // 0x0770(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPUserDetailInfo");
		return ptr;
	}


	void SetData(const string& CharName, const string& ClanName, int MainWeaponID, int MainWeaponPartID, int SubWeaponID, int SubWeaponPartID, int AFBodyID, int RSABodyID, const struct FCharInfo& stCharInfo);
	void SetRankingInfo(int Ranking, int Win, int Lose, int DisCon);
	void SetEquipItemInfo(int MainWeaponID, int MainWeaponPartID, int SubWeaponID, int SubWeaponPartID, int HelmetID, int FaceID, int AcceID, int AFBodyID, int RSABodyID);
	void SetClanInfo(const string& ClanName, int ClanPattern, int ClanBG, int ClanBL, int ClanLevel);
	void SetMyInfo(const string& CharName, const string& ClanName, int Level, int CurExp, int startExp, int maxExp, int LevelMarkID);
	void SetSelfIntro(const string& Intro);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTROModelNew
// 0x01FC (0x05D4 - 0x03D8)
class ABTROModelNew : public AActor
{
public:
	struct FVector                                     cameraDir;                                                // 0x03D8(0x000C)
	int                                                CurrentModifyLight;                                       // 0x03E4(0x0004)
	bool                                               bModifyLight;                                             // 0x03E8(0x0004)
	class AwSkinShell*                                 wLightModel;                                              // 0x03EC(0x0004)
	FName[]                                            AnimNames;                                                // 0x03F0(0x000C) (NeedCtorLink)
	int                                                BodyID[0x2];                                              // 0x03FC(0x0004)
	int                                                FaceID[0x2];                                              // 0x0404(0x0004)
	int                                                HelmetID[0x2];                                            // 0x040C(0x0004)
	int                                                AccessoryID[0x2];                                         // 0x0414(0x0004)
	int                                                BackPackID[0x2];                                          // 0x041C(0x0004)
	int                                                PouChID[0x2];                                             // 0x0424(0x0004)
	int                                                CamouflageID[0x2];                                        // 0x042C(0x0004)
	int                                                CurBodyID;                                                // 0x0434(0x0004)
	int                                                CurFaceID;                                                // 0x0438(0x0004)
	int                                                CurHelmetID;                                              // 0x043C(0x0004)
	int                                                CurAccessoryID;                                           // 0x0440(0x0004)
	int                                                CurBackPackID;                                            // 0x0444(0x0004)
	int                                                CurPouchID;                                               // 0x0448(0x0004)
	int                                                CurCamouflageID;                                          // 0x044C(0x0004)
	int                                                TeamIndex;                                                // 0x0450(0x0004)
	int                                                weaponID;                                                 // 0x0454(0x0004)
	int                                                WeaponPartsID;                                            // 0x0458(0x0004)
	int                                                WeaponPaintID;                                            // 0x045C(0x0004)
	int                                                WeaponType;                                               // 0x0460(0x0004)
	class AwSkinShell*                                 wParts[0x4];                                              // 0x0464(0x0004)
	class AwSkinShell*                                 wWeapon;                                                  // 0x0474(0x0004)
	class AwSkinShell*                                 wWeaponParts[0x3];                                        // 0x0478(0x0004)
	struct FFloatBox                                   AWinPos;                                                  // 0x0484(0x0010)
	struct FVector                                     dir_light0;                                               // 0x0494(0x000C)
	struct FVector                                     dir_light1;                                               // 0x04A0(0x000C)
	float                                              PosX;                                                     // 0x04AC(0x0004)
	float                                              PosY;                                                     // 0x04B0(0x0004)
	float                                              posZ;                                                     // 0x04B4(0x0004)
	float                                              RotY;                                                     // 0x04B8(0x0004)
	float                                              LightDistance0;                                           // 0x04BC(0x0004)
	float                                              LightDistance1;                                           // 0x04C0(0x0004)
	float                                              LightDistance2;                                           // 0x04C4(0x0004)
	float                                              LightAngle0;                                              // 0x04C8(0x0004)
	float                                              LightAngle1;                                              // 0x04CC(0x0004)
	float                                              LightAngle2;                                              // 0x04D0(0x0004)
	float                                              LightHeight0;                                             // 0x04D4(0x0004)
	float                                              LightHeight1;                                             // 0x04D8(0x0004)
	float                                              LightHeight2;                                             // 0x04DC(0x0004)
	int                                                LightColor0_R;                                            // 0x04E0(0x0004)
	int                                                LightColor0_G;                                            // 0x04E4(0x0004)
	int                                                LightColor0_B;                                            // 0x04E8(0x0004)
	int                                                LightColor1_R;                                            // 0x04EC(0x0004)
	int                                                LightColor1_G;                                            // 0x04F0(0x0004)
	int                                                LightColor1_B;                                            // 0x04F4(0x0004)
	int                                                LightColor2_R;                                            // 0x04F8(0x0004)
	int                                                LightColor2_G;                                            // 0x04FC(0x0004)
	int                                                LightColor2_B;                                            // 0x0500(0x0004)
	float                                              AspectRatio;                                              // 0x0504(0x0004)
	struct FRotator                                    PawnRot;                                                  // 0x0508(0x000C)
	struct FVector                                     pawnPos;                                                  // 0x0514(0x000C)
	struct FRotator                                    cameraRot;                                                // 0x0520(0x000C)
	struct FVector                                     cameraPos;                                                // 0x052C(0x000C)
	struct FVector                                     lightAngle;                                               // 0x0538(0x000C)
	struct FColor                                      LightColor[0x3];                                          // 0x0544(0x0004)
	byte                                               LightOnOff[0x5];                                          // 0x0550(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0555(0x0003) MISSED OFFSET
	float                                              LightPosToCenter[0x5];                                    // 0x0558(0x0004)
	float                                              Roll[0x5];                                                // 0x056C(0x0004)
	float                                              lightDist[0x5];                                           // 0x0580(0x0004)
	float                                              lightHeight[0x5];                                         // 0x0594(0x0004)
	struct FColor                                      LightColor_AF[0x5];                                       // 0x05A8(0x0004)
	struct FColor                                      LightColor_RSA[0x5];                                      // 0x05BC(0x0004)
	FName                                              NoHaveWeaponIdle;                                         // 0x05D0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROModelNew");
		return ptr;
	}


	void AnimEnd(int Channel);
	void SetRotationRight();
	void SetRotationLeft();
	bool Render(class UCanvas* C, float Delta);
	void SetScaleModel(const struct FVector& scaleVector);
	void EndModel();
	void SetWeaponParts(int iPartsID, int iPaintingID);
	void DeleteWeapone();
	void SetWeapon(int iWeaponID, int iPartsID);
	void ChangeWeaponsPaints(int iPaintID);
	void ChangeWeaponsParts(int iPartsID);
	void PlayAnimByParams(int wID);
	void ChangeWeapon(int iWeaponID, int iPartsID, int iPaintingID);
	void SetParts(int iType);
	void SetCamouflage(int iItemID, byte byTeam);
	void ForceChangeEquipItems();
	void ChangeEquipItemByID(int iBodyID_0, int iBodyID_1, int iHelmetID_0, int iHelmetID_1, int iAccessoryID_0, int iAccessoryID_1, int iBackPackID_0, int iBackPackID_1, int iPouchID_0, int iPouchID_1, int iCamouflageID_0, int iCamouflageID_1);
	void ForceChangeWeapon();
	void ChangeEquipItemByItemID(int HelmetItemID, int AcceItemID, int BackpackItemID, int PouchItemID, int CamouflageItemID, int AF_ItemID, int RSA_ItemID);
	void ChangeEquipItem(class UwGameManager* GameMgr);
	void ChangeTeam(int iIndex);
	void BeginModel();
	void SaveModelData();
	void LoadSetModelData();
	void Destroyed();
	void Init();
};


// Class GUIWarfareControls.BTModelHK
// 0x0008 (0x0338 - 0x0330)
class UBTModelHK : public UGUITabPanel
{
public:
	class ABTROModelNew*                               cModel;                                                   // 0x0330(0x0004)
	bool                                               bLMouseDn;                                                // 0x0334(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTModelHK");
		return ptr;
	}


	void InteranlMouseRelease(class UGUIComponent* Sender);
	void InternalMousePress(class UGUIComponent* Sender, bool bRepeat);
	bool Internal_OnKeyEvent(float Delta, byte* key, byte* Action);
	bool Internal_OnDraw(class UCanvas* C);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTROExpBarHKCN
// 0x00A4 (0x00E4 - 0x0040)
class UBTROExpBarHKCN : public URenderObject
{
public:
	bool                                               bDrawArrow;                                               // 0x0040(0x0004)
	bool                                               bRenderText;                                              // 0x0040(0x0004)
	struct FImage                                      back;                                                     // 0x0044(0x0020)
	struct FImage                                      Gauge;                                                    // 0x0064(0x0020)
	struct FImage                                      Arrow;                                                    // 0x0084(0x0020)
	int[]                                              DataArray;                                                // 0x00A4(0x000C) (NeedCtorLink)
	float                                              DataPerc;                                                 // 0x00B0(0x0004)
	struct FText                                       PercText;                                                 // 0x00B4(0x001C) (NeedCtorLink)
	float                                              PercTextPadding[0x4];                                     // 0x00D0(0x0004)
	int                                                LineWidth;                                                // 0x00E0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROExpBarHKCN");
		return ptr;
	}


	bool RenderUsingCache(class UCanvas* C, float Delta, int Level);
	bool Render(class UCanvas* C, float Delta);
	void SetData(int A, int B, bool bUsePercColor, bool bUseSlashText);
	void Init();
};


// Class GUIWarfareControls.BTExpBarHK
// 0x0010 (0x030C - 0x02FC)
class UBTExpBarHK : public UFloatingImage
{
public:
	class UBTROExpBarHK*                               ro;                                                       // 0x02FC(0x0004)
	struct FText[]                                     taExpbar;                                                 // 0x0300(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTExpBarHK");
		return ptr;
	}


	void OnRendered(class UCanvas* C);
	void SetData(int A, int B, const string& aText, const string& bText);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTItemBoxButtonHK
// 0x00C4 (0x0594 - 0x04D0)
class UBTItemBoxButtonHK : public UBTOwnerDrawCaptionButtonHK
{
public:
	class UBTROItemBoxHK*                              itemBox;                                                  // 0x04D0(0x0004)
	int                                                DefaultSlotItemID;                                        // 0x04D4(0x0004)
	struct FBtrDouble                                  DefaultSlotUniqueID;                                      // 0x04D8(0x0008)
	string                                             DefaultSlotName[0x3];                                     // 0x04E0(0x000C) (NeedCtorLink)
	struct FPlane                                      DefaultSlotModulate;                                      // 0x0504(0x0010)
	struct FImage                                      DefaultSlotImage;                                         // 0x0514(0x0020)
	int                                                SlotName3Padding[0x4];                                    // 0x0534(0x0004)
	struct FFloatBox                                   fbExtraString;                                            // 0x0544(0x0010)
	struct FText                                       ExtraString;                                              // 0x0554(0x001C) (NeedCtorLink)
	float                                              EffectCalcTime;                                           // 0x0570(0x0004)
	struct FImage                                      DefaultSlotImageEffect;                                   // 0x0574(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTItemBoxButtonHK");
		return ptr;
	}


	bool Internal_OnDraw(class UCanvas* C);
	void SetData(class UwItemBoxHK* ItemInfo, class UwItemBoxInstanceHK* instanceInfo);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTACLQuestHK
// 0x003C (0x049C - 0x0460)
class UBTACLQuestHK : public UBTAutoColumnListHK
{
public:
	int                                                LastTabIndex;                                             // 0x0460(0x0004)
	class UwGameManager*                               GameMgr;                                                  // 0x0464(0x0004)
	class UBTROExpBarHK*                               expbar;                                                   // 0x0468(0x0004)
	class UBTAutoColumnListDataHK*[]                   ACLRowListPool;                                           // 0x046C(0x000C) (NeedCtorLink)
	string                                             strCannotRepair;                                          // 0x0478(0x000C) (Localized, NeedCtorLink)
	string                                             Rewardname[0x2];                                          // 0x0484(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLQuestHK");
		return ptr;
	}


	string GetDailyReward(int row);
	int GetHelpResourceIndex(int row);
	string GetLastReward(int row);
	string GetReward(int row);
	string GetQuestExtDesc(int row);
	int GetQuestId(int row);
	string GetQuestDesc(int row);
	string GetQuestName(int row);
	string GetPrevQuestDesc(int row);
	string GetPrevQuestName(int row);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	string GetFormatRewardItemString(class UwQuestParam* tempq);
	string GetFormatRewardAttendPuzzleString(class UwQuestParam* tempq);
	string GetFormatRewardString(class UwQuestParam* tempq);
	void SetVisibleQuestType(int TabIndex);
	void RemovePool();
	bool AddQuestInfo(int QuestID, int currentstatus);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	float GetItemHeight(class UCanvas* C);
};


// Class GUIWarfareControls.BTACLClanHK
// 0x000C (0x046C - 0x0460)
class UBTACLClanHK : public UBTAutoColumnListHK
{
public:
	string                                             strNoRankState;                                           // 0x0460(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLClanHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void LC_2_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC_1_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void AddClan(int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, const string& ClanName, const string& ClanMaster, const string& ClanMemberCount, const string& ClanCreateDate, const string& ClanHistory, const string& ClanRanking, byte ClanRecruit, int ClanRank, int ClanLevel);
	float GetItemHeight(class UCanvas* C);
};


// Class GUIWarfareControls.BTLabelRecruitHK
// 0x0018 (0x03FC - 0x03E4)
class UBTLabelRecruitHK : public UBTOwnerDrawTextArrayHK
{
public:
	string                                             strRecruitState[0x2];                                     // 0x03E4(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTLabelRecruitHK");
		return ptr;
	}


	void SetRecruitState(byte B);
};


// Class GUIWarfareControls.BTTPMyInfoBasicHK
// 0x0108 (0x0810 - 0x0708)
class UBTTPMyInfoBasicHK : public UBTTPOptionBaseHK
{
public:
	string                                             strLabel[0x15];                                           // 0x0708(0x000C) (Localized, NeedCtorLink)
	string                                             strPlayNetCash;                                           // 0x0804(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPMyInfoBasicHK");
		return ptr;
	}


	void InitializeContent();
	void SetData(int UserID, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FCharInfo& stCharInfo, const struct FClanInfo& stClanInfo, int ClanLevel);
	void InitializeLabel();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPMyInfoStatHK
// 0x0168 (0x0870 - 0x0708)
class UBTTPMyInfoStatHK : public UBTTPOptionBaseHK
{
public:
	string                                             strLabel[0x1E];                                           // 0x0708(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPMyInfoStatHK");
		return ptr;
	}


	void SetData(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	void InitializeContent();
	void InitializeLabel();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowSendPresentHK
// 0x00F0 (0x05B0 - 0x04C0)
class UBTWindowSendPresentHK : public UBTWindowHK
{
public:
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x04C0(0x0004)
	int                                                ItemID;                                                   // 0x04C4(0x0004)
	int                                                BuyOpt[0x2];                                              // 0x04C8(0x0004)
	struct FFloatBox                                   fbItemBox;                                                // 0x04D0(0x0010)
	class UBTItemBoxButtonHK*                          itemBox;                                                  // 0x04E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbSeparator;                                              // 0x04E4(0x0010)
	class UBTOwnerDrawImageHK*                         Separator;                                                // 0x04F4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonAddress;                                          // 0x04F8(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonAddress;                                            // 0x0508(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabel[0x4];                                             // 0x050C(0x0010)
	struct FFloatBox                                   fbEditReceiveUser;                                        // 0x054C(0x0010)
	struct FFloatBox                                   fbEditContent;                                            // 0x055C(0x0010)
	class UBTOwnerDrawImageHK*                         Label[0x4];                                               // 0x056C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTEditBoxHK*                                EditReceiveUser;                                          // 0x057C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       EditContent;                                              // 0x0580(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabel[0x2];                                            // 0x0584(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonAddress;                                         // 0x059C(0x000C) (Localized, NeedCtorLink)
	class UBTROItemBoxHK*                              ro;                                                       // 0x05A8(0x0004)
	byte                                               cashType;                                                 // 0x05AC(0x0001)
	byte                                               Padding00[0x3];                                           // 0x05AD(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowSendPresentHK");
		return ptr;
	}


	void Closed(class UGUIComponent* Sender, bool bCancelled);
	void SendPresentHK_OnTimeOut(class UGUIComponent* Sender);
	bool SendPresentHK_OnOK(class UGUIComponent* Sender);
	void SetCashType(byte buyCashType);
	void SetData(int iItemID, int Opt1, int opt2);
	void SetRenderObject(class UBTROItemBoxHK* ro);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowBTTPQuestInfoHK
// 0x0008 (0x04C8 - 0x04C0)
class UBTWindowBTTPQuestInfoHK : public UBTWindowHK
{
public:
	class UBTTPQuestInfoHK*                            QuestInfo;                                                // 0x04C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonClose;                                              // 0x04C4(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowBTTPQuestInfoHK");
		return ptr;
	}


	bool ButtonClose_OnClick(class UGUIComponent* Sender);
	void SetQuestList(class UwMatchMaker* MM);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPQuestInfoHK
// 0x00C4 (0x0404 - 0x0340)
class UBTTPQuestInfoHK : public UBTTabPanelHK
{
public:
	class UTabControlMocker*                           TabControl;                                               // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         BackgroundImage;                                          // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*[]               ButtonCategory;                                           // 0x0348(0x000C) (NeedCtorLink)
	class UBTACLQuestHK*                               ACLQuest;                                                 // 0x0354(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTLabelQuestDescHK*                         LabelQuestDesc;                                           // 0x0358(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTab[0x6];                                           // 0x035C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonClose;                                              // 0x0374(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strButtonTab[0x6];                                        // 0x0378(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonClose;                                           // 0x03C0(0x000C) (Localized, NeedCtorLink)
	bool                                               bSelfTopMenuOwner;                                        // 0x03CC(0x0004)
	bool                                               bSlidingTabPanel;                                         // 0x03CC(0x0004)
	bool                                               bShowing;                                                 // 0x03CC(0x0004)
	float                                              SlideTime;                                                // 0x03D0(0x0004)
	float                                              SlideMultiplier;                                          // 0x03D4(0x0004)
	struct FFloatBox                                   ShowAWinFrame;                                            // 0x03D8(0x0010)
	struct FFloatBox                                   HideAWinFrame;                                            // 0x03E8(0x0010)
	class UBTAttendQuest*                              AttendCheck;                                              // 0x03F8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTDailyQuest*                               DailyQuest;                                               // 0x03FC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTSpecialQuest*                             SpecialQuest;                                             // 0x0400(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPQuestInfoHK");
		return ptr;
	}


	void Hide();
	void Show();
	void SetMatchMaker(class UwMatchMaker* MM);
	void OnRendered(class UCanvas* C);
	bool Internal_OnPreDraw(class UCanvas* C);
	class UGUIComponent* GetTopMenuOwner();
	void SetSlideTabPanel();
	void ReceiveItem();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetVisiblePuzzlePice(int nIndex);
	bool ButtonTab_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfareControls.BTSpecialQuest
// 0x0084 (0x03C4 - 0x0340)
class UBTSpecialQuest : public UBTTabPanelHK
{
public:
	class UBTOwnerDrawImageHK*                         Quest_SpecialThema;                                       // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         SpecialQuestBG;                                           // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         Quest_SpecialMiniemblelm;                                 // 0x0348(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         SpecialQuestWelcom;                                       // 0x034C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         SpecialQuestDesc;                                         // 0x0350(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         SpecialQuestComp;                                         // 0x0354(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         SpecialQuestMission;                                      // 0x0358(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonClose;                                              // 0x035C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strSpecialQuest[0x5];                                     // 0x0360(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 DummyBtn;                                                 // 0x039C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 BtnReceiveReward;                                         // 0x03A0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageScroll*                     RewardItemName;                                           // 0x03A4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         RewardItemImg;                                            // 0x03A8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageScroll*                     RewardItemUserList;                                       // 0x03AC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTLabelQuestDescHK*                         LabelQuestDesc;                                           // 0x03B0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTROExpBarHKCN*                             expbar;                                                   // 0x03B4(0x0004)
	class UBTItemInfoToolTipWindow*                    RewardItemInfoToolTip;                                    // 0x03B8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                nQuestID;                                                 // 0x03BC(0x0004)
	bool                                               RewardItemNameChange;                                     // 0x03C0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTSpecialQuest");
		return ptr;
	}


	void OnRendered(class UCanvas* C);
	bool AddQuestInfo(int QuestID, int currentstatus);
	void SetRewardItemImage(int nItemID);
	bool ReceiveRewardItem(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowSystemMsgInfoHK
// 0x10EC (0x15C4 - 0x04D8)
class UBTWindowSystemMsgInfoHK : public UBTWindowInfoHK
{
public:
	string                                             strClientDefaultTitle;                                    // 0x04D8(0x000C) (Localized, NeedCtorLink)
	string                                             strClientDefine[0xB4];                                    // 0x04E4(0x000C) (Localized, NeedCtorLink)
	string                                             strClientTitle[0xB4];                                     // 0x0D54(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowSystemMsgInfoHK");
		return ptr;
	}


	bool STATIC_ShowInfo(class UGUIController* con, int Code, const string& arg0, const string& arg1, const string& arg2);
	string STATIC_GetFormatString(int Code, const string& arg0, const string& arg1, const string& arg2, const string& arg3, const string& arg4, const string& arg5, const string& arg6, const string& arg7, const string& arg8);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowCreateClanMarkHK
// 0x03A8 (0x0868 - 0x04C0)
class UBTWindowCreateClanMarkHK : public UBTWindowHK
{
public:
	struct FBtrDouble                                  UniqueID;                                                 // 0x04C0(0x0008)
	bool                                               bFreeItem;                                                // 0x04C8(0x0004)
	bool                                               bCheckDupSuccess;                                         // 0x04C8(0x0004)
	int                                                SelectClanMark[0x3];                                      // 0x04CC(0x0004)
	int                                                ChooseClanMark[0x3];                                      // 0x04D8(0x0004)
	int                                                PaidType;                                                 // 0x04E4(0x0004)
	struct FFloatBox                                   fbLabel[0xC];                                             // 0x04E8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbPrevClanMarkBig;                                        // 0x05A8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbNewClanMarkBig;                                         // 0x05B8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strLabel[0xC];                                            // 0x05C8(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         Label[0xC];                                               // 0x0658(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTLabelClanMarkHK*                          PrevClanMark[0x2];                                        // 0x0688(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTClanMarkHK*                               NewClanMark[0x2];                                         // 0x0690(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonIsExist;                                          // 0x0698(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strButtonIsExist;                                         // 0x06A8(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonIsExist;                                            // 0x06B4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbFT_Button[0x6];                                         // 0x06B8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbFT_ClanMarkList;                                        // 0x0718(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UButtonGroups*                               FT_Group;                                                 // 0x0728(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strFT_Button[0x6];                                        // 0x072C(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 FT_Button[0x6];                                           // 0x0774(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPClanMarkListHK*                         FT_ClanMarkList;                                          // 0x078C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbST_Button[0x6];                                         // 0x0790(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbST_ClanMarkList;                                        // 0x07F0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UButtonGroups*                               ST_Group;                                                 // 0x0800(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strST_Button[0x6];                                        // 0x0804(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ST_Button[0x6];                                           // 0x084C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPClanMarkListHK*                         ST_ClanMarkList;                                          // 0x0864(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowCreateClanMarkHK");
		return ptr;
	}


	bool ST_Group_OnClick(class UGUIComponent* Sender);
	bool FT_Group_OnClick(class UGUIComponent* Sender);
	bool ST_ClanMarkList_OnClick(class UGUIComponent* Sender);
	bool FT_ClanMarkList_OnClick(class UGUIComponent* Sender);
	bool SetCurrentClanMark(int Pattern, int BG, int BL);
	bool SetDupCheck(bool bSuccess);
	void SetPaidType(int t);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPLuckyBlackBox
// 0x019C (0x04DC - 0x0340)
class UBTTPLuckyBlackBox : public UBTTabPanelHK
{
public:
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x0340(0x0004)
	class UBTOwnerDrawImageHK*                         NewBackground;                                            // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelCapsuleName;                                       // 0x0348(0x0010)
	struct FFloatBox                                   fbLabelCapsulePrice;                                      // 0x0358(0x0010)
	class UBTOwnerDrawImageHK*                         LabelCapsuleName;                                         // 0x0368(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelCapsulePrice;                                        // 0x036C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbImgBlackBoxKey;                                         // 0x0370(0x0010)
	class UBTOwnerDrawImageHK*                         ImgBlackBoxKey;                                           // 0x0380(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelHaveKey;                                           // 0x0384(0x0010)
	struct FFloatBox                                   fbLabelHaveKeyNum;                                        // 0x0394(0x0010)
	struct FFloatBox                                   fbLabelKeyName;                                           // 0x03A4(0x0010)
	struct FFloatBox                                   fbLabelKeyDesc[0x2];                                      // 0x03B4(0x0010)
	class UBTOwnerDrawImageHK*                         LabelHaveKey;                                             // 0x03D4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelHaveKeyNum;                                          // 0x03D8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelKeyName;                                             // 0x03DC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelKeyDesc[0x2];                                        // 0x03E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbBuyKeyButton;                                           // 0x03E8(0x0010)
	struct FFloatBox                                   fbGiftKeyButton;                                          // 0x03F8(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 BuyKeyButton;                                             // 0x0408(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 GiftKeyButton;                                            // 0x040C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPLuckyShopCommon*                        LuckyShopCommon;                                          // 0x0410(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbComboBoxBlackBox;                                       // 0x0414(0x0010)
	struct FFloatBox                                   fbBackgroundComboBoxBlackBox;                             // 0x0424(0x0010)
	class UBTOwnerDrawImageHK*                         BackgroundComboBoxBlackBox;                               // 0x0434(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboBoxBlackBox;                                         // 0x0438(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int[]                                              BlackBoxIDList;                                           // 0x043C(0x000C) (NeedCtorLink)
	int                                                LastOpenBlackBoxID;                                       // 0x0448(0x0004)
	class UBTROItemBoxHK*                              RoBlackBoxKey;                                            // 0x044C(0x0004)
	string                                             strBuyBlackBoxKey;                                        // 0x0450(0x000C) (Localized, NeedCtorLink)
	string                                             strGiftBlackBoxKey;                                       // 0x045C(0x000C) (Localized, NeedCtorLink)
	string                                             strOpenBlackBox;                                          // 0x0468(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelHaveKey;                                          // 0x0474(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelHaveKeyNum;                                       // 0x0480(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelKeyName;                                          // 0x048C(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelKeyDesc[0x2];                                     // 0x0498(0x000C) (Localized, NeedCtorLink)
	string                                             strBlackBoxListItem;                                      // 0x04B0(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelIncludeHeader[0x2];                               // 0x04BC(0x000C) (Localized, NeedCtorLink)
	struct FScriptDelegate                             __deleShowCashChargeWindow__Delegate;                     // 0x04D4(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPLuckyBlackBox");
		return ptr;
	}


	struct FBtrDouble GetBlackBoxKeyUniqueID();
	int GetBlackBoxKeyCount();
	bool OnClickOpen(class UGUIComponent* Sender);
	void ShowItemBuyWindow(class UBTROItemBoxHK* ro, int buyType, byte cashType);
	void SelectCoin(int buyType, int cashType, class UBTROItemBoxHK* ro);
	bool ItemBuyProcess(int _buyType);
	bool OnClickGift(class UGUIComponent* Sender);
	bool OnClickBuyKey(class UGUIComponent* Sender);
	bool OnClickBestItemArrow(class UGUIComponent* Sender);
	void OnChange_ComboBoxBlackBox(class UGUIComponent* Sender);
	void fill();
	void InsertBlackboxData(class UwItemBaseParam* blackboxData, class UwItemBaseParam*[]* OutArray);
	void AddLabel(const struct FFloatBox& fbComponent, const string& strCaption, int FontSize, const struct FColor& TextColor, EDrawType dt, class UBTOwnerDrawImageHK** AddComponent);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void deleShowCashChargeWindow();
};


// Class GUIWarfareControls.BTWindowRandBoxHK
// 0x01B8 (0x0678 - 0x04C0)
class UBTWindowRandBoxHK : public UBTWindowHK
{
public:
	int[]                                              ItemIDChoose;                                             // 0x04C0(0x000C) (NeedCtorLink)
	int[]                                              PartIDChoose;                                             // 0x04CC(0x000C) (NeedCtorLink)
	struct FBtrDouble[]                                ItemIdx;                                                  // 0x04D8(0x000C) (NeedCtorLink)
	struct FBtrDouble[]                                UntilTime;                                                // 0x04E4(0x000C) (NeedCtorLink)
	int[]                                              StackCount;                                               // 0x04F0(0x000C) (NeedCtorLink)
	class UwItemBoxHK*                                 SaveItemInfo[0x3];                                        // 0x04FC(0x0004)
	class UwItemBoxInstanceHK*                         SaveInstanceInfo[0x3];                                    // 0x0508(0x0004)
	class UwItemBoxHK*[]                               RandItemInfo_0;                                           // 0x0514(0x000C) (NeedCtorLink)
	class UwItemBoxHK*[]                               RandItemInfo_1;                                           // 0x0520(0x000C) (NeedCtorLink)
	class UwItemBoxHK*[]                               RandItemInfo_2;                                           // 0x052C(0x000C) (NeedCtorLink)
	class UwItemBoxInstanceHK*[]                       RandInstanceInfo_0;                                       // 0x0538(0x000C) (NeedCtorLink)
	class UwItemBoxInstanceHK*[]                       RandInstanceInfo_1;                                       // 0x0544(0x000C) (NeedCtorLink)
	class UwItemBoxInstanceHK*[]                       RandInstanceInfo_2;                                       // 0x0550(0x000C) (NeedCtorLink)
	int[]                                              RandItemBestInfo_0;                                       // 0x055C(0x000C) (NeedCtorLink)
	int[]                                              RandItemBestInfo_1;                                       // 0x0568(0x000C) (NeedCtorLink)
	int[]                                              RandItemBestInfo_2;                                       // 0x0574(0x000C) (NeedCtorLink)
	int                                                AniEndCount;                                              // 0x0580(0x0004)
	int                                                ItemCount;                                                // 0x0584(0x0004)
	string                                             strPoint;                                                 // 0x0588(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelTopLine;                                          // 0x0594(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbEven[0x2];                                              // 0x05A0(0x0010)
	struct FFloatBox                                   fbOdd[0x3];                                               // 0x05C0(0x0010)
	class UBTAniItemBoxButtonHK*                       itemBox[0x3];                                             // 0x05F0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelPromotion2;                                        // 0x05FC(0x0010)
	struct FFloatBox                                   fbLabelContent2;                                          // 0x060C(0x0010)
	struct FFloatBox                                   fbLabelLevel2;                                            // 0x061C(0x0010)
	struct FFloatBox                                   fbBackgroundImage2;                                       // 0x062C(0x0010)
	struct FFloatBox                                   fbTopLine2;                                               // 0x063C(0x0010)
	struct FFloatBox                                   fbBottomLine2;                                            // 0x064C(0x0010)
	struct FFloatBox                                   fbButtonOK2;                                              // 0x065C(0x0010)
	bool                                               useEndSound;                                              // 0x066C(0x0004)
	struct FScriptDelegate                             __RandEnd__Delegate;                                      // 0x0670(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowRandBoxHK");
		return ptr;
	}


	void SetStepProcess();
	bool IsBestItem(int RandNum, int ItemID);
	void Internal_OnOpen();
	void AllEnd();
	void Internal_OnDramaEnded();
	void ButtonItemBox_OnChangeItemInfoEnd_2();
	void ButtonItemBox_OnChangeItemInfo_2(int Index);
	void ButtonItemBox_OnChangeItemInfoEnd_1();
	void ButtonItemBox_OnChangeItemInfo_1(int Index);
	void ButtonItemBox_OnChangeItemInfoEnd_0();
	void ButtonItemBox_OnChangeItemInfo_0(int Index);
	void ButtonItemBox_OnChangeItemInfoEnd(int itemBoxIndex);
	void ButtonItemBox_OnChangeItemInfo(class UwItemBoxHK*[] randItemInfo, class UwItemBoxInstanceHK*[] randInstanceInfo, int itemBoxIndex, int Index);
	void SetCandidateItems(int RandNum, int[] ItemID, int[] PartID, int[] BestItemID);
	void CandidateItems(int RandNum, int[] ItemID, int[] PartID, int[] BestItemID, class UwItemBoxHK*[]* randItemInfo, class UwItemBoxInstanceHK*[]* randInstanceInfo, int[]* randBestItemID);
	void SetAcquireItem(int RandNum, int ItemID, int PartID, const struct FBtrDouble& UniqueID);
	void SetItemCount(int Count);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void RandEnd();
};


// Class GUIWarfareControls.BTWindowCapsuleGet
// 0x0154 (0x07CC - 0x0678)
class UBTWindowCapsuleGet : public UBTWindowRandBoxHK
{
public:
	class UwGameManager*                               GameMgr;                                                  // 0x0678(0x0004)
	class UwMatchMaker*                                MM;                                                       // 0x067C(0x0004)
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x0680(0x0004)
	int                                                KeyCount;                                                 // 0x0684(0x0004)
	struct FBtrDouble                                  KeyUniqueID;                                              // 0x0688(0x0008)
	struct FFloatBox                                   fbButtonUseCapsule;                                       // 0x0690(0x0010)
	struct FFloatBox                                   fbButtonInventory;                                        // 0x06A0(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonUseCapsule;                                         // 0x06B0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonInventory;                                          // 0x06B4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbComboBoxCapsule;                                        // 0x06B8(0x0010)
	struct FFloatBox                                   fbBackgroundComboBoxCapsule;                              // 0x06C8(0x0010)
	class UBTComboCapsuleData*                         ComboCapsuleData;                                         // 0x06D8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelDesc;                                              // 0x06DC(0x0010)
	struct FFloatBox                                   fbLabelRemainName;                                        // 0x06EC(0x0010)
	struct FFloatBox                                   fbLabelReOpen;                                            // 0x06FC(0x0010)
	struct FFloatBox                                   fbImgRemainBackground;                                    // 0x070C(0x0010)
	class UBTOwnerDrawImageHK*                         LabelDesc;                                                // 0x071C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelRemainName;                                          // 0x0720(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelReOpen;                                              // 0x0724(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         ImgRemainBackground;                                      // 0x0728(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strSoundShake;                                            // 0x072C(0x000C) (NeedCtorLink)
	string                                             strSoundLose;                                             // 0x0738(0x000C) (NeedCtorLink)
	string                                             strSoundEffect;                                           // 0x0744(0x000C) (NeedCtorLink)
	string                                             strSoundWin;                                              // 0x0750(0x000C) (NeedCtorLink)
	string                                             strOpening;                                               // 0x075C(0x000C) (Localized, NeedCtorLink)
	string                                             strCongratulation;                                        // 0x0768(0x000C) (Localized, NeedCtorLink)
	string                                             strRemainName;                                            // 0x0774(0x000C) (Localized, NeedCtorLink)
	string                                             strReOpen;                                                // 0x0780(0x000C) (Localized, NeedCtorLink)
	string                                             strUseCapsule;                                            // 0x078C(0x000C) (Localized, NeedCtorLink)
	string                                             strInventory;                                             // 0x0798(0x000C) (Localized, NeedCtorLink)
	string                                             strBestItemGet[0x2];                                      // 0x07A4(0x000C) (Localized, NeedCtorLink)
	struct FScriptDelegate                             __ClickInventory__Delegate;                               // 0x07BC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __ClickShowCashChargeWindow__Delegate;                    // 0x07C4(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowCapsuleGet");
		return ptr;
	}


	void EnableOpenButton(class UwItemBoxHK* curItemInfo, int curItemCount);
	void ChangeComboBox();
	void Internal_OnNextRoll();
	void FillCapsule(bool inCapsuleItem);
	bool InternalOnInventory(class UGUIComponent* Sender);
	void ShowItemBuyWindow(class UBTROItemBoxHK* ro, int buyType, byte cashType);
	void SelectCoin(int buyType, int cashType, class UBTROItemBoxHK* ro);
	void ItemBuyWindowProcess(int ItemID);
	bool InternalOnUseCapsule(class UGUIComponent* Sender);
	void SetItemCount(int Count);
	void AllEnd();
	void Initialize(class UBTTcpLink_Channel* _tcpChannel, class UwItemBoxHK* _itemInfo, int _capsuleCount, const struct FBtrDouble& _uniqueID, int _keyCount, const struct FBtrDouble& _keyUniqueID);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void ClickShowCashChargeWindow();
	void ClickInventory();
};


// Class GUIWarfareControls.BTWindowOptionHK
// 0x0058 (0x0518 - 0x04C0)
class UBTWindowOptionHK : public UBTWindowHK
{
public:
	string                                             strUIChangeOption;                                        // 0x04C0(0x000C) (Localized, NeedCtorLink)
	string                                             strReset;                                                 // 0x04CC(0x000C) (Localized, NeedCtorLink)
	string                                             strVoiceLangChangeMsg;                                    // 0x04D8(0x000C) (Localized, NeedCtorLink)
	string                                             strAnd;                                                   // 0x04E4(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonReset;                                            // 0x04F0(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonReset;                                              // 0x0500(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPOption;                                               // 0x0504(0x0010)
	class UBTTPOptionHK*                               TPOption;                                                 // 0x0514(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowOptionHK");
		return ptr;
	}


	void Default_FadedOut();
	bool ButtonReset_OnClick(class UGUIComponent* Sender);
	bool ButtonCancel_OnClick(class UGUIComponent* Sender);
	bool ButtonInUI_OnOK(class UGUIComponent* Sender);
	bool ButtonOK_OnClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPOptionHK
// 0x00DC (0x041C - 0x0340)
class UBTTPOptionHK : public UBTTabPanelHK
{
public:
	string                                             strButtonTab[0x5];                                        // 0x0340(0x000C) (Localized, NeedCtorLink)
	class UTabControlMocker*                           TabControl;                                               // 0x037C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTab[0x5];                                         // 0x0380(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTab[0x5];                                           // 0x03D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPPanel;                                                // 0x03E4(0x0010)
	class UBTTPOptionBaseHK*                           TPPanel[0x5];                                             // 0x03F4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPOptionGraphicHK*                        TPGraphic;                                                // 0x0408(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPOptionSoundHK*                          TPSound;                                                  // 0x040C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPOptionInputHK*                          TPInput;                                                  // 0x0410(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPOptionCommunityHK*                      TPCommunity;                                              // 0x0414(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPOptionETCHK*                            TPETC;                                                    // 0x0418(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPOptionHK");
		return ptr;
	}


	void DefaultResetData();
	void ResetData();
	void SaveData();
	bool ButtonAdvance_OnClick(class UGUIComponent* Sender);
	bool ButtonTab_OnClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowInviteClanWarGameHK
// 0x00E0 (0x05A0 - 0x04C0)
class UBTWindowInviteClanWarGameHK : public UBTWindowHK
{
public:
	int                                                ServerID;                                                 // 0x04C0(0x0004)
	int                                                ChannelID;                                                // 0x04C4(0x0004)
	string                                             RoomUniqueID;                                             // 0x04C8(0x000C) (NeedCtorLink)
	int                                                RoomNumber;                                               // 0x04D4(0x0004)
	string                                             InviterName;                                              // 0x04D8(0x000C) (NeedCtorLink)
	string                                             Password;                                                 // 0x04E4(0x000C) (NeedCtorLink)
	float                                              ElipsedTime;                                              // 0x04F0(0x0004)
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x04F4(0x0004)
	string                                             strGameState[0x2];                                        // 0x04F8(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbRoomInfo;                                               // 0x0510(0x0010)
	class UBTLabelRoomInfoHK*                          RoomInfo;                                                 // 0x0520(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabel[0x3];                                             // 0x0524(0x0010)
	struct FText[]                                     arrLabel;                                                 // 0x0554(0x000C) (NeedCtorLink)
	string                                             strLabel[0x3];                                            // 0x0560(0x000C) (Localized, NeedCtorLink)
	string                                             strTemp;                                                  // 0x0584(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawTextArrayHK*                     LabelTextArray;                                           // 0x0590(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         Label[0x3];                                               // 0x0594(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowInviteClanWarGameHK");
		return ptr;
	}


	bool Internal_OnPreDraw(class UCanvas* C);
	void SetData(const string& where, const string& Who);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowInviteGameHK
// 0x00E0 (0x05A0 - 0x04C0)
class UBTWindowInviteGameHK : public UBTWindowHK
{
public:
	int                                                ServerID;                                                 // 0x04C0(0x0004)
	int                                                ChannelID;                                                // 0x04C4(0x0004)
	string                                             RoomUniqueID;                                             // 0x04C8(0x000C) (NeedCtorLink)
	int                                                RoomNumber;                                               // 0x04D4(0x0004)
	string                                             InviterName;                                              // 0x04D8(0x000C) (NeedCtorLink)
	string                                             Password;                                                 // 0x04E4(0x000C) (NeedCtorLink)
	float                                              ElipsedTime;                                              // 0x04F0(0x0004)
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x04F4(0x0004)
	string                                             strGameState[0x2];                                        // 0x04F8(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbRoomInfo;                                               // 0x0510(0x0010)
	class UBTLabelRoomInfoHK*                          RoomInfo;                                                 // 0x0520(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabel[0x3];                                             // 0x0524(0x0010)
	struct FText[]                                     arrLabel;                                                 // 0x0554(0x000C) (NeedCtorLink)
	string                                             strLabel[0x3];                                            // 0x0560(0x000C) (Localized, NeedCtorLink)
	string                                             strTemp;                                                  // 0x0584(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawTextArrayHK*                     LabelTextArray;                                           // 0x0590(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         Label[0x3];                                               // 0x0594(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowInviteGameHK");
		return ptr;
	}


	bool Internal_OnPreDraw(class UCanvas* C);
	void SetData(const string& where, const string& Who);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowItemBoxHK
// 0x004C (0x050C - 0x04C0)
class UBTWindowItemBoxHK : public UBTWindowHK
{
public:
	int                                                BoxItemID;                                                // 0x04C0(0x0004)
	struct FBtrDouble                                  BoxUniqueID;                                              // 0x04C4(0x0008)
	int                                                FromContent;                                              // 0x04CC(0x0004)
	struct FFloatBox                                   fbTPItemList;                                             // 0x04D0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPItemListHK*                             TPItemList;                                               // 0x04E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelDivider;                                           // 0x04E4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelDivider;                                             // 0x04F4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbInfoBox;                                                // 0x04F8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTItemInfoHorzBoxHK*                        InfoBox;                                                  // 0x0508(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowItemBoxHK");
		return ptr;
	}


	void AddItem(int ItemID, int PartID);
	int GetLastSelectPartID();
	int GetLastSelectItemID();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetFromContent(int _from);
	bool SelectItem(int Index);
	bool ImageListBox_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfareControls.BTWindowCapsuleOpen
// 0x009C (0x055C - 0x04C0)
class UBTWindowCapsuleOpen : public UBTWindowHK
{
public:
	class UwGameManager*                               GameMgr;                                                  // 0x04C0(0x0004)
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x04C4(0x0004)
	struct FBtrDouble                                  KeyUniqueID;                                              // 0x04C8(0x0008)
	struct FFloatBox                                   fbImageItem;                                              // 0x04D0(0x0010)
	struct FFloatBox                                   fbLabelItemName;                                          // 0x04E0(0x0010)
	struct FFloatBox                                   fbLabelRemainName;                                        // 0x04F0(0x0010)
	struct FFloatBox                                   fbLabelDesc;                                              // 0x0500(0x0010)
	class UBTOwnerDrawImageHK*                         ImageItem;                                                // 0x0510(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelItemName;                                            // 0x0514(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelRemainName;                                          // 0x0518(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelDesc;                                                // 0x051C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbComboBoxCapsule;                                        // 0x0520(0x0010)
	struct FFloatBox                                   fbBackgroundComboBoxCapsule;                              // 0x0530(0x0010)
	class UBTComboCapsuleData*                         ComboCapsuleData;                                         // 0x0540(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strRemainName;                                            // 0x0544(0x000C) (Localized, NeedCtorLink)
	string                                             strDesc;                                                  // 0x0550(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowCapsuleOpen");
		return ptr;
	}


	void ChangeComboBox();
	void FillCapsule(bool inCapsuleItem);
	bool Internal_OnOK(class UGUIComponent* Sender);
	void Initialize(int setItemID, const struct FBtrDouble& _keyUniqueID, class UBTTcpLink_Channel* setTcpChannel, class UwGameManager* GameMgr);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPTopMenuSCHK
// 0x0048 (0x0378 - 0x0330)
class UBTTPTopMenuSCHK : public UGUITabPanel
{
public:
	class UBTStretchedImageHK*                         BGImage;                                                  // 0x0330(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 QuickJoin;                                                // 0x0334(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 QuickSetup;                                               // 0x0338(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRefresh;                                            // 0x033C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 Grade;                                                    // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 Option;                                                   // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 Exit;                                                     // 0x0348(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strQuickJoin;                                             // 0x034C(0x000C) (Localized, NeedCtorLink)
	string                                             strQuickSetup;                                            // 0x0358(0x000C) (Localized, NeedCtorLink)
	string                                             strRefresh;                                               // 0x0364(0x000C) (Localized, NeedCtorLink)
	struct FScriptDelegate                             __HeaderButton_OnClick__Delegate;                         // 0x0370(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPTopMenuSCHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool TopMenuButton_OnClick(class UGUIComponent* Sender);
	bool HeaderButton_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfareControls.BTACLServerSelectionHK
// 0x017C (0x05DC - 0x0460)
class UBTACLServerSelectionHK : public UBTAutoColumnListHK
{
public:
	string                                             strToolTip[0x13];                                         // 0x0460(0x000C) (Localized, NeedCtorLink)
	struct FChannelInfo[]                              channelInfos;                                             // 0x0544(0x000C) (NeedCtorLink)
	int                                                ConnectedUser;                                            // 0x0550(0x0004)
	int                                                MaxUser;                                                  // 0x0554(0x0004)
	bool                                               bShowCount;                                               // 0x0558(0x0004)
	string                                             CurrentServerGroup;                                       // 0x055C(0x000C) (NeedCtorLink)
	class UBTRODecorateStringHK*                       ChannelToolTip;                                           // 0x0568(0x0004)
	bool                                               bShowToolTip;                                             // 0x056C(0x0004)
	string                                             strChannelToolTip;                                        // 0x0570(0x000C) (Localized, NeedCtorLink)
	class UBTACLServerSelectionHK*                     SelChannel;                                               // 0x057C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             textChobo;                                                // 0x0580(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             textServerSlash;                                          // 0x058C(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             textChannel;                                              // 0x0598(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             textLC2[0x4];                                             // 0x05A4(0x000C) (Edit, Localized, NeedCtorLink)
	struct FScriptDelegate                             __OnEnterChannel__Delegate;                               // 0x05D4(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLServerSelectionHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool MultiColumnList_OnDblClick(class UGUIComponent* Sender);
	bool Sel_ChannelClick(class UGUIComponent* Sender);
	void OnEnterChannel(class UBTACLServerSelectionHK* acl);
	void LC3_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC2_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC1_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	float GetItemHeight(class UCanvas* C);
	void AddChannelInfo(float ChannelOption);
	void RemoveAll();
};


// Class GUIWarfareControls.BTACLGroutSelection
// 0x007C (0x04DC - 0x0460)
class UBTACLGroutSelection : public UBTAutoColumnListHK
{
public:
	int                                                ConnectedUser;                                            // 0x0460(0x0004)
	int                                                MaxUser;                                                  // 0x0464(0x0004)
	bool                                               bShowCount;                                               // 0x0468(0x0004)
	string                                             CurrentServerGroup;                                       // 0x046C(0x000C) (NeedCtorLink)
	string                                             textChobo;                                                // 0x0478(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             textServerSlash;                                          // 0x0484(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             textChannel;                                              // 0x0490(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             textLC2[0x4];                                             // 0x049C(0x000C) (Edit, Localized, NeedCtorLink)
	struct FScriptDelegate                             __OnEnterChannel__Delegate;                               // 0x04CC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnSelectSvr__Delegate;                                  // 0x04D4(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLGroutSelection");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool MultiColumnList_OnClick(class UGUIComponent* Sender);
	void OnSelectSvr(class UBTACLGroutSelection* acl);
	bool MultiColumnList_OnDblClick(class UGUIComponent* Sender);
	void OnEnterChannel(class UBTACLGroutSelection* acl);
	void LC3_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC2_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC1_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	float GetItemHeight(class UCanvas* C);
};


// Class GUIWarfareControls.BTDailyQuest
// 0x0094 (0x03D4 - 0x0340)
class UBTDailyQuest : public UBTTabPanelHK
{
public:
	class UBTACLQuestHK*                               ACLQuest;                                                 // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTLabelQuestDescHK*                         LabelQuestDesc;                                           // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         puzzelBg;                                                 // 0x0348(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         puzzelPice[0x8];                                          // 0x034C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonClose;                                              // 0x036C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelDailyDesc;                                           // 0x0370(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strDaily[0x5];                                            // 0x0374(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 BtnReceiveReward;                                         // 0x03B0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelReward;                                              // 0x03B4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         PuzzleItemImg;                                            // 0x03B8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageScroll*                     RewardItemName;                                           // 0x03BC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         RewardItemCnt;                                            // 0x03C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         PopUpBg;                                                  // 0x03C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemInfoToolTipWindow*                    RewardItemInfoToolTip;                                    // 0x03C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 DummyBtn;                                                 // 0x03CC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               RewardItemNameChange;                                     // 0x03D0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTDailyQuest");
		return ptr;
	}


	void SetLabelQuestDesc(int RowIndex);
	bool ACLQuest_OnClick(class UGUIComponent* Sender);
	void InitPuzzlePiece();
	void SetVisiblePuzzlePiece();
	void ResetPuzzlepiece();
	void SetPuzzleRewardItemImage();
	void Internal_OnRendered(class UCanvas* Canvas);
	bool ReceiveRewardItem(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPOptionCommunityHK
// 0x0070 (0x0778 - 0x0708)
class UBTTPOptionCommunityHK : public UBTTPOptionBaseHK
{
public:
	class UBTACLMessengerBanHK*                        aclban;                                                   // 0x0708(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabel[0x6];                                            // 0x070C(0x000C) (Localized, NeedCtorLink)
	string                                             strAllowMode[0x3];                                        // 0x0754(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPOptionCommunityHK");
		return ptr;
	}


	bool ContextMenu_OnClose(class UGUIContextMenu* Sender);
	bool ContextMenu_OnOpen(class UGUIContextMenu* Sender);
	void UpdateBlockUserList(string[] blockuserlist);
	byte ConvertToCommuniyOption(const string& strOptName);
	void ContextMenu_OnSelected(int ContextMenuIndex);
	void SaveData();
	void ResetData();
	void InitializeContent();
	struct FFloatBox TPOptionCommunity_Content_AWinPos_Changed(int i, int vi, const struct FFloatBox& fbList);
	void InitializeLabel();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTLabelRoomInfoHK
// 0x0020 (0x03DC - 0x03BC)
class UBTLabelRoomInfoHK : public UBTOwnerDrawImageHK
{
public:
	class UBTTTRoomInfoHK*                             tT;                                                       // 0x03BC(0x0004)
	string                                             MapName;                                                  // 0x03C0(0x000C) (NeedCtorLink)
	class UMaterial*                                   MapImg;                                                   // 0x03CC(0x0004)
	class UMaterial*[]                                 supplyImg;                                                // 0x03D0(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTLabelRoomInfoHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void SetRoomInfo(const string& RoomName, int GameState, const string& roommaster, const string& GameMode, const string& Weapon, const string& HardCore, const string& gamerunning);
	void SetMapName(const string& MN);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPLuckyCapsuleInventory
// 0x0294 (0x05C4 - 0x0330)
class UBTTPLuckyCapsuleInventory : public UGUITabPanel
{
public:
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x0330(0x0004)
	class UwGameManager*                               GameMgr;                                                  // 0x0334(0x0004)
	class UwMatchMaker*                                MM;                                                       // 0x0338(0x0004)
	class UBTOwnerDrawImageHK*                         NewBackground;                                            // 0x033C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbCapsuleTitle;                                           // 0x0340(0x0010)
	struct FFloatBox                                   fbCapsuleList;                                            // 0x0350(0x0010)
	struct FFloatBox                                   fbCapsuleLeftButton;                                      // 0x0360(0x0010)
	struct FFloatBox                                   fbCapsuleRightButton;                                     // 0x0370(0x0010)
	struct FFloatBox                                   fbRewardTitle;                                            // 0x0380(0x0010)
	struct FFloatBox                                   fbRewardList;                                             // 0x0390(0x0010)
	struct FFloatBox                                   fbRewardLeftButton;                                       // 0x03A0(0x0010)
	struct FFloatBox                                   fbRewardRightButton;                                      // 0x03B0(0x0010)
	struct FFloatBox                                   fbCouponTitle;                                            // 0x03C0(0x0010)
	struct FFloatBox                                   fbCouponList;                                             // 0x03D0(0x0010)
	struct FFloatBox                                   fbCouponLeftButton;                                       // 0x03E0(0x0010)
	struct FFloatBox                                   fbCouponRightButton;                                      // 0x03F0(0x0010)
	class UBTListWithButton*                           CapsuleList;                                              // 0x0400(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTListWithButton*                           RewardList;                                               // 0x0404(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTListWithButton*                           CouponList;                                               // 0x0408(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbCapsuleDesc;                                            // 0x040C(0x0010)
	struct FFloatBox                                   fbRewardDesc;                                             // 0x041C(0x0010)
	struct FFloatBox                                   fbCouponDesc;                                             // 0x042C(0x0010)
	class UBTOwnerDrawImageHK*                         CapsuleDesc;                                              // 0x043C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         RewardDesc;                                               // 0x0440(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         CouponDesc;                                               // 0x0444(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbRewardCenterText;                                       // 0x0448(0x0010)
	struct FFloatBox                                   fbCouponCenterText;                                       // 0x0458(0x0010)
	struct FFloatBox                                   fbCapsuleRemainNameStart;                                 // 0x0468(0x0010)
	struct FFloatBox                                   fbCapsuleRemainCountStart;                                // 0x0478(0x0010)
	class UBTOwnerDrawImageHK*                         CapsuleRemainName[0x5];                                   // 0x0488(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         CapsuleRemainCount[0x5];                                  // 0x049C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbUseCapsuleButtonStart;                                  // 0x04B0(0x0010)
	struct FFloatBox                                   fbCapsuleRewardButtonStart;                               // 0x04C0(0x0010)
	struct FFloatBox                                   fbUseCouponButtonStart;                                   // 0x04D0(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 UseCapsuleButton[0x5];                                    // 0x04E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 CapsuleRewardButton[0x5];                                 // 0x04F4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 UseCouponButton[0x5];                                     // 0x0508(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTROIncludeItemPopup*                       IncludeItemPopup;                                         // 0x051C(0x0004)
	int                                                BuyingCapsuleCount;                                       // 0x0520(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 LastClickedRewardButton;                                  // 0x0524(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strCapsuleTitle;                                          // 0x0528(0x000C) (Localized, NeedCtorLink)
	string                                             strRewardTitle;                                           // 0x0534(0x000C) (Localized, NeedCtorLink)
	string                                             strCouponTitle;                                           // 0x0540(0x000C) (Localized, NeedCtorLink)
	string                                             strCapsuleDesc;                                           // 0x054C(0x000C) (Localized, NeedCtorLink)
	string                                             strRewardDesc;                                            // 0x0558(0x000C) (Localized, NeedCtorLink)
	string                                             strCouponDesc;                                            // 0x0564(0x000C) (Localized, NeedCtorLink)
	string                                             strCapsuleRemainName;                                     // 0x0570(0x000C) (Localized, NeedCtorLink)
	string                                             strCapsuleRemainCount;                                    // 0x057C(0x000C) (Localized, NeedCtorLink)
	string                                             strUseCapsuleButton;                                      // 0x0588(0x000C) (Localized, NeedCtorLink)
	string                                             strCapsuleBuyRewardButton;                                // 0x0594(0x000C) (Localized, NeedCtorLink)
	string                                             strCouponRewardButton;                                    // 0x05A0(0x000C) (Localized, NeedCtorLink)
	string                                             strCapsuleBuyRewardInfo;                                  // 0x05AC(0x000C) (Localized, NeedCtorLink)
	string                                             strCouponRewardInfo;                                      // 0x05B8(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPLuckyCapsuleInventory");
		return ptr;
	}


	void CheckRewardPopup(class UCanvas* C, class UBTListWithButton* checkList);
	void CheckCapsulePopup(class UCanvas* C, class UBTListWithButton* checkList);
	void Internal_OnRendered(class UCanvas* C);
	void InserItemCheckNeedNum(class UBTRORewardDecorate* inserItem, class UObject*[]* insertList);
	void WaitWindow_OnTimeOut(class UGUIComponent* Sender);
	void ShowWaitWindow();
	void SetCapsuleRewardInfo(int _buyingCapsuleCount, int _capsuleRewardState);
	void ChangeCouponList();
	void ChangeRewardList();
	void ChangeCapsuleList();
	bool BTWindowItemBoxHK_OnOK(class UGUIComponent* Sender);
	bool OnClickCoupon(class UGUIComponent* Sender);
	bool OnClickReward(class UGUIComponent* Sender);
	bool OnClickUse(class UGUIComponent* Sender);
	void RefreshCouponButton();
	void RefreshRewardButton();
	void RefreshUseCapsuleButton();
	void RefreshAllButton();
	void FillReward(int _buyingCapsuleCount, int _capsuleRewardState);
	void FillCapsule();
	void AddButton(const struct FFloatBox& fbButton, const string& strCaption, int FontSize, class UBTOwnerDrawCaptionButtonHK** AddButton);
	void AddLabel(const struct FFloatBox& fbComponent, const string& strCaption, int FontSize, const struct FColor& TextColor, EDrawType dt, class UBTOwnerDrawImageHK** AddComponent);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowQuickEnterRoomHK
// 0x00EC (0x05AC - 0x04C0)
class UBTWindowQuickEnterRoomHK : public UBTWindowHK
{
public:
	int                                                GameMode;                                                 // 0x04C0(0x0004) (Config)
	int                                                Map;                                                      // 0x04C4(0x0004) (Config)
	int                                                MapID;                                                    // 0x04C8(0x0004) (Config)
	int                                                WeaponRestriction;                                        // 0x04CC(0x0004) (Config)
	int                                                SubModeIdx;                                               // 0x04D0(0x0004) (Config)
	string                                             strLabel[0x3];                                            // 0x04D4(0x000C) (Localized, NeedCtorLink)
	string                                             strAllMaps;                                               // 0x04F8(0x000C) (Localized, NeedCtorLink)
	string                                             strAllModes;                                              // 0x0504(0x000C) (Localized, NeedCtorLink)
	string                                             strAllSubMode;                                            // 0x0510(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         Label[0x3];                                               // 0x051C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UButtonGroups*                               GroupGameMode;                                            // 0x0528(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTCheckBoxHK*[]                             ButtonGameMode;                                           // 0x052C(0x000C) (NeedCtorLink)
	class UButtonGroups*                               GroupMap;                                                 // 0x0538(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTCheckBoxHK*[]                             ButtonMap;                                                // 0x053C(0x000C) (NeedCtorLink)
	class UButtonGroups*                               GroupSubMode;                                             // 0x0548(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTCheckBoxHK*[]                             ButtonSubMode;                                            // 0x054C(0x000C) (NeedCtorLink)
	bool                                               bCancelled;                                               // 0x0558(0x0004)
	class UBTOwnerDrawImageHK*                         LabelMap;                                                 // 0x055C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTComboBoxHK*                               ComboMap;                                                 // 0x0560(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelGameMode;                                            // 0x0564(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTComboBoxHK*                               ComboGameMode;                                            // 0x0568(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelSubMode;                                             // 0x056C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTComboBoxHK*                               ComboSubMode;                                             // 0x0570(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*[]               GameModeBtnList;                                          // 0x0574(0x000C) (NeedCtorLink)
	class UwMatchMaker*                                MatchMaker;                                               // 0x0580(0x0004) (Transient)
	class UBTOwnerDrawImageHK*                         ImageMap;                                                 // 0x0584(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         ImageSupply[0x3];                                         // 0x0588(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         NewMapIcon;                                               // 0x0594(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	byte                                               nSelGameMode;                                             // 0x0598(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0599(0x0003) MISSED OFFSET
	class UBTRODecorateStringHK*                       btToolTip;                                                // 0x059C(0x0004)
	struct FGameModeInfo[]                             GameModeInfos;                                            // 0x05A0(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowQuickEnterRoomHK");
		return ptr;
	}


	int GetGameModeIndex();
	void SetGameModeIndex(int idx);
	void SetGameModeByExtraDataIndex(int idx);
	string GetGameModeClass();
	void FillSubMode();
	bool SelGameMode(class UGUIComponent* Sender);
	string GetMapName();
	void InitGameModeList(bool bSet, int Index);
	int GetSubModeIDFromComboIndex(int idx);
	int GetMapIDFromComboIndex(int idx);
	int GetSelectedMapID();
	void ApplyLocalizedStrings();
	void FillSubModeList();
	void FloatingRendered(class UCanvas* C);
	void FillMapList(int nIndex);
	void ComboMap_OnChange(class UGUIComponent* Sender);
	bool OnCancel(class UGUIComponent* Sender);
	string InternalOnSaveINI(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowPasswordHK
// 0x0048 (0x0508 - 0x04C0)
class UBTWindowPasswordHK : public UBTWindowHK
{
public:
	string                                             strLabel;                                                 // 0x04C0(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel;                                                  // 0x04CC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelPass;                                              // 0x04DC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbEditPass;                                               // 0x04EC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label;                                                    // 0x04FC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelPass;                                                // 0x0500(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTEditBoxHK*                                EditPass;                                                 // 0x0504(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowPasswordHK");
		return ptr;
	}


	void SetData();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTACLLobbyHK
// 0x0070 (0x04D0 - 0x0460)
class UBTACLLobbyHK : public UBTAutoColumnListHK
{
public:
	class UBTTTRoomInfoHK*                             tT;                                                       // 0x0460(0x0004) (Edit, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strGameState[0x2];                                        // 0x0464(0x000C) (Localized, NeedCtorLink)
	string                                             strCW_GameMode[0x3];                                      // 0x047C(0x000C) (Localized, NeedCtorLink)
	string                                             onoff[0x2];                                               // 0x04A0(0x000C) (Edit, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string[]                                           strWeaponRestrict;                                        // 0x04B8(0x000C) (NeedCtorLink)
	string[]                                           strBotDifficult;                                          // 0x04C4(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLLobbyHK");
		return ptr;
	}


	void OnRendered(class UCanvas* C);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	int IntToPingImgIndex(int Index);
	string IntToGameState(int Index);
	bool ChangeRoomOwenrName(const string& old_name, const string& new_name);
	void ChangeRoomOwnerInfo(int idx, const string& OwnerName, const string& OwnerIP);
	void ChangeRoomUserCount(int i, int CurUser);
	void ChangeRoomState(int i, int game_state);
	void ChangeRoomInfo(int i, const string& room_name, const string& map_name, int map_num, int game_mode, byte IsTeamBalance, int CurUser, int MaxUser, int game_state, byte IsPW, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum);
	void ChangeRoomName(int i, const string& room_name);
	void RemoveAll();
	void RemoveRow(int Index);
	bool RemoveByGameNumber(int GameNumber);
	string SetPingStatus(int Index, int Status);
	string GetMasterIP(int Index);
	void AddRowNoAlign(class UBTAutoColumnListDataHK* Item, int Index);
	void AddRow(class UBTAutoColumnListDataHK* Item, bool bSet, int Index);
	void RemoveRowArray(int StartIndex, int endLength);
	int PingToIndex(int msec);
	void SetRoomPingStatus(const string& IP, int msec);
	string GetRoomOwnerIP(int Index);
	void ReplaceRoomCW(int Index, int WaitRoomIdx, const string& LeaderName, const string& RoomName, const string& MapName, int MapNum, int CurUserCount, int MaxUserCount, int Status);
	void AddRoomCW(int WaitRoomIdx, const string& LeaderName, const string& RoomName, const string& MapName, int MapNum, int CurUserCount, int MaxUserCount, int Status);
	bool RemoveByGameNumberCW(int cw_no);
	void AddRoomInteligenceCW(int WaitRoomIdx, const string& LeaderName, const string& RoomName, const string& MapName, int MapNum, int CurUserCount, int MaxUserCount, int Status);
	void ReplaceRoom(int Index, int SP, int no, int PASS, const string& room_name, const string& map_name, int map_num, int game_mode, int restrict, int CurUser, int MaxUser, int game_state, int Ping, const string& masterIP, int game_minute, int teambalance, const string& room_owner, int BotDifficult, int BotUserTeam, int cw_no);
	int FindRoomNo(int no, int cw_no);
	void AddRoom(int SP, int no, int PASS, const string& room_name, const string& map_name, int map_num, int game_mode, int restrict, int CurUser, int MaxUser, int game_state, int Ping, const string& masterIP, int game_minute, int teambalance, const string& room_owner, int BotDifficult, int BotUserTeam, int cw_no);
	void AddRoomInteligence(int SP, int no, int PASS, const string& room_name, const string& map_name, int map_num, int game_mode, int restrict, int CurUser, int MaxUser, int game_state, int Ping, const string& masterIP, int game_minute, int teambalance, const string& room_owner, int BotDifficult, int BotUserTeam, int cw_no);
	void LC9_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC7_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC6_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC3_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC2_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	float GetItemHeight(class UCanvas* C);
};


// Class GUIWarfareControls.BTTTRoomInfoHK
// 0x020C (0x024C - 0x0040)
class UBTTTRoomInfoHK : public URenderObject
{
public:
	bool                                               bBotMode;                                                 // 0x0040(0x0004)
	bool                                               bOverlapControl;                                          // 0x0040(0x0004)
	string                                             strGameState[0x2];                                        // 0x0044(0x000C) (Localized, NeedCtorLink)
	int                                                FontTitleSize;                                            // 0x005C(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                FontSize;                                                 // 0x0060(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                FontMapNameSize;                                          // 0x0064(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FColor                                      FontTitleColor;                                           // 0x0068(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FColor                                      FontColor;                                                // 0x006C(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FColor                                      FontShadowColor;                                          // 0x0070(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FImage                                      BackgroundImage;                                          // 0x0074(0x0020)
	struct FImage                                      MapImage;                                                 // 0x0094(0x0020)
	struct FImage[]                                    SupplyImage;                                              // 0x00B4(0x000C) (NeedCtorLink)
	struct FFloatBox                                   fbTitle;                                                  // 0x00C0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbGameState;                                              // 0x00D0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbMapName;                                                // 0x00E0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbMapImage;                                               // 0x00F0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbHeader[0x5];                                            // 0x0100(0x0010)
	struct FFloatBox                                   fbData[0x5];                                              // 0x0150(0x0010)
	string                                             strHeader[0x6];                                           // 0x01A0(0x000C) (Localized, NeedCtorLink)
	string                                             strTitle;                                                 // 0x01E8(0x000C) (NeedCtorLink)
	string                                             strCurGameState;                                          // 0x01F4(0x000C) (NeedCtorLink)
	string                                             strMapName;                                               // 0x0200(0x000C) (NeedCtorLink)
	string                                             strData[0x5];                                             // 0x020C(0x000C) (NeedCtorLink)
	int                                                SelectedIndex;                                            // 0x0248(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTTRoomInfoHK");
		return ptr;
	}


	bool RenderFixed(class UCanvas* C, float Delta);
	bool Render(class UCanvas* C, float Delta);
	void SetData(const string& RoomName, int GameState, const string& MapName, class UMaterial* MapImg, class UMaterial*[] supplyImg, const string& roommaster, const string& GameMode, const string& Weapon, const string& HardCore, const string& gamerunning, bool bBotMode);
	void ChangeSelectedIndex(int i);
	void Init();
};


// Class GUIWarfareControls.BTWindowCreateRoom
// 0x0650 (0x0B10 - 0x04C0)
class UBTWindowCreateRoom : public UBTWindowHK
{
public:
	string                                             DefaultRandomRoomName;                                    // 0x04C0(0x000C) (NeedCtorLink)
	class UBTOwnerDrawImageHK*                         LabelRoomName;                                            // 0x04CC(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         BorderRoomName;                                           // 0x04D0(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTEditBoxHK*                                EditRoomName;                                             // 0x04D4(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelPassword;                                            // 0x04D8(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         BorderPassword;                                           // 0x04DC(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTEditBoxHK*                                EditPassword;                                             // 0x04E0(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelMap;                                                 // 0x04E4(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTComboBoxHK*                               ComboMap;                                                 // 0x04E8(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelGameMode;                                            // 0x04EC(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTComboBoxHK*                               ComboGameMode;                                            // 0x04F0(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelCapacity;                                            // 0x04F4(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTComboBoxHK*                               ComboCapacity;                                            // 0x04F8(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelWeaponRestriction;                                   // 0x04FC(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTComboBoxHK*                               ComboWeaponRestriction;                                   // 0x0500(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelScore;                                               // 0x0504(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTComboBoxHK*                               ComboScore;                                               // 0x0508(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelDefenceModeLevel;                                    // 0x050C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTComboBoxHK*                               ComboDefenceModeLevel;                                    // 0x0510(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTime;                                                // 0x0514(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTComboBoxHK*                               comboTime;                                                // 0x0518(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelBlance;                                              // 0x051C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         ImageMap;                                                 // 0x0520(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         ImageSupply[0x3];                                         // 0x0524(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         NewMapIcon;                                               // 0x0530(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelReSpawn;                                             // 0x0534(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UwMatchMaker*                                MatchMaker;                                               // 0x0538(0x0004) (Transient)
	struct FGameModeInfo[]                             GameModeInfos;                                            // 0x053C(0x000C) (NeedCtorLink)
	int                                                DefaultRoomNamesCount;                                    // 0x0548(0x0004) (Localized)
	string                                             DefaultRoomNames[0x64];                                   // 0x054C(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionMakeRoom;                                          // 0x09FC(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionRoomName;                                          // 0x0A08(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionPassword;                                          // 0x0A14(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionMap;                                               // 0x0A20(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionGameMode;                                          // 0x0A2C(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionCapacity;                                          // 0x0A38(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionWeaponRestriction;                                 // 0x0A44(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionScore;                                             // 0x0A50(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionTime;                                              // 0x0A5C(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionBlance;                                            // 0x0A68(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionReSpawn;                                           // 0x0A74(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionRandom;                                            // 0x0A80(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionFixed;                                             // 0x0A8C(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionDefenceModeLevel;                                  // 0x0A98(0x000C) (Localized, NeedCtorLink)
	string                                             strLabeDF_Difficult[0x4];                                 // 0x0AA4(0x000C) (Localized, NeedCtorLink)
	class UBTRadioOnOffButtonHK*                       TeamBlanceRadioBtn;                                       // 0x0AD4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbRadio;                                                  // 0x0AD8(0x0010)
	class UBTRadioOnOffButtonHK*                       ReSpawnRadioBtn;                                          // 0x0AE8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbReSpawnRadio;                                           // 0x0AEC(0x0010)
	class UBTRODecorateStringHK*                       btToolTip;                                                // 0x0AFC(0x0004)
	class UBTOwnerDrawCaptionButtonHK*[]               GameModeBtnList;                                          // 0x0B00(0x000C) (NeedCtorLink)
	byte                                               nSelGameMode;                                             // 0x0B0C(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0B0D(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowCreateRoom");
		return ptr;
	}


	void FloatingRendered(class UCanvas* C);
	void ComboMap_OnChange(class UGUIComponent* Sender);
	void SetRadioRespawnType(int RespawnType);
	void SetRandomRoomName();
	void ComboGameMode_OnChange(class UGUIComponent* Sender);
	void FillWindow();
	void SetWeaponRestriction(int Value);
	void FillDefenceModeLevel();
	void FillWeaponRestrictions();
	void FillCapacity();
	void FillGameTimeList();
	void FillScoreList();
	bool SelGameMode(class UGUIComponent* Sender);
	void FillGameModeList(bool bSet, int Index);
	void FillMapList();
	int GetMapIDFromComboIndex(int idx);
	int GetSelectedMapID();
	int GetBotDifficultLevel();
	int GetBotModeUserTeam();
	int GetWeaponLimit();
	int GetMapIndex();
	string GetMapName();
	string GetMapFriendlyName();
	int GetGameModeIndex();
	void SetGameModeIndex(int idx);
	void SetGameModeByExtraDataIndex(int idx);
	string GetGameModeClass();
	void Opened(class UGUIComponent* Sender);
	void ApplyLocalizedStrings();
	void InitializeCombos();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTACLLobbyHKCN
// 0x00EC (0x05BC - 0x04D0)
class UBTACLLobbyHKCN : public UBTACLLobbyHK
{
public:
	class UBTTTRoomInfoHKCN*                           tT;                                                       // 0x04D0(0x0004) (Edit, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FImage                                      ImgWeaponRestrict[0x7];                                   // 0x04D4(0x0020)
	class UBTRODecorateStringHK*                       SubModeToolTip;                                           // 0x05B4(0x0004)
	bool                                               isChangeTTInfo;                                           // 0x05B8(0x0004)
	bool                                               bShowSubModeToolTip;                                      // 0x05B8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLLobbyHKCN");
		return ptr;
	}


	void OnRendered(class UCanvas* C);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	int IntToPingImgIndex(int Index);
	string IntToGameState(int Index);
	void ChangeRoomOwnerInfo(int idx, const string& OwnerName, const string& OwnerIP);
	void ChangeRoomUserCount(int i, int CurUser);
	void ChangeRoomState(int i, int game_state);
	void ChangeRoomInfo(int i, const string& room_name, const string& map_name, int map_num, int game_mode, byte IsTeamBalance, int CurUser, int MaxUser, int game_state, byte IsPW, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum);
	void ChangeRoomName(int i, const string& room_name);
	void RemoveAll();
	void RemoveRow(int Index);
	bool RemoveByGameNumber(int GameNumber);
	string SetPingStatus(int Index, int Status);
	string GetMasterIP(int Index);
	void AddRowNoAlign(class UBTAutoColumnListDataHK* Item, int Index);
	void AddRow(class UBTAutoColumnListDataHK* Item, bool bSet, int Index);
	void RemoveRowArray(int StartIndex, int endLength);
	int PingToIndex(int msec);
	void SetRoomPingStatus(const string& IP, int msec);
	string GetRoomOwnerIP(int Index);
	void ReplaceRoomCW(int Index, int WaitRoomIdx, const string& LeaderName, const string& RoomName, const string& MapName, int MapNum, int CurUserCount, int MaxUserCount, int Status);
	void AddRoomCW(int WaitRoomIdx, const string& LeaderName, const string& RoomName, const string& MapName, int MapNum, int CurUserCount, int MaxUserCount, int Status);
	bool RemoveByGameNumberCW(int cw_no);
	void AddRoomInteligenceCW(int WaitRoomIdx, const string& LeaderName, const string& RoomName, const string& MapName, int MapNum, int CurUserCount, int MaxUserCount, int Status);
	void ReplaceRoom(int Index, int SP, int no, int PASS, const string& room_name, const string& map_name, int map_num, int game_mode, int restrict, int CurUser, int MaxUser, int game_state, int Ping, const string& masterIP, int game_minute, int teambalance, const string& room_owner, int BotDifficult, int BotUserTeam, int cw_no);
	int FindRoomNo(int no, int cw_no);
	void AddRoom(int SP, int no, int PASS, const string& room_name, const string& map_name, int map_num, int game_mode, int restrict, int CurUser, int MaxUser, int game_state, int Ping, const string& masterIP, int game_minute, int teambalance, const string& room_owner, int BotDifficult, int BotUserTeam, int cw_no);
	void AddRoomInteligence(int SP, int no, int PASS, const string& room_name, const string& map_name, int map_num, int game_mode, int restrict, int CurUser, int MaxUser, int game_state, int Ping, const string& masterIP, int game_minute, int teambalance, const string& room_owner, int BotDifficult, int BotUserTeam, int cw_no);
	void LC9_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC7_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC6_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC11_Draw_GameState(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC10_Draw_No(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void DrawSubMode(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void DrawGameMode(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void DrawMapName(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC3_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC2_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	float GetItemHeight(class UCanvas* C);
};


// Class GUIWarfareControls.BTTTRoomInfoHKCN
// 0x0258 (0x0298 - 0x0040)
class UBTTTRoomInfoHKCN : public URenderObject
{
public:
	bool                                               bBotMode;                                                 // 0x0040(0x0004)
	bool                                               bOverlapControl;                                          // 0x0040(0x0004)
	string                                             strGameState[0x2];                                        // 0x0044(0x000C) (Localized, NeedCtorLink)
	int                                                FontTitleSize;                                            // 0x005C(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                FontSize;                                                 // 0x0060(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                FontMapNameSize;                                          // 0x0064(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FColor                                      FontTitleColor;                                           // 0x0068(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FColor                                      FontColor;                                                // 0x006C(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FColor                                      FontShadowColor;                                          // 0x0070(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FImage                                      BackgroundImage;                                          // 0x0074(0x0020)
	struct FImage                                      MapImage;                                                 // 0x0094(0x0020)
	struct FImage[]                                    SupplyImage;                                              // 0x00B4(0x000C) (NeedCtorLink)
	struct FFloatBox                                   fbTitle;                                                  // 0x00C0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbGameState;                                              // 0x00D0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbMapName;                                                // 0x00E0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbMapImage;                                               // 0x00F0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbHeader[0x6];                                            // 0x0100(0x0010)
	struct FFloatBox                                   fbData[0x6];                                              // 0x0160(0x0010)
	string                                             strHeader[0x6];                                           // 0x01C0(0x000C) (Localized, NeedCtorLink)
	string                                             strTitle;                                                 // 0x0208(0x000C) (NeedCtorLink)
	string                                             strCurGameState;                                          // 0x0214(0x000C) (NeedCtorLink)
	string                                             strMapName;                                               // 0x0220(0x000C) (NeedCtorLink)
	string                                             strData[0x6];                                             // 0x022C(0x000C) (NeedCtorLink)
	int                                                SelectedIndex;                                            // 0x0274(0x0004)
	int                                                iGameMode;                                                // 0x0278(0x0004)
	struct FFloatBox                                   fbModeWeaponLimit;                                        // 0x027C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strAlienModeLimit;                                        // 0x028C(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTTRoomInfoHKCN");
		return ptr;
	}


	bool RenderFixed(class UCanvas* C, float Delta);
	bool Render(class UCanvas* C, float Delta);
	void SetData(const string& RoomName, int GameState, const string& MapName, class UMaterial* MapImg, class UMaterial*[] supplyImg, const string& roommaster, const string& GameMode, const string& Weapon, const string& HardCore, const string& gamerunning, bool bBotMode, const string& CurMaxUser, int GameModeNum);
	void ChangeSelectedIndex(int i);
	void Init();
};


// Class GUIWarfareControls.BTTPCWMessengerHK
// 0x0148 (0x0478 - 0x0330)
class UBTTPCWMessengerHK : public UGUITabPanel
{
public:
	class UBTOwnerDrawCaptionButtonHK*                 ButtonMainPCBang;                                         // 0x0330(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTStretchedImageHK*                         BackgroundImage;                                          // 0x0334(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTStretchedImageHK*                         ListBoundImage[0x3];                                      // 0x0338(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UTabControlMocker*                           TabControl;                                               // 0x0344(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*[]               ButtonMsg;                                                // 0x0348(0x000C) (NeedCtorLink)
	class UBTAutoColumnListHK*[]                       ACLMsg;                                                   // 0x0354(0x000C) (NeedCtorLink)
	class UBTContextMenuHK*[]                          CMMsg;                                                    // 0x0360(0x000C) (NeedCtorLink)
	string                                             strCombatState[0x3];                                      // 0x036C(0x000C) (Localized, NeedCtorLink)
	string                                             strConnected;                                             // 0x0390(0x000C) (Localized, NeedCtorLink)
	string                                             strFriend;                                                // 0x039C(0x000C) (Localized, NeedCtorLink)
	string                                             strClan;                                                  // 0x03A8(0x000C) (Localized, NeedCtorLink)
	string                                             strDeny;                                                  // 0x03B4(0x000C) (Localized, NeedCtorLink)
	string                                             strPCBang;                                                // 0x03C0(0x000C) (Localized, NeedCtorLink)
	string                                             strOffLine;                                               // 0x03CC(0x000C) (Localized, NeedCtorLink)
	string                                             strLogout;                                                // 0x03D8(0x000C) (Localized, NeedCtorLink)
	string                                             strMainPCBang[0x4];                                       // 0x03E4(0x000C) (Localized, NeedCtorLink)
	string                                             strWinLose;                                               // 0x0414(0x000C) (Localized, NeedCtorLink)
	struct FScriptDelegate                             __OnPopupChannel__Delegate;                               // 0x0420(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnPopupFriend__Delegate;                                // 0x0428(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnPopupClan__Delegate;                                  // 0x0430(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnPopupPCBang__Delegate;                                // 0x0438(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnPopupChannelCheck__Delegate;                          // 0x0440(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnPopupFriendCheck__Delegate;                           // 0x0448(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnPopupClanCheck__Delegate;                             // 0x0450(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnPopupPCBangCheck__Delegate;                           // 0x0458(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __ChannelUserList_OnHitBottom__Delegate;                  // 0x0460(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __ChannelUserList_OnHitTop__Delegate;                     // 0x0468(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __ChannelUserList_OnAdjustWindow__Delegate;               // 0x0470(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPCWMessengerHK");
		return ptr;
	}


	class UBTAutoColumnListHK* GetMessengerType(byte CommunityType);
	void Internal_OnVisiblePanelChanged(int Index);
	void UpdatePCBangInfo();
	bool ButtonMainPCBang_Playing_OnClick(class UGUIComponent* Sender);
	bool ButtonMainPCBang_Change_OnClick(class UGUIComponent* Sender);
	bool ButtonMainPCBang_Register_OnClick(class UGUIComponent* Sender);
	bool BTWindowDefineARHK_18_19_OnOK(class UGUIComponent* Sender);
	void HideTabButton(int Index);
	void ShowTabButton(int Index);
	void ReplaceClanLevel(byte CommunityType, const string& ClanName, int ClanLevel);
	void UpdateTabButtonPosition();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void BTACLCWMessengerChannelHK_OnHitTop(int Top, int Count, int itemperpage);
	void BTACLCWMessengerChannelHK_OnHitBottom(int Top, int Count, int itemperpage);
	void BTACLCWMessengerChannelHK_OnAdjustWindow(int Top, int Count, int itemperpage);
	void ChannelUserList_OnAdjustWindow(int Top, int Count, int itemperpage);
	void ChannelUserList_OnHitTop(int Top, int Count, int itemperpage);
	void ChannelUserList_OnHitBottom(int Top, int Count, int itemperpage);
	void ContextMenu_OnSelected(int ContextMenuIndex);
	void OnPopupPCBangCheck(class UBTACLMessengerPCBangHK* acl, class UBTCMMessengerPCBangHK* cm);
	void OnPopupClanCheck(class UBTACLCWMessengerClanHK* acl, class UBTCMMessengerClanHK* cm);
	void OnPopupFriendCheck(class UBTACLCWMessengerFriendHK* acl, class UBTCMMessengerFriendHK* cm);
	void OnPopupChannelCheck(class UBTACLCWMessengerChannelHK* acl, class UBTCMMessengerChannelHK* cm);
	void OnPopupCheck(int Panel, class UBTAutoColumnListHK* acl);
	void OnPopupPCBang(int ContextMenuIndex, class UBTACLMessengerPCBangHK* acl);
	void OnPopupClan(int ContextMenuIndex, class UBTACLCWMessengerClanHK* acl);
	void OnPopupFriend(int ContextMenuIndex, class UBTACLCWMessengerFriendHK* acl);
	void OnPopupChannel(int ContextMenuIndex, class UBTACLCWMessengerChannelHK* acl);
	bool ContextMenu_OnClose(class UGUIContextMenu* Sender);
	bool ContextMenu_OnOpen(class UGUIContextMenu* Sender);
	void LoadPos(int Panel);
	void SavePos(int Panel);
	void RemoveAll(int Panel);
	void RemoveChannelUser(int UID);
	int FindFriendFromUserName(const string& UserName);
	void AddPCBangUser(const string& UserName, int ClanMark, int ClanBG, int ClanBL, const string& ClanName, int Level, const string& ServerName, const string& ServerIP, int serverPort, int CurPos, int ChannelNum, const string& ChannelNickName, int RoomNum, int ClanGrade, int ClanWin, int ClanLose, byte IsLookForClan, int IsCombat, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	void AddClanUser(const string& UserName, int Level, const string& ServerName, const string& ServerIP, int serverPort, int CurPos, int ChannelNum, const string& ChannelNickName, int RoomNum, int ClanGrade, int IsCombat, int ClanWinCnt, int ClanLoseCnt, const string& ClanSelfIntro, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	void AddFriendUser(const string& UserName, int ClanMark, int ClanBG, int ClanBL, const string& ClanName, int Level, const string& ServerName, const string& ServerIP, int serverPort, int CurPos, int ChannelNum, const string& ChannelNickName, int RoomNum, int ClanGrade, int IsCombat, int ClanWinCnt, int ClanLoseCnt, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	void ReplaceChannelUser(int Index, int ClanPattern, int ClanBG, int ClanBL, const string& ClanName, int Level, const string& UserName, int UID, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	void AddChannelUser(int ClanPattern, int ClanBG, int ClanBL, const string& ClanName, int Level, const string& UserName, int UID, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
};


// Class GUIWarfareControls.BTACLCWMessengerClanHK
// 0x0024 (0x0484 - 0x0460)
class UBTACLCWMessengerClanHK : public UBTAutoColumnListHK
{
public:
	struct FImage                                      CommonSizeImg;                                            // 0x0460(0x0020)
	class UBTRODecorateStringHK*                       btToolTip;                                                // 0x0480(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLCWMessengerClanHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	float GetItemHeight(class UCanvas* C);
	int GetLevelMarkID(int row);
	string GetSelfIntro(int row);
	string GetUserName(int row);
	string GetCurPos(int row);
	int GetLevel(int row);
	string GetWinLose(int row);
	string GetCombatState(int row);
	void Internal_OnRendered(class UCanvas* Canvas);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void SortByConnectionStatus();
};


// Class GUIWarfareControls.BTACLCWMessengerFriendHK
// 0x0020 (0x0480 - 0x0460)
class UBTACLCWMessengerFriendHK : public UBTAutoColumnListHK
{
public:
	struct FImage                                      CommonSizeImg;                                            // 0x0460(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLCWMessengerFriendHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	float GetItemHeight(class UCanvas* C);
	int GetLevelMarkID(int row);
	int GetClanNum(int row);
	string GetClanName(int row);
	int GetChannelNum(int row);
	string GetServerName(int row);
	string GetDataPerColumn0_strValue(int row);
	int GetServerPort(int row);
	int GetCurPos(int row);
	string GetServerIP(int row);
	int GetRoomNumber(int row);
	string GetUserName(int row);
	int GetLevel(int row);
	string GetWinLose(int row);
	string GetCombatState(int row);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
};


// Class GUIWarfareControls.BTACLCWMessengerChannelHK
// 0x0020 (0x0480 - 0x0460)
class UBTACLCWMessengerChannelHK : public UBTAutoColumnListHK
{
public:
	struct FImage                                      CommonSizeImg;                                            // 0x0460(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLCWMessengerChannelHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	float GetItemHeight(class UCanvas* C);
	int GetLevelMarkID(int row);
	string GetWinLose(int row);
	string GetUserName(int row);
	int GetUserID(int row);
	int GetLevel(int row);
	string GetClanName(int row);
	int GetClanBL(int row);
	int GetClanBG(int row);
	int GetClanPattern(int row);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
};


// Class GUIWarfareControls.BTACLWaitingClanHK
// 0x0000 (0x0460 - 0x0460)
class UBTACLWaitingClanHK : public UBTAutoColumnListHK
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLWaitingClanHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void AddClan(int Level, int Map, int supply);
	float GetItemHeight(class UCanvas* C);
};


// Class GUIWarfareControls.BTSlideShowImageHK
// 0x0028 (0x03E4 - 0x03BC)
class UBTSlideShowImageHK : public UBTOwnerDrawImageHK
{
public:
	float                                              AccumTime;                                                // 0x03BC(0x0004)
	int                                                Phase;                                                    // 0x03C0(0x0004)
	float                                              SlideTime;                                                // 0x03C4(0x0004)
	float                                              BlendingTime;                                             // 0x03C8(0x0004)
	bool                                               bSlideShow;                                               // 0x03CC(0x0004)
	int                                                SlideShowIndex;                                           // 0x03D0(0x0004)
	int                                                NextShowIndex;                                            // 0x03D4(0x0004)
	struct FImage[]                                    SlideImage;                                               // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTSlideShowImageHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void ClearImage();
	void RemoveImage(int Index);
	void ReplaceImage(int Index, const struct FImage& img);
	void AddImage(const struct FImage& img);
	void StopSlideShow();
	void StartSlideShow();
};


// Class GUIWarfareControls.BTACLCWTeamMemberListHK
// 0x002C (0x048C - 0x0460)
class UBTACLCWTeamMemberListHK : public UBTAutoColumnListHK
{
public:
	struct FImage                                      CommonSizeImg;                                            // 0x0460(0x0020)
	string                                             strWinLose;                                               // 0x0480(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLCWTeamMemberListHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	float GetItemHeight(class UCanvas* C);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void ChangeLeader(int UID);
	string GetWinLose(int row);
	string GetUserName(int row);
	int GetUserID(int row);
	string GetClanName(int row);
	bool RemoveTeamMember(const string& UserName);
	void AddTeamMember(int UID, const string& UserName, int Level, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, int ClanPattern, int ClanBG, int ClanBL, int Leader, const string& ClanName, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
};


// Class GUIWarfareControls.BTCMCWMessengerTeamHK
// 0x0018 (0x03FC - 0x03E4)
class UBTCMCWMessengerTeamHK : public UBTContextMenuHK
{
public:
	string                                             strContextMenuName[0x2];                                  // 0x03E4(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTCMCWMessengerTeamHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPInventoryHK
// 0x0064 (0x0394 - 0x0330)
class UBTTPInventoryHK : public UGUITabPanel
{
public:
	string                                             strWeapon;                                                // 0x0330(0x000C) (Localized, NeedCtorLink)
	string                                             strSkill;                                                 // 0x033C(0x000C) (Localized, NeedCtorLink)
	string                                             strQuickSlot;                                             // 0x0348(0x000C) (Localized, NeedCtorLink)
	string                                             strRSA;                                                   // 0x0354(0x000C) (Localized, NeedCtorLink)
	string                                             strAF;                                                    // 0x0360(0x000C) (Localized, NeedCtorLink)
	class UTabControlMocker*                           TabControl;                                               // 0x036C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonInven[0x3];                                         // 0x0370(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UGUITabPanel*                                TPInven[0x3];                                             // 0x037C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPInventoryEquipItem*                     TPEquipItem;                                              // 0x0388(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPInventoryQuickSlotHK*                   TPQuickSlot;                                              // 0x038C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPInventoryWeaponHK*                      TPWeapon;                                                 // 0x0390(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPInventoryHK");
		return ptr;
	}


	bool SaveButton_OnClick(class UGUIComponent* Sender);
	bool TabControl_ButtonInven_OnClick(class UGUIComponent* Sender);
	bool ShowModifyWindow(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPInventoryWeaponHK
// 0x04E8 (0x0828 - 0x0340)
class UBTTPInventoryWeaponHK : public UBTTabPanelHK
{
public:
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x0340(0x0004)
	class UButtonGroups*                               InvenGroup;                                               // 0x0344(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTStretchedImageHK*                         BackgroundImage;                                          // 0x0348(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonWeapon[0xB];                                      // 0x034C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strButtonWeapon[0xB];                                     // 0x03FC(0x000C) (Localized, NeedCtorLink)
	class UBTItemBoxButtonHK*                          ButtonWeapon[0xB];                                        // 0x0480(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonAF;                                                 // 0x04AC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRSA;                                                // 0x04B0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bLRMousePressed;                                          // 0x04B4(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonLR;                                                 // 0x04B8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bRRMousePressed;                                          // 0x04BC(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRR;                                                 // 0x04C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         EdgeLine;                                                 // 0x04C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         AFTeamBG;                                                 // 0x04C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         RSATeamBG;                                                // 0x04CC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTAutoScrollListHK*                         ChatBox;                                                  // 0x04D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                SaveMainTab;                                              // 0x04D4(0x0004)
	int                                                SaveSubTab;                                               // 0x04D8(0x0004)
	string                                             strMainMenu[0x5];                                         // 0x04DC(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuAll[0x3];                                       // 0x0518(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuWeapon[0x5];                                    // 0x053C(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuEquip[0x6];                                     // 0x0578(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuSpecial[0x4];                                   // 0x05C0(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuCash[0x3];                                      // 0x05F0(0x000C) (Localized, NeedCtorLink)
	string[]                                           astrSubMenuAll;                                           // 0x0614(0x000C) (NeedCtorLink)
	string[]                                           astrSubMenuWeapon;                                        // 0x0620(0x000C) (NeedCtorLink)
	string[]                                           astrSubMenuEquip;                                         // 0x062C(0x000C) (NeedCtorLink)
	string[]                                           astrSubMenuSpecial;                                       // 0x0638(0x000C) (NeedCtorLink)
	string[]                                           astrSubMenuCash;                                          // 0x0644(0x000C) (NeedCtorLink)
	class UTabControlMocker*                           TabControl[0x2];                                          // 0x0650(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 MainButton[0x5];                                          // 0x0658(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 SubButton[0x6];                                           // 0x066C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelItemList;                                          // 0x0684(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelItemList;                                            // 0x0694(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPItemList;                                             // 0x0698(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPItemListHK*                             TPItemList;                                               // 0x06A8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strMenuButton[0x7];                                       // 0x06AC(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbMenuButton;                                             // 0x0700(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 MenuButton;                                               // 0x0710(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemInfoHorzBoxHK*                        InfoBox;                                                  // 0x0714(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                CurrentRepairMode;                                        // 0x0718(0x0004)
	int                                                EquipItemCount;                                           // 0x071C(0x0004)
	struct FBtrDouble[]                                EquipItemList;                                            // 0x0720(0x000C) (NeedCtorLink)
	struct FBtrDouble[]                                InvenItemList;                                            // 0x072C(0x000C) (NeedCtorLink)
	string[]                                           Equip_DamegeItemNames;                                    // 0x0738(0x000C) (NeedCtorLink)
	string[]                                           Inven_DamegeItemNames;                                    // 0x0744(0x000C) (NeedCtorLink)
	string                                             strCash;                                                  // 0x0750(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*[]                       slotNum;                                                  // 0x075C(0x000C) (NeedCtorLink)
	class UBTOwnerDrawImageHK*                         SlotTemp;                                                 // 0x0768(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*[]                       EquipItemSlot;                                            // 0x076C(0x000C) (NeedCtorLink)
	class UBTOwnerDrawImageHK*                         EquipItemSlotTemp;                                        // 0x0778(0x0004) (ExportObject, NeedCtorLink, EditInline)
	byte                                               MainTabBtnIdx;                                            // 0x077C(0x0001)
	byte                                               SubTabBtnIdx;                                             // 0x077D(0x0001)
	byte                                               Padding00[0x2];                                           // 0x077E(0x0002) MISSED OFFSET
	class UBTOwnerDrawCaptionButtonHK*[]               ItemSubMenuBtn;                                           // 0x0780(0x000C) (NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonLocal;                                              // 0x078C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTWeaponLIst*                               WList;                                                    // 0x0790(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               SendProtocall;                                            // 0x0794(0x0004)
	string                                             strSlot;                                                  // 0x0798(0x000C) (Localized, NeedCtorLink)
	string                                             strEquipItem[0x7];                                        // 0x07A4(0x000C) (Localized, NeedCtorLink)
	string                                             strEquipMsg;                                              // 0x07F8(0x000C) (Localized, NeedCtorLink)
	int                                                nOldMouseX;                                               // 0x0804(0x0004)
	int                                                nOffsetMouseDis;                                          // 0x0808(0x0004)
	class UBTOwnerDrawImageHK*                         LockImage;                                                // 0x080C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FScriptDelegate                             __deleShowCashChargeWindow__Delegate;                     // 0x0810(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __dele_StopWebzenWebzenInvenList__Delegate;               // 0x0818(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __dele_sfReqWebzenInvenList__Delegate;                    // 0x0820(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPInventoryWeaponHK");
		return ptr;
	}


	bool ShowItemRenewWindow(class UBTROItemBoxHK* ro, byte cashType);
	void SelectCoin(int buyType, int cashType, class UBTROItemBoxHK* ro);
	bool SubButton_OnHover(class UGUIComponent* Sender);
	bool Sell_OnClick(class UGUIComponent* Sender);
	bool Modify_OnClick(class UGUIComponent* Sender);
	bool Repair_OnClick(class UGUIComponent* Sender);
	bool CheckEquipItem(int nItemType);
	void AddSubMenuBtns();
	void AddEquipModeItemSlot(bool bSkillItem, const struct FBtrDouble& UniqueID, int UniqueSkillID);
	void AddEquipItemSlot(int nItemType, int nTeamIdx, const struct FBtrDouble& UniqueID);
	void AddEquipWeaponeSlot(int nSlotNum, const struct FBtrDouble& UniqueID);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitializeRightPanel();
	void InitializeLeftPanel();
	void Refresh();
	void fill();
	void UnequipItem(int ButtonID);
	int GetButtonWeaponID(const struct FBtrDouble& UniqueID);
	bool BTWindowDefineARHK_ItemUse_OnOK(class UGUIComponent* Sender);
	bool BTWindowDefineARHK_ReceiveCashItem_OnOK(class UGUIComponent* Sender);
	bool BTWindowCreateClanMarkHK_IsExist_OnOK(class UGUIComponent* Sender);
	bool BTWindowCreateClanMarkHK_OnOK(class UGUIComponent* Sender);
	bool ChangeSubButton(string[] strTemp);
	void SetInfoBox(int ItemIndex);
	bool dele_sfReqWebzenInvenList(const string& Type);
	void dele_StopWebzenWebzenInvenList();
	void BTWindowDefineStateHK_sfReqWebzenInvenListS_OnTimeOut(class UGUIComponent* Sender);
	void ChangeItemList(int mainTab, int subTab, bool bForce);
	void RefreshItemList();
	void MainTabSelect(int tabi, int subtabi, bool bForce);
	bool FindAndRemoveItem(const struct FBtrDouble& UniqueID);
	bool MenuButton_OnClick(class UGUIComponent* Sender);
	bool BTWindowDefineSelectHK_IsQuickSlotItem(class UGUIComponent* Sender);
	bool BTWindowItemRenew_ButtonRechargeCash_OnOK(class UGUIComponent* Sender);
	void GetCashItemInfo(class UwItemBoxHK* ib, class UwItemBoxCashHK* cii, int[]* temp);
	void BTWindowItemRenew_OnTimeOut(class UGUIComponent* Sender);
	bool BTWindowItemRenew_OnOK(class UGUIComponent* Sender);
	bool BTWindowModifyHK_OnOK(class UGUIComponent* Sender);
	bool ButtonWeapon_OnDblClick(class UGUIComponent* Sender);
	bool ButtonWeapon_OnClick(class UGUIComponent* Sender);
	bool ImageListBox_OnClick(class UGUIComponent* Sender);
	void SelectItem(class UwItemBoxHK* ItemInfo, class UwItemBoxInstanceHK* instanceInfo, bool bHoldcItemInfo);
	void UpdateServerTime(const struct FBtrDouble& D);
	bool ImageListBox_OnDblClick(class UGUIComponent* Sender);
	bool SubButton_OnClick(class UGUIComponent* Sender);
	bool MainButton_OnClick(class UGUIComponent* Sender);
	void ChangeVisibleModel(bool bAF);
	void ButtonRR_OnRelease(class UGUIComponent* Sender);
	void ButtonRR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	void ButtonLR_OnRelease(class UGUIComponent* Sender);
	void ButtonLR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	void Internal_OnRendered(class UCanvas* C);
	bool Internal_OnPreDraw(class UCanvas* C);
	void deleShowCashChargeWindow();
};


// Class GUIWarfareControls.BTTPInventoryQuickSlotHK
// 0x0590 (0x08D0 - 0x0340)
class UBTTPInventoryQuickSlotHK : public UBTTabPanelHK
{
public:
	float                                              DeActiveMouseX;                                           // 0x0340(0x0004)
	float                                              DeActiveMouseY;                                           // 0x0344(0x0004)
	class UButtonGroups*                               InvenGroup;                                               // 0x0348(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UButtonGroups*                               QSButtonGroup;                                            // 0x034C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UButtonGroups*                               QSNameGroup;                                              // 0x0350(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTStretchedImageHK*                         BackgroundImage;                                          // 0x0354(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strButtonChangeName;                                      // 0x0358(0x000C) (Localized, NeedCtorLink)
	string                                             strQuickSlot;                                             // 0x0364(0x000C) (Localized, NeedCtorLink)
	string                                             strUnRegister;                                            // 0x0370(0x000C) (Localized, NeedCtorLink)
	string                                             strOK;                                                    // 0x037C(0x000C) (Localized, NeedCtorLink)
	struct FSaveQuickSlot[]                            SaveQS;                                                   // 0x0388(0x000C) (NeedCtorLink)
	struct FFloatBox                                   fbLabelTagTop[0x5];                                       // 0x0394(0x0010)
	struct FFloatBox                                   fbLabelTagBottom[0x5];                                    // 0x03E4(0x0010)
	class UBTOwnerDrawImageHK*                         LabelTagTop[0x5];                                         // 0x0434(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelTagBottom[0x5];                                      // 0x0448(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTag[0x4];                                         // 0x045C(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTag[0x4];                                           // 0x049C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonChangeName[0x5];                                  // 0x04AC(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonChangeName[0x5];                                    // 0x04FC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbEditChangeName[0x5];                                    // 0x0510(0x0010)
	class UBTEditBoxHK*                                EditChangeName[0x5];                                      // 0x0560(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonQuickSlot[0x9];                                   // 0x0574(0x0010)
	string                                             strButtonQuickSlot[0x9];                                  // 0x0604(0x000C) (Localized, NeedCtorLink)
	class UBTItemBoxButtonHK*                          ButtonQuickSlot[0x9];                                     // 0x0670(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPChatHK*                                 TPTemp;                                                   // 0x0694(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabelWarning;                                          // 0x0698(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabelWarning;                                           // 0x06A4(0x0010)
	class UBTOwnerDrawImageHK*                         LabelWarning;                                             // 0x06B4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 btnModify[0x2];                                           // 0x06B8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x06C0(0x0004)
	class UBTROItemBoxHK*                              TempRO;                                                   // 0x06C4(0x0004)
	class UBTROItemBoxHK*                              RoQuickSlotItem[0x2];                                     // 0x06C8(0x0004)
	class UBTROItemBoxHK*                              RoSkillSlotItem[0x2];                                     // 0x06D0(0x0004)
	string                                             strQuickslotOpenTitle;                                    // 0x06D8(0x000C) (Localized, NeedCtorLink)
	string                                             strQuickslotOpenDesc[0x3];                                // 0x06E4(0x000C) (Localized, NeedCtorLink)
	bool                                               isLockedQuickSlot;                                        // 0x0708(0x0004)
	struct FFloatBox                                   fbLockedQuickSlot;                                        // 0x070C(0x0010)
	struct FFloatBox                                   fbLockedQuickSlotTitle;                                   // 0x071C(0x0010)
	struct FFloatBox                                   fbLockedQuickSlotDesc[0x3];                               // 0x072C(0x0010)
	struct FImage                                      LockedQuickSlot;                                          // 0x075C(0x0020)
	struct FText                                       LockedQuickSlotTitle;                                     // 0x077C(0x001C) (NeedCtorLink)
	struct FText                                       LockedQuickSlotDesc[0x3];                                 // 0x0798(0x001C) (NeedCtorLink)
	struct FFloatBox                                   fbQuickSlotBuyButton;                                     // 0x07EC(0x0010)
	struct FFloatBox                                   fbQuickSlotGiftButton;                                    // 0x07FC(0x0010)
	string                                             strQuickSlotBuyButton;                                    // 0x080C(0x000C) (Localized, NeedCtorLink)
	string                                             strQuickSlotGiftButton;                                   // 0x0818(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 QuickSlotBuyButton;                                       // 0x0824(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 QuickSlotGiftButton;                                      // 0x0828(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbQuickSlotState[0x2];                                    // 0x082C(0x0010)
	class UBTOwnerDrawImageHK*                         QuickSlotState[0x2];                                      // 0x084C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbSkillSlotBuyButton[0x2];                                // 0x0854(0x0010)
	struct FFloatBox                                   fbSkillSlotGiftButton[0x2];                               // 0x0874(0x0010)
	string                                             strSkillSlotBuyButton;                                    // 0x0894(0x000C) (Localized, NeedCtorLink)
	string                                             strSkillSlotGiftButton;                                   // 0x08A0(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 SkillSlotBuyButton[0x2];                                  // 0x08AC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 SkillSlotGiftButton[0x2];                                 // 0x08B4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strSkillslotOpen;                                         // 0x08BC(0x000C) (Localized, NeedCtorLink)
	struct FScriptDelegate                             __deleShowCashChargeWindow__Delegate;                     // 0x08C8(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPInventoryQuickSlotHK");
		return ptr;
	}


	void InitializeItemInfo();
	void ShowItemBuyWindow(class UBTROItemBoxHK* ro, int buyType, byte cashType);
	void SelectCoin(int buyType, int cashType, class UBTROItemBoxHK* ro);
	bool ItemBuyProcess(int ItemID, int _buyType);
	bool OnSkillSlotGiftButton(class UGUIComponent* Sender);
	bool OnSkillSlotBuyButton(class UGUIComponent* Sender);
	bool OnQuickSlotBuyButton(class UGUIComponent* Sender);
	void RefreshQuickSlotBuyButtonShow();
	void FillQuickSlotData();
	void ChangeQuickSlot(int slotNum, bool enableModify);
	void RefreshModifyBtn();
	bool FindAndRemoveSkillItem(int UniqueID);
	bool FindAndRemoveItem(const struct FBtrDouble& UniqueID);
	void Internal_OnRendered(class UCanvas* C);
	bool OnPreDraw(class UCanvas* C);
	void SetDefaultButtonImage();
	bool IsEmptyQuickSlot(int Index);
	void ShowSkillTransparent();
	void ShowWeaponTransparent();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void deleShowCashChargeWindow();
};


// Class GUIWarfareControls.BTTPInventoryEquipItem
// 0x015C (0x049C - 0x0340)
class UBTTPInventoryEquipItem : public UBTTabPanelHK
{
public:
	class UButtonGroups*                               InvenGroup;                                               // 0x0340(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTItemBoxButtonHK*                          EquipItemSlot[0x8];                                       // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbEquipItemSlot[0x8];                                     // 0x0364(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strEquipItemSlot[0x8];                                    // 0x03E4(0x000C) (Localized, NeedCtorLink)
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x0444(0x0004)
	bool                                               bVisibleAFModel;                                          // 0x0448(0x0004)
	string                                             strAF;                                                    // 0x044C(0x000C) (Localized, NeedCtorLink)
	string                                             strRSA;                                                   // 0x0458(0x000C) (Localized, NeedCtorLink)
	class UBTModelHK*                                  UIModel;                                                  // 0x0464(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class ABTROModelNew*                               CharacterModel;                                           // 0x0468(0x0004)
	class UBTOwnerDrawImageHK*                         EdgeLine;                                                 // 0x046C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         AFTeamBG;                                                 // 0x0470(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         RSATeamBG;                                                // 0x0474(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonAF;                                                 // 0x0478(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRSA;                                                // 0x047C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bLRMousePressed;                                          // 0x0480(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonLR;                                                 // 0x0484(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bRRMousePressed;                                          // 0x0488(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRR;                                                 // 0x048C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTAutoScrollListHK*                         ChatBox;                                                  // 0x0490(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                nOldMouseX;                                               // 0x0494(0x0004)
	int                                                nOffsetMouseDis;                                          // 0x0498(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPInventoryEquipItem");
		return ptr;
	}


	void Refresh();
	bool ButtonRSA_OnClick(class UGUIComponent* Sender);
	bool ButtonAF_OnClick(class UGUIComponent* Sender);
	void CharRotByDrag();
	bool Internal_OnPreDraw(class UCanvas* C);
	void UnequipItem(int ButtonID);
	void ButtonRR_OnRelease(class UGUIComponent* Sender);
	void ButtonRR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	void ButtonLR_OnRelease(class UGUIComponent* Sender);
	void ButtonLR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	bool ButtonWeapon_OnClick(class UGUIComponent* Sender);
	void Initialize();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowItemSellHK
// 0x0138 (0x05F8 - 0x04C0)
class UBTWindowItemSellHK : public UBTWindowHK
{
public:
	int                                                MyPoint;                                                  // 0x04C0(0x0004)
	int                                                SellingCost;                                              // 0x04C4(0x0004)
	struct FBtrDouble                                  UniqueID;                                                 // 0x04C8(0x0008)
	struct FFloatBox                                   fbItemBox;                                                // 0x04D0(0x0010)
	class UBTItemBoxButtonHK*                          itemBox;                                                  // 0x04E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbSeparator[0x2];                                         // 0x04E4(0x0010)
	class UBTOwnerDrawImageHK*                         Separator[0x2];                                           // 0x0504(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabel[0x4];                                             // 0x050C(0x0010)
	struct FFloatBox                                   fbEdit[0x3];                                              // 0x054C(0x0010)
	class UBTOwnerDrawImageHK*                         Label[0x4];                                               // 0x057C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         Edit[0x3];                                                // 0x058C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                SelectCount;                                              // 0x0598(0x0004)
	struct FFloatBox                                   fbComboItemCount;                                         // 0x059C(0x0010)
	class UBTComboBoxHK*                               ComboItemCount;                                           // 0x05AC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabel[0x4];                                            // 0x05B0(0x000C) (Localized, NeedCtorLink)
	string                                             strPoint;                                                 // 0x05E0(0x000C) (Localized, NeedCtorLink)
	string                                             strCount;                                                 // 0x05EC(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowItemSellHK");
		return ptr;
	}


	void SetData(const struct FBtrDouble& UniqueItemID, int SellingCost, int MyPoint, class UwItemBoxHK* ItemInfo, class UwItemBoxInstanceHK* instanceInfo);
	void UpdatePrice(int Count);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void ComboItemCount_OnChange(class UGUIComponent* Sender);
};


// Class GUIWarfareControls.BTWindowItemRepairHK
// 0x012C (0x05EC - 0x04C0)
class UBTWindowItemRepairHK : public UBTWindowHK
{
public:
	struct FBtrDouble                                  UniqueID;                                                 // 0x04C0(0x0008)
	struct FFloatBox                                   fbItemBox;                                                // 0x04C8(0x0010)
	class UBTItemBoxButtonHK*                          itemBox;                                                  // 0x04D8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbSeparator[0x2];                                         // 0x04DC(0x0010)
	class UBTOwnerDrawImageHK*                         Separator[0x2];                                           // 0x04FC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabel[0x5];                                             // 0x0504(0x0010)
	struct FFloatBox                                   fbEdit[0x3];                                              // 0x0554(0x0010)
	class UBTOwnerDrawImageHK*                         Label[0x5];                                               // 0x0584(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         Edit[0x3];                                                // 0x0598(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabel[0x5];                                            // 0x05A4(0x000C) (Localized, NeedCtorLink)
	string                                             strPoint;                                                 // 0x05E0(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowItemRepairHK");
		return ptr;
	}


	void SetData(const struct FBtrDouble& UniqueItemID, int RepairCost, int MyPoint, class UwItemBoxHK* ItemInfo, class UwItemBoxInstanceHK* instanceInfo);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowItemRepairAllHK
// 0x01A4 (0x0664 - 0x04C0)
class UBTWindowItemRepairAllHK : public UBTWindowHK
{
public:
	int                                                RepairCost[0x2];                                          // 0x04C0(0x0004)
	int                                                MyPoint;                                                  // 0x04C8(0x0004)
	int                                                CurrentButtonID;                                          // 0x04CC(0x0004)
	struct FFloatBox                                   fbButtonRepair[0x2];                                      // 0x04D0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRepair[0x2];                                        // 0x04F0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbSeparator[0x2];                                         // 0x04F8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Separator[0x2];                                           // 0x0518(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelDescription;                                       // 0x0520(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTMultiLineEditBoxHK*                       LabelDescription;                                         // 0x0530(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelWarning[0x2];                                      // 0x0534(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelWarning[0x2];                                        // 0x0554(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabel[0x3];                                             // 0x055C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbEdit[0x3];                                              // 0x058C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0x3];                                               // 0x05BC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         Edit[0x3];                                                // 0x05C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strButtonRepair[0x2];                                     // 0x05D4(0x000C) (Localized, NeedCtorLink)
	string                                             strEquipItemDescription;                                  // 0x05EC(0x000C) (Localized, NeedCtorLink)
	string                                             strEquipItemWarning[0x2];                                 // 0x05F8(0x000C) (Localized, NeedCtorLink)
	string                                             strInvenItemDescription;                                  // 0x0610(0x000C) (Localized, NeedCtorLink)
	string                                             strInvenItemWarning[0x2];                                 // 0x061C(0x000C) (Localized, NeedCtorLink)
	string                                             strLabel[0x3];                                            // 0x0634(0x000C) (Localized, NeedCtorLink)
	string                                             strPoint;                                                 // 0x0658(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowItemRepairAllHK");
		return ptr;
	}


	void ChangeRepairCost(int Index);
	void SetData(int erCost, int irCost, int Point);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool ButtonRepair_OnClick(class UGUIComponent* Sender);
	void ChangeDescription(int ButtonID);
};


// Class GUIWarfareControls.BTMoneyInfo
// 0x00D8 (0x03D8 - 0x0300)
class UBTMoneyInfo : public UGUIMultiComponent
{
public:
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x0300(0x0004)
	struct FFloatBox                                   fbLabelPoint;                                             // 0x0304(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelCash;                                              // 0x0314(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelCoupon;                                            // 0x0324(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbImagePoint;                                             // 0x0334(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbImageCash;                                              // 0x0344(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbImageCoupon;                                            // 0x0354(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelPoint;                                               // 0x0364(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelCash;                                                // 0x0368(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelCoupon;                                              // 0x036C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         ImagePoint;                                               // 0x0370(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         ImageCash;                                                // 0x0374(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         ImageCoupon;                                              // 0x0378(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelCCoinCash;                                         // 0x037C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelCCoinCash;                                           // 0x038C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbChargeCashBtn;                                          // 0x0390(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ChargeCashBtn;                                            // 0x03A0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strChargeCash;                                            // 0x03A4(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbRedeemCodesBtn;                                         // 0x03B0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 RedeemCodesBtn;                                           // 0x03C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strRedeemCodesBtn;                                        // 0x03C4(0x000C) (Localized, NeedCtorLink)
	struct FScriptDelegate                             __deleClickChargeCash__Delegate;                          // 0x03D0(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTMoneyInfo");
		return ptr;
	}


	void SendCodes(const string& codes);
	bool ClickRedeemCodes(class UGUIComponent* Sender);
	bool ClickChargeCash(class UGUIComponent* Sender);
	void RefreshCashNPoint(class UwGameManager* GameMgr, class UwMatchMaker* MM);
	void EnableCoupon(bool bEnable);
	void AddButton(const struct FFloatBox& fbButton, const string& strCaption, int FontSize, EDrawType dt, class UBTOwnerDrawCaptionButtonHK** AddButton);
	void AddImage(const struct FFloatBox& fbImage, const struct FImage& applyImage, class UBTOwnerDrawImageHK** AddImage);
	void AddLabel(const struct FFloatBox& fbComponent, const struct FColor& TextColor, class UBTOwnerDrawImageHK** AddComponent);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void deleClickChargeCash();
};


// Class GUIWarfareControls.BTWindowModifyHK
// 0x033C (0x07FC - 0x04C0)
class UBTWindowModifyHK : public UBTWindowHK
{
public:
	bool                                               bSniperRifle;                                             // 0x04C0(0x0004)
	struct FFloatBox                                   fbLabelBackgroundWeapon[0x2];                             // 0x04C4(0x0010)
	string                                             strLabelWeapon[0x2];                                      // 0x04E4(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         LabelWeapon[0x2];                                         // 0x04FC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FPaintInfo[]                                PaintingInfos;                                            // 0x0504(0x000C) (NeedCtorLink)
	int                                                SelectPaintingIdx;                                        // 0x0510(0x0004)
	int                                                PaintingPageNum;                                          // 0x0514(0x0004)
	int                                                PaintingPageCount;                                        // 0x0518(0x0004)
	struct FFloatBox                                   fbLabel[0x3];                                             // 0x051C(0x0010)
	string                                             strLabelAll[0x3];                                         // 0x054C(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelSniper[0x3];                                      // 0x0570(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         Label[0x3];                                               // 0x0594(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         InvenBoxLabel[0x5];                                       // 0x05A0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         WeaponNameLabel;                                          // 0x05B4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       WeaponDescript;                                           // 0x05B8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelStat[0x3];                                         // 0x05BC(0x0010)
	struct FFloatBox                                   fbLabelStatSniper[0x3];                                   // 0x05EC(0x0010)
	class UBTLabelArrowStateHK*                        LabelStat[0x3];                                           // 0x061C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLList_Sight;                                          // 0x0628(0x0010)
	class UBTAutoImageListHK*                          ACLList_Sight;                                            // 0x0638(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLList_Silencer;                                       // 0x063C(0x0010)
	class UBTAutoImageListHK*                          ACLList_Silencer;                                         // 0x064C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLList_Barrel;                                         // 0x0650(0x0010)
	class UBTAutoImageListHK*                          ACLList_Barrel;                                           // 0x0660(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLList_Gunstock;                                       // 0x0664(0x0010)
	class UBTAutoImageListHK*                          ACLList_Gunstock;                                         // 0x0674(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                SelectedItemID;                                           // 0x0678(0x0004)
	int                                                SelectedPaintingID;                                       // 0x067C(0x0004)
	struct FBtrDouble                                  SelectedItemUniqueID;                                     // 0x0680(0x0008)
	int                                                SelectedUnionedPartID;                                    // 0x0688(0x0004)
	int                                                SelectedProductNo[0x5];                                   // 0x068C(0x0004)
	int                                                OriginalPaintingItemID;                                   // 0x06A0(0x0004)
	int                                                OriginalPaintingID;                                       // 0x06A4(0x0004)
	int                                                OriginalUnionedPartID;                                    // 0x06A8(0x0004)
	struct FVector                                     vDisplay_3d;                                              // 0x06AC(0x000C)
	float                                              fDisplay_rot_y;                                           // 0x06B8(0x0004)
	class UBTItemCommonInfoHK*                         MyData;                                                   // 0x06BC(0x0004)
	class UBTModelWeaponHK*                            btWeapon[0x2];                                            // 0x06C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class ABTROModelWeapon*                            roWeapon[0x2];                                            // 0x06C8(0x0004)
	class UButtonGroups*                               CustomItemButtonGroup;                                    // 0x06D0(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTItemBoxButtonHK*                          btnSelectedCustomItems[0x5];                              // 0x06D4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 btnRemoveOrRollback[0x5];                                 // 0x06E8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strRemove;                                                // 0x06FC(0x000C) (Localized, NeedCtorLink)
	string                                             strRollback;                                              // 0x0708(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 btnInit;                                                  // 0x0714(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonInit;                                             // 0x0718(0x0010)
	string                                             strInit;                                                  // 0x0728(0x000C) (Localized, NeedCtorLink)
	string                                             strFilter[0x6];                                           // 0x0734(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 FilterButton[0x6];                                        // 0x077C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UTabControlMocker*                           TabControl;                                               // 0x0794(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	byte                                               FilterTabBtnIdx;                                          // 0x0798(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0799(0x0003) MISSED OFFSET
	struct FFloatBox                                   fbACLList_All;                                            // 0x079C(0x0010)
	class UBTAutoImageListHK*                          ACLList_All;                                              // 0x07AC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTROItemBoxHK*[]                            DataPool;                                                 // 0x07B0(0x000C) (NeedCtorLink)
	class UBTItemStateBoxButtonHK*                     ItemStateView;                                            // 0x07BC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UwItemBoxHK*                                 CurrentItemInfo;                                          // 0x07C0(0x0004)
	class UwItemBoxInstanceHK*                         CurrentInstanceInfo;                                      // 0x07C4(0x0004)
	class UwItemBoxHK*                                 WantedItemInfo;                                           // 0x07C8(0x0004)
	class UwItemBoxInstanceHK*                         WantedInstanceInfo;                                       // 0x07CC(0x0004)
	int                                                IsEnableRemove[0x5];                                      // 0x07D0(0x0004)
	class UBTOwnerDrawImageHK*                         LockImage[0x3];                                           // 0x07E4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strPCoinOnly;                                             // 0x07F0(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowModifyHK");
		return ptr;
	}


	void AddCashItemInfo(class UwGameManager* GameMgr, class UwItemBoxHK** ItemInfo, class UwItemBoxInstanceHK** instanceInfo);
	bool IsShowCashItem(class UwGameManager* GameMgr, int ItemID);
	bool ButtonCancel_OnClick(class UGUIComponent* Sender);
	bool ButtonOK_OnClick(class UGUIComponent* Sender);
	int IsEnoughMoney();
	bool GetPartPrice(int iPartID, int* iOutPoint, int* iOutCash);
	bool GetPaintPrice(int iPaintID, int* iOutPoint, int* iOutCash);
	bool Confirm_OnClick(class UGUIComponent* Sender);
	void ChangeItemList(int FilterIndex);
	bool FilterButton_OnClick(class UGUIComponent* Sender);
	int GetPaintingItemID();
	int GetPaintingID();
	int GetSelectedPaintingID();
	int GetSelectedPaintingItemID();
	int GetSelectedUnionedPartID();
	struct FBtrDouble GetSelectedItemUniqueID();
	bool ButtonGroups_OnClick(class UGUIComponent* Sender);
	void SetPaintingSempleButton(int SelectedIdx);
	void Internal_OnClose(bool bCancelled);
	void SetData(class UwItemBoxHK* ib, class UwItemBoxInstanceHK* ibi);
	bool ButtonInit_OnClick(class UGUIComponent* Sender);
	void ACLList_OnChange(class UGUIComponent* Sender);
	bool RemoveButton_OnClick(class UGUIComponent* Sender);
	bool PaintRemoveButton_OnClick(class UGUIComponent* Sender);
	bool CustomPartsButton_OnClick(class UGUIComponent* Sender);
	bool CustomPaintPartsButton_OnClick(class UGUIComponent* Sender);
	void Refresh();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTItemInfoHorzBoxHK
// 0x0014 (0x0344 - 0x0330)
class UBTItemInfoHorzBoxHK : public UGUITabPanel
{
public:
	class UBTOwnerDrawImageHK*                         Panel;                                                    // 0x0330(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemBoxButtonHK*                          ItemBoxView;                                              // 0x0334(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemStateBoxButtonHK*                     ItemStateView;                                            // 0x0338(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelItemDescription;                                     // 0x033C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       EditItemDescription;                                      // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTItemInfoHorzBoxHK");
		return ptr;
	}


	void SetWindowItemBox();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetData(class UwItemBoxHK* ItemInfo, class UwItemBoxInstanceHK* instanceInfo, class UwItemBoxHK* cItemInfo, class UwItemBoxInstanceHK* cInstanceInfo);
};


// Class GUIWarfareControls.BTWindowSelfIntroductionChangeHK
// 0x0044 (0x0504 - 0x04C0)
class UBTWindowSelfIntroductionChangeHK : public UBTWindowHK
{
public:
	string                                             strLabel[0x2];                                            // 0x04C0(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0x2];                                             // 0x04D8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0x2];                                               // 0x04F8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       SelfIntroduction;                                         // 0x0500(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowSelfIntroductionChangeHK");
		return ptr;
	}


	void Internal_OnOpen();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetData(const string& SelfIntro);
};


// Class GUIWarfareControls.BTACLClanMemberHK
// 0x0078 (0x04E0 - 0x0468)
class UBTACLClanMemberHK : public UBTACLMessengerCommon
{
public:
	struct FImage                                      LevelImg;                                                 // 0x0468(0x0020)
	string                                             strClanGrade[0x5];                                        // 0x0488(0x000C) (Localized, NeedCtorLink)
	string                                             strOffLine;                                               // 0x04C4(0x000C) (Localized, NeedCtorLink)
	string                                             strOnLine;                                                // 0x04D0(0x000C) (Localized, NeedCtorLink)
	class UBTRODecorateStringHK*                       btToolTip;                                                // 0x04DC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLClanMemberHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void Internal_OnRendered(class UCanvas* Canvas);
	void LC1_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void SetCurState(int row, int Value);
	void SetChannelNumber(int row, int Value);
	void SetGameRoomNumber(int row, int Value);
	void SetServerName(int row, const string& Value);
	void SetServerIP(int row, const string& Value);
	void SetServerPort(int row, int Value);
	void SetChannelName(int row, const string& Value);
	void SetCurLocationName(int row, const string& Value);
	void SetCurpos(int row, int Value);
	int GetLogOnState(int row);
	int GetCurState(int row);
	int GetChannelNumber(int row);
	int GetGameRoomNumber(int row);
	int GetServerPort(int row);
	string GetServerIP(int row);
	int GetCurPos(int row);
	int GetLevelMarkID(int row);
	string IntToClanGrade(int cg);
	string GetSelfIntro(int row);
	int GetUserGrade(int row);
	string GetUserName(int row);
	void ChangeLevelMarkID(const string& UserName, int LevelMarkID);
	void AddClanMember(byte IsLogOn, int Level, const string& CharName, byte ClanGrade, int LevelMarkID, int TitleMarkID);
	float GetItemHeight(class UCanvas* C);
};


// Class GUIWarfareControls.BTCMClanUserListHK
// 0x006C (0x0494 - 0x0428)
class UBTCMClanUserListHK : public UBTCMMessengerOnOffline
{
public:
	string                                             strContextMenuName[0x9];                                  // 0x0428(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTCMClanUserListHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTACLClanNewsHK
// 0x0090 (0x04F0 - 0x0460)
class UBTACLClanNewsHK : public UBTAutoColumnListHK
{
public:
	string                                             strIssueType[0xC];                                        // 0x0460(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLClanNewsHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void LC0_NewsDate(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void AddNews(const string& IssueDate, byte IssueType, const string& IssuedClanMember);
	string IssueTypeToString(byte IssueType);
	float GetItemHeight(class UCanvas* C);
};


// Class GUIWarfareControls.BTACLClanWarResultHK
// 0x0024 (0x0484 - 0x0460)
class UBTACLClanWarResultHK : public UBTAutoColumnListHK
{
public:
	string                                             strWinLose[0x2];                                          // 0x0460(0x000C) (Localized, NeedCtorLink)
	string                                             strVS;                                                    // 0x0478(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLClanWarResultHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void LC0_Date(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void addResult(const struct FBtrDouble& Date, byte IsWin, const string& EnemyClanname);
	float GetItemHeight(class UCanvas* C);
};


// Class GUIWarfareControls.BTWindowClanInfoChangeHK
// 0x012C (0x05EC - 0x04C0)
class UBTWindowClanInfoChangeHK : public UBTWindowHK
{
public:
	string                                             strLabel[0x5];                                            // 0x04C0(0x000C) (Localized, NeedCtorLink)
	string                                             strQTRoomNumber;                                          // 0x04FC(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0x5];                                             // 0x0508(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0x5];                                               // 0x0558(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbEdit[0x5];                                              // 0x056C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Edit[0x5];                                                // 0x05BC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ClanRecruit;                                              // 0x05D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ClanLocation;                                             // 0x05D4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTEditBoxHK*                                ClanKeyword;                                              // 0x05D8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       ClanIntroduction;                                         // 0x05DC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       ClanNotice;                                               // 0x05E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTLabelLocationHK*                          sampleLocation;                                           // 0x05E4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTLabelRecruitHK*                           sampleRecruit;                                            // 0x05E8(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowClanInfoChangeHK");
		return ptr;
	}


	void Internal_OnOpen();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetData(int loc, int Rec, const string& Keyword, const string& Introduction, const string& Notice, int MyClanGrade);
};


// Class GUIWarfareControls.BTItemListMenuBtn
// 0x00D0 (0x0110 - 0x0040)
class UBTItemListMenuBtn : public URenderObject
{
public:
	int                                                ClickBtnIndex;                                            // 0x0040(0x0004)
	int                                                enableType;                                               // 0x0044(0x0004)
	bool                                               disableBtn;                                               // 0x0048(0x0004)
	int                                                ButtonColor[0xA];                                         // 0x004C(0x0004)
	string                                             MenuName[0xA];                                            // 0x0074(0x000C) (Localized, NeedCtorLink)
	class UGUIController*                              PController;                                              // 0x00EC(0x0004)
	struct FText[]                                     MenuText;                                                 // 0x00F0(0x000C) (NeedCtorLink)
	struct FBtrDouble                                  dbUniqID;                                                 // 0x00FC(0x0008)
	int                                                nSkillID;                                                 // 0x0104(0x0004)
	int                                                ItemID;                                                   // 0x0108(0x0004)
	class UBTROItemBoxHK*                              ro;                                                       // 0x010C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTItemListMenuBtn");
		return ptr;
	}


	void RenderButton(class UCanvas* C, float Delta);
	void SetButtonType(int enableT, bool bDisable);
	void Init();
};


// Class GUIWarfareControls.BTNumericEditBoxHK
// 0x0048 (0x0518 - 0x04D0)
class UBTNumericEditBoxHK : public UBTOwnerDrawCaptionButtonHK
{
public:
	int                                                MinValue;                                                 // 0x04D0(0x0004)
	int                                                MaxValue;                                                 // 0x04D4(0x0004)
	bool                                               bReadOnly;                                                // 0x04D8(0x0004)
	string                                             FormatStr;                                                // 0x04DC(0x000C) (NeedCtorLink)
	string                                             OriginalStr;                                              // 0x04E8(0x000C) (NeedCtorLink)
	struct FColor                                      CursorColor;                                              // 0x04F4(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FImage                                      cursorImg;                                                // 0x04F8(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTNumericEditBoxHK");
		return ptr;
	}


	bool Internal_OnKeyEvent(float Delta, byte* key, byte* State);
	void SetDataExtra(int Number, const string& Extra);
	void SetData(int Number);
	void Internal_OnRendered(class UCanvas* C);
	void Clear();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPLuckyCapsuleStore
// 0x0100 (0x0430 - 0x0330)
class UBTTPLuckyCapsuleStore : public UGUITabPanel
{
public:
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x0330(0x0004)
	class UwGameManager*                               GameMgr;                                                  // 0x0334(0x0004)
	class UwMatchMaker*                                MM;                                                       // 0x0338(0x0004)
	class UBTOwnerDrawImageHK*                         NewBackground;                                            // 0x033C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelCapsuleName;                                       // 0x0340(0x0010)
	struct FFloatBox                                   fbLabelCapsulePrice;                                      // 0x0350(0x0010)
	class UBTOwnerDrawImageHK*                         LabelCapsuleName;                                         // 0x0360(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelCapsulePrice;                                        // 0x0364(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbBuyButton;                                              // 0x0368(0x0010)
	struct FFloatBox                                   fbGiftButton;                                             // 0x0378(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 GiftButton;                                               // 0x0388(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbCapsuleList;                                            // 0x038C(0x0010)
	struct FFloatBox                                   fbCapsuleLeftButton;                                      // 0x039C(0x0010)
	struct FFloatBox                                   fbCapsuleRightButton;                                     // 0x03AC(0x0010)
	struct FFloatBox                                   fbPageInfo;                                               // 0x03BC(0x0010)
	class UBTListWithButton*                           CapsuleList;                                              // 0x03CC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPLuckyShopCommon*                        LuckyShopCommon;                                          // 0x03D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strCapsuleName;                                           // 0x03D4(0x000C) (Localized, NeedCtorLink)
	string                                             strCapsulePrice;                                          // 0x03E0(0x000C) (Localized, NeedCtorLink)
	string                                             strBuyCapsule;                                            // 0x03EC(0x000C) (Localized, NeedCtorLink)
	string                                             strGiftCapsule;                                           // 0x03F8(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelIncludeHeader[0x2];                               // 0x0404(0x000C) (Localized, NeedCtorLink)
	class UBTROCapsuleTitle*[]                         OriginalCapsuleData;                                      // 0x041C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __deleShowCashChargeWindow__Delegate;                     // 0x0428(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPLuckyCapsuleStore");
		return ptr;
	}


	void ShowItemBuyWindow(class UBTROItemBoxHK* ro, int buyType, byte cashType);
	void SelectCoin(int buyType, int cashType, class UBTROItemBoxHK* ro);
	bool ItemBuyProcess(int _buyType);
	bool OnClickGift(class UGUIComponent* Sender);
	bool OnClickBuy(class UGUIComponent* Sender);
	bool OnClickBestItemArrow(class UGUIComponent* Sender);
	void OnChangeCapsuleList(class UGUIComponent* Sender);
	void fill();
	void deleAddItem(class UwGameManager* GameMgr, class UObject* addedObject);
	class UObject* deleCreateWZCashItem(class UwItemBoxHK* ItemInfo, const struct FWebzenShopPackage& WZShopPackage);
	class UObject* deleCreateGP20Item(class UwItemBoxHK* ItemInfo, class UwGP20Product* gp20Product);
	class UObject* deleCreatePointItem(int ItemID, class UwItemBoxHK* ItemInfo);
	bool deleCheckItemCommon(class UwGameManager* GameMgr, class UwItemBoxHK* ItemInfo);
	void InsertCapsuleData(class UBTROCapsuleTitle* capsuleData, class UBTROCapsuleTitle*[]* OutArray);
	void AddButton(const struct FFloatBox& fbButton, const string& strCaption, int FontSize, EDrawType dt, class UBTOwnerDrawCaptionButtonHK** AddButton);
	void AddLabel(const struct FFloatBox& fbComponent, const string& strCaption, int FontSize, const struct FColor& TextColor, EDrawType dt, class UBTOwnerDrawImageHK** AddComponent);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void deleShowCashChargeWindow();
};


// Class GUIWarfareControls.BTTPLuckyShopCommon
// 0x0138 (0x0478 - 0x0340)
class UBTTPLuckyShopCommon : public UBTTabPanelHK
{
public:
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x0340(0x0004)
	bool                                               UseItemStateView;                                         // 0x0344(0x0004)
	struct FFloatBox                                   fbImageBestItem;                                          // 0x0348(0x0010)
	struct FFloatBox                                   fbLabelBestItemName;                                      // 0x0358(0x0010)
	struct FFloatBox                                   fbLabelBestItemPrice;                                     // 0x0368(0x0010)
	struct FFloatBox                                   fbLabelBestItemOriginPrice;                               // 0x0378(0x0010)
	class UBTOwnerDrawImageHK*                         ImageBestItem;                                            // 0x0388(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelBestItemName;                                        // 0x038C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelBestItemPrice;                                       // 0x0390(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelBestItemOriginPrice;                                 // 0x0394(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelBestItemOriginPriceStrike;                           // 0x0398(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbCapsuleDescription;                                     // 0x039C(0x0010)
	class UBTMultiLineEditBoxHK*                       CapsuleDescription;                                       // 0x03AC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbItemStateBack;                                          // 0x03B0(0x0010)
	struct FFloatBox                                   fbItemStateView;                                          // 0x03C0(0x0010)
	class UBTOwnerDrawImageHK*                         ItemStateBack;                                            // 0x03D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemStateBoxButtonHK*                     ItemStateView;                                            // 0x03D4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbBestLeftButton;                                         // 0x03D8(0x0010)
	struct FFloatBox                                   fbBestRightButton;                                        // 0x03E8(0x0010)
	struct FFloatBox                                   fbBuyButton;                                              // 0x03F8(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 BestLeftButton;                                           // 0x0408(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 BestRightButton;                                          // 0x040C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 BuyButton;                                                // 0x0410(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelIncludeHeader[0x2];                                // 0x0414(0x0010)
	class UBTOwnerDrawImageHK*                         LabelIncludeHeader[0x2];                                  // 0x0434(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbIncludeItemList;                                        // 0x043C(0x0010)
	class UBTAutoImageListHK*                          IncludeItemList;                                          // 0x044C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelWinners;                                           // 0x0450(0x0010)
	class UBTOwnerDrawImageScroll*                     LabelWinners;                                             // 0x0460(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                CurrentSelectedCapsuleIndex;                              // 0x0464(0x0004)
	class UBTLuckyWinner*[]                            LuckyWinner;                                              // 0x0468(0x000C) (NeedCtorLink)
	bool                                               HasBestWeaponItem;                                        // 0x0474(0x0004)
	bool                                               bShowDiscount;                                            // 0x0474(0x0004)
	bool                                               bRefreshDiscount;                                         // 0x0474(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPLuckyShopCommon");
		return ptr;
	}


	void RefreshVisible();
	bool OnPreDraw(class UCanvas* C);
	void RefreshWinnerList();
	int FindWiinerList(int CapsuleItemID, bool createItem);
	bool Fill_LotteryWinnerList(int CapsuleItemID, byte IsNotification, string[] NickName, struct FBtrDouble[] Time);
	void CheckBestItemArrowEnable(int currentSelected, int CurrentTop, int CountPerPage, int ItemCount);
	void SendWinnersList(int CapsuleItemID);
	void SetBestItemData(int CapsuleItemID, int bestItem);
	void ChangeViewItem(int ItemID);
	void AddButton(const struct FFloatBox& fbButton, const string& strCaption, int FontSize, EDrawType dt, class UBTOwnerDrawCaptionButtonHK** AddButton);
	void AddLabel(const struct FFloatBox& fbComponent, const string& strCaption, int FontSize, const struct FColor& TextColor, EDrawType dt, class UBTOwnerDrawImageHK** AddComponent);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPAuctionHK
// 0x0050 (0x0380 - 0x0330)
class UBTTPAuctionHK : public UGUITabPanel
{
public:
	string                                             strBuying;                                                // 0x0330(0x000C) (Localized, NeedCtorLink)
	string                                             strMyAuction;                                             // 0x033C(0x000C) (Localized, NeedCtorLink)
	string                                             strSelling;                                               // 0x0348(0x000C) (Localized, NeedCtorLink)
	class ABTROModelNew*                               CharacterModel;                                           // 0x0354(0x0004)
	class UTabControlMocker*                           TabControl;                                               // 0x0358(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonAuction[0x3];                                       // 0x035C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UGUITabPanel*                                TPAuction[0x3];                                           // 0x0368(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPAuctionBuyingHK*                        TPBuying;                                                 // 0x0374(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPAuctionMyAuctionHK*                     TPMyAuction;                                              // 0x0378(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPAuctionSellingHK*                       TPSelling;                                                // 0x037C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPAuctionHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPAuctionSellingHK
// 0x03C8 (0x06F8 - 0x0330)
class UBTTPAuctionSellingHK : public UGUITabPanel
{
public:
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x0330(0x0004)
	class UDragObject*                                 DragBox;                                                  // 0x0334(0x0004)
	string                                             strAuctionCancel;                                         // 0x0338(0x000C) (Localized, NeedCtorLink)
	class UBTStretchedImageHK*                         BackgroundImage;                                          // 0x0344(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UTabControlMocker*                           TabControlAuction;                                        // 0x0348(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonAuction[0x4];                                       // 0x034C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strListTopButton[0x8];                                    // 0x035C(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbListTopButton[0x8];                                     // 0x03BC(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ListTopButton[0x8];                                       // 0x043C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         ListTopImage[0x8];                                        // 0x045C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLList;                                                // 0x047C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbACLListScrollBar;                                       // 0x048C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLAuctionHK*                             ACLList;                                                  // 0x049C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strButtonAuctionCancel;                                   // 0x04A0(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonAuctionCancel;                                    // 0x04AC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonAuctionCancel;                                      // 0x04BC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbPageButton;                                             // 0x04C0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTPageListButtonHK*                         PageButton;                                               // 0x04D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemCommonInfoHK*                         MyData;                                                   // 0x04D4(0x0004)
	string                                             strMainMenu[0x4];                                         // 0x04D8(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuAll[0x3];                                       // 0x0508(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuWeapon[0x4];                                    // 0x052C(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuEquip[0x5];                                     // 0x055C(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuSpecial[0x4];                                   // 0x0598(0x000C) (Localized, NeedCtorLink)
	string[]                                           astrSubMenuAll;                                           // 0x05C8(0x000C) (NeedCtorLink)
	string[]                                           astrSubMenuWeapon;                                        // 0x05D4(0x000C) (NeedCtorLink)
	string[]                                           astrSubMenuEquip;                                         // 0x05E0(0x000C) (NeedCtorLink)
	string[]                                           astrSubMenuSpecial;                                       // 0x05EC(0x000C) (NeedCtorLink)
	class UTabControlMocker*                           TabControl[0x2];                                          // 0x05F8(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 MainButton[0x4];                                          // 0x0600(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 SubButton[0x5];                                           // 0x0610(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelItemList;                                          // 0x0624(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelItemList;                                            // 0x0634(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPItemList;                                             // 0x0638(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPItemListHK*                             TPItemList;                                               // 0x0648(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strMenuButton[0x3];                                       // 0x064C(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbMenuButton[0x3];                                        // 0x0670(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 MenuButton[0x3];                                          // 0x06A0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemInfoHorzBoxHK*                        InfoBox;                                                  // 0x06AC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                CurrentRepairMode;                                        // 0x06B0(0x0004)
	int                                                EquipItemCount;                                           // 0x06B4(0x0004)
	struct FBtrDouble[]                                EquipItemList;                                            // 0x06B8(0x000C) (NeedCtorLink)
	struct FBtrDouble[]                                InvenItemList;                                            // 0x06C4(0x000C) (NeedCtorLink)
	string[]                                           Equip_DamegeItemNames;                                    // 0x06D0(0x000C) (NeedCtorLink)
	string[]                                           Inven_DamegeItemNames;                                    // 0x06DC(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __sfReqAuctioItemListInSelling__Delegate;                 // 0x06E8(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __SortAuctionItemList__Delegate;                          // 0x06F0(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPAuctionSellingHK");
		return ptr;
	}


	void Internal_OnShow();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitializeDragAndDrop();
	void InitializeRightPanel();
	void InitializeLeftPanel();
	void Refresh();
	void fill();
	void UnequipItem(int ButtonID);
	void EquipItem();
	bool ChangeSubButton(string[] strTemp);
	void SetInfoBox();
	void ChangeItemList(int mainTab, int subTab);
	void MainTabSelect(int tabi, int subtabi, bool bStopLoop);
	bool MenuButton_OnClick(class UGUIComponent* Sender);
	bool BTWindowAuctionSelling_OnOK(class UGUIComponent* Sender);
	bool BTWindowAuctionCancel_OnOK(class UGUIComponent* Sender);
	bool ButtonAuctionCancel_OnClick(class UGUIComponent* Sender);
	bool ACLList_OnClick(class UGUIComponent* Sender);
	void ItemList_OnEndDrag(class UGUIComponent* Sender, bool bAccepted);
	bool ItemList_OnBeginDrag(class UGUIComponent* Sender);
	bool ListTopButton_OnClick(class UGUIComponent* Sender);
	void SortAuctionItemList(int SortType);
	bool ImageListBox_OnClick(class UGUIComponent* Sender);
	bool ImageListBox_OnDblClick(class UGUIComponent* Sender);
	bool SubButton_OnClick(class UGUIComponent* Sender);
	bool MainButton_OnClick(class UGUIComponent* Sender);
	bool LeftPanel_MainButton_OnClick(class UGUIComponent* Sender);
	bool sfReqAuctioItemListInSelling(int Section, const string& Keyword, int ItemRank, byte ItemClassify, byte IsAvailable, int PageNum, int Count, int SortType);
	void Internal_OnRendered(class UCanvas* C);
};


// Class GUIWarfareControls.BTTPAuctionBuyingHK
// 0x048C (0x07CC - 0x0340)
class UBTTPAuctionBuyingHK : public UBTTabPanelHK
{
public:
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x0340(0x0004)
	class UDragObject*                                 DragBox;                                                  // 0x0344(0x0004)
	struct UBTTPAuctionBuyingHK_FReqAuctionList        LockAuctionList;                                          // 0x0348(0x000C)
	class UButtonGroups*                               InvenGroup;                                               // 0x0354(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTStretchedImageHK*                         BackgroundImage;                                          // 0x0358(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonWeapon[0xA];                                      // 0x035C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strButtonWeapon[0xA];                                     // 0x03FC(0x000C) (Localized, NeedCtorLink)
	class UBTItemBoxButtonHK*                          ButtonWeapon[0xA];                                        // 0x0474(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonAF;                                                 // 0x049C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRSA;                                                // 0x04A0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bLRMousePressed;                                          // 0x04A4(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonLR;                                                 // 0x04A8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bRRMousePressed;                                          // 0x04AC(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRR;                                                 // 0x04B0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         EdgeLine;                                                 // 0x04B4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         AFTeamBG;                                                 // 0x04B8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         RSATeamBG;                                                // 0x04BC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bVisibleAFModel;                                          // 0x04C0(0x0004)
	string                                             strAF;                                                    // 0x04C4(0x000C) (Localized, NeedCtorLink)
	string                                             strRSA;                                                   // 0x04D0(0x000C) (Localized, NeedCtorLink)
	class UBTModelHK*                                  UIModel;                                                  // 0x04DC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class ABTROModelNew*                               CharacterModel;                                           // 0x04E0(0x0004)
	class UBTAutoScrollListHK*                         ChatBox;                                                  // 0x04E4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemCommonInfoHK*                         MyData;                                                   // 0x04E8(0x0004)
	string                                             LastBiddingItemName;                                      // 0x04EC(0x000C) (NeedCtorLink)
	string                                             strMainMenu[0x5];                                         // 0x04F8(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenu[0x5];                                          // 0x0534(0x000C) (Localized, NeedCtorLink)
	class UTabControlMocker*                           TabControl[0x2];                                          // 0x0570(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 MainButton[0x5];                                          // 0x0578(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 SubButton[0x5];                                           // 0x058C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strListTopButton[0x8];                                    // 0x05A0(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbListTopButton[0x8];                                     // 0x0600(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ListTopButton[0x8];                                       // 0x0680(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         ListTopImage[0x8];                                        // 0x06A0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelItemList;                                          // 0x06C0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelItemList;                                            // 0x06D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLList;                                                // 0x06D4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbACLListScrollBar;                                       // 0x06E4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLAuctionHK*                             ACLList;                                                  // 0x06F4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strMenuButton[0x4];                                       // 0x06F8(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbMenuButton[0x4];                                        // 0x0728(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 MenuButton[0x4];                                          // 0x0768(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbPageButton;                                             // 0x0778(0x0010)
	class UBTPageListButtonHK*                         PageButton;                                               // 0x0788(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemInfoHorzBoxHK*                        InfoBox;                                                  // 0x078C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                RankIdx[0x6];                                             // 0x0790(0x0004)
	int                                                SortIdx[0x5];                                             // 0x07A8(0x0004)
	struct FScriptDelegate                             __SortAuctionItemList__Delegate;                          // 0x07BC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __sfReqAuctioItemListInBuying__Delegate;                  // 0x07C4(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPAuctionBuyingHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitializeDragAndDrop();
	void InitializeRightPanel();
	void SelectItem(class UwItemBoxHK* ItemInfo, class UwItemBoxInstanceHK* instanceInfo, bool bHoldcItemInfo);
	bool ACLList_OnClick(class UGUIComponent* Sender);
	bool ACLList_DefaultSelect();
	void InitializeLeftPanel();
	void Refresh();
	void fill();
	void UnequipItem(int ButtonID);
	void EquipItem();
	void ChangeItemList(int mainTab, int subTab);
	bool sfReqAuctioItemListInBuying(int Section, const string& Keyword, int ItemRank, byte ItemClassify, byte IsAvailable, int PageNum, int Count, int SortType);
	int GetSortIdx();
	int GetRankIdx();
	void MainTabSelect(int tabi, int subtabi, bool bStopLoop);
	bool FindAndRemoveItem(int UniqueID);
	void ChangeVisibleModel(bool bAF);
	bool MenuButton_OnClick(class UGUIComponent* Sender);
	bool BTWindowInstantlyBuyHK_OnOK(class UGUIComponent* Sender);
	bool BTWindowTenderHK_OnOK(class UGUIComponent* Sender);
	bool ButtonWeapon_OnDblClick(class UGUIComponent* Sender);
	bool ButtonWeapon_OnClick(class UGUIComponent* Sender);
	void ButtonWeapon_OnEndDrag(class UGUIComponent* Sender, bool bAccepted);
	bool ButtonWeapon_OnBeginDrag(class UGUIComponent* Sender);
	bool SubButton_OnClick(class UGUIComponent* Sender);
	bool MainButton_OnClick(class UGUIComponent* Sender);
	bool ListTopButton_OnClick(class UGUIComponent* Sender);
	void SortAuctionItemList(int SortType);
	bool ButtonRSA_OnClick(class UGUIComponent* Sender);
	bool ButtonAF_OnClick(class UGUIComponent* Sender);
	void ButtonRR_OnRelease(class UGUIComponent* Sender);
	void ButtonRR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	void ButtonLR_OnRelease(class UGUIComponent* Sender);
	void ButtonLR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	void Internal_OnRendered(class UCanvas* C);
	bool Internal_OnPreDraw(class UCanvas* C);
};


// Class GUIWarfareControls.BTWindowTradeHistoryHK
// 0x0098 (0x0558 - 0x04C0)
class UBTWindowTradeHistoryHK : public UBTWindowHK
{
public:
	int                                                ItemID;                                                   // 0x04C0(0x0004)
	struct FFloatBox                                   fbItemBox;                                                // 0x04C4(0x0010)
	class UBTItemBoxButtonHK*                          itemBox;                                                  // 0x04D4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelTradeBG;                                             // 0x04D8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelTradeDivider[0x2];                                   // 0x04DC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTrade[0x3];                                       // 0x04E4(0x0010)
	string                                             strButtonTrade[0x3];                                      // 0x0514(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTrade[0x3];                                         // 0x0538(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLTradeHistory;                                        // 0x0544(0x0010)
	class UBTACLTradeHistoryHK*                        ACLTradeHistory;                                          // 0x0554(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowTradeHistoryHK");
		return ptr;
	}


	void SetData(int ItemID, int PartID, string[] SellerCharNm, int[] DamageDegree, int[] Price);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowAuctionSellingHK
// 0x0234 (0x06F4 - 0x04C0)
class UBTWindowAuctionSellingHK : public UBTWindowHK
{
public:
	int                                                SelectItemCount;                                          // 0x04C0(0x0004)
	int                                                MaxItemCount;                                             // 0x04C4(0x0004)
	string                                             strHour;                                                  // 0x04C8(0x000C) (Localized, NeedCtorLink)
	float                                              MarginArray[0x5];                                         // 0x04D4(0x0004)
	struct FBtrDouble                                  UniqueID;                                                 // 0x04E8(0x0008)
	int                                                PeriodHour;                                               // 0x04F0(0x0004)
	struct FFloatBox                                   fbItemInfoBox;                                            // 0x04F4(0x0010)
	class UBTItemInfoVertBoxHK*                        ItemInfoBox;                                              // 0x0504(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbSeparator[0x2];                                         // 0x0508(0x0010)
	class UBTOwnerDrawImageHK*                         Separator[0x2];                                           // 0x0528(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabel[0x5];                                             // 0x0530(0x0010)
	struct FFloatBox                                   fbEdit[0x4];                                              // 0x0580(0x0010)
	class UBTOwnerDrawImageHK*                         Label[0x5];                                               // 0x05C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         Edit[0x3];                                                // 0x05D4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbNEditBox[0x3];                                          // 0x05E0(0x0010)
	class UBTNumericEditBoxHK*                         NEditBox[0x3];                                            // 0x0610(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbCombo;                                                  // 0x061C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTComboBoxHK*                               Combo;                                                    // 0x062C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelWarning[0x2];                                      // 0x0630(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelWarning[0x2];                                        // 0x0650(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabel[0x5];                                            // 0x0658(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelWarning[0x5];                                     // 0x0694(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelWarning0_0;                                       // 0x06D0(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelWarning0_1;                                       // 0x06DC(0x000C) (Localized, NeedCtorLink)
	string                                             strCount;                                                 // 0x06E8(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowAuctionSellingHK");
		return ptr;
	}


	void Internal_OnOpen();
	void Internal_OnRendered(class UCanvas* C);
	void SetData(int MyPoint, class UwItemBoxHK* ItemInfo, class UwItemBoxInstanceHK* instanceInfo);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void Combo_OnChange(class UGUIComponent* Sender);
};


// Class GUIWarfareControls.BTTPAuctionMyAuctionHK
// 0x04F8 (0x0838 - 0x0340)
class UBTTPAuctionMyAuctionHK : public UBTTabPanelHK
{
public:
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x0340(0x0004)
	class UDragObject*                                 DragBox;                                                  // 0x0344(0x0004)
	struct UBTTPAuctionMyAuctionHK_FReqAuctionList     LockAuctionList;                                          // 0x0348(0x000C)
	class UButtonGroups*                               InvenGroup;                                               // 0x0354(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTStretchedImageHK*                         BackgroundImage;                                          // 0x0358(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonWeapon[0xA];                                      // 0x035C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strButtonWeapon[0xA];                                     // 0x03FC(0x000C) (Localized, NeedCtorLink)
	class UBTItemBoxButtonHK*                          ButtonWeapon[0xA];                                        // 0x0474(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonAF;                                                 // 0x049C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRSA;                                                // 0x04A0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bLRMousePressed;                                          // 0x04A4(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonLR;                                                 // 0x04A8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bRRMousePressed;                                          // 0x04AC(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRR;                                                 // 0x04B0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         EdgeLine;                                                 // 0x04B4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         AFTeamBG;                                                 // 0x04B8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         RSATeamBG;                                                // 0x04BC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bVisibleAFModel;                                          // 0x04C0(0x0004)
	string                                             strAF;                                                    // 0x04C4(0x000C) (Localized, NeedCtorLink)
	string                                             strRSA;                                                   // 0x04D0(0x000C) (Localized, NeedCtorLink)
	class UBTModelHK*                                  UIModel;                                                  // 0x04DC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class ABTROModelNew*                               CharacterModel;                                           // 0x04E0(0x0004)
	class UBTAutoScrollListHK*                         ChatBox;                                                  // 0x04E4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemCommonInfoHK*                         MyData;                                                   // 0x04E8(0x0004)
	string                                             LastBiddingItemName;                                      // 0x04EC(0x000C) (NeedCtorLink)
	string                                             strMainMenu[0x4];                                         // 0x04F8(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuAll[0x3];                                       // 0x0528(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuWeapon[0x4];                                    // 0x054C(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuEquip[0x5];                                     // 0x057C(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuSpecial[0x3];                                   // 0x05B8(0x000C) (Localized, NeedCtorLink)
	string[]                                           astrSubMenuAll;                                           // 0x05DC(0x000C) (NeedCtorLink)
	string[]                                           astrSubMenuWeapon;                                        // 0x05E8(0x000C) (NeedCtorLink)
	string[]                                           astrSubMenuEquip;                                         // 0x05F4(0x000C) (NeedCtorLink)
	string[]                                           astrSubMenuSpecial;                                       // 0x0600(0x000C) (NeedCtorLink)
	class UTabControlMocker*                           TabControl[0x2];                                          // 0x060C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 MainButton[0x4];                                          // 0x0614(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 SubButton[0x5];                                           // 0x0624(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strListTopButton[0x8];                                    // 0x0638(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbListTopButton[0x8];                                     // 0x0698(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ListTopButton[0x8];                                       // 0x0718(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         ListTopImage[0x8];                                        // 0x0738(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelItemList;                                          // 0x0758(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelItemList;                                            // 0x0768(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLList;                                                // 0x076C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbACLListScrollBar;                                       // 0x077C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLAuctionHK*                             ACLList;                                                  // 0x078C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strMenuButton[0x4];                                       // 0x0790(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbMenuButton[0x4];                                        // 0x07C0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 MenuButton[0x4];                                          // 0x0800(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbPageButton;                                             // 0x0810(0x0010)
	class UBTPageListButtonHK*                         PageButton;                                               // 0x0820(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemInfoHorzBoxHK*                        InfoBox;                                                  // 0x0824(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FScriptDelegate                             __SortAuctionItemList__Delegate;                          // 0x0828(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __sfReqAuctioItemListInMyAuction__Delegate;               // 0x0830(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPAuctionMyAuctionHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitializeDragAndDrop();
	void InitializeRightPanel();
	void SelectItem(class UwItemBoxHK* ItemInfo, class UwItemBoxInstanceHK* instanceInfo, bool bHoldcItemInfo);
	bool ACLList_OnClick(class UGUIComponent* Sender);
	bool ACLList_DefaultSelect();
	void InitializeLeftPanel();
	void Refresh();
	void fill();
	void UnequipItem(int ButtonID);
	void EquipItem();
	bool ChangeSubButton(string[] strTemp);
	void ChangeItemList(int mainTab, int subTab);
	bool sfReqAuctioItemListInMyAuction(int Section, const string& Keyword, int ItemRank, byte ItemClassify, byte IsAvailable, int PageNum, int Count, int SortType);
	void MainTabSelect(int tabi, int subtabi, bool bStopLoop);
	bool FindAndRemoveItem(const struct FBtrDouble& UniqueID);
	void ChangeVisibleModel(bool bAF);
	bool MenuButton_OnClick(class UGUIComponent* Sender);
	bool BTWindowInstantlyBuyHK_OnOK(class UGUIComponent* Sender);
	bool BTWindowTenderHK_OnOK(class UGUIComponent* Sender);
	bool ButtonWeapon_OnDblClick(class UGUIComponent* Sender);
	bool ButtonWeapon_OnClick(class UGUIComponent* Sender);
	void ButtonWeapon_OnEndDrag(class UGUIComponent* Sender, bool bAccepted);
	bool ButtonWeapon_OnBeginDrag(class UGUIComponent* Sender);
	bool SubButton_OnClick(class UGUIComponent* Sender);
	bool MainButton_OnClick(class UGUIComponent* Sender);
	bool ListTopButton_OnClick(class UGUIComponent* Sender);
	void SortAuctionItemList(int SortType);
	bool ButtonRSA_OnClick(class UGUIComponent* Sender);
	bool ButtonAF_OnClick(class UGUIComponent* Sender);
	void ButtonRR_OnRelease(class UGUIComponent* Sender);
	void ButtonRR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	void ButtonLR_OnRelease(class UGUIComponent* Sender);
	void ButtonLR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	void Internal_OnRendered(class UCanvas* C);
	bool Internal_OnPreDraw(class UCanvas* C);
};


// Class GUIWarfareControls.BTACLAuctionHK
// 0x0104 (0x0564 - 0x0460)
class UBTACLAuctionHK : public UBTAutoColumnListHK
{
public:
	class UBTRODecorateStringHK*                       decoTimeLine;                                             // 0x0460(0x0004)
	class UBTRODecorateStringHK*                       decoHTU;                                                  // 0x0464(0x0004)
	string                                             strHTU[0x2];                                              // 0x0468(0x000C) (Localized, NeedCtorLink)
	string                                             strDHMS[0x4];                                             // 0x0480(0x000C) (Localized, NeedCtorLink)
	class UBTROItemBoxHK*                              tT;                                                       // 0x04B0(0x0004) (Edit, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strUntilTime[0x5];                                        // 0x04B4(0x000C) (Localized, NeedCtorLink)
	string                                             strUntilTimeLine[0x5];                                    // 0x04F0(0x000C) (Localized, NeedCtorLink)
	struct FImage                                      LevelImg;                                                 // 0x052C(0x0020)
	class UBTItemCommonInfoHK*                         MyData;                                                   // 0x054C(0x0004)
	struct FColor                                      RedColor;                                                 // 0x0550(0x0004)
	struct FColor                                      BlueColor;                                                // 0x0554(0x0004)
	class UBTAutoColumnListDataHK*[]                   ACLPoolList;                                              // 0x0558(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLAuctionHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void LC7_Draw_HTU(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC6_Draw_IPP(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC5_Draw_HTP(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC4_Draw_Limit(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC3_Draw_Damage(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC2_Draw_Level(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC1_Draw_Grade(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC0_Draw_ItemName(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void CheckMyBiddingItemByUniqueID(const struct FBtrDouble& UniqueID);
	void CheckMyRegisterItemByUniqueID(int UniqueID);
	int GetInstanctlyBuyingPrice(int row);
	void Clear();
	void AddAuctionItem(int UniqueID, int ItemID, int PartsID, const struct FBtrTime& UntilTime, int CurrentBiddingPrice, int InstantlyBuyingPrice, int ItemDamage, const string& CurrentBiddingUser, const string& SellerName, int ItemCount, bool bShowTime);
	float GetItemHeight(class UCanvas* C);
	string UntilTimeLineToText(int UntilTime);
	string UntilTimeToText(int UntilTime);
	struct FColor DamageToColor(int Damage);
};


// Class GUIWarfareControls.BTPageListButtonHK
// 0x00A8 (0x03D8 - 0x0330)
class UBTPageListButtonHK : public UGUITabPanel
{
public:
	struct FColor                                      RedColor;                                                 // 0x0330(0x0004)
	int                                                ButtonCount;                                              // 0x0334(0x0004)
	class UBTOwnerDrawImageHK*                         BackgroundImage;                                          // 0x0338(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonIndex[0xA];                                         // 0x033C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         SeparatorIndex[0xA];                                      // 0x0364(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTIconButtonHK*                             ButtonFirst;                                              // 0x038C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTIconButtonHK*                             ButtonPrev;                                               // 0x0390(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTIconButtonHK*                             ButtonNext;                                               // 0x0394(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strButtonFirst;                                           // 0x0398(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonPrev;                                            // 0x03A4(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonNext;                                            // 0x03B0(0x000C) (Localized, NeedCtorLink)
	struct FPageBox                                    PageInfo;                                                 // 0x03BC(0x0014)
	struct FScriptDelegate                             __ButtonIndex_OnClick__Delegate;                          // 0x03D0(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTPageListButtonHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool ButtonPrev_OnClick(class UGUIComponent* Sender);
	bool ButtonNext_OnClick(class UGUIComponent* Sender);
	bool ButtonFirst_OnClick(class UGUIComponent* Sender);
	bool Internal_ButtonIndex_OnClick(class UGUIComponent* Sender);
	void ButtonIndex_OnClick(int pageIndex);
	void ChangeButtonPosition(int startX);
	void SetCurrentIndex(int CurrentPage);
	void SetData(int MaxPage, int ListPerPageCount, int CurrentPage);
};


// Class GUIWarfareControls.BTTPStoreHK
// 0x0028 (0x0358 - 0x0330)
class UBTTPStoreHK : public UGUITabPanel
{
public:
	string                                             strWeapon;                                                // 0x0330(0x000C) (Localized, NeedCtorLink)
	class ABTROModelNew*                               CharacterModel;                                           // 0x033C(0x0004)
	class UTabControlMocker*                           TabControl;                                               // 0x0340(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonInven[0x2];                                         // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UGUITabPanel*                                TPInven[0x2];                                             // 0x034C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPStoreWeaponHK*                          TPWeapon;                                                 // 0x0354(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPStoreHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPStoreWeaponHK
// 0x042C (0x076C - 0x0340)
class UBTTPStoreWeaponHK : public UBTTabPanelHK
{
public:
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x0340(0x0004)
	class UButtonGroups*                               InvenGroup;                                               // 0x0344(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTStretchedImageHK*                         BackgroundImage;                                          // 0x0348(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonWeapon[0x8];                                      // 0x034C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTItemBoxButtonHK*                          ButtonWeapon[0x8];                                        // 0x03CC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strButtonWeapon[0xB];                                     // 0x03EC(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonAF;                                                 // 0x0470(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRSA;                                                // 0x0474(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bLRMousePressed;                                          // 0x0478(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonLR;                                                 // 0x047C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bRRMousePressed;                                          // 0x0480(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRR;                                                 // 0x0484(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         EdgeLine;                                                 // 0x0488(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         AFTeamBG;                                                 // 0x048C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         RSATeamBG;                                                // 0x0490(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bVisibleAFModel;                                          // 0x0494(0x0004)
	string                                             strAF;                                                    // 0x0498(0x000C) (Localized, NeedCtorLink)
	string                                             strRSA;                                                   // 0x04A4(0x000C) (Localized, NeedCtorLink)
	string                                             strForGift[0x2];                                          // 0x04B0(0x000C) (Localized, NeedCtorLink)
	string                                             strForMe[0x2];                                            // 0x04C8(0x000C) (Localized, NeedCtorLink)
	class UBTModelHK*                                  UIModel;                                                  // 0x04E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class ABTROModelNew*                               CharacterModel;                                           // 0x04E4(0x0004)
	class UBTAutoScrollListHK*                         ChatBox;                                                  // 0x04E8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strMainMenu[0x5];                                         // 0x04EC(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuNewAndHot[0x4];                                 // 0x0528(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuWeapon[0x5];                                    // 0x0558(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuEquip[0x6];                                     // 0x0594(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuSpecial[0x4];                                   // 0x05DC(0x000C) (Localized, NeedCtorLink)
	string                                             strSubMenuCashItem[0x3];                                  // 0x060C(0x000C) (Localized, NeedCtorLink)
	string[]                                           astrSubMenuNewAndHot;                                     // 0x0630(0x000C) (NeedCtorLink)
	string[]                                           astrSubMenuWeapon;                                        // 0x063C(0x000C) (NeedCtorLink)
	string[]                                           astrSubMenuEquip;                                         // 0x0648(0x000C) (NeedCtorLink)
	string[]                                           astrSubMenuSpecial;                                       // 0x0654(0x000C) (NeedCtorLink)
	string[]                                           astrSubMenuCashItem;                                      // 0x0660(0x000C) (NeedCtorLink)
	class UTabControlMocker*                           TabControl[0x2];                                          // 0x066C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 MainButton[0x5];                                          // 0x0674(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 SubButton[0x6];                                           // 0x0688(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelItemList;                                          // 0x06A0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelItemList;                                            // 0x06B0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPItemList;                                             // 0x06B4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPItemListHK*                             TPItemList;                                               // 0x06C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strMenuButton[0x3];                                       // 0x06C8(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbMenuButton[0x3];                                        // 0x06EC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 MenuButton[0x3];                                          // 0x071C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemInfoHorzBoxHK*                        InfoBox;                                                  // 0x0728(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                CurrentRepairMode;                                        // 0x072C(0x0004)
	int                                                EquipItemCount;                                           // 0x0730(0x0004)
	int[]                                              EquipItemList;                                            // 0x0734(0x000C) (NeedCtorLink)
	int[]                                              InvenItemList;                                            // 0x0740(0x000C) (NeedCtorLink)
	string                                             SaveWebzenBuyItemName;                                    // 0x074C(0x000C) (NeedCtorLink)
	int                                                nOldMouseX;                                               // 0x0758(0x0004)
	int                                                nOffsetMouseDis;                                          // 0x075C(0x0004)
	class UBTOwnerDrawImageHK*                         LockImage;                                                // 0x0760(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FScriptDelegate                             __deleShowCashChargeWindow__Delegate;                     // 0x0764(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPStoreWeaponHK");
		return ptr;
	}


	bool InternalOnKeyEvent(float Delta, byte* key, byte* KeyState);
	bool ShowSaveWindow(class UBTROItemBoxHK* ro, int buyType, byte cashType);
	void SelectCoin(int buyType, int cashType, class UBTROItemBoxHK* ro);
	void CharRotByDrag();
	bool ShowItemBuyWindow(class UBTROItemBoxHK* ro, int buyType, int cashType);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitializeRightPanel();
	void InitializeLeftPanel();
	void Refresh();
	void SetInfoBox(int Index);
	void AddSubMenuBtns();
	void fill(int[] ShopItemList);
	void deleAddItem(class UwGameManager* GameMgr, class UObject* addedObject);
	bool deleCheckItemCommon(class UwGameManager* GameMgr, class UwItemBoxHK* ItemInfo);
	void UnequipItem(int ButtonID);
	void EquipItem();
	bool ChangeSubButton(string[] strTemp);
	void ChangeItemList(int mainTab, int subTab);
	void MainTabSelect(int tabi, int subtabi);
	bool FindAndRemoveItem(const struct FBtrDouble& UniqueID);
	void ChangeVisibleModel(bool bAF);
	bool CheckValidItem(class UwItemBoxHK* ItemInfo, class UwItemBoxInstanceHK* instnaceinfo);
	bool MenuButton_OnClick(class UGUIComponent* Sender);
	void deleShowCashChargeWindow();
	bool BTWindowItemBuyHK_ButtonRechargeCash_OnOK(class UGUIComponent* Sender);
	bool ButtonWeapon_OnDblClick(class UGUIComponent* Sender);
	bool ButtonWeapon_OnClick(class UGUIComponent* Sender);
	bool ImageListBox_OnClick(class UGUIComponent* Sender);
	bool ImageListBox_OnHover(class UGUIComponent* Sender);
	bool ImageListBox_OnDblClick(class UGUIComponent* Sender);
	bool SubButton_OnClick(class UGUIComponent* Sender);
	bool MainButton_OnClick(class UGUIComponent* Sender);
	bool ButtonRSA_OnClick(class UGUIComponent* Sender);
	bool ButtonAF_OnClick(class UGUIComponent* Sender);
	void ButtonRR_OnRelease(class UGUIComponent* Sender);
	void ButtonRR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	void ButtonLR_OnRelease(class UGUIComponent* Sender);
	void ButtonLR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	void Internal_OnRendered(class UCanvas* C);
	bool Internal_OnPreDraw(class UCanvas* C);
};


// Class GUIWarfareControls.BTWindowItemBuyHK
// 0x0200 (0x06C0 - 0x04C0)
class UBTWindowItemBuyHK : public UBTWindowHK
{
public:
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x04C0(0x0004)
	int                                                ItemID;                                                   // 0x04C4(0x0004)
	int                                                MyPoint;                                                  // 0x04C8(0x0004)
	int                                                MyCash;                                                   // 0x04CC(0x0004)
	class UwItemBoxHK*                                 ItemInfo;                                                 // 0x04D0(0x0004)
	class UwItemBoxInstanceHK*                         instanceInfo;                                             // 0x04D4(0x0004)
	class UwItemBoxCashHK*                             cii;                                                      // 0x04D8(0x0004)
	int                                                OptionDay;                                                // 0x04DC(0x0004)
	struct FColor                                      RedColor;                                                 // 0x04E0(0x0004)
	struct FFloatBox                                   fbItemInfoBox;                                            // 0x04E4(0x0010)
	class UBTItemInfoVertBoxHK*                        ItemInfoBox;                                              // 0x04F4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonRechargeCash;                                     // 0x04F8(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRechargeCash;                                       // 0x0508(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbCombo;                                                  // 0x050C(0x0010)
	class UBTComboBoxHK*                               Combo;                                                    // 0x051C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTermLabel;                                              // 0x0520(0x0010)
	struct FFloatBox                                   fbLabel[0x3];                                             // 0x0530(0x0010)
	class UBTOwnerDrawImageHK*                         Label[0x3];                                               // 0x0560(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         TermLabel;                                                // 0x056C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbNEditPoint[0x3];                                        // 0x0570(0x0010)
	struct FFloatBox                                   fbNEditCash[0x3];                                         // 0x05A0(0x0010)
	class UBTNumericEditBoxHK*                         NEditPoint[0x3];                                          // 0x05D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTNumericEditBoxHK*                         NEditCash[0x3];                                           // 0x05DC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTEditBoxHK*                                EditReceiveUser;                                          // 0x05E8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       EditContent;                                              // 0x05EC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                MyCCoin;                                                  // 0x05F0(0x0004)
	byte                                               cashType;                                                 // 0x05F4(0x0001)
	byte                                               Padding00[0x3];                                           // 0x05F5(0x0003) MISSED OFFSET
	int                                                CurrentBuyType;                                           // 0x05F8(0x0004)
	bool                                               RevertCashInfo;                                           // 0x05FC(0x0004)
	string                                             strLabel[0x3];                                            // 0x0600(0x000C) (Localized, NeedCtorLink)
	string                                             strPoint;                                                 // 0x0624(0x000C) (Localized, NeedCtorLink)
	string                                             strCash;                                                  // 0x0630(0x000C) (Localized, NeedCtorLink)
	string                                             strDay;                                                   // 0x063C(0x000C) (Localized, NeedCtorLink)
	string                                             strCount;                                                 // 0x0648(0x000C) (Localized, NeedCtorLink)
	string                                             strCCoinCash;                                             // 0x0654(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonRechargeCash;                                    // 0x0660(0x000C) (Localized, NeedCtorLink)
	string                                             strTerm;                                                  // 0x066C(0x000C) (Localized, NeedCtorLink)
	string                                             strForGift[0x2];                                          // 0x0678(0x000C) (Localized, NeedCtorLink)
	string                                             strForMe[0x2];                                            // 0x0690(0x000C) (Localized, NeedCtorLink)
	string                                             strUnlimited;                                             // 0x06A8(0x000C) (Localized, NeedCtorLink)
	class UBTROItemBoxHK*                              ro;                                                       // 0x06B4(0x0004)
	struct FScriptDelegate                             __deleShowCashChargeWindow__Delegate;                     // 0x06B8(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowItemBuyHK");
		return ptr;
	}


	void Closed(class UGUIComponent* Sender, bool bCancelled);
	void SetBuyType(int buyType);
	bool ItemBuyHK_BeforePresent_OnOK(class UGUIComponent* Sender);
	void ItemBuyHK_OnTimeOut(class UGUIComponent* Sender);
	bool ItemBuyHK_OnOK(class UGUIComponent* Sender);
	bool ItemBuyHK_ButtonRechargeCash_OnOK(class UGUIComponent* Sender);
	bool STATIC_ShowItemBuyWindow(class UGUIController* Controller, class UBTTcpLink_Channel* setTCP, class UBTROItemBoxHK* ro, int setPoint, int setCash, int setCCoinCash, int buyType, byte cashType);
	int GetCalcCash();
	string GetCoinString();
	void SetData(int iItemID, int myp, int MyC, int myCC, class UwItemBoxHK* itemInfoBase, byte useCashType);
	void SetMoneyInfo(int myp, int MyC, int myCC);
	void SetRenderObject(class UBTROItemBoxHK* ro);
	void Combo_OnChange(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void deleShowCashChargeWindow();
};


// Class GUIWarfareControls.BTWindowItemBuyTerm
// 0x0114 (0x05D4 - 0x04C0)
class UBTWindowItemBuyTerm : public UBTWindowHK
{
public:
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x04C0(0x0004)
	int                                                ItemID;                                                   // 0x04C4(0x0004)
	struct FBtrDouble                                  UniqueID;                                                 // 0x04C8(0x0008)
	byte                                               OptionDay;                                                // 0x04D0(0x0001)
	byte                                               Padding00[0x3];                                           // 0x04D1(0x0003) MISSED OFFSET
	class UwItemBoxHK*                                 ItemInfo;                                                 // 0x04D4(0x0004)
	class UwItemBoxInstanceHK*                         instanceInfo;                                             // 0x04D8(0x0004)
	class UwItemBoxCashHK*                             cii;                                                      // 0x04DC(0x0004)
	struct FFloatBox                                   fbItemBoxView;                                            // 0x04E0(0x0010)
	class UBTItemBoxButtonHK*                          ItemBoxView;                                              // 0x04F0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         lbBriefingInfo[0x4];                                      // 0x04F4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbBriefingInfo[0x4];                                      // 0x0504(0x0010)
	string                                             strBriefingInfo[0x4];                                     // 0x0544(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         lbItemName;                                               // 0x0574(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbItemName;                                               // 0x0578(0x0010)
	string                                             strItemRemaingTime;                                       // 0x0588(0x000C) (Localized, NeedCtorLink)
	string                                             strRemaingTerm[0x2];                                      // 0x0594(0x000C) (Localized, NeedCtorLink)
	string                                             strItemRenewal;                                           // 0x05AC(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         imgItemSelectBack;                                        // 0x05B8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbItemSelectBack;                                         // 0x05BC(0x0010)
	class UBTROItemBoxHK*                              ro;                                                       // 0x05CC(0x0004)
	int                                                cashType;                                                 // 0x05D0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowItemBuyTerm");
		return ptr;
	}


	void Closed(class UGUIComponent* Sender, bool bCancelled);
	void ItemBuyHK_OnTimeOut(class UGUIComponent* Sender);
	bool ItemBuyTerm_OnOK(class UGUIComponent* Sender);
	void SetCashType(int buyCashType);
	void SetOptionDay(byte iDay);
	void SetData(int iItemID, const struct FBtrDouble& iUniqueID, class UwItemBoxHK* itemInfoBase);
	void SetRenderObject(class UBTROItemBoxHK* ro);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTROIncludeItemPopup
// 0x0340 (0x0380 - 0x0040)
class UBTROIncludeItemPopup : public URenderObject
{
public:
	struct FFloatBox                                   fbFixBackGround;                                          // 0x0040(0x0010)
	struct FFloatBox                                   fbFixTitle;                                               // 0x0050(0x0010)
	struct FFloatBox                                   fbFixItemName;                                            // 0x0060(0x0010)
	struct FFloatBox                                   fbFixBestItem;                                            // 0x0070(0x0010)
	struct FFloatBox                                   fbFixItemImage;                                           // 0x0080(0x0010)
	struct FFloatBox                                   fbFixItemDescStart;                                       // 0x0090(0x0010)
	struct FImage                                      BackgroundImage;                                          // 0x00A0(0x0020)
	struct FImage                                      ItemImage;                                                // 0x00C0(0x0020)
	struct FText                                       Title;                                                    // 0x00E0(0x001C) (NeedCtorLink)
	struct FText                                       ItemName;                                                 // 0x00FC(0x001C) (NeedCtorLink)
	struct FText                                       bestItem[0xA];                                            // 0x0118(0x001C) (NeedCtorLink)
	struct FText                                       ItemDesc[0xA];                                            // 0x0230(0x001C) (NeedCtorLink)
	class UwItemBaseParam*                             CurrentItemParam;                                         // 0x0348(0x0004)
	int                                                CurrentItemID;                                            // 0x034C(0x0004)
	int                                                IncludeItemCount;                                         // 0x0350(0x0004)
	class UBTROItemBoxHK*                              tempROItem;                                               // 0x0354(0x0004)
	struct FFloatBox                                   LimitPos;                                                 // 0x0358(0x0010)
	string                                             strTitle;                                                 // 0x0368(0x000C) (Localized, NeedCtorLink)
	string                                             strBestItem;                                              // 0x0374(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROIncludeItemPopup");
		return ptr;
	}


	bool Render(class UCanvas* C, float Delta);
	bool IsBestItem(int checkItemID, int[] BestItemIDs);
	void SetPivotPos(const struct FFloatBox& pivotBox);
	void AddItemData(int AddItemIndex, int AddPartID, bool isBest, class UwGameManager* GameMgr);
	bool SetMainData(int ItemIndex, class UwGameManager* GameMgr);
	void SetDataGP20Package(int ItemIndex, class UwGameManager* GameMgr);
	void SetDataRandbox(int ItemIndex, class UwGameManager* GameMgr);
	void SetDataItembox(int ItemIndex, class UwGameManager* GameMgr);
	void SetBoxData(int ItemIndex, class UwGameManager* GameMgr);
	void SetDefaultLimitPos(class UGUIController* Controller);
	void Init();
};


// Class GUIWarfareControls.BTTPMailHK
// 0x0198 (0x04C8 - 0x0330)
class UBTTPMailHK : public UGUITabPanel
{
public:
	class UBTOwnerDrawCaptionButtonHK*[]               Buttons;                                                  // 0x0330(0x000C) (NeedCtorLink)
	class UBTAutoColumnListHK*[]                       ACLMail;                                                  // 0x033C(0x000C) (NeedCtorLink)
	class UTabControlMocker*                           TabControl;                                               // 0x0348(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 TopButton[0x5];                                           // 0x034C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         TopImage[0x5];                                            // 0x0360(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTopButton[0x5];                                         // 0x0374(0x0010)
	struct FFloatBox                                   fbTopButton2[0x5];                                        // 0x03C4(0x0010)
	string                                             strPoint;                                                 // 0x0414(0x000C) (Localized, NeedCtorLink)
	string                                             strCash;                                                  // 0x0420(0x000C) (Localized, NeedCtorLink)
	string                                             strTopButton[0x6];                                        // 0x042C(0x000C) (Localized, NeedCtorLink)
	string                                             strSendMail;                                              // 0x0474(0x000C) (Localized, NeedCtorLink)
	string                                             strRecvMail;                                              // 0x0480(0x000C) (Localized, NeedCtorLink)
	string                                             strCashItemMail;                                          // 0x048C(0x000C) (Localized, NeedCtorLink)
	string                                             strUndefine;                                              // 0x0498(0x000C) (Localized, NeedCtorLink)
	string                                             strDay;                                                   // 0x04A4(0x000C) (Localized, NeedCtorLink)
	string                                             strHour;                                                  // 0x04B0(0x000C) (Localized, NeedCtorLink)
	string                                             strEmpty;                                                 // 0x04BC(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPMailHK");
		return ptr;
	}


	bool OnSendedMailClick(class UGUIComponent* Sender);
	bool OnReceivedMailClick(class UGUIComponent* Sender);
	bool OnCashItemMailClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitTopButtons();
	void UpdateTopButtons2();
	void UpdateTopButtons();
	void RemoveAll(int Panel);
	void ChangeReadStatus(int Index);
	void ReverseList(int Panel);
	void AddMail(int Panel, int MemoType, int idx, const string& senddate, const string& Sender, const string& Content, int leftdate, int Status, const struct FBtrDouble& ItemUID, int ItemID, int StackCount, int WZStoreSeq, int WZStoreItemSeq, int WZStoreItemType, int Value);
	void TabControl_OnChangedTab(int CurrentIndex, int PrevIndex);
};


// Class GUIWarfareControls.BTTPMailWriteHK
// 0x0130 (0x0460 - 0x0330)
class UBTTPMailWriteHK : public UGUITabPanel
{
public:
	class UBTOwnerDrawImageHK*                         LabelTitle;                                               // 0x0330(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelReceiver;                                            // 0x0334(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelEditReceiver;                                        // 0x0338(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTEditBoxHK*                                EditReceiver;                                             // 0x033C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonFriendList;                                         // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelWarning[0x2];                                        // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelContent;                                             // 0x034C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       Content;                                                  // 0x0350(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonSendMail;                                           // 0x0354(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonCancel;                                             // 0x0358(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTitle;                                             // 0x035C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelReceiver;                                          // 0x036C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelEditReceiver;                                      // 0x037C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbEditReceiver;                                           // 0x038C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonFriendList;                                       // 0x039C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelWarning[0x2];                                      // 0x03AC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelContent;                                           // 0x03CC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbContent;                                                // 0x03DC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonSendMail;                                         // 0x03EC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonCancel;                                           // 0x03FC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strLabelTitle;                                            // 0x040C(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelReceiver;                                         // 0x0418(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonFriendList;                                      // 0x0424(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelWarning[0x2];                                     // 0x0430(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonSendMail;                                        // 0x0448(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonCancel;                                          // 0x0454(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPMailWriteHK");
		return ptr;
	}


	void SetData(const string& receiveUser, const string& ContentText);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPMailReadHK
// 0x01CC (0x04FC - 0x0330)
class UBTTPMailReadHK : public UGUITabPanel
{
public:
	struct FBtrDouble                                  ItemUID;                                                  // 0x0330(0x0008)
	int                                                CurrentMailType;                                          // 0x0338(0x0004)
	int                                                CurrentItemID;                                            // 0x033C(0x0004)
	struct FBtrDouble                                  CurrentItemUID;                                           // 0x0340(0x0008)
	class UBTOwnerDrawImageHK*                         LabelTitle;                                               // 0x0348(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelSender;                                              // 0x034C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         EditSender;                                               // 0x0350(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelRecvDate;                                            // 0x0354(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         EditRecvDate;                                             // 0x0358(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelContent;                                             // 0x035C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTAutoScrollListHK*                         Content;                                                  // 0x0360(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTPointBoxHK*                               PointInfo;                                                // 0x0364(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemInfoHorzBoxHK*                        WeaponInfo;                                               // 0x0368(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonReply;                                              // 0x036C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonDelete;                                             // 0x0370(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonReceiveItem;                                        // 0x0374(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTitle;                                             // 0x0378(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelSender;                                            // 0x0388(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelRecvDate;                                          // 0x0398(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbEditSender;                                             // 0x03A8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbEditRecvDate;                                           // 0x03B8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelContent[0x3];                                      // 0x03C8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbContent[0x3];                                           // 0x03F8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonReply;                                            // 0x0428(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonDelete;                                           // 0x0438(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonReceiveItem;                                      // 0x0448(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbWeaponInfo;                                             // 0x0458(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbPointInfo;                                              // 0x0468(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strLabelTitle[0x2];                                       // 0x0478(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelSender[0x2];                                      // 0x0490(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelRecvDate[0x2];                                    // 0x04A8(0x000C) (Localized, NeedCtorLink)
	string                                             strCash;                                                  // 0x04C0(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonReply;                                           // 0x04CC(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonDelete;                                          // 0x04D8(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonReceivePoint;                                    // 0x04E4(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonReceiveItem;                                     // 0x04F0(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPMailReadHK");
		return ptr;
	}


	void SetData(class UCanvas* C, int TabIndex, int ItemType, const string& Sender, const string& recv_date, const string& Text, int ItemID, const struct FBtrDouble& iItemUID, const string& ExtraText, int StackCount);
	void Clear();
	void ChangeMailType(int MailType, int ItemID, const struct FBtrDouble& ItemUID, int StackCount);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTACLMailHK
// 0x0000 (0x0460 - 0x0460)
class UBTACLMailHK : public UBTAutoColumnListHK
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLMailHK");
		return ptr;
	}


	void ChangeMailColumnMode();
	void ChangeNonFreeGiftColumnMode();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	float GetItemHeight(class UCanvas* C);
	void LC2_Content(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
};


// Class GUIWarfareControls.BTPointBoxHK
// 0x002C (0x0328 - 0x02FC)
class UBTPointBoxHK : public UFloatingImage
{
public:
	int                                                imgW;                                                     // 0x02FC(0x0004)
	struct FText                                       SavePoint;                                                // 0x0300(0x001C) (NeedCtorLink)
	string                                             strPoint;                                                 // 0x031C(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTPointBoxHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void SetData(const struct FBtrDouble& Point);
};


// Class GUIWarfareControls.BTItemStateBoxButtonHK
// 0x002C (0x0320 - 0x02F4)
class UBTItemStateBoxButtonHK : public UGUIButton
{
public:
	class UBTROItemStateBoxHKCN*                       StateBox;                                                 // 0x02F4(0x0004)
	int                                                BGOffsetX;                                                // 0x02F8(0x0004)
	struct FImage                                      GaugeBGImage;                                             // 0x02FC(0x0020)
	bool                                               VisibleGaugeBG;                                           // 0x031C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTItemStateBoxButtonHK");
		return ptr;
	}


	bool OnDraw(class UCanvas* C);
	void SetData(class UwItemBoxHK* ib, class UwItemBoxInstanceHK* ibi, class UwItemBoxHK* cib, class UwItemBoxInstanceHK* cibi);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTEditPWHK
// 0x0014 (0x04A4 - 0x0490)
class UBTEditPWHK : public UBTEditBoxHK
{
public:
	float                                              StarCharWidth;                                            // 0x0490(0x0004)
	int                                                LenSS;                                                    // 0x0494(0x0004)
	string                                             StarString;                                               // 0x0498(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTEditPWHK");
		return ptr;
	}


	void CaculateVisibleText(bool bHoldFirst, int pos);
	bool OwnerDraw(class UCanvas* C);
};


// Class GUIWarfareControls.BTLabelTestHK2
// 0x0000 (0x03BC - 0x03BC)
class UBTLabelTestHK2 : public UBTOwnerDrawImageHK
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTLabelTestHK2");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
};


// Class GUIWarfareControls.BTTPMatchResultCommonHK
// 0x0460 (0x07A0 - 0x0340)
class UBTTPMatchResultCommonHK : public UBTTabPanelHK
{
public:
	string                                             strButtonTopLine[0xB];                                    // 0x0340(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelTeamScore;                                        // 0x03C4(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabelRoomName;                                          // 0x03D0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelRoomName;                                            // 0x03E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLResult[0x2];                                         // 0x03E4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLMatchResultHK*                         ACLResult[0x2];                                           // 0x0404(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelACL[0x2];                                          // 0x040C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelACL[0x2];                                            // 0x042C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelSelectACL[0x2];                                      // 0x0434(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTeamLogo[0x2];                                     // 0x043C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTeamLogo[0x2];                                       // 0x045C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTeamResult[0x2];                                   // 0x0464(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTeamResult[0x2];                                     // 0x0484(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTeamResultMark[0x2];                               // 0x048C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTeamResultMark[0x2];                                 // 0x04AC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTopLine;                                           // 0x04B4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTopLine;                                             // 0x04C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTopLine[0xB];                                     // 0x04C8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTopLine[0xB];                                       // 0x0578(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelSeparator[0xA];                                      // 0x05A4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTeamScore[0x2];                                    // 0x05CC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTeamScore[0x2];                                      // 0x05EC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTeamScoreResult[0x2];                              // 0x05F4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTeamScoreResult[0x2];                                // 0x0614(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bDefenceGame;                                             // 0x061C(0x0004)
	class UBTOwnerDrawImageHK*                         ResultMyInfo;                                             // 0x0620(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbResultMyInfo[0x2];                                      // 0x0624(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelMyInfo[0xD];                                       // 0x0644(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelMyInfo[0xD];                                         // 0x0714(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strMyInfo[0x7];                                           // 0x0748(0x000C) (Localized, NeedCtorLink)
	class UClass*                                      ACLMem_ClassName;                                         // 0x079C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPMatchResultCommonHK");
		return ptr;
	}


	void SetVisibility(bool bIsVisible);
	void SetData(class UwMatchMaker* MM);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPMatchResultPrivateHK
// 0x035C (0x069C - 0x0340)
class UBTTPMatchResultPrivateHK : public UBTTabPanelHK
{
public:
	string                                             strButtonTopLine[0xB];                                    // 0x0340(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabelRoomName;                                          // 0x03C4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelRoomName;                                            // 0x03D4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLResult;                                              // 0x03D8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLMatchResultHK*                         ACLResult;                                                // 0x03E8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelACL;                                               // 0x03EC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelACL;                                                 // 0x03FC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelSelectACL;                                           // 0x0400(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelLogo;                                              // 0x0404(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelLogo;                                                // 0x0414(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTopLine;                                           // 0x0418(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTopLine;                                             // 0x0428(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTopLine[0xB];                                     // 0x042C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTopLine[0xB];                                       // 0x04DC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelSeparator[0xA];                                      // 0x0508(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         ResultMyInfo;                                             // 0x0530(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbResultMyInfo;                                           // 0x0534(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelMyInfo[0xD];                                       // 0x0544(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelMyInfo[0xD];                                         // 0x0614(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strMyInfo[0x7];                                           // 0x0648(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPMatchResultPrivateHK");
		return ptr;
	}


	void SetData(class UwMatchMaker* MM);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTROModelWeapon
// 0x01B4 (0x0600 - 0x044C)
class ABTROModelWeapon : public AInventory
{
public:
	float                                              FOV;                                                      // 0x044C(0x0004)
	bool                                               b1st;                                                     // 0x0450(0x0004)
	int                                                CurrentAni;                                               // 0x0454(0x0004)
	FName[]                                            AnimNames;                                                // 0x0458(0x000C) (NeedCtorLink)
	int                                                weaponID;                                                 // 0x0464(0x0004)
	int                                                WeaponPartsID;                                            // 0x0468(0x0004)
	int                                                PaintingID;                                               // 0x046C(0x0004)
	int                                                WeaponType;                                               // 0x0470(0x0004)
	class AwSkinShell*                                 wWeaponParts[0x3];                                        // 0x0474(0x0004)
	class AwSkinShell*                                 wHands;                                                   // 0x0480(0x0004)
	struct FFloatBox                                   AWinPos;                                                  // 0x0484(0x0010)
	float                                              PosX;                                                     // 0x0494(0x0004)
	float                                              PosY;                                                     // 0x0498(0x0004)
	float                                              posZ;                                                     // 0x049C(0x0004)
	float                                              RotY;                                                     // 0x04A0(0x0004)
	float                                              LightDistance0;                                           // 0x04A4(0x0004)
	float                                              LightDistance1;                                           // 0x04A8(0x0004)
	float                                              LightDistance2;                                           // 0x04AC(0x0004)
	float                                              LightAngle0;                                              // 0x04B0(0x0004)
	float                                              LightAngle1;                                              // 0x04B4(0x0004)
	float                                              LightAngle2;                                              // 0x04B8(0x0004)
	float                                              LightHeight0;                                             // 0x04BC(0x0004)
	float                                              LightHeight1;                                             // 0x04C0(0x0004)
	float                                              LightHeight2;                                             // 0x04C4(0x0004)
	int                                                LightColor0_R;                                            // 0x04C8(0x0004)
	int                                                LightColor0_G;                                            // 0x04CC(0x0004)
	int                                                LightColor0_B;                                            // 0x04D0(0x0004)
	int                                                LightColor1_R;                                            // 0x04D4(0x0004)
	int                                                LightColor1_G;                                            // 0x04D8(0x0004)
	int                                                LightColor1_B;                                            // 0x04DC(0x0004)
	int                                                LightColor2_R;                                            // 0x04E0(0x0004)
	int                                                LightColor2_G;                                            // 0x04E4(0x0004)
	int                                                LightColor2_B;                                            // 0x04E8(0x0004)
	float                                              AspectRatio;                                              // 0x04EC(0x0004)
	struct FVector                                     cameraPosAdd;                                             // 0x04F0(0x000C)
	struct FRotator                                    pawnRotAdd;                                               // 0x04FC(0x000C)
	struct FRotator                                    PawnRot;                                                  // 0x0508(0x000C)
	struct FVector                                     pawnPos;                                                  // 0x0514(0x000C)
	struct FRotator                                    cameraRot;                                                // 0x0520(0x000C)
	struct FVector                                     cameraPos;                                                // 0x052C(0x000C)
	struct FVector                                     lightDist;                                                // 0x0538(0x000C)
	struct FVector                                     lightHeight;                                              // 0x0544(0x000C)
	struct FVector                                     lightAngle;                                               // 0x0550(0x000C)
	struct FColor                                      LightColor[0x3];                                          // 0x055C(0x0004)
	struct FColor                                      LightColor_AF[0x2];                                       // 0x0568(0x0004)
	struct FColor                                      LightColor_RSA[0x2];                                      // 0x0570(0x0004)
	class UwWeaponBaseParams*                          BaseParams;                                               // 0x0578(0x0004)
	float                                              fStancePivot;                                             // 0x057C(0x0004)
	bool                                               bLanding;                                                 // 0x0580(0x0004)
	struct FVector                                     vStanceOffset;                                            // 0x0584(0x000C) (Transient)
	struct FVector                                     vPartsOffset;                                             // 0x0590(0x000C) (Transient)
	struct FVector                                     vBreathOffset;                                            // 0x059C(0x000C) (Transient)
	bool                                               bBreathOffsetXLeft;                                       // 0x05A8(0x0004) (Transient)
	bool                                               bBreathOffsetYUp;                                         // 0x05A8(0x0004) (Transient)
	float                                              fBreathOffsetReflecTime_X;                                // 0x05AC(0x0004) (Transient)
	float                                              fBreathOffsetReflecTime_Y;                                // 0x05B0(0x0004) (Transient)
	float                                              fBreathSeconds;                                           // 0x05B4(0x0004) (Transient)
	float                                              fBreathRatio;                                             // 0x05B8(0x0004)
	struct FVector                                     vAttackedOffset;                                          // 0x05BC(0x000C) (Transient)
	struct FRotator                                    rAttackedRot;                                             // 0x05C8(0x000C) (Transient)
	struct FRotator                                    rSwayDestRot;                                             // 0x05D4(0x000C) (Transient)
	struct FRotator                                    rSwayRot;                                                 // 0x05E0(0x000C) (Transient)
	struct FRotator                                    rSway_LastCameraRot;                                      // 0x05EC(0x000C) (Transient)
	float                                              fSwayAccumTime_Pitch;                                     // 0x05F8(0x0004) (Transient)
	float                                              fSwayAccumTime_Yaw;                                       // 0x05FC(0x0004) (Transient)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROModelWeapon");
		return ptr;
	}


	void SetRotationUI(float rY);
	void SetPositionUI(float X, float Y, float Z);
	void CalcPartsOffset();
	void AnimEnd(int Channel);
	void SetRotationRight();
	void SetRotationLeft();
	bool Render(class UCanvas* C, float Delta);
	void EndModel();
	void SetWeaponPainting(int iPaintingID);
	void SetWeaponParts(int iPartsID, int iPaintingID);
	void SetWeapon(int iWeaponID, int iPartsID);
	void ChangeWeaponsParts(int iPartsID);
	void ChangeWeapon(int iWeaponID, int iPartsID, int iPaintingID);
	void ForceChangeWeapon();
	void BeginModel();
	void SaveModelData();
	void LoadSetModelData();
	void Set1st(bool b1st);
	void Destroyed();
	void Init();
};


// Class GUIWarfareControls.BTTPMatchResultAlien
// 0x0028 (0x07C8 - 0x07A0)
class UBTTPMatchResultAlien : public UBTTPMatchResultCommonHK
{
public:
	struct FFloatBox                                   fbAlienModeMark;                                          // 0x07A0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelAlienModeMark;                                       // 0x07B0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbAlienModeListBack;                                      // 0x07B4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelAlienModeListBack;                                   // 0x07C4(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPMatchResultAlien");
		return ptr;
	}


	void SetVisibility(bool bIsVisible);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowAlreadyGotTrophyHK
// 0x002C (0x0504 - 0x04D8)
class UBTWindowAlreadyGotTrophyHK : public UBTWindowSelectHK
{
public:
	string                                             strLabelInfo;                                             // 0x04D8(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelInfo2;                                            // 0x04E4(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabelInfo2;                                             // 0x04F0(0x0010)
	class UBTOwnerDrawImageHK*                         LabelInfo2;                                               // 0x0500(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowAlreadyGotTrophyHK");
		return ptr;
	}


	void Internal_OnOpen();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowTrophyHK2
// 0x01D4 (0x0694 - 0x04C0)
class UBTWindowTrophyHK2 : public UBTWindowHK
{
public:
	bool                                               bPlayScaleAniSound;                                       // 0x04C0(0x0004)
	string                                             strRequiredUser[0x2];                                     // 0x04C4(0x000C) (Localized, NeedCtorLink)
	string                                             MyNickName;                                               // 0x04DC(0x000C) (NeedCtorLink)
	string                                             TrophyReceiver[0x2];                                      // 0x04E8(0x000C) (NeedCtorLink)
	class UwItemBoxHK*                                 SaveItemInfo[0x2];                                        // 0x0500(0x0004)
	class UwItemBoxInstanceHK*                         SaveInstanceInfo[0x2];                                    // 0x0508(0x0004)
	struct FFloatBox                                   fbButtonItemBox[0x2];                                     // 0x0510(0x0010)
	class UBTAniItemBoxButtonHK*                       ButtonItemBox[0x2];                                       // 0x0530(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonItemState[0x2];                                   // 0x0538(0x0010)
	class UBTTPItemUIStatusHK*                         ButtonItemState[0x2];                                     // 0x0558(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbEditItemDescription[0x2];                               // 0x0560(0x0010)
	class UBTMultiLineEditBoxHK*                       EditItemDescription[0x2];                                 // 0x0580(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelItemDescription[0x2];                              // 0x0588(0x0010)
	class UBTOwnerDrawImageHK*                         LabelItemDescription[0x2];                                // 0x05A8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelSeparator[0x2];                                    // 0x05B0(0x0010)
	class UBTOwnerDrawImageHK*                         LabelSeparator[0x2];                                      // 0x05D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelPreview[0x2];                                      // 0x05D8(0x0010)
	class UBTOwnerDrawImageHK*                         LabelPreview[0x2];                                        // 0x05F8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTModelWeaponHK*                            btWeapon[0x2];                                            // 0x0600(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class ABTROModelWeapon*                            roWeapon[0x2];                                            // 0x0608(0x0004)
	class UBTLabelSlideAnimationHK*                    LabelPreviewSlide[0x2];                                   // 0x0610(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelCenterLineText;                                    // 0x0618(0x0010)
	class UBTOwnerDrawImageHK*                         LabelCenterLineText;                                      // 0x0628(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelCenterLine;                                        // 0x062C(0x0010)
	class UBTOwnerDrawImageHK*                         LabelCenterLine;                                          // 0x063C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabelTopLine;                                          // 0x0640(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabelPromotion;                                         // 0x064C(0x0010)
	class UBTOwnerDrawImageHK*                         LabelPromotion;                                           // 0x065C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabelContent;                                          // 0x0660(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabelContent[0x2];                                      // 0x066C(0x0010)
	class UBTOwnerDrawImageHK*                         LabelContent[0x2];                                        // 0x068C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowTrophyHK2");
		return ptr;
	}


	void Internal_OnOpen();
	void SetData(const string& MyNickName, const string& TrophyReceiver1, const string& TrophyReceiver2, class UwItemBoxHK* ItemInfo1, class UwItemBoxInstanceHK* InstanceInfo1, class UwItemBoxHK* ItemInfo2, class UwItemBoxInstanceHK* InstanceInfo2, class ABTROModelWeapon* ro1, class ABTROModelWeapon* ro2);
	void ButtonItemBox_OnChangeItemInfoEnd2();
	void ButtonItemBox_OnChangeItemInfo2(int Index);
	void ButtonItemBox_OnChangeItemInfoEnd1();
	void ButtonItemBox_OnChangeItemInfo1(int Index);
	void ItemBox_OnDramaEnded2();
	void ItemBox_OnScaleAniChanged2(float scaleValue, float ScaleMax);
	void ItemBox_OnStartScaleAni2(float scaleValue, float ScaleMax);
	void ItemBox_OnDramaEnded();
	void ItemBox_OnScaleAniChanged(float scaleValue, float ScaleMax);
	void ItemBox_OnStartScaleAni(float scaleValue, float ScaleMax);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowQuestInfoHK
// 0x03A8 (0x0868 - 0x04C0)
class UBTWindowQuestInfoHK : public UBTWindowHK
{
public:
	class UBTACLQuestHK*                               ACLCompleteQuest;                                         // 0x04C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTACLQuestHK*                               ACLNewQuest;                                              // 0x04C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabel[0x4];                                             // 0x04C8(0x0010)
	string                                             strLabel[0xC];                                            // 0x0508(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         Label[0x4];                                               // 0x0598(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         Result_BG;                                                // 0x05A8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelCompletedQuest[0x5];                               // 0x05AC(0x0010)
	class UBTLabelQuestDescHK*                         LabelCompletedQuest[0x5];                                 // 0x05FC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelNewQuest[0x5];                                     // 0x0610(0x0010)
	class UBTLabelQuestDescHK*                         LabelNewQuest[0x5];                                       // 0x0660(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         Title;                                                    // 0x0674(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         CompQuestTitle;                                           // 0x0678(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         PuzzlePiceTitle;                                          // 0x067C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         PuzzlePiceDesc[0x3];                                      // 0x0680(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         PuzzlePiceCnt[0x3];                                       // 0x068C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         CompQuestList[0x4];                                       // 0x0698(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         CompQuestRewardList1[0x4];                                // 0x06A8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         CompQuestRewardList2[0x4];                                // 0x06B8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         RewardPuzzlePiceItem[0x3];                                // 0x06C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FImage                                      RewardPuzzlePice[0x8];                                    // 0x06D4(0x0020)
	struct FFloatBox                                   fbPuzzelPice[0x8];                                        // 0x07D4(0x0010)
	int[]                                              ReceivePuzzlePice;                                        // 0x0854(0x000C) (NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonClose;                                              // 0x0860(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UwGameManager*                               GameMgr;                                                  // 0x0864(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowQuestInfoHK");
		return ptr;
	}


	void ResizeLabelNewQuest(int pos, int Size);
	void ResizeLabelCompletedQuest(int pos, int Size);
	void Internal_OnOpen();
	void SetRewardPuzzlePice(int nIdx);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowPromotionHK2
// 0x0070 (0x0530 - 0x04C0)
class UBTWindowPromotionHK2 : public UBTWindowHK
{
public:
	string                                             strLevelUpItemEmpty;                                      // 0x04C0(0x000C) (Localized, NeedCtorLink)
	string                                             strPoint;                                                 // 0x04CC(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelTopLine;                                          // 0x04D8(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabelPromotion;                                         // 0x04E4(0x0010)
	class UBTLabelPromotionHK*                         LabelPromotion;                                           // 0x04F4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabelContent;                                          // 0x04F8(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabelContent;                                           // 0x0504(0x0010)
	class UBTOwnerDrawImageHK*                         LabelContent;                                             // 0x0514(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelLevel;                                             // 0x0518(0x0010)
	class UBTOwnerDrawImageHK*                         LabelLevel;                                               // 0x0528(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelPoint;                                               // 0x052C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowPromotionHK2");
		return ptr;
	}


	void SetPromotionItem(int Exp);
	void LabelPromotion_OnEndPhase(int Phase);
	void LabelPromotion_OnStartPhase(int Phase);
	void Internal_OnOpen();
	void SetData(int Level);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowPromotionHK
// 0x0138 (0x05F8 - 0x04C0)
class UBTWindowPromotionHK : public UBTWindowHK
{
public:
	string                                             strLevelUpItemEmpty;                                      // 0x04C0(0x000C) (Localized, NeedCtorLink)
	string                                             strPoint;                                                 // 0x04CC(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelTopLine;                                          // 0x04D8(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabelPromotion;                                         // 0x04E4(0x0010)
	class UBTLabelPromotionHK*                         LabelPromotion;                                           // 0x04F4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabelContent;                                          // 0x04F8(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabelContent;                                           // 0x0504(0x0010)
	class UBTOwnerDrawImageHK*                         LabelContent;                                             // 0x0514(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelLevel;                                             // 0x0518(0x0010)
	class UBTOwnerDrawImageHK*                         LabelLevel;                                               // 0x0528(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbEven[0x2];                                              // 0x052C(0x0010)
	struct FFloatBox                                   fbOdd[0x3];                                               // 0x054C(0x0010)
	class UBTItemBoxButtonHK*                          itemBox[0x3];                                             // 0x057C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelPromotion2;                                        // 0x0588(0x0010)
	struct FFloatBox                                   fbLabelContent2;                                          // 0x0598(0x0010)
	struct FFloatBox                                   fbLabelLevel2;                                            // 0x05A8(0x0010)
	struct FFloatBox                                   fbBackgroundImage2;                                       // 0x05B8(0x0010)
	struct FFloatBox                                   fbTopLine2;                                               // 0x05C8(0x0010)
	struct FFloatBox                                   fbBottomLine2;                                            // 0x05D8(0x0010)
	struct FFloatBox                                   fbButtonOK2;                                              // 0x05E8(0x0010)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowPromotionHK");
		return ptr;
	}


	void Internal_OnOpen();
	void SetPromotionItem(int Exp, int[] ItemID, int[] PartID);
	void SetData(int Level);
	void LabelPromotion_OnEndPhase(int Phase);
	void LabelPromotion_OnStartPhase(int Phase);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTACLMatchResultHK
// 0x005C (0x04BC - 0x0460)
class UBTACLMatchResultHK : public UBTAutoColumnListHK
{
public:
	string                                             strStatus[0x4];                                           // 0x0460(0x000C) (Localized, NeedCtorLink)
	struct FImage                                      LevelImg;                                                 // 0x0490(0x0020)
	struct FText[]                                     tarray;                                                   // 0x04B0(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLMatchResultHK");
		return ptr;
	}


	int GetLevelMarkID(int row);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void LC9_10_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC8_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC3_Draw_Death(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC3_Draw_assist(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC3_Draw_kill(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC3_Draw_Score(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC3_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC2_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC1_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	class UBTAutoColumnListDataHK* FindTeamMember(int UID);
	bool RemoveTeamMemberByUID(int UID);
	void AddTeamMemeber(bool bMe, int UID, int ClanMark, int ClanBG, int ClanBL, int Level, const string& NickName, const string& ClanName, int Score, int Kill, int Assist, int Death, int Exp, int expup, int Point, int pointup, int[] BonusIDs, int LookingFor, bool bFriendly, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	float GetItemHeight(class UCanvas* C);
};


// Class GUIWarfareControls.BTTPMyInfoAllHK
// 0x0274 (0x05B4 - 0x0340)
class UBTTPMyInfoAllHK : public UBTTabPanelHK
{
public:
	class ABTROModelNew*                               CharacterModel;                                           // 0x0340(0x0004)
	struct FFloatBox                                   fbBackgroundPanel[0x2];                                   // 0x0344(0x0010)
	class UBTOwnerDrawImageHK*                         BackgroundPanel[0x2];                                     // 0x0364(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UButtonGroups*                               InvenGroup;                                               // 0x036C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTStretchedImageHK*                         BackgroundImage;                                          // 0x0370(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonWeapon[0xA];                                      // 0x0374(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strButtonWeapon[0xA];                                     // 0x0414(0x000C) (Localized, NeedCtorLink)
	class UBTItemBoxButtonHK*                          ButtonWeapon[0xA];                                        // 0x048C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonAF;                                                 // 0x04B4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRSA;                                                // 0x04B8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bLRMousePressed;                                          // 0x04BC(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonLR;                                                 // 0x04C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bRRMousePressed;                                          // 0x04C4(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRR;                                                 // 0x04C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         EdgeLine;                                                 // 0x04CC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         AFTeamBG;                                                 // 0x04D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         RSATeamBG;                                                // 0x04D4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bVisibleAFModel;                                          // 0x04D8(0x0004)
	string                                             strAF;                                                    // 0x04DC(0x000C) (Localized, NeedCtorLink)
	string                                             strRSA;                                                   // 0x04E8(0x000C) (Localized, NeedCtorLink)
	class UBTModelHK*                                  UIModel;                                                  // 0x04F4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTAutoScrollListHK*                         ChatBox;                                                  // 0x04F8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strButtonTab[0x4];                                        // 0x04FC(0x000C) (Localized, NeedCtorLink)
	class UTabControlMocker*                           TabControl;                                               // 0x052C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTab[0x4];                                         // 0x0530(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTab[0x4];                                           // 0x0570(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPPanel;                                                // 0x0580(0x0010)
	class UBTTPOptionBaseHK*                           TPPanel[0x4];                                             // 0x0590(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                VisiblePanelIdx;                                          // 0x05A0(0x0004)
	class UBTTPMyInfoBasicHK*                          TPBasic;                                                  // 0x05A4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPMyInfoStatHK*                           TPStat;                                                   // 0x05A8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPMyInfoRankHK*                           TPRank;                                                   // 0x05AC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPMyInfoFriendlyUserHK*                   TPFriendly;                                               // 0x05B0(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPMyInfoAllHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool ButtonTab_OnClick(class UGUIComponent* Sender);
	void InitializeRightPanel();
	void InitializeLeftPanel();
	void Refresh();
	void ChangeVisibleModel(bool bAF);
	void UpdateServerTime(const struct FBtrDouble& D);
	bool ButtonRSA_OnClick(class UGUIComponent* Sender);
	bool ButtonAF_OnClick(class UGUIComponent* Sender);
	void ButtonRR_OnRelease(class UGUIComponent* Sender);
	void ButtonRR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	void ButtonLR_OnRelease(class UGUIComponent* Sender);
	void ButtonLR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	bool Internal_OnPreDraw(class UCanvas* C);
};


// Class GUIWarfareControls.BTTPMyInfoFriendlyUserHK
// 0x0118 (0x0820 - 0x0708)
class UBTTPMyInfoFriendlyUserHK : public UBTTPOptionBaseHK
{
public:
	struct FFloatBox                                   fbComboBox;                                               // 0x0708(0x0010)
	class UBTOwnerDrawImageHK*                         LabelMyName;                                              // 0x0718(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTComboBoxHK*                               ComboFriendlyUser;                                        // 0x071C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strLabel[0x14];                                           // 0x0720(0x000C) (Localized, NeedCtorLink)
	struct FScriptDelegate                             __OnChangeFriendlyUser__Delegate;                         // 0x0810(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnHideFriendlyUserList__Delegate;                       // 0x0818(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPMyInfoFriendlyUserHK");
		return ptr;
	}


	void InitializeLabel();
	void FillComoboFriendlyUser();
	void OnHide_ComboFriendlyUserList();
	void OnChange_ComboFriendlyUser(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitializeContent();
	string GetSelectedFriendlyUserName();
	void SetData(bool bMyInfo, int UserID, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FCharInfo& stCharInfo, const struct FClanInfo& stClanInfo, int ClanLevel);
	void OnHideFriendlyUserList();
	void OnChangeFriendlyUser();
};


// Class GUIWarfareControls.BTTPMyInfoRankHK
// 0x00E4 (0x07EC - 0x0708)
class UBTTPMyInfoRankHK : public UBTTPOptionBaseHK
{
public:
	string                                             strMainRank[0xC];                                         // 0x0708(0x000C) (Localized, NeedCtorLink)
	string                                             strSubRank[0x4];                                          // 0x0798(0x000C) (Localized, NeedCtorLink)
	class UBTComboBoxHK*                               RankComboBox[0x2];                                        // 0x07C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                nContentSettingLength;                                    // 0x07D0(0x0004)
	struct FScriptDelegate                             __OnChangeMainComboBox__Delegate;                         // 0x07D4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnChangeSubComboBox__Delegate;                          // 0x07DC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnHideComboBoxList__Delegate;                           // 0x07E4(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPMyInfoRankHK");
		return ptr;
	}


	void CompleteSetRankingInfo();
	void SetRankingInfo(byte RankingType, byte CommunityType, string[] CharName, int[] CharLevel, string[] ClanName, int[] ClanMarkPattern, int[] ClanMarkBG, int[] ClanMarkBL, int[] Ranking_Accum, int[] Ranking_Accum_Prev, int[] Ranking_Accum_Exp, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	void SetRankComboboxSelectIndex(int idx, int SelectIdx);
	int GetRankComboboxSelectedIndex(int idx);
	void OnHide_ComboBoxList();
	void OnChange_SubComboBox(class UGUIComponent* Sender);
	void OnChange_MainComboBox(class UGUIComponent* Sender);
	void SetSubComboBox(int MainIdx);
	void SetMainComboBox();
	void InitializeContent(byte RankType, int nRankingCount);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void OnHideComboBoxList();
	void OnChangeSubComboBox();
	void OnChangeMainComboBox();
};


// Class GUIWarfareControls.BTLabelCreditAnimationHK
// 0x0014 (0x03D0 - 0x03BC)
class UBTLabelCreditAnimationHK : public UBTOwnerDrawImageHK
{
public:
	float                                              LastTimeSeconds;                                          // 0x03BC(0x0004)
	float                                              CurrentTop;                                               // 0x03C0(0x0004)
	float                                              DeltaMultiplier;                                          // 0x03C4(0x0004)
	struct FScriptDelegate                             __OnEndCredit__Delegate;                                  // 0x03C8(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTLabelCreditAnimationHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void IncreaseDelta();
	void DecreaseDelta();
	void OnEndCredit();
};


// Class GUIWarfareControls.BTSliderGripButtonHK
// 0x000C (0x04DC - 0x04D0)
class UBTSliderGripButtonHK : public UBTOwnerDrawCaptionButtonHK
{
public:
	string                                             HightLight;                                               // 0x04D0(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTSliderGripButtonHK");
		return ptr;
	}


	void OnRendered(class UCanvas* C);
	bool CheckIn(float X, float Y);
	void SetHighLight(const string& Value);
};


// Class GUIWarfareControls.BTScrollProcess
// 0x0070 (0x009C - 0x002C)
class UBTScrollProcess : public UObject
{
public:
	struct FFloatBox                                   CurrentWinPos;                                            // 0x002C(0x0010)
	struct FFloatBox                                   OriginalWinPos;                                           // 0x003C(0x0010)
	bool                                               bUpdateProcess;                                           // 0x004C(0x0004)
	E_SCROLL_MOVE_TYPE[]                               ScrollTypeArray;                                          // 0x0050(0x000C) (NeedCtorLink)
	float[]                                            ScrollDataArray;                                          // 0x005C(0x000C) (NeedCtorLink)
	E_SCROLL_CHECKEND_TYPE[]                           CheckEndArray;                                            // 0x0068(0x000C) (NeedCtorLink)
	float[]                                            CheckDataArray;                                           // 0x0074(0x000C) (NeedCtorLink)
	E_NEXTANIMATION_ACTION[]                           NextActionArray;                                          // 0x0080(0x000C) (NeedCtorLink)
	int                                                CurrentAnimationNum;                                      // 0x008C(0x0004)
	float                                              CheckHoldTime;                                            // 0x0090(0x0004)
	struct FScriptDelegate                             __OnNextAnimationStart__Delegate;                         // 0x0094(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTScrollProcess");
		return ptr;
	}


	bool STATIC_CullString(class UCanvas* C, const string& Text, const struct FFloatBox& fbCheck, const struct FFloatBox& fbTarget, float fntSize, string* strOutput);
	void NextAnimation();
	void DoNextAnimation(E_NEXTANIMATION_ACTION _nextAction);
	void CheckEnd(float DeltaTime);
	struct FFloatBox Process(float DeltaTime);
	void InitAnimation(const struct FFloatBox& OrigWinPos);
	void InitValue();
	void AddAnimation(E_SCROLL_MOVE_TYPE _scrollType, float _scrollData, E_SCROLL_CHECKEND_TYPE _check, float _checkData, E_NEXTANIMATION_ACTION _nextAction);
	void ClearAnimation();
	void OnNextAnimationStart();
};


// Class GUIWarfareControls.BTROItemStateBoxHK
// 0x00C4 (0x0104 - 0x0040)
class UBTROItemStateBoxHK : public URenderObject
{
public:
	class UBTROWeaponStatusBarHK*                      WeaponState[0x6];                                         // 0x0040(0x0004)
	struct FText                                       textForm;                                                 // 0x0058(0x001C) (NeedCtorLink)
	struct FText[]                                     textAmmosize;                                             // 0x0074(0x000C) (NeedCtorLink)
	struct FText[]                                     textSkill;                                                // 0x0080(0x000C) (NeedCtorLink)
	struct FColor                                      plus_c;                                                   // 0x008C(0x0004)
	struct FColor                                      minus_c;                                                  // 0x0090(0x0004)
	string                                             strDamage;                                                // 0x0094(0x000C) (Localized, NeedCtorLink)
	string                                             strSpread;                                                // 0x00A0(0x000C) (Localized, NeedCtorLink)
	string                                             strViewKick;                                              // 0x00AC(0x000C) (Localized, NeedCtorLink)
	string                                             strRateofFire;                                            // 0x00B8(0x000C) (Localized, NeedCtorLink)
	string                                             strMove;                                                  // 0x00C4(0x000C) (Localized, NeedCtorLink)
	string                                             strRange;                                                 // 0x00D0(0x000C) (Localized, NeedCtorLink)
	string                                             strAmmoSize;                                              // 0x00DC(0x000C) (Localized, NeedCtorLink)
	string                                             strSkill;                                                 // 0x00E8(0x000C) (Localized, NeedCtorLink)
	int                                                X[0x4];                                                   // 0x00F4(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROItemStateBoxHK");
		return ptr;
	}


	bool Render(class UCanvas* C, float Delta);
	void SetTextWidthNSpace(int width, int Space);
	void SetTextDrawType(EDrawType dt);
	void SetSkill(const string& Skill, const string& mskill);
	void SetAmmoSize(int clipsize, int MaxAmmo, int addopt1, int addopt2);
	void SetRange(int Value, int Add);
	void SetMove(int Value, int Add);
	void SetRateofFire(int Value, int Add);
	void SetViewKick(int Value, int Add);
	void SetSpread(int Value, int Add);
	void SetDamage(int Value, int Add);
	void Init();
};


// Class GUIWarfareControls.BTROItemStateBoxHKCN
// 0x000C (0x0110 - 0x0104)
class UBTROItemStateBoxHKCN : public UBTROItemStateBoxHK
{
public:
	float                                              locYOffset;                                               // 0x0104(0x0004)
	int                                                gaugeStartYOffset;                                        // 0x0108(0x0004)
	int                                                gaugeYSize;                                               // 0x010C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROItemStateBoxHKCN");
		return ptr;
	}


	bool Render(class UCanvas* C, float Delta);
	void SetTextWidthNSpace(int width, int Space);
	void SetTextDrawType(EDrawType dt);
	void SetSkill(const string& Skill, const string& mskill);
	void SetAmmoSize(int clipsize, int MaxAmmo, int addopt1, int addopt2);
	void SetRange(int Value, int Add);
	void SetMove(int Value, int Add);
	void SetRateofFire(int Value, int Add);
	void SetViewKick(int Value, int Add);
	void SetSpread(int Value, int Add);
	void SetDamage(int Value, int Add);
	void Init();
};


// Class GUIWarfareControls.BTWindowCustomConfirm
// 0x01B8 (0x0678 - 0x04C0)
class UBTWindowCustomConfirm : public UBTWindowHK
{
public:
	struct FFloatBox                                   fbLabel[0x3];                                             // 0x04C0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strLabel[0x3];                                            // 0x04F0(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         Label[0x3];                                               // 0x0514(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strPoint;                                                 // 0x0520(0x000C) (Localized, NeedCtorLink)
	string                                             strCash;                                                  // 0x052C(0x000C) (Localized, NeedCtorLink)
	string                                             strPartLabel[0x5];                                        // 0x0538(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         PartLabel[0x5];                                           // 0x0574(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         PartPointLabel[0x5];                                      // 0x0588(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         PartCashLabel[0x5];                                       // 0x059C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         PartPointTextLabel[0x5];                                  // 0x05B0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         PartCashTextLabel[0x5];                                   // 0x05C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strCalcPrice[0x3];                                        // 0x05D8(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         CalcTextLabel[0x3];                                       // 0x05FC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         CalcPointTextLabel[0x3];                                  // 0x0608(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         CalcCashTextLabel[0x3];                                   // 0x0614(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         CalcPointLabel[0x3];                                      // 0x0620(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         CalcCashLabel[0x3];                                       // 0x062C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strNotify;                                                // 0x0638(0x000C) (Localized, NeedCtorLink)
	class UBTMultiLineEditBoxHK*                       NotifyLabel;                                              // 0x0644(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemBoxButtonHK*                          btnOrigCustomItems[0x5];                                  // 0x0648(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemBoxButtonHK*                          btnDestCustomItems[0x5];                                  // 0x065C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                iSumItemPointPrice;                                       // 0x0670(0x0004)
	int                                                iSumItemCashPrice;                                        // 0x0674(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowCustomConfirm");
		return ptr;
	}


	void SetData(int OrigUnionedPartID, int WantedUnionedPartID, int OrigPaintingID, int WantedPaintingID);
	void SetPrice(int iIndex, int OrigPartID, int iWantedPartID, int OrigPaintID, int WantedPaintID);
	void SetItem(int iOrigOrWanted, int iButtonIndex, int PartID, int PaintingID);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTRORadioItemBoxHK
// 0x006C (0x00AC - 0x0040)
class UBTRORadioItemBoxHK : public URenderObject
{
public:
	class UGUIController*                              PController;                                              // 0x0040(0x0004)
	bool                                               bSelect;                                                  // 0x0044(0x0004)
	struct FImage                                      RadioButton[0x3];                                         // 0x0048(0x0020)
	class UBTROItemBoxHK*                              itemBox;                                                  // 0x00A8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTRORadioItemBoxHK");
		return ptr;
	}


	bool Render(class UCanvas* C, float Delta);
	void Init();
};


// Class GUIWarfareControls.BTModelWeaponHK
// 0x0018 (0x0348 - 0x0330)
class UBTModelWeaponHK : public UGUITabPanel
{
public:
	string                                             LogStr;                                                   // 0x0330(0x000C) (NeedCtorLink)
	float                                              CurrentTime;                                              // 0x033C(0x0004)
	float                                              LastTime;                                                 // 0x0340(0x0004)
	class ABTROModelWeapon*                            cModel;                                                   // 0x0344(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTModelWeaponHK");
		return ptr;
	}


	bool Internal_OnKeyEvent(float Delta, byte* key, byte* Action);
	bool Internal_OnDraw(class UCanvas* C);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTLabelArrowStateHK
// 0x0024 (0x03E0 - 0x03BC)
class UBTLabelArrowStateHK : public UBTOwnerDrawImageHK
{
public:
	struct FImage                                      ArrowImage;                                               // 0x03BC(0x0020)
	int                                                ArrowState;                                               // 0x03DC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTLabelArrowStateHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void SetData(int Value);
};


// Class GUIWarfareControls.BTROMapInfoHK
// 0x00B8 (0x00F8 - 0x0040)
class UBTROMapInfoHK : public URenderObject
{
public:
	int                                                FontMapNameSize;                                          // 0x0040(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FColor                                      FontColor;                                                // 0x0044(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FColor                                      FontShadowColor;                                          // 0x0048(0x0004) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FImage                                      BackgroundImage;                                          // 0x004C(0x0020)
	struct FImage                                      MapImage;                                                 // 0x006C(0x0020)
	struct FImage                                      ImageSupply[0x3];                                         // 0x008C(0x0020)
	string                                             strMapName;                                               // 0x00EC(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROMapInfoHK");
		return ptr;
	}


	bool Render(class UCanvas* C, float Delta);
	void SetData(const string& MapName, class UMaterial* MapImg, class UMaterial* imgSupply0, class UMaterial* imgSupply1, class UMaterial* imgSupply2);
	void Init();
};


// Class GUIWarfareControls.BTTPClanMarkListHK
// 0x000C (0x033C - 0x0330)
class UBTTPClanMarkListHK : public UGUITabPanel
{
public:
	int                                                OutLineHorzBorder;                                        // 0x0330(0x0004)
	int                                                OutLineVertBorder;                                        // 0x0334(0x0004)
	class UBTClanMarkImageListHK*                      ClanMarkList;                                             // 0x0338(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPClanMarkListHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void AddItem(int clanmarkid, int clanmarktype1, int clanmarktype2, int selltype, int DisplayOrder, const string& clanmarkresource32, const string& clanmarkresource128);
	void SetOutlineBorder(int horz, int vert);
};


// Class GUIWarfareControls.BTROCreateClanMarkHK
// 0x013C (0x017C - 0x0040)
class UBTROCreateClanMarkHK : public URenderObject
{
public:
	bool                                               bClanMarkSize128;                                         // 0x0040(0x0004)
	int                                                roClanMarkID;                                             // 0x0044(0x0004)
	int                                                roType1;                                                  // 0x0048(0x0004)
	int                                                roType2;                                                  // 0x004C(0x0004)
	int                                                LayerCount;                                               // 0x0050(0x0004)
	int                                                clanmarkid[0x3];                                          // 0x0054(0x0004)
	int                                                clanmarktype1[0x3];                                       // 0x0060(0x0004)
	int                                                clanmarktype2[0x3];                                       // 0x006C(0x0004)
	bool                                               bUseSellMark;                                             // 0x0078(0x0004)
	int                                                selltype[0x3];                                            // 0x007C(0x0004)
	int                                                DisplayOrder[0x3];                                        // 0x0088(0x0004)
	string                                             clanmarkresource32[0x3];                                  // 0x0094(0x000C) (NeedCtorLink)
	string                                             clanmarkresource128[0x3];                                 // 0x00B8(0x000C) (NeedCtorLink)
	struct FImage                                      Background;                                               // 0x00DC(0x0020)
	struct FImage                                      Layer[0x3];                                               // 0x00FC(0x0020)
	struct FImage                                      Status;                                                   // 0x015C(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROCreateClanMarkHK");
		return ptr;
	}


	bool Render(class UCanvas* C, float Delta);
	void Update(class UCanvas* C, float Delta);
	void SetData(int LayerIndex, int clanmarkid, int clanmarktype1, int clanmarktype2, int selltype, int DisplayOrder, const string& clanmarkresource32, const string& clanmarkresource128);
	void SetClanMarkSize32();
	void SetClanMarkSize128();
	void SetClanMarkType(int clanmarktype1, int clanmarktype2);
	void SetClanMarkID(int clanmarkid);
	void Init();
};


// Class GUIWarfareControls.BTClanMarkHK
// 0x0004 (0x03C0 - 0x03BC)
class UBTClanMarkHK : public UBTOwnerDrawImageHK
{
public:
	class UBTROCreateClanMarkHK*                       ro;                                                       // 0x03BC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTClanMarkHK");
		return ptr;
	}


	bool Internal_OnDraw(class UCanvas* C);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTClanMarkImageListHK
// 0x000C (0x0390 - 0x0384)
class UBTClanMarkImageListHK : public UBTAutoImageListHK
{
public:
	class UBTROCreateClanMarkHK*[]                     DataPool;                                                 // 0x0384(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTClanMarkImageListHK");
		return ptr;
	}


	void ImageListBox_OnDrawItem(class UCanvas* C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending);
	void ShowBGEtc();
	void ShowBGCircle();
	void ShowBGShield();
	void ShowEtc();
	void ShowWeapon();
	void ShowAnimal();
	void ShowAll(int clanmarktype1, int clanmarktype2);
	void ResetItem();
	void ClearItem();
	void RemoveItem(int clanmarkid);
	void AddItem(class UBTROCreateClanMarkHK* ro);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTItemInfoVertBoxHK
// 0x0014 (0x0344 - 0x0330)
class UBTItemInfoVertBoxHK : public UGUITabPanel
{
public:
	class UBTOwnerDrawImageHK*                         Panel;                                                    // 0x0330(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemBoxButtonHK*                          ItemBoxView;                                              // 0x0334(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemStateBoxButtonHK*                     ItemStateView;                                            // 0x0338(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelItemDescription;                                     // 0x033C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       EditItemDescription;                                      // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTItemInfoVertBoxHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetData(class UwItemBoxHK* ItemInfo, class UwItemBoxInstanceHK* instanceInfo, class UwItemBoxHK* cItemInfo, class UwItemBoxInstanceHK* cInstanceInfo);
};


// Class GUIWarfareControls.BTLabelQuestDescHK
// 0x00B4 (0x0470 - 0x03BC)
class UBTLabelQuestDescHK : public UBTOwnerDrawImageHK
{
public:
	bool                                               bSummaryMode;                                             // 0x03BC(0x0004)
	class UwGameManager*                               GameMgr;                                                  // 0x03C0(0x0004)
	class UwQuestParam*                                q;                                                        // 0x03C4(0x0004)
	class UwQuestParam*                                pq;                                                       // 0x03C8(0x0004)
	struct FText[]                                     arrPrevQuest;                                             // 0x03CC(0x000C) (NeedCtorLink)
	struct FText[]                                     arrCurQuest;                                              // 0x03D8(0x000C) (NeedCtorLink)
	struct FText                                       txtQuestExtDesc;                                          // 0x03E4(0x001C) (NeedCtorLink)
	struct FText                                       txtReward;                                                // 0x0400(0x001C) (NeedCtorLink)
	struct FText                                       txtLastReward;                                            // 0x041C(0x001C) (NeedCtorLink)
	struct FText                                       QuestReward;                                              // 0x0438(0x001C) (NeedCtorLink)
	struct FText                                       AllQuestReward;                                           // 0x0454(0x001C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTLabelQuestDescHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void SetData(const string& PrevQuestName, const string& PrevQuestDesc, const string& QuestName, const string& QuestDesc, const string& QuestExtDesc, const string& Reward, const string& LastReward);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTItemInfoToolTipWindow
// 0x00DC (0x041C - 0x0340)
class UBTItemInfoToolTipWindow : public UBTTabPanelHK
{
public:
	class UBTOwnerDrawImageHK*                         BackgroundImg;                                            // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         Title;                                                    // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         RewardItemImage;                                          // 0x0348(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         ItemName;                                                 // 0x034C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         strBEST[0xA];                                             // 0x0350(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         contents[0xA];                                            // 0x0378(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strPopUp[0xA];                                            // 0x03A0(0x000C) (Localized, NeedCtorLink)
	class UBTROItemBoxHK*                              tempROItem;                                               // 0x0418(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTItemInfoToolTipWindow");
		return ptr;
	}


	void SetVisibleGroup(bool bVisible);
	bool IsBestItem(int checkItemID, int[] BestItemIDs);
	void SetVisibleControl(bool IsVisible);
	void FillCapsuleItemList(int nItemID);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTLuckyWinner
// 0x002C (0x032C - 0x0300)
class UBTLuckyWinner : public UGUIMultiComponent
{
public:
	int                                                ItemID;                                                   // 0x0300(0x0004)
	bool                                               ChangedWinners;                                           // 0x0304(0x0004)
	string[]                                           Winners;                                                  // 0x0308(0x000C) (NeedCtorLink)
	struct FBtrDouble[]                                WinnersTime;                                              // 0x0314(0x000C) (NeedCtorLink)
	string                                             strWinnersHeader;                                         // 0x0320(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTLuckyWinner");
		return ptr;
	}


	bool MakeString(string* strOutput);
	void ClearWinners();
	void AddWinner(const string& winnerName, const struct FBtrDouble& winTime);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPOptionGraphicHK
// 0x017C (0x0884 - 0x0708)
class UBTTPOptionGraphicHK : public UBTTPOptionBaseHK
{
public:
	bool                                               bInGameResolutionChanged;                                 // 0x0708(0x0004)
	bool                                               bChangeResolution;                                        // 0x0708(0x0004)
	bool                                               bChangeGraphicOption;                                     // 0x0708(0x0004)
	string                                             strDark;                                                  // 0x070C(0x000C) (Localized, NeedCtorLink)
	string                                             strBright;                                                // 0x0718(0x000C) (Localized, NeedCtorLink)
	string                                             strLow;                                                   // 0x0724(0x000C) (Localized, NeedCtorLink)
	string                                             strHigh;                                                  // 0x0730(0x000C) (Localized, NeedCtorLink)
	string                                             strLabel[0xA];                                            // 0x073C(0x000C) (Localized, NeedCtorLink)
	string                                             strBrightness;                                            // 0x07B4(0x000C) (Localized, NeedCtorLink)
	class UButtonGroups*                               OptionGroup;                                              // 0x07C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                LastSimpleButtonPos;                                      // 0x07C4(0x0004)
	string                                             strResRatio[0x5];                                         // 0x07C8(0x000C) (Localized, NeedCtorLink)
	struct FDisplayModeInfo                            CurrentInfo;                                              // 0x0804(0x0018)
	struct FDisplayModeInfo                            InitInfo;                                                 // 0x081C(0x0018)
	string                                             strGraphicQuality[0x6];                                   // 0x0834(0x000C) (Localized, NeedCtorLink)
	struct FScriptDelegate                             __OnChangeScreen__Delegate;                               // 0x087C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPOptionGraphicHK");
		return ptr;
	}


	void OnHide_ComboBoxList();
	void OnShow_ComboBoxList();
	bool Content6_CanChangeValue(int CurrentValue, int changeValue);
	string Content6_ValueToString(int Value);
	void Content2_OnChangeValue(int changeValue);
	string Content2_ValueToString(int Value);
	bool QualityRadio_OnClick(class UGUIComponent* Sender);
	void BottonGore_OnSelect(bool bOn);
	bool SimpleButton_OnClick(class UGUIComponent* Sender);
	void InitializeContent();
	void Content0_OnChange(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	float Clock();
	void LoadData();
	void SaveData();
	void DefaultResetData();
	void ResetData();
	void InitData();
	void OnChangeScreen(int iScreenWidth, int iScreenHeight);
};


// Class GUIWarfareControls.BTTPOptionSoundHK
// 0x00B4 (0x07BC - 0x0708)
class UBTTPOptionSoundHK : public UBTTPOptionBaseHK
{
public:
	string                                             strLow;                                                   // 0x0708(0x000C) (Localized, NeedCtorLink)
	string                                             strHigh;                                                  // 0x0714(0x000C) (Localized, NeedCtorLink)
	string                                             strLabel[0xA];                                            // 0x0720(0x000C) (Localized, NeedCtorLink)
	bool                                               bUseSound;                                                // 0x0798(0x0004)
	struct FOptionSoundInfo                            InitInfo;                                                 // 0x079C(0x0010)
	struct FOptionSoundInfo                            CurrentInfo;                                              // 0x07AC(0x0010)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPOptionSoundHK");
		return ptr;
	}


	void InitializeContent();
	void Content4_OnSelect(bool bOn);
	void Content3_OnChangeValue(int changeValue);
	void Content2_OnSelect(bool bOn);
	void Content1_OnChangeValue(int changeValue);
	void Content0_OnSelect(bool bOn);
	void InitializeLabel();
	void LoadData();
	void SaveData();
	void ResetData();
	void DefaultResetData();
	void InitData();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPOptionInputHK
// 0x2F7C (0x3684 - 0x0708)
class UBTTPOptionInputHK : public UBTTPOptionBaseHK
{
public:
	string                                             strLow;                                                   // 0x0708(0x000C) (Localized, NeedCtorLink)
	string                                             strHigh;                                                  // 0x0714(0x000C) (Localized, NeedCtorLink)
	string                                             strLabel[0x28];                                           // 0x0720(0x000C) (Localized, NeedCtorLink)
	string                                             strFunc[0x28];                                            // 0x0900(0x000C) (NeedCtorLink)
	string                                             strOn;                                                    // 0x0AE0(0x000C) (Localized, NeedCtorLink)
	string                                             strOff;                                                   // 0x0AEC(0x000C) (Localized, NeedCtorLink)
	string                                             strToggle;                                                // 0x0AF8(0x000C) (Localized, NeedCtorLink)
	string                                             strButton;                                                // 0x0B04(0x000C) (Localized, NeedCtorLink)
	string                                             strWeak;                                                  // 0x0B10(0x000C) (Localized, NeedCtorLink)
	string                                             strStrong;                                                // 0x0B1C(0x000C) (Localized, NeedCtorLink)
	string                                             strDefaultSensAim;                                        // 0x0B28(0x000C) (Localized, NeedCtorLink)
	string                                             strUseLeftHand;                                           // 0x0B34(0x000C) (Localized, NeedCtorLink)
	string                                             strUseRightHand;                                          // 0x0B40(0x000C) (Localized, NeedCtorLink)
	struct FOptionInputInfo                            InitInfo;                                                 // 0x0B4C(0x01B0) (NeedCtorLink)
	struct FOptionInputInfo                            CurrentInfo;                                              // 0x0CFC(0x01B0) (NeedCtorLink)
	struct FInputKeyInfo                               AllKeys[0xFF];                                            // 0x0EAC(0x0028) (Edit, EditConst, NeedCtorLink, NoExport)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPOptionInputHK");
		return ptr;
	}


	void InitializeContent();
	void InitializeLabel();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void BTOptionKeyButtonHK_OnChangeKey(class UGUIComponent* Sender, const string& NewKey);
	void Content4_OnSelect(bool bOn);
	void Content3_OnSelect(bool bOn);
	void Content1_OnSelect(bool bOn);
	string Content0_ValueToStringAim(int Value);
	void Content0_OnChangeValueAim(int changeValue);
	void Content0_OnChangeValue(int changeValue);
	bool SaveUserKeySet();
	void LoadData();
	void SaveData();
	void ResetData();
	void SetStoreKey_THAILAND();
	void SetStoreKey_CHINA();
	void SetStoreKey_KR();
	void DefaultResetData();
	void InitData();
	void InitializeBindingsArray();
};


// Class GUIWarfareControls.BTTPOptionETCHK
// 0x0174 (0x087C - 0x0708)
class UBTTPOptionETCHK : public UBTTPOptionBaseHK
{
public:
	struct FETCModeInfo                                CurrentInfo;                                              // 0x0708(0x0020) (NeedCtorLink)
	struct FETCModeInfo                                InitInfo;                                                 // 0x0728(0x0020) (NeedCtorLink)
	string                                             strUsageRecord;                                           // 0x0748(0x000C) (Localized, NeedCtorLink)
	string                                             strLabel[0x4];                                            // 0x0754(0x000C) (Localized, NeedCtorLink)
	string                                             strLanguage[0x2];                                         // 0x0784(0x000C) (Localized, NeedCtorLink)
	string                                             strMinimapType[0x3];                                      // 0x079C(0x000C) (Localized, NeedCtorLink)
	string                                             strRecordResolution[0xC];                                 // 0x07C0(0x000C) (Localized, NeedCtorLink)
	string                                             strRecordQuality[0x3];                                    // 0x0850(0x000C) (Localized, NeedCtorLink)
	byte                                               iRecordStartOffset;                                       // 0x0874(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0875(0x0003) MISSED OFFSET
	bool                                               bVoiceLangChanged;                                        // 0x0878(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPOptionETCHK");
		return ptr;
	}


	int GetWidthOfScreen(int iVideoMode);
	void OnChangeScreen(int iScreenWidth, int iScreenHeight);
	bool Internal_OnPreDraw(class UCanvas* C);
	void ShowRecordMenu(bool bVisible);
	void OnSelect_RecordOption(bool bOn);
	void OnChange_RecordResoultion(class UGUIComponent* Sender);
	void Content0_OnChange(class UGUIComponent* Sender);
	void DefaultResetData();
	void ResetData();
	void SaveData();
	void LoadData();
	void InitData();
	void InitializeContent();
	void InitializeLabel();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPOptionGQAdvanceHK
// 0x0040 (0x0380 - 0x0340)
class UBTTPOptionGQAdvanceHK : public UBTTabPanelHK
{
public:
	string                                             strButtonRadio;                                           // 0x0340(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonRadio;                                            // 0x034C(0x0010)
	class UBTCheckBoxHK*                               ButtonRadio;                                              // 0x035C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strButtonAdvance;                                         // 0x0360(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonAdvance;                                          // 0x036C(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonAdvance;                                            // 0x037C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPOptionGQAdvanceHK");
		return ptr;
	}


	void ApplyAWinPos();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTAttendQuest
// 0x0114 (0x0454 - 0x0340)
class UBTAttendQuest : public UBTTabPanelHK
{
public:
	class UBTOwnerDrawImageHK*                         BackgroundImage;                                          // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*[]               ReceiveBtnList;                                           // 0x0344(0x000C) (NeedCtorLink)
	class UBTOwnerDrawImageHK*[]                       RewardItemImgList;                                        // 0x0350(0x000C) (NeedCtorLink)
	struct FImage                                      ItemImage;                                                // 0x035C(0x0020)
	class UBTOwnerDrawImageHK*                         AttendBg;                                                 // 0x037C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonClose;                                              // 0x0380(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageScroll*[]                   RewardItemName;                                           // 0x0384(0x000C) (NeedCtorLink)
	class UBTOwnerDrawImageHK*[]                       RewardItemPoint;                                          // 0x0390(0x000C) (NeedCtorLink)
	class UBTOwnerDrawImageHK*[]                       RewardItemAttend;                                         // 0x039C(0x000C) (NeedCtorLink)
	class UBTOwnerDrawImageHK*[]                       RewardItemAttendCnt;                                      // 0x03A8(0x000C) (NeedCtorLink)
	class UBTOwnerDrawImageHK*                         AttendaceDesc;                                            // 0x03B4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         AttendaceInit;                                            // 0x03B8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         AttendaceCount;                                           // 0x03BC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strAttend[0xA];                                           // 0x03C0(0x000C) (Localized, NeedCtorLink)
	class UBTItemInfoToolTipWindow*                    RewardItemInfoToolTip;                                    // 0x0438(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*[]               DummyBtn;                                                 // 0x043C(0x000C) (NeedCtorLink)
	int[]                                              RewardItemNameChange;                                     // 0x0448(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTAttendQuest");
		return ptr;
	}


	bool OnRecive(class UGUIComponent* Sender);
	void InitBtnList();
	void RefreshBtnList();
	void OnRendered(class UCanvas* C);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTIconButtonHK
// 0x0028 (0x04F8 - 0x04D0)
class UBTIconButtonHK : public UBTOwnerDrawCaptionButtonHK
{
public:
	int                                                SpaceINT;                                                 // 0x04D0(0x0004)
	EIconHorzOrder                                     IconSide;                                                 // 0x04D4(0x0001)
	byte                                               Padding00[0x3];                                           // 0x04D5(0x0003) MISSED OFFSET
	struct FImage                                      IconImage;                                                // 0x04D8(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTIconButtonHK");
		return ptr;
	}


	void OnRendered(class UCanvas* C);
	void SetData(const struct FImage& img, EIconHorzOrder side, const string& Text, int Space);
};


// Class GUIWarfareControls.BTWindowSelectCashTypeHK
// 0x004C (0x0524 - 0x04D8)
class UBTWindowSelectCashTypeHK : public UBTWindowSelectHK
{
public:
	class UBTOwnerDrawCaptionButtonHK*                 ButtonPCash;                                              // 0x04D8(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonPCash;                                            // 0x04DC(0x0010)
	string                                             strCaption;                                               // 0x04EC(0x000C) (Localized, NeedCtorLink)
	string                                             strCCoin;                                                 // 0x04F8(0x000C) (Localized, NeedCtorLink)
	string                                             strPCoin;                                                 // 0x0504(0x000C) (Localized, NeedCtorLink)
	class UBTROItemBoxHK*                              roItemBox;                                                // 0x0510(0x0004)
	int                                                selectBuyType;                                            // 0x0514(0x0004)
	byte                                               selectCashType;                                           // 0x0518(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0519(0x0003) MISSED OFFSET
	struct FScriptDelegate                             __SelectCoin__Delegate;                                   // 0x051C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowSelectCashTypeHK");
		return ptr;
	}


	bool ButtonOK_OnClick(class UGUIComponent* Sender);
	bool ButtonPCoin_OnClick(class UGUIComponent* Sender);
	void SelectCoin(int buyType, int cashType, class UBTROItemBoxHK* ro);
	void UpdateDefaultWindow();
	void STATIC_ShowWindowSelectCashType(class UGUIController* con, class UBTROItemBoxHK* ro, int _selectBuyType);
	void SetDataCash(class UBTROItemBoxHK* ro, int _selectBuyType);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTItemInfoHorzBoxHKCN
// 0x0000 (0x0344 - 0x0344)
class UBTItemInfoHorzBoxHKCN : public UBTItemInfoHorzBoxHK
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTItemInfoHorzBoxHKCN");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTStoreFillProcess
// 0x0038 (0x0064 - 0x002C)
class UBTStoreFillProcess : public UObject
{
public:
	struct FScriptDelegate                             __CheckItemCommon__Delegate;                              // 0x002C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __CreatePointItem__Delegate;                              // 0x0034(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __CreateGP20Item__Delegate;                               // 0x003C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __CreateWZCashItem__Delegate;                             // 0x0044(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __AddPointItem__Delegate;                                 // 0x004C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __AddGP20Item__Delegate;                                  // 0x0054(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __AddWZCashItem__Delegate;                                // 0x005C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTStoreFillProcess");
		return ptr;
	}


	void fill(class UwGameManager* GameMgr, class UwMatchMaker* MM);
	class UObject* DefaultCreateWZCashItem(class UwGameManager* GameMgr, class UwMatchMaker* MM, class UwItemBoxHK* ItemInfo, const struct FWebzenShopPackage& WZShopPackage);
	class UObject* DefaultCreateGP20Item(class UwGameManager* GameMgr, class UwMatchMaker* MM, class UwItemBoxHK* ItemInfo, class UwGP20Product* gp20Product);
	class UObject* DefaultCreatePointItem(class UwGameManager* GameMgr, class UwMatchMaker* MM, int ItemID, class UwItemBoxHK* ItemInfo);
	void AddWZCashItem(class UwGameManager* GameMgr, class UObject* addedObject);
	void AddGP20Item(class UwGameManager* GameMgr, class UObject* addedObject);
	void AddPointItem(class UwGameManager* GameMgr, class UObject* addedObject);
	class UObject* CreateWZCashItem(class UwItemBoxHK* ItemInfo, const struct FWebzenShopPackage& WZShopPackage);
	class UObject* CreateGP20Item(class UwItemBoxHK* ItemInfo, class UwGP20Product* gp20Product);
	class UObject* CreatePointItem(int ItemID, class UwItemBoxHK* ItemInfo);
	bool CheckItemCommon(class UwGameManager* GameMgr, class UwItemBoxHK* ItemInfo);
};


// Class GUIWarfareControls.BTWindowItemRenew
// 0x0180 (0x0640 - 0x04C0)
class UBTWindowItemRenew : public UBTWindowHK
{
public:
	int                                                ItemID;                                                   // 0x04C0(0x0004)
	struct FBtrDouble                                  UniqueID;                                                 // 0x04C4(0x0008)
	byte                                               OptionDay;                                                // 0x04CC(0x0001)
	byte                                               Padding00[0x3];                                           // 0x04CD(0x0003) MISSED OFFSET
	int                                                iMoney;                                                   // 0x04D0(0x0004)
	int                                                iAfterMoney;                                              // 0x04D4(0x0004)
	class UwItemBoxHK*                                 ItemInfo;                                                 // 0x04D8(0x0004)
	class UwItemBoxInstanceHK*                         instanceInfo;                                             // 0x04DC(0x0004)
	class UwItemBoxCashHK*                             cii;                                                      // 0x04E0(0x0004)
	class UBTOwnerDrawImageHK*                         lbItemName;                                               // 0x04E4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         lbItemRemaingTime;                                        // 0x04E8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbItemName;                                               // 0x04EC(0x0010)
	struct FFloatBox                                   fbItemRemaingTime;                                        // 0x04FC(0x0010)
	string                                             strItemRemaingTime;                                       // 0x050C(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbItemBoxView;                                            // 0x0518(0x0010)
	class UBTItemBoxButtonHK*                          ItemBoxView;                                              // 0x0528(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         lbRenewTerm;                                              // 0x052C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbRenewTerm;                                              // 0x0530(0x0010)
	string                                             strRenewTerm;                                             // 0x0540(0x000C) (Localized, NeedCtorLink)
	class UBTComboBoxHK*                               cbRenewTermList;                                          // 0x054C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbRenewTermList;                                          // 0x0550(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 btButtonCash;                                             // 0x0560(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonCash;                                             // 0x0564(0x0010)
	string                                             strButtnCash;                                             // 0x0574(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         imgItemRenewBack;                                         // 0x0580(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbItemRenewBack;                                          // 0x0584(0x0010)
	class UBTOwnerDrawImageHK*                         lbMyMoney[0x4];                                           // 0x0594(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbMyMoney[0x4];                                           // 0x05A4(0x0010)
	string                                             strMyMoney[0x2];                                          // 0x05E4(0x000C) (Localized, NeedCtorLink)
	string                                             strCount;                                                 // 0x05FC(0x000C) (Localized, NeedCtorLink)
	string                                             strDay;                                                   // 0x0608(0x000C) (Localized, NeedCtorLink)
	string                                             strCash;                                                  // 0x0614(0x000C) (Localized, NeedCtorLink)
	string                                             strPoint;                                                 // 0x0620(0x000C) (Localized, NeedCtorLink)
	byte                                               cashType;                                                 // 0x062C(0x0001)
	byte                                               Padding01[0x3];                                           // 0x062D(0x0003) MISSED OFFSET
	string                                             strCCoinCash;                                             // 0x0630(0x000C) (Localized, NeedCtorLink)
	class UBTROItemBoxHK*                              ro;                                                       // 0x063C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowItemRenew");
		return ptr;
	}


	void Closed(class UGUIComponent* Sender, bool bCancelled);
	void SetCashType(byte buyCashType);
	string GetCoinString();
	bool InternalOnPreDraw(class UCanvas* C);
	void UpdateAfterMoney();
	string GetFormatMoney(int iCurMoney, int iPayMoney, const string& strMoney);
	void SetMoney(int iPoint, int iCash, int iCCoin);
	void SetRenderObject(class UBTROItemBoxHK* ro, class UwItemBoxHK* itemInfoBase, class UwItemBoxInstanceHK* itemInst, class UwItemBoxCashHK* Cash);
	void cbRenewTermList_OnChange(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWeaponLIst
// 0x006C (0x0450 - 0x03E4)
class UBTWeaponLIst : public UBTContextMenuHK
{
public:
	string                                             strContextMenuName[0x9];                                  // 0x03E4(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWeaponLIst");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTComboCapsuleData
// 0x0038 (0x0338 - 0x0300)
class UBTComboCapsuleData : public UGUIMultiComponent
{
public:
	class UwGameManager*                               GameMgr;                                                  // 0x0300(0x0004)
	class UwMatchMaker*                                MM;                                                       // 0x0304(0x0004)
	class UBTOwnerDrawImageHK*                         BackgroundComboBoxCapsule;                                // 0x0308(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboBoxCapsule;                                          // 0x030C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UwItemBoxHK*                                 CurrentItemInfo;                                          // 0x0310(0x0004)
	int[]                                              CapsuleIDList;                                            // 0x0314(0x000C) (NeedCtorLink)
	bool                                               CapsuleFillEnd;                                           // 0x0320(0x0004)
	string                                             strCapsuleCount;                                          // 0x0324(0x000C) (Localized, NeedCtorLink)
	struct FScriptDelegate                             __ChangeComboBox__Delegate;                               // 0x0330(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTComboCapsuleData");
		return ptr;
	}


	class UwItemBoxInstanceHK* GetCurrentSelectedInstance();
	void OnChange_ComboBoxCapsule(class UGUIComponent* Sender);
	void SetInitItemCount(class UwItemBoxHK* _itemInfo, int _capsuleCount);
	void SetSize(const struct FFloatBox& fbComboBackground, const struct FFloatBox& fbComboBox);
	void InitItemData(bool inCapsuleItem);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void ChangeComboBox();
};


// Class GUIWarfareControls.DragObject
// 0x0020 (0x0060 - 0x0040)
class UDragObject : public URenderObject
{
public:
	class URenderObject*                               RegRO;                                                    // 0x0040(0x0004)
	int                                                startX;                                                   // 0x0044(0x0004)
	int                                                startY;                                                   // 0x0048(0x0004)
	struct FFloatBox                                   fbRegRO;                                                  // 0x004C(0x0010)
	int                                                RegROIndex;                                               // 0x005C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.DragObject");
		return ptr;
	}


	int GetOptionalIndex();
	bool IsDragging();
	void EndDrag();
	bool Render(class UCanvas* C, float Delta);
	void UpdateMousePos(int MouseX, int MouseY);
	class URenderObject* GetRenderObject();
	void BeginDrag(int MouseX, int MouseY, class URenderObject* ro, int roIndex);
};


// Class GUIWarfareControls.BTWindowTenderHK
// 0x0124 (0x05E4 - 0x04C0)
class UBTWindowTenderHK : public UBTWindowHK
{
public:
	string                                             ItemName;                                                 // 0x04C0(0x000C) (NeedCtorLink)
	int                                                ItemID;                                                   // 0x04CC(0x0004)
	int                                                PartID;                                                   // 0x04D0(0x0004)
	int                                                Damage;                                                   // 0x04D4(0x0004)
	int                                                OverlapCount;                                             // 0x04D8(0x0004)
	int                                                UniqueID;                                                 // 0x04DC(0x0004)
	int                                                MyTender;                                                 // 0x04E0(0x0004)
	int                                                MaxPrice;                                                 // 0x04E4(0x0004)
	struct FFloatBox                                   fbItemInfoBox;                                            // 0x04E8(0x0010)
	class UBTItemInfoVertBoxHK*                        ItemInfoBox;                                              // 0x04F8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbSeparator;                                              // 0x04FC(0x0010)
	class UBTOwnerDrawImageHK*                         Separator;                                                // 0x050C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabel[0x2];                                             // 0x0510(0x0010)
	struct FFloatBox                                   fbEdit[0x2];                                              // 0x0530(0x0010)
	class UBTOwnerDrawImageHK*                         Label[0x2];                                               // 0x0550(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         Edit[0x2];                                                // 0x0558(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbNEditBox[0x2];                                          // 0x0560(0x0010)
	class UBTNumericEditBoxHK*                         NEditBox[0x2];                                            // 0x0580(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelWarning;                                           // 0x0588(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelWarning;                                             // 0x0598(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabel[0x2];                                            // 0x059C(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelWarning[0x4];                                     // 0x05B4(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowTenderHK");
		return ptr;
	}


	void Internal_OnOpen();
	void Internal_OnRendered(class UCanvas* C);
	void SetData(int MyPoint, int InstantlyPrice, int iUniqueID, int iItemID, int iPartID, int iDamage, float CurrentTender, const string& HightestBidUser, int iOverlapCount);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTWindowInstantlyBuyHK
// 0x00F4 (0x05B4 - 0x04C0)
class UBTWindowInstantlyBuyHK : public UBTWindowHK
{
public:
	string                                             ItemName;                                                 // 0x04C0(0x000C) (NeedCtorLink)
	int                                                ItemID;                                                   // 0x04CC(0x0004)
	int                                                PartID;                                                   // 0x04D0(0x0004)
	int                                                Damage;                                                   // 0x04D4(0x0004)
	int                                                OverlapCount;                                             // 0x04D8(0x0004)
	int                                                UniqueID;                                                 // 0x04DC(0x0004)
	struct FFloatBox                                   fbItemInfoBox;                                            // 0x04E0(0x0010)
	class UBTItemInfoVertBoxHK*                        ItemInfoBox;                                              // 0x04F0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbSeparator;                                              // 0x04F4(0x0010)
	class UBTOwnerDrawImageHK*                         Separator;                                                // 0x0504(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabel[0x2];                                             // 0x0508(0x0010)
	struct FFloatBox                                   fbEdit;                                                   // 0x0528(0x0010)
	class UBTOwnerDrawImageHK*                         Label[0x2];                                               // 0x0538(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         Edit;                                                     // 0x0540(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbNEditBox;                                               // 0x0544(0x0010)
	class UBTNumericEditBoxHK*                         NEditBox;                                                 // 0x0554(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelWarning;                                           // 0x0558(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelWarning;                                             // 0x0568(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabel[0x2];                                            // 0x056C(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelWarning[0x4];                                     // 0x0584(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowInstantlyBuyHK");
		return ptr;
	}


	void SetData(int MyPoint, int InstantlyPrice, int iUniqueID, int iItemID, int iPartID, int iDamage, int iOverlapCount);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTOwnerDrawMyNameMyClanHK
// 0x0084 (0x0440 - 0x03BC)
class UBTOwnerDrawMyNameMyClanHK : public UBTOwnerDrawImageHK
{
public:
	int                                                Level;                                                    // 0x03BC(0x0004)
	int                                                ClanBG;                                                   // 0x03C0(0x0004)
	struct FImage                                      LevelImg;                                                 // 0x03C4(0x0020)
	struct FImage                                      ClanImg;                                                  // 0x03E4(0x0020)
	struct FText                                       myName;                                                   // 0x0404(0x001C) (NeedCtorLink)
	struct FText                                       MyClan;                                                   // 0x0420(0x001C) (NeedCtorLink)
	class UBTROClanMarkHK*                             roClanMark;                                               // 0x043C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTOwnerDrawMyNameMyClanHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void SetData(int Lv, const string& myName, const string& MyClan, int Pattern, int BG, int BL, int ClanLevel, int LevelMarkID);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTROLevelHK
// 0x0044 (0x0084 - 0x0040)
class UBTROLevelHK : public URenderObject
{
public:
	int                                                Level;                                                    // 0x0040(0x0004)
	struct FImage                                      Background;                                               // 0x0044(0x0020)
	struct FImage                                      LevelImg;                                                 // 0x0064(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROLevelHK");
		return ptr;
	}


	bool Render(class UCanvas* C, float Delta);
	void Update(class UCanvas* C, float Delta);
	void SetData(class UwGameManager* GameMgr, int Level, int LevelMarkID);
	void Init();
};


// Class GUIWarfareControls.BTAniItemBoxButtonHK
// 0x004C (0x051C - 0x04D0)
class UBTAniItemBoxButtonHK : public UBTOwnerDrawCaptionButtonHK
{
public:
	class UBTROAniItemBoxHK*                           itemBox;                                                  // 0x04D0(0x0004)
	string                                             DefaultSlotName[0x2];                                     // 0x04D4(0x000C) (NeedCtorLink)
	struct FPlane                                      DefaultSlotModulate;                                      // 0x04EC(0x0010)
	struct FImage                                      DefaultSlotImage;                                         // 0x04FC(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTAniItemBoxButtonHK");
		return ptr;
	}


	bool Internal_OnDraw(class UCanvas* C);
	void SetData(class UwItemBoxHK* ItemInfo, class UwItemBoxInstanceHK* instanceInfo, bool bestItem);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTROAniItemBoxHK
// 0x03D8 (0x0418 - 0x0040)
class UBTROAniItemBoxHK : public URenderObject
{
public:
	class UwGameManager*                               GameMgr;                                                  // 0x0040(0x0004)
	bool                                               bStartAni;                                                // 0x0044(0x0004)
	bool                                               bStartCheckCount;                                         // 0x0044(0x0004)
	float                                              RollAniStep;                                              // 0x0048(0x0004)
	float                                              RollAniNextMulStep;                                       // 0x004C(0x0004)
	int                                                RollDirection;                                            // 0x0050(0x0004)
	int                                                RollCount;                                                // 0x0054(0x0004)
	int                                                RollMaxCount;                                             // 0x0058(0x0004)
	int                                                RollFinishCount;                                          // 0x005C(0x0004)
	bool                                               bLastReverseRoll;                                         // 0x0060(0x0004)
	bool                                               bSlowMove;                                                // 0x0060(0x0004)
	bool                                               bCheckFinish;                                             // 0x0060(0x0004)
	float                                              RollStartX;                                               // 0x0064(0x0004)
	float                                              RollEndValue;                                             // 0x0068(0x0004)
	bool                                               bScaleAni;                                                // 0x006C(0x0004)
	float                                              ScaleAniStep;                                             // 0x0070(0x0004)
	float                                              ScaleStartX;                                              // 0x0074(0x0004)
	float                                              ScaleAniMax;                                              // 0x0078(0x0004)
	float                                              ScaleAniNextMulStep;                                      // 0x007C(0x0004)
	bool                                               bScaleAni2;                                               // 0x0080(0x0004)
	float                                              ScaleAniStep2;                                            // 0x0084(0x0004)
	float                                              ScaleStartX2;                                             // 0x0088(0x0004)
	float                                              ScaleAniMax2;                                             // 0x008C(0x0004)
	float                                              ScaleAniNextMulStep2;                                     // 0x0090(0x0004)
	E_ANI_END_TYPE                                     EndAnimationType;                                         // 0x0094(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0095(0x0003) MISSED OFFSET
	int                                                CandidateSize;                                            // 0x0098(0x0004)
	bool                                               bDragMode;                                                // 0x009C(0x0004)
	bool                                               bRedAuction;                                              // 0x009C(0x0004)
	bool                                               bRedState;                                                // 0x009C(0x0004)
	bool                                               bDisplayPart;                                             // 0x009C(0x0004)
	struct FText                                       PartName;                                                 // 0x00A0(0x001C) (NeedCtorLink)
	string                                             PartSkillName;                                            // 0x00BC(0x000C) (NeedCtorLink)
	struct FImage                                      PartImage;                                                // 0x00C8(0x0020)
	class UwItemBoxHK*                                 ItemInfo;                                                 // 0x00E8(0x0004)
	class UwItemBoxHK*[]                               ItemInfoPool;                                             // 0x00EC(0x000C) (NeedCtorLink)
	class UwItemBoxInstanceHK*                         instanceInfo;                                             // 0x00F8(0x0004)
	bool                                               bestItem;                                                 // 0x00FC(0x0004)
	bool                                               bRenderInfo;                                              // 0x00FC(0x0004)
	struct FText                                       ItemName;                                                 // 0x0100(0x001C) (NeedCtorLink)
	struct FText                                       GradeName;                                                // 0x011C(0x001C) (NeedCtorLink)
	struct FText                                       UnderTextForm;                                            // 0x0138(0x001C) (NeedCtorLink)
	struct FImage                                      ItemImage;                                                // 0x0154(0x0020)
	struct FImage                                      EquipLevelImage;                                          // 0x0174(0x0020)
	class UBTROExpBarHK*                               ItemDurability;                                           // 0x0194(0x0004)
	struct FImage                                      RepairIconImage;                                          // 0x0198(0x0020)
	struct FImage                                      CashIconImage;                                            // 0x01B8(0x0020)
	struct FImage                                      PointIconImage;                                           // 0x01D8(0x0020)
	bool                                               bDotSight;                                                // 0x01F8(0x0004)
	bool                                               bScope;                                                   // 0x01F8(0x0004)
	bool                                               bSilencer;                                                // 0x01F8(0x0004)
	bool                                               bSkill;                                                   // 0x01F8(0x0004)
	bool                                               bBarrel;                                                  // 0x01F8(0x0004)
	bool                                               bGunstock;                                                // 0x01F8(0x0004)
	struct FImage                                      dotImg;                                                   // 0x01FC(0x0020)
	struct FImage                                      scoImg;                                                   // 0x021C(0x0020)
	struct FImage                                      silImg;                                                   // 0x023C(0x0020)
	struct FImage                                      skiImg;                                                   // 0x025C(0x0020)
	struct FImage                                      BarrelImg;                                                // 0x027C(0x0020)
	struct FImage                                      GunstockImg;                                              // 0x029C(0x0020)
	bool                                               bShowGrade;                                               // 0x02BC(0x0004)
	bool                                               bBackgroundInfo;                                          // 0x02BC(0x0004)
	bool                                               bShowDurability;                                          // 0x02BC(0x0004)
	bool                                               bShowPrice;                                               // 0x02BC(0x0004)
	bool                                               bShowDamage;                                              // 0x02BC(0x0004)
	bool                                               bShowEquipLevel;                                          // 0x02BC(0x0004)
	bool                                               bShowRestrictionLevel;                                    // 0x02BC(0x0004)
	bool                                               bShowRestrictionPrice;                                    // 0x02BC(0x0004)
	bool                                               bShowRestrictionDurability;                               // 0x02BC(0x0004)
	class UBTItemCommonInfoHK*                         MyData;                                                   // 0x02C0(0x0004)
	struct FColor                                      colCurrentUntilTime;                                      // 0x02C4(0x0004)
	string                                             strCurrentUntilTime;                                      // 0x02C8(0x000C) (NeedCtorLink)
	string                                             strGradeBase;                                             // 0x02D4(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeShop;                                             // 0x02E0(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeCommon;                                           // 0x02EC(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeNormal;                                           // 0x02F8(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeHigh;                                             // 0x0304(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeRare;                                             // 0x0310(0x000C) (Localized, NeedCtorLink)
	string                                             strGradeLegend;                                           // 0x031C(0x000C) (Localized, NeedCtorLink)
	string                                             strDurability;                                            // 0x0328(0x000C) (Localized, NeedCtorLink)
	string                                             strDamage;                                                // 0x0334(0x000C) (Localized, NeedCtorLink)
	string                                             strLeftTime[0x5];                                         // 0x0340(0x000C) (Localized, NeedCtorLink)
	string                                             strPoint;                                                 // 0x037C(0x000C) (Localized, NeedCtorLink)
	string                                             strCash;                                                  // 0x0388(0x000C) (Localized, NeedCtorLink)
	int                                                RRIndex;                                                  // 0x0394(0x0004)
	bool                                               bRegisterQuickSlot;                                       // 0x0398(0x0004)
	string                                             strRestrictionReason[0x6];                                // 0x039C(0x000C) (Localized, NeedCtorLink)
	EBTROAniItemBoxHK_EInvenState                      InvenState;                                               // 0x03E4(0x0001)
	byte                                               Padding01[0x3];                                           // 0x03E5(0x0003) MISSED OFFSET
	struct FScriptDelegate                             __OnStartScaleAni__Delegate;                              // 0x03E8(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnScaleAniChanged__Delegate;                            // 0x03F0(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnDramaEnded__Delegate;                                 // 0x03F8(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnNextRoll__Delegate;                                   // 0x0400(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnChangeItemInfo__Delegate;                             // 0x0408(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnChangeItemInfoEnd__Delegate;                          // 0x0410(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROAniItemBoxHK");
		return ptr;
	}


	int SetNextRollInfo();
	float GetChangeValue(bool bSlow, float deltaValue);
	bool RollOneRound(float deltaValue);
	void SetGameManager(class UwGameManager* GM);
	void CheckRedAuction();
	bool Render(class UCanvas* C, float Delta);
	void OnChangeItemInfoEnd();
	void OnChangeItemInfo(int Index);
	void SetCandidateListSize(int CandidateSize);
	void Update(class UCanvas* C, float Delta);
	bool IsEmpty();
	void UpdateTime(const struct FBtrDouble& D);
	string GradeToText(int Grade);
	struct FColor GradeToColor(int Grade);
	void RandEndAniType();
	void Init();
	void ChangeState(EBTROAniItemBoxHK_EInvenState estate);
	void OnNextRoll();
	void OnDramaEnded();
	void OnScaleAniChanged(float scaleValue, float ScaleMax);
	void OnStartScaleAni(float scaleValue, float ScaleMax);
};


// Class GUIWarfareControls.BTTPItemUIStatusHK
// 0x0004 (0x03C0 - 0x03BC)
class UBTTPItemUIStatusHK : public UBTOwnerDrawImageHK
{
public:
	class UBTROItemUIStatusHK*                         ro;                                                       // 0x03BC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPItemUIStatusHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void SetData(class UwItemBoxHK* ib, class UwItemBoxInstanceHK* ibi, class UwItemBoxHK* cib, class UwItemBoxInstanceHK* cibi);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTLabelSlideAnimationHK
// 0x000C (0x03C8 - 0x03BC)
class UBTLabelSlideAnimationHK : public UBTOwnerDrawImageHK
{
public:
	bool                                               bStartSlide;                                              // 0x03BC(0x0004)
	float                                              StartTimeSecond;                                          // 0x03C0(0x0004)
	float                                              SlideTime;                                                // 0x03C4(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTLabelSlideAnimationHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void SetStartTime();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTROItemUIStatusHK
// 0x00BC (0x00FC - 0x0040)
class UBTROItemUIStatusHK : public URenderObject
{
public:
	struct FText[]                                     textAmmosize;                                             // 0x0040(0x000C) (NeedCtorLink)
	struct FText[]                                     textSkill;                                                // 0x004C(0x000C) (NeedCtorLink)
	string                                             strStatus[0x8];                                           // 0x0058(0x000C) (Localized, NeedCtorLink)
	int                                                HalfX;                                                    // 0x00B8(0x0004)
	int                                                StatusSX;                                                 // 0x00BC(0x0004)
	int                                                StatusEX;                                                 // 0x00C0(0x0004)
	int                                                GaugeSX;                                                  // 0x00C4(0x0004)
	int                                                GaugeEX;                                                  // 0x00C8(0x0004)
	int                                                ValueX;                                                   // 0x00CC(0x0004)
	class UBTROWeaponUIGaugeHK*                        WeaponStatus[0x8];                                        // 0x00D0(0x0004)
	int                                                TopPad;                                                   // 0x00F0(0x0004)
	int                                                ItemHeight;                                               // 0x00F4(0x0004)
	int                                                BottomPad;                                                // 0x00F8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROItemUIStatusHK");
		return ptr;
	}


	bool Render(class UCanvas* C, float Delta);
	void SetPos(int StatusSX, int GaugeSX, int GaugeEX, int ValueX, int StatusEX);
	void Update(class UCanvas* C, float Delta);
	void Init();
	void SetHeight(int TopPad, int ItemHeight, int BottomPad);
	void SetSkill(const string& Skill, const string& mskill);
	void SetAmmoSize(int clipsize, int MaxAmmo, int addopt1, int addopt2);
	void SetRange(int Value, int Add);
	void SetMove(int Value, int Add);
	void SetRateofFire(int Value, int Add);
	void SetViewKick(int Value, int Add);
	void SetSpread(int Value, int Add);
	void SetDamage(int Value, int Add);
};


// Class GUIWarfareControls.BTTPLabelNComboBoxHK
// 0x0008 (0x0348 - 0x0340)
class UBTTPLabelNComboBoxHK : public UBTTabPanelHK
{
public:
	class UBTOwnerDrawImageHK*                         Label;                                                    // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTComboBoxHK*                               ComboBox;                                                 // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPLabelNComboBoxHK");
		return ptr;
	}


	void ApplyAWinPos();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTOwnerDrawTwoLevelImgNClanMarkHK
// 0x0048 (0x0404 - 0x03BC)
class UBTOwnerDrawTwoLevelImgNClanMarkHK : public UBTOwnerDrawImageHK
{
public:
	struct FImage                                      LevelImg[0x2];                                            // 0x03BC(0x0020)
	class UBTROClanMarkHK*                             ClanMark[0x2];                                            // 0x03FC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTOwnerDrawTwoLevelImgNClanMarkHK");
		return ptr;
	}


	void SetData(bool bFirst, int CharLevel, int LevelMarkID, int Pattern, int BG, int BL, int ClanLevel);
	void Internal_OnRendered(class UCanvas* C);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPTwoExpBarHK
// 0x0008 (0x0348 - 0x0340)
class UBTTPTwoExpBarHK : public UBTTabPanelHK
{
public:
	class UBTExpBarHK*                                 expbar[0x2];                                              // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPTwoExpBarHK");
		return ptr;
	}


	void ApplyAWinPos();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPTwoColumnLabelHK
// 0x0008 (0x0348 - 0x0340)
class UBTTPTwoColumnLabelHK : public UBTTabPanelHK
{
public:
	class UBTOwnerDrawTextArrayHK*                     Label[0x2];                                               // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPTwoColumnLabelHK");
		return ptr;
	}


	void ApplyAWinPos();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTOwnerDrawRankInfoHK
// 0x0078 (0x0434 - 0x03BC)
class UBTOwnerDrawRankInfoHK : public UBTOwnerDrawImageHK
{
public:
	string                                             strRank;                                                  // 0x03BC(0x000C) (Localized, NeedCtorLink)
	string                                             strUpArrow;                                               // 0x03C8(0x000C) (Localized, NeedCtorLink)
	string                                             strDownArrow;                                             // 0x03D4(0x000C) (Localized, NeedCtorLink)
	int                                                ClanBG;                                                   // 0x03E0(0x0004)
	bool                                               bClan;                                                    // 0x03E4(0x0004)
	struct FImage                                      LevelImg;                                                 // 0x03E8(0x0020)
	class UBTROClanMarkHK*                             ClanMark;                                                 // 0x0408(0x0004)
	struct FText                                       TextName;                                                 // 0x040C(0x001C) (NeedCtorLink)
	struct FText[]                                     Ranking;                                                  // 0x0428(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTOwnerDrawRankInfoHK");
		return ptr;
	}


	void SetRankData(const string& t0, int t1);
	void Internal_OnRendered(class UCanvas* C);
	void SetData(int CharLevel, int Pattern, int BG, int BL, int ClanLevel, const string& strUserName, const string& strClanName, int iRanking, int iPrevRanking, int iRankingExp, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPTwoComboBoxHK
// 0x0008 (0x0348 - 0x0340)
class UBTTPTwoComboBoxHK : public UBTTabPanelHK
{
public:
	class UBTComboBoxHK*                               ComboBox[0x2];                                            // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPTwoComboBoxHK");
		return ptr;
	}


	void ApplyAWinPos();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTOwnerDrawClanRankInfoHK
// 0x0000 (0x0434 - 0x0434)
class UBTOwnerDrawClanRankInfoHK : public UBTOwnerDrawRankInfoHK
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTOwnerDrawClanRankInfoHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void SetData(int CharLevel, int Pattern, int BG, int BL, int ClanLevel, const string& strUserName, const string& strClanName, int iRanking, int iPrevRanking, int iRankingExp, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
};


// Class GUIWarfareControls.BTACLCWMessengerPCBangHK
// 0x0020 (0x0480 - 0x0460)
class UBTACLCWMessengerPCBangHK : public UBTAutoColumnListHK
{
public:
	struct FImage                                      CommonSizeImg;                                            // 0x0460(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLCWMessengerPCBangHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	float GetItemHeight(class UCanvas* C);
	int GetLevelMarkID(int row);
	int GetClanNum(int row);
	string GetClanName(int row);
	int GetChannelNum(int row);
	string GetServerName(int row);
	string GetDataPerColumn0_strValue(int row);
	int GetServerPort(int row);
	int GetCurPos(int row);
	string GetServerIP(int row);
	int GetRoomNumber(int row);
	string GetUserName(int row);
	int GetLevel(int row);
	string GetWinLose(int row);
	string GetCombatState(int row);
	void LC0_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
};


// Class GUIWarfareControls.BTLabelPromotionHK
// 0x0048 (0x0404 - 0x03BC)
class UBTLabelPromotionHK : public UBTOwnerDrawImageHK
{
public:
	float                                              Delta;                                                    // 0x03BC(0x0004)
	bool                                               bStartShow;                                               // 0x03C0(0x0004)
	int                                                ShowPhase;                                                // 0x03C4(0x0004)
	struct FColor                                      DrawColor;                                                // 0x03C8(0x0004)
	struct FPlane                                      ColorMultiplier;                                          // 0x03CC(0x0010)
	float                                              StartScale;                                               // 0x03DC(0x0004)
	float                                              EndScale;                                                 // 0x03E0(0x0004)
	float                                              CurrentScale;                                             // 0x03E4(0x0004)
	float                                              ScaleStep;                                                // 0x03E8(0x0004)
	float                                              ScaleStepMultiplier;                                      // 0x03EC(0x0004)
	float                                              MaxScale;                                                 // 0x03F0(0x0004)
	struct FScriptDelegate                             __OnStartPhase__Delegate;                                 // 0x03F4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnEndPhase__Delegate;                                   // 0x03FC(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTLabelPromotionHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void Reset();
	void StartShow();
	void OnEndPhase(int Phase);
	void OnStartPhase(int Phase);
};


// Class GUIWarfareControls.BTListWithButton
// 0x0094 (0x0394 - 0x0300)
class UBTListWithButton : public UGUIMultiComponent
{
public:
	class UGUIListBase*                                ItemList;                                                 // 0x0300(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ScrollButton[0x2];                                        // 0x0304(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class URenderObject*[]                             DataList;                                                 // 0x030C(0x000C) (NeedCtorLink)
	bool                                               bIgnoreMouseOnState;                                      // 0x0318(0x0004)
	bool                                               bIgnoreFocusedState;                                      // 0x0318(0x0004)
	bool                                               usePageInfo;                                              // 0x0318(0x0004)
	struct FFloatBox                                   fbTitle;                                                  // 0x031C(0x0010)
	struct FFloatBox                                   fbPageInfo;                                               // 0x032C(0x0010)
	struct FText                                       TitleText;                                                // 0x033C(0x001C) (NeedCtorLink)
	struct FText                                       PageInfo;                                                 // 0x0358(0x001C) (NeedCtorLink)
	int                                                ItemWidth;                                                // 0x0374(0x0004)
	int                                                ItemHeight;                                               // 0x0378(0x0004)
	int                                                FixedWidth;                                               // 0x037C(0x0004)
	int                                                PageCount;                                                // 0x0380(0x0004)
	int                                                CurrentPage;                                              // 0x0384(0x0004)
	int                                                CountPerPage;                                             // 0x0388(0x0004)
	struct FScriptDelegate                             __ChangeItemList__Delegate;                               // 0x038C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTListWithButton");
		return ptr;
	}


	class UBTROCapsuleTitle* GetLastSelectedObject();
	void Internal_OnRendered(class UCanvas* Canvas);
	void ImageListBox_OnDrawItem(class UCanvas* C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending);
	bool ImageListBox_OnPreDraw(class UCanvas* C);
	float GetItemHeight(class UCanvas* C);
	void AddRenderObject(class URenderObject* addObj);
	void RefreshPageInfo();
	bool OnButtonClick(class UGUIComponent* Sender);
	void ClearItem();
	void Initialize(class UGUIController* MyController, class UGUIComponent* myOwner, bool useVert, int ItemCountPerPage, const struct FFloatBox& fbItemList, const struct FFloatBox& fbButton0, const struct FFloatBox& fbButton1, const string& _titleName, bool _usePageInfo, bool _useBigButton, const struct FFloatBox& _fbTitle, const struct FFloatBox& _fbPageInfo);
	void ChangeItemList();
};


// Class GUIWarfareControls.BTRORewardDecorate
// 0x00A0 (0x00E0 - 0x0040)
class UBTRORewardDecorate : public URenderObject
{
public:
	int                                                ItemID;                                                   // 0x0040(0x0004)
	int                                                RewardUniqueIndex;                                        // 0x0044(0x0004)
	int                                                RewardNeedNum;                                            // 0x0048(0x0004)
	bool                                               EnableItem;                                               // 0x004C(0x0004)
	bool                                               DrawAlreadyInfo;                                          // 0x004C(0x0004)
	struct FFloatBox                                   fbFixedCountString;                                       // 0x0050(0x0010)
	struct FText                                       ShowString;                                               // 0x0060(0x001C) (NeedCtorLink)
	struct FText                                       CountString;                                              // 0x007C(0x001C) (NeedCtorLink)
	struct FText                                       AlreadyGetString;                                         // 0x0098(0x001C) (NeedCtorLink)
	struct FImage                                      BackImage;                                                // 0x00B4(0x0020)
	string                                             strAlreadyGet;                                            // 0x00D4(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTRORewardDecorate");
		return ptr;
	}


	bool Render(class UCanvas* C, float Delta);
	void SetBackImage(const struct FImage& _image);
	void SetCenterText(int FontSize, const struct FFloatBox& fbFixed, const string& str);
	void SetItemData(int _ItemID, int _uniqueIndex, int _needNum, const string& str, bool bEnable);
};


// Class GUIWarfareControls.BTACLTradeHistoryHK
// 0x0014 (0x0474 - 0x0460)
class UBTACLTradeHistoryHK : public UBTAutoColumnListHK
{
public:
	struct FColor                                      damageColor[0x5];                                         // 0x0460(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLTradeHistoryHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void LC1_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	struct FColor DamageToColor(int Damage);
	void AddItem(const string& s1, int Damage, const string& s2);
	float GetItemHeight(class UCanvas* C);
};


// Class GUIWarfareControls.BTROCapsuleTitle
// 0x0188 (0x01C8 - 0x0040)
class UBTROCapsuleTitle : public URenderObject
{
public:
	float                                              TextWidth;                                                // 0x0040(0x0004)
	float                                              TextHeight;                                               // 0x0044(0x0004)
	class UwItemBoxHK*                                 ItemInfo;                                                 // 0x0048(0x0004)
	class UwItemBoxCashHK*                             cashItemInfo;                                             // 0x004C(0x0004)
	struct FText                                       CapsuleName;                                              // 0x0050(0x001C) (NeedCtorLink)
	struct FText                                       CapsulePrice;                                             // 0x006C(0x001C) (NeedCtorLink)
	struct FText                                       CapsuleOriginPrice;                                       // 0x0088(0x001C) (NeedCtorLink)
	struct FImage                                      NewItemImage;                                             // 0x00A4(0x0020)
	struct FImage                                      DiscountItemImage;                                        // 0x00C4(0x0020)
	struct FImage                                      NormalImgage;                                             // 0x00E4(0x0020)
	struct FImage                                      MouseOnImgage;                                            // 0x0104(0x0020)
	struct FImage                                      SelectImgage;                                             // 0x0124(0x0020)
	struct FImage                                      DisableImgage;                                            // 0x0144(0x0020)
	struct FImage                                      DisCountStrikeImg;                                        // 0x0164(0x0020)
	bool                                               IsDiscount;                                               // 0x0184(0x0004)
	bool                                               bLimitLevel;                                              // 0x0184(0x0004)
	struct FImage                                      NotUseImage;                                              // 0x0188(0x0020)
	struct FImage                                      EquipLevelImage;                                          // 0x01A8(0x0020)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROCapsuleTitle");
		return ptr;
	}


	bool Render(class UCanvas* C, float Delta);
	void CheckLimitLevel(class UwGameManager* GameMgr, int myLevel);
	void RefreshPrice();
	void Initialize(class UwItemBoxHK* setItemInfo);
};


// Class GUIWarfareControls.BTWindowFadeScreen
// 0x0068 (0x0540 - 0x04D8)
class UBTWindowFadeScreen : public UBTWindowStateHK
{
public:
	struct FFloatBox                                   fbShowLabelInfo[0x2];                                     // 0x04D8(0x0010)
	struct FImage                                      ImgCircle;                                                // 0x04F8(0x0020)
	class UBTOwnerDrawImageHK*                         ImgFade;                                                  // 0x0518(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         ShowLabelInfo[0x2];                                       // 0x051C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	float                                              FadeInTime;                                               // 0x0524(0x0004)
	float                                              FadeInStartTime;                                          // 0x0528(0x0004)
	float                                              CloseWaitTime;                                            // 0x052C(0x0004)
	bool                                               FadeInStart;                                              // 0x0530(0x0004)
	string                                             strFadeInSound;                                           // 0x0534(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowFadeScreen");
		return ptr;
	}


	void InternalOnRendered(class UCanvas* C);
	void DefaultCloseWindow_OnTimeOut(class UGUIComponent* Sender);
	bool STATIC_StartFadeInOut(class UGUIController* con, float _fadeOutTime, float _holdingTime, float _fadeInTime, float _closeWaitTime, const struct FImage& ImageBack);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTACLMatchResult2
// 0x0000 (0x04BC - 0x04BC)
class UBTACLMatchResult2 : public UBTACLMatchResultHK
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTACLMatchResult2");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void LC9_10_Draw(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
	void LC3_Draw_Death(class UCanvas* C, float L, float t, float R, float B, const struct FACLData& Data, int Column, int row);
};


// Class GUIWarfareControls.BTWindowRedeemCodes
// 0x0114 (0x05D4 - 0x04C0)
class UBTWindowRedeemCodes : public UBTWindowHK
{
public:
	struct FFloatBox                                   fbEditRedeemCodes[0x8];                                   // 0x04C0(0x0010)
	struct FFloatBox                                   fbLabelInfo[0x2];                                         // 0x0540(0x0010)
	class UBTEditBoxHK*                                EditRedeemCodes[0x8];                                     // 0x0560(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelInfo[0x2];                                           // 0x0580(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonPaste;                                              // 0x0588(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonPaste;                                            // 0x058C(0x0010)
	string                                             strRedeemCodeTitle;                                       // 0x059C(0x000C) (Localized, NeedCtorLink)
	string                                             strRedeemCodeInfo[0x2];                                   // 0x05A8(0x000C) (Localized, NeedCtorLink)
	string                                             strPaste;                                                 // 0x05C0(0x000C) (Localized, NeedCtorLink)
	struct FScriptDelegate                             __deleSendCodes__Delegate;                                // 0x05CC(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowRedeemCodes");
		return ptr;
	}


	bool ButtonPaste_OnClick(class UGUIComponent* Sender);
	void Internal_OnMaxTextStrNum(class UGUIComponent* Sender);
	void SendCodes();
	bool InternalOnOK(class UGUIComponent* Sender);
	bool deleOnChat(class UGUIComponent* Sender, const string& Text);
	bool STATIC_ShowWindowRedeemCodes(class UGUIController* con);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void deleSendCodes(const string& codes);
};


// Class GUIWarfareControls.BTROWeaponStatusBarHK
// 0x00AC (0x00EC - 0x0040)
class UBTROWeaponStatusBarHK : public URenderObject
{
public:
	struct FImage                                      back;                                                     // 0x0040(0x0020)
	struct FImage                                      Gauge;                                                    // 0x0060(0x0020)
	struct FImage                                      Plus;                                                     // 0x0080(0x0020)
	struct FImage                                      Minus;                                                    // 0x00A0(0x0020)
	int[]                                              DataArray;                                                // 0x00C0(0x000C) (NeedCtorLink)
	struct FText[]                                     textArray;                                                // 0x00CC(0x000C) (NeedCtorLink)
	EDrawType                                          DrawType;                                                 // 0x00D8(0x0001)
	ETextArrayDrawType                                 TADrawType;                                               // 0x00D9(0x0001)
	byte                                               Padding00[0x2];                                           // 0x00DA(0x0002) MISSED OFFSET
	struct FColor                                      plus_c;                                                   // 0x00DC(0x0004)
	struct FColor                                      minus_c;                                                  // 0x00E0(0x0004)
	int                                                AllTextWidth;                                             // 0x00E4(0x0004)
	int                                                BnTSpace;                                                 // 0x00E8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROWeaponStatusBarHK");
		return ptr;
	}


	bool Render(class UCanvas* C, float Delta);
	void SetData(int A, int B);
	void Init();
};


// Class GUIWarfareControls.BTROWeaponStatusBarHKCN
// 0x0000 (0x00EC - 0x00EC)
class UBTROWeaponStatusBarHKCN : public UBTROWeaponStatusBarHK
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROWeaponStatusBarHKCN");
		return ptr;
	}


	bool Render(class UCanvas* C, float Delta);
	void SetData(int A, int B);
	void Init();
};


// Class GUIWarfareControls.BTROWeaponUIGaugeHK
// 0x0040 (0x0080 - 0x0040)
class UBTROWeaponUIGaugeHK : public URenderObject
{
public:
	bool                                               bHideAllExceptName;                                       // 0x0040(0x0004)
	bool                                               bHideGaugeBack;                                           // 0x0040(0x0004)
	bool                                               bHideValue;                                               // 0x0040(0x0004)
	int                                                TextX;                                                    // 0x0044(0x0004)
	int                                                GaugeStartX;                                              // 0x0048(0x0004)
	int                                                GaugeEndX;                                                // 0x004C(0x0004)
	int                                                ValueX;                                                   // 0x0050(0x0004)
	string                                             GaugeName;                                                // 0x0054(0x000C) (NeedCtorLink)
	int[]                                              DataArray;                                                // 0x0060(0x000C) (NeedCtorLink)
	struct FText[]                                     textArray;                                                // 0x006C(0x000C) (NeedCtorLink)
	int                                                gwidth;                                                   // 0x0078(0x0004)
	int                                                gmove;                                                    // 0x007C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTROWeaponUIGaugeHK");
		return ptr;
	}


	bool Render(class UCanvas* C, float Delta);
	void Update(class UCanvas* C, float Delta);
	void SetPos(int TextX, int GaugeStartX, int GaugeEndX, int ValueX);
	void SetData(const string& GaugeName, int A, int B);
	void Init();
};


// Class GUIWarfareControls.BTTPOptionGQSimpleHK
// 0x00A4 (0x03E4 - 0x0340)
class UBTTPOptionGQSimpleHK : public UBTTabPanelHK
{
public:
	string                                             strButtonRadio;                                           // 0x0340(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonRadio;                                            // 0x034C(0x0010)
	class UBTCheckBoxHK*                               ButtonRadio;                                              // 0x035C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UButtonGroups*                               GraphicSimpleGroup;                                       // 0x0360(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLow;                                                   // 0x0364(0x000C) (Localized, NeedCtorLink)
	string                                             strNormal;                                                // 0x0370(0x000C) (Localized, NeedCtorLink)
	string                                             strHigh;                                                  // 0x037C(0x000C) (Localized, NeedCtorLink)
	string                                             strExHigh;                                                // 0x0388(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 SimpleButton[0x4];                                        // 0x0394(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTab[0x4];                                         // 0x03A4(0x0010)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPOptionGQSimpleHK");
		return ptr;
	}


	bool EnableAllButton();
	bool DisableAllButton();
	void ChangeButtonImage();
	void ApplyAWinPos();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTTPOptionGQAutoHK
// 0x0020 (0x0360 - 0x0340)
class UBTTPOptionGQAutoHK : public UBTTabPanelHK
{
public:
	string                                             strButtonRadio;                                           // 0x0340(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonRadio;                                            // 0x034C(0x0010)
	class UBTCheckBoxHK*                               ButtonRadio;                                              // 0x035C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTTPOptionGQAutoHK");
		return ptr;
	}


	void ApplyAWinPos();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfareControls.BTOptionKeyButtonHK
// 0x0044 (0x0514 - 0x04D0)
class UBTOptionKeyButtonHK : public UBTOwnerDrawCaptionButtonHK
{
public:
	string                                             SaveKey;                                                  // 0x04D0(0x000C) (NeedCtorLink)
	string                                             SaveCaption;                                              // 0x04DC(0x000C) (NeedCtorLink)
	string                                             BindName;                                                 // 0x04E8(0x000C) (NeedCtorLink)
	string                                             strBindFuncName;                                          // 0x04F4(0x000C) (NeedCtorLink)
	string                                             strNewKey;                                                // 0x0500(0x000C) (Localized, NeedCtorLink)
	struct FScriptDelegate                             __OnChangeKey__Delegate;                                  // 0x050C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTOptionKeyButtonHK");
		return ptr;
	}


	bool RawKey(byte NewKey);
	void SetKey(const string& KeyName);
	void OnChangeKey(class UGUIComponent* Sender, const string& NewKey);
	bool IsAllowedKey(byte NewKey);
	bool Internal_OnClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetBindFuncName(const string& str);
};


// Class GUIWarfareControls.BTWindowNoticeHK
// 0x0028 (0x04E8 - 0x04C0)
class UBTWindowNoticeHK : public UBTWindowHK
{
public:
	class UBTOwnerDrawImageHK*                         LabelTitle;                                               // 0x04C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelBack;                                                // 0x04C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 NoticeAd;                                                 // 0x04C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbAdvertise;                                              // 0x04CC(0x0010)
	string                                             AdvertiseURL;                                             // 0x04DC(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfareControls.BTWindowNoticeHK");
		return ptr;
	}


	void Internal_LostFocus(class UGUIPage* NewMenu);
	void Internal_GetFocus();
	bool AD_OnClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
