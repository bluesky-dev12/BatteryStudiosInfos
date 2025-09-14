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

// Class WMission.wMSPlayerReplicationInfo
// 0x0010 (0x0748 - 0x0738)
class AwMSPlayerReplicationInfo : public AwPlayerReplicationInfo
{
public:
	unsigned char                                      DisabledObjectivesCount;                                  // 0x0738(0x0001) (Net)
	unsigned char                                      DisabledFinalObjective;                                   // 0x0739(0x0001) (Net)
	unsigned char                                      DestroyedVehicles;                                        // 0x073A(0x0001) (Net)
	unsigned char                                      UnknownData00[0x1];                                       // 0x073B(0x0001) MISSED OFFSET
	float                                              TrophiesXOffset;                                          // 0x073C(0x0004)
	unsigned long                                      bAutoRespawn : 1;                                         // 0x0740(0x0004) (Net)
	unsigned long                                      bTeleportToSpawnArea : 1;                                 // 0x0740(0x0004) (Net)
	int                                                TeleportTime;                                             // 0x0744(0x0004) (Net)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wMSPlayerReplicationInfo");
		return ptr;
	}


	void Reset();
	bool CanBotTeleport(class AController* C);
	void Timer();
};


// Class WMission.wAlienPlayerReplicationInfo
// 0x000C (0x0754 - 0x0748)
class AwAlienPlayerReplicationInfo : public AwMSPlayerReplicationInfo
{
public:
	TEnumAsByte<EAlienModeType>                        eObjType;                                                 // 0x0748(0x0001) (Net)
	unsigned char                                      InfectionLevel;                                           // 0x0749(0x0001) (Net)
	unsigned char                                      bySkinID;                                                 // 0x074A(0x0001) (Net)
	unsigned char                                      InfectionPoint;                                           // 0x074B(0x0001)
	unsigned long                                      bNoTransferAlien : 1;                                     // 0x074C(0x0004)
	float                                              fAttackDereaseRate;                                       // 0x0750(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wAlienPlayerReplicationInfo");
		return ptr;
	}


	void Reset();
	void ServerSetSkinID(unsigned char bySkinID);
	unsigned char GetSelectedSkinID();
	unsigned char GetInfectionLevel();
	void SetInfectionLevel(unsigned char Level);
	TEnumAsByte<EAlienModeType> GetObjType();
	void SetObjType(TEnumAsByte<EAlienModeType> eType);
};


