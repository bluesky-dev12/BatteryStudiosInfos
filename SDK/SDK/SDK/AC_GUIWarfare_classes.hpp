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

// Class GUIWarfare.BTNetGUIPage
// 0x00E4 (0x0448 - 0x0364)
class UBTNetGUIPage : public UGUIPage
{
public:
	class UBTNetMainMenu*                              page_Main;                                                // 0x0364(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x0368(0x0004)
	class UBTTcpLink_Login*                            TcpLogin;                                                 // 0x036C(0x0004)
	TArray<struct FString>                             BGMList;                                                  // 0x0370(0x000C) (NeedCtorLink)
	class UBTNetGameData*                              NetGameData;                                              // 0x037C(0x0004)
	class UBTDataTransferClientLink*                   DataTransferLink;                                         // 0x0380(0x0004)
	struct FString                                     strSystem;                                                // 0x0384(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strClanGrade[0x5];                                        // 0x0390(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strSlashW;                                                // 0x03CC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strSlashN;                                                // 0x03D8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strSlashC;                                                // 0x03E4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strSlashT;                                                // 0x03F0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strTo;                                                    // 0x03FC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strFrom;                                                  // 0x0408(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strLink;                                                  // 0x0414(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strExit;                                                  // 0x0420(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbAdvertise;                                              // 0x042C(0x0010)
	struct FString                                     AdvertiseURL;                                             // 0x043C(0x000C) (NeedCtorLink)

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
	struct FChatInfo TextToChatInfo(const struct FString& Text);
	void RefreshPage();
};


// Class GUIWarfare.BTConsole
// 0x022C (0x0BC0 - 0x0994)
class UBTConsole : public UExtendedConsole
{
public:
	struct FString                                     strRecordRetCode[0x4];                                    // 0x0994(0x000C) (Localized, NeedCtorLink)
	struct FString                                     lsNotEnableRecordOption;                                  // 0x09C4(0x000C) (Localized, NeedCtorLink)
	unsigned long                                      bStopOutofSeat : 1;                                       // 0x09D0(0x0004)
	int                                                OutofSeatTime;                                            // 0x09D4(0x0004)
	int                                                OwnerOutofSeatTime;                                       // 0x09D8(0x0004)
	int                                                UserReadyTime;                                            // 0x09DC(0x0004)
	int                                                UserReadyTimeCount;                                       // 0x09E0(0x0004)
	int                                                preLevelTime;                                             // 0x09E4(0x0004)
	int                                                LevelTime;                                                // 0x09E8(0x0004)
	float                                              LastKeySleepTime;                                         // 0x09EC(0x0004)
	unsigned long                                      bReqFontReset : 1;                                        // 0x09F0(0x0004)
	struct FString                                     strChangeQS;                                              // 0x09F4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strCloseQSWindow;                                         // 0x0A00(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strChatMode[0x7];                                         // 0x0A0C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strChattingHelpGFS;                                       // 0x0A60(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strChattingHelp;                                          // 0x0A6C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strRegulateShot;                                          // 0x0A78(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strSaveShot;                                              // 0x0A84(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbChatHistory[0x2];                                       // 0x0A90(0x0010)
	struct FFloatBox                                   fbButtonChatMode;                                         // 0x0AB0(0x0010)
	struct FFloatBox                                   fbChatEditBox;                                            // 0x0AC0(0x0010)
	struct FFloatBox                                   fbLabelEditBox;                                           // 0x0AD0(0x0010)
	struct FString                                     strGhostChatModeTeam;                                     // 0x0AE0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strGhostChatModeAll;                                      // 0x0AEC(0x000C) (Localized, NeedCtorLink)
	TArray<struct FString>                             MessageType_PostString;                                   // 0x0AF8(0x000C) (NeedCtorLink)
	TArray<struct FColor>                              MessageType_Color;                                        // 0x0B04(0x000C) (NeedCtorLink)
	unsigned long                                      bChatEnabled : 1;                                         // 0x0B10(0x0004)
	class UBTChatEditBoxHK*                            ChatEditBox;                                              // 0x0B14(0x0004) (ExportObject, NeedCtorLink, EditInline)
	float                                              CharEditBoxCursorHeightRatio;                             // 0x0B18(0x0004)
	TEnumAsByte<EMessageType>                          ChatMessageType;                                          // 0x0B1C(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0B1D(0x0003) MISSED OFFSET
	unsigned long                                      bChatInGhostMode : 1;                                     // 0x0B20(0x0004)
	class UMaterial*                                   ChatSelectImg;                                            // 0x0B24(0x0004)
	TArray<struct FMessageItem>                        MessageItems;                                             // 0x0B28(0x000C) (NeedCtorLink)
	float                                              MessageItemsX;                                            // 0x0B34(0x0004)
	float                                              MessageItemsYFromBottom;                                  // 0x0B38(0x0004)
	float                                              MessageItemsLineSpacing;                                  // 0x0B3C(0x0004)
	int                                                MaxMessageItems;                                          // 0x0B40(0x0004)
	unsigned char                                      byPressed_Shift;                                          // 0x0B44(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x0B45(0x0003) MISSED OFFSET
	unsigned long                                      ToggleIme : 1;                                            // 0x0B48(0x0004)
	unsigned long                                      ImeNative : 1;                                            // 0x0B48(0x0004)
	class UBTTcpLink_Channel*                          TcpHandler;                                               // 0x0B4C(0x0004)
	float                                              AccumDelta;                                               // 0x0B50(0x0004)
	float                                              EventTimerDelta;                                          // 0x0B54(0x0004)
	float                                              EventTimerNextStep;                                       // 0x0B58(0x0004)
	class UBTNetMainMenu*                              MainMenu;                                                 // 0x0B5C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FColor                                      ShadowColor;                                              // 0x0B60(0x0004)
	int                                                ResetImeCount;                                            // 0x0B64(0x0004)
	unsigned long                                      bAltPressed : 1;                                          // 0x0B68(0x0004)
	int                                                currentBGM;                                               // 0x0B6C(0x0004)
	int                                                CurrentBGMHandle;                                         // 0x0B70(0x0004)
	unsigned long                                      HasBGMDuration : 1;                                       // 0x0B74(0x0004)
	int                                                BGMStartTime;                                             // 0x0B78(0x0004)
	int                                                BGMDuration;                                              // 0x0B7C(0x0004)
	float                                              BGMFadeInTime;                                            // 0x0B80(0x0004)
	float                                              BGMFadeOutTime;                                           // 0x0B84(0x0004)
	int                                                BGMTermBetween;                                           // 0x0B88(0x0004)
	int                                                Term;                                                     // 0x0B8C(0x0004)
	TArray<struct FString>                             BGMs;                                                     // 0x0B90(0x000C) (NeedCtorLink)
	TArray<int>                                        BGMDurations;                                             // 0x0B9C(0x000C) (NeedCtorLink)
	TArray<struct FIntArray>                           BGMPartialPlayInitialSeeks;                               // 0x0BA8(0x000C) (NeedCtorLink)
	unsigned long                                      BGMPartialPlay : 1;                                       // 0x0BB4(0x0004)
	int                                                BGMPartialPlayDuration;                                   // 0x0BB8(0x0004)
	unsigned long                                      bGmPause : 1;                                             // 0x0BBC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTConsole");
		return ptr;
	}


	void ConsoleCMD(const struct FString& Line);
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
	void SetBGMAdvanced(TArray<struct FString> List, bool partialPlay, int partialDuration, TArray<struct FIntArray> initialSeeks);
	void SetBGM(TArray<struct FString> List);
	void SetOneBGM(const struct FString& List);
	struct FString GetCurrentBGM();
	void SwitchChatMessageType(TEnumAsByte<EInputKey> key);
	void CallChatWhisper();
	void CallChatClan();
	void CallChatTeam();
	void CallChatAll();
	void CallChatMode();
	void SetChatHelpString();
	bool OnIME_Notify(int Type, int LangID, const struct FString& strText, int StartPos, int Size);
	bool NeedToOffIME();
	void DownloadWebzenShop();
	void CompletedQuest();
	void SendMessage(const struct FMessageItem& msgItem);
	void ClearMessageItems();
	void AddMessageItem(const struct FMessageItem& Item);
	struct FMessageItem ConstructMessageItem(const struct FString& Text, TEnumAsByte<EMessageType> MessageType);
	void ProhibitAltTab();
	void AddSystemMessageSaveShot(const struct FString& Text);
	void AddSystemMessageRegulateShot();
	void DrawMessageItems(class UCanvas* C);
	void DrawTextChattingHelp(class UCanvas* C);
	void DrawChatEditBox(class UCanvas* C);
	void PostRender(class UCanvas* C);
	void PreRender(class UCanvas* Canvas);
	void FontReset();
	bool CallSelectAlienType(TEnumAsByte<EInputKey> key);
	void CallBattleHelp();
	void CallSelectItemBuy(int iIndex);
	void CallSelectRadioMessage(int iIndex);
	void CallSelectQuickSlot(int iIndex);
	void CallToggleQuickSlot();
	void SetLoadingTime(int L, int P);
	void CMDHK(int Index, const struct FString& Param1, const struct FString& Param2, const struct FString& param3);
	void StopQuestLog();
	void CloseWindow(int Count);
	void RecordOn_Exception(int retCode);
	void RecordOn_FnRun(int Index);
	bool RecordOn_OnOK(class UGUIComponent* Sender);
	void RecordOn();
	void ShowWindow(const struct FString& windowclassname);
	void StartAutoMove(int Server, int Channel, int gameroom);
	void endTutorial();
	void tutorial(const struct FString& Map);
	void stopoos();
	bool BlockChangeWeapon(int nIndex);
	bool IsHaveMainWeapon(int nIndex);
	bool KeyEvent(TEnumAsByte<EInputKey> key, TEnumAsByte<EInputAction> Action, float Delta);
	bool KeyType(TEnumAsByte<EInputKey> key, const struct FString& Unicode);
	bool GetChatEnabled();
	void SetChatEnabled(bool Value);
	void ChatEditBox_OnInputSpace(class UGUIComponent* Sender, const struct FString& Text);
	void ChatEditBox_OnInputTab(class UGUIComponent* Sender, const struct FString& Text);
};


// Class GUIWarfare.BTNetMainMenu
// 0x086C (0x0CB4 - 0x0448)
class UBTNetMainMenu : public UBTNetGUIPage
{
public:
	class UBTTPChatHK*                                 TPChat;                                                   // 0x0448(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                CheckOneHour;                                             // 0x044C(0x0004)
	TEnumAsByte<EPage>                                 eCurrPage;                                                // 0x0450(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0451(0x0003) MISSED OFFSET
	unsigned long                                      kClanWarUserCountIgnore : 1;                              // 0x0454(0x0004)
	class UPageOnWindowManager*                        pwm;                                                      // 0x0458(0x0004)
	class UwMatchMaker*                                rMM;                                                      // 0x045C(0x0004) (Transient)
	class UwMyPlayerStatus*                            rMyStatus;                                                // 0x0460(0x0004) (Transient)
	class UwGameManager*                               rGameMgr;                                                 // 0x0464(0x0004) (Transient)
	struct FClanInfo                                   MyClanInfo;                                               // 0x0468(0x00A8) (NeedCtorLink)
	struct FClanInfo                                   kRecvClanInfo;                                            // 0x0510(0x00A8) (NeedCtorLink)
	struct FCharInfo                                   MyCharInfo;                                               // 0x05B8(0x00C0)
	struct FString                                     MyClanName;                                               // 0x0678(0x000C) (NeedCtorLink)
	struct FString                                     SaveClanName;                                             // 0x0684(0x000C) (NeedCtorLink)
	unsigned long                                      InTutorial : 1;                                           // 0x0690(0x0004)
	unsigned long                                      EnterBotMode : 1;                                         // 0x0690(0x0004)
	unsigned long                                      CreateBotMode : 1;                                        // 0x0690(0x0004)
	unsigned long                                      bRequestItemList : 1;                                     // 0x0690(0x0004)
	struct FWZInvenListProcess                         WZILP;                                                    // 0x0694(0x001C) (NeedCtorLink)
	int                                                CommandType;                                              // 0x06B0(0x0004)
	int                                                CommandParameter_int;                                     // 0x06B4(0x0004)
	struct FString                                     CommandParameter_string;                                  // 0x06B8(0x000C) (NeedCtorLink)
	unsigned long                                      bIsInPCBang : 1;                                          // 0x06C4(0x0004)
	unsigned long                                      bFirstLogin : 1;                                          // 0x06C4(0x0004)
	unsigned long                                      bAutoMove : 1;                                            // 0x06C4(0x0004)
	unsigned char                                      AutoMoveState;                                            // 0x06C8(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x06C9(0x0003) MISSED OFFSET
	unsigned long                                      AutoMoveDirectionOut : 1;                                 // 0x06CC(0x0004)
	int                                                AutoMoveClanWar;                                          // 0x06D0(0x0004)
	int                                                AutoMoveServerID;                                         // 0x06D4(0x0004)
	int                                                AutoMoveChannelID;                                        // 0x06D8(0x0004)
	int                                                AutoMoveGameRoomNum;                                      // 0x06DC(0x0004)
	struct FString                                     AutoMoveGameRoomPassword;                                 // 0x06E0(0x000C) (NeedCtorLink)
	unsigned long                                      bPostBoxFull : 1;                                         // 0x06EC(0x0004)
	unsigned long                                      bNewMailArrived : 1;                                      // 0x06EC(0x0004)
	int                                                NewMailCount;                                             // 0x06F0(0x0004)
	TArray<struct FServerConnectionInfo>               SCIList;                                                  // 0x06F4(0x000C) (NeedCtorLink)
	TArray<int>                                        NoviceChannelIndex;                                       // 0x0700(0x000C) (NeedCtorLink)
	TArray<struct FMapNameInfo>                        MapNameList;                                              // 0x070C(0x000C) (NeedCtorLink)
	struct FString                                     AuthLogin_ClientIP;                                       // 0x0718(0x000C) (NeedCtorLink)
	unsigned char                                      AuthLogin_ChannelType;                                    // 0x0724(0x0001)
	unsigned char                                      AuthLogin_ConnectAlpha;                                   // 0x0725(0x0001)
	unsigned char                                      AuthLogin_AccountType;                                    // 0x0726(0x0001)
	unsigned char                                      UnknownData02[0x1];                                       // 0x0727(0x0001) MISSED OFFSET
	struct FString                                     AuthLogin_GUID;                                           // 0x0728(0x000C) (NeedCtorLink)
	struct FString                                     AuthLogin_AccountID;                                      // 0x0734(0x000C) (NeedCtorLink)
	int                                                AuthLogin_ChannelingType;                                 // 0x0740(0x0004)
	struct FString                                     AuthLogin_AuthKey;                                        // 0x0744(0x000C) (NeedCtorLink)
	struct FString                                     AuthLogin_RegionKey;                                      // 0x0750(0x000C) (NeedCtorLink)
	struct FString                                     BirthDay;                                                 // 0x075C(0x000C) (NeedCtorLink)
	unsigned char                                      Sex;                                                      // 0x0768(0x0001)
	unsigned char                                      UnknownData03[0x3];                                       // 0x0769(0x0003) MISSED OFFSET
	struct FString                                     szLoginPassword;                                          // 0x076C(0x000C) (NeedCtorLink)
	int                                                LoginTimeStamp;                                           // 0x0778(0x0004)
	int                                                LoginHash1;                                               // 0x077C(0x0004)
	int                                                LoginHash2;                                               // 0x0780(0x0004)
	int                                                LoginHash3;                                               // 0x0784(0x0004)
	int                                                LoginHash4;                                               // 0x0788(0x0004)
	int                                                LoginHash5;                                               // 0x078C(0x0004)
	unsigned long                                      bWarningDurabilityAndExpired : 1;                         // 0x0790(0x0004)
	struct FString                                     strGMList;                                                // 0x0794(0x000C) (Localized, NeedCtorLink)
	unsigned long                                      bChatBan : 1;                                             // 0x07A0(0x0004)
	unsigned long                                      bSystemChatBlock : 1;                                     // 0x07A0(0x0004)
	float                                              ChatAccumTime[0x4];                                       // 0x07A4(0x0004)
	int                                                ChatLogTop;                                               // 0x07B4(0x0004)
	TArray<struct FChatHistory>                        ChatLog;                                                  // 0x07B8(0x000C) (NeedCtorLink)
	struct FString                                     LastRecvWhispherName;                                     // 0x07C4(0x000C) (NeedCtorLink)
	struct FChatInfo                                   PrevChatMode;                                             // 0x07D0(0x001C) (NeedCtorLink)
	struct FString                                     strNotice_All;                                            // 0x07EC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strNotice_Server;                                         // 0x07F8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strNotice_Channel;                                        // 0x0804(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strNotice_Room;                                           // 0x0810(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strKick;                                                  // 0x081C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strChangeRoomTitle;                                       // 0x0828(0x000C) (Localized, NeedCtorLink)
	float                                              NoticeUITimeSeconds;                                      // 0x0834(0x0004)
	float                                              NoticeUIPos;                                              // 0x0838(0x0004)
	int                                                NoticeIndex;                                              // 0x083C(0x0004)
	TArray<struct FString>                             BatteryNotice;                                            // 0x0840(0x000C) (NeedCtorLink)
	float                                              AASUITimeSeconds;                                         // 0x084C(0x0004)
	float                                              AASUIPos;                                                 // 0x0850(0x0004)
	TArray<struct FAAS_Struct>                         BatteryAAS;                                               // 0x0854(0x000C) (NeedCtorLink)
	struct FAAS_Struct                                 AASTemp[0x2];                                             // 0x0860(0x0024) (NeedCtorLink)
	struct FString                                     strAASMessage[0x6];                                       // 0x08A8(0x000C) (Localized, NeedCtorLink)
	unsigned long                                      bNewAvailableQuest : 1;                                   // 0x08F0(0x0004)
	unsigned long                                      bNewAvailableEventQuest : 1;                              // 0x08F0(0x0004)
	struct FLevelUpInfoStruct                          LevelUpInfo;                                              // 0x08F4(0x0024) (NeedCtorLink)
	struct FExpiredItemsStruct                         ExpiredItems;                                             // 0x0918(0x0010) (NeedCtorLink)
	struct FDurabilityWarningItemsStruct               DurWarningItems;                                          // 0x0928(0x0010) (NeedCtorLink)
	TArray<struct FString>                             DestroyedDurabilityXItems;                                // 0x0938(0x000C) (NeedCtorLink)
	TArray<int>                                        iSendUpdateQuickSlotList;                                 // 0x0944(0x000C) (NeedCtorLink)
	class UBTPageLogo*                                 page_Logo;                                                // 0x0950(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     pagename_Logo;                                            // 0x0954(0x000C) (NeedCtorLink)
	class UBTPageLogin*                                page_Login;                                               // 0x0960(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     pagename_Login;                                           // 0x0964(0x000C) (NeedCtorLink)
	class UBTPageLobby*                                page_Lobby2;                                              // 0x0970(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     pagename_Lobby2;                                          // 0x0974(0x000C) (NeedCtorLink)
	class UBTPageCharacterCreation*                    page_CharacterCreation;                                   // 0x0980(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     pagename_CharacterCreation;                               // 0x0984(0x000C) (NeedCtorLink)
	class UBTPageServerSelection*                      page_ServerSelection;                                     // 0x0990(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     pagename_ServerSelection;                                 // 0x0994(0x000C) (NeedCtorLink)
	class UBTPageRoomLobby*                            page_RoomLobby;                                           // 0x09A0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTPageRoomLobby*                            RoomLobby;                                                // 0x09A4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTPageRoomLobby*                            RoomLobbyDefence;                                         // 0x09A8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTPageMatchResult*                          page_MatchResult2;                                        // 0x09AC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTPageMatchResult*                          MatchResult2;                                             // 0x09B0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTPageMatchResult*                          MatchResult2_Defence;                                     // 0x09B4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     pagename_RoomLobby;                                       // 0x09B8(0x000C) (NeedCtorLink)
	struct FString                                     pagename_RoomLobby_Defence;                               // 0x09C4(0x000C) (NeedCtorLink)
	struct FString                                     pagename_MatchResult2;                                    // 0x09D0(0x000C) (NeedCtorLink)
	struct FString                                     pagename_MatchResult2_Defence;                            // 0x09DC(0x000C) (NeedCtorLink)
	class UBTPageAuction*                              page_Auction;                                             // 0x09E8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     pagename_Auction;                                         // 0x09EC(0x000C) (NeedCtorLink)
	class UBTPageHelp*                                 page_Help;                                                // 0x09F8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     pagename_Help;                                            // 0x09FC(0x000C) (NeedCtorLink)
	class UBTPageMail*                                 page_Mail;                                                // 0x0A08(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     pagename_Mail;                                            // 0x0A0C(0x000C) (NeedCtorLink)
	class UBTPageStore*                                page_Store;                                               // 0x0A18(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     pagename_Store;                                           // 0x0A1C(0x000C) (NeedCtorLink)
	class UBTPageInventory*                            page_Inventory;                                           // 0x0A28(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     pagename_Inventory;                                       // 0x0A2C(0x000C) (NeedCtorLink)
	class UBTPageMyInfo*                               page_MyInfo;                                              // 0x0A38(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     pagename_MyInfo;                                          // 0x0A3C(0x000C) (NeedCtorLink)
	class UBTPageClan*                                 page_Clan;                                                // 0x0A48(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     pagename_Clan;                                            // 0x0A4C(0x000C) (NeedCtorLink)
	class UBTPageCredit*                               page_Credit;                                              // 0x0A58(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     pagename_Credit;                                          // 0x0A5C(0x000C) (NeedCtorLink)
	class UBTPageClanWar*                              page_ClanWar;                                             // 0x0A68(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     pagename_ClanWar;                                         // 0x0A6C(0x000C) (NeedCtorLink)
	class UBTPageLucky*                                page_Lucky;                                               // 0x0A78(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     pagename_Lucky;                                           // 0x0A7C(0x000C) (NeedCtorLink)
	TEnumAsByte<EPage>                                 PageOnOpen;                                               // 0x0A88(0x0001)
	unsigned char                                      UnknownData04[0x3];                                       // 0x0A89(0x0003) MISSED OFFSET
	class UBTNetGUIPage*                               page_curr;                                                // 0x0A8C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	TArray<class UBTNetGUIPage*>                       Pages;                                                    // 0x0A90(0x000C) (NeedCtorLink)
	struct FString                                     szAccountName;                                            // 0x0A9C(0x000C) (NeedCtorLink)
	struct FString                                     szLoginServerIP;                                          // 0x0AA8(0x000C) (NeedCtorLink)
	int                                                szLoginServerPort;                                        // 0x0AB4(0x0004)
	int                                                GameRunningCount;                                         // 0x0AB8(0x0004)
	TArray<struct FLoginServerStruct>                  LoginServers;                                             // 0x0ABC(0x000C) (NeedCtorLink)
	unsigned char                                      iTryLoginCount;                                           // 0x0AC8(0x0001)
	unsigned char                                      iMaxTryLoginCount;                                        // 0x0AC9(0x0001)
	unsigned char                                      UnknownData05[0x2];                                       // 0x0ACA(0x0002) MISSED OFFSET
	unsigned long                                      bConnectedLoginServer : 1;                                // 0x0ACC(0x0004)
	unsigned long                                      bConnectedChannelServer : 1;                              // 0x0ACC(0x0004)
	unsigned long                                      bAuthKeySuccess : 1;                                      // 0x0ACC(0x0004)
	struct FString                                     DefaultLobbyBGM;                                          // 0x0AD0(0x000C) (NeedCtorLink)
	struct FString                                     LastMainPageBGM;                                          // 0x0ADC(0x000C) (NeedCtorLink)
	int                                                iUID;                                                     // 0x0AE8(0x0004) (Transient)
	int                                                iChannel;                                                 // 0x0AEC(0x0004) (Transient)
	struct FString                                     ServerName;                                               // 0x0AF0(0x000C) (NeedCtorLink)
	struct FString                                     ServerShortName;                                          // 0x0AFC(0x000C) (NeedCtorLink)
	int                                                ServerGroupID;                                            // 0x0B08(0x0004)
	int                                                ServerID;                                                 // 0x0B0C(0x0004)
	int                                                GameRoomID;                                               // 0x0B10(0x0004)
	struct FString                                     ServerGroupName;                                          // 0x0B14(0x000C) (NeedCtorLink)
	struct FString                                     ChannelName;                                              // 0x0B20(0x000C) (NeedCtorLink)
	int                                                iRoomNum;                                                 // 0x0B2C(0x0004) (Transient)
	int                                                NatType;                                                  // 0x0B30(0x0004)
	TArray<struct FString>                             NatAddrs;                                                 // 0x0B34(0x000C) (NeedCtorLink)
	TArray<int>                                        NatPorts;                                                 // 0x0B40(0x000C) (NeedCtorLink)
	class UBTNatDiag*                                  NatDiag;                                                  // 0x0B4C(0x0004)
	float                                              TimeNatDiagStarted;                                       // 0x0B50(0x0004)
	int                                                NatCheckLoop;                                             // 0x0B54(0x0004)
	float                                              NatDiagInterval;                                          // 0x0B58(0x0004)
	struct FString                                     LocalLogStr[0x9];                                         // 0x0B5C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strNatType[0x4];                                          // 0x0BC8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strCashCharge;                                            // 0x0BF8(0x000C) (Localized, NeedCtorLink)
	struct FScriptDelegate                             __delegateCheckNat__Delegate;                             // 0x0C04(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __UpdateRecv_ClanInfo__Delegate;                          // 0x0C0C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __UpdateExpiredItemList__Delegate;                        // 0x0C14(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __UpdateDurabilityWarningItemList__Delegate;              // 0x0C1C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __UpdateWebzenInvenList__Delegate;                        // 0x0C24(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __UpdateWebzenInvenListEnd__Delegate;                     // 0x0C2C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __ClearChatLog__Delegate;                                 // 0x0C34(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __NormalChatLog__Delegate;                                // 0x0C3C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __ClanChatLog__Delegate;                                  // 0x0C44(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __WhisperChatLog__Delegate;                               // 0x0C4C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __SelfChatLog__Delegate;                                  // 0x0C54(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __SystemChatLog__Delegate;                                // 0x0C5C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __TeamChatLog__Delegate;                                  // 0x0C64(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __BroadCastItemChatLog__Delegate;                         // 0x0C6C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __ClearChatLog_Extra__Delegate;                           // 0x0C74(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __NormalChatLog_Extra__Delegate;                          // 0x0C7C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __ClanChatLog_Extra__Delegate;                            // 0x0C84(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __WhisperChatLog_Extra__Delegate;                         // 0x0C8C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __SelfChatLog_Extra__Delegate;                            // 0x0C94(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __SystemChatLog_Extra__Delegate;                          // 0x0C9C(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __TeamChatLog_Extra__Delegate;                            // 0x0CA4(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __BroadCastItemChatLog_Extra__Delegate;                   // 0x0CAC(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTNetMainMenu");
		return ptr;
	}


	void SendLogin();
	bool OnAppExit(class UGUIComponent* Sender);
	bool TcpLogin_rfAckLoginWithIndonesia_Live(int Result);
	bool TcpLogin_rfAckLoginWithIndonesia_Test(int Result);
	bool TcpLogin_rfAckLoginWithGlobal_Test(int Result);
	bool TcpLogin_rfAckLoginWithGlobal_Live(int Result);
	bool TcpLogin_rfAckLoginWithThailand_Test(int Result);
	bool TcpLogin_rfAckLoginWithThailand_Live(int Result);
	bool TcpLogin_rfAckLoginWithWZAuth_Test(int Result, unsigned char wzp_AccountType, unsigned char wzp_IsBlock, unsigned char wzp_AuthKeySuccess, unsigned char ChannelType);
	bool TcpLogin_rfAckLoginWithWZAuth_Live(int Result, unsigned char wzp_AccountType, unsigned char wzp_IsBlock, unsigned char wzp_AuthKeySuccess, unsigned char ChannelType);
	bool TcpLogin_rfAckLoginWithTencentAuth_Test(int Result, unsigned char tc_AccountType, unsigned char tc_IsBlock);
	bool TcpLogin_rfAckLoginWithTencentAuth_Live(int Result, unsigned char tc_AccountType, unsigned char tc_IsBlock);
	void RequestUpdateQuickSlot(int iQuickSlotIdx);
	void UpdateSendQuickSlotIndex(int iQuickSlotIndex);
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
	bool Internal_OnFunctionKey(class UGUIComponent* Sender, unsigned char FunctionKey, const struct FString& Text);
	void TPChat_ChangeTab_OnClickTemp(int TabIndex);
	void TPChat_ChangeTab_OnClick(int TabIndex);
	void TPChat_OnChageChatMode(int ChatMode);
	void TPChat_OnInputTab(class UGUIComponent* Sender, const struct FString& Text);
	void TPChat_OnInputSpace(class UGUIComponent* Sender, const struct FString& Text);
	bool Internal_OnChat(class UGUIComponent* Sender, const struct FString& Text);
	void ChatBanEnd_OnTimer(int Index);
	bool CheckChatBan();
	bool UpdateChatBan();
	int IsInClanChannel(const struct FString& ServerIP, int serverPort, int ChannelID);
	bool IsInPageLobby();
	bool IsInPageServerSelection();
	bool IsGameReadyOrPlaying();
	bool IsInRangeDate(const struct FBtrDouble& ServerTime, int syear, int smonth, int sday, int shour, int smin, int eyear, int emonth, int eday, int ehour, int emin);
	bool Is18YearsOld(const struct FBtrDouble& ServerTime, const struct FString& BirthDay);
	void UpdateTimeBatteryAAS();
	void PopAASQueue();
	float GetAASFirstTime();
	struct FString GetAASFirst();
	void PushAASQueue(const struct FString& Text, float Time, unsigned char AASLevel);
	float GetAASBeginTime(unsigned char byLevel);
	unsigned char GetAASLevel();
	void SetAASMessage(unsigned char byType, int AccumTime);
	void ResetBatteryAAS();
	void UpdateTimeBatteryNotice();
	void PopNoticeQueue();
	struct FString GetNoticeFirst();
	void PushNoticeQueue(const struct FString& Notice);
	void ResetBatteryNotice();
	bool TextToGMCommand(const struct FString& Text);
	bool TextToCommand(const struct FString& Text);
	void UpdateChatLog();
	void ResetChatLog();
	bool SelectChatLog(int ChatType, const struct FString& chatText);
	void BroadCastItemChatLog_Extra(const struct FString& cL);
	void TeamChatLog_Extra(const struct FString& cL);
	void SystemChatLog_Extra(const struct FString& cL);
	void SelfChatLog_Extra(const struct FString& cL);
	void WhisperChatLog_Extra(const struct FString& cL);
	void ClanChatLog_Extra(const struct FString& cL);
	void NormalChatLog_Extra(const struct FString& cL);
	void ClearChatLog_Extra();
	void BroadCastItemChatLog(const struct FString& cL);
	void TeamChatLog(const struct FString& cL);
	void SystemChatLog(const struct FString& cL);
	void SelfChatLog(const struct FString& cL);
	void WhisperChatLog(const struct FString& cL);
	void ClanChatLog(const struct FString& cL);
	void NormalChatLog(const struct FString& cL);
	void ClearChatLog();
	int GetChatLogTopIndex();
	void AddChatLog(const struct FString& chatText, int ChatType, bool bForceUpdateLast);
	bool Exit_OnOK(class UGUIComponent* Sender);
	bool TcpLogin_rfAckHash(int Result, const struct FString& Error);
	void Exit_LoginServer(int ErrCode);
	void TryConnect_Login();
	void TcpLogin_OnError(int ErrCode);
	void TcpLogin_OnClose(int ErrCode);
	void TcpLogin_OnConnect(int ErrCode);
	void SetPage(TEnumAsByte<EPage> PageType, bool CloseLastMenu);
	void HaltNetwork();
	bool rfReqForceNatTypeSetting(int NatType);
	void CheckNatPhrase2HK();
	void CheckNatPhrase1HK();
	void CheckNatPhrase0HK();
	void StartNatCheck();
	void rfReqStartNatDiag(const struct FString& Server1Addr, int Server1Port, const struct FString& Server2Addr, int Server2Port);
	void deleOnClose(bool bCancelled);
	bool deleOnKeyEvent(float Delta, unsigned char* key, unsigned char* State);
	void deleOnOpen();
	class UBTTcpLink_Login* GetTcpLogin();
	void InitializeTcpLogin(const struct FString& IP, int Port);
	void InitializeTcpChannel(const struct FString& IP, int Port, int DataPort);
	void ShowPlayTimePerHour_OnEventTimer(int Index);
	bool LoadLoginServerList_Ini();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void KeepMoving();
	void EndAutoMove();
	void StartAutoMove(int Server, int Channel, int gameroom, const struct FString& Password, int ClanMatch_EnterState);
	bool TutorialChannelAutoMove();
	struct FString FindChannelNickName(int ServerID, int ChannelID);
	struct FString FindServerShortName(int ServerID, int ChannelID);
	struct FString FindServerName(int ServerID);
	int FindServerConnectionInfoIndex(int ServerID, int ChannelID);
	int FindServerChannelInfoIndexByServerIP(const struct FString& ServerIP, int serverPort, int ChannelID);
	void AddServerChannelList(int ServerID, int ChannelID, const struct FString& ServerIP, int serverPort, int ServerDataPort, const struct FString& ServerName, const struct FString& ServerShortName, const struct FString& ChannelName, int ServerGroupID, const struct FString& ServerGroupName, int IsClanChannel, const struct FString& ChannelNickName, bool IsDedicatedServer, float ChannelOption, int nCurUser, int nMaxUser);
	void ClearServerChannelList();
	void CheckItemWarning();
	bool CheckDestroyedDurabilityXItemList();
	bool CheckDestroyedDurabilityXItemList_OnOK(class UGUIComponent* Sender);
	bool CompleteDestroyedDurabilityXItemList();
	bool CheckDurabilityWarningItemList();
	bool CheckExpiredItemList();
	void CompleteExpiredItem();
	void AddExpiredSkillItem(int ItemID, int UniqueID, int SlotPos);
	void AddExpiredItem(int ItemID, const struct FBtrDouble& UniqueID, int SlotPos, int PartID);
	void CompleteDurabilityWarningItem();
	void AddDurabilityWarningItemRepairCost(const struct FBtrDouble& UniqueID, int RepairCost);
	void AddDurabilityWarningItem(const struct FBtrDouble& UniqueID, int ItemID, int SlotPos, int PartID, int Durability);
	void LoginToChannel(const struct FString& IP, int Port, int DataPort);
	void ChannelToLogin2(const struct FString& IP, int Port);
	void ChannelToLogin(const struct FString& IP, int Port);
	void ChannelToLogin_OnEventTimer(int Index);
	void UpdateWebzenInvenListEnd(class UBTNetMainMenu* MainMenu);
	void UpdateWebzenInvenList(class UBTNetMainMenu* MainMenu);
	void StopWebzenInvenList();
	bool sfReqWebzenInvenList(const struct FString& StorageType);
	void SetNewMailArrived(bool B);
	void UpdateDurabilityWarningItemList(class UBTNetMainMenu* MainMenu);
	void UpdateExpiredItemList(class UBTNetMainMenu* MainMenu);
	void UpdateRecv_ClanInfo(class UBTNetMainMenu* MainMenu);
	void delegateCheckNat();
};


