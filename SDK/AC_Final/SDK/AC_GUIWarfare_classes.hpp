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

// Class GUIWarfare.BTNetGUIPage
// 0x0154 (0x04B8 - 0x0364)
class UBTNetGUIPage : public UGUIPage
{
public:
	class UBTNetMainMenu*                              page_Main;                                                // 0x0364(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x0368(0x0004)
	class UBTTcpLink_Login*                            TcpLogin;                                                 // 0x036C(0x0004)
	string[]                                           BGMList;                                                  // 0x0370(0x000C) (NeedCtorLink)
	class UBTNetGameData*                              NetGameData;                                              // 0x037C(0x0004)
	class UBTDataTransferClientLink*                   DataTransferLink;                                         // 0x0380(0x0004)
	string                                             strSystem;                                                // 0x0384(0x000C) (Localized, NeedCtorLink)
	string                                             strClanGrade[0x5];                                        // 0x0390(0x000C) (Localized, NeedCtorLink)
	string                                             strSlashW;                                                // 0x03CC(0x000C) (Localized, NeedCtorLink)
	string                                             strSlashN;                                                // 0x03D8(0x000C) (Localized, NeedCtorLink)
	string                                             strSlashC;                                                // 0x03E4(0x000C) (Localized, NeedCtorLink)
	string                                             strSlashT;                                                // 0x03F0(0x000C) (Localized, NeedCtorLink)
	string                                             strTo;                                                    // 0x03FC(0x000C) (Localized, NeedCtorLink)
	string                                             strFrom;                                                  // 0x0408(0x000C) (Localized, NeedCtorLink)
	string                                             strLink;                                                  // 0x0414(0x000C) (Localized, NeedCtorLink)
	string                                             strExit;                                                  // 0x0420(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbAdvertise[0x5];                                         // 0x042C(0x0010)
	string                                             AdvertiseURL[0x5];                                        // 0x047C(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTNetGUIPage");
		return ptr;
	}


	void Internal_LostFocus(class UGUIPage* NewMenu);
	void Internal_GetFocus();
	void OnCompleteOpened();
	void OnBackToLastPage();
	void ProcessNat();
	bool InternalOnPreDraw(class UCanvas* C);
	bool MyCanClose(bool bCanceled);
	void Opened(class UGUIComponent* Sender);
	class UBTTcpLink_Login* GetTcpLogin();
	class UBTTcpLink_Channel* GetTcpChannel();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	struct FChatInfo TextToChatInfo(const string& Text);
	void RefreshPage();
};


// Class GUIWarfare.BTConsole
// 0x022C (0x0BC0 - 0x0994)
class UBTConsole : public UExtendedConsole
{
public:
	string                                             strRecordRetCode[0x4];                                    // 0x0994(0x000C) (Localized, NeedCtorLink)
	string                                             lsNotEnableRecordOption;                                  // 0x09C4(0x000C) (Localized, NeedCtorLink)
	bool                                               bStopOutofSeat;                                           // 0x09D0(0x0004)
	int                                                OutofSeatTime;                                            // 0x09D4(0x0004)
	int                                                OwnerOutofSeatTime;                                       // 0x09D8(0x0004)
	int                                                UserReadyTime;                                            // 0x09DC(0x0004)
	int                                                UserReadyTimeCount;                                       // 0x09E0(0x0004)
	int                                                preLevelTime;                                             // 0x09E4(0x0004)
	int                                                LevelTime;                                                // 0x09E8(0x0004)
	float                                              LastKeySleepTime;                                         // 0x09EC(0x0004)
	bool                                               bReqFontReset;                                            // 0x09F0(0x0004)
	string                                             strChangeQS;                                              // 0x09F4(0x000C) (Localized, NeedCtorLink)
	string                                             strCloseQSWindow;                                         // 0x0A00(0x000C) (Localized, NeedCtorLink)
	string                                             strChatMode[0x7];                                         // 0x0A0C(0x000C) (Localized, NeedCtorLink)
	string                                             strChattingHelpGFS;                                       // 0x0A60(0x000C) (Localized, NeedCtorLink)
	string                                             strChattingHelp;                                          // 0x0A6C(0x000C) (Localized, NeedCtorLink)
	string                                             strRegulateShot;                                          // 0x0A78(0x000C) (Localized, NeedCtorLink)
	string                                             strSaveShot;                                              // 0x0A84(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbChatHistory[0x2];                                       // 0x0A90(0x0010)
	struct FFloatBox                                   fbButtonChatMode;                                         // 0x0AB0(0x0010)
	struct FFloatBox                                   fbChatEditBox;                                            // 0x0AC0(0x0010)
	struct FFloatBox                                   fbLabelEditBox;                                           // 0x0AD0(0x0010)
	string                                             strGhostChatModeTeam;                                     // 0x0AE0(0x000C) (Localized, NeedCtorLink)
	string                                             strGhostChatModeAll;                                      // 0x0AEC(0x000C) (Localized, NeedCtorLink)
	string[]                                           MessageType_PostString;                                   // 0x0AF8(0x000C) (NeedCtorLink)
	struct FColor[]                                    MessageType_Color;                                        // 0x0B04(0x000C) (NeedCtorLink)
	bool                                               bChatEnabled;                                             // 0x0B10(0x0004)
	class UBTChatEditBoxHK*                            ChatEditBox;                                              // 0x0B14(0x0004) (ExportObject, NeedCtorLink, EditInline)
	float                                              CharEditBoxCursorHeightRatio;                             // 0x0B18(0x0004)
	EMessageType                                       ChatMessageType;                                          // 0x0B1C(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0B1D(0x0003) MISSED OFFSET
	bool                                               bChatInGhostMode;                                         // 0x0B20(0x0004)
	class UMaterial*                                   ChatSelectImg;                                            // 0x0B24(0x0004)
	struct FMessageItem[]                              MessageItems;                                             // 0x0B28(0x000C) (NeedCtorLink)
	float                                              MessageItemsX;                                            // 0x0B34(0x0004)
	float                                              MessageItemsYFromBottom;                                  // 0x0B38(0x0004)
	float                                              MessageItemsLineSpacing;                                  // 0x0B3C(0x0004)
	int                                                MaxMessageItems;                                          // 0x0B40(0x0004)
	byte                                               byPressed_Shift;                                          // 0x0B44(0x0001)
	byte                                               Padding01[0x3];                                           // 0x0B45(0x0003) MISSED OFFSET
	bool                                               ToggleIme;                                                // 0x0B48(0x0004)
	bool                                               ImeNative;                                                // 0x0B48(0x0004)
	class UBTTcpLink_Channel*                          TcpHandler;                                               // 0x0B4C(0x0004)
	float                                              AccumDelta;                                               // 0x0B50(0x0004)
	float                                              EventTimerDelta;                                          // 0x0B54(0x0004)
	float                                              EventTimerNextStep;                                       // 0x0B58(0x0004)
	class UBTNetMainMenu*                              MainMenu;                                                 // 0x0B5C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FColor                                      ShadowColor;                                              // 0x0B60(0x0004)
	int                                                ResetImeCount;                                            // 0x0B64(0x0004)
	bool                                               bAltPressed;                                              // 0x0B68(0x0004)
	int                                                currentBGM;                                               // 0x0B6C(0x0004)
	int                                                CurrentBGMHandle;                                         // 0x0B70(0x0004)
	bool                                               HasBGMDuration;                                           // 0x0B74(0x0004)
	int                                                BGMStartTime;                                             // 0x0B78(0x0004)
	int                                                BGMDuration;                                              // 0x0B7C(0x0004)
	float                                              BGMFadeInTime;                                            // 0x0B80(0x0004)
	float                                              BGMFadeOutTime;                                           // 0x0B84(0x0004)
	int                                                BGMTermBetween;                                           // 0x0B88(0x0004)
	int                                                Term;                                                     // 0x0B8C(0x0004)
	string[]                                           BGMs;                                                     // 0x0B90(0x000C) (NeedCtorLink)
	int[]                                              BGMDurations;                                             // 0x0B9C(0x000C) (NeedCtorLink)
	struct FIntArray[]                                 BGMPartialPlayInitialSeeks;                               // 0x0BA8(0x000C) (NeedCtorLink)
	bool                                               BGMPartialPlay;                                           // 0x0BB4(0x0004)
	int                                                BGMPartialPlayDuration;                                   // 0x0BB8(0x0004)
	bool                                               bGmPause;                                                 // 0x0BBC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTConsole");
		return ptr;
	}


	void ConsoleCMD(const string& Line);
	void SendQuestUpdate();
	void ShowTutorialEndWindow();
	bool CheckTurorial_OnOK(class UGUIComponent* Sender);
	void SetAdminSpec(int B);
	void GetBot();
	void SetBot(int withBot, int num0, int num1, int Grade);
	void LogBot();
	void UpdateAAS();
	void UpdateGameNotice();
	void UpdateConnection(float Delta);
	void ProcessChatBan(float Delta);
	void ProcessOutOfSleep_InRoomLobby();
	void ProcessOutOfDoing_InRoomLobby();
	void ProcessOutOfCounting(int MaxTime, int CountTime, int CountingMsgCode, int OutMsgCode);
	void ProcessOutOfSeat(float Delta);
	bool IsExceptionOutOfSeat();
	void Tick(float Delta);
	void SetTermBetweenBGM(float val);
	void UpdateBGM(float dt);
	bool IsBGMPlaying();
	void StopBGM();
	void NextBGM();
	void SetBGMAdvanced(string[] List, bool partialPlay, int partialDuration, struct FIntArray[] initialSeeks);
	void SetBGM(string[] List);
	void SetOneBGM(const string& List);
	string GetCurrentBGM();
	void SwitchChatMessageType(EInputKey key);
	void CallChatWhisper();
	void CallChatClan();
	void CallChatTeam();
	void CallChatAll();
	void CallChatMode();
	void SetChatHelpString();
	bool OnIME_Notify(int Type, int LangID, const string& strText, int StartPos, int Size);
	bool NeedToOffIME();
	void DownloadWebzenShop();
	void CompletedQuest();
	void SendMessage(const struct FMessageItem& msgItem);
	void ClearMessageItems();
	void AddMessageItem(const struct FMessageItem& Item);
	struct FMessageItem ConstructMessageItem(const string& Text, EMessageType MessageType);
	void ProhibitAltTab();
	void AddSystemMessageSaveShot(const string& Text);
	void AddSystemMessageRegulateShot();
	void DrawMessageItems(class UCanvas* C);
	void DrawTextChattingHelp(class UCanvas* C);
	void DrawChatEditBox(class UCanvas* C);
	void PostRender(class UCanvas* C);
	void PreRender(class UCanvas* Canvas);
	void FontReset();
	bool CallSelectAlienType(EInputKey key);
	void CallBattleHelp();
	void CallSelectItemBuy(int iIndex);
	void CallSelectRadioMessage(int iIndex);
	void CallSelectQuickSlot(int iIndex);
	void CallToggleQuickSlot();
	void SetLoadingTime(int L, int P);
	void StopQuestLog();
	void CloseWindow(int Count);
	void RecordOn_Exception(int retCode);
	void RecordOn_FnRun(int Index);
	bool RecordOn_OnOK(class UGUIComponent* Sender);
	void RecordOn();
	void ShowWindow(const string& windowclassname);
	void StartAutoMove(int Server, int Channel, int gameroom);
	void endTutorial();
	void tutorial(const string& Map);
	void stopoos();
	bool BlockChangeWeapon(int nIndex);
	bool IsHaveMainWeapon(int nIndex);
	bool KeyEvent(EInputKey key, EInputAction Action, float Delta);
	bool KeyType(EInputKey key, const string& Unicode);
	bool GetChatEnabled();
	void SetChatEnabled(bool Value);
	void ChatEditBox_OnInputSpace(class UGUIComponent* Sender, const string& Text);
	void ChatEditBox_OnInputTab(class UGUIComponent* Sender, const string& Text);
};


// Class GUIWarfare.BTNetMainMenu
// 0x087C (0x0D34 - 0x04B8)
class UBTNetMainMenu : public UBTNetGUIPage
{
public:
	class UBTTPChatHK*                                 TPChat;                                                   // 0x04B8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                CheckOneHour;                                             // 0x04BC(0x0004)
	EPage                                              eCurrPage;                                                // 0x04C0(0x0001)
	byte                                               Padding00[0x3];                                           // 0x04C1(0x0003) MISSED OFFSET
	bool                                               kClanWarUserCountIgnore;                                  // 0x04C4(0x0004)
	class UPageOnWindowManager*                        pwm;                                                      // 0x04C8(0x0004)
	class UwMatchMaker*                                rMM;                                                      // 0x04CC(0x0004) (Transient)
	class UwMyPlayerStatus*                            rMyStatus;                                                // 0x04D0(0x0004) (Transient)
	class UwGameManager*                               rGameMgr;                                                 // 0x04D4(0x0004) (Transient)
	struct FClanInfo                                   MyClanInfo;                                               // 0x04D8(0x00B0) (NeedCtorLink)
	struct FClanInfo                                   kRecvClanInfo;                                            // 0x0588(0x00B0) (NeedCtorLink)
	struct FCharInfo                                   MyCharInfo;                                               // 0x0638(0x00C0)
	string                                             MyClanName;                                               // 0x06F8(0x000C) (NeedCtorLink)
	string                                             SaveClanName;                                             // 0x0704(0x000C) (NeedCtorLink)
	bool                                               InTutorial;                                               // 0x0710(0x0004)
	bool                                               EnterBotMode;                                             // 0x0710(0x0004)
	bool                                               CreateBotMode;                                            // 0x0710(0x0004)
	bool                                               bRequestItemList;                                         // 0x0710(0x0004)
	struct FWZInvenListProcess                         WZILP;                                                    // 0x0714(0x001C) (NeedCtorLink)
	int                                                CommandType;                                              // 0x0730(0x0004)
	int                                                CommandParameter_int;                                     // 0x0734(0x0004)
	string                                             CommandParameter_string;                                  // 0x0738(0x000C) (NeedCtorLink)
	bool                                               bIsInPCBang;                                              // 0x0744(0x0004)
	bool                                               bFirstLogin;                                              // 0x0744(0x0004)
	bool                                               bAutoMove;                                                // 0x0744(0x0004)
	byte                                               AutoMoveState;                                            // 0x0748(0x0001)
	byte                                               Padding01[0x3];                                           // 0x0749(0x0003) MISSED OFFSET
	bool                                               AutoMoveDirectionOut;                                     // 0x074C(0x0004)
	int                                                AutoMoveClanWar;                                          // 0x0750(0x0004)
	int                                                AutoMoveServerID;                                         // 0x0754(0x0004)
	int                                                AutoMoveChannelID;                                        // 0x0758(0x0004)
	int                                                AutoMoveGameRoomNum;                                      // 0x075C(0x0004)
	string                                             AutoMoveGameRoomPassword;                                 // 0x0760(0x000C) (NeedCtorLink)
	bool                                               bPostBoxFull;                                             // 0x076C(0x0004)
	bool                                               bNewMailArrived;                                          // 0x076C(0x0004)
	int                                                NewMailCount;                                             // 0x0770(0x0004)
	struct FServerConnectionInfo[]                     SCIList;                                                  // 0x0774(0x000C) (NeedCtorLink)
	int[]                                              NoviceChannelIndex;                                       // 0x0780(0x000C) (NeedCtorLink)
	struct FMapNameInfo[]                              MapNameList;                                              // 0x078C(0x000C) (NeedCtorLink)
	string                                             AuthLogin_ClientIP;                                       // 0x0798(0x000C) (NeedCtorLink)
	byte                                               AuthLogin_ChannelType;                                    // 0x07A4(0x0001)
	byte                                               AuthLogin_ConnectAlpha;                                   // 0x07A5(0x0001)
	byte                                               AuthLogin_AccountType;                                    // 0x07A6(0x0001)
	byte                                               Padding02[0x1];                                           // 0x07A7(0x0001) MISSED OFFSET
	string                                             AuthLogin_GUID;                                           // 0x07A8(0x000C) (NeedCtorLink)
	string                                             AuthLogin_AccountID;                                      // 0x07B4(0x000C) (NeedCtorLink)
	int                                                AuthLogin_ChannelingType;                                 // 0x07C0(0x0004)
	string                                             AuthLogin_AuthKey;                                        // 0x07C4(0x000C) (NeedCtorLink)
	string                                             AuthLogin_RegionKey;                                      // 0x07D0(0x000C) (NeedCtorLink)
	string                                             BirthDay;                                                 // 0x07DC(0x000C) (NeedCtorLink)
	byte                                               Sex;                                                      // 0x07E8(0x0001)
	byte                                               Padding03[0x3];                                           // 0x07E9(0x0003) MISSED OFFSET
	string                                             szLoginPassword;                                          // 0x07EC(0x000C) (NeedCtorLink)
	int                                                LoginTimeStamp;                                           // 0x07F8(0x0004)
	int                                                LoginHash1;                                               // 0x07FC(0x0004)
	int                                                LoginHash2;                                               // 0x0800(0x0004)
	int                                                LoginHash3;                                               // 0x0804(0x0004)
	int                                                LoginHash4;                                               // 0x0808(0x0004)
	int                                                LoginHash5;                                               // 0x080C(0x0004)
	bool                                               bWarningDurabilityAndExpired;                             // 0x0810(0x0004)
	string                                             strGMList;                                                // 0x0814(0x000C) (Localized, NeedCtorLink)
	bool                                               bChatBan;                                                 // 0x0820(0x0004)
	bool                                               bSystemChatBlock;                                         // 0x0820(0x0004)
	float                                              ChatAccumTime[0x4];                                       // 0x0824(0x0004)
	int                                                ChatLogTop;                                               // 0x0834(0x0004)
	struct FChatHistory[]                              ChatLog;                                                  // 0x0838(0x000C) (NeedCtorLink)
	string                                             LastRecvWhispherName;                                     // 0x0844(0x000C) (NeedCtorLink)
	struct FChatInfo                                   PrevChatMode;                                             // 0x0850(0x001C) (NeedCtorLink)
	string                                             strNotice_All;                                            // 0x086C(0x000C) (Localized, NeedCtorLink)
	string                                             strNotice_Server;                                         // 0x0878(0x000C) (Localized, NeedCtorLink)
	string                                             strNotice_Channel;                                        // 0x0884(0x000C) (Localized, NeedCtorLink)
	string                                             strNotice_Room;                                           // 0x0890(0x000C) (Localized, NeedCtorLink)
	string                                             strKick;                                                  // 0x089C(0x000C) (Localized, NeedCtorLink)
	string                                             strChangeRoomTitle;                                       // 0x08A8(0x000C) (Localized, NeedCtorLink)
	float                                              NoticeUITimeSeconds;                                      // 0x08B4(0x0004)
	float                                              NoticeUIPos;                                              // 0x08B8(0x0004)
	int                                                NoticeIndex;                                              // 0x08BC(0x0004)
	string[]                                           BatteryNotice;                                            // 0x08C0(0x000C) (NeedCtorLink)
	float                                              AASUITimeSeconds;                                         // 0x08CC(0x0004)
	float                                              AASUIPos;                                                 // 0x08D0(0x0004)
	struct FAAS_Struct[]                               BatteryAAS;                                               // 0x08D4(0x000C) (NeedCtorLink)
	struct FAAS_Struct                                 AASTemp[0x2];                                             // 0x08E0(0x0024) (NeedCtorLink)
	string                                             strAASMessage[0x6];                                       // 0x0928(0x000C) (Localized, NeedCtorLink)
	bool                                               bNewAvailableQuest;                                       // 0x0970(0x0004)
	bool                                               bNewAvailableEventQuest;                                  // 0x0970(0x0004)
	struct FLevelUpInfoStruct                          LevelUpInfo;                                              // 0x0974(0x0024) (NeedCtorLink)
	class UBTExpiredItem*[]                            ExpiredItems;                                             // 0x0998(0x000C) (NeedCtorLink)
	struct FDurabilityWarningItemsStruct               DurWarningItems;                                          // 0x09A4(0x0010) (NeedCtorLink)
	string[]                                           DestroyedDurabilityXItems;                                // 0x09B4(0x000C) (NeedCtorLink)
	struct FUpdateQuickSlotInfo[]                      UpdateQuickSlotItemList;                                  // 0x09C0(0x000C) (NeedCtorLink)
	class UBTPageLogo*                                 page_Logo;                                                // 0x09CC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             pagename_Logo;                                            // 0x09D0(0x000C) (NeedCtorLink)
	class UBTPageLogin*                                page_Login;                                               // 0x09DC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             pagename_Login;                                           // 0x09E0(0x000C) (NeedCtorLink)
	class UBTPageLobby*                                page_Lobby2;                                              // 0x09EC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             pagename_Lobby2;                                          // 0x09F0(0x000C) (NeedCtorLink)
	class UBTPageCharacterCreation*                    page_CharacterCreation;                                   // 0x09FC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             pagename_CharacterCreation;                               // 0x0A00(0x000C) (NeedCtorLink)
	class UBTPageServerSelection*                      page_ServerSelection;                                     // 0x0A0C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             pagename_ServerSelection;                                 // 0x0A10(0x000C) (NeedCtorLink)
	class UBTPageRoomLobby*                            page_RoomLobby;                                           // 0x0A1C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTPageRoomLobby*                            RoomLobby;                                                // 0x0A20(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTPageRoomLobby*                            RoomLobbyDefence;                                         // 0x0A24(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTPageMatchResult*                          page_MatchResult2;                                        // 0x0A28(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTPageMatchResult*                          MatchResult2;                                             // 0x0A2C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTPageMatchResult*                          MatchResult2_Defence;                                     // 0x0A30(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             pagename_RoomLobby;                                       // 0x0A34(0x000C) (NeedCtorLink)
	string                                             pagename_RoomLobby_Defence;                               // 0x0A40(0x000C) (NeedCtorLink)
	string                                             pagename_MatchResult2;                                    // 0x0A4C(0x000C) (NeedCtorLink)
	string                                             pagename_MatchResult2_Defence;                            // 0x0A58(0x000C) (NeedCtorLink)
	class UBTPageAuction*                              page_Auction;                                             // 0x0A64(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             pagename_Auction;                                         // 0x0A68(0x000C) (NeedCtorLink)
	class UBTPageHelp*                                 page_Help;                                                // 0x0A74(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             pagename_Help;                                            // 0x0A78(0x000C) (NeedCtorLink)
	class UBTPageMail*                                 page_Mail;                                                // 0x0A84(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             pagename_Mail;                                            // 0x0A88(0x000C) (NeedCtorLink)
	class UBTPageStore*                                page_Store;                                               // 0x0A94(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             pagename_Store;                                           // 0x0A98(0x000C) (NeedCtorLink)
	class UBTPageInventory*                            page_Inventory;                                           // 0x0AA4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             pagename_Inventory;                                       // 0x0AA8(0x000C) (NeedCtorLink)
	class UBTPageMyInfo*                               page_MyInfo;                                              // 0x0AB4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             pagename_MyInfo;                                          // 0x0AB8(0x000C) (NeedCtorLink)
	class UBTPageClan*                                 page_Clan;                                                // 0x0AC4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             pagename_Clan;                                            // 0x0AC8(0x000C) (NeedCtorLink)
	class UBTPageCredit*                               page_Credit;                                              // 0x0AD4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             pagename_Credit;                                          // 0x0AD8(0x000C) (NeedCtorLink)
	class UBTPageClanWar*                              page_ClanWar;                                             // 0x0AE4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             pagename_ClanWar;                                         // 0x0AE8(0x000C) (NeedCtorLink)
	class UBTPageLucky*                                page_Lucky;                                               // 0x0AF4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             pagename_Lucky;                                           // 0x0AF8(0x000C) (NeedCtorLink)
	EPage                                              PageOnOpen;                                               // 0x0B04(0x0001)
	byte                                               Padding04[0x3];                                           // 0x0B05(0x0003) MISSED OFFSET
	class UBTNetGUIPage*                               page_curr;                                                // 0x0B08(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTNetGUIPage*[]                             Pages;                                                    // 0x0B0C(0x000C) (NeedCtorLink)
	string                                             szAccountName;                                            // 0x0B18(0x000C) (NeedCtorLink)
	string                                             szLoginServerIP;                                          // 0x0B24(0x000C) (NeedCtorLink)
	int                                                szLoginServerPort;                                        // 0x0B30(0x0004)
	int                                                GameRunningCount;                                         // 0x0B34(0x0004)
	struct FLoginServerStruct[]                        LoginServers;                                             // 0x0B38(0x000C) (NeedCtorLink)
	byte                                               iTryLoginCount;                                           // 0x0B44(0x0001)
	byte                                               iMaxTryLoginCount;                                        // 0x0B45(0x0001)
	byte                                               Padding05[0x2];                                           // 0x0B46(0x0002) MISSED OFFSET
	bool                                               bConnectedLoginServer;                                    // 0x0B48(0x0004)
	bool                                               bConnectedChannelServer;                                  // 0x0B48(0x0004)
	bool                                               bAuthKeySuccess;                                          // 0x0B48(0x0004)
	string                                             DefaultLobbyBGM;                                          // 0x0B4C(0x000C) (NeedCtorLink)
	string                                             LastMainPageBGM;                                          // 0x0B58(0x000C) (NeedCtorLink)
	int                                                iUid;                                                     // 0x0B64(0x0004) (Transient)
	int                                                iChannel;                                                 // 0x0B68(0x0004) (Transient)
	string                                             ServerName;                                               // 0x0B6C(0x000C) (NeedCtorLink)
	string                                             ServerShortName;                                          // 0x0B78(0x000C) (NeedCtorLink)
	int                                                ServerGroupID;                                            // 0x0B84(0x0004)
	int                                                ServerID;                                                 // 0x0B88(0x0004)
	int                                                GameRoomID;                                               // 0x0B8C(0x0004)
	string                                             ServerGroupName;                                          // 0x0B90(0x000C) (NeedCtorLink)
	string                                             ChannelName;                                              // 0x0B9C(0x000C) (NeedCtorLink)
	int                                                iRoomNum;                                                 // 0x0BA8(0x0004) (Transient)
	int                                                NatType;                                                  // 0x0BAC(0x0004)
	string[]                                           NatAddrs;                                                 // 0x0BB0(0x000C) (NeedCtorLink)
	int[]                                              NatPorts;                                                 // 0x0BBC(0x000C) (NeedCtorLink)
	class UBTNatDiag*                                  NatDiag;                                                  // 0x0BC8(0x0004)
	float                                              TimeNatDiagStarted;                                       // 0x0BCC(0x0004)
	int                                                NatCheckLoop;                                             // 0x0BD0(0x0004)
	float                                              NatDiagInterval;                                          // 0x0BD4(0x0004)
	string                                             LocalLogStr[0x9];                                         // 0x0BD8(0x000C) (Localized, NeedCtorLink)
	string                                             strNatType[0x4];                                          // 0x0C44(0x000C) (Localized, NeedCtorLink)
	string                                             strCashCharge;                                            // 0x0C74(0x000C) (Localized, NeedCtorLink)
	byte                                               UserInfoWindowShowTab;                                    // 0x0C80(0x0001)
	byte                                               Padding06[0x3];                                           // 0x0C81(0x0003) MISSED OFFSET
	struct FScriptDelegate                             __delegateCheckNat__Delegate;                             // 0x0C84(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __UpdateRecv_ClanInfo__Delegate;                          // 0x0C8C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __UpdateExpiredItemList__Delegate;                        // 0x0C94(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __UpdateDurabilityWarningItemList__Delegate;              // 0x0C9C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __UpdateWebzenInvenList__Delegate;                        // 0x0CA4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __UpdateWebzenInvenListEnd__Delegate;                     // 0x0CAC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __ClearChatLog__Delegate;                                 // 0x0CB4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __NormalChatLog__Delegate;                                // 0x0CBC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __ClanChatLog__Delegate;                                  // 0x0CC4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __WhisperChatLog__Delegate;                               // 0x0CCC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __SelfChatLog__Delegate;                                  // 0x0CD4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __SystemChatLog__Delegate;                                // 0x0CDC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __TeamChatLog__Delegate;                                  // 0x0CE4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __BroadCastItemChatLog__Delegate;                         // 0x0CEC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __ClearChatLog_Extra__Delegate;                           // 0x0CF4(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __NormalChatLog_Extra__Delegate;                          // 0x0CFC(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __ClanChatLog_Extra__Delegate;                            // 0x0D04(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __WhisperChatLog_Extra__Delegate;                         // 0x0D0C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __SelfChatLog_Extra__Delegate;                            // 0x0D14(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __SystemChatLog_Extra__Delegate;                          // 0x0D1C(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __TeamChatLog_Extra__Delegate;                            // 0x0D24(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __BroadCastItemChatLog_Extra__Delegate;                   // 0x0D2C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTNetMainMenu");
		return ptr;
	}


	void SendCharDetailInfoWithClan(const string& CharName, byte ShowTab);
	void SendLogin();
	bool OnAppExit(class UGUIComponent* Sender);
	bool TcpLogin_rfAckLoginWithIndonesia_Live(int Result);
	bool TcpLogin_rfAckLoginWithIndonesia_Test(int Result);
	bool TcpLogin_rfAckLoginWithGlobal_Test(int Result);
	bool TcpLogin_rfAckLoginWithGlobal_Live(int Result);
	bool TcpLogin_rfAckLoginWithThailand_Test(int Result);
	bool TcpLogin_rfAckLoginWithThailand_Live(int Result);
	bool TcpLogin_rfAckLoginWithWZAuth_Test(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType);
	bool TcpLogin_rfAckLoginWithWZAuth_Live(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType);
	bool TcpLogin_rfAckLoginWithTencentAuth_Test(int Result, byte tc_AccountType, byte tc_IsBlock);
	bool TcpLogin_rfAckLoginWithTencentAuth_Live(int Result, byte tc_AccountType, byte tc_IsBlock);
	void RequestUpdateQuickSlot(int iQuickSlotIdx);
	void UpdateAckQuickSlot_2(byte[] iQuickSlotIdxes, int[] iItemIDs, struct FBtrDouble[] dwUniqueIDs, byte[] bySlotPoses, byte[] bySlotValues);
	void CalcQuickSlotItemCount(int* iStartIndex, int* iUpdateCount);
	void UpdateReqQuickSlot();
	bool UnequipItemSlot(int iItemID, ESLOT_POS eSlotPos, const struct FBtrDouble& dwUniqueID);
	bool EquipItemSlot(int iItemID, ESLOT_POS eSlotPos, const struct FBtrDouble& dwUniqueID);
	bool UnequipOnlyModeItem_QS(int iItemID, ESLOT_POS eSlotPos, const struct FBtrDouble& dwUniqueID, bool bIsSkill);
	bool EquipOnlyModeItem_QS(int iItemID, ESLOT_POS eSlotPos, const struct FBtrDouble& dwUniqueID, bool bIsSkill);
	bool AddEquippedItemInfo(int iQuickSlotIdx, int iItemID, ESLOT_POS eSlotPos, const struct FBtrDouble& dwUniqueID, bool bEquipped, bool bIsSkill);
	bool UnEquipQuickSlot(int iQuickSlotIdx, ESLOT_POS eSlotPos, bool bIsSkill);
	bool EquipQuickSlot(int iQuickSlotIdx, ESLOT_POS eSlotPos, int iItemID, const struct FBtrDouble& dwUniqueID, bool bIsSkill);
	bool CheckMoveToChannel(int iServerIndex);
	void CheckWebzenShopItemList();
	void UpdateWebzenShopItemList(int Year, int YearId, int SalesZoneCode);
	bool ShowHelpWindow_OnOK(class UGUIComponent* Sender);
	void ShowHelpWindow();
	bool ShowReqCashWindow_OnOK(class UGUIComponent* Sender);
	bool ShowCashChargeWindow_OnOK(class UGUIComponent* Sender);
	void ShowCashChargeWindow();
	void UpdateBestLoginServer();
	void SortLoginServerList2(int fromIdx);
	void SortLoginServerList();
	bool Internal_OnFunctionKey(class UGUIComponent* Sender, byte FunctionKey, const string& Text);
	void TPChat_ChangeTab_OnClickTemp(int TabIndex);
	void TPChat_ChangeTab_OnClick(int TabIndex);
	void TPChat_OnChageChatMode(int ChatMode);
	void TPChat_OnInputTab(class UGUIComponent* Sender, const string& Text);
	void TPChat_OnInputSpace(class UGUIComponent* Sender, const string& Text);
	bool Internal_OnChat(class UGUIComponent* Sender, const string& Text);
	void ChatBanEnd_OnTimer(int Index);
	bool CheckChatBan();
	bool UpdateChatBan();
	int IsInClanChannel(const string& ServerIP, int serverPort, int ChannelID);
	bool IsInPageLobby();
	bool IsInPageServerSelection();
	bool IsGameReadyOrPlaying();
	bool IsInRangeDate(const struct FBtrDouble& ServerTime, int syear, int smonth, int sday, int shour, int smin, int eyear, int emonth, int eday, int ehour, int emin);
	bool Is18YearsOld(const struct FBtrDouble& ServerTime, const string& BirthDay);
	void UpdateTimeBatteryAAS();
	void PopAASQueue();
	float GetAASFirstTime();
	string GetAASFirst();
	void PushAASQueue(const string& Text, float Time, byte AASLevel);
	float GetAASBeginTime(byte byLevel);
	byte GetAASLevel();
	void SetAASMessage(byte byType, int AccumTime);
	void ResetBatteryAAS();
	void UpdateTimeBatteryNotice();
	void PopNoticeQueue();
	string GetNoticeFirst();
	void PushNoticeQueue(const string& Notice);
	void ResetBatteryNotice();
	bool TextToGMCommand(const string& Text);
	bool TextToCommand(const string& Text);
	void UpdateChatLog();
	void ResetChatLog();
	bool SelectChatLog(int ChatType, const string& chatText);
	void BroadCastItemChatLog_Extra(const string& cL);
	void TeamChatLog_Extra(const string& cL);
	void SystemChatLog_Extra(const string& cL);
	void SelfChatLog_Extra(const string& cL);
	void WhisperChatLog_Extra(const string& cL);
	void ClanChatLog_Extra(const string& cL);
	void NormalChatLog_Extra(const string& cL);
	void ClearChatLog_Extra();
	void BroadCastItemChatLog(const string& cL);
	void TeamChatLog(const string& cL);
	void SystemChatLog(const string& cL);
	void SelfChatLog(const string& cL);
	void WhisperChatLog(const string& cL);
	void ClanChatLog(const string& cL);
	void NormalChatLog(const string& cL);
	void ClearChatLog();
	int GetChatLogTopIndex();
	void AddChatLog(const string& chatText, int ChatType, bool bForceUpdateLast);
	bool Exit_OnOK(class UGUIComponent* Sender);
	bool TcpLogin_rfAckHash(int Result, const string& Error);
	void Exit_LoginServer(int ErrCode);
	void TryConnect_Login();
	void TcpLogin_OnError(int ErrCode);
	void TcpLogin_OnClose(int ErrCode);
	void TcpLogin_OnConnect(int ErrCode);
	void SetPage(EPage PageType, bool CloseLastMenu);
	void HaltNetwork();
	bool rfReqForceNatTypeSetting(int NatType);
	void CheckNatPhrase2HK();
	void CheckNatPhrase1HK();
	void CheckNatPhrase0HK();
	void StartNatCheck();
	void rfReqStartNatDiag(const string& Server1Addr, int Server1Port, const string& Server2Addr, int Server2Port);
	void deleOnClose(bool bCancelled);
	bool deleOnKeyEvent(float Delta, byte* key, byte* State);
	void deleOnOpen();
	class UBTTcpLink_Login* GetTcpLogin();
	void InitializeTcpLogin(const string& IP, int Port);
	void InitializeTcpChannel(const string& IP, int Port, int DataPort);
	void ShowPlayTimePerHour_OnEventTimer(int Index);
	bool LoadLoginServerList_Ini();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void KeepMoving();
	void EndAutoMove();
	void StartAutoMove(int Server, int Channel, int gameroom, const string& Password, int ClanMatch_EnterState);
	bool TutorialChannelAutoMove();
	string FindChannelNickName(int ServerID, int ChannelID);
	string FindServerShortName(int ServerID, int ChannelID);
	string FindServerName(int ServerID);
	int FindServerConnectionInfoIndex(int ServerID, int ChannelID);
	int FindServerChannelInfoIndexByServerIP(const string& ServerIP, int serverPort, int ChannelID);
	void AddServerChannelList(int ServerID, int ChannelID, const string& ServerIP, int serverPort, int ServerDataPort, const string& ServerName, const string& ServerShortName, const string& ChannelName, int ServerGroupID, const string& ServerGroupName, int IsClanChannel, const string& ChannelNickName, bool IsDedicatedServer, float ChannelOption, int nCurUser, int nMaxUser);
	void ClearServerChannelList();
	void CheckItemWarning();
	bool CheckDestroyedDurabilityXItemList();
	bool CheckDestroyedDurabilityXItemList_OnOK(class UGUIComponent* Sender);
	bool CompleteDestroyedDurabilityXItemList();
	bool CheckDurabilityWarningItemList();
	bool CheckExpiredItemList();
	void CompleteExpiredItem();
	void AddExpiredItem(bool bSkill, byte DisplayOrder, byte SlotPos, int ItemTID, const struct FBtrDouble& ItemUID);
	void CompleteDurabilityWarningItem();
	void AddDurabilityWarningItemRepairCost(const struct FBtrDouble& UniqueID, int RepairCost);
	void AddDurabilityWarningItem(const struct FBtrDouble& UniqueID, int ItemID, int SlotPos, int PartID, int Durability);
	void LoginToChannel(const string& IP, int Port, int DataPort);
	void ChannelToLogin2(const string& IP, int Port);
	void ChannelToLogin(const string& IP, int Port);
	void ChannelToLogin_OnEventTimer(int Index);
	void UpdateWebzenInvenListEnd(class UBTNetMainMenu* MainMenu);
	void UpdateWebzenInvenList(class UBTNetMainMenu* MainMenu);
	void StopWebzenInvenList();
	bool sfReqWebzenInvenList(const string& StorageType);
	void SetNewMailArrived(bool B);
	void UpdateDurabilityWarningItemList(class UBTNetMainMenu* MainMenu);
	void UpdateExpiredItemList(class UBTNetMainMenu* MainMenu);
	void UpdateRecv_ClanInfo(class UBTNetMainMenu* MainMenu);
	void delegateCheckNat();
};


// Class GUIWarfare.BTNetGUIPageHK
// 0x01B4 (0x066C - 0x04B8)
class UBTNetGUIPageHK : public UBTNetGUIPage
{
public:
	class UwMatchMaker*                                MM;                                                       // 0x04B8(0x0004)
	class UwGameManager*                               GameMgr;                                                  // 0x04BC(0x0004)
	string                                             currentBGM;                                               // 0x04C0(0x000C) (NeedCtorLink)
	struct FFloatBox                                   fbTPTopMenu;                                              // 0x04CC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPTopMenuHK*                              TPTopMenu;                                                // 0x04DC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                SkipTopMenuIndex;                                         // 0x04E0(0x0004)
	bool                                               CloseLastMenu;                                            // 0x04E4(0x0004)
	struct FFloatBox                                   fbLabelRoomName;                                          // 0x04E8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawSourceClipImageHK*               LabelRoomName;                                            // 0x04F8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTitle;                                             // 0x04FC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTitle;                                               // 0x050C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelLeftTopRoll;                                       // 0x0510(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelLeftTopRollSource;                                 // 0x0520(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawSourceClipImageHK*               LabelLeftTopRoll;                                         // 0x0530(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTopLine;                                           // 0x0534(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTopLine;                                             // 0x0544(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelBottomLine;                                        // 0x0548(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTLabelNoticeHK*                            LabelBottomLine;                                          // 0x0558(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelAAS;                                               // 0x055C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPAASHK*                                  LabelAAS;                                                 // 0x056C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bSkipInitializeDefaultPage;                               // 0x0570(0x0004)
	bool                                               bFadeTimeTranslate;                                       // 0x0570(0x0004)
	bool                                               bUseTranslate;                                            // 0x0570(0x0004)
	bool                                               bCallFadeIn;                                              // 0x0570(0x0004)
	bool                                               bFading;                                                  // 0x0570(0x0004)
	bool                                               bClosing;                                                 // 0x0570(0x0004)
	float                                              FadeTime;                                                 // 0x0574(0x0004)
	float                                              CurFadeTime;                                              // 0x0578(0x0004)
	byte                                               CurFade;                                                  // 0x057C(0x0001)
	byte                                               DesiredFade;                                              // 0x057D(0x0001)
	byte                                               StartFade;                                                // 0x057E(0x0001)
	byte                                               Padding00[0x1];                                           // 0x057F(0x0001) MISSED OFFSET
	struct FFloatBox                                   fbNewBackground;                                          // 0x0580(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         NewBackground;                                            // 0x0590(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         WeaponListBg;                                             // 0x0594(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbWeaponListBg;                                           // 0x0598(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strWeaponList[0x6];                                       // 0x05A8(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*[]               WeaponeTypeBtnList;                                       // 0x05F0(0x000C) (NeedCtorLink)
	bool                                               bShowWeaponeTypeList;                                     // 0x05FC(0x0004)
	class UBTOwnerDrawImageHK*                         SkillListBg;                                              // 0x0600(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbSkillListBg;                                            // 0x0604(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strSkillList[0x6];                                        // 0x0614(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*[]               SkillTypeBtnList;                                         // 0x065C(0x000C) (NeedCtorLink)
	bool                                               bShowSkillTypeList;                                       // 0x0668(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTNetGUIPageHK");
		return ptr;
	}


	bool BTWindowJoinClan_OK(class UGUIComponent* Sender);
	bool BTWindowInviteClan_OnOK(class UGUIComponent* Sender);
	bool BTWindowCreateClanHK_OnOK(class UGUIComponent* Sender);
	bool BTWindowCreateClanNeedPointHK_OnClick(class UGUIComponent* Sender);
	bool ClanMenu_ButtonCreateClan_OnClick(class UGUIComponent* Sender);
	bool BTWindowFindClanHK_OnInfo(class UGUIComponent* Sender);
	bool BTWindowFindClanHK_OnRequestJoin(class UGUIComponent* Sender);
	bool ClanMenu_ButtonFindClan_OnClick(class UGUIComponent* Sender);
	bool ClanMenu_ButtonLookingForClan_OnClick(class UGUIComponent* Sender);
	bool IsOpenPopupMenu();
	void SetVisibleSkillTypeBtnList(bool bVisible, bool bFocus);
	void SetVisibleWeaponeTypeBtnList(bool bVisible, bool bFocus);
	void Default_FadedOut();
	void FadeOut(bool bTranslate, bool bChangeAlpha);
	void FadeIn(bool bTranslate, bool bChangeAlpha);
	void Internal_OnRendered(class UCanvas* C);
	bool Internal_OnPreDraw(class UCanvas* C);
	class UBTOwnerDrawCaptionButtonHK* NewButtonComponent(const struct FFloatBox& fbNewCompo, float RenderWeight);
	class UBTOwnerDrawImageHK* NewLabelComponent(const struct FFloatBox& fbNewCompo, const struct FImage& bgImg, float RenderWeight);
	void ExitGame();
	void OpenTodayResultPage();
	bool BTWIndowTodayResultHK_OnOK(class UGUIComponent* Sender);
	bool SkillListClick(class UGUIComponent* Sender);
	bool WeaponListClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void LabelAAS_OnNextAAS(const string& NextAAS);
	void LabelBottomLine_OnNextNotice(const string& NextNotice);
	bool ButtonTest_OnClick(class UGUIComponent* Sender);
	void InitializeDefaultPage();
	void SetDefaultWeapon(int SlotIndex);
	void RefreshPage();
	void Opened(class UGUIComponent* Sender);
	bool HeaderButton_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfare.BTNetQuestInfoPageHK
// 0x0000 (0x066C - 0x066C)
class UBTNetQuestInfoPageHK : public UBTNetGUIPageHK
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTNetQuestInfoPageHK");
		return ptr;
	}


	bool TPTopMenu_Quest_OnClick(class UGUIComponent* Sender);
	void NotifyDailyQuestReset();
	void InternalOnOpen();
	void InternalOnReOpen();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfare.BTPageRoomLobby
// 0x02C8 (0x0934 - 0x066C)
class UBTPageRoomLobby : public UBTNetQuestInfoPageHK
{
public:
	int                                                OutofSeatTime;                                            // 0x066C(0x0004)
	int                                                OwnerOutofSeatTime;                                       // 0x0670(0x0004)
	float                                              LastKeySleepTime;                                         // 0x0674(0x0004)
	bool                                               bAllReady;                                                // 0x0678(0x0004)
	int                                                PrevGameMode;                                             // 0x067C(0x0004)
	bool                                               bPrevTeamBalance;                                         // 0x0680(0x0004)
	string                                             strTeamBalance[0x3];                                      // 0x0684(0x000C) (Localized, NeedCtorLink)
	string                                             strBotModeWarn[0x2];                                      // 0x06A8(0x000C) (Localized, NeedCtorLink)
	string                                             strNoviceMode;                                            // 0x06C0(0x000C) (Localized, NeedCtorLink)
	string                                             strBotMode;                                               // 0x06CC(0x000C) (Localized, NeedCtorLink)
	float                                              TimeAutoStart;                                            // 0x06D8(0x0004)
	float                                              TPMessenger_ACLMsg0_OnHitBottom_LastTime;                 // 0x06DC(0x0004)
	bool                                               bGoToClanPage;                                            // 0x06E0(0x0004)
	float                                              LastRefreshTime[0x2];                                     // 0x06E4(0x0004)
	float                                              RefreshCycleTime[0x2];                                    // 0x06EC(0x0004)
	class UBTRefreshTime*                              rfFriendPosTime;                                          // 0x06F4(0x0004)
	int                                                TotalChannelUserCount;                                    // 0x06F8(0x0004)
	int                                                CurrentRoomState;                                         // 0x06FC(0x0004)
	bool                                               bJoinClanState;                                           // 0x0700(0x0004)
	bool                                               bClanInviteState;                                         // 0x0700(0x0004)
	bool                                               bSafeLeaveRoom;                                           // 0x0700(0x0004)
	class UBTOwnerDrawImageHK*                         LabelTeamSelect;                                          // 0x0704(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTeam;                                              // 0x0708(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTeam;                                                // 0x0718(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTeamTopLine;                                       // 0x071C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTeamTopLine;                                         // 0x072C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTeam[0x2];                                        // 0x0730(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTeam[0x2];                                          // 0x0750(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPTeamList[0x2];                                        // 0x0758(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPTeamMemberList*                         TPTeamList[0x2];                                          // 0x0778(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTAutoColumnListDataHK*[]                   UserListDB;                                               // 0x0780(0x000C) (NeedCtorLink)
	class UBTAutoColumnListDataHK*[]                   GMList;                                                   // 0x078C(0x000C) (NeedCtorLink)
	int                                                GMNumAF;                                                  // 0x0798(0x0004)
	int                                                GMNumRSA;                                                 // 0x079C(0x0004)
	struct FFloatBox                                   fbTPChat;                                                 // 0x07A0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPChatHK*                                 TPChat;                                                   // 0x07B0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPMessenger;                                            // 0x07B4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPMessengerHK*                            TPMessenger;                                              // 0x07C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPMyInfo;                                               // 0x07C8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPMyInfoHK*                               TPMyInfo;                                                 // 0x07D8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPRoomInfo;                                             // 0x07DC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPRoomInfoHK*                             TPRoomInfo;                                               // 0x07EC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strButtonStart[0x3];                                      // 0x07F0(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonStart;                                            // 0x0814(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonStart;                                              // 0x0824(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTemp;                                             // 0x0828(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTemp;                                               // 0x0838(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UwMatchMaker*                                MatchMaker;                                               // 0x083C(0x0004) (Transient)
	struct FGameModeInfo[]                             GameModes;                                                // 0x0840(0x000C) (NeedCtorLink)
	bool                                               bReadyToGame;                                             // 0x084C(0x0004)
	bool                                               bNoInitialRoomInfo;                                       // 0x084C(0x0004)
	bool                                               bShowHostWarning;                                         // 0x084C(0x0004)
	string                                             strExpiredItem;                                           // 0x0850(0x000C) (Localized, NeedCtorLink)
	string                                             CannotChangeHostTitle;                                    // 0x085C(0x000C) (Localized, NeedCtorLink)
	string                                             CannotChangeHostMessage;                                  // 0x0868(0x000C) (Localized, NeedCtorLink)
	string                                             WaitingMessage;                                           // 0x0874(0x000C) (Localized, NeedCtorLink)
	string                                             MessageNewHost;                                           // 0x0880(0x000C) (Localized, NeedCtorLink)
	string                                             MessageNewGuestPre;                                       // 0x088C(0x000C) (Localized, NeedCtorLink)
	string                                             MessageNewGuestPost;                                      // 0x0898(0x000C) (Localized, NeedCtorLink)
	string                                             MessageHostChangeEnable[0x2];                             // 0x08A4(0x000C) (Localized, NeedCtorLink)
	string                                             strLowHostScoreWarning[0x2];                              // 0x08BC(0x000C) (Localized, NeedCtorLink)
	int                                                NewOwnerID;                                               // 0x08D4(0x0004)
	int                                                MinHostPoint;                                             // 0x08D8(0x0004)
	int                                                MinWaringHostPoint;                                       // 0x08DC(0x0004)
	int                                                MaxWaringHostPoint;                                       // 0x08E0(0x0004)
	float                                              SendPingIntervalTime;                                     // 0x08E4(0x0004)
	E_MyAction                                         MyAction;                                                 // 0x08E8(0x0001)
	byte                                               Padding00[0x3];                                           // 0x08E9(0x0003) MISSED OFFSET
	class UBTLabelTutorialQuestInfoHK*                 LabelPopupTutorial;                                       // 0x08EC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int[]                                              ReceivedPingID;                                           // 0x08F0(0x000C) (NeedCtorLink)
	int[]                                              ReceivedPingValue;                                        // 0x08FC(0x000C) (NeedCtorLink)
	string[]                                           DelFriendsList;                                           // 0x0908(0x000C) (NeedCtorLink)
	struct FFloatBox                                   fbBGDeco;                                                 // 0x0914(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         BGDeco;                                                   // 0x0924(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 MyInfoBtn;                                                // 0x0928(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FScriptDelegate                             __CurrentButtonClickBehavior__Delegate;                   // 0x092C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageRoomLobby");
		return ptr;
	}


	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(int[] ItemID);
	bool rfAckShopItemListStart(int Count);
	bool rfAckUseItemDuringGame(int ErrorCode, const string& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, int RemainCount);
	bool CheckEnterRoom_InClanChannel(const string& szClanName);
	class UBTAutoColumnListDataHK* MakeTeamMemberData(int UID, int ClanMark, int ClanBG, int ClanBL, int Level, const string& NickName, const string& ClanName, int Status, int Host, int Ping, const string& UserIP, byte LookingFor, int ClanLevel, int LevelMarkID, int TitleMarkID, int TeamNum, int Reserved2, int Reserved3, bool bMe, bool bisGM);
	void SaveUserData(class UBTAutoColumnListDataHK* Item);
	bool rfNotifyClanLevelup(const string& ClanName, int Levelup);
	bool rfNotifyNewClanName(const string& New_NickName);
	bool rfNotifyNewNickName(int Community_Type, const string& Old_NickName, const string& New_NickName);
	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, string[] CharName, int[] CharLevel, string[] ClanName, int[] ClanMarkPattern, int[] ClanMarkBG, int[] ClanMarkBL, int[] Ranking_Accum, int[] Ranking_Accum_Prev, int[] Ranking_Accum_Exp, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount);
	bool rfAckFriendPosition(int Result, const string& TargetCharName, byte ServerType, const string& fServername, const string& fServerShortName, const string& fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, const string& ChannelNickName, int GameRoomNum);
	bool rfAckNotifyUpdateCharInfo_LevelMark(const string& CharName, int LevelMarkID);
	bool rfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel);
	bool rfReqInGameRoomUserInfoChanged();
	bool rfAckNotifyAdjustClanMemberGrade(const string& ClanName, const string& CharName, byte CharGrade);
	void UserPingRefresh();
	void SendPingToAll();
	void sfReqRoomUserPingInfo();
	void OnReceivedPing(class UwMatchMaker* MM, const string& fromAddr, int msec);
	bool rfAckRoomUserPingInfo(int[] UnqueID, int[] Ping, int HostScore);
	bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, const string& NewRoomTitle);
	bool rfAckCheckEquipedWeaponDurability(int Result, struct FBtrDouble[] ItemUniqueID, int[] ItemSlotNum);
	bool ButtonTemp_OnClick(class UGUIComponent* Sender);
	bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, int[] AFBotID, int[] RSABotID);
	bool rfAckAutoChangedTeamUserList(int[] UserID, int[] TeamNum);
	int FindTeamNumInArray(int[] UserID, int[] TeamNum, int FindUserID);
	bool rfReqRecvForceFailedClientLoading(int ErrCode);
	bool rfAckStartHolePunching(int Result, const string& ErrMsg, int GameType, int ReqStartUserID);
	bool rfAckRegisterMyUdpInfo(int Result, const string& ErrMsg);
	bool rfAckNotifyMyCharInfoToRoomUser(int Result, const string& ErrMsg, int UID, const string& UserName, int Grade, int TeamNum, byte Statue, byte IsHost, const string& UserIP, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, byte IsLookFor);
	bool rfReqNotifyDisconnectHostInLoading(int Result, const string& ErrMsg, int HostID);
	bool rfReqRecvDeleteFriend(int Result, const string& FromCharName);
	bool rfAckDeleteFriend(int Result, string[] FailedCharname);
	bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, int[] UID, string[] CharName, int[] UserLevel, string[] ClanName, int[] ClanPattern, int[] ClanBG, int[] ClanBL, byte[] IsLookForClan, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckChatWispher(int Result, const string& ErrMsg, const string& ToCharName);
	bool rfAckAcquirePromotionItems(int UID, int Result, const string& ErrMsg, struct FBtrDouble[] ItemUniqueID, int[] ItemIDs, int[] PartIDs);
	bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, int[] ItemID, int[] PartID);
	bool rfAckRecvJoinClanResult(int Result, const string& ErrMsg);
	bool rfAckJoinClanResult(const string& CharName, byte Permit, const string& PermitCharName);
	bool BTWindowRequestApprovalClanHK_OnSuspend(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnOK(class UGUIComponent* Sender);
	bool rfReqRecvJoinClan(int UserIdx, const string& CharName, const string& Message);
	bool rfAckNotifyClanSecession(const string& ClanName, const string& CharName);
	bool rfAckNotifyNewClanMember(const string& ClanName, const string& CharName);
	bool rfAckSearchClan(int Result, const string& ErrMsg, int TotalPage, int[] ClanMarkPattern, int[] ClanMarkBG, byte[] ClanMarkBL, string[] ClanName, string[] ClanMaster, int[] ClanMember, int[] ClanMemberMax, int[] ClanCreateDate, int[] ClanWin, int[] ClanLose, int[] ClanDraw, int[] ClanRank, byte[] ClanRecruit, int[] ClanLevel);
	bool rfAckRecvClanInviteResult(int Result, const string& ErrMsg);
	bool IsGameReadyOrPlaying();
	bool rfAckInviteClanResult(const string& CharName, byte Permit, const string& ClanNm);
	bool BTWindowDefineSelectHK_23_OnOK(class UGUIComponent* Sender);
	bool rfReqRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& ClanName, const string& InviteMsg);
	bool rfAckJoinClan(int Result, const string& ErrMsg, const string& SpecificCharName, const string& RealRecvCharName, byte RealRecvCharClanGrade);
	bool rfAckInviteClan(int Result, const string& ErrMsg);
	void UpdateRecv_ClanInfo(class UBTNetMainMenu* MainMenu);
	bool BTWindowUserPersonalInfo_OnClanInfo(class UGUIComponent* Sender);
	bool BTWindowUserDetailInfoHK_OnClanInfo(class UGUIComponent* Sender);
	bool rfReqClanCharPersonelIntro(const string& ClanName, const string& CharName);
	bool rfAckClanCharPersonelIntro(int Result, const string& ErrMsg, const string& PersonelIntro);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfAckDBCharInfo(int Result, const string& ErrMsg, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool MoveToClanPage_OnOK(class UGUIComponent* Sender);
	bool rfAckCreateClan(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckDupCheckClanName(int Result, const string& ErrMsg);
	bool rfAckGetIsHostBlocking(int Result, byte Blocking);
	bool rfAckNotifyHostBlocking(int Result, byte Blocking);
	bool rfAckGetHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, int[] FailedUserIDs);
	bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint);
	bool BTWindowChangeHost_OnCancel(class UGUIComponent* Sender);
	bool BTWindowChangeHost_OnOK(class UGUIComponent* Sender);
	bool rfReqRecvForceDisconnectUDPFromHost(int Result);
	bool rfAckForceDisconnectUDPFromHost(int Result);
	bool rfReqNotifyChangeRoomState(byte RoomState);
	bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, const string& ErrMsg);
	void TPTeamList_OnPopupCheck(class UBTACLTeamMemberListHK* acl, class UBTCMTeamMemberListHK* cm);
	void TPTeamList_OnPopup(int ContextMenuIndex, class UBTACLTeamMemberListHK* acl);
	void OnPopupBan(int ContextMenuIndex, class UBTACLMessengerBanHK* acl);
	void OnPopupBanCheck(class UBTACLMessengerBanHK* acl, class UBTCMMessengerBanHK* cm);
	void OnPopupPCBang(int ContextMenuIndex, class UBTACLMessengerPCBangHK* acl);
	void OnPopupPCBangCheck(class UBTACLMessengerPCBangHK* acl, class UBTCMMessengerPCBangHK* cm);
	void OnPopupClan(int ContextMenuIndex, class UBTACLMessengerClanHK* acl);
	void OnPopupClanCheck(class UBTACLMessengerClanHK* acl, class UBTCMMessengerClanHK* cm);
	void OnPopupFriend(int ContextMenuIndex, class UBTACLMessengerFriendHK* acl);
	void OnPopupFriendCheck(class UBTACLMessengerFriendHK* acl, class UBTCMMessengerFriendHK* cm);
	void OnPopupChannel(int ContextMenuIndex, class UBTACLMessengerChannelHK* acl);
	void OnPopupChannelCheck(class UBTACLMessengerChannelHK* acl, class UBTCMMessengerChannelHK* cm);
	bool rfReqCompleteFriendInvite(const string& CharnameToBeInvited, byte IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const string& ErrMsg);
	bool rfReqRecvFriendInvite(int ReqUserID, const string& ReqCharname, const string& InviteMsg);
	bool WindowRequestFriend_OnCancel(class UGUIComponent* Sender);
	bool WindowRequestFriend_OnOK(class UGUIComponent* Sender);
	bool rfAckSendFriendInvite(int Result, const string& ErrMsg);
	bool rfAckRoomUserList(int[] UID, string[] UserName, int[] Grade, int[] TeamNum, byte[] Statue, byte[] IsHost, string[] UserIP, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, byte[] IsLookingFor, int[] GMUID, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	void RefreshUserList();
	void RemoveInUserList(int UID);
	bool Exit_OnOK(class UGUIComponent* Sender);
	bool rfAckProcessPreLoginUser(int Result, const string& ErrMsg);
	bool rfAckLoginInHouseTest(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg, const string& BDay, byte Sex, const struct FBtrDouble& ServerTime);
	void TcpLogin_OnConnect(int ErrCode);
	void RoomLobbyToServerSelection();
	bool RoomLobbyToServerSelection_OnOK(class UGUIComponent* Sender);
	bool rfAckEnterChannel(int id, int UID, const string& UserID, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckChangeRoomSetting(int Result, const string& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfAckChangeUserState(int Result, const string& ErrMsg, int[] UserIDs, byte[] Positions, int[] Numbers, byte[] OldStates, byte[] NewStates);
	bool rfAckNotifyLoadingState(int Result, int UserID, byte LoadingState);
	bool rfAckFailedStartGame(int Result, const string& ErrMsg, byte IsHost, int FailedUserID, int LoadingStep);
	bool rfAckSuccessStartGame(int Result, const string& ErrMsg, byte IsHost, const string& HostIP, int HostPort, int LoadingStep);
	bool rfReqRelayServerOff();
	bool rfAckUpdateWeaponDurability(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int[] Durability, byte[] IsDestroy, struct FBtrDouble[] FailedWeaponUniqueID);
	bool rfAckEntryQSlotUniqueIDList(int UserNum, byte[] QSlotDispOrder, struct FBtrDouble[] MWUniqueID, struct FBtrDouble[] PistolUniqueID, struct FBtrDouble[] TW1UniqueID, struct FBtrDouble[] TW2UniqueID, struct FBtrDouble[] KnifeUniqueID);
	bool rfAckEntryQSlotIDList(int UserNum, byte[] QSlotDispOrder, int[] MWItemID, int[] MWPartID, int[] MWPaintID, int[] PistolItemID, int[] PistolPartID, int[] PistolPaintID, int[] TWItemID1, int[] TWItemID2, int[] Skill1ID, int[] Skill2ID, int[] Skill3ID, int[] Skill4ID, int[] KWItemID);
	bool rfAckChangeNewGuest(const string& HostIP);
	bool rfAckChangeHost(byte ClientNum);
	bool rfAckGetBootyChoose(int Result, const string& ErrMsg, byte GiveType, const struct FBtrDouble& ItemUniqueNumber, int ItemID, int PartID, byte ItemType, const struct FBtrDouble& UntilTime, int StackCount, int PaintID);
	bool rfAckEntrySkillList(int[] UserIDs, int[] SkillIDs, int[] SlotPositions, int Result, const string& ErrMsg);
	bool rfAckGetBooty(int Result, const string& ErrMsg, int[] PrizeWinUserID, int[] BootyItemID, int[] BootyPartsID);
	bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, const string& ErrMsg);
	bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, const string& ErrMsg);
	bool rfAckEntryItemList(int[] UserIDs, int[] ItemIDs, int[] SlotPositions, int[] AddPartsID, struct FBtrDouble[] UniqueID, int[] PaintID, int Result, const string& ErrMsg);
	bool rfAckAIRewardResult(byte ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, int[] ScoreRewardUserID, byte[] ScoreRewardTYPE, int[] ScoreRewardID, int[] ScoreRewardCount);
	bool rfAckUpdateScore(int[] UserIDs, string[] NickNames, byte[] TeamIDs, int[] Scores, int[] Kills, int[] Assists, int[] Deaths, int[] EXPs, int[] EXPBonuses, int[] Points, int[] PointBonuses, int[] TeamScores, int[] BonusOwnerID, int[] BonusID);
	bool rfAckConnectGame(int UserID, int Result);
	bool rfAckChangeTeam(int GameNumber, const string& UserID, int UID, int TeamNum, int Result, const string& ErrMsg);
	bool rfAckLeaveRoom(int Num, int UID, const string& UserID, int Result, const string& ErrMsg);
	bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, const string& UserID, int TeamNum, int Grade, const string& UserIP, const string& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckGameOverEnd(int Result, const string& ErrMsg);
	bool rfAckGameOver(int UID, int GameRoomNumber, int Result, const string& ErrMsg);
	bool rfAckDisconnectGame(int Result, int DisconnectUserID, const string& DisconnectUserName);
	bool rfAckRegisterOtherUdpInfo(int UID, const string& IP, int Port, byte NatType, byte Intervention, const string& HostInnerIP, int HostInnerPort);
	bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, const string& ErrMsg);
	bool rfAckChangeGameMode(int GameNum, int UID, const string& GameMode, byte GameModeNum, int Result, const string& ErrMsg);
	bool rfAckSelectMap(int GameNum, int UID, const string& MapName, int Result, const string& ErrMsg);
	bool rfAckGameRoomInfo(int Result, const string& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfAckIsGameRoomPlaying(int GameRoomNum, byte IsPlaying);
	bool rfAckGameHostInfo(int GameNumber, const string& UserID, const string& IP, int Port, int Result, const string& ErrMsg);
	void TeamChatLog(const string& cL);
	void BroadCastItemChatLog(const string& cL);
	void SystemChatLog(const string& cL);
	void SelfChatLog(const string& cL);
	void WhisperChatLog(const string& cL);
	void ClanChatLog(const string& cL);
	void NormalChatLog(const string& cL);
	void ClearChatLog();
	void SetMatchBGM();
	void GameOver();
	void StartGame(const string& IP, int Port);
	bool IsUserAllReady();
	int GetReadyAllUserCount();
	int GetUserCount();
	bool IsUserCountFull();
	void UpdateRoomInfoByMatchMaker();
	string FindFriendlyGameModeByIndex(int GameModeIndex);
	string FindFriendlyGameMode(const string& GameMode);
	void InitialRoomInfo();
	class UBTConsole* GetConsole();
	class UBTTcpLink_Login* GetTcpLogin();
	class UBTTcpLink_Channel* GetTcpChannel();
	bool internalKeyEvent(float Delta, byte* key, byte* Action);
	void InternalOnClose(bool bCanceled);
	void SetCharacterInfo(const string& ClanName, const struct FCharInfo& btCharInfo);
	void QuestLog(const string& Msg);
	void RefreshPage();
	void UnInitializeDelegate();
	void InitializeDelegate();
	void UpdateDurabilityWarningItemList(class UBTNetMainMenu* MainMenu);
	void UpdateExpiredItemList(class UBTNetMainMenu* MainMenu);
	void UpdateWebzenItemList(class UwGameManager* GameMgr);
	void UpdateItemList(class UwGameManager* GameMgr);
	void UpdateBlockList(class UwMatchMaker* MM);
	void SetFriendlyUser(class UBTAutoColumnListDataHK* ACLData, int UserListIdx);
	void UpdateFriendlyUser(int UserListIdx);
	void UpdatePCBangList(class UwMatchMaker* MM);
	void UpdateClanList(class UwMatchMaker* MM);
	void UpdateFriendList(class UwMatchMaker* MM);
	void UpdateGameRoomInfo(class UwMatchMaker* MM);
	void UpdateRecv_CharInfo(class UwMatchMaker* MM);
	void UpdateQuestList(class UwMatchMaker* MM);
	void UpdatePositionInfo(class UwMatchMaker* MM);
	void UpdatePCBangInfo(class UwMatchMaker* MM);
	void UpdateEquipItemInfo(class UwMatchMaker* MM);
	void UpdateRankingInfo(class UwMatchMaker* MM);
	void UpdateMoneyInfo(class UwMatchMaker* MM);
	void UpdateClanInfo(class UwMatchMaker* MM);
	void UpdateCharInfo(class UwMatchMaker* MM);
	void OnCompleteOpened();
	void OnBackToLastPage();
	void InternalOnOpen();
	void InternalOnReOpen();
	void CloseNetworkCheckingWindow(bool bNotInitial);
	void OpenNetworkCheckingWindow();
	void FailedNetworkChecking(const string& ErrMsg, int Code);
	void StartNetworkChecking(int ClientsCount, bool bConnectGame);
	bool ButtonStart_OnKeyEvent(float Delta, byte* key, byte* Action);
	void MessageHostUnsuitableness();
	void SendPingAndSendHostPoint();
	bool InternalOnPreDraw(class UCanvas* C);
	bool TPMessenger_ButtonMsg_OnClick(class UGUIComponent* Sender);
	void TPMessenger_ACLMsg0_OnHitBottom(int Top, int Count, int itemperpage);
	bool MyInfo_OnClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InitializeTeamList();
	bool HeaderButton_OnClick(class UGUIComponent* Sender);
	void ChangeButtonStart();
	bool ChangeButtonTeam(int Team);
	void UpdateRoomOwner(int UID);
	bool CheckInviteUser(int CurPos, int CurState, const string& szNickName, const string& szClanName);
	bool CanInviteUser();
	bool ButtonTeam_OnClick(class UGUIComponent* Sender);
	bool ButtonReady_OnClick(class UGUIComponent* Sender);
	bool ButtonStart_OnClick(class UGUIComponent* Sender);
	bool ButtonStart_OnClick_Before_CheckDurability(class UGUIComponent* Sender);
	bool CurrentButtonClickBehavior(class UGUIComponent* Sender);
	bool CheckGameModeStartCondition();
	bool CheckCanUseWeapon();
	bool CheckPrimaryWeaponDurability();
	bool GotoStartGame_OnOK(class UGUIComponent* Sender);
	bool GotoInventory_OnOK(class UGUIComponent* Sender);
	bool ButtonRoomInfo_OnClick(class UGUIComponent* Sender);
	bool BTWindowJoinClan_OK(class UGUIComponent* Sender);
	bool BTWindowInviteClan_OnOK(class UGUIComponent* Sender);
	bool WindowInviteFriend_OnOK(class UGUIComponent* Sender);
	bool BTWindowRoomInfoHK_OnOK(class UGUIComponent* Sender);
};


// Class GUIWarfare.BTTcpHandler
// 0x0094 (0x00C0 - 0x002C)
class UBTTcpHandler : public UBTTcpLink_Channel
{
public:
	class UBTNetMainMenu*                              MainMenu;                                                 // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                i;                                                        // 0x0030(0x0004)
	class UBTTcpHandlerMed*                            RealOne;                                                  // 0x0034(0x0004)
	string                                             DisconnectedFromServerMsg;                                // 0x0038(0x000C) (Localized, NeedCtorLink)
	string                                             DisconnectedFromServerQuit;                               // 0x0044(0x000C) (Localized, NeedCtorLink)
	class UwMatchMaker*                                MM;                                                       // 0x0050(0x0004)
	class UwGameManager*                               GameMgr;                                                  // 0x0054(0x0004)
	bool                                               bTutorial;                                                // 0x0058(0x0004)
	bool                                               bTutorialEnteringRoom;                                    // 0x0058(0x0004)
	struct FGameRoomInfo                               TutorialRoomInfo;                                         // 0x005C(0x0064) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTTcpHandler");
		return ptr;
	}


	bool rfReqAddSpecialRank(const string& NickName);
	bool rfNotifyPcBangInfo(byte PcBang_Grade);
	bool rfAckExpandSlotConfirm(int Result, const string& ErrMsg, int QSlotID, const struct FBtrDouble& MWItemID, const struct FBtrDouble& PistolItemID, const struct FBtrDouble& TWItemID1, const struct FBtrDouble& TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4, const struct FBtrDouble& KnifeItemID);
	bool rfAckUpdateQSlot_2(int Result, const string& ErrMsg, byte[] DisplayOrder, int[] ItemTID, struct FBtrDouble[] ItemUID, byte[] SlotPos_Key, byte[] SlotPos_Value);
	bool rfAckPcBangItemList(int[] ItemTID, int[] PartID);
	bool rfAckCharDetailInfoWithClan(int ErrorCode, const string& CharName, int Exp, int Level, int LevelMarkID, int PreMonthlyRanking, int MonthlyRanking, int Win, int Lose, int Kill, int Death, int Assist, int KillCountByAimShooting, int HeadShot2, int TotPlayTime, int DisCon, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, int DispHeadItem, int DispFaceItem, int DispBackpack, int DispPouch, int DispCamouflage, const string& ClanName, int ClanLevel, int CM_Pattern, int CM_BG, int CM_BL, int ClanExp, byte ClanGrade, int ClanActivity, int MonthlyConnectingCount, int UserClanWin, int UserClanLose, int UserClanDraw, int ClanWin, int ClanLose, int ClanDraw, int PreClanTotalRankCur, int ClanTotalRankCur, int PreClanMonthlyRankCur, int ClanMonthlyRankCur, int PreClanMonthlyConnectingRank, int ClanMonthlyConnectingRank, const string& ClanIntro);
	bool rfAckUseItemDuringGame(int ErrorCode, const string& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, int RemainCount);
	bool rfReqAhnNotifyDisconnct(int Code);
	bool rfReqAhnHsObject(byte[] Data, int DataSize);
	bool rfAckSetCommunityOption(int Result, const string& ErrStr);
	bool rfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite);
	bool rfChangeItemInstanceInfo(int ErrorCode, int ItemID, const struct FBtrDouble& ItemUniqueID, byte ChangeCount, int RemainCount);
	bool rfAckLuckShop_RewardCoupon(int ErrorCode, int Coupon_ItemTypeID, const struct FBtrDouble& Coupon_ItemUniqueID, int Coupon_Count_AfterReduction);
	bool rfAckLuckShop_RewardBuyingCount(int ErrorCode, int FinalCapsuleRewardState);
	bool rfAckLuckShop_StorageInfo(int ErrorCode, int BuyingCapsuleCount, int CapsuleRewardState);
	bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, byte IsNotification, string[] NickName, struct FBtrDouble[] Time, int GetItemID);
	bool rfNotifyCouponUseError(int Time);
	bool rfReqNotifyShopItemDataEnd(int Ver);
	bool rfAckCouponUse(int Result, const string& ErrMsg);
	bool rfReqNotifyShopPackageItemData(int PackageProductNo, int[] ProductCode, int[] ProductQuantity, int[] ProductHour, const string& Description);
	bool rfReqNotifyShopItemData(int[] ProductNo, string[] ProductName, int[] ProductCode, byte[] SaleType, int[] ProductCost, int[] ProductHour, int[] ProductQuantity, int[] SaleMasterFlag, int[] SaleStatus, int[] IsGift, struct FBtrDouble[] SaleEndTime, int[] Discountcost);
	bool rfAckShopItemData();
	bool rfNotifyClanLevelup(const string& ClanName, int Levelup);
	bool rfNotifyNewClanName(const string& New_NickName);
	bool rfNotifyNewNickName(int Community_Type, const string& Old_NickName, const string& New_NickName);
	bool rfAckTencent_StartTenProtect(int CharDBID);
	bool rfAckMoveToLobby(byte MessageType);
	bool rfAckPopUpMessage(int MessageType);
	bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckFriendPosition(int Result, const string& TargetCharName, byte ServerType, const string& fServername, const string& fServerShortName, const string& fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, const string& ChannelNickName, int GameRoomNum);
	bool rfAckLogOut(byte Result, byte Reason);
	bool rfAckNotifyUpdateCharInfo_LevelMark(const string& CharName, int LevelMarkID);
	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, string[] CharName, int[] CharLevel, string[] ClanName, int[] ClanMarkPattern, int[] ClanMarkBG, int[] ClanMarkBL, int[] Ranking_Accum, int[] Ranking_Accum_Prev, int[] Ranking_Accum_Exp, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel);
	bool rfAckClanMatchResultHistory(struct FBtrDouble[] MatchDate, byte[] IsWin, string[] EnemyClanname);
	bool rfReqInGameRoomUserInfoChanged();
	bool rfAckServerType(byte Type);
	bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, const string& ErrMsg, int[] MapNumArray, int VersusMode, byte IsPublic);
	bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, const string& RoomName, int MapNum, int CurUserCount, int MaxUserCount, byte Status, byte IsPublic);
	bool rfAckClanMatch_EndPublicWaitRoomList();
	bool rfAckClanMatch_PublicWaitRoomList(int[] WaitRoomIdx, string[] LeaderName, string[] RoomName, int[] MapNum, int[] CurUserCount, int[] MaxUserCount, byte[] Status);
	bool rfAckClanMatch_StartPublicWaitRoomList(int Result, const string& ErrMsg, int Count);
	bool rfAckPaidItem_NotifyChangeClanname(const string& NewClanname);
	bool rfAckPaidItem_ChangeClanname(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const string& NewClanname);
	bool rfAckPaidItem_ChangeCharname(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const string& NewCharname);
	bool rfAckNotifyEndTutorial(int UserID, const string& CharName, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckNotifyStartTutorial(int Result, int UserID);
	bool rfAckGetMyMailBoxState(int Result, byte IsFull, int NewMailCount);
	bool rfAckRoomUserPingInfo(int[] UnqueID, int[] Ping, int HostPriorityPoint);
	bool rfAckSetLookForClan(int Result, const string& ErrMsg, byte IsLookingFor);
	bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, const string& NewRoomTitle);
	bool rfAckRecvSystemMsg(byte CommunityType, const struct FSystemMsgParam& MsgInfo);
	bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID);
	bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID);
	bool rfAckForceDisconnectUser_GM(int Result, const string& ErrMsg, const string& CharName);
	bool rfAckNotice_GM(int Result, const string& ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const string& Msg);
	bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, const string& NewRoomTitle);
	bool rfReqExteriorRoomOwnerInfo(int RoomNum, const string& OwnerName, const string& OwnerIP);
	bool rfAckCharBlockInfo(int Result, const struct FBtrDouble& ChatBlockStartTime, const struct FBtrDouble& ChatBlockEndTime, struct FBtrDouble[] BlockedItemIdx);
	bool rfAckQuestGetAvailableEventList(int Result, const string& ErrMsg, int[] QuestID);
	bool rfAckPaidItem_NotifyChangeClanMark(const string& ClanName, int Pattern, int BG, int BL);
	bool rfAckPaidItem_ChangeClanMark(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_ClanMarkDupCheck(int Result, const string& ErrMsg);
	bool rfAckWebzenBillingUseStorageItem(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID, const struct FBtrDouble& ItemExtra);
	bool rfAckPaidItem_RelayBroadcast(const string& CharName, const string& Msg);
	bool rfAckPaidItem_BroadCast(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_EraseRecord(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int Command, int RemainCount);
	bool rfAckWebzenBillingStorageListEnd();
	bool rfAckWebzenBillingStorageList(int[] Seq, int[] ItemSeq, int[] GroupCode, int[] ShareFlag, int[] ProductSeq, string[] CashName, struct FBtrDouble[] CashPoint, string[] SendAccountID, string[] SendMessage, byte[] ItemType, byte[] RelationType, int[] ProductType, int[] PriceSeq);
	bool rfAckWebzenBillingStorageListStart(int Result, const string& ErrMsg, int TotalCount, int TotalPage, int CurPage);
	bool rfAckRandomBox_Use(int Result, const string& ErrMsg, const struct FBtrDouble& RandomBoxItemIdx, int RandomBxoItemCount, const struct FBtrDouble& KeyItemIdx, int KeyItemRemainCount, int[] ItemIDChoose, int[] PartIDChoose, int[] PeriodOnChoosenItem, int[] StackCountOnChoosenItem, byte[] bHave, struct FBtrDouble[] ItemIdx, struct FBtrDouble[] UntilTime, int[] StackCount);
	bool rfAckRegisterMainPCBang(int Result, const string& ErrMsg);
	bool rfAckPCBangUserListEnd();
	bool rfAckPCBangUserList(string[] FriendName, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] Level, int[] ClanGrade, int[] ClanWin, int[] ClanLose, byte[] IsLookForClan, byte[] IsCombat, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckPCBangUserListStart(int Result, int TotalCount);
	bool rfAckGiftItemByWebzenCash(int Result, const string& ErrMsg, int LeftProductCount);
	bool rfAckBuyItemByWebzenCash(int Result, const string& ErrMsg);
	bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, const string& ErrMsg, int[] MapNumArray, int VersusMode, const string& WaitRoomName);
	bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, int[] AFBotID, int[] RSABotID);
	bool rfAckRegisteredPCBangInfo(int Result, const string& ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, const string& PCBangName);
	bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckWebzenCash(int Result, const string& ErrMsg, const struct FBtrDouble& PCoinCash, const struct FBtrDouble& CCoinCash);
	bool rfAckCheckEquipedWeaponDurability(int Result, struct FBtrDouble[] ItemUniqueID, int[] ItemSlotNum);
	bool rfReqClanMatch_InviteCrewResult(const string& Invitee, int Result);
	bool rfReqClanMatch_RecvInviteCrew(const string& Inviter, const string& ServerIP, int Port, int WaittingID, const string& Msg, int MapNum, int InviteUserChannelNum, const string& LeaderName, const string& RoomName);
	bool rfAckClanMatch_InviteCrew(int Result, const string& ErrMsg);
	bool rfReqDailyQuestNewAvailable(int[] ExpiredQuestID, int[] NewQuestID);
	bool rfReqQuestNewAvailable(int[] AchivedQuestID, int[] NewQuestID, byte[] IsDailyQuest, int[] ExpiredQuest);
	bool rfAckQuestUpdate(int Result, const string& ErrMsg);
	bool rfAckQuestListEnd();
	bool rfAckSpecialQuestRank(string[] CharList);
	bool rfAckReceiveSpecialReward(int Result, int RewardedQuestID, byte RewardedQuestIsComplete, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount);
	bool rfAckDailyRewardListThisMonth(byte[] Type, byte[] Number, int[] ItemID, int[] ItemCount);
	bool rfAckPuzzleList(int Result, byte IsComplete, byte[] UpdatedNum, byte[] StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfAckAttendanceList(int Result, byte IsComplete, byte UpdatedNum, byte[] StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfAckQuestList(int[] QuestID, int[] CountPrograss, byte[] IsDailyQuest, byte[] IsComplete);
	bool rfAckQuestListStart(int Result, const string& ErrMsg);
	bool rfAckClanMatch_SetWaitRoomPublic(int Result, const string& ErrMsg, byte Set);
	bool rfAckClanMatch_StopSearching();
	bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber);
	bool rfAckClanMatch_FoundMatch();
	bool rfAckClanMatch_NotifyStartSearching(int ShouldWaitMore);
	bool rfAckClanMatch_StartSearching(int Result, const string& ErrMsg, int ShouldWaitMore);
	bool rfAckClanMatch_ChangeLeader(int Result, const string& ErrMsg, int NewLeader, const string& NewLeaderName);
	bool rfAckClanMatch_WaittingTeamList(int TtotlCount, int[] Grade, int[] Map, int[] Versus);
	bool rfAckClanMatch_Chat(int Result, const string& ErrMsg, const string& CharName, const string& Msg);
	bool rfAckClanMatch_Leave(int Result, const string& ErrMsg);
	bool rfAckClanMatch_MemberList(byte[] IsLeader, int[] ClanMarkPA, int[] ClanMarkBG, int[] ClanMarkBL, int[] Level, string[] CharName, int[] ClanGrade, int[] ClanWin, int[] ClanLose, string[] ClanName, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckClanMatch_LeaveNotify(const string& CharName);
	bool rfAckClanMatch_JoinNotify(byte IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, const string& CharName, int ClanGrade, int ClanWin, int ClanLose, const string& ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckClanMatch_Join(int Result, const string& ErrMsg);
	bool rfAckClanMatch_NotifiyStartCombat(int[] MapNumArray, int VersusMode);
	bool rfAckClanMatch_StartCombat(int Result, const string& ErrMsg);
	bool rfAckClanMatch_GetReady(int Result, const string& ErrMsg, int RoomIndex);
	bool rfAckLimitedListInChannel(int Result, int[] LimitedMapID, int[] LimitedModeID);
	bool rfAckRecvInviteGameRoomResult(int Result);
	bool rfReqRecvInviteGameRoom(const string& InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, const string& RoomUniqueID, int RoomNumber, const string& RoomName, byte RoomState, const string& MapName, const string& OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, const string& Password, const string& InviteCharName);
	bool rfAckInviteGameRoom(int Result, byte Answer, const string& GuestCharName);
	bool rfAckAutoChangedTeamUserList(int[] UserID, int[] TeamNum);
	bool rfAckGetItemFromItemBox(int Result, const string& ErrMsg, int ItemIDChoose, int PartIDChoose, const struct FBtrDouble& BoxItemIdx, int BxoItemCount, byte bHave, const struct FBtrDouble& ItemIdx, const struct FBtrDouble& UntilTime, int StackCount);
	bool rfAckItemListInItemBox(int Result, const string& ErrMsg, const struct FBtrDouble& ItemUniqueID, int BoxItemID, int[] ItemID, int[] PartID, byte FromContent);
	bool rfReqRecvForceFailedClientLoading(int ErrCode);
	bool rfAckStartHolePunching(int Result, const string& ErrMsg, int GameType, int ReqStartUserID);
	bool rfAckRegisterMyUdpInfo(int Result, const string& ErrMsg);
	bool rfAckNotifyMyCharInfoToRoomUser(int Result, const string& ErrMsg, int UID, const string& UserName, int Grade, int TeamNum, byte Statue, byte IsHost, const string& UserIP, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, byte IsLookFor);
	bool rfReqNotifyDisconnectHostInLoading(int Result, const string& ErrMsg, int HostID);
	bool rfReqRecvForceDisconnected_FromGM(int Result, const string& ErrMsg);
	bool rfReqRecvNotice_FromGM(int Result, const string& ErrMsg, string[] NoticeMsg, byte IsFromDB);
	bool rfAckJoinClan(int Result, const string& ErrMsg, const string& SpecificCharName, const string& RealRecvCharName, byte RealRecvCharClanGrade);
	bool rfAckExceedMaxUser();
	bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, int[] UID, string[] CharName, int[] UserLevel, string[] ClanName, int[] ClanPattern, int[] ClanBG, int[] ClanBL, byte[] IsLookForClan, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfReqRecvDeleteFriend(int Result, const string& FromCharName);
	bool rfAckDeleteFriend(int Result, string[] FailedCharname);
	bool rfAckChatWispher(int Result, const string& ErrMsg, const string& ToCharName);
	bool rfAckNotifyAdjustClanMemberGrade(const string& ClanName, const string& CharName, byte CharGrade);
	bool rfReqNotifyDurabilityZeroItem(int Result, const string& ErrMsg, int UserID, struct FBtrDouble[] ItemUniqueIDs, int[] ItemIDs, int[] ItemPartIDs, byte[] ItemSlotPos);
	bool rfAckAcquirePromotionItems(int UID, int Result, const string& ErrMsg, struct FBtrDouble[] ItemUniqueID, int[] ItemIDs, int[] PartIDs);
	bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, int[] ItemID, int[] PartID);
	bool rfAckBlockUserList(string[] CharName);
	bool rfAckRemoveBlockUserList(int Result, const string& ErrMsg);
	bool rfAckBlockUserListEnd();
	bool rfAckAddBlockUserList(int Result, const string& ErrMsg);
	bool rfAckBlockUserListStart(int Result, int TotalCount);
	bool rfAckAdjustClanMemberGrade(int Result, const string& ErrMsg, const string& ClanName, const string& CharName, byte CharGrade);
	bool rfReqClanCharPersonelIntro(const string& ClanName, const string& CharName);
	bool rfAckRecvJoinClanResult(int Result, const string& ErrMsg);
	bool rfAckJoinClanResult(const string& ClanName, byte Permit, const string& PermitCharName);
	bool rfAckNotifyClanSecession(const string& ClanName, const string& CharName);
	bool rfAckNotifyNewClanMember(const string& ClanName, const string& CharName);
	bool rfReqRecvJoinClan(int UserIdx, const string& CharName, const string& Message);
	bool rfAckRecvClanInviteResult(int Result, const string& ErrMsg);
	bool rfAckInviteClanResult(const string& CharName, byte Permit, const string& ClanNm);
	bool rfAckInviteClan(int Result, const string& ErrMsg);
	bool rfReqRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& ClanName, const string& InviteMsg);
	bool rfAckGetIsHostBlocking(int Result, byte Blocking);
	bool rfAckNotifyHostBlocking(int Result, byte Blocking);
	bool rfAckGetHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, int[] FailedUserIDs);
	bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint);
	bool rfReqNotifyRelayServerAddr(const string& RelayIP, int RelayPort);
	bool rfReqRecvForceDisconnectUDPFromHost(int Result);
	bool rfAckForceDisconnectUDPFromHost(int Result);
	bool rfReqNotifyChangeRoomState(byte RoomState);
	bool rfAckClanCharPersonelIntro(int Result, const string& ErrMsg, const string& PersonelIntro);
	bool rfAckDBCharInfo(int Result, const string& ErrMsg, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckSearchClan(int Result, const string& ErrMsg, int TotalPage, int[] ClanMarkPattern, int[] ClanMarkBG, byte[] ClanMarkBL, string[] ClanName, string[] ClanMaster, int[] ClanMember, int[] ClanMemberMax, int[] ClanCreateDate, int[] ClanWin, int[] ClanLose, int[] ClanDraw, int[] ClanRank, byte[] ClanRecruit, int[] ClanLevel);
	bool rfAckClanPersonelIntro(int Result, const string& ErrMsg);
	bool rfAckClanChangeInfo(int Result, const string& ErrMsg);
	bool rfAckClanSecession(int Result, const string& ErrMsg);
	bool rfAckClanClose(int Result, const string& ErrMsg, const string& ClanName);
	bool rfAckClanNews(string[] IssueDate, byte[] IssueType, string[] IssuedClanMember);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserList(int Result, const string& ErrMsg, int[] Level, string[] CharName, byte[] ClanGrade, int[] ClanWinCnt, int[] ClanLoseCnt, int[] LevelMarkID, int[] TitleMarkID, int[] DudeId);
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfAckClanInfo(const struct FClanInfo& stClanInfo);
	bool rfAckDupCheckClanName(int Result, const string& ErrMsg);
	bool rfAckCreateClan(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckGetServerTime(const struct FBtrDouble& ServerTime, const string& ClientIP);
	bool rfAckMyMoney(int Result, const string& ErrMsg, int Point, int Cash);
	bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, const string& ErrMsg);
	bool rfAckNotifyExpiredSkillIDs(byte[] DisplayOrder, byte[] SlotPos, int[] ItemTID, struct FBtrDouble[] ItemUID);
	bool rfAckNotifyExpiredItemIDs(byte[] DisplayOrder, byte[] SlotPos, int[] ItemTID, struct FBtrDouble[] ItemUID);
	bool rfAckGetAttachedItemFromMemo(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID);
	bool rfAckDeleteMailAll(int Result, byte MailType, int Count);
	bool rfAckDelMemo(int Result, const string& ErrMsg, int[] FailedMemoID);
	bool rfAckSendMemo(string[] CnamesToFail, int[] ResultArray);
	bool rfAckAuctionBidding(int Result, const string& ErrMsg, int PointRemain);
	bool rfAckAuctionTradeHistory(int Result, const string& ErrMsg, int ItemID, int PartID, string[] SellerCharNm, int[] DamageDegree, int[] Price);
	bool rfAckSendGift(int Result, const string& ErrMsg, int PointRemain, int CashRemain);
	bool rfAckRecvMemo(const string& cnameFrom, byte MemoType);
	bool rfAckReadMemo(const string& cnameFrom, const string& Text, const string& dateRecv, const struct FBtrDouble& ItemUID);
	bool rfAckEndMemoList();
	bool rfAckTestDouble(const struct FBtrDouble& vDouble, struct FBtrDouble[] vDoubles);
	bool rfAckMemoList(int[] MemoIdx, string[] cnameFrom, string[] dateRecv, string[] Text, byte[] Status, int[] UntilExpire, struct FBtrDouble[] ItemUID, int[] ItemID, byte[] MsgType, int[] ItemPartID);
	bool rfAckStartMemoList(int Result, const string& ErrMsg, byte Type, int TotalCount);
	bool rfAckFriendListEnd();
	bool rfAckFriendList(string[] FriendName, byte[] IsLogOn, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] LevelMarkID, int[] ClanLevel, int[] Level, byte[] IsLookForClan);
	bool rfAckFriendListStart(int Result, int TotalCount);
	bool rfReqCompleteFriendInvite(const string& CharnameToBeInvited, byte IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const string& ErrMsg);
	bool rfReqRecvFriendInvite(int ReqUserID, const string& ReqCharname, const string& InviteMsg);
	bool rfAckSendFriendInvite(int Result, const string& ErrMsg);
	bool rfAckNotifyLoadingState(int Result, int UserID, byte LoadingState);
	bool rfAckFailedStartGame(int Result, const string& ErrMsg, byte IsHost, int FailedUserID, int LoadingStep);
	bool rfAckSuccessStartGame(int Result, const string& ErrMsg, byte IsHost, const string& HostIP, int HostPort, int LoadingStep);
	bool rfAckHash(int Result, const string& Error);
	bool rfReqForceLogoutByOwner();
	bool ForceLogout_OnOK(class UGUIComponent* Sender);
	bool rfAckSellShopItemInfo(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueItemID, int SellPoint, int CurPoint, int AfterPoint);
	bool rfReqRecvChatWispher(const string& CharnameFrom, const string& Message);
	bool rfAckServerTime(int Time);
	bool rfAckGameOverEnd(int Result, const string& ErrMsg);
	bool rfAckRepairItem(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int RepairCost, int[] DamageDegree);
	bool rfAckRepairCost(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int[] RepairCost);
	bool rfAckUpdateWeaponDurability(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int[] Durability, byte[] IsDestroy, struct FBtrDouble[] FailedWeaponUniqueID);
	bool rfAckEntryQSlotUniqueIDList(int UserNum, byte[] QSlotDispOrder, struct FBtrDouble[] MWUniqueID, struct FBtrDouble[] PistolUniqueID, struct FBtrDouble[] TW1UniqueID, struct FBtrDouble[] TW2UniqueID, struct FBtrDouble[] KnifeUniqueID);
	bool rfAckEntryQSlotIDList(int UserNum, byte[] QSlotDispOrder, int[] MWItemID, int[] MWPartID, int[] MWPaintID, int[] PistolItemID, int[] PistolPartID, int[] PistolPaintID, int[] TWItemID1, int[] TWItemID2, int[] Skill1ID, int[] Skill2ID, int[] Skill3ID, int[] Skill4ID, int[] KWItemID);
	bool rfAckUpdateQSlot(int Result, const string& ErrMsg);
	bool rfAckQSlotList_2(int Result, const string& ErrMsg, byte[] QSlotDispOrder, int[] QSlotIDX, int[] ItemTID, struct FBtrDouble[] ItemUID, byte[] SlotPos);
	bool rfAckQSlotList(int Result, const string& ErrMsg, int[] QSlotID, string[] QSlotName, byte[] QSlotDispOrder, struct FBtrDouble[] MWItemID, struct FBtrDouble[] PistolItemID, struct FBtrDouble[] TWItemID1, struct FBtrDouble[] TWItemID2, int[] Skill1, int[] Skill2, int[] Skill3, int[] Skill4, struct FBtrDouble[] KnifeItemID);
	bool rfAckGP20CashModifyWeapon(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point);
	bool rfAckModifyWeapon(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point, int Cash);
	bool rfAckSellShopItem(int Result, const string& ErrMsg, int PointRemain, int CashRemain, int Count);
	bool rfAckBuyShopItem(int ItemCount, int[] Result, int[] BoughtItemTypeID, struct FBtrDouble[] BoughtItemUniqueID, int[] BoughtPartID, struct FBtrDouble[] BoughtUntilTIme, int[] BoughtStackCnt, int PointRemain, int CashRemain);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(int[] ItemID);
	bool rfAckShopItemListStart(int Count);
	bool rfReqConfirmSkillChanged();
	bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, const string& ErrMsg);
	bool rfAckEntrySkillList(int[] UserIDs, int[] SkillIDs, int[] SlotPositions, int Result, const string& ErrMsg);
	bool rfAckUserSkillListEnd();
	bool rfAckUserSkillList(int[] UniqueSkillID, int[] SkillID, struct FBtrDouble[] UntilTime, byte[] SlotPosition);
	bool rfAckUserSkillListStart(int Count, int Result, const string& ErrMsg);
	bool rfAckGetBootyChoose(int Result, const string& ErrMsg, byte GiveType, const struct FBtrDouble& ItemUniqueNumber, int ItemID, int PartID, byte ItemType, const struct FBtrDouble& UntilTime, int StackCount, int PaintID);
	bool rfAckGetBooty(int Result, const string& ErrMsg, int[] PrizeWinUserID, int[] BootyItemID, int[] BootyPartsID);
	bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, const string& ErrMsg);
	bool rfAckEntryItemList(int[] UserIDs, int[] ItemIDs, int[] SlotPositions, int[] AddPartsID, struct FBtrDouble[] UniqueID, int[] PaintID, int Result, const string& ErrMsg);
	bool rfAckRegisterOtherUdpInfo(int UID, const string& IP, int Port, byte NatType, byte Intervention, const string& HostInnerIP, int HostInnerPort);
	bool rfReqForceNatTypeSetting(int NatType);
	bool rfReqStartNatDiag(const string& Server1Addr, int Server1Port, const string& Server2Addr, int Server2Port);
	bool rfAckChangeUserState(int Result, const string& ErrMsg, int[] UserIDs, byte[] Positions, int[] Numbers, byte[] OldStates, byte[] NewStates);
	bool rfReqExteriorRoomState(int RoomNumber, byte RoomState);
	bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount);
	bool rfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, const string& RoomName, const string& MapName, const string& ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum);
	bool rfAckCharInfo(int Result, const string& ErrMsg, int UserID, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FCharInfo& stCharInfo, byte InClanRank, int ClanLevel);
	bool rfAckConfirmItemChanged(int Result, const string& ErrMsg);
	bool rfAckEquipItem(int ChangedNewItemID, const struct FBtrDouble& ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, const struct FBtrDouble& ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, const string& ErrMsg);
	bool rfAckChangeRoomSetting(int Result, const string& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfAckAIRewardResult(byte ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, int[] ScoreRewardUserID, byte[] ScoreRewardTYPE, int[] ScoreRewardID, int[] ScoreRewardCount);
	bool rfAckUpdateScore(int[] UserIDs, string[] NickNames, byte[] TeamIDs, int[] Scores, int[] Kills, int[] Assists, int[] Deaths, int[] EXPs, int[] EXPBonuses, int[] Points, int[] PointBonuses, int[] TeamScores, int[] BonusOwnerID, int[] BonusID);
	bool rfAckConnectGame(int UserID, int Result);
	bool rfAckChangeNewGuest(const string& HostIP);
	bool rfAckChangeHost(byte ClientNum);
	bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, const string& ErrMsg);
	bool rfAckDisconnectGame(int Result, int DisconnectUserID, const string& DisconnectUserName);
	bool rfReqRelayServerOff();
	bool rfReqRelayServerOn(const string& RelayServerIP, int RelayServerPortNum);
	bool rfAckGameRoomInfo(int Result, const string& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfAckGameOver(int UID, int GameRoomNumber, int Result, const string& ErrMsg);
	bool rfAckChangeGameMode(int GameNum, int UID, const string& GameMode, byte GameModeNum, int Result, const string& ErrMsg);
	bool rfAckSelectMap(int GameNum, int UID, const string& MapName, int Result, const string& ErrMsg);
	bool rfAckIsGameRoomPlaying(int GameRoomNum, byte IsPlaying);
	bool rfAckGameRoomDestroy(int GameRoomNum);
	bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, const string& ErrMsg);
	bool rfAckGameHostInfo(int GameNumber, const string& UserID, const string& IP, int Port, int Result, const string& ErrMsg);
	bool rfAckChangeTeam(int GameNumber, const string& UserID, int UID, int TeamNum, int Result, const string& ErrMsg);
	bool rfAckCreateGameRoom(int Result, const string& ErrMsg, int UserID, const string& RoomOwnerIP, const struct FGameRoomInfo& NetRoomInfo);
	bool rfAckLeaveRoom(int Num, int UID, const string& UserID, int Result, const string& ErrMsg);
	bool rfAckRoomUserList(int[] UID, string[] UserName, int[] Grade, int[] TeamNum, byte[] Statue, byte[] IsHost, string[] UserIP, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, byte[] IsLookingFor, int[] GMUID, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, const string& UserID, int TeamNum, int Grade, const string& UserIP, const string& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckChatClan(const string& CharName, const string& Message, int Result);
	bool rfAckChatNormal(int id, const string& Sender, const string& Message, int Result);
	bool rfAckRoomListEnd();
	bool rfAckRoomList(int[] GameNum, string[] Title, string[] MapName, int[] MapNum, byte[] UserCount, byte[] MaxCount, string[] ModeName, int[] ModeNum, byte[] WeaponLimit, byte[] IsTeamBalance, byte[] Status, string[] RoomOwnerIP, int[] GameMinute, string[] RoomOwnerName, byte[] IsSpecial, byte[] IsPassword, byte[] BotDifficult, byte[] BotModeUserTeamNum);
	bool rfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex);
	bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, int[] UID, string[] UserID, int[] UserLevels, string[] ClanName, int[] ClanPattern, int[] ClanBG, int[] ClanBL, int[] ClanGrade, int[] ClanWin, int[] ClanLose, byte[] IsLookForClan, int Result, const string& ErrMsg, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckLogin2(int Result, const string& ErrMsg, int UserID, const string& CharName, const struct FBtrDouble& CurServerTime, int CharDBID, byte IsGM);
	bool rfAckLeaveChannel(int Result, const string& UserID, int UID);
	bool rfAckEnterChannel(int id, int UID, const string& UserID, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckChannelList(int[] id, string[] Title, int[] CurUser, int[] MaxUser);
	bool rfAckAuctionInstantlyBuying(int Result, const string& ErrMsg, int PointRemain);
	bool rfAckAuctionMyItemCancel(int Result, const string& ErrMsg);
	bool rfAckAuctionItemListEnd(byte Section);
	bool rfAckAuctionItemList(byte Section, int[] UniqueIDs, int[] ItemIDs, int[] AddPartsIDs, struct FBtrDouble[] UntilTimes, int[] BiddingPrices, int[] InstantlyByuingPrices, int[] ItemDamageds, string[] HighestBidderNames, string[] SellerNames, int[] ItemCount);
	bool rfAckAuctionItemListStart(int Result, const string& ErrMsg, byte Section, int PageNum, int Count);
	bool rfAckAuctionItemListCount(int Result, const string& ErrMsg, byte Section, byte Classfy, int ItemType, int ItemGrade, int Count);
	bool rfAckAuctionMyItemRegister(int Result, const string& ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain);
	bool rfAckItemListEnd();
	bool rfAckItemList(struct FBtrDouble[] UniqueID, int[] ItemID, int[] ItemType, int[] Durability, struct FBtrDouble[] UntilTime, int[] SlotPosition, int[] AddPartsID, int[] DamageDegree, byte[] ItemState, int[] StackCount, int[] PaintID, int[] TradeCount);
	bool rfAckItemListStart(int Count, int Result, const string& ErrMsg);
	bool rfAckLogin(int Result, const string& ErrMsg, int UserID, const string& CharName, const string& ClanName, const struct FCharInfo& btCharInfo);
	bool sfAckClanMatch_RecvInviteCrew(int Result, const string& Inviter);
	bool sfAckRecvInviteGameRoom(const string& RoomUniqueID, int RoomNumber, byte Answer, const string& InviteCharName);
	bool sfAckRecvJoinClan(int UserIdx, const string& CharName, const string& ReqMsg, byte Permit);
	bool sfAckRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& InviterMsg, const string& ClanName, byte Permit);
	bool sfAckStartNatDiag(int NatType);
	bool sfReqMyEquipedQSlotList();
	bool sfReqMyEquipedSkillList();
	bool sfReqMyEquipedItemList();
	bool sfReqGetMyMailBoxState();
	bool sfReqSetLookForClan(byte IsLookingFor);
	bool sfReqExteriorRoomOwnerInfo(int RoomNum, const string& OwnerName, const string& OwnerIP);
	bool sfReqClanMatch_SetWaitRoomPublic(byte Set);
	bool sfReqRemoveCheckTeamBalanceList();
	bool sfReqPaidItem_ChangeClanMark(const struct FBtrDouble& ItemIdx, byte IsPaid, int Pattern, int BG, int BL);
	bool sfReqPaidItem_ClanMarkDupCheck(byte IsPaid, int Pattern, int BG, int BL);
	bool sfReqPaidItem_BroadCast(const struct FBtrDouble& ItemIdx, int Command, const string& Message);
	bool sfReqPaidItem_EraseRecord(const struct FBtrDouble& ItemIdx, int Command);
	bool sfReqSendSystemMsg(byte RecvType, const string& SendCharName, const string& RecvCharname, const struct FSystemMsgParam& MsgInfo);
	bool sfReqRandomBox_Use(const struct FBtrDouble& ItemIdx, const struct FBtrDouble& ItemIdx_Key);
	bool sfReqChangeRoomTitle_GM(int RoomNumber, const string& NewRoomTitle);
	bool sfReqQuestGetAvailableEventList();
	bool sfReqCharBlockInfo();
	bool sfReqClanMatch_GetClanWaittingRoomInfo();
	bool sfReqReturnBotID(int[] BotID);
	bool sfReqGetBotID(byte AFCount, byte RSACount);
	bool sfReqClanMatch_ChangeRoomSetting(int WaitRoomIndex, int[] MapNumArray, int VersusMode, byte IsPublic);
	bool sfReqParamCheckSum(const string& key, const string& Value);
	bool sfReqWebzenBillingUseStorageItem(int StorageSeq, int StorageItemSeq, byte StorageItemType);
	bool sfReqWebzenBillingStorageList(int Page, int CountForPage, byte Type);
	bool sfReqGiftItemByWebzenCash(const string& ReceiverCharName, const string& Message, int PackageProductSeq, int PriceSeq, int ProductDisplaySeq);
	bool sfReqBuyItemByWebzenCash(int PackageProductSeq, int ProductDisplaySeq, int PriceSeq, int[] ItemIDs, const struct FBtrDouble& ItemUniqueID, byte BuyOption1, byte BuyOption2);
	bool sfReqWebzenShopScriptVersion();
	bool sfReqWebzenCash();
	bool sfReqRegisteredPCBangInfo();
	bool sfReqRegisterMainPCBang();
	bool sfReqPCBangUserList();
	bool sfReqDailyQuestNewAvailable(int[] ExpiredQuestID, int[] NewQuestID);
	bool sfReqQuestNewAvailable(int[] AchivedQuestID, int[] NewQuestID, byte[] IsDailyQuest, int[] ExpiredQuest);
	bool sfReqQuestUpdate(int UniqueID, int GameRoomNum, int[] QuestID, int[] CountPrograss);
	bool sfReqQuestList();
	bool sfReqPermanentRoomInfo(int RoomNum);
	bool sfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber);
	bool sfReqClanMatch_StartSearching(int RequestCount);
	bool sfReqLimitedListInChannel();
	bool sfReqRecvInviteGameRoom(const string& InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, const string& RoomUniqueID, int RoomNumber, const string& RoomName, byte RoomState, const string& MapName, const string& OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, const string& Password, const string& InviteCharName);
	bool sfReqInviteGameRoom(const string& GuestCharName);
	bool sfReqClanMatch_StopSearching();
	bool sfReqClanMatch_ChangeLeader(int WaitRoomIdx, int NewLeaderID, const string& NewLeaderName);
	bool sfReqClanMatch_WaittingTeamList(int StartIndex, int ReturnCount);
	bool sfReqClanMatch_Chat(const string& Msg);
	bool sfReqClanMatch_Leave(int WaittingID);
	bool sfReqClanMatch_MemberList();
	bool sfReqClanMatch_Join(int WaittingID);
	bool sfReqClanMatch_InviteCrewResult(const string& Invitee, int Result);
	bool sfReqClanMatch_RecvInviteCrew(const string& Inviter, const string& ServerIP, int Port, int WaittingID, const string& Msg, int MapNum, int InviteUserChannelNum, const string& LeaderName, const string& RoomName);
	bool sfReqClanMatch_InviteCrew(const string& Invitee);
	bool sfReqClanMatch_StartCombat(int[] MapNumArray, int VersusMode);
	bool sfReqClanMatch_GetReady();
	bool sfReqGetItemFromItemBox(const struct FBtrDouble& ItemUniqueID, int ItemID, int ItemIDChoose, int PartIDChoose);
	bool sfReqItemListInItemBox(const struct FBtrDouble& ItemUniqueID, int BoxItemID, byte FromContent);
	bool sfReqRecvForceFailedClientLoading(int ErrCode);
	bool sfReqForceFailedClientLoading(int FailedUserID, int ErrCode);
	bool sfReqStartHolePunching(int GameType, int ReqStartUserID);
	bool sfReqNotifyMyCharInfoToRoomUser();
	bool sfReqNotifyDurabilityZeroItem(int Result, const string& ErrMsg, int UserID, struct FBtrDouble[] ItemUniqueIDs, int[] ItemIDs, int[] ItemPartIDs, byte[] ItemSlotPos);
	bool sfReqChatWispherMyCommunity(const string& SourceCharName, const string& SenderName, const string& Msg);
	bool sfReqNotifyDisconnectHostInLoading(int Result, const string& ErrMsg, int HostID);
	bool sfReqRecvForceDisconnected_FromGM(int Result, const string& ErrMsg);
	bool sfReqForceDisconnectUser_GM(const string& CharName);
	bool sfReqRecvNotice_FromGM(int Result, const string& ErrMsg, string[] NoticeMsg, byte IsFromDB);
	bool sfReqNotice_GM(byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const string& Msg);
	bool sfReqSpecificChannelUserInfo(int UserID);
	bool sfReqSpecificGameRoomInfo(int RoomNum);
	bool sfReqChannelUserListInGameRoom(int ChannelNum, int StartIndex, int Count);
	bool sfReqRecvDeleteFriend(int Result, const string& FromCharName);
	bool sfReqDeleteFriend(string[] DeleteCharName);
	bool sfReqGameGuardAuthData(int AuthDataIndex, int AuthDataVal1, int AuthDataVal2, int AuthDataVal3);
	bool sfReqCheckEquipedWeaponDurability();
	bool sfReqGamePlay_GetChopper(int GetChopperUID, int[] GetChopperAssistUID, float KillXCoord, float KillYCoord, float KillZCoord, int KillPos, int KillWeaponID, int KillWeaponPartID, int KillRange, int KillDamage, int ChopperCallerID, const string& ChopperCallerName, float ChopperXCoord, float ChopperYCoord, float ChopperZCoord);
	bool sfReqIsAvailClanURL(const string& ClanURL);
	bool sfReqGetIsHostBlocking();
	bool sfReqNotifyHostBlocking(byte Blocking);
	bool sfReqGetHolePunchingResult();
	bool sfReqNotifyRecvDummyForHolePunching(int ClientUserID, byte Phrase);
	bool sfReqGamePlay_ChangeWeaponSet(int UID, int SetNumber);
	bool sfReqGamePlay_UpdateDomScore(int AFScore, int RSAScore);
	bool sfReqNotifyRelayServerAddr(const string& RelayIP, int RelayPort);
	bool sfReqGetUserHostPriorityPoint(int UserID);
	bool sfReqUpdateMyHostPriorityPoint(int HostPriorityPoint);
	bool sfReqWriteServerLog(byte Destination, const string& LogMsg);
	bool sfReqGamePlay_SetRoundStartTime(int[] UID);
	bool sfReqGamePlay_SetGameStartTime(int[] UID);
	bool sfReqRecvForceDisconnectUDPFromHost(int Result);
	bool sfReqForceDisconnectUDPFromHost(int UserID);
	bool sfReqGamePlay_TakeAPoint(int[] TakerUID, byte TakePos, float[] TakerXCoord, float[] TakerYCoord, float[] TakerZCoord, int[] TakerPos, int[] TakerWeaponID, int[] TakerWeaponPartID, int[] TakerRange);
	bool sfReqNotifyChangeRoomState(byte RoomState);
	bool sfReqGamePlay_DefuseBomb(int DefuserUID, byte DefusePos, float DefuserXCoord, float DefuserYCoord, float DefuserZCoord, int DefuserPos, int DefuserWeaponID, int DefuserWeaponPartID, int DefuserRange);
	bool sfReqGamePlay_InstallBomb(int InstallerUID, byte InstallPos, float InstallerXCoord, float InstallerYCoord, float InstallerZCoord, int InstallerPos, int InstallerWeaponID, int InstallerWeaponPartID, int InstallerRange);
	bool sfReqDBCharInfo(const string& CharName);
	bool sfReqForceNatTypeSetting(int NatType);
	bool sfReqGetServerTime();
	bool sfReqLogEndEachRound(int StartCnt, int EndCnt, int RoundEndType, int RoundEndTime, byte VTeam, byte VTeamAD, int AFScore, int RSAScore, int Round);
	bool sfReqLogGetScore(const struct FKillDeathLog& KillDeathLogParam, int[] AssistUIDs, byte[] AssistScores);
	bool sfReqAuctionTradeHistory(int ItemID, int PartID);
	bool sfReqSendGift(int ItemID, const string& RecvCharname, const string& RecvMessage, byte BuyOption1, byte BuyOption2);
	bool sfReqGetAttachedItemFromMemo(int UserID, int MemoIdx, int ItemID);
	bool sfReqChatClan(const string& Message);
	bool sfReqTestDouble(const struct FBtrDouble& vDouble, struct FBtrDouble[] vDoubles);
	bool sfReqNotifyLoadingState(byte LoadingState);
	bool sfReqFailedStartGame(int LoadingStep);
	bool sfReqSuccessStartGame(int LoadingStep);
	bool sfReqClanCharPersonelIntro(const string& ClanName, const string& CharName);
	bool sfReqClanPersonelIntro(const string& ClanName, const string& CharName, const string& PersonelIntro);
	bool sfReqClanChangeInfo(const string& ClanName, byte IsRecruit, byte Region, const string& Keyword, const string& ClanIntro, const string& Notice);
	bool sfReqClanClose(const string& ClanName);
	bool sfReqClanSecession(const string& ClanName);
	bool sfReqClanNews(const string& ClanName);
	bool sfReqAdjustClanMemberGrade(const string& ClanName, const string& CharName, byte CharGrade);
	bool sfReqClanUserList(const string& ClanName);
	bool sfReqSerachClan(byte SearchType, const string& Keyword, byte ClanStatus, byte ClanRegion, int ReqPage);
	bool sfReqRecvJoinClan(int UserIdx, const string& CharName, const string& Message);
	bool sfReqJoinClan(const string& ClanName, const string& ClanManagerName, const string& Message);
	bool sfReqRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& ClanName, const string& InviteMsg);
	bool sfReqInviteClan(const string& CharName, const string& InviteMsg);
	bool sfReqClanInfo(const string& ClanName);
	bool sfReqCreateClan(const string& ClanName, const string& ClanURL, const string& ClanIntro, const string& ClanKeyword, byte ClanRegion);
	bool sfReqDupCheckClanName(const string& ClanNam);
	bool sfReqSellShopItemInfo(const struct FBtrDouble& UniqueItemID, int Count);
	bool sfReqGameOverEnd();
	bool sfReqAuctionItemListCount(byte Section, byte Classfy, int ItemType, int ItemGrade);
	bool sfReqServerTime();
	bool sfReqEntryQSlotIDList(int UserNum);
	bool sfReqEntryQSlotUniqueIDList(int UserNum);
	bool sfReqAuctionBidding(int UniqueID, int BiddingPrice);
	bool sfReqAuctionInstantlyBuying(int UniqueID);
	bool sfReqAuctionItemList(byte Section, const string& Keyword, int ItemRank, byte ItemClassfy, byte IsAvailable, int PageNum, int Count, int SortOpt);
	bool sfReqAuctionMyItemCancel(int UniqueID);
	bool sfReqAuctionMyItemRegister(const struct FBtrDouble& UniqueID, int ItemCount, int BeginPrice, int PeriodHour, int InstantlyBuyingPrice);
	bool sfReqMyMoney();
	bool sfReqUpdateQSlot(int QSlotID, const string& QSlotName, const struct FBtrDouble& MWItemID, const struct FBtrDouble& PistolItemID, const struct FBtrDouble& TWItemID1, const struct FBtrDouble& TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4, const struct FBtrDouble& KnifeItemID);
	bool sfReqQSlotList();
	bool sfReqRepairItem(struct FBtrDouble[] UniqueItemcID);
	bool sfReqRepairCost(struct FBtrDouble[] UniqueItemID);
	bool sfReqUpdateWeaponDurability(int TotalPlayTime, int[] OwnerID, int[] Number, struct FBtrDouble[] UniqueItemID, int[] UsingSec, int[] UsingRoundInSD);
	bool sfReqModifyWeapon(const struct FBtrDouble& UniqueID, int AddPartID, int PaintID);
	bool sfReqSellShopItem(const struct FBtrDouble& ItemUniqueID, int Count);
	bool sfReqBuyShopItem(int ItemID, const struct FBtrDouble& ItemUniqueID, byte BuyOption1, byte BuyOption2);
	bool sfReqShopItemList();
	bool sfReqForceGameOver();
	bool sfReqGiveSkill();
	bool sfReqNotifyExpiredItemIDs();
	bool sfReqNotifyExpiredSkillIDs();
	bool sfReqNotifyChangedSkillState();
	bool sfReqNotifyChangedItemState();
	bool sfReqConfirmSkillChanged();
	bool sfReqEquipSkill(int SkillID, int SkillUniqueID, byte NewSlotPosition);
	bool sfReqUserSkillList(int UserID);
	bool sfReqDelMemo(int[] MemoIdx, byte Type);
	bool sfReqReadMemo(int MemoIdx);
	bool sfReqMemoList(byte Type, byte MemoType);
	bool sfReqRecvMemo(const string& cnameFrom, byte MemoType);
	bool sfReqSendMemo(string[] cnames, const string& Msg, int ItemUID);
	bool sfReqRecvChatWispher(const string& CharnameFrom, const string& Message);
	bool sfReqChatWispher(const string& CharName, const string& Message);
	bool sfReqRemoveBlockUserList(const string& CharName);
	bool sfReqAddBlockUserList(const string& CharName);
	bool sfReqBlockUserList();
	bool sfReqCompleteFriendInvite(const string& CharnameToBeInvited, byte IsPermit);
	bool sfReqConfirmFriendInvite(int ReqUserID, const string& ReqedCharname, byte IsPermit);
	bool sfReqRecvFriendInvite(int ReqUserID, const string& ReqCharname, const string& InviteMsg);
	bool sfReqSendFriendInvite(int InviteUserID, const string& InviteName, const string& InviteMsg);
	bool sfReqChatNormal(const string& Message);
	bool sfReqDummy(int DelayCheck);
	bool sfReqConfirmItemChanged();
	bool sfReqEquipItem(int ItemID, const struct FBtrDouble& UniqueID, int SlotPos_Key, byte SlotPos_Value);
	bool sfReqItemList(int UID);
	bool sfReqEntrySkillList(int UserID);
	bool sfReqEntryItemList(int UserID);
	bool sfReqChangeUserState(byte NewState, byte CheckPlaying);
	bool sfReqExteriorRoomState(int RoomNumber, byte RoomState);
	bool sfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount);
	bool sfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, const string& RoomName, const string& MapName, const string& ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum);
	bool sfReqGetBooty(int RoomNumber);
	bool sfReqSetUserBootySeedValue(int UserID, int SeedValue);
	bool sfReqChangeRoomSetting(const struct FGameRoomInfo& RoomInfo);
	bool sfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, int[] ItemID, int[] PartID);
	bool sfReqClientUdpInfoList(int GameNum);
	bool sfReqRegisterMyUdpInfo(byte IsHost, const string& IP, int Port, byte Intervention, const string& HostInnerIP, int HostInnerPort);
	bool sfReqNotifyClientJoinTime(int JoinedClientID);
	bool sfReqDisconnectGame();
	bool sfReqConnectGame();
	bool sfReqRelayServerOff();
	bool sfReqRelayServerOn(const string& RelayServerIP, int RelayServerPortNum);
	bool sfReqGameOver(int UID, int GameRoomNumber);
	bool sfReqIsGameRoomPlaying(int GameRoomNum);
	bool sfReqChangeRoomMaxNum(int GameNum, int UID, int Number, int TeamNum);
	bool sfReqUpdateScore(int GameNumber, int[] UserIDs, int[] Kills, int[] Assists, int[] Deaths, int[] EXPs, int[] Points, int[] Scores, int[] TeamScores, int[] RoundJoin, int[] TimeJoin, int Playtime, byte GameEndType, string[] UserNames, byte IsAIClear);
	bool sfReqStartGame(int GameNumber);
	bool sfReqGameHostInfo(int GameNumber);
	bool sfReqIsHostAvailable(const string& MyIp, int CPUGrade, int RamGrade, int VGAGrade, int VGARam);
	bool sfReqChangeTeam(int TeamNum);
	bool sfReqChangeRoomOwner(int GameNum, int UID, int NewOwner);
	bool sfReqChangeGameMode(int GameNum, int UID, const string& GameMode, byte GameModeNum);
	bool sfReqBanUser(int GameNum, int UID, int BanUID);
	bool sfReqSelectMap(int GameNum, int UID, const string& MapName);
	bool sfReqGameRoomInfo(int GameNum, int UID);
	bool sfReqCreateGameRoom(const struct FGameRoomInfo& NetRoomInfo);
	bool sfReqLeaveRoom(int Num);
	bool sfReqRoomUserList(int GameNum);
	bool sfReqEnterRoom(int GameNum, const string& Password, byte RoomEnterType);
	bool sfReqRoomList(int id, int StartIndex, int Count);
	bool sfReqChannelUserList(int id, int StartIndex, int Count);
	bool sfReqLeaveChannel(int id);
	bool sfReqEnterChannel(int id);
	bool sfReqChannelList(int bChannelType);
	bool sfReqFriendList();
	bool sfReqCharInfo();
	bool sfReqLogin2(const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, const string& Guid, int UserType);
	bool sfReqStartNatDiag(const string& Server1Addr, int Server1Port, const string& Server2Addr, int Server2Port);
	bool sfReqForceLogoutByOwner();
	bool sfReqLogin(const string& id);
	bool sfReqHash(int HashField0, int HashField1, int HashField2, int HashField3);
	bool rfAckMyEquipedQSlotList(byte[] QSlotDispOrder, struct FBtrDouble[] MWUniqueID, int[] MWItemID, int[] MWPartID, int[] MWPaintID, struct FBtrDouble[] PistolUniqueID, int[] PistolItemID, int[] PistolPartID, int[] PistolPaintID, struct FBtrDouble[] TW1UniqueID, int[] TWItemID1, struct FBtrDouble[] TW2UniqueID, int[] TWItemID2, int[] Skill1ID, int[] Skill2ID, int[] Skill3ID, int[] Skill4ID, int Result, struct FBtrDouble[] KnifeUniqueID, int[] KnifeItemID);
	bool rfAckMyEquipedSkillList(int[] SkillIDs, int[] SlotPositions, int Result);
	bool rfAckMyEquipedItemList(int[] ItemIDs, int[] SlotPositions, int[] AddPartsID, int[] PaintID, struct FBtrDouble[] UniqueID, int Result);
	void endTutorial();
	void OnPageRoomLobbyInited();
	void BeginTutorialCreateRoom();
	void SetupTutorialRoomInfo(const string& MapName);
	void BeginTutorial(const string& MapName);
	void OnReqSuccessStartGame(int Step);
	void OnError(int ErrCode);
	void OnClose(int ErrCode);
	void OnConnect(int ErrCode);
	void Created();
	bool Close();
	bool ConnectDomain(const string& domain, int nPort);
	bool Connect(const string& sIpaddr, int nPort);
	bool InitNetwork();
};


// Class GUIWarfare.BTPageLogo
// 0x003C (0x04F4 - 0x04B8)
class UBTPageLogo : public UBTNetGUIPage
{
public:
	bool                                               bSaveConnectLoginServer;                                  // 0x04B8(0x0004)
	byte                                               SaveNeedChar;                                             // 0x04BC(0x0001)
	byte                                               Padding00[0x3];                                           // 0x04BD(0x0003) MISSED OFFSET
	int                                                LogoState;                                                // 0x04C0(0x0004)
	struct FImage[]                                    LogoImg;                                                  // 0x04C4(0x000C) (NeedCtorLink)
	class UBTOwnerDrawImageHK*                         Background;                                               // 0x04D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelLogo;                                                // 0x04D4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	float                                              Degree;                                                   // 0x04D8(0x0004)
	float                                              TimeFade;                                                 // 0x04DC(0x0004)
	float                                              TimeDelay;                                                // 0x04E0(0x0004)
	bool                                               bFirstRender;                                             // 0x04E4(0x0004)
	class ABTROModelNew*                               CharacterModel;                                           // 0x04E8(0x0004)
	int                                                EventNotifyType;                                          // 0x04EC(0x0004)
	bool                                               bShowNotice;                                              // 0x04F0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageLogo");
		return ptr;
	}


	void ShowNotify();
	bool rfAckEventNotify(int Type);
	bool rfAckClientChecksum(int Result);
	bool rfAckClientChallenge(const string& Key1, const struct FBtrDouble& Key2);
	bool Internal_OnPreDraw(class UCanvas* C);
	bool rfAckProcessPreLoginUser(int Result, const string& ErrMsg);
	bool rfAckLoginInHouseTest(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg, const string& BDay, byte Sex, const struct FBtrDouble& ServerTime);
	bool Exit_OnOK(class UGUIComponent* Sender);
	bool ForceDisconnect_OnOK(class UGUIComponent* Sender);
	bool rfAckLoginWithIndonesia(int Result);
	bool rfAckLoginWithGlobal(int Result);
	bool rfAckLoginWithThailand(int Result);
	bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType);
	bool rfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock);
	bool Exit_OnClick(class UGUIComponent* Sender);
	bool Internal_KeyEvent(float Delta, byte* key, byte* Action);
	void LabelLogo_Decrease_OnTimer(class UGUIComponent* Sender);
	void LabelLogo_Delay_OnTimer(class UGUIComponent* Sender);
	void LabelLogo_Increase_OnTimer(class UGUIComponent* Sender);
	void SupportResolution();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void TcpLogin_OnConnect(int ErrCode);
	float DegreeToRadian(float Angle);
	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
	class UBTTcpLink_Login* GetTcpLogin();
};


// Class GUIWarfare.BTPageLogin
// 0x00D4 (0x0740 - 0x066C)
class UBTPageLogin : public UBTNetGUIPageHK
{
public:
	struct FFloatBox                                   fbButtonLogin;                                            // 0x066C(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonLogin;                                              // 0x067C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonBattery;                                          // 0x0680(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonBattery;                                            // 0x0690(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonQuit;                                             // 0x0694(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonQuit;                                               // 0x06A4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbEditID;                                                 // 0x06A8(0x0010)
	class UBTEditBoxHK*                                EditID;                                                   // 0x06B8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbEditPW;                                                 // 0x06BC(0x0010)
	class UBTEditPWHK*                                 EditPW;                                                   // 0x06CC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbComboTest;                                              // 0x06D0(0x0010)
	class UBTComboBoxHK*                               ComboTest;                                                // 0x06E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                RequestProcessPreLoginCount;                              // 0x06E4(0x0004)
	int                                                MaxRequestProcessPreLogin;                                // 0x06E8(0x0004)
	string                                             MessageUserWithSameIDConnected;                           // 0x06EC(0x000C) (Localized, NeedCtorLink)
	string                                             MessageNoID;                                              // 0x06F8(0x000C) (Localized, NeedCtorLink)
	string                                             MessageWrongPWD;                                          // 0x0704(0x000C) (Localized, NeedCtorLink)
	string                                             MessageTypedNoPWD;                                        // 0x0710(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionLogin;                                             // 0x071C(0x000C) (Localized, NeedCtorLink)
	string                                             CaptionQuit;                                              // 0x0728(0x000C) (Localized, NeedCtorLink)
	class UBTLabelTestHK2*                             ClanMark;                                                 // 0x0734(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonFontTest;                                           // 0x0738(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTSliderHK*                                 slider;                                                   // 0x073C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageLogin");
		return ptr;
	}


	bool rfAckLoginWithIndonesia(int Result);
	bool rfAckLoginWithGlobal(int Result);
	bool rfAckLoginWithThailand(int Result);
	bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType);
	bool rfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock);
	bool rfAckCreateChar(int Success, const string& ErrMsg);
	bool Disconnect_OnCancel(class UGUIComponent* Sender);
	bool Disconnect_OnOK(class UGUIComponent* Sender);
	void RequestProcessPreLoginUser();
	bool rfAckProcessPreLoginUser(int Result, const string& ErrMsg);
	bool rfAckLoginInHouseTest(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg, const string& BDay, byte Sex, const struct FBtrDouble& ServerTime);
	bool rfAckLogin(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg);
	bool ButtionSettings_OnClick(class UGUIComponent* Sender);
	bool ButtonQuit_OnClick(class UGUIComponent* Sender);
	bool ButtonLogin_Ver1_OnClick(class UGUIComponent* Sender);
	bool ButtonLogin_OnClick(class UGUIComponent* Sender);
	bool SendLogin_Ver1();
	void Quit();
	bool internalKeyEvent(float Delta, byte* key, byte* Action);
	void Opened(class UGUIComponent* Sender);
	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
	class UBTTcpLink_Login* GetTcpLogin();
	bool Edit_OnEnter(class UGUIComponent* Sender, const string& txt);
	bool ButtonFontTest_OnClick(class UGUIComponent* Sender);
	void Internal_OnRendered(class UCanvas* C);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfare.BTPageCharacterCreation
// 0x019C (0x0808 - 0x066C)
class UBTPageCharacterCreation : public UBTNetGUIPageHK
{
public:
	class UBTTPTopMenuSCHK*                            TPTopMenu;                                                // 0x066C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTModelHK*                                  UIModel;                                                  // 0x0670(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class ABTROModelNew*                               CharacterModel;                                           // 0x0674(0x0004)
	struct FFloatBox                                   fbModelBG;                                                // 0x0678(0x0010)
	struct FFloatBox                                   fbUIModel;                                                // 0x0688(0x0010)
	struct FFloatBox                                   fbButtonLR;                                               // 0x0698(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonRR;                                               // 0x06A8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonLR;                                                 // 0x06B8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRR;                                                 // 0x06BC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bRRMousePressed;                                          // 0x06C0(0x0004)
	bool                                               bLRMousePressed;                                          // 0x06C0(0x0004)
	class UBTOwnerDrawImageHK*                         BackgroundDeco;                                           // 0x06C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FImage                                      CharacterCreationBgDeco;                                  // 0x06C8(0x0020)
	struct FFloatBox                                   fbBGDeco;                                                 // 0x06E8(0x0010)
	struct FFloatBox                                   fbButtonConfirm;                                          // 0x06F8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strButtonConfirm;                                         // 0x0708(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonConfirm;                                            // 0x0714(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strEditNickName;                                          // 0x0718(0x000C) (Localized, NeedCtorLink)
	string                                             strLabelNickName;                                         // 0x0724(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbEditNickName;                                           // 0x0730(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelNickName;                                          // 0x0740(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTEditBoxHK*                                EditNickName;                                             // 0x0750(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelNickName;                                            // 0x0754(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbAFTeamBtn;                                              // 0x0758(0x0010)
	struct FFloatBox                                   fbRSATeamBtn;                                             // 0x0768(0x0010)
	string                                             strAF;                                                    // 0x0778(0x000C) (Localized, NeedCtorLink)
	string                                             strRSA;                                                   // 0x0784(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonAF;                                                 // 0x0790(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRSA;                                                // 0x0794(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FImage                                      NickNameDeco;                                             // 0x0798(0x0020)
	class UBTRODecorateStringHK*                       NickNameToolTip;                                          // 0x07B8(0x0004)
	struct FFloatBox                                   fbToolTip;                                                // 0x07BC(0x0010)
	string                                             strNickNameToolTip;                                       // 0x07CC(0x000C) (Localized, NeedCtorLink)
	string                                             strErrorList[0x3];                                        // 0x07D8(0x000C) (Localized, NeedCtorLink)
	bool                                               bVisibleAFModel;                                          // 0x07FC(0x0004)
	int                                                nOldMouseX;                                               // 0x0800(0x0004)
	int                                                nOffsetMouseDis;                                          // 0x0804(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageCharacterCreation");
		return ptr;
	}


	bool rfAckLogOut(byte Result, byte Reason);
	void Internal_OnRendered(class UCanvas* Canvas);
	bool rfAckProcessPreLoginUser(int Result, const string& ErrMsg);
	bool rfAckLoginInHouseTest(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg, const string& BDay, byte Sex, const struct FBtrDouble& ServerTime);
	bool Exit_OnOK(class UGUIComponent* Sender);
	bool ForceDisconnect_OnOK(class UGUIComponent* Sender);
	void rfAckCreateChar(int Success, const string& ErrMsg);
	bool ButtonConfirm_OnClick(class UGUIComponent* Sender);
	bool ButtonRSA_OnClick(class UGUIComponent* Sender);
	bool ButtonAF_OnClick(class UGUIComponent* Sender);
	void ButtonRR_OnRelease(class UGUIComponent* Sender);
	void ButtonRR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	void ButtonLR_OnRelease(class UGUIComponent* Sender);
	void ButtonLR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	void CharRotByDrag();
	bool Internal_OnPreDraw(class UCanvas* C);
	int GetStringCount(const string& Text);
	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	class UBTTcpLink_Login* GetTcpLogin();
	bool HeaderButton_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfare.BTPageLobby
// 0x03B8 (0x0A24 - 0x066C)
class UBTPageLobby : public UBTNetQuestInfoPageHK
{
public:
	float                                              ACLLobby_OnHitBottom_LastTime;                            // 0x066C(0x0004)
	float                                              TPMessenger_ACLMsg0_OnHitBottom_LastTime;                 // 0x0670(0x0004)
	string                                             strEnterRoomMessage;                                      // 0x0674(0x000C) (Localized, NeedCtorLink)
	string                                             strConnectingLogin;                                       // 0x0680(0x000C) (Localized, NeedCtorLink)
	bool                                               bStopRefresh;                                             // 0x068C(0x0004)
	float                                              LastRefreshTime[0x2];                                     // 0x0690(0x0004)
	float                                              RefreshCycleTime[0x2];                                    // 0x0698(0x0004)
	class UBTRefreshTime*                              rfFriendPosTime;                                          // 0x06A0(0x0004)
	int                                                TotalChannelUserCount;                                    // 0x06A4(0x0004)
	int                                                TotalRoomCount;                                           // 0x06A8(0x0004)
	int                                                RoomStartIndex;                                           // 0x06AC(0x0004)
	int                                                RoomPingIndex;                                            // 0x06B0(0x0004)
	bool                                               bJoinClanState;                                           // 0x06B4(0x0004)
	bool                                               bClanInviteState;                                         // 0x06B4(0x0004)
	bool                                               bGoBack;                                                  // 0x06B4(0x0004)
	bool                                               bGoTutorial;                                              // 0x06B4(0x0004)
	string                                             SaveRoomPassword;                                         // 0x06B8(0x000C) (NeedCtorLink)
	class UBTOwnerDrawImageHK*                         BGRoomList;                                               // 0x06C4(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         BGImageAD2;                                               // 0x06C8(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UTabControlMocker*                           TabControl;                                               // 0x06CC(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLLobbyHK*                               ACLLobby;                                                 // 0x06D0(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLLobbyHK*                               ACLLobbyEnterable;                                        // 0x06D4(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	bool                                               bAllRoomList;                                             // 0x06D8(0x0004)
	class UBTTPChatHK*                                 TPChat;                                                   // 0x06DC(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPMessengerHK*                            TPMessenger;                                              // 0x06E0(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPMyInfoHK*                               TPMyInfo;                                                 // 0x06E4(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strDisconnectedChannel;                                   // 0x06E8(0x000C) (Localized, NeedCtorLink)
	string                                             strListTop[0xA];                                          // 0x06F4(0x000C) (Localized, NeedCtorLink)
	string                                             strListBottom[0x5];                                       // 0x076C(0x000C) (Localized, NeedCtorLink)
	string                                             strAllRoomList;                                           // 0x07A8(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ListTopButton[0xA];                                       // 0x07B4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ListBottomButton[0x5];                                    // 0x07DC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         ListTopImage[0xA];                                        // 0x07F0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   ListTopButtonPosition[0xA];                               // 0x0818(0x0010)
	struct FFloatBox                                   ListBottomButtonPosition[0x5];                            // 0x08B8(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonAD;                                                 // 0x0908(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strMakeClanWarRoom;                                       // 0x090C(0x000C) (Localized, NeedCtorLink)
	string                                             strRegularClanWar;                                        // 0x0918(0x000C) (Localized, NeedCtorLink)
	string                                             strFriendlyClanWar;                                       // 0x0924(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonRegularClanWar;                                  // 0x0930(0x000C) (Localized, NeedCtorLink)
	string                                             strButtonFriendlyClanWar;                                 // 0x093C(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonRegularClanWar;                                   // 0x0948(0x0010)
	struct FFloatBox                                   fbButtonFriendlyClanWar;                                  // 0x0958(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRegularClanWar;                                     // 0x0968(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonFriendlyClanWar;                                    // 0x096C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UwMatchMaker*                                MatchMaker;                                               // 0x0970(0x0004) (Transient)
	struct FFloatBox                                   fbTestButton;                                             // 0x0974(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTNuclearButtonHK*                          TestButton;                                               // 0x0984(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string[]                                           DelFriendsList;                                           // 0x0988(0x000C) (NeedCtorLink)
	byte                                               bQuickJoin;                                               // 0x0994(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0995(0x0003) MISSED OFFSET
	int                                                MapIndex;                                                 // 0x0998(0x0004)
	int                                                GameMode;                                                 // 0x099C(0x0004)
	int                                                WRestrict;                                                // 0x09A0(0x0004)
	string                                             strToolTip[0x5];                                          // 0x09A4(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 MyInfoBtn;                                                // 0x09E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 MyTutorialBtn;                                            // 0x09E4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelBackgrounddeco;                                      // 0x09E8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelBackgrounddeco;                                    // 0x09EC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             szSerVerInfo;                                             // 0x09FC(0x000C) (NeedCtorLink)
	class UBTOwnerDrawImageHK*                         LabelSvrInfo;                                             // 0x0A08(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelInfo;                                              // 0x0A0C(0x0010)
	struct FScriptDelegate                             __delegateAckEnterRoom__Delegate;                         // 0x0A1C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageLobby");
		return ptr;
	}


	bool BTWindowDefineSelectHK_24_OnOK(class UGUIComponent* Sender);
	bool StartTutorial_OnClick(class UGUIComponent* Sender);
	bool MyInfo_OnClick(class UGUIComponent* Sender);
	class UBTWindowQuickEnterRoomHK* GetWindowQuickEnter();
	bool AD_OnClick(class UGUIComponent* Sender);
	bool rfNotifyClanLevelup(const string& ClanName, int Levelup);
	bool rfNotifyNewClanName(const string& New_NickName);
	bool rfReqRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& ClanName, const string& InviteMsg);
	bool rfNotifyNewNickName(int Community_Type, const string& Old_NickName, const string& New_NickName);
	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, string[] CharName, int[] CharLevel, string[] ClanName, int[] ClanMarkPattern, int[] ClanMarkBG, int[] ClanMarkBL, int[] Ranking_Accum, int[] Ranking_Accum_Prev, int[] Ranking_Accum_Exp, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfAckFriendPosition(int Result, const string& TargetCharName, byte ServerType, const string& fServername, const string& fServerShortName, const string& fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, const string& ChannelNickName, int GameRoomNum);
	bool rfAckMoveToLobby(byte MessageType);
	bool rfAckLogOut(byte Result, byte Reason);
	bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, const string& RoomName, int MapNum, int CurUserCount, int MaxUserCount, byte Status, byte IsPublic);
	bool rfAckClanMatch_EndPublicWaitRoomList();
	bool rfAckClanMatch_PublicWaitRoomList(int[] WaitRoomIdx, string[] LeaderName, string[] RoomName, int[] MapNum, int[] CurUserCount, int[] MaxUserCount, byte[] Status);
	bool rfAckClanMatch_StartPublicWaitRoomList(int Result, const string& ErrMsg, int Count);
	bool rfAckNotifyEndTutorial(int UserID, const string& CharName, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckNotifyStartTutorial(int Result, int UserID);
	void RoomPingRefresh();
	bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, const string& NewRoomTitle);
	bool IsEnterableRoom(bool bPass, int nUser, int nMaxUser);
	bool rfAckQuestGetAvailableEventList(int Result, const string& ErrMsg, int[] QuestID);
	void UpdateRecv_ClanInfo(class UBTNetMainMenu* MainMenu);
	bool rfAckNotifyAdjustClanMemberGrade(const string& ClanName, const string& CharName, byte CharGrade);
	bool rfAckAdjustClanMemberGrade(int Result, const string& ErrMsg, const string& ClanName, const string& CharName, byte CharGrade);
	bool rfReqRecvDeleteFriend(int Result, const string& FromCharName);
	bool rfAckDeleteFriend(int Result, string[] FailedCharname);
	bool rfAckChatWispher(int Result, const string& ErrMsg, const string& ToCharName);
	bool rfAckRecvJoinClanResult(int Result, const string& ErrMsg);
	bool rfAckJoinClanResult(const string& ClanName, byte Permit, const string& PermitCharName);
	bool RefreshPage_OnOK(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnSuspend(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnOK(class UGUIComponent* Sender);
	bool rfReqRecvJoinClan(int UserIdx, const string& CharName, const string& Message);
	bool rfAckNotifyClanSecession(const string& ClanName, const string& CharName);
	bool rfAckNotifyNewClanMember(const string& ClanName, const string& CharName);
	bool rfAckSearchClan(int Result, const string& ErrMsg, int TotalPage, int[] ClanMarkPattern, int[] ClanMarkBG, byte[] ClanMarkBL, string[] ClanName, string[] ClanMaster, int[] ClanMember, int[] ClanMemberMax, int[] ClanCreateDate, int[] ClanWin, int[] ClanLose, int[] ClanDraw, int[] ClanRank, byte[] ClanRecruit, int[] ClanLevel);
	bool rfAckInviteClanResult(const string& CharName, byte Permit, const string& ClanNm);
	bool rfAckJoinClan(int Result, const string& ErrMsg, const string& SpecificCharName, const string& RealRecvCharName, byte RealRecvCharClanGrade);
	bool rfAckInviteClan(int Result, const string& ErrMsg);
	bool BTWindowUserPersonalInfo_OnClanInfo(class UGUIComponent* Sender);
	bool BTWindowUserDetailInfoHK_OnClanInfo(class UGUIComponent* Sender);
	bool rfReqClanCharPersonelIntro(const string& ClanName, const string& CharName);
	bool rfAckClanCharPersonelIntro(int Result, const string& ErrMsg, const string& PersonelIntro);
	bool rfAckDBCharInfo(int Result, const string& ErrMsg, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool MoveToClanPage_OnOK(class UGUIComponent* Sender);
	bool rfAckCreateClan(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckDupCheckClanName(int Result, const string& ErrMsg);
	bool rfAckGameRoomInfo(int Result, const string& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfReqCompleteFriendInvite(const string& CharnameToBeInvited, byte IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const string& ErrMsg);
	bool rfReqRecvFriendInvite(int ReqUserID, const string& ReqCharname, const string& InviteMsg);
	bool rfAckSendFriendInvite(int Result, const string& ErrMsg);
	bool rfReqExteriorRoomOwnerInfo(int RoomNum, const string& OwnerName, const string& OwnerIP);
	bool rfReqExteriorRoomState(int RoomNumber, byte RoomState);
	bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount);
	bool rfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, const string& RoomName, const string& MapName, const string& ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum);
	void SetCharacterInfo(const string& ClanName, const struct FCharInfo& btCharInfo);
	bool rfAckGameRoomDestroy(int GameRoomNum);
	bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, int[] UID, string[] UserID, int[] UserLevels, string[] ClanName, int[] ClanPattern, int[] ClanBG, int[] ClanBL, int[] ClanGrade, int[] ClanWin, int[] ClanLose, byte[] IsLookForClan, int Result, const string& ErrMsg, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	void TryEnterBotMode();
	bool rfAckRoomList(int[] GameNum, string[] Title, string[] MapName, int[] MapNum, byte[] UserCount, byte[] MaxCount, string[] ModeName, int[] ModeNum, byte[] WeaponLimit, byte[] IsTeamBalance, byte[] Status, string[] RoomOwnerIP, int[] GameMinute, string[] RoomOwnerName, byte[] IsSpecial, byte[] IsPassword, byte[] BotDifficult, byte[] BotModeUserTeamNum);
	bool rfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex);
	bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, const string& UserID, int TeamNum, int Grade, const string& UserIP, const string& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckLeaveChannel(int Result, const string& UserID, int UID);
	bool LobbyToServerSelection();
	bool LobbyToServerSelection_OnOK(class UGUIComponent* Sender);
	bool rfAckEnterChannel(int id, int UID, const string& UserID, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckCreateGameRoom(int Result, const string& ErrMsg, int UserID, const string& RoomOwnerIP, const struct FGameRoomInfo& NetRoomInfo);
	void TeamChatLog(const string& cL);
	void BroadCastItemChatLog(const string& cL);
	void SystemChatLog(const string& cL);
	void SelfChatLog(const string& cL);
	void WhisperChatLog(const string& cL);
	void ClanChatLog(const string& cL);
	void NormalChatLog(const string& cL);
	void ClearChatLog();
	void OnVisibleChannelListChanged(int Index);
	bool InternalKeyType(const string& Unicode, byte* key);
	bool internalKeyEvent(float Delta, byte* key, byte* Action);
	void InternalOnClose(bool bCanceled);
	void BTPageLobby_OnReceivedPing(class UwMatchMaker* MM, const string& fromAddr, int msec);
	void RefreshPage();
	void UnInitializeDelegate();
	void InitializeDelegate();
	void UpdateWebzenItemList(class UwGameManager* GameMgr);
	void UpdateItemList(class UwGameManager* GameMgr);
	void UpdateBlockList(class UwMatchMaker* MM);
	void UpdatePCBangList(class UwMatchMaker* MM);
	void UpdateClanList(class UwMatchMaker* MM);
	void UpdateFriendList(class UwMatchMaker* MM);
	void UpdateQuestList(class UwMatchMaker* MM);
	void UpdatePositionInfo(class UwMatchMaker* MM);
	void UpdatePCBangInfo(class UwMatchMaker* MM);
	void UpdateRecv_CharInfo(class UwMatchMaker* MM);
	void UpdateMoneyInfo(class UwMatchMaker* MM);
	void UpdateEquipItemInfo(class UwMatchMaker* MM);
	void UpdateRankingInfo(class UwMatchMaker* MM);
	void UpdateClanInfo(class UwMatchMaker* MM);
	void UpdateCharInfo(class UwMatchMaker* MM);
	void OnCompleteOpened();
	void OnBackToLastPage();
	void InternalOnOpen();
	bool BTWindowDefineARHK_46_OnCancel(class UGUIComponent* Sender);
	bool BTWindowDefineARHK_46_OnOK(class UGUIComponent* Sender);
	bool BTWindowDefineARHK_22_OnCancel(class UGUIComponent* Sender);
	bool BTWindowDefineARHK_22_OnOK(class UGUIComponent* Sender);
	void StartTutorial(const string& Map);
	bool BTWindowDefineARHK_43(class UGUIComponent* Sender);
	void ShowTutorialWindow();
	void InternalOnReOpen();
	bool rfAckProcessPreLoginUser(int Result, const string& ErrMsg);
	bool rfAckLoginInHouseTest(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg, const string& BDay, byte Sex, const struct FBtrDouble& ServerTime);
	bool Exit_OnOK(class UGUIComponent* Sender);
	bool ForceDisconnect_OnOK(class UGUIComponent* Sender);
	void TcpLogin_OnConnect(int ErrCode);
	class UBTTcpLink_Login* GetTcpLogin();
	class UBTTcpLink_Channel* GetTcpChannel();
	bool Internal_OnPreDraw(class UCanvas* C);
	bool TPMessenger_ButtonMsg_OnClick(class UGUIComponent* Sender);
	void TPMessenger_ACLMsg0_OnHitBottom(int Top, int Count, int itemperpage);
	void ACLLobby_OnHitBottom(int Top, int Count, int itemperpage);
	bool TestButton_OnClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool MoveToRoom(int Index);
	bool AutoMoveReturnClanReadyRoom(int RoomNum, const string& Password);
	bool AutoMoveToClanReadyRoom(int RoomNum, const string& Password);
	bool AutoMoveToRoom(int RoomNum, const string& Password);
	bool OnLobby_DblClick(class UGUIComponent* Sender);
	bool BTWindowPasswordHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowPasswordHK_OnOK(class UGUIComponent* Sender);
	bool rfAckEnterRoom_AfterJoinRoom(int GameNum, int OwnerID, int UID, const string& UserID, int TeamNum, int Grade, const string& UserIP, const string& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckEnterRoom_AfterCreateRoom(int GameNum, int OwnerID, int UID, const string& UserID, int TeamNum, int Grade, const string& UserIP, const string& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckClanMatch_Join(int Result, const string& ErrMsg);
	bool rfAckClanMatch_GetReady(int Result, const string& ErrMsg, int RoomIndex);
	bool BTWindowDefineSelectHK_23_OnOK(class UGUIComponent* Sender);
	bool ButtonRegularClanWar_OnClick(class UGUIComponent* Sender);
	bool ButtonFriendlyClanWar_OnClick(class UGUIComponent* Sender);
	void OpenBTWindowCreateRoom();
	bool OnBottomButton_Click(class UGUIComponent* Sender);
	void OnPopupPCBang(int ContextMenuIndex, class UBTACLMessengerPCBangHK* acl);
	void OnPopupPCBangCheck(class UBTACLMessengerPCBangHK* acl, class UBTCMMessengerPCBangHK* cm);
	void OnPopupBan(int ContextMenuIndex, class UBTACLMessengerBanHK* acl);
	void OnPopupBanCheck(class UBTACLMessengerBanHK* acl, class UBTCMMessengerBanHK* cm);
	void OnPopupClan(int ContextMenuIndex, class UBTACLMessengerClanHK* acl);
	void OnPopupClanCheck(class UBTACLMessengerClanHK* acl, class UBTCMMessengerClanHK* cm);
	void OnPopupFriend(int ContextMenuIndex, class UBTACLMessengerFriendHK* acl);
	void OnPopupFriendCheck(class UBTACLMessengerFriendHK* acl, class UBTCMMessengerFriendHK* cm);
	void OnPopupChannel(int ContextMenuIndex, class UBTACLMessengerChannelHK* acl);
	void OnPopupChannelCheck(class UBTACLMessengerChannelHK* acl, class UBTCMMessengerChannelHK* cm);
	bool ProcessQuickEnter(int MapIndex, int GameMode, int WRestrict, int botLevel);
	bool QuickEnter_OnOK();
	bool BTWindowInviteClan_OnOK(class UGUIComponent* Sender);
	bool WindowRequestFriend_OnCancel(class UGUIComponent* Sender);
	bool WindowRequestFriend_OnOK(class UGUIComponent* Sender);
	bool WindowInviteFriend_OnOK(class UGUIComponent* Sender);
	bool BTWindowCreateRoom_OnOK(class UGUIComponent* Sender);
	class UBTWindowCreateRoom* GetWindowCreateRoom();
	bool TopButton_OnClick(class UGUIComponent* Sender);
	bool HeaderButton_OnClick(class UGUIComponent* Sender);
	bool delegateAckEnterRoom(int GameNum, int OwnerID, int UID, const string& UserID, int TeamNum, int Grade, const string& UserIP, const string& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
};


// Class GUIWarfare.BTPageServerSelection
// 0x0144 (0x07B0 - 0x066C)
class UBTPageServerSelection : public UBTNetGUIPageHK
{
public:
	class UClanNameAndMark*[]                          ClanMarkList;                                             // 0x066C(0x000C) (NeedCtorLink)
	class UGUIPage*                                    SavePg;                                                   // 0x0678(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UCanvas*                                     SaveCanvas;                                               // 0x067C(0x0004)
	bool                                               bButtonRefresh;                                           // 0x0680(0x0004)
	int                                                SaveServerListIndex;                                      // 0x0684(0x0004)
	int                                                ToggleButCredit;                                          // 0x0688(0x0004)
	float                                              CurrentTime;                                              // 0x068C(0x0004)
	float                                              LastRefreshTime;                                          // 0x0690(0x0004)
	float                                              RefreshCycleTime;                                         // 0x0694(0x0004)
	struct FConnectingInfo                             ConnectingChannel;                                        // 0x0698(0x001C) (NeedCtorLink)
	struct FFloatBox                                   fbLabelBackground;                                        // 0x06B4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelBackground;                                          // 0x06C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelBackgrounddeco;                                    // 0x06C8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelBackgrounddeco;                                      // 0x06D8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonServerList[0x7];                                    // 0x06DC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTACLServerSelectionHK*                     ACLServerList[0x7];                                       // 0x06F8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UTabControlMocker*                           TabControl;                                               // 0x0714(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPTopMenuSCHK*                            TPTopMenu;                                                // 0x0718(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strButtonCredit;                                          // 0x071C(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonCredit;                                             // 0x0728(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ChannelADSmall;                                           // 0x072C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ChannelADLarge;                                           // 0x0730(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTemp;                                               // 0x0734(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTemp2;                                              // 0x0738(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         BGImageTotalServer;                                       // 0x073C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FCheckToReceivedPacket                      CTRP;                                                     // 0x0740(0x0004)
	string                                             strPCBangFriend;                                          // 0x0744(0x000C) (Localized, NeedCtorLink)
	string                                             HashMessage;                                              // 0x0750(0x000C) (Localized, NeedCtorLink)
	string                                             strCW_GameMode;                                           // 0x075C(0x000C) (Localized, NeedCtorLink)
	string                                             strLotteryWinner;                                         // 0x0768(0x000C) (Localized, NeedCtorLink)
	string                                             strSpecialCompleteUser;                                   // 0x0774(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonEnterCh;                                            // 0x0780(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTACLGroutSelection*                        ServerList;                                               // 0x0784(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTACLServerSelectionHK*                     ChannelList;                                              // 0x0788(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bDefaultServnChannel;                                     // 0x078C(0x0004)
	class UBTOwnerDrawImageHK*                         ChannelBg;                                                // 0x0790(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbChannelBg;                                              // 0x0794(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                nIndexDefSrv;                                             // 0x07A4(0x0004)
	int                                                nIndexDefCh;                                              // 0x07A8(0x0004)
	byte                                               iProcessExpiredStep;                                      // 0x07AC(0x0001)
	byte                                               Padding00[0x3];                                           // 0x07AD(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageServerSelection");
		return ptr;
	}


	bool rfAckPcBangItemList(int[] ItemTID, int[] PartID);
	bool rfAckSendGift(int Result, const string& ErrMsg, int PointRemain, int CashRemain);
	bool rfReqAddSpecialRank(const string& NickName);
	bool rfAckSpecialQuestRank(string[] CharList);
	bool rfAckReceiveSpecialReward(int Result, int RewardedQuestID, byte RewardedQuestIsComplete, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount);
	bool rfAckDailyRewardListThisMonth(byte[] Type, byte[] Number, int[] ItemID, int[] ItemCount);
	bool rfAckPuzzleList(int Result, byte IsComplete, byte[] UpdatedNum, byte[] StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfAckAttendanceList(int Result, byte IsComplete, byte UpdatedNum, byte[] StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfAckSetCommunityOption(int Result, const string& ErrStr);
	bool rfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite);
	bool rfChangeItemInstanceInfo(int ErrorCode, int ItemID, const struct FBtrDouble& ItemUniqueID, byte ChangeCount, int RemainCount);
	bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, byte IsNotification, string[] NickName, struct FBtrDouble[] Time, int GetItemID);
	bool rfAckGetItemFromItemBox(int Result, const string& ErrMsg, int ItemIDChoose, int PartIDChoose, const struct FBtrDouble& BoxItemIdx, int BxoItemCount, byte bHave, const struct FBtrDouble& ItemIdx, const struct FBtrDouble& UntilTime, int StackCount);
	void End_WindowRandBox();
	void WindowCapsuleGet_OnInventory();
	bool rfNotifyCouponUseError(int Time);
	bool rfAckRecvClanInviteResult(int Result, const string& ErrMsg);
	bool BTWindowRequestClanHK_OnSuspend(class UGUIComponent* Sender);
	bool BTWindowRequestClanHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowRequestClanHK_OnOK(class UGUIComponent* Sender);
	bool rfReqRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& ClanName, const string& InviteMsg);
	bool rfReqNotifyShopItemDataEnd(int Ver);
	bool rfReqNotifyShopPackageItemData(int PackageProductNo, int[] ProductCode, int[] ProductQuantity, int[] ProductHour, const string& Description);
	bool rfReqNotifyShopItemData(int[] ProductNo, string[] ProductName, int[] ProductCode, byte[] SaleType, int[] ProductCost, int[] ProductHour, int[] ProductQuantity, int[] SaleMasterFlag, int[] SaleStatus, int[] IsGift, struct FBtrDouble[] SaleEndTime, int[] Discountcost);
	bool rfAckShopItemData();
	bool rfAckLoginWithIndonesia(int Result);
	bool rfAckLoginWithGlobal(int Result);
	bool rfAckLoginWithThailand(int Result);
	bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType);
	bool rfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock);
	bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, const string& ErrMsg);
	bool rfAckTencent_StartTenProtect(int CharDBID);
	bool rfAckMoveToLobby(byte MessageType);
	bool rfAckPopUpMessage(int MessageType);
	bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckLogOut(byte Result, byte Reason);
	bool rfAckServerType(byte Type);
	void Receive_EventGift(int Index);
	bool rfAckRecvSystemMsg(byte CommunityType, const struct FSystemMsgParam& MsgInfo);
	bool rfAckPaidItem_RelayBroadcast(const string& CharName, const string& Msg);
	bool rfAckChatClan(const string& CharName, const string& Message, int Result);
	bool rfReqRecvChatWispher(const string& CharnameFrom, const string& Message);
	bool rfAckChatNormal(int id, const string& Sender, const string& Message, int Result);
	bool rfAckSetLookForClan(int Result, const string& ErrMsg, byte IsLookingFor);
	bool rfAckGetMyMailBoxState(int Result, byte IsFull, int NewMailCount);
	bool BTWindowDefineARHK_40_41_OnOK(class UGUIComponent* Sender);
	bool rfAckClientChecksum(int Result);
	bool rfAckClientChallenge(const string& Key1, const struct FBtrDouble& Key2);
	void ChatBlockEndTime_OnEventTimer(int Index);
	void ChatBlockStartTime_OnEventTimer(int Index);
	bool rfAckCharBlockInfo(int Result, const struct FBtrDouble& ChatBlockStartTime, const struct FBtrDouble& ChatBlockEndTime, struct FBtrDouble[] BlockedItemIdx);
	bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID);
	bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID);
	bool rfAckForceDisconnectUser_GM(int Result, const string& ErrMsg, const string& CharName);
	bool rfAckNotice_GM(int Result, const string& ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const string& Msg);
	bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, const string& NewRoomTitle);
	bool rfAckPaidItem_NotifyChangeClanMark(const string& ClanName, int Pattern, int BG, int BL);
	bool rfAckPaidItem_ChangeClanMark(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_ClanMarkDupCheck(int Result, const string& ErrMsg);
	bool rfAckPaidItem_NotifyChangeClanname(const string& NewClanname);
	bool rfAckPaidItem_ChangeClanname(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const string& NewClanname);
	bool rfAckPaidItem_ChangeCharname(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const string& NewCharname);
	bool rfAckPaidItem_BroadCast(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_EraseRecord(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int Command, int RemainCount);
	bool rfAckWebzenBillingUseStorageItem(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID, const struct FBtrDouble& ItemExtra);
	bool rfAckWebzenBillingStorageListEnd();
	bool rfAckWebzenBillingStorageList(int[] Seq, int[] ItemSeq, int[] GroupCode, int[] ShareFlag, int[] ProductSeq, string[] CashName, struct FBtrDouble[] CashPoint, string[] SendAccountID, string[] SendMessage, byte[] ItemType, byte[] RelationType, int[] ProductType, int[] PriceSeq);
	bool rfAckWebzenBillingStorageListStart(int Result, const string& ErrMsg, int TotalCount, int TotalPage, int CurPage);
	bool rfAckRemoveBlockUserList(int Result, const string& ErrMsg);
	bool rfAckAddBlockUserList(int Result, const string& ErrMsg);
	bool rfAckEquipItem(int ChangedNewItemID, const struct FBtrDouble& ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, const struct FBtrDouble& ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, const string& ErrMsg);
	bool rfAckRandomBox_Use(int Result, const string& ErrMsg, const struct FBtrDouble& RandomBoxItemIdx, int RandomBxoItemCount, const struct FBtrDouble& KeyItemIdx, int KeyItemRemainCount, int[] ItemIDChoose, int[] PartIDChoose, int[] PeriodOnChoosenItem, int[] StackCountOnChoosenItem, byte[] bHave, struct FBtrDouble[] ItemIdx, struct FBtrDouble[] UntilTime, int[] StackCount);
	bool rfAckBlockUserList(string[] CharName);
	bool rfAckBlockUserListEnd();
	bool rfAckBlockUserListStart(int Result, int TotalCount);
	bool rfAckPCBangUserListEnd();
	bool rfAckPCBangUserList(string[] FriendName, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] Level, int[] ClanGrade, int[] ClanWin, int[] ClanLose, byte[] IsLookForClan, byte[] IsCombat, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckPCBangUserListStart(int Result, int TotalCount);
	bool rfAckFriendListEnd();
	bool rfAckFriendList(string[] FriendName, byte[] IsLogOn, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] LevelMarkID, int[] ClanLevel, int[] Level, byte[] IsLookForClan);
	bool rfAckFriendListStart(int Result, int TotalCount);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserList(int Result, const string& ErrMsg, int[] Level, string[] CharName, byte[] ClanGrade, int[] ClanWinCnt, int[] ClanLoseCnt, int[] LevelMarkID, int[] TitleMarkID, int[] DudeId);
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfAckRegisterMainPCBang(int Result, const string& ErrMsg);
	bool rfAckClanInfo(const struct FClanInfo& stClanInfo);
	bool rfAckCharInfo(int Result, const string& ErrMsg, int UserID, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FCharInfo& stCharInfo, byte InClanRank, int ClanLevel);
	bool rfAckRegisteredPCBangInfo(int Result, const string& ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, const string& PCBangName);
	bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckMyMoney(int Result, const string& ErrMsg, int Point, int Cash);
	bool rfAckBuyItemByWebzenCash(int Result, const string& ErrMsg);
	bool rfAckWebzenCash(int Result, const string& ErrMsg, const struct FBtrDouble& PCoinCash, const struct FBtrDouble& CCoinCash);
	bool rfReqDailyQuestNewAvailable(int[] ExpiredQuestID, int[] NewQuestID);
	bool rfReqQuestNewAvailable(int[] AchivedQuestID, int[] NewQuestID, byte[] IsDailyQuest, int[] ExpiredQuest);
	bool rfAckQuestUpdate(int Result, const string& ErrMsg);
	bool rfAckQuestListEnd();
	bool rfAckQuestList(int[] QuestID, int[] CountPrograss, byte[] IsDailyQuest, byte[] IsComplete);
	bool rfAckQuestListStart(int Result, const string& ErrMsg);
	bool rfAckLimitedListInChannel(int Result, int[] LimitedMapID, int[] LimitedModeID);
	bool rfReqClanMatch_InviteCrewResult(const string& Invitee, int Result);
	bool BTWindowInviteClanWarGameHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowInviteClanWarGameHK_OnOK(class UGUIComponent* Sender);
	bool rfReqClanMatch_RecvInviteCrew(const string& Inviter, const string& ServerIP, int Port, int WaittingID, const string& Msg, int MapNum, int InviteUserChannelNum, const string& LeaderName, const string& RoomName);
	bool rfAckClanMatch_InviteCrew(int Result, const string& ErrMsg);
	bool rfAckRecvInviteGameRoomResult(int Result);
	bool BTWindowInviteGameHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowInviteGameHK_OnOK(class UGUIComponent* Sender);
	bool rfReqRecvInviteGameRoom(const string& InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, const string& RoomUniqueID, int RoomNumber, const string& RoomName, byte RoomState, const string& MapName, const string& OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, const string& Password, const string& InviteCharName);
	bool rfAckInviteGameRoom(int Result, byte Answer, const string& GuestCharName);
	bool rfAckCharInfoFromLoginServer(int Result, const string& CharName, int Level, int Exp, const string& ClanName);
	bool BTWindowItemBoxHK_OnOK(class UGUIComponent* Sender);
	bool rfAckItemListInItemBox(int Result, const string& ErrMsg, const struct FBtrDouble& ItemUniqueID, int BoxItemID, int[] ItemID, int[] PartID, byte FromContent);
	bool Internal_OnPreDraw(class UCanvas* C);
	bool rfAckGetServerTime(const struct FBtrDouble& ServerTime, const string& ClientIP);
	bool rfAckLoginInHouseTest(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg, const string& BDay, byte Sex, const struct FBtrDouble& ServerTime);
	bool rfAckExceedMaxUser();
	bool BackToServerSelection_OnClick(class UGUIComponent* Sender);
	bool rfReqRecvForceDisconnected_FromGM(int Result, const string& ErrMsg);
	bool rfReqRecvNotice_FromGM(int Result, const string& ErrMsg, string[] NoticeMsg, byte IsFromDB);
	bool rfAckRepairItem(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int RepairCost, int[] DamageDegree);
	bool rfAckRepairCost(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int[] RepairCost);
	bool rfReqNotifyDurabilityZeroItem(int Result, const string& ErrMsg, int UserID, struct FBtrDouble[] ItemUniqueIDs, int[] ItemIDs, int[] ItemPartIDs, byte[] ItemSlotPos);
	bool BTWindowBuyShopItem_OnOK(class UGUIComponent* Sender);
	bool rfAckUpdateQSlot(int Result, const string& ErrMsg);
	void ExpiredItemToRenew(class UBTExpiredItem*[] ExpiredItems, class UwItemBoxHK* ItemInfo, int iSlotPosition, const struct FBtrDouble& OldUniqueID, const struct FBtrDouble& NewUniqueID);
	bool rfAckBuyShopItem(int ItemCount, int[] Result, int[] BoughtItemTypeID, struct FBtrDouble[] BoughtItemUniqueID, int[] BoughtPartID, struct FBtrDouble[] BoughtUntilTIme, int[] BoughtStackCnt, int PointRemain, int CashRemain);
	bool BTWindowItemExpiredHK_OnOK_CheckDurX(class UGUIComponent* Sender);
	bool rfAckNotifyExpiredSkillIDs(byte[] DisplayOrder, byte[] SlotPos, int[] ItemTID, struct FBtrDouble[] ItemUID);
	bool rfAckNotifyExpiredItemIDs(byte[] DisplayOrder, byte[] SlotPos, int[] ItemTID, struct FBtrDouble[] ItemUID);
	bool rfReqNotifyRelayServerAddr(const string& RelayIP, int RelayPort);
	bool rfAckHash_BTWindowErrorDefineHK_OnOK(class UGUIComponent* Sender);
	bool rfAckHash(int Result, const string& Error);
	void CheckToSetPageLobby();
	bool rfAckServerTime(int Time);
	bool rfAckUpdateQSlot_2(int Result, const string& ErrMsg, byte[] DisplayOrder, int[] ItemTID, struct FBtrDouble[] ItemUID, byte[] SlotPos_Key, byte[] SlotPos_Value);
	bool rfAckQSlotList_2(int Result, const string& ErrMsg, byte[] QSlotDispOrder, int[] QSlotIDX, int[] ItemTID, struct FBtrDouble[] ItemUID, byte[] SlotPos);
	void AckQuickSlot(bool removeSlot, int QSlotID, const struct FBtrDouble& MWItemID, const struct FBtrDouble& PistolItemID, const struct FBtrDouble& KnifeItemID, const struct FBtrDouble& TWItemID1, const struct FBtrDouble& TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4);
	void SetQuickSlotSkillData(bool removeSlot, int QSlotID, int slotNum, int SkillUniqueID);
	void SetQuickSlotItemData(bool removeSlot, int QSlotID, int slotNum, const struct FBtrDouble& ItemUniqueID);
	bool rfAckExpandSlotConfirm(int Result, const string& ErrMsg, int QSlotID, const struct FBtrDouble& MWItemID, const struct FBtrDouble& PistolItemID, const struct FBtrDouble& TWItemID1, const struct FBtrDouble& TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4, const struct FBtrDouble& KnifeItemID);
	bool rfAckQSlotList(int Result, const string& ErrMsg, int[] QSlotID, string[] QSlotName, byte[] QSlotDispOrder, struct FBtrDouble[] MWItemID, struct FBtrDouble[] PistolItemID, struct FBtrDouble[] TWItemID1, struct FBtrDouble[] TWItemID2, int[] Skill1, int[] Skill2, int[] Skill3, int[] Skill4, struct FBtrDouble[] KnifeItemID);
	bool rfAckUserSkillListEnd();
	bool rfAckUserSkillList(int[] UniqueSkillID, int[] SkillID, struct FBtrDouble[] UntilTime, byte[] SlotPosition);
	bool rfAckUserSkillListStart(int Count, int Result, const string& ErrMsg);
	bool rfAckItemListEnd();
	bool rfAckItemList(struct FBtrDouble[] UniqueID, int[] ItemID, int[] ItemType, int[] Durability, struct FBtrDouble[] UntilTime, int[] SlotPosition, int[] AddPartsID, int[] DamageDegree, byte[] ItemState, int[] StackCount, int[] PaintID, int[] TradeCount);
	bool rfAckItemListStart(int Count, int Result, const string& ErrMsg);
	bool rfAckLogin2(int Result, const string& ErrMsg, int UserID, const string& CharName, const struct FBtrDouble& CurServerTime, int CharDBID, byte IsGM);
	bool rfAckLeaveChannel(int Result, const string& UserID, int UID);
	bool rfAckEnterChannel(int id, int UID, const string& UserID, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool Exit_OnOK(class UGUIComponent* Sender);
	void TcpChannel_OnError(int ErrCode);
	void TcpChannel_OnClose(int ErrCode);
	void TcpChannel_OnConnect(int ErrCode);
	void TcpLogin_OnConnect(int ErrCode);
	void NewDrawServerSelection(string[] CServername, string[] CServerShortName, string[] ServerIP, int[] serverPort, string[] ChannelName, string[] ChannelNickName, int[] ChannelNum, int[] chMaxUser, int[] chCurUser, string[] ServerGroupName, int[] ServerGroupID, int[] ServerDispOrder, int[] DataPort, byte[] OptionCount_byte, byte[] OptionKey_byte, byte[] OptionValue_byte, byte[] OptionCount_int, byte[] OptionKey_int, int[] OptionValue_int, byte[] OptionCount_float, byte[] OptionKey_float, float[] OptionValue_float, byte[] IsClanChannel, byte[] IsUseDedicateHost);
	bool rfAckServerListFromLoginServer(string[] CServername, string[] CServerShortName, string[] ServerIP, int[] serverPort, string[] ChannelName, string[] ChannelNickName, int[] ChannelNum, int[] chMaxUser, int[] chCurUser, string[] ServerGroupName, int[] ServerGroupID, int[] ServerDispOrder, int[] DataPort, byte[] OptionCount_byte, byte[] OptionKey_byte, byte[] OptionValue_byte, byte[] OptionCount_int, byte[] OptionKey_int, int[] OptionValue_int, byte[] OptionCount_float, byte[] OptionKey_float, float[] OptionValue_float, byte[] IsClanChannel, byte[] IsUseDedicateHost);
	void MoveToChannel(class UBTACLServerSelectionHK* serverACL);
	void FirstShowChannelList();
	void ShowChannelList(class UBTACLGroutSelection* serverACL);
	void NewMoveToChannel(class UBTACLServerSelectionHK* serverACL);
	void AutoMoveTochannel(int ServerID, int ChannelID);
	void AutoMoveAtFirstLogin();
	void OnVisibleChannelListChanged(int Index);
	void InternalOnClose(bool bCanceled);
	void RefreshVisibleSet();
	void RefreshPage();
	void UnInitializeDelegate();
	void InitializeDelegate();
	void TestTestTest();
	void LogControllerInfo();
	void LogMenuStack();
	void OnBackToLastPage();
	void InternalOnOpen();
	void InternalOnReOpen();
	void DefaultSvrnChSelect();
	void ApplyLocalizedString();
	bool ButtonTemp2_OnClick(class UGUIComponent* Sender);
	bool ButtonTemp_OnClick(class UGUIComponent* Sender);
	void Event3_Timer(int Index);
	void Event0_Timer(int Index);
	void gameMgr_UpdateEventTimer(int EventType, const struct FBtrDouble& EventTime);
	bool ButtonCredit_OnClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	class UBTOwnerDrawCaptionButtonHK* NewButtonComponent(const struct FFloatBox& fbNewCompo, float RenderWeight);
	class UBTOwnerDrawImageHK* NewLabelComponent(const struct FFloatBox& fbNewCompo, const struct FImage& bgImg, float RenderWeight);
	void ExitGame();
	bool HeaderButton_OnClick(class UGUIComponent* Sender);
	class UBTTcpLink_Login* GetTcpLogin();
	class UBTTcpLink_Channel* GetTcpChannel();
};


// Class GUIWarfare.BTPageMatchResult
// 0x0098 (0x0704 - 0x066C)
class UBTPageMatchResult : public UBTNetGUIPageHK
{
public:
	bool                                               bPrecachingRender;                                        // 0x066C(0x0004)
	class ABTROModelWeapon*                            romodelweapon1;                                           // 0x0670(0x0004)
	class ABTROModelWeapon*                            romodelweapon2;                                           // 0x0674(0x0004)
	class ABTROModelNew*                               romodelnew;                                               // 0x0678(0x0004)
	float                                              ButtonCloseEnableTime;                                    // 0x067C(0x0004)
	float                                              DefaultButtonCloseEnableTime;                             // 0x0680(0x0004)
	string                                             strButtonClose;                                           // 0x0684(0x000C) (Localized, NeedCtorLink)
	bool                                               bCanClose;                                                // 0x0690(0x0004)
	class AGameInfo*                                   GI;                                                       // 0x0694(0x0004) (Transient)
	struct FFloatBox                                   fbLabelBottomLine;                                        // 0x0698(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelBottomLine;                                          // 0x06A8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonClose;                                            // 0x06AC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonClose;                                              // 0x06BC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPResult;                                               // 0x06C0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPMatchResultCommonHK*                    TPResultCommon;                                           // 0x06D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPMatchResultPrivateHK*                   TPResultPrivate;                                          // 0x06D4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPMatchResultAlien*                       TPResultAlien;                                            // 0x06D8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbBGDeco;                                                 // 0x06DC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         BGDeco;                                                   // 0x06EC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTopBg;                                                  // 0x06F0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         TopBg;                                                    // 0x0700(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageMatchResult");
		return ptr;
	}


	class UBTTcpLink_Channel* GetTcpChannel();
	bool InternalOnPreDraw(class UCanvas* C);
	bool internalKeyEvent(float Delta, byte* key, byte* Action);
	bool InternalOnCanClose(bool bCancelled);
	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
	void UnInitializeDelegate();
	void InitializeDelegate();
	bool HeaderButton_OnClick(class UGUIComponent* Sender);
	void UpdateRecv_CharInfo(class UwMatchMaker* MM);
	void UpdateItemList(class UwGameManager* GameMgr);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool ButtonClose_OnClick(class UGUIComponent* Sender);
	bool BTWindowTrophyHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowTrophyHK_OnOK(class UGUIComponent* Sender);
	bool BTWindowAlreadyGotTrophyHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowAlreadyGotTrophyHK_OnMail(class UGUIComponent* Sender);
	bool BTWindowAlreadyGotTrophyHK_OnInventory(class UGUIComponent* Sender);
	bool SameWeaponAddTime_OnCancel(class UGUIComponent* Sender);
	bool SameWeaponAddTime_OnOK(class UGUIComponent* Sender);
	bool SameWeaponAddCount_OnCancel(class UGUIComponent* Sender);
	bool SameWeaponAddCount_OnOK(class UGUIComponent* Sender);
	bool SameWeapon_OnCancel(class UGUIComponent* Sender);
	bool SameWeapon_OnOK(class UGUIComponent* Sender);
	void NeedUpdate();
	bool BTWindowTrophyHK_OpenMenu(class UGUIComponent* Sender);
	bool BTWindowPromotionToTrophy_OpenMenu(class UGUIComponent* Sender);
	bool BTWindowQuestInfoToTrophy_OpenMenu(class UGUIComponent* Sender);
	bool BTWindowQuestInfoHK_OpenMenu(class UGUIComponent* Sender);
	bool BTWindowPromotionToQuestInfo_OpenMenu(class UGUIComponent* Sender);
	bool BTWindowNoUpdateQuestHK_OpenMenu(class UGUIComponent* Sender);
	bool BTWindowPromotionToNoUpdateQuestHK_OpenMenu(class UGUIComponent* Sender);
	void MatchReultPostStep();
};


// Class GUIWarfare.BTPageAuction
// 0x00EC (0x0758 - 0x066C)
class UBTPageAuction : public UBTNetGUIPageHK
{
public:
	bool                                               bChangePage;                                              // 0x066C(0x0004)
	float                                              LastRefreshTime[0x2];                                     // 0x0670(0x0004)
	float                                              RefreshCycleTime[0x2];                                    // 0x0678(0x0004)
	string                                             strSuccessAuctionCancel;                                  // 0x0680(0x000C) (Localized, NeedCtorLink)
	struct FBtrDouble[]                                MyAuctionItemUniqueID;                                    // 0x068C(0x000C) (NeedCtorLink)
	string                                             strSuccessBidding[0x2];                                   // 0x0698(0x000C) (Localized, NeedCtorLink)
	int                                                SavePageNum;                                              // 0x06B0(0x0004)
	class UwMyPlayerStatus*                            MyStatus;                                                 // 0x06B4(0x0004)
	struct FFloatBox                                   fbLabelPoint;                                             // 0x06B8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelCash;                                              // 0x06C8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelPoint;                                               // 0x06D8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelCash;                                                // 0x06DC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelP;                                                 // 0x06E0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelC;                                                 // 0x06F0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelP;                                                   // 0x0700(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelC;                                                   // 0x0704(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemCommonInfoHK*                         MyData;                                                   // 0x0708(0x0004)
	class UBTTPAuctionHK*                              TPAuction;                                                // 0x070C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FSearchAuctionItem                          SAItem;                                                   // 0x0710(0x0028) (NeedCtorLink)
	bool                                               bToggleTest;                                              // 0x0738(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTest;                                               // 0x073C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                LastReqRepairMode;                                        // 0x0740(0x0004)
	int                                                RepairAllButtonID;                                        // 0x0744(0x0004)
	struct FBtrDouble                                  SellShopItemInfo_UniqueItemID;                            // 0x0748(0x0008)
	struct FBtrDouble                                  Repair_UniqueItemID;                                      // 0x0750(0x0008)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageAuction");
		return ptr;
	}


	bool rfAckRepairItem(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int RepairCost, int[] DamageDegree);
	bool rfAckRepairCost(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int[] RepairCost);
	bool RepairAllItem_OnOK(class UGUIComponent* Sender);
	bool BTWindowItemRepairAllHK_OnOK(class UGUIComponent* Sender);
	bool RepairItem_OnOK(class UGUIComponent* Sender);
	bool BTWindowItemRepairHK_OnOK(class UGUIComponent* Sender);
	bool Internal_OnPreDraw(class UCanvas* C);
	bool rfAckAuctionInstantlyBuying(int Result, const string& ErrMsg, int PointRemain);
	bool rfAckAuctionBidding(int Result, const string& ErrMsg, int PointRemain);
	void UpdateAuctionList();
	bool rfAckAuctionTradeHistory(int Result, const string& ErrMsg, int ItemID, int PartID, string[] SellerCharNm, int[] DamageDegree, int[] Price);
	bool rfAckAuctionMyItemCancel(int Result, const string& ErrMsg);
	bool rfAckAuctionMyItemRegister(int Result, const string& ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain);
	bool rfAckAuctionItemListEnd(byte Section);
	bool rfAckAuctionItemList(byte Section, int[] UniqueIDs, int[] ItemIDs, int[] AddPartsIDs, struct FBtrDouble[] UntilTimes, int[] BiddingPrices, int[] InstantlyByuingPrices, int[] ItemDamageds, string[] HighestBidderNames, string[] SellerNames, int[] ItemCount);
	bool rfAckAuctionItemListStart(int Result, const string& ErrMsg, byte Section, int PageNum, int Count);
	bool rfAckAuctionItemListCount(int Result, const string& ErrMsg, byte Section, byte Classfy, int ItemType, int ItemGrade, int Count);
	void SortAuctionItemList(int SortType);
	bool sfReqAuctionItemList(int Section, const string& Keyword, int ItemRank, byte ItemClassify, byte IsAvailable, int PageNum, int Count, int SortType);
	void RefreshAuction(bool bStopLoop);
	void RefreshCashNPoint();
	class UBTTcpLink_Channel* GetTcpChannel();
	bool internalKeyEvent(float Delta, byte* key, byte* Action);
	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
	void UnInitializeDelegate();
	void InitializeDelegate();
	void UpdateServerTime(class UwGameManager* GameMgr);
	void UpdateItemList(class UwGameManager* GameMgr);
	void UpdateMoneyInfo(class UwMatchMaker* MM);
	void InitializeCashNPoint();
	bool ButtonTest_OnClick(class UGUIComponent* Sender);
	void TeamChatLog_Extra(const string& cL);
	void BroadCastItemChatLog_Extra(const string& cL);
	void SystemChatLog_Extra(const string& cL);
	void SelfChatLog_Extra(const string& cL);
	void WhisperChatLog_Extra(const string& cL);
	void ClanChatLog_Extra(const string& cL);
	void NormalChatLog_Extra(const string& cL);
	void ClearChatLog_Extra();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void TPMyAuction_PageButton_OnClick(int pageIndex);
	void TPBuying_PageButton_OnClick(int pageIndex);
	bool TPAuction_TabButton_OnClick(class UGUIComponent* Sender);
	bool HeaderButton_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfare.BTPageHelp
// 0x0004 (0x0670 - 0x066C)
class UBTPageHelp : public UBTNetGUIPageHK
{
public:
	class UBTOwnerDrawImageHK*                         HelpImage;                                                // 0x066C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageHelp");
		return ptr;
	}


	class UBTTcpLink_Channel* GetTcpChannel();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
};


// Class GUIWarfare.BTPageMail
// 0x00EC (0x0758 - 0x066C)
class UBTPageMail : public UBTNetGUIPageHK
{
public:
	string                                             strDeleteWindow[0x4];                                     // 0x066C(0x000C) (Localized, NeedCtorLink)
	class UBTTPMailHK*                                 TPMail;                                                   // 0x069C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPMailReadHK*                             TPMailRead;                                               // 0x06A0(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPMailWriteHK*                            TPMailWrite;                                              // 0x06A4(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbBGImageLeft;                                            // 0x06A8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbBGImageRight;                                           // 0x06B8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         BGImageLeft;                                              // 0x06C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         BGImageRight;                                             // 0x06CC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonWrite;                                              // 0x06D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 BtnDeleteAll;                                             // 0x06D4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strButtonWrite;                                           // 0x06D8(0x000C) (Localized, NeedCtorLink)
	string                                             strBtnDeleteAll;                                          // 0x06E4(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonWrite;                                            // 0x06F0(0x0010)
	struct FFloatBox                                   fbBtnDeleteAll;                                           // 0x0700(0x0010)
	class UBTOwnerDrawImageHK*                         LabelWarning;                                             // 0x0710(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabelWarning;                                          // 0x0714(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabelWarning;                                           // 0x0720(0x0010)
	string                                             strSendMemoCompleteTitle;                                 // 0x0730(0x000C) (Localized, NeedCtorLink)
	string                                             strSendMemoCompleteMsg;                                   // 0x073C(0x000C) (Localized, NeedCtorLink)
	struct FReceiveMode                                RMode;                                                    // 0x0748(0x0010)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageMail");
		return ptr;
	}


	bool BTWindowUserDetailInfoHK_OnClanInfo(class UGUIComponent* Sender);
	void UpdateRecv_ClanInfo(class UBTNetMainMenu* MainMenu);
	bool rfAckDBCharInfo(int Result, const string& ErrMsg, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckGetAttachedItemFromMemo(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID);
	bool rfAckDeleteMailAll(int Result, byte MailType, int Count);
	bool rfAckDelMemo(int Result, const string& ErrMsg, int[] FailedMemoID);
	bool rfAckSendMemo(string[] CnamesToFail, int[] ResultArray);
	bool rfReqRecvMemo(const string& cnameFrom, byte MemoType);
	bool rfAckReadMemo(const string& cnameFrom, const string& Text, const string& dateRecv, const struct FBtrDouble& ItemUID);
	bool rfAckEndMemoList();
	bool rfAckMemoList(int[] MemoIdx, string[] cnameFrom, string[] dateRecv, string[] Text, byte[] Status, int[] UntilExpire, struct FBtrDouble[] ItemUID, int[] ItemID, byte[] MsgType, int[] ItemPartID);
	bool rfAckStartMemoList(int Result, const string& ErrMsg, byte Type, int TotalCount);
	class UBTTcpLink_Channel* GetTcpChannel();
	bool internalKeyEvent(float Delta, byte* key, byte* Action);
	bool sfReqMemoList(int RequestMailType, int RequestItemType);
	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
	void UpdateClanInfo(class UwMatchMaker* MM);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void UnInitializeDelegate();
	void InitializeDelegate();
	void UpdateItemList(class UwGameManager* MM);
	void UpdateWebzenInvenListEnd(class UBTNetMainMenu* MainMenu);
	bool BTWindowRequestApprovalClanHK_OnSuspend(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnSuspend2(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnOK(class UGUIComponent* Sender);
	bool BTWindowRequestClanHK_OnSuspend(class UGUIComponent* Sender);
	bool BTWindowRequestClanHK_OnSuspend2(class UGUIComponent* Sender);
	bool BTWindowRequestClanHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowRequestClanHK_OnOK(class UGUIComponent* Sender);
	bool ReceiveACL_OnClick(class UGUIComponent* Sender);
	bool ButtonReceiveItem_OnClick(class UGUIComponent* Sender);
	bool BTWindowDefineARHK_ReceiveCashItem_OnOK(class UGUIComponent* Sender);
	bool ButtonReply_OnClick(class UGUIComponent* Sender);
	bool ButtonDelete_OnClick(class UGUIComponent* Sender);
	bool ButtonDelete_OnOK(class UGUIComponent* Sender);
	bool ButtonCancel_OnClick(class UGUIComponent* Sender);
	bool BtnDeleteAll_OnOK(class UGUIComponent* Sender);
	bool BtnDeleteAll_OnClick(class UGUIComponent* Sender);
	bool ButtonWrite_OnClick(class UGUIComponent* Sender);
	bool ButtonSendMail_OnClick(class UGUIComponent* Sender);
	bool TabButton_OnClick(class UGUIComponent* Sender);
	bool HeaderButton_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfare.BTPageStore
// 0x0060 (0x06CC - 0x066C)
class UBTPageStore : public UBTNetGUIPageHK
{
public:
	struct FFloatBox                                   fbTPStore;                                                // 0x066C(0x0010)
	class UBTTPStoreHK*                                TPStore;                                                  // 0x067C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMoneyInfo*                                MoneyInfoObject;                                          // 0x0680(0x0004) (ExportObject, NeedCtorLink, EditInline)
	bool                                               bGoToClanPage;                                            // 0x0684(0x0004)
	int                                                nCurWeaponList;                                           // 0x0688(0x0004)
	int                                                nCurSkillList;                                            // 0x068C(0x0004)
	class UBTOwnerDrawCaptionButtonHK*[]               QuickSlotBtn;                                             // 0x0690(0x000C) (NeedCtorLink)
	class UBTTPInventoryQuickSlotHK*                   TPQuickSlot;                                              // 0x069C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelBackgrounddeco;                                      // 0x06A0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelBackgrounddeco;                                    // 0x06A4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                nCurSlotIndex;                                            // 0x06B4(0x0004)
	class UBTOwnerDrawImageHK*                         LabelSlot;                                                // 0x06B8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabelSlot;                                             // 0x06BC(0x000C) (Localized, NeedCtorLink)
	class UBTROIncludeItemPopup*                       IncludeItemPopup;                                         // 0x06C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageStore");
		return ptr;
	}


	void ShowSkillListClick(int SelIndex);
	bool SkillListClick(class UGUIComponent* Sender);
	bool WeaponListClick(class UGUIComponent* Sender);
	bool SubButton_OnHover(class UGUIComponent* Sender);
	bool SubButton_OnClick(class UGUIComponent* Sender);
	bool Internal_OnPreDraw(class UCanvas* C);
	void FillQuickSlot();
	bool ClickQuickSlotBtn(class UGUIComponent* Sender);
	void Internal_OnRendered(class UCanvas* C);
	void ChangeQuickSlot(int slotNum);
	bool TPQSClick(class UGUIComponent* Sender);
	bool BTWindowModifyHK_OnOK(class UGUIComponent* Sender);
	bool ShowModifyWindow(class UGUIComponent* Sender);
	bool rfAckGP20CashModifyWeapon(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point);
	bool rfAckModifyWeapon(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point, int Cash);
	void ReceiveModifyWeapon(const struct FBtrDouble& UniqueID, int AddPartID, int PaintID);
	bool rfAckCouponUse(int Result, const string& ErrMsg);
	bool rfAckGiftItemByWebzenCash(int Result, const string& ErrMsg, int LeftProductCount);
	bool BTWindowDefineInfoHK_BuyGiftByWebzenCash_OnOK(class UGUIComponent* Sender);
	void BTWindowDefineInfoHK_ButtonOK_OnTimeOut(class UGUIComponent* Sender);
	bool rfAckBuyItemByWebzenCash(int Result, const string& ErrMsg);
	void BoughtItemMark(int BoughtItemID);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(int[] ItemID);
	bool rfAckShopItemListStart(int Count);
	class UBTTcpLink_Channel* GetTcpChannel();
	void ShowWeaponList(int nCurIdx);
	void RefreshShop();
	void RefreshCashNPoint();
	bool internalKeyEvent(float Delta, byte* key, byte* Action);
	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
	void InternalOnReOpen();
	void UnInitializeDelegate();
	void InitializeDelegate();
	bool BTWindowDefineARHK_24_OnOK(class UGUIComponent* Sender);
	void UpdateWebzenItemList(class UwGameManager* GameMgr);
	void UpdateItemList(class UwGameManager* MM);
	void UpdateServerTime(class UwGameManager* GameMgr);
	void UpdateMoneyInfo(class UwMatchMaker* MM);
	void TeamChatLog_Extra(const string& cL);
	void BroadCastItemChatLog_Extra(const string& cL);
	void SystemChatLog_Extra(const string& cL);
	void SelfChatLog_Extra(const string& cL);
	void WhisperChatLog_Extra(const string& cL);
	void ClanChatLog_Extra(const string& cL);
	void NormalChatLog_Extra(const string& cL);
	void ClearChatLog_Extra();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool TPStore_TabButton_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfare.BTPageInventory
// 0x007C (0x06E8 - 0x066C)
class UBTPageInventory : public UBTNetGUIPageHK
{
public:
	int                                                LastReqRepairMode;                                        // 0x066C(0x0004)
	int                                                RepairAllButtonID;                                        // 0x0670(0x0004)
	struct FBtrDouble                                  SellShopItemInfo_UniqueItemID;                            // 0x0674(0x0008)
	struct FBtrDouble                                  Repair_UniqueItemID;                                      // 0x067C(0x0008)
	string                                             strSellingSuccess[0x3];                                   // 0x0684(0x000C) (Localized, NeedCtorLink)
	struct FColor                                      CashColor;                                                // 0x06A8(0x0004)
	struct FColor                                      PointColor;                                               // 0x06AC(0x0004)
	class UBTMoneyInfo*                                MoneyInfoObject;                                          // 0x06B0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPInventoryHK*                            TPInventory;                                              // 0x06B4(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTRefreshTime*                              rfEquipItemTime;                                          // 0x06B8(0x0004)
	int                                                nCurQuickSlot;                                            // 0x06BC(0x0004)
	class UBTOwnerDrawImageHK*                         LabelBackgrounddeco;                                      // 0x06C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelBackgrounddeco;                                    // 0x06C4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                LastSelectIndex;                                          // 0x06D4(0x0004)
	class UBTOwnerDrawImageHK*                         LabelSlot;                                                // 0x06D8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabelSlot;                                             // 0x06DC(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageInventory");
		return ptr;
	}


	bool rfAckCouponUse(int Result, const string& ErrMsg);
	bool Internal_KeyEvent(float Delta, byte* key, byte* Action);
	void RefreshSlotNum();
	bool rfAckUpdateQSlot(int Result, const string& ErrMsg);
	bool rfAckGP20CashModifyWeapon(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point);
	bool rfAckModifyWeapon(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point, int Cash);
	void ReceiveModifyWeapon(const struct FBtrDouble& UniqueID, int AddPartID, int PaintID);
	bool rfAckSellShopItem(int Result, const string& ErrMsg, int PointRemain, int CashRemain, int Count);
	bool rfAckSellShopItemInfo(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueItemID, int SellPoint, int CurPoint, int AfterPoint);
	bool rfAckUpdateQSlot_2(int Result, const string& ErrMsg, byte[] DisplayOrder, int[] ItemTID, struct FBtrDouble[] ItemUID, byte[] SlotPos_Key, byte[] SlotPos_Value);
	bool BTWindowItemSellHK_OnSellOK(class UGUIComponent* Sender);
	bool rfAckRepairItem(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int RepairCost, int[] DamageDegree);
	bool rfAckRepairCost(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int[] RepairCost);
	bool RepairAllItem_OnOK(class UGUIComponent* Sender);
	bool BTWindowItemRepairAllHK_OnOK(class UGUIComponent* Sender);
	bool RepairItem_OnOK(class UGUIComponent* Sender);
	bool BTWindowItemRepairHK_OnOK(class UGUIComponent* Sender);
	bool rfReqConfirmSkillChanged();
	bool rfAckConfirmItemChanged(int Result, const string& ErrMsg);
	bool rfAckEquipItem(int ChangedNewItemID, const struct FBtrDouble& ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, const struct FBtrDouble& ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, const string& ErrMsg);
	bool MainButton_OnClick(class UGUIComponent* Sender);
	void RefreshWarehouse(bool isSkipAddQSNum);
	void FillQuickSlotInventories();
	void RefreshCashNPoint();
	void RefreshQuickSlot();
	class UBTTcpLink_Channel* GetTcpChannel();
	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
	void InternalOnReOpen();
	bool Internal_OnPreDraw(class UCanvas* C);
	void UnInitializeDelegate();
	void InitializeDelegate();
	bool BTWindowDefineARHK_25_OnOK(class UGUIComponent* Sender);
	void UpdateServerTime(class UwGameManager* GameMgr);
	void UpdateWebzenItemList(class UwGameManager* MM);
	void UpdateItemList(class UwGameManager* MM);
	void UpdateMoneyInfo(class UwMatchMaker* MM);
	void TeamChatLog_Extra(const string& cL);
	void BroadCastItemChatLog_Extra(const string& cL);
	void SystemChatLog_Extra(const string& cL);
	void SelfChatLog_Extra(const string& cL);
	void WhisperChatLog_Extra(const string& cL);
	void ClanChatLog_Extra(const string& cL);
	void NormalChatLog_Extra(const string& cL);
	void ClearChatLog_Extra();
	bool SkillListClick(class UGUIComponent* Sender);
	bool WeaponListClick(class UGUIComponent* Sender);
	bool ImageListBox_OnHover(class UGUIComponent* Sender);
	bool SubButton_OnClick(class UGUIComponent* Sender);
	bool SubButton_OnHover(class UGUIComponent* Sender);
	void ChangeQuickSlot(int slotNum);
	bool TPQSClick(class UGUIComponent* Sender);
	bool ImageListBox_OnlClick(class UGUIComponent* Sender);
	bool CanEquipItem(class UwItemBoxHK* ItemInfo, class UwItemBoxInstanceHK* instanceInfo);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void UpdateWebzenInvenListEnd(class UBTNetMainMenu* MainMenu);
	bool TPInventoryQS_OnClick(class UGUIComponent* Sender);
	bool BTWindowModifyHK_OnOK(class UGUIComponent* Sender);
	void EquipOnlyModeItem(class UwItemBoxHK* ItemInfo, class UwItemBoxInstanceHK* instanceInfo);
	void EquipQuickSlot(class UwItemBoxHK* ItemInfo, class UwItemBoxInstanceHK* instanceInfo);
	void EquipItemSlot(class UwItemBoxHK* ItemInfo, class UwItemBoxInstanceHK* instanceInfo);
	void UseItem(class UwItemBoxHK* ItemInfo, class UwItemBoxInstanceHK* instanceInfo);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(int[] ItemID);
	bool rfAckShopItemListStart(int Count);
};


// Class GUIWarfare.BTPageMyInfo
// 0x0004 (0x0670 - 0x066C)
class UBTPageMyInfo : public UBTNetGUIPageHK
{
public:
	class UBTTPMyInfoAllHK*                            TPMyInfoAll;                                              // 0x066C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageMyInfo");
		return ptr;
	}


	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, string[] CharName, int[] CharLevel, string[] ClanName, int[] ClanMarkPattern, int[] ClanMarkBG, int[] ClanMarkBL, int[] Ranking_Accum, int[] Ranking_Accum_Prev, int[] Ranking_Accum_Exp, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfAckDBCharInfo(int Result, const string& ErrMsg, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	class UBTTcpLink_Channel* GetTcpChannel();
	bool InternalOnKeyEvent(float Delta, byte* key, byte* KeyState);
	void InternalOnHideComboBoxList();
	void InternalOnChangeRankingComboBox();
	void InternalOnChangeFriendlyUser();
	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
	void TeamChatLog_Extra(const string& cL);
	void BroadCastItemChatLog_Extra(const string& cL);
	void SystemChatLog_Extra(const string& cL);
	void SelfChatLog_Extra(const string& cL);
	void WhisperChatLog_Extra(const string& cL);
	void ClanChatLog_Extra(const string& cL);
	void NormalChatLog_Extra(const string& cL);
	void ClearChatLog_Extra();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void UnInitializeDelegate();
	void InitializeDelegate();
	void UpdateCharInfo(class UwMatchMaker* MM);
};


// Class GUIWarfare.BTPageClan
// 0x07F8 (0x0E64 - 0x066C)
class UBTPageClan : public UBTNetGUIPageHK
{
public:
	bool                                               bReqClanInfo;                                             // 0x066C(0x0004)
	bool                                               bDelayClanInvite;                                         // 0x066C(0x0004)
	bool                                               bClanInviteState;                                         // 0x066C(0x0004)
	string                                             DelayClanName;                                            // 0x0670(0x000C) (NeedCtorLink)
	class UBTRefreshTime*                              rfFriendPosTime;                                          // 0x067C(0x0004)
	struct FClanInfo                                   ClanInfo;                                                 // 0x0680(0x00B0) (NeedCtorLink)
	string                                             strRecord;                                                // 0x0730(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbPanelBackground[0x2];                                   // 0x073C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         PanelBackground[0x2];                                     // 0x075C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strClanSecession[0x3];                                    // 0x0764(0x000C) (Localized, NeedCtorLink)
	string                                             strClanClose[0x3];                                        // 0x0788(0x000C) (Localized, NeedCtorLink)
	class UwMatchMaker*                                MatchMaker;                                               // 0x07AC(0x0004) (Transient)
	float                                              LastRefreshTime;                                          // 0x07B0(0x0004)
	float                                              RefreshCycleTime;                                         // 0x07B4(0x0004)
	struct FFloatBox                                   fbLabelClanMark;                                          // 0x07B8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTLabelClanMarkHK*                          LabelClanMark;                                            // 0x07C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelClanName;                                          // 0x07CC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelClanName;                                            // 0x07DC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabel[0xF];                                            // 0x07E0(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0xF];                                             // 0x0894(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0xF];                                               // 0x0984(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strNoRankState;                                           // 0x09C0(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbEdit[0xF];                                              // 0x09CC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strEdit[0xF];                                             // 0x0ABC(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawTextArrayHK*                     Edit[0xF];                                                // 0x0B70(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strToolTip[0xF];                                          // 0x0BAC(0x000C) (Localized, NeedCtorLink)
	class UBTRODecorateStringHK*                       btToolTip;                                                // 0x0C60(0x0004)
	class UBTMultiLineEditBoxHK*                       ClanIntroduction;                                         // 0x0C64(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       ClanNotice;                                               // 0x0C68(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strClanNotice;                                            // 0x0C6C(0x000C) (NeedCtorLink)
	class UBTAutoScrollListHK*                         ClanIntroduction2;                                        // 0x0C78(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTAutoScrollListHK*                         ClanNotice2;                                              // 0x0C7C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelTop[0x4];                                            // 0x0C80(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTop[0x4];                                         // 0x0C90(0x0010)
	string                                             strButtonTop[0x4];                                        // 0x0CD0(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTop[0x4];                                           // 0x0D00(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLMember;                                              // 0x0D10(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLClanMemberHK*                          ACLMember;                                                // 0x0D20(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTCMClanUserListHK*                         CMClanUserList;                                           // 0x0D24(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelClanNews;                                          // 0x0D28(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strLabelClanNews;                                         // 0x0D38(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         LabelClanNews;                                            // 0x0D44(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLClanNews;                                            // 0x0D48(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLClanNewsHK*                            ACLClanNews;                                              // 0x0D58(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelClanWarResult;                                     // 0x0D5C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strLabelClanWarResult;                                    // 0x0D6C(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         LabelClanWarResult;                                       // 0x0D78(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLClanWarResult;                                       // 0x0D7C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLClanWarResultHK*                       ACLClanWarResult;                                         // 0x0D8C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbListBottomButton[0x6];                                  // 0x0D90(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strListBottomButton[0x6];                                 // 0x0DF0(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ListBottomButton[0x6];                                    // 0x0E38(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPChat;                                                 // 0x0E50(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPChatHK*                                 TPChat;                                                   // 0x0E60(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageClan");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* Canvas);
	bool rfAckFriendPosition(int Result, const string& TargetCharName, byte ServerType, const string& fServername, const string& fServerShortName, const string& fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, const string& ChannelNickName, int GameRoomNum);
	void UpdateRecv_ClanInfo(class UBTNetMainMenu* MainMenu);
	bool rfAckNotifyUpdateCharInfo_LevelMark(const string& CharName, int LevelMarkID);
	bool rfAckChatWispher(int Result, const string& ErrMsg, const string& ToCharName);
	bool rfReqRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& ClanName, const string& InviteMsg);
	bool rfAckNotifyAdjustClanMemberGrade(const string& ClanName, const string& CharName, byte CharGrade);
	bool rfAckAdjustClanMemberGrade(int Result, const string& ErrMsg, const string& ClanName, const string& CharName, byte CharGrade);
	bool rfAckClanCharPersonelIntro(int Result, const string& ErrMsg, const string& PersonelIntro);
	bool BTWindowUserDetailInfoHK_OnClanInfo(class UGUIComponent* Sender);
	bool rfAckDBCharInfo(int Result, const string& ErrMsg, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckSearchClan(int Result, const string& ErrMsg, int TotalPage, int[] ClanMarkPattern, int[] ClanMarkBG, byte[] ClanMarkBL, string[] ClanName, string[] ClanMaster, int[] ClanMember, int[] ClanMemberMax, int[] ClanCreateDate, int[] ClanWin, int[] ClanLose, int[] ClanDraw, int[] ClanRank, byte[] ClanRecruit, int[] ClanLevel);
	bool rfAckClanPersonelIntro(int Result, const string& ErrMsg);
	bool rfAckClanChangeInfo(int Result, const string& ErrMsg);
	bool rfAckClanSecession(int Result, const string& ErrMsg);
	bool rfAckClanClose(int Result, const string& ErrMsg, const string& ClanName);
	bool rfAckClanMatchResultHistory(struct FBtrDouble[] MatchDate, byte[] IsWin, string[] EnemyClanname);
	bool rfAckClanNews(string[] IssueDate, byte[] IssueType, string[] IssuedClanMember);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserList(int Result, const string& ErrMsg, int[] Level, string[] CharName, byte[] ClanGrade, int[] ClanWinCnt, int[] ClanLoseCnt, int[] LevelMarkID, int[] TitleMarkID, int[] DudeId);
	bool rfAckClanUserListStart(int Result, int TotalCount);
	void TeamChatLog(const string& cL);
	void BroadCastItemChatLog(const string& cL);
	void SystemChatLog(const string& cL);
	void SelfChatLog(const string& cL);
	void WhisperChatLog(const string& cL);
	void ClanChatLog(const string& cL);
	void NormalChatLog(const string& cL);
	void ClearChatLog();
	class UBTTcpLink_Channel* GetTcpChannel();
	bool Internal_OnPreDraw(class UCanvas* C);
	bool internalKeyEvent(float Delta, byte* key, byte* Action);
	void InternalOnClose(bool bCanceled);
	bool CheckInviteUser(int CurPos, int CurState, const string& szNickName);
	void ContextMenu_OnSelected(int ContextMenuIndex);
	bool ContextMenu_OnClose(class UGUIContextMenu* Sender);
	void OnPopupCheck();
	bool ContextMenu_OnOpen(class UGUIContextMenu* Sender);
	void RefreshPage();
	void UnInitializeDelegate();
	void InitializeDelegate();
	void UpdateClanInfo(class UwMatchMaker* MM);
	void OnCompleteOpened();
	void InternalOnOpen();
	void InternalOnReOpen();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool BTWindowAdjustClanMasterOnOK(class UGUIComponent* Sender);
	bool BTWindowBackToLastPage_OnOK(class UGUIComponent* Sender);
	bool BTWindowClanClose_OnOK(class UGUIComponent* Sender);
	bool BTWindowClanSecession_OnOK(class UGUIComponent* Sender);
	bool BTWindowClanInfoChangeHK_OnOK(class UGUIComponent* Sender);
	bool BTWindowSelfIntroductionChangeHK_OnOK(class UGUIComponent* Sender);
	bool BTWindowFindClanHK_OnInfo(class UGUIComponent* Sender);
	bool BTWindowFindClanHK_OnRequestJoin(class UGUIComponent* Sender);
	bool ListBottomButton_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfare.BTPageCredit
// 0x0014 (0x0680 - 0x066C)
class UBTPageCredit : public UBTNetGUIPageHK
{
public:
	struct FFloatBox                                   fbLabelCredit;                                            // 0x066C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTLabelCreditAnimationHK*                   LabelCredit;                                              // 0x067C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageCredit");
		return ptr;
	}


	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
	bool Internal_KeyEvent(float Delta, byte* key, byte* Action);
	void LabelCredit_OnEndCredit();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfare.BTPageClanWar
// 0x031C (0x0988 - 0x066C)
class UBTPageClanWar : public UBTNetQuestInfoPageHK
{
public:
	bool                                               bSend_sfReqClanMatchStartSearching;                       // 0x066C(0x0004)
	int                                                StartSearchingCheckTime;                                  // 0x0670(0x0004)
	int                                                StartRequestCount;                                        // 0x0674(0x0004)
	int                                                savedhour;                                                // 0x0678(0x0004)
	int                                                savedmin;                                                 // 0x067C(0x0004)
	bool                                               bJoinClanState;                                           // 0x0680(0x0004)
	bool                                               bClanInviteState;                                         // 0x0680(0x0004)
	int                                                TotalChannelUserCount;                                    // 0x0684(0x0004)
	struct FFloatBox                                   fbPanelBackground[0x2];                                   // 0x0688(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         PanelBackground[0x2];                                     // 0x06A8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelLPanelName;                                        // 0x06B0(0x0010)
	string                                             strLabelLPanelName;                                       // 0x06C0(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         LabelLPanelName;                                          // 0x06CC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelTop[0x3];                                            // 0x06D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTop[0x3];                                         // 0x06DC(0x0010)
	string                                             strButtonTop[0x3];                                        // 0x070C(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTop[0x3];                                           // 0x0730(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLWaitingClan;                                         // 0x073C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLWaitingClanHK*                         ACLWaitingClan;                                           // 0x074C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelSeparator;                                         // 0x0750(0x0010)
	class UBTOwnerDrawImageHK*                         LabelSeparator;                                           // 0x0760(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelMPanelName;                                        // 0x0764(0x0010)
	string                                             strLabelMPanelName;                                       // 0x0774(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         LabelMPanelName;                                          // 0x0780(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelMPanel[0x5];                                         // 0x0784(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelMPanel[0x5];                                       // 0x0798(0x0010)
	string                                             strLabelMPanel[0x5];                                      // 0x07E8(0x000C) (Localized, NeedCtorLink)
	class UBTComboBoxHK*                               ComboMPanel[0x4];                                         // 0x0824(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbComboMPanel[0x4];                                       // 0x0834(0x0010)
	struct FFloatBox                                   fbSlideShowMap;                                           // 0x0874(0x0010)
	class UBTSlideShowImageHK*                         SlideShowMap;                                             // 0x0884(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelMemberList;                                        // 0x0888(0x0010)
	class UBTOwnerDrawImageHK*                         LabelMemberList;                                          // 0x0898(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLMemberList;                                          // 0x089C(0x0010)
	class UBTACLCWTeamMemberListHK*                    ACLMemberList;                                            // 0x08AC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTCMCWMessengerTeamHK*                      CMMemberList;                                             // 0x08B0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPMessenger;                                            // 0x08B4(0x0010)
	class UBTTPCWMessengerHK*                          TPMessenger;                                              // 0x08C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbListBottomButton[0x5];                                  // 0x08C8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strListBottomButton[0x6];                                 // 0x0918(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ListBottomButton[0x5];                                    // 0x0960(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPChat;                                                 // 0x0974(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPChatHK*                                 TPChat;                                                   // 0x0984(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageClanWar");
		return ptr;
	}


	bool rfNotifyClanLevelup(const string& ClanName, int Levelup);
	bool rfAckClanMatch_NotifiyStartCombat(int[] MapNumArray, int VersusMode);
	bool rfAckClanMatch_StartCombat(int Result, const string& ErrMsg);
	bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber);
	bool rfAckClanMatch_StopSearching();
	bool rfAckClanMatch_NotifyStartSearching(int ShouldWaitMore);
	bool rfAckClanMatch_StartSearching(int Result, const string& ErrMsg, int ShouldWaitMore);
	void BTWindowDefineARHK_OnTimeTick(float LeftTime);
	void BTWindowDefineARHK_ButtonOK_OnTimeOut(class UGUIComponent* Sender);
	bool BTWindowDefineARHK_ClanMatch_OnOK(class UGUIComponent* Sender);
	bool rfAckEnterChannel(int id, int UID, const string& UserID, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckNotifyAdjustClanMemberGrade(const string& ClanName, const string& CharName, byte CharGrade);
	bool rfAckAdjustClanMemberGrade(int Result, const string& ErrMsg, const string& ClanName, const string& CharName, byte CharGrade);
	bool rfReqRecvDeleteFriend(int Result, const string& FromCharName);
	bool rfAckDeleteFriend(int Result, string[] FailedCharname);
	bool rfAckRecvJoinClanResult(int Result, const string& ErrMsg);
	bool rfAckJoinClanResult(const string& ClanName, byte Permit, const string& PermitCharName);
	bool RefreshPage_OnOK(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnSuspend(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnOK(class UGUIComponent* Sender);
	bool rfReqRecvJoinClan(int UserIdx, const string& CharName, const string& Message);
	bool rfAckNotifyClanSecession(const string& ClanName, const string& CharName);
	bool rfAckNotifyNewClanMember(const string& ClanName, const string& CharName);
	bool rfAckSearchClan(int Result, const string& ErrMsg, int TotalPage, int[] ClanMarkPattern, int[] ClanMarkBG, byte[] ClanMarkBL, string[] ClanName, string[] ClanMaster, int[] ClanMember, int[] ClanMemberMax, int[] ClanCreateDate, int[] ClanWin, int[] ClanLose, int[] ClanDraw, int[] ClanRank, byte[] ClanRecruit, int[] ClanLevel);
	bool rfAckInviteClanResult(const string& CharName, byte Permit, const string& ClanNm);
	bool rfReqRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& ClanName, const string& InviteMsg);
	bool rfAckJoinClan(int Result, const string& ErrMsg, const string& SpecificCharName, const string& RealRecvCharName, byte RealRecvCharClanGrade);
	bool rfAckInviteClan(int Result, const string& ErrMsg);
	bool BTWindowUserDetailInfoHK_OnClanInfo(class UGUIComponent* Sender);
	bool rfReqClanCharPersonelIntro(const string& ClanName, const string& CharName);
	bool rfAckClanCharPersonelIntro(int Result, const string& ErrMsg, const string& PersonelIntro);
	bool rfAckDBCharInfo(int Result, const string& ErrMsg, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool MoveToClanPage_OnOK(class UGUIComponent* Sender);
	bool rfAckCreateClan(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckDupCheckClanName(int Result, const string& ErrMsg);
	bool WindowRequestFriend_OnCancel(class UGUIComponent* Sender);
	bool WindowRequestFriend_OnOK(class UGUIComponent* Sender);
	bool WindowInviteFriend_OnOK(class UGUIComponent* Sender);
	bool rfReqCompleteFriendInvite(const string& CharnameToBeInvited, byte IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const string& ErrMsg);
	bool rfReqRecvFriendInvite(int ReqUserID, const string& ReqCharname, const string& InviteMsg);
	bool rfAckSendFriendInvite(int Result, const string& ErrMsg);
	bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, int[] UID, string[] UserID, int[] UserLevels, string[] ClanName, int[] ClanPattern, int[] ClanBG, int[] ClanBL, int[] ClanGrade, int[] ClanWin, int[] ClanLose, byte[] IsLookForClan, int Result, const string& ErrMsg, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserList(int Result, const string& ErrMsg, int[] Level, string[] CharName, byte[] ClanGrade, int[] ClanWinCnt, int[] ClanLoseCnt, int[] LevelMarkID, int[] TitleMarkID, int[] DudeId);
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfAckFriendListEnd();
	bool rfAckFriendList(string[] FriendName, byte[] IsLogOn, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] LevelMarkID, int[] ClanLevel, int[] Level, byte[] IsLookForClan);
	bool rfAckFriendListStart(int Result, int TotalCount);
	bool rfAckClanMatch_SetWaitRoomPublic(int Result, const string& ErrMsg, byte Set);
	bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, const string& ErrMsg, int[] MapNumArray, int VersusMode, const string& WaitRoomName);
	void SelectMapIndex(int MPanelIndex, int MapID);
	bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, const string& ErrMsg, int[] MapNumArray, int VersusMode, byte IsPublic);
	bool rfAckClanMatch_ChangeLeader(int Result, const string& ErrMsg, int NewLeader, const string& NewLeaderName);
	bool rfAckClanMatch_Leave(int Result, const string& ErrMsg);
	bool rfAckClanMatch_LeaveNotify(const string& CharName);
	bool rfAckClanMatch_JoinNotify(byte IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, const string& CharName, int ClanGrade, int ClanWin, int ClanLose, const string& ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckClanMatch_Chat(int Result, const string& ErrMsg, const string& Sender, const string& Message);
	bool rfAckClanMatch_Join(int Result, const string& ErrMsg);
	bool rfAckClanMatch_GetReady(int Result, const string& ErrMsg, int RoomIndex);
	void ChangeReadyRoomLeader(bool bLeader);
	bool rfAckClanMatch_MemberList(byte[] IsLeader, int[] ClanMarkPA, int[] ClanMarkBG, int[] ClanMarkBL, int[] Level, string[] CharName, int[] ClanGrade, int[] ClanWin, int[] ClanLose, string[] ClanName, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckClanMatch_WaittingTeamList(int TtotlCount, int[] Grade, int[] Map, int[] Versus);
	void OnPopupPCBang(int ContextMenuIndex, class UBTACLMessengerPCBangHK* acl);
	void OnPopupPCBangCheck(class UBTACLMessengerPCBangHK* acl, class UBTCMMessengerPCBangHK* cm);
	void OnPopupBan(int ContextMenuIndex, class UBTACLMessengerBanHK* acl);
	void OnPopupBanCheck(class UBTACLMessengerBanHK* acl, class UBTCMMessengerBanHK* cm);
	void OnPopupClan(int ContextMenuIndex, class UBTACLCWMessengerClanHK* acl);
	void OnPopupClanCheck(class UBTACLCWMessengerClanHK* acl, class UBTCMMessengerClanHK* cm);
	void OnPopupFriend(int ContextMenuIndex, class UBTACLCWMessengerFriendHK* acl);
	void OnPopupFriendCheck(class UBTACLCWMessengerFriendHK* acl, class UBTCMMessengerFriendHK* cm);
	void OnPopupChannel(int ContextMenuIndex, class UBTACLCWMessengerChannelHK* acl);
	void OnPopupChannelCheck(class UBTACLCWMessengerChannelHK* acl, class UBTCMMessengerChannelHK* cm);
	void TeamChatLog(const string& cL);
	void SystemChatLog(const string& cL);
	void SelfChatLog(const string& cL);
	void WhisperChatLog(const string& cL);
	void ClanChatLog(const string& cL);
	void NormalChatLog(const string& cL);
	void ClearChatLog();
	class UBTTcpLink_Channel* GetTcpChannel();
	bool internalKeyEvent(float Delta, byte* key, byte* Action);
	void InternalOnClose(bool bCanceled);
	void RefreshPage();
	void UpdateItemList(class UwGameManager* GameMgr);
	void UpdateBlockList(class UwMatchMaker* MM);
	void UpdatePCBangList(class UwMatchMaker* MM);
	void UpdateClanList(class UwMatchMaker* MM);
	void UpdateFriendList(class UwMatchMaker* MM);
	void UpdateQuestList(class UwMatchMaker* MM);
	void UpdatePositionInfo(class UwMatchMaker* MM);
	void UpdatePCBangInfo(class UwMatchMaker* MM);
	void UpdateRecv_CharInfo(class UwMatchMaker* MM);
	void UpdateMoneyInfo(class UwMatchMaker* MM);
	void UpdateEquipItemInfo(class UwMatchMaker* MM);
	void UpdateRankingInfo(class UwMatchMaker* MM);
	void UpdateRecv_ClanInfo(class UBTNetMainMenu* MainMenu);
	void UpdateClanInfo(class UwMatchMaker* MM);
	void UpdateCharInfo(class UwMatchMaker* MM);
	void OnCompleteOpened();
	void InternalOnOpen();
	void InternalOnReOpen();
	void ContextMenu_OnSelected(int ContextMenuIndex);
	bool ContextMenu_OnClose(class UGUIContextMenu* Sender);
	bool ContextMenu_OnOpen(class UGUIContextMenu* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void FillCapacityList();
	void FillMapList();
	void ComboMap3_OnChange(class UGUIComponent* Sender);
	void ComboMap2_OnChange(class UGUIComponent* Sender);
	void ComboMap1_OnChange(class UGUIComponent* Sender);
	void ComboMap0_OnChange(class UGUIComponent* Sender);
	void RefreshSlideShowMap();
	bool ListBottomButton_OnClick(class UGUIComponent* Sender);
	bool HeaderButton_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfare.BTPageLucky
// 0x0078 (0x06E4 - 0x066C)
class UBTPageLucky : public UBTNetGUIPageHK
{
public:
	class UBTOwnerDrawImageHK*                         PageBackground;                                           // 0x066C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UTabControlMocker*                           TabControl;                                               // 0x0670(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUITabPanel*                                TabPanels[0x3];                                           // 0x0674(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPLuckyCapsuleStore*                      tpCapsuleStore;                                           // 0x0680(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPLuckyCapsuleInventory*                  tpCapsuleInventory;                                       // 0x0684(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPLuckyBlackBox*                          tpBlackBox;                                               // 0x0688(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButton[0x3];                                            // 0x068C(0x0010)
	string                                             strButton[0x3];                                           // 0x06BC(0x000C) (Localized, NeedCtorLink)
	class UBTMoneyInfo*                                MoneyInfoObject;                                          // 0x06E0(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageLucky");
		return ptr;
	}


	bool rfAckLuckShop_RewardCoupon(int ErrorCode, int Coupon_ItemTypeID, const struct FBtrDouble& Coupon_ItemUniqueID, int Coupon_Count_AfterReduction);
	bool rfAckLuckShop_RewardBuyingCount(int ErrorCode, int FinalCapsuleRewardState);
	bool rfAckLuckShop_StorageInfo(int ErrorCode, int BuyingCapsuleCount, int CapsuleRewardState);
	bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, byte IsNotification, string[] NickName, struct FBtrDouble[] Time, int GetItemID);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(int[] ItemID);
	bool rfAckShopItemListStart(int Count);
	void Internal_OnChangedTab(int CurrentIndex, int PrevIndex);
	void RefreshWinnerList();
	void RefreshCashNPoint();
	void UpdateMoneyInfo(class UwMatchMaker* MM);
	void UpdateWebzenItemList(class UwGameManager* GameMgr);
	void UpdateItemList(class UwGameManager* GameMgr);
	void UnInitializeDelegate();
	void InitializeDelegate();
	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
	class UBTTcpLink_Channel* GetTcpChannel();
	void AddTab(int Num, class UClass* tabClass);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfare.BTTcpLoginHandler
// 0x0004 (0x0030 - 0x002C)
class UBTTcpLoginHandler : public UBTTcpLink_Login
{
public:
	class UBTNetMainMenu*                              MainMenu;                                                 // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTTcpLoginHandler");
		return ptr;
	}


	bool rfAckLogOut(byte Result, byte Reason);
	bool rfAckPCBangUserListEnd();
	bool rfAckPCBangUserList(string[] FriendName, byte[] IsLogOn, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] Level, int[] ClanGrade, int[] ClanWin, int[] ClanLose);
	bool rfAckPCBangUserListStart(int Result, int TotalCount);
	bool rfAckEventNotify(int Type);
	bool rfAckErrorReportServerAddr(const string& Addr, int Port);
	bool rfAckClientChecksum(int Result);
	bool rfAckClientChallenge(const string& Key1, const struct FBtrDouble& Key2);
	bool rfAckCharInfo(int Result, const string& CharName, int Level, int Exp, const string& ClanName);
	bool rfAckFriendsListEnd();
	bool rfAckFriendsListStart(int Result, int TotalCount);
	bool rfAckClanMemberListFromClientEnd();
	bool rfAckClanMemberListFromClientStart(int Result, int TotalCount);
	bool rfReqForceLogoutByOwner();
	bool rfAckMaxUserExceed();
	bool Exit_OnOK(class UGUIComponent* Sender);
	bool rfAckLoginWithGlobal(int Result);
	bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType);
	bool rfAckClanMemberListFromClient(int Result, const string& ErrMsg, int[] Level, string[] CharName, byte[] ClanGrade, string[] ServerName, string[] ServerShortName, string[] ServerIP, int[] serverPort, byte[] CurPos, int[] ChannelNum, string[] ChannelNickName, int[] GameRoomNum);
	bool rfAckFriendsList(byte ListType, string[] UserName, byte[] IsLogOn, int[] CMarkPattern, int[] CMarkBG, int[] CMarkBL, string[] ClanName, int[] Level);
	bool rfReqFriendsList();
	bool rfAckProcessPreLoginUser(int Result, const string& ErrMsg);
	bool rfAckLoginInHouseTest(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg, const string& BDay, byte Sex, const struct FBtrDouble& ServerTime);
	bool rfAckCreateChar(int Success, const string& ErrMsg);
	bool rfAckServerList(string[] CServername, string[] CServerShortName, string[] ServerIP, int[] serverPort, string[] ChannelName, string[] ChannelNickName, int[] ChannelNum, int[] chMaxUser, int[] chCurUser, string[] ServerGroupName, int[] ServerGroupID, int[] ServerDispOrder, int[] DataPort, byte[] OptionCount_byte, byte[] OptionKey_byte, byte[] OptionValue_byte, byte[] OptionCount_int, byte[] OptionKey_int, int[] OptionValue_int, byte[] OptionCount_float, byte[] OptionKey_float, float[] OptionValue_float, byte[] IsClanChannel, byte[] IsUseDedicateHost);
	bool rfAckLogin(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg);
	bool rfAckHash(int Result, const string& Error);
	void OnError(int ErrCode);
	void OnClose(int ErrCode);
	void OnConnect(int ErrCode);
};


// Class GUIWarfare.BTWindowItemExpiredHK
// 0x0330 (0x07F0 - 0x04C0)
class UBTWindowItemExpiredHK : public UBTWindowHK
{
public:
	int                                                SavePoint;                                                // 0x04C0(0x0004)
	int                                                saveLevel;                                                // 0x04C4(0x0004)
	int                                                saveCash;                                                 // 0x04C8(0x0004)
	int                                                saveCCoin;                                                // 0x04CC(0x0004)
	class UBTNetMainMenu*                              MainMenu;                                                 // 0x04D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                MyPoint;                                                  // 0x04D4(0x0004)
	int                                                myLevel;                                                  // 0x04D8(0x0004)
	int                                                MyCash;                                                   // 0x04DC(0x0004)
	int                                                MyCCoin;                                                  // 0x04E0(0x0004)
	int                                                RepairSumCost;                                            // 0x04E4(0x0004)
	int                                                RepairSumCash;                                            // 0x04E8(0x0004)
	int                                                RepairSumCCoin;                                           // 0x04EC(0x0004)
	struct FFloatBox                                   fbTPItemList;                                             // 0x04F0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPItemListHK*                             TPItemList;                                               // 0x0500(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelDivider[0x2];                                      // 0x0504(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelDivider[0x2];                                        // 0x0524(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabel[0x5];                                            // 0x052C(0x000C) (Localized, NeedCtorLink)
	string                                             strPoint;                                                 // 0x0568(0x000C) (Localized, NeedCtorLink)
	string                                             strCash;                                                  // 0x0574(0x000C) (Localized, NeedCtorLink)
	string                                             strCCoin;                                                 // 0x0580(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0x5];                                             // 0x058C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelEdit[0x9];                                         // 0x05DC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0x5];                                               // 0x066C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelEdit[0x9];                                           // 0x0680(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strButtonSelectAll[0x2];                                  // 0x06A4(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonSelectAll;                                        // 0x06BC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonSelectAll;                                          // 0x06CC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbNEditBox[0x9];                                          // 0x06D0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTNumericEditBoxHK*                         NEditBox[0x9];                                            // 0x0760(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int[]                                              BuyExpiredItemList;                                       // 0x0784(0x000C) (NeedCtorLink)
	int[]                                              BuyExpiredSlotPosList;                                    // 0x0790(0x000C) (NeedCtorLink)
	struct FBuyExpriedCashInfo                         BuyExpiredCashInfoList[0x4];                              // 0x079C(0x000C) (NeedCtorLink)
	struct FBtrDouble[]                                BuyExpiredUniqueList;                                     // 0x07CC(0x000C) (NeedCtorLink)
	class UBTExpiredItem*[]                            ExpiredItems;                                             // 0x07D8(0x000C) (NeedCtorLink)
	int[]                                              selectCashType;                                           // 0x07E4(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTWindowItemExpiredHK");
		return ptr;
	}


	void Closed(class UGUIComponent* Sender, bool bCancelled);
	bool CalculateCashSelect(int ListIndex, class UBTROItemBoxHK* ro, int cashType);
	void PopAndBuy(int ReservedItemID);
	void CheckSubBtn();
	bool Internal_OnPreDraw(class UCanvas* C);
	void InternalOnOpen();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void AddSubMenuBtn();
	void AddItem(int ItemID, const struct FBtrDouble& UniqueItemID, int UniqueSkillID, int PartID, int SlotPosition);
	void SetCurrentCCoin(int MyCCoin);
	void SetCurrentLevel(int myLevel);
	void SetCurrentCash(int MyCash);
	void SetCurrentPoint(int MyPoint);
	void UpdateNEditBox();
	bool ImageListBox_OnClick(class UGUIComponent* Sender);
	bool ButtonCancel_OnClick(class UGUIComponent* Sender);
	void RemoveAllItem();
	void RemoveAllExpiredItem();
	bool ButtonOK_OnClick(class UGUIComponent* Sender);
	bool ButtonNonSelectAll_OnClick(class UGUIComponent* Sender);
	bool ButtonSelectAll_OnClick(class UGUIComponent* Sender);
	int PopExpiredSlotPos();
	void PopExpiredCashInfo(int* iCategoryID, int* iPackageID, int* iPriceID, int* cashType);
	struct FBtrDouble PopExpiredUniqueID();
	void SetExpiredData(class UBTExpiredItem*[] inputData);
	int PopExpiredItemID();
	void PushExpiredItemID(int ItemID, const struct FBtrDouble& UniqueID, int CategoryID, int PackageID, int PriceID, int SlotPos, int cashType);
};


// Class GUIWarfare.BTTcpHandlerMed
// 0x0004 (0x0030 - 0x002C)
class UBTTcpHandlerMed : public UBTTcpLink_Channel
{
public:
	class UBTTcpHandler*                               Owner;                                                    // 0x002C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTTcpHandlerMed");
		return ptr;
	}


	bool rfReqAddSpecialRank(const string& NickName);
	bool rfNotifyPcBangInfo(byte PcBang_Grade);
	bool rfAckExpandSlotConfirm(int Result, const string& ErrMsg, int QSlotID, const struct FBtrDouble& MWItemID, const struct FBtrDouble& PistolItemID, const struct FBtrDouble& TWItemID1, const struct FBtrDouble& TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4, const struct FBtrDouble& KnifeItemID);
	bool rfAckUpdateQSlot_2(int Result, const string& ErrMsg, byte[] DisplayOrder, int[] ItemTID, struct FBtrDouble[] ItemUID, byte[] SlotPos_Key, byte[] SlotPos_Value);
	bool rfAckPcBangItemList(int[] ItemTID, int[] PartID);
	bool rfAckCharDetailInfoWithClan(int ErrorCode, const string& CharName, int Exp, int Level, int LevelMarkID, int PreMonthlyRanking, int MonthlyRanking, int Win, int Lose, int Kill, int Death, int Assist, int KillCountByAimShooting, int HeadShot2, int TotPlayTime, int DisCon, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, int DispHeadItem, int DispFaceItem, int DispBackpack, int DispPouch, int DispCamouflage, const string& ClanName, int ClanLevel, int CM_Pattern, int CM_BG, int CM_BL, int ClanExp, byte ClanGrade, int ClanActivity, int MonthlyConnectingCount, int UserClanWin, int UserClanLose, int UserClanDraw, int ClanWin, int ClanLose, int ClanDraw, int PreClanTotalRankCur, int ClanTotalRankCur, int PreClanMonthlyRankCur, int ClanMonthlyRankCur, int PreClanMonthlyConnectingRank, int ClanMonthlyConnectingRank, const string& ClanIntro);
	bool rfAckUseItemDuringGame(int ErrorCode, const string& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, int RemainCount);
	bool rfReqAhnNotifyDisconnct(int Code);
	bool rfReqAhnHsObject(byte[] Data, int DataSize);
	bool rfAckSetCommunityOption(int Result, const string& ErrStr);
	bool rfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite);
	bool rfChangeItemInstanceInfo(int ErrorCode, int ItemID, const struct FBtrDouble& ItemUniqueID, byte ChangeCount, int RemainCount);
	bool rfAckLuckShop_RewardCoupon(int ErrorCode, int Coupon_ItemTypeID, const struct FBtrDouble& Coupon_ItemUniqueID, int Coupon_Count_AfterReduction);
	bool rfAckLuckShop_RewardBuyingCount(int ErrorCode, int FinalCapsuleRewardState);
	bool rfAckLuckShop_StorageInfo(int ErrorCode, int BuyingCapsuleCount, int CapsuleRewardState);
	bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, byte IsNotification, string[] NickName, struct FBtrDouble[] Time, int GetItemID);
	bool rfNotifyCouponUseError(int Time);
	bool rfReqNotifyShopItemDataEnd(int Ver);
	bool rfAckCouponUse(int Result, const string& ErrMsg);
	bool rfReqNotifyShopPackageItemData(int PackageProductNo, int[] ProductCode, int[] ProductQuantity, int[] ProductHour, const string& Description);
	bool rfReqNotifyShopItemData(int[] ProductNo, string[] ProductName, int[] ProductCode, byte[] SaleType, int[] ProductCost, int[] ProductHour, int[] ProductQuantity, int[] SaleMasterFlag, int[] SaleStatus, int[] IsGift, struct FBtrDouble[] SaleEndTime, int[] Discountcost);
	bool rfAckShopItemData();
	bool rfNotifyClanLevelup(const string& ClanName, int Levelup);
	bool rfNotifyNewClanName(const string& New_NickName);
	bool rfNotifyNewNickName(int Community_Type, const string& Old_NickName, const string& New_NickName);
	bool rfAckTencent_StartTenProtect(int CharDBID);
	bool rfAckMoveToLobby(byte MessageType);
	bool rfAckPopUpMessage(int MessageType);
	bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckFriendPosition(int Result, const string& TargetCharName, byte ServerType, const string& fServername, const string& fServerShortName, const string& fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, const string& ChannelNickName, int GameRoomNum);
	bool rfAckLogOut(byte Result, byte Reason);
	bool rfAckNotifyUpdateCharInfo_LevelMark(const string& CharName, int LevelMarkID);
	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, string[] CharName, int[] CharLevel, string[] ClanName, int[] ClanMarkPattern, int[] ClanMarkBG, int[] ClanMarkBL, int[] Ranking_Accum, int[] Ranking_Accum_Prev, int[] Ranking_Accum_Exp, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfAckClanMatchResultHistory(struct FBtrDouble[] MatchDate, byte[] IsWin, string[] EnemyClanname);
	bool rfReqInGameRoomUserInfoChanged();
	bool rfAckServerType(byte Type);
	bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, const string& ErrMsg, int[] MapNumArray, int VersusMode, byte IsPublic);
	bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, const string& RoomName, int MapNum, int CurUserCount, int MaxUserCount, byte Status, byte IsPublic);
	bool rfAckClanMatch_EndPublicWaitRoomList();
	bool rfAckClanMatch_PublicWaitRoomList(int[] WaitRoomIdx, string[] LeaderName, string[] RoomName, int[] MapNum, int[] CurUserCount, int[] MaxUserCount, byte[] Status);
	bool rfAckClanMatch_StartPublicWaitRoomList(int Result, const string& ErrMsg, int Count);
	bool rfAckPaidItem_NotifyChangeClanname(const string& NewClanname);
	bool rfAckPaidItem_ChangeClanname(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const string& NewCharname);
	bool rfAckPaidItem_ChangeCharname(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const string& NewCharname);
	bool rfAckNotifyEndTutorial(int UserID, const string& CharName, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckNotifyStartTutorial(int Result, int UserID);
	bool rfAckGetMyMailBoxState(int Result, byte IsFull, int NewMailCount);
	bool rfAckSetLookForClan(int Result, const string& ErrMsg, byte IsLookingFor);
	bool rfAckRoomUserPingInfo(int[] UnqueID, int[] Ping, int HostPriorityPoint);
	bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, const string& NewRoomTitle);
	bool rfAckRecvSystemMsg(byte CommunityType, const struct FSystemMsgParam& MsgInfo);
	bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID);
	bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID);
	bool rfAckForceDisconnectUser_GM(int Result, const string& ErrMsg, const string& CharName);
	bool rfAckNotice_GM(int Result, const string& ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const string& Msg);
	bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, const string& NewRoomTitle);
	bool rfReqExteriorRoomOwnerInfo(int RoomNum, const string& OwnerName, const string& OwnerIP);
	bool rfAckCharBlockInfo(int Result, const struct FBtrDouble& ChatBlockStartTime, const struct FBtrDouble& ChatBlockEndTime, struct FBtrDouble[] BlockedItemIdx);
	bool rfAckQuestGetAvailableEventList(int Result, const string& ErrMsg, int[] QuestID);
	bool rfAckPaidItem_NotifyChangeClanMark(const string& ClanName, int Pattern, int BG, int BL);
	bool rfAckPaidItem_ChangeClanMark(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_ClanMarkDupCheck(int Result, const string& ErrMsg);
	bool rfAckWebzenBillingUseStorageItem(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID, const struct FBtrDouble& ItemExtra);
	bool rfAckPaidItem_RelayBroadcast(const string& CharName, const string& Msg);
	bool rfAckPaidItem_BroadCast(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_EraseRecord(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int Command, int RemainCount);
	bool rfAckWebzenBillingStorageListEnd();
	bool rfAckWebzenBillingStorageList(int[] Seq, int[] ItemSeq, int[] GroupCode, int[] ShareFlag, int[] ProductSeq, string[] CashName, struct FBtrDouble[] CashPoint, string[] SendAccountID, string[] SendMessage, byte[] ItemType, byte[] RelationType, int[] ProductType, int[] PriceSeq);
	bool rfAckWebzenBillingStorageListStart(int Result, const string& ErrMsg, int TotalCount, int TotalPage, int CurPage);
	bool rfAckRandomBox_Use(int Result, const string& ErrMsg, const struct FBtrDouble& RandomBoxItemIdx, int RandomBxoItemCount, const struct FBtrDouble& KeyItemIdx, int KeyItemRemainCount, int[] ItemIDChoose, int[] PartIDChoose, int[] PeriodOnChoosenItem, int[] StackCountOnChoosenItem, byte[] bHave, struct FBtrDouble[] ItemIdx, struct FBtrDouble[] UntilTime, int[] StackCount);
	bool rfAckRegisterMainPCBang(int Result, const string& ErrMsg);
	bool rfAckPCBangUserListEnd();
	bool rfAckPCBangUserList(string[] FriendName, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] Level, int[] ClanGrade, int[] ClanWin, int[] ClanLose, byte[] IsLookForClan, byte[] IsCombat, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckPCBangUserListStart(int Result, int TotalCount);
	bool rfAckGiftItemByWebzenCash(int Result, const string& ErrMsg, int LeftProductCount);
	bool rfAckBuyItemByWebzenCash(int Result, const string& ErrMsg);
	bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, const string& ErrMsg, int[] MapNumArray, int VersusMode, const string& WaitRoomName);
	bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, int[] AFBotID, int[] RSABotID);
	bool rfAckRegisteredPCBangInfo(int Result, const string& ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, const string& PCBangName);
	bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckWebzenCash(int Result, const string& ErrMsg, const struct FBtrDouble& PCoinCash, const struct FBtrDouble& CCoinCash);
	bool rfAckCheckEquipedWeaponDurability(int Result, struct FBtrDouble[] ItemUniqueID, int[] ItemSlotNum);
	bool rfReqClanMatch_InviteCrewResult(const string& Invitee, int Result);
	bool rfReqClanMatch_RecvInviteCrew(const string& Inviter, const string& ServerIP, int Port, int WaittingID, const string& Msg, int MapNum, int InviteUserChannelNum, const string& LeaderName, const string& RoomName);
	bool rfAckClanMatch_InviteCrew(int Result, const string& ErrMsg);
	bool rfReqDailyQuestNewAvailable(int[] ExpiredQuestID, int[] NewQuestID);
	bool rfReqQuestNewAvailable(int[] AchivedQuestID, int[] NewQuestID, byte[] IsDailyQuest, int[] ExpiredQuest);
	bool rfAckQuestUpdate(int Result, const string& ErrMsg);
	bool rfAckQuestListEnd();
	bool rfAckQuestList(int[] QuestID, int[] CountPrograss, byte[] IsDailyQuest, byte[] IsComplete);
	bool rfAckSpecialQuestRank(string[] CharList);
	bool rfAckReceiveSpecialReward(int Result, int RewardedQuestID, byte RewardedQuestIsComplete, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount);
	bool rfAckDailyRewardListThisMonth(byte[] Type, byte[] Number, int[] ItemID, int[] ItemCount);
	bool rfAckPuzzleList(int Result, byte IsComplete, byte[] UpdatedNum, byte[] StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfAckAttendanceList(int Result, byte IsComplete, byte UpdatedNum, byte[] StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfAckQuestListStart(int Result, const string& ErrMsg);
	bool rfAckClanMatch_SetWaitRoomPublic(int Result, const string& ErrMsg, byte Set);
	bool rfAckClanMatch_StopSearching();
	bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber);
	bool rfAckClanMatch_FoundMatch();
	bool rfAckClanMatch_NotifyStartSearching(int ShouldWaitMore);
	bool rfAckClanMatch_StartSearching(int Result, const string& ErrMsg, int ShouldWaitMore);
	bool rfAckClanMatch_ChangeLeader(int Result, const string& ErrMsg, int NewLeader, const string& NewLeaderName);
	bool rfAckClanMatch_WaittingTeamList(int TtotlCount, int[] Grade, int[] Map, int[] Versus);
	bool rfAckClanMatch_Chat(int Result, const string& ErrMsg, const string& CharName, const string& Msg);
	bool rfAckClanMatch_Leave(int Result, const string& ErrMsg);
	bool rfAckClanMatch_MemberList(byte[] IsLeader, int[] ClanMarkPA, int[] ClanMarkBG, int[] ClanMarkBL, int[] Level, string[] CharName, int[] ClanGrade, int[] ClanWin, int[] ClanLose, string[] ClanName, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckClanMatch_LeaveNotify(const string& CharName);
	bool rfAckClanMatch_JoinNotify(byte IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, const string& CharName, int ClanGrade, int ClanWin, int ClanLose, const string& ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckClanMatch_Join(int Result, const string& ErrMsg);
	bool rfAckClanMatch_NotifiyStartCombat(int[] MapNumArray, int VersusMode);
	bool rfAckClanMatch_StartCombat(int Result, const string& ErrMsg);
	bool rfAckClanMatch_GetReady(int Result, const string& ErrMsg, int RoomIndex);
	bool rfAckLimitedListInChannel(int Result, int[] LimitedMapID, int[] LimitedModeID);
	bool rfAckRecvInviteGameRoomResult(int Result);
	bool rfReqRecvInviteGameRoom(const string& InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, const string& RoomUniqueID, int RoomNumber, const string& RoomName, byte RoomState, const string& MapName, const string& OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, const string& Password, const string& InviteCharName);
	bool rfAckInviteGameRoom(int Result, byte Answer, const string& GuestCharName);
	bool rfAckAutoChangedTeamUserList(int[] UserID, int[] TeamNum);
	bool rfAckGetItemFromItemBox(int Result, const string& ErrMsg, int ItemIDChoose, int PartIDChoose, const struct FBtrDouble& BoxItemIdx, int BxoItemCount, byte bHave, const struct FBtrDouble& ItemIdx, const struct FBtrDouble& UntilTime, int StackCount);
	bool rfAckItemListInItemBox(int Result, const string& ErrMsg, const struct FBtrDouble& ItemUniqueID, int BoxItemID, int[] ItemID, int[] PartID, byte FromContent);
	bool rfReqRecvForceFailedClientLoading(int ErrCode);
	bool rfAckStartHolePunching(int Result, const string& ErrMsg, int GameType, int ReqStartUserID);
	bool rfAckRegisterMyUdpInfo(int Result, const string& ErrMsg);
	bool rfAckNotifyMyCharInfoToRoomUser(int Result, const string& ErrMsg, int UID, const string& UserName, int Grade, int TeamNum, byte Statue, byte IsHost, const string& UserIP, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, byte IsLookFor);
	bool rfReqNotifyDisconnectHostInLoading(int Result, const string& ErrMsg, int HostID);
	bool rfReqRecvForceDisconnected_FromGM(int Result, const string& ErrMsg);
	bool rfReqRecvNotice_FromGM(int Result, const string& ErrMsg, string[] NoticeMsg, byte IsFromDB);
	bool rfAckJoinClan(int Result, const string& ErrMsg, const string& SpecificCharName, const string& RealRecvCharName, byte RealRecvCharClanGrade);
	bool rfAckExceedMaxUser();
	bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, int[] UID, string[] CharName, int[] UserLevel, string[] ClanName, int[] ClanPattern, int[] ClanBG, int[] ClanBL, byte[] IsLookForClan, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfReqRecvDeleteFriend(int Result, const string& FromCharName);
	bool rfAckDeleteFriend(int Result, string[] FailedCharname);
	bool rfAckChatWispher(int Result, const string& ErrMsg, const string& ToCharName);
	bool rfAckNotifyAdjustClanMemberGrade(const string& ClanName, const string& CharName, byte CharGrade);
	bool rfReqNotifyDurabilityZeroItem(int Result, const string& ErrMsg, int UserID, struct FBtrDouble[] ItemUniqueIDs, int[] ItemIDs, int[] ItemPartIDs, byte[] ItemSlotPos);
	bool rfAckAcquirePromotionItems(int UID, int Result, const string& ErrMsg, struct FBtrDouble[] ItemUniqueID, int[] ItemIDs, int[] PartIDs);
	bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, int[] ItemID, int[] PartID);
	bool rfAckBlockUserList(string[] CharName);
	bool rfAckRemoveBlockUserList(int Result, const string& ErrMsg);
	bool rfAckBlockUserListEnd();
	bool rfAckAddBlockUserList(int Result, const string& ErrMsg);
	bool rfAckBlockUserListStart(int Result, int TotalCount);
	bool rfAckAdjustClanMemberGrade(int Result, const string& ErrMsg, const string& ClanName, const string& CharName, byte CharGrade);
	bool rfReqClanCharPersonelIntro(const string& ClanName, const string& CharName);
	bool rfAckRecvJoinClanResult(int Result, const string& ErrMsg);
	bool rfAckJoinClanResult(const string& ClanName, byte Permit, const string& PermitCharName);
	bool rfAckNotifyClanSecession(const string& ClanName, const string& CharName);
	bool rfAckNotifyNewClanMember(const string& ClanName, const string& CharName);
	bool rfReqRecvJoinClan(int UserIdx, const string& CharName, const string& Message);
	bool rfAckRecvClanInviteResult(int Result, const string& ErrMsg);
	bool rfAckInviteClanResult(const string& CharName, byte Permit, const string& ClanNm);
	bool rfAckInviteClan(int Result, const string& ErrMsg);
	bool rfReqRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& ClanName, const string& InviteMsg);
	bool rfAckGetIsHostBlocking(int Result, byte Blocking);
	bool rfAckNotifyHostBlocking(int Result, byte Blocking);
	bool rfAckGetHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, int[] FailedUserIDs);
	bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint);
	bool rfReqNotifyRelayServerAddr(const string& RelayIP, int RelayPort);
	bool rfReqRecvForceDisconnectUDPFromHost(int Result);
	bool rfAckForceDisconnectUDPFromHost(int Result);
	bool rfReqNotifyChangeRoomState(byte RoomState);
	bool rfAckClanCharPersonelIntro(int Result, const string& ErrMsg, const string& PersonelIntro);
	bool rfAckDBCharInfo(int Result, const string& ErrMsg, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckSearchClan(int Result, const string& ErrMsg, int TotalPage, int[] ClanMarkPattern, int[] ClanMarkBG, byte[] ClanMarkBL, string[] ClanName, string[] ClanMaster, int[] ClanMember, int[] ClanMemberMax, int[] ClanCreateDate, int[] ClanWin, int[] ClanLose, int[] ClanDraw, int[] ClanRank, byte[] ClanRecruit, int[] ClanLevel);
	bool rfAckClanPersonelIntro(int Result, const string& ErrMsg);
	bool rfAckClanChangeInfo(int Result, const string& ErrMsg);
	bool rfAckClanSecession(int Result, const string& ErrMsg);
	bool rfAckClanClose(int Result, const string& ErrMsg, const string& ClanName);
	bool rfAckClanNews(string[] IssueDate, byte[] IssueType, string[] IssuedClanMember);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserList(int Result, const string& ErrMsg, int[] Level, string[] CharName, byte[] ClanGrade, int[] ClanWinCnt, int[] ClanLoseCnt, int[] LevelMarkID, int[] TitleMarkID, int[] DudeId);
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfAckClanInfo(const struct FClanInfo& stClanInfo);
	bool rfAckDupCheckClanName(int Result, const string& ErrMsg);
	bool rfAckCreateClan(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckGetServerTime(const struct FBtrDouble& ServerTime, const string& ClientIP);
	bool rfAckMyMoney(int Result, const string& ErrMsg, int Point, int Cash);
	bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, const string& ErrMsg);
	bool rfAckNotifyExpiredSkillIDs(byte[] DisplayOrder, byte[] SlotPos, int[] ItemTID, struct FBtrDouble[] ItemUID);
	bool rfAckNotifyExpiredItemIDs(byte[] DisplayOrder, byte[] SlotPos, int[] ItemTID, struct FBtrDouble[] ItemUID);
	bool rfAckGetAttachedItemFromMemo(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID);
	bool rfAckDeleteMailAll(int Result, byte MailType, int Count);
	bool rfAckDelMemo(int Result, const string& ErrMsg, int[] FailedMemoID);
	bool rfAckSendMemo(string[] CnamesToFail, int[] ResultArray);
	bool rfAckAuctionBidding(int Result, const string& ErrMsg, int PointRemain);
	bool rfAckAuctionTradeHistory(int Result, const string& ErrMsg, int ItemID, int PartID, string[] SellerCharNm, int[] DamageDegree, int[] Price);
	bool rfAckSendGift(int Result, const string& ErrMsg, int PointRemain, int CashRemain);
	bool rfAckRecvMemo(const string& cnameFrom, byte MemoType);
	bool rfAckReadMemo(const string& cnameFrom, const string& Text, const string& dateRecv, const struct FBtrDouble& ItemUID);
	bool rfAckEndMemoList();
	bool rfAckTestDouble(const struct FBtrDouble& vDouble, struct FBtrDouble[] vDoubles);
	bool rfAckMemoList(int[] MemoIdx, string[] cnameFrom, string[] dateRecv, string[] Text, byte[] Status, int[] UntilExpire, struct FBtrDouble[] ItemUID, int[] ItemID, byte[] MsgType, int[] ItemPartID);
	bool rfAckStartMemoList(int Result, const string& ErrMsg, byte Type, int TotalCount);
	bool rfAckFriendListEnd();
	bool rfAckFriendList(string[] FriendName, byte[] IsLogOn, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] LevelMarkID, int[] ClanLevel, int[] Level, byte[] IsLookForClan);
	bool rfAckFriendListStart(int Result, int TotalCount);
	bool rfReqCompleteFriendInvite(const string& CharnameToBeInvited, byte IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const string& ErrMsg);
	bool rfReqRecvFriendInvite(int ReqUserID, const string& ReqCharname, const string& InviteMsg);
	bool rfAckSendFriendInvite(int Result, const string& ErrMsg);
	bool rfAckNotifyLoadingState(int Result, int UserID, byte LoadingState);
	bool rfAckFailedStartGame(int Result, const string& ErrMsg, byte IsHost, int FailedUserID, int LoadingStep);
	bool rfAckSuccessStartGame(int Result, const string& ErrMsg, byte IsHost, const string& HostIP, int HostPort, int LoadingStep);
	bool rfAckHash(int Result, const string& Error);
	bool rfReqForceLogoutByOwner();
	bool ForceLogout_OnOK(class UGUIComponent* Sender);
	bool rfAckSellShopItemInfo(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueItemID, int SellPoint, int CurPoint, int AfterPoint);
	bool rfReqRecvChatWispher(const string& CharnameFrom, const string& Message);
	bool rfAckServerTime(int Time);
	bool rfAckGameOverEnd(int Result, const string& ErrMsg);
	bool rfAckRepairItem(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int RepairCost, int[] DamageDegree);
	bool rfAckRepairCost(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int[] RepairCost);
	bool rfAckUpdateWeaponDurability(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int[] Durability, byte[] IsDestroy, struct FBtrDouble[] FailedWeaponUniqueID);
	bool rfAckEntryQSlotUniqueIDList(int UserNum, byte[] QSlotDispOrder, struct FBtrDouble[] MWUniqueID, struct FBtrDouble[] PistolUniqueID, struct FBtrDouble[] TW1UniqueID, struct FBtrDouble[] TW2UniqueID, struct FBtrDouble[] KnifeUniqueID);
	bool rfAckEntryQSlotIDList(int UserNum, byte[] QSlotDispOrder, int[] MWItemID, int[] MWPartID, int[] MWPaintID, int[] PistolItemID, int[] PistolPartID, int[] PistolPaintID, int[] TWItemID1, int[] TWItemID2, int[] Skill1ID, int[] Skill2ID, int[] Skill3ID, int[] Skill4ID, int[] KWItemID);
	bool rfAckUpdateQSlot(int Result, const string& ErrMsg);
	bool rfAckQSlotList_2(int Result, const string& ErrMsg, byte[] QSlotDispOrder, int[] QSlotIDX, int[] ItemTID, struct FBtrDouble[] ItemUID, byte[] SlotPos);
	bool rfAckQSlotList(int Result, const string& ErrMsg, int[] QSlotID, string[] QSlotName, byte[] QSlotDispOrder, struct FBtrDouble[] MWItemID, struct FBtrDouble[] PistolItemID, struct FBtrDouble[] TWItemID1, struct FBtrDouble[] TWItemID2, int[] Skill1, int[] Skill2, int[] Skill3, int[] Skill4, struct FBtrDouble[] KnifeItemID);
	bool rfAckGP20CashModifyWeapon(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point);
	bool rfAckModifyWeapon(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point, int Cash);
	bool rfAckSellShopItem(int Result, const string& ErrMsg, int PointRemain, int CashRemain, int Count);
	bool rfAckBuyShopItem(int ItemCount, int[] Result, int[] BoughtItemTypeID, struct FBtrDouble[] BoughtItemUniqueID, int[] BoughtPartID, struct FBtrDouble[] BoughtUntilTIme, int[] BoughtStackCnt, int PointRemain, int CashRemain);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(int[] ItemID);
	bool rfAckShopItemListStart(int Count);
	bool rfReqConfirmSkillChanged();
	bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, const string& ErrMsg);
	bool rfAckEntrySkillList(int[] UserIDs, int[] SkillIDs, int[] SlotPositions, int Result, const string& ErrMsg);
	bool rfAckUserSkillListEnd();
	bool rfAckUserSkillList(int[] UniqueSkillID, int[] SkillID, struct FBtrDouble[] UntilTime, byte[] SlotPosition);
	bool rfAckUserSkillListStart(int Count, int Result, const string& ErrMsg);
	bool rfAckGetBootyChoose(int Result, const string& ErrMsg, byte GiveType, const struct FBtrDouble& ItemUniqueNumber, int ItemID, int PartID, byte ItemType, const struct FBtrDouble& UntilTime, int StackCount, int PaintID);
	bool rfAckGetBooty(int Result, const string& ErrMsg, int[] PrizeWinUserID, int[] BootyItemID, int[] BootyPartsID);
	bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, const string& ErrMsg);
	bool rfAckEntryItemList(int[] UserIDs, int[] ItemIDs, int[] SlotPositions, int[] AddPartsID, struct FBtrDouble[] UniqueID, int[] PaintID, int Result, const string& ErrMsg);
	bool rfAckRegisterOtherUdpInfo(int UID, const string& IP, int Port, byte NatType, byte Intervention, const string& HostInnerIP, int HostInnerPort);
	bool rfReqForceNatTypeSetting(int NatType);
	bool rfReqStartNatDiag(const string& Server1Addr, int Server1Port, const string& Server2Addr, int Server2Port);
	bool rfAckChangeUserState(int Result, const string& ErrMsg, int[] UserIDs, byte[] Positions, int[] Numbers, byte[] OldStates, byte[] NewStates);
	bool rfReqExteriorRoomState(int RoomNumber, byte RoomState);
	bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount);
	bool rfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, const string& RoomName, const string& MapName, const string& ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum);
	bool rfAckCharInfo(int Result, const string& ErrMsg, int UserID, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FCharInfo& stCharInfo, byte InClanRank, int ClanLevel);
	bool rfAckConfirmItemChanged(int Result, const string& ErrMsg);
	bool rfAckEquipItem(int ChangedNewItemID, const struct FBtrDouble& ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, const struct FBtrDouble& ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, const string& ErrMsg);
	bool rfAckChangeRoomSetting(int Result, const string& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfAckAIRewardResult(byte ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, int[] ScoreRewardUserID, byte[] ScoreRewardTYPE, int[] ScoreRewardID, int[] ScoreRewardCount);
	bool rfAckUpdateScore(int[] UserIDs, string[] NickNames, byte[] TeamIDs, int[] Scores, int[] Kills, int[] Assists, int[] Deaths, int[] EXPs, int[] EXPBonuses, int[] Points, int[] PointBonuses, int[] TeamScores, int[] BonusOwnerID, int[] BonusID);
	bool rfAckConnectGame(int UserID, int Result);
	bool rfAckMyEquipedQSlotList(byte[] QSlotDispOrder, struct FBtrDouble[] MWUniqueID, int[] MWItemID, int[] MWPartID, int[] MWPaintID, struct FBtrDouble[] PistolUniqueID, int[] PistolItemID, int[] PistolPartID, int[] PistolPaintID, struct FBtrDouble[] TW1UniqueID, int[] TWItemID1, struct FBtrDouble[] TW2UniqueID, int[] TWItemID2, int[] Skill1ID, int[] Skill2ID, int[] Skill3ID, int[] Skill4ID, int Result, struct FBtrDouble[] KnifeUniqueID, int[] KnifeItemID);
	bool rfAckMyEquipedSkillList(int[] SkillIDs, int[] SlotPositions, int Result);
	bool rfAckMyEquipedItemList(int[] ItemIDs, int[] SlotPositions, int[] AddPartsID, int[] PaintID, struct FBtrDouble[] UniqueID, int Result);
	bool rfAckChangeNewGuest(const string& HostIP);
	bool rfAckChangeHost(byte ClientNum);
	bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, const string& ErrMsg);
	bool rfAckDisconnectGame(int Result, int DisconnectUserID, const string& DisconnectUserName);
	bool rfReqRelayServerOff();
	bool rfReqRelayServerOn(const string& RelayServerIP, int RelayServerPortNum);
	bool rfAckGameRoomInfo(int Result, const string& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfAckGameOver(int UID, int GameRoomNumber, int Result, const string& ErrMsg);
	bool rfAckChangeGameMode(int GameNum, int UID, const string& GameMode, byte GameModeNum, int Result, const string& ErrMsg);
	bool rfAckSelectMap(int GameNum, int UID, const string& MapName, int Result, const string& ErrMsg);
	bool rfAckIsGameRoomPlaying(int GameRoomNum, byte IsPlaying);
	bool rfAckGameRoomDestroy(int GameRoomNum);
	bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, const string& ErrMsg);
	bool rfAckGameHostInfo(int GameNumber, const string& UserID, const string& IP, int Port, int Result, const string& ErrMsg);
	bool rfAckChangeTeam(int GameNumber, const string& UserID, int UID, int TeamNum, int Result, const string& ErrMsg);
	bool rfAckCreateGameRoom(int Result, const string& ErrMsg, int UserID, const string& RoomOwnerIP, const struct FGameRoomInfo& NetRoomInfo);
	bool rfAckLeaveRoom(int Num, int UID, const string& UserID, int Result, const string& ErrMsg);
	bool rfAckRoomUserList(int[] UID, string[] UserName, int[] Grade, int[] TeamNum, byte[] Statue, byte[] IsHost, string[] UserIP, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, byte[] IsLookingFor, int[] GMUID, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, const string& UserID, int TeamNum, int Grade, const string& UserIP, const string& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckChatClan(const string& CharName, const string& Message, int Result);
	bool rfAckChatNormal(int id, const string& Sender, const string& Message, int Result);
	bool rfAckRoomListEnd();
	bool rfAckRoomList(int[] GameNum, string[] Title, string[] MapName, int[] MapNum, byte[] UserCount, byte[] MaxCount, string[] ModeName, int[] ModeNum, byte[] WeaponLimit, byte[] IsHardCore, byte[] Status, string[] RoomOwnerIP, int[] GameMinute, string[] RoomOwnerName, byte[] IsSpecial, byte[] IsPassword, byte[] BotDifficult, byte[] BotModeUserTeamNum);
	bool rfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex);
	bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, int[] UID, string[] UserID, int[] UserLevels, string[] ClanName, int[] ClanPattern, int[] ClanBG, int[] ClanBL, int[] ClanGrade, int[] ClanWin, int[] ClanLose, byte[] IsLookForClan, int Result, const string& ErrMsg, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckLogin2(int Result, const string& ErrMsg, int UserID, const string& CharName, const struct FBtrDouble& CurServerTime, int CharDBID, byte IsGM);
	bool rfAckLeaveChannel(int Result, const string& UserID, int UID);
	bool rfAckEnterChannel(int id, int UID, const string& UserID, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckChannelList(int[] id, string[] Title, int[] CurUser, int[] MaxUser);
	bool rfAckAuctionInstantlyBuying(int Result, const string& ErrMsg, int PointRemain);
	bool rfAckAuctionMyItemCancel(int Result, const string& ErrMsg);
	bool rfAckAuctionItemListEnd(byte Section);
	bool rfAckAuctionItemList(byte Section, int[] UniqueIDs, int[] ItemIDs, int[] AddPartsIDs, struct FBtrDouble[] UntilTimes, int[] BiddingPrices, int[] InstantlyByuingPrices, int[] ItemDamageds, string[] HighestBidderNames, string[] SellerNames, int[] ItemCount);
	bool rfAckAuctionItemListStart(int Result, const string& ErrMsg, byte Section, int PageNum, int Count);
	bool rfAckAuctionItemListCount(int Result, const string& ErrMsg, byte Section, byte Classfy, int ItemType, int ItemGrade, int Count);
	bool rfAckAuctionMyItemRegister(int Result, const string& ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain);
	bool rfAckItemListEnd();
	bool rfAckItemList(struct FBtrDouble[] UniqueID, int[] ItemID, int[] ItemType, int[] Durability, struct FBtrDouble[] UntilTime, int[] SlotPosition, int[] AddPartsID, int[] DamageDegree, byte[] ItemState, int[] StackCount, int[] PaintID, int[] TradeCount);
	bool rfAckItemListStart(int Count, int Result, const string& ErrMsg);
	bool rfAckLogin(int Result, const string& ErrMsg, int UserID, const string& CharName, const string& ClanName, const struct FCharInfo& btCharInfo);
	void OnError(int ErrCode);
	void OnClose(int ErrCode);
	void OnConnect(int ErrCode);
};


// Class GUIWarfare.BTLabelNoticeHK
// 0x001C (0x03D8 - 0x03BC)
class UBTLabelNoticeHK : public UBTOwnerDrawImageHK
{
public:
	string                                             strNotice;                                                // 0x03BC(0x000C) (Localized, NeedCtorLink)
	class UBTNetMainMenu*                              MainMenu;                                                 // 0x03C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	float                                              DeltaMultiplier;                                          // 0x03CC(0x0004)
	struct FScriptDelegate                             __OnNextNotice__Delegate;                                 // 0x03D0(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTLabelNoticeHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void SetMainMenu(class UBTNetMainMenu* MM);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void OnNextNotice(const string& NextNotice);
};


// Class GUIWarfare.BTTPAASHK
// 0x0044 (0x0384 - 0x0340)
class UBTTPAASHK : public UBTTabPanelHK
{
public:
	class UBTNetMainMenu*                              MainMenu;                                                 // 0x0340(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       AAS;                                                      // 0x0344(0x0004) (ExportObject, NeedCtorLink, EditInline)
	float                                              NextAAS;                                                  // 0x0348(0x0004)
	float                                              LastTime;                                                 // 0x034C(0x0004)
	bool                                               bSelfTopMenuOwner;                                        // 0x0350(0x0004)
	bool                                               bSlidingTabPanel;                                         // 0x0350(0x0004)
	bool                                               bShowing;                                                 // 0x0350(0x0004)
	float                                              SlideTime;                                                // 0x0354(0x0004)
	float                                              SlideMultiplier;                                          // 0x0358(0x0004)
	struct FFloatBox                                   ShowAWinFrame;                                            // 0x035C(0x0010)
	struct FFloatBox                                   HideAWinFrame;                                            // 0x036C(0x0010)
	struct FScriptDelegate                             __OnNextAAS__Delegate;                                    // 0x037C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTTPAASHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetMainMenu(class UBTNetMainMenu* MM);
	bool Internal_OnPreDraw(class UCanvas* C);
	void OnNextAAS(const string& NextAAS);
};


// Class GUIWarfare.BTPageRoomLobby_TcpLogin
// 0x0004 (0x0030 - 0x002C)
class UBTPageRoomLobby_TcpLogin : public UBTTcpLink_Login
{
public:
	class UBTPageRoomLobby*                            Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageRoomLobby_TcpLogin");
		return ptr;
	}


	bool rfAckProcessPreLoginUser(int Result, const string& ErrMsg);
	bool rfAckLoginInHouseTest(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg, const string& BDay, byte Sex, const struct FBtrDouble& ServerTime);
	void OnConnect(int ErrCode);
};


// Class GUIWarfare.BTPageRoomLobby_TCP
// 0x0004 (0x0030 - 0x002C)
class UBTPageRoomLobby_TCP : public UBTTcpLink_Channel
{
public:
	class UBTPageRoomLobby*                            Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageRoomLobby_TCP");
		return ptr;
	}


	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(int[] ItemID);
	bool rfAckShopItemListStart(int Count);
	bool rfAckUseItemDuringGame(int ErrorCode, const string& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, int RemainCount);
	bool rfNotifyClanLevelup(const string& ClanName, int Levelup);
	bool rfNotifyNewClanName(const string& New_NickName);
	bool rfNotifyNewNickName(int Community_Type, const string& Old_NickName, const string& New_NickName);
	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, string[] CharName, int[] CharLevel, string[] ClanName, int[] ClanMarkPattern, int[] ClanMarkBG, int[] ClanMarkBL, int[] Ranking_Accum, int[] Ranking_Accum_Prev, int[] Ranking_Accum_Exp, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfAckFriendPosition(int Result, const string& TargetCharName, byte ServerType, const string& fServername, const string& fServerShortName, const string& fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, const string& ChannelNickName, int GameRoomNum);
	bool rfAckNotifyUpdateCharInfo_LevelMark(const string& CharName, int LevelMarkID);
	bool rfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel);
	bool rfReqInGameRoomUserInfoChanged();
	bool rfAckNotifyAdjustClanMemberGrade(const string& ClanName, const string& CharName, byte CharGrade);
	bool rfAckRoomUserPingInfo(int[] UnqueID, int[] Ping, int HostPriorityPoint);
	bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, const string& NewRoomTitle);
	bool rfAckCheckEquipedWeaponDurability(int Result, struct FBtrDouble[] ItemUniqueID, int[] ItemSlotNum);
	bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, int[] AFBotID, int[] RSABotID);
	bool rfAckAutoChangedTeamUserList(int[] UserID, int[] TeamNum);
	bool rfReqRecvForceFailedClientLoading(int ErrCode);
	bool rfAckStartHolePunching(int Result, const string& ErrMsg, int GameType, int ReqStartUserID);
	bool rfAckRegisterMyUdpInfo(int Result, const string& ErrMsg);
	bool rfAckNotifyMyCharInfoToRoomUser(int Result, const string& ErrMsg, int UID, const string& UserName, int Grade, int TeamNum, byte Statue, byte IsHost, const string& UserIP, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, byte IsLookFor);
	bool rfReqNotifyDisconnectHostInLoading(int Result, const string& ErrMsg, int HostID);
	bool rfReqRecvDeleteFriend(int Result, const string& FromCharName);
	bool rfAckDeleteFriend(int Result, string[] FailedCharname);
	bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, int[] UID, string[] CharName, int[] UserLevel, string[] ClanName, int[] ClanPattern, int[] ClanBG, int[] ClanBL, byte[] IsLookForClan, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckChatWispher(int Result, const string& ErrMsg, const string& ToCharName);
	bool rfAckAcquirePromotionItems(int UID, int Result, const string& ErrMsg, struct FBtrDouble[] ItemUniqueID, int[] ItemIDs, int[] PartIDs);
	bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, int[] ItemID, int[] PartID);
	bool rfReqClanCharPersonelIntro(const string& ClanName, const string& CharName);
	bool rfAckClanCharPersonelIntro(int Result, const string& ErrMsg, const string& PersonelIntro);
	bool rfAckRecvJoinClanResult(int Result, const string& ErrMsg);
	bool rfAckJoinClanResult(const string& ClanName, byte Permit, const string& PermitCharName);
	bool rfAckNotifyClanSecession(const string& ClanName, const string& CharName);
	bool rfAckNotifyNewClanMember(const string& ClanName, const string& CharName);
	bool rfReqRecvJoinClan(int UserIdx, const string& CharName, const string& Message);
	bool rfAckRecvClanInviteResult(int Result, const string& ErrMsg);
	bool rfAckInviteClanResult(const string& CharName, byte Permit, const string& ClanNm);
	bool rfAckJoinClan(int Result, const string& ErrMsg, const string& SpecificCharName, const string& RealRecvCharName, byte RealRecvCharClanGrade);
	bool rfAckInviteClan(int Result, const string& ErrMsg);
	bool rfReqRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& ClanName, const string& InviteMsg);
	bool rfAckSearchClan(int Result, const string& ErrMsg, int TotalPage, int[] ClanMarkPattern, int[] ClanMarkBG, byte[] ClanMarkBL, string[] ClanName, string[] ClanMaster, int[] ClanMember, int[] ClanMemberMax, int[] ClanCreateDate, int[] ClanWin, int[] ClanLose, int[] ClanDraw, int[] ClanRank, byte[] ClanRecruit, int[] ClanLevel);
	bool rfAckDBCharInfo(int Result, const string& ErrMsg, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckDupCheckClanName(int Result, const string& ErrMsg);
	bool rfAckCreateClan(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckGetIsHostBlocking(int Result, byte Blocking);
	bool rfAckNotifyHostBlocking(int Result, byte Blocking);
	bool rfAckGetHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, int[] FailedUserIDs);
	bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint);
	bool rfReqRecvForceDisconnectUDPFromHost(int Result);
	bool rfAckForceDisconnectUDPFromHost(int Result);
	bool rfReqNotifyChangeRoomState(byte RoomState);
	bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, const string& ErrMsg);
	bool rfReqCompleteFriendInvite(const string& CharnameToBeInvited, byte IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const string& ErrMsg);
	bool rfReqRecvFriendInvite(int ReqUserID, const string& ReqCharname, const string& InviteMsg);
	bool rfAckSendFriendInvite(int Result, const string& ErrMsg);
	bool rfAckNotifyLoadingState(int Result, int UserID, byte LoadingState);
	bool rfAckFailedStartGame(int Result, const string& ErrMsg, byte IsHost, int FailedUserID, int LoadingStep);
	bool rfAckSuccessStartGame(int Result, const string& ErrMsg, byte IsHost, const string& HostIP, int HostPort, int LoadingStep);
	bool rfReqRelayServerOff();
	bool rfAckGameOverEnd(int Result, const string& ErrMsg);
	bool rfAckUpdateWeaponDurability(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int[] Durability, byte[] IsDestroy, struct FBtrDouble[] FailedWeaponUniqueID);
	bool rfAckEntryQSlotUniqueIDList(int UserNum, byte[] QSlotDispOrder, struct FBtrDouble[] MWUniqueID, struct FBtrDouble[] PistolUniqueID, struct FBtrDouble[] TW1UniqueID, struct FBtrDouble[] TW2UniqueID, struct FBtrDouble[] KnifeUniqueID);
	bool rfAckEntryQSlotIDList(int UserNum, byte[] QSlotDispOrder, int[] MWItemID, int[] MWPartID, int[] MWPaintID, int[] PistolItemID, int[] PistolPartID, int[] PistolPaintID, int[] TWItemID1, int[] TWItemID2, int[] Skill1ID, int[] Skill2ID, int[] Skill3ID, int[] Skill4ID, int[] KWItemID);
	bool rfAckChangeNewGuest(const string& HostIP);
	bool rfAckChangeHost(byte ClientNum);
	bool rfAckGetBootyChoose(int Result, const string& ErrMsg, byte GiveType, const struct FBtrDouble& ItemUniqueNumber, int ItemID, int PartID, byte ItemType, const struct FBtrDouble& UntilTime, int StackCount, int PaintID);
	bool rfAckEntrySkillList(int[] UserIDs, int[] SkillIDs, int[] SlotPositions, int Result, const string& ErrMsg);
	bool rfAckGetBooty(int Result, const string& ErrMsg, int[] PrizeWinUserID, int[] BootyItemID, int[] BootyPartsID);
	bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, const string& ErrMsg);
	bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, const string& ErrMsg);
	bool rfAckEntryItemList(int[] UserIDs, int[] ItemIDs, int[] SlotPositions, int[] AddPartsID, struct FBtrDouble[] UniqueID, int[] PaintID, int Result, const string& ErrMsg);
	bool rfAckChangeUserState(int Result, const string& ErrMsg, int[] UserIDs, byte[] Positions, int[] Numbers, byte[] OldStates, byte[] NewStates);
	bool rfAckChangeRoomSetting(int Result, const string& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfAckAIRewardResult(byte ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, int[] ScoreRewardUserID, byte[] ScoreRewardTYPE, int[] ScoreRewardID, int[] ScoreRewardCount);
	bool rfAckUpdateScore(int[] UserIDs, string[] NickNames, byte[] TeamIDs, int[] Scores, int[] Kills, int[] Assists, int[] Deaths, int[] EXPs, int[] EXPBonuses, int[] Points, int[] PointBonuses, int[] TeamScores, int[] BonusOwnerID, int[] BonusID);
	bool rfAckRegisterOtherUdpInfo(int UID, const string& IP, int Port, byte NatType, byte Intervention, const string& HostInnerIP, int HostInnerPort);
	bool rfAckDisconnectGame(int Result, int DisconnectUserID, const string& DisconnectUserName);
	bool rfAckGameOver(int UID, int GameRoomNumber, int Result, const string& ErrMsg);
	bool rfAckGameRoomInfo(int Result, const string& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfAckChangeGameMode(int GameNum, int UID, const string& GameMode, byte GameModeNum, int Result, const string& ErrMsg);
	bool rfAckSelectMap(int GameNum, int UID, const string& MapName, int Result, const string& ErrMsg);
	bool rfAckChangeTeam(int GameNumber, const string& UserID, int UID, int TeamNum, int Result, const string& ErrMsg);
	bool rfAckRoomUserList(int[] UID, string[] UserName, int[] Grade, int[] TeamNum, byte[] Statue, byte[] IsHost, string[] UserIP, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, byte[] IsLookingFor, int[] GMUID, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckEnterChannel(int id, int UID, const string& UserID, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckLeaveRoom(int Num, int UID, const string& UserID, int Result, const string& ErrMsg);
	bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, const string& UserID, int TeamNum, int Grade, const string& UserIP, const string& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, const string& ErrMsg);
	bool rfAckIsGameRoomPlaying(int GameRoomNum, byte IsPlaying);
	bool rfAckGameHostInfo(int GameNumber, const string& UserID, const string& IP, int Port, int Result, const string& ErrMsg);
	bool rfAckConnectGame(int UserID, int Result);
};


// Class GUIWarfare.BTRefreshTime
// 0x0008 (0x0034 - 0x002C)
class UBTRefreshTime : public UObject
{
public:
	float                                              fCurTime;                                                 // 0x002C(0x0004)
	float                                              fMaxTime;                                                 // 0x0030(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTRefreshTime");
		return ptr;
	}


	void SetMaxTime(float fMaxTime);
	void Update(float fAppDelta);
	void ResetTime();
	bool CheckCondition();
};


// Class GUIWarfare.BTWindowItemDurabilityWarningHK
// 0x01A8 (0x0668 - 0x04C0)
class UBTWindowItemDurabilityWarningHK : public UBTWindowHK
{
public:
	int                                                SavePoint;                                                // 0x04C0(0x0004)
	class UBTNetMainMenu*                              MainMenu;                                                 // 0x04C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                MyPoint;                                                  // 0x04C8(0x0004)
	int                                                RepairSumCost;                                            // 0x04CC(0x0004)
	struct FFloatBox                                   fbTPItemList;                                             // 0x04D0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPItemListHK*                             TPItemList;                                               // 0x04E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelDivider[0x2];                                      // 0x04E4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelDivider[0x2];                                        // 0x0504(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strLabel[0x5];                                            // 0x050C(0x000C) (Localized, NeedCtorLink)
	string                                             strPoint;                                                 // 0x0548(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0x5];                                             // 0x0554(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelEdit[0x3];                                         // 0x05A4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0x5];                                               // 0x05D4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelEdit[0x3];                                           // 0x05E8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strButtonSelectAll[0x2];                                  // 0x05F4(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonSelectAll;                                        // 0x060C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonSelectAll;                                          // 0x061C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbNEditBox[0x3];                                          // 0x0620(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTNumericEditBoxHK*                         NEditBox[0x3];                                            // 0x0650(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FBtrDouble[]                                selectlist;                                               // 0x065C(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTWindowItemDurabilityWarningHK");
		return ptr;
	}


	bool Internal_OnPreDraw(class UCanvas* C);
	void InternalOnOpen();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void AddItem(const struct FBtrDouble& UniqueID, int ItemID, int PartID, int Durability, int RepairCost);
	void SetCurrentPoint(int MyPoint);
	void UpdateNEditBox();
	bool ImageListBox_OnClick(class UGUIComponent* Sender);
	bool ButtonNonSelectAll_OnClick(class UGUIComponent* Sender);
	bool ButtonSelectAll_OnClick(class UGUIComponent* Sender);
	bool ButtonCancel_OnClick(class UGUIComponent* Sender);
	bool RepairItem_OnOK(class UGUIComponent* Sender);
	bool ButtonOK_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfare.BTPageServerSelection_TcpLogin
// 0x0004 (0x0030 - 0x002C)
class UBTPageServerSelection_TcpLogin : public UBTTcpLink_Login
{
public:
	class UBTPageServerSelection*                      Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageServerSelection_TcpLogin");
		return ptr;
	}


	bool rfAckLoginWithGlobal(int Result);
	bool rfAckLoginWithThailand(int Result);
	bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType);
	bool rfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock);
	bool rfAckLogOut(byte Result, byte Reason);
	bool rfAckClientChecksum(int Result);
	bool rfAckClientChallenge(const string& Key1, const struct FBtrDouble& Key2);
	bool rfAckLoginInHouseTest(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg, const string& BDay, byte Sex, const struct FBtrDouble& ServerTime);
	bool rfAckCharInfo(int Result, const string& CharName, int Level, int Exp, const string& ClanName);
	bool rfAckServerList(string[] CServername, string[] CServerShortName, string[] ServerIP, int[] serverPort, string[] ChannelName, string[] ChannelNickName, int[] ChannelNum, int[] chMaxUser, int[] chCurUser, string[] ServerGroupName, int[] ServerGroupID, int[] ServerDispOrder, int[] DataPort, byte[] OptionCount_byte, byte[] OptionKey_byte, byte[] OptionValue_byte, byte[] OptionCount_int, byte[] OptionKey_int, int[] OptionValue_int, byte[] OptionCount_float, byte[] OptionKey_float, float[] OptionValue_float, byte[] IsClanChannel, byte[] IsUseDedicateHost);
};


// Class GUIWarfare.BTPageServerSelection_TCP
// 0x0004 (0x0030 - 0x002C)
class UBTPageServerSelection_TCP : public UBTTcpLink_Channel
{
public:
	class UBTPageServerSelection*                      Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageServerSelection_TCP");
		return ptr;
	}


	bool rfReqAddSpecialRank(const string& NickName);
	bool rfAckExpandSlotConfirm(int Result, const string& ErrMsg, int QSlotID, const struct FBtrDouble& MWItemID, const struct FBtrDouble& PistolItemID, const struct FBtrDouble& TWItemID1, const struct FBtrDouble& TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4, const struct FBtrDouble& KnifeItemID);
	bool rfAckUpdateQSlot_2(int Result, const string& ErrMsg, byte[] DisplayOrder, int[] ItemTID, struct FBtrDouble[] ItemUID, byte[] SlotPos_Key, byte[] SlotPos_Value);
	bool rfAckQSlotList_2(int Result, const string& ErrMsg, byte[] QSlotDispOrder, int[] QSlotIDX, int[] ItemTID, struct FBtrDouble[] ItemUID, byte[] SlotPos);
	bool rfAckPcBangItemList(int[] ItemTID, int[] PartID);
	bool rfAckSendGift(int Result, const string& ErrMsg, int PointRemain, int CashRemain);
	bool rfAckUseItemDuringGame(int ErrorCode, const string& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, int RemainCount);
	bool rfAckSpecialQuestRank(string[] CharList);
	bool rfAckReceiveSpecialReward(int Result, int RewardedQuestID, byte RewardedQuestIsComplete, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount);
	bool rfAckDailyRewardListThisMonth(byte[] Type, byte[] Number, int[] ItemID, int[] ItemCount);
	bool rfAckPuzzleList(int Result, byte IsComplete, byte[] UpdatedNum, byte[] StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfAckAttendanceList(int Result, byte IsComplete, byte UpdatedNum, byte[] StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfAckSetCommunityOption(int Result, const string& ErrStr);
	bool rfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite);
	bool rfChangeItemInstanceInfo(int ErrorCode, int ItemID, const struct FBtrDouble& ItemUniqueID, byte ChangeCount, int RemainCount);
	bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, byte IsNotification, string[] NickName, struct FBtrDouble[] Time, int GetItemID);
	bool rfAckGetItemFromItemBox(int Result, const string& ErrMsg, int ItemIDChoose, int PartIDChoose, const struct FBtrDouble& BoxItemIdx, int BxoItemCount, byte bHave, const struct FBtrDouble& ItemIdx, const struct FBtrDouble& UntilTime, int StackCount);
	bool rfAckBuyItemByWebzenCash(int Result, const string& ErrMsg);
	bool rfNotifyCouponUseError(int Time);
	bool rfAckRecvClanInviteResult(int Result, const string& ErrMsg);
	bool rfReqRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& ClanName, const string& InviteMsg);
	bool rfReqNotifyShopItemDataEnd(int Ver);
	bool rfReqNotifyShopPackageItemData(int PackageProductNo, int[] ProductCode, int[] ProductQuantity, int[] ProductHour, const string& Description);
	bool rfReqNotifyShopItemData(int[] ProductNo, string[] ProductName, int[] ProductCode, byte[] SaleType, int[] ProductCost, int[] ProductHour, int[] ProductQuantity, int[] SaleMasterFlag, int[] SaleStatus, int[] IsGift, struct FBtrDouble[] SaleEndTime, int[] Discountcost);
	bool rfAckShopItemData();
	bool rfAckTencent_StartTenProtect(int CharDBID);
	bool rfAckMoveToLobby(byte MessageType);
	bool rfAckPopUpMessage(int MessageType);
	bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckLogOut(byte Result, byte Reason);
	bool rfAckServerType(byte Type);
	bool rfAckPaidItem_NotifyChangeClanname(const string& NewClanname);
	bool rfAckPaidItem_ChangeClanname(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const string& NewClanname);
	bool rfAckPaidItem_ChangeCharname(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const string& NewCharname);
	bool rfAckGetMyMailBoxState(int Result, byte IsFull, int NewMailCount);
	bool rfAckSetLookForClan(int Result, const string& ErrMsg, byte IsLookingFor);
	bool rfAckPaidItem_RelayBroadcast(const string& CharName, const string& Msg);
	bool rfAckRecvSystemMsg(byte CommunityType, const struct FSystemMsgParam& MsgInfo);
	bool rfReqRecvChatWispher(const string& CharnameFrom, const string& Message);
	bool rfAckChatClan(const string& CharName, const string& Message, int Result);
	bool rfAckChatNormal(int id, const string& Sender, const string& Message, int Result);
	bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID);
	bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID);
	bool rfAckForceDisconnectUser_GM(int Result, const string& ErrMsg, const string& CharName);
	bool rfAckNotice_GM(int Result, const string& ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const string& Msg);
	bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, const string& NewRoomTitle);
	bool rfAckCharBlockInfo(int Result, const struct FBtrDouble& ChatBlockStartTime, const struct FBtrDouble& ChatBlockEndTime, struct FBtrDouble[] BlockedItemIdx);
	bool rfAckPaidItem_NotifyChangeClanMark(const string& ClanName, int Pattern, int BG, int BL);
	bool rfAckPaidItem_ChangeClanMark(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_ClanMarkDupCheck(int Result, const string& ErrMsg);
	bool rfAckPaidItem_BroadCast(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_EraseRecord(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int Command, int RemainCount);
	bool rfAckWebzenBillingUseStorageItem(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID, const struct FBtrDouble& ItemExtra);
	bool rfAckWebzenBillingStorageListEnd();
	bool rfAckWebzenBillingStorageList(int[] Seq, int[] ItemSeq, int[] GroupCode, int[] ShareFlag, int[] ProductSeq, string[] CashName, struct FBtrDouble[] CashPoint, string[] SendAccountID, string[] SendMessage, byte[] ItemType, byte[] RelationType, int[] ProductType, int[] PriceSeq);
	bool rfAckWebzenBillingStorageListStart(int Result, const string& ErrMsg, int TotalCount, int TotalPage, int CurPage);
	bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, const string& ErrMsg);
	bool rfAckEquipItem(int ChangedNewItemID, const struct FBtrDouble& ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, const struct FBtrDouble& ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, const string& ErrMsg);
	bool rfAckRandomBox_Use(int Result, const string& ErrMsg, const struct FBtrDouble& RandomBoxItemIdx, int RandomBxoItemCount, const struct FBtrDouble& KeyItemIdx, int KeyItemRemainCount, int[] ItemIDChoose, int[] PartIDChoose, int[] PeriodOnChoosenItem, int[] StackCountOnChoosenItem, byte[] bHave, struct FBtrDouble[] ItemIdx, struct FBtrDouble[] UntilTime, int[] StackCount);
	bool rfAckRemoveBlockUserList(int Result, const string& ErrMsg);
	bool rfAckAddBlockUserList(int Result, const string& ErrMsg);
	bool rfAckPCBangUserListEnd();
	bool rfAckPCBangUserList(string[] FriendName, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] Level, int[] ClanGrade, int[] ClanWin, int[] ClanLose, byte[] IsLookForClan, byte[] IsCombat, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckPCBangUserListStart(int Result, int TotalCount);
	bool rfAckClanUserList(int Result, const string& ErrMsg, int[] Level, string[] CharName, byte[] ClanGrade, int[] ClanWinCnt, int[] ClanLoseCnt, int[] LevelMarkID, int[] TitleMarkID, int[] DudeId);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfAckBlockUserList(string[] CharName);
	bool rfAckBlockUserListEnd();
	bool rfAckBlockUserListStart(int Result, int TotalCount);
	bool rfAckFriendListEnd();
	bool rfAckFriendList(string[] FriendName, byte[] IsLogOn, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] LevelMarkID, int[] ClanLevel, int[] Level, byte[] IsLookForClan);
	bool rfAckFriendListStart(int Result, int TotalCount);
	bool rfAckRegisterMainPCBang(int Result, const string& ErrMsg);
	bool rfAckClanInfo(const struct FClanInfo& stClanInfo);
	bool rfAckCharInfo(int Result, const string& ErrMsg, int UserID, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FCharInfo& stCharInfo, byte InClanRank, int ClanLevel);
	bool rfAckRegisteredPCBangInfo(int Result, const string& ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, const string& PCBangName);
	bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckMyMoney(int Result, const string& ErrMsg, int Point, int Cash);
	bool rfAckWebzenCash(int Result, const string& ErrMsg, const struct FBtrDouble& PCoinCash, const struct FBtrDouble& CCoinCash);
	bool rfReqClanMatch_InviteCrewResult(const string& Invitee, int Result);
	bool rfReqClanMatch_RecvInviteCrew(const string& Inviter, const string& ServerIP, int Port, int WaittingID, const string& Msg, int MapNum, int InviteUserChannelNum, const string& LeaderName, const string& RoomName);
	bool rfAckClanMatch_InviteCrew(int Result, const string& ErrMsg);
	bool rfAckLimitedListInChannel(int Result, int[] LimitedMapID, int[] LimitedModeID);
	bool rfReqDailyQuestNewAvailable(int[] ExpiredQuestID, int[] NewQuestID);
	bool rfReqQuestNewAvailable(int[] AchivedQuestID, int[] NewQuestID, byte[] IsDailyQuest, int[] ExpiredQuest);
	bool rfAckQuestUpdate(int Result, const string& ErrMsg);
	bool rfAckQuestListEnd();
	bool rfAckQuestList(int[] QuestID, int[] CountPrograss, byte[] IsDailyQuest, byte[] IsComplete);
	bool rfAckQuestListStart(int Result, const string& ErrMsg);
	bool rfAckRecvInviteGameRoomResult(int Result);
	bool rfReqRecvInviteGameRoom(const string& InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, const string& RoomUniqueID, int RoomNumber, const string& RoomName, byte RoomState, const string& MapName, const string& OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, const string& Password, const string& InviteCharName);
	bool rfAckInviteGameRoom(int Result, byte Answer, const string& GuestCharName);
	bool rfAckItemListInItemBox(int Result, const string& ErrMsg, const struct FBtrDouble& ItemUniqueID, int BoxItemID, int[] ItemID, int[] PartID, byte FromContent);
	bool rfAckGetServerTime(const struct FBtrDouble& ServerTime, const string& ClientIP);
	bool rfAckExceedMaxUser();
	bool rfAckBuyShopItem(int ItemCount, int[] Result, int[] BoughtItemTypeID, struct FBtrDouble[] BoughtItemUniqueID, int[] BoughtPartID, struct FBtrDouble[] BoughtUntilTIme, int[] BoughtStackCnt, int PointRemain, int CashRemain);
	bool rfReqRecvForceDisconnected_FromGM(int Result, const string& ErrMsg);
	bool rfReqRecvNotice_FromGM(int Result, const string& ErrMsg, string[] NoticeMsg, byte IsFromDB);
	bool rfAckUpdateQSlot(int Result, const string& ErrMsg);
	bool rfAckRepairItem(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int RepairCost, int[] DamageDegree);
	bool rfAckRepairCost(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int[] RepairCost);
	bool rfReqNotifyDurabilityZeroItem(int Result, const string& ErrMsg, int UserID, struct FBtrDouble[] ItemUniqueIDs, int[] ItemIDs, int[] ItemPartIDs, byte[] ItemSlotPos);
	bool rfAckNotifyExpiredSkillIDs(byte[] DisplayOrder, byte[] SlotPos, int[] ItemTID, struct FBtrDouble[] ItemUID);
	bool rfAckNotifyExpiredItemIDs(byte[] DisplayOrder, byte[] SlotPos, int[] ItemTID, struct FBtrDouble[] ItemUID);
	bool rfReqNotifyRelayServerAddr(const string& RelayIP, int RelayPort);
	bool rfAckHash(int Result, const string& Error);
	bool rfAckServerTime(int Time);
	bool rfAckQSlotList(int Result, const string& ErrMsg, int[] QSlotID, string[] QSlotName, byte[] QSlotDispOrder, struct FBtrDouble[] MWItemID, struct FBtrDouble[] PistolItemID, struct FBtrDouble[] TWItemID1, struct FBtrDouble[] TWItemID2, int[] Skill1, int[] Skill2, int[] Skill3, int[] Skill4, struct FBtrDouble[] KnifeItemID);
	bool rfAckUserSkillListEnd();
	bool rfAckUserSkillList(int[] UniqueSkillID, int[] SkillID, struct FBtrDouble[] UntilTime, byte[] SlotPosition);
	bool rfAckUserSkillListStart(int Count, int Result, const string& ErrMsg);
	bool rfAckItemListEnd();
	bool rfAckItemList(struct FBtrDouble[] UniqueID, int[] ItemID, int[] ItemType, int[] Durability, struct FBtrDouble[] UntilTime, int[] SlotPosition, int[] AddPartsID, int[] DamageDegree, byte[] ItemState, int[] StackCount, int[] PaintID, int[] TradeCount);
	bool rfAckItemListStart(int Count, int Result, const string& ErrMsg);
	bool rfAckLogin2(int Result, const string& ErrMsg, int UserID, const string& CharName, const struct FBtrDouble& CurServerTime, int CharDBID, byte IsGM);
	bool rfAckLeaveChannel(int Result, const string& UserID, int UID);
	bool rfAckEnterChannel(int id, int UID, const string& UserID, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
};


// Class GUIWarfare.BTPageLobby_TcpLogin
// 0x0004 (0x0030 - 0x002C)
class UBTPageLobby_TcpLogin : public UBTTcpLink_Login
{
public:
	class UBTPageLobby*                                Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageLobby_TcpLogin");
		return ptr;
	}


	bool rfAckProcessPreLoginUser(int Result, const string& ErrMsg);
	bool rfAckLoginInHouseTest(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg, const string& BDay, byte Sex, const struct FBtrDouble& ServerTime);
	void OnConnect(int ErrCode);
};


// Class GUIWarfare.BTPageLobby_TCP
// 0x0004 (0x0030 - 0x002C)
class UBTPageLobby_TCP : public UBTTcpLink_Channel
{
public:
	class UBTPageLobby*                                Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageLobby_TCP");
		return ptr;
	}


	bool rfNotifyClanLevelup(const string& ClanName, int Levelup);
	bool rfNotifyNewClanName(const string& New_NickName);
	bool rfNotifyNewNickName(int Community_Type, const string& Old_NickName, const string& New_NickName);
	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, string[] CharName, int[] CharLevel, string[] ClanName, int[] ClanMarkPattern, int[] ClanMarkBG, int[] ClanMarkBL, int[] Ranking_Accum, int[] Ranking_Accum_Prev, int[] Ranking_Accum_Exp, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfAckFriendPosition(int Result, const string& TargetCharName, byte ServerType, const string& fServername, const string& fServerShortName, const string& fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, const string& ChannelNickName, int GameRoomNum);
	bool rfAckMoveToLobby(byte MessageType);
	bool rfAckLogOut(byte Result, byte Reason);
	bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, const string& RoomName, int MapNum, int CurUserCount, int MaxUserCount, byte Status, byte IsPublic);
	bool rfAckNotifyEndTutorial(int UserID, const string& CharName, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckNotifyStartTutorial(int Result, int UserID);
	bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, const string& NewRoomTitle);
	bool rfAckClanMatch_EndPublicWaitRoomList();
	bool rfAckClanMatch_PublicWaitRoomList(int[] WaitRoomIdx, string[] LeaderName, string[] RoomName, int[] MapNum, int[] CurUserCount, int[] MaxUserCount, byte[] Status);
	bool rfAckClanMatch_StartPublicWaitRoomList(int Result, const string& ErrMsg, int Count);
	bool rfReqExteriorRoomOwnerInfo(int RoomNum, const string& OwnerName, const string& OwnerIP);
	bool rfAckQuestGetAvailableEventList(int Result, const string& ErrMsg, int[] QuestID);
	bool rfAckClanMatch_GetReady(int Result, const string& ErrMsg, int RoomIndex);
	bool rfAckClanMatch_Join(int Result, const string& ErrMsg);
	bool rfAckAdjustClanMemberGrade(int Result, const string& ErrMsg, const string& ClanName, const string& CharName, byte CharGrade);
	bool rfReqRecvDeleteFriend(int Result, const string& FromCharName);
	bool rfAckDeleteFriend(int Result, string[] FailedCharname);
	bool rfAckChatWispher(int Result, const string& ErrMsg, const string& ToCharName);
	bool rfAckNotifyAdjustClanMemberGrade(const string& ClanName, const string& CharName, byte CharGrade);
	bool rfReqClanCharPersonelIntro(const string& ClanName, const string& CharName);
	bool rfAckClanCharPersonelIntro(int Result, const string& ErrMsg, const string& PersonelIntro);
	bool rfAckRecvJoinClanResult(int Result, const string& ErrMsg);
	bool rfAckJoinClanResult(const string& ClanName, byte Permit, const string& PermitCharName);
	bool rfAckNotifyClanSecession(const string& ClanName, const string& CharName);
	bool rfAckNotifyNewClanMember(const string& ClanName, const string& CharName);
	bool rfReqRecvJoinClan(int UserIdx, const string& CharName, const string& Message);
	bool rfAckInviteClanResult(const string& CharName, byte Permit, const string& ClanNm);
	bool rfAckJoinClan(int Result, const string& ErrMsg, const string& SpecificCharName, const string& RealRecvCharName, byte RealRecvCharClanGrade);
	bool rfAckInviteClan(int Result, const string& ErrMsg);
	bool rfReqRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& ClanName, const string& InviteMsg);
	bool rfAckSearchClan(int Result, const string& ErrMsg, int TotalPage, int[] ClanMarkPattern, int[] ClanMarkBG, byte[] ClanMarkBL, string[] ClanName, string[] ClanMaster, int[] ClanMember, int[] ClanMemberMax, int[] ClanCreateDate, int[] ClanWin, int[] ClanLose, int[] ClanDraw, int[] ClanRank, byte[] ClanRecruit, int[] ClanLevel);
	bool rfAckDBCharInfo(int Result, const string& ErrMsg, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckDupCheckClanName(int Result, const string& ErrMsg);
	bool rfAckCreateClan(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckGameRoomInfo(int Result, const string& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfReqCompleteFriendInvite(const string& CharnameToBeInvited, byte IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const string& ErrMsg);
	bool rfReqRecvFriendInvite(int ReqUserID, const string& ReqCharname, const string& InviteMsg);
	bool rfAckSendFriendInvite(int Result, const string& ErrMsg);
	bool rfReqExteriorRoomState(int RoomNumber, byte RoomState);
	bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount);
	bool rfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, const string& RoomName, const string& MapName, const string& ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum);
	bool rfAckGameRoomDestroy(int GameRoomNum);
	bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, int[] UID, string[] UserID, int[] UserLevels, string[] ClanName, int[] ClanPattern, int[] ClanBG, int[] ClanBL, int[] ClanGrade, int[] ClanWin, int[] ClanLose, byte[] IsLookForClan, int Result, const string& ErrMsg, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckRoomList(int[] GameNum, string[] Title, string[] MapName, int[] MapNum, byte[] UserCount, byte[] MaxCount, string[] ModeName, int[] ModeNum, byte[] WeaponLimit, byte[] IsTeamBalance, byte[] Status, string[] RoomOwnerIP, int[] GameMinute, string[] RoomOwnerName, byte[] IsSpecial, byte[] IsPassword, byte[] BotDifficult, byte[] BotModeUserTeamNum);
	bool rfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex);
	bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, const string& UserID, int TeamNum, int Grade, const string& UserIP, const string& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckLeaveChannel(int Result, const string& UserID, int UID);
	bool rfAckEnterChannel(int id, int UID, const string& UserID, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckCreateGameRoom(int Result, const string& ErrMsg, int UserID, const string& RoomOwnerIP, const struct FGameRoomInfo& NetRoomInfo);
};


// Class GUIWarfare.BTNuclearButtonHK
// 0x0054 (0x0524 - 0x04D0)
class UBTNuclearButtonHK : public UBTOwnerDrawCaptionButtonHK
{
public:
	string                                             strDonotPress;                                            // 0x04D0(0x000C) (Localized, NeedCtorLink)
	bool                                               bNuclearActive;                                           // 0x04DC(0x0004)
	struct FFloatBox                                   CoreBox;                                                  // 0x04E0(0x0010)
	struct FImage                                      CoreImg;                                                  // 0x04F0(0x0020)
	float                                              MaxPhaseTransformTime;                                    // 0x0510(0x0004)
	float                                              PhaseTransformTime;                                       // 0x0514(0x0004)
	int                                                NuclearButtonPhase;                                       // 0x0518(0x0004)
	struct FScriptDelegate                             __OnCoreClick__Delegate;                                  // 0x051C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTNuclearButtonHK");
		return ptr;
	}


	bool OnClick(class UGUIComponent* Sender);
	bool OnCoreClick(class UGUIComponent* Sender);
	void OnRendered(class UCanvas* C);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfare.BTPageClanWar_TCP
// 0x0004 (0x0030 - 0x002C)
class UBTPageClanWar_TCP : public UBTTcpLink_Channel
{
public:
	class UBTPageClanWar*                              Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageClanWar_TCP");
		return ptr;
	}


	bool rfNotifyClanLevelup(const string& ClanName, int Levelup);
	bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, const string& ErrMsg, int[] MapNumArray, int VersusMode, byte IsPublic);
	bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, const string& ErrMsg, int[] MapNumArray, int VersusMode, const string& WaitRoomName);
	bool rfAckEnterChannel(int id, int UID, const string& UserID, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckNotifyAdjustClanMemberGrade(const string& ClanName, const string& CharName, byte CharGrade);
	bool rfAckAdjustClanMemberGrade(int Result, const string& ErrMsg, const string& ClanName, const string& CharName, byte CharGrade);
	bool rfReqRecvDeleteFriend(int Result, const string& FromCharName);
	bool rfAckDeleteFriend(int Result, string[] FailedCharname);
	bool rfAckRecvJoinClanResult(int Result, const string& ErrMsg);
	bool rfAckJoinClanResult(const string& ClanName, byte Permit, const string& PermitCharName);
	bool rfAckNotifyClanSecession(const string& ClanName, const string& CharName);
	bool rfAckNotifyNewClanMember(const string& ClanName, const string& CharName);
	bool rfAckSearchClan(int Result, const string& ErrMsg, int TotalPage, int[] ClanMarkPattern, int[] ClanMarkBG, byte[] ClanMarkBL, string[] ClanName, string[] ClanMaster, int[] ClanMember, int[] ClanMemberMax, int[] ClanCreateDate, int[] ClanWin, int[] ClanLose, int[] ClanDraw, int[] ClanRank, byte[] ClanRecruit, int[] ClanLevel);
	bool rfAckInviteClanResult(const string& CharName, byte Permit, const string& ClanNm);
	bool rfAckJoinClan(int Result, const string& ErrMsg, const string& SpecificCharName, const string& RealRecvCharName, byte RealRecvCharClanGrade);
	bool rfAckInviteClan(int Result, const string& ErrMsg);
	bool rfAckClanCharPersonelIntro(int Result, const string& ErrMsg, const string& PersonelIntro);
	bool rfAckDBCharInfo(int Result, const string& ErrMsg, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckCreateClan(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckDupCheckClanName(int Result, const string& ErrMsg);
	bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, int[] UID, string[] UserID, int[] UserLevels, string[] ClanName, int[] ClanPattern, int[] ClanBG, int[] ClanBL, int[] ClanGrade, int[] ClanWin, int[] ClanLose, byte[] IsLookForClan, int Result, const string& ErrMsg, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckClanUserList(int Result, const string& ErrMsg, int[] Level, string[] CharName, byte[] ClanGrade, int[] ClanWinCnt, int[] ClanLoseCnt, int[] LevelMarkID, int[] TitleMarkID, int[] DudeId);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfAckFriendListEnd();
	bool rfAckFriendList(string[] FriendName, byte[] IsLogOn, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] LevelMarkID, int[] ClanLevel, int[] Level, byte[] IsLookForClan);
	bool rfAckFriendListStart(int Result, int TotalCount);
	bool rfReqCompleteFriendInvite(const string& CharnameToBeInvited, byte IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const string& ErrMsg);
	bool rfReqRecvFriendInvite(int ReqUserID, const string& ReqCharname, const string& InviteMsg);
	bool rfAckSendFriendInvite(int Result, const string& ErrMsg);
	bool rfAckClanMatch_SetWaitRoomPublic(int Result, const string& ErrMsg, byte Set);
	bool rfAckClanMatch_StopSearching();
	bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber);
	bool rfAckClanMatch_NotifyStartSearching(int ShouldWaitMore);
	bool rfAckClanMatch_StartSearching(int Result, const string& ErrMsg, int ShouldWaitMore);
	bool rfAckClanMatch_ChangeLeader(int Result, const string& ErrMsg, int NewLeader, const string& NewLeaderName);
	bool rfAckClanMatch_WaittingTeamList(int TtotlCount, int[] Grade, int[] Map, int[] Versus);
	bool rfAckClanMatch_Chat(int Result, const string& ErrMsg, const string& CharName, const string& Msg);
	bool rfAckClanMatch_Leave(int Result, const string& ErrMsg);
	bool rfAckClanMatch_MemberList(byte[] IsLeader, int[] ClanMarkPA, int[] ClanMarkBG, int[] ClanMarkBL, int[] Level, string[] CharName, int[] ClanGrade, int[] ClanWin, int[] ClanLose, string[] ClanName, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckClanMatch_LeaveNotify(const string& CharName);
	bool rfAckClanMatch_JoinNotify(byte IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, const string& CharName, int ClanGrade, int ClanWin, int ClanLose, const string& ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckClanMatch_Join(int Result, const string& ErrMsg);
	bool rfAckClanMatch_NotifiyStartCombat(int[] MapNumArray, int VersusMode);
	bool rfAckClanMatch_StartCombat(int Result, const string& ErrMsg);
	bool rfAckClanMatch_GetReady(int Result, const string& ErrMsg, int RoomIndex);
};


// Class GUIWarfare.BTPageInventory_TCP
// 0x0004 (0x0030 - 0x002C)
class UBTPageInventory_TCP : public UBTTcpLink_Channel
{
public:
	class UBTPageInventory*                            Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageInventory_TCP");
		return ptr;
	}


	bool rfAckCouponUse(int Result, const string& ErrMsg);
	bool rfAckRepairItem(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int RepairCost, int[] DamageDegree);
	bool rfAckRepairCost(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int[] RepairCost);
	bool rfAckUpdateQSlot_2(int Result, const string& ErrMsg, byte[] DisplayOrder, int[] ItemTID, struct FBtrDouble[] ItemUID, byte[] SlotPos_Key, byte[] SlotPos_Value);
	bool rfAckUpdateQSlot(int Result, const string& ErrMsg);
	bool rfAckGP20CashModifyWeapon(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point);
	bool rfAckModifyWeapon(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point, int Cash);
	bool rfAckSellShopItem(int Result, const string& ErrMsg, int PointRemain, int CashRemain, int Count);
	bool rfAckSellShopItemInfo(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueItemID, int SellPoint, int CurPoint, int AfterPoint);
	bool rfReqConfirmSkillChanged();
	bool rfAckConfirmItemChanged(int Result, const string& ErrMsg);
	bool rfAckEquipItem(int ChangedNewItemID, const struct FBtrDouble& ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, const struct FBtrDouble& ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, const string& ErrMsg);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(int[] ItemID);
	bool rfAckShopItemListStart(int Count);
};


// Class GUIWarfare.BTPageClan_TCP
// 0x0004 (0x0030 - 0x002C)
class UBTPageClan_TCP : public UBTTcpLink_Channel
{
public:
	class UBTPageClan*                                 Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageClan_TCP");
		return ptr;
	}


	bool rfAckDBCharInfo(int Result, const string& ErrMsg, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckFriendPosition(int Result, const string& TargetCharName, byte ServerType, const string& fServername, const string& fServerShortName, const string& fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, const string& ChannelNickName, int GameRoomNum);
	bool rfAckNotifyUpdateCharInfo_LevelMark(const string& CharName, int LevelMarkID);
	bool rfAckClanMatchResultHistory(struct FBtrDouble[] MatchDate, byte[] IsWin, string[] EnemyClanname);
	bool rfAckChatWispher(int Result, const string& ErrMsg, const string& ToCharName);
	bool rfAckNotifyAdjustClanMemberGrade(const string& ClanName, const string& CharName, byte CharGrade);
	bool rfAckAdjustClanMemberGrade(int Result, const string& ErrMsg, const string& ClanName, const string& CharName, byte CharGrade);
	bool rfAckClanCharPersonelIntro(int Result, const string& ErrMsg, const string& PersonelIntro);
	bool rfAckSearchClan(int Result, const string& ErrMsg, int TotalPage, int[] ClanMarkPattern, int[] ClanMarkBG, byte[] ClanMarkBL, string[] ClanName, string[] ClanMaster, int[] ClanMember, int[] ClanMemberMax, int[] ClanCreateDate, int[] ClanWin, int[] ClanLose, int[] ClanDraw, int[] ClanRank, byte[] ClanRecruit, int[] ClanLevel);
	bool rfAckClanPersonelIntro(int Result, const string& ErrMsg);
	bool rfAckClanChangeInfo(int Result, const string& ErrMsg);
	bool rfAckClanSecession(int Result, const string& ErrMsg);
	bool rfAckClanClose(int Result, const string& ErrMsg, const string& ClanName);
	bool rfAckClanNews(string[] IssueDate, byte[] IssueType, string[] IssuedClanMember);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserList(int Result, const string& ErrMsg, int[] Level, string[] CharName, byte[] ClanGrade, int[] ClanWinCnt, int[] ClanLoseCnt, int[] LevelMarkID, int[] TitleMarkID, int[] DudeId);
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfReqRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& ClanName, const string& InviteMsg);
};


// Class GUIWarfare.BTPageLucky_TCP
// 0x0004 (0x0030 - 0x002C)
class UBTPageLucky_TCP : public UBTTcpLink_Channel
{
public:
	class UBTPageLucky*                                Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageLucky_TCP");
		return ptr;
	}


	bool rfAckLuckShop_RewardCoupon(int ErrorCode, int Coupon_ItemTypeID, const struct FBtrDouble& Coupon_ItemUniqueID, int Coupon_Count_AfterReduction);
	bool rfAckLuckShop_RewardBuyingCount(int ErrorCode, int FinalCapsuleRewardState);
	bool rfAckLuckShop_StorageInfo(int ErrorCode, int BuyingCapsuleCount, int CapsuleRewardState);
	bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, byte IsNotification, string[] NickName, struct FBtrDouble[] Time, int GetItemID);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(int[] ItemID);
	bool rfAckShopItemListStart(int Count);
};


// Class GUIWarfare.BTPageLogo_TcpLogin
// 0x0004 (0x0030 - 0x002C)
class UBTPageLogo_TcpLogin : public UBTTcpLink_Login
{
public:
	class UBTPageLogo*                                 Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageLogo_TcpLogin");
		return ptr;
	}


	bool rfAckLoginWithIndonesia(int Result);
	bool rfAckLoginWithGlobal(int Result);
	bool rfAckLoginWithThailand(int Result);
	bool rfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock);
	bool rfAckEventNotify(int Type);
	bool rfAckClientChecksum(int Result);
	bool rfAckClientChallenge(const string& Key1, const struct FBtrDouble& Key2);
	bool rfAckProcessPreLoginUser(int Result, const string& ErrMsg);
	bool rfAckLoginInHouseTest(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg, const string& BDay, byte Sex, const struct FBtrDouble& ServerTime);
	bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType);
};


// Class GUIWarfare.BTPageAuction_TCP
// 0x0004 (0x0030 - 0x002C)
class UBTPageAuction_TCP : public UBTTcpLink_Channel
{
public:
	class UBTPageAuction*                              Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageAuction_TCP");
		return ptr;
	}


	bool rfAckRepairItem(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int RepairCost, int[] DamageDegree);
	bool rfAckRepairCost(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int[] RepairCost);
	bool rfAckAuctionInstantlyBuying(int Result, const string& ErrMsg, int PointRemain);
	bool rfAckAuctionBidding(int Result, const string& ErrMsg, int PointRemain);
	bool rfAckAuctionTradeHistory(int Result, const string& ErrMsg, int ItemID, int PartID, string[] SellerCharNm, int[] DamageDegree, int[] Price);
	bool rfAckAuctionItemListEnd(byte Section);
	bool rfAckAuctionItemList(byte Section, int[] UniqueIDs, int[] ItemIDs, int[] AddPartsIDs, struct FBtrDouble[] UntilTimes, int[] BiddingPrices, int[] InstantlyByuingPrices, int[] ItemDamageds, string[] HighestBidderNames, string[] SellerNames, int[] ItemCount);
	bool rfAckAuctionItemListStart(int Result, const string& ErrMsg, byte Section, int PageNum, int Count);
	bool rfAckAuctionMyItemCancel(int Result, const string& ErrMsg);
	bool rfAckAuctionMyItemRegister(int Result, const string& ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain);
	bool rfAckAuctionItemListCount(int Result, const string& ErrMsg, byte Section, byte Classfy, int ItemType, int ItemGrade, int Count);
};


// Class GUIWarfare.BTPageStore_TCP
// 0x0004 (0x0030 - 0x002C)
class UBTPageStore_TCP : public UBTTcpLink_Channel
{
public:
	class UBTPageStore*                                Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageStore_TCP");
		return ptr;
	}


	bool rfAckGP20CashModifyWeapon(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point);
	bool rfAckModifyWeapon(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point, int Cash);
	bool rfAckCouponUse(int Result, const string& ErrMsg);
	bool rfAckGiftItemByWebzenCash(int Result, const string& ErrMsg, int LeftProductCount);
	bool rfAckBuyItemByWebzenCash(int Result, const string& ErrMsg);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(int[] ItemID);
	bool rfAckShopItemListStart(int Count);
};


// Class GUIWarfare.BTPageMail_TCP
// 0x0004 (0x0030 - 0x002C)
class UBTPageMail_TCP : public UBTTcpLink_Channel
{
public:
	class UBTPageMail*                                 Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageMail_TCP");
		return ptr;
	}


	bool rfAckDBCharInfo(int Result, const string& ErrMsg, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckGetAttachedItemFromMemo(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID);
	bool rfAckDeleteMailAll(int Result, byte MailType, int Count);
	bool rfAckDelMemo(int Result, const string& ErrMsg, int[] FailedMemoID);
	bool rfAckReadMemo(const string& cnameFrom, const string& Text, const string& dateRecv, const struct FBtrDouble& ItemUID);
	bool rfAckEndMemoList();
	bool rfAckMemoList(int[] MemoIdx, string[] cnameFrom, string[] dateRecv, string[] Text, byte[] Status, int[] UntilExpire, struct FBtrDouble[] ItemUID, int[] ItemID, byte[] MsgType, int[] ItemPartID);
	bool rfAckStartMemoList(int Result, const string& ErrMsg, byte Type, int TotalCount);
	bool rfReqRecvMemo(const string& cnameFrom, byte MemoType);
	bool rfAckSendMemo(string[] CnamesToFail, int[] ResultArray);
};


// Class GUIWarfare.BTPageLogin_TcpLogin
// 0x0004 (0x0030 - 0x002C)
class UBTPageLogin_TcpLogin : public UBTTcpLink_Login
{
public:
	class UBTPageLogin*                                Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageLogin_TcpLogin");
		return ptr;
	}


	bool rfAckLoginWithIndonesia(int Result);
	bool rfAckLoginWithGlobal(int Result);
	bool rfAckLoginWithThailand(int Result);
	bool rfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock);
	bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType);
	bool rfAckProcessPreLoginUser(int Result, const string& ErrMsg);
	bool rfAckLoginInHouseTest(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg, const string& BDay, byte Sex, const struct FBtrDouble& ServerTime);
	bool rfAckCreateChar(int Success, const string& ErrMsg);
	bool rfAckLogin(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg);
};


// Class GUIWarfare.BTPageMatchResult_TCP
// 0x0004 (0x0030 - 0x002C)
class UBTPageMatchResult_TCP : public UBTTcpLink_Channel
{
public:
	class UBTPageMatchResult*                          Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageMatchResult_TCP");
		return ptr;
	}

};


// Class GUIWarfare.BTPageMyInfo_TCP
// 0x0004 (0x0030 - 0x002C)
class UBTPageMyInfo_TCP : public UBTTcpLink_Channel
{
public:
	class UBTPageMyInfo*                               Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageMyInfo_TCP");
		return ptr;
	}


	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, string[] CharName, int[] CharLevel, string[] ClanName, int[] ClanMarkPattern, int[] ClanMarkBG, int[] ClanMarkBL, int[] Ranking_Accum, int[] Ranking_Accum_Prev, int[] Ranking_Accum_Exp, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfAckDBCharInfo(int Result, const string& ErrMsg, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
};


// Class GUIWarfare.BTPageCharacterCreation_TcpLogin
// 0x0004 (0x0030 - 0x002C)
class UBTPageCharacterCreation_TcpLogin : public UBTTcpLink_Login
{
public:
	class UBTPageCharacterCreation*                    Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageCharacterCreation_TcpLogin");
		return ptr;
	}


	bool rfAckLogOut(byte Result, byte Reason);
	bool rfAckProcessPreLoginUser(int Result, const string& ErrMsg);
	bool rfAckLoginInHouseTest(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg, const string& BDay, byte Sex, const struct FBtrDouble& ServerTime);
	bool rfAckCreateChar(int Success, const string& ErrMsg);
};


// Class GUIWarfare.BTPageHelp_TCP
// 0x0004 (0x0030 - 0x002C)
class UBTPageHelp_TCP : public UBTTcpLink_Channel
{
public:
	class UBTPageHelp*                                 Owner;                                                    // 0x002C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageHelp_TCP");
		return ptr;
	}

};


// Class GUIWarfare.wBtrInfoIni
// 0x00F8 (0x0130 - 0x0038)
class UwBtrInfoIni : public UwBtrIni
{
public:
	float                                              Udp_Default_ConnectionTimeOut;                            // 0x0038(0x0004)
	float                                              Udp_Default_InitialConnectionTimeOut;                     // 0x003C(0x0004)
	float                                              Udp_Loading_ConnectionTimeOut;                            // 0x0040(0x0004)
	float                                              Udp_Loading_InitialConnectionTimeOut;                     // 0x0044(0x0004)
	int                                                Tcp_TickCheck_Default_Host;                               // 0x0048(0x0004)
	int                                                Tcp_TickCheck_Default_Client;                             // 0x004C(0x0004)
	int                                                Tcp_TickCheck_Loading;                                    // 0x0050(0x0004)
	int                                                Tcp_TickCheck_UI;                                         // 0x0054(0x0004)
	int                                                Tcp_TickCheck_Reset;                                      // 0x0058(0x0004)
	int                                                LoadingTimeLimit_NATDiagTimeLimit;                        // 0x005C(0x0004)
	int                                                LoadingTimeLimit_RegisterUDPAddrLimit;                    // 0x0060(0x0004)
	int                                                LoadingTimeLimit_CheckDummyPacketLimit;                   // 0x0064(0x0004)
	int                                                LoadingTimeLimit_LevelNegotiationLimit;                   // 0x0068(0x0004)
	int                                                LoadingTimeLimit_PreCachingLimit;                         // 0x006C(0x0004)
	int                                                LoadingTimeLimit_WaitingForSuccessStartGameLimit;         // 0x0070(0x0004)
	int                                                LoadingTimeLimit_WhenHostBlocking;                        // 0x0074(0x0004)
	int                                                LoadingTimeLimit_WaitDummyPacketPhraseLimit;              // 0x0078(0x0004)
	int                                                LoadingTimeLimit_WaitClientOutSideAddrInHost;             // 0x007C(0x0004)
	int                                                LoadingTimeLimit_WaitAckStartHolePunching;                // 0x0080(0x0004)
	int                                                LoadingTimeLimit_WaitAckStartHolePunchingInClient;        // 0x0084(0x0004)
	string                                             LoadingStateMessage[0x7];                                 // 0x0088(0x000C) (Localized, NeedCtorLink)
	string                                             OtherLoadingStateMessage[0x7];                            // 0x00DC(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.wBtrInfoIni");
		return ptr;
	}


	void RegistMap();
};


// Class GUIWarfare.wBtrErrIni
// 0x0534 (0x056C - 0x0038)
class UwBtrErrIni : public UwBtrIni
{
public:
	string                                             C_ERR_LOADING_FAILED_MyNetworkChecking_0_5000;            // 0x0038(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_MyNetworkChecking_1_5001;            // 0x0044(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_MyNetworkChecking_2_5002;            // 0x0050(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_MyNetworkChecking_3_5003;            // 0x005C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_MyNetworkChecking_4_5004;            // 0x0068(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_MyNetworkChecking_5_5005;            // 0x0074(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_MyNetworkChecking_6_5006;            // 0x0080(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_HostNetworkChecking_0_5007;          // 0x008C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_HostNetworkChecking_1_5008;          // 0x0098(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_HostNetworkChecking_2_5009;          // 0x00A4(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_HostNetworkChecking_3_5010;          // 0x00B0(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_HostNetworkChecking_4_5011;          // 0x00BC(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_HostNetworkChecking_5_5012;          // 0x00C8(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_HostNetworkChecking_6_5013;          // 0x00D4(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_WrongStep_0_5014;                    // 0x00E0(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_WrongStep_1_5015;                    // 0x00EC(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_WrongStep_2_5016;                    // 0x00F8(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_WrongStep_3_5017;                    // 0x0104(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_WrongStep_4_5018;                    // 0x0110(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_WrongStep_5_5019;                    // 0x011C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_WrongStep_6_5020;                    // 0x0128(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_HostPreCachingFailed_5021;           // 0x0134(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_ClientLvNegoFailed_5022;             // 0x0140(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_ClientPreCachingFailed_5023;         // 0x014C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_HostRequestTimeIsZero_5024;          // 0x0158(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_ClientRequestTimeIsZero_5025;        // 0x0164(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_GBtrConfig_is_NULL_5026;                            // 0x0170(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_GameEngine_is_NULL_5027;                            // 0x017C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_NetDriver_is_NULL_5028;                             // 0x0188(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LoadingAdvancer_is_NULL_5029;                       // 0x0194(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LoadingStater_is_NULL_5030;                         // 0x01A0(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_StartHostLoading_Failed_5031;        // 0x01AC(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_StartClientLoading_Failed_5032;      // 0x01B8(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_StartChangeHost_Failed_5033;         // 0x01C4(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_StartChangeClient_Failed_5034;       // 0x01D0(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_CreateNetDriver_Failed_5035;         // 0x01DC(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_InitHostNatChecker_Failed_5036;      // 0x01E8(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_InitClientNatChecker_Failed_5037;    // 0x01F4(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_GMapLoader_is_NULL_5038;                            // 0x0200(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_GBtrConfig_cant_find_errMsg_5039;                   // 0x020C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_HostSendTimeIsZero_5040;             // 0x0218(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_ClientSendTimeIsZero_5041;           // 0x0224(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_MatchMaker_is_NULL_5042;                            // 0x0230(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_NetDrvier_is_already_exist_5043;                    // 0x023C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_NetDrvier_InitListen_Failed_5044;                   // 0x0248(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_Engine_Client_is_NULL_5045;                         // 0x0254(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_Viewport_is_NULL_5046;                              // 0x0260(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_PlayerController_is_NULL_5047;                      // 0x026C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_NetDriver_InitConnect_Failed_5048;                  // 0x0278(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_GLevel_is_NULL_5049;                                // 0x0284(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_CHANGE_HOST_FAILED_Step_0_5050;                     // 0x0290(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_CHANGE_HOST_FAILED_Step_1_5051;                     // 0x029C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_CHANGE_HOST_FAILED_Step_2_5052;                     // 0x02A8(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_CHANGE_HOST_FAILED_Step_3_5053;                     // 0x02B4(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_CHANGE_HOST_FAILED_Step_4_5054;                     // 0x02C0(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_ServerConnection_is_NULL_5055;                      // 0x02CC(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Different_Package_5056;              // 0x02D8(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Different_Package_Number_5057;       // 0x02E4(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_StartMatch_Failed_5058;              // 0x02F0(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_LoadMap_Failed_5059;                 // 0x02FC(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_Host_UDP_time_out_5060;                             // 0x0308(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_Client_UDP_time_out_5061;                           // 0x0314(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Changed_Host_5062;                   // 0x0320(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Start_Dummy_Time_Is_Zero_5063;       // 0x032C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Dummy_Check_Failed_5064;             // 0x0338(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_WrongStep_7_5065;                    // 0x0344(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Dummy_Phrase_Invalid_5066;           // 0x0350(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Dummy_Check_From_Server_5067;        // 0x035C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Dummy_Check_Exception_5068;          // 0x0368(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Dummy_Check_Failed_User_List_Emtpy_5069;// 0x0374(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Host_Blocking_Time_Out_5070;         // 0x0380(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_GameOver_While_HolePunching_5071;    // 0x038C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_May_Be_Host_Crash_In_Loading_5072;   // 0x0398(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_OnClose_From_Server_5073;            // 0x03A4(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_CHANGE_HOST_FAILED_New_Host_Step_0_5074;            // 0x03B0(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_CHANGE_HOST_FAILED_New_Host_Step_1_5075;            // 0x03BC(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_CHANGE_HOST_FAILED_New_Host_Step_2_5076;            // 0x03C8(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_CHANGE_HOST_FAILED_New_Host_Step_3_5077;            // 0x03D4(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_CHANGE_HOST_FAILED_New_Host_Step_4_5078;            // 0x03E0(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Dummy_Check_From_Server_5079;        // 0x03EC(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_May_Be_Host_Crash_In_Loading_5080;   // 0x03F8(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Inervention_Failed_By_ChangeRoomOwner_5081;// 0x0404(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Inervention_MapLoading_Failed_5082;  // 0x0410(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Already_Started_HolePunching_5083;   // 0x041C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Failed_Register_OutSide_Addr_5084;   // 0x0428(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_More_Received_OutSide_Addr_5085;     // 0x0434(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Set_Allow_Start_HolePunching_Failed_5086;// 0x0440(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Recv_Client_OSA_In_Wrong_Step_5087;  // 0x044C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Wait_AckStartHolePunching_Failed_C_5088;// 0x0458(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_WrongStep_8_5089;                    // 0x0464(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_IntUser_Allow_HolePunching_Failed_5090;// 0x0470(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_IntUser_Allow_HolePunching_Failed_5091;// 0x047C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Allow_HolePunching_Failed_5092;      // 0x0488(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_More_Received_OutSide_Addr_CH_5093;  // 0x0494(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Wrong_GameType_CH_5094;              // 0x04A0(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Dummy_Packet_Time_Out_CH_5095;       // 0x04AC(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_ClientRequestTimeIsZero_CC_5096;     // 0x04B8(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Wait_AckStartHolePunching_Failed_CC_5097;// 0x04C4(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Allow_Start_HolePunching_Failed_CH_5098;// 0x04D0(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Allow_Start_HolePunching_Failed_CC_5099;// 0x04DC(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Wrong_Game_Type_CC_5100;             // 0x04E8(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Hole_Punching_Failed_CC_5101;        // 0x04F4(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Hole_Punching_Failed_CH_5102;        // 0x0500(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Hole_Punching_Failed_H_5103;         // 0x050C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Hole_Punching_Failed_All_5104;       // 0x0518(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_H_5105; // 0x0524(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_CH_5106;// 0x0530(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_C_5107; // 0x053C(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_CC_5108;// 0x0548(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_IC_5109;// 0x0554(0x000C) (Localized, NeedCtorLink)
	string                                             C_ERR_LOADING_FAILED_Found_Overlap_User_Name_5110;        // 0x0560(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.wBtrErrIni");
		return ptr;
	}


	void RegistMap();
};


// Class GUIWarfare.BTPageServerSelectionCN
// 0x00E4 (0x0894 - 0x07B0)
class UBTPageServerSelectionCN : public UBTPageServerSelection
{
public:
	struct FFloatBox                                   fbLabelBackgrounddeco;                                    // 0x07B0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelBackgrounddeco;                                      // 0x07C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         BGImageTotalServer;                                       // 0x07C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         CategorySvrChr[0x6];                                      // 0x07C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	string                                             strCategory[0x6];                                         // 0x07E0(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbCategoryPos[0x6];                                       // 0x0828(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	string                                             strEnterCh;                                               // 0x0888(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageServerSelectionCN");
		return ptr;
	}


	bool AD_Large_OnClick(class UGUIComponent* Sender);
	bool AD_Small_OnClick(class UGUIComponent* Sender);
	bool rfAckTencent_StartTenProtect(int CharDBID);
	bool rfAckMoveToLobby(byte MessageType);
	bool rfAckQSlotList(int Result, const string& ErrMsg, int[] QSlotID, string[] QSlotName, byte[] QSlotDispOrder, struct FBtrDouble[] MWItemID, struct FBtrDouble[] PistolItemID, struct FBtrDouble[] TWItemID1, struct FBtrDouble[] TWItemID2, int[] Skill1, int[] Skill2, int[] Skill3, int[] Skill4, struct FBtrDouble[] KnifeItemID);
	bool rfAckServerType(byte Type);
	void Receive_EventGift(int Index);
	bool rfAckRecvSystemMsg(byte CommunityType, const struct FSystemMsgParam& MsgInfo);
	bool rfAckPaidItem_RelayBroadcast(const string& CharName, const string& Msg);
	bool rfAckChatClan(const string& CharName, const string& Message, int Result);
	bool rfReqRecvChatWispher(const string& CharnameFrom, const string& Message);
	bool rfAckChatNormal(int id, const string& Sender, const string& Message, int Result);
	bool rfAckSetLookForClan(int Result, const string& ErrMsg, byte IsLookingFor);
	bool rfAckGetMyMailBoxState(int Result, byte IsFull, int NewMailCount);
	bool BTWindowDefineARHK_40_41_OnOK(class UGUIComponent* Sender);
	bool rfAckClientChecksum(int Result);
	bool rfAckClientChallenge(const string& Key1, const struct FBtrDouble& Key2);
	void ChatBlockEndTime_OnEventTimer(int Index);
	void ChatBlockStartTime_OnEventTimer(int Index);
	bool rfAckCharBlockInfo(int Result, const struct FBtrDouble& ChatBlockStartTime, const struct FBtrDouble& ChatBlockEndTime, struct FBtrDouble[] BlockedItemIdx);
	bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID);
	bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID);
	bool rfAckForceDisconnectUser_GM(int Result, const string& ErrMsg, const string& CharName);
	bool rfAckNotice_GM(int Result, const string& ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const string& Msg);
	bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, const string& NewRoomTitle);
	bool rfAckPaidItem_ChangeClanMark(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_ClanMarkDupCheck(int Result, const string& ErrMsg);
	bool rfAckPaidItem_NotifyChangeClanname(const string& NewClanname);
	bool rfAckPaidItem_BroadCast(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_EraseRecord(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int Command, int RemainCount);
	bool rfAckWebzenBillingUseStorageItem(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID, const struct FBtrDouble& ItemExtra);
	bool rfAckWebzenBillingStorageListEnd();
	bool rfAckWebzenBillingStorageList(int[] Seq, int[] ItemSeq, int[] GroupCode, int[] ShareFlag, int[] ProductSeq, string[] CashName, struct FBtrDouble[] CashPoint, string[] SendAccountID, string[] SendMessage, byte[] ItemType, byte[] RelationType, int[] ProductType, int[] PriceSeq);
	bool rfAckWebzenBillingStorageListStart(int Result, const string& ErrMsg, int TotalCount, int TotalPage, int CurPage);
	bool rfAckRemoveBlockUserList(int Result, const string& ErrMsg);
	bool rfAckAddBlockUserList(int Result, const string& ErrMsg);
	bool rfAckBlockUserList(string[] CharName);
	bool rfAckPCBangUserListEnd();
	bool rfAckPCBangUserList(string[] FriendName, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] Level, int[] ClanGrade, int[] ClanWin, int[] ClanLose, byte[] IsLookForClan, byte[] IsCombat, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckPCBangUserListStart(int Result, int TotalCount);
	bool rfAckFriendList(string[] FriendName, byte[] IsLogOn, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] LevelMarkID, int[] ClanLevel, int[] Level, byte[] IsLookForClan);
	bool rfAckFriendListStart(int Result, int TotalCount);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserList(int Result, const string& ErrMsg, int[] Level, string[] CharName, byte[] ClanGrade, int[] ClanWinCnt, int[] ClanLoseCnt, int[] LevelMarkID, int[] TitleMarkID, int[] DudeId);
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfAckRegisterMainPCBang(int Result, const string& ErrMsg);
	bool rfAckClanInfo(const struct FClanInfo& stClanInfo);
	bool rfAckCharInfo(int Result, const string& ErrMsg, int UserID, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FCharInfo& stCharInfo, byte InClanRank, int ClanLevel);
	bool rfAckRegisteredPCBangInfo(int Result, const string& ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, const string& PCBangName);
	bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckMyMoney(int Result, const string& ErrMsg, int Point, int Cash);
	bool rfReqDailyQuestNewAvailable(int[] ExpiredQuestID, int[] NewQuestID);
	bool rfReqQuestNewAvailable(int[] AchivedQuestID, int[] NewQuestID, byte[] IsDailyQuest, int[] ExpiredQuest);
	bool rfAckQuestUpdate(int Result, const string& ErrMsg);
	bool rfAckQuestListEnd();
	bool rfAckQuestList(int[] QuestID, int[] CountPrograss, byte[] IsDailyQuest, byte[] IsComplete);
	bool rfAckQuestListStart(int Result, const string& ErrMsg);
	bool rfAckLimitedListInChannel(int Result, int[] LimitedMapID, int[] LimitedModeID);
	bool rfReqClanMatch_InviteCrewResult(const string& Invitee, int Result);
	bool BTWindowInviteClanWarGameHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowInviteClanWarGameHK_OnOK(class UGUIComponent* Sender);
	bool rfReqClanMatch_RecvInviteCrew(const string& Inviter, const string& ServerIP, int Port, int WaittingID, const string& Msg, int MapNum, int InviteUserChannelNum, const string& LeaderName, const string& RoomName);
	bool rfAckClanMatch_InviteCrew(int Result, const string& ErrMsg);
	bool rfReqAnswerInviteGameRoom(byte Answer, const string& GuestCharName);
	bool rfAckRecvInviteGameRoomResult(int Result);
	bool rfReqRecvInviteGameRoom(const string& InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, const string& RoomUniqueID, int RoomNumber, const string& RoomName, byte RoomState, const string& MapName, const string& OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, const string& Password, const string& InviteCharName);
	bool rfAckGetServerTime(const struct FBtrDouble& ServerTime, const string& ClientIP);
	bool rfAckTencent_AASInfo(int UserID, byte IsAdult, byte IsQQAuth, int AccumTimeSec);
	void TcpLogin_OnConnect(int ErrCode);
	void MoveToChannel(class UBTACLServerSelectionHK* serverACL);
	void NewMoveToChannelByClick(class UBTACLServerSelectionHK* serverACL);
	void NewMoveToChannel(class UBTACLServerSelectionHK* serverACL);
	bool NoClanEnter_OnOK(class UGUIComponent* Sender);
	void AutoMoveTochannel(int ServerID, int ChannelID);
	void OnCompleteOpened();
	bool ButtonEnterCh_OnClick(class UGUIComponent* Sender);
	bool BTWIndowTodayResultHK_OnOK(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool HeaderButton_OnClick(class UGUIComponent* Sender);
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