// Class WMission.wHUD_Mission
// 0x06C4 (0x4D04 - 0x4640)
class AwHUD_Mission : public AHudCTeamDeathMatch
{
public:
	float                                              ObjectiveScale;                                           // 0x4640(0x0004) (Config)
	unsigned long                                      bOnHUDObjectiveNotification : 1;                          // 0x4644(0x0004) (Config)
	unsigned long                                      bShowInfoPods : 1;                                        // 0x4644(0x0004) (Config)
	unsigned long                                      bDrawAllObjectives : 1;                                   // 0x4644(0x0004) (Config)
	unsigned long                                      bShow3DArrow : 1;                                         // 0x4644(0x0004) (Config)
	unsigned long                                      bObjectiveReminder : 1;                                   // 0x4644(0x0004) (Config)
	unsigned long                                      bDrawRadar : 1;                                           // 0x4644(0x0004) (Config)
	unsigned long                                      bDrawRadarCardinalPoints : 1;                             // 0x4644(0x0004) (Config)
	unsigned long                                      bShowWillowWhisp : 1;                                     // 0x4644(0x0004) (Config)
	int                                                wPawnCountsOld;                                           // 0x4648(0x0004)
	unsigned long                                      bForceSpawnNotification : 1;                              // 0x464C(0x0004)
	unsigned long                                      bShowObjectiveBoard : 1;                                  // 0x464C(0x0004)
	unsigned long                                      bForceObjectiveBoard : 1;                                 // 0x464C(0x0004)
	unsigned long                                      bShowMissionIcon : 1;                                     // 0x464C(0x0004)
	TArray<class AGameObjective*>                      obj;                                                      // 0x4650(0x000C) (NeedCtorLink)
	TArray<class AwInfoPod*>                           InfoPods;                                                 // 0x465C(0x000C) (NeedCtorLink)
	TArray<class AwTrigger_MSMessageTrigger*>          MTrigger;                                                 // 0x4668(0x000C) (NeedCtorLink)
	TArray<class UTexRotator*>                         BehindObjectiveArrows;                                    // 0x4674(0x000C) (NeedCtorLink)
	class AwObjectivePointingArrow*                    OBJPointingArrow;                                         // 0x4680(0x0004)
	unsigned char                                      BehindObjectiveCount;                                     // 0x4684(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x4685(0x0003) MISSED OFFSET
	float                                              OBJ_ReAppearTime;                                         // 0x4688(0x0004)
	float                                              OBJ_FadedOutTime;                                         // 0x468C(0x0004)
	float                                              Global_Delta;                                             // 0x4690(0x0004)
	float                                              fBlink;                                                   // 0x4694(0x0004)
	float                                              fPulse;                                                   // 0x4698(0x0004)
	float                                              ASRadarScale;                                             // 0x469C(0x0004)
	float                                              ASRadarPosX;                                              // 0x46A0(0x0004) (Config)
	float                                              ASRadarPosY;                                              // 0x46A4(0x0004) (Config)
	float                                              LastRadarUpdate;                                          // 0x46A8(0x0004)
	TArray<class AVehicle*>                            RadarVehicleCache;                                        // 0x46AC(0x000C) (NeedCtorLink)
	class UMaterial*                                   HealthBarBackMat;                                         // 0x46B8(0x0004)
	class UMaterial*                                   HealthBarMat;                                             // 0x46BC(0x0004)
	float                                              HealthBarWidth;                                           // 0x46C0(0x0004)
	float                                              HealthBarHeight;                                          // 0x46C4(0x0004)
	int                                                OldRemainingRoundTime;                                    // 0x46C8(0x0004)
	struct FString                                     IP_Bracket_Open;                                          // 0x46CC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     IP_Bracket_Close;                                         // 0x46D8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Cardinal_North;                                           // 0x46E4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Cardinal_East;                                            // 0x46F0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Cardinal_South;                                           // 0x46FC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Cardinal_West;                                            // 0x4708(0x000C) (Localized, NeedCtorLink)
	struct FString                                     NoGameReplicationInfoString;                              // 0x4714(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MetersString;                                             // 0x4720(0x000C) (Localized, NeedCtorLink)
	struct FString                                     TargetString;                                             // 0x472C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     NoTargetString;                                           // 0x4738(0x000C) (Localized, NeedCtorLink)
	struct FString                                     PracticeRoundString;                                      // 0x4744(0x000C) (Localized, NeedCtorLink)
	float                                              AttackerProgressUpdateTime;                               // 0x4750(0x0004)
	float                                              ObjectiveProgressPulseTime;                               // 0x4754(0x0004) (Config)
	unsigned char                                      ObjectiveProgress;                                        // 0x4758(0x0001)
	unsigned char                                      OldObjectiveProgress;                                     // 0x4759(0x0001)
	unsigned char                                      UnknownData01[0x2];                                       // 0x475A(0x0002) MISSED OFFSET
	class AwMSGameReplicationInfo*                     MSGRI;                                                    // 0x475C(0x0004)
	class AwMSPlayerReplicationInfo*                   MSPRI;                                                    // 0x4760(0x0004)
	class AGameObjective*                              CurrentObjective;                                         // 0x4764(0x0004)
	class AVehicle*                                    TrackedVehicle;                                           // 0x4768(0x0004)
	float                                              NextTrackedVehicleSearch;                                 // 0x476C(0x0004)
	struct FSpriteWidget                               RoundTimeBackGround;                                      // 0x4770(0x0040) (Edit)
	struct FSpriteWidget                               ReinforceBackground;                                      // 0x47B0(0x0040) (Edit)
	struct FSpriteWidget                               TeleportBackground;                                       // 0x47F0(0x0040) (Edit)
	struct FSpriteWidget                               VSBackground;                                             // 0x4830(0x0040) (Edit)
	struct FSpriteWidget                               RoundTimeIcon;                                            // 0x4870(0x0040) (Edit)
	struct FSpriteWidget                               ReinforceIcon;                                            // 0x48B0(0x0040) (Edit)
	struct FSpriteWidget                               TeleportIcon;                                             // 0x48F0(0x0040) (Edit)
	struct FSpriteWidget                               VSIcon;                                                   // 0x4930(0x0040) (Edit)
	struct FSpriteWidget                               ReinforcePulse;                                           // 0x4970(0x0040) (Edit)
	struct FSpriteWidget                               TeleportPulse;                                            // 0x49B0(0x0040) (Edit)
	struct FSpriteWidget                               VSPulse;                                                  // 0x49F0(0x0040) (Edit)
	struct FSpriteWidget                               RoundTimeBackGroundDisc;                                  // 0x4A30(0x0040) (Edit)
	struct FSpriteWidget                               ReinforceBackGroundDisc;                                  // 0x4A70(0x0040) (Edit)
	struct FSpriteWidget                               TeleportBackgroundDisc;                                   // 0x4AB0(0x0040) (Edit)
	struct FSpriteWidget                               VSBackgroundDisc;                                         // 0x4AF0(0x0040) (Edit)
	struct FSpriteWidget                               RoundTimeSeparator;                                       // 0x4B30(0x0040) (Edit)
	struct FNumericWidget                              RoundTimeMinutes;                                         // 0x4B70(0x0030) (Edit)
	struct FNumericWidget                              RoundTimeSeconds;                                         // 0x4BA0(0x0030) (Edit)
	struct FNumericWidget                              ReinforceSprNum;                                          // 0x4BD0(0x0030) (Edit)
	struct FNumericWidget                              TeleportSprNum;                                           // 0x4C00(0x0030) (Edit)
	float                                              NextSpawnNotification;                                    // 0x4C30(0x0004)
	unsigned char                                      PrevTeam;                                                 // 0x4C34(0x0001)
	unsigned char                                      UnknownData02[0x3];                                       // 0x4C35(0x0003) MISSED OFFSET
	class AwObjectiveProgressDisplay*                  ObjectiveBoard;                                           // 0x4C38(0x0004) (Edit)
	float                                              IntroTitleFade;                                           // 0x4C3C(0x0004)
	float                                              fViewDelayTime;                                           // 0x4C40(0x0004)
	float                                              fBeginDrawTime;                                           // 0x4C44(0x0004)
	unsigned long                                      bViewRoundResult : 1;                                     // 0x4C48(0x0004)
	struct FSpriteWidget                               PlantLabel;                                               // 0x4C4C(0x0040) (Edit)
	struct FSpriteWidget                               DiffuseLabel;                                             // 0x4C8C(0x0040) (Edit)
	unsigned long                                      bProgressDone : 1;                                        // 0x4CCC(0x0004)
	float                                              fProgressDoneTime;                                        // 0x4CD0(0x0004)
	TArray<struct FSpriteWidget>                       MinimapEnemyFlags;                                        // 0x4CD4(0x000C) (Edit, NeedCtorLink)
	TArray<struct FSpriteWidget>                       MinimapNoncapturedFlag;                                   // 0x4CE0(0x000C) (Edit, NeedCtorLink)
	TArray<struct FSpriteWidget>                       MinimapAllyFlag;                                          // 0x4CEC(0x000C) (Edit, NeedCtorLink)
	float                                              LastSpectatingTime;                                       // 0x4CF8(0x0004)
	float                                              BeginSpectatingTime;                                      // 0x4CFC(0x0004)
	unsigned long                                      bDrawRoundResult : 1;                                     // 0x4D00(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wHUD_Mission");
		return ptr;
	}


	void DrawMissionIcon(class UCanvas* C, class AwPawn* curPawn);
	void DrawIntroTitle(class UCanvas* C);
	void DrawCinematicHUD(class UCanvas* C);
	void UpdatePrecacheMaterials();
	void UpdatePrecacheStaticMeshes();
	struct FString GetInfoString();
	void CheckCountdown(class AGameReplicationInfo* GRI);
	void DrawPracticeRoundInfo(class UCanvas* C);
	void TeamChanged();
	void NotifyGRIChanged();
	void Tick(float DeltaTime);
	void DrawTextWithBackground(class UCanvas* C, const struct FString& Text, const struct FColor& TextColor, float XO, float YO);
	struct FVector STATIC_GetScreenCorner(class UCanvas* C, class AActor* A, const struct FVector& CornerVect, const struct FVector& IPScrO, const struct FRotator& CameraRotation, float ColExpand);
	void STATIC_Draw_2DCollisionBox(class UCanvas* C, class AActor* A, const struct FVector& ScrPos, const struct FString& Description, float ColExpand, bool bSizeOverride);
	struct FColor STATIC_GetGYRColorRamp(float Pct);
	struct FColor GetObjectiveColor(class AGameObjective* Go, unsigned char* bProgressPulsing);
	struct FColor STATIC_GetTeamColor(unsigned char Team);
	bool CustomHUDColorAllowed();
	void STATIC_DrawCustomHealthInfo(class UCanvas* C, class APlayerController* PC, bool bSkaarj);
	void DrawInfoPods(class UCanvas* C);
	bool CanSpawnNotify();
	class AGameObjective* GetCurrentObjective();
	void NotifyUpdatedObjective();
	void HighlightCurrentObjective(bool bShowWayPoint);
	void AnnouncementPlayed(const struct FString& AnnouncerSound, unsigned char Switch);
	bool IsObjectiveVisible(class UCanvas* C, class AGameObjective* Target, const struct FVector& camLoc, const struct FRotator& camRot, struct FVector* ScreenPos);
	void DrawHealthBar(class UCanvas* C, const struct FVector& HBScreenPos, float Health, float MaxHealth, const struct FColor& ObjColor);
	void Release_ObjectivePointingArrow();
	void Draw3dObjectiveArrow(class UCanvas* C);
	void Release_BehindObjectiveArrows();
	class UTexRotator* Get_BehindObjectiveArrow();
	void DrawObjectiveIcon(class UCanvas* C, bool bOptionalObjective, float PosX, float PosY, float tileX, float tileY);
	void DrawObjectiveStatusOverlay(class UCanvas* C, float Progress, bool bCriticalFlash, const struct FVector& ScreenPos, float Scale);
	void DrawCriticalObjectiveOverlay(class UCanvas* C, const struct FVector& ScreenPos, float Scale);
	void DrawMiniMap(class AwHudPart_MinimapBase* Minimap, class UCanvas* C);
	void DrawBigmap_HUD(class UCanvas* C);
	void DrawMinimap_HUD(class UCanvas* C);
	void CheckAndDrawProgress(class AGameObjective* Go, class UCanvas* C);
	void DrawProgressMessage(class UCanvas* C, float ProgressPct);
	int STATIC_GetGameObjectIndexByTag(const struct FName& Tag);
	int STATIC_GetGameObjectIndex(class AGameObjective* Go);
	void DrawObjectives(class UCanvas* C);
	struct FColor MultiplyColor(const struct FColor& c2, struct FColor* c1);
	bool IsOnEdgeOfScreen(class UCanvas* C, const struct FVector& pos, float W, float H);
	struct FVector GetRadarDotPosition(class UCanvas* C, const struct FVector& dist, const struct FVector& ViewX, const struct FVector& ViewY, float OffsetScale, float OffsetY);
	float GetRadarDotDist(const struct FVector& dist, const struct FVector& ViewX, const struct FVector& ViewY);
	float ApplySmartRangeDist(float dist);
	void DrawRadarPassB(class UCanvas* C);
	void DrawRadarPassA(class UCanvas* C);
	void DrawDebug(class UCanvas* C, int X, int dy, int* Y);
	void DrawSpectatingHud(class UCanvas* C);
	void ShowTeamScorePassC(class UCanvas* C);
	bool IsVSRelevant();
	void DrawTeamVS(class UCanvas* C);
	void ShowTeamScorePassA(class UCanvas* C);
	void UpdateHUD();
	void updateScore();
	void UpdateTimer(int* TimeMinutes, int* TimeSeconds);
	void UpdateTeamHud();
	bool ShouldShowObjectiveBoard();
	void DrawAssaultHUDLayer(class UCanvas* C);
	void CanvasDrawActors(class UCanvas* C, bool bClearedZBuffer);
	void DrawHudPassC(class UCanvas* C);
	void DrawHudPassB(class UCanvas* C);
	void DrawDebugTime(class UCanvas* C);
	void DrawDebugMission(class UCanvas* C);
	void CallEvent(bool InvenCheck, int iReservation1, int iReservation2);
	void DrawHudPassA(class UCanvas* C);
	void Destroyed();
	void UpdateOBJ();
	void PostBeginPlay();
	void PrecacheFonts(class UCanvas* C);
	void ShowObjectiveBoard();
	void DrawAdrenaline(class UCanvas* C);
	void DrawTimer(class UCanvas* C);
};