// Class GUIWarfare.BTNetGUIPageHK
// 0x01B4 (0x05FC - 0x0448)
class UBTNetGUIPageHK : public UBTNetGUIPage
{
public:
	class UwMatchMaker*                                MM;                                                       // 0x0448(0x0004)
	class UwGameManager*                               GameMgr;                                                  // 0x044C(0x0004)
	struct FString                                     currentBGM;                                               // 0x0450(0x000C) (NeedCtorLink)
	struct FFloatBox                                   fbTPTopMenu;                                              // 0x045C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPTopMenuHK*                              TPTopMenu;                                                // 0x046C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                SkipTopMenuIndex;                                         // 0x0470(0x0004)
	unsigned long                                      CloseLastMenu : 1;                                        // 0x0474(0x0004)
	struct FFloatBox                                   fbLabelRoomName;                                          // 0x0478(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawSourceClipImageHK*               LabelRoomName;                                            // 0x0488(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTitle;                                             // 0x048C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTitle;                                               // 0x049C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelLeftTopRoll;                                       // 0x04A0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelLeftTopRollSource;                                 // 0x04B0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawSourceClipImageHK*               LabelLeftTopRoll;                                         // 0x04C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTopLine;                                           // 0x04C4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTopLine;                                             // 0x04D4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelBottomLine;                                        // 0x04D8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTLabelNoticeHK*                            LabelBottomLine;                                          // 0x04E8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelAAS;                                               // 0x04EC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPAASHK*                                  LabelAAS;                                                 // 0x04FC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	unsigned long                                      bSkipInitializeDefaultPage : 1;                           // 0x0500(0x0004)
	unsigned long                                      bFadeTimeTranslate : 1;                                   // 0x0500(0x0004)
	unsigned long                                      bUseTranslate : 1;                                        // 0x0500(0x0004)
	unsigned long                                      bCallFadeIn : 1;                                          // 0x0500(0x0004)
	unsigned long                                      bFading : 1;                                              // 0x0500(0x0004)
	unsigned long                                      bClosing : 1;                                             // 0x0500(0x0004)
	float                                              FadeTime;                                                 // 0x0504(0x0004)
	float                                              CurFadeTime;                                              // 0x0508(0x0004)
	unsigned char                                      CurFade;                                                  // 0x050C(0x0001)
	unsigned char                                      DesiredFade;                                              // 0x050D(0x0001)
	unsigned char                                      StartFade;                                                // 0x050E(0x0001)
	unsigned char                                      UnknownData00[0x1];                                       // 0x050F(0x0001) MISSED OFFSET
	struct FFloatBox                                   fbNewBackground;                                          // 0x0510(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         NewBackground;                                            // 0x0520(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         WeaponListBg;                                             // 0x0524(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbWeaponListBg;                                           // 0x0528(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FString                                     strWeaponList[0x6];                                       // 0x0538(0x000C) (Localized, NeedCtorLink)
	TArray<class UBTOwnerDrawCaptionButtonHK*>         WeaponeTypeBtnList;                                       // 0x0580(0x000C) (NeedCtorLink)
	unsigned long                                      bShowWeaponeTypeList : 1;                                 // 0x058C(0x0004)
	class UBTOwnerDrawImageHK*                         SkillListBg;                                              // 0x0590(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbSkillListBg;                                            // 0x0594(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FString                                     strSkillList[0x6];                                        // 0x05A4(0x000C) (Localized, NeedCtorLink)
	TArray<class UBTOwnerDrawCaptionButtonHK*>         SkillTypeBtnList;                                         // 0x05EC(0x000C) (NeedCtorLink)
	unsigned long                                      bShowSkillTypeList : 1;                                   // 0x05F8(0x0004)

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
	bool Internal_OnPreDraw(class UCanvas* C);
	class UBTOwnerDrawCaptionButtonHK* NewButtonComponent(const struct FFloatBox& fbNewCompo, float RenderWeight);
	class UBTOwnerDrawImageHK* NewLabelComponent(const struct FFloatBox& fbNewCompo, const struct FImage& bgImg, float RenderWeight);
	void ExitGame();
	void OpenTodayResultPage();
	bool BTWIndowTodayResultHK_OnOK(class UGUIComponent* Sender);
	bool SkillListClick(class UGUIComponent* Sender);
	bool WeaponListClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void LabelAAS_OnNextAAS(const struct FString& NextAAS);
	void LabelBottomLine_OnNextNotice(const struct FString& NextNotice);
	bool ButtonTest_OnClick(class UGUIComponent* Sender);
	void InitializeDefaultPage();
	void SetDefaultWeapon(int SlotIndex);
	void RefreshPage();
	void Opened(class UGUIComponent* Sender);
	bool HeaderButton_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfare.BTNetQuestInfoPageHK
// 0x0000 (0x05FC - 0x05FC)
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
// 0x02C8 (0x08C4 - 0x05FC)
class UBTPageRoomLobby : public UBTNetQuestInfoPageHK
{
public:
	int                                                OutofSeatTime;                                            // 0x05FC(0x0004)
	int                                                OwnerOutofSeatTime;                                       // 0x0600(0x0004)
	float                                              LastKeySleepTime;                                         // 0x0604(0x0004)
	unsigned long                                      bAllReady : 1;                                            // 0x0608(0x0004)
	int                                                PrevGameMode;                                             // 0x060C(0x0004)
	unsigned long                                      bPrevTeamBalance : 1;                                     // 0x0610(0x0004)
	struct FString                                     strTeamBalance[0x3];                                      // 0x0614(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strBotModeWarn[0x2];                                      // 0x0638(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strNoviceMode;                                            // 0x0650(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strBotMode;                                               // 0x065C(0x000C) (Localized, NeedCtorLink)
	float                                              TimeAutoStart;                                            // 0x0668(0x0004)
	float                                              TPMessenger_ACLMsg0_OnHitBottom_LastTime;                 // 0x066C(0x0004)
	unsigned long                                      bGoToClanPage : 1;                                        // 0x0670(0x0004)
	float                                              LastRefreshTime[0x2];                                     // 0x0674(0x0004)
	float                                              RefreshCycleTime[0x2];                                    // 0x067C(0x0004)
	class UBTRefreshTime*                              rfFriendPosTime;                                          // 0x0684(0x0004)
	int                                                TotalChannelUserCount;                                    // 0x0688(0x0004)
	int                                                CurrentRoomState;                                         // 0x068C(0x0004)
	unsigned long                                      bJoinClanState : 1;                                       // 0x0690(0x0004)
	unsigned long                                      bClanInviteState : 1;                                     // 0x0690(0x0004)
	unsigned long                                      bSafeLeaveRoom : 1;                                       // 0x0690(0x0004)
	class UBTOwnerDrawImageHK*                         LabelTeamSelect;                                          // 0x0694(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTeam;                                              // 0x0698(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTeam;                                                // 0x06A8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTeamTopLine;                                       // 0x06AC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTeamTopLine;                                         // 0x06BC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTeam[0x2];                                        // 0x06C0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTeam[0x2];                                          // 0x06E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPTeamList[0x2];                                        // 0x06E8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPTeamMemberList*                         TPTeamList[0x2];                                          // 0x0708(0x0004) (ExportObject, NeedCtorLink, EditInline)
	TArray<class UBTAutoColumnListDataHK*>             UserListDB;                                               // 0x0710(0x000C) (NeedCtorLink)
	TArray<class UBTAutoColumnListDataHK*>             GMList;                                                   // 0x071C(0x000C) (NeedCtorLink)
	int                                                GMNumAF;                                                  // 0x0728(0x0004)
	int                                                GMNumRSA;                                                 // 0x072C(0x0004)
	struct FFloatBox                                   fbTPChat;                                                 // 0x0730(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPChatHK*                                 TPChat;                                                   // 0x0740(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPMessenger;                                            // 0x0744(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPMessengerHKCN*                          TPMessenger;                                              // 0x0754(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPMyInfo;                                               // 0x0758(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPMyInfoHK*                               TPMyInfo;                                                 // 0x0768(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPRoomInfo;                                             // 0x076C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPRoomInfoHK*                             TPRoomInfo;                                               // 0x077C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     strButtonStart[0x3];                                      // 0x0780(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonStart;                                            // 0x07A4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonStart;                                              // 0x07B4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTemp;                                             // 0x07B8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTemp;                                               // 0x07C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UwMatchMaker*                                MatchMaker;                                               // 0x07CC(0x0004) (Transient)
	TArray<struct FGameModeInfo>                       GameModes;                                                // 0x07D0(0x000C) (NeedCtorLink)
	unsigned long                                      bReadyToGame : 1;                                         // 0x07DC(0x0004)
	unsigned long                                      bNoInitialRoomInfo : 1;                                   // 0x07DC(0x0004)
	unsigned long                                      bShowHostWarning : 1;                                     // 0x07DC(0x0004)
	struct FString                                     strExpiredItem;                                           // 0x07E0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     CannotChangeHostTitle;                                    // 0x07EC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     CannotChangeHostMessage;                                  // 0x07F8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     WaitingMessage;                                           // 0x0804(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MessageNewHost;                                           // 0x0810(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MessageNewGuestPre;                                       // 0x081C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MessageNewGuestPost;                                      // 0x0828(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MessageHostChangeEnable[0x2];                             // 0x0834(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strLowHostScoreWarning[0x2];                              // 0x084C(0x000C) (Localized, NeedCtorLink)
	int                                                NewOwnerID;                                               // 0x0864(0x0004)
	int                                                MinHostPoint;                                             // 0x0868(0x0004)
	int                                                MinWaringHostPoint;                                       // 0x086C(0x0004)
	int                                                MaxWaringHostPoint;                                       // 0x0870(0x0004)
	float                                              SendPingIntervalTime;                                     // 0x0874(0x0004)
	TEnumAsByte<E_MyAction>                            MyAction;                                                 // 0x0878(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0879(0x0003) MISSED OFFSET
	class UBTLabelTutorialQuestInfoHK*                 LabelPopupTutorial;                                       // 0x087C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	TArray<int>                                        ReceivedPingID;                                           // 0x0880(0x000C) (NeedCtorLink)
	TArray<int>                                        ReceivedPingValue;                                        // 0x088C(0x000C) (NeedCtorLink)
	TArray<struct FString>                             DelFriendsList;                                           // 0x0898(0x000C) (NeedCtorLink)
	struct FFloatBox                                   fbBGDeco;                                                 // 0x08A4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         BGDeco;                                                   // 0x08B4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 MyInfoBtn;                                                // 0x08B8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FScriptDelegate                             __CurrentButtonClickBehavior__Delegate;                   // 0x08BC(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageRoomLobby");
		return ptr;
	}