// Class WMission.wHUD_Alien
// 0x08C8 (0x55CC - 0x4D04)
class AwHUD_Alien : public AwHUD_Mission
{
public:
	int                                                iModeItemSlots[0x2];                                      // 0x4D04(0x0004)
	TArray<unsigned char>                              AlienObjectTypes;                                         // 0x4D0C(0x000C) (NeedCtorLink)
	unsigned char                                      SelectedAlienObjectType;                                  // 0x4D18(0x0001)
	unsigned char                                      byAlienGame_MenuType;                                     // 0x4D19(0x0001)
	unsigned char                                      UnknownData00[0x2];                                       // 0x4D1A(0x0002) MISSED OFFSET
	struct FSpriteWidget                               WAlienSelectMenuBack;                                     // 0x4D1C(0x0040)
	struct FSpriteWidget                               WAlienSelectBut_Cli;                                      // 0x4D5C(0x0040)
	struct FSpriteWidget                               WAlienSelectBut_Nor;                                      // 0x4D9C(0x0040)
	struct FSpriteWidget                               WHumanMarkDisplay;                                        // 0x4DDC(0x0040)
	struct FSpriteWidget                               WAlienMarkDisplay;                                        // 0x4E1C(0x0040)
	struct FSpriteWidget                               WAlienModeSkillSlot;                                      // 0x4E5C(0x0040)
	struct FSpriteWidget                               WAlienModeSkillType[0x2];                                 // 0x4E9C(0x0040)
	struct FSpriteWidget                               WAlienModeAlienType[0x3];                                 // 0x4F1C(0x0040)
	TArray<class UMaterial*>                           matModeItemIcons;                                         // 0x4FDC(0x000C) (NeedCtorLink)
	TArray<class UMaterial*>                           matAlienTypeIcons;                                        // 0x4FE8(0x000C) (NeedCtorLink)
	struct FSpriteWidget                               WHumanAttackBuffDisplay;                                  // 0x4FF4(0x0040)
	struct FSpriteWidget                               WHumanAttackLevelDisplay[0xA];                            // 0x5034(0x0040)
	struct FString                                     strOriAttackBuffMsg;                                      // 0x52B4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strAttackBuffMsg;                                         // 0x52C0(0x000C) (NeedCtorLink)
	struct FSpriteWidget                               WAlienLevelBackDisplay;                                   // 0x52CC(0x0040)
	struct FSpriteWidget                               WAlienLevelDisplay[0x5];                                  // 0x530C(0x0040)
	struct FSpriteWidget                               WAlienEyeBackDisplay;                                     // 0x544C(0x0040)
	struct FString                                     strRoundGoalMsg;                                          // 0x548C(0x000C) (NeedCtorLink)
	struct FString                                     strHumanGoalMsg;                                          // 0x5498(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strAlienGoalMsg;                                          // 0x54A4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strAlienLevelMsg[0x3];                                    // 0x54B0(0x000C) (Localized, NeedCtorLink)
	struct FSpriteWidget                               WHeroIconDisplay;                                         // 0x54D4(0x0040)
	struct FVector                                     vHeroLocation;                                            // 0x5514(0x000C)
	unsigned long                                      bHeroLocationMark : 1;                                    // 0x5520(0x0004)
	struct FString                                     strAlienSelect;                                           // 0x5524(0x000C) (Localized, NeedCtorLink)
	struct FSpriteWidget                               WAlienMeleeKill;                                          // 0x5530(0x0040) (Edit)
	struct FString                                     strSecond;                                                // 0x5570(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strAlienSelectKey[0x3];                                   // 0x557C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     strAlienSelectWaitMesage;                                 // 0x55A0(0x000C) (Localized, NeedCtorLink)
	float                                              fCurAlienRespawnTime;                                     // 0x55AC(0x0004)
	unsigned long                                      bSelectAlienType : 1;                                     // 0x55B0(0x0004)
	struct FScriptDelegate                             __DrawDisplayHUD__Delegate;                               // 0x55B4(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __DrawBackScreen__Delegate;                               // 0x55BC(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __DrawDisplaySelectMenu__Delegate;                        // 0x55C4(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wHUD_Alien");
		return ptr;
	}


	void ShowRadioMessage_Notify();
	void ShowRadioMessage_Alarm();
	void ShowRadioMessage();
	void LocalizedMessage2(class UClass* Message, int Switch, bool bOption_Push, const struct FString& CriticalString);
	void ChangeWeaponSlot5Hud(class AwWeapon* newWeapon, bool bAddSkill);
	void Tick(float DeltaTime);
	void CheckPawnOwnerSkill(int* skillC4, int* skillAirStirke, int* skillRPG);
	void CallEvent(bool InvenCheck, int iReservation1, int iReservation2);
	void UpdateModeEquippedItem();
	void UpdateModeItemSlot_Human();
	void UpdateModeItemSlot_Alien();
	void AddTeamDeathInfo(class APawn* P, class APlayerReplicationInfo* PRI, float FadeTime, float Duration);
	void NotifyHealthInDanger();
	void OnClientReceiveDeathMessage(class APlayerController* P, int Switch, class APlayerReplicationInfo* attackerPRI, class APlayerReplicationInfo* victimPRI, class UObject* OptionalObject);
	bool DrawSpecialSkillMedal(class UCanvas* C, int Index, int width, int Height, const struct FCalCoordsW& calW, int PosX, int PosY, float curScale);
	void DeleteSuppliesPositions(class AActor* act);
	void CacheSuppliesPositions(class AActor* act);
	void UpdateSelectAlienMenu();
	void ChangeHudType(unsigned char Type);
	void DrawAlienCoolTimeSkillSlot(class UCanvas* C);
	void DrawAlienModeSkillSlot(class UCanvas* C);
	void DrawDisplaySelectAlienMenu(class UCanvas* C);
	void DrawObjectives(class UCanvas* C);
	void DrawResultScore(class UCanvas* C);
	void DrawSpectatingHud(class UCanvas* C);
	void DrawHudPassA_Score(class UCanvas* C);
	bool IsPickupWeapon();
	void EnableWeaponSlot5Hud(int nWeaponID);
	void DrawAlienDisplayBackScreen(class UCanvas* C);
	void DrawHumanDisplayBackScreen(class UCanvas* C);
	void DrawAlienDisplyHud(class UCanvas* C);
	void DrawSpecialModeIcon(class UCanvas* C, class AwPawn* curPawn);
	void UpdateNameTagInfo(class UCanvas* C, class AwPawn* curPawn, const struct FVector& camLoc, const struct FRotator& camRot);
	void DrawNametagsScript(class UCanvas* C, bool bSpectateMode, bool drawAlways);
	void DrawHumanDisplyHud(class UCanvas* C);
	void DrawDisplaySelectMenu(class UCanvas* C);
	void DrawBackScreen(class UCanvas* C);
	void DrawDisplayHUD(class UCanvas* C);
	float CalculateHPBar(bool bDamage, bool bRecovery);
	void DrawHpStamina(class UCanvas* C, bool bShowSpectating);
	void DrawBackDisplayScreen(class UCanvas* C);
	void DrawHudPassA(class UCanvas* C);
	void InitHudPart_SelQuickSlot();
	void Reset();
	void NotifyGRIChanged();
	void PostBeginPlay();
};


// Class WMission.wMSGameReplicationInfo
// 0x00F4 (0x06A0 - 0x05AC)
class AwMSGameReplicationInfo : public AGameReplicationInfo
{
public:
	int                                                RoundTimeLimit;                                           // 0x05AC(0x0004) (Net)
	int                                                RoundStartTime;                                           // 0x05B0(0x0004) (Net)
	int                                                CurrentRound;                                             // 0x05B4(0x0004) (Net)
	int                                                MaxRounds;                                                // 0x05B8(0x0004) (Net)
	int                                                ReinforcementCountDown;                                   // 0x05BC(0x0004) (Net)
	int                                                PracticeTimeLimit;                                        // 0x05C0(0x0004)
	int                                                DefuseTimeLimit;                                          // 0x05C4(0x0004) (Net)
	int                                                RoundOverTime;                                            // 0x05C8(0x0004) (Net)
	int                                                MaxTeleportTime;                                          // 0x05CC(0x0004)
	int                                                ScoreLimit;                                               // 0x05D0(0x0004) (Net)
	unsigned long                                      bChangeAttackingTeam : 1;                                 // 0x05D4(0x0004) (Net)
	int                                                ScoringTeam;                                              // 0x05D8(0x0004) (Net)
	float                                              fEndRoundTime;                                            // 0x05DC(0x0004) (Net)
	unsigned char                                      ObjectiveProgress;                                        // 0x05E0(0x0001) (Net)
	unsigned char                                      MaxObjectivePriority;                                     // 0x05E1(0x0001)
	unsigned char                                      UnknownData00[0x2];                                       // 0x05E2(0x0002) MISSED OFFSET
	int                                                PrimaryTeam;                                              // 0x05E4(0x0004) (Net)
	int                                                MaxLives;                                                 // 0x05E8(0x0004) (Net)
	class AGameObjective*                              Objectives;                                               // 0x05EC(0x0004)
	class AGameObject*                                 GameObject;                                               // 0x05F0(0x0004) (Net)
	TEnumAsByte<ERoundWinner>                          RoundWinner;                                              // 0x05F4(0x0001) (Net)
	unsigned char                                      UnknownData01[0x3];                                       // 0x05F5(0x0003) MISSED OFFSET
	struct FString                                     ERW_PracticeRoundEndedStr;                                // 0x05F8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ERW_RedAttackedStr;                                       // 0x0604(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ERW_BlueAttackedStr;                                      // 0x0610(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ERW_RedDefendedStr;                                       // 0x061C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ERW_BlueDefendedStr;                                      // 0x0628(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ERW_DefendersStr;                                         // 0x0634(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ERW_AttackersStr;                                         // 0x0640(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ERW_RedMoreObjectivesStr;                                 // 0x064C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ERW_BlueMoreObjectivesStr;                                // 0x0658(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ERW_RedMoreProgressStr;                                   // 0x0664(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ERW_BlueMoreProgressStr;                                  // 0x0670(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ERW_RedGotSameOBJFasterStr;                               // 0x067C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ERW_BlueGotSameOBJFasterStr;                              // 0x0688(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ERW_DrawStr;                                              // 0x0694(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wMSGameReplicationInfo");
		return ptr;
	}


	bool IsGhostChatting(class AActor* Sender);
	struct FString GetRoundWinnerString();
	void SetMaxLives(int iMaxLives);
	int GetMaxLives();
	bool IsDefender(unsigned char Team);
	bool IsPracticeRound();
	int GetRemainingTime();
	void Timer();
	void SetupAssaultObjectivePriority();
	void PostNetBeginPlay();
	void PreBeginPlay();
};


// Class WMission.wScoreBoard_Mission
// 0x0084 (0x06F0 - 0x066C)
class AwScoreBoard_Mission : public AScoreBoardTeamDeathMatch
{
public:
	struct FString                                     RemainingRoundTime;                                       // 0x066C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     CurrentRound;                                             // 0x0678(0x000C) (Localized, NeedCtorLink)
	struct FString                                     RoundSeparator;                                           // 0x0684(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Defender;                                                 // 0x0690(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Attacker;                                                 // 0x069C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     WaitForReinforcements;                                    // 0x06A8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     WaitingToSpawnReinforcements;                             // 0x06B4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     AutoRespawn;                                              // 0x06C0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     YouWonRound;                                              // 0x06CC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     YouLostRound;                                             // 0x06D8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     PracticeRoundOver;                                        // 0x06E4(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wScoreBoard_Mission");
		return ptr;
	}


	void DrawTeam(int TeamNum, int PlayerCount, int OwnerOffset, class UCanvas* Canvas, int FontReduction, int BoxSpaceY, int PlayerBoxSizeY, int HeaderOffsetY);
	struct FString GetDefaultScoreInfoString();
	struct FString GetRestartString();
	struct FString GetTitleString();
};