	bool rfAckUseItemDuringGame(int ErrorCode, const struct FString& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, int RemainCount);
	bool CheckEnterRoom_InClanChannel(const struct FString& szClanName);
	class UBTAutoColumnListDataHK* MakeTeamMemberData(int UID, int ClanMark, int ClanBG, int ClanBL, int Level, const struct FString& NickName, const struct FString& ClanName, int Status, int Host, int Ping, const struct FString& UserIP, unsigned char LookingFor, int ClanLevel, int LevelMarkID, int TitleMarkID, int TeamNum, int Reserved2, int Reserved3, bool bMe, bool bisGM);
	void SaveUserData(class UBTAutoColumnListDataHK* Item);
	bool rfNotifyClanLevelup(const struct FString& ClanName, int Levelup);
	bool rfNotifyNewClanName(const struct FString& New_NickName);
	bool rfNotifyNewNickName(int Community_Type, const struct FString& Old_NickName, const struct FString& New_NickName);
	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, unsigned char RankingType, unsigned char CommunityType, TArray<struct FString> CharName, TArray<int> CharLevel, TArray<struct FString> ClanName, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<int> ClanMarkBL, TArray<int> Ranking_Accum, TArray<int> Ranking_Accum_Prev, TArray<int> Ranking_Accum_Exp, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, unsigned char RankingType, unsigned char CommunityType, int TotalCount);
	bool rfAckFriendPosition(int Result, const struct FString& TargetCharName, unsigned char ServerType, const struct FString& fServername, const struct FString& fServerShortName, const struct FString& fServerIP, int fServerPort, unsigned char CurPos, unsigned char CurState, int ChannelNum, const struct FString& ChannelNickName, int GameRoomNum);
	bool rfAckNotifyUpdateCharInfo_LevelMark(const struct FString& CharName, int LevelMarkID);
	bool rfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel);
	bool rfReqInGameRoomUserInfoChanged();
	bool rfAckNotifyAdjustClanMemberGrade(const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	void UserPingRefresh();
	void SendPingToAll();
	void sfReqRoomUserPingInfo();
	void OnReceivedPing(class UwMatchMaker* MM, const struct FString& fromAddr, int msec);
	bool rfAckRoomUserPingInfo(TArray<int> UnqueID, TArray<int> Ping, int HostScore);
	bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, const struct FString& NewRoomTitle);
	bool rfAckCheckEquipedWeaponDurability(int Result, TArray<struct FBtrDouble> ItemUniqueID, TArray<int> ItemSlotNum);
	bool ButtonTemp_OnClick(class UGUIComponent* Sender);
	bool rfAckGetBotID(int Result, unsigned char RequestedAFCount, unsigned char RequestedRSACount, TArray<int> AFBotID, TArray<int> RSABotID);
	bool rfAckAutoChangedTeamUserList(TArray<int> UserID, TArray<int> TeamNum);
	int FindTeamNumInArray(TArray<int> UserID, TArray<int> TeamNum, int FindUserID);
	bool rfReqRecvForceFailedClientLoading(int ErrCode);
	bool rfAckStartHolePunching(int Result, const struct FString& ErrMsg, int GameType, int ReqStartUserID);
	bool rfAckRegisterMyUdpInfo(int Result, const struct FString& ErrMsg);
	bool rfAckNotifyMyCharInfoToRoomUser(int Result, const struct FString& ErrMsg, int UID, const struct FString& UserName, int Grade, int TeamNum, unsigned char Statue, unsigned char IsHost, const struct FString& UserIP, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, unsigned char IsLookFor);
	bool rfReqNotifyDisconnectHostInLoading(int Result, const struct FString& ErrMsg, int HostID);
	bool rfReqRecvDeleteFriend(int Result, const struct FString& FromCharName);
	bool rfAckDeleteFriend(int Result, TArray<struct FString> FailedCharname);
	bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, TArray<int> UID, TArray<struct FString> CharName, TArray<int> UserLevel, TArray<struct FString> ClanName, TArray<int> ClanPattern, TArray<int> ClanBG, TArray<int> ClanBL, TArray<unsigned char> IsLookForClan, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckChatWispher(int Result, const struct FString& ErrMsg, const struct FString& ToCharName);
	bool rfAckAcquirePromotionItems(int UID, int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> ItemUniqueID, TArray<int> ItemIDs, TArray<int> PartIDs);
	bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, TArray<int> ItemID, TArray<int> PartID);
	bool rfAckRecvJoinClanResult(int Result, const struct FString& ErrMsg);
	bool rfAckJoinClanResult(const struct FString& CharName, unsigned char Permit, const struct FString& PermitCharName);
	bool BTWindowRequestApprovalClanHK_OnSuspend(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnOK(class UGUIComponent* Sender);
	bool rfReqRecvJoinClan(int UserIdx, const struct FString& CharName, const struct FString& Message);
	bool rfAckNotifyClanSecession(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckNotifyNewClanMember(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckSearchClan(int Result, const struct FString& ErrMsg, int TotalPage, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<unsigned char> ClanMarkBL, TArray<struct FString> ClanName, TArray<struct FString> ClanMaster, TArray<int> ClanMember, TArray<int> ClanMemberMax, TArray<int> ClanCreateDate, TArray<int> ClanWin, TArray<int> ClanLose, TArray<int> ClanDraw, TArray<int> ClanRank, TArray<unsigned char> ClanRecruit, TArray<int> ClanLevel);
	bool rfAckRecvClanInviteResult(int Result, const struct FString& ErrMsg);
	bool IsGameReadyOrPlaying();
	bool rfAckInviteClanResult(const struct FString& CharName, unsigned char Permit, const struct FString& ClanNm);
	bool BTWindowDefineSelectHK_23_OnOK(class UGUIComponent* Sender);
	bool rfReqRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& ClanName, const struct FString& InviteMsg);
	bool rfAckJoinClan(int Result, const struct FString& ErrMsg, const struct FString& SpecificCharName, const struct FString& RealRecvCharName, unsigned char RealRecvCharClanGrade);
	bool rfAckInviteClan(int Result, const struct FString& ErrMsg);
	void UpdateRecv_ClanInfo(class UBTNetMainMenu* MainMenu);
	bool BTWindowUserPersonalInfo_OnClanInfo(class UGUIComponent* Sender);
	bool BTWindowUserDetailInfoHK_OnClanInfo(class UGUIComponent* Sender);
	bool rfReqClanCharPersonelIntro(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckClanCharPersonelIntro(int Result, const struct FString& ErrMsg, const struct FString& PersonelIntro);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfAckDBCharInfo(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FString& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool MoveToClanPage_OnOK(class UGUIComponent* Sender);
	bool rfAckCreateClan(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckDupCheckClanName(int Result, const struct FString& ErrMsg);
	bool rfAckGetIsHostBlocking(int Result, unsigned char Blocking);
	bool rfAckNotifyHostBlocking(int Result, unsigned char Blocking);
	bool rfAckGetHolePunchingResult(int Result, unsigned char Phrase, int InterventionUserID, unsigned char Intervention, TArray<int> FailedUserIDs);
	bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint);
	bool BTWindowChangeHost_OnCancel(class UGUIComponent* Sender);
	bool BTWindowChangeHost_OnOK(class UGUIComponent* Sender);
	bool rfReqRecvForceDisconnectUDPFromHost(int Result);
	bool rfAckForceDisconnectUDPFromHost(int Result);
	bool rfReqNotifyChangeRoomState(unsigned char RoomState);
	bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, const struct FString& ErrMsg);
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
	bool rfReqCompleteFriendInvite(const struct FString& CharnameToBeInvited, unsigned char IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfReqRecvFriendInvite(int ReqUserID, const struct FString& ReqCharname, const struct FString& InviteMsg);
	bool WindowRequestFriend_OnCancel(class UGUIComponent* Sender);
	bool WindowRequestFriend_OnOK(class UGUIComponent* Sender);
	bool rfAckSendFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfAckRoomUserList(TArray<int> UID, TArray<struct FString> UserName, TArray<int> Grade, TArray<int> TeamNum, TArray<unsigned char> Statue, TArray<unsigned char> IsHost, TArray<struct FString> UserIP, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<unsigned char> IsLookingFor, TArray<int> GMUID, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	void RefreshUserList();
	void RemoveInUserList(int UID);
	bool Exit_OnOK(class UGUIComponent* Sender);
	bool rfAckProcessPreLoginUser(int Result, const struct FString& ErrMsg);
	bool rfAckLoginInHouseTest(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg, const struct FString& BDay, unsigned char Sex, const struct FBtrDouble& ServerTime);
	void TcpLogin_OnConnect(int ErrCode);
	void RoomLobbyToServerSelection();
	bool RoomLobbyToServerSelection_OnOK(class UGUIComponent* Sender);
	bool rfAckEnterChannel(int id, int UID, const struct FString& UserID, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckChangeRoomSetting(int Result, const struct FString& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfAckChangeUserState(int Result, const struct FString& ErrMsg, TArray<int> UserIDs, TArray<unsigned char> Positions, TArray<int> Numbers, TArray<unsigned char> OldStates, TArray<unsigned char> NewStates);
	bool rfAckNotifyLoadingState(int Result, int UserID, unsigned char LoadingState);
	bool rfAckFailedStartGame(int Result, const struct FString& ErrMsg, unsigned char IsHost, int FailedUserID, int LoadingStep);
	bool rfAckSuccessStartGame(int Result, const struct FString& ErrMsg, unsigned char IsHost, const struct FString& HostIP, int HostPort, int LoadingStep);
	bool rfReqRelayServerOff();
	bool rfAckUpdateWeaponDurability(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, TArray<int> Durability, TArray<unsigned char> IsDestroy, TArray<struct FBtrDouble> FailedWeaponUniqueID);
	bool rfAckEntryQSlotUniqueIDList(int UserNum, TArray<unsigned char> QSlotDispOrder, TArray<struct FBtrDouble> MWUniqueID, TArray<struct FBtrDouble> PistolUniqueID, TArray<struct FBtrDouble> TW1UniqueID, TArray<struct FBtrDouble> TW2UniqueID);
	bool rfAckEntryQSlotIDList(int UserNum, TArray<unsigned char> QSlotDispOrder, TArray<int> MWItemID, TArray<int> MWPartID, TArray<int> MWPaintID, TArray<int> PistolItemID, TArray<int> PistolPartID, TArray<int> PistolPaintID, TArray<int> TWItemID1, TArray<int> TWItemID2, TArray<int> Skill1ID, TArray<int> Skill2ID, TArray<int> Skill3ID, TArray<int> Skill4ID);
	bool rfAckChangeNewGuest(const struct FString& HostIP);
	bool rfAckChangeHost(unsigned char ClientNum);
	bool rfAckGetBootyChoose(int Result, const struct FString& ErrMsg, unsigned char GiveType, const struct FBtrDouble& ItemUniqueNumber, int ItemID, int PartID, unsigned char ItemType, const struct FBtrDouble& UntilTime, int StackCount, int PaintID);
	bool rfAckEntrySkillList(TArray<int> UserIDs, TArray<int> SkillIDs, TArray<int> SlotPositions, int Result, const struct FString& ErrMsg);
	bool rfAckGetBooty(int Result, const struct FString& ErrMsg, TArray<int> PrizeWinUserID, TArray<int> BootyItemID, TArray<int> BootyPartsID);
	bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, const struct FString& ErrMsg);
	bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, const struct FString& ErrMsg);
	bool rfAckEntryItemList(TArray<int> UserIDs, TArray<int> ItemIDs, TArray<int> SlotPositions, TArray<int> AddPartsID, TArray<struct FBtrDouble> UniqueID, TArray<int> PaintID, int Result, const struct FString& ErrMsg);
	bool rfAckAIRewardResult(unsigned char ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, TArray<int> ScoreRewardUserID, TArray<unsigned char> ScoreRewardTYPE, TArray<int> ScoreRewardID, TArray<int> ScoreRewardCount);
	bool rfAckUpdateScore(TArray<int> UserIDs, TArray<struct FString> NickNames, TArray<unsigned char> TeamIDs, TArray<int> Scores, TArray<int> Kills, TArray<int> Assists, TArray<int> Deaths, TArray<int> EXPs, TArray<int> EXPBonuses, TArray<int> Points, TArray<int> PointBonuses, TArray<int> TeamScores, TArray<int> BonusOwnerID, TArray<int> BonusID);
	bool rfAckConnectGame(int UserID, int Result);
	bool rfAckChangeTeam(int GameNumber, const struct FString& UserID, int UID, int TeamNum, int Result, const struct FString& ErrMsg);
	bool rfAckLeaveRoom(int Num, int UID, const struct FString& UserID, int Result, const struct FString& ErrMsg);
	bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, const struct FString& UserID, int TeamNum, int Grade, const struct FString& UserIP, const struct FString& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckGameOverEnd(int Result, const struct FString& ErrMsg);
	bool rfAckGameOver(int UID, int GameRoomNumber, int Result, const struct FString& ErrMsg);
	bool rfAckDisconnectGame(int Result, int DisconnectUserID, const struct FString& DisconnectUserName);
	bool rfAckRegisterOtherUdpInfo(int UID, const struct FString& IP, int Port, unsigned char NatType, unsigned char Intervention, const struct FString& HostInnerIP, int HostInnerPort);
	bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, const struct FString& ErrMsg);
	bool rfAckChangeGameMode(int GameNum, int UID, const struct FString& GameMode, unsigned char GameModeNum, int Result, const struct FString& ErrMsg);
	bool rfAckSelectMap(int GameNum, int UID, const struct FString& MapName, int Result, const struct FString& ErrMsg);
	bool rfAckGameRoomInfo(int Result, const struct FString& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfAckIsGameRoomPlaying(int GameRoomNum, unsigned char IsPlaying);
	bool rfAckGameHostInfo(int GameNumber, const struct FString& UserID, const struct FString& IP, int Port, int Result, const struct FString& ErrMsg);
	void TeamChatLog(const struct FString& cL);
	void BroadCastItemChatLog(const struct FString& cL);
	void SystemChatLog(const struct FString& cL);
	void SelfChatLog(const struct FString& cL);
	void WhisperChatLog(const struct FString& cL);
	void ClanChatLog(const struct FString& cL);
	void NormalChatLog(const struct FString& cL);
	void ClearChatLog();
	void SetMatchBGM();
	void GameOver();
	void StartGame(const struct FString& IP, int Port);
	bool IsUserAllReady();
	int GetReadyAllUserCount();
	int GetUserCount();
	bool IsUserCountFull();
	void UpdateRoomInfoByMatchMaker();
	struct FString FindFriendlyGameModeByIndex(int GameModeIndex);
	struct FString FindFriendlyGameMode(const struct FString& GameMode);
	void InitialRoomInfo();
	class UBTConsole* GetConsole();
	class UBTTcpLink_Login* GetTcpLogin();
	class UBTTcpLink_Channel* GetTcpChannel();
	bool internalKeyEvent(float Delta, unsigned char* key, unsigned char* Action);
	void InternalOnClose(bool bCanceled);
	void SetCharacterInfo(const struct FString& ClanName, const struct FCharInfo& btCharInfo);
	void QuestLog(const struct FString& Msg);
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
	void FailedNetworkChecking(const struct FString& ErrMsg, int Code);
	void StartNetworkChecking(int ClientsCount, bool bConnectGame);
	bool ButtonStart_OnKeyEvent(float Delta, unsigned char* key, unsigned char* Action);
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
	bool CheckInviteUser(int CurPos, int CurState, const struct FString& szNickName, const struct FString& szClanName);
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
	struct FString                                     DisconnectedFromServerMsg;                                // 0x0038(0x000C) (Localized, NeedCtorLink)
	struct FString                                     DisconnectedFromServerQuit;                               // 0x0044(0x000C) (Localized, NeedCtorLink)
	class UwMatchMaker*                                MM;                                                       // 0x0050(0x0004)
	class UwGameManager*                               GameMgr;                                                  // 0x0054(0x0004)
	unsigned long                                      bTutorial : 1;                                            // 0x0058(0x0004)
	unsigned long                                      bTutorialEnteringRoom : 1;                                // 0x0058(0x0004)
	struct FGameRoomInfo                               TutorialRoomInfo;                                         // 0x005C(0x0064) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTTcpHandler");
		return ptr;
	}


	bool rfAckUseItemDuringGame(int ErrorCode, const struct FString& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, int RemainCount);
	bool rfReqAhnNotifyDisconnct(int Code);
	bool rfReqAhnHsObject(TArray<unsigned char> Data, int DataSize);
	bool rfAckSetCommunityOption(int Result, const struct FString& ErrStr);
	bool rfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite);
	bool rfChangeItemInstanceInfo(int ErrorCode, int ItemID, const struct FBtrDouble& ItemUniqueID, unsigned char ChangeCount, int RemainCount);
	bool rfAckLuckShop_RewardCoupon(int ErrorCode, int Coupon_ItemTypeID, const struct FBtrDouble& Coupon_ItemUniqueID, int Coupon_Count_AfterReduction);
	bool rfAckLuckShop_RewardBuyingCount(int ErrorCode, int FinalCapsuleRewardState);
	bool rfAckLuckShop_StorageInfo(int ErrorCode, int BuyingCapsuleCount, int CapsuleRewardState);
	bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, unsigned char IsNotification, TArray<struct FString> NickName, TArray<struct FBtrDouble> Time, int GetItemID);
	bool rfNotifyCouponUseError(int Time);
	bool rfReqNotifyShopItemDataEnd(int Ver);
	bool rfAckCouponUse(int Result, const struct FString& ErrMsg);
	bool rfReqNotifyShopItemData(TArray<int> ProductNo, TArray<struct FString> ProductName, TArray<int> ProductCode, TArray<unsigned char> SaleType, TArray<int> ProductCost, TArray<int> ProductHour, TArray<int> ProductQuantity, TArray<int> SaleMasterFlag, TArray<int> SaleStatus, TArray<int> IsGift, TArray<struct FBtrDouble> SaleEndTime, TArray<int> Discountcost);
	bool rfAckShopItemData();
	bool rfNotifyClanLevelup(const struct FString& ClanName, int Levelup);
	bool rfNotifyNewClanName(const struct FString& New_NickName);
	bool rfNotifyNewNickName(int Community_Type, const struct FString& Old_NickName, const struct FString& New_NickName);
	bool rfAckTencent_StartTenProtect(int CharDBID);
	bool rfAckMoveToLobby(unsigned char MessageType);
	bool rfAckPopUpMessage(int MessageType);
	bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckFriendPosition(int Result, const struct FString& TargetCharName, unsigned char ServerType, const struct FString& fServername, const struct FString& fServerShortName, const struct FString& fServerIP, int fServerPort, unsigned char CurPos, unsigned char CurState, int ChannelNum, const struct FString& ChannelNickName, int GameRoomNum);
	bool rfAckLogOut(unsigned char Result, unsigned char Reason);
	bool rfAckNotifyUpdateCharInfo_LevelMark(const struct FString& CharName, int LevelMarkID);
	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, unsigned char RankingType, unsigned char CommunityType, TArray<struct FString> CharName, TArray<int> CharLevel, TArray<struct FString> ClanName, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<int> ClanMarkBL, TArray<int> Ranking_Accum, TArray<int> Ranking_Accum_Prev, TArray<int> Ranking_Accum_Exp, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, unsigned char RankingType, unsigned char CommunityType, int TotalCount);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel);
	bool rfAckClanMatchResultHistory(TArray<struct FBtrDouble> MatchDate, TArray<unsigned char> IsWin, TArray<struct FString> EnemyClanname);
	bool rfReqInGameRoomUserInfoChanged();
	bool rfAckServerType(unsigned char Type);
	bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, const struct FString& ErrMsg, TArray<int> MapNumArray, int VersusMode, unsigned char IsPublic);
	bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, const struct FString& RoomName, int MapNum, int CurUserCount, int MaxUserCount, unsigned char Status, unsigned char IsPublic);
	bool rfAckClanMatch_EndPublicWaitRoomList();
	bool rfAckClanMatch_PublicWaitRoomList(TArray<int> WaitRoomIdx, TArray<struct FString> LeaderName, TArray<struct FString> RoomName, TArray<int> MapNum, TArray<int> CurUserCount, TArray<int> MaxUserCount, TArray<unsigned char> Status);
	bool rfAckClanMatch_StartPublicWaitRoomList(int Result, const struct FString& ErrMsg, int Count);
	bool rfAckPaidItem_NotifyChangeClanname(const struct FString& NewClanname);
	bool rfAckPaidItem_ChangeClanname(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const struct FString& NewClanname);
	bool rfAckPaidItem_ChangeCharname(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const struct FString& NewCharname);
	bool rfAckNotifyEndTutorial(int UserID, const struct FString& CharName, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckNotifyStartTutorial(int Result, int UserID);
	bool rfAckGetMyMailBoxState(int Result, unsigned char IsFull, int NewMailCount);
	bool rfAckRoomUserPingInfo(TArray<int> UnqueID, TArray<int> Ping, int HostPriorityPoint);
	bool rfAckSetLookForClan(int Result, const struct FString& ErrMsg, unsigned char IsLookingFor);
	bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, const struct FString& NewRoomTitle);
	bool rfAckRecvSystemMsg(unsigned char CommunityType, const struct FSystemMsgParam& MsgInfo);
	bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID);
	bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID);
	bool rfAckForceDisconnectUser_GM(int Result, const struct FString& ErrMsg, const struct FString& CharName);
	bool rfAckNotice_GM(int Result, const struct FString& ErrMsg, unsigned char NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const struct FString& Msg);
	bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, const struct FString& NewRoomTitle);
	bool rfReqExteriorRoomOwnerInfo(int RoomNum, const struct FString& OwnerName, const struct FString& OwnerIP);
	bool rfAckCharBlockInfo(int Result, const struct FBtrDouble& ChatBlockStartTime, const struct FBtrDouble& ChatBlockEndTime, TArray<struct FBtrDouble> BlockedItemIdx);
	bool rfAckQuestGetAvailableEventList(int Result, const struct FString& ErrMsg, TArray<int> QuestID);
	bool rfAckPaidItem_NotifyChangeClanMark(const struct FString& ClanName, int Pattern, int BG, int BL);
	bool rfAckPaidItem_ChangeClanMark(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_ClanMarkDupCheck(int Result, const struct FString& ErrMsg);
	bool rfAckWebzenBillingUseStorageItem(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID, const struct FBtrDouble& ItemExtra);
	bool rfAckPaidItem_RelayBroadcast(const struct FString& CharName, const struct FString& Msg);
	bool rfAckPaidItem_BroadCast(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_EraseRecord(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int Command, int RemainCount);
	bool rfAckWebzenBillingStorageListEnd();
	bool rfAckWebzenBillingStorageList(TArray<int> Seq, TArray<int> ItemSeq, TArray<int> GroupCode, TArray<int> ShareFlag, TArray<int> ProductSeq, TArray<struct FString> CashName, TArray<struct FBtrDouble> CashPoint, TArray<struct FString> SendAccountID, TArray<struct FString> SendMessage, TArray<unsigned char> ItemType, TArray<unsigned char> RelationType, TArray<int> ProductType, TArray<int> PriceSeq);
	bool rfAckWebzenBillingStorageListStart(int Result, const struct FString& ErrMsg, int TotalCount, int TotalPage, int CurPage);
	bool rfAckRandomBox_Use(int Result, const struct FString& ErrMsg, const struct FBtrDouble& RandomBoxItemIdx, int RandomBxoItemCount, const struct FBtrDouble& KeyItemIdx, int KeyItemRemainCount, TArray<int> ItemIDChoose, TArray<int> PartIDChoose, TArray<int> PeriodOnChoosenItem, TArray<int> StackCountOnChoosenItem, TArray<unsigned char> bHave, TArray<struct FBtrDouble> ItemIdx, TArray<struct FBtrDouble> UntilTime, TArray<int> StackCount);
	bool rfAckRegisterMainPCBang(int Result, const struct FString& ErrMsg);
	bool rfReqIsPaidWebzenPCBang(unsigned char IsPaid);
	bool rfAckPCBangUserListEnd();
	bool rfAckPCBangUserList(TArray<struct FString> FriendName, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> Level, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<unsigned char> IsLookForClan, TArray<unsigned char> IsCombat, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckPCBangUserListStart(int Result, int TotalCount);
	bool rfAckGiftItemByWebzenCash(int Result, const struct FString& ErrMsg, int LeftProductCount);
	bool rfAckBuyItemByWebzenCash(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, const struct FString& ErrMsg, TArray<int> MapNumArray, int VersusMode, const struct FString& WaitRoomName);
	bool rfAckGetBotID(int Result, unsigned char RequestedAFCount, unsigned char RequestedRSACount, TArray<int> AFBotID, TArray<int> RSABotID);
	bool rfAckRegisteredPCBangInfo(int Result, const struct FString& ErrMsg, unsigned char IsRegisteredPCBang, unsigned char IsMainPCBang, const struct FString& PCBangName);
	bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckWebzenCash(int Result, const struct FString& ErrMsg, const struct FBtrDouble& PCoinCash, const struct FBtrDouble& CCoinCash);
	bool rfAckCheckEquipedWeaponDurability(int Result, TArray<struct FBtrDouble> ItemUniqueID, TArray<int> ItemSlotNum);
	bool rfReqClanMatch_InviteCrewResult(const struct FString& Invitee, int Result);
	bool rfReqClanMatch_RecvInviteCrew(const struct FString& Inviter, const struct FString& ServerIP, int Port, int WaittingID, const struct FString& Msg, int MapNum, int InviteUserChannelNum, const struct FString& LeaderName, const struct FString& RoomName);
	bool rfAckClanMatch_InviteCrew(int Result, const struct FString& ErrMsg);
	bool rfReqDailyQuestNewAvailable(TArray<int> ExpiredQuestID, TArray<int> NewQuestID);
	bool rfReqQuestNewAvailable(TArray<int> AchivedQuestID, TArray<int> NewQuestID, TArray<unsigned char> IsDailyQuest, TArray<int> ExpiredQuest);
	bool rfAckQuestUpdate(int Result, const struct FString& ErrMsg);
	bool rfAckQuestListEnd();
	bool rfAckSpecialQuestRank(TArray<struct FString> CharList);
	bool rfAckReceiveSpecialReward(int Result, int RewardedQuestID, unsigned char RewardedQuestIsComplete, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount);
	bool rfAckDailyRewardListThisMonth(TArray<unsigned char> Type, TArray<unsigned char> Number, TArray<int> ItemID, TArray<int> ItemCount);
	bool rfAckPuzzleList(int Result, unsigned char IsComplete, TArray<unsigned char> UpdatedNum, TArray<unsigned char> StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfAckAttendanceList(int Result, unsigned char IsComplete, unsigned char UpdatedNum, TArray<unsigned char> StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfAckQuestList(TArray<int> QuestID, TArray<int> CountPrograss, TArray<unsigned char> IsDailyQuest, TArray<unsigned char> IsComplete);
	bool rfAckQuestListStart(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_SetWaitRoomPublic(int Result, const struct FString& ErrMsg, unsigned char Set);
	bool rfAckClanMatch_StopSearching();
	bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber);
	bool rfAckClanMatch_FoundMatch();
	bool rfAckClanMatch_NotifyStartSearching(int ShouldWaitMore);
	bool rfAckClanMatch_StartSearching(int Result, const struct FString& ErrMsg, int ShouldWaitMore);
	bool rfAckClanMatch_ChangeLeader(int Result, const struct FString& ErrMsg, int NewLeader, const struct FString& NewLeaderName);
	bool rfAckClanMatch_WaittingTeamList(int TtotlCount, TArray<int> Grade, TArray<int> Map, TArray<int> Versus);
	bool rfAckClanMatch_Chat(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& Msg);
	bool rfAckClanMatch_Leave(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_MemberList(TArray<unsigned char> IsLeader, TArray<int> ClanMarkPA, TArray<int> ClanMarkBG, TArray<int> ClanMarkBL, TArray<int> Level, TArray<struct FString> CharName, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<struct FString> ClanName, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckClanMatch_LeaveNotify(const struct FString& CharName);
	bool rfAckClanMatch_JoinNotify(unsigned char IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, const struct FString& CharName, int ClanGrade, int ClanWin, int ClanLose, const struct FString& ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckClanMatch_Join(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_NotifiyStartCombat(TArray<int> MapNumArray, int VersusMode);
	bool rfAckClanMatch_StartCombat(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_GetReady(int Result, const struct FString& ErrMsg, int RoomIndex);
	bool rfAckLimitedListInChannel(int Result, TArray<int> LimitedMapID, TArray<int> LimitedModeID);
	bool rfAckRecvInviteGameRoomResult(int Result);
	bool rfReqRecvInviteGameRoom(const struct FString& InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, const struct FString& RoomUniqueID, int RoomNumber, const struct FString& RoomName, unsigned char RoomState, const struct FString& MapName, const struct FString& OwnerName, unsigned char GameMode, unsigned char WeaponLimit, unsigned char IsTeamBalance, const struct FString& Password, const struct FString& InviteCharName);
	bool rfAckInviteGameRoom(int Result, unsigned char Answer, const struct FString& GuestCharName);
	bool rfAckAutoChangedTeamUserList(TArray<int> UserID, TArray<int> TeamNum);
	bool rfAckGetItemFromItemBox(int Result, const struct FString& ErrMsg, int ItemIDChoose, int PartIDChoose, const struct FBtrDouble& BoxItemIdx, int BxoItemCount, unsigned char bHave, const struct FBtrDouble& ItemIdx, const struct FBtrDouble& UntilTime, int StackCount);
	bool rfAckItemListInItemBox(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemUniqueID, int BoxItemID, TArray<int> ItemID, TArray<int> PartID, unsigned char FromContent);
	bool rfReqRecvForceFailedClientLoading(int ErrCode);
	bool rfAckStartHolePunching(int Result, const struct FString& ErrMsg, int GameType, int ReqStartUserID);
	bool rfAckRegisterMyUdpInfo(int Result, const struct FString& ErrMsg);
	bool rfAckNotifyMyCharInfoToRoomUser(int Result, const struct FString& ErrMsg, int UID, const struct FString& UserName, int Grade, int TeamNum, unsigned char Statue, unsigned char IsHost, const struct FString& UserIP, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, unsigned char IsLookFor);
	bool rfReqNotifyDisconnectHostInLoading(int Result, const struct FString& ErrMsg, int HostID);
	bool rfReqRecvForceDisconnected_FromGM(int Result, const struct FString& ErrMsg);
	bool rfReqRecvNotice_FromGM(int Result, const struct FString& ErrMsg, TArray<struct FString> NoticeMsg, unsigned char IsFromDB);
	bool rfAckJoinClan(int Result, const struct FString& ErrMsg, const struct FString& SpecificCharName, const struct FString& RealRecvCharName, unsigned char RealRecvCharClanGrade);
	bool rfAckExceedMaxUser();
	bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, TArray<int> UID, TArray<struct FString> CharName, TArray<int> UserLevel, TArray<struct FString> ClanName, TArray<int> ClanPattern, TArray<int> ClanBG, TArray<int> ClanBL, TArray<unsigned char> IsLookForClan, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfReqRecvDeleteFriend(int Result, const struct FString& FromCharName);
	bool rfAckDeleteFriend(int Result, TArray<struct FString> FailedCharname);
	bool rfAckChatWispher(int Result, const struct FString& ErrMsg, const struct FString& ToCharName);
	bool rfAckNotifyAdjustClanMemberGrade(const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfReqNotifyDurabilityZeroItem(int Result, const struct FString& ErrMsg, int UserID, TArray<struct FBtrDouble> ItemUniqueIDs, TArray<int> ItemIDs, TArray<int> ItemPartIDs, TArray<unsigned char> ItemSlotPos);
	bool rfAckAcquirePromotionItems(int UID, int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> ItemUniqueID, TArray<int> ItemIDs, TArray<int> PartIDs);
	bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, TArray<int> ItemID, TArray<int> PartID);
	bool rfAckBlockUserList(TArray<struct FString> CharName);
	bool rfAckRemoveBlockUserList(int Result, const struct FString& ErrMsg);
	bool rfAckBlockUserListEnd();
	bool rfAckAddBlockUserList(int Result, const struct FString& ErrMsg);
	bool rfAckBlockUserListStart(int Result, int TotalCount);
	bool rfAckAdjustClanMemberGrade(int Result, const struct FString& ErrMsg, const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfReqClanCharPersonelIntro(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckRecvJoinClanResult(int Result, const struct FString& ErrMsg);
	bool rfAckJoinClanResult(const struct FString& ClanName, unsigned char Permit, const struct FString& PermitCharName);
	bool rfAckNotifyClanSecession(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckNotifyNewClanMember(const struct FString& ClanName, const struct FString& CharName);
	bool rfReqRecvJoinClan(int UserIdx, const struct FString& CharName, const struct FString& Message);
	bool rfAckRecvClanInviteResult(int Result, const struct FString& ErrMsg);
	bool rfAckInviteClanResult(const struct FString& CharName, unsigned char Permit, const struct FString& ClanNm);
	bool rfAckInviteClan(int Result, const struct FString& ErrMsg);
	bool rfReqRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& ClanName, const struct FString& InviteMsg);
	bool rfAckGetIsHostBlocking(int Result, unsigned char Blocking);
	bool rfAckNotifyHostBlocking(int Result, unsigned char Blocking);
	bool rfAckGetHolePunchingResult(int Result, unsigned char Phrase, int InterventionUserID, unsigned char Intervention, TArray<int> FailedUserIDs);
	bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint);
	bool rfReqNotifyRelayServerAddr(const struct FString& RelayIP, int RelayPort);
	bool rfReqRecvForceDisconnectUDPFromHost(int Result);
	bool rfAckForceDisconnectUDPFromHost(int Result);
	bool rfReqNotifyChangeRoomState(unsigned char RoomState);
	bool rfAckClanCharPersonelIntro(int Result, const struct FString& ErrMsg, const struct FString& PersonelIntro);
	bool rfAckDBCharInfo(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FString& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckSearchClan(int Result, const struct FString& ErrMsg, int TotalPage, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<unsigned char> ClanMarkBL, TArray<struct FString> ClanName, TArray<struct FString> ClanMaster, TArray<int> ClanMember, TArray<int> ClanMemberMax, TArray<int> ClanCreateDate, TArray<int> ClanWin, TArray<int> ClanLose, TArray<int> ClanDraw, TArray<int> ClanRank, TArray<unsigned char> ClanRecruit, TArray<int> ClanLevel);
	bool rfAckClanPersonelIntro(int Result, const struct FString& ErrMsg);
	bool rfAckClanChangeInfo(int Result, const struct FString& ErrMsg);
	bool rfAckClanSecession(int Result, const struct FString& ErrMsg);
	bool rfAckClanClose(int Result, const struct FString& ErrMsg, const struct FString& ClanName);
	bool rfAckClanNews(TArray<struct FString> IssueDate, TArray<unsigned char> IssueType, TArray<struct FString> IssuedClanMember);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserList(int Result, const struct FString& ErrMsg, TArray<int> Level, TArray<struct FString> CharName, TArray<unsigned char> ClanGrade, TArray<int> ClanWinCnt, TArray<int> ClanLoseCnt, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> DudeId);
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfAckClanInfo(const struct FClanInfo& stClanInfo);
	bool rfAckDupCheckClanName(int Result, const struct FString& ErrMsg);
	bool rfAckCreateClan(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckGetServerTime(const struct FBtrDouble& ServerTime, const struct FString& ClientIP);
	bool rfAckMyMoney(int Result, const struct FString& ErrMsg, int Point, int Cash);
	bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, const struct FString& ErrMsg);
	bool rfAckNotifyExpiredSkillIDs(int UserID, TArray<struct FBtrDouble> ExpiredSkillUniqueIDs, TArray<int> ExpiredSkillIDs, int Result, const struct FString& ErrMsg, TArray<unsigned char> ExpiredSkillSlotPositions);
	bool rfAckNotifyExpiredItemIDs(int UserID, TArray<struct FBtrDouble> ExpiredItemUniqueIDs, TArray<int> ExpiredItemIDs, TArray<int> ExpiredItemPartIDs, TArray<unsigned char> ExpiredItemSlotPos, int Result, const struct FString& ErrMsg);
	bool rfAckGetAttachedItemFromMemo(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID);
	bool rfAckDeleteMailAll(int Result, unsigned char MailType, int Count);
	bool rfAckDelMemo(int Result, const struct FString& ErrMsg, TArray<int> FailedMemoID);
	bool rfAckSendMemo(TArray<struct FString> CnamesToFail, TArray<int> ResultArray);
	bool rfAckAuctionBidding(int Result, const struct FString& ErrMsg, int PointRemain);
	bool rfAckAuctionTradeHistory(int Result, const struct FString& ErrMsg, int ItemID, int PartID, TArray<struct FString> SellerCharNm, TArray<int> DamageDegree, TArray<int> Price);
	bool rfAckSendGift(int Result, const struct FString& ErrMsg, int PointRemain, int CashRemain);
	bool rfAckRecvMemo(const struct FString& cnameFrom, unsigned char MemoType);
	bool rfAckReadMemo(const struct FString& cnameFrom, const struct FString& Text, const struct FString& dateRecv, const struct FBtrDouble& ItemUID);
	bool rfAckEndMemoList();
	bool rfAckTestDouble(const struct FBtrDouble& vDouble, TArray<struct FBtrDouble> vDoubles);
	bool rfAckMemoList(TArray<int> MemoIdx, TArray<struct FString> cnameFrom, TArray<struct FString> dateRecv, TArray<struct FString> Text, TArray<unsigned char> Status, TArray<int> UntilExpire, TArray<struct FBtrDouble> ItemUID, TArray<int> ItemID, TArray<unsigned char> MsgType, TArray<int> ItemPartID);
	bool rfAckStartMemoList(int Result, const struct FString& ErrMsg, unsigned char Type, int TotalCount);
	bool rfAckFriendListEnd();
	bool rfAckFriendList(TArray<struct FString> FriendName, TArray<unsigned char> IsLogOn, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> LevelMarkID, TArray<int> ClanLevel, TArray<int> Level, TArray<unsigned char> IsLookForClan);
	bool rfAckFriendListStart(int Result, int TotalCount);
	bool rfReqCompleteFriendInvite(const struct FString& CharnameToBeInvited, unsigned char IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfReqRecvFriendInvite(int ReqUserID, const struct FString& ReqCharname, const struct FString& InviteMsg);
	bool rfAckSendFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfAckNotifyLoadingState(int Result, int UserID, unsigned char LoadingState);
	bool rfAckFailedStartGame(int Result, const struct FString& ErrMsg, unsigned char IsHost, int FailedUserID, int LoadingStep);
	bool rfAckSuccessStartGame(int Result, const struct FString& ErrMsg, unsigned char IsHost, const struct FString& HostIP, int HostPort, int LoadingStep);
	bool rfAckHash(int Result, const struct FString& Error);
	bool rfReqForceLogoutByOwner();
	bool ForceLogout_OnOK(class UGUIComponent* Sender);
	bool rfAckSellShopItemInfo(int Result, const struct FString& ErrMsg, const struct FBtrDouble& UniqueItemID, int SellPoint, int CurPoint, int AfterPoint);
	bool rfReqRecvChatWispher(const struct FString& CharnameFrom, const struct FString& Message);
	bool rfAckServerTime(int Time);
	bool rfAckGameOverEnd(int Result, const struct FString& ErrMsg);
	bool rfAckRepairItem(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, int RepairCost, TArray<int> DamageDegree);
	bool rfAckRepairCost(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, TArray<int> RepairCost);
	bool rfAckUpdateWeaponDurability(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, TArray<int> Durability, TArray<unsigned char> IsDestroy, TArray<struct FBtrDouble> FailedWeaponUniqueID);
	bool rfAckEntryQSlotUniqueIDList(int UserNum, TArray<unsigned char> QSlotDispOrder, TArray<struct FBtrDouble> MWUniqueID, TArray<struct FBtrDouble> PistolUniqueID, TArray<struct FBtrDouble> TW1UniqueID, TArray<struct FBtrDouble> TW2UniqueID);
	bool rfAckEntryQSlotIDList(int UserNum, TArray<unsigned char> QSlotDispOrder, TArray<int> MWItemID, TArray<int> MWPartID, TArray<int> MWPaintID, TArray<int> PistolItemID, TArray<int> PistolPartID, TArray<int> PistolPaintID, TArray<int> TWItemID1, TArray<int> TWItemID2, TArray<int> Skill1ID, TArray<int> Skill2ID, TArray<int> Skill3ID, TArray<int> Skill4ID);
	bool rfAckUpdateQSlot(int Result, const struct FString& ErrMsg);
	bool rfAckQSlotList(int Result, const struct FString& ErrMsg, TArray<int> QSlotID, TArray<struct FString> QSlotName, TArray<unsigned char> QSlotDispOrder, TArray<struct FBtrDouble> MWItemID, TArray<struct FBtrDouble> PistolItemID, TArray<struct FBtrDouble> TWItemID1, TArray<struct FBtrDouble> TWItemID2, TArray<int> Skill1, TArray<int> Skill2, TArray<int> Skill3, TArray<int> Skill4);
	bool rfAckModifyWeapon(int Result, const struct FString& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point, int Cash);
	bool rfAckSellShopItem(int Result, const struct FString& ErrMsg, int PointRemain, int CashRemain, int Count);
	bool rfAckBuyShopItem(int ItemCount, TArray<int> Result, TArray<int> BoughtItemTypeID, TArray<struct FBtrDouble> BoughtItemUniqueID, TArray<int> BoughtPartID, TArray<struct FBtrDouble> BoughtUntilTIme, TArray<int> BoughtStackCnt, int PointRemain, int CashRemain);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(TArray<int> ItemID);
	bool rfAckShopItemListStart(int Count);
	bool rfReqConfirmSkillChanged();
	bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, unsigned char ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, unsigned char ChangedOldSlotPosition, int Result, const struct FString& ErrMsg);
	bool rfAckEntrySkillList(TArray<int> UserIDs, TArray<int> SkillIDs, TArray<int> SlotPositions, int Result, const struct FString& ErrMsg);
	bool rfAckUserSkillListEnd();
	bool rfAckUserSkillList(TArray<int> UniqueSkillID, TArray<int> SkillID, TArray<struct FBtrDouble> UntilTime, TArray<unsigned char> SlotPosition);
	bool rfAckUserSkillListStart(int Count, int Result, const struct FString& ErrMsg);
	bool rfAckGetBootyChoose(int Result, const struct FString& ErrMsg, unsigned char GiveType, const struct FBtrDouble& ItemUniqueNumber, int ItemID, int PartID, unsigned char ItemType, const struct FBtrDouble& UntilTime, int StackCount, int PaintID);
	bool rfAckGetBooty(int Result, const struct FString& ErrMsg, TArray<int> PrizeWinUserID, TArray<int> BootyItemID, TArray<int> BootyPartsID);
	bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, const struct FString& ErrMsg);
	bool rfAckEntryItemList(TArray<int> UserIDs, TArray<int> ItemIDs, TArray<int> SlotPositions, TArray<int> AddPartsID, TArray<struct FBtrDouble> UniqueID, TArray<int> PaintID, int Result, const struct FString& ErrMsg);
	bool rfAckRegisterOtherUdpInfo(int UID, const struct FString& IP, int Port, unsigned char NatType, unsigned char Intervention, const struct FString& HostInnerIP, int HostInnerPort);
	bool rfReqForceNatTypeSetting(int NatType);
	bool rfReqStartNatDiag(const struct FString& Server1Addr, int Server1Port, const struct FString& Server2Addr, int Server2Port);
	bool rfAckChangeUserState(int Result, const struct FString& ErrMsg, TArray<int> UserIDs, TArray<unsigned char> Positions, TArray<int> Numbers, TArray<unsigned char> OldStates, TArray<unsigned char> NewStates);
	bool rfReqExteriorRoomState(int RoomNumber, unsigned char RoomState);
	bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount);
	bool rfReqExteriorRoomInfo(int SP, int RoomNumber, unsigned char IsPW, const struct FString& RoomName, const struct FString& MapName, const struct FString& ModeName, int MapNum, int ModeNum, unsigned char IsTeamBalance, int MaxUserCount, int RoomUserCount, unsigned char RoomState, unsigned char BotDifficult, unsigned char WeaponLimit, unsigned char BotModeUserTeamNum);
	bool rfAckCharInfo(int Result, const struct FString& ErrMsg, int UserID, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FCharInfo& stCharInfo, unsigned char InClanRank, int ClanLevel);
	bool rfAckConfirmItemChanged(int Result, const struct FString& ErrMsg);
	bool rfAckEquipItem(int ChangedNewItemID, const struct FBtrDouble& ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, const struct FBtrDouble& ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, const struct FString& ErrMsg);
	bool rfAckChangeRoomSetting(int Result, const struct FString& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfAckAIRewardResult(unsigned char ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, TArray<int> ScoreRewardUserID, TArray<unsigned char> ScoreRewardTYPE, TArray<int> ScoreRewardID, TArray<int> ScoreRewardCount);
	bool rfAckUpdateScore(TArray<int> UserIDs, TArray<struct FString> NickNames, TArray<unsigned char> TeamIDs, TArray<int> Scores, TArray<int> Kills, TArray<int> Assists, TArray<int> Deaths, TArray<int> EXPs, TArray<int> EXPBonuses, TArray<int> Points, TArray<int> PointBonuses, TArray<int> TeamScores, TArray<int> BonusOwnerID, TArray<int> BonusID);
	bool rfAckConnectGame(int UserID, int Result);
	bool rfAckChangeNewGuest(const struct FString& HostIP);
	bool rfAckChangeHost(unsigned char ClientNum);
	bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, const struct FString& ErrMsg);
	bool rfAckDisconnectGame(int Result, int DisconnectUserID, const struct FString& DisconnectUserName);
	bool rfReqRelayServerOff();
	bool rfReqRelayServerOn(const struct FString& RelayServerIP, int RelayServerPortNum);
	bool rfAckGameRoomInfo(int Result, const struct FString& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfAckGameOver(int UID, int GameRoomNumber, int Result, const struct FString& ErrMsg);
	bool rfAckChangeGameMode(int GameNum, int UID, const struct FString& GameMode, unsigned char GameModeNum, int Result, const struct FString& ErrMsg);
	bool rfAckSelectMap(int GameNum, int UID, const struct FString& MapName, int Result, const struct FString& ErrMsg);
	bool rfAckIsGameRoomPlaying(int GameRoomNum, unsigned char IsPlaying);
	bool rfAckGameRoomDestroy(int GameRoomNum);
	bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, const struct FString& ErrMsg);
	bool rfAckGameHostInfo(int GameNumber, const struct FString& UserID, const struct FString& IP, int Port, int Result, const struct FString& ErrMsg);
	bool rfAckChangeTeam(int GameNumber, const struct FString& UserID, int UID, int TeamNum, int Result, const struct FString& ErrMsg);
	bool rfAckCreateGameRoom(int Result, const struct FString& ErrMsg, int UserID, const struct FString& RoomOwnerIP, const struct FGameRoomInfo& NetRoomInfo);
	bool rfAckLeaveRoom(int Num, int UID, const struct FString& UserID, int Result, const struct FString& ErrMsg);
	bool rfAckRoomUserList(TArray<int> UID, TArray<struct FString> UserName, TArray<int> Grade, TArray<int> TeamNum, TArray<unsigned char> Statue, TArray<unsigned char> IsHost, TArray<struct FString> UserIP, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<unsigned char> IsLookingFor, TArray<int> GMUID, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, const struct FString& UserID, int TeamNum, int Grade, const struct FString& UserIP, const struct FString& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckChatClan(const struct FString& CharName, const struct FString& Message, int Result);
	bool rfAckChatNormal(int id, const struct FString& Sender, const struct FString& Message, int Result);
	bool rfAckRoomListEnd();
	bool rfAckRoomList(TArray<int> GameNum, TArray<struct FString> Title, TArray<struct FString> MapName, TArray<int> MapNum, TArray<unsigned char> UserCount, TArray<unsigned char> MaxCount, TArray<struct FString> ModeName, TArray<int> ModeNum, TArray<unsigned char> WeaponLimit, TArray<unsigned char> IsTeamBalance, TArray<unsigned char> Status, TArray<struct FString> RoomOwnerIP, TArray<int> GameMinute, TArray<struct FString> RoomOwnerName, TArray<unsigned char> IsSpecial, TArray<unsigned char> IsPassword, TArray<unsigned char> BotDifficult, TArray<unsigned char> BotModeUserTeamNum);
	bool rfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex);
	bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, TArray<int> UID, TArray<struct FString> UserID, TArray<int> UserLevels, TArray<struct FString> ClanName, TArray<int> ClanPattern, TArray<int> ClanBG, TArray<int> ClanBL, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<unsigned char> IsLookForClan, int Result, const struct FString& ErrMsg, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckLogin2(int Result, const struct FString& ErrMsg, int UserID, const struct FString& CharName, const struct FBtrDouble& CurServerTime, int CharDBID, unsigned char IsGM);
	bool rfAckLeaveChannel(int Result, const struct FString& UserID, int UID);
	bool rfAckEnterChannel(int id, int UID, const struct FString& UserID, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckChannelList(TArray<int> id, TArray<struct FString> Title, TArray<int> CurUser, TArray<int> MaxUser);
	bool rfAckAuctionInstantlyBuying(int Result, const struct FString& ErrMsg, int PointRemain);
	bool rfAckAuctionMyItemCancel(int Result, const struct FString& ErrMsg);
	bool rfAckAuctionItemListEnd(unsigned char Section);
	bool rfAckAuctionItemList(unsigned char Section, TArray<int> UniqueIDs, TArray<int> ItemIDs, TArray<int> AddPartsIDs, TArray<struct FBtrDouble> UntilTimes, TArray<int> BiddingPrices, TArray<int> InstantlyByuingPrices, TArray<int> ItemDamageds, TArray<struct FString> HighestBidderNames, TArray<struct FString> SellerNames, TArray<int> ItemCount);
	bool rfAckAuctionItemListStart(int Result, const struct FString& ErrMsg, unsigned char Section, int PageNum, int Count);
	bool rfAckAuctionItemListCount(int Result, const struct FString& ErrMsg, unsigned char Section, unsigned char Classfy, int ItemType, int ItemGrade, int Count);
	bool rfAckAuctionMyItemRegister(int Result, const struct FString& ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain);
	bool rfAckItemListEnd();
	bool rfAckItemList(TArray<struct FBtrDouble> UniqueID, TArray<int> ItemID, TArray<int> ItemType, TArray<int> Durability, TArray<struct FBtrDouble> UntilTime, TArray<int> SlotPosition, TArray<int> AddPartsID, TArray<int> DamageDegree, TArray<unsigned char> ItemState, TArray<int> StackCount, TArray<int> PaintID, TArray<int> TradeCount);
	bool rfAckItemListStart(int Count, int Result, const struct FString& ErrMsg);
	bool rfAckLogin(int Result, const struct FString& ErrMsg, int UserID, const struct FString& CharName, const struct FString& ClanName, const struct FCharInfo& btCharInfo);
	bool sfAckClanMatch_RecvInviteCrew(int Result, const struct FString& Inviter);
	bool sfAckRecvInviteGameRoom(const struct FString& RoomUniqueID, int RoomNumber, unsigned char Answer, const struct FString& InviteCharName);
	bool sfAckRecvJoinClan(int UserIdx, const struct FString& CharName, const struct FString& ReqMsg, unsigned char Permit);
	bool sfAckRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& InviterMsg, const struct FString& ClanName, unsigned char Permit);
	bool sfAckStartNatDiag(int NatType);
	bool sfReqMyEquipedQSlotList();
	bool sfReqMyEquipedSkillList();
	bool sfReqMyEquipedItemList();
	bool sfReqGetMyMailBoxState();
	bool sfReqSetLookForClan(unsigned char IsLookingFor);
	bool sfReqExteriorRoomOwnerInfo(int RoomNum, const struct FString& OwnerName, const struct FString& OwnerIP);
	bool sfReqClanMatch_SetWaitRoomPublic(unsigned char Set);
	bool sfReqRemoveCheckTeamBalanceList();
	bool sfReqPaidItem_ChangeClanMark(const struct FBtrDouble& ItemIdx, unsigned char IsPaid, int Pattern, int BG, int BL);
	bool sfReqPaidItem_ClanMarkDupCheck(unsigned char IsPaid, int Pattern, int BG, int BL);
	bool sfReqPaidItem_BroadCast(const struct FBtrDouble& ItemIdx, int Command, const struct FString& Message);
	bool sfReqPaidItem_EraseRecord(const struct FBtrDouble& ItemIdx, int Command);
	bool sfReqSendSystemMsg(unsigned char RecvType, const struct FString& SendCharName, const struct FString& RecvCharname, const struct FSystemMsgParam& MsgInfo);
	bool sfReqRandomBox_Use(const struct FBtrDouble& ItemIdx, const struct FBtrDouble& ItemIdx_Key);
	bool sfReqChangeRoomTitle_GM(int RoomNumber, const struct FString& NewRoomTitle);
	bool sfReqQuestGetAvailableEventList();
	bool sfReqCharBlockInfo();
	bool sfReqIsPaidWebzenPCBang(unsigned char IsPaid);
	bool sfReqClanMatch_GetClanWaittingRoomInfo();
	bool sfReqReturnBotID(TArray<int> BotID);
	bool sfReqGetBotID(unsigned char AFCount, unsigned char RSACount);
	bool sfReqClanMatch_ChangeRoomSetting(int WaitRoomIndex, TArray<int> MapNumArray, int VersusMode, unsigned char IsPublic);
	bool sfReqParamCheckSum(const struct FString& key, const struct FString& Value);
	bool sfReqWebzenBillingUseStorageItem(int StorageSeq, int StorageItemSeq, unsigned char StorageItemType);
	bool sfReqWebzenBillingStorageList(int Page, int CountForPage, unsigned char Type);
	bool sfReqGiftItemByWebzenCash(const struct FString& ReceiverCharName, const struct FString& Message, int PackageProductSeq, int PriceSeq, int ProductDisplaySeq);
	bool sfReqBuyItemByWebzenCash(int PackageProductSeq, int ProductDisplaySeq, int PriceSeq, TArray<int> ItemIDs, const struct FBtrDouble& ItemUniqueID, unsigned char BuyOption1, unsigned char BuyOption2);
	bool sfReqWebzenShopScriptVersion();
	bool sfReqWebzenCash();
	bool sfReqRegisteredPCBangInfo();
	bool sfReqRegisterMainPCBang();
	bool sfReqPCBangUserList();
	bool sfReqDailyQuestNewAvailable(TArray<int> ExpiredQuestID, TArray<int> NewQuestID);
	bool sfReqQuestNewAvailable(TArray<int> AchivedQuestID, TArray<int> NewQuestID, TArray<unsigned char> IsDailyQuest, TArray<int> ExpiredQuest);
	bool sfReqQuestUpdate(int UniqueID, int GameRoomNum, TArray<int> QuestID, TArray<int> CountPrograss);
	bool sfReqQuestList();
	bool sfReqPermanentRoomInfo(int RoomNum);
	bool sfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber);
	bool sfReqClanMatch_StartSearching(int RequestCount);
	bool sfReqLimitedListInChannel();
	bool sfReqRecvInviteGameRoom(const struct FString& InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, const struct FString& RoomUniqueID, int RoomNumber, const struct FString& RoomName, unsigned char RoomState, const struct FString& MapName, const struct FString& OwnerName, unsigned char GameMode, unsigned char WeaponLimit, unsigned char IsTeamBalance, const struct FString& Password, const struct FString& InviteCharName);
	bool sfReqInviteGameRoom(const struct FString& GuestCharName);
	bool sfReqClanMatch_StopSearching();
	bool sfReqClanMatch_ChangeLeader(int WaitRoomIdx, int NewLeaderID, const struct FString& NewLeaderName);
	bool sfReqClanMatch_WaittingTeamList(int StartIndex, int ReturnCount);
	bool sfReqClanMatch_Chat(const struct FString& Msg);
	bool sfReqClanMatch_Leave(int WaittingID);
	bool sfReqClanMatch_MemberList();
	bool sfReqClanMatch_Join(int WaittingID);
	bool sfReqClanMatch_InviteCrewResult(const struct FString& Invitee, int Result);
	bool sfReqClanMatch_RecvInviteCrew(const struct FString& Inviter, const struct FString& ServerIP, int Port, int WaittingID, const struct FString& Msg, int MapNum, int InviteUserChannelNum, const struct FString& LeaderName, const struct FString& RoomName);
	bool sfReqClanMatch_InviteCrew(const struct FString& Invitee);
	bool sfReqClanMatch_StartCombat(TArray<int> MapNumArray, int VersusMode);
	bool sfReqClanMatch_GetReady();
	bool sfReqGetItemFromItemBox(const struct FBtrDouble& ItemUniqueID, int ItemID, int ItemIDChoose, int PartIDChoose);
	bool sfReqItemListInItemBox(const struct FBtrDouble& ItemUniqueID, int BoxItemID, unsigned char FromContent);
	bool sfReqRecvForceFailedClientLoading(int ErrCode);
	bool sfReqForceFailedClientLoading(int FailedUserID, int ErrCode);
	bool sfReqStartHolePunching(int GameType, int ReqStartUserID);
	bool sfReqNotifyMyCharInfoToRoomUser();
	bool sfReqNotifyDurabilityZeroItem(int Result, const struct FString& ErrMsg, int UserID, TArray<struct FBtrDouble> ItemUniqueIDs, TArray<int> ItemIDs, TArray<int> ItemPartIDs, TArray<unsigned char> ItemSlotPos);
	bool sfReqChatWispherMyCommunity(const struct FString& SourceCharName, const struct FString& SenderName, const struct FString& Msg);
	bool sfReqNotifyDisconnectHostInLoading(int Result, const struct FString& ErrMsg, int HostID);
	bool sfReqRecvForceDisconnected_FromGM(int Result, const struct FString& ErrMsg);
	bool sfReqForceDisconnectUser_GM(const struct FString& CharName);
	bool sfReqRecvNotice_FromGM(int Result, const struct FString& ErrMsg, TArray<struct FString> NoticeMsg, unsigned char IsFromDB);
	bool sfReqNotice_GM(unsigned char NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const struct FString& Msg);
	bool sfReqSpecificChannelUserInfo(int UserID);
	bool sfReqSpecificGameRoomInfo(int RoomNum);
	bool sfReqChannelUserListInGameRoom(int ChannelNum, int StartIndex, int Count);
	bool sfReqRecvDeleteFriend(int Result, const struct FString& FromCharName);
	bool sfReqDeleteFriend(TArray<struct FString> DeleteCharName);
	bool sfReqGameGuardAuthData(int AuthDataIndex, int AuthDataVal1, int AuthDataVal2, int AuthDataVal3);
	bool sfReqCheckEquipedWeaponDurability();
	bool sfReqGamePlay_GetChopper(int GetChopperUID, TArray<int> GetChopperAssistUID, float KillXCoord, float KillYCoord, float KillZCoord, int KillPos, int KillWeaponID, int KillWeaponPartID, int KillRange, int KillDamage, int ChopperCallerID, const struct FString& ChopperCallerName, float ChopperXCoord, float ChopperYCoord, float ChopperZCoord);
	bool sfReqIsAvailClanURL(const struct FString& ClanURL);
	bool sfReqGetIsHostBlocking();
	bool sfReqNotifyHostBlocking(unsigned char Blocking);
	bool sfReqGetHolePunchingResult();
	bool sfReqNotifyRecvDummyForHolePunching(int ClientUserID, unsigned char Phrase);
	bool sfReqGamePlay_ChangeWeaponSet(int UID, int SetNumber);
	bool sfReqGamePlay_UpdateDomScore(int AFScore, int RSAScore);
	bool sfReqNotifyRelayServerAddr(const struct FString& RelayIP, int RelayPort);
	bool sfReqGetUserHostPriorityPoint(int UserID);
	bool sfReqUpdateMyHostPriorityPoint(int HostPriorityPoint);
	bool sfReqWriteServerLog(unsigned char Destination, const struct FString& LogMsg);
	bool sfReqGamePlay_SetRoundStartTime(TArray<int> UID);
	bool sfReqGamePlay_SetGameStartTime(TArray<int> UID);
	bool sfReqRecvForceDisconnectUDPFromHost(int Result);
	bool sfReqForceDisconnectUDPFromHost(int UserID);
	bool sfReqGamePlay_TakeAPoint(TArray<int> TakerUID, unsigned char TakePos, TArray<float> TakerXCoord, TArray<float> TakerYCoord, TArray<float> TakerZCoord, TArray<int> TakerPos, TArray<int> TakerWeaponID, TArray<int> TakerWeaponPartID, TArray<int> TakerRange);
	bool sfReqNotifyChangeRoomState(unsigned char RoomState);
	bool sfReqGamePlay_DefuseBomb(int DefuserUID, unsigned char DefusePos, float DefuserXCoord, float DefuserYCoord, float DefuserZCoord, int DefuserPos, int DefuserWeaponID, int DefuserWeaponPartID, int DefuserRange);
	bool sfReqGamePlay_InstallBomb(int InstallerUID, unsigned char InstallPos, float InstallerXCoord, float InstallerYCoord, float InstallerZCoord, int InstallerPos, int InstallerWeaponID, int InstallerWeaponPartID, int InstallerRange);
	bool sfReqDBCharInfo(const struct FString& CharName);
	bool sfReqForceNatTypeSetting(int NatType);
	bool sfReqGetServerTime();
	bool sfReqLogEndEachRound(int StartCnt, int EndCnt, int RoundEndType, int RoundEndTime, unsigned char VTeam, unsigned char VTeamAD, int AFScore, int RSAScore, int Round);
	bool sfReqLogGetScore(const struct FKillDeathLog& KillDeathLogParam, TArray<int> AssistUIDs, TArray<unsigned char> AssistScores);
	bool sfReqAuctionTradeHistory(int ItemID, int PartID);
	bool sfReqSendGift(int ItemID, const struct FString& RecvCharname, const struct FString& RecvMessage, unsigned char BuyOption1, unsigned char BuyOption2);
	bool sfReqGetAttachedItemFromMemo(int UserID, int MemoIdx, int ItemID);
	bool sfReqChatClan(const struct FString& Message);
	bool sfReqTestDouble(const struct FBtrDouble& vDouble, TArray<struct FBtrDouble> vDoubles);
	bool sfReqNotifyLoadingState(unsigned char LoadingState);
	bool sfReqFailedStartGame(int LoadingStep);
	bool sfReqSuccessStartGame(int LoadingStep);
	bool sfReqClanCharPersonelIntro(const struct FString& ClanName, const struct FString& CharName);
	bool sfReqClanPersonelIntro(const struct FString& ClanName, const struct FString& CharName, const struct FString& PersonelIntro);
	bool sfReqClanChangeInfo(const struct FString& ClanName, unsigned char IsRecruit, unsigned char Region, const struct FString& Keyword, const struct FString& ClanIntro, const struct FString& Notice);
	bool sfReqClanClose(const struct FString& ClanName);
	bool sfReqClanSecession(const struct FString& ClanName);
	bool sfReqClanNews(const struct FString& ClanName);
	bool sfReqAdjustClanMemberGrade(const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool sfReqClanUserList(const struct FString& ClanName);
	bool sfReqSerachClan(unsigned char SearchType, const struct FString& Keyword, unsigned char ClanStatus, unsigned char ClanRegion, int ReqPage);
	bool sfReqRecvJoinClan(int UserIdx, const struct FString& CharName, const struct FString& Message);
	bool sfReqJoinClan(const struct FString& ClanName, const struct FString& ClanManagerName, const struct FString& Message);
	bool sfReqRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& ClanName, const struct FString& InviteMsg);
	bool sfReqInviteClan(const struct FString& CharName, const struct FString& InviteMsg);
	bool sfReqClanInfo(const struct FString& ClanName);
	bool sfReqCreateClan(const struct FString& ClanName, const struct FString& ClanURL, const struct FString& ClanIntro, const struct FString& ClanKeyword, unsigned char ClanRegion);
	bool sfReqDupCheckClanName(const struct FString& ClanNam);
	bool sfReqSellShopItemInfo(const struct FBtrDouble& UniqueItemID, int Count);
	bool sfReqGameOverEnd();
	bool sfReqAuctionItemListCount(unsigned char Section, unsigned char Classfy, int ItemType, int ItemGrade);
	bool sfReqServerTime();
	bool sfReqEntryQSlotIDList(int UserNum);
	bool sfReqEntryQSlotUniqueIDList(int UserNum);
	bool sfReqAuctionBidding(int UniqueID, int BiddingPrice);
	bool sfReqAuctionInstantlyBuying(int UniqueID);
	bool sfReqAuctionItemList(unsigned char Section, const struct FString& Keyword, int ItemRank, unsigned char ItemClassfy, unsigned char IsAvailable, int PageNum, int Count, int SortOpt);
	bool sfReqAuctionMyItemCancel(int UniqueID);
	bool sfReqAuctionMyItemRegister(const struct FBtrDouble& UniqueID, int ItemCount, int BeginPrice, int PeriodHour, int InstantlyBuyingPrice);
	bool sfReqMyMoney();
	bool sfReqUpdateQSlot(int QSlotID, const struct FString& QSlotName, const struct FBtrDouble& MWItemID, const struct FBtrDouble& PistolItemID, const struct FBtrDouble& TWItemID1, const struct FBtrDouble& TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4);
	bool sfReqQSlotList();
	bool sfReqRepairItem(TArray<struct FBtrDouble> UniqueItemcID);
	bool sfReqRepairCost(TArray<struct FBtrDouble> UniqueItemID);
	bool sfReqUpdateWeaponDurability(int TotalPlayTime, TArray<int> OwnerID, TArray<int> Number, TArray<struct FBtrDouble> UniqueItemID, TArray<int> UsingSec, TArray<int> UsingRoundInSD);
	bool sfReqModifyWeapon(const struct FBtrDouble& UniqueID, int AddPartID, int PaintID);
	bool sfReqSellShopItem(const struct FBtrDouble& ItemUniqueID, int Count);
	bool sfReqBuyShopItem(int ItemID, const struct FBtrDouble& ItemUniqueID, unsigned char BuyOption1, unsigned char BuyOption2);
	bool sfReqShopItemList();
	bool sfReqForceGameOver();
	bool sfReqGiveSkill();
	bool sfReqNotifyExpiredItemIDs();
	bool sfReqNotifyExpiredSkillIDs();
	bool sfReqNotifyChangedSkillState();
	bool sfReqNotifyChangedItemState();
	bool sfReqConfirmSkillChanged();
	bool sfReqEquipSkill(int SkillID, int SkillUniqueID, unsigned char NewSlotPosition);
	bool sfReqUserSkillList(int UserID);
	bool sfReqDelMemo(TArray<int> MemoIdx, unsigned char Type);
	bool sfReqReadMemo(int MemoIdx);
	bool sfReqMemoList(unsigned char Type, unsigned char MemoType);
	bool sfReqRecvMemo(const struct FString& cnameFrom, unsigned char MemoType);
	bool sfReqSendMemo(TArray<struct FString> cnames, const struct FString& Msg, int ItemUID);
	bool sfReqRecvChatWispher(const struct FString& CharnameFrom, const struct FString& Message);
	bool sfReqChatWispher(const struct FString& CharName, const struct FString& Message);
	bool sfReqRemoveBlockUserList(const struct FString& CharName);
	bool sfReqAddBlockUserList(const struct FString& CharName);
	bool sfReqBlockUserList();
	bool sfReqCompleteFriendInvite(const struct FString& CharnameToBeInvited, unsigned char IsPermit);
	bool sfReqConfirmFriendInvite(int ReqUserID, const struct FString& ReqedCharname, unsigned char IsPermit);
	bool sfReqRecvFriendInvite(int ReqUserID, const struct FString& ReqCharname, const struct FString& InviteMsg);
	bool sfReqSendFriendInvite(int InviteUserID, const struct FString& InviteName, const struct FString& InviteMsg);
	bool sfReqChatNormal(const struct FString& Message);
	bool sfReqDummy(int DelayCheck);
	bool sfReqConfirmItemChanged();
	bool sfReqEquipItem(int ItemID, const struct FBtrDouble& UniqueID, int SlotPosition);
	bool sfReqItemList(int UID);
	bool sfReqEntrySkillList(int UserID);
	bool sfReqEntryItemList(int UserID);
	bool sfReqChangeUserState(unsigned char NewState, unsigned char CheckPlaying);
	bool sfReqExteriorRoomState(int RoomNumber, unsigned char RoomState);
	bool sfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount);
	bool sfReqExteriorRoomInfo(int SP, int RoomNumber, unsigned char IsPW, const struct FString& RoomName, const struct FString& MapName, const struct FString& ModeName, int MapNum, int ModeNum, unsigned char IsTeamBalance, int MaxUserCount, int RoomUserCount, unsigned char RoomState, unsigned char BotDifficult, unsigned char WeaponLimit, unsigned char BotModeUserTeamNum);
	bool sfReqGetBooty(int RoomNumber);
	bool sfReqSetUserBootySeedValue(int UserID, int SeedValue);
	bool sfReqChangeRoomSetting(const struct FGameRoomInfo& RoomInfo);
	bool sfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, TArray<int> ItemID, TArray<int> PartID);
	bool sfReqClientUdpInfoList(int GameNum);
	bool sfReqRegisterMyUdpInfo(unsigned char IsHost, const struct FString& IP, int Port, unsigned char Intervention, const struct FString& HostInnerIP, int HostInnerPort);
	bool sfReqNotifyClientJoinTime(int JoinedClientID);
	bool sfReqDisconnectGame();
	bool sfReqConnectGame();
	bool sfReqRelayServerOff();
	bool sfReqRelayServerOn(const struct FString& RelayServerIP, int RelayServerPortNum);
	bool sfReqGameOver(int UID, int GameRoomNumber);
	bool sfReqIsGameRoomPlaying(int GameRoomNum);
	bool sfReqChangeRoomMaxNum(int GameNum, int UID, int Number, int TeamNum);
	bool sfReqUpdateScore(int GameNumber, TArray<int> UserIDs, TArray<int> Kills, TArray<int> Assists, TArray<int> Deaths, TArray<int> EXPs, TArray<int> Points, TArray<int> Scores, TArray<int> TeamScores, TArray<int> RoundJoin, TArray<int> TimeJoin, int Playtime, unsigned char GameEndType, TArray<struct FString> UserNames, unsigned char IsAIClear);
	bool sfReqStartGame(int GameNumber);
	bool sfReqGameHostInfo(int GameNumber);
	bool sfReqIsHostAvailable(const struct FString& MyIp, int CPUGrade, int RamGrade, int VGAGrade, int VGARam);
	bool sfReqChangeTeam(int TeamNum);
	bool sfReqChangeRoomOwner(int GameNum, int UID, int NewOwner);
	bool sfReqChangeGameMode(int GameNum, int UID, const struct FString& GameMode, unsigned char GameModeNum);
	bool sfReqBanUser(int GameNum, int UID, int BanUID);
	bool sfReqSelectMap(int GameNum, int UID, const struct FString& MapName);
	bool sfReqGameRoomInfo(int GameNum, int UID);
	bool sfReqCreateGameRoom(const struct FGameRoomInfo& NetRoomInfo);
	bool sfReqLeaveRoom(int Num);
	bool sfReqRoomUserList(int GameNum);
	bool sfReqEnterRoom(int GameNum, const struct FString& Password, unsigned char RoomEnterType);
	bool sfReqRoomList(int id, int StartIndex, int Count);
	bool sfReqChannelUserList(int id, int StartIndex, int Count);
	bool sfReqLeaveChannel(int id);
	bool sfReqEnterChannel(int id);
	bool sfReqChannelList(int bChannelType);
	bool sfReqFriendList();
	bool sfReqCharInfo();
	bool sfReqLogin2(const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, const struct FString& Guid, int UserType);
	bool sfReqStartNatDiag(const struct FString& Server1Addr, int Server1Port, const struct FString& Server2Addr, int Server2Port);
	bool sfReqForceLogoutByOwner();
	bool sfReqLogin(const struct FString& id);
	bool sfReqHash(int HashField0, int HashField1, int HashField2, int HashField3);
	bool rfAckMyEquipedQSlotList(TArray<unsigned char> QSlotDispOrder, TArray<struct FBtrDouble> MWUniqueID, TArray<int> MWItemID, TArray<int> MWPartID, TArray<int> MWPaintID, TArray<struct FBtrDouble> PistolUniqueID, TArray<int> PistolItemID, TArray<int> PistolPartID, TArray<int> PistolPaintID, TArray<struct FBtrDouble> TW1UniqueID, TArray<int> TWItemID1, TArray<struct FBtrDouble> TW2UniqueID, TArray<int> TWItemID2, TArray<int> Skill1ID, TArray<int> Skill2ID, TArray<int> Skill3ID, TArray<int> Skill4ID, int Result);
	bool rfAckMyEquipedSkillList(TArray<int> SkillIDs, TArray<int> SlotPositions, int Result);
	bool rfAckMyEquipedItemList(TArray<int> ItemIDs, TArray<int> SlotPositions, TArray<int> AddPartsID, TArray<int> PaintID, TArray<struct FBtrDouble> UniqueID, int Result);
	void endTutorial();
	void OnPageRoomLobbyInited();
	void BeginTutorialCreateRoom();
	void SetupTutorialRoomInfo(const struct FString& MapName);
	void BeginTutorial(const struct FString& MapName);
	void OnReqSuccessStartGame(int Step);
	void OnError(int ErrCode);
	void OnClose(int ErrCode);
	void OnConnect(int ErrCode);
	void Created();
	bool Close();
	bool ConnectDomain(const struct FString& domain, int nPort);
	bool Connect(const struct FString& sIpaddr, int nPort);
	bool InitNetwork();
};


// Class GUIWarfare.BTPageLogo
// 0x003C (0x0484 - 0x0448)
class UBTPageLogo : public UBTNetGUIPage
{
public:
	unsigned long                                      bSaveConnectLoginServer : 1;                              // 0x0448(0x0004)
	unsigned char                                      SaveNeedChar;                                             // 0x044C(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x044D(0x0003) MISSED OFFSET
	int                                                LogoState;                                                // 0x0450(0x0004)
	TArray<struct FImage>                              LogoImg;                                                  // 0x0454(0x000C) (NeedCtorLink)
	class UBTOwnerDrawImageHK*                         Background;                                               // 0x0460(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelLogo;                                                // 0x0464(0x0004) (ExportObject, NeedCtorLink, EditInline)
	float                                              Degree;                                                   // 0x0468(0x0004)
	float                                              TimeFade;                                                 // 0x046C(0x0004)
	float                                              TimeDelay;                                                // 0x0470(0x0004)
	unsigned long                                      bFirstRender : 1;                                         // 0x0474(0x0004)
	class ABTROModelNew*                               CharacterModel;                                           // 0x0478(0x0004)
	int                                                EventNotifyType;                                          // 0x047C(0x0004)
	unsigned long                                      bShowNotice : 1;                                          // 0x0480(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageLogo");
		return ptr;
	}


	void ShowNotify();
	bool rfAckEventNotify(int Type);
	bool rfAckClientChecksum(int Result);
	bool rfAckClientChallenge(const struct FString& Key1, const struct FBtrDouble& Key2);
	bool Internal_OnPreDraw(class UCanvas* C);
	bool rfAckProcessPreLoginUser(int Result, const struct FString& ErrMsg);
	bool rfAckLoginInHouseTest(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg, const struct FString& BDay, unsigned char Sex, const struct FBtrDouble& ServerTime);
	bool Exit_OnOK(class UGUIComponent* Sender);
	bool ForceDisconnect_OnOK(class UGUIComponent* Sender);
	bool rfAckLoginWithIndonesia(int Result);
	bool rfAckLoginWithGlobal(int Result);
	bool rfAckLoginWithThailand(int Result);
	bool rfAckLoginWithWZAuth(int Result, unsigned char wzp_AccountType, unsigned char wzp_IsBlock, unsigned char wzp_AuthKeySuccess, unsigned char ChannelType);
	bool rfAckLoginWithTencentAuth(int Result, unsigned char tc_AccountType, unsigned char tc_IsBlock);
	bool Exit_OnClick(class UGUIComponent* Sender);
	bool Internal_KeyEvent(float Delta, unsigned char* key, unsigned char* Action);
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
// 0x00D4 (0x06D0 - 0x05FC)
class UBTPageLogin : public UBTNetGUIPageHK
{
public:
	struct FFloatBox                                   fbButtonLogin;                                            // 0x05FC(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonLogin;                                              // 0x060C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonBattery;                                          // 0x0610(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonBattery;                                            // 0x0620(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonQuit;                                             // 0x0624(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonQuit;                                               // 0x0634(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbEditID;                                                 // 0x0638(0x0010)
	class UBTEditBoxHK*                                EditID;                                                   // 0x0648(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbEditPW;                                                 // 0x064C(0x0010)
	class UBTEditPWHK*                                 EditPW;                                                   // 0x065C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbComboTest;                                              // 0x0660(0x0010)
	class UBTComboBoxHK*                               ComboTest;                                                // 0x0670(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                RequestProcessPreLoginCount;                              // 0x0674(0x0004)
	int                                                MaxRequestProcessPreLogin;                                // 0x0678(0x0004)
	struct FString                                     MessageUserWithSameIDConnected;                           // 0x067C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MessageNoID;                                              // 0x0688(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MessageWrongPWD;                                          // 0x0694(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MessageTypedNoPWD;                                        // 0x06A0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     CaptionLogin;                                             // 0x06AC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     CaptionQuit;                                              // 0x06B8(0x000C) (Localized, NeedCtorLink)
	class UBTLabelTestHK2*                             ClanMark;                                                 // 0x06C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonFontTest;                                           // 0x06C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTSliderHK*                                 slider;                                                   // 0x06CC(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageLogin");
		return ptr;
	}


	bool rfAckLoginWithIndonesia(int Result);
	bool rfAckLoginWithGlobal(int Result);
	bool rfAckLoginWithThailand(int Result);
	bool rfAckLoginWithWZAuth(int Result, unsigned char wzp_AccountType, unsigned char wzp_IsBlock, unsigned char wzp_AuthKeySuccess, unsigned char ChannelType);
	bool rfAckLoginWithTencentAuth(int Result, unsigned char tc_AccountType, unsigned char tc_IsBlock);
	bool rfAckCreateChar(int Success, const struct FString& ErrMsg);
	bool Disconnect_OnCancel(class UGUIComponent* Sender);
	bool Disconnect_OnOK(class UGUIComponent* Sender);
	void RequestProcessPreLoginUser();
	bool rfAckProcessPreLoginUser(int Result, const struct FString& ErrMsg);
	bool rfAckLoginInHouseTest(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg, const struct FString& BDay, unsigned char Sex, const struct FBtrDouble& ServerTime);
	bool rfAckLogin(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg);
	bool ButtionSettings_OnClick(class UGUIComponent* Sender);
	bool ButtonQuit_OnClick(class UGUIComponent* Sender);
	bool ButtonLogin_Ver1_OnClick(class UGUIComponent* Sender);
	bool ButtonLogin_OnClick(class UGUIComponent* Sender);
	bool SendLogin_Ver1();
	void Quit();
	bool internalKeyEvent(float Delta, unsigned char* key, unsigned char* Action);
	void Opened(class UGUIComponent* Sender);
	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
	class UBTTcpLink_Login* GetTcpLogin();
	bool Edit_OnEnter(class UGUIComponent* Sender, const struct FString& txt);
	bool ButtonFontTest_OnClick(class UGUIComponent* Sender);
	void Internal_OnRendered(class UCanvas* C);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfare.BTPageCharacterCreation
// 0x01A0 (0x079C - 0x05FC)
class UBTPageCharacterCreation : public UBTNetGUIPageHK
{
public:
	class UBTTPTopMenuSCHK*                            TPTopMenu;                                                // 0x05FC(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTModelHK*                                  UIModel;                                                  // 0x0600(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class ABTROModelNew*                               CharacterModel;                                           // 0x0604(0x0004)
	struct FFloatBox                                   fbModelBG;                                                // 0x0608(0x0010)
	struct FFloatBox                                   fbUIModel;                                                // 0x0618(0x0010)
	struct FFloatBox                                   fbButtonLR;                                               // 0x0628(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbButtonRR;                                               // 0x0638(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonLR;                                                 // 0x0648(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRR;                                                 // 0x064C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	unsigned long                                      bRRMousePressed : 1;                                      // 0x0650(0x0004)
	unsigned long                                      bLRMousePressed : 1;                                      // 0x0650(0x0004)
	class UBTOwnerDrawImageHK*                         BackgroundDeco;                                           // 0x0654(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FImage                                      CharacterCreationBgDeco;                                  // 0x0658(0x0020)
	struct FFloatBox                                   fbBGDeco;                                                 // 0x0678(0x0010)
	struct FFloatBox                                   fbButtonConfirm;                                          // 0x0688(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FString                                     strButtonConfirm;                                         // 0x0698(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonConfirm;                                            // 0x06A4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     strEditNickName;                                          // 0x06A8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strLabelNickName;                                         // 0x06B4(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbEditNickName;                                           // 0x06C0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelNickName;                                          // 0x06D0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTEditBoxHK*                                EditNickName;                                             // 0x06E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelNickName;                                            // 0x06E4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbAFTeamBtn;                                              // 0x06E8(0x0010)
	struct FFloatBox                                   fbRSATeamBtn;                                             // 0x06F8(0x0010)
	struct FString                                     strAF;                                                    // 0x0708(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strRSA;                                                   // 0x0714(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonAF;                                                 // 0x0720(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRSA;                                                // 0x0724(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FImage                                      NickNameDeco;                                             // 0x0728(0x0020)
	class UBTRODecorateStringHK*                       NickNameToolTip;                                          // 0x0748(0x0004)
	struct FFloatBox                                   fbToolTip;                                                // 0x074C(0x0010)
	struct FString                                     strNickNameToolTip;                                       // 0x075C(0x000C) (Localized, NeedCtorLink)
	class UwGameManager*                               GameMgr;                                                  // 0x0768(0x0004)
	struct FString                                     strErrorList[0x3];                                        // 0x076C(0x000C) (Localized, NeedCtorLink)
	unsigned long                                      bVisibleAFModel : 1;                                      // 0x0790(0x0004)
	int                                                nOldMouseX;                                               // 0x0794(0x0004)
	int                                                nOffsetMouseDis;                                          // 0x0798(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageCharacterCreation");
		return ptr;
	}


	bool rfAckLogOut(unsigned char Result, unsigned char Reason);
	void Internal_OnRendered(class UCanvas* Canvas);
	bool rfAckProcessPreLoginUser(int Result, const struct FString& ErrMsg);
	bool rfAckLoginInHouseTest(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg, const struct FString& BDay, unsigned char Sex, const struct FBtrDouble& ServerTime);
	bool Exit_OnOK(class UGUIComponent* Sender);
	bool ForceDisconnect_OnOK(class UGUIComponent* Sender);
	void rfAckCreateChar(int Success, const struct FString& ErrMsg);
	bool ButtonConfirm_OnClick(class UGUIComponent* Sender);
	bool ButtonRSA_OnClick(class UGUIComponent* Sender);
	bool ButtonAF_OnClick(class UGUIComponent* Sender);
	void ButtonRR_OnRelease(class UGUIComponent* Sender);
	void ButtonRR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	void ButtonLR_OnRelease(class UGUIComponent* Sender);
	void ButtonLR_OnPressed(class UGUIComponent* Sender, bool bRepeat);
	void CharRotByDrag();
	bool Internal_OnPreDraw(class UCanvas* C);
	int GetStringCount(const struct FString& Text);
	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	class UBTTcpLink_Login* GetTcpLogin();
	bool HeaderButton_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfare.BTPageLobby
// 0x03B8 (0x09B4 - 0x05FC)
class UBTPageLobby : public UBTNetQuestInfoPageHK
{
public:
	float                                              ACLLobby_OnHitBottom_LastTime;                            // 0x05FC(0x0004)
	float                                              TPMessenger_ACLMsg0_OnHitBottom_LastTime;                 // 0x0600(0x0004)
	struct FString                                     strEnterRoomMessage;                                      // 0x0604(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strConnectingLogin;                                       // 0x0610(0x000C) (Localized, NeedCtorLink)
	unsigned long                                      bStopRefresh : 1;                                         // 0x061C(0x0004)
	float                                              LastRefreshTime[0x2];                                     // 0x0620(0x0004)
	float                                              RefreshCycleTime[0x2];                                    // 0x0628(0x0004)
	class UBTRefreshTime*                              rfFriendPosTime;                                          // 0x0630(0x0004)
	int                                                TotalChannelUserCount;                                    // 0x0634(0x0004)
	int                                                TotalRoomCount;                                           // 0x0638(0x0004)
	int                                                RoomStartIndex;                                           // 0x063C(0x0004)
	int                                                RoomPingIndex;                                            // 0x0640(0x0004)
	unsigned long                                      bJoinClanState : 1;                                       // 0x0644(0x0004)
	unsigned long                                      bClanInviteState : 1;                                     // 0x0644(0x0004)
	unsigned long                                      bGoBack : 1;                                              // 0x0644(0x0004)
	unsigned long                                      bGoTutorial : 1;                                          // 0x0644(0x0004)
	struct FString                                     SaveRoomPassword;                                         // 0x0648(0x000C) (NeedCtorLink)
	class UBTOwnerDrawImageHK*                         BGRoomList;                                               // 0x0654(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         BGImageAD2;                                               // 0x0658(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UTabControlMocker*                           TabControl;                                               // 0x065C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLLobbyHK*                               ACLLobby;                                                 // 0x0660(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLLobbyHK*                               ACLLobbyEnterable;                                        // 0x0664(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	unsigned long                                      bAllRoomList : 1;                                         // 0x0668(0x0004)
	class UBTTPChatHK*                                 TPChat;                                                   // 0x066C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPMessengerHK*                            TPMessenger;                                              // 0x0670(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPMyInfoHK*                               TPMyInfo;                                                 // 0x0674(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FString                                     strDisconnectedChannel;                                   // 0x0678(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strListTop[0xA];                                          // 0x0684(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strListBottom[0x5];                                       // 0x06FC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strAllRoomList;                                           // 0x0738(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ListTopButton[0xA];                                       // 0x0744(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ListBottomButton[0x5];                                    // 0x076C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         ListTopImage[0xA];                                        // 0x0780(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   ListTopButtonPosition[0xA];                               // 0x07A8(0x0010)
	struct FFloatBox                                   ListBottomButtonPosition[0x5];                            // 0x0848(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonAD;                                                 // 0x0898(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     strMakeClanWarRoom;                                       // 0x089C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strRegularClanWar;                                        // 0x08A8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strFriendlyClanWar;                                       // 0x08B4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strButtonRegularClanWar;                                  // 0x08C0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strButtonFriendlyClanWar;                                 // 0x08CC(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonRegularClanWar;                                   // 0x08D8(0x0010)
	struct FFloatBox                                   fbButtonFriendlyClanWar;                                  // 0x08E8(0x0010)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonRegularClanWar;                                     // 0x08F8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonFriendlyClanWar;                                    // 0x08FC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UwMatchMaker*                                MatchMaker;                                               // 0x0900(0x0004) (Transient)
	struct FFloatBox                                   fbTestButton;                                             // 0x0904(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTNuclearButtonHK*                          TestButton;                                               // 0x0914(0x0004) (ExportObject, NeedCtorLink, EditInline)
	TArray<struct FString>                             DelFriendsList;                                           // 0x0918(0x000C) (NeedCtorLink)
	unsigned char                                      bQuickJoin;                                               // 0x0924(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0925(0x0003) MISSED OFFSET
	int                                                MapIndex;                                                 // 0x0928(0x0004)
	int                                                GameMode;                                                 // 0x092C(0x0004)
	int                                                WRestrict;                                                // 0x0930(0x0004)
	struct FString                                     strToolTip[0x5];                                          // 0x0934(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 MyInfoBtn;                                                // 0x0970(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 MyTutorialBtn;                                            // 0x0974(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelBackgrounddeco;                                      // 0x0978(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelBackgrounddeco;                                    // 0x097C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FString                                     szSerVerInfo;                                             // 0x098C(0x000C) (NeedCtorLink)
	class UBTOwnerDrawImageHK*                         LabelSvrInfo;                                             // 0x0998(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelInfo;                                              // 0x099C(0x0010)
	struct FScriptDelegate                             __delegateAckEnterRoom__Delegate;                         // 0x09AC(0x000C) (NeedCtorLink)

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
	bool rfNotifyClanLevelup(const struct FString& ClanName, int Levelup);
	bool rfNotifyNewClanName(const struct FString& New_NickName);
	bool rfReqRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& ClanName, const struct FString& InviteMsg);
	bool rfNotifyNewNickName(int Community_Type, const struct FString& Old_NickName, const struct FString& New_NickName);
	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, unsigned char RankingType, unsigned char CommunityType, TArray<struct FString> CharName, TArray<int> CharLevel, TArray<struct FString> ClanName, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<int> ClanMarkBL, TArray<int> Ranking_Accum, TArray<int> Ranking_Accum_Prev, TArray<int> Ranking_Accum_Exp, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, unsigned char RankingType, unsigned char CommunityType, int TotalCount);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfAckFriendPosition(int Result, const struct FString& TargetCharName, unsigned char ServerType, const struct FString& fServername, const struct FString& fServerShortName, const struct FString& fServerIP, int fServerPort, unsigned char CurPos, unsigned char CurState, int ChannelNum, const struct FString& ChannelNickName, int GameRoomNum);
	bool rfAckMoveToLobby(unsigned char MessageType);
	bool rfAckLogOut(unsigned char Result, unsigned char Reason);
	bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, const struct FString& RoomName, int MapNum, int CurUserCount, int MaxUserCount, unsigned char Status, unsigned char IsPublic);
	bool rfAckClanMatch_EndPublicWaitRoomList();
	bool rfAckClanMatch_PublicWaitRoomList(TArray<int> WaitRoomIdx, TArray<struct FString> LeaderName, TArray<struct FString> RoomName, TArray<int> MapNum, TArray<int> CurUserCount, TArray<int> MaxUserCount, TArray<unsigned char> Status);
	bool rfAckClanMatch_StartPublicWaitRoomList(int Result, const struct FString& ErrMsg, int Count);
	bool rfAckNotifyEndTutorial(int UserID, const struct FString& CharName, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckNotifyStartTutorial(int Result, int UserID);
	void RoomPingRefresh();
	bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, const struct FString& NewRoomTitle);
	bool IsEnterableRoom(bool bPass, int nUser, int nMaxUser);
	bool rfAckQuestGetAvailableEventList(int Result, const struct FString& ErrMsg, TArray<int> QuestID);
	void UpdateRecv_ClanInfo(class UBTNetMainMenu* MainMenu);
	bool rfAckNotifyAdjustClanMemberGrade(const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfAckAdjustClanMemberGrade(int Result, const struct FString& ErrMsg, const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfReqRecvDeleteFriend(int Result, const struct FString& FromCharName);
	bool rfAckDeleteFriend(int Result, TArray<struct FString> FailedCharname);
	bool rfAckChatWispher(int Result, const struct FString& ErrMsg, const struct FString& ToCharName);
	bool rfAckRecvJoinClanResult(int Result, const struct FString& ErrMsg);
	bool rfAckJoinClanResult(const struct FString& ClanName, unsigned char Permit, const struct FString& PermitCharName);
	bool RefreshPage_OnOK(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnSuspend(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnOK(class UGUIComponent* Sender);
	bool rfReqRecvJoinClan(int UserIdx, const struct FString& CharName, const struct FString& Message);
	bool rfAckNotifyClanSecession(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckNotifyNewClanMember(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckSearchClan(int Result, const struct FString& ErrMsg, int TotalPage, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<unsigned char> ClanMarkBL, TArray<struct FString> ClanName, TArray<struct FString> ClanMaster, TArray<int> ClanMember, TArray<int> ClanMemberMax, TArray<int> ClanCreateDate, TArray<int> ClanWin, TArray<int> ClanLose, TArray<int> ClanDraw, TArray<int> ClanRank, TArray<unsigned char> ClanRecruit, TArray<int> ClanLevel);
	bool rfAckInviteClanResult(const struct FString& CharName, unsigned char Permit, const struct FString& ClanNm);
	bool rfAckJoinClan(int Result, const struct FString& ErrMsg, const struct FString& SpecificCharName, const struct FString& RealRecvCharName, unsigned char RealRecvCharClanGrade);
	bool rfAckInviteClan(int Result, const struct FString& ErrMsg);
	bool BTWindowUserPersonalInfo_OnClanInfo(class UGUIComponent* Sender);
	bool BTWindowUserDetailInfoHK_OnClanInfo(class UGUIComponent* Sender);
	bool rfReqClanCharPersonelIntro(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckClanCharPersonelIntro(int Result, const struct FString& ErrMsg, const struct FString& PersonelIntro);
	bool rfAckDBCharInfo(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FString& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool MoveToClanPage_OnOK(class UGUIComponent* Sender);
	bool rfAckCreateClan(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckDupCheckClanName(int Result, const struct FString& ErrMsg);
	bool rfAckGameRoomInfo(int Result, const struct FString& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfReqCompleteFriendInvite(const struct FString& CharnameToBeInvited, unsigned char IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfReqRecvFriendInvite(int ReqUserID, const struct FString& ReqCharname, const struct FString& InviteMsg);
	bool rfAckSendFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfReqExteriorRoomOwnerInfo(int RoomNum, const struct FString& OwnerName, const struct FString& OwnerIP);
	bool rfReqExteriorRoomState(int RoomNumber, unsigned char RoomState);
	bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount);
	bool rfReqExteriorRoomInfo(int SP, int RoomNumber, unsigned char IsPW, const struct FString& RoomName, const struct FString& MapName, const struct FString& ModeName, int MapNum, int ModeNum, unsigned char IsTeamBalance, int MaxUserCount, int RoomUserCount, unsigned char RoomState, unsigned char BotDifficult, unsigned char WeaponLimit, unsigned char BotModeUserTeamNum);
	void SetCharacterInfo(const struct FString& ClanName, const struct FCharInfo& btCharInfo);
	bool rfAckGameRoomDestroy(int GameRoomNum);
	bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, TArray<int> UID, TArray<struct FString> UserID, TArray<int> UserLevels, TArray<struct FString> ClanName, TArray<int> ClanPattern, TArray<int> ClanBG, TArray<int> ClanBL, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<unsigned char> IsLookForClan, int Result, const struct FString& ErrMsg, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	void TryEnterBotMode();
	bool rfAckRoomList(TArray<int> GameNum, TArray<struct FString> Title, TArray<struct FString> MapName, TArray<int> MapNum, TArray<unsigned char> UserCount, TArray<unsigned char> MaxCount, TArray<struct FString> ModeName, TArray<int> ModeNum, TArray<unsigned char> WeaponLimit, TArray<unsigned char> IsTeamBalance, TArray<unsigned char> Status, TArray<struct FString> RoomOwnerIP, TArray<int> GameMinute, TArray<struct FString> RoomOwnerName, TArray<unsigned char> IsSpecial, TArray<unsigned char> IsPassword, TArray<unsigned char> BotDifficult, TArray<unsigned char> BotModeUserTeamNum);
	bool rfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex);
	bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, const struct FString& UserID, int TeamNum, int Grade, const struct FString& UserIP, const struct FString& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckLeaveChannel(int Result, const struct FString& UserID, int UID);
	bool LobbyToServerSelection();
	bool LobbyToServerSelection_OnOK(class UGUIComponent* Sender);
	bool rfAckEnterChannel(int id, int UID, const struct FString& UserID, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckCreateGameRoom(int Result, const struct FString& ErrMsg, int UserID, const struct FString& RoomOwnerIP, const struct FGameRoomInfo& NetRoomInfo);
	void TeamChatLog(const struct FString& cL);
	void BroadCastItemChatLog(const struct FString& cL);
	void SystemChatLog(const struct FString& cL);
	void SelfChatLog(const struct FString& cL);
	void WhisperChatLog(const struct FString& cL);
	void ClanChatLog(const struct FString& cL);
	void NormalChatLog(const struct FString& cL);
	void ClearChatLog();
	void OnVisibleChannelListChanged(int Index);
	bool InternalKeyType(const struct FString& Unicode, unsigned char* key);
	bool internalKeyEvent(float Delta, unsigned char* key, unsigned char* Action);
	void InternalOnClose(bool bCanceled);
	void BTPageLobby_OnReceivedPing(class UwMatchMaker* MM, const struct FString& fromAddr, int msec);
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
	void StartTutorial(const struct FString& Map);
	bool BTWindowDefineARHK_43(class UGUIComponent* Sender);
	void ShowTutorialWindow();
	void InternalOnReOpen();
	bool rfAckProcessPreLoginUser(int Result, const struct FString& ErrMsg);
	bool rfAckLoginInHouseTest(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg, const struct FString& BDay, unsigned char Sex, const struct FBtrDouble& ServerTime);
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
	bool AutoMoveReturnClanReadyRoom(int RoomNum, const struct FString& Password);
	bool AutoMoveToClanReadyRoom(int RoomNum, const struct FString& Password);
	bool AutoMoveToRoom(int RoomNum, const struct FString& Password);
	bool OnLobby_DblClick(class UGUIComponent* Sender);
	bool BTWindowPasswordHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowPasswordHK_OnOK(class UGUIComponent* Sender);
	bool rfAckEnterRoom_AfterJoinRoom(int GameNum, int OwnerID, int UID, const struct FString& UserID, int TeamNum, int Grade, const struct FString& UserIP, const struct FString& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckEnterRoom_AfterCreateRoom(int GameNum, int OwnerID, int UID, const struct FString& UserID, int TeamNum, int Grade, const struct FString& UserIP, const struct FString& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckClanMatch_Join(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_GetReady(int Result, const struct FString& ErrMsg, int RoomIndex);
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
	bool delegateAckEnterRoom(int GameNum, int OwnerID, int UID, const struct FString& UserID, int TeamNum, int Grade, const struct FString& UserIP, const struct FString& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
};


// Class GUIWarfare.BTPageServerSelection
// 0x019C (0x0798 - 0x05FC)
class UBTPageServerSelection : public UBTNetGUIPageHK
{
public:
	TArray<class UClanNameAndMark*>                    ClanMarkList;                                             // 0x05FC(0x000C) (NeedCtorLink)
	class UGUIPage*                                    SavePg;                                                   // 0x0608(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UCanvas*                                     SaveCanvas;                                               // 0x060C(0x0004)
	unsigned long                                      bButtonRefresh : 1;                                       // 0x0610(0x0004)
	int                                                SaveServerListIndex;                                      // 0x0614(0x0004)
	int                                                ToggleButCredit;                                          // 0x0618(0x0004)
	float                                              CurrentTime;                                              // 0x061C(0x0004)
	float                                              LastRefreshTime;                                          // 0x0620(0x0004)
	float                                              RefreshCycleTime;                                         // 0x0624(0x0004)
	struct FString                                     currentBGM;                                               // 0x0628(0x000C) (NeedCtorLink)
	struct FConnectingInfo                             ConnectingChannel;                                        // 0x0634(0x001C) (NeedCtorLink)
	struct FFloatBox                                   fbLabelBackground;                                        // 0x0650(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelBackground;                                          // 0x0660(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelBackgrounddeco;                                    // 0x0664(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelBackgrounddeco;                                      // 0x0674(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelTopLine;                                           // 0x0678(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelTopLine;                                             // 0x0688(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelLeftTopRoll;                                       // 0x068C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelLeftTopRollSource;                                 // 0x069C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawSourceClipImageHK*               LabelLeftTopRoll;                                         // 0x06AC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelBottomLine;                                        // 0x06B0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTLabelNoticeHK*                            LabelBottomLine;                                          // 0x06C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonServerList[0x7];                                    // 0x06C4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTACLServerSelectionHK*                     ACLServerList[0x7];                                       // 0x06E0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UTabControlMocker*                           TabControl;                                               // 0x06FC(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPTopMenuSCHK*                            TPTopMenu;                                                // 0x0700(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FString                                     strButtonCredit;                                          // 0x0704(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonCredit;                                             // 0x0710(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ChannelADSmall;                                           // 0x0714(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ChannelADLarge;                                           // 0x0718(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTemp;                                               // 0x071C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTemp2;                                              // 0x0720(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         BGImageTotalServer;                                       // 0x0724(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FCheckToReceivedPacket                      CTRP;                                                     // 0x0728(0x0004)
	struct FString                                     strPCBangFriend;                                          // 0x072C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     HashMessage;                                              // 0x0738(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strCW_GameMode;                                           // 0x0744(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strLotteryWinner;                                         // 0x0750(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strSpecialCompleteUser;                                   // 0x075C(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonEnterCh;                                            // 0x0768(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTACLGroutSelection*                        ServerList;                                               // 0x076C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTACLServerSelectionHK*                     ChannelList;                                              // 0x0770(0x0004) (ExportObject, NeedCtorLink, EditInline)
	unsigned long                                      bDefaultServnChannel : 1;                                 // 0x0774(0x0004)
	class UBTOwnerDrawImageHK*                         ChannelBg;                                                // 0x0778(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbChannelBg;                                              // 0x077C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                nIndexDefSrv;                                             // 0x078C(0x0004)
	int                                                nIndexDefCh;                                              // 0x0790(0x0004)
	unsigned char                                      iProcessExpiredStep;                                      // 0x0794(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0795(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageServerSelection");
		return ptr;
	}


	bool rfAckSpecialQuestRank(TArray<struct FString> CharList);
	bool rfAckReceiveSpecialReward(int Result, int RewardedQuestID, unsigned char RewardedQuestIsComplete, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount);
	bool rfAckDailyRewardListThisMonth(TArray<unsigned char> Type, TArray<unsigned char> Number, TArray<int> ItemID, TArray<int> ItemCount);
	bool rfAckPuzzleList(int Result, unsigned char IsComplete, TArray<unsigned char> UpdatedNum, TArray<unsigned char> StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfAckAttendanceList(int Result, unsigned char IsComplete, unsigned char UpdatedNum, TArray<unsigned char> StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfAckSetCommunityOption(int Result, const struct FString& ErrStr);
	bool rfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite);
	bool rfChangeItemInstanceInfo(int ErrorCode, int ItemID, const struct FBtrDouble& ItemUniqueID, unsigned char ChangeCount, int RemainCount);
	bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, unsigned char IsNotification, TArray<struct FString> NickName, TArray<struct FBtrDouble> Time, int GetItemID);
	bool rfAckGetItemFromItemBox(int Result, const struct FString& ErrMsg, int ItemIDChoose, int PartIDChoose, const struct FBtrDouble& BoxItemIdx, int BxoItemCount, unsigned char bHave, const struct FBtrDouble& ItemIdx, const struct FBtrDouble& UntilTime, int StackCount);
	void End_WindowRandBox();
	void WindowCapsuleGet_OnInventory();
	bool rfNotifyCouponUseError(int Time);
	bool rfAckRecvClanInviteResult(int Result, const struct FString& ErrMsg);
	bool BTWindowRequestClanHK_OnSuspend(class UGUIComponent* Sender);
	bool BTWindowRequestClanHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowRequestClanHK_OnOK(class UGUIComponent* Sender);
	bool rfReqRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& ClanName, const struct FString& InviteMsg);
	bool rfReqNotifyShopItemDataEnd(int Ver);
	bool rfReqNotifyShopItemData(TArray<int> ProductNo, TArray<struct FString> ProductName, TArray<int> ProductCode, TArray<unsigned char> SaleType, TArray<int> ProductCost, TArray<int> ProductHour, TArray<int> ProductQuantity, TArray<int> SaleMasterFlag, TArray<int> SaleStatus, TArray<int> IsGift, TArray<struct FBtrDouble> SaleEndTime, TArray<int> Discountcost);
	bool rfAckShopItemData();
	bool rfAckLoginWithIndonesia(int Result);
	bool rfAckLoginWithGlobal(int Result);
	bool rfAckLoginWithThailand(int Result);
	bool rfAckLoginWithWZAuth(int Result, unsigned char wzp_AccountType, unsigned char wzp_IsBlock, unsigned char wzp_AuthKeySuccess, unsigned char ChannelType);
	bool rfAckLoginWithTencentAuth(int Result, unsigned char tc_AccountType, unsigned char tc_IsBlock);
	bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, unsigned char ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, unsigned char ChangedOldSlotPosition, int Result, const struct FString& ErrMsg);
	bool rfAckTencent_StartTenProtect(int CharDBID);
	bool rfAckMoveToLobby(unsigned char MessageType);
	bool rfAckPopUpMessage(int MessageType);
	bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckLogOut(unsigned char Result, unsigned char Reason);
	bool rfAckServerType(unsigned char Type);
	void Receive_EventGift(int Index);
	bool rfAckRecvSystemMsg(unsigned char CommunityType, const struct FSystemMsgParam& MsgInfo);
	bool rfAckPaidItem_RelayBroadcast(const struct FString& CharName, const struct FString& Msg);
	bool rfAckChatClan(const struct FString& CharName, const struct FString& Message, int Result);
	bool rfReqRecvChatWispher(const struct FString& CharnameFrom, const struct FString& Message);
	bool rfAckChatNormal(int id, const struct FString& Sender, const struct FString& Message, int Result);
	bool rfAckSetLookForClan(int Result, const struct FString& ErrMsg, unsigned char IsLookingFor);
	bool rfAckGetMyMailBoxState(int Result, unsigned char IsFull, int NewMailCount);
	bool BTWindowDefineARHK_40_41_OnOK(class UGUIComponent* Sender);
	bool rfAckClientChecksum(int Result);
	bool rfAckClientChallenge(const struct FString& Key1, const struct FBtrDouble& Key2);
	void ChatBlockEndTime_OnEventTimer(int Index);
	void ChatBlockStartTime_OnEventTimer(int Index);
	bool rfAckCharBlockInfo(int Result, const struct FBtrDouble& ChatBlockStartTime, const struct FBtrDouble& ChatBlockEndTime, TArray<struct FBtrDouble> BlockedItemIdx);
	bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID);
	bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID);
	bool rfAckForceDisconnectUser_GM(int Result, const struct FString& ErrMsg, const struct FString& CharName);
	bool rfAckNotice_GM(int Result, const struct FString& ErrMsg, unsigned char NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const struct FString& Msg);
	bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, const struct FString& NewRoomTitle);
	bool rfAckPaidItem_NotifyChangeClanMark(const struct FString& ClanName, int Pattern, int BG, int BL);
	bool rfAckPaidItem_ChangeClanMark(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_ClanMarkDupCheck(int Result, const struct FString& ErrMsg);
	bool rfAckPaidItem_NotifyChangeClanname(const struct FString& NewClanname);
	bool rfAckPaidItem_ChangeClanname(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const struct FString& NewClanname);
	bool rfAckPaidItem_ChangeCharname(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const struct FString& NewCharname);
	bool rfAckPaidItem_BroadCast(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_EraseRecord(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int Command, int RemainCount);
	bool rfAckWebzenBillingUseStorageItem(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID, const struct FBtrDouble& ItemExtra);
	bool rfAckWebzenBillingStorageListEnd();
	bool rfAckWebzenBillingStorageList(TArray<int> Seq, TArray<int> ItemSeq, TArray<int> GroupCode, TArray<int> ShareFlag, TArray<int> ProductSeq, TArray<struct FString> CashName, TArray<struct FBtrDouble> CashPoint, TArray<struct FString> SendAccountID, TArray<struct FString> SendMessage, TArray<unsigned char> ItemType, TArray<unsigned char> RelationType, TArray<int> ProductType, TArray<int> PriceSeq);
	bool rfAckWebzenBillingStorageListStart(int Result, const struct FString& ErrMsg, int TotalCount, int TotalPage, int CurPage);
	bool rfAckRemoveBlockUserList(int Result, const struct FString& ErrMsg);
	bool rfAckAddBlockUserList(int Result, const struct FString& ErrMsg);
	bool rfAckEquipItem(int ChangedNewItemID, const struct FBtrDouble& ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, const struct FBtrDouble& ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, const struct FString& ErrMsg);
	bool rfAckRandomBox_Use(int Result, const struct FString& ErrMsg, const struct FBtrDouble& RandomBoxItemIdx, int RandomBxoItemCount, const struct FBtrDouble& KeyItemIdx, int KeyItemRemainCount, TArray<int> ItemIDChoose, TArray<int> PartIDChoose, TArray<int> PeriodOnChoosenItem, TArray<int> StackCountOnChoosenItem, TArray<unsigned char> bHave, TArray<struct FBtrDouble> ItemIdx, TArray<struct FBtrDouble> UntilTime, TArray<int> StackCount);
	bool rfAckBlockUserList(TArray<struct FString> CharName);
	bool rfAckBlockUserListEnd();
	bool rfAckBlockUserListStart(int Result, int TotalCount);
	bool rfAckPCBangUserListEnd();
	bool rfAckPCBangUserList(TArray<struct FString> FriendName, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> Level, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<unsigned char> IsLookForClan, TArray<unsigned char> IsCombat, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckPCBangUserListStart(int Result, int TotalCount);
	bool rfAckFriendListEnd();
	bool rfAckFriendList(TArray<struct FString> FriendName, TArray<unsigned char> IsLogOn, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> LevelMarkID, TArray<int> ClanLevel, TArray<int> Level, TArray<unsigned char> IsLookForClan);
	bool rfAckFriendListStart(int Result, int TotalCount);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserList(int Result, const struct FString& ErrMsg, TArray<int> Level, TArray<struct FString> CharName, TArray<unsigned char> ClanGrade, TArray<int> ClanWinCnt, TArray<int> ClanLoseCnt, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> DudeId);
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfAckRegisterMainPCBang(int Result, const struct FString& ErrMsg);
	bool rfReqIsPaidWebzenPCBang(unsigned char IsPaid);
	bool rfAckClanInfo(const struct FClanInfo& stClanInfo);
	bool rfAckCharInfo(int Result, const struct FString& ErrMsg, int UserID, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FCharInfo& stCharInfo, unsigned char InClanRank, int ClanLevel);
	bool rfAckRegisteredPCBangInfo(int Result, const struct FString& ErrMsg, unsigned char IsRegisteredPCBang, unsigned char IsMainPCBang, const struct FString& PCBangName);
	bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckMyMoney(int Result, const struct FString& ErrMsg, int Point, int Cash);
	bool rfAckBuyItemByWebzenCash(int Result, const struct FString& ErrMsg);
	bool rfAckWebzenCash(int Result, const struct FString& ErrMsg, const struct FBtrDouble& PCoinCash, const struct FBtrDouble& CCoinCash);
	bool rfReqDailyQuestNewAvailable(TArray<int> ExpiredQuestID, TArray<int> NewQuestID);
	bool rfReqQuestNewAvailable(TArray<int> AchivedQuestID, TArray<int> NewQuestID, TArray<unsigned char> IsDailyQuest, TArray<int> ExpiredQuest);
	bool rfAckQuestUpdate(int Result, const struct FString& ErrMsg);
	bool rfAckQuestListEnd();
	bool rfAckQuestList(TArray<int> QuestID, TArray<int> CountPrograss, TArray<unsigned char> IsDailyQuest, TArray<unsigned char> IsComplete);
	bool rfAckQuestListStart(int Result, const struct FString& ErrMsg);
	bool rfAckLimitedListInChannel(int Result, TArray<int> LimitedMapID, TArray<int> LimitedModeID);
	bool rfReqClanMatch_InviteCrewResult(const struct FString& Invitee, int Result);
	bool BTWindowInviteClanWarGameHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowInviteClanWarGameHK_OnOK(class UGUIComponent* Sender);
	bool rfReqClanMatch_RecvInviteCrew(const struct FString& Inviter, const struct FString& ServerIP, int Port, int WaittingID, const struct FString& Msg, int MapNum, int InviteUserChannelNum, const struct FString& LeaderName, const struct FString& RoomName);
	bool rfAckClanMatch_InviteCrew(int Result, const struct FString& ErrMsg);
	bool rfAckRecvInviteGameRoomResult(int Result);
	bool BTWindowInviteGameHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowInviteGameHK_OnOK(class UGUIComponent* Sender);
	bool rfReqRecvInviteGameRoom(const struct FString& InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, const struct FString& RoomUniqueID, int RoomNumber, const struct FString& RoomName, unsigned char RoomState, const struct FString& MapName, const struct FString& OwnerName, unsigned char GameMode, unsigned char WeaponLimit, unsigned char IsTeamBalance, const struct FString& Password, const struct FString& InviteCharName);
	bool rfAckInviteGameRoom(int Result, unsigned char Answer, const struct FString& GuestCharName);
	bool rfAckCharInfoFromLoginServer(int Result, const struct FString& CharName, int Level, int Exp, const struct FString& ClanName);
	bool BTWindowItemBoxHK_OnOK(class UGUIComponent* Sender);
	bool rfAckItemListInItemBox(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemUniqueID, int BoxItemID, TArray<int> ItemID, TArray<int> PartID, unsigned char FromContent);
	bool Internal_OnPreDraw(class UCanvas* C);
	bool rfAckGetServerTime(const struct FBtrDouble& ServerTime, const struct FString& ClientIP);
	bool rfAckLoginInHouseTest(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg, const struct FString& BDay, unsigned char Sex, const struct FBtrDouble& ServerTime);
	bool rfAckExceedMaxUser();
	bool BackToServerSelection_OnClick(class UGUIComponent* Sender);
	bool rfReqRecvForceDisconnected_FromGM(int Result, const struct FString& ErrMsg);
	bool rfReqRecvNotice_FromGM(int Result, const struct FString& ErrMsg, TArray<struct FString> NoticeMsg, unsigned char IsFromDB);
	bool rfAckRepairItem(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, int RepairCost, TArray<int> DamageDegree);
	bool rfAckRepairCost(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, TArray<int> RepairCost);
	bool rfReqNotifyDurabilityZeroItem(int Result, const struct FString& ErrMsg, int UserID, TArray<struct FBtrDouble> ItemUniqueIDs, TArray<int> ItemIDs, TArray<int> ItemPartIDs, TArray<unsigned char> ItemSlotPos);
	bool BTWindowBuyShopItem_OnOK(class UGUIComponent* Sender);
	bool rfAckUpdateQSlot(int Result, const struct FString& ErrMsg);
	bool rfAckBuyShopItem(int ItemCount, TArray<int> Result, TArray<int> BoughtItemTypeID, TArray<struct FBtrDouble> BoughtItemUniqueID, TArray<int> BoughtPartID, TArray<struct FBtrDouble> BoughtUntilTIme, TArray<int> BoughtStackCnt, int PointRemain, int CashRemain);
	bool BTWindowItemExpiredHK_OnOK_CheckDurX(class UGUIComponent* Sender);
	bool rfAckNotifyExpiredSkillIDs(int UserID, TArray<struct FBtrDouble> ExpiredSkillUniqueIDs, TArray<int> ExpiredSkillIDs, int Result, const struct FString& ErrMsg, TArray<unsigned char> ExpiredSkillSlotPositions);
	bool rfAckNotifyExpiredItemIDs(int UserID, TArray<struct FBtrDouble> ExpiredItemUniqueIDs, TArray<int> ExpiredItemIDs, TArray<int> ExpiredItemPartIDs, TArray<unsigned char> ExpiredItemSlotPos, int Result, const struct FString& ErrMsg);
	bool rfReqNotifyRelayServerAddr(const struct FString& RelayIP, int RelayPort);
	bool rfAckHash_BTWindowErrorDefineHK_OnOK(class UGUIComponent* Sender);
	bool rfAckHash(int Result, const struct FString& Error);
	void CheckToSetPageLobby();
	bool rfAckServerTime(int Time);
	bool rfAckQSlotList(int Result, const struct FString& ErrMsg, TArray<int> QSlotID, TArray<struct FString> QSlotName, TArray<unsigned char> QSlotDispOrder, TArray<struct FBtrDouble> MWItemID, TArray<struct FBtrDouble> PistolItemID, TArray<struct FBtrDouble> TWItemID1, TArray<struct FBtrDouble> TWItemID2, TArray<int> Skill1, TArray<int> Skill2, TArray<int> Skill3, TArray<int> Skill4);
	bool rfAckUserSkillListEnd();
	bool rfAckUserSkillList(TArray<int> UniqueSkillID, TArray<int> SkillID, TArray<struct FBtrDouble> UntilTime, TArray<unsigned char> SlotPosition);
	bool rfAckUserSkillListStart(int Count, int Result, const struct FString& ErrMsg);
	bool rfAckItemListEnd();
	bool rfAckItemList(TArray<struct FBtrDouble> UniqueID, TArray<int> ItemID, TArray<int> ItemType, TArray<int> Durability, TArray<struct FBtrDouble> UntilTime, TArray<int> SlotPosition, TArray<int> AddPartsID, TArray<int> DamageDegree, TArray<unsigned char> ItemState, TArray<int> StackCount, TArray<int> PaintID, TArray<int> TradeCount);
	bool rfAckItemListStart(int Count, int Result, const struct FString& ErrMsg);
	bool rfAckLogin2(int Result, const struct FString& ErrMsg, int UserID, const struct FString& CharName, const struct FBtrDouble& CurServerTime, int CharDBID, unsigned char IsGM);
	bool rfAckLeaveChannel(int Result, const struct FString& UserID, int UID);
	bool rfAckEnterChannel(int id, int UID, const struct FString& UserID, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool Exit_OnOK(class UGUIComponent* Sender);
	void TcpChannel_OnError(int ErrCode);
	void TcpChannel_OnClose(int ErrCode);
	void TcpChannel_OnConnect(int ErrCode);
	void TcpLogin_OnConnect(int ErrCode);
	void NewDrawServerSelection(TArray<struct FString> CServername, TArray<struct FString> CServerShortName, TArray<struct FString> ServerIP, TArray<int> serverPort, TArray<struct FString> ChannelName, TArray<struct FString> ChannelNickName, TArray<int> ChannelNum, TArray<int> chMaxUser, TArray<int> chCurUser, TArray<struct FString> ServerGroupName, TArray<int> ServerGroupID, TArray<int> ServerDispOrder, TArray<int> DataPort, TArray<unsigned char> OptionCount_byte, TArray<unsigned char> OptionKey_byte, TArray<unsigned char> OptionValue_byte, TArray<unsigned char> OptionCount_int, TArray<unsigned char> OptionKey_int, TArray<int> OptionValue_int, TArray<unsigned char> OptionCount_float, TArray<unsigned char> OptionKey_float, TArray<float> OptionValue_float, TArray<unsigned char> IsClanChannel, TArray<unsigned char> IsUseDedicateHost);
	bool rfAckServerListFromLoginServer(TArray<struct FString> CServername, TArray<struct FString> CServerShortName, TArray<struct FString> ServerIP, TArray<int> serverPort, TArray<struct FString> ChannelName, TArray<struct FString> ChannelNickName, TArray<int> ChannelNum, TArray<int> chMaxUser, TArray<int> chCurUser, TArray<struct FString> ServerGroupName, TArray<int> ServerGroupID, TArray<int> ServerDispOrder, TArray<int> DataPort, TArray<unsigned char> OptionCount_byte, TArray<unsigned char> OptionKey_byte, TArray<unsigned char> OptionValue_byte, TArray<unsigned char> OptionCount_int, TArray<unsigned char> OptionKey_int, TArray<int> OptionValue_int, TArray<unsigned char> OptionCount_float, TArray<unsigned char> OptionKey_float, TArray<float> OptionValue_float, TArray<unsigned char> IsClanChannel, TArray<unsigned char> IsUseDedicateHost);
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
	void CMDHK(int Index, const struct FString& Param1, const struct FString& Param2, const struct FString& param3);
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
// 0x009C (0x0698 - 0x05FC)
class UBTPageMatchResult : public UBTNetGUIPageHK
{
public:
	unsigned long                                      bPrecachingRender : 1;                                    // 0x05FC(0x0004)
	class ABTROModelWeapon*                            romodelweapon1;                                           // 0x0600(0x0004)
	class ABTROModelWeapon*                            romodelweapon2;                                           // 0x0604(0x0004)
	class ABTROModelNew*                               romodelnew;                                               // 0x0608(0x0004)
	float                                              ButtonCloseEnableTime;                                    // 0x060C(0x0004)
	float                                              DefaultButtonCloseEnableTime;                             // 0x0610(0x0004)
	struct FString                                     strButtonClose;                                           // 0x0614(0x000C) (Localized, NeedCtorLink)
	unsigned long                                      bCanClose : 1;                                            // 0x0620(0x0004)
	class AGameInfo*                                   GI;                                                       // 0x0624(0x0004) (Transient)
	class UwMatchMaker*                                MM;                                                       // 0x0628(0x0004) (Transient)
	struct FFloatBox                                   fbLabelBottomLine;                                        // 0x062C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelBottomLine;                                          // 0x063C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonClose;                                            // 0x0640(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonClose;                                              // 0x0650(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPResult;                                               // 0x0654(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPMatchResultCommonHK*                    TPResultCommon;                                           // 0x0664(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPMatchResultPrivateHK*                   TPResultPrivate;                                          // 0x0668(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPMatchResultAlien*                       TPResultAlien;                                            // 0x066C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbBGDeco;                                                 // 0x0670(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         BGDeco;                                                   // 0x0680(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTopBg;                                                  // 0x0684(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         TopBg;                                                    // 0x0694(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageMatchResult");
		return ptr;
	}


	class UBTTcpLink_Channel* GetTcpChannel();
	bool InternalOnPreDraw(class UCanvas* C);
	bool internalKeyEvent(float Delta, unsigned char* key, unsigned char* Action);
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
// 0x00F0 (0x06EC - 0x05FC)
class UBTPageAuction : public UBTNetGUIPageHK
{
public:
	unsigned long                                      bChangePage : 1;                                          // 0x05FC(0x0004)
	float                                              LastRefreshTime[0x2];                                     // 0x0600(0x0004)
	float                                              RefreshCycleTime[0x2];                                    // 0x0608(0x0004)
	struct FString                                     strSuccessAuctionCancel;                                  // 0x0610(0x000C) (Localized, NeedCtorLink)
	TArray<struct FBtrDouble>                          MyAuctionItemUniqueID;                                    // 0x061C(0x000C) (NeedCtorLink)
	struct FString                                     strSuccessBidding[0x2];                                   // 0x0628(0x000C) (Localized, NeedCtorLink)
	int                                                SavePageNum;                                              // 0x0640(0x0004)
	class UwGameManager*                               GameMgr;                                                  // 0x0644(0x0004)
	class UwMyPlayerStatus*                            MyStatus;                                                 // 0x0648(0x0004)
	struct FFloatBox                                   fbLabelPoint;                                             // 0x064C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelCash;                                              // 0x065C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelPoint;                                               // 0x066C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelCash;                                                // 0x0670(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelP;                                                 // 0x0674(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelC;                                                 // 0x0684(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelP;                                                   // 0x0694(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelC;                                                   // 0x0698(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTItemCommonInfoHK*                         MyData;                                                   // 0x069C(0x0004)
	class UBTTPAuctionHK*                              TPAuction;                                                // 0x06A0(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FSearchAuctionItem                          SAItem;                                                   // 0x06A4(0x0028) (NeedCtorLink)
	unsigned long                                      bToggleTest : 1;                                          // 0x06CC(0x0004)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTest;                                               // 0x06D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	int                                                LastReqRepairMode;                                        // 0x06D4(0x0004)
	int                                                RepairAllButtonID;                                        // 0x06D8(0x0004)
	struct FBtrDouble                                  SellShopItemInfo_UniqueItemID;                            // 0x06DC(0x0008)
	struct FBtrDouble                                  Repair_UniqueItemID;                                      // 0x06E4(0x0008)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageAuction");
		return ptr;
	}


	bool rfAckRepairItem(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, int RepairCost, TArray<int> DamageDegree);
	bool rfAckRepairCost(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, TArray<int> RepairCost);
	bool RepairAllItem_OnOK(class UGUIComponent* Sender);
	bool BTWindowItemRepairAllHK_OnOK(class UGUIComponent* Sender);
	bool RepairItem_OnOK(class UGUIComponent* Sender);
	bool BTWindowItemRepairHK_OnOK(class UGUIComponent* Sender);
	bool Internal_OnPreDraw(class UCanvas* C);
	bool rfAckAuctionInstantlyBuying(int Result, const struct FString& ErrMsg, int PointRemain);
	bool rfAckAuctionBidding(int Result, const struct FString& ErrMsg, int PointRemain);
	void UpdateAuctionList();
	bool rfAckAuctionTradeHistory(int Result, const struct FString& ErrMsg, int ItemID, int PartID, TArray<struct FString> SellerCharNm, TArray<int> DamageDegree, TArray<int> Price);
	bool rfAckAuctionMyItemCancel(int Result, const struct FString& ErrMsg);
	bool rfAckAuctionMyItemRegister(int Result, const struct FString& ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain);
	bool rfAckAuctionItemListEnd(unsigned char Section);
	bool rfAckAuctionItemList(unsigned char Section, TArray<int> UniqueIDs, TArray<int> ItemIDs, TArray<int> AddPartsIDs, TArray<struct FBtrDouble> UntilTimes, TArray<int> BiddingPrices, TArray<int> InstantlyByuingPrices, TArray<int> ItemDamageds, TArray<struct FString> HighestBidderNames, TArray<struct FString> SellerNames, TArray<int> ItemCount);
	bool rfAckAuctionItemListStart(int Result, const struct FString& ErrMsg, unsigned char Section, int PageNum, int Count);
	bool rfAckAuctionItemListCount(int Result, const struct FString& ErrMsg, unsigned char Section, unsigned char Classfy, int ItemType, int ItemGrade, int Count);
	void SortAuctionItemList(int SortType);
	bool sfReqAuctionItemList(int Section, const struct FString& Keyword, int ItemRank, unsigned char ItemClassify, unsigned char IsAvailable, int PageNum, int Count, int SortType);
	void RefreshAuction(bool bStopLoop);
	void RefreshCashNPoint();
	class UBTTcpLink_Channel* GetTcpChannel();
	bool internalKeyEvent(float Delta, unsigned char* key, unsigned char* Action);
	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
	void UnInitializeDelegate();
	void InitializeDelegate();
	void UpdateServerTime(class UwGameManager* GameMgr);
	void UpdateItemList(class UwGameManager* GameMgr);
	void UpdateMoneyInfo(class UwMatchMaker* MM);
	void InitializeCashNPoint();
	bool ButtonTest_OnClick(class UGUIComponent* Sender);
	void TeamChatLog_Extra(const struct FString& cL);
	void BroadCastItemChatLog_Extra(const struct FString& cL);
	void SystemChatLog_Extra(const struct FString& cL);
	void SelfChatLog_Extra(const struct FString& cL);
	void WhisperChatLog_Extra(const struct FString& cL);
	void ClanChatLog_Extra(const struct FString& cL);
	void NormalChatLog_Extra(const struct FString& cL);
	void ClearChatLog_Extra();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void TPMyAuction_PageButton_OnClick(int pageIndex);
	void TPBuying_PageButton_OnClick(int pageIndex);
	bool TPAuction_TabButton_OnClick(class UGUIComponent* Sender);
	bool HeaderButton_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfare.BTPageHelp
// 0x0004 (0x0600 - 0x05FC)
class UBTPageHelp : public UBTNetGUIPageHK
{
public:
	class UBTOwnerDrawImageHK*                         HelpImage;                                                // 0x05FC(0x0004) (ExportObject, NeedCtorLink, EditInline)

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
// 0x00EC (0x06E8 - 0x05FC)
class UBTPageMail : public UBTNetGUIPageHK
{
public:
	struct FString                                     strDeleteWindow[0x4];                                     // 0x05FC(0x000C) (Localized, NeedCtorLink)
	class UBTTPMailHK*                                 TPMail;                                                   // 0x062C(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPMailReadHK*                             TPMailRead;                                               // 0x0630(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPMailWriteHK*                            TPMailWrite;                                              // 0x0634(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbBGImageLeft;                                            // 0x0638(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbBGImageRight;                                           // 0x0648(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         BGImageLeft;                                              // 0x0658(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         BGImageRight;                                             // 0x065C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonWrite;                                              // 0x0660(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawCaptionButtonHK*                 BtnDeleteAll;                                             // 0x0664(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     strButtonWrite;                                           // 0x0668(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strBtnDeleteAll;                                          // 0x0674(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonWrite;                                            // 0x0680(0x0010)
	struct FFloatBox                                   fbBtnDeleteAll;                                           // 0x0690(0x0010)
	class UBTOwnerDrawImageHK*                         LabelWarning;                                             // 0x06A0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     strLabelWarning;                                          // 0x06A4(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabelWarning;                                           // 0x06B0(0x0010)
	struct FString                                     strSendMemoCompleteTitle;                                 // 0x06C0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strSendMemoCompleteMsg;                                   // 0x06CC(0x000C) (Localized, NeedCtorLink)
	struct FReceiveMode                                RMode;                                                    // 0x06D8(0x0010)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageMail");
		return ptr;
	}


	bool BTWindowUserDetailInfoHK_OnClanInfo(class UGUIComponent* Sender);
	void UpdateRecv_ClanInfo(class UBTNetMainMenu* MainMenu);
	bool rfAckDBCharInfo(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FString& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckGetAttachedItemFromMemo(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID);
	bool rfAckDeleteMailAll(int Result, unsigned char MailType, int Count);
	bool rfAckDelMemo(int Result, const struct FString& ErrMsg, TArray<int> FailedMemoID);
	bool rfAckSendMemo(TArray<struct FString> CnamesToFail, TArray<int> ResultArray);
	bool rfReqRecvMemo(const struct FString& cnameFrom, unsigned char MemoType);
	bool rfAckReadMemo(const struct FString& cnameFrom, const struct FString& Text, const struct FString& dateRecv, const struct FBtrDouble& ItemUID);
	bool rfAckEndMemoList();
	bool rfAckMemoList(TArray<int> MemoIdx, TArray<struct FString> cnameFrom, TArray<struct FString> dateRecv, TArray<struct FString> Text, TArray<unsigned char> Status, TArray<int> UntilExpire, TArray<struct FBtrDouble> ItemUID, TArray<int> ItemID, TArray<unsigned char> MsgType, TArray<int> ItemPartID);
	bool rfAckStartMemoList(int Result, const struct FString& ErrMsg, unsigned char Type, int TotalCount);
	class UBTTcpLink_Channel* GetTcpChannel();
	bool internalKeyEvent(float Delta, unsigned char* key, unsigned char* Action);
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
// 0x005C (0x0658 - 0x05FC)
class UBTPageStore : public UBTNetGUIPageHK
{
public:
	struct FFloatBox                                   fbTPStore;                                                // 0x05FC(0x0010)
	class UBTTPStoreHK*                                TPStore;                                                  // 0x060C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMoneyInfo*                                MoneyInfoObject;                                          // 0x0610(0x0004) (ExportObject, NeedCtorLink, EditInline)
	unsigned long                                      bGoToClanPage : 1;                                        // 0x0614(0x0004)
	int                                                nCurWeaponList;                                           // 0x0618(0x0004)
	int                                                nCurSkillList;                                            // 0x061C(0x0004)
	TArray<class UBTOwnerDrawCaptionButtonHK*>         QuickSlotBtn;                                             // 0x0620(0x000C) (NeedCtorLink)
	class UBTTPInventoryQuickSlotHK*                   TPQuickSlot;                                              // 0x062C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelBackgrounddeco;                                      // 0x0630(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelBackgrounddeco;                                    // 0x0634(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                nCurSlotIndex;                                            // 0x0644(0x0004)
	class UBTOwnerDrawImageHK*                         LabelSlot;                                                // 0x0648(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     strLabelSlot;                                             // 0x064C(0x000C) (Localized, NeedCtorLink)

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
	void InternalOnRendered(class UCanvas* C);
	bool TPQSClick(class UGUIComponent* Sender);
	bool BTWindowModifyHK_OnOK(class UGUIComponent* Sender);
	bool ShowModifyWindow(class UGUIComponent* Sender);
	bool rfAckModifyWeapon(int Result, const struct FString& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point, int Cash);
	bool rfAckCouponUse(int Result, const struct FString& ErrMsg);
	bool rfAckGiftItemByWebzenCash(int Result, const struct FString& ErrMsg, int LeftProductCount);
	bool BTWindowDefineInfoHK_BuyGiftByWebzenCash_OnOK(class UGUIComponent* Sender);
	void BTWindowDefineInfoHK_ButtonOK_OnTimeOut(class UGUIComponent* Sender);
	bool rfAckBuyItemByWebzenCash(int Result, const struct FString& ErrMsg);
	bool rfAckSendGift(int Result, const struct FString& ErrMsg, int PointRemain, int CashRemain);
	void BoughtItemMark(int BoughtItemID);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(TArray<int> ItemID);
	bool rfAckShopItemListStart(int Count);
	class UBTTcpLink_Channel* GetTcpChannel();
	void ShowWeaponList(int nCurIdx);
	void RefreshShop();
	void RefreshCashNPoint();
	bool internalKeyEvent(float Delta, unsigned char* key, unsigned char* Action);
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
	void TeamChatLog_Extra(const struct FString& cL);
	void BroadCastItemChatLog_Extra(const struct FString& cL);
	void SystemChatLog_Extra(const struct FString& cL);
	void SelfChatLog_Extra(const struct FString& cL);
	void WhisperChatLog_Extra(const struct FString& cL);
	void ClanChatLog_Extra(const struct FString& cL);
	void NormalChatLog_Extra(const struct FString& cL);
	void ClearChatLog_Extra();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	bool TPStore_TabButton_OnClick(class UGUIComponent* Sender);
};


// Class GUIWarfare.BTPageInventory
// 0x0080 (0x067C - 0x05FC)
class UBTPageInventory : public UBTNetGUIPageHK
{
public:
	int                                                MoveHeaderButtonID;                                       // 0x05FC(0x0004)
	int                                                LastReqRepairMode;                                        // 0x0600(0x0004)
	int                                                RepairAllButtonID;                                        // 0x0604(0x0004)
	struct FBtrDouble                                  SellShopItemInfo_UniqueItemID;                            // 0x0608(0x0008)
	struct FBtrDouble                                  Repair_UniqueItemID;                                      // 0x0610(0x0008)
	struct FString                                     strSellingSuccess[0x3];                                   // 0x0618(0x000C) (Localized, NeedCtorLink)
	struct FColor                                      CashColor;                                                // 0x063C(0x0004)
	struct FColor                                      PointColor;                                               // 0x0640(0x0004)
	class UBTMoneyInfo*                                MoneyInfoObject;                                          // 0x0644(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPInventoryHK*                            TPInventory;                                              // 0x0648(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTRefreshTime*                              rfEquipItemTime;                                          // 0x064C(0x0004)
	int                                                nCurQuickSlot;                                            // 0x0650(0x0004)
	class UBTOwnerDrawImageHK*                         LabelBackgrounddeco;                                      // 0x0654(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelBackgrounddeco;                                    // 0x0658(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	int                                                LastSelectIndex;                                          // 0x0668(0x0004)
	class UBTOwnerDrawImageHK*                         LabelSlot;                                                // 0x066C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     strLabelSlot;                                             // 0x0670(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageInventory");
		return ptr;
	}


	bool rfAckCouponUse(int Result, const struct FString& ErrMsg);
	bool Internal_KeyEvent(float Delta, unsigned char* key, unsigned char* Action);
	void RefreshSlotNum();
	bool rfAckUpdateQSlot(int Result, const struct FString& ErrMsg);
	bool rfAckModifyWeapon(int Result, const struct FString& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point, int Cash);
	bool rfAckSellShopItem(int Result, const struct FString& ErrMsg, int PointRemain, int CashRemain, int Count);
	bool rfAckSellShopItemInfo(int Result, const struct FString& ErrMsg, const struct FBtrDouble& UniqueItemID, int SellPoint, int CurPoint, int AfterPoint);
	bool BTWindowItemSellHK_OnSellOK(class UGUIComponent* Sender);
	bool rfAckRepairItem(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, int RepairCost, TArray<int> DamageDegree);
	bool rfAckRepairCost(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, TArray<int> RepairCost);
	bool RepairAllItem_OnOK(class UGUIComponent* Sender);
	bool BTWindowItemRepairAllHK_OnOK(class UGUIComponent* Sender);
	bool RepairItem_OnOK(class UGUIComponent* Sender);
	bool BTWindowItemRepairHK_OnOK(class UGUIComponent* Sender);
	bool rfReqConfirmSkillChanged();
	bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, unsigned char ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, unsigned char ChangedOldSlotPosition, int Result, const struct FString& ErrMsg);
	bool rfAckConfirmItemChanged(int Result, const struct FString& ErrMsg);
	bool rfAckEquipItem(int ChangedNewItemID, const struct FBtrDouble& ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, const struct FBtrDouble& ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, const struct FString& ErrMsg);
	void UpdateQuickSlot(int i);
	void UnequipQuickSlot(int ButtonID);
	void EquipMainQuickSlot();
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
	void TeamChatLog_Extra(const struct FString& cL);
	void BroadCastItemChatLog_Extra(const struct FString& cL);
	void SystemChatLog_Extra(const struct FString& cL);
	void SelfChatLog_Extra(const struct FString& cL);
	void WhisperChatLog_Extra(const struct FString& cL);
	void ClanChatLog_Extra(const struct FString& cL);
	void NormalChatLog_Extra(const struct FString& cL);
	void ClearChatLog_Extra();
	bool SkillListClick(class UGUIComponent* Sender);
	bool WeaponListClick(class UGUIComponent* Sender);
	bool ImageListBox_OnHover(class UGUIComponent* Sender);
	bool SubButton_OnClick(class UGUIComponent* Sender);
	bool SubButton_OnHover(class UGUIComponent* Sender);
	bool TPQSClick(class UGUIComponent* Sender);
	bool ImageListBox_OnlClick(class UGUIComponent* Sender);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void UpdateWebzenInvenListEnd(class UBTNetMainMenu* MainMenu);
	void UnequipItem(int ButtonID);
	bool TPInventoryQS_OnClick(class UGUIComponent* Sender);
	bool BTWindowModifyHK_OnOK(class UGUIComponent* Sender);
	void EquipQuickSlot();
	bool IsEnableEquipGrenade(int ItemID, int ItemID1);
	void EquipItemSlot();
	void UseItem();
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(TArray<int> ItemID);
	bool rfAckShopItemListStart(int Count);
};


// Class GUIWarfare.BTPageMyInfo
// 0x0004 (0x0600 - 0x05FC)
class UBTPageMyInfo : public UBTNetGUIPageHK
{
public:
	class UBTTPMyInfoAllHK*                            TPMyInfoAll;                                              // 0x05FC(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageMyInfo");
		return ptr;
	}


	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, unsigned char RankingType, unsigned char CommunityType, TArray<struct FString> CharName, TArray<int> CharLevel, TArray<struct FString> ClanName, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<int> ClanMarkBL, TArray<int> Ranking_Accum, TArray<int> Ranking_Accum_Prev, TArray<int> Ranking_Accum_Exp, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, unsigned char RankingType, unsigned char CommunityType, int TotalCount);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfAckDBCharInfo(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FString& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	class UBTTcpLink_Channel* GetTcpChannel();
	bool InternalOnKeyEvent(float Delta, unsigned char* key, unsigned char* KeyState);
	void InternalOnHideComboBoxList();
	void InternalOnChangeRankingComboBox();
	void InternalOnChangeFriendlyUser();
	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
	void TeamChatLog_Extra(const struct FString& cL);
	void BroadCastItemChatLog_Extra(const struct FString& cL);
	void SystemChatLog_Extra(const struct FString& cL);
	void SelfChatLog_Extra(const struct FString& cL);
	void WhisperChatLog_Extra(const struct FString& cL);
	void ClanChatLog_Extra(const struct FString& cL);
	void NormalChatLog_Extra(const struct FString& cL);
	void ClearChatLog_Extra();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void UnInitializeDelegate();
	void InitializeDelegate();
	void UpdateCharInfo(class UwMatchMaker* MM);
};


// Class GUIWarfare.BTPageClan
// 0x0738 (0x0D34 - 0x05FC)
class UBTPageClan : public UBTNetGUIPageHK
{
public:
	unsigned long                                      bReqClanInfo : 1;                                         // 0x05FC(0x0004)
	unsigned long                                      bDelayClanInvite : 1;                                     // 0x05FC(0x0004)
	unsigned long                                      bClanInviteState : 1;                                     // 0x05FC(0x0004)
	struct FString                                     DelayClanName;                                            // 0x0600(0x000C) (NeedCtorLink)
	class UBTRefreshTime*                              rfFriendPosTime;                                          // 0x060C(0x0004)
	struct FClanInfo                                   ClanInfo;                                                 // 0x0610(0x00A8) (NeedCtorLink)
	struct FString                                     strRecord;                                                // 0x06B8(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbPanelBackground[0x2];                                   // 0x06C4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         PanelBackground[0x2];                                     // 0x06E4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     strClanSecession[0x3];                                    // 0x06EC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strClanClose[0x3];                                        // 0x0710(0x000C) (Localized, NeedCtorLink)
	class UwMatchMaker*                                MatchMaker;                                               // 0x0734(0x0004) (Transient)
	float                                              LastRefreshTime;                                          // 0x0738(0x0004)
	float                                              RefreshCycleTime;                                         // 0x073C(0x0004)
	struct FFloatBox                                   fbLabelClanMark;                                          // 0x0740(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTLabelClanMarkHK*                          LabelClanMark;                                            // 0x0750(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelClanName;                                          // 0x0754(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelClanName;                                            // 0x0764(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     strLabel[0xF];                                            // 0x0768(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0xF];                                             // 0x081C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0xF];                                               // 0x090C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     strNoRankState;                                           // 0x0948(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbEdit[0xF];                                              // 0x0954(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FString                                     strEdit[0xF];                                             // 0x0A44(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawTextArrayHK*                     Edit[0xF];                                                // 0x0AF8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       ClanIntroduction;                                         // 0x0B34(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       ClanNotice;                                               // 0x0B38(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     strClanNotice;                                            // 0x0B3C(0x000C) (NeedCtorLink)
	class UBTAutoScrollListHK*                         ClanIntroduction2;                                        // 0x0B48(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTAutoScrollListHK*                         ClanNotice2;                                              // 0x0B4C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelTop[0x4];                                            // 0x0B50(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTop[0x4];                                         // 0x0B60(0x0010)
	struct FString                                     strButtonTop[0x4];                                        // 0x0BA0(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTop[0x4];                                           // 0x0BD0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLMember;                                              // 0x0BE0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLClanMemberHK*                          ACLMember;                                                // 0x0BF0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTCMClanUserListHK*                         CMClanUserList;                                           // 0x0BF4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelClanNews;                                          // 0x0BF8(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FString                                     strLabelClanNews;                                         // 0x0C08(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         LabelClanNews;                                            // 0x0C14(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLClanNews;                                            // 0x0C18(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLClanNewsHK*                            ACLClanNews;                                              // 0x0C28(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelClanWarResult;                                     // 0x0C2C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FString                                     strLabelClanWarResult;                                    // 0x0C3C(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         LabelClanWarResult;                                       // 0x0C48(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLClanWarResult;                                       // 0x0C4C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLClanWarResultHK*                       ACLClanWarResult;                                         // 0x0C5C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbListBottomButton[0x6];                                  // 0x0C60(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FString                                     strListBottomButton[0x6];                                 // 0x0CC0(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ListBottomButton[0x6];                                    // 0x0D08(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPChat;                                                 // 0x0D20(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPChatHK*                                 TPChat;                                                   // 0x0D30(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageClan");
		return ptr;
	}


	bool rfAckFriendPosition(int Result, const struct FString& TargetCharName, unsigned char ServerType, const struct FString& fServername, const struct FString& fServerShortName, const struct FString& fServerIP, int fServerPort, unsigned char CurPos, unsigned char CurState, int ChannelNum, const struct FString& ChannelNickName, int GameRoomNum);
	void UpdateRecv_ClanInfo(class UBTNetMainMenu* MainMenu);
	bool rfAckNotifyUpdateCharInfo_LevelMark(const struct FString& CharName, int LevelMarkID);
	bool rfAckChatWispher(int Result, const struct FString& ErrMsg, const struct FString& ToCharName);
	bool rfReqRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& ClanName, const struct FString& InviteMsg);
	bool rfAckNotifyAdjustClanMemberGrade(const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfAckAdjustClanMemberGrade(int Result, const struct FString& ErrMsg, const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfAckClanCharPersonelIntro(int Result, const struct FString& ErrMsg, const struct FString& PersonelIntro);
	bool BTWindowUserDetailInfoHK_OnClanInfo(class UGUIComponent* Sender);
	bool rfAckDBCharInfo(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FString& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckSearchClan(int Result, const struct FString& ErrMsg, int TotalPage, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<unsigned char> ClanMarkBL, TArray<struct FString> ClanName, TArray<struct FString> ClanMaster, TArray<int> ClanMember, TArray<int> ClanMemberMax, TArray<int> ClanCreateDate, TArray<int> ClanWin, TArray<int> ClanLose, TArray<int> ClanDraw, TArray<int> ClanRank, TArray<unsigned char> ClanRecruit, TArray<int> ClanLevel);
	bool rfAckClanPersonelIntro(int Result, const struct FString& ErrMsg);
	bool rfAckClanChangeInfo(int Result, const struct FString& ErrMsg);
	bool rfAckClanSecession(int Result, const struct FString& ErrMsg);
	bool rfAckClanClose(int Result, const struct FString& ErrMsg, const struct FString& ClanName);
	bool rfAckClanMatchResultHistory(TArray<struct FBtrDouble> MatchDate, TArray<unsigned char> IsWin, TArray<struct FString> EnemyClanname);
	bool rfAckClanNews(TArray<struct FString> IssueDate, TArray<unsigned char> IssueType, TArray<struct FString> IssuedClanMember);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserList(int Result, const struct FString& ErrMsg, TArray<int> Level, TArray<struct FString> CharName, TArray<unsigned char> ClanGrade, TArray<int> ClanWinCnt, TArray<int> ClanLoseCnt, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> DudeId);
	bool rfAckClanUserListStart(int Result, int TotalCount);
	void TeamChatLog(const struct FString& cL);
	void BroadCastItemChatLog(const struct FString& cL);
	void SystemChatLog(const struct FString& cL);
	void SelfChatLog(const struct FString& cL);
	void WhisperChatLog(const struct FString& cL);
	void ClanChatLog(const struct FString& cL);
	void NormalChatLog(const struct FString& cL);
	void ClearChatLog();
	class UBTTcpLink_Channel* GetTcpChannel();
	bool Internal_OnPreDraw(class UCanvas* C);
	bool internalKeyEvent(float Delta, unsigned char* key, unsigned char* Action);
	void InternalOnClose(bool bCanceled);
	bool CheckInviteUser(int CurPos, int CurState, const struct FString& szNickName);
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
// 0x0014 (0x0610 - 0x05FC)
class UBTPageCredit : public UBTNetGUIPageHK
{
public:
	struct FFloatBox                                   fbLabelCredit;                                            // 0x05FC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTLabelCreditAnimationHK*                   LabelCredit;                                              // 0x060C(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageCredit");
		return ptr;
	}


	void InternalOnClose(bool bCanceled);
	void InternalOnOpen();
	bool Internal_KeyEvent(float Delta, unsigned char* key, unsigned char* Action);
	void LabelCredit_OnEndCredit();
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
};


// Class GUIWarfare.BTPageClanWar
// 0x031C (0x0918 - 0x05FC)
class UBTPageClanWar : public UBTNetQuestInfoPageHK
{
public:
	unsigned long                                      bSend_sfReqClanMatchStartSearching : 1;                   // 0x05FC(0x0004)
	int                                                StartSearchingCheckTime;                                  // 0x0600(0x0004)
	int                                                StartRequestCount;                                        // 0x0604(0x0004)
	int                                                savedhour;                                                // 0x0608(0x0004)
	int                                                savedmin;                                                 // 0x060C(0x0004)
	unsigned long                                      bJoinClanState : 1;                                       // 0x0610(0x0004)
	unsigned long                                      bClanInviteState : 1;                                     // 0x0610(0x0004)
	int                                                TotalChannelUserCount;                                    // 0x0614(0x0004)
	struct FFloatBox                                   fbPanelBackground[0x2];                                   // 0x0618(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         PanelBackground[0x2];                                     // 0x0638(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelLPanelName;                                        // 0x0640(0x0010)
	struct FString                                     strLabelLPanelName;                                       // 0x0650(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         LabelLPanelName;                                          // 0x065C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelTop[0x3];                                            // 0x0660(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButtonTop[0x3];                                         // 0x066C(0x0010)
	struct FString                                     strButtonTop[0x3];                                        // 0x069C(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonTop[0x3];                                           // 0x06C0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLWaitingClan;                                         // 0x06CC(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTACLWaitingClanHK*                         ACLWaitingClan;                                           // 0x06DC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelSeparator;                                         // 0x06E0(0x0010)
	class UBTOwnerDrawImageHK*                         LabelSeparator;                                           // 0x06F0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelMPanelName;                                        // 0x06F4(0x0010)
	struct FString                                     strLabelMPanelName;                                       // 0x0704(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawImageHK*                         LabelMPanelName;                                          // 0x0710(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelMPanel[0x5];                                         // 0x0714(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelMPanel[0x5];                                       // 0x0728(0x0010)
	struct FString                                     strLabelMPanel[0x5];                                      // 0x0778(0x000C) (Localized, NeedCtorLink)
	class UBTComboBoxHK*                               ComboMPanel[0x4];                                         // 0x07B4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbComboMPanel[0x4];                                       // 0x07C4(0x0010)
	struct FFloatBox                                   fbSlideShowMap;                                           // 0x0804(0x0010)
	class UBTSlideShowImageHK*                         SlideShowMap;                                             // 0x0814(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelMemberList;                                        // 0x0818(0x0010)
	class UBTOwnerDrawImageHK*                         LabelMemberList;                                          // 0x0828(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbACLMemberList;                                          // 0x082C(0x0010)
	class UBTACLCWTeamMemberListHK*                    ACLMemberList;                                            // 0x083C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTCMCWMessengerTeamHK*                      CMMemberList;                                             // 0x0840(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPMessenger;                                            // 0x0844(0x0010)
	class UBTTPCWMessengerHK*                          TPMessenger;                                              // 0x0854(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbListBottomButton[0x5];                                  // 0x0858(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FString                                     strListBottomButton[0x6];                                 // 0x08A8(0x000C) (Localized, NeedCtorLink)
	class UBTOwnerDrawCaptionButtonHK*                 ListBottomButton[0x5];                                    // 0x08F0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbTPChat;                                                 // 0x0904(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPChatHK*                                 TPChat;                                                   // 0x0914(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageClanWar");
		return ptr;
	}


	bool rfNotifyClanLevelup(const struct FString& ClanName, int Levelup);
	bool rfAckClanMatch_NotifiyStartCombat(TArray<int> MapNumArray, int VersusMode);
	bool rfAckClanMatch_StartCombat(int Result, const struct FString& ErrMsg);
	bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber);
	bool rfAckClanMatch_StopSearching();
	bool rfAckClanMatch_NotifyStartSearching(int ShouldWaitMore);
	bool rfAckClanMatch_StartSearching(int Result, const struct FString& ErrMsg, int ShouldWaitMore);
	void BTWindowDefineARHK_OnTimeTick(float LeftTime);
	void BTWindowDefineARHK_ButtonOK_OnTimeOut(class UGUIComponent* Sender);
	bool BTWindowDefineARHK_ClanMatch_OnOK(class UGUIComponent* Sender);
	bool rfAckEnterChannel(int id, int UID, const struct FString& UserID, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckNotifyAdjustClanMemberGrade(const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfAckAdjustClanMemberGrade(int Result, const struct FString& ErrMsg, const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfReqRecvDeleteFriend(int Result, const struct FString& FromCharName);
	bool rfAckDeleteFriend(int Result, TArray<struct FString> FailedCharname);
	bool rfAckRecvJoinClanResult(int Result, const struct FString& ErrMsg);
	bool rfAckJoinClanResult(const struct FString& ClanName, unsigned char Permit, const struct FString& PermitCharName);
	bool RefreshPage_OnOK(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnSuspend(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnCancel(class UGUIComponent* Sender);
	bool BTWindowRequestApprovalClanHK_OnOK(class UGUIComponent* Sender);
	bool rfReqRecvJoinClan(int UserIdx, const struct FString& CharName, const struct FString& Message);
	bool rfAckNotifyClanSecession(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckNotifyNewClanMember(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckSearchClan(int Result, const struct FString& ErrMsg, int TotalPage, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<unsigned char> ClanMarkBL, TArray<struct FString> ClanName, TArray<struct FString> ClanMaster, TArray<int> ClanMember, TArray<int> ClanMemberMax, TArray<int> ClanCreateDate, TArray<int> ClanWin, TArray<int> ClanLose, TArray<int> ClanDraw, TArray<int> ClanRank, TArray<unsigned char> ClanRecruit, TArray<int> ClanLevel);
	bool rfAckInviteClanResult(const struct FString& CharName, unsigned char Permit, const struct FString& ClanNm);
	bool rfReqRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& ClanName, const struct FString& InviteMsg);
	bool rfAckJoinClan(int Result, const struct FString& ErrMsg, const struct FString& SpecificCharName, const struct FString& RealRecvCharName, unsigned char RealRecvCharClanGrade);
	bool rfAckInviteClan(int Result, const struct FString& ErrMsg);
	bool BTWindowUserDetailInfoHK_OnClanInfo(class UGUIComponent* Sender);
	bool rfReqClanCharPersonelIntro(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckClanCharPersonelIntro(int Result, const struct FString& ErrMsg, const struct FString& PersonelIntro);
	bool rfAckDBCharInfo(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FString& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool MoveToClanPage_OnOK(class UGUIComponent* Sender);
	bool rfAckCreateClan(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckDupCheckClanName(int Result, const struct FString& ErrMsg);
	bool WindowRequestFriend_OnCancel(class UGUIComponent* Sender);
	bool WindowRequestFriend_OnOK(class UGUIComponent* Sender);
	bool WindowInviteFriend_OnOK(class UGUIComponent* Sender);
	bool rfReqCompleteFriendInvite(const struct FString& CharnameToBeInvited, unsigned char IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfReqRecvFriendInvite(int ReqUserID, const struct FString& ReqCharname, const struct FString& InviteMsg);
	bool rfAckSendFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, TArray<int> UID, TArray<struct FString> UserID, TArray<int> UserLevels, TArray<struct FString> ClanName, TArray<int> ClanPattern, TArray<int> ClanBG, TArray<int> ClanBL, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<unsigned char> IsLookForClan, int Result, const struct FString& ErrMsg, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserList(int Result, const struct FString& ErrMsg, TArray<int> Level, TArray<struct FString> CharName, TArray<unsigned char> ClanGrade, TArray<int> ClanWinCnt, TArray<int> ClanLoseCnt, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> DudeId);
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfAckFriendListEnd();
	bool rfAckFriendList(TArray<struct FString> FriendName, TArray<unsigned char> IsLogOn, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> LevelMarkID, TArray<int> ClanLevel, TArray<int> Level, TArray<unsigned char> IsLookForClan);
	bool rfAckFriendListStart(int Result, int TotalCount);
	bool rfAckClanMatch_SetWaitRoomPublic(int Result, const struct FString& ErrMsg, unsigned char Set);
	bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, const struct FString& ErrMsg, TArray<int> MapNumArray, int VersusMode, const struct FString& WaitRoomName);
	void SelectMapIndex(int MPanelIndex, int MapID);
	bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, const struct FString& ErrMsg, TArray<int> MapNumArray, int VersusMode, unsigned char IsPublic);
	bool rfAckClanMatch_ChangeLeader(int Result, const struct FString& ErrMsg, int NewLeader, const struct FString& NewLeaderName);
	bool rfAckClanMatch_Leave(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_LeaveNotify(const struct FString& CharName);
	bool rfAckClanMatch_JoinNotify(unsigned char IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, const struct FString& CharName, int ClanGrade, int ClanWin, int ClanLose, const struct FString& ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckClanMatch_Chat(int Result, const struct FString& ErrMsg, const struct FString& Sender, const struct FString& Message);
	bool rfAckClanMatch_Join(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_GetReady(int Result, const struct FString& ErrMsg, int RoomIndex);
	void ChangeReadyRoomLeader(bool bLeader);
	bool rfAckClanMatch_MemberList(TArray<unsigned char> IsLeader, TArray<int> ClanMarkPA, TArray<int> ClanMarkBG, TArray<int> ClanMarkBL, TArray<int> Level, TArray<struct FString> CharName, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<struct FString> ClanName, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckClanMatch_WaittingTeamList(int TtotlCount, TArray<int> Grade, TArray<int> Map, TArray<int> Versus);
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
	void TeamChatLog(const struct FString& cL);
	void SystemChatLog(const struct FString& cL);
	void SelfChatLog(const struct FString& cL);
	void WhisperChatLog(const struct FString& cL);
	void ClanChatLog(const struct FString& cL);
	void NormalChatLog(const struct FString& cL);
	void ClearChatLog();
	class UBTTcpLink_Channel* GetTcpChannel();
	bool internalKeyEvent(float Delta, unsigned char* key, unsigned char* Action);
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
// 0x0078 (0x0674 - 0x05FC)
class UBTPageLucky : public UBTNetGUIPageHK
{
public:
	class UBTOwnerDrawImageHK*                         PageBackground;                                           // 0x05FC(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UTabControlMocker*                           TabControl;                                               // 0x0600(0x0004) (Edit, ExportObject, NeedCtorLink, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UGUITabPanel*                                TabPanels[0x3];                                           // 0x0604(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPLuckyCapsuleStore*                      tpCapsuleStore;                                           // 0x0610(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPLuckyCapsuleInventory*                  tpCapsuleInventory;                                       // 0x0614(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTPLuckyBlackBox*                          tpBlackBox;                                               // 0x0618(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbButton[0x3];                                            // 0x061C(0x0010)
	struct FString                                     strButton[0x3];                                           // 0x064C(0x000C) (Localized, NeedCtorLink)
	class UBTMoneyInfo*                                MoneyInfoObject;                                          // 0x0670(0x0004) (ExportObject, NeedCtorLink, EditInline)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTPageLucky");
		return ptr;
	}


	bool rfAckLuckShop_RewardCoupon(int ErrorCode, int Coupon_ItemTypeID, const struct FBtrDouble& Coupon_ItemUniqueID, int Coupon_Count_AfterReduction);
	bool rfAckLuckShop_RewardBuyingCount(int ErrorCode, int FinalCapsuleRewardState);
	bool rfAckLuckShop_StorageInfo(int ErrorCode, int BuyingCapsuleCount, int CapsuleRewardState);
	bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, unsigned char IsNotification, TArray<struct FString> NickName, TArray<struct FBtrDouble> Time, int GetItemID);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(TArray<int> ItemID);
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


	bool rfAckLogOut(unsigned char Result, unsigned char Reason);
	bool rfAckPCBangUserListEnd();
	bool rfAckPCBangUserList(TArray<struct FString> FriendName, TArray<unsigned char> IsLogOn, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> Level, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose);
	bool rfAckPCBangUserListStart(int Result, int TotalCount);
	bool rfAckEventNotify(int Type);
	bool rfAckErrorReportServerAddr(const struct FString& Addr, int Port);
	bool rfAckClientChecksum(int Result);
	bool rfAckClientChallenge(const struct FString& Key1, const struct FBtrDouble& Key2);
	bool rfAckCharInfo(int Result, const struct FString& CharName, int Level, int Exp, const struct FString& ClanName);
	bool rfAckFriendsListEnd();
	bool rfAckFriendsListStart(int Result, int TotalCount);
	bool rfAckClanMemberListFromClientEnd();
	bool rfAckClanMemberListFromClientStart(int Result, int TotalCount);
	bool rfReqForceLogoutByOwner();
	bool rfAckMaxUserExceed();
	bool Exit_OnOK(class UGUIComponent* Sender);
	bool rfAckLoginWithGlobal(int Result);
	bool rfAckLoginWithWZAuth(int Result, unsigned char wzp_AccountType, unsigned char wzp_IsBlock, unsigned char wzp_AuthKeySuccess, unsigned char ChannelType);
	bool rfAckClanMemberListFromClient(int Result, const struct FString& ErrMsg, TArray<int> Level, TArray<struct FString> CharName, TArray<unsigned char> ClanGrade, TArray<struct FString> ServerName, TArray<struct FString> ServerShortName, TArray<struct FString> ServerIP, TArray<int> serverPort, TArray<unsigned char> CurPos, TArray<int> ChannelNum, TArray<struct FString> ChannelNickName, TArray<int> GameRoomNum);
	bool rfAckFriendsList(unsigned char ListType, TArray<struct FString> UserName, TArray<unsigned char> IsLogOn, TArray<int> CMarkPattern, TArray<int> CMarkBG, TArray<int> CMarkBL, TArray<struct FString> ClanName, TArray<int> Level);
	bool rfReqFriendsList();
	bool rfAckProcessPreLoginUser(int Result, const struct FString& ErrMsg);
	bool rfAckLoginInHouseTest(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg, const struct FString& BDay, unsigned char Sex, const struct FBtrDouble& ServerTime);
	bool rfAckCreateChar(int Success, const struct FString& ErrMsg);
	bool rfAckServerList(TArray<struct FString> CServername, TArray<struct FString> CServerShortName, TArray<struct FString> ServerIP, TArray<int> serverPort, TArray<struct FString> ChannelName, TArray<struct FString> ChannelNickName, TArray<int> ChannelNum, TArray<int> chMaxUser, TArray<int> chCurUser, TArray<struct FString> ServerGroupName, TArray<int> ServerGroupID, TArray<int> ServerDispOrder, TArray<int> DataPort, TArray<unsigned char> OptionCount_byte, TArray<unsigned char> OptionKey_byte, TArray<unsigned char> OptionValue_byte, TArray<unsigned char> OptionCount_int, TArray<unsigned char> OptionKey_int, TArray<int> OptionValue_int, TArray<unsigned char> OptionCount_float, TArray<unsigned char> OptionKey_float, TArray<float> OptionValue_float, TArray<unsigned char> IsClanChannel, TArray<unsigned char> IsUseDedicateHost);
	bool rfAckLogin(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg);
	bool rfAckHash(int Result, const struct FString& Error);
	void OnError(int ErrCode);
	void OnClose(int ErrCode);
	void OnConnect(int ErrCode);
};


// Class GUIWarfare.BTWindowItemExpiredHK
// 0x0328 (0x07E8 - 0x04C0)
class UBTWindowItemExpiredHK : public UBTWindowHK
{
public:
	int                                                SavePoint;                                                // 0x04C0(0x0004)
	int                                                saveLevel;                                                // 0x04C4(0x0004)
	int                                                saveCash;                                                 // 0x04C8(0x0004)
	int                                                saveCCoin;                                                // 0x04CC(0x0004)
	class UBTNetMainMenu*                              MainMenu;                                                 // 0x04D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTTcpLink_Channel*                          TcpChannel;                                               // 0x04D4(0x0004)
	int                                                MyPoint;                                                  // 0x04D8(0x0004)
	int                                                myLevel;                                                  // 0x04DC(0x0004)
	int                                                MyCash;                                                   // 0x04E0(0x0004)
	int                                                MyCCoin;                                                  // 0x04E4(0x0004)
	int                                                RepairSumCost;                                            // 0x04E8(0x0004)
	int                                                RepairSumCash;                                            // 0x04EC(0x0004)
	int                                                RepairSumCCoin;                                           // 0x04F0(0x0004)
	struct FFloatBox                                   fbTPItemList;                                             // 0x04F4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTTPItemListHK*                             TPItemList;                                               // 0x0504(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbLabelDivider[0x2];                                      // 0x0508(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         LabelDivider[0x2];                                        // 0x0528(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     strLabel[0x5];                                            // 0x0530(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strPoint;                                                 // 0x056C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strCash;                                                  // 0x0578(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strCCoin;                                                 // 0x0584(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0x5];                                             // 0x0590(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelEdit[0x9];                                         // 0x05E0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0x5];                                               // 0x0670(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelEdit[0x9];                                           // 0x0684(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     strButtonSelectAll[0x2];                                  // 0x06A8(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonSelectAll;                                        // 0x06C0(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonSelectAll;                                          // 0x06D0(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbNEditBox[0x9];                                          // 0x06D4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTNumericEditBoxHK*                         NEditBox[0x9];                                            // 0x0764(0x0004) (ExportObject, NeedCtorLink, EditInline)
	TArray<int>                                        BuyExpiredItemList;                                       // 0x0788(0x000C) (NeedCtorLink)
	TArray<int>                                        BuyExpiredSlotPosList;                                    // 0x0794(0x000C) (NeedCtorLink)
	struct FBuyExpriedCashInfo                         BuyExpiredCashInfoList[0x4];                              // 0x07A0(0x000C) (NeedCtorLink)
	TArray<struct FBtrDouble>                          BuyExpiredUniqueList;                                     // 0x07D0(0x000C) (NeedCtorLink)
	TArray<int>                                        selectCashType;                                           // 0x07DC(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTWindowItemExpiredHK");
		return ptr;
	}


	bool CalculateCashSelect(int ListIndex, class UBTROItemBoxHK* Ro, int cashType);
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


	bool rfAckUseItemDuringGame(int ErrorCode, const struct FString& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, int RemainCount);
	bool rfReqAhnNotifyDisconnct(int Code);
	bool rfReqAhnHsObject(TArray<unsigned char> Data, int DataSize);
	bool rfAckSetCommunityOption(int Result, const struct FString& ErrStr);
	bool rfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite);
	bool rfChangeItemInstanceInfo(int ErrorCode, int ItemID, const struct FBtrDouble& ItemUniqueID, unsigned char ChangeCount, int RemainCount);
	bool rfAckLuckShop_RewardCoupon(int ErrorCode, int Coupon_ItemTypeID, const struct FBtrDouble& Coupon_ItemUniqueID, int Coupon_Count_AfterReduction);
	bool rfAckLuckShop_RewardBuyingCount(int ErrorCode, int FinalCapsuleRewardState);
	bool rfAckLuckShop_StorageInfo(int ErrorCode, int BuyingCapsuleCount, int CapsuleRewardState);
	bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, unsigned char IsNotification, TArray<struct FString> NickName, TArray<struct FBtrDouble> Time, int GetItemID);
	bool rfNotifyCouponUseError(int Time);
	bool rfReqNotifyShopItemDataEnd(int Ver);
	bool rfAckCouponUse(int Result, const struct FString& ErrMsg);
	bool rfReqNotifyShopItemData(TArray<int> ProductNo, TArray<struct FString> ProductName, TArray<int> ProductCode, TArray<unsigned char> SaleType, TArray<int> ProductCost, TArray<int> ProductHour, TArray<int> ProductQuantity, TArray<int> SaleMasterFlag, TArray<int> SaleStatus, TArray<int> IsGift, TArray<struct FBtrDouble> SaleEndTime, TArray<int> Discountcost);
	bool rfAckShopItemData();
	bool rfNotifyClanLevelup(const struct FString& ClanName, int Levelup);
	bool rfNotifyNewClanName(const struct FString& New_NickName);
	bool rfNotifyNewNickName(int Community_Type, const struct FString& Old_NickName, const struct FString& New_NickName);
	bool rfAckTencent_StartTenProtect(int CharDBID);
	bool rfAckMoveToLobby(unsigned char MessageType);
	bool rfAckPopUpMessage(int MessageType);
	bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckFriendPosition(int Result, const struct FString& TargetCharName, unsigned char ServerType, const struct FString& fServername, const struct FString& fServerShortName, const struct FString& fServerIP, int fServerPort, unsigned char CurPos, unsigned char CurState, int ChannelNum, const struct FString& ChannelNickName, int GameRoomNum);
	bool rfAckLogOut(unsigned char Result, unsigned char Reason);
	bool rfAckNotifyUpdateCharInfo_LevelMark(const struct FString& CharName, int LevelMarkID);
	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, unsigned char RankingType, unsigned char CommunityType, TArray<struct FString> CharName, TArray<int> CharLevel, TArray<struct FString> ClanName, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<int> ClanMarkBL, TArray<int> Ranking_Accum, TArray<int> Ranking_Accum_Prev, TArray<int> Ranking_Accum_Exp, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, unsigned char RankingType, unsigned char CommunityType, int TotalCount);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfAckClanMatchResultHistory(TArray<struct FBtrDouble> MatchDate, TArray<unsigned char> IsWin, TArray<struct FString> EnemyClanname);
	bool rfReqInGameRoomUserInfoChanged();
	bool rfAckServerType(unsigned char Type);
	bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, const struct FString& ErrMsg, TArray<int> MapNumArray, int VersusMode, unsigned char IsPublic);
	bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, const struct FString& RoomName, int MapNum, int CurUserCount, int MaxUserCount, unsigned char Status, unsigned char IsPublic);
	bool rfAckClanMatch_EndPublicWaitRoomList();
	bool rfAckClanMatch_PublicWaitRoomList(TArray<int> WaitRoomIdx, TArray<struct FString> LeaderName, TArray<struct FString> RoomName, TArray<int> MapNum, TArray<int> CurUserCount, TArray<int> MaxUserCount, TArray<unsigned char> Status);
	bool rfAckClanMatch_StartPublicWaitRoomList(int Result, const struct FString& ErrMsg, int Count);
	bool rfAckPaidItem_NotifyChangeClanname(const struct FString& NewClanname);
	bool rfAckPaidItem_ChangeClanname(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const struct FString& NewCharname);
	bool rfAckPaidItem_ChangeCharname(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const struct FString& NewCharname);
	bool rfAckNotifyEndTutorial(int UserID, const struct FString& CharName, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckNotifyStartTutorial(int Result, int UserID);
	bool rfAckGetMyMailBoxState(int Result, unsigned char IsFull, int NewMailCount);
	bool rfAckSetLookForClan(int Result, const struct FString& ErrMsg, unsigned char IsLookingFor);
	bool rfAckRoomUserPingInfo(TArray<int> UnqueID, TArray<int> Ping, int HostPriorityPoint);
	bool rfAckRecvSystemMsg(unsigned char CommunityType, const struct FSystemMsgParam& MsgInfo);
	bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID);
	bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID);
	bool rfAckForceDisconnectUser_GM(int Result, const struct FString& ErrMsg, const struct FString& CharName);
	bool rfAckNotice_GM(int Result, const struct FString& ErrMsg, unsigned char NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const struct FString& Msg);
	bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, const struct FString& NewRoomTitle);
	bool rfReqExteriorRoomOwnerInfo(int RoomNum, const struct FString& OwnerName, const struct FString& OwnerIP);
	bool rfAckCharBlockInfo(int Result, const struct FBtrDouble& ChatBlockStartTime, const struct FBtrDouble& ChatBlockEndTime, TArray<struct FBtrDouble> BlockedItemIdx);
	bool rfAckQuestGetAvailableEventList(int Result, const struct FString& ErrMsg, TArray<int> QuestID);
	bool rfAckPaidItem_NotifyChangeClanMark(const struct FString& ClanName, int Pattern, int BG, int BL);
	bool rfAckPaidItem_ChangeClanMark(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_ClanMarkDupCheck(int Result, const struct FString& ErrMsg);
	bool rfAckWebzenBillingUseStorageItem(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID, const struct FBtrDouble& ItemExtra);
	bool rfAckPaidItem_RelayBroadcast(const struct FString& CharName, const struct FString& Msg);
	bool rfAckPaidItem_BroadCast(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_EraseRecord(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int Command, int RemainCount);
	bool rfAckWebzenBillingStorageListEnd();
	bool rfAckWebzenBillingStorageList(TArray<int> Seq, TArray<int> ItemSeq, TArray<int> GroupCode, TArray<int> ShareFlag, TArray<int> ProductSeq, TArray<struct FString> CashName, TArray<struct FBtrDouble> CashPoint, TArray<struct FString> SendAccountID, TArray<struct FString> SendMessage, TArray<unsigned char> ItemType, TArray<unsigned char> RelationType, TArray<int> ProductType, TArray<int> PriceSeq);
	bool rfAckWebzenBillingStorageListStart(int Result, const struct FString& ErrMsg, int TotalCount, int TotalPage, int CurPage);
	bool rfAckRandomBox_Use(int Result, const struct FString& ErrMsg, const struct FBtrDouble& RandomBoxItemIdx, int RandomBxoItemCount, const struct FBtrDouble& KeyItemIdx, int KeyItemRemainCount, TArray<int> ItemIDChoose, TArray<int> PartIDChoose, TArray<int> PeriodOnChoosenItem, TArray<int> StackCountOnChoosenItem, TArray<unsigned char> bHave, TArray<struct FBtrDouble> ItemIdx, TArray<struct FBtrDouble> UntilTime, TArray<int> StackCount);
	bool rfAckRegisterMainPCBang(int Result, const struct FString& ErrMsg);
	bool rfReqIsPaidWebzenPCBang(unsigned char IsPaid);
	bool rfAckPCBangUserListEnd();
	bool rfAckPCBangUserList(TArray<struct FString> FriendName, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> Level, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<unsigned char> IsLookForClan, TArray<unsigned char> IsCombat, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckPCBangUserListStart(int Result, int TotalCount);
	bool rfAckGiftItemByWebzenCash(int Result, const struct FString& ErrMsg, int LeftProductCount);
	bool rfAckBuyItemByWebzenCash(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, const struct FString& ErrMsg, TArray<int> MapNumArray, int VersusMode, const struct FString& WaitRoomName);
	bool rfAckGetBotID(int Result, unsigned char RequestedAFCount, unsigned char RequestedRSACount, TArray<int> AFBotID, TArray<int> RSABotID);
	bool rfAckRegisteredPCBangInfo(int Result, const struct FString& ErrMsg, unsigned char IsRegisteredPCBang, unsigned char IsMainPCBang, const struct FString& PCBangName);
	bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckWebzenCash(int Result, const struct FString& ErrMsg, const struct FBtrDouble& PCoinCash, const struct FBtrDouble& CCoinCash);
	bool rfAckCheckEquipedWeaponDurability(int Result, TArray<struct FBtrDouble> ItemUniqueID, TArray<int> ItemSlotNum);
	bool rfReqClanMatch_InviteCrewResult(const struct FString& Invitee, int Result);
	bool rfReqClanMatch_RecvInviteCrew(const struct FString& Inviter, const struct FString& ServerIP, int Port, int WaittingID, const struct FString& Msg, int MapNum, int InviteUserChannelNum, const struct FString& LeaderName, const struct FString& RoomName);
	bool rfAckClanMatch_InviteCrew(int Result, const struct FString& ErrMsg);
	bool rfReqDailyQuestNewAvailable(TArray<int> ExpiredQuestID, TArray<int> NewQuestID);
	bool rfReqQuestNewAvailable(TArray<int> AchivedQuestID, TArray<int> NewQuestID, TArray<unsigned char> IsDailyQuest, TArray<int> ExpiredQuest);
	bool rfAckQuestUpdate(int Result, const struct FString& ErrMsg);
	bool rfAckQuestListEnd();
	bool rfAckQuestList(TArray<int> QuestID, TArray<int> CountPrograss, TArray<unsigned char> IsDailyQuest, TArray<unsigned char> IsComplete);
	bool rfAckSpecialQuestRank(TArray<struct FString> CharList);
	bool rfAckReceiveSpecialReward(int Result, int RewardedQuestID, unsigned char RewardedQuestIsComplete, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount);
	bool rfAckDailyRewardListThisMonth(TArray<unsigned char> Type, TArray<unsigned char> Number, TArray<int> ItemID, TArray<int> ItemCount);
	bool rfAckPuzzleList(int Result, unsigned char IsComplete, TArray<unsigned char> UpdatedNum, TArray<unsigned char> StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfAckAttendanceList(int Result, unsigned char IsComplete, unsigned char UpdatedNum, TArray<unsigned char> StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfAckQuestListStart(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_SetWaitRoomPublic(int Result, const struct FString& ErrMsg, unsigned char Set);
	bool rfAckClanMatch_StopSearching();
	bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber);
	bool rfAckClanMatch_FoundMatch();
	bool rfAckClanMatch_NotifyStartSearching(int ShouldWaitMore);
	bool rfAckClanMatch_StartSearching(int Result, const struct FString& ErrMsg, int ShouldWaitMore);
	bool rfAckClanMatch_ChangeLeader(int Result, const struct FString& ErrMsg, int NewLeader, const struct FString& NewLeaderName);
	bool rfAckClanMatch_WaittingTeamList(int TtotlCount, TArray<int> Grade, TArray<int> Map, TArray<int> Versus);
	bool rfAckClanMatch_Chat(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& Msg);
	bool rfAckClanMatch_Leave(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_MemberList(TArray<unsigned char> IsLeader, TArray<int> ClanMarkPA, TArray<int> ClanMarkBG, TArray<int> ClanMarkBL, TArray<int> Level, TArray<struct FString> CharName, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<struct FString> ClanName, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckClanMatch_LeaveNotify(const struct FString& CharName);
	bool rfAckClanMatch_JoinNotify(unsigned char IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, const struct FString& CharName, int ClanGrade, int ClanWin, int ClanLose, const struct FString& ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckClanMatch_Join(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_NotifiyStartCombat(TArray<int> MapNumArray, int VersusMode);
	bool rfAckClanMatch_StartCombat(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_GetReady(int Result, const struct FString& ErrMsg, int RoomIndex);
	bool rfAckLimitedListInChannel(int Result, TArray<int> LimitedMapID, TArray<int> LimitedModeID);
	bool rfAckRecvInviteGameRoomResult(int Result);
	bool rfReqRecvInviteGameRoom(const struct FString& InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, const struct FString& RoomUniqueID, int RoomNumber, const struct FString& RoomName, unsigned char RoomState, const struct FString& MapName, const struct FString& OwnerName, unsigned char GameMode, unsigned char WeaponLimit, unsigned char IsTeamBalance, const struct FString& Password, const struct FString& InviteCharName);
	bool rfAckInviteGameRoom(int Result, unsigned char Answer, const struct FString& GuestCharName);
	bool rfAckAutoChangedTeamUserList(TArray<int> UserID, TArray<int> TeamNum);
	bool rfAckGetItemFromItemBox(int Result, const struct FString& ErrMsg, int ItemIDChoose, int PartIDChoose, const struct FBtrDouble& BoxItemIdx, int BxoItemCount, unsigned char bHave, const struct FBtrDouble& ItemIdx, const struct FBtrDouble& UntilTime, int StackCount);
	bool rfAckItemListInItemBox(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemUniqueID, int BoxItemID, TArray<int> ItemID, TArray<int> PartID, unsigned char FromContent);
	bool rfReqRecvForceFailedClientLoading(int ErrCode);
	bool rfAckStartHolePunching(int Result, const struct FString& ErrMsg, int GameType, int ReqStartUserID);
	bool rfAckRegisterMyUdpInfo(int Result, const struct FString& ErrMsg);
	bool rfAckNotifyMyCharInfoToRoomUser(int Result, const struct FString& ErrMsg, int UID, const struct FString& UserName, int Grade, int TeamNum, unsigned char Statue, unsigned char IsHost, const struct FString& UserIP, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, unsigned char IsLookFor);
	bool rfReqNotifyDisconnectHostInLoading(int Result, const struct FString& ErrMsg, int HostID);
	bool rfReqRecvForceDisconnected_FromGM(int Result, const struct FString& ErrMsg);
	bool rfReqRecvNotice_FromGM(int Result, const struct FString& ErrMsg, TArray<struct FString> NoticeMsg, unsigned char IsFromDB);
	bool rfAckJoinClan(int Result, const struct FString& ErrMsg, const struct FString& SpecificCharName, const struct FString& RealRecvCharName, unsigned char RealRecvCharClanGrade);
	bool rfAckExceedMaxUser();
	bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, TArray<int> UID, TArray<struct FString> CharName, TArray<int> UserLevel, TArray<struct FString> ClanName, TArray<int> ClanPattern, TArray<int> ClanBG, TArray<int> ClanBL, TArray<unsigned char> IsLookForClan, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfReqRecvDeleteFriend(int Result, const struct FString& FromCharName);
	bool rfAckDeleteFriend(int Result, TArray<struct FString> FailedCharname);
	bool rfAckChatWispher(int Result, const struct FString& ErrMsg, const struct FString& ToCharName);
	bool rfAckNotifyAdjustClanMemberGrade(const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfReqNotifyDurabilityZeroItem(int Result, const struct FString& ErrMsg, int UserID, TArray<struct FBtrDouble> ItemUniqueIDs, TArray<int> ItemIDs, TArray<int> ItemPartIDs, TArray<unsigned char> ItemSlotPos);
	bool rfAckAcquirePromotionItems(int UID, int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> ItemUniqueID, TArray<int> ItemIDs, TArray<int> PartIDs);
	bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, TArray<int> ItemID, TArray<int> PartID);
	bool rfAckBlockUserList(TArray<struct FString> CharName);
	bool rfAckRemoveBlockUserList(int Result, const struct FString& ErrMsg);
	bool rfAckBlockUserListEnd();
	bool rfAckAddBlockUserList(int Result, const struct FString& ErrMsg);
	bool rfAckBlockUserListStart(int Result, int TotalCount);
	bool rfAckAdjustClanMemberGrade(int Result, const struct FString& ErrMsg, const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfReqClanCharPersonelIntro(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckRecvJoinClanResult(int Result, const struct FString& ErrMsg);
	bool rfAckJoinClanResult(const struct FString& ClanName, unsigned char Permit, const struct FString& PermitCharName);
	bool rfAckNotifyClanSecession(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckNotifyNewClanMember(const struct FString& ClanName, const struct FString& CharName);
	bool rfReqRecvJoinClan(int UserIdx, const struct FString& CharName, const struct FString& Message);
	bool rfAckRecvClanInviteResult(int Result, const struct FString& ErrMsg);
	bool rfAckInviteClanResult(const struct FString& CharName, unsigned char Permit, const struct FString& ClanNm);
	bool rfAckInviteClan(int Result, const struct FString& ErrMsg);
	bool rfReqRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& ClanName, const struct FString& InviteMsg);
	bool rfAckGetIsHostBlocking(int Result, unsigned char Blocking);
	bool rfAckNotifyHostBlocking(int Result, unsigned char Blocking);
	bool rfAckGetHolePunchingResult(int Result, unsigned char Phrase, int InterventionUserID, unsigned char Intervention, TArray<int> FailedUserIDs);
	bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint);
	bool rfReqNotifyRelayServerAddr(const struct FString& RelayIP, int RelayPort);
	bool rfReqRecvForceDisconnectUDPFromHost(int Result);
	bool rfAckForceDisconnectUDPFromHost(int Result);
	bool rfReqNotifyChangeRoomState(unsigned char RoomState);
	bool rfAckClanCharPersonelIntro(int Result, const struct FString& ErrMsg, const struct FString& PersonelIntro);
	bool rfAckDBCharInfo(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FString& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckSearchClan(int Result, const struct FString& ErrMsg, int TotalPage, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<unsigned char> ClanMarkBL, TArray<struct FString> ClanName, TArray<struct FString> ClanMaster, TArray<int> ClanMember, TArray<int> ClanMemberMax, TArray<int> ClanCreateDate, TArray<int> ClanWin, TArray<int> ClanLose, TArray<int> ClanDraw, TArray<int> ClanRank, TArray<unsigned char> ClanRecruit, TArray<int> ClanLevel);
	bool rfAckClanPersonelIntro(int Result, const struct FString& ErrMsg);
	bool rfAckClanChangeInfo(int Result, const struct FString& ErrMsg);
	bool rfAckClanSecession(int Result, const struct FString& ErrMsg);
	bool rfAckClanClose(int Result, const struct FString& ErrMsg, const struct FString& ClanName);
	bool rfAckClanNews(TArray<struct FString> IssueDate, TArray<unsigned char> IssueType, TArray<struct FString> IssuedClanMember);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserList(int Result, const struct FString& ErrMsg, TArray<int> Level, TArray<struct FString> CharName, TArray<unsigned char> ClanGrade, TArray<int> ClanWinCnt, TArray<int> ClanLoseCnt, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> DudeId);
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfAckClanInfo(const struct FClanInfo& stClanInfo);
	bool rfAckDupCheckClanName(int Result, const struct FString& ErrMsg);
	bool rfAckCreateClan(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckGetServerTime(const struct FBtrDouble& ServerTime, const struct FString& ClientIP);
	bool rfAckMyMoney(int Result, const struct FString& ErrMsg, int Point, int Cash);
	bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, const struct FString& ErrMsg);
	bool rfAckNotifyExpiredSkillIDs(int UserID, TArray<struct FBtrDouble> ExpiredSkillUniqueIDs, TArray<int> ExpiredSkillIDs, int Result, const struct FString& ErrMsg, TArray<unsigned char> ExpiredSkillSlotPositions);
	bool rfAckNotifyExpiredItemIDs(int UserID, TArray<struct FBtrDouble> ExpiredItemUniqueIDs, TArray<int> ExpiredItemIDs, TArray<int> ExpiredItemPartIDs, TArray<unsigned char> ExpiredItemSlotPos, int Result, const struct FString& ErrMsg);
	bool rfAckGetAttachedItemFromMemo(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID);
	bool rfAckDeleteMailAll(int Result, unsigned char MailType, int Count);
	bool rfAckDelMemo(int Result, const struct FString& ErrMsg, TArray<int> FailedMemoID);
	bool rfAckSendMemo(TArray<struct FString> CnamesToFail, TArray<int> ResultArray);
	bool rfAckAuctionBidding(int Result, const struct FString& ErrMsg, int PointRemain);
	bool rfAckAuctionTradeHistory(int Result, const struct FString& ErrMsg, int ItemID, int PartID, TArray<struct FString> SellerCharNm, TArray<int> DamageDegree, TArray<int> Price);
	bool rfAckSendGift(int Result, const struct FString& ErrMsg, int PointRemain, int CashRemain);
	bool rfAckRecvMemo(const struct FString& cnameFrom, unsigned char MemoType);
	bool rfAckReadMemo(const struct FString& cnameFrom, const struct FString& Text, const struct FString& dateRecv, const struct FBtrDouble& ItemUID);
	bool rfAckEndMemoList();
	bool rfAckTestDouble(const struct FBtrDouble& vDouble, TArray<struct FBtrDouble> vDoubles);
	bool rfAckMemoList(TArray<int> MemoIdx, TArray<struct FString> cnameFrom, TArray<struct FString> dateRecv, TArray<struct FString> Text, TArray<unsigned char> Status, TArray<int> UntilExpire, TArray<struct FBtrDouble> ItemUID, TArray<int> ItemID, TArray<unsigned char> MsgType, TArray<int> ItemPartID);
	bool rfAckStartMemoList(int Result, const struct FString& ErrMsg, unsigned char Type, int TotalCount);
	bool rfAckFriendListEnd();
	bool rfAckFriendList(TArray<struct FString> FriendName, TArray<unsigned char> IsLogOn, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> LevelMarkID, TArray<int> ClanLevel, TArray<int> Level, TArray<unsigned char> IsLookForClan);
	bool rfAckFriendListStart(int Result, int TotalCount);
	bool rfReqCompleteFriendInvite(const struct FString& CharnameToBeInvited, unsigned char IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfReqRecvFriendInvite(int ReqUserID, const struct FString& ReqCharname, const struct FString& InviteMsg);
	bool rfAckSendFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfAckNotifyLoadingState(int Result, int UserID, unsigned char LoadingState);
	bool rfAckFailedStartGame(int Result, const struct FString& ErrMsg, unsigned char IsHost, int FailedUserID, int LoadingStep);
	bool rfAckSuccessStartGame(int Result, const struct FString& ErrMsg, unsigned char IsHost, const struct FString& HostIP, int HostPort, int LoadingStep);
	bool rfAckHash(int Result, const struct FString& Error);
	bool rfReqForceLogoutByOwner();
	bool ForceLogout_OnOK(class UGUIComponent* Sender);
	bool rfAckSellShopItemInfo(int Result, const struct FString& ErrMsg, const struct FBtrDouble& UniqueItemID, int SellPoint, int CurPoint, int AfterPoint);
	bool rfReqRecvChatWispher(const struct FString& CharnameFrom, const struct FString& Message);
	bool rfAckServerTime(int Time);
	bool rfAckGameOverEnd(int Result, const struct FString& ErrMsg);
	bool rfAckRepairItem(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, int RepairCost, TArray<int> DamageDegree);
	bool rfAckRepairCost(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, TArray<int> RepairCost);
	bool rfAckUpdateWeaponDurability(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, TArray<int> Durability, TArray<unsigned char> IsDestroy, TArray<struct FBtrDouble> FailedWeaponUniqueID);
	bool rfAckEntryQSlotUniqueIDList(int UserNum, TArray<unsigned char> QSlotDispOrder, TArray<struct FBtrDouble> MWUniqueID, TArray<struct FBtrDouble> PistolUniqueID, TArray<struct FBtrDouble> TW1UniqueID, TArray<struct FBtrDouble> TW2UniqueID);
	bool rfAckEntryQSlotIDList(int UserNum, TArray<unsigned char> QSlotDispOrder, TArray<int> MWItemID, TArray<int> MWPartID, TArray<int> MWPaintID, TArray<int> PistolItemID, TArray<int> PistolPartID, TArray<int> PistolPaintID, TArray<int> TWItemID1, TArray<int> TWItemID2, TArray<int> Skill1ID, TArray<int> Skill2ID, TArray<int> Skill3ID, TArray<int> Skill4ID);
	bool rfAckUpdateQSlot(int Result, const struct FString& ErrMsg);
	bool rfAckQSlotList(int Result, const struct FString& ErrMsg, TArray<int> QSlotID, TArray<struct FString> QSlotName, TArray<unsigned char> QSlotDispOrder, TArray<struct FBtrDouble> MWItemID, TArray<struct FBtrDouble> PistolItemID, TArray<struct FBtrDouble> TWItemID1, TArray<struct FBtrDouble> TWItemID2, TArray<int> Skill1, TArray<int> Skill2, TArray<int> Skill3, TArray<int> Skill4);
	bool rfAckModifyWeapon(int Result, const struct FString& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point, int Cash);
	bool rfAckSellShopItem(int Result, const struct FString& ErrMsg, int PointRemain, int CashRemain, int Count);
	bool rfAckBuyShopItem(int ItemCount, TArray<int> Result, TArray<int> BoughtItemTypeID, TArray<struct FBtrDouble> BoughtItemUniqueID, TArray<int> BoughtPartID, TArray<struct FBtrDouble> BoughtUntilTIme, TArray<int> BoughtStackCnt, int PointRemain, int CashRemain);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(TArray<int> ItemID);
	bool rfAckShopItemListStart(int Count);
	bool rfReqConfirmSkillChanged();
	bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, unsigned char ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, unsigned char ChangedOldSlotPosition, int Result, const struct FString& ErrMsg);
	bool rfAckEntrySkillList(TArray<int> UserIDs, TArray<int> SkillIDs, TArray<int> SlotPositions, int Result, const struct FString& ErrMsg);
	bool rfAckUserSkillListEnd();
	bool rfAckUserSkillList(TArray<int> UniqueSkillID, TArray<int> SkillID, TArray<struct FBtrDouble> UntilTime, TArray<unsigned char> SlotPosition);
	bool rfAckUserSkillListStart(int Count, int Result, const struct FString& ErrMsg);
	bool rfAckGetBootyChoose(int Result, const struct FString& ErrMsg, unsigned char GiveType, const struct FBtrDouble& ItemUniqueNumber, int ItemID, int PartID, unsigned char ItemType, const struct FBtrDouble& UntilTime, int StackCount, int PaintID);
	bool rfAckGetBooty(int Result, const struct FString& ErrMsg, TArray<int> PrizeWinUserID, TArray<int> BootyItemID, TArray<int> BootyPartsID);
	bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, const struct FString& ErrMsg);
	bool rfAckEntryItemList(TArray<int> UserIDs, TArray<int> ItemIDs, TArray<int> SlotPositions, TArray<int> AddPartsID, TArray<struct FBtrDouble> UniqueID, TArray<int> PaintID, int Result, const struct FString& ErrMsg);
	bool rfAckRegisterOtherUdpInfo(int UID, const struct FString& IP, int Port, unsigned char NatType, unsigned char Intervention, const struct FString& HostInnerIP, int HostInnerPort);
	bool rfReqForceNatTypeSetting(int NatType);
	bool rfReqStartNatDiag(const struct FString& Server1Addr, int Server1Port, const struct FString& Server2Addr, int Server2Port);
	bool rfAckChangeUserState(int Result, const struct FString& ErrMsg, TArray<int> UserIDs, TArray<unsigned char> Positions, TArray<int> Numbers, TArray<unsigned char> OldStates, TArray<unsigned char> NewStates);
	bool rfReqExteriorRoomState(int RoomNumber, unsigned char RoomState);
	bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount);
	bool rfReqExteriorRoomInfo(int SP, int RoomNumber, unsigned char IsPW, const struct FString& RoomName, const struct FString& MapName, const struct FString& ModeName, int MapNum, int ModeNum, unsigned char IsTeamBalance, int MaxUserCount, int RoomUserCount, unsigned char RoomState, unsigned char BotDifficult, unsigned char WeaponLimit, unsigned char BotModeUserTeamNum);
	bool rfAckCharInfo(int Result, const struct FString& ErrMsg, int UserID, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FCharInfo& stCharInfo, unsigned char InClanRank, int ClanLevel);
	bool rfAckConfirmItemChanged(int Result, const struct FString& ErrMsg);
	bool rfAckEquipItem(int ChangedNewItemID, const struct FBtrDouble& ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, const struct FBtrDouble& ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, const struct FString& ErrMsg);
	bool rfAckChangeRoomSetting(int Result, const struct FString& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfAckAIRewardResult(unsigned char ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, TArray<int> ScoreRewardUserID, TArray<unsigned char> ScoreRewardTYPE, TArray<int> ScoreRewardID, TArray<int> ScoreRewardCount);
	bool rfAckUpdateScore(TArray<int> UserIDs, TArray<struct FString> NickNames, TArray<unsigned char> TeamIDs, TArray<int> Scores, TArray<int> Kills, TArray<int> Assists, TArray<int> Deaths, TArray<int> EXPs, TArray<int> EXPBonuses, TArray<int> Points, TArray<int> PointBonuses, TArray<int> TeamScores, TArray<int> BonusOwnerID, TArray<int> BonusID);
	bool rfAckConnectGame(int UserID, int Result);
	bool rfAckMyEquipedQSlotList(TArray<unsigned char> QSlotDispOrder, TArray<struct FBtrDouble> MWUniqueID, TArray<int> MWItemID, TArray<int> MWPartID, TArray<int> MWPaintID, TArray<struct FBtrDouble> PistolUniqueID, TArray<int> PistolItemID, TArray<int> PistolPartID, TArray<int> PistolPaintID, TArray<struct FBtrDouble> TW1UniqueID, TArray<int> TWItemID1, TArray<struct FBtrDouble> TW2UniqueID, TArray<int> TWItemID2, TArray<int> Skill1ID, TArray<int> Skill2ID, TArray<int> Skill3ID, TArray<int> Skill4ID, int Result);
	bool rfAckMyEquipedSkillList(TArray<int> SkillIDs, TArray<int> SlotPositions, int Result);
	bool rfAckMyEquipedItemList(TArray<int> ItemIDs, TArray<int> SlotPositions, TArray<int> AddPartsID, TArray<int> PaintID, TArray<struct FBtrDouble> UniqueID, int Result);
	bool rfAckChangeNewGuest(const struct FString& HostIP);
	bool rfAckChangeHost(unsigned char ClientNum);
	bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, const struct FString& ErrMsg);
	bool rfAckDisconnectGame(int Result, int DisconnectUserID, const struct FString& DisconnectUserName);
	bool rfReqRelayServerOff();
	bool rfReqRelayServerOn(const struct FString& RelayServerIP, int RelayServerPortNum);
	bool rfAckGameRoomInfo(int Result, const struct FString& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfAckGameOver(int UID, int GameRoomNumber, int Result, const struct FString& ErrMsg);
	bool rfAckChangeGameMode(int GameNum, int UID, const struct FString& GameMode, unsigned char GameModeNum, int Result, const struct FString& ErrMsg);
	bool rfAckSelectMap(int GameNum, int UID, const struct FString& MapName, int Result, const struct FString& ErrMsg);
	bool rfAckIsGameRoomPlaying(int GameRoomNum, unsigned char IsPlaying);
	bool rfAckGameRoomDestroy(int GameRoomNum);
	bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, const struct FString& ErrMsg);
	bool rfAckGameHostInfo(int GameNumber, const struct FString& UserID, const struct FString& IP, int Port, int Result, const struct FString& ErrMsg);
	bool rfAckChangeTeam(int GameNumber, const struct FString& UserID, int UID, int TeamNum, int Result, const struct FString& ErrMsg);
	bool rfAckCreateGameRoom(int Result, const struct FString& ErrMsg, int UserID, const struct FString& RoomOwnerIP, const struct FGameRoomInfo& NetRoomInfo);
	bool rfAckLeaveRoom(int Num, int UID, const struct FString& UserID, int Result, const struct FString& ErrMsg);
	bool rfAckRoomUserList(TArray<int> UID, TArray<struct FString> UserName, TArray<int> Grade, TArray<int> TeamNum, TArray<unsigned char> Statue, TArray<unsigned char> IsHost, TArray<struct FString> UserIP, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<unsigned char> IsLookingFor, TArray<int> GMUID, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, const struct FString& UserID, int TeamNum, int Grade, const struct FString& UserIP, const struct FString& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckChatClan(const struct FString& CharName, const struct FString& Message, int Result);
	bool rfAckChatNormal(int id, const struct FString& Sender, const struct FString& Message, int Result);
	bool rfAckRoomListEnd();
	bool rfAckRoomList(TArray<int> GameNum, TArray<struct FString> Title, TArray<struct FString> MapName, TArray<int> MapNum, TArray<unsigned char> UserCount, TArray<unsigned char> MaxCount, TArray<struct FString> ModeName, TArray<int> ModeNum, TArray<unsigned char> WeaponLimit, TArray<unsigned char> IsHardCore, TArray<unsigned char> Status, TArray<struct FString> RoomOwnerIP, TArray<int> GameMinute, TArray<struct FString> RoomOwnerName, TArray<unsigned char> IsSpecial, TArray<unsigned char> IsPassword, TArray<unsigned char> BotDifficult, TArray<unsigned char> BotModeUserTeamNum);
	bool rfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex);
	bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, TArray<int> UID, TArray<struct FString> UserID, TArray<int> UserLevels, TArray<struct FString> ClanName, TArray<int> ClanPattern, TArray<int> ClanBG, TArray<int> ClanBL, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<unsigned char> IsLookForClan, int Result, const struct FString& ErrMsg, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckLogin2(int Result, const struct FString& ErrMsg, int UserID, const struct FString& CharName, const struct FBtrDouble& CurServerTime, int CharDBID, unsigned char IsGM);
	bool rfAckLeaveChannel(int Result, const struct FString& UserID, int UID);
	bool rfAckEnterChannel(int id, int UID, const struct FString& UserID, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckChannelList(TArray<int> id, TArray<struct FString> Title, TArray<int> CurUser, TArray<int> MaxUser);
	bool rfAckAuctionInstantlyBuying(int Result, const struct FString& ErrMsg, int PointRemain);
	bool rfAckAuctionMyItemCancel(int Result, const struct FString& ErrMsg);
	bool rfAckAuctionItemListEnd(unsigned char Section);
	bool rfAckAuctionItemList(unsigned char Section, TArray<int> UniqueIDs, TArray<int> ItemIDs, TArray<int> AddPartsIDs, TArray<struct FBtrDouble> UntilTimes, TArray<int> BiddingPrices, TArray<int> InstantlyByuingPrices, TArray<int> ItemDamageds, TArray<struct FString> HighestBidderNames, TArray<struct FString> SellerNames, TArray<int> ItemCount);
	bool rfAckAuctionItemListStart(int Result, const struct FString& ErrMsg, unsigned char Section, int PageNum, int Count);
	bool rfAckAuctionItemListCount(int Result, const struct FString& ErrMsg, unsigned char Section, unsigned char Classfy, int ItemType, int ItemGrade, int Count);
	bool rfAckAuctionMyItemRegister(int Result, const struct FString& ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain);
	bool rfAckItemListEnd();
	bool rfAckItemList(TArray<struct FBtrDouble> UniqueID, TArray<int> ItemID, TArray<int> ItemType, TArray<int> Durability, TArray<struct FBtrDouble> UntilTime, TArray<int> SlotPosition, TArray<int> AddPartsID, TArray<int> DamageDegree, TArray<unsigned char> ItemState, TArray<int> StackCount, TArray<int> PaintID, TArray<int> TradeCount);
	bool rfAckItemListStart(int Count, int Result, const struct FString& ErrMsg);
	bool rfAckLogin(int Result, const struct FString& ErrMsg, int UserID, const struct FString& CharName, const struct FString& ClanName, const struct FCharInfo& btCharInfo);
	void OnError(int ErrCode);
	void OnClose(int ErrCode);
	void OnConnect(int ErrCode);
};


// Class GUIWarfare.BTLabelNoticeHK
// 0x001C (0x03D8 - 0x03BC)
class UBTLabelNoticeHK : public UBTOwnerDrawImageHK
{
public:
	struct FString                                     strNotice;                                                // 0x03BC(0x000C) (Localized, NeedCtorLink)
	class UBTNetMainMenu*                              MainMenu;                                                 // 0x03C8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	float                                              DeltaMultiplier;                                          // 0x03CC(0x0004)
	struct FScriptDelegate                             __OnNextNotice__Delegate;                                 // 0x03D0(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTLabelNoticeHK");
		return ptr;
	}


	void Internal_OnRendered(class UCanvas* C);
	void SetMainMenu(class UBTNetMainMenu* MM);
	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void OnNextNotice(const struct FString& NextNotice);
};


// Class GUIWarfare.BTTPAASHK
// 0x0044 (0x037C - 0x0338)
class UBTTPAASHK : public UBTTabPanelHK
{
public:
	class UBTNetMainMenu*                              MainMenu;                                                 // 0x0338(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTMultiLineEditBoxHK*                       AAS;                                                      // 0x033C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	float                                              NextAAS;                                                  // 0x0340(0x0004)
	float                                              LastTime;                                                 // 0x0344(0x0004)
	unsigned long                                      bSelfTopMenuOwner : 1;                                    // 0x0348(0x0004)
	unsigned long                                      bSlidingTabPanel : 1;                                     // 0x0348(0x0004)
	unsigned long                                      bShowing : 1;                                             // 0x0348(0x0004)
	float                                              SlideTime;                                                // 0x034C(0x0004)
	float                                              SlideMultiplier;                                          // 0x0350(0x0004)
	struct FFloatBox                                   ShowAWinFrame;                                            // 0x0354(0x0010)
	struct FFloatBox                                   HideAWinFrame;                                            // 0x0364(0x0010)
	struct FScriptDelegate                             __OnNextAAS__Delegate;                                    // 0x0374(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.BTTPAASHK");
		return ptr;
	}


	void InitComponent(class UGUIController* MyController, class UGUIComponent* myOwner);
	void SetMainMenu(class UBTNetMainMenu* MM);
	bool Internal_OnPreDraw(class UCanvas* C);
	void OnNextAAS(const struct FString& NextAAS);
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


	bool rfAckProcessPreLoginUser(int Result, const struct FString& ErrMsg);
	bool rfAckLoginInHouseTest(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg, const struct FString& BDay, unsigned char Sex, const struct FBtrDouble& ServerTime);
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


	bool rfAckUseItemDuringGame(int ErrorCode, const struct FString& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, int RemainCount);
	bool rfNotifyClanLevelup(const struct FString& ClanName, int Levelup);
	bool rfNotifyNewClanName(const struct FString& New_NickName);
	bool rfNotifyNewNickName(int Community_Type, const struct FString& Old_NickName, const struct FString& New_NickName);
	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, unsigned char RankingType, unsigned char CommunityType, TArray<struct FString> CharName, TArray<int> CharLevel, TArray<struct FString> ClanName, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<int> ClanMarkBL, TArray<int> Ranking_Accum, TArray<int> Ranking_Accum_Prev, TArray<int> Ranking_Accum_Exp, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, unsigned char RankingType, unsigned char CommunityType, int TotalCount);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfAckFriendPosition(int Result, const struct FString& TargetCharName, unsigned char ServerType, const struct FString& fServername, const struct FString& fServerShortName, const struct FString& fServerIP, int fServerPort, unsigned char CurPos, unsigned char CurState, int ChannelNum, const struct FString& ChannelNickName, int GameRoomNum);
	bool rfAckNotifyUpdateCharInfo_LevelMark(const struct FString& CharName, int LevelMarkID);
	bool rfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel);
	bool rfReqInGameRoomUserInfoChanged();
	bool rfAckNotifyAdjustClanMemberGrade(const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfAckRoomUserPingInfo(TArray<int> UnqueID, TArray<int> Ping, int HostPriorityPoint);
	bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, const struct FString& NewRoomTitle);
	bool rfAckCheckEquipedWeaponDurability(int Result, TArray<struct FBtrDouble> ItemUniqueID, TArray<int> ItemSlotNum);
	bool rfAckGetBotID(int Result, unsigned char RequestedAFCount, unsigned char RequestedRSACount, TArray<int> AFBotID, TArray<int> RSABotID);
	bool rfAckAutoChangedTeamUserList(TArray<int> UserID, TArray<int> TeamNum);
	bool rfReqRecvForceFailedClientLoading(int ErrCode);
	bool rfAckStartHolePunching(int Result, const struct FString& ErrMsg, int GameType, int ReqStartUserID);
	bool rfAckRegisterMyUdpInfo(int Result, const struct FString& ErrMsg);
	bool rfAckNotifyMyCharInfoToRoomUser(int Result, const struct FString& ErrMsg, int UID, const struct FString& UserName, int Grade, int TeamNum, unsigned char Statue, unsigned char IsHost, const struct FString& UserIP, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, unsigned char IsLookFor);
	bool rfReqNotifyDisconnectHostInLoading(int Result, const struct FString& ErrMsg, int HostID);
	bool rfReqRecvDeleteFriend(int Result, const struct FString& FromCharName);
	bool rfAckDeleteFriend(int Result, TArray<struct FString> FailedCharname);
	bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, TArray<int> UID, TArray<struct FString> CharName, TArray<int> UserLevel, TArray<struct FString> ClanName, TArray<int> ClanPattern, TArray<int> ClanBG, TArray<int> ClanBL, TArray<unsigned char> IsLookForClan, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckChatWispher(int Result, const struct FString& ErrMsg, const struct FString& ToCharName);
	bool rfAckAcquirePromotionItems(int UID, int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> ItemUniqueID, TArray<int> ItemIDs, TArray<int> PartIDs);
	bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, TArray<int> ItemID, TArray<int> PartID);
	bool rfReqClanCharPersonelIntro(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckClanCharPersonelIntro(int Result, const struct FString& ErrMsg, const struct FString& PersonelIntro);
	bool rfAckRecvJoinClanResult(int Result, const struct FString& ErrMsg);
	bool rfAckJoinClanResult(const struct FString& ClanName, unsigned char Permit, const struct FString& PermitCharName);
	bool rfAckNotifyClanSecession(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckNotifyNewClanMember(const struct FString& ClanName, const struct FString& CharName);
	bool rfReqRecvJoinClan(int UserIdx, const struct FString& CharName, const struct FString& Message);
	bool rfAckRecvClanInviteResult(int Result, const struct FString& ErrMsg);
	bool rfAckInviteClanResult(const struct FString& CharName, unsigned char Permit, const struct FString& ClanNm);
	bool rfAckJoinClan(int Result, const struct FString& ErrMsg, const struct FString& SpecificCharName, const struct FString& RealRecvCharName, unsigned char RealRecvCharClanGrade);
	bool rfAckInviteClan(int Result, const struct FString& ErrMsg);
	bool rfReqRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& ClanName, const struct FString& InviteMsg);
	bool rfAckSearchClan(int Result, const struct FString& ErrMsg, int TotalPage, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<unsigned char> ClanMarkBL, TArray<struct FString> ClanName, TArray<struct FString> ClanMaster, TArray<int> ClanMember, TArray<int> ClanMemberMax, TArray<int> ClanCreateDate, TArray<int> ClanWin, TArray<int> ClanLose, TArray<int> ClanDraw, TArray<int> ClanRank, TArray<unsigned char> ClanRecruit, TArray<int> ClanLevel);
	bool rfAckDBCharInfo(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FString& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckDupCheckClanName(int Result, const struct FString& ErrMsg);
	bool rfAckCreateClan(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckGetIsHostBlocking(int Result, unsigned char Blocking);
	bool rfAckNotifyHostBlocking(int Result, unsigned char Blocking);
	bool rfAckGetHolePunchingResult(int Result, unsigned char Phrase, int InterventionUserID, unsigned char Intervention, TArray<int> FailedUserIDs);
	bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint);
	bool rfReqRecvForceDisconnectUDPFromHost(int Result);
	bool rfAckForceDisconnectUDPFromHost(int Result);
	bool rfReqNotifyChangeRoomState(unsigned char RoomState);
	bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, const struct FString& ErrMsg);
	bool rfReqCompleteFriendInvite(const struct FString& CharnameToBeInvited, unsigned char IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfReqRecvFriendInvite(int ReqUserID, const struct FString& ReqCharname, const struct FString& InviteMsg);
	bool rfAckSendFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfAckNotifyLoadingState(int Result, int UserID, unsigned char LoadingState);
	bool rfAckFailedStartGame(int Result, const struct FString& ErrMsg, unsigned char IsHost, int FailedUserID, int LoadingStep);
	bool rfAckSuccessStartGame(int Result, const struct FString& ErrMsg, unsigned char IsHost, const struct FString& HostIP, int HostPort, int LoadingStep);
	bool rfReqRelayServerOff();
	bool rfAckGameOverEnd(int Result, const struct FString& ErrMsg);
	bool rfAckUpdateWeaponDurability(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, TArray<int> Durability, TArray<unsigned char> IsDestroy, TArray<struct FBtrDouble> FailedWeaponUniqueID);
	bool rfAckEntryQSlotUniqueIDList(int UserNum, TArray<unsigned char> QSlotDispOrder, TArray<struct FBtrDouble> MWUniqueID, TArray<struct FBtrDouble> PistolUniqueID, TArray<struct FBtrDouble> TW1UniqueID, TArray<struct FBtrDouble> TW2UniqueID);
	bool rfAckEntryQSlotIDList(int UserNum, TArray<unsigned char> QSlotDispOrder, TArray<int> MWItemID, TArray<int> MWPartID, TArray<int> MWPaintID, TArray<int> PistolItemID, TArray<int> PistolPartID, TArray<int> PistolPaintID, TArray<int> TWItemID1, TArray<int> TWItemID2, TArray<int> Skill1ID, TArray<int> Skill2ID, TArray<int> Skill3ID, TArray<int> Skill4ID);
	bool rfAckChangeNewGuest(const struct FString& HostIP);
	bool rfAckChangeHost(unsigned char ClientNum);
	bool rfAckGetBootyChoose(int Result, const struct FString& ErrMsg, unsigned char GiveType, const struct FBtrDouble& ItemUniqueNumber, int ItemID, int PartID, unsigned char ItemType, const struct FBtrDouble& UntilTime, int StackCount, int PaintID);
	bool rfAckEntrySkillList(TArray<int> UserIDs, TArray<int> SkillIDs, TArray<int> SlotPositions, int Result, const struct FString& ErrMsg);
	bool rfAckGetBooty(int Result, const struct FString& ErrMsg, TArray<int> PrizeWinUserID, TArray<int> BootyItemID, TArray<int> BootyPartsID);
	bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, const struct FString& ErrMsg);
	bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, const struct FString& ErrMsg);
	bool rfAckEntryItemList(TArray<int> UserIDs, TArray<int> ItemIDs, TArray<int> SlotPositions, TArray<int> AddPartsID, TArray<struct FBtrDouble> UniqueID, TArray<int> PaintID, int Result, const struct FString& ErrMsg);
	bool rfAckChangeUserState(int Result, const struct FString& ErrMsg, TArray<int> UserIDs, TArray<unsigned char> Positions, TArray<int> Numbers, TArray<unsigned char> OldStates, TArray<unsigned char> NewStates);
	bool rfAckChangeRoomSetting(int Result, const struct FString& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfAckAIRewardResult(unsigned char ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, TArray<int> ScoreRewardUserID, TArray<unsigned char> ScoreRewardTYPE, TArray<int> ScoreRewardID, TArray<int> ScoreRewardCount);
	bool rfAckUpdateScore(TArray<int> UserIDs, TArray<struct FString> NickNames, TArray<unsigned char> TeamIDs, TArray<int> Scores, TArray<int> Kills, TArray<int> Assists, TArray<int> Deaths, TArray<int> EXPs, TArray<int> EXPBonuses, TArray<int> Points, TArray<int> PointBonuses, TArray<int> TeamScores, TArray<int> BonusOwnerID, TArray<int> BonusID);
	bool rfAckRegisterOtherUdpInfo(int UID, const struct FString& IP, int Port, unsigned char NatType, unsigned char Intervention, const struct FString& HostInnerIP, int HostInnerPort);
	bool rfAckDisconnectGame(int Result, int DisconnectUserID, const struct FString& DisconnectUserName);
	bool rfAckGameOver(int UID, int GameRoomNumber, int Result, const struct FString& ErrMsg);
	bool rfAckGameRoomInfo(int Result, const struct FString& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfAckChangeGameMode(int GameNum, int UID, const struct FString& GameMode, unsigned char GameModeNum, int Result, const struct FString& ErrMsg);
	bool rfAckSelectMap(int GameNum, int UID, const struct FString& MapName, int Result, const struct FString& ErrMsg);
	bool rfAckChangeTeam(int GameNumber, const struct FString& UserID, int UID, int TeamNum, int Result, const struct FString& ErrMsg);
	bool rfAckRoomUserList(TArray<int> UID, TArray<struct FString> UserName, TArray<int> Grade, TArray<int> TeamNum, TArray<unsigned char> Statue, TArray<unsigned char> IsHost, TArray<struct FString> UserIP, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<unsigned char> IsLookingFor, TArray<int> GMUID, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckEnterChannel(int id, int UID, const struct FString& UserID, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckLeaveRoom(int Num, int UID, const struct FString& UserID, int Result, const struct FString& ErrMsg);
	bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, const struct FString& UserID, int TeamNum, int Grade, const struct FString& UserIP, const struct FString& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, const struct FString& ErrMsg);
	bool rfAckIsGameRoomPlaying(int GameRoomNum, unsigned char IsPlaying);
	bool rfAckGameHostInfo(int GameNumber, const struct FString& UserID, const struct FString& IP, int Port, int Result, const struct FString& ErrMsg);
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
	struct FString                                     strLabel[0x5];                                            // 0x050C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strPoint;                                                 // 0x0548(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbLabel[0x5];                                             // 0x0554(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	struct FFloatBox                                   fbLabelEdit[0x3];                                         // 0x05A4(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawImageHK*                         Label[0x5];                                               // 0x05D4(0x0004) (ExportObject, NeedCtorLink, EditInline)
	class UBTOwnerDrawImageHK*                         LabelEdit[0x3];                                           // 0x05E8(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FString                                     strButtonSelectAll[0x2];                                  // 0x05F4(0x000C) (Localized, NeedCtorLink)
	struct FFloatBox                                   fbButtonSelectAll;                                        // 0x060C(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTOwnerDrawCaptionButtonHK*                 ButtonSelectAll;                                          // 0x061C(0x0004) (ExportObject, NeedCtorLink, EditInline)
	struct FFloatBox                                   fbNEditBox[0x3];                                          // 0x0620(0x0010) (Edit, EditInline, DataBinding, SerializeText, RepNotify, Interp, NonTransactional, EditorOnly, NotForConsole, RepRetry, PrivateWrite, ProtectedWrite, ArchetypeProperty, EditHide, EditTextBox, CrossLevelPassive, CrossLevelActive)
	class UBTNumericEditBoxHK*                         NEditBox[0x3];                                            // 0x0650(0x0004) (ExportObject, NeedCtorLink, EditInline)
	TArray<struct FBtrDouble>                          selectlist;                                               // 0x065C(0x000C) (NeedCtorLink)

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
	bool rfAckLoginWithWZAuth(int Result, unsigned char wzp_AccountType, unsigned char wzp_IsBlock, unsigned char wzp_AuthKeySuccess, unsigned char ChannelType);
	bool rfAckLoginWithTencentAuth(int Result, unsigned char tc_AccountType, unsigned char tc_IsBlock);
	bool rfAckLogOut(unsigned char Result, unsigned char Reason);
	bool rfAckClientChecksum(int Result);
	bool rfAckClientChallenge(const struct FString& Key1, const struct FBtrDouble& Key2);
	bool rfAckLoginInHouseTest(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg, const struct FString& BDay, unsigned char Sex, const struct FBtrDouble& ServerTime);
	bool rfAckCharInfo(int Result, const struct FString& CharName, int Level, int Exp, const struct FString& ClanName);
	bool rfAckServerList(TArray<struct FString> CServername, TArray<struct FString> CServerShortName, TArray<struct FString> ServerIP, TArray<int> serverPort, TArray<struct FString> ChannelName, TArray<struct FString> ChannelNickName, TArray<int> ChannelNum, TArray<int> chMaxUser, TArray<int> chCurUser, TArray<struct FString> ServerGroupName, TArray<int> ServerGroupID, TArray<int> ServerDispOrder, TArray<int> DataPort, TArray<unsigned char> OptionCount_byte, TArray<unsigned char> OptionKey_byte, TArray<unsigned char> OptionValue_byte, TArray<unsigned char> OptionCount_int, TArray<unsigned char> OptionKey_int, TArray<int> OptionValue_int, TArray<unsigned char> OptionCount_float, TArray<unsigned char> OptionKey_float, TArray<float> OptionValue_float, TArray<unsigned char> IsClanChannel, TArray<unsigned char> IsUseDedicateHost);
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


	bool rfAckUseItemDuringGame(int ErrorCode, const struct FString& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, int RemainCount);
	bool rfAckSpecialQuestRank(TArray<struct FString> CharList);
	bool rfAckReceiveSpecialReward(int Result, int RewardedQuestID, unsigned char RewardedQuestIsComplete, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount);
	bool rfAckDailyRewardListThisMonth(TArray<unsigned char> Type, TArray<unsigned char> Number, TArray<int> ItemID, TArray<int> ItemCount);
	bool rfAckPuzzleList(int Result, unsigned char IsComplete, TArray<unsigned char> UpdatedNum, TArray<unsigned char> StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfAckAttendanceList(int Result, unsigned char IsComplete, unsigned char UpdatedNum, TArray<unsigned char> StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfAckSetCommunityOption(int Result, const struct FString& ErrStr);
	bool rfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite);
	bool rfChangeItemInstanceInfo(int ErrorCode, int ItemID, const struct FBtrDouble& ItemUniqueID, unsigned char ChangeCount, int RemainCount);
	bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, unsigned char IsNotification, TArray<struct FString> NickName, TArray<struct FBtrDouble> Time, int GetItemID);
	bool rfAckGetItemFromItemBox(int Result, const struct FString& ErrMsg, int ItemIDChoose, int PartIDChoose, const struct FBtrDouble& BoxItemIdx, int BxoItemCount, unsigned char bHave, const struct FBtrDouble& ItemIdx, const struct FBtrDouble& UntilTime, int StackCount);
	bool rfAckBuyItemByWebzenCash(int Result, const struct FString& ErrMsg);
	bool rfNotifyCouponUseError(int Time);
	bool rfAckRecvClanInviteResult(int Result, const struct FString& ErrMsg);
	bool rfReqRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& ClanName, const struct FString& InviteMsg);
	bool rfReqNotifyShopItemDataEnd(int Ver);
	bool rfReqNotifyShopItemData(TArray<int> ProductNo, TArray<struct FString> ProductName, TArray<int> ProductCode, TArray<unsigned char> SaleType, TArray<int> ProductCost, TArray<int> ProductHour, TArray<int> ProductQuantity, TArray<int> SaleMasterFlag, TArray<int> SaleStatus, TArray<int> IsGift, TArray<struct FBtrDouble> SaleEndTime, TArray<int> Discountcost);
	bool rfAckShopItemData();
	bool rfAckTencent_StartTenProtect(int CharDBID);
	bool rfAckMoveToLobby(unsigned char MessageType);
	bool rfAckPopUpMessage(int MessageType);
	bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckLogOut(unsigned char Result, unsigned char Reason);
	bool rfAckServerType(unsigned char Type);
	bool rfAckPaidItem_NotifyChangeClanname(const struct FString& NewClanname);
	bool rfAckPaidItem_ChangeClanname(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const struct FString& NewClanname);
	bool rfAckPaidItem_ChangeCharname(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const struct FString& NewCharname);
	bool rfAckGetMyMailBoxState(int Result, unsigned char IsFull, int NewMailCount);
	bool rfAckSetLookForClan(int Result, const struct FString& ErrMsg, unsigned char IsLookingFor);
	bool rfAckPaidItem_RelayBroadcast(const struct FString& CharName, const struct FString& Msg);
	bool rfAckRecvSystemMsg(unsigned char CommunityType, const struct FSystemMsgParam& MsgInfo);
	bool rfReqRecvChatWispher(const struct FString& CharnameFrom, const struct FString& Message);
	bool rfAckChatClan(const struct FString& CharName, const struct FString& Message, int Result);
	bool rfAckChatNormal(int id, const struct FString& Sender, const struct FString& Message, int Result);
	bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID);
	bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID);
	bool rfAckForceDisconnectUser_GM(int Result, const struct FString& ErrMsg, const struct FString& CharName);
	bool rfAckNotice_GM(int Result, const struct FString& ErrMsg, unsigned char NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const struct FString& Msg);
	bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, const struct FString& NewRoomTitle);
	bool rfAckCharBlockInfo(int Result, const struct FBtrDouble& ChatBlockStartTime, const struct FBtrDouble& ChatBlockEndTime, TArray<struct FBtrDouble> BlockedItemIdx);
	bool rfAckPaidItem_NotifyChangeClanMark(const struct FString& ClanName, int Pattern, int BG, int BL);
	bool rfAckPaidItem_ChangeClanMark(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_ClanMarkDupCheck(int Result, const struct FString& ErrMsg);
	bool rfAckPaidItem_BroadCast(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckPaidItem_EraseRecord(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int Command, int RemainCount);
	bool rfAckWebzenBillingUseStorageItem(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID, const struct FBtrDouble& ItemExtra);
	bool rfAckWebzenBillingStorageListEnd();
	bool rfAckWebzenBillingStorageList(TArray<int> Seq, TArray<int> ItemSeq, TArray<int> GroupCode, TArray<int> ShareFlag, TArray<int> ProductSeq, TArray<struct FString> CashName, TArray<struct FBtrDouble> CashPoint, TArray<struct FString> SendAccountID, TArray<struct FString> SendMessage, TArray<unsigned char> ItemType, TArray<unsigned char> RelationType, TArray<int> ProductType, TArray<int> PriceSeq);
	bool rfAckWebzenBillingStorageListStart(int Result, const struct FString& ErrMsg, int TotalCount, int TotalPage, int CurPage);
	bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, unsigned char ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, unsigned char ChangedOldSlotPosition, int Result, const struct FString& ErrMsg);
	bool rfAckEquipItem(int ChangedNewItemID, const struct FBtrDouble& ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, const struct FBtrDouble& ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, const struct FString& ErrMsg);
	bool rfAckRandomBox_Use(int Result, const struct FString& ErrMsg, const struct FBtrDouble& RandomBoxItemIdx, int RandomBxoItemCount, const struct FBtrDouble& KeyItemIdx, int KeyItemRemainCount, TArray<int> ItemIDChoose, TArray<int> PartIDChoose, TArray<int> PeriodOnChoosenItem, TArray<int> StackCountOnChoosenItem, TArray<unsigned char> bHave, TArray<struct FBtrDouble> ItemIdx, TArray<struct FBtrDouble> UntilTime, TArray<int> StackCount);
	bool rfAckRemoveBlockUserList(int Result, const struct FString& ErrMsg);
	bool rfAckAddBlockUserList(int Result, const struct FString& ErrMsg);
	bool rfAckPCBangUserListEnd();
	bool rfAckPCBangUserList(TArray<struct FString> FriendName, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> Level, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<unsigned char> IsLookForClan, TArray<unsigned char> IsCombat, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckPCBangUserListStart(int Result, int TotalCount);
	bool rfAckClanUserList(int Result, const struct FString& ErrMsg, TArray<int> Level, TArray<struct FString> CharName, TArray<unsigned char> ClanGrade, TArray<int> ClanWinCnt, TArray<int> ClanLoseCnt, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> DudeId);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfAckBlockUserList(TArray<struct FString> CharName);
	bool rfAckBlockUserListEnd();
	bool rfAckBlockUserListStart(int Result, int TotalCount);
	bool rfAckFriendListEnd();
	bool rfAckFriendList(TArray<struct FString> FriendName, TArray<unsigned char> IsLogOn, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> LevelMarkID, TArray<int> ClanLevel, TArray<int> Level, TArray<unsigned char> IsLookForClan);
	bool rfAckFriendListStart(int Result, int TotalCount);
	bool rfAckRegisterMainPCBang(int Result, const struct FString& ErrMsg);
	bool rfReqIsPaidWebzenPCBang(unsigned char IsPaid);
	bool rfAckClanInfo(const struct FClanInfo& stClanInfo);
	bool rfAckCharInfo(int Result, const struct FString& ErrMsg, int UserID, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FCharInfo& stCharInfo, unsigned char InClanRank, int ClanLevel);
	bool rfAckRegisteredPCBangInfo(int Result, const struct FString& ErrMsg, unsigned char IsRegisteredPCBang, unsigned char IsMainPCBang, const struct FString& PCBangName);
	bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfAckMyMoney(int Result, const struct FString& ErrMsg, int Point, int Cash);
	bool rfAckWebzenCash(int Result, const struct FString& ErrMsg, const struct FBtrDouble& PCoinCash, const struct FBtrDouble& CCoinCash);
	bool rfReqClanMatch_InviteCrewResult(const struct FString& Invitee, int Result);
	bool rfReqClanMatch_RecvInviteCrew(const struct FString& Inviter, const struct FString& ServerIP, int Port, int WaittingID, const struct FString& Msg, int MapNum, int InviteUserChannelNum, const struct FString& LeaderName, const struct FString& RoomName);
	bool rfAckClanMatch_InviteCrew(int Result, const struct FString& ErrMsg);
	bool rfAckLimitedListInChannel(int Result, TArray<int> LimitedMapID, TArray<int> LimitedModeID);
	bool rfReqDailyQuestNewAvailable(TArray<int> ExpiredQuestID, TArray<int> NewQuestID);
	bool rfReqQuestNewAvailable(TArray<int> AchivedQuestID, TArray<int> NewQuestID, TArray<unsigned char> IsDailyQuest, TArray<int> ExpiredQuest);
	bool rfAckQuestUpdate(int Result, const struct FString& ErrMsg);
	bool rfAckQuestListEnd();
	bool rfAckQuestList(TArray<int> QuestID, TArray<int> CountPrograss, TArray<unsigned char> IsDailyQuest, TArray<unsigned char> IsComplete);
	bool rfAckQuestListStart(int Result, const struct FString& ErrMsg);
	bool rfAckRecvInviteGameRoomResult(int Result);
	bool rfReqRecvInviteGameRoom(const struct FString& InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, const struct FString& RoomUniqueID, int RoomNumber, const struct FString& RoomName, unsigned char RoomState, const struct FString& MapName, const struct FString& OwnerName, unsigned char GameMode, unsigned char WeaponLimit, unsigned char IsTeamBalance, const struct FString& Password, const struct FString& InviteCharName);
	bool rfAckInviteGameRoom(int Result, unsigned char Answer, const struct FString& GuestCharName);
	bool rfAckItemListInItemBox(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemUniqueID, int BoxItemID, TArray<int> ItemID, TArray<int> PartID, unsigned char FromContent);
	bool rfAckGetServerTime(const struct FBtrDouble& ServerTime, const struct FString& ClientIP);
	bool rfAckExceedMaxUser();
	bool rfAckBuyShopItem(int ItemCount, TArray<int> Result, TArray<int> BoughtItemTypeID, TArray<struct FBtrDouble> BoughtItemUniqueID, TArray<int> BoughtPartID, TArray<struct FBtrDouble> BoughtUntilTIme, TArray<int> BoughtStackCnt, int PointRemain, int CashRemain);
	bool rfReqRecvForceDisconnected_FromGM(int Result, const struct FString& ErrMsg);
	bool rfReqRecvNotice_FromGM(int Result, const struct FString& ErrMsg, TArray<struct FString> NoticeMsg, unsigned char IsFromDB);
	bool rfAckUpdateQSlot(int Result, const struct FString& ErrMsg);
	bool rfAckRepairItem(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, int RepairCost, TArray<int> DamageDegree);
	bool rfAckRepairCost(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, TArray<int> RepairCost);
	bool rfReqNotifyDurabilityZeroItem(int Result, const struct FString& ErrMsg, int UserID, TArray<struct FBtrDouble> ItemUniqueIDs, TArray<int> ItemIDs, TArray<int> ItemPartIDs, TArray<unsigned char> ItemSlotPos);
	bool rfAckNotifyExpiredSkillIDs(int UserID, TArray<struct FBtrDouble> ExpiredSkillUniqueIDs, TArray<int> ExpiredSkillIDs, int Result, const struct FString& ErrMsg, TArray<unsigned char> ExpiredSkillSlotPositions);
	bool rfAckNotifyExpiredItemIDs(int UserID, TArray<struct FBtrDouble> ExpiredItemUniqueIDs, TArray<int> ExpiredItemIDs, TArray<int> ExpiredItemPartIDs, TArray<unsigned char> ExpiredItemSlotPos, int Result, const struct FString& ErrMsg);
	bool rfReqNotifyRelayServerAddr(const struct FString& RelayIP, int RelayPort);
	bool rfAckHash(int Result, const struct FString& Error);
	bool rfAckServerTime(int Time);
	bool rfAckQSlotList(int Result, const struct FString& ErrMsg, TArray<int> QSlotID, TArray<struct FString> QSlotName, TArray<unsigned char> QSlotDispOrder, TArray<struct FBtrDouble> MWItemID, TArray<struct FBtrDouble> PistolItemID, TArray<struct FBtrDouble> TWItemID1, TArray<struct FBtrDouble> TWItemID2, TArray<int> Skill1, TArray<int> Skill2, TArray<int> Skill3, TArray<int> Skill4);
	bool rfAckUserSkillListEnd();
	bool rfAckUserSkillList(TArray<int> UniqueSkillID, TArray<int> SkillID, TArray<struct FBtrDouble> UntilTime, TArray<unsigned char> SlotPosition);
	bool rfAckUserSkillListStart(int Count, int Result, const struct FString& ErrMsg);
	bool rfAckItemListEnd();
	bool rfAckItemList(TArray<struct FBtrDouble> UniqueID, TArray<int> ItemID, TArray<int> ItemType, TArray<int> Durability, TArray<struct FBtrDouble> UntilTime, TArray<int> SlotPosition, TArray<int> AddPartsID, TArray<int> DamageDegree, TArray<unsigned char> ItemState, TArray<int> StackCount, TArray<int> PaintID, TArray<int> TradeCount);
	bool rfAckItemListStart(int Count, int Result, const struct FString& ErrMsg);
	bool rfAckLogin2(int Result, const struct FString& ErrMsg, int UserID, const struct FString& CharName, const struct FBtrDouble& CurServerTime, int CharDBID, unsigned char IsGM);
	bool rfAckLeaveChannel(int Result, const struct FString& UserID, int UID);
	bool rfAckEnterChannel(int id, int UID, const struct FString& UserID, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
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


	bool rfAckProcessPreLoginUser(int Result, const struct FString& ErrMsg);
	bool rfAckLoginInHouseTest(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg, const struct FString& BDay, unsigned char Sex, const struct FBtrDouble& ServerTime);
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


	bool rfNotifyClanLevelup(const struct FString& ClanName, int Levelup);
	bool rfNotifyNewClanName(const struct FString& New_NickName);
	bool rfNotifyNewNickName(int Community_Type, const struct FString& Old_NickName, const struct FString& New_NickName);
	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, unsigned char RankingType, unsigned char CommunityType, TArray<struct FString> CharName, TArray<int> CharLevel, TArray<struct FString> ClanName, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<int> ClanMarkBL, TArray<int> Ranking_Accum, TArray<int> Ranking_Accum_Prev, TArray<int> Ranking_Accum_Exp, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, unsigned char RankingType, unsigned char CommunityType, int TotalCount);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfAckFriendPosition(int Result, const struct FString& TargetCharName, unsigned char ServerType, const struct FString& fServername, const struct FString& fServerShortName, const struct FString& fServerIP, int fServerPort, unsigned char CurPos, unsigned char CurState, int ChannelNum, const struct FString& ChannelNickName, int GameRoomNum);
	bool rfAckMoveToLobby(unsigned char MessageType);
	bool rfAckLogOut(unsigned char Result, unsigned char Reason);
	bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, const struct FString& RoomName, int MapNum, int CurUserCount, int MaxUserCount, unsigned char Status, unsigned char IsPublic);
	bool rfAckNotifyEndTutorial(int UserID, const struct FString& CharName, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckNotifyStartTutorial(int Result, int UserID);
	bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, const struct FString& NewRoomTitle);
	bool rfAckClanMatch_EndPublicWaitRoomList();
	bool rfAckClanMatch_PublicWaitRoomList(TArray<int> WaitRoomIdx, TArray<struct FString> LeaderName, TArray<struct FString> RoomName, TArray<int> MapNum, TArray<int> CurUserCount, TArray<int> MaxUserCount, TArray<unsigned char> Status);
	bool rfAckClanMatch_StartPublicWaitRoomList(int Result, const struct FString& ErrMsg, int Count);
	bool rfReqExteriorRoomOwnerInfo(int RoomNum, const struct FString& OwnerName, const struct FString& OwnerIP);
	bool rfAckQuestGetAvailableEventList(int Result, const struct FString& ErrMsg, TArray<int> QuestID);
	bool rfAckClanMatch_GetReady(int Result, const struct FString& ErrMsg, int RoomIndex);
	bool rfAckClanMatch_Join(int Result, const struct FString& ErrMsg);
	bool rfAckAdjustClanMemberGrade(int Result, const struct FString& ErrMsg, const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfReqRecvDeleteFriend(int Result, const struct FString& FromCharName);
	bool rfAckDeleteFriend(int Result, TArray<struct FString> FailedCharname);
	bool rfAckChatWispher(int Result, const struct FString& ErrMsg, const struct FString& ToCharName);
	bool rfAckNotifyAdjustClanMemberGrade(const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfReqClanCharPersonelIntro(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckClanCharPersonelIntro(int Result, const struct FString& ErrMsg, const struct FString& PersonelIntro);
	bool rfAckRecvJoinClanResult(int Result, const struct FString& ErrMsg);
	bool rfAckJoinClanResult(const struct FString& ClanName, unsigned char Permit, const struct FString& PermitCharName);
	bool rfAckNotifyClanSecession(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckNotifyNewClanMember(const struct FString& ClanName, const struct FString& CharName);
	bool rfReqRecvJoinClan(int UserIdx, const struct FString& CharName, const struct FString& Message);
	bool rfAckInviteClanResult(const struct FString& CharName, unsigned char Permit, const struct FString& ClanNm);
	bool rfAckJoinClan(int Result, const struct FString& ErrMsg, const struct FString& SpecificCharName, const struct FString& RealRecvCharName, unsigned char RealRecvCharClanGrade);
	bool rfAckInviteClan(int Result, const struct FString& ErrMsg);
	bool rfReqRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& ClanName, const struct FString& InviteMsg);
	bool rfAckSearchClan(int Result, const struct FString& ErrMsg, int TotalPage, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<unsigned char> ClanMarkBL, TArray<struct FString> ClanName, TArray<struct FString> ClanMaster, TArray<int> ClanMember, TArray<int> ClanMemberMax, TArray<int> ClanCreateDate, TArray<int> ClanWin, TArray<int> ClanLose, TArray<int> ClanDraw, TArray<int> ClanRank, TArray<unsigned char> ClanRecruit, TArray<int> ClanLevel);
	bool rfAckDBCharInfo(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FString& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckDupCheckClanName(int Result, const struct FString& ErrMsg);
	bool rfAckCreateClan(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckGameRoomInfo(int Result, const struct FString& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfReqCompleteFriendInvite(const struct FString& CharnameToBeInvited, unsigned char IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfReqRecvFriendInvite(int ReqUserID, const struct FString& ReqCharname, const struct FString& InviteMsg);
	bool rfAckSendFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfReqExteriorRoomState(int RoomNumber, unsigned char RoomState);
	bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount);
	bool rfReqExteriorRoomInfo(int SP, int RoomNumber, unsigned char IsPW, const struct FString& RoomName, const struct FString& MapName, const struct FString& ModeName, int MapNum, int ModeNum, unsigned char IsTeamBalance, int MaxUserCount, int RoomUserCount, unsigned char RoomState, unsigned char BotDifficult, unsigned char WeaponLimit, unsigned char BotModeUserTeamNum);
	bool rfAckGameRoomDestroy(int GameRoomNum);
	bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, TArray<int> UID, TArray<struct FString> UserID, TArray<int> UserLevels, TArray<struct FString> ClanName, TArray<int> ClanPattern, TArray<int> ClanBG, TArray<int> ClanBL, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<unsigned char> IsLookForClan, int Result, const struct FString& ErrMsg, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckRoomList(TArray<int> GameNum, TArray<struct FString> Title, TArray<struct FString> MapName, TArray<int> MapNum, TArray<unsigned char> UserCount, TArray<unsigned char> MaxCount, TArray<struct FString> ModeName, TArray<int> ModeNum, TArray<unsigned char> WeaponLimit, TArray<unsigned char> IsTeamBalance, TArray<unsigned char> Status, TArray<struct FString> RoomOwnerIP, TArray<int> GameMinute, TArray<struct FString> RoomOwnerName, TArray<unsigned char> IsSpecial, TArray<unsigned char> IsPassword, TArray<unsigned char> BotDifficult, TArray<unsigned char> BotModeUserTeamNum);
	bool rfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex);
	bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, const struct FString& UserID, int TeamNum, int Grade, const struct FString& UserIP, const struct FString& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckLeaveChannel(int Result, const struct FString& UserID, int UID);
	bool rfAckEnterChannel(int id, int UID, const struct FString& UserID, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckCreateGameRoom(int Result, const struct FString& ErrMsg, int UserID, const struct FString& RoomOwnerIP, const struct FGameRoomInfo& NetRoomInfo);
};


// Class GUIWarfare.BTNuclearButtonHK
// 0x0054 (0x0520 - 0x04CC)
class UBTNuclearButtonHK : public UBTOwnerDrawCaptionButtonHK
{
public:
	struct FString                                     strDonotPress;                                            // 0x04CC(0x000C) (Localized, NeedCtorLink)
	unsigned long                                      bNuclearActive : 1;                                       // 0x04D8(0x0004)
	struct FFloatBox                                   CoreBox;                                                  // 0x04DC(0x0010)
	struct FImage                                      CoreImg;                                                  // 0x04EC(0x0020)
	float                                              MaxPhaseTransformTime;                                    // 0x050C(0x0004)
	float                                              PhaseTransformTime;                                       // 0x0510(0x0004)
	int                                                NuclearButtonPhase;                                       // 0x0514(0x0004)
	struct FScriptDelegate                             __OnCoreClick__Delegate;                                  // 0x0518(0x000C) (NeedCtorLink)

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


	bool rfNotifyClanLevelup(const struct FString& ClanName, int Levelup);
	bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, const struct FString& ErrMsg, TArray<int> MapNumArray, int VersusMode, unsigned char IsPublic);
	bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, const struct FString& ErrMsg, TArray<int> MapNumArray, int VersusMode, const struct FString& WaitRoomName);
	bool rfAckEnterChannel(int id, int UID, const struct FString& UserID, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckNotifyAdjustClanMemberGrade(const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfAckAdjustClanMemberGrade(int Result, const struct FString& ErrMsg, const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfReqRecvDeleteFriend(int Result, const struct FString& FromCharName);
	bool rfAckDeleteFriend(int Result, TArray<struct FString> FailedCharname);
	bool rfAckRecvJoinClanResult(int Result, const struct FString& ErrMsg);
	bool rfAckJoinClanResult(const struct FString& ClanName, unsigned char Permit, const struct FString& PermitCharName);
	bool rfAckNotifyClanSecession(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckNotifyNewClanMember(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckSearchClan(int Result, const struct FString& ErrMsg, int TotalPage, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<unsigned char> ClanMarkBL, TArray<struct FString> ClanName, TArray<struct FString> ClanMaster, TArray<int> ClanMember, TArray<int> ClanMemberMax, TArray<int> ClanCreateDate, TArray<int> ClanWin, TArray<int> ClanLose, TArray<int> ClanDraw, TArray<int> ClanRank, TArray<unsigned char> ClanRecruit, TArray<int> ClanLevel);
	bool rfAckInviteClanResult(const struct FString& CharName, unsigned char Permit, const struct FString& ClanNm);
	bool rfAckJoinClan(int Result, const struct FString& ErrMsg, const struct FString& SpecificCharName, const struct FString& RealRecvCharName, unsigned char RealRecvCharClanGrade);
	bool rfAckInviteClan(int Result, const struct FString& ErrMsg);
	bool rfAckClanCharPersonelIntro(int Result, const struct FString& ErrMsg, const struct FString& PersonelIntro);
	bool rfAckDBCharInfo(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FString& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckCreateClan(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfAckDupCheckClanName(int Result, const struct FString& ErrMsg);
	bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, TArray<int> UID, TArray<struct FString> UserID, TArray<int> UserLevels, TArray<struct FString> ClanName, TArray<int> ClanPattern, TArray<int> ClanBG, TArray<int> ClanBL, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<unsigned char> IsLookForClan, int Result, const struct FString& ErrMsg, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckClanUserList(int Result, const struct FString& ErrMsg, TArray<int> Level, TArray<struct FString> CharName, TArray<unsigned char> ClanGrade, TArray<int> ClanWinCnt, TArray<int> ClanLoseCnt, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> DudeId);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfAckFriendListEnd();
	bool rfAckFriendList(TArray<struct FString> FriendName, TArray<unsigned char> IsLogOn, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> LevelMarkID, TArray<int> ClanLevel, TArray<int> Level, TArray<unsigned char> IsLookForClan);
	bool rfAckFriendListStart(int Result, int TotalCount);
	bool rfReqCompleteFriendInvite(const struct FString& CharnameToBeInvited, unsigned char IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfReqRecvFriendInvite(int ReqUserID, const struct FString& ReqCharname, const struct FString& InviteMsg);
	bool rfAckSendFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_SetWaitRoomPublic(int Result, const struct FString& ErrMsg, unsigned char Set);
	bool rfAckClanMatch_StopSearching();
	bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber);
	bool rfAckClanMatch_NotifyStartSearching(int ShouldWaitMore);
	bool rfAckClanMatch_StartSearching(int Result, const struct FString& ErrMsg, int ShouldWaitMore);
	bool rfAckClanMatch_ChangeLeader(int Result, const struct FString& ErrMsg, int NewLeader, const struct FString& NewLeaderName);
	bool rfAckClanMatch_WaittingTeamList(int TtotlCount, TArray<int> Grade, TArray<int> Map, TArray<int> Versus);
	bool rfAckClanMatch_Chat(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& Msg);
	bool rfAckClanMatch_Leave(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_MemberList(TArray<unsigned char> IsLeader, TArray<int> ClanMarkPA, TArray<int> ClanMarkBG, TArray<int> ClanMarkBL, TArray<int> Level, TArray<struct FString> CharName, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<struct FString> ClanName, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckClanMatch_LeaveNotify(const struct FString& CharName);
	bool rfAckClanMatch_JoinNotify(unsigned char IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, const struct FString& CharName, int ClanGrade, int ClanWin, int ClanLose, const struct FString& ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckClanMatch_Join(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_NotifiyStartCombat(TArray<int> MapNumArray, int VersusMode);
	bool rfAckClanMatch_StartCombat(int Result, const struct FString& ErrMsg);
	bool rfAckClanMatch_GetReady(int Result, const struct FString& ErrMsg, int RoomIndex);
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


	bool rfAckCouponUse(int Result, const struct FString& ErrMsg);
	bool rfAckRepairItem(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, int RepairCost, TArray<int> DamageDegree);
	bool rfAckRepairCost(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, TArray<int> RepairCost);
	bool rfAckUpdateQSlot(int Result, const struct FString& ErrMsg);
	bool rfAckModifyWeapon(int Result, const struct FString& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point, int Cash);
	bool rfAckSellShopItem(int Result, const struct FString& ErrMsg, int PointRemain, int CashRemain, int Count);
	bool rfAckSellShopItemInfo(int Result, const struct FString& ErrMsg, const struct FBtrDouble& UniqueItemID, int SellPoint, int CurPoint, int AfterPoint);
	bool rfReqConfirmSkillChanged();
	bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, unsigned char ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, unsigned char ChangedOldSlotPosition, int Result, const struct FString& ErrMsg);
	bool rfAckConfirmItemChanged(int Result, const struct FString& ErrMsg);
	bool rfAckEquipItem(int ChangedNewItemID, const struct FBtrDouble& ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, const struct FBtrDouble& ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, const struct FString& ErrMsg);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(TArray<int> ItemID);
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


	bool rfAckDBCharInfo(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FString& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckFriendPosition(int Result, const struct FString& TargetCharName, unsigned char ServerType, const struct FString& fServername, const struct FString& fServerShortName, const struct FString& fServerIP, int fServerPort, unsigned char CurPos, unsigned char CurState, int ChannelNum, const struct FString& ChannelNickName, int GameRoomNum);
	bool rfAckNotifyUpdateCharInfo_LevelMark(const struct FString& CharName, int LevelMarkID);
	bool rfAckClanMatchResultHistory(TArray<struct FBtrDouble> MatchDate, TArray<unsigned char> IsWin, TArray<struct FString> EnemyClanname);
	bool rfAckChatWispher(int Result, const struct FString& ErrMsg, const struct FString& ToCharName);
	bool rfAckNotifyAdjustClanMemberGrade(const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfAckAdjustClanMemberGrade(int Result, const struct FString& ErrMsg, const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfAckClanCharPersonelIntro(int Result, const struct FString& ErrMsg, const struct FString& PersonelIntro);
	bool rfAckSearchClan(int Result, const struct FString& ErrMsg, int TotalPage, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<unsigned char> ClanMarkBL, TArray<struct FString> ClanName, TArray<struct FString> ClanMaster, TArray<int> ClanMember, TArray<int> ClanMemberMax, TArray<int> ClanCreateDate, TArray<int> ClanWin, TArray<int> ClanLose, TArray<int> ClanDraw, TArray<int> ClanRank, TArray<unsigned char> ClanRecruit, TArray<int> ClanLevel);
	bool rfAckClanPersonelIntro(int Result, const struct FString& ErrMsg);
	bool rfAckClanChangeInfo(int Result, const struct FString& ErrMsg);
	bool rfAckClanSecession(int Result, const struct FString& ErrMsg);
	bool rfAckClanClose(int Result, const struct FString& ErrMsg, const struct FString& ClanName);
	bool rfAckClanNews(TArray<struct FString> IssueDate, TArray<unsigned char> IssueType, TArray<struct FString> IssuedClanMember);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserList(int Result, const struct FString& ErrMsg, TArray<int> Level, TArray<struct FString> CharName, TArray<unsigned char> ClanGrade, TArray<int> ClanWinCnt, TArray<int> ClanLoseCnt, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> DudeId);
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfReqRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& ClanName, const struct FString& InviteMsg);
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
	bool rfAckLoginWithTencentAuth(int Result, unsigned char tc_AccountType, unsigned char tc_IsBlock);
	bool rfAckLoginWithWZAuth(int Result, unsigned char wzp_AccountType, unsigned char wzp_IsBlock, unsigned char wzp_AuthKeySuccess, unsigned char ChannelType);
	bool rfAckProcessPreLoginUser(int Result, const struct FString& ErrMsg);
	bool rfAckLoginInHouseTest(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg, const struct FString& BDay, unsigned char Sex, const struct FBtrDouble& ServerTime);
	bool rfAckCreateChar(int Success, const struct FString& ErrMsg);
	bool rfAckLogin(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg);
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


	bool rfAckRepairItem(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, int RepairCost, TArray<int> DamageDegree);
	bool rfAckRepairCost(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, TArray<int> RepairCost);
	bool rfAckAuctionInstantlyBuying(int Result, const struct FString& ErrMsg, int PointRemain);
	bool rfAckAuctionBidding(int Result, const struct FString& ErrMsg, int PointRemain);
	bool rfAckAuctionTradeHistory(int Result, const struct FString& ErrMsg, int ItemID, int PartID, TArray<struct FString> SellerCharNm, TArray<int> DamageDegree, TArray<int> Price);
	bool rfAckAuctionItemListEnd(unsigned char Section);
	bool rfAckAuctionItemList(unsigned char Section, TArray<int> UniqueIDs, TArray<int> ItemIDs, TArray<int> AddPartsIDs, TArray<struct FBtrDouble> UntilTimes, TArray<int> BiddingPrices, TArray<int> InstantlyByuingPrices, TArray<int> ItemDamageds, TArray<struct FString> HighestBidderNames, TArray<struct FString> SellerNames, TArray<int> ItemCount);
	bool rfAckAuctionItemListStart(int Result, const struct FString& ErrMsg, unsigned char Section, int PageNum, int Count);
	bool rfAckAuctionMyItemCancel(int Result, const struct FString& ErrMsg);
	bool rfAckAuctionMyItemRegister(int Result, const struct FString& ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain);
	bool rfAckAuctionItemListCount(int Result, const struct FString& ErrMsg, unsigned char Section, unsigned char Classfy, int ItemType, int ItemGrade, int Count);
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


	bool rfAckModifyWeapon(int Result, const struct FString& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point, int Cash);
	bool rfAckCouponUse(int Result, const struct FString& ErrMsg);
	bool rfAckGiftItemByWebzenCash(int Result, const struct FString& ErrMsg, int LeftProductCount);
	bool rfAckBuyItemByWebzenCash(int Result, const struct FString& ErrMsg);
	bool rfAckSendGift(int Result, const struct FString& ErrMsg, int PointRemain, int CashRemain);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(TArray<int> ItemID);
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
	bool rfAckLoginWithTencentAuth(int Result, unsigned char tc_AccountType, unsigned char tc_IsBlock);
	bool rfAckEventNotify(int Type);
	bool rfAckClientChecksum(int Result);
	bool rfAckClientChallenge(const struct FString& Key1, const struct FBtrDouble& Key2);
	bool rfAckProcessPreLoginUser(int Result, const struct FString& ErrMsg);
	bool rfAckLoginInHouseTest(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg, const struct FString& BDay, unsigned char Sex, const struct FBtrDouble& ServerTime);
	bool rfAckLoginWithWZAuth(int Result, unsigned char wzp_AccountType, unsigned char wzp_IsBlock, unsigned char wzp_AuthKeySuccess, unsigned char ChannelType);
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
	bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, unsigned char IsNotification, TArray<struct FString> NickName, TArray<struct FBtrDouble> Time, int GetItemID);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(TArray<int> ItemID);
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


	bool rfAckDBCharInfo(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FString& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfAckGetAttachedItemFromMemo(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID);
	bool rfAckDeleteMailAll(int Result, unsigned char MailType, int Count);
	bool rfAckDelMemo(int Result, const struct FString& ErrMsg, TArray<int> FailedMemoID);
	bool rfAckReadMemo(const struct FString& cnameFrom, const struct FString& Text, const struct FString& dateRecv, const struct FBtrDouble& ItemUID);
	bool rfAckEndMemoList();
	bool rfAckMemoList(TArray<int> MemoIdx, TArray<struct FString> cnameFrom, TArray<struct FString> dateRecv, TArray<struct FString> Text, TArray<unsigned char> Status, TArray<int> UntilExpire, TArray<struct FBtrDouble> ItemUID, TArray<int> ItemID, TArray<unsigned char> MsgType, TArray<int> ItemPartID);
	bool rfAckStartMemoList(int Result, const struct FString& ErrMsg, unsigned char Type, int TotalCount);
	bool rfReqRecvMemo(const struct FString& cnameFrom, unsigned char MemoType);
	bool rfAckSendMemo(TArray<struct FString> CnamesToFail, TArray<int> ResultArray);
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


	bool rfAckLogOut(unsigned char Result, unsigned char Reason);
	bool rfAckProcessPreLoginUser(int Result, const struct FString& ErrMsg);
	bool rfAckLoginInHouseTest(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg, const struct FString& BDay, unsigned char Sex, const struct FBtrDouble& ServerTime);
	bool rfAckCreateChar(int Success, const struct FString& ErrMsg);
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
	bool rfAckGetRankingInfoList(int Result, unsigned char RankingType, unsigned char CommunityType, TArray<struct FString> CharName, TArray<int> CharLevel, TArray<struct FString> ClanName, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<int> ClanMarkBL, TArray<int> Ranking_Accum, TArray<int> Ranking_Accum_Prev, TArray<int> Ranking_Accum_Exp, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, unsigned char RankingType, unsigned char CommunityType, int TotalCount);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfAckDBCharInfo(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FString& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
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
	struct FString                                     LoadingStateMessage[0x7];                                 // 0x0088(0x000C) (Localized, NeedCtorLink)
	struct FString                                     OtherLoadingStateMessage[0x7];                            // 0x00DC(0x000C) (Localized, NeedCtorLink)

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
	struct FString                                     C_ERR_LOADING_FAILED_MyNetworkChecking_0_5000;            // 0x0038(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_MyNetworkChecking_1_5001;            // 0x0044(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_MyNetworkChecking_2_5002;            // 0x0050(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_MyNetworkChecking_3_5003;            // 0x005C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_MyNetworkChecking_4_5004;            // 0x0068(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_MyNetworkChecking_5_5005;            // 0x0074(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_MyNetworkChecking_6_5006;            // 0x0080(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_HostNetworkChecking_0_5007;          // 0x008C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_HostNetworkChecking_1_5008;          // 0x0098(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_HostNetworkChecking_2_5009;          // 0x00A4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_HostNetworkChecking_3_5010;          // 0x00B0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_HostNetworkChecking_4_5011;          // 0x00BC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_HostNetworkChecking_5_5012;          // 0x00C8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_HostNetworkChecking_6_5013;          // 0x00D4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_WrongStep_0_5014;                    // 0x00E0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_WrongStep_1_5015;                    // 0x00EC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_WrongStep_2_5016;                    // 0x00F8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_WrongStep_3_5017;                    // 0x0104(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_WrongStep_4_5018;                    // 0x0110(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_WrongStep_5_5019;                    // 0x011C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_WrongStep_6_5020;                    // 0x0128(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_HostPreCachingFailed_5021;           // 0x0134(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_ClientLvNegoFailed_5022;             // 0x0140(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_ClientPreCachingFailed_5023;         // 0x014C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_HostRequestTimeIsZero_5024;          // 0x0158(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_ClientRequestTimeIsZero_5025;        // 0x0164(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_GBtrConfig_is_NULL_5026;                            // 0x0170(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_GameEngine_is_NULL_5027;                            // 0x017C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_NetDriver_is_NULL_5028;                             // 0x0188(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LoadingAdvancer_is_NULL_5029;                       // 0x0194(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LoadingStater_is_NULL_5030;                         // 0x01A0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_StartHostLoading_Failed_5031;        // 0x01AC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_StartClientLoading_Failed_5032;      // 0x01B8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_StartChangeHost_Failed_5033;         // 0x01C4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_StartChangeClient_Failed_5034;       // 0x01D0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_CreateNetDriver_Failed_5035;         // 0x01DC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_InitHostNatChecker_Failed_5036;      // 0x01E8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_InitClientNatChecker_Failed_5037;    // 0x01F4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_GMapLoader_is_NULL_5038;                            // 0x0200(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_GBtrConfig_cant_find_errMsg_5039;                   // 0x020C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_HostSendTimeIsZero_5040;             // 0x0218(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_ClientSendTimeIsZero_5041;           // 0x0224(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_MatchMaker_is_NULL_5042;                            // 0x0230(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_NetDrvier_is_already_exist_5043;                    // 0x023C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_NetDrvier_InitListen_Failed_5044;                   // 0x0248(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_Engine_Client_is_NULL_5045;                         // 0x0254(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_Viewport_is_NULL_5046;                              // 0x0260(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_PlayerController_is_NULL_5047;                      // 0x026C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_NetDriver_InitConnect_Failed_5048;                  // 0x0278(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_GLevel_is_NULL_5049;                                // 0x0284(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_CHANGE_HOST_FAILED_Step_0_5050;                     // 0x0290(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_CHANGE_HOST_FAILED_Step_1_5051;                     // 0x029C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_CHANGE_HOST_FAILED_Step_2_5052;                     // 0x02A8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_CHANGE_HOST_FAILED_Step_3_5053;                     // 0x02B4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_CHANGE_HOST_FAILED_Step_4_5054;                     // 0x02C0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_ServerConnection_is_NULL_5055;                      // 0x02CC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Different_Package_5056;              // 0x02D8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Different_Package_Number_5057;       // 0x02E4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_StartMatch_Failed_5058;              // 0x02F0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_LoadMap_Failed_5059;                 // 0x02FC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_Host_UDP_time_out_5060;                             // 0x0308(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_Client_UDP_time_out_5061;                           // 0x0314(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Changed_Host_5062;                   // 0x0320(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Start_Dummy_Time_Is_Zero_5063;       // 0x032C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Dummy_Check_Failed_5064;             // 0x0338(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_WrongStep_7_5065;                    // 0x0344(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Dummy_Phrase_Invalid_5066;           // 0x0350(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Dummy_Check_From_Server_5067;        // 0x035C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Dummy_Check_Exception_5068;          // 0x0368(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Dummy_Check_Failed_User_List_Emtpy_5069;// 0x0374(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Host_Blocking_Time_Out_5070;         // 0x0380(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_GameOver_While_HolePunching_5071;    // 0x038C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_May_Be_Host_Crash_In_Loading_5072;   // 0x0398(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_OnClose_From_Server_5073;            // 0x03A4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_CHANGE_HOST_FAILED_New_Host_Step_0_5074;            // 0x03B0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_CHANGE_HOST_FAILED_New_Host_Step_1_5075;            // 0x03BC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_CHANGE_HOST_FAILED_New_Host_Step_2_5076;            // 0x03C8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_CHANGE_HOST_FAILED_New_Host_Step_3_5077;            // 0x03D4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_CHANGE_HOST_FAILED_New_Host_Step_4_5078;            // 0x03E0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Dummy_Check_From_Server_5079;        // 0x03EC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_May_Be_Host_Crash_In_Loading_5080;   // 0x03F8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Inervention_Failed_By_ChangeRoomOwner_5081;// 0x0404(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Inervention_MapLoading_Failed_5082;  // 0x0410(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Already_Started_HolePunching_5083;   // 0x041C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Failed_Register_OutSide_Addr_5084;   // 0x0428(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_More_Received_OutSide_Addr_5085;     // 0x0434(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Set_Allow_Start_HolePunching_Failed_5086;// 0x0440(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Recv_Client_OSA_In_Wrong_Step_5087;  // 0x044C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Wait_AckStartHolePunching_Failed_C_5088;// 0x0458(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_WrongStep_8_5089;                    // 0x0464(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_IntUser_Allow_HolePunching_Failed_5090;// 0x0470(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_IntUser_Allow_HolePunching_Failed_5091;// 0x047C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Allow_HolePunching_Failed_5092;      // 0x0488(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_More_Received_OutSide_Addr_CH_5093;  // 0x0494(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Wrong_GameType_CH_5094;              // 0x04A0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Dummy_Packet_Time_Out_CH_5095;       // 0x04AC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_ClientRequestTimeIsZero_CC_5096;     // 0x04B8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Wait_AckStartHolePunching_Failed_CC_5097;// 0x04C4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Allow_Start_HolePunching_Failed_CH_5098;// 0x04D0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Allow_Start_HolePunching_Failed_CC_5099;// 0x04DC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Wrong_Game_Type_CC_5100;             // 0x04E8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Hole_Punching_Failed_CC_5101;        // 0x04F4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Hole_Punching_Failed_CH_5102;        // 0x0500(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Hole_Punching_Failed_H_5103;         // 0x050C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Hole_Punching_Failed_All_5104;       // 0x0518(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_H_5105; // 0x0524(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_CH_5106;// 0x0530(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_C_5107; // 0x053C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_CC_5108;// 0x0548(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Allow_NatChecker_Tick_Failed_IC_5109;// 0x0554(0x000C) (Localized, NeedCtorLink)
	struct FString                                     C_ERR_LOADING_FAILED_Found_Overlap_User_Name_5110;        // 0x0560(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class GUIWarfare.wBtrErrIni");
		return ptr;
	}


	void RegistMap();
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