// Class WMission.wInfoPod
// 0x0028 (0x0400 - 0x03D8)
class AwInfoPod : public AKeypoint
{
public:
	TEnumAsByte<EIP_AssaultTeam>                       Team;                                                     // 0x03D8(0x0001) (Edit)
	TEnumAsByte<EIP_InfoType>                          InfoType;                                                 // 0x03D9(0x0001) (Edit)
	TEnumAsByte<EIP_InfoEffect>                        InfoEffect;                                               // 0x03DA(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x1];                                       // 0x03DB(0x0001) MISSED OFFSET
	unsigned long                                      bIsTriggered : 1;                                         // 0x03DC(0x0004) (Edit)
	unsigned long                                      bDisabled : 1;                                            // 0x03DC(0x0004) (Edit, Net)
	unsigned long                                      BACKUP_bDisabled : 1;                                     // 0x03DC(0x0004)
	unsigned long                                      bOverrideZoneCheck : 1;                                   // 0x03DC(0x0004) (Edit)
	unsigned long                                      bOverrideVisibilityCheck : 1;                             // 0x03DC(0x0004) (Edit)
	float                                              DrawDistThresHold;                                        // 0x03E0(0x0004) (Edit)
	TEnumAsByte<ERenderStyle>                          InfoPodDrawStyle;                                         // 0x03E4(0x0001) (Edit)
	unsigned char                                      DrawOpacity;                                              // 0x03E5(0x0001) (Edit)
	unsigned char                                      UnknownData01[0x2];                                       // 0x03E6(0x0002) MISSED OFFSET
	class UMaterial*                                   POD_Texture;                                              // 0x03E8(0x0004) (Edit)
	float                                              TextureScale;                                             // 0x03EC(0x0004) (Edit)
	struct FString                                     POD_Message;                                              // 0x03F0(0x000C) (Edit, Localized, NeedCtorLink)
	unsigned char                                      FontSize;                                                 // 0x03FC(0x0001) (Edit)
	unsigned char                                      UnknownData02[0x3];                                       // 0x03FD(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wInfoPod");
		return ptr;
	}


	void DrawInfoPod_Texture(class UCanvas* C, const struct FVector& IPScrO);
	void DrawInfoPod_TextBrackets(class UCanvas* C, const struct FVector& IPScrO, class APlayerController* PC);
	void DrawInfoPod_PlainText(class UCanvas* C, const struct FVector& IPScreenPos, class APlayerController* PC);
	void Render(class UCanvas* C, const struct FVector& IPScreenPos, class APlayerController* PC);
	bool IsInfoPodVisible(class UCanvas* C, class APawn* P, const struct FVector& camLoc, const struct FRotator& camRot);
	void Reset();
	void Trigger(class AActor* Other, class APawn* EventInstigator);
	void PostBeginPlay();
};


// Class WMission.wTrigger_MSMessageTrigger
// 0x0020 (0x03F8 - 0x03D8)
class AwTrigger_MSMessageTrigger : public ATriggers
{
public:
	TEnumAsByte<EPSM_AssaultTeam>                      AssaultTeam;                                              // 0x03D8(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x03D9(0x0003) MISSED OFFSET
	class USound*                                      AnnouncerSound;                                           // 0x03DC(0x0004) (Edit)
	struct FString                                     Message;                                                  // 0x03E0(0x000C) (Edit, Localized, NeedCtorLink)
	unsigned char                                      AnnouncementLevel;                                        // 0x03EC(0x0001) (Edit)
	unsigned char                                      UnknownData01[0x3];                                       // 0x03ED(0x0003) MISSED OFFSET
	unsigned long                                      bSoundsPrecached : 1;                                     // 0x03F0(0x0004)
	TEnumAsByte<EAPriority>                            Priority;                                                 // 0x03F4(0x0001) (Edit)
	unsigned char                                      UnknownData02[0x3];                                       // 0x03F5(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wTrigger_MSMessageTrigger");
		return ptr;
	}


	void PrecacheAnnouncer(class AAnnouncerVoice* V, bool bRewardSounds);
	unsigned char GetTeamNum();
	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class WMission.wObjectivePointingArrow
// 0x001C (0x03F4 - 0x03D8)
class AwObjectivePointingArrow : public AActor
{
public:
	struct FVector                                     DrawOffset;                                               // 0x03D8(0x000C)
	class UMaterial*                                   PulseTeamSkin[0x2];                                       // 0x03E4(0x0004)
	class UMaterial*                                   TeamSkin[0x2];                                            // 0x03EC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wObjectivePointingArrow");
		return ptr;
	}


	void Render(class UCanvas* C, class APlayerController* PC, class AActor* TrackedActor);
	void SetYellowColor(bool bPulse);
	void SetTeamSkin(unsigned char Team, bool bPulse);
};


// Class WMission.wMSGameInfo
// 0x00DC (0x16C4 - 0x15E8)
class AwMSGameInfo : public AwTeamGame
{
public:
	int                                                RoundLimit;                                               // 0x15E8(0x0004) (Edit, Config)
	int                                                MaxRounds;                                                // 0x15EC(0x0004)
	int                                                RoundTimeLimit;                                           // 0x15F0(0x0004) (Edit, Config)
	int                                                PracticeTimeLimit;                                        // 0x15F4(0x0004) (Edit, Config)
	int                                                DefuseTimeLimit;                                          // 0x15F8(0x0004)
	int                                                ReinforcementsFreq;                                       // 0x15FC(0x0004) (Config)
	int                                                ReinforcementsValidTime;                                  // 0x1600(0x0004)
	int                                                ReinforcementsCount;                                      // 0x1604(0x0004)
	int                                                ScoreLimit;                                               // 0x1608(0x0004) (Edit)
	int                                                ChangeAttackTeamRound;                                    // 0x160C(0x0004) (Edit)
	int                                                RespawnRestrictionTimeRound1;                             // 0x1610(0x0004)
	float                                              EnqueueRespawningControllersLastTIme;                     // 0x1614(0x0004)
	int                                                RemainingTimeWhenObjectIsSet;                             // 0x1618(0x0004)
	unsigned long                                      bRoundOverProcessed : 1;                                  // 0x161C(0x0004)
	float                                              RespawnElapsedTime;                                       // 0x1620(0x0004)
	float                                              LastRespawnTime;                                          // 0x1624(0x0004)
	unsigned long                                      bCheckPrecacheInProcessRespawn : 1;                       // 0x1628(0x0004)
	TArray<class AController*>                         RespawningControllers;                                    // 0x162C(0x000C) (NeedCtorLink)
	unsigned char                                      CurrentAttackingTeam;                                     // 0x1638(0x0001)
	unsigned char                                      FirstAttackingTeam;                                       // 0x1639(0x0001)
	unsigned char                                      CurrentRound;                                             // 0x163A(0x0001)
	unsigned char                                      UnknownData00[0x1];                                       // 0x163B(0x0001) MISSED OFFSET
	int                                                RoundStartTime;                                           // 0x163C(0x0004)
	unsigned long                                      bDisableReinforcements : 1;                               // 0x1640(0x0004)
	struct FString                                     NewRoundSound;                                            // 0x1644(0x000C) (NeedCtorLink)
	struct FString                                     sndBeginRound;                                            // 0x1650(0x000C) (NeedCtorLink)
	struct FName                                       AttackerWinRound[0x2];                                    // 0x165C(0x0004)
	struct FName                                       DefenderWinRound[0x2];                                    // 0x1664(0x0004)
	struct FName                                       DrawGameSound;                                            // 0x166C(0x0004)
	class AVehicle*                                    KeyVehicle;                                               // 0x1670(0x0004)
	class ASceneManager*                               CurrentMatineeScene;                                      // 0x1674(0x0004)
	class AwMSCinematic_SceneManager*                  EndCinematic;                                             // 0x1678(0x0004)
	unsigned long                                      bObjectivePlanted : 1;                                    // 0x167C(0x0004)
	struct FName                                       nPlantedObjectiveName;                                    // 0x1680(0x0004)
	struct FString                                     sndChangeAttackTeam;                                      // 0x1684(0x000C) (NeedCtorLink)
	struct FString                                     sndLastMan;                                               // 0x1690(0x000C) (NeedCtorLink)
	struct FString                                     sndRoundWin;                                              // 0x169C(0x000C) (NeedCtorLink)
	struct FString                                     sndRoundLose;                                             // 0x16A8(0x000C) (NeedCtorLink)
	struct FString                                     BombPlantedMessage;                                       // 0x16B4(0x000C) (Localized, NeedCtorLink)
	unsigned long                                      bMultiBomb : 1;                                           // 0x16C0(0x0004)
	unsigned long                                      bSentEndRound : 1;                                        // 0x16C0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wMSGameInfo");
		return ptr;
	}


	void AddGameSpecificActions(TArray<class UwAction*>* Actions);
	bool DoProcessKillMessage(class UClass* DamageType);
	int GetTotalPlayedTime();
	int GetBootySeedValue();
	void CheckScore(class APlayerReplicationInfo* Scorer);
	void CheckLastMan(int TeamIndex);
	bool CheckMaxLives(class APlayerReplicationInfo* Scorer);
	bool EndGameByTeamNoneLeft(class APlayerReplicationInfo* Living);
	void LeaveLogOtherTeamNoneLeft(class APlayerReplicationInfo* Living);
	void lll();
	void FindLiving(class APlayerReplicationInfo** Living, unsigned char* bOtherTeamNoneLeft);
	bool AllowBecomeActivePlayer(class APlayerController* P);
	bool IsRightTimeForRespawn(class AController* C);
	bool IsRespawnRestrictionTime();
	bool STATIC_AllowMutator(const struct FString& MutatorClassName);
	struct FString STATIC_GetDescriptionText(const struct FString& PropName);
	void STATIC_FillPlayInfo(class UPlayInfo* PlayInfo);
	bool STATIC_AcceptPlayInfoProperty(const struct FString& PropertyName);
	void GetServerDetails(struct FServerResponseLine* ServerState);
	void UpdateAnnouncements();
	void STATIC_PrecacheGameAnnouncements(class AAnnouncerVoice* V, bool bRewardSounds);
	void QueueAnnouncerSound(const struct FString& ASound, unsigned char AnnouncementLevel, unsigned char Team, TEnumAsByte<EAPriority> Priority, unsigned char Switch);
	int AdjustDestroyObjectiveDamage(int Damage, class AController* instigatedBy, class AGameObjective* Go);
	int ReduceDamage(int Damage, class APawn* injured, class APawn* instigatedBy, const struct FVector& HitLocation, class UClass* DamageType, int iWeaponType, struct FVector* Momentum);
	void SetObjectiveSetted(class APawn* TP, const struct FName& ObjectTag, const struct FVector& FlagLocation);
	int GetRemainingTime();
	void SetRemainingTime(int remain);
	class ANavigationPoint* FindPlayerStart(class AController* Player, unsigned char inTeam, const struct FString& incomingName);
	int GetPlayerStartTeam(class ANavigationPoint* N, int Team);
	class UClass* GetDefaultPlayerClass(class AController* C);
	void AddDefaultInventory(class APawn* PlayerPawn);
	void RestartPlayer(class AController* aPlayer);
	void ForceRestartPlayer(class AController* aPlayer);
	void TeamScoreEvent(int Team, float Points, const struct FString& Desc);
	void ScoreEvent(class APlayerReplicationInfo* Who, float Points, const struct FString& Desc);
	void KillEvent(const struct FString& KillType, class APlayerReplicationInfo* Killer, class APlayerReplicationInfo* Victim, class UClass* Damage);
	void SpecialEvent(class APlayerReplicationInfo* Who, const struct FString& Desc);
	bool CriticalPlayer(class AController* Other);
	int VehicleScoreKill(class AController* Killer, class AController* Killed, class AVehicle* DestroyedVehicle, struct FString* KillInfo);
	void Killed(class AController* Killer, class AController* Killed, class APawn* KilledPawn, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot);
	void TeleportPlayerToSpawn(class AController* C);
	void NoTranslocatorKeyPressed(class APlayerController* PC);
	void NewSpawnAreaEnabled(bool bDefenders);
	bool CanDisableObjective(class AGameObjective* Go);
	bool NeedToRespawnSD();
	bool IsPlaying();
	bool IsPracticeRound();
	bool IsPlayingIntro();
	int GetDefenderNum();
	int GetAttackingTeam();
	bool IsAttackingTeam(int TeamNumber);
	void BeginNewPairOfRounds();
	void BeginRound(bool bNoReset);
	void DestoryPawns();
	bool ProcessSwitchTeam(bool bNoReset);
	void SetRoundTimeLimit();
	void InitializeGameInfo(bool bNoReset, bool bChangeTeam);
	void AnnounceSwitchTeam();
	void NewRoundSwitchTeam();
	void ResetLevel(bool hiddenAll);
	void StartNewRound();
	void NewRound();
	void AnnounceScore(int ScoringTeam);
	void SetRoundWinner(int WinningTeam);
	void PracticeRoundEnded();
	bool IsRoundLimitReached();
	void EndRound(TEnumAsByte<ERER_Reason> RoundEndReason, class APawn* Instigator, const struct FString& Reason);
	void NotifyEndRound();
	void NotifyBeginRound();
	void CalcRoundResultPoints(int ScoringTeam);
	void ProcessEndGame();
	void PlayEndOfMatchMessage();
	bool CheckEndGame(class APlayerReplicationInfo* Winner, const struct FString& Reason);
	void SceneStarted(class ASceneManager* SM, class AActor* Other);
	void ProcessRespawn();
	void ExplodeBomb();
	void ProcessEndRound();
	int GetTimeSecondsLeft();
	void CheckEndGameAfterRoundTimeOver();
	void fEndRound(unsigned char Team);
	void OnRoundTimeOverWithoutObjectPlanted();
	void BroadCast_AssaultRole_Message(class APlayerController* C);
	void GameObjectDropped(class ADecoration* D);
	void DiscardInventory(class APawn* Other);
	void OnKillingDropOut(class APawn* P);
	void Logout(class AController* Exiting);
	void InitGameReplicationInfo();
	void StartMatch();
	void StartMatchChangedHost();
	void InitGameOption(const struct FString& Options, struct FString* Error);
	void InitGame(const struct FString& Options, struct FString* Error);
	class APlayerController* Login(const struct FString& Portal, const struct FString& Options, struct FString* Error);
	void PostBeginPlay();
	void ForceObjectiveDefenderTeamIndex();
	void TweakSkill(class ABot* B);
	bool STATIC_NeverAllowTransloc();
	bool AllowTransloc();
	bool DivertSpaceFighter();
	void CheckReady();
	void Reset();
};


// Class WMission.wAmmo_Dummy
// 0x0000 (0x047C - 0x047C)
class AwAmmo_Dummy : public AwAmmunition
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wAmmo_Dummy");
		return ptr;
	}

};


// Class WMission.wGameObject_Bomb
// 0x0068 (0x04D4 - 0x046C)
class AwGameObject_Bomb : public AGameObject
{
public:
	struct FString                                     PlayerDroppedMessage;                                     // 0x046C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     DroppedMessage;                                           // 0x0478(0x000C) (Localized, NeedCtorLink)
	struct FString                                     EnergyCorePickedUp;                                       // 0x0484(0x000C) (Localized, NeedCtorLink)
	struct FString                                     PlayerPickedUpEnergyCore;                                 // 0x0490(0x000C) (Localized, NeedCtorLink)
	struct FString                                     PlayerCoreReset;                                          // 0x049C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     EnemyPickedUpBomb;                                        // 0x04A8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     EnemyDroppedBomb;                                         // 0x04B4(0x000C) (Localized, NeedCtorLink)
	unsigned long                                      bSoundsPrecached : 1;                                     // 0x04C0(0x0004)
	class AwBombObjective*                             MySpawnObjective;                                         // 0x04C4(0x0004)
	struct FString                                     strPlayerName;                                            // 0x04C8(0x000C) (Net, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wGameObject_Bomb");
		return ptr;
	}


	void PrecacheAnnouncer(class AAnnouncerVoice* V, bool bRewardSounds);
	void LogReturned();
	void HolderDied();
	void Landed(const struct FVector& HitNormal);
	void Drop(const struct FVector& NewVel, const struct FString& sReason);
	void ProcessThrowMessage();
	void ProcessDropMessage();
	void ClearHolder();
	void SetHolder(class AController* C);
	void ProcessSetHolderMessage(class AController* C);
	void OnSetHolder(class AController* C);
	bool ValidHolder(class AActor* Other);
	void PostBeginPlay();
	bool CanBePickedUpBy(class APawn* P);
};


// Class WMission.wSetObjective
// 0x0024 (0x0704 - 0x06E0)
class AwSetObjective : public AUseObjective
{
public:
	class APawn*                                       TP;                                                       // 0x06E0(0x0004)
	float                                              fSetTime;                                                 // 0x06E4(0x0004)
	float                                              fActiveStartTime;                                         // 0x06E8(0x0004)
	float                                              fSettingLength;                                           // 0x06EC(0x0004) (Edit)
	int                                                iTest;                                                    // 0x06F0(0x0004)
	float                                              fDecLength;                                               // 0x06F4(0x0004)
	unsigned long                                      bReplicateSettingOn : 1;                                  // 0x06F8(0x0004)
	unsigned char                                      bySettingOn;                                              // 0x06FC(0x0001) (Net)
	unsigned char                                      byOldSettingOn;                                           // 0x06FD(0x0001)
	unsigned char                                      UnknownData00[0x2];                                       // 0x06FE(0x0002) MISSED OFFSET
	float                                              fHudSetTime;                                              // 0x0700(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wSetObjective");
		return ptr;
	}


	void SetActive(bool bActiveStatus);
	void Reset();
	void RefreshState();
	float GetObjectiveProgress();
	void PlayerToucherDied(class APawn* P);
	bool IsRelevant(class APawn* P, bool bAliveCheck);
	void UnTouch(class AActor* Other);
	void Touch(class AActor* Other);
	bool CanPlant(class APawn* P);
	bool IsPlanting(class APawn* P);
	void Tick(float DeltaTime);
	void SetDefuseLocation(const struct FVector& loc, const struct FName& Tag);
	void UsedBy(class APawn* User);
	void PreBeginPlay();
};


// Class WMission.wDiffuseObjective
// 0x0050 (0x0730 - 0x06E0)
class AwDiffuseObjective : public AUseObjective
{
public:
	class APawn*                                       TP;                                                       // 0x06E0(0x0004)
	float                                              fSetTime;                                                 // 0x06E4(0x0004) (Net)
	float                                              fSetTimeBefore;                                           // 0x06E8(0x0004)
	float                                              fSetTimeClient;                                           // 0x06EC(0x0004)
	float                                              fSettingLength;                                           // 0x06F0(0x0004) (Edit)
	int                                                iTest;                                                    // 0x06F4(0x0004)
	float                                              fDecLength;                                               // 0x06F8(0x0004)
	unsigned long                                      bReplicateSettingOn : 1;                                  // 0x06FC(0x0004)
	unsigned char                                      bySettingOn;                                              // 0x0700(0x0001) (Net)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0701(0x0003) MISSED OFFSET
	unsigned long                                      lastBombVisibility : 1;                                   // 0x0704(0x0004)
	TArray<class APawn*>                               TouchingPawns;                                            // 0x0708(0x000C) (NeedCtorLink)
	TArray<class AwGameObject_Bomb*>                   bombs;                                                    // 0x0714(0x000C) (NeedCtorLink)
	struct FString                                     BombDefusedMessage;                                       // 0x0720(0x000C) (Localized, NeedCtorLink)
	class AwGameObject_Bomb*                           Setbomb;                                                  // 0x072C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wDiffuseObjective");
		return ptr;
	}


	void Reset();
	void RefreshState();
	float GetObjectiveProgress();
	void PlayerToucherDied(class APawn* P);
	bool IsRelevant(class APawn* P, bool bAliveCheck);
	void UnTouch(class AActor* Other);
	void Touch(class AActor* Other);
	bool CanDefuse(class APawn* P);
	bool IsDefusing(class APawn* P);
	void Tick(float DeltaTime);
	void PlayBombDefusedMessage(class APawn* TP);
	void OnBombDiffused(class APawn* P);
	void UpdateBombs();
	void SetBombVisibility(bool val);
	void UsedBy(class APawn* User);
	void PreBeginPlay();
};


// Class WMission.wObjectiveProgressDisplay
// 0x006C (0x0498 - 0x042C)
class AwObjectiveProgressDisplay : public AInfo
{
public:
	class AwHUD_Mission*                               ASHUD;                                                    // 0x042C(0x0004)
	struct FString                                     HeaderText;                                               // 0x0430(0x000C) (Localized, NeedCtorLink)
	struct FString                                     OptionalObjectivePrefix;                                  // 0x043C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ObjTimesString;                                           // 0x0448(0x000C) (Localized, NeedCtorLink)
	struct FString                                     TextCutSuffix;                                            // 0x0454(0x000C) (Localized, NeedCtorLink)
	struct FString                                     SpaceSeparator;                                           // 0x0460(0x000C) (Localized, NeedCtorLink)
	struct FString                                     PrimaryObjectivePrefix;                                   // 0x046C(0x000C) (Localized, NeedCtorLink)
	float                                              SlideScale;                                               // 0x0478(0x0004)
	struct FVector                                     BoxSize;                                                  // 0x047C(0x000C)
	struct FVector                                     BoxPivot;                                                 // 0x0488(0x000C)
	float                                              SlideSpeed;                                               // 0x0494(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wObjectiveProgressDisplay");
		return ptr;
	}


	struct FString GetObjectiveDescription(class AGameObjective* Go, bool bDefender);
	void SetObjectiveColor(class UCanvas* C, class AGameObjective* Go);
	bool AnyOptionalObjectiveCritical();
	bool AnyPrimaryObjectivesCritical();
	float GetGlobalObjectiveProgress();
	int GetPrimaryObjectiveCount();
	void DrawBigCurrentObjective(class UCanvas* C, bool bDefender, bool bCheckOverlap);
	struct FString CheckEntry(class UCanvas* C, const struct FString& Entry);
	struct FVector DrawObjectives(class UCanvas* C, const struct FVector& BoxPivot, bool bDefender, bool bGetBoxSize);
	void PostRender(class UCanvas* C, float DeltaTime, bool bDefender);
	void Initialize(class AwHUD_Mission* H);
	void UpdateSlideScale(float DeltaTime);
	void ShowStatus(bool bShow);
};


// Class WMission.wAlienController
// 0x0038 (0x1160 - 0x1128)
class AwAlienController : public AwPlayer
{
public:
	TArray<struct FCoolTimeSkillObject>                CoolTimeSkills;                                           // 0x1128(0x000C) (NeedCtorLink)
	struct FVector                                     vDeadLocation;                                            // 0x1134(0x000C)
	struct FRotator                                    rDeadRotation;                                            // 0x1140(0x000C)
	struct FVector                                     vKnockBackDir;                                            // 0x114C(0x000C)
	float                                              fKnockBackTime;                                           // 0x1158(0x0004)
	float                                              fKnockBackMomentum;                                       // 0x115C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wAlienController");
		return ptr;
	}


	void ReceiveMessage_QuestType4(class UClass* Message, int Switch, int iRDifficult, int iRRound);
	void ReceiveMessage_QuestType3(class UClass* Message, int Switch, int iRDifficult, int iRMap);
	void ReceiveMessage_QuestType2(class UClass* Message, int Switch, int iRMode, int iRMap, int iRMin, int iRSec);
	void ReceiveMessage_QuestType1(class UClass* Message, int Switch, int iRWeaponType, int iRweaponId);
	void ConsoleTakeHit();
	int ClientCoolTimeSkillObject(int iSkillID);
	void ClientCallCoolTimeSkill(int iSkillID);
	void ClientReadyCoolTimeSkill(int iSkillID);
	void ProcessUseKey();
	void AttackedView(int iWeaponID, float fHitGunKick, const struct FVector& vAttacked);
	void ClientChangeTeam(unsigned char InvertSideID);
	void ClientQuickRepairByAlien(int PlayerID);
	void ClientUpdateDefSuccessFromInfection(int PlayerID);
	void ClientUpdateLevelup(unsigned char byAttackLevelIndex);
	void ClientUpdate3rdModel(int PlayerID, TEnumAsByte<EAlienModeType> eType, unsigned char bySkinID);
	void PlayerTick(float DeltaTime);
	void ServerChangePawn(unsigned char bySkinID);
	void ServerSetBase();
	void OnEndRound();
	void SelectRadioMessage(int iKey);
	void ClientChangeKnockBackState(const struct FVector& _vKnockBackDir, float _fKnockBackTime, float _fKnockBackMomentum);
	void NotifyTakeHit(class APawn* instigatedBy, const struct FVector& HitLocation, int Damage, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart);
	void CallCoolTimeSkill(int iSkillID);
	bool ServerUse();
	void UpdateHitMoveEffectFromWeapon(class UwWeaponBaseParams* WBP);
	float GetHitGunKick(class UwWeaponBaseParams* WBP);
	TEnumAsByte<EAlienModeType> GetObjType();
	void UnPossess();
	void ChangeTeam(int N);
	void UpdateHPValue(unsigned char bySkinID, TEnumAsByte<EAlienModeType> eObjType);
	void SetAlienModeType(TEnumAsByte<EAlienModeType> eType);
	void PawnItemList();
	void ClientReset();
	void ClientOnEndWaitingForStart();
	void Possess(class APawn* aPawn);
	unsigned char GetInfectionLevel();
	bool AddInfectionLevel();
	void RemoveSkill_Client(int iSkillID);
	void AddSkill_Client(int iSkillID);
	void AddSkill(int iSkillID);
	void ClientRoundEnded();
	void LocalSetPrecached();
};


// Class WMission.wAlienGameReplicationInfo
// 0x001C (0x06BC - 0x06A0)
class AwAlienGameReplicationInfo : public AwMSGameReplicationInfo
{
public:
	int                                                iCurTimeOfAppearence;                                     // 0x06A0(0x0004) (Net)
	unsigned long                                      bAlienAppeared : 1;                                       // 0x06A4(0x0004) (Net)
	int                                                iPlayingNum;                                              // 0x06A8(0x0004) (Net)
	unsigned char                                      CurAlienAttackBuffLevel;                                  // 0x06AC(0x0001) (Net)
	unsigned char                                      MaxAlienAttackBuffLevel;                                  // 0x06AD(0x0001)
	unsigned char                                      UnknownData00[0x2];                                       // 0x06AE(0x0002) MISSED OFFSET
	int                                                iPrevAlienAttackIndex;                                    // 0x06B0(0x0004)
	unsigned char                                      AlienTeamCount;                                           // 0x06B4(0x0001) (Net)
	unsigned char                                      HumanTeamCount;                                           // 0x06B5(0x0001) (Net)
	unsigned char                                      UnknownData01[0x2];                                       // 0x06B6(0x0002) MISSED OFFSET
	float                                              fMaxRespawnTime;                                          // 0x06B8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wAlienGameReplicationInfo");
		return ptr;
	}


	void Reset();
	bool IsCanRespawnTime();
	int GetAttackLevelIndex();
	unsigned char GetCurTeamMemberCount(int TeamIndex);
	int GetMaxRound();
	int GetCurAlienModeWaitingTimeCount();
	int GetStartPlayerCountOfCurRound();
};


// Class WMission.wHudPart_MinimapAlienGame
// 0x0004 (0x1330 - 0x132C)
class AwHudPart_MinimapAlienGame : public AwHudPart_Minimap
{
public:
	class UMaterial*                                   MinimapMatHero;                                           // 0x132C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wHudPart_MinimapAlienGame");
		return ptr;
	}


	bool IsSameTeamByPRI(class APlayerReplicationInfo* pri1, class APlayerReplicationInfo* pri2);
	void DrawMinimap_Allies(class UCanvas* C);
	void DrawMinimap_SpecialPositions(class UCanvas* C);
};


// Class WMission.wAMPawn
// 0x004C (0x189C - 0x1850)
class AwAMPawn : public AwPawn
{
public:
	unsigned long                                      bIsOldDefencing : 1;                                      // 0x1850(0x0004)
	float                                              fKnockRatio;                                              // 0x1854(0x0004)
	struct FName                                       Frag_DefenceProne;                                        // 0x1858(0x0004)
	struct FName                                       Frag_DefenceCrouch;                                       // 0x185C(0x0004)
	struct FName                                       Frag_Defence;                                             // 0x1860(0x0004)
	struct FName                                       Meele_Alien_Pr_LR;                                        // 0x1864(0x0004)
	struct FName                                       Meele_Alien_Cr_LR;                                        // 0x1868(0x0004)
	struct FName                                       Meele_Alien_LR;                                           // 0x186C(0x0004)
	struct FName                                       Meele_Alien_Pr_L;                                         // 0x1870(0x0004)
	struct FName                                       Meele_Alien_Cr_L;                                         // 0x1874(0x0004)
	struct FName                                       Meele_Alien_L;                                            // 0x1878(0x0004)
	struct FName                                       Meele_Alien_Pr_R;                                         // 0x187C(0x0004)
	struct FName                                       Meele_Alien_Cr_R;                                         // 0x1880(0x0004)
	struct FName                                       Meele_Alien_R;                                            // 0x1884(0x0004)
	class AEmitter*                                    TransEffect;                                              // 0x1888(0x0004)
	class AEmitter*                                    SpecialEffect;                                            // 0x188C(0x0004)
	class AwObjectiveTankerAlienShield*                ShieldObjective;                                          // 0x1890(0x0004)
	class AwObjectiveTankerAlienShield*                ShieldObjective_1st;                                      // 0x1894(0x0004)
	TEnumAsByte<EAlienModeType>                        eAMPawnType;                                              // 0x1898(0x0001) (Net)
	unsigned char                                      UnknownData00[0x3];                                       // 0x1899(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wAMPawn");
		return ptr;
	}


	void Tick(float DeltaTime);
	void PlayDying(class UClass* DamageType, const struct FVector& HitLoc, int CollisionPart);
	void UpdateCriticalState();
	bool GiveHealth(int HealAmount, int HealMax);
	void ChangeCollisionSize(float fRadius, float fHeight);
	void PlayDirectionalHit(const struct FVector& HitLoc, bool bUseHitStun, bool bGoreChange);
	void PlayBreathSounds();
	void TakeDamageSound(int LeftHealth, int ActualDamage, const struct FVector& HitLocation, class UClass* DamageType, int CollisionPart, int WeaponType, class AController* Killer);
	class AController* GetDelayedInstigatorController(class APawn* instigatedBy);
	void ChangeModel();
	void ClientChangeModelType(TEnumAsByte<EAlienModeType> eObjType);
	void ChangeModelType(TEnumAsByte<EAlienModeType> eObjType);
	void PlayHit(float Damage, class APawn* instigatedBy, const struct FVector& HitLocation, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart);
	void CalcItemUsedTime(class UwMatchUserInfo* kUser);
	void PossessedBy(class AController* C);
	void Setup(const struct FPlayerRecord& Rec, bool bLoadNow);
	void ClientReStart();
	void MakeDefecneSuccessEffect();
	void MakeAttackLevelEffect(unsigned char byAttackLevelIndex);
	void MakeShieldEffect();
	void CallEffect_PHJ();
	void MakeTransformEffect();
	void Destroyed();
	void ProcessHitFX();
	void UpdateDied(int ActualDamage, class AController* Killer, class UClass* DamageType, const struct FVector& HitLocation, int CollisionPart, int WeaponType, bool bWallShot);
	void Process_TossWeapon_When_Dying(class ALevelInfo* levenInfo, class APawn* Pawn, class AwWeapon* Weapon);
	void TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot);
	void ServerChangedWeapon(class AwWeapon* OldWeapon, class AwWeapon* newWeapon);
	void ClientPickupWeapon();
	void ChangedWeapon();
	void AddDefaultSkills(bool bQuickslotChange);
	void AddDefaultInventory(bool bQuickslotChange);
	void PlayMelee(bool bMeleeKnifeOrButt);
	void StartFiring(bool bHeavy, bool bRapid);
	class UClass* GetBloodHitClass(bool bHeadShot);
	float GetSprintJumpZ();
	void Alien_PlayBreathSound();
	void Alien_TakeDamageSound(int LeftHealth, int ActualDamage, const struct FVector& HitLocation, class UClass* DamageType, int CollisionPart, int WeaponType, class AController* Killer);
	class UClass* Alien_GetBloodHitClass(bool bHeadShot);
	void Alien_ClientPickupWeapon();
	float Alien_GetBaseStaminaTime();
	float Alien_GetSprintJumpZ();
	void Alien_ServerChangedWeapon(class AwWeapon* OldWeapon, class AwWeapon* newWeapon);
	void Alien_ChangedWeapon();
	void Alien_PlayDefence();
	void Alien_PlayMelee(bool bMeleeKnifeOrButt);
	void Alien_StartFiring(bool bHeavy, bool bRapid);
	void Alien_TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot);
	void Alien_AddDefaultSkills(bool bQuickslotChange);
	void Alien_AddDefaultInventory(bool bQuickslotChange);
	void Alien_InitStatus();
	void Human_ClientPickupWeapon();
	void Human_UpdateDied(int ActualDamage, class AController* Killer, class UClass* DamageType, const struct FVector& HitLocation, int CollisionPart, int WeaponType, bool bWallShot);
	void Human_TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot);
	void Human_AddDefaultSkills(bool bQuickslotChange);
	void Human_AddDefaultInventory(bool bQuickslotChange);
};


// Class WMission.wAlienGameInfo
// 0x0058 (0x171C - 0x16C4)
class AwAlienGameInfo : public AwMSGameInfo
{
public:
	TArray<class AwSupplyRespawnPoint*>                SupplyRespawnPoints;                                      // 0x16C4(0x000C) (NeedCtorLink)
	TArray<class AwSupplyRespawnPoint*>                SupplyedRespawnPoints;                                    // 0x16D0(0x000C) (NeedCtorLink)
	float                                              fCurSupplyItemDropTime;                                   // 0x16DC(0x0004)
	float                                              fMaxSupplyItemDropTime;                                   // 0x16E0(0x0004)
	int                                                iCurSupplyItemDropTryCount;                               // 0x16E4(0x0004)
	int                                                iMaxSupplyItemDropOnetimeCount;                           // 0x16E8(0x0004)
	int                                                iMaxSupplyItemDropMaxCount;                               // 0x16EC(0x0004)
	int                                                iMaxSupplyItemDropTryCount;                               // 0x16F0(0x0004)
	unsigned long                                      bSentEndRound : 1;                                        // 0x16F4(0x0004)
	float                                              fCheckEndRoundTime;                                       // 0x16F8(0x0004)
	struct FString                                     sndInfectionTransfer;                                     // 0x16FC(0x000C) (NeedCtorLink)
	struct FString                                     sndDropRandomItemBox;                                     // 0x1708(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __ProcessGameLogic__Delegate;                             // 0x1714(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wAlienGameInfo");
		return ptr;
	}


	bool IsAnyPawnWithinRadius(class ANavigationPoint* N);
	bool CanSpectate(class APlayerController* Viewer, bool bOnlySpectator, class AActor* ViewTarget);
	bool IsRightTimeForRespawn(class AController* C);
	void AlienGame_Levelup();
	void AlienGame_Respawn(int Num);
	void AlienGame_TimeOver();
	void AlienGame_HumanWin();
	void AlienGame_AlienWin();
	void AlienGame_Exit();
	int GetWinTeamAD(int winTeam);
	int GetWinTeam(TEnumAsByte<ERER_Reason> RoundEndReason);
	int GetRoundEndType(TEnumAsByte<ERER_Reason> RoundEndReason);
	void ServerLogEndRound(TEnumAsByte<ERER_Reason> RoundEndReason, class APawn* Instigator, const struct FString& Reason);
	float GetAttackBuff();
	bool NeedPlayers();
	bool ProcessSwitchTeam(bool bNoReset);
	class ANavigationPoint* FindAlienModeStart(bool bAlien);
	class ANavigationPoint* FindPlayerStart(class AController* Player, unsigned char inTeam, const struct FString& incomingName);
	void InitializeEveryPlayerStarts();
	void EndRound(TEnumAsByte<ERER_Reason> RoundEndReason, class APawn* Instigator, const struct FString& Reason);
	bool IsRoundLimitReached();
	void ResetItemDrop();
	void ExecuteItemDrop();
	void InGameRoundEnd();
	void InGameAlienMode();
	void InGameAppearAlien();
	void ProcessGameLogic();
	bool CheckLives(class APlayerReplicationInfo* Scorer);
	int ReduceDamage(int Damage, class APawn* injured, class APawn* instigatedBy, const struct FVector& HitLocation, class UClass* DamageType, int iWeaponType, struct FVector* Momentum);
	void CheckEndGameAfterRoundTimeOver();
	bool EndGameByTeamNoneLeft(class APlayerReplicationInfo* Living);
	void CheckScore(class APlayerReplicationInfo* Scorer);
	bool CheckMaxLives(class APlayerReplicationInfo* Scorer);
	bool IsRespawnRestrictionTime();
	void CheckLastMan(int TeamIndex);
	void ProcessQuickRepairByAlien(int PlayerID);
	void ProcessDefSuccessFromInfection(int PlayerID);
	void ChangeAttackLevel(unsigned char byAttackLevelIndex);
	void ChangePawn(class APlayerController* PC);
	void Killed(class AController* Killer, class AController* Killed, class APawn* KilledPawn, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot);
	void StartAlienMode();
	void BeginRound(bool bNoReset);
	bool IsAppropriateRespawnPoint(class ANavigationPoint* N, unsigned char Team);
	void Logout(class AController* Exiting);
	void InitGame(const struct FString& Options, struct FString* Error);
};


// Class WMission.wBombObjective
// 0x004C (0x071C - 0x06D0)
class AwBombObjective : public AGameObjective
{
public:
	class USound*                                      TakenSound;                                               // 0x06D0(0x0004) (Edit)
	class AwGameObject_Bomb*                           myFlag;                                                   // 0x06D4(0x0004)
	class UClass*                                      FlagType;                                                 // 0x06D8(0x0004)
	class UStaticMesh*                                 FlagMesh;                                                 // 0x06DC(0x0004) (Edit)
	struct FString                                     PlayerDroppedMessage;                                     // 0x06E0(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     DroppedMessage;                                           // 0x06EC(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     EnergyCorePickedUp;                                       // 0x06F8(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     PlayerPickedUpEnergyCore;                                 // 0x0704(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     PlayerCoreReset;                                          // 0x0710(0x000C) (Edit, Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wBombObjective");
		return ptr;
	}


	void PrecacheAnnouncer(class AAnnouncerVoice* V, bool bRewardSounds);
	void Reset();
	bool BetterObjectiveThan(class AGameObjective* Best, unsigned char DesiredTeamNum, unsigned char RequesterTeamNum);
	bool BotNearObjective(class ABot* B);
	void SetActive(bool bActiveStatus);
	void PreBeginPlay();
};


// Class WMission.wMessage_MSKillMessages
// 0x0080 (0x04D0 - 0x0450)
class AwMessage_MSKillMessages : public ALocalMessage
{
public:
	struct FString                                     KillString[0x8];                                          // 0x0450(0x000C) (Localized, NeedCtorLink)
	struct FName                                       KillSound[0x8];                                           // 0x04B0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wMessage_MSKillMessages");
		return ptr;
	}


	void STATIC_ClientReceive(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
	struct FString STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
};


// Class WMission.wMSCinematic_SceneManager
// 0x0010 (0x043C - 0x042C)
class AwMSCinematic_SceneManager : public AInfo
{
public:
	struct FName                                       CameraTag;                                                // 0x042C(0x0004) (Edit)
	struct FName                                       EventSceneStarted;                                        // 0x0430(0x0004) (Edit)
	struct FName                                       EventSceneEnded;                                          // 0x0434(0x0004) (Edit)
	class AwMSCinematic_Camera*                        Camera;                                                   // 0x0438(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wMSCinematic_SceneManager");
		return ptr;
	}


	void SceneEnded();
	void ShotEnded(class AwMSCinematic_Camera* cam);
	void PlayScene();
	void Trigger(class AActor* Other, class APawn* EventInstigator);
	void PostBeginPlay();
};


// Class WMission.wSDGameInfo
// 0x0050 (0x1714 - 0x16C4)
class AwSDGameInfo : public AwMSGameInfo
{
public:
	struct FString                                     VoiceOurTeamPlantedBomb;                                  // 0x16C4(0x000C) (NeedCtorLink)
	struct FString                                     VoiceEnemyPlantedBomb;                                    // 0x16D0(0x000C) (NeedCtorLink)
	struct FString                                     sndModeExplain_Attack;                                    // 0x16DC(0x000C) (NeedCtorLink)
	struct FString                                     sndModeExplain_Defend;                                    // 0x16E8(0x000C) (NeedCtorLink)
	float                                              AddScore_Plant;                                           // 0x16F4(0x0004)
	float                                              AddScore_Defuse;                                          // 0x16F8(0x0004)
	float                                              AddExp_Plant;                                             // 0x16FC(0x0004)
	float                                              AddExp_Defuse;                                            // 0x1700(0x0004)
	float                                              AddPoint_Plant;                                           // 0x1704(0x0004)
	float                                              AddPoint_Defuse;                                          // 0x1708(0x0004)
	int                                                StartPlayerCount;                                         // 0x170C(0x0004)
	unsigned long                                      bSentEndRound : 1;                                        // 0x1710(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wSDGameInfo");
		return ptr;
	}


	bool EndGameByTeamNoneLeft(class APlayerReplicationInfo* Living);
	void AnnounceAlmostWinningTeam();
	void AnnounceWinningTeam();
	float GetResultPointRatio_Intervention(class APlayerReplicationInfo* PRI);
	void SetPRI4Intervention(class APlayerReplicationInfo* PRI);
	void CalcRoundResultPoints(int ScoringTeam);
	void CalcResultPoints();
	void AnnounceMatchInfo();
	void AnnounceSwitchTeam();
	void STATIC_PrecacheGameAnnouncements(class AAnnouncerVoice* V, bool bRewardSounds);
	void InitializeSetObjectives();
	void EndRound(TEnumAsByte<ERER_Reason> RoundEndReason, class APawn* Instigator, const struct FString& Reason);
	void ServerLogEndRound(TEnumAsByte<ERER_Reason> RoundEndReason, class APawn* Instigator, const struct FString& Reason);
	int GetWinTeamAD(int winTeam);
	int GetWinTeam(TEnumAsByte<ERER_Reason> RoundEndReason);
	int GetRoundEndType(TEnumAsByte<ERER_Reason> RoundEndReason);
	int CountPlayersByTeam(int Team);
	void AnnounceBeginRound();
	void BeginRound(bool bNoReset);
	void OnBombDiffused(class APawn* TP, const struct FName& Tag, const struct FVector& FlagLocation);
	void SetObjectiveSetted(class APawn* TP, const struct FName& ObjectTag, const struct FVector& FlagLocation);
	void PlayObjectiveSetVociceBGM(class APawn* TP);
	void GotoDefusePhase(const struct FName& ObjectTag);
	void InitGame(const struct FString& Options, struct FString* Error);
};


// Class WMission.wRandomBonusPack
// 0x0010 (0x044C - 0x043C)
class AwRandomBonusPack : public AwSupplyPack
{
public:
	class AwSupplyRespawnPoint*                        respawnPoint;                                             // 0x043C(0x0004)
	struct FString                                     DropSound;                                                // 0x0440(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wRandomBonusPack");
		return ptr;
	}


	bool CanPickupByPRI(class AwAlienPlayerReplicationInfo* PRI);
	void FillWeaponAmmo(class APawn* P);
	void AddWeaponByInvenGroup(class APlayerController* PC, class AwWeapon* DestWeapon, class AwWeapon* AddWeapon);
	void Reset();
	void DeleteSuppliesPositions();
	void PostNetBeginPlay();
};


// Class WMission.wObjectiveTankerAlienShield
// 0x0004 (0x03DC - 0x03D8)
class AwObjectiveTankerAlienShield : public AActor
{
public:
	class AActor*                                      AttachedActor;                                            // 0x03D8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wObjectiveTankerAlienShield");
		return ptr;
	}


	void TakeDamage(int Damage, class APawn* EventInstigator, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot);
};


// Class WMission.wSkill_Shield
// 0x0008 (0x0080 - 0x0078)
class UwSkill_Shield : public UwSkill_CoolTime
{
public:
	float                                              fAttackDecreaseRate;                                      // 0x0078(0x0004)
	int                                                iSubHealthPoint;                                          // 0x007C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wSkill_Shield");
		return ptr;
	}


	void ResetSkill();
	void Client_AddProcess();
	void UnuseSkill();
	void UseSkill();
	bool CheckSkill();
	void ReadySkill();
	void Initialize(class UwSkillBase* SkillBase, class UwSkillBaseParam* Param);
};


// Class WMission.wMSCinematic_Camera
// 0x0018 (0x03F0 - 0x03D8)
class AwMSCinematic_Camera : public AActor
{
public:
	float                                              ShotLength;                                               // 0x03D8(0x0004) (Edit)
	struct FName                                       EventViewingCamera;                                       // 0x03DC(0x0004) (Edit)
	struct FName                                       NextCameraTag;                                            // 0x03E0(0x0004) (Edit)
	class AwMSCinematic_Camera*                        NextCamera;                                               // 0x03E4(0x0004)
	unsigned long                                      bInitiallyActive : 1;                                     // 0x03E8(0x0004) (Edit)
	unsigned long                                      bActive : 1;                                              // 0x03E8(0x0004)
	class AwMSCinematic_SceneManager*                  ASCSM;                                                    // 0x03EC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WMission.wMSCinematic_Camera");
		return ptr;
	}


	void Reset();
	void Trigger(class AActor* Other, class APawn* EventInstigator);
	void Timer();
	void SetView(class AwMSCinematic_SceneManager* SM);
	void ViewFixedObjective(class APlayerController* PC, class AGameObjective* Go);
	void PostBeginPlay();
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
